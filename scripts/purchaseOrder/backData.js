var item;
if($.context.approved){
	item = {
		PurchaseOrder : $.context.PurchaseHead.PurchaseOrder,
		// YY1_Workflow_PDH : "A",
		YY1_POapprovment_PDH : "C"
	};
	$.context.PurchaseHlog.OAPP_STATE = "C";
}else{
	item = {
		PurchaseOrder : $.context.PurchaseHead.PurchaseOrder,
		// YY1_Workflow_PDH : "A",
		YY1_POapprovment_PDH : "B"
	};
	$.context.PurchaseHlog.OAPP_STATE = "B";
}
$.context.PurchaseHeader = item;