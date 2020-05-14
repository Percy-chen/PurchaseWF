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

approvalTree.node0010.subNode0010.account.push(approvalNode.LEADERAC);
$.context.approvalTree = approvalTree;