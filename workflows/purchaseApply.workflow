{
	"contents": {
		"3bdc120f-8771-4d03-be61-307b71f3b6f6": {
			"classDefinition": "com.sap.bpm.wfs.Model",
			"id": "purchaseapply",
			"subject": "采购申请${context.PurchaseRequistionID}",
			"name": "purchaseApply",
			"lastIds": "5d7b79c6-6ee0-4b9a-9c8a-e34e899c7344",
			"events": {
				"053614a0-e7df-430f-80ee-8ba4485865eb": {
					"name": "提交"
				},
				"0c573be3-ad42-4e87-9656-486ef3d71f80": {
					"name": "结束"
				}
			},
			"activities": {
				"07b4ad9c-4af1-4d1c-826f-51748b6e4475": {
					"name": "获取员工表数据"
				},
				"eac6f6cd-3d3b-4c40-8aad-2cbc315c8301": {
					"name": "is approved?"
				},
				"cdad8103-3d01-47ed-bb06-0b8903b690ff": {
					"name": "整理审批条件"
				},
				"37883174-6bfb-4965-9583-d738044c8a38": {
					"name": "分支"
				},
				"9fa055b1-cdb9-4109-89a4-4257bf7a964f": {
					"name": "获取采购申请单号"
				},
				"76f5e9ae-1397-476a-bd78-2fca325e9fbd": {
					"name": "整理采购申请单号"
				},
				"244ddde0-0811-4c70-be40-48f1ec15c0b8": {
					"name": "判断"
				},
				"03bb501b-ea27-40ed-8277-b42e89cd7a30": {
					"name": "整理采购申请行"
				},
				"8ae5afb0-14de-45a3-830c-c619b34663bb": {
					"name": "审批"
				},
				"95321fe8-4789-490a-a5ed-805fb962316d": {
					"name": "获取审批人"
				},
				"4e808e2e-fb20-45d5-90ee-a704ec761f84": {
					"name": "判断"
				},
				"e8f9d8b4-ca63-4474-8a21-6abdb105d378": {
					"name": "获取当前日期"
				},
				"ee83d4a5-6d70-440d-ad56-65e7b667e764": {
					"name": "获取代理人"
				},
				"ac9024b0-4a97-46c2-9aa6-7245d95cb244": {
					"name": "整理代理人"
				},
				"53c54d56-1876-471e-9c88-de6b37904fba": {
					"name": "发起人审批"
				},
				"3c1a3fe8-0138-4f6c-b917-b6bd8428334b": {
					"name": "is self?"
				},
				"6bfd2f62-56cd-4f4a-b44d-bb0c47fb1f52": {
					"name": "删掉审批记录"
				},
				"d7d57303-5f1e-472a-aebb-073c048b89b8": {
					"name": "获取UUID"
				},
				"f9b936d2-7767-4a7e-aaf5-8e8f12dd7e49": {
					"name": "设置UUID"
				},
				"85788f57-fafa-4bd4-a3f3-2a97fcd80b16": {
					"name": "delete?"
				}
			},
			"sequenceFlows": {
				"67b899aa-7fe1-42db-b594-c4f9d2651b8c": {
					"name": "f"
				},
				"5053f8e3-3621-46d3-b6af-7a5aa0eabc24": {
					"name": "SequenceFlow35"
				},
				"fb37372e-552d-4a95-af3b-d7cf94104bfd": {
					"name": "SequenceFlow36"
				},
				"9f17a6fe-5fba-4f04-a53a-f5a0d21de69e": {
					"name": "SequenceFlow39"
				},
				"b245c5aa-070b-485a-9fb8-7e2c9b2c7370": {
					"name": "employee"
				},
				"8f76e6c5-5a1b-442f-89dc-ca1cfcc2d3da": {
					"name": "SequenceFlow70"
				},
				"16e84642-c231-49a1-8077-03f4b37dc182": {
					"name": "no"
				},
				"590d192b-3f21-44c8-b98d-329666cccfa0": {
					"name": "yes"
				},
				"16932d61-e281-42e1-ab78-49cf02d4ab51": {
					"name": "SequenceFlow75"
				},
				"a73d8151-f7bd-487a-bbcc-a19935f2f7c2": {
					"name": "c"
				},
				"7d6c1c46-f793-4ec9-a281-892459d244c3": {
					"name": "end"
				},
				"7406127c-3a6f-4d2a-8535-305fd1319687": {
					"name": "SequenceFlow80"
				},
				"7e4a7cfa-6eea-4154-b255-f55409e50c8d": {
					"name": "SequenceFlow82"
				},
				"93107f02-064e-4821-9144-7e4c76b2cd19": {
					"name": "SequenceFlow84"
				},
				"d29a6d94-5c6d-4035-8364-b62a5d5520d8": {
					"name": "node"
				},
				"4123c1dc-553e-4dba-9c2c-4f21c80623b1": {
					"name": "SequenceFlow93"
				},
				"613eff0f-b81d-4e01-a3e8-0eb9844a9685": {
					"name": "SequenceFlow94"
				},
				"cd6f8c12-d77d-474f-8118-363840d9f3ea": {
					"name": "SequenceFlow100"
				},
				"405eff4e-0c18-40c4-8871-7676a8788e60": {
					"name": "t"
				},
				"ec848e6e-03a2-4ad4-9449-9774dc4944df": {
					"name": "f"
				},
				"59badcd4-055c-41da-9fa2-85fd3ecc9152": {
					"name": "SequenceFlow106"
				},
				"d89afe34-784b-4fb9-b384-31f60f4968f1": {
					"name": "end"
				},
				"c931076d-78b3-40a2-8ac2-bcd9ed919fc5": {
					"name": "c"
				},
				"828551ff-c78e-499e-ac4f-e09e1fcfeddd": {
					"name": "SequenceFlow110"
				},
				"0014beb8-61cf-4b22-a089-d84781a1caf3": {
					"name": "SequenceFlow112"
				},
				"07bcd743-36c3-4694-b7c5-d774a5fe8748": {
					"name": "yes"
				},
				"5a1e2b12-38f7-4a37-b217-d6aa0144b5ac": {
					"name": "SequenceFlow114"
				},
				"2947c420-218f-487b-91bc-a5be5ac9a478": {
					"name": "no"
				}
			},
			"diagrams": {
				"a907b369-704d-4ac4-87d1-409323dc25b1": {}
			}
		},
		"053614a0-e7df-430f-80ee-8ba4485865eb": {
			"classDefinition": "com.sap.bpm.wfs.StartEvent",
			"id": "startevent1",
			"name": "提交"
		},
		"0c573be3-ad42-4e87-9656-486ef3d71f80": {
			"classDefinition": "com.sap.bpm.wfs.EndEvent",
			"id": "endevent1",
			"name": "结束"
		},
		"07b4ad9c-4af1-4d1c-826f-51748b6e4475": {
			"classDefinition": "com.sap.bpm.wfs.ServiceTask",
			"destination": "APLEXHANAWORKFLOW",
			"path": "/EMPLOYEES.xsodata/EMPLOYEES('${context.Employee}')",
			"httpMethod": "GET",
			"responseVariable": "${context.Approver}",
			"id": "servicetask1",
			"name": "获取员工表数据"
		},
		"eac6f6cd-3d3b-4c40-8aad-2cbc315c8301": {
			"classDefinition": "com.sap.bpm.wfs.ExclusiveGateway",
			"id": "exclusivegateway2",
			"name": "is approved?",
			"default": "590d192b-3f21-44c8-b98d-329666cccfa0"
		},
		"cdad8103-3d01-47ed-bb06-0b8903b690ff": {
			"classDefinition": "com.sap.bpm.wfs.ScriptTask",
			"reference": "/scripts/purchaseApply/approvalCondition.js",
			"id": "scripttask3",
			"name": "整理审批条件"
		},
		"37883174-6bfb-4965-9583-d738044c8a38": {
			"classDefinition": "com.sap.bpm.wfs.ExclusiveGateway",
			"id": "exclusivegateway5",
			"name": "分支",
			"default": "d29a6d94-5c6d-4035-8364-b62a5d5520d8"
		},
		"9fa055b1-cdb9-4109-89a4-4257bf7a964f": {
			"classDefinition": "com.sap.bpm.wfs.ServiceTask",
			"destination": "S4HANACLOUD_BASIC",
			"path": "/sap/opu/odata/sap/YY1_PURCHASEREQ_ITEMS_CDS/YY1_PURCHASEREQ_ITEMS?$filter=YY1_PRID_PRI eq '${context.PurchaseRequistionID}'",
			"httpMethod": "GET",
			"responseVariable": "${context.PurchaseHead}",
			"id": "servicetask5",
			"name": "获取采购申请单号"
		},
		"76f5e9ae-1397-476a-bd78-2fca325e9fbd": {
			"classDefinition": "com.sap.bpm.wfs.ScriptTask",
			"reference": "/scripts/purchaseApply/PurchaseRequistion.js",
			"id": "scripttask5",
			"name": "整理采购申请单号"
		},
		"244ddde0-0811-4c70-be40-48f1ec15c0b8": {
			"classDefinition": "com.sap.bpm.wfs.ExclusiveGateway",
			"id": "exclusivegateway6",
			"name": "判断",
			"default": "c931076d-78b3-40a2-8ac2-bcd9ed919fc5"
		},
		"03bb501b-ea27-40ed-8277-b42e89cd7a30": {
			"classDefinition": "com.sap.bpm.wfs.ScriptTask",
			"reference": "/scripts/purchaseApply/PurchaseList.js",
			"id": "scripttask6",
			"name": "整理采购申请行"
		},
		"8ae5afb0-14de-45a3-830c-c619b34663bb": {
			"classDefinition": "com.sap.bpm.wfs.UserTask",
			"subject": "采购申请创建审批${context.PurchaseHead.PurchaseRequisition}",
			"priority": "MEDIUM",
			"isHiddenInLogForParticipant": false,
			"userInterface": "sapui5://html5apps/purchasewf/applyApprove/webapp/applyApprove",
			"recipientUsers": "${context.Approver}",
			"id": "usertask6",
			"name": "审批"
		},
		"95321fe8-4789-490a-a5ed-805fb962316d": {
			"classDefinition": "com.sap.bpm.wfs.ServiceTask",
			"destination": "APLEXHANAWORKFLOW",
			"path": "/WORKFLOWNODE.xsodata/WORKFLOWNODE?$filter=STARTCOMPANY eq ${context.CompanyCode} and FLOWID eq 'workflow_purchaseapply' and NODEID eq '${context.NextApprovalNode}'",
			"httpMethod": "GET",
			"responseVariable": "${context.ApprovalNode}",
			"id": "servicetask7",
			"name": "获取审批人"
		},
		"4e808e2e-fb20-45d5-90ee-a704ec761f84": {
			"classDefinition": "com.sap.bpm.wfs.ExclusiveGateway",
			"id": "exclusivegateway9",
			"name": "判断",
			"default": "a73d8151-f7bd-487a-bbcc-a19935f2f7c2"
		},
		"e8f9d8b4-ca63-4474-8a21-6abdb105d378": {
			"classDefinition": "com.sap.bpm.wfs.ScriptTask",
			"reference": "/scripts/purchaseApply/currentDate.js",
			"id": "scripttask8",
			"name": "获取当前日期"
		},
		"ee83d4a5-6d70-440d-ad56-65e7b667e764": {
			"classDefinition": "com.sap.bpm.wfs.ServiceTask",
			"destination": "APLEXHANAWORKFLOW",
			"path": "/AGENT.xsodata/AGENT?$filter=FLOWID eq 'puchaseapply' and SDATE le '${context.currentDate}' and EDATE ge '${context.currentDate}'",
			"httpMethod": "GET",
			"responseVariable": "${context.AgentNode}",
			"id": "servicetask9",
			"name": "获取代理人"
		},
		"ac9024b0-4a97-46c2-9aa6-7245d95cb244": {
			"classDefinition": "com.sap.bpm.wfs.ScriptTask",
			"reference": "/scripts/purchaseApply/agent.js",
			"id": "scripttask9",
			"name": "整理代理人"
		},
		"53c54d56-1876-471e-9c88-de6b37904fba": {
			"classDefinition": "com.sap.bpm.wfs.UserTask",
			"subject": "采购申请创建审批${context.PurchaseHead.PurchaseRequisition}",
			"priority": "MEDIUM",
			"isHiddenInLogForParticipant": false,
			"userInterface": "sapui5://html5apps/purchasewf/applyApprove/webapp/applyApprove",
			"recipientUsers": "${context.Creater}",
			"id": "usertask7",
			"name": "发起人审批"
		},
		"3c1a3fe8-0138-4f6c-b917-b6bd8428334b": {
			"classDefinition": "com.sap.bpm.wfs.ExclusiveGateway",
			"id": "exclusivegateway12",
			"name": "is self?",
			"default": "405eff4e-0c18-40c4-8871-7676a8788e60"
		},
		"67b899aa-7fe1-42db-b594-c4f9d2651b8c": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"condition": "${context.bContinue==\"1\"}",
			"id": "sequenceflow33",
			"name": "f",
			"sourceRef": "244ddde0-0811-4c70-be40-48f1ec15c0b8",
			"targetRef": "9fa055b1-cdb9-4109-89a4-4257bf7a964f"
		},
		"5053f8e3-3621-46d3-b6af-7a5aa0eabc24": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow35",
			"name": "SequenceFlow35",
			"sourceRef": "053614a0-e7df-430f-80ee-8ba4485865eb",
			"targetRef": "9fa055b1-cdb9-4109-89a4-4257bf7a964f"
		},
		"fb37372e-552d-4a95-af3b-d7cf94104bfd": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow36",
			"name": "SequenceFlow36",
			"sourceRef": "9fa055b1-cdb9-4109-89a4-4257bf7a964f",
			"targetRef": "76f5e9ae-1397-476a-bd78-2fca325e9fbd"
		},
		"9f17a6fe-5fba-4f04-a53a-f5a0d21de69e": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow39",
			"name": "SequenceFlow39",
			"sourceRef": "76f5e9ae-1397-476a-bd78-2fca325e9fbd",
			"targetRef": "244ddde0-0811-4c70-be40-48f1ec15c0b8"
		},
		"b245c5aa-070b-485a-9fb8-7e2c9b2c7370": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"condition": "${context.ApprovalNode.d.results[0].FLAG==\"A\"||context.ApprovalNode.d.results[0].FLAG==\"B\"}",
			"id": "sequenceflow64",
			"name": "employee",
			"sourceRef": "37883174-6bfb-4965-9583-d738044c8a38",
			"targetRef": "07b4ad9c-4af1-4d1c-826f-51748b6e4475"
		},
		"8f76e6c5-5a1b-442f-89dc-ca1cfcc2d3da": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow70",
			"name": "SequenceFlow70",
			"sourceRef": "8ae5afb0-14de-45a3-830c-c619b34663bb",
			"targetRef": "eac6f6cd-3d3b-4c40-8aad-2cbc315c8301"
		},
		"16e84642-c231-49a1-8077-03f4b37dc182": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"condition": "${context.approved==false}",
			"id": "sequenceflow73",
			"name": "no",
			"sourceRef": "eac6f6cd-3d3b-4c40-8aad-2cbc315c8301",
			"targetRef": "d7d57303-5f1e-472a-aebb-073c048b89b8"
		},
		"590d192b-3f21-44c8-b98d-329666cccfa0": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow74",
			"name": "yes",
			"sourceRef": "eac6f6cd-3d3b-4c40-8aad-2cbc315c8301",
			"targetRef": "cdad8103-3d01-47ed-bb06-0b8903b690ff"
		},
		"16932d61-e281-42e1-ab78-49cf02d4ab51": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow75",
			"name": "SequenceFlow75",
			"sourceRef": "cdad8103-3d01-47ed-bb06-0b8903b690ff",
			"targetRef": "4e808e2e-fb20-45d5-90ee-a704ec761f84"
		},
		"a73d8151-f7bd-487a-bbcc-a19935f2f7c2": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow76",
			"name": "c",
			"sourceRef": "4e808e2e-fb20-45d5-90ee-a704ec761f84",
			"targetRef": "95321fe8-4789-490a-a5ed-805fb962316d"
		},
		"7d6c1c46-f793-4ec9-a281-892459d244c3": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"condition": "${context.NextApprovalNode==\"0000\"}",
			"id": "sequenceflow77",
			"name": "end",
			"sourceRef": "4e808e2e-fb20-45d5-90ee-a704ec761f84",
			"targetRef": "d7d57303-5f1e-472a-aebb-073c048b89b8"
		},
		"7406127c-3a6f-4d2a-8535-305fd1319687": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow80",
			"name": "SequenceFlow80",
			"sourceRef": "ac9024b0-4a97-46c2-9aa6-7245d95cb244",
			"targetRef": "8ae5afb0-14de-45a3-830c-c619b34663bb"
		},
		"7e4a7cfa-6eea-4154-b255-f55409e50c8d": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow82",
			"name": "SequenceFlow82",
			"sourceRef": "e8f9d8b4-ca63-4474-8a21-6abdb105d378",
			"targetRef": "ee83d4a5-6d70-440d-ad56-65e7b667e764"
		},
		"93107f02-064e-4821-9144-7e4c76b2cd19": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow84",
			"name": "SequenceFlow84",
			"sourceRef": "95321fe8-4789-490a-a5ed-805fb962316d",
			"targetRef": "37883174-6bfb-4965-9583-d738044c8a38"
		},
		"d29a6d94-5c6d-4035-8364-b62a5d5520d8": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow85",
			"name": "node",
			"sourceRef": "37883174-6bfb-4965-9583-d738044c8a38",
			"targetRef": "e8f9d8b4-ca63-4474-8a21-6abdb105d378"
		},
		"4123c1dc-553e-4dba-9c2c-4f21c80623b1": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow93",
			"name": "SequenceFlow93",
			"sourceRef": "07b4ad9c-4af1-4d1c-826f-51748b6e4475",
			"targetRef": "e8f9d8b4-ca63-4474-8a21-6abdb105d378"
		},
		"613eff0f-b81d-4e01-a3e8-0eb9844a9685": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow94",
			"name": "SequenceFlow94",
			"sourceRef": "ee83d4a5-6d70-440d-ad56-65e7b667e764",
			"targetRef": "ac9024b0-4a97-46c2-9aa6-7245d95cb244"
		},
		"cd6f8c12-d77d-474f-8118-363840d9f3ea": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow100",
			"name": "SequenceFlow100",
			"sourceRef": "53c54d56-1876-471e-9c88-de6b37904fba",
			"targetRef": "eac6f6cd-3d3b-4c40-8aad-2cbc315c8301"
		},
		"405eff4e-0c18-40c4-8871-7676a8788e60": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow101",
			"name": "t",
			"sourceRef": "3c1a3fe8-0138-4f6c-b917-b6bd8428334b",
			"targetRef": "53c54d56-1876-471e-9c88-de6b37904fba"
		},
		"ec848e6e-03a2-4ad4-9449-9774dc4944df": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"condition": "${context.ApproveSelf==false}",
			"id": "sequenceflow103",
			"name": "f",
			"sourceRef": "3c1a3fe8-0138-4f6c-b917-b6bd8428334b",
			"targetRef": "cdad8103-3d01-47ed-bb06-0b8903b690ff"
		},
		"59badcd4-055c-41da-9fa2-85fd3ecc9152": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow106",
			"name": "SequenceFlow106",
			"sourceRef": "03bb501b-ea27-40ed-8277-b42e89cd7a30",
			"targetRef": "3c1a3fe8-0138-4f6c-b917-b6bd8428334b"
		},
		"d89afe34-784b-4fb9-b384-31f60f4968f1": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"condition": "${context.bContinue==\"2\"}",
			"id": "sequenceflow107",
			"name": "end",
			"sourceRef": "244ddde0-0811-4c70-be40-48f1ec15c0b8",
			"targetRef": "d7d57303-5f1e-472a-aebb-073c048b89b8"
		},
		"c931076d-78b3-40a2-8ac2-bcd9ed919fc5": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow108",
			"name": "c",
			"sourceRef": "244ddde0-0811-4c70-be40-48f1ec15c0b8",
			"targetRef": "03bb501b-ea27-40ed-8277-b42e89cd7a30"
		},
		"a907b369-704d-4ac4-87d1-409323dc25b1": {
			"classDefinition": "com.sap.bpm.wfs.ui.Diagram",
			"symbols": {
				"05c89a71-c5fb-41f1-910b-3c754bcc3938": {},
				"42f10061-afac-4c18-901f-91adbab1b2df": {},
				"b4cd7a05-569c-4562-9927-a7de8b7b9d82": {},
				"6f513b02-7309-420e-859a-f71ebd29c229": {},
				"a2c83bc7-dbd7-459e-94d3-ccef6f1edbdd": {},
				"71554a76-5882-4087-8524-86bd43383b6f": {},
				"2a3b5f1c-b133-4d77-8aa0-8ea2e015d08c": {},
				"ac890d39-c17e-4e8c-a50f-1f4cfc9512a5": {},
				"482334bf-ab8e-439c-ba3b-f150e7c2b4f9": {},
				"fc3d4836-267e-403f-bba3-d57b0c45ae76": {},
				"630028c4-83fb-48ab-81bd-98fab434913d": {},
				"eb88ca7d-4161-4706-acd9-85fce8534272": {},
				"5ca509c4-fca2-46a0-99ec-effc8ea43d32": {},
				"9006533d-9010-4d75-add1-1a7319da8129": {},
				"791ff637-5df5-4ed1-a76e-8de699526fe2": {},
				"71d835fb-3a44-4d4a-b378-31f943e8342e": {},
				"a8c82af8-59ae-4c01-9f08-6f7622e79735": {},
				"1886a944-a614-4693-b1eb-82727b1d7bf8": {},
				"07abc2d2-6659-4c66-916a-d9cf6eb9824c": {},
				"8a5b8eb8-c1c3-486d-ae68-03ec1b988ad1": {},
				"50abf339-874b-4f00-97ce-12e6373cadbd": {},
				"879ebb1e-a287-4d90-a07d-6602d92435db": {},
				"c93a3b86-fe01-429f-84aa-14c866f2743a": {},
				"26733d86-b8f0-4200-9d75-497f0000335a": {},
				"5ba5a3fa-a8a6-4d48-a006-07613b5c0bcf": {},
				"ce4b6e9b-a740-4909-b31b-6e5be16c5cad": {},
				"42c029cc-1d86-4dd5-8d55-a519b9cbaad5": {},
				"52322da3-be10-42d2-97fd-58740e43836c": {},
				"24ea299f-06f8-40fa-837b-48f8c56a4adf": {},
				"260c153c-d76b-4e89-88d6-75412eaa1537": {},
				"4dc38983-8aca-4d71-a75e-8b3ce4d4a6de": {},
				"8b79c73f-c0ff-4464-a18f-0087b83b3331": {},
				"a3e1b15e-bab3-429a-8eed-7782a5f57824": {},
				"5cd0d9ab-ea96-486f-959c-ca333a62987d": {},
				"0206ba9a-4a81-4101-86d2-810138f74a07": {},
				"b163b53e-3fbf-4bbb-bce8-61208307dfc7": {},
				"6de0b703-5b89-4834-ab69-a1ef505db250": {},
				"f148d0a5-ee8b-4c32-bd11-a50b533be020": {},
				"5840908d-bdd9-4218-bf13-42b0514d1d90": {},
				"435ce970-bcc1-4505-9cc9-3bd28c368de9": {},
				"8dc2b73c-6574-455b-b0e0-d3c36b13fce9": {},
				"c9b8d3d8-30eb-4e71-bea3-a3b0fcbe8eec": {},
				"d627f60a-adcd-47df-9034-4c758dd37a62": {},
				"e063fe5e-874f-4838-8186-b7da1c8308c8": {},
				"97133923-5848-4391-ae3d-28fc8aed944e": {},
				"d98556c4-2fc1-484c-bd83-7dd1ac3cfe78": {},
				"8637b800-f383-44c3-8a64-ac4c96aa0ae3": {},
				"f9b09e45-609e-49af-9577-668497faef23": {},
				"ce00b8f7-e9e9-4f9a-a072-5f831f7dd835": {},
				"861981fe-0f4e-46e0-aae3-e458c8446cda": {}
			}
		},
		"05c89a71-c5fb-41f1-910b-3c754bcc3938": {
			"classDefinition": "com.sap.bpm.wfs.ui.StartEventSymbol",
			"x": -182,
			"y": -175,
			"width": 32,
			"height": 32,
			"object": "053614a0-e7df-430f-80ee-8ba4485865eb"
		},
		"42f10061-afac-4c18-901f-91adbab1b2df": {
			"classDefinition": "com.sap.bpm.wfs.ui.EndEventSymbol",
			"x": 884,
			"y": 578,
			"width": 35,
			"height": 35,
			"object": "0c573be3-ad42-4e87-9656-486ef3d71f80"
		},
		"b4cd7a05-569c-4562-9927-a7de8b7b9d82": {
			"classDefinition": "com.sap.bpm.wfs.ui.ServiceTaskSymbol",
			"x": 1251,
			"y": -269,
			"width": 100,
			"height": 60,
			"object": "07b4ad9c-4af1-4d1c-826f-51748b6e4475"
		},
		"6f513b02-7309-420e-859a-f71ebd29c229": {
			"classDefinition": "com.sap.bpm.wfs.ui.ExclusiveGatewaySymbol",
			"x": 1109,
			"y": 138,
			"object": "eac6f6cd-3d3b-4c40-8aad-2cbc315c8301"
		},
		"a2c83bc7-dbd7-459e-94d3-ccef6f1edbdd": {
			"classDefinition": "com.sap.bpm.wfs.ui.ScriptTaskSymbol",
			"x": 764,
			"y": -189,
			"width": 100,
			"height": 60,
			"object": "cdad8103-3d01-47ed-bb06-0b8903b690ff"
		},
		"71554a76-5882-4087-8524-86bd43383b6f": {
			"classDefinition": "com.sap.bpm.wfs.ui.ExclusiveGatewaySymbol",
			"x": 1109,
			"y": -180,
			"object": "37883174-6bfb-4965-9583-d738044c8a38"
		},
		"2a3b5f1c-b133-4d77-8aa0-8ea2e015d08c": {
			"classDefinition": "com.sap.bpm.wfs.ui.ServiceTaskSymbol",
			"x": -91,
			"y": -189,
			"width": 100,
			"height": 60,
			"object": "9fa055b1-cdb9-4109-89a4-4257bf7a964f"
		},
		"ac890d39-c17e-4e8c-a50f-1f4cfc9512a5": {
			"classDefinition": "com.sap.bpm.wfs.ui.ScriptTaskSymbol",
			"x": 50,
			"y": -189,
			"width": 100,
			"height": 60,
			"object": "76f5e9ae-1397-476a-bd78-2fca325e9fbd"
		},
		"482334bf-ab8e-439c-ba3b-f150e7c2b4f9": {
			"classDefinition": "com.sap.bpm.wfs.ui.ExclusiveGatewaySymbol",
			"x": 188,
			"y": -180,
			"object": "244ddde0-0811-4c70-be40-48f1ec15c0b8"
		},
		"fc3d4836-267e-403f-bba3-d57b0c45ae76": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "209,-159 209,-46 -45,-46 -45,-159",
			"sourceSymbol": "482334bf-ab8e-439c-ba3b-f150e7c2b4f9",
			"targetSymbol": "2a3b5f1c-b133-4d77-8aa0-8ea2e015d08c",
			"object": "67b899aa-7fe1-42db-b594-c4f9d2651b8c"
		},
		"630028c4-83fb-48ab-81bd-98fab434913d": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "-166,-159 -41,-159",
			"sourceSymbol": "05c89a71-c5fb-41f1-910b-3c754bcc3938",
			"targetSymbol": "2a3b5f1c-b133-4d77-8aa0-8ea2e015d08c",
			"object": "5053f8e3-3621-46d3-b6af-7a5aa0eabc24"
		},
		"eb88ca7d-4161-4706-acd9-85fce8534272": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "-41,-159 105,-159",
			"sourceSymbol": "2a3b5f1c-b133-4d77-8aa0-8ea2e015d08c",
			"targetSymbol": "ac890d39-c17e-4e8c-a50f-1f4cfc9512a5",
			"object": "fb37372e-552d-4a95-af3b-d7cf94104bfd"
		},
		"5ca509c4-fca2-46a0-99ec-effc8ea43d32": {
			"classDefinition": "com.sap.bpm.wfs.ui.ScriptTaskSymbol",
			"x": 403,
			"y": -189,
			"width": 100,
			"height": 60,
			"object": "03bb501b-ea27-40ed-8277-b42e89cd7a30"
		},
		"9006533d-9010-4d75-add1-1a7319da8129": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "100,-161 209,-161",
			"sourceSymbol": "ac890d39-c17e-4e8c-a50f-1f4cfc9512a5",
			"targetSymbol": "482334bf-ab8e-439c-ba3b-f150e7c2b4f9",
			"object": "9f17a6fe-5fba-4f04-a53a-f5a0d21de69e"
		},
		"791ff637-5df5-4ed1-a76e-8de699526fe2": {
			"classDefinition": "com.sap.bpm.wfs.ui.UserTaskSymbol",
			"x": 1251,
			"y": 129,
			"width": 100,
			"height": 60,
			"object": "8ae5afb0-14de-45a3-830c-c619b34663bb"
		},
		"71d835fb-3a44-4d4a-b378-31f943e8342e": {
			"classDefinition": "com.sap.bpm.wfs.ui.ServiceTaskSymbol",
			"x": 966,
			"y": -192,
			"width": 100,
			"height": 60,
			"object": "95321fe8-4789-490a-a5ed-805fb962316d"
		},
		"a8c82af8-59ae-4c01-9f08-6f7622e79735": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "1130,-159 1130,-238.125 1301,-238.125",
			"sourceSymbol": "71554a76-5882-4087-8524-86bd43383b6f",
			"targetSymbol": "b4cd7a05-569c-4562-9927-a7de8b7b9d82",
			"object": "b245c5aa-070b-485a-9fb8-7e2c9b2c7370"
		},
		"1886a944-a614-4693-b1eb-82727b1d7bf8": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "1303.5,159 1127.5,159",
			"sourceSymbol": "791ff637-5df5-4ed1-a76e-8de699526fe2",
			"targetSymbol": "6f513b02-7309-420e-859a-f71ebd29c229",
			"object": "8f76e6c5-5a1b-442f-89dc-ca1cfcc2d3da"
		},
		"07abc2d2-6659-4c66-916a-d9cf6eb9824c": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "1131,157 900,157",
			"sourceSymbol": "6f513b02-7309-420e-859a-f71ebd29c229",
			"targetSymbol": "d627f60a-adcd-47df-9034-4c758dd37a62",
			"object": "16e84642-c231-49a1-8077-03f4b37dc182"
		},
		"8a5b8eb8-c1c3-486d-ae68-03ec1b988ad1": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "1130,159 1130,251 1601,251 1601,-323 814,-323 814,-159",
			"sourceSymbol": "6f513b02-7309-420e-859a-f71ebd29c229",
			"targetSymbol": "a2c83bc7-dbd7-459e-94d3-ccef6f1edbdd",
			"object": "590d192b-3f21-44c8-b98d-329666cccfa0"
		},
		"50abf339-874b-4f00-97ce-12e6373cadbd": {
			"classDefinition": "com.sap.bpm.wfs.ui.ExclusiveGatewaySymbol",
			"x": 881,
			"y": -180,
			"object": "4e808e2e-fb20-45d5-90ee-a704ec761f84"
		},
		"879ebb1e-a287-4d90-a07d-6602d92435db": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "817,-159 899,-159",
			"sourceSymbol": "a2c83bc7-dbd7-459e-94d3-ccef6f1edbdd",
			"targetSymbol": "50abf339-874b-4f00-97ce-12e6373cadbd",
			"object": "16932d61-e281-42e1-ab78-49cf02d4ab51"
		},
		"c93a3b86-fe01-429f-84aa-14c866f2743a": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "902,-160.5 1016,-160.5",
			"sourceSymbol": "50abf339-874b-4f00-97ce-12e6373cadbd",
			"targetSymbol": "71d835fb-3a44-4d4a-b378-31f943e8342e",
			"object": "a73d8151-f7bd-487a-bbcc-a19935f2f7c2"
		},
		"26733d86-b8f0-4200-9d75-497f0000335a": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "903,-159 903,164",
			"sourceSymbol": "50abf339-874b-4f00-97ce-12e6373cadbd",
			"targetSymbol": "d627f60a-adcd-47df-9034-4c758dd37a62",
			"object": "7d6c1c46-f793-4ec9-a281-892459d244c3"
		},
		"5ba5a3fa-a8a6-4d48-a006-07613b5c0bcf": {
			"classDefinition": "com.sap.bpm.wfs.ui.ScriptTaskSymbol",
			"x": 1251,
			"y": -70,
			"width": 100,
			"height": 60,
			"object": "e8f9d8b4-ca63-4474-8a21-6abdb105d378"
		},
		"ce4b6e9b-a740-4909-b31b-6e5be16c5cad": {
			"classDefinition": "com.sap.bpm.wfs.ui.ServiceTaskSymbol",
			"x": 1439,
			"y": -70,
			"width": 100,
			"height": 60,
			"object": "ee83d4a5-6d70-440d-ad56-65e7b667e764"
		},
		"42c029cc-1d86-4dd5-8d55-a519b9cbaad5": {
			"classDefinition": "com.sap.bpm.wfs.ui.ScriptTaskSymbol",
			"x": 1439,
			"y": 129,
			"width": 100,
			"height": 60,
			"object": "ac9024b0-4a97-46c2-9aa6-7245d95cb244"
		},
		"52322da3-be10-42d2-97fd-58740e43836c": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "1485,159 1304,159",
			"sourceSymbol": "42c029cc-1d86-4dd5-8d55-a519b9cbaad5",
			"targetSymbol": "791ff637-5df5-4ed1-a76e-8de699526fe2",
			"object": "7406127c-3a6f-4d2a-8535-305fd1319687"
		},
		"24ea299f-06f8-40fa-837b-48f8c56a4adf": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "1301,-39 1497,-39",
			"sourceSymbol": "5ba5a3fa-a8a6-4d48-a006-07613b5c0bcf",
			"targetSymbol": "ce4b6e9b-a740-4909-b31b-6e5be16c5cad",
			"object": "7e4a7cfa-6eea-4154-b255-f55409e50c8d"
		},
		"260c153c-d76b-4e89-88d6-75412eaa1537": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "1016,-160.5 1130,-160.5",
			"sourceSymbol": "71d835fb-3a44-4d4a-b378-31f943e8342e",
			"targetSymbol": "71554a76-5882-4087-8524-86bd43383b6f",
			"object": "93107f02-064e-4821-9144-7e4c76b2cd19"
		},
		"4dc38983-8aca-4d71-a75e-8b3ce4d4a6de": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "1133,-159 1133,-40 1301,-40",
			"sourceSymbol": "71554a76-5882-4087-8524-86bd43383b6f",
			"targetSymbol": "5ba5a3fa-a8a6-4d48-a006-07613b5c0bcf",
			"object": "d29a6d94-5c6d-4035-8364-b62a5d5520d8"
		},
		"8b79c73f-c0ff-4464-a18f-0087b83b3331": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "1301,-239 1301,-40",
			"sourceSymbol": "b4cd7a05-569c-4562-9927-a7de8b7b9d82",
			"targetSymbol": "5ba5a3fa-a8a6-4d48-a006-07613b5c0bcf",
			"object": "4123c1dc-553e-4dba-9c2c-4f21c80623b1"
		},
		"a3e1b15e-bab3-429a-8eed-7782a5f57824": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "1489,-40 1489,169",
			"sourceSymbol": "ce4b6e9b-a740-4909-b31b-6e5be16c5cad",
			"targetSymbol": "42c029cc-1d86-4dd5-8d55-a519b9cbaad5",
			"object": "613eff0f-b81d-4e01-a3e8-0eb9844a9685"
		},
		"5cd0d9ab-ea96-486f-959c-ca333a62987d": {
			"classDefinition": "com.sap.bpm.wfs.ui.UserTaskSymbol",
			"x": 629,
			"y": -189,
			"width": 100,
			"height": 60,
			"object": "53c54d56-1876-471e-9c88-de6b37904fba"
		},
		"0206ba9a-4a81-4101-86d2-810138f74a07": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "679,-159 679,-324 1601,-324 1601,251 1130,251 1130,159",
			"sourceSymbol": "5cd0d9ab-ea96-486f-959c-ca333a62987d",
			"targetSymbol": "6f513b02-7309-420e-859a-f71ebd29c229",
			"object": "cd6f8c12-d77d-474f-8118-363840d9f3ea"
		},
		"b163b53e-3fbf-4bbb-bce8-61208307dfc7": {
			"classDefinition": "com.sap.bpm.wfs.ui.ExclusiveGatewaySymbol",
			"x": 543,
			"y": -183,
			"object": "3c1a3fe8-0138-4f6c-b917-b6bd8428334b"
		},
		"6de0b703-5b89-4834-ab69-a1ef505db250": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "564,-162 693,-162",
			"sourceSymbol": "b163b53e-3fbf-4bbb-bce8-61208307dfc7",
			"targetSymbol": "5cd0d9ab-ea96-486f-959c-ca333a62987d",
			"object": "405eff4e-0c18-40c4-8871-7676a8788e60"
		},
		"f148d0a5-ee8b-4c32-bd11-a50b533be020": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "564,-160.5 564,-322 814,-322 814,-160.5",
			"sourceSymbol": "b163b53e-3fbf-4bbb-bce8-61208307dfc7",
			"targetSymbol": "a2c83bc7-dbd7-459e-94d3-ccef6f1edbdd",
			"object": "ec848e6e-03a2-4ad4-9449-9774dc4944df"
		},
		"5840908d-bdd9-4218-bf13-42b0514d1d90": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "453,-160 572,-160",
			"sourceSymbol": "5ca509c4-fca2-46a0-99ec-effc8ea43d32",
			"targetSymbol": "b163b53e-3fbf-4bbb-bce8-61208307dfc7",
			"object": "59badcd4-055c-41da-9fa2-85fd3ecc9152"
		},
		"435ce970-bcc1-4505-9cc9-3bd28c368de9": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "209,-159 209,161 902,161",
			"sourceSymbol": "482334bf-ab8e-439c-ba3b-f150e7c2b4f9",
			"targetSymbol": "d627f60a-adcd-47df-9034-4c758dd37a62",
			"object": "d89afe34-784b-4fb9-b384-31f60f4968f1"
		},
		"8dc2b73c-6574-455b-b0e0-d3c36b13fce9": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "209,-158 453,-158",
			"sourceSymbol": "482334bf-ab8e-439c-ba3b-f150e7c2b4f9",
			"targetSymbol": "5ca509c4-fca2-46a0-99ec-effc8ea43d32",
			"object": "c931076d-78b3-40a2-8ac2-bcd9ed919fc5"
		},
		"5d7b79c6-6ee0-4b9a-9c8a-e34e899c7344": {
			"classDefinition": "com.sap.bpm.wfs.LastIDs",
			"messageeventdefinition": 1,
			"hubapireference": 2,
			"sequenceflow": 115,
			"startevent": 1,
			"intermediatemessageevent": 1,
			"endevent": 2,
			"usertask": 7,
			"servicetask": 13,
			"scripttask": 10,
			"exclusivegateway": 13
		},
		"6bfd2f62-56cd-4f4a-b44d-bb0c47fb1f52": {
			"classDefinition": "com.sap.bpm.wfs.ServiceTask",
			"destination": "S4HANACLOUD_BASIC",
			"path": "/sap/opu/odata/sap/YY1_PR_CHECK_CDS/YY1_PR_CHECK(guid'${context.PrUUID}')",
			"httpMethod": "DELETE",
			"xsrfPath": "/sap/opu/odata/sap/YY1_PR_CHECK_CDS",
			"id": "servicetask12",
			"name": "删掉审批记录"
		},
		"c9b8d3d8-30eb-4e71-bea3-a3b0fcbe8eec": {
			"classDefinition": "com.sap.bpm.wfs.ui.ServiceTaskSymbol",
			"x": 852,
			"y": 446,
			"width": 100,
			"height": 60,
			"object": "6bfd2f62-56cd-4f4a-b44d-bb0c47fb1f52"
		},
		"d7d57303-5f1e-472a-aebb-073c048b89b8": {
			"classDefinition": "com.sap.bpm.wfs.ServiceTask",
			"destination": "S4HANACLOUD_BASIC",
			"path": "/sap/opu/odata/sap/YY1_PR_CHECK_CDS/YY1_PR_CHECK?$filter=YY1_PRID_PRI eq '${context.PurchaseRequistionID}'",
			"httpMethod": "GET",
			"responseVariable": "${context.PrUUID}",
			"id": "servicetask13",
			"name": "获取UUID"
		},
		"d627f60a-adcd-47df-9034-4c758dd37a62": {
			"classDefinition": "com.sap.bpm.wfs.ui.ServiceTaskSymbol",
			"x": 852,
			"y": 129,
			"width": 100,
			"height": 60,
			"object": "d7d57303-5f1e-472a-aebb-073c048b89b8"
		},
		"f9b936d2-7767-4a7e-aaf5-8e8f12dd7e49": {
			"classDefinition": "com.sap.bpm.wfs.ScriptTask",
			"reference": "/scripts/purchaseApply/setUUID.js",
			"id": "scripttask10",
			"name": "设置UUID"
		},
		"e063fe5e-874f-4838-8186-b7da1c8308c8": {
			"classDefinition": "com.sap.bpm.wfs.ui.ScriptTaskSymbol",
			"x": 852,
			"y": 256,
			"width": 100,
			"height": 60,
			"object": "f9b936d2-7767-4a7e-aaf5-8e8f12dd7e49"
		},
		"828551ff-c78e-499e-ac4f-e09e1fcfeddd": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow110",
			"name": "SequenceFlow110",
			"sourceRef": "d7d57303-5f1e-472a-aebb-073c048b89b8",
			"targetRef": "f9b936d2-7767-4a7e-aaf5-8e8f12dd7e49"
		},
		"97133923-5848-4391-ae3d-28fc8aed944e": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "902,159 902,280",
			"sourceSymbol": "d627f60a-adcd-47df-9034-4c758dd37a62",
			"targetSymbol": "e063fe5e-874f-4838-8186-b7da1c8308c8",
			"object": "828551ff-c78e-499e-ac4f-e09e1fcfeddd"
		},
		"0014beb8-61cf-4b22-a089-d84781a1caf3": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow112",
			"name": "SequenceFlow112",
			"sourceRef": "6bfd2f62-56cd-4f4a-b44d-bb0c47fb1f52",
			"targetRef": "0c573be3-ad42-4e87-9656-486ef3d71f80"
		},
		"d98556c4-2fc1-484c-bd83-7dd1ac3cfe78": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "901.75,476 901.75,595.5",
			"sourceSymbol": "c9b8d3d8-30eb-4e71-bea3-a3b0fcbe8eec",
			"targetSymbol": "42f10061-afac-4c18-901f-91adbab1b2df",
			"object": "0014beb8-61cf-4b22-a089-d84781a1caf3"
		},
		"85788f57-fafa-4bd4-a3f3-2a97fcd80b16": {
			"classDefinition": "com.sap.bpm.wfs.ExclusiveGateway",
			"id": "exclusivegateway13",
			"name": "delete?",
			"default": "07bcd743-36c3-4694-b7c5-d774a5fe8748"
		},
		"8637b800-f383-44c3-8a64-ac4c96aa0ae3": {
			"classDefinition": "com.sap.bpm.wfs.ui.ExclusiveGatewaySymbol",
			"x": 881,
			"y": 354,
			"object": "85788f57-fafa-4bd4-a3f3-2a97fcd80b16"
		},
		"07bcd743-36c3-4694-b7c5-d774a5fe8748": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow113",
			"name": "yes",
			"sourceRef": "85788f57-fafa-4bd4-a3f3-2a97fcd80b16",
			"targetRef": "6bfd2f62-56cd-4f4a-b44d-bb0c47fb1f52"
		},
		"f9b09e45-609e-49af-9577-668497faef23": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "902,375 902,455",
			"sourceSymbol": "8637b800-f383-44c3-8a64-ac4c96aa0ae3",
			"targetSymbol": "c9b8d3d8-30eb-4e71-bea3-a3b0fcbe8eec",
			"object": "07bcd743-36c3-4694-b7c5-d774a5fe8748"
		},
		"5a1e2b12-38f7-4a37-b217-d6aa0144b5ac": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow114",
			"name": "SequenceFlow114",
			"sourceRef": "f9b936d2-7767-4a7e-aaf5-8e8f12dd7e49",
			"targetRef": "85788f57-fafa-4bd4-a3f3-2a97fcd80b16"
		},
		"ce00b8f7-e9e9-4f9a-a072-5f831f7dd835": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "902,286 902,382",
			"sourceSymbol": "e063fe5e-874f-4838-8186-b7da1c8308c8",
			"targetSymbol": "8637b800-f383-44c3-8a64-ac4c96aa0ae3",
			"object": "5a1e2b12-38f7-4a37-b217-d6aa0144b5ac"
		},
		"2947c420-218f-487b-91bc-a5be5ac9a478": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"condition": "${context.PrUUID==\"\"}",
			"id": "sequenceflow115",
			"name": "no",
			"sourceRef": "85788f57-fafa-4bd4-a3f3-2a97fcd80b16",
			"targetRef": "0c573be3-ad42-4e87-9656-486ef3d71f80"
		},
		"861981fe-0f4e-46e0-aae3-e458c8446cda": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "902,375 746,375 746,586 902,586",
			"sourceSymbol": "8637b800-f383-44c3-8a64-ac4c96aa0ae3",
			"targetSymbol": "42f10061-afac-4c18-901f-91adbab1b2df",
			"object": "2947c420-218f-487b-91bc-a5be5ac9a478"
		}
	}
}