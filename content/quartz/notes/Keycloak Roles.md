---
title: Keycloak Roles
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
There are three main Keycloak roles in ONE: MMM admin - must be assigned to at least one user, i.e., a superuser who should have full access and editing rights across the whole application. MMM _application_admin: Allows you to make changes on all tabs and items in ONE except for System changes, Database backups, and Metadata model. MMM_user : Grants first-time login as a 'Data Consumer' in the 'Default' group. Access automatically continues even without MMM _ user role once the user is assigned other identity provider roles or governance roles within any group. These are composite roles, meaning that the associated roles (admin application _ admin, and default) are assigned to users, thereby granting them MMM _ admin. MMM _ application_ admin. and MMM_ user roles.
Ataccama Module	prefix	Exa mple(c roleprefix» _ c roleName i)
ONE Web-application (Metadata Management Module)	MMM	MMM_data-manager
Data Processing Platform		DPP _ admin
Reference Data Management	RDM_	RDM_user
Master Data Management	MDM_	MOM _ viewer
Configuration Service	cs_	CS_admin
Data Quality Issue Tracker	DQIT _	DQIT _ supervisor