// 设置Workflow 定义ID
$.context.workflowDefinitionId = $.info.workflowDefinitionId;
$.context.workflowInstanceId = $.info.workflowInstanceId;
var time = $.context.Time ? $.context.Time : 1;
var head = $.context.PurchaseHead.d.results;
var bContinue;

// function formatterSendTime(v) {
// 	var date = new Date(v);
//     var resDate = date.getFullYear().toString() + this.p((date.getMonth() + 1)).toString() + this.p(date.getDate()).toString();
//     var resTime = this.p(date.getHours()).toString() + this.p(date.getMinutes()).toString() + this.p(date.getSeconds()).toString();
//     return resDate + resTime;
// }
if(head.length === 0){
	bContinue = "1";
	time++;
}else{
	bContinue = "0";
	var purchaseHead = head[0];
	$.context.PurchaseHead = purchaseHead;
}
if(time === 5000){
	bContinue = "2";
}
$.context.Time = time;
$.context.bContinue = bContinue;