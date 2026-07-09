---
title: Wstęp do GraphQL
created: 2026-05-06
status: 🌱 draft
category: Data Engineering
difficulty: średni
language: pl
tags:
  - graphql
  - api
  - ataccama
  - query-language
aliases:
  - GraphQL Introduction
---
GraphQL is a query language for your API, and a server-side runtime for executing [[Queries|queries]] using a type system you define for your data. Promoting efficient data fetching, GraphQL allows clients to request precisely the data they need, eliminating unnecessary data transfer. Fast and flexible, it fetches all required data in a single request, boosting app performance even on slower connections, unlike REST APIs with multiple endpoints. Developer-friendly design simplifies development by executing [[Queries|queries]] based on a type system defined for your data, making APIs adaptable to future changes. Agnostic to storage, it leverages your existing code and data structure for maximum compatibility, without being limited by specific databases or storage engines.

The ONE API can be accessed using GraphQL, which allows for querying and updating (mutation) Of the [[Metadata|metadata]] (configuration) of objects in ONE. It's important to note that the GraphQL API does not retrieve or change the actual data, only the [[Metadata|metadata]]. Depending on how the request is created, it is possible to retrieve one or multiple entities, including their content and embedded attributes. Here are a few examples of how GraphQL can be used with ONE: Retrieve a list of all terms owned by a user Query all validation [[Rules|rules]] currently in draft state Start the DQ evaluation on a catalog item Get the status of a job Duplicate a term Publish a rule in the draft state Delete a catalog item Create a new entity