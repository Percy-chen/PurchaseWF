var companyCode = $.context.CompanyCode;
var approvalStatu = $.context.ApprovalStatu;
var nextApprovalNode = "0000";
var opCompanyCode = $.context.OpCompanyCode;
var currency = $.context.PurchaseHead.DocumentCurrency;
var totalAmount = $.context.PurchaseHead.TotalAmount;
var type = $.context.PurchaseHead.YY1_PurType_PDH;
var employee = $.context.Employee;
var nextSnumber = "0010";
if(!employee){
	$.context.Employee = $.context.Creater;
}
if(!approvalStatu){
	nextApprovalNode = "0010";	
	opCompanyCode = companyCode;
}
if(approvalStatu === "0010"){
	if(type !== "Z81"){
		if(companyCode === "1310"){
			if((currency === "CNY" && totalAmount >= 5000) || (currency === "USD" && totalAmount >= 2000)){
				nextApprovalNode = "0060";
			}
		}
	}else{
		if(companyCode === "1310"){
			if((currency === "USD" && totalAmount >= 2000) || (currency === "CNY" && totalAmount >= 5000)){
				nextApprovalNode = "0060";
			}else{
				nextApprovalNode = "0020";	
				opCompanyCode = "6310";
				nextSnumber = "0010";
			}
		}else if(companyCode === "6310"){
			nextApprovalNode = "0020";
			opCompanyCode = "1310";
		}else if(companyCode === "1710"){
			nextApprovalNode = "0020";
			opCompanyCode = "6310";
			nextSnumber = "0020";
		}
	}
	
}
if(approvalStatu === "0020"){
	if(type === "Z81"){
		if(companyCode === "1310" || companyCode === "6310" || companyCode === "1710"){
			nextApprovalNode = "0030";
		}
	}
}
if(approvalStatu === "0030"){
	if(type === "Z81"){
		if(companyCode === "1310" || companyCode === "1710"){
			nextApprovalNode = "0050";
		}
	}
}
if(approvalStatu === "0050"){
	if(type === "Z81"){
		if(companyCode === "1310" || companyCode === "1710"){
			if(currency === "USD" && totalAmount >= 35000){
				nextApprovalNode = "0060";
			}
		}
	}
}
if(approvalStatu === "0060"){
	if(type === "Z81"){
		if(companyCode === "1310"){
			nextApprovalNode = "0020";
			opCompanyCode = "6310";
			nextSnumber = "0010";
		}
	}
}

$.context.NextApprovalNode = nextApprovalNode;
$.context.ApprovalStatu = nextApprovalNode;
$.context.CompanyCode = companyCode;
$.context.OpCompanyCode = opCompanyCode;
$.context.NextSnumber = nextSnumber;
switch(nextApprovalNode){
case "0010":
	$.context.ApprovalStatuText = "部门领导审批";
	break;
case "0020":
	$.context.ApprovalStatuText = "业务审批";
	break;
case "0030":
	$.context.ApprovalStatuText = "业务主管审批";
	break;
case "0040":
	$.context.ApprovalStatuText = "处主管审批";
	break;
case "0050":
	$.context.ApprovalStatuText = "副总经理审批";
	break;
case "0060":
	$.context.ApprovalStatuText = "总经理审批";
	break;
default:
	break;
}

var bSkip = $.context.Skip;
var bChangeAS = false;
if(bSkip === true && nextApprovalNode === "0000"){
	bChangeAS = true;
}
$.context.ChangeAS = bChangeAS;
