---
title: "Get Service Type Info By Name"
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
# Get Service Type Info By Name
Gets the information about a specific service type that is supported by a provisioned application type in a Service Fabric cluster.

Gets the information about a specific service type that is supported by a provisioned application type in a Service Fabric cluster. The provided application type must exist. Otherwise, a 404 status is returned. A 204 response is returned if the specificed service type is not found in the cluster.

## Request
| Method | Request URI |
| ------ | ----------- |
| GET | `/ApplicationTypes/{applicationTypeName}/$/GetServiceTypes/{serviceTypeName}?api-version=6.0&ApplicationTypeVersion={ApplicationTypeVersion}&timeout={timeout}` |


## Parameters
| Name | Type | Required | Location |
| --- | --- | --- | --- |
| [`applicationTypeName`](#applicationtypename) | string | Yes | Path |
| [`serviceTypeName`](#servicetypename) | string | Yes | Path |
| [`api-version`](#api-version) | string | Yes | Query |
| [`ApplicationTypeVersion`](#applicationtypeversion) | string | Yes | Query |
| [`timeout`](#timeout) | integer (int64) | No | Query |

____
### `applicationTypeName`
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
The name of the application type.

____
### `serviceTypeName`
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
Specifies the name of a Service Fabric service type.

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
### `ApplicationTypeVersion`
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
The version of the application type.

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
| 200 (OK) | A specific service type which supported by a provisioned application type.<br/> | [ServiceTypeInfo](sfclient-v62-model-servicetypeinfo.md) |
| 204 (NoContent) | A 204 response is returned if the specified service type is not found in the cluster.<br/> |  |
| All other status codes | The detailed error response.<br/> | [FabricError](sfclient-v62-model-fabricerror.md) |

## Examples

### Get information about all nodes.

This example shows how to get information about a specific service type. A 204 response is returned if the specificed service type is not found in the cluster.

#### Request
```
GET http://localhost:19080/ApplicationTypes/Application2Type/$/GetServiceTypes/Actor1ActorServiceType?api-version=6.0&ApplicationTypeVersion=1.0.0
```

#### 200 Response
##### Body
```json
{
  "ServiceTypeDescription": {
    "IsStateful": true,
    "ServiceTypeName": "Actor1ActorServiceType",
    "PlacementConstraints": "",
    "HasPersistedState": true,
    "Kind": "Stateful",
    "Extensions": [
      {
        "Key": "__GeneratedServiceType__",
        "Value": "<GeneratedNames xmlns=\"http://schemas.microsoft.com/2015/03/fabact-no-schema\">\r\n            <DefaultService Name=\"Actor1ActorService\" />\r\n            <ReplicatorEndpoint Name=\"Actor1ActorServiceReplicatorEndpoint\" />\r\n            <ReplicatorConfigSection Name=\"Actor1ActorServiceReplicatorConfig\" />\r\n            <ReplicatorSecurityConfigSection Name=\"Actor1ActorServiceReplicatorSecurityConfig\" />\r\n            <StoreConfigSection Name=\"Actor1ActorServiceLocalStoreConfig\" />\r\n            <ServiceEndpointV2 Name=\"Actor1ActorServiceEndpointV2\" />\r\n          </GeneratedNames>"
      }
    ],
    "LoadMetrics": [],
    "ServicePlacementPolicies": []
  },
  "ServiceManifestVersion": "1.0.0",
  "ServiceManifestName": "Actor1Pkg",
  "IsServiceGroup": false
}
```


#### 204 Response
##### Body
The response body is empty.