---
title: IaaS vs PaaS vs SaaS cloud service models
type: post
tags: 
aliases:
---
## Service Models responsibilities

**As a service** means which party will manage the particular layer and all the layers below.

- **Software** layer consists the application (application code and set) & the application data
- **Platform** layer means all the supporting software and the operating system required to host the application
- **Infrastructure** layer consists hardware the infrastructure and virtualization required to host the platform

|Layer|Layer|
|---|---|
|Application|Software|
|Data|Software|
|Runtime|Platform|
|Middleware|Platform|
|Operating System|Platform|
|Virtualization|Infrastructure|
|Servers|Infrastructure|
|Networking|Infrastructure|
|Storage|Infrastructure|

## Responsibility Matrix

As such following table represents responsibilities

|Layer|On-Premises|IaaS|PaaS|SaaS|
|---|---|---|---|---|
|Application|You|You|You|Cloud provider|
|Data|You|You|You|Cloud provider|
|Runtime|You|You|Cloud provider|Cloud provider|
|Middleware|You|You|Cloud provider|Cloud provider|
|Operating System|You|You|Cloud provider|Cloud provider|
|Virtualization|You|Cloud provider|Cloud provider|Cloud provider|
|Servers|You|Cloud provider|Cloud provider|Cloud provider|
|Networking|You|Cloud provider|Cloud provider|Cloud provider|
|Storage|You|Cloud provider|Cloud provider|Cloud provider|