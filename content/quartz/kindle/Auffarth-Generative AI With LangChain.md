---

  bookId: '46588'
  title: >-
    Generative AI With LangChain: Build Large Language Model (LLM) Apps With
    Python, ChatGPT, and Other LLMs
  author: Ben Auffarth
  highlightsCount: 6
---
# Generative AI With LangChain
## Metadata
* Author: [[Ben Auffarth]]

## Highlights
If you've read and understood this chapter, you should be able to answer these questions: What is a generative model? Which applications exist for generative models? What's a large language model (LLM) and what does it do? How can we get bigger performance from LLMs? What are the conditions that make these models possible? Which companies and organizations are the big players in developing LLMs? What is a transformer and what does it consist of? What does GPT mean? How does stable diffusion work? How is stable diffusion trained? — location: [568]() ^ref-56520

---
Intrinsic hallucinations occur when the generated output contradicts the source content, while extrinsic hallucinations involve generating information that cannot be verified or supported by the source material. Extrinsic hallucinations can sometimes include factually correct external information, but their unverifiability raises concerns from a factual safety perspective. — location: [1403]() ^ref-8005

---
which respondent was human and which was a computer.Since the formation of the test, many AI have been able to pass; one of the first was Joseph Weizenbaum’s ELIZA. In 1966, he published an article about his chatbot ELIZA, “ELIZA - a computer program for the study of natural language communication between man and machine.” ELIZA was one of the first chatbots ever created and simulated the role of a psychotherapist.Created with a sense of humor to show the limitations of technology, the chatbot employed simplistic rules and vague, open-ended questions as a way of giving an impression of empathic understanding in the conversation, and was an ironic twist often seen as a milestone of artificial intelligence. — location: [1828]() ^ref-61957

---
DocArray is a Python package that provides a high-level API for representing and manipulating multimodal data. It provides various features like advanced indexing, comprehensive serialization protocols, a unified Pythonic interface, and more. Further, it offers efficient and intuitive handling of multimodal data for tasks such as natural language processing, computer vision, and audio processing.We can initialize the DocArray in-memory vector storage with different distance metrics such as cosine and Euclidean – cosine is the default.For the retriever, we have two main options: Similarity-search: We can retrieve document according to similarity, or Maximum Marginal Relevance (MMR): We can apply diversity-based re-ranking of documents during retrieval to get results that cover different results from the documents retrieved so far. — location: [2296]() ^ref-54897

---
ConversationBufferWindowMemory  only keeps the last K interactions, where K is the window size specified.Here’s a simple example of how to use  ConversationBufferWindowMemory  in LangChain: from langchain.memory import ConversationBufferWindowMemory memory = ConversationBufferWindowMemory(k=1) In this example, the window size is set to 1, meaning that only the last interaction will be stored in memory.We can use the  save_context()  method to save the context of each interaction. It takes two arguments: user_input and model_output. These represent the user’s input and the corresponding model’s output for a given interaction. memory.save_context({"input": "hi"}, {"output": "whats up"}) memory.save_context({"input": "not much you"}, {"output": "not much"}) We can see the message with  memory.load_memory_variables({}) In LangChain, we can integrate a knowledge graph to enhance the capabilities of language models and enable them to leverage structured knowledge during text generation and inference. — location: [2381]() ^ref-48957

---
What can LLMs do to help in software development? How do you measure a code LLM’s performance on coding tasks? Which code LLM models are available, both open- and closed-source? How does the Reflexion strategy work? What options do we have available to establish a feedback loop for writing code? What do you think is the impact of generative AI on software development? — location: [2931]() ^ref-53577

---
