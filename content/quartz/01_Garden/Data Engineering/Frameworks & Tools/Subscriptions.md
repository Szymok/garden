---
title: GraphQL Subscriptions
created: 2026-05-06
status: 🌱 draft
category: Data Engineering
difficulty: zaawansowany
language: en
tags:
  - graphql
  - api
  - ataccama
  - real-time
  - subscriptions
---
GraphQL Subscriptions enable real-time data updates by establishing a persistent connection between the client and the server. GraphQL Subscriptions offer developers a powerful tool for building real-time applications with GraphQL, enhancing user experiences and enabling dynamic, interactive features. Subscriptions follow a similar syntax to [[Queries|queries]] and [[Mutations|mutations]] in GraphQL, making them easy to integrate into existing GraphQL APIs. Subscriptions are useful as clients often desire pushed updates from the server when relevant data changes. Subscriptions work like [[Mutations|mutations]]; they list events you can subscribe to, just as [[Mutations|mutations]] list actions you can take. Clients can specify data they want to be pushed with a subscription using GraphQL selection. In ONE, we can subscribe to the ONE MMM eventing system using GraphQL.

Subscribe to events The subscription can be customized by defining which events the client should subscribe to (entity _ type). They can be customized by limiting the number Of roundtrips the client makes, which is done through batching events into larger chunks (chunkSize and chunkMaxDelay). To prevent overwhelming the client with events, processed events need to be acknowledged (ackLimit), after which MMM can continue to send newly created events. As the eventing system supports disconnected scenarios, no events are missed in case the client goes offline.

Event data consists of the following elements for each event: id: The identifier of the event, numbered in an increasing sequence. timestamp: The date and time when the event was initiated, in XML format. entityld: The unique identifier of the entity associated with the given event. entityType: The entity type. entityStatus: Describes how the entity was modified (CREATED, UPDATED, DELETED).
Acknowledge events After the received events have been processed, they need to be acknowledged (at least after every ackLimit number of events). Acknowledge event can be done using the following operation.


Unsubscribe and Retrieve subscription status • In case you no longer want to receive events, you can unregister the subscription using the following operation. GraphQL operation for unregistering a subscription mutation($id: GID!){ _ unsubscribeExternalEvents(subscriptionld: $id) • If you do not remove a subscription this way, it is automatically discarded after the period of time configured using the property: plugin.external-events.[[Ataccama|ataccama]].one.externalev ents.subscribers-retention-period. The subscription status can be obtained using the following query. In addition to the subscription status (status), the query returns the subscription identifier (subscriptionld) and the number of undelivered events (undeliveredEventCount). GraphQL query for retrieving subscription status query status($id: GID!){ _externalEventsSubscriptionStatus(subscription ld:$id){ subscriptionld undeliveredEventCount status