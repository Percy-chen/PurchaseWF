sap.ui.define([
	"sap/ui/core/mvc/Controller"
], function (Controller) {
	"use strict";

	return Controller.extend("applyApprove.controller.App", {

		onInit: function () {
			// this._initData();
		},

		// _initData : function(){
		// 	var taskId = this.getOwnerComponent()._getTaskId();
		// },
		
		formatDate: function (v) {
			//获得当前运行环境时间
            var d = v;
            var currentDate = v;
            var tmpHours = currentDate.getHours();
            //算得时区
            var timeZone = -d.getTimezoneOffset() / 60;
            if (timeZone < 0) {
                timeZone = Math.abs(timeZone) + 8; currentDate.setHours(tmpHours + timeZone);
            } else {
                timeZone -= 8; 
                currentDate.setHours(tmpHours - timeZone);
            }
		
			jQuery.sap.require("sap.ui.core.format.DateFormat");
			var oDateFormat = sap.ui.core.format.DateFormat.getDateTimeInstance({
				style: "medium"
			}, sap.ui.getCore().getConfiguration().getLocale());
			return oDateFormat.format(currentDate);
		},
		
		// 去前导零
		deleteLeftZero : function(v) {
			if (v === null || v === undefined || v === 0 || v === "0") {
				v = "0";
			}
			return v.replace(/^0+/, "");
		},
		
		date : function(value) {
			if (value) {
				return new Date(parseInt(value.substr(6, 13))).toLocaleDateString().replace(/\//g, "-");
			} else {
				return value;
			}
		}
	});
});