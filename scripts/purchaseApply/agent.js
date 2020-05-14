var flag = $.context.ApprovalNode.d.results[0].FLAG;
var approver = "";
if(flag === "A"){
	approver = $.context.Approver.d.LEADERAC;
}else if(flag === "B"){
	approver = $.context.Approver.d.SUPERIORAC;
}else{
	approver = $.context.ApprovalNode.d.results[0].APPROVALACCOUNT;
}
// $.context.Employee = approver;
//代理账号
var agentNode = $.context.AgentNode.d.results;

// 替换成代理账号
for (var i = 0; i < agentNode.length; i++) {
	if (approver === agentNode[i].USERID) {
		if (agentNode[i].DELFLAR !== "X") {
			approver = agentNode[i].AGENTID;
		}
	}
}
$.context.Approver = approver;