var purchaseHead = $.context.PurchaseHead;
var purchaseItem = $.context.PurchaseList.d.results;            
var purchasellog = [];
var item;
var sum = 0;

function toPoint(percent){
	var str = percent.replace("%","");
    str = str / 100;
	return str;
}
for(var i = 0; i < purchaseItem.length; i++){
	// purchaseItem[i].ScheduleLineDeliveryDate = this.date(purchaseItem[i].ScheduleLineDeliveryDate);
	purchaseItem[i].TaxPrice = (purchaseItem[i].NetPriceAmount * (1 + toPoint(purchaseItem[i].YY1_TaxJurisdiction_PDI))).toFixed(2); // 含税价	// purchaseItem[i].TaxPrice = (purchaseItem[i].TaxPrice.toFixed(2))
	purchaseItem[i].Amount = Number(purchaseItem[i].TaxPrice) * Number(purchaseItem[i].OrderQuantity); // 金额
	sum = sum + purchaseItem[i].Amount;
	purchaseItem[i].Amount = purchaseItem[i].Amount.toFixed(2);
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
// purchaseHead.CreationDate = this.date(purchaseHead.CreationDate);
purchaseHead.TotalAmount = sum;
var purchasehlog = {
	PURORDER_NO : purchaseHead.PurchaseOrder,
	PURORDER_TYPE : purchaseHead.PurchaseOrderType,
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