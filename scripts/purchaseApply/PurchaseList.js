var purchaseHead = $.context.PurchaseHead;
// var purchaseItem = $.context.PurchaseList.d.results;    
// var purchaseList = [];
// var purchasellog = [];
// var item;
// var sumUSD = 0, sumTWD = 0;
// for(var i = 0; i < purchaseItem.length; i++){
// 	if(purchaseItem[i].IsDeleted !== "X"){
// 		purchaseItem[i].PurchaseRequisitionPrice = Number(purchaseItem[i].PurchaseRequisitionPrice) 
// 												 / Number(purchaseItem[i].PurReqnPriceQuantity);
// 		purchaseItem[i].Amount = Number(purchaseItem[i].PurchaseRequisitionPrice) 
// 							   * Number(purchaseItem[i].RequestedQuantity); // 金额
		
// 		if(purchaseItem[i].PurReqnItemCurrency === "USD"){
// 			sumUSD = sumUSD + purchaseItem[i].Amount;
// 		}else if(purchaseItem[i].PurReqnItemCurrency === "TWD"){
// 			sumTWD = sumTWD + purchaseItem[i].Amount;
// 		}
// 		purchaseItem[i].Amount = purchaseItem[i].Amount.toFixed(2);
// 		item = {
// 			PURREQ_NO : purchaseHead.PurchaseRequisition,         
// 			PURREQ_ITEM : purchaseItem[i].PurchaseRequisitionItem,    
// 			// OAPP_STATE : purchaseItem[i].PurchaseRequisitionItem,    
// 			SUB_ASSTYPE : purchaseItem[i].AccountAssignmentCategory,
// 			PROJECT_TYPE : purchaseItem[i].PurchasingDocumentItemCateg,
// 			MATERIAL : purchaseItem[i].Material,
// 			MATERIAL_DES : purchaseItem[i].PurchaseRequisitionItemText,
// 			QUANTITY : purchaseItem[i].RequestedQuantity,
// 			UNIT : purchaseItem[i].BaseUnit,
// 			ACCESSPRICE : purchaseItem[i].PurchaseRequisitionPrice,
// 			AMOUNT : purchaseItem[i].Amount,
// 			PLANT : purchaseItem[i].Plant,
// 			DELIVERYDATE : purchaseItem[i].DeliveryDate,
// 			CHANGE_INS : purchaseItem[i].RequirementTracking
// 		};
// 		purchasellog.push(item);
// 		purchaseList.push(purchaseItem[i]);
// 	}
// }
// purchaseHead.TotalAmountUSD = sumUSD;
// purchaseHead.TotalAmountTWD = sumTWD;
// // purchaseHead.PurReqCreationDate = date(purchaseHead.PurReqCreationDate);
// var purchasehlog = {
// 	PURREQ_NO : purchaseHead.PurchaseRequisition,
// 	PURREQ_TYPE : purchaseHead.PurchaseRequisitionType,
// 	CREATER : purchaseHead.PersonFullName,
// 	CREATE_DATE : purchaseHead.PurReqCreationDate,
// 	OAPP_STATE : "",
// 	COMPANY : purchaseHead.CompanyCode
// };

// $.context.PurchaseHead = purchaseHead;  
// $.context.PurchaseList = purchaseList;
// $.context.PurchaseHlog = purchasehlog;
// $.context.PurchaseLlog = purchasellog;

var type = purchaseHead.PurchaseRequisitionType;
var companyCode = purchaseHead.CompanyCode;
var bApproveSelf = true;
if(companyCode === "1310" && type === "NB"){
	bApproveSelf = false;
}
$.context.ApproveSelf = bApproveSelf;