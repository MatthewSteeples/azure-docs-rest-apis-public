---
title: Azure Container Registry REST API reference
author: mmacy
ms.author: marsma
ms.date: 11/20/2017
ms.topic: reference
ms.service: container-registry
ms.devlang: rest-api
---

# Azure Container Registry REST API reference

Azure Container Registry is a managed Docker registry service to store and manage your private Docker container images. Push Docker container images to a private registry as part of your development workflows. Pull images from a registry to your container deployments with orchestration tools or other Azure services.

## REST operation groups

| Operation group | Description |
|-----------------|-------------|
| [Operations](xref:management.azure.com.containerregistry.operations) | Get information about Azure Container Registry REST API operations. |
| [Registries](xref:management.azure.com.containerregistry.registries) | Create, read, update, and delete container registries. |
| [Replications](xref:management.azure.com.containerregistry.replications) | Create, read, update, and delete container registry [geo-replications](/azure/container-registry/container-registry-geo-replication). |
| [Webhooks](xref:management.azure.com.containerregistry.webhooks) | Create, read, update, and delete container registry [webhooks](/azure/container-registry/container-registry-webhook). |

## See also

[Azure Container Instances](/azure/container-instances/) - Quickly run Docker containers in Azure, without having to provision virtual machines or adopt a higher-level service.

[Azure Container Service (AKS)](/azure/aks/) - Easily deploy and manage containerized applications in a hosted Kubernetes environment.

[Azure Container Service (ACS)](/azure/container-service/) - Scale and orchestrate containers using Kubernetes, DC/OS, or Docker Swarm.