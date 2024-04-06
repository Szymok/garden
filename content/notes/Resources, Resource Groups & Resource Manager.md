---
title: Resources, Resource Groups & Resource Manager
type: post
tags: 
aliases:
---
## Azure Resource

- Object **used to manage services** in Azure
- Represents **service lifecycle**
- Saved as **JSON definition**

## Resource Groups

- **Grouping** of resources
- Holds **logically related** resources
- Typically organizing by
    - **Type**
    - **Lifecycle** (app, environment)
    - **Department**
    - **Billing**,
    - **Location** or
    - **combination of those**

## Resource Manager

- **Management Layer** for all resources and resource groups
- **Unified** language
- **Controls** **access** and **resources**

### Additional Info

- Each **resource must** be in one, and **only one resource group**
- Resource **groups have their own location** assigned
- Resources in the resource groups **can reside in a different locations**
- Resources **can be moved** between the resource groups
- Resource **groups can’t be nested**
- Organize based on your organization needs but consider
    - Billing
    - Security and access management
    - Application Lifecycle