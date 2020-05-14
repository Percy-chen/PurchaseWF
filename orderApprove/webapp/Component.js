sap.ui.define([
	"sap/ui/core/UIComponent",
	"sap/ui/model/json/JSONModel",
	"orderApprove/model/models",
	"orderApprove/model/ContextModel",
	"sap/m/MessageToast",
	"sap/ui/model/Filter"
], function (UIComponent, JSONModel, models, ContextModel, MessageToast, Filter) {
	"use strict";

	return UIComponent.extend("orderApprove.Component", {

		metadata: {
			manifest: "json"
		},

		appModel: {
			isBusy: false
		},

		/**
		 * The component is initialized by UI5 automatically during the startup of the app and calls the init method once.
		 * @public
		 * @override
		 */
		init: function () {
			var that = this;

			// call the base component's init function
			UIComponent.prototype.init.apply(this, arguments);

			// set the device model
			this.setModel(models.createDeviceModel(), "device");

			// set application model
			this.setModel(new JSONModel(this.appModel), "appModel");

			// get task instance ID	and read the process context
			try {
				var taskId = this._getTaskId();

				var p = ContextModel.readContext(that, taskId);
				p.then(function (oContext) {
					
					// loading of context data was successfull
					
					// TODO Here you can add some initialization if necessary

					// adding that "data" model. data.ctx contains the context
					var oStartupParameters = that.getComponentData().startupParameters;
					var oTaskData = oStartupParameters.taskModel.getData();
					var AppNum = oContext.PurchaseHlog ? oContext.PurchaseHlog.APPNUM : oContext.Appnum;
					oContext.Appnum = AppNum;
					oContext.postTime = 0;
					var oDataModel = new JSONModel({
						context: oContext,
						task: {
							description: "",
							title: oTaskData.TaskTitle,
							priority: oTaskData.Priority,
							priorityText: oTaskData.PriorityText,
							status: oTaskData.Status,
							statusText: oTaskData.StatusText,
							createdOn: oTaskData.CreatedOn,
							createdBy: oTaskData.CreatedBy
						}
					});
					
					// Setting task description
					oStartupParameters.inboxAPI.getDescription("NA", taskId)
						.done(function (dataDescr) {
							oDataModel.setProperty("/task/description", dataDescr.Description);
						})
						.fail(function (errorText) {
							that._handleError.call(that, Error(errorText));
						});

					// set the model for binding
					that.setModel(oDataModel, "data");
					
					// add buttons to approve and reject
					that._addAction("Approve", "Approved", "Accept", function () {
						var postTime = that.getModel("data").getProperty("/context/postTime");
						if(postTime === 0){
							that.getModel("data").setProperty("/context/postTime", 1);
							that._callbackAction(oDataModel, "confirm", "");
						}
					});

					that._addAction("Reject", "Reject", "Reject", function (button) {
						that.createRejectComment(oDataModel.getData()).then(function (oComment) {
							if (oComment !== false) {
								var postTime = that.getModel("data").getProperty("/context/postTime");
								if(postTime === 0){
									that.getModel("data").setProperty("/context/postTime", 1);
									that._callbackAction(oDataModel, "Reject", oComment);
								}
							}
						});
					});

					// remove busy indicator
					that.setBusy(false);
//********************************************************************************************************************************
					// if(!oContext.ApprovalStatu){
						// 获取行项目
						that._getPurchaseorderItems(that, oContext.PurchaseOrderID, oContext.Language).then(function (oData) {
							// oContext.PurchaseHead = oData.results[0];
							// oContext.PurchaseList = oData.results;
							var rContext = that._setPurchaseLog(oData, oTaskData);
							that.getModel("data").setProperty("/context/PurchaseHead", rContext.PurchaseHead);
							that.getModel("data").setProperty("/context/PurchaseList", rContext.PurchaseItem);
							that.getModel("data").setProperty("/context/PurchaseHlog", rContext.PurchaseHlog);
							that.getModel("data").setProperty("/context/PurchaseLlog", rContext.PurchaseLlog);
							// that._savePurchaseOrders(rContext);
						}, function () {
							// MessageToast.show("获取行项目失败");
						});
					// }
//********************************************************************************************************************************
				}, function (err) {
					that._handleError.call(that, err);
				});
			} catch (err) {
				that._handleError.call(that, err);
			}
		},

		_callbackAction: function (oDataModel, action, comment) {
			var context = oDataModel.getData().context;
			var that = this;
			var complete;
			that.setBusy(true);
			if (action === "confirm") {
				context.approved = true;
				if(this.whetherEnd(context) === "0000"){
					complete = that._changeApprovalStatu(context);
				}else{
					complete = new Promise(function (resolve, reject) {
						resolve(1);
					});	
				}
			} else {
				context.approved = false;
				complete = that._changeApprovalStatu(context);
			}
			complete.then(function(){
				if(!context.bSave){
					that._savePurchaseOrders(context).then(function(){
						context.bSave = true;
						that.saveWorkflowLog(action, comment).then(function(){
							var taskId = that.oComponentData.inboxHandle.attachmentHandle.detailModel.getData().InstanceID;
							var p = ContextModel.triggerComplete(taskId, action, oDataModel.getData().context);
							p.then(function () {
								that.setBusy(false);
								that._refreshTask.call(that);
							}, function (err) {
								that.setBusy(false);
								that.getModel("data").setProperty("/context/postTime", 0);
								that._handleError.call(that, err);
							});
						}, function () {
							that.setBusy(false);
						});
					});
				}else{
					that.saveWorkflowLog(action, comment).then(function(){
						var taskId = that.oComponentData.inboxHandle.attachmentHandle.detailModel.getData().InstanceID;
						var p = ContextModel.triggerComplete(taskId, action, oDataModel.getData().context);
						p.then(function () {
							that.setBusy(false);
							that._refreshTask.call(that);
						}, function (err) {
							that.getModel("data").setProperty("/context/postTime", 0);
							that.setBusy(false);
							that._handleError.call(that, err);
						});
					}, function () {
						that.setBusy(false);
					});
				}
			}, function (oError) {
				that.getModel("data").setProperty("/context/postTime", 0);
				that.setBusy(false);
				sap.m.MessageBox.error("回写审批状态失败：" + JSON.parse(oError.responseText).error.message.value);
			});
		},
		
		saveWorkflowLog : function(action, oComment){
			var promise = new Promise(function (resolve, reject) {
				var context = this.getModel("data").getData().context;
				var currentLog = {
					"STARTCOMPANY": context.CompanyCode,
					"FLOWID": context.workflowDefinitionId,
					"INSTANCEID": context.workflowInstanceId,
					"NODEID": context.ApprovalStatu ? context.ApprovalStatu : "0009",
					"SUBNODEID": "0010",
					"TASKINSTANCEID": this._getTaskId(),
					"DOCUMENT": context.Appnum,
					"ACCOUNT": context.Approver ? context.Approver : context.Creater,
					"JOB": "",
					"APPROVALDATE": new Date(),
					"CHANGEDATE": new Date(),
					"SUGGESTION": action,
					"RESULT": oComment
				};
				var mParameter = {
					success: function (oData) {
						resolve(oData);
					},
					error: function (oError) {
						resolve(1);
					}.bind(this)
				};
				this.getModel("WORKFLOWLOG").create("/WORKFLOWLOG", currentLog, mParameter);
			}.bind(this));
			return promise;
		},
		
		createRejectComment: function (oData) {
			var promise = new Promise(function (resolve, reject) {
				var dialog = new sap.m.Dialog({
					title: "审批拒绝",
					type: "Message",
					contentHeight: "18%",
					contentWidth: "30%",
					content: [
						new sap.m.Label({
							text: "请填写审批意见",
							labelFor: "rejectDialogTextarea"
						}),
						new sap.m.TextArea("rejectDialogTextarea", {
							width: '100%',
							placeholder: "添加意见"
						})
					],
					beginButton: new sap.m.Button({
						text: "确定",
						press: function () {
							dialog.close();
							resolve(sap.ui.getCore().byId("rejectDialogTextarea").getValue());
						}
					}),
					endButton: new sap.m.Button({
						text: '取消',
						press: function () {
							dialog.close();
							// return false;
							resolve(false);
						}
					}),
					afterClose: function () {
						dialog.destroy();
					}
				});
				dialog.open();
			});
			return promise;

		},
		
		/**
		 * 
		 */
		_handleError: function (err) {
			// to ensure busy indicator is off
			this.setBusy(false);

			// show a message box with the error
			jQuery.sap.require("sap.m.MessageBox");
			sap.m.MessageBox.error(err, {
				title: this.getModel("i18n").getResourceBundle().getText("GENERIC_ERROR_TITLE")
			});
		},

		/**
		 *
		 */
		_checkConfirmData: function (oData) {
			// TODO check data and return either true or false
			return true;
		},

		/**
		 *
		 */
		_checkRejectData: function (oData, comment) {
			if (comment === false) {
				return false;
			}
			return true;
		},

		/**
		 *
		 */
		setBusy: function (isBusy) {
			var oModel = this.getModel("appModel");
			oModel.setProperty("/isBusy", isBusy);
			oModel.refresh();
		},

		/**
		 *
		 */
		_getTaskId: function () {
			var oCompontentData = this.getComponentData();
			if (oCompontentData.startupParameters) {
				var startupParameters = oCompontentData.startupParameters;
				var taskData = startupParameters.taskModel.getData();
				var taskId = taskData.InstanceID;

				return taskId;
			}

			throw Error("no startupParameter available");
		},

		/**
		 *
		 */
		_addAction: function (sName, sButtonText, sButtonType, fnPressed) {
			var oCompontentData = this.getComponentData();
			if (oCompontentData.startupParameters) {
				var startupParameters = this.getComponentData().startupParameters;
				startupParameters.inboxAPI.addAction({
					action: sName,
					label: this.getModel("i18n").getResourceBundle().getText(sButtonText),
					type: sButtonType
				}, fnPressed, this);
			}
		},

		/**
		 *
		 */
		_refreshTask: function () {
			this.getComponentData().startupParameters.inboxAPI.updateTask("NA", this._getTaskId());
		},
		
		_getPurchaseOrders : function(purchaseOrderID) {
			var that = this;
			that._getPurchaseOrdersHead(that, purchaseOrderID).then(function (oData) {
				that.getModel("data").setProperty("/context/PurchaseHead", oData.results[0]);
				that._getPurchaseOrdersList(that, oData.results[0].PurchaseOrder);
			}, function (oError) {
				this.setBusy(false);
			}.bind(this));
		},
		
		_savePurchaseOrders : function(oDataModel) {
			var promise = new Promise(function (resolve, reject) {
				this.getHeaderNumber().then(function (appNum) {
					oDataModel.PurchaseHlog.APPNUM = appNum;
					oDataModel.Appnum = appNum;
					// oDataModel.AppNum
					this._saveWorkflowHead(oDataModel).then(function () {
						this._savePurchaseOrdersHead(this, oDataModel).then(function () {
							this._savePurchaseOrdersList(this, oDataModel).then(function () {
								resolve(1);
							});
						}.bind(this)); 
					}.bind(this));
				}.bind(this), 
				function () {
					sap.m.MessageBox.error("获取流水号失败");
					this.setBusy(false);
					reject(1);
				}.bind(this));
			}.bind(this));
			return promise;
		},
		
		getAppnum : function(oDataModel){
			var promise = new Promise(function (resolve, reject) {
				var aFilter = [
					new Filter("PURORDER_NO", "EQ", oDataModel.PurchaseHead.PurchaseOrder)
				];
				var sUrl = "/PURHeader";
				var mParameters = {
					filters: aFilter,
					success: function (oData, response) {
						resolve(oData.results[0].APPNUM);      
					},
					error: function (oError) {
						this.setBusy(false);
						reject(oError);
					}.bind(this)
				};
				this.getModel("PURCHASE").read(sUrl, mParameters);
			}.bind(this));
			return promise;
		},
		
		_saveWorkflowHead : function(oDataModel){
			var promise = new Promise(function (resolve, reject) {
				var logheader = {
					"STARTCOMPANY": oDataModel.CompanyCode ? oDataModel.CompanyCode : "",
					"FLOWID": "purchaseorder",
					"INSTANCEID": oDataModel.workflowInstanceId ? oDataModel.workflowInstanceId : "",
					"DOCUMENT": oDataModel.Appnum ? oDataModel.Appnum : "",
					"REQUESTER": oDataModel.Creater ? oDataModel.Creater : "",
					"STATUS": "" // 部门领导审批
				};
				var mParameter = {
					success: function (oData) {
						resolve(oData);
					},
					error: function (oError) {
						resolve(1);
					}.bind(this)
				};
				this.getModel("WORKFLOWLOG").create("/WORKFLOWHEAD", logheader, mParameter);
			}.bind(this));
			return promise;
		},
		
		getHeaderNumber: function () {
			var appType = "PURCHASEORDER";
			var promise = new Promise(function (resolve, reject) {
				$.ajax({
					url: "/html5apps/purchasewf/destinations/Print/ws/data/order-no" + "?code=" + appType,
					method: "GET",
					async: false,
					success: function (data) {
						resolve(data);
					},
					error: function (xhr, textStatus, errorText) {
						reject(errorText);
					}
				});
			});
			return promise;
		},
		
		_getPurchaseorderItems : function(oController, purchaseOrderID, language){
			var promise = new Promise(function (resolve, reject) {
				var sLanguage = sap.ui.getCore().getConfiguration().getLanguage();
				switch (sLanguage) {
				case "zh-Hant":
				case "zh-TW":
					sLanguage = "ZF";
					break;
				case "zh-Hans":
				case "zh-CN":
					sLanguage = "ZH";
					break;
				case "EN":
				case "en":
					sLanguage = "EN";
					break;
				default:
					break;
				}
				var aFilter = [
					new Filter("YY1_businessId_PDH", "EQ", purchaseOrderID)
				];
				if(language !== ""){
					aFilter.push(new Filter("Language", "EQ", sLanguage));
				}
				
				var mParameters = {
					filters: aFilter,
					success: function (oData, response) {
						resolve(oData);
					}.bind(this),
					error: function (oError) {
						this.setBusy(false);
						reject(oError);
					}.bind(this)
				};
				oController.getModel("YY1_PURCHASEORD_ITEMS").read("/YY1_PURCHASEORD_ITEMS", mParameters);
			});
			return promise;
		},
		
		_getPurchaseOrdersHead : function(oController, purchaseOrderID){
			var promise = new Promise(function (resolve, reject) {
				var aFilter = [
					new Filter("YY1_businessId_PDH", "EQ", purchaseOrderID)
				];
				var mParameters = {
					filters: aFilter,
					success: function (oData, response) {
						resolve(oData);
					}.bind(this),
					error: function (oError) {
						this.setBusy(false);
						reject(oError);
					}.bind(this)
				};
				oController.getModel("API_PURCHASEORDER_PROCESS").read("/A_PurchaseOrder", mParameters);
			});
			return promise;
		},
		
		_getPurchaseOrdersList : function(oController, purchaseOrder){
			var aFilter = [
				new Filter("PurchaseOrder", "EQ", purchaseOrder)
			];
			var mParameters = {
				filters: aFilter,
				success: function (oData, response) {
					if (response.statusCode === "200") {
						oController.getModel("data").setProperty("/context/PurchaseList", oData.results);
						oController._setPurchaseLog();
					}
				}.bind(this),
				error: function (oError) {
					this.setBusy(false);
				}.bind(this)
			};
			oController.getModel("API_PURCHASEORDER_PROCESS").read("/A_PurchaseOrderItem", mParameters);
		},
		
		_savePurchaseOrdersList : function(oController, oDataModel){
			var promise = new Promise(function (resolve, reject) {
				var items = oDataModel.PurchaseLlog;
				var mParameters = {
					groupId: "PurchaseItems",
					success: function (oData) {
						resolve(oData);
					}.bind(this),
					error: function (oError) {
						resolve(1);
					}.bind(this)
				};
	
				for (var i = 0; i < items.length; i++) {
					items[i].APPNUM = oDataModel.Appnum;
					this.getModel("PURCHASE").create("/PURItem", items[i], mParameters);
				}
			}.bind(this ));
			return promise;
		},
		
		_setPurchaseLog : function(oData, task){
			var purchaseHead = oData.results[0];
			var purchaseItem = oData.results;              
			var purchasellog = [];
			var item;
			var sum = 0;
			for(var i = 0; i < purchaseItem.length; i++){
				purchaseItem[i].ScheduleLineDeliveryDate = this.date(purchaseItem[i].ScheduleLineDeliveryDate);
				purchaseItem[i].NetPriceAmount = Number(purchaseItem[i].NetPriceAmount) / Number(purchaseItem[i].NetPriceQuantity);
				purchaseItem[i].TaxPrice = (purchaseItem[i].NetPriceAmount * (1 + this.toPoint(purchaseItem[i].YY1_TaxJurisdiction_PDI))).toFixed(2); // 含税价				// purchaseItem[i].TaxPrice = (purchaseItem[i].TaxPrice.toFixed(2))
				purchaseItem[i].Amount = Number(purchaseItem[i].TaxPrice) * Number(purchaseItem[i].OrderQuantity); // 金额
				sum = sum + purchaseItem[i].Amount;
				purchaseItem[i].Amount = purchaseItem[i].Amount.toFixed(2);
				purchaseItem[i].NetPriceAmount = purchaseItem[i].NetPriceAmount.toFixed(2);
				item = {
					PURORDER_NO : purchaseHead.PurchaseOrder,         
					PURORDER_ITEM : purchaseItem[i].PurchaseOrderItem,              
					SUB_ASSTYPE : purchaseItem[i].AccountAssignmentCategory,
					PROJECT_TYPE : purchaseItem[i].PurchaseOrderItemCategory,
					MATERIAL : purchaseItem[i].Material,
					MATERIAL_DES : purchaseItem[i].PurchaseOrderItemText,
					QUANTITY : purchaseItem[i].OrderQuantity,
					UNIT : purchaseItem[i].PurchaseOrderQuantityUnit,
					NET_AMOUNT : purchaseItem[i].NetPriceAmount,
					CURRENCY : purchaseItem[i].DocumentCurrency,
					TAX_PRICE : purchaseItem[i].TaxPrice,
					AMOUNT : purchaseItem[i].Amount,
					TAX_CODE : purchaseItem[i].TaxCode,
					PLANT : purchaseItem[i].Plant,
					DELIVERYDATE : purchaseItem[i].ScheduleLineDeliveryDate,
					NOTE : purchaseItem[i].RequisitionerName,
					CHANGE_INS : purchaseItem[i].IncotermsLocation1
				};
				purchasellog.push(item);
			}
			purchaseHead.CreationDate = this.date(purchaseHead.CreationDate);
			purchaseHead.TotalAmount = sum;
			var purchasehlog = {
				SEND_TIME : this.formatterSendTime(task.CreatedOn),
				PURORDER_NO : purchaseHead.PurchaseOrder,
				PURORDER_TYPE : purchaseHead.YY1_PurType_PDH,
				SUPPLIER : purchaseHead.Supplier,
				PAY_TERMS : purchaseHead.PaymentTerms,
				CREATER : purchaseHead.PersonFullName,
				CREATE_DATE : purchaseHead.CreationDate,
				OAPP_STATE : purchaseHead.YY1_POapprovment_PDH,
				TOTAL_AMOUNT : purchaseHead.TotalAmount,
				COMPANY : purchaseHead.CompanyCode
			};
			return {
				PurchaseHead : purchaseHead,
				PurchaseItem : purchaseItem,
				PurchaseHlog : purchasehlog,
				PurchaseLlog : purchasellog
			};
		},
		
		_changeApprovalStatu : function(context){
			var promise = new Promise(function (resolve, reject) {
				var item;
				if(context.approved){
					item = {
						PurchaseOrder : context.PurchaseHead.PurchaseOrder,
						YY1_POapprovment_PDH : "C"
					};
				}else{
					item = {
						PurchaseOrder : context.PurchaseHead.PurchaseOrder,
						YY1_POapprovment_PDH : "B"
					};
				}
				var mParameters = {
					success : function(oData, response) {
						resolve(oData);
					}.bind(this),
					error : function(oError) {
						this.getModel("data").setProperty("/context/postTime", 0);
						reject(oError);
					}.bind(this)
				};
				this.getModel("API_PURCHASEORDER_PROCESS").update("/A_PurchaseOrder('" + item.PurchaseOrder + "')", item, mParameters);
			}.bind(this));
			return promise;
		},
		
		whetherEnd : function(context){
			var companyCode = context.CompanyCode;
			var approvalStatu = context.ApprovalStatu;
			var nextApprovalNode = "0000";
			var currency = context.PurchaseHead.DocumentCurrency;
			var totalAmount = context.PurchaseHead.TotalAmount;
			var type = context.PurchaseHead.YY1_PurType_PDH;
			if(!approvalStatu){
				nextApprovalNode = "0010";
			}
			if(approvalStatu === "0010"){
				if(type !== "Z81"){
					if(companyCode === "1310"){
						if((currency === "CNY" && totalAmount >= 5000) || (currency === "USD" && totalAmount >= 2000)){
							nextApprovalNode = "0060";
						}
					}
				}else{
					if(companyCode === "1310"){
						if((currency === "USD" && totalAmount >= 2000) || (currency === "CNY" && totalAmount >= 5000)){
							nextApprovalNode = "0060";
						}else{
							nextApprovalNode = "0020";
						}
					}else if(companyCode === "6310"){
						nextApprovalNode = "0020";
					}else if(companyCode === "1710"){
						nextApprovalNode = "0020";
					}
				}
				
			}
			if(approvalStatu === "0020"){
				if(type === "Z81"){
					if(companyCode === "1310" || companyCode === "6310" || companyCode === "1710"){
						nextApprovalNode = "0030";
					}
				}
			}
			if(approvalStatu === "0030"){
				if(type === "Z81"){
					if(companyCode === "1310" || companyCode === "1710"){
						nextApprovalNode = "0050";
					}
				}
			}
			if(approvalStatu === "0050"){
				if(type === "Z81"){
					if(companyCode === "1310" || companyCode === "1710"){
						if(currency === "USD" && totalAmount >= 35000){
							nextApprovalNode = "0060";
						}
					}
				}
			}
			if(approvalStatu === "0060"){
				if(type === "Z81"){
					if(companyCode === "1310"){
						nextApprovalNode = "0020";
					}
				}
			}
			return nextApprovalNode;
		},
		
		_savePurchaseOrdersHead : function(oController, oDataModel){
			var promise = new Promise(function (resolve, reject) {
				var purchaseHeader = oDataModel.PurchaseHlog;
				var mParameter = {
					success: function (oData) {
						resolve(oData);
					},
					error: function (oError) {
						resolve(1);
					}.bind(this)
				};
				oController.getModel("PURCHASE").create("/PURHeader", purchaseHeader, mParameter);
			});
			return promise;
		},
		
		getAppNum : function() {
			var appType = "PURCHASEORDER";
			var promise = new Promise(function (resolve, reject) {
				$.ajax({
					url: "/destinations/Print/ws/data/order-no" + "?code=" + appType,
					method: "GET",
					async: false,
					success: function (data) {
						resolve(data);
					},
					error: function (xhr, textStatus, errorText) {
						reject(Error(errorText));
					}
				});
			});
			return promise;
		},
		
		
		formatterSendTime : function(v){
			var date = new Date(v);
	        var resDate = date.getFullYear().toString() + this.p((date.getMonth() + 1)).toString() + this.p(date.getDate()).toString();
	        var resTime = this.p(date.getHours()).toString() + this.p(date.getMinutes()).toString() + this.p(date.getSeconds()).toString();
	        return resDate + resTime;
		},
		
		p : function(v){
			return v < 10 ? "0" + v: v;
		},
		
		toPoint : function(percent){
   		 	var str = percent.replace("%","");
	        str = str / 100;
   		 	return str;
		},
		
		date : function(value) {
			//获得当前运行环境时间
            var d = value;
            var currentDate = value;
            var tmpHours = currentDate.getHours();
            //算得时区
            var timeZone = -d.getTimezoneOffset() / 60;
            if (timeZone < 0) {
                timeZone = Math.abs(timeZone) + 8; currentDate.setHours(tmpHours + timeZone);
            } else {
                timeZone -= 8; 
                currentDate.setHours(tmpHours - timeZone);
            }
			
			if (currentDate) {
				var oDateFormat = sap.ui.core.format.DateFormat.getDateTimeInstance({
					pattern : "yyyyMMdd"
				});
				return oDateFormat.format(new Date(currentDate));
			} else {
				return currentDate;
			}
		}
	});
});