---
title: Azure Big Data & Analytics Services
type: post
tags: 
- BigData
- Extraction
- Processing
- Analysis
- LargeScale
- ComplexData
aliases:
---
## What is Big Data?

**Big Data** is a field of technology that helps with the **extraction**, **processing** and **analysis** of information that is **too large or complex** to be dealt with by traditional software.

### The three V’s rule

Big data typically has one of the following characteristics

- **Velocity** - how fast the data is coming in or how fast we are processing it
    - Batch
    - Periodic
    - Near Real Time
    - Real Time
- **Volume** - how much data we are processing
    - Megabytes
    - Gigabyte
    - Terabytes
    - Petabytes
- **Variety** - how structured/complex the data is
    - Tables
    - Databases
    - Photo, Audio
    - Video, Social Media

## Azure Synapse Analytics

- Big data analytics platform (PaaS)
- Multiple components
    - Spark
    - Synapse SQL
        - SQL pools (dedicated – pay for provisioned performance)
        - SQL on-demand (ad-hoc – pay for TB processed)
    - Synapse Pipelines (Data Factory – ETL)
    - Studio (unified experience)

## Azure HDInsight

- Flexible multi-purpose big data platform (PaaS)
- Multiple technologies supported (Hadoop, Spark, Kafka, HBase, Hive, Storm, Machine Learning)

## Azure Databricks

- Big data collaboration platform (PaaS)
- Unified workspace for notebook, cluster, data, access management and collaboration
- Based on Apache Spark
- Integrates very well with common Azure data services