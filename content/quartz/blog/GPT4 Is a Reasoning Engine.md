---
title: GPT4 Is a Reasoning Engine
type: blog post
tags: 
aliases:
---
In 1894, a Boston-based astronomer named Percivel Lowell [found intelligent life](https://books.google.com/books?id=CSk6AQAAMAAJ&pg=PA446&dq=%22mars+in+1907%22&hl=en&sa=X&ved=0CCIQ6AEwAWoVChMIq7CR8rqdyAIVxBo-Ch2WnQaP#v=onepage&q=%22mars%20in%201907%22&f=false) on Mars.

Looking through a telescope from his private observatory he observed dark straight lines running across the Martian surface. He believed these lines to be [evidence of canals](https://en.wikipedia.org/wiki/Martian_canals) built by an advanced but struggling alien civilization trying to tap water from the polar ice caps. 

He spent years making intricate drawings of these lines, and his findings captured public imagination at the time. But you’ve never heard of him because he turned out to be dead wrong. 

In the 1960s, NASA's Mariner missions captured high-resolution images of Mars, revealing that these "canals" were nothing more than an optical illusion caused by the distribution of craters on the planet's surface. With the low resolution available to his telescope at the time, these craters looked to Lowell like straight lines which, through a chain of reasoning, he theorized to be canals built by intelligent life.

Lowell’s story shows that there are at least two important components to thinking: reasoning and knowledge. Knowledge without reasoning is inert—you can’t do anything with it. But reasoning without knowledge can turn into compelling, confident fabrication.

Interestingly, this dichotomy isn’t limited to human cognition. It’s also a key thing that people fundamentally miss about AI:

Even though our AI models were trained by reading the whole internet, that training mostly enhances their reasoning abilities not how much they know. And so, the performance of today’s AI models is constrained by their lack of knowledge. 

I saw Sam Altman speak at a small Sequoia event in SF last week, and he emphasized this exact point: GPT models are actually reasoning engines not knowledge databases. 

This is crucial to understand because it predicts that advances in the usefulness of AI will come from advances in its ability to access the right knowledge at the right time—not just from advances in its reasoning powers.

## Knowledge and reasoning in GPT models

Here’s an example to illustrate this point. GPT-4 is the most advanced model on the market today. Its reasoning capabilities are so good that it can get a 5 on the AP Bio exam. But if I ask it who I am it says the following:

[![](https://d24ovhgu8s7341.cloudfront.net/uploads/editor/posts/2544/optimized_RMlISRllIOtDUscBSy5xPINOMibtTtZ3ahW3h-egvu6Sv5zGf53Tecld4XcYpqtHDPkH66yC_3g0CxPKruJ-ZcJy-s30B5QNZdbPR_moPU0p0TpgMJq9BXJtFkasZnA-TSNjO8elDM44e31NqaNVOg.png)](https://d24ovhgu8s7341.cloudfront.net/uploads/editor/posts/2544/optimized_RMlISRllIOtDUscBSy5xPINOMibtTtZ3ahW3h-egvu6Sv5zGf53Tecld4XcYpqtHDPkH66yC_3g0CxPKruJ-ZcJy-s30B5QNZdbPR_moPU0p0TpgMJq9BXJtFkasZnA-TSNjO8elDM44e31NqaNVOg.png?link=true)

That’s close to being right except for one big problem…I’m the co-founder of a few companies, but neither of them are Superhuman or Reify. 

AI critics will be quick to say that this proves GPT-4 is nothing more than a stochastic parrot, and that its results should be dismissed offhand. But they’re wrong. Its performance improves dramatically the second it has access to the right information.

For example, I have access to a version of ChatGPT that can use web searches to _ground_ its answers with what it finds on the internet. 

In other words, instead of using its reasoning capabilities to come up with a theoretically plausible answer, it does web research to create a knowledge base for itself. It then analyzes the collected information and distills a more accurate answer:

[![](https://d24ovhgu8s7341.cloudfront.net/uploads/editor/posts/2544/optimized_ja1X5gRQW-xISeLCT_HQ_q8T2wBrtJu6wByK2F6PABaT6LpX3z-GeHVGAdNH6oUTXPmd8NOfFb9sAHwjdM0jBiJoh8H2a_ASM4fteCp1ZyGSpFRfbrtbJ6Wa8SPLKBJZBeBicupE443tJhnz4yDkrg.png)](https://d24ovhgu8s7341.cloudfront.net/uploads/editor/posts/2544/optimized_ja1X5gRQW-xISeLCT_HQ_q8T2wBrtJu6wByK2F6PABaT6LpX3z-GeHVGAdNH6oUTXPmd8NOfFb9sAHwjdM0jBiJoh8H2a_ASM4fteCp1ZyGSpFRfbrtbJ6Wa8SPLKBJZBeBicupE443tJhnz4yDkrg.png?link=true)

[![](https://d24ovhgu8s7341.cloudfront.net/uploads/editor/posts/2544/optimized_ucsQYk_y4CPbr1mydo299SPFqQyP9U-KWPLUFIuftma4VF5y6vo0A01DGIhQEGn2satPmrzew5TODOZ68v68X44jQMu0zcinXADaIpnZLpamqnpPqMuX107G-Jr6Jm-3TBAhVmwvTq8vkl473f9GKQ.png)](https://d24ovhgu8s7341.cloudfront.net/uploads/editor/posts/2544/optimized_ucsQYk_y4CPbr1mydo299SPFqQyP9U-KWPLUFIuftma4VF5y6vo0A01DGIhQEGn2satPmrzew5TODOZ68v68X44jQMu0zcinXADaIpnZLpamqnpPqMuX107G-Jr6Jm-3TBAhVmwvTq8vkl473f9GKQ.png?link=true)

Now, that’s pretty good! The underlying model is the same—but the answer improves significantly because it has the right information to reason over. 

What’s going on here? GPT-4’s architecture is not public, but we can make some educated guesses based on previous models that have been released. 

When GPT-4 was trained, it was fed a large portion of the available material on the internet. Training transformed that data into a statistical model that is very good at, given a string of words, knowing which words should follow from it—this is called next token prediction.

However, the kind of “knowledge” contained in this statistical model is fuzzy and inexplicit. The model doesn’t have any sort of long-term memory or way to look up the information it has seen—it only remembers what it encountered in its training set in the form of a statistical model.

When it encounters my name it uses this model to make an educated guess about who I am. It draws a conclusion that’s in the ballpark of being right, but is completely wrong in its details because it doesn’t have any explicit way to look up the answer.

But when GPT-4 is hooked up to the internet (or anything that acts like a database) it doesn’t have to rely on its fuzzy statistical understanding. Instead, it can retrieve explicit facts like, “Dan Shipper is the co-founder of Every” and use that to create its answer.

So, what does this mean for the future? I think there are at least two interesting conclusions:

1. Knowledge databases are as important to AI progress as foundational models
2. People who organize, store, and catalog their own thinking and reading will have a leg up in an AI-driven world. They can make those resources available to the model and use it to enhance the intelligence and relevance of its responses.  

Let’s take these one at a time.

## **Knowledge databases are surprisingly important**

When it comes to knowledge you want to be able to store a lot of it, and you want to be able to find the right piece of knowledge at the right time. In AI this is typically done with a vector database. 

Vector databases allow you to easily index and store large amounts of information, and then quickly query for similar pieces of information to give to your model when you need to. They’re so common in AI apps that it’s likely almost every demo you’ve tried over the last few months has included a vector database for some part of their functionality.

In fact, if you want to make an investment that indexes the success of companies building in AI as a whole, one smart move would be to invest in a vector database provider, or a basket of them. (Alternatives might be to invest in OpenAI, or a basket of large cap software companies like Microsoft and Google that build AI, or chipmakers like NVIDIA that build the GPUs that AIs run on.)

Smarter investors than me seem to agree. Pinecone, the most popular vector database, just [raised money at a $700m valuation](https://www.businessinsider.com/chroma-weaviate-pinecone-raise-funding-a16z-index-vector-database-ai-2023-3). Smaller alternatives like Weaviate and Chroma aren’t far behind, and they’re also reportedly raising money at steep valuations. 

Interestingly, though, most of these vector databases were originally built before the large language model ([LLM](https://en.wikipedia.org/wiki/Large_language_model)) craze. Vectors are incredibly important for all sorts of previous-generation machine learning algorithms like [recommendation systems](https://every.to/napkin-math/recommendation-algorithims-are-good-sort-of). As a result, the database tooling from providers like Pinecone isn’t purpose built for large language models like ChatGPT.

We’re already seeing newer alternatives springing up that wrap some [business logic](https://en.wikipedia.org/wiki/Business_logic) around the database layer to make it easier for AI developers to do common tasks. Some of these are developer libraries like Langchain and LlamaIndex. And some seem to be more fully featured developer tools like [Metal](https://www.getmetal.io/?utm_source=every) and [Baseplate](https://www.baseplate.ai/?utm_source=every). Just like Pinecone, are also likely to raise a lot of money or already have! AI’s advancement is a raindance that calls forth capital from Patagonia vest wearing angels. 

I find this very exciting because it will make it a lot easier to make AI apps. There’s a tremendous amount of boilerplate code being written to take, say, a PDF or a webpage with interesting information on it, parse it, break it into chunks, store it, and retrieve it for use in AI apps. The more that can happen with just a line or two of code, the better.  

When I talk to people about vector databases—even people who have been following AI closely—they typically say, “What’s that?” I think, over time, that will change significantly as we start to understand how important it is for these models to have access to the knowledge that they contain.

Vector databases are how information gets stored and made available to AI applications. One place that I think they’ll get a lot of valuable information from is private, personal knowledgebases.

## **Private repositories of knowledge are going to be very valuable**

People have been saying that data is the new oil for a long time. But I do think, in this case, if you’ve spent a lot of time collecting and curating your own personal set of notes, articles, books, and highlights it’ll be the equivalent of having a topped-off oil drum in your bedroom during an OPEC crisis. 

Why? It’s [expensive and time consuming](https://every.to/chain-of-thought/gpt-4-a-copilot-for-the-mind) to find information that’s relevant to the things you think about. Even if you give AI access to a search engine, so it can make queries to find the right information—it’ll cost you money and time.

If, instead, you’ve spent a lifetime gathering and curating  information that’s important to you, you can customize your AI experience so it’s more useful to you right off the bat.

Apps like [Readwise Reader](https://read.readwise.io/) or Pocket or Instapaper that allow you to store articles you’ve read (or articles you want to read) are going to be a gold mine to the extent that they hook up to AI tools. They’ll be extra useful because they record the articles you explicitly bookmarked and read, this will make it easier for AI tools to know which pieces of information to weight in their responses.

But the use of personal knowledge databases will get weirder and more advanced than this.

For example, Rewind is a tool that sits on your computer and records everything you see and everything you type. It’s all stored locally for privacy purposes, and you can already hook it up to ChatGPT.

In one of their demos they show a user asking, “What did I do last week?” The AI is able to summarize all of the tasks they did on their computer:

[![](https://d24ovhgu8s7341.cloudfront.net/uploads/editor/posts/2544/optimized_Lr4OCggcxkm3xPCVuwUC3hNStaasmoj_DDWd2L4ZdVmH3hLgBVeIyCyQ7AswxVD3YaxPSzZtk2-9Cek7gxeoMIFWfHD7lX2PRVItNVmPX3_cjpEOtHeLG3QgHvCQe8UF2J8f7fA_RjGV09judL5AwA.png)](https://d24ovhgu8s7341.cloudfront.net/uploads/editor/posts/2544/optimized_Lr4OCggcxkm3xPCVuwUC3hNStaasmoj_DDWd2L4ZdVmH3hLgBVeIyCyQ7AswxVD3YaxPSzZtk2-9Cek7gxeoMIFWfHD7lX2PRVItNVmPX3_cjpEOtHeLG3QgHvCQe8UF2J8f7fA_RjGV09judL5AwA.png?link=true)

For my part, I’ve installed Rewind, and I’ve been playing around with building little tools to save more of what I encounter online. I made a little app I call Tend that sits open on my browser all day, and I can feed it any articles with interesting information for indexing and storage. Later, I’ll build a little ChatGPT plugin to give me access to all the information I saved with it.

## Wrapping up

When we talk about the future of AI, we tend to focus on its output. Given a prompt, it can think through a complex problem, compose an essay, or create a new scientific breakthrough without much human involvement. 

We tend to underappreciate the significance of the input—what information we feed it to produce those results. Its answers are largely dependent on the information we make available to it for analysis. It’s only as powerful as its starting point.

We don’t pay enough attention to the limits of its knowledge—how much information is locked away,  inaccessible to these systems. We also forget how expensive (both in time and in [compute](https://www.techopedia.com/definition/6580/compute)) it is to crawl through information sources and find relevant facts. And finally, we underestimate the difficulty of surfacing relevant pieces of information for the model at the right time.

But solving these sorts of problems is just as fundamental as solving for the reasoning capabilities of the underlying models. I’m excited to see what people build.