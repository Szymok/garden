---
title: Governance Roles
created: 2025-07-14
status: 
category: 
difficulty: 
language: pl
tags:
  - 
aliases:
  - 
---
# 🎯 Definicja

# 🔑 Kluczowe punkty

# 📚 Szczegółowe wyjaśnienie

# 💡 Przykład zastosowania
## 📌 Źródła

## 👽 Brudnopis
Governance Roles represent the different action sets available on specific nodes for a specific access level. Governance Roles can be assigned to either a user or a role from KeyCloak. Both are essential to regulate access for groups. Governance Roles aggregate the access levels in ONE that can be later assigned to users or groups, You can see the list Of existing roles by navigating to Global Settings Governance Roles. Only users with the ONE Administrator role can manage governance roles.
ONE Administrator changes the application model and settings, manage group hierarchies, and create new entity types. These users ensure that the overall consistency Of the metamodel is preserved. ONE admins are the supreme authorities in the management Of ONE and can manage access. ONE Operator performs actions on all data assets that change ONE workflows. These users cannot modify the application model and settings , nor can they access the assets. Data Owner defines the data quality requirements of a specific department. division or data domain. They work with a team of ONE operators and other roles to ensure the data governance criteria are met. Data owners are usually senior business managers.
Data Steward works with both technical assets, like tables, fields, files, systems, or models, and business assets, like business terms, acronyms, KPIs, or reports. These users manage the life cycle Of assets, track data quality, and create reports for Data Owners. Data Consumer works with metadata only. They are business or technical users with limited knowledge of data management. AS such, they can view metadata but are not allowed to view actual data values.

Each Governance Role defines the access levels on the list Of nodes. Full access: is a complete set of permissions to an asset. including the permissions to delete, create, publish, and share. Editing access: This allows the user to edit drafts on the corresponding node. The editor cannot share access to the node with other users or groups or delete or publish assets. Operate access: Allows to trigger operation actions on the corresponding asset, such as reindexing OpenSearch, synchronizing users from KeyCloak, View data access: Viewers can view all data and metadata but can't edit anything. Share view access allows other users and groups view real data, to review assets, and add comments. View page access: Allows viewers to view the landing pages and their content. Making changes to landing pages is not allowed. View metadata access: Viewers can view metadata but Cannot edit anything. Share view metadata access allows Other users and groups to access only metadata,