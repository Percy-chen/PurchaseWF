sap.ui.define([
	"sap/ui/core/mvc/Controller"
], function (Controller) {
	"use strict";

	return Controller.extend("orderApprove.controller.App", {

		onInit: function () {},

		formatDate: function (v) {
			jQuery.sap.require("sap.ui.core.format.DateFormat");
			var oDateFormat = sap.ui.core.format.DateFormat.getDateTimeInstance({
				style: "medium"
			}, sap.ui.getCore().getConfiguration().getLocale());
			return oDateFormat.format(v);
		},
		
		// 去前导零
		deleteLeftZero : function(v) {
			if (v === null || v === undefined || v === 0 || v === "0") {
				v = "0";
			}
			return v.replace(/^0+/, "");
		},
		
		dateString : function(value) {
			if (value !== "" && value !== null && value !== undefined) {
				var year = value.substring(0, 4);
				var month = value.substring(4, 6);
				var day = value.substring(6, 8);
				return year + "-" + month + "-" + day;
			} else {
				return value;
			}
		},
		
		setColumnVis : function(v){
			if(v === "X"){
				return true;
			}
			return false;
		}
	});
});