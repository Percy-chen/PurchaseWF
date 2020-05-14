var results = $.context.PrUUID.d.results;
var uuid = "";
if(results.length > 0){
	uuid = results[0].SAP_UUID;
}
$.context.PrUUID = uuid;