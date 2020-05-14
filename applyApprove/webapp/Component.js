sap.ui.define([
	"sap/ui/core/UIComponent",
	"sap/ui/model/json/JSONModel",
	"applyApprove/model/models",
	"applyApprove/model/ContextModel",
	"sap/m/MessageToast",
	"sap/ui/model/Filter"
], function (UIComponent, JSONModel, models, ContextModel, MessageToast, Filter) {
	"use strict";

	return UIComponent.extend("applyApprove.Component", {

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
					that._addAction("Approve", "同意", "Accept", function () {
						var postTime = that.getModel("data").getProperty("/context/postTime");
						if(postTime === 0){
							that.getModel("data").setProperty("/context/postTime", 1);
							that._callbackAction(oDataModel, "confirm", "");
						}
					});

					that._addAction("Reject", "拒绝", "Reject", function () {
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
					
					that._getPurchasereqItems(that, oContext.PurchaseHead.PurchaseRequisition).then(function (oData) {
						var rContext = that._setPurchaseLog(oData);
						that.getModel("data").setProperty("/context/PurchaseHead", rContext.PurchaseHead);
						that.getModel("data").setProperty("/context/PurchaseList", rContext.PurchaseList);
						that.getModel("data").setProperty("/context/PurchaseHlog", rContext.PurchaseHlog);
						that.getModel("data").setProperty("/context/PurchaseLlog", rContext.PurchaseLlog);
						that.getModel("data").setProperty("/context/PurchaseDeleteList", rContext.PurchaseDeleteList);
					}, function () {
						that.setBusy(false);
					});
						
					// remove busy indicator
					that.setBusy(false);
				}, function (err) {
					that._handleError.call(that, err);
				});
			} catch (err) {
				that._handleError.call(that, err);
			}
		},
		
		_getPurchasereqItems : function(oController, PurchaseRequisition){
			var promise = new Promise(function (resolve, reject) {
				var aFilter = [
					new Filter("PurchaseRequisition", "EQ", PurchaseRequisition)
				];
				var mParameters = {
					filters: aFilter,
					success: function (oData, response) {
						resolve(oData);
					}.bind(this),
					error: function (oError) {
						reject(oError);
					}.bind(this)
				};
				oController.getModel("YY1_PURCHASEREQ_ITEMS").read("/YY1_PURCHASEREQ_ITEMS", mParameters);
			});
			return promise;
		},

		_callbackAction: function (oDataModel, action, comment) {
			var context = oDataModel.getData().context;
			var that = this;
			var complete;
			that.setBusy(true);
			if (action === "confirm") {
				if(this.whetherEnd(context) === "0000"){
					that._changeStatu(action, context.PurchaseList).then(function(){
						context.approved = true;
						// that.setBusy(true);
						if(!context.bSave){
							that._savePurchaseRequis(context).then(function(){
								context.bSave = true;
								complete = that.saveWorkflowLog(action, "");
								complete.then(function(){
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
							complete = that.saveWorkflowLog(action, comment);
							complete.then(function(){
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
						}
					}, function (oError) {
						that.setBusy(false);
						sap.m.MessageBox.error("回写审批状态失败：" + JSON.parse(oError.responseText).error.message.value);
					});
				}else{
					context.approved = true;
					// that.setBusy(true);
					if(!context.bSave){
						that._savePurchaseRequis(context).then(function(){
							context.bSave = true;
							complete = that.saveWorkflowLog(action, comment);
							complete.then(function(){
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
						complete = that.saveWorkflowLog(action, comment);
						complete.then(function(){
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
					}
				}
			} else {
				context.approved = false;
				that._changeStatu(action, context.PurchaseList).then(function(){
					// that.setBusy(true);
					if(!context.bSave){
						that._savePurchaseRequis(context).then(function(){
							context.bSave = true;
							complete = that.saveWorkflowLog(action, comment);
							complete.then(function(){
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
						complete = that.saveWorkflowLog(action, comment);
						complete.then(function(){
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
					}
				}, function (oError) {
					that.setBusy(false);
					sap.m.MessageBox.error("回写审批状态失败：" + JSON.parse(oError.responseText).error.message.value);
				});
			}
		},
		
		saveWorkflowLog : function(action, oComment){
			var promise = new Promise(function (resolve, reject) {
				var context = this.getModel("data").getData().context;
				var currentLog = {
					"STARTCOMPANY": context.CompanyCode ? context.CompanyCode : context.PurchaseHead.CompanyCode,
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
		
		whetherEnd : function(context){
			var companyCode = context.PurchaseHead.CompanyCode;
			var approvalStatu = context.ApprovalStatu;
			var nextApprovalNode = "0000";
			var totalAmountUSD = context.PurchaseHead.TotalAmountUSD;
			var totalAmountTWD = context.PurchaseHead.TotalAmountTWD;
			// var currency = $.context.PurchaseHead.PurReqnItemCurrency;
			var type = context.PurchaseHead.PurchaseRequisitionType;
			if(!approvalStatu){
				if(type === "NB"){
					if(companyCode === "6310" || companyCode === "1710"){
						nextApprovalNode = "0010";	
					}
				}
				if(type === "NBS"){
					nextApprovalNode = "0010";
				}
			}
			if(approvalStatu === "0010"){
				if(type === "NB"){
					if(companyCode === "6310"){
						if(totalAmountTWD >= 300000){
							nextApprovalNode = "0030";	
						}
					}
					
					if(companyCode === "1710"){
						if(totalAmountUSD >= 3500 || totalAmountTWD >= 100000){
							nextApprovalNode = "0020";	
						}
					}
				}
				if(type === "NBS"){
					if(companyCode === "1310"){
						nextApprovalNode = "0040";	
					}
					if(companyCode === "6310"){
						if(totalAmountTWD >= 10000){
							nextApprovalNode = "0030";	
						}
					}
					if(companyCode === "1710"){
						if(totalAmountUSD >= 170 || totalAmountTWD >= 5000){
							nextApprovalNode = "0020";	
						}
					}
				}
			}
			if(approvalStatu === "0020"){
				if(type === "NB"){
					if(companyCode === "1710"){
						if(totalAmountUSD >= 10000 || totalAmountTWD >= 300000){
							nextApprovalNode = "0030";	
						}
					}
				}
				if(type === "NBS"){
					if(companyCode === "1710"){
						if(totalAmountUSD >= 350 || totalAmountTWD >= 10000){
							nextApprovalNode = "0030";	
						}
					}
				}
			}
			if(approvalStatu === "0030"){
				if(type === "NB"){
					if(companyCode === "6310"){
						if(totalAmountTWD >= 1000000){
							nextApprovalNode = "0040";	
						}
					}
					if(companyCode === "1710"){
						if(totalAmountTWD >= 1000000 || totalAmountUSD >= 35000){
							nextApprovalNode = "0040";	
						}
					}
				}
			}
			return nextApprovalNode;
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
							placeholder: "添加意见 (必输)"
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
			sap.m.MessageBox.error(err.toLocaleString(), {
				title: this.getModel("i18n").getResourceBundle().getText("GENERIC_ERROR_TITLE")
			});
		},

		/**
		 *
		 */
		_checkConfirmData: function () {
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
		
		// _getPurchaseItems : function(){
		// 	var that = this;
		// 	var promise = new Promise(function (resolve, reject){
		// 		// 获取行项目
		// 		that._getPurchaseRequisition(that, oContext.PurchaseRequistionID).then(function (oData) {
		// 			that._getPurchasereqItem(that, oData);
		// 		}, function (oError) {
		// 			reject(oError);
		// 		});
		// 	});
		// 	return promise;
		// },
				
		_getPurchaseRequisition : function(oController, PurchaseRequistionID){
			var promise = new Promise(function (resolve, reject) {
				var aFilter = [
					new Filter("YY1_PRID_PRI", "EQ", PurchaseRequistionID)
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
				oController.getModel("YY1_PURCHASEREQ_ITEMS").read("/YY1_PURCHASEREQ_ITEMS", mParameters);
			});
			return promise;
		},
		
		_getPurchasereqItem : function(oController, odata){
			var aFilter = [
				new Filter("PurchaseRequisition", "EQ", odata.results[0].PurchaseRequisition)
			];
			var mParameters = {
				filters: aFilter,
				success: function (oData, response) {
					// resolve(oData);
				}.bind(this),
				error: function (oError) {
					this.setBusy(false);
				}.bind(this)
			};
			oController.getModel("YY1_PURCHASEREQ_ITEMS").read("/YY1_PURCHASEREQ_ITEMS", mParameters);
		},
		
		_setPurchaseLog : function(oData){
			var context = this.getModel("data").getData().context;
			var purchaseHead = context.PurchaseHead;
			var purchaseItem = oData.results;              
			var purchaseList = [];
			var purchaseDeleteList = [];
			var purchasellog = [];
			var item;
			var sumUSD = 0, sumTWD = 0;
			// var sum = 0;
			for(var i = 0; i < purchaseItem.length; i++){
				if(purchaseItem[i].IsDeleted !== "X"){
					purchaseItem[i].DeliveryDate = this.timeStapm(purchaseItem[i].DeliveryDate);
					purchaseItem[i].PurReqCreationDate = this.timeStapm(purchaseItem[i].PurReqCreationDate);
					
					purchaseItem[i].PurchaseRequisitionPrice = Number(purchaseItem[i].PurchaseRequisitionPrice) 
															 / Number(purchaseItem[i].PurReqnPriceQuantity);
					purchaseItem[i].Amount = Number(purchaseItem[i].PurchaseRequisitionPrice) 
										   * Number(purchaseItem[i].RequestedQuantity); // 金额
					
					if(purchaseItem[i].PurReqnItemCurrency === "USD"){
						sumUSD = sumUSD + purchaseItem[i].Amount;
					}else if(purchaseItem[i].PurReqnItemCurrency === "TWD"){
						sumTWD = sumTWD + purchaseItem[i].Amount;
					}
					purchaseItem[i].Amount = purchaseItem[i].Amount.toFixed(2);
					item = {
						PURREQ_NO : purchaseHead.PurchaseRequisition,         
						PURREQ_ITEM : purchaseItem[i].PurchaseRequisitionItem,    
						// OAPP_STATE : purchaseItem[i].PurchaseRequisitionItem,    
						SUB_ASSTYPE : purchaseItem[i].AccountAssignmentCategory,
						PROJECT_TYPE : purchaseItem[i].PurchasingDocumentItemCateg,
						MATERIAL : purchaseItem[i].Material,
						MATERIAL_DES : purchaseItem[i].PurchaseRequisitionItemText,
						QUANTITY : purchaseItem[i].RequestedQuantity,
						UNIT : purchaseItem[i].BaseUnit,
						ACCESSPRICE : purchaseItem[i].PurchaseRequisitionPrice,
						AMOUNT : purchaseItem[i].Amount,
						PLANT : purchaseItem[i].Plant,
						DELIVERYDATE : purchaseItem[i].DeliveryDate,
						CHANGE_INS : purchaseItem[i].RequirementTracking
					};
					purchasellog.push(item);
					purchaseList.push(purchaseItem[i]);
				}else {
					purchaseDeleteList.push(purchaseItem[i]);
				}
			}
			
			purchaseHead.TotalAmountUSD = sumUSD;
			purchaseHead.TotalAmountTWD = sumTWD;
			
			// purchaseHead.TotalAmount = sum;
			var purchasehlog = {
				PURREQ_NO : purchaseHead.PurchaseRequisition,
				PURREQ_TYPE : purchaseHead.PurchaseRequisitionType,
				CREATER : purchaseHead.PersonFullName,
				CREATE_DATE : purchaseHead.PurReqCreationDate,
				OAPP_STATE : "",
				COMPANY : purchaseHead.CompanyCode
			};
			return {
				PurchaseHead : purchaseHead,
				PurchaseList : purchaseList,
				PurchaseHlog : purchasehlog,
				PurchaseLlog : purchasellog,
				PurchaseDeleteList : purchaseDeleteList
			};
		},
		
		_changeStatu : function(action, items){
			var that = this;
			var promise = new Promise(function (resolve, reject) {
				that._changeApprovalStatu(action, items).then(function () {
					that._changeDeleteStatu(action).then(function () {
						that._setDelete().then(function () {
							resolve(1);
						}, function (oError) {
							reject(oError);
						});
					}, function (oError) {
						reject(oError);
					});
				}, function (oError) {
					reject(oError);
				});
			});
			return promise;
		},
		
		_changeApprovalStatu : function(action, items){
			var promise = new Promise(function (resolve, reject) {
				this._i = 0;
				this._itemsLength = items.length;
				var mParameters = {
					groupId: "PurchaseReqItems",
					success: function (oData) {
						this._i = this._i + 1;
						if(this._i === this._itemsLength){
							resolve(oData);
						}
					}.bind(this),
					error: function (oError) {
						this.getModel("data").setProperty("/context/postTime", 0);
						reject(oError);
					}.bind(this)
				};
				
				var item;
				for (var i = 0; i < items.length; i++) {
					if(items[i].IsDeleted !== "X"){
						if(action === "confirm"){
							item = {
								PurchaseRequisition : items[i].PurchaseRequisition,
								PurchaseRequisitionItem : items[i].PurchaseRequisitionItem,
								YY1_PRID_PRI : "",
								YY1_PRapprovment_PRI : "C"
							};
						}else{
							item = {
								PurchaseRequisition : items[i].PurchaseRequisition,
								PurchaseRequisitionItem : items[i].PurchaseRequisitionItem,
								YY1_PRID_PRI : "",
								YY1_PRapprovment_PRI : "B"
							};
						}
						this.getModel("API_PURCHASEREQ_PROCESS").update("/A_PurchaseRequisitionItem(PurchaseRequisition='" + item.PurchaseRequisition + "',PurchaseRequisitionItem='" + item.PurchaseRequisitionItem + "')", item, mParameters);
					}		
				}
			}.bind(this));
			return promise;
		},
		
		_changeDeleteStatu : function(action){
			var promise = new Promise(function (resolve, reject) {
				var context = this.getModel("data").getData().context;
				var items = context.PurchaseDeleteList ? context.PurchaseDeleteList : [];
				if(items.length === 0 ){
					resolve(1);
				}else{
					this._i = 0;
					this._itemsLength = items.length;
					var mParameters = {
						groupId: "PurchaseReqDeletes",
						success: function (oData) {
							this._i = this._i + 1;
							if(this._i === this._itemsLength){
								resolve(oData);
							}
						}.bind(this),
						error: function (oError) {
							this.getModel("data").setProperty("/context/postTime", 0);
							reject(oError);
						}.bind(this)
					};
					
					var item;
					for (var i = 0; i < items.length; i++) {
						if(items[i].IsDeleted === "X"){
							if(action === "confirm"){
								item = {
									PurchaseRequisition : items[i].PurchaseRequisition,
									PurchaseRequisitionItem : items[i].PurchaseRequisitionItem,
									IsDeleted : "",
									YY1_PRID_PRI : "",
									YY1_PRapprovment_PRI : "C"
								};
							}else{
								item = {
									PurchaseRequisition : items[i].PurchaseRequisition,
									PurchaseRequisitionItem : items[i].PurchaseRequisitionItem,
									IsDeleted : "",
									YY1_PRID_PRI : "",
									YY1_PRapprovment_PRI : "B"
								};
							}
							this.getModel("API_PURCHASEREQ_PROCESS").update("/A_PurchaseRequisitionItem(PurchaseRequisition='" + item.PurchaseRequisition + "',PurchaseRequisitionItem='" + item.PurchaseRequisitionItem + "')", item, mParameters);
						}		
					}
				}
			}.bind(this));
			return promise;
		},
		
		_setDelete : function(){
			var promise = new Promise(function (resolve, reject) {
				var context = this.getModel("data").getData().context;
				var items = context.PurchaseDeleteList ? context.PurchaseDeleteList : [];
				if(items.length === 0) {
					resolve(1);
				}else{
					this._i = 0;
					this._itemsLength = items.length;
					var mParameters = {
						groupId: "PurchaseDeletes",
						success: function (oData) {
							this._i = this._i + 1;
							if(this._i === this._itemsLength){
								resolve(oData);
							}
						}.bind(this),
						error: function (oError) {
							this.getModel("data").setProperty("/context/postTime", 0);
							reject(oError);
						}.bind(this)
					};
					
					var item;
					for (var i = 0; i < items.length; i++) {
						if(items[i].IsDeleted === "X"){
							item = {
								PurchaseRequisition : items[i].PurchaseRequisition,
								PurchaseRequisitionItem : items[i].PurchaseRequisitionItem,
								IsDeleted : "X"
							};
							this.getModel("API_PURCHASEREQ_PROCESS").update("/A_PurchaseRequisitionItem(PurchaseRequisition='" + item.PurchaseRequisition + "',PurchaseRequisitionItem='" + item.PurchaseRequisitionItem + "')", item, mParameters);
						}		
					}
				}
			}.bind(this));
			return promise;
		},
		
		timeStapm : function(v){
			return "/Date(" + v.valueOf() + ")/";
		},
		
		_savePurchaseRequis : function(oDataModel) {
			var promise = new Promise(function (resolve, reject) {
				this.getHeaderNumber().then(function(appNum){
					oDataModel.PurchaseHlog.APPNUM = appNum;
					oDataModel.Appnum = appNum;
					this._saveWorkflowHead(oDataModel).then(function () {
						this._savePurchaseRequisHead(oDataModel).then(function () {
							this._savePurchaseRequisList(this, oDataModel).then(function () {
								resolve(1);
							});
						}.bind(this));
					}.bind(this));
				}.bind(this), function () {
					sap.m.MessageBox.error("获取流水号失败");
					this.setBusy(false);
					reject(1);
				}.bind(this));
			}.bind(this));
			return promise;
			
		},
		
		getHeaderNumber: function () {
			var appType = "PURCHASEAPPLY";
			var promise = new Promise(function (resolve, reject) {
				$.ajax({
					url: "/html5apps/purchasewf/destinations/Print/ws/data/order-no" + "?code=" + appType,
					method: "GET",
					async: false,
					success: function (data) {
						resolve(data);
					},
					error: function (xhr, textStatus, errorText) {
						this.setBusy(false);
						reject(Error(errorText));
					}.bind(this)
				});
			});
			return promise;
		},
		
		_saveWorkflowHead : function(oDataModel){
			var promise = new Promise(function (resolve, reject) {
				var logheader = {
					"STARTCOMPANY": oDataModel.PurchaseHead.CompanyCode ? oDataModel.PurchaseHead.CompanyCode : "",
					"FLOWID": "purchaseapply",
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
		
		_savePurchaseRequisHead : function(oDataModel){
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
				this.getModel("PURREQ").create("/REQHeader", purchaseHeader, mParameter);
			}.bind(this));
			return promise;
		},
		
		_savePurchaseRequisList : function(oController, oDataModel){
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
					this.getModel("PURREQ").create("/REQItem", items[i], mParameters);
				}
			}.bind(this ));
			return promise;
		}
	});
});