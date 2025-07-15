---
title: Sharing access to assets
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
Sharing access allows providing access to other groups and users at the asset level. If a data asset is not shared and no stewardship group is selected, it is only visible to the creator. By default, the creator Of the asset has Full access to it. Only administrators or users With appropriate sharing permissions can manage access rights for a data asset if default settings are used.
![[Pasted image 20250714215732.png]]Users in a parent group automatically get access to assets shared with child groups at the same access level. Child groups receive access to assets shared with their parent group. Members Of isolated groups or branches can only share assets and assign stewardship within their own group or branch, Avoid adding users to the top Organization parent group to prevent them from automatically getting access to all entities Shared with Child groups. Manage individual users in groups under the Organization parent group to prevent unintended access. Use the Organization parent group if you need to share assets with the entire organization, as access rights will be inherited regardless of user inclusion.