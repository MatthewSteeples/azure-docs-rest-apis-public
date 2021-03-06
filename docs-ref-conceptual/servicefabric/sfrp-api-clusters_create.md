---
title: "Create"
ms.date: "2018-06-04"
ms.prod: "azure"
ms.service: "service-fabric"
ms.topic: "reference"
applies_to: 
  - "Azure"
dev_langs: 
  - "rest-api"
helpviewer_keywords: 
  - "Service Fabric Resource Manager REST API Reference"
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
# Create
Creates or updates a Service Fabric cluster resource.

Create or update a Service Fabric cluster resource with the specified name.

## Request
| Method | Request URI |
| ------ | ----------- |
| PUT | `/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.ServiceFabric/clusters/{clusterName}?api-version=2018-02-01` |


## Parameters
| Name | Type | Required | Location |
| --- | --- | --- | --- |
| [resourceGroupName](#resourcegroupname) | string | Yes | Path |
| [clusterName](#clustername) | string | Yes | Path |
| [subscriptionId](#subscriptionid) | string | Yes | Path |
| [api-version](#api-version) | string | Yes | Query |
| [parameters](#parameters) | [Cluster](sfrp-model-cluster.md) | Yes | Body |

____
### resourceGroupName
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
The name of the resource group.

____
### clusterName
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
The name of the cluster resource.

____
### subscriptionId
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
The customer subscription identifier.

____
### api-version
__Type__: string <br/>
__Required__: Yes<br/>
__Default__: 2018-02-01 <br/>
<br/>
The version of the Service Fabric resource provider API. This is a required parameter and it's value must be "2018-02-01" for this specification.

____
### parameters
__Type__: [Cluster](sfrp-model-cluster.md) <br/>
__Required__: Yes<br/>
<br/>
The cluster resource.

## Responses

| HTTP Status Code | Description | Response Schema |
| --- | --- | --- |
| 200 (OK) | The operation completed successfully.<br/> | [Cluster](sfrp-model-cluster.md) |
| 202 (Accepted) | The request was accepted and the operation will complete asynchronously.<br/> | [Cluster](sfrp-model-cluster.md) |
| All other status codes | The detailed error response.<br/> | [ErrorModel](sfrp-model-errormodel.md) |

## Examples

### Put a cluster with mininum parameters

#### Request
```
PUT https://management.azure.com/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/resRg/providers/Microsoft.ServiceFabric/clusters/myCluster?api-version=2018-02-01
```

##### Body
```json
{
  "type": "Microsoft.ServiceFabric/clusters",
  "location": "eastus",
  "id": "/subscriptions/00000000-0000-0000-0000-000000000000/resourcegroups/resRg/providers/Microsoft.ServiceFabric/clusters/myCluster",
  "name": "myCluster",
  "tags": {},
  "properties": {
    "managementEndpoint": "http://myCluster.eastus.cloudapp.azure.com:19080",
    "fabricSettings": [
      {
        "name": "UpgradeService",
        "parameters": [
          {
            "name": "AppPollIntervalInSeconds",
            "value": "60"
          }
        ]
      }
    ],
    "diagnosticsStorageAccountConfig": {
      "storageAccountName": "diag",
      "protectedAccountKeyName": "StorageAccountKey1",
      "blobEndpoint": "https://diag.blob.core.windows.net/",
      "queueEndpoint": "https://diag.queue.core.windows.net/",
      "tableEndpoint": "https://diag.table.core.windows.net/"
    },
    "nodeTypes": [
      {
        "name": "nt1vm",
        "clientConnectionEndpointPort": "19000",
        "httpGatewayEndpointPort": "19007",
        "applicationPorts": {
          "startPort": "20000",
          "endPort": "30000"
        },
        "ephemeralPorts": {
          "startPort": "49000",
          "endPort": "64000"
        },
        "isPrimary": true,
        "vmInstanceCount": "5",
        "durabilityLevel": "Bronze"
      }
    ],
    "reliabilityLevel": "Silver",
    "upgradeMode": "Automatic"
  }
}
```

#### 200 Response
##### Body
```json
{
  "type": "Microsoft.ServiceFabric/clusters",
  "location": "eastus",
  "id": "/subscriptions/00000000-0000-0000-0000-000000000000/resourcegroups/resRg/providers/Microsoft.ServiceFabric/clusters/myCluster",
  "name": "myCluster",
  "tags": {},
  "etag": "W/\"636462502169240743\"",
  "properties": {
    "provisioningState": "Succeeded",
    "clusterId": "92584666-9889-4ae8-8d02-91902923d37f",
    "clusterCodeVersion": "6.1.480.9494",
    "clusterState": "WaitingForNodes",
    "managementEndpoint": "http://myCluster.eastus.cloudapp.azure.com:19080",
    "clusterEndpoint": "https://eastus.servicefabric.azure.com",
    "clientCertificateThumbprints": [],
    "clientCertificateCommonNames": [],
    "fabricSettings": [
      {
        "name": "UpgradeService",
        "parameters": [
          {
            "name": "AppPollIntervalInSeconds",
            "value": "60"
          }
        ]
      }
    ],
    "upgradeDescription": {
      "forceRestart": false,
      "upgradeReplicaSetCheckTimeout": "10675199.02:48:05.4775807",
      "healthCheckWaitDuration": "00:05:00",
      "healthCheckStableDuration": "00:05:00",
      "healthCheckRetryTimeout": "00:45:00",
      "upgradeTimeout": "12:00:00",
      "upgradeDomainTimeout": "02:00:00",
      "healthPolicy": {
        "maxPercentUnhealthyNodes": "100",
        "maxPercentUnhealthyApplications": "100"
      },
      "deltaHealthPolicy": {
        "maxPercentDeltaUnhealthyNodes": "0",
        "maxPercentUpgradeDomainDeltaUnhealthyNodes": "0",
        "maxPercentDeltaUnhealthyApplications": "0"
      }
    },
    "diagnosticsStorageAccountConfig": {
      "storageAccountName": "diag",
      "protectedAccountKeyName": "StorageAccountKey1",
      "blobEndpoint": "https://diag.blob.core.windows.net/",
      "queueEndpoint": "https://diag.queue.core.windows.net/",
      "tableEndpoint": "https://diag.table.core.windows.net/"
    },
    "nodeTypes": [
      {
        "name": "nt1vm",
        "clientConnectionEndpointPort": "19000",
        "httpGatewayEndpointPort": "19007",
        "applicationPorts": {
          "startPort": "20000",
          "endPort": "30000"
        },
        "ephemeralPorts": {
          "startPort": "49000",
          "endPort": "64000"
        },
        "isPrimary": true,
        "vmInstanceCount": "5",
        "durabilityLevel": "Bronze"
      }
    ],
    "reliabilityLevel": "Silver",
    "upgradeMode": "Automatic",
    "availableClusterVersions": [
      {
        "codeVersion": "6.1.480.9494",
        "supportExpiryUtc": "2018-06-15T23:59:59.9999999",
        "environment": "Windows"
      }
    ]
  }
}
```


### Put a cluster with maximum parameters

#### Request
```
PUT https://management.azure.com/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/resRg/providers/Microsoft.ServiceFabric/clusters/myCluster?api-version=2018-02-01
```

##### Body
```json
{
  "type": "Microsoft.ServiceFabric/clusters",
  "location": "eastus",
  "id": "/subscriptions/00000000-0000-0000-0000-000000000000/resourcegroups/resRg/providers/Microsoft.ServiceFabric/clusters/myCluster",
  "name": "myCluster",
  "tags": {},
  "properties": {
    "clusterCodeVersion": "6.1.480.9494",
    "managementEndpoint": "https://myCluster.eastus.cloudapp.azure.com:19080",
    "certificateCommonNames": {
      "commonNames": [
        {
          "certificateCommonName": "abc.com",
          "certificateIssuerThumbprint": "12599211F8F14C90AFA9532AD79A6F2CA1C00622"
        }
      ],
      "x509StoreName": "My"
    },
    "clientCertificateThumbprints": [
      {
        "isAdmin": true,
        "certificateThumbprint": "5F3660C715EBBDA31DB1FFDCF508302348DE8E7A"
      }
    ],
    "clientCertificateCommonNames": [
      {
        "isAdmin": true,
        "certificateCommonName": "abc.com",
        "certificateIssuerThumbprint": "5F3660C715EBBDA31DB1FFDCF508302348DE8E7A"
      }
    ],
    "fabricSettings": [
      {
        "name": "UpgradeService",
        "parameters": [
          {
            "name": "AppPollIntervalInSeconds",
            "value": "60"
          }
        ]
      }
    ],
    "upgradeDescription": {
      "forceRestart": false,
      "upgradeReplicaSetCheckTimeout": "00:10:00",
      "healthCheckWaitDuration": "00:00:30",
      "healthCheckStableDuration": "00:00:30",
      "healthCheckRetryTimeout": "00:05:00",
      "upgradeTimeout": "01:00:00",
      "upgradeDomainTimeout": "00:15:00",
      "healthPolicy": {
        "maxPercentUnhealthyNodes": "0",
        "maxPercentUnhealthyApplications": "0",
        "applicationHealthPolicies": {
          "fabric:/myApp1": {
            "defaultServiceTypeHealthPolicy": {
              "maxPercentUnhealthyServices": "0"
            },
            "serviceTypeHealthPolicies": {
              "myServiceType1": {
                "maxPercentUnhealthyServices": "100"
              }
            }
          }
        }
      },
      "deltaHealthPolicy": {
        "maxPercentDeltaUnhealthyNodes": "0",
        "maxPercentUpgradeDomainDeltaUnhealthyNodes": "0",
        "maxPercentDeltaUnhealthyApplications": "0",
        "applicationDeltaHealthPolicies": {
          "fabric:/myApp1": {
            "defaultServiceTypeDeltaHealthPolicy": {
              "maxPercentDeltaUnhealthyServices": "0"
            },
            "serviceTypeDeltaHealthPolicies": {
              "myServiceType1": {
                "maxPercentDeltaUnhealthyServices": "0"
              }
            }
          }
        }
      }
    },
    "diagnosticsStorageAccountConfig": {
      "storageAccountName": "diag",
      "protectedAccountKeyName": "StorageAccountKey1",
      "blobEndpoint": "https://diag.blob.core.windows.net/",
      "queueEndpoint": "https://diag.queue.core.windows.net/",
      "tableEndpoint": "https://diag.table.core.windows.net/"
    },
    "nodeTypes": [
      {
        "name": "nt1vm",
        "clientConnectionEndpointPort": "19000",
        "httpGatewayEndpointPort": "19007",
        "applicationPorts": {
          "startPort": "20000",
          "endPort": "30000"
        },
        "ephemeralPorts": {
          "startPort": "49000",
          "endPort": "64000"
        },
        "isPrimary": true,
        "vmInstanceCount": "5",
        "durabilityLevel": "Bronze"
      }
    ],
    "vmImage": "Windows",
    "azureActiveDirectory": {
      "tenantId": "6abcc6a0-8666-43f1-87b8-172cf86a9f9c",
      "clusterApplication": "5886372e-7bf4-4878-a497-8098aba608ae",
      "clientApplication": "d151ad89-4bce-4ae8-b3d1-1dc79679fa75"
    },
    "reliabilityLevel": "Silver",
    "reverseProxyCertificateCommonNames": {
      "commonNames": [
        {
          "certificateCommonName": "abc.com",
          "certificateIssuerThumbprint": "12599211F8F14C90AFA9532AD79A6F2CA1C00622"
        }
      ],
      "x509StoreName": "My"
    },
    "upgradeMode": "Manual",
    "addOnFeatures": [
      "RepairManager",
      "DnsService",
      "BackupRestoreService",
      "ResourceMonitorService"
    ]
  }
}
```

#### 202 Response
##### Headers
```html
Retry-After: 10
Location: http://10.91.140.224/subscriptions/00000000-0000-0000-0000-000000000000/providers/Microsoft.ServiceFabric/locations/eastus/operationResults/4b5f6709-bc12-4365-8df3-894984b2a221?api-version=2018-02-01
```

##### Body
```json
{
  "type": "Microsoft.ServiceFabric/clusters",
  "location": "eastus",
  "id": "/subscriptions/00000000-0000-0000-0000-000000000000/resourcegroups/resRg/providers/Microsoft.ServiceFabric/clusters/myCluster",
  "name": "myCluster",
  "tags": {},
  "etag": "W/\"636462502169240745\"",
  "properties": {
    "provisioningState": "Succeeded",
    "clusterId": "92584666-9889-4ae8-8d02-91902923d37f",
    "clusterCodeVersion": "6.1.480.9494",
    "clusterState": "WaitingForNodes",
    "managementEndpoint": "https://myCluster.eastus.cloudapp.azure.com:19080",
    "clusterEndpoint": "https://eastus.servicefabric.azure.com",
    "certificateCommonNames": {
      "commonNames": [
        {
          "certificateCommonName": "abc.com",
          "certificateIssuerThumbprint": "12599211F8F14C90AFA9532AD79A6F2CA1C00622"
        }
      ],
      "x509StoreName": "My"
    },
    "clientCertificateThumbprints": [
      {
        "isAdmin": false,
        "certificateThumbprint": "5F3660C715EBBDA31DB1FFDCF508302348DE8E7A"
      }
    ],
    "clientCertificateCommonNames": [
      {
        "isAdmin": true,
        "certificateCommonName": "abc.com",
        "certificateIssuerThumbprint": "5F3660C715EBBDA31DB1FFDCF508302348DE8E7A"
      }
    ],
    "fabricSettings": [
      {
        "name": "UpgradeService",
        "parameters": [
          {
            "name": "AppPollIntervalInSeconds",
            "value": "60"
          }
        ]
      }
    ],
    "upgradeDescription": {
      "forceRestart": true,
      "upgradeReplicaSetCheckTimeout": "00:10:00",
      "healthCheckWaitDuration": "00:00:30",
      "healthCheckStableDuration": "00:00:30",
      "healthCheckRetryTimeout": "00:05:00",
      "upgradeTimeout": "00:15:00",
      "upgradeDomainTimeout": "00:15:00",
      "healthPolicy": {
        "maxPercentUnhealthyNodes": "0",
        "maxPercentUnhealthyApplications": "0",
        "applicationHealthPolicies": {
          "fabric:/myApp1": {
            "defaultServiceTypeHealthPolicy": {
              "maxPercentUnhealthyServices": "0"
            },
            "serviceTypeHealthPolicies": {
              "myServiceType1": {
                "maxPercentUnhealthyServices": "100"
              }
            }
          }
        }
      },
      "deltaHealthPolicy": {
        "maxPercentDeltaUnhealthyNodes": "0",
        "maxPercentUpgradeDomainDeltaUnhealthyNodes": "0",
        "maxPercentDeltaUnhealthyApplications": "0",
        "applicationDeltaHealthPolicies": {
          "fabric:/myApp1": {
            "defaultServiceTypeDeltaHealthPolicy": {
              "maxPercentDeltaUnhealthyServices": "0"
            },
            "serviceTypeDeltaHealthPolicies": {
              "myServiceType1": {
                "maxPercentDeltaUnhealthyServices": "0"
              }
            }
          }
        }
      }
    },
    "diagnosticsStorageAccountConfig": {
      "storageAccountName": "diag",
      "protectedAccountKeyName": "StorageAccountKey1",
      "blobEndpoint": "https://diag.blob.core.windows.net/",
      "queueEndpoint": "https://diag.queue.core.windows.net/",
      "tableEndpoint": "https://diag.table.core.windows.net/"
    },
    "nodeTypes": [
      {
        "name": "nt1vm",
        "clientConnectionEndpointPort": "19000",
        "httpGatewayEndpointPort": "19007",
        "applicationPorts": {
          "startPort": "20000",
          "endPort": "30000"
        },
        "ephemeralPorts": {
          "startPort": "49000",
          "endPort": "64000"
        },
        "isPrimary": true,
        "vmInstanceCount": "5",
        "durabilityLevel": "Bronze"
      }
    ],
    "vmImage": "Windows",
    "azureActiveDirectory": {
      "tenantId": "6abcc6a0-8666-43f1-87b8-172cf86a9f9c",
      "clusterApplication": "5886372e-7bf4-4878-a497-8098aba608ae",
      "clientApplication": "d151ad89-4bce-4ae8-b3d1-1dc79679fa75"
    },
    "reliabilityLevel": "Silver",
    "reverseProxyCertificateCommonNames": {
      "commonNames": [
        {
          "certificateCommonName": "abc.com",
          "certificateIssuerThumbprint": "12599211F8F14C90AFA9532AD79A6F2CA1C00622"
        }
      ],
      "x509StoreName": "My"
    },
    "upgradeMode": "Manual",
    "availableClusterVersions": [
      {
        "codeVersion": "6.1.480.9494",
        "supportExpiryUtc": "2018-06-15T23:59:59.9999999",
        "environment": "Windows"
      }
    ],
    "addonFeatures": [
      "RepairManager",
      "DnsService",
      "BackupRestoreService",
      "ResourceMonitorService"
    ]
  }
}
```

