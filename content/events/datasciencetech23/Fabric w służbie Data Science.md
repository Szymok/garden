---
title: Fabric w służbie Data Science
Data: 2023-12-15
type: event
---
# Abstrakt

# Opinia

# Notes

Ksiazka 
Building the
Data Lakehouse
Bill Inrnon father of data warehousing

# Persony
Przygotowane srodowiska do poszczegolnych zadan.

# Completet Analytics Platform

# Lake Centric and Open

Introducłng domains as an integral part of Fabric: A
domain is a way to logically group together all the data
tn an organtzatłon relevant to an area or field. accordłng
to business needs.
Domains are defined with domain admins and
contribators who can associate workspaces and group
them together under a relevant domain.
Federated governance be achieved by delegating
settings to domain «Ă:Imins. thus allowing them to
achieve more granular control over their business area.
Domains simplify discovery and consumption of data
across the organization, thus allowing business
optimized ccnsumption.
Avoid data swamps by endorsing certain data as
certified or promoted, thus ercouraging reuse.

To achieve data residency requirements. workspaces can reside in different regions around the world while Still being part of the same data lake. Data can reside in different regions without the overhead of managing different storage resources and without creating data silos. OneLake provisions storage resources for each workspace to meet demand for scale (capacity, throughput and IOPS). Underlying physical storage is virtualized away All Storage is zone redundant by default with an option for Geo redundancy

# One copy for all computes
Once data is stored in the lake, it is
directly accessible by all the engines
without needing any import/export.
You are able to choose the right
engine for the right job.
All the compute engines have been
fully optimized to work with Delta
Parquet as their native format.
Shared universal security model is
enforced across all the engines
(coming soon).

# Shortcuts virtualize data across domains and clouds
A shortcut is a symbolic link which points from one data location to another Create a shortcut to make data from a warehouse part of your lakehouse. Create a shortcut within Fabric to consolidate data across items or workspaces without changing the ownership of the data. Data can be reused multiple times without data duplication. Existing ADLS Gen2 storage accounts and Amazon S3 buckets can be managed externally to Fabric and Microsoft while still being virtualized into OneLake with shortcuts. All data is mapped to a unified namespace and can be accessed using the same APIs including the ADLS Gen2 DFS APIs.

# Better together through OneLake
All Fabric engines have been redesigned and optimized for delta/parquet as their storage format for tabular data Azure Databricks can directly read/write data from any Fabric data item stored in OneLake through extemal link. Existing non-Unity Catalog managed data in ADLS gen2 storage can be a shortcut into OneLake. Any Fabric engine including Power Bl with direct lake in OneLake or with shortcut. Coming soon: Unity Catalog and Fabric integration. Unity Catalog data will be available through Azure Databricks data item enhanced shortcuts experience.

# Unifying data in OneLake
Sharing data in OneLake is as easy as sharing files in OneDrive, removing the needs for data duplication With shortcuts, data throughout OneLake can be composed together without any data movement Shortcuts also allow instant linking of data already existing in Azure and in other clouds, without any data duplication and movement, making OneLake the first mufti-cloud data lake With support for industry standard APIs, OneLake data can be directly accessed by any application or service

# Mirrorying in Fabric
![[images/Pasted image 20231215150012.png]]
Fabric Mirroring enables adding existing databases and data warehouses to Fabric without any ETL A full editing experience of the source database is available for the Mirrored database. Data is replicated into OneLake in Delta format and kept up-to-date in near-real-time. All the Fabric experiences instantly work with the OneLake replica. Analysts and Data Scientists can work with real-time data. The replica protects operational databases from analytical queries.