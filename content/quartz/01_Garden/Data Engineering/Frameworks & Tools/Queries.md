---
title: GraphQL Queries
created: 2026-05-06
status: 🌱 draft
category: Data Engineering
difficulty: średni
language: en
tags:
  - graphql
  - api
  - ataccama
  - queries
---
GraphQL queries are the primary means Of retrieving data from a GraphQL API. Unlike traditional RESTful APIs where endpoints are predefined for specific data retrieval, GraphQL allows clients to request exactly the data they need, in a single query, from a flexible schema. A GraphQL query is a textual representation of the data requirements of a client. It typically starts with the "query" keyword followed by the name of the query and a set of fields. GraphQL query fields represent the data the client wishes to retrieve. Each field can contain nested fields to specify related data. GraphQL supports nested queries, allowing clients to retrieve related data in a single request.

List entities
You can retrieve an entity, including its content and the embedded attributes, by the entity identifier. The operation also lets you query deep structures such as embedded entities and references. It is also possible to apply: â€¢ primitive ordering (orderBy: [{ property: "name", direction: ASC } l) â€¢ pagination (skip, size, cursor) e filtering (filter for AQL, query for AQL that is preprocessed by AI, queryPartss for user-friendly filters which are processed by Al).

List catalog items
â€¢ TO view all catalog items that you can access, use the following query. â€¢ The query retrieves the identifier and name of each catalog item, alongside the identifiers and names of their respective attributes.

List an item attributes
TO get a list Of all attributes Of a specific catalog item, use the following query. The catalog item identifier (gid) is provided as a variable and its value is specified outside of the query.
List data sources â€¢ To list all data sources and their data source connections, run the following query:
List glossary terms To retrieve all available glossary terms, run the following query. The query returns the identifier and name of each glossary term.
List term types TO retrieve a list Of all terms types, along with term identifiers, use the following query. As needed, the query can be expanded to include additional information about terms.

List monitoring projects â€¢ TO run a monitoring project, you need the monitoring project identifier (projectld). â€¢ All project identifiers can be retrieved through the following query. GraphQL query for listing monitoring projects query getProjects { monitoringProjects(versionSeIector. { draftVersion: true { edges { node { gid


Retrieve occurrences â€¢ TO get an overview Of the entities to which a specific glossary term has been assigned, run the following query. The term identifier (gid) can be obtained using the previous query for listing term types. When the withCount argument is set to true, the total count also includes the occurrences on child entities. For example, this means that terms assigned to attributes are also counted for the catalog items containing those attributes. To calculate occurrences of only directly assigned terms (that is, to exclude catalog item counts), set the value to false. The query returns a list of available entities and the number Of times the term has been assigned to each entity type.
To get an overview of the entities to which a specific glossary term has been assigned, run the following query.
o o The term identifier (gid) can be obtained using the previous query for listing term types. When the withCount argument is set to true, the total count also includes the occurrences on child entities. For example, this means that terms assigned to attributes are also counted for the catalog items containing those attributes. To calculate occurrences of only directly assigned terms (that is, to exclude catalog item counts), set the value to false. The query returns a list Of available entities and the number of times the term has been assigned to each entity type.

Retrieve a term DQ aggregation results
This query aggregationResult returns DQ aggregated result for a term. aggregationResult lives under the term entity. It takes the last results from all attributes where the term is assigned and aggregates them. Parameters: â€¢ at - specifies what moment in history we are interested. All runs after this time are excluded from the aggregation.
This query, attributeAggregationResult, returns DQ aggregated result for a term at attributes level. There are a number of parameters that can be defined: Selector: Processing selector specifies which 1. runs should be included in the results. You can use these 3 approaches: Limit: returns last n runs. Use the format {limit: X}. e Time range: returns runs in specified time range. Unspecified to parameter means until present time. Use the format seen below. timeRange: { from: to: # stos parameter is optional
Processing ids: list of specific processing ids. Use the format seen below. selector: { processinglds: [ "34174311-f4bO-4efe-9462-272a066e6117", "OOe71092-a53b-47f4-ae50-792b777609e7" 2. attributes - List of attribute ids.

Retrieve Validity This query, validityAggr, returns the latest validity result for a term.


Profile catalog items TO start profiling catalog items, you first need to retrieve all available published profiling configurations, using the following query. There are two default profiling configurations: FULL and SAMPLE. If there are no user-defined profiling configurations, the listProfilingaConfigurations query returns only these two options. A profiling configuration needs to be published before it can applied during profiling. To specify which profiling configuration you want to use, you need to provide the unique identifier of that configuration (gid). The listProfiIingConfigurations query also returns details about the configuration itself, such as name, type, description, sampling limits, and information about anomaly detection.

Profile catalog items â€¢ The query triggers profiling on a catalog item. â€¢ These arguments are required: gid on the catalogltem field. Refers to the unique identifier of the catalog item that should be profiled. configld on the profile field. Points to the identifier (gid) of the selected profiling configuration, which was obtained using the listProfilingConfigurations query.

Profile catalog items TO check the job status after the profiling has started, run the following query. The gid argument on the job field matches the gid field on the profile item that is found in the results returned by the profiling query.