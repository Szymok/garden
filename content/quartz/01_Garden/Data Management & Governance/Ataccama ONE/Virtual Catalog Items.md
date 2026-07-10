---
title: Virtual Catalog Items
created: 2026-07-10
status: 🌱 draft
category: Ataccama ONE
difficulty: średni
language: en
tags:
  - ataccama
  - data-catalog
  - data-virtualization
  - metadata
aliases:
  - Virtual Catalog Items
  - VCI
---
# 🎯 Definition
A **Virtual Catalog Item (VCI)** in [[Ataccama.md|Ataccama ONE]] is a logical representation of data stored in the Data Catalog that does not map directly to a single physical table or file. Instead, VCIs utilize data virtualization to combine, filter, or transform metadata and columns from one or more physical sources (like databases or APIs) into a single, logical virtual table, without physically replicating or moving the underlying data (zero-copy data sharing).

# 🔑 Key Takeaways
*   **Zero-Copy Access:** VCIs expose structured views of data to users without running expensive ETL replication or consuming additional physical storage.
*   **Semantic Layering:** VCIs act as a bridge between technical databases (with complex schemas and cryptic column names) and business-friendly representations.
*   **Virtual Joins:** Allow joining data across different sources (e.g., joining an Oracle customer table with a CSV file on a secure share) dynamically at query time.

# 📚 Detailed Explanation
In traditional catalog architectures, every catalog item is a direct reflection of a physical database asset (such as an `oracle_db.customers` table). 

Ataccama ONE introduces VCIs to support agile data consumption and governance:
1.  **Logical Views:** Similar to a view in SQL, a VCI is defined by a query or a set of transformation rules (built visually or via SQL expressions).
2.  **Governance Layer:** Because VCIs are native Catalog items, they inherit standard Ataccama ONE governance features:
    *   They can have automated [[Katalog Danych|Data Quality Rules]] assigned to them.
    *   They can be mapped to business terms in the Glossary.
    *   Access permissions can be controlled at the VCI level (restricting access to specific virtual columns).
3.  **Performance:** At query time, Ataccama's virtualization engine translates the request into optimal queries pushed down (Query Pushdown) to the source databases, aggregating results on-the-fly.

# 💡 Use Cases & Examples
*   **Data Masking for Analytics:** A data steward creates a VCI based on a physical `Employees` table but excludes sensitive columns (e.g., `Social_Security_Number`, `Salary`). The data science team is granted access to the VCI instead of the raw physical table.
*   **Federated Customer Profile:** A VCI that virtualizes and joins transactional data from PostgreSQL and reference country codes from a CSV file to present a unified "Customers with Countries" object in the catalog search interface.

## 📌 Sources
*   [[Ataccama ONE Explorer|Browsing and discovering catalog items in Ataccama ONE]]
*   [[SQL Catalog Item|SQL Catalog Items vs Virtual Catalog Items]]
