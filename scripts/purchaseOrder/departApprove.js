// 设置Workflow 定义ID
$.context.workflowDefinitionId = $.info.workflowDefinitionId;
$.context.workflowInstanceId = $.info.workflowInstanceId;

// 获取审批人账号
var approvalTree = {
	node0010: {
		subNode0010: {
			account: []
		}
	}
};

//填写Node ID
var approvalNode = $.context.ApprovalNode.d;

//代理账号
var agentNode = $.context.AgentNode.d.results;

// 替换成代理账号
for (var i = 0; i< agentNode.length; i++) {
	if (approvalNode.LEADERAC === agentNode[i].USERID) {
		if (agentNode[i].DELFLAR !== 'X') {
			approvalNode.LEADERAC = agentNode[i].AGENTID;
		}
	}
}

approvalTree.node0010.subNode0010.account.push(approvalNode.LEADERAC);
$.context.CompanyCode = approvalNode.COMPANYCODE;
$.context.ApprovalStatu = "0010";
$.context.ApprovalStatuText = "部门领导审批";
$.context.approvalTree = approvalTree;

if ($.context.approvalLogs === undefined) {
	$.context.approvalLogs = [];
}