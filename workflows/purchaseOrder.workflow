{
	"contents": {
		"28b069af-689b-4512-9fab-84385794bb62": {
			"classDefinition": "com.sap.bpm.wfs.Model",
			"id": "purchaseorder",
			"subject": "采购订单${context.PurchaseOrderID}",
			"name": "purchaseOrder",
			"documentation": "",
			"lastIds": "7e169a07-c53b-4d49-8881-6155b1c226a3",
			"events": {
				"48f6c819-c58b-40cd-b6fa-fbb7cfc4fa22": {
					"name": "提交"
				},
				"8535b52f-1d3e-4d8b-a411-e2522faf6c4b": {
					"name": "结束"
				}
			},
			"activities": {
				"2d671ca7-9855-45fa-b6c6-d262b9c56d5d": {
					"name": "整理回写数据"
				},
				"d50a74b8-e720-44c6-8af0-bc18810189ef": {
					"name": "获取采购订单号"
				},
				"788bfa83-4921-4f83-aa27-d5eb4c254e19": {
					"name": "整理采购订单号"
				},
				"3d23f5ee-0abc-4900-9680-94d1ab6e03d2": {
					"name": "判断"
				},
				"f72a4e11-abf1-4298-93c6-2a4406348868": {
					"name": "整理审批条件"
				},
				"ac309960-69a2-469f-ae48-0f644aaa6dae": {
					"name": "is end?"
				},
				"c2231e70-241f-4647-85de-7f73443dc05d": {
					"name": "获取审批人"
				},
				"b20edbe2-f751-4b44-954e-14b238a3564a": {
					"name": "分支"
				},
				"b5eda418-b619-46b1-9d47-44707370f9bd": {
					"name": "获取员工表数据"
				},
				"658f4c3e-fddb-4b73-bad0-c92fbe82d918": {
					"name": "获取当前日期"
				},
				"326f9c83-4a26-4114-bb57-dda850a82572": {
					"name": "获取代理人"
				},
				"8050b184-38ce-4922-9888-7d2eb44dc84c": {
					"name": "整理代理人"
				},
				"4588f7a6-6080-4eb5-8540-b0b8b6ffad65": {
					"name": "审批"
				},
				"3f896a07-b967-427b-8051-2d15b613452f": {
					"name": "is approved?"
				},
				"d877f58a-3dba-4016-a91a-d759f49de893": {
					"name": "发起人审批"
				},
				"2e0590a4-a330-4112-9dd4-de96d57dfbe2": {
					"name": "回写SCP"
				},
				"b01e2dcd-42ae-4f54-8516-767542bd067c": {
					"name": "is skip?"
				},
				"04e507a2-29d1-49e5-a345-326b691b4fa0": {
					"name": "bChangeApproveStatu"
				},
				"07787107-f3a3-47ff-8a13-f2977cb37c00": {
					"name": "回写CLOUD"
				}
			},
			"sequenceFlows": {
				"80212024-1513-4104-bce3-d66c09bba86b": {
					"name": "SequenceFlow120"
				},
				"47a72021-7a6c-42de-be79-98b8e2f35f9b": {
					"name": "SequenceFlow123"
				},
				"897f5a46-91a7-45fb-a6c0-447740bdf2b0": {
					"name": "SequenceFlow124"
				},
				"0e3fd2b6-2af9-4181-9f38-95eb71cf8828": {
					"name": "t"
				},
				"d05ede90-485e-4313-b727-06b16ace909b": {
					"name": "SequenceFlow151"
				},
				"5d5da84e-4748-4c55-9a6e-9c3ce9f9380f": {
					"name": "c"
				},
				"fd8b892b-0ce7-4075-a5ec-5022a2ff24a5": {
					"name": "SequenceFlow153"
				},
				"ad5e5e7a-4a6f-4fa3-a73a-d21c0b983be9": {
					"name": "employee"
				},
				"760930ee-d1e0-4974-8869-0f3a54537245": {
					"name": "SequenceFlow157"
				},
				"22c6e1d9-2e9f-4033-8555-4111bcf368c6": {
					"name": "no"
				},
				"59727eb0-2dd8-452c-a389-0d91d7271533": {
					"name": "SequenceFlow161"
				},
				"05ca719e-2bfb-4bf7-80d4-49a10668038b": {
					"name": "yes"
				},
				"5caa7ffe-4dc9-48f9-ae37-39a010a8ba63": {
					"name": "end"
				},
				"7c733ca7-e66d-4374-9c56-5dd67a324d23": {
					"name": "node"
				},
				"a23762b9-a9fa-4368-8db4-e40d0de4442c": {
					"name": "SequenceFlow173"
				},
				"56d591c4-8b20-49dd-9525-602a14972c8a": {
					"name": "SequenceFlow174"
				},
				"7d8f4936-a189-4a5c-b47f-2d933729b8dc": {
					"name": "f"
				},
				"93b48090-e6aa-435c-bd5b-78fc0b9eaac7": {
					"name": "SequenceFlow178"
				},
				"cc83004a-f187-420f-a6d0-2abbcc993579": {
					"name": "SequenceFlow180"
				},
				"093c19fc-2174-4d66-82ff-80dd81cd44c6": {
					"name": "SequenceFlow182"
				},
				"38192c04-7775-461a-838c-897be035bb15": {
					"name": "SequenceFlow183"
				},
				"9d32f7a3-d0ec-4142-a041-761a3d8fa123": {
					"name": "no"
				},
				"574f9718-05c4-4878-872c-845deaf455d0": {
					"name": "yes"
				},
				"d25d26d6-456c-405a-8f3e-a9a99e28b9b0": {
					"name": "SequenceFlow186"
				},
				"579746df-3599-4cf2-8273-5b80f212be73": {
					"name": "yes"
				},
				"e9f11389-7367-4477-831b-0bd23cb28bfb": {
					"name": "no"
				},
				"bfc5f664-0ab0-4e88-897e-db8c692956ea": {
					"name": "SequenceFlow189"
				}
			},
			"diagrams": {
				"d585f523-5846-45a6-b306-8e1ae69dcfb9": {}
			}
		},
		"48f6c819-c58b-40cd-b6fa-fbb7cfc4fa22": {
			"classDefinition": "com.sap.bpm.wfs.StartEvent",
			"id": "startevent1",
			"name": "提交"
		},
		"8535b52f-1d3e-4d8b-a411-e2522faf6c4b": {
			"classDefinition": "com.sap.bpm.wfs.EndEvent",
			"id": "endevent3",
			"name": "结束"
		},
		"2d671ca7-9855-45fa-b6c6-d262b9c56d5d": {
			"classDefinition": "com.sap.bpm.wfs.ScriptTask",
			"reference": "/scripts/purchaseOrder/backData.js",
			"id": "scripttask14",
			"name": "整理回写数据"
		},
		"d50a74b8-e720-44c6-8af0-bc18810189ef": {
			"classDefinition": "com.sap.bpm.wfs.ServiceTask",
			"destination": "S4HANACLOUD_BASIC",
			"path": "/sap/opu/odata/sap/YY1_PURCHASEORD_ITEMS_CDS/YY1_PURCHASEORD_ITEMS?$filter=YY1_businessId_PDH eq '${context.PurchaseOrderID}'",
			"httpMethod": "GET",
			"responseVariable": "${context.PurchaseHead}",
			"id": "servicetask18",
			"name": "获取采购订单号"
		},
		"788bfa83-4921-4f83-aa27-d5eb4c254e19": {
			"classDefinition": "com.sap.bpm.wfs.ScriptTask",
			"reference": "/scripts/purchaseOrder/PurchaseOrder.js",
			"id": "scripttask18",
			"name": "整理采购订单号"
		},
		"3d23f5ee-0abc-4900-9680-94d1ab6e03d2": {
			"classDefinition": "com.sap.bpm.wfs.ExclusiveGateway",
			"id": "exclusivegateway15",
			"name": "判断",
			"default": "0e3fd2b6-2af9-4181-9f38-95eb71cf8828"
		},
		"f72a4e11-abf1-4298-93c6-2a4406348868": {
			"classDefinition": "com.sap.bpm.wfs.ScriptTask",
			"reference": "/scripts/purchaseOrder/approvalCondition.js",
			"id": "scripttask27",
			"name": "整理审批条件"
		},
		"ac309960-69a2-469f-ae48-0f644aaa6dae": {
			"classDefinition": "com.sap.bpm.wfs.ExclusiveGateway",
			"id": "exclusivegateway18",
			"name": "is end?",
			"default": "5d5da84e-4748-4c55-9a6e-9c3ce9f9380f"
		},
		"c2231e70-241f-4647-85de-7f73443dc05d": {
			"classDefinition": "com.sap.bpm.wfs.ServiceTask",
			"destination": "APLEXHANAWORKFLOW",
			"path": "/WORKFLOWNODE.xsodata/WORKFLOWNODE?$filter=STARTCOMPANY eq ${context.OpCompanyCode} and FLOWID eq 'workflow_purchaseorder' and NODEID eq '${context.NextApprovalNode}' and SNUMBER eq '${context.NextSnumber}'",
			"httpMethod": "GET",
			"responseVariable": "${context.ApprovalNode}",
			"id": "servicetask22",
			"name": "获取审批人"
		},
		"b20edbe2-f751-4b44-954e-14b238a3564a": {
			"classDefinition": "com.sap.bpm.wfs.ExclusiveGateway",
			"id": "exclusivegateway19",
			"name": "分支",
			"default": "ad5e5e7a-4a6f-4fa3-a73a-d21c0b983be9"
		},
		"b5eda418-b619-46b1-9d47-44707370f9bd": {
			"classDefinition": "com.sap.bpm.wfs.ServiceTask",
			"destination": "APLEXHANAWORKFLOW",
			"path": "/EMPLOYEES.xsodata/EMPLOYEES('${context.Employee}')",
			"httpMethod": "GET",
			"responseVariable": "${context.Approver}",
			"id": "servicetask23",
			"name": "获取员工表数据"
		},
		"658f4c3e-fddb-4b73-bad0-c92fbe82d918": {
			"classDefinition": "com.sap.bpm.wfs.ScriptTask",
			"reference": "/scripts/purchaseOrder/currentDate.js",
			"id": "scripttask28",
			"name": "获取当前日期"
		},
		"326f9c83-4a26-4114-bb57-dda850a82572": {
			"classDefinition": "com.sap.bpm.wfs.ServiceTask",
			"destination": "APLEXHANAWORKFLOW",
			"path": "/AGENT.xsodata/AGENT?$filter=FLOWID eq 'puchaseorder' and SDATE le '${context.currentDate}' and EDATE ge '${context.currentDate}'",
			"httpMethod": "GET",
			"responseVariable": "${context.AgentNode}",
			"id": "servicetask24",
			"name": "获取代理人"
		},
		"8050b184-38ce-4922-9888-7d2eb44dc84c": {
			"classDefinition": "com.sap.bpm.wfs.ScriptTask",
			"reference": "/scripts/purchaseOrder/agent.js",
			"id": "scripttask29",
			"name": "整理代理人"
		},
		"4588f7a6-6080-4eb5-8540-b0b8b6ffad65": {
			"classDefinition": "com.sap.bpm.wfs.UserTask",
			"subject": "${context.Title}${context.PurchaseOrder}",
			"priority": "MEDIUM",
			"isHiddenInLogForParticipant": false,
			"userInterface": "sapui5://html5apps/purchasewf/orderApprove/webapp/orderApprove",
			"recipientUsers": "${context.Approver}",
			"id": "usertask9",
			"name": "审批"
		},
		"3f896a07-b967-427b-8051-2d15b613452f": {
			"classDefinition": "com.sap.bpm.wfs.ExclusiveGateway",
			"id": "exclusivegateway20",
			"name": "is approved?",
			"default": "05ca719e-2bfb-4bf7-80d4-49a10668038b"
		},
		"d877f58a-3dba-4016-a91a-d759f49de893": {
			"classDefinition": "com.sap.bpm.wfs.UserTask",
			"subject": "${context.Title}${context.PurchaseOrder}",
			"priority": "MEDIUM",
			"isHiddenInLogForParticipant": false,
			"userInterface": "sapui5://html5apps/purchasewf/orderApprove/webapp/orderApprove",
			"recipientUsers": "${context.Creater}",
			"id": "usertask10",
			"name": "发起人审批"
		},
		"2e0590a4-a330-4112-9dd4-de96d57dfbe2": {
			"classDefinition": "com.sap.bpm.wfs.ServiceTask",
			"destination": "APLEXHANAWORKFLOW",
			"path": "/PURCHASE.xsodata/PURHeader('${context.PurchaseHlog.APPNUM}')",
			"httpMethod": "PUT",
			"xsrfPath": "",
			"requestVariable": "${context.PurchaseHlog}",
			"id": "servicetask25",
			"name": "回写SCP"
		},
		"b01e2dcd-42ae-4f54-8516-767542bd067c": {
			"classDefinition": "com.sap.bpm.wfs.ExclusiveGateway",
			"id": "exclusivegateway22",
			"name": "is skip?",
			"default": "574f9718-05c4-4878-872c-845deaf455d0"
		},
		"04e507a2-29d1-49e5-a345-326b691b4fa0": {
			"classDefinition": "com.sap.bpm.wfs.ExclusiveGateway",
			"id": "exclusivegateway23",
			"name": "bChangeApproveStatu",
			"default": "e9f11389-7367-4477-831b-0bd23cb28bfb"
		},
		"07787107-f3a3-47ff-8a13-f2977cb37c00": {
			"classDefinition": "com.sap.bpm.wfs.ServiceTask",
			"destination": "S4HANACLOUD_BASIC",
			"path": "/sap/opu/odata/sap/API_PURCHASEORDER_PROCESS_SRV/A_PurchaseOrder('${context.PurchaseHeader.PurchaseOrder}')",
			"httpMethod": "PATCH",
			"xsrfPath": "/sap/opu/odata/sap/API_PURCHASEORDER_PROCESS_SRV",
			"requestVariable": "${context.PurchaseHeader}",
			"responseVariable": "${context.Response}",
			"id": "servicetask26",
			"name": "回写CLOUD"
		},
		"80212024-1513-4104-bce3-d66c09bba86b": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow120",
			"name": "SequenceFlow120",
			"sourceRef": "d50a74b8-e720-44c6-8af0-bc18810189ef",
			"targetRef": "788bfa83-4921-4f83-aa27-d5eb4c254e19"
		},
		"47a72021-7a6c-42de-be79-98b8e2f35f9b": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow123",
			"name": "SequenceFlow123",
			"sourceRef": "48f6c819-c58b-40cd-b6fa-fbb7cfc4fa22",
			"targetRef": "d50a74b8-e720-44c6-8af0-bc18810189ef"
		},
		"897f5a46-91a7-45fb-a6c0-447740bdf2b0": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow124",
			"name": "SequenceFlow124",
			"sourceRef": "788bfa83-4921-4f83-aa27-d5eb4c254e19",
			"targetRef": "3d23f5ee-0abc-4900-9680-94d1ab6e03d2"
		},
		"0e3fd2b6-2af9-4181-9f38-95eb71cf8828": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow150",
			"name": "t",
			"sourceRef": "3d23f5ee-0abc-4900-9680-94d1ab6e03d2",
			"targetRef": "d877f58a-3dba-4016-a91a-d759f49de893"
		},
		"d05ede90-485e-4313-b727-06b16ace909b": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow151",
			"name": "SequenceFlow151",
			"sourceRef": "f72a4e11-abf1-4298-93c6-2a4406348868",
			"targetRef": "ac309960-69a2-469f-ae48-0f644aaa6dae"
		},
		"5d5da84e-4748-4c55-9a6e-9c3ce9f9380f": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow152",
			"name": "c",
			"sourceRef": "ac309960-69a2-469f-ae48-0f644aaa6dae",
			"targetRef": "c2231e70-241f-4647-85de-7f73443dc05d"
		},
		"fd8b892b-0ce7-4075-a5ec-5022a2ff24a5": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow153",
			"name": "SequenceFlow153",
			"sourceRef": "c2231e70-241f-4647-85de-7f73443dc05d",
			"targetRef": "b20edbe2-f751-4b44-954e-14b238a3564a"
		},
		"ad5e5e7a-4a6f-4fa3-a73a-d21c0b983be9": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow154",
			"name": "employee",
			"sourceRef": "b20edbe2-f751-4b44-954e-14b238a3564a",
			"targetRef": "b5eda418-b619-46b1-9d47-44707370f9bd"
		},
		"760930ee-d1e0-4974-8869-0f3a54537245": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow157",
			"name": "SequenceFlow157",
			"sourceRef": "658f4c3e-fddb-4b73-bad0-c92fbe82d918",
			"targetRef": "326f9c83-4a26-4114-bb57-dda850a82572"
		},
		"22c6e1d9-2e9f-4033-8555-4111bcf368c6": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"condition": "${context.approved==false}",
			"id": "sequenceflow160",
			"name": "no",
			"sourceRef": "3f896a07-b967-427b-8051-2d15b613452f",
			"targetRef": "2d671ca7-9855-45fa-b6c6-d262b9c56d5d"
		},
		"59727eb0-2dd8-452c-a389-0d91d7271533": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow161",
			"name": "SequenceFlow161",
			"sourceRef": "4588f7a6-6080-4eb5-8540-b0b8b6ffad65",
			"targetRef": "3f896a07-b967-427b-8051-2d15b613452f"
		},
		"05ca719e-2bfb-4bf7-80d4-49a10668038b": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow162",
			"name": "yes",
			"sourceRef": "3f896a07-b967-427b-8051-2d15b613452f",
			"targetRef": "f72a4e11-abf1-4298-93c6-2a4406348868"
		},
		"5caa7ffe-4dc9-48f9-ae37-39a010a8ba63": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"condition": "${context.NextApprovalNode==\"0000\"}",
			"id": "sequenceflow166",
			"name": "end",
			"sourceRef": "ac309960-69a2-469f-ae48-0f644aaa6dae",
			"targetRef": "2d671ca7-9855-45fa-b6c6-d262b9c56d5d"
		},
		"7c733ca7-e66d-4374-9c56-5dd67a324d23": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"condition": "${context.ApprovalNode.d.results[0].FLAG==\"\"}",
			"id": "sequenceflow172",
			"name": "node",
			"sourceRef": "b20edbe2-f751-4b44-954e-14b238a3564a",
			"targetRef": "658f4c3e-fddb-4b73-bad0-c92fbe82d918"
		},
		"a23762b9-a9fa-4368-8db4-e40d0de4442c": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow173",
			"name": "SequenceFlow173",
			"sourceRef": "b5eda418-b619-46b1-9d47-44707370f9bd",
			"targetRef": "658f4c3e-fddb-4b73-bad0-c92fbe82d918"
		},
		"56d591c4-8b20-49dd-9525-602a14972c8a": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow174",
			"name": "SequenceFlow174",
			"sourceRef": "326f9c83-4a26-4114-bb57-dda850a82572",
			"targetRef": "8050b184-38ce-4922-9888-7d2eb44dc84c"
		},
		"7d8f4936-a189-4a5c-b47f-2d933729b8dc": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"condition": "${context.bContinue==\"1\"}",
			"id": "sequenceflow175",
			"name": "f",
			"sourceRef": "3d23f5ee-0abc-4900-9680-94d1ab6e03d2",
			"targetRef": "d50a74b8-e720-44c6-8af0-bc18810189ef"
		},
		"93b48090-e6aa-435c-bd5b-78fc0b9eaac7": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow178",
			"name": "SequenceFlow178",
			"sourceRef": "d877f58a-3dba-4016-a91a-d759f49de893",
			"targetRef": "3f896a07-b967-427b-8051-2d15b613452f"
		},
		"cc83004a-f187-420f-a6d0-2abbcc993579": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow180",
			"name": "SequenceFlow180",
			"sourceRef": "2d671ca7-9855-45fa-b6c6-d262b9c56d5d",
			"targetRef": "2e0590a4-a330-4112-9dd4-de96d57dfbe2"
		},
		"093c19fc-2174-4d66-82ff-80dd81cd44c6": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"condition": "${context.bContinue==\"2\"}",
			"id": "sequenceflow182",
			"name": "SequenceFlow182",
			"sourceRef": "3d23f5ee-0abc-4900-9680-94d1ab6e03d2",
			"targetRef": "8535b52f-1d3e-4d8b-a411-e2522faf6c4b"
		},
		"38192c04-7775-461a-838c-897be035bb15": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow183",
			"name": "SequenceFlow183",
			"sourceRef": "8050b184-38ce-4922-9888-7d2eb44dc84c",
			"targetRef": "b01e2dcd-42ae-4f54-8516-767542bd067c"
		},
		"9d32f7a3-d0ec-4142-a041-761a3d8fa123": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"condition": "${context.Skip==false}",
			"id": "sequenceflow184",
			"name": "no",
			"sourceRef": "b01e2dcd-42ae-4f54-8516-767542bd067c",
			"targetRef": "4588f7a6-6080-4eb5-8540-b0b8b6ffad65"
		},
		"574f9718-05c4-4878-872c-845deaf455d0": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow185",
			"name": "yes",
			"sourceRef": "b01e2dcd-42ae-4f54-8516-767542bd067c",
			"targetRef": "f72a4e11-abf1-4298-93c6-2a4406348868"
		},
		"d25d26d6-456c-405a-8f3e-a9a99e28b9b0": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow186",
			"name": "SequenceFlow186",
			"sourceRef": "2e0590a4-a330-4112-9dd4-de96d57dfbe2",
			"targetRef": "04e507a2-29d1-49e5-a345-326b691b4fa0"
		},
		"579746df-3599-4cf2-8273-5b80f212be73": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"condition": "${context.ChangeAS==true}",
			"id": "sequenceflow187",
			"name": "yes",
			"sourceRef": "04e507a2-29d1-49e5-a345-326b691b4fa0",
			"targetRef": "07787107-f3a3-47ff-8a13-f2977cb37c00"
		},
		"e9f11389-7367-4477-831b-0bd23cb28bfb": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow188",
			"name": "no",
			"sourceRef": "04e507a2-29d1-49e5-a345-326b691b4fa0",
			"targetRef": "8535b52f-1d3e-4d8b-a411-e2522faf6c4b"
		},
		"bfc5f664-0ab0-4e88-897e-db8c692956ea": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow189",
			"name": "SequenceFlow189",
			"sourceRef": "07787107-f3a3-47ff-8a13-f2977cb37c00",
			"targetRef": "8535b52f-1d3e-4d8b-a411-e2522faf6c4b"
		},
		"d585f523-5846-45a6-b306-8e1ae69dcfb9": {
			"classDefinition": "com.sap.bpm.wfs.ui.Diagram",
			"symbols": {
				"2320e8ef-b60a-4bc2-9c79-0afcb49c5aa8": {},
				"9fc0ac8f-d777-4e05-ae63-77583b88499c": {},
				"474a3823-55cc-4979-ad18-117ff977a921": {},
				"5d4945b0-4ec4-4f17-8db0-c92951fc1744": {},
				"46c39ba6-9d71-4b3b-a09f-2971b7ce61e3": {},
				"f429d83e-b59a-4a9b-98b1-66cadd628db2": {},
				"84ec0d9f-4731-4ced-ac6d-475a0e76318d": {},
				"e30b99e3-34ba-4025-879b-83e284cafa29": {},
				"77acb9fc-7c6f-4820-8648-a8461a2ce1c2": {},
				"a9e25bdd-4d6e-4bd5-bdeb-35323ef57204": {},
				"8530fdc8-b126-4f92-9873-645a79eed58b": {},
				"51d7d3ee-32d5-497d-b421-6532db51d8fa": {},
				"b9d2c522-416d-4a74-b9d7-e10586f249cc": {},
				"4fbff7f3-a212-4aed-9e24-889993e01365": {},
				"974c19ae-5d94-4740-979e-b6f4095f48fc": {},
				"1526260e-c5ed-4e6e-8b56-ae53671c7b00": {},
				"ac07f35e-8cdb-474e-8e36-573ced97c8db": {},
				"cf47a5e1-62e9-4a99-8f8c-3bdfc03832c3": {},
				"76d3a133-70a1-440c-a91b-0dbc68e546a3": {},
				"3a1f4ce4-759f-4070-a88d-2f1d9a2a8c10": {},
				"46576732-8c82-4350-8d7c-1aa09b1d69ab": {},
				"12ee73c2-7ea4-4a43-acbe-249180aaa334": {},
				"8143130e-313d-4626-91c0-c1d678a52ce2": {},
				"001e75f2-1936-4a60-8c0b-0aa32872d731": {},
				"5feecace-1d34-479e-b4d5-41673b3d55ff": {},
				"ec1fc9d5-9b5b-4d80-9f31-41bcbb1ce488": {},
				"e692b5df-ce56-4188-aa73-9a7102cb46b9": {},
				"31947f1b-5b5d-452e-8ce9-928ce8300abe": {},
				"914dd7d8-8a44-4a6a-9f5b-02ec967fdde2": {},
				"87f874b9-787e-40b7-909a-b9876c39f6f9": {},
				"c092e490-d102-44b7-8752-22d09cd4a38a": {},
				"4e138a46-e9eb-4493-9a53-0024fa5c9e60": {},
				"f7498f58-b93c-4fe7-b3ce-01ab539e8eae": {},
				"bfdb0e07-8c5c-4de9-b6db-30dfd92af61c": {},
				"8b4db318-4fd7-4984-94dd-c2a9994e83ad": {},
				"53265c90-3d49-4efc-b860-6e3018461c2c": {},
				"a863cab6-2a3c-4ee8-b96c-f1fcbbc0720c": {},
				"4c177f1f-60b1-4f40-bce8-de5d41b21aa0": {},
				"891899b6-4932-45d9-abfb-9442d50db384": {},
				"7cbda33c-604d-458a-8b97-be4b77d2e3b5": {},
				"04348b5d-416a-488f-9aa6-a6b966ed4804": {},
				"091e480d-c9b6-4f92-adfa-0b83ce83b0ee": {},
				"b7c9201c-3c28-4cb8-b77c-226b5e6c1235": {},
				"9cbd7ca6-ccdb-4d6f-a315-0ef406d8b5c2": {},
				"c1713052-54a4-4e52-a624-1b87e8004d14": {},
				"bd18db95-8cad-496d-8797-6fcad86f0510": {},
				"3c1d931e-001b-42cc-9dc7-73de008abc39": {},
				"bf6762c5-259b-4f8c-8bea-c0e0565adcb1": {}
			}
		},
		"2320e8ef-b60a-4bc2-9c79-0afcb49c5aa8": {
			"classDefinition": "com.sap.bpm.wfs.ui.StartEventSymbol",
			"x": -806,
			"y": -374,
			"width": 32,
			"height": 32,
			"object": "48f6c819-c58b-40cd-b6fa-fbb7cfc4fa22"
		},
		"9fc0ac8f-d777-4e05-ae63-77583b88499c": {
			"classDefinition": "com.sap.bpm.wfs.ui.ScriptTaskSymbol",
			"x": 1140,
			"y": -209,
			"width": 100,
			"height": 60,
			"object": "2d671ca7-9855-45fa-b6c6-d262b9c56d5d"
		},
		"474a3823-55cc-4979-ad18-117ff977a921": {
			"classDefinition": "com.sap.bpm.wfs.ui.ServiceTaskSymbol",
			"x": -728,
			"y": -383,
			"width": 100,
			"height": 60,
			"object": "d50a74b8-e720-44c6-8af0-bc18810189ef"
		},
		"5d4945b0-4ec4-4f17-8db0-c92951fc1744": {
			"classDefinition": "com.sap.bpm.wfs.ui.ScriptTaskSymbol",
			"x": -580,
			"y": -383,
			"width": 100,
			"height": 60,
			"object": "788bfa83-4921-4f83-aa27-d5eb4c254e19"
		},
		"46c39ba6-9d71-4b3b-a09f-2971b7ce61e3": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "-678,-353 -539,-353",
			"sourceSymbol": "474a3823-55cc-4979-ad18-117ff977a921",
			"targetSymbol": "5d4945b0-4ec4-4f17-8db0-c92951fc1744",
			"object": "80212024-1513-4104-bce3-d66c09bba86b"
		},
		"f429d83e-b59a-4a9b-98b1-66cadd628db2": {
			"classDefinition": "com.sap.bpm.wfs.ui.ExclusiveGatewaySymbol",
			"x": -445,
			"y": -374,
			"object": "3d23f5ee-0abc-4900-9680-94d1ab6e03d2"
		},
		"84ec0d9f-4731-4ced-ac6d-475a0e76318d": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "-790,-356.5 -686,-356.5",
			"sourceSymbol": "2320e8ef-b60a-4bc2-9c79-0afcb49c5aa8",
			"targetSymbol": "474a3823-55cc-4979-ad18-117ff977a921",
			"object": "47a72021-7a6c-42de-be79-98b8e2f35f9b"
		},
		"e30b99e3-34ba-4025-879b-83e284cafa29": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "-530,-351 -426,-351",
			"sourceSymbol": "5d4945b0-4ec4-4f17-8db0-c92951fc1744",
			"targetSymbol": "f429d83e-b59a-4a9b-98b1-66cadd628db2",
			"object": "897f5a46-91a7-45fb-a6c0-447740bdf2b0"
		},
		"77acb9fc-7c6f-4820-8648-a8461a2ce1c2": {
			"classDefinition": "com.sap.bpm.wfs.ui.ScriptTaskSymbol",
			"x": -130,
			"y": -383,
			"width": 100,
			"height": 60,
			"object": "f72a4e11-abf1-4298-93c6-2a4406348868"
		},
		"a9e25bdd-4d6e-4bd5-bdeb-35323ef57204": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "-424,-350 -250,-350",
			"sourceSymbol": "f429d83e-b59a-4a9b-98b1-66cadd628db2",
			"targetSymbol": "bfdb0e07-8c5c-4de9-b6db-30dfd92af61c",
			"object": "0e3fd2b6-2af9-4181-9f38-95eb71cf8828"
		},
		"8530fdc8-b126-4f92-9873-645a79eed58b": {
			"classDefinition": "com.sap.bpm.wfs.ui.ExclusiveGatewaySymbol",
			"x": 3,
			"y": -374,
			"object": "ac309960-69a2-469f-ae48-0f644aaa6dae"
		},
		"51d7d3ee-32d5-497d-b421-6532db51d8fa": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "-80,-353 17,-353",
			"sourceSymbol": "77acb9fc-7c6f-4820-8648-a8461a2ce1c2",
			"targetSymbol": "8530fdc8-b126-4f92-9873-645a79eed58b",
			"object": "d05ede90-485e-4313-b727-06b16ace909b"
		},
		"b9d2c522-416d-4a74-b9d7-e10586f249cc": {
			"classDefinition": "com.sap.bpm.wfs.ui.ServiceTaskSymbol",
			"x": 98,
			"y": -383,
			"width": 100,
			"height": 60,
			"object": "c2231e70-241f-4647-85de-7f73443dc05d"
		},
		"4fbff7f3-a212-4aed-9e24-889993e01365": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "24,-353 142,-353",
			"sourceSymbol": "8530fdc8-b126-4f92-9873-645a79eed58b",
			"targetSymbol": "b9d2c522-416d-4a74-b9d7-e10586f249cc",
			"object": "5d5da84e-4748-4c55-9a6e-9c3ce9f9380f"
		},
		"974c19ae-5d94-4740-979e-b6f4095f48fc": {
			"classDefinition": "com.sap.bpm.wfs.ui.ExclusiveGatewaySymbol",
			"x": 234,
			"y": -374,
			"object": "b20edbe2-f751-4b44-954e-14b238a3564a"
		},
		"1526260e-c5ed-4e6e-8b56-ae53671c7b00": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "148,-353 255,-353",
			"sourceSymbol": "b9d2c522-416d-4a74-b9d7-e10586f249cc",
			"targetSymbol": "974c19ae-5d94-4740-979e-b6f4095f48fc",
			"object": "fd8b892b-0ce7-4075-a5ec-5022a2ff24a5"
		},
		"ac07f35e-8cdb-474e-8e36-573ced97c8db": {
			"classDefinition": "com.sap.bpm.wfs.ui.ServiceTaskSymbol",
			"x": 334,
			"y": -493,
			"width": 100,
			"height": 60,
			"object": "b5eda418-b619-46b1-9d47-44707370f9bd"
		},
		"cf47a5e1-62e9-4a99-8f8c-3bdfc03832c3": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "255,-353 255,-460.5 384,-460.5",
			"sourceSymbol": "974c19ae-5d94-4740-979e-b6f4095f48fc",
			"targetSymbol": "ac07f35e-8cdb-474e-8e36-573ced97c8db",
			"object": "ad5e5e7a-4a6f-4fa3-a73a-d21c0b983be9"
		},
		"76d3a133-70a1-440c-a91b-0dbc68e546a3": {
			"classDefinition": "com.sap.bpm.wfs.ui.ScriptTaskSymbol",
			"x": 334,
			"y": -383,
			"width": 100,
			"height": 60,
			"object": "658f4c3e-fddb-4b73-bad0-c92fbe82d918"
		},
		"3a1f4ce4-759f-4070-a88d-2f1d9a2a8c10": {
			"classDefinition": "com.sap.bpm.wfs.ui.ServiceTaskSymbol",
			"x": 542,
			"y": -383,
			"width": 100,
			"height": 60,
			"object": "326f9c83-4a26-4114-bb57-dda850a82572"
		},
		"46576732-8c82-4350-8d7c-1aa09b1d69ab": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "384,-353 584,-353",
			"sourceSymbol": "76d3a133-70a1-440c-a91b-0dbc68e546a3",
			"targetSymbol": "3a1f4ce4-759f-4070-a88d-2f1d9a2a8c10",
			"object": "760930ee-d1e0-4974-8869-0f3a54537245"
		},
		"12ee73c2-7ea4-4a43-acbe-249180aaa334": {
			"classDefinition": "com.sap.bpm.wfs.ui.ScriptTaskSymbol",
			"x": 732,
			"y": -383,
			"width": 100,
			"height": 60,
			"object": "8050b184-38ce-4922-9888-7d2eb44dc84c"
		},
		"8143130e-313d-4626-91c0-c1d678a52ce2": {
			"classDefinition": "com.sap.bpm.wfs.ui.UserTaskSymbol",
			"x": 1135,
			"y": -383,
			"width": 100,
			"height": 60,
			"object": "4588f7a6-6080-4eb5-8540-b0b8b6ffad65"
		},
		"001e75f2-1936-4a60-8c0b-0aa32872d731": {
			"classDefinition": "com.sap.bpm.wfs.ui.ExclusiveGatewaySymbol",
			"x": 1169,
			"y": -308,
			"object": "3f896a07-b967-427b-8051-2d15b613452f"
		},
		"5feecace-1d34-479e-b4d5-41673b3d55ff": {
			"classDefinition": "com.sap.bpm.wfs.ui.EndEventSymbol",
			"x": 237.5,
			"y": -96.5,
			"width": 35,
			"height": 35,
			"object": "8535b52f-1d3e-4d8b-a411-e2522faf6c4b"
		},
		"ec1fc9d5-9b5b-4d80-9f31-41bcbb1ce488": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "1191,-285 1191,-177",
			"sourceSymbol": "001e75f2-1936-4a60-8c0b-0aa32872d731",
			"targetSymbol": "9fc0ac8f-d777-4e05-ae63-77583b88499c",
			"object": "22c6e1d9-2e9f-4033-8555-4111bcf368c6"
		},
		"e692b5df-ce56-4188-aa73-9a7102cb46b9": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "1186.5,-353 1186.5,-287",
			"sourceSymbol": "8143130e-313d-4626-91c0-c1d678a52ce2",
			"targetSymbol": "001e75f2-1936-4a60-8c0b-0aa32872d731",
			"object": "59727eb0-2dd8-452c-a389-0d91d7271533"
		},
		"31947f1b-5b5d-452e-8ce9-928ce8300abe": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "1190,-286 -80,-286 -80,-353",
			"sourceSymbol": "001e75f2-1936-4a60-8c0b-0aa32872d731",
			"targetSymbol": "77acb9fc-7c6f-4820-8648-a8461a2ce1c2",
			"object": "05ca719e-2bfb-4bf7-80d4-49a10668038b"
		},
		"914dd7d8-8a44-4a6a-9f5b-02ec967fdde2": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "24,-353 24,-527 1371,-527 1371,-179 1190,-179",
			"sourceSymbol": "8530fdc8-b126-4f92-9873-645a79eed58b",
			"targetSymbol": "9fc0ac8f-d777-4e05-ae63-77583b88499c",
			"object": "5caa7ffe-4dc9-48f9-ae37-39a010a8ba63"
		},
		"87f874b9-787e-40b7-909a-b9876c39f6f9": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "255,-353 391,-353",
			"sourceSymbol": "974c19ae-5d94-4740-979e-b6f4095f48fc",
			"targetSymbol": "76d3a133-70a1-440c-a91b-0dbc68e546a3",
			"object": "7c733ca7-e66d-4374-9c56-5dd67a324d23"
		},
		"c092e490-d102-44b7-8752-22d09cd4a38a": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "384,-463 384,-353",
			"sourceSymbol": "ac07f35e-8cdb-474e-8e36-573ced97c8db",
			"targetSymbol": "76d3a133-70a1-440c-a91b-0dbc68e546a3",
			"object": "a23762b9-a9fa-4368-8db4-e40d0de4442c"
		},
		"4e138a46-e9eb-4493-9a53-0024fa5c9e60": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "592,-353 782,-353",
			"sourceSymbol": "3a1f4ce4-759f-4070-a88d-2f1d9a2a8c10",
			"targetSymbol": "12ee73c2-7ea4-4a43-acbe-249180aaa334",
			"object": "56d591c4-8b20-49dd-9525-602a14972c8a"
		},
		"f7498f58-b93c-4fe7-b3ce-01ab539e8eae": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "-424,-353 -424,-89 -684,-89 -684,-353",
			"sourceSymbol": "f429d83e-b59a-4a9b-98b1-66cadd628db2",
			"targetSymbol": "474a3823-55cc-4979-ad18-117ff977a921",
			"object": "7d8f4936-a189-4a5c-b47f-2d933729b8dc"
		},
		"bfdb0e07-8c5c-4de9-b6db-30dfd92af61c": {
			"classDefinition": "com.sap.bpm.wfs.ui.UserTaskSymbol",
			"x": -293,
			"y": -383,
			"width": 100,
			"height": 60,
			"object": "d877f58a-3dba-4016-a91a-d759f49de893"
		},
		"8b4db318-4fd7-4984-94dd-c2a9994e83ad": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "-243,-353 -243,-286 1190,-286",
			"sourceSymbol": "bfdb0e07-8c5c-4de9-b6db-30dfd92af61c",
			"targetSymbol": "001e75f2-1936-4a60-8c0b-0aa32872d731",
			"object": "93b48090-e6aa-435c-bd5b-78fc0b9eaac7"
		},
		"53265c90-3d49-4efc-b860-6e3018461c2c": {
			"classDefinition": "com.sap.bpm.wfs.ui.ServiceTaskSymbol",
			"x": 1140,
			"y": -109,
			"width": 100,
			"height": 60,
			"object": "2e0590a4-a330-4112-9dd4-de96d57dfbe2"
		},
		"a863cab6-2a3c-4ee8-b96c-f1fcbbc0720c": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "1190,-179 1190,-79",
			"sourceSymbol": "9fc0ac8f-d777-4e05-ae63-77583b88499c",
			"targetSymbol": "53265c90-3d49-4efc-b860-6e3018461c2c",
			"object": "cc83004a-f187-420f-a6d0-2abbcc993579"
		},
		"4c177f1f-60b1-4f40-bce8-de5d41b21aa0": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "-424,-353 -424,-85.75 255,-85.75",
			"sourceSymbol": "f429d83e-b59a-4a9b-98b1-66cadd628db2",
			"targetSymbol": "5feecace-1d34-479e-b4d5-41673b3d55ff",
			"object": "093c19fc-2174-4d66-82ff-80dd81cd44c6"
		},
		"891899b6-4932-45d9-abfb-9442d50db384": {
			"classDefinition": "com.sap.bpm.wfs.ui.ExclusiveGatewaySymbol",
			"x": 974,
			"y": -374,
			"object": "b01e2dcd-42ae-4f54-8516-767542bd067c"
		},
		"7cbda33c-604d-458a-8b97-be4b77d2e3b5": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "782,-353 995,-353",
			"sourceSymbol": "12ee73c2-7ea4-4a43-acbe-249180aaa334",
			"targetSymbol": "891899b6-4932-45d9-abfb-9442d50db384",
			"object": "38192c04-7775-461a-838c-897be035bb15"
		},
		"04348b5d-416a-488f-9aa6-a6b966ed4804": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "995,-353 1179,-353",
			"sourceSymbol": "891899b6-4932-45d9-abfb-9442d50db384",
			"targetSymbol": "8143130e-313d-4626-91c0-c1d678a52ce2",
			"object": "9d32f7a3-d0ec-4142-a041-761a3d8fa123"
		},
		"091e480d-c9b6-4f92-adfa-0b83ce83b0ee": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "995,-353 995,-529 -80,-529 -80,-353",
			"sourceSymbol": "891899b6-4932-45d9-abfb-9442d50db384",
			"targetSymbol": "77acb9fc-7c6f-4820-8648-a8461a2ce1c2",
			"object": "574f9718-05c4-4878-872c-845deaf455d0"
		},
		"b7c9201c-3c28-4cb8-b77c-226b5e6c1235": {
			"classDefinition": "com.sap.bpm.wfs.ui.ExclusiveGatewaySymbol",
			"x": 974,
			"y": -100,
			"object": "04e507a2-29d1-49e5-a345-326b691b4fa0"
		},
		"9cbd7ca6-ccdb-4d6f-a315-0ef406d8b5c2": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "1190,-79 1000,-79",
			"sourceSymbol": "53265c90-3d49-4efc-b860-6e3018461c2c",
			"targetSymbol": "b7c9201c-3c28-4cb8-b77c-226b5e6c1235",
			"object": "d25d26d6-456c-405a-8f3e-a9a99e28b9b0"
		},
		"c1713052-54a4-4e52-a624-1b87e8004d14": {
			"classDefinition": "com.sap.bpm.wfs.ui.ServiceTaskSymbol",
			"x": 610,
			"y": -109,
			"width": 100,
			"height": 60,
			"object": "07787107-f3a3-47ff-8a13-f2977cb37c00"
		},
		"bd18db95-8cad-496d-8797-6fcad86f0510": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "974,-78 974,245 710.5,245 710.5,-78",
			"sourceSymbol": "b7c9201c-3c28-4cb8-b77c-226b5e6c1235",
			"targetSymbol": "c1713052-54a4-4e52-a624-1b87e8004d14",
			"object": "579746df-3599-4cf2-8273-5b80f212be73"
		},
		"3c1d931e-001b-42cc-9dc7-73de008abc39": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "995,-79 995,75 256,75 256,-79",
			"sourceSymbol": "b7c9201c-3c28-4cb8-b77c-226b5e6c1235",
			"targetSymbol": "5feecace-1d34-479e-b4d5-41673b3d55ff",
			"object": "e9f11389-7367-4477-831b-0bd23cb28bfb"
		},
		"bf6762c5-259b-4f8c-8bea-c0e0565adcb1": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "660,-79 255,-79",
			"sourceSymbol": "c1713052-54a4-4e52-a624-1b87e8004d14",
			"targetSymbol": "5feecace-1d34-479e-b4d5-41673b3d55ff",
			"object": "bfc5f664-0ab0-4e88-897e-db8c692956ea"
		},
		"7e169a07-c53b-4d49-8881-6155b1c226a3": {
			"classDefinition": "com.sap.bpm.wfs.LastIDs",
			"timereventdefinition": 2,
			"hubapireference": 5,
			"sequenceflow": 189,
			"startevent": 1,
			"boundarytimerevent": 2,
			"endevent": 3,
			"usertask": 10,
			"servicetask": 26,
			"scripttask": 29,
			"exclusivegateway": 23,
			"parallelgateway": 1
		}
	}
}