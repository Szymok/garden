---
title: ONE Desktop
created: 2026-05-06
status: 🌱 draft
category: Data Governance
difficulty: średni
language: en
tags:
  - ataccama
  - one-desktop
  - desktop-client
aliases:
  - ONE Desktop
---
# 🎯 Definition
**ONE Desktop** (formerly known as Ataccama DQ Analyzer / DQ Client) is the thick-client desktop IDE used by developers to configure profiles, build data transformation pipelines (ETL), and design custom Data Quality (DQ) rules for the [[Ataccama.md|Ataccama ONE]] platform.

# 🔑 Key Takeaways
*   **Visual IDE:** Built on top of the Eclipse RCP framework, providing a drag-and-drop workflow designer to assemble steps into "plans" (with `.comp` or `.plan` extensions).
*   **Local Execution:** Allows developers to test data pipelines and expressions locally on their computers using a built-in Java execution engine before publishing them.
*   **Extensible Processing:** Supports advanced scripting steps, custom SQL steps, and API integrations like [[Desktop JSON Call Step General Configuration|JSON Call configuration steps]].

# 📚 Detailed Explanation
While business users interact with the web interface of Ataccama ONE, data engineers use ONE Desktop to create the rules that run under the hood.

Key files and configurations designed in ONE Desktop include:
1.  **Profiles (`.prf`):** Configuration defining how to inspect a database table to count null values, calculate standard deviations, or discover values.
2.  **Plans (`.plan`):** Data processing flows consisting of input readers, transformers (filters, joins, lookup mappings), and outputs.
3.  **Components (`.comp`):** Reusable data quality rules that can be shared across multiple plans (e.g. checking email format or validating postal codes).
4.  **Expressions:** Custom syntax using the Ataccama expression language to perform data validation logic.

Once components and profiles are tested and verified locally, developers commit and publish them to the central Ataccama ONE server, where they run automatically as part of scheduled catalog monitoring.

# 💡 Use Cases & Examples
*   **Building a Custom DQ Rule:** A developer uses ONE Desktop to construct a validation component that takes a credit card number, strips whitespaces, runs the Luhn algorithm via a Java step, and outputs a boolean value.
*   **JSON API Call:** A developer configures a [[Desktop JSON Call Step General Configuration|JSON Call step]] to enrich incoming rows by calling an external address validation API.

## 📌 Sources
*   [[Ataccama.md|Ataccama ONE Platform]]
*   [[Desktop JSON Call Step General Configuration|Desktop JSON Call Step General Configuration]]
*   [[GraphQL Queries (Ataccama)|GraphQL Queries (Ataccama)]]


