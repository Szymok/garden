---
title: Traits w Ataccama ONE
created: 2026-05-06
status: 🌱 draft
category: Data Governance
difficulty: średni
language: en
tags:
  - ataccama
  - traits
  - metadata-model
  - entity
---
You can use traits to further configure entities and their properties in ONE, namely to change their appearance or introduce additional functionality. There are two types of traits used in the application: Traits on properties. • Traits on entities. For example, the term entity has the following traits assigned: fe:mmdEntity: Lets you change the default icon or set the display name for the entity in singular and plural form. core:copyable: Makes the Duplicate button available on instances of this entity. This lets you easily create copies of a particular asset. relationships:enabled: Makes the relationship graph available for this entity.

Change the display name and icon of an entity. When creating a custom entity, by default is assigned: its display name which is derived from the transformation of the entity name. its icon that is displayed in the navigation bar and in the relationship graph. In order to change the icon and the display narne in singular and plural forms globally, you can use the fe:mmdEntity trait. You can also edit the navigation item of the entity in Global Settings > Navigation to configure the name and icon that are displayed in the navigation. However, this does not work globally. For example: If you assign the fe:mmdEntity trait to the keyperformancelndicator and configure its properties as follows: "iconName": "presentationDocument", "displayNameSingular": "[[KPI|KPI]]", "displayNamePlural": "KPIs" To see the available icons and their names: Go to Global Settings > Navigation: • Scroll through the available icons in the Icon list.

Change the display name of a property: Display names of properties are automatically derived from the property name. For example: • The property 'businessDefinition• becomes 'Business definition' in the IJI • 'cisoApprovedBy' becomes 'Ciso approved by' This does not work well for properties that need a more descriptive display name. In order to change the display name, assign the fe:mmdProperty and configure the displayName property. "displayName": "CISO PPA approved by" Enable the relationships tab: By default, the relationships tab is not available for custom entities. To enable the relationships tab, assign the relationships:enabled trait to your entity. Color code terms When you create a new term type, you can use trait to give it a distinct color. • To define the color for a term, assign the fe:term trait and add a color property in the following format: "color": "#FAAOAO" 