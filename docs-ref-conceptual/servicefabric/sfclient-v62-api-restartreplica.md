---
title: "Restart Replica"
ms.date: "2018-04-23"
ms.prod: "azure"
ms.service: "service-fabric"
ms.topic: "reference"
applies_to: 
  - "Azure"
  - "Windows Server 2012 R2"
  - "Windows Server 2016"
dev_langs: 
  - "rest-api"
helpviewer_keywords: 
  - "Service Fabric REST API Reference"
author: "rwike77"
ms.author: "ryanwi"
manager: "timlt"
translation.priority.mt: 
  - "de-de"
  - "es-es"
  - "fr-fr"
  - "it-it"
  - "ja-jp"
  - "ko-kr"
  - "pt-br"
  - "ru-ru"
  - "zh-cn"
  - "zh-tw"
---
# Restart Replica
Restarts a service replica of a persisted service running on a node.

Restarts a service replica of a persisted service running on a node. Warning - There are no safety checks performed when this API is used. Incorrect use of this API can lead to availability loss for stateful services.

## Request
| Method | Request URI |
| ------ | ----------- |
| POST | `/Nodes/{nodeName}/$/GetPartitions/{partitionId}/$/GetReplicas/{replicaId}/$/Restart?api-version=6.0&timeout={timeout}` |


## Parameters
| Name | Type | Required | Location |
| --- | --- | --- | --- |
| [`nodeName`](#nodename) | string | Yes | Path |
| [`partitionId`](#partitionid) | string (uuid) | Yes | Path |
| [`replicaId`](#replicaid) | string | Yes | Path |
| [`api-version`](#api-version) | string | Yes | Query |
| [`timeout`](#timeout) | integer (int64) | No | Query |

____
### `nodeName`
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
The name of the node.

____
### `partitionId`
__Type__: string (uuid) <br/>
__Required__: Yes<br/>
<br/>
The identity of the partition.

____
### `replicaId`
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
The identifier of the replica.

____
### `api-version`
__Type__: string <br/>
__Required__: Yes<br/>
__Default__: `6.0` <br/>
<br/>
The version of the API. This parameter is required and its value must be '6.0'.

Service Fabric REST API version is based on the runtime version in which the API was introduced or was changed. Service Fabric runtime supports more than one version of the API. This is the latest supported version of the API. If a lower API version is passed, the returned response may be different from the one documented in this specification.

Additionally the runtime accept any version that is higher than the latest supported version up to the current version of the runtime. So if the latest API version is 6.0, but if the runtime is 6.1, in order to make it easier to write the clients, the runtime will accept version 6.1 for that API. However the behavior of the API will be as per the documented 6.0 version.


____
### `timeout`
__Type__: integer (int64) <br/>
__Required__: No<br/>
__Default__: `60` <br/>
__InclusiveMaximum__: `4294967295` <br/>
__InclusiveMinimum__: `1` <br/>
<br/>
The server timeout for performing the operation in seconds. This timeout specifies the time duration that the client is willing to wait for the requested operation to complete. The default value for this parameter is 60 seconds.

## Responses

| HTTP Status Code | Description | Response Schema |
| --- | --- | --- |
| 200 (OK) | A successful operation will return 200 status code. A successful operation means that the restart command was received by the replica on the node and it is in the process of restarting.<br/> |  |
| All other status codes | The detailed error response.<br/> | [FabricError](sfclient-v62-model-fabricerror.md) |
