---
title: Metadata Model Overview
created: 2026-05-06
status: 🌱 draft
category: Data Governance
difficulty: średni
language: en
tags:
  - ataccama
  - metadata-model
  - entities
  - configuration
---
ONE uses a metadata model for creating the user interface. The metadata model defines entities, their properties, traits, and relationships. An entity represents a type of data asset or a section in ONE. Entities are visualized as nodes on the model graph. The metadata model can be configured in two ways: Making changes directly in Global Settings > Metadata Model. This includes the following: â€¢ Creating custom entities. e Adding properties and traits to entities, both custom and default. Adding changes in the form of JSON files in Global Settings > System Changes.
Metadata model entities are categorized into the following types: System - Used internally by the application. Their instances and subtypes describe the configuration of the system. Business - This type of entity is governed by your organization. They represent a framework for metadata that is important in a business sense. The metadata model in ONE consists of metadata and meta-metadata. Entities are referred to as what is defined or included in the metadata model. For example, the entity source. Instances are referred to as the instances of data (that is, data assets). For example, in the case of the source entity, instances could include AWS S3, a local filesystem, MDM, or others. Editing and deleting the basic configuration of all default entities is disabled. However, you can change the metadata model by adding properties and traits to default entities and creating custom entities.
The Metadata Model screen provides the following options: 1. 2. 3. 4. 5. 6. 7. 8. Metadata Model: list of entities that make up the model Model Graph: view a detailed schema of all entity connections within the model Full-text search field: search for specific entities Individual entities: View the details of their configuration and make needed changes. Entity type filter: by default, the metadata model is filtered to only show business entities. You can use the Entity type filter to either show all or business entities only. Create: start creating a new entity. Chat documentation Share: share access to the metadata model with groups and users