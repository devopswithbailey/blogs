---
title: Minimizing Downtime for Containerized Spring Boot Microservices Running on AKS
author: DevOpsWithBailey
authorURL: https://www.youtube.com/channel/UC26aYnf6SB4oaQNIzvD2GLQ?view_as=subscriber
---

# Purpose
This document outlines a Kubernetes and Spring Boot configuration, which could achieve a **near-zero-downtime** application, when incorporated with proper pod lifecycle configuration for Kubernetes and graceful shutdown configuration for Spring Boot.

<!--truncate-->

# Overview
It is not uncommon for external users to observe http timeout while performing a API call to a containerized and external facing Spring Boot microservice running on Azure AKS. This document offers a method to alleviate this problem. Since the method described in this document relies on correctly aligning the timing of deployment events it is not possible to guarantee 100% elimination of the probability of running into a http timeout error. 

# Understanding http timeout error
At a high level there are 5 scenarios in which one could observe a http timeout error.
1. Azure standard load balancer.
2. Azure standard load balancer backend pool.
3. livenessProbe.
4. Shutting down pods.
## Azure standard load balancer
Load balancer is standard by default when you create a AKS cluster now. Upgrade to standard from basic load balancer if you AKS cluster was created long time ago, since basic load balancer has no [SLA](https://azure.microsoft.com/en-us/support/legal/sla/load-balancer/v1_0/). Check which type of load balancer your AKS is using: go to your Azure portal home page and search for load balancers.
![load balancer](/img/load_balancer/standard_load_balancer.png)
## Azure standard load balancer backend pool
1. Go to the load balancer page and click on Health probes under Settings.
    ![health probes](/img/load_balancer/health_check.png)
2. Click on the probe.
    ![specs](/img/load_balancer/health_check_specs.png)

The pool members of the Azure load balancer are your AKS nodes at **NodePort** 32650. The load balancer checks on the health of the nodes every 5 seconds. A pool member will be considered as unhealthy if the probe failed 2 times in a row.

**Summary:** to reduce the chances for external users to see http timeout, make sure there are **multiple AKS nodes** in the backend pool and the **interval** of the health probe is frequent enough.
## livenessProbe
```
livenessProbe:
    httpGet:
      path: "/actuator/health/liveness"
      port: 9100
      scheme: "HTTP"
    initialDelaySeconds: 80
    timeoutSeconds: 1
    periodSeconds: 10
    successThreshold: 1
    failureThreshold: 3
```
It is a typical livenessProbe for Spring Boot projects. To reduce the chances for external users to see http timeout, make sure the **periodSeconds** is frequent enough
