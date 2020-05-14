// 设置Workflow 定义ID
$.context.workflowDefinitionId = $.info.workflowDefinitionId;
$.context.workflowInstanceId = $.info.workflowInstanceId;
$.context.Approvers = [
    {
        "approver": $.context.Creater
    }
];

var time = $.context.Time ? $.context.Time : 1;

var head = $.context.PurchaseHead.d.results;
var bContinue;
if(head.length === 0){
	bContinue = "1";
	time++;
}else{
	bContinue = "0";
	var change = $.context.Change;
	if(change === "X"){
		$.context.Title = "采购订单修改审批";
	}else{
		$.context.Title = "采购订单创建审批";
	}
	// $.context.PurchaseHead = purchaseHead;
	$.context.PurchaseOrder = head[0].PurchaseOrder;
	$.context.Language = head[0].PaymentTerms;
	$.context.Approvment = head[0].YY1_POapprovment_PDH;
	$.context.CompanyCode = head[0].CompanyCode;
	delete $.context.PurchaseOrders;
}
if(time === 5000){
	bContinue = "2";
}
$.context.Time = time;
$.context.bContinue = bContinue;
$.context.ChangeAS = false;