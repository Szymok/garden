---
title: Transformation Plans
created: 2026-05-06
status: 🌱 draft
category: Data Governance
difficulty: średni
language: en
tags:
  - ataccama
  - transformation-plans
  - dq
  - post-processing
aliases:
  - Transformation Plans
---
Provide the ability to export data and DQ evaluation results. Can be configured as an extension of [[Reports|reports]] from Monitoring Projects. Post-processing plans are created directly in the ONE Web application by selecting the respective [[Catalog Items|Catalog Items]] within a given [[Monitoring Project|Monitoring Project]]. DQ results can then be downloaded from the Export tab of the [[Monitoring Project|Monitoring project]].
To do [[Post Processing|post processing]] through a Transformation plan: 2. 3. In the Configuration & Results tab of your [[Monitoring Project|Monitoring Project]]. Select the options menu for the catalog item you wish to report on. Click Add post-processing transformation. As part of the process, provide a name for the plan.
• The generated post-processing plan will consist of an input (the DQ results for this catalog item), and an output (in CSV format), and can be used as-is once published. • As this is a Transformation plan, further steps can be added to filter or transform the results, as discussed previously in DQ Foundation.
The post-processing plans themselves can be found in Data QualitpTransformation plans. In common with other transformation plans, double click the plan's name to open it, allowing you to edit, add, or remove steps from the plan. Essentially, post-processing plans are a special type of transformation plan, created for the purpose of DQ [[Data Export|data export]].
