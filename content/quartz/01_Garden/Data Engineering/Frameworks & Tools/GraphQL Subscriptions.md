---
title: GraphQL Subscriptions
created: 2026-07-10
status: 🌱 draft
category: Data Engineering
difficulty: średni
language: en
tags:
  - graphql
  - subscriptions
  - websockets
  - real-time
aliases:
  - GraphQL Subscriptions
  - Subscriptions
---
# 🎯 Definition
**GraphQL Subscriptions** are a feature of the GraphQL specification that allows servers to push real-time, event-driven data updates to connected clients. Unlike Queries (fetch once) and Mutations (write once), Subscriptions establish a long-lived, bidirectional connection—typically over **WebSockets**—to push notifications immediately when specific database or application events occur.

# 🔑 Key Takeaways
*   **Real-time Push:** Clients receive data automatically without polling the server.
*   **Protocol Underlay:** While standard GraphQL queries and mutations use HTTP POST, subscriptions require a protocol that supports persistent connections, such as WebSockets (e.g. `ws://` or `wss://` protocols) or Server-Sent Events (SSE).
*   **Stateful Backend:** Subscriptions increase server memory usage because the server must maintain active connections for every client and track event pub/sub (publish-subscribe) networks (e.g., via Redis Pub/Sub).

# 📚 Detailed Explanation
GraphQL Subscriptions are designed for pushing updates about incremental modifications to large, dynamic datasets. 

The client registers a subscription query with the server:
```graphql
subscription OnRecordCreated {
  recordCreated {
    id
    name
    status
  }
}
```

The subscription flow works as follows:
1.  **Handshake:** The client initiates a WebSocket connection to the server.
2.  **Registration:** The client sends the subscription query document. The server registers this connection to a specific event stream (e.g., "record creation").
3.  **Event Trigger:** A separate mutation (or backend database change) publishes an event.
4.  **Data Push:** The server resolves the subscription query fields for that event and pushes the JSON payload to the listening client over the WebSocket.

In metadata platforms like [[Ataccama.md|Ataccama ONE]], subscriptions are utilized to dynamically update the catalog web UI (e.g., showing a progress bar of a running profiling job or alerting when a new catalog item has been created).

# 💡 Use Cases & Examples
*   **Real-time DQ Alerting:** A browser dashboard listening for Data Quality alerts. When a validation rule fails, the backend triggers an event, and the server pushes the DQ failure notification directly to the UI.
*   **Monitoring Pipeline Progress:** Pushing incremental load counts from an ETL workflow directly to a console.

## 📌 Sources
*   [[GraphQL Subscriptions (Ataccama)|GraphQL Subscriptions in Ataccama ONE]]
*   [[GraphQL Queries (Ataccama)|GraphQL Queries in Ataccama ONE]]
