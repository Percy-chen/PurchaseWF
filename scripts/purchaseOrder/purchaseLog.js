// var purchaseHead = $.context.PurchaseHead;
// var purchaseItem = $.context.PurchaseList;
// var purchasellog = [];

// var item;
// var sum = 0;
// for(var i = 0; i < purchaseItem.length; i++){
// 	item = {
// 		PURORDER_NO : purchaseHead.PurchaseOrder,         
// 		PURORDER_ITEM : purchaseItem[i].PurchaseOrderItem,              
// 		SUB_ASSTYPE : purchaseItem[i].AccountAssignmentCategory,
// 		PROJECT_TYPE : purchaseItem[i].PurchaseOrderItemCategory,
// 		MATERIAL : purchaseItem[i].Material,
// 		MATERIAL_DES : purchaseItem[i].PurchaseOrderItemText,
// 		QUANTITY : purchaseItem[i].OrderQuantity,
// 		UNIT : purchaseItem[i].PurchaseOrderQuantityUnit,
// 		NET_AMOUNT : purchaseItem[i].NetPriceAmount,
// 		CURRENCY : purchaseItem[i].DocumentCurrency,
// 		TAX_PRICE : "",
// 		AMOUNT : "",
// 		TAX_CODE : purchaseItem[i].TaxCode,
// 		PLANT : purchaseItem[i].Plant,
// 		DELIVERYDATE : purchaseItem[i].ScheduleLineDeliveryDate,
// 		NOTE : purchaseItem[i].RequisitionerName,
// 		CHANGE_INS : ""
// 	};
// 	purchasellog.push(item);
// }
// var formatterSendTime = function(v){
// 	var date = new Date(v);
//     var resDate = date.getFullYear().toString() + this.p((date.getMonth() + 1)).toString() + this.p(date.getDate()).toString();
//     var resTime = this.p(date.getHours()).toString() + this.p(date.getMinutes()).toString() + this.p(date.getSeconds()).toString();
//     return resDate + resTime;
// };
// var purchasehlog = {
// 	SEND_TIME : formatterSendTime(task.createdOn),
// 	PURORDER_NO : purchaseHead.PurchaseOrder,
// 	PURORDER_TYPE : purchaseHead.PurchaseOrderType,
// 	SUPPLIER : purchaseHead.Supplier,
// 	PAY_TERMS : purchaseHead.PaymentTerms,
// 	CREATER : $.context.Creater,
// 	CREATE_DATE : "20191112",
// 	OAPP_STATE : "",
// 	TOTAL_AMOUNT : "",
// 	COMPANY : ""
// };
// $.context.PurchaseHlog = purchasehlog;
// $.context.PurchaseIlog = purchasellog;