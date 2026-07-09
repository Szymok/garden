---
title: Data Processing Engine Config
created: 2026-05-06
status: 🌱 draft
category: Data Governance
difficulty: średni
language: en
tags:
  - ataccama
  - dpe
  - spark
  - performance
  - configuration
---
The Data Processing Engine: Scaling and Tuning for Big Data Your Engine Is Everything • The DPE is the core component that reads, processes, and applies data quality rules to your data. • Proper configuration is crucial for achieving optimal performance and scalability when working with Big Data. • Performance can be impacted if DPE is not correctly configured.
DPM Admin console: Your central control Panel • Accessing the Console: Mention the default URL (http:/[localhost:8031, adjust for your environment), and that DPP_admin security roles are required. • Key Tabs for Big Data: Engines: Monitor DPE status, restart engines, and view configurations. Jobs: Monitor running tasks, identify performance issues or failures. Configuration: Review, change, and adjust the runtime configurations. • Show how to navigate the Ul
Tuning for Performance: Key Configuration Properties Configurations are present in the etc/ application . properties file, specifically for a cloud based DPE. The location of the main configuration is in the DPM Admin Console under configurations. The configuration is stored in XML syntax. You are able to upload new configurations, you do not need to SSH onto the server, with Ataccama Cloud These properties allow for more customization to enable spark processing. JVM memory size settings o O o Xmx2048m - the total amount of memory to use for the Data Processing Engine (DPE). If there's an issue with memory, you can look at the logging under troubleshooting. If we have to increase above those limits. We need to look at spark! Always monitor the DPE logs for OutOfMemoryErrors (00M) and adjust memory settings accordingly.
Spark Integration: Unleashing Distributed Processing Power • A good knowledge of Spark and how to read the spark logs is important. • If you are using large source data, check the "Enable Spark Processing" option in the data source configuration. Check the Spark Processing method, as this determines how the DPE creates a spark job. • Review how to check spark settings spark . serializer org . apache. spark. serializer . KryoSeria1ize spark . executor. memory spark . driver. memory
How to Troubleshoot issues with a DPE DPE not starting? See log files with $ sudo journalctl —u dpe Is the DPE registered with DPM? You can see what the DPM reports. o If spark is enabled? o O o Check if drivers are configured. ADLS needs Share spark job artefacts via ADLS Mount ADLS to cluster Out Of memory Error? Did you adjust "jMV Memory Settings"? Are you following all best practices? o