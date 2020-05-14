var companyCode = $.context.PurchaseHead.CompanyCode;
var approvalStatu = $.context.ApprovalStatu;
var nextApprovalNode = "0000";
var totalAmountUSD = $.context.PurchaseHead.TotalAmountUSD;
var totalAmountTWD = $.context.PurchaseHead.TotalAmountTWD;
// var currency = $.context.PurchaseHead.PurReqnItemCurrency;
var type = $.context.PurchaseHead.PurchaseRequisitionType;
var employee = $.context.Employee;
if(!employee){
	$.context.Employee = $.context.Creater;
}
if(!approvalStatu){
	if(type === "NB"){
		if(companyCode === "6310" || companyCode === "1710"){
			nextApprovalNode = "0010";	
		}
	}
	if(type === "NBS"){
		nextApprovalNode = "0010";
	}
}
if(approvalStatu === "0010"){
	if(type === "NB"){
		if(companyCode === "6310"){
			if(totalAmountTWD >= 300000){
				nextApprovalNode = "0030";	
			}
		}
		
		if(companyCode === "1710"){
			if(totalAmountUSD >= 3500 || totalAmountTWD >= 100000){
				nextApprovalNode = "0020";	
			}
		}
	}
	if(type === "NBS"){
		if(companyCode === "1310"){
			nextApprovalNode = "0040";	
		}
		if(companyCode === "6310"){
			// if(totalAmountTWD >= 5000){
			// 	nextApprovalNode = "0020";	
			// }
			if(totalAmountTWD >= 10000){
				nextApprovalNode = "0030";	
			}
		}
		if(companyCode === "1710"){
			if(totalAmountUSD >= 170 || totalAmountTWD >= 5000){
				nextApprovalNode = "0020";	
			}
		}
	}
}
if(approvalStatu === "0020"){
	if(type === "NB"){
		if(companyCode === "1710"){
			if(totalAmountUSD >= 10000 || totalAmountTWD >= 300000){
				nextApprovalNode = "0030";	
			}
		}
	}
	if(type === "NBS"){
		// if(companyCode === "6310"){
		// 	if(totalAmountTWD >= 10000){
		// 		nextApprovalNode = "0030";	
		// 	}
		// }
		if(companyCode === "1710"){
			if(totalAmountUSD >= 350 || totalAmountTWD >= 10000){
				nextApprovalNode = "0030";	
			}
		}
	}
}
if(approvalStatu === "0030"){
	if(type === "NB"){
		if(companyCode === "6310"){
			if(totalAmountTWD >= 1000000){
				nextApprovalNode = "0040";	
			}
		}
		if(companyCode === "1710"){
			if(totalAmountTWD >= 1000000 || totalAmountUSD >= 35000){
				nextApprovalNode = "0040";	
			}
		}
	}
}

$.context.NextApprovalNode = nextApprovalNode;
$.context.ApprovalStatu = nextApprovalNode;
$.context.CompanyCode = companyCode;

switch(nextApprovalNode){
case "0010":
	$.context.ApprovalStatuText = "部门领导审批";
	break;
case "0020":
	$.context.ApprovalStatuText = "处主管审批";
	break;
case "0030":
	$.context.ApprovalStatuText = "副总经理审批";
	break;
case "0040":
	$.context.ApprovalStatuText = "总经理审批";
	break;
default:
	break;
}
