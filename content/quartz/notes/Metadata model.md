---
title: Bez nazwy
created: 2025-03-28
status: draft
category: ataccama
difficulty: 
language: pl
tags:
  - 
aliases:
  - 
---
# 🎯 Definicja
Meta Meta Data Model


# 🔑 Kluczowe punkty

# 📚 Szczegółowe wyjaśnienie

# 💡 Przykład zastosowania
```python

```
## 📌 Źródła
- https://support.ataccama.com/home/docs/aip/latest/development-guides/one-development-guide/configuring-the-metadata-model
- https://support.ataccama.com/home/docs/aip/latest/user-guides/one-web-application-user-guide/one-basics/searching-in-one-web-application#SearchinginONEWebApplication-SearchingUsingAQL
## 👽 Brudnopis
Metadata describing data
Meta Metadata describing the meta data, it describes the meta data model in Ataccama. The Metadata Model describes the entities and their properties in the application. Metadata model is located in the Organization tab, under Application Settings > Metadata Model Graphical visualisation of the model is found under Organization under Application Settings > Model Graph To be able to edit MMD model, a user role has to have an application-admin capability. 
We have Metadata graph and model in settings. 
Model consists of objects. They are properties of the objects like name or links to other objects. Inheritance is important here. 
[[notes/AEE]]
[[notes/SRE]]
A(Array of references)E(embedding entities)E 
S(single of references)R(referencing entities)E 
Embedding means it is a integral part of something
Referencing just connects to already created.
Person have a array of role references and during deleting the person the references roles(AEE) also are deleted but the the roles(SRE) stays.
[[notes/Custom Filter]]

Chaning Metadata changes application behavior. Changing Meta Metadata changes application structure. 
![[images/Pasted image 20250401144757.png]]
Metadata Driven
![[images/Pasted image 20250401144816.png]]
[[notes/Metadata Sync]]
