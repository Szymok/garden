---
title: Metadata Model Graph
created: 2026-05-06
status: 🌱 draft
category: Data Governance
difficulty: średni
language: en
tags:
  - ataccama
  - metadata-model
  - graph
  - entities
---
To view the metadata graph, go to Global Settings > Metadata Model > Model Graph: 1. 2. 3. 4. Entity type filter: Metadata model entities are categorized into two types. To show all types of entities and their connections, select the All filter. System - Their instances and subtypes describe the configuration of the system layer.(Used internally by the application). Business - This type Of entity is governed by organization. They represent metadata that is important in a business sense. Metadata box: Connects to other entities with lines. To highlight the connections, hover over the line. Entities: Shown as boxes, with their properties listed inside. The connection type: Appears above the connections, for example, AEE, SRE, SEE, etc.
To look for a specific entity, select the search icon in the upper-right corner and type the entity name. The entity you are looking for is shown and highlighted in green. Manage the graph size: â€¢ The icons in the lower-right corner can help with orienting and managing the graph size
Adding an object to the model graph is done through creating a new entity. Creating an entity in ONE strictly means defining a new entity type. This is done from the Global Settings (1) > Metadata Model (2). Each entity defines a section (or node) in the web application. Where the new entity is displayed depends on its position within Navigation (3)


I. 2. Go to Global Settings > Metadata Model. Select Create Entity and add the General information as follows: Name: Name of the entity. a. b. Extends: (Optional) Select from the dropdown list available to define Extends for the entity. Doing so extends a node property with additional properties inherited from another node.
c. 1. II. Ill. Properties: These define the input fields available in the web application. Name: property name displayed in the web application. Type: select a Simple (scalar) or an Object type property. Required: select to make the property mandatory.3. 4. 5. Select Save. (Optional) Add Traits as required. Traits are properties that are defined by plugins and add additional functionality or change the appearance of the entity. You will now see the draft bar at the top of the screen, click Apply changes.

1. 2. 3. 4. To add your new entity as a property of the main metadata model, in the Metadata Model, search for and select metadata. Select Add Property. Name is case sensitive and must match the name of your new entity. Name: 'entity name' a. b. Type: Embedded object array Object: (use the search bar to search c. for your newly created entity) Select Save. You should now be able to see your entity in the list of Properties for metadata. GO back to the Metadata Model and click Apply changes.