---
title: "DeployedStatefulServiceReplicaInfo"
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
# DeployedStatefulServiceReplicaInfo

Information about a stateful service replica deployed on a node.

## Properties
| Name | Type | Required |
| --- | --- | --- |
| [`ServiceKind`](#servicekind) | string | Yes |
| [`ServiceName`](#servicename) | string | No |
| [`ServiceTypeName`](#servicetypename) | string | No |
| [`ServiceManifestName`](#servicemanifestname) | string | No |
| [`CodePackageName`](#codepackagename) | string | No |
| [`PartitionId`](#partitionid) | string (uuid) | No |
| [`ReplicaStatus`](#replicastatus) | string (enum) | No |
| [`Address`](#address) | string | No |
| [`ServicePackageActivationId`](#servicepackageactivationid) | string | No |
| [`HostProcessId`](#hostprocessid) | string | No |
| [`ReplicaId`](#replicaid) | string | No |
| [`ReplicaRole`](#replicarole) | string (enum) | No |
| [`ReconfigurationInformation`](#reconfigurationinformation) | [ReconfigurationInformation](sfclient-v62-model-reconfigurationinformation.md) | No |

____
### ServiceKind
__Type__: string <br/>
__Required__: Yes <br/>
<br/>
A discriminator property. Its value must be 'Stateful' for objects of type 'DeployedStatefulServiceReplicaInfo'.

____
### `ServiceName`
__Type__: string <br/>
__Required__: No<br/>
<br/>
The full name of the service with 'fabric:' URI scheme.

____
### `ServiceTypeName`
__Type__: string <br/>
__Required__: No<br/>
<br/>
Name of the service type as specified in the service manifest.

____
### `ServiceManifestName`
__Type__: string <br/>
__Required__: No<br/>
<br/>
The name of the service manifest in which this service type is defined.

____
### `CodePackageName`
__Type__: string <br/>
__Required__: No<br/>
<br/>
The name of the code package that hosts this replica.

____
### `PartitionId`
__Type__: string (uuid) <br/>
__Required__: No<br/>
<br/>
An internal ID used by Service Fabric to uniquely identify a partition. This is a randomly generated GUID when the service was created. The partition ID is unique and does not change for the lifetime of the service. If the same service was deleted and recreated the IDs of its partitions would be different.

____
### `ReplicaStatus`
__Type__: string (enum) <br/>
__Required__: No<br/>
<br/>


The status of a replica of a service.

Possible values are: 

  - `Invalid` - Indicates the replica status is invalid. All Service Fabric enumerations have the invalid type. The value is zero.
  - `InBuild` - The replica is being built. This means that a primary replica is seeding this replica. The value is 1.
  - `Standby` - The replica is in standby. The value is 2.
  - `Ready` - The replica is ready. The value is 3.
  - `Down` - The replica is down. The value is 4.
  - `Dropped` - Replica is dropped. This means that the replica has been removed from the replica set. If it is persisted, its state has been deleted. The value is 5.



____
### `Address`
__Type__: string <br/>
__Required__: No<br/>
<br/>
The last address returned by the replica in Open or ChangeRole.

____
### `ServicePackageActivationId`
__Type__: string <br/>
__Required__: No<br/>
<br/>
The ActivationId of a deployed service package. If ServicePackageActivationMode specified at the time of creating the service
is 'SharedProcess' (or if it is not specified, in which case it defaults to 'SharedProcess'), then value of ServicePackageActivationId
is always an empty string.


____
### `HostProcessId`
__Type__: string <br/>
__Required__: No<br/>
<br/>
Host process ID of the process that is hosting the replica. This will be zero if the replica is down. In hyper-v containers this host process ID will be from different kernel.

____
### `ReplicaId`
__Type__: string <br/>
__Required__: No<br/>
<br/>
Id of a stateful service replica. ReplicaId is used by Service Fabric to uniquely identify a replica of a partition. It is unique within a partition and does not change for the lifetime of the replica. If a replica gets dropped and another replica gets created on the same node for the same partition, it will get a different value for the id. Sometimes the id of a stateless service instance is also referred as a replica id.

____
### `ReplicaRole`
__Type__: string (enum) <br/>
__Required__: No<br/>
<br/>


The role of a replica of a stateful service.

Possible values are: 

  - `Unknown` - Indicates the initial role that a replica is created in. The value is zero.
  - `None` - Specifies that the replica has no responsibility in regard to the replica set. The value is 1
  - `Primary` - Refers to the replica in the set on which all read and write operations are complete in order to enforce strong consistency semantics. Read operations are handled directly by the Primary replica, while write operations must be acknowledged by a quorum of the replicas in the replica set. There can only be one Primary replica in a replica set at a time. The value is 2.
  - `IdleSecondary` - Refers to a replica in the set that receives a state transfer from the Primary replica to prepare for becoming an active Secondary replica. There can be multiple Idle Secondary replicas in a replica set at a time. Idle Secondary replicas do not count as a part of a write quorum. The value is 3.
  - `ActiveSecondary` - Refers to a replica in the set that receives state updates from the Primary replica, applies them, and sends acknowledgements back. Secondary replicas must participate in the write quorum for a replica set. There can be multiple active Secondary replicas in a replica set at a time. The number of active Secondary replicas is configurable that the reliability subsystem should maintain. The value is 4.



____
### `ReconfigurationInformation`
__Type__: [ReconfigurationInformation](sfclient-v62-model-reconfigurationinformation.md) <br/>
__Required__: No<br/>
<br/>
Information about current reconfiguration like phase, type, previous configuration role of replica and reconfiguration start date time.
