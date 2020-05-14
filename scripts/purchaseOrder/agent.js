var flag = $.context.ApprovalNode.d.results[0].FLAG;
var approver = "";
if(flag === "A"){
	approver = $.context.Approver.d.LEADERAC;
}else if(flag === "B"){
	approver = $.context.Approver.d.SUPERIORAC;
}else{
	approver = $.context.ApprovalNode.d.results[0].APPROVALACCOUNT;
}
$.context.Employee = approver;
var approvers = $.context.Approvers ? $.context.Approvers : [];
var i;
var bSkip = false;

for(i = 0; i < approvers.length; i++){
	if(approver === approvers[i].approver){
		bSkip = true;
		break;
	}
} 
$.context.Skip = bSkip;

if(!bSkip){
	approvers.push({
		approver : approver
	});
	$.context.Approvers = approvers;
	
	//代理账号
	var agentNode = $.context.AgentNode.d.results;
	
	// 替换成代理账号
	for (i = 0; i < agentNode.length; i++) {
		if (approver === agentNode[i].USERID) {
			if (agentNode[i].DELFLAR !== "X") {
				approver = agentNode[i].AGENTID;
			}
		}
	}
	$.context.Approver = approver;
}


