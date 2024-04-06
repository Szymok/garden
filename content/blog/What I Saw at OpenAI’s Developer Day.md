---
title: What I Saw at OpenAI’s Developer Day
type: blog post
tags: 
aliases:
---
I like to watch what people do when they think no one's looking.

That's the incredible thing about going to events like OpenAI's Dev Day: you get to see the things that the cameras don't pick up, and hear the things that don't get said on stage. 

It was all crowds, concrete, fast wifi, and LED lights. A magic show for AI nerds like me. 

I waded through the crowd doing my patented FCO: Furtive Conference Ogle. I would see someone maybe-famous—[Roon](https://twitter.com/tszzl), say, or [Karpathy,](https://twitter.com/karpathy) or [Kevin Roose](https://twitter.com/kevinroose)—and quickly glance down at their badge and back up at their face before they could give me a look like, "Hey, my eyes are up here, buddy!" 

I usually sit near the back at events, but at Dev Day I made sure to get a seat at the front. I wanted to see the magic up close.

Sam Altman walked on stage and greeted the crowd. I could see the taut, contained, nervous energy in his face and body as he performed. I could feel the hours of practice in his delivery. After a short opening monologue, Sam introduced a video of creative professionals, developers, and regular people talking about how they use ChatGPT. The lights dimmed, he stepped off to the side, and the video started. Everyone was watching the video, but I was watching Sam.

He was standing alone in the shadows on the corner of the stage. He was wearing dark jeans and Adidas x LEGO collab sneakers in primary colors. His hands were folded in front of him, and he stared intently at the floor. Sam is intense and always “on.” But on the side of the stage, listening to the video being played, he was unpracticed and unstudied. I felt like I had caught a magician’s left hand as he maneuvered a hidden coin, while the audience watched his right hand waving.

Seeing a magician's secret temporarily breaks their spell. But it also creates a new kind of magic: you see the magician as a human being. Eating, breathing, putting their pants on one leg at a time, and making magic all the same.

Sam is on his way to becoming a legendary figure in tech. But in that moment on the stage, he was also a human being. He looked like he was enjoying himself, observing and anticipating the thing he's made, and watching it play out on the biggest stage in the world. He was living the dream of anyone who’s ever built something and hoped the world would like it.

Watching him in that moment was worth the price of admission. I won’t soon forget it.

Here’s what he had to tell us:

Bigger, smarter, faster, cheaper, easier. 

That’s the summary of the changes that OpenAI announced yesterday. Let’s go through the updates one by one and discuss why they’re important.

## A new model: GPT-4 Turbo

### Bigger

OpenAI launched a new model, GPT-4 Turbo, that sports a 128K token context window. That means that each prompt you send to GPT-4 Turbo can be up to the equivalent of 300 pages of text. Here are a few things that can fit into 300 pages:

- 100% of _The Lean Startup_ by Eric Ries
- Three copies of _The Little Prince_ by Antoine de Saint Exupery
- At least half of my collection of moody journal entries from middle school

This is a 16x increase from the context window length of the most widely available version of GPT-4 prior to today. It significantly enhances the complexity and power of the queries developers can run with GPT-4. Previously, developers had to spend time and energy deciding what pieces of information to put into their prompts, which I’ve previously argued is one of the [most important bottlenecks for LLM performance](https://every.to/chain-of-thought/a-few-things-i-believe-about-ai?sid=27581). 

A 128K context window makes this task far easier, but it doesn’t solve every problem. Long context windows are hard to manage, and LLMs are more likely to forget or miss context the longer the inputted context gets. We don’t know if GPT-4 Turbo suffers from these problems yet, but I’ll let you know as I start to build things with it. 

### Smarter

GPT-4 Turbo is smarter than previous generations of OpenAI models, in a few ways.

**It can use multiple tools at a time.** The previous version of GPT-4 introduced tool use, which [I covered](https://every.to/chain-of-thought/gpt-4-can-use-tools-now-that-s-a-big-deal). Tool use allows GPT-4 to call out to developer-defined tools—like web browsing, calculators, or APIs—in order to complete queries. Previously, GPT-4 could only use one tool at a time. Now it can use many.

**Updated knowledge cutoff.** Previous versions of GPT-4 only knew about events up to September of 2021. This version is current up to April 2023, making it far more reliable.

**GPT-4 speaks JSON.** JSON is text that’s easily readable by non-AI applications. GPT-4 Turbo can return results reliably in this format—making it far easier to integrate into other pieces of software. Previously, developers had to cajole GPT to format its output correctly by, for example, telling GPT they would be fired if it messed up. No more cajoling necessary.

**GPT-4 can write and run code.** For a while, ChatGPT Plus users have been able to use [Code Interpreter](https://every.to/napkin-math/openai-s-code-interpreter-is-about-to-remake-finance) (later renamed Advanced Data Analysis), a ChatGPT plugin that can write and run Python code for you. It’s like a data scientist in your pocket—and now it’s available for developers to use and integrate into their own programs via the GPT-4 API. 

**Multimodal.** The GPT-4 API can accept images at input: developers can send it any image and GPT-4 can tell them what it sees. It can also do text-to-speech, meaning it can reply with human-like voices to text input. And it can do image creation with DALL-E.

### Faster

As far as I can tell there are no publicly available speed benchmarks, but Sam said it was faster. Based on my very scientific testing of playing with it in my PJs last night, he’s right. It’s really fast. It leaves GPT-4 in the dust and seems at least as fast as, if not slightly faster than, GPT 3.5 Turbo—the fastest previous model.. 

### Cheaper

GPT-4 Turbo is **3x** **cheaper** than GPT-4. I can’t remember a company that’s been able to so aggressively improve performance while also slashing the price. 

We’re lucky that OpenAI is running a Silicon Valley playbook designed to create mass adoption rather than just fat enterprise contracts. AI can be for everyone if it’s cheap enough—and that’s what OpenAI is aiming for.

 If IBM had invented GPT, do you think it would have done something like this? I don’t.

### Easier

OpenAI also made interacting with GPT-4 Turbo significantly easier for developers and non-developers alike. The company made a lot of the functionality of third-party libraries (and the boilerplate code developers normally write) unnecessary. Here are a few ways:

**Retrieval.** This is a big one. One of the most [important ways to improve LLM performance](https://every.to/chain-of-thought/a-few-things-i-believe-about-ai?sid=27581) is to give models access to private data, like company knowledge bases or personal notes. Previously, this functionality had to be built by hand ([like I did for my _Huberman Lab_ chatbot](https://every.to/chain-of-thought/i-trained-a-gpt-3-chatbot-on-every-episode-of-my-favorite-podcast)) or with third-party libraries like Langchain or LlamaIndex (the latter in which I’m an investor). OpenAI incorporated some of the functionality of these libraries into its core API with its Retrieval feature—making it significantly easier for developers to get started building GPT-4 apps.

It’ll be interesting to see what comes of this. On the one hand, it reduces the need for these third-party libraries. On the other hand, OpenAI’s retrieval mechanism is currently a black box with no configurability. Retrieval is a hard problem, and there are many different retrieval mechanisms for different purposes. OpenAI’s new release covers the basics, but Langchain and LlamaIndex implement a variety of retrieval types _and_ work with models not made by OpenAI—so there’s still some need for their services.

**Saved state.** I’ve written before that the [GPT-4 is like Drew Barrymore on _50 First Dates_](https://every.to/chain-of-thought/using-chatgpt-custom-instructions-for-fun-and-profit): every time you interact with it, you have to introduce who you are and why it loves you over and over again. The GPT-4 API can remember conversation history automatically through a new feature called Threads (no relation to Meta’s Twitter clone), saving developers time and hassle because they no longer have to manage conversation history themselves.

**Custom no-code ChatGPTs.** OpenAI also made it easy for anyone to build their own custom version of ChatGPT with private data—no programming required. Anyone can set up a version of ChatGPT with its own personality and access to private knowledge. This is a big deal. Earlier this year, [I built a bot for Substacker Lenny Rachitsky](https://www.lennysnewsletter.com/p/i-built-a-lenny-chatbot-using-gpt) based on his newsletter archives. Today’s update means anyone can build an equivalent bot—no code required. 

**GPT app store.** OpenAI announced the ability for anyone to list their GPT in a public app store and charge money for it. I’ve been arguing for almost a year that [chatbots are a new content format](https://twitter.com/danshipper/status/1721643301257068870)—this development bolsters that thesis.

**No switching models.** This is a huge, huge update. In previous versions of ChatGPT you had to select which model you wanted to use: GPT-3.5, GPT-4, GPT with DALL-E, GPT with Web Browsing, or GPT with Advanced Data Analysis. That’s no longer the case: now, you just type a message to ChatGPT, and it will select the right model for you. Users can more easily weave all of the different powers of ChatGPT together without switching back and forth, _and_ it creates new opportunities for developers (covered later in this article).

## Incremental updates—laying the groundwork for the future

All of these updates are great, but they’re mostly incremental. They build a lot of tasks that developers had to do themselves into the API proper, making building things faster, cheaper, and more powerful for developers. 

These features, though, lay the groundwork for a potentially more significant update: agents. Agents are models that can be assigned complex, multi-step tasks and left to accomplish them without supervision. That’s what GPT-4’s new Assistant API is about. 

This is the API that enables retrieval, saved state, and tool use (covered above). These elements, together, are the beginnings of an agent offering. Reading the tea leaves, it seems like OpenAI is previewing a world where you’ll be able to assign Assistants a goal, give them a set of tools, and let them accomplish the goal on their own. 

We’re still far from that because GPT-4 isn’t smart enough to plan and execute tasks autonomously. But OpenAI is laying the architectural and safety groundwork now, and intentionally rolling out incremental steps as it gets the technology ready.

## OpenAI is trying to make an app store happen

In April of this year OpenAI [launched plugins](https://openai.com/blog/chatgpt-plugins), which allowed users to access third-party services and data from within ChatGPT. There was a lot of hype about plugins becoming a new App Store, but it didn’t pan out that way. OpenAI never released numbers, but as far as I can tell, adoption was very low for third-party plugins, though there was good adoption for two plugins built by OpenAI: Code Interpreter and DALL-E.

Now, OpenAI is taking another bite at the apple with GPTs—its service that allows anyone to create a custom version of ChatGPT with private data:

[![](https://d24ovhgu8s7341.cloudfront.net/uploads/editor/posts/2840/optimized_0R4GqdIeTgfSchrYmT845W32O37VEkbVZvO_k5YmW6Lg8nefQ2dcgW7a0W4EqPsnXESEGT8JEYo8DUY5Ezb2xsipdw18RujIJAxiUWl81oHMgcxML1KTqwCCIr_nbJFTldCJLT4NFFS5qCQITSPm33Y.png)](https://d24ovhgu8s7341.cloudfront.net/uploads/editor/posts/2840/optimized_0R4GqdIeTgfSchrYmT845W32O37VEkbVZvO_k5YmW6Lg8nefQ2dcgW7a0W4EqPsnXESEGT8JEYo8DUY5Ezb2xsipdw18RujIJAxiUWl81oHMgcxML1KTqwCCIr_nbJFTldCJLT4NFFS5qCQITSPm33Y.png?link=true)

Any user can create a GPT. You can define its personality: how it responds to queries and what voice and tone it uses. You can give it access to tools like the ability to execute code or the answer questions from a private knowledge base. Then GPTs can be published for other users to use.

I installed a new GPT called “The Negotiator” (built by OpenAI), which can help you advocate for yourself in any sort of negotiation. It shows up in my ChatGPT sidebar like this:

[![](https://d24ovhgu8s7341.cloudfront.net/uploads/editor/posts/2840/optimized_Z7oKnXUtUGYf93akW9iMdeZD0ulA-Qn6CtrcKoXdM4AqZZjQYSKW0BUlaS-Rewf0CiHl4srosAnyrSTumOg7jcmVdyfIl7nXehmS7mPKmYj9AaMrQUaJZQ_6jPPyFQgEvlz6K-qVvYu2FMlmcZ7rPr0.png)](https://d24ovhgu8s7341.cloudfront.net/uploads/editor/posts/2840/optimized_Z7oKnXUtUGYf93akW9iMdeZD0ulA-Qn6CtrcKoXdM4AqZZjQYSKW0BUlaS-Rewf0CiHl4srosAnyrSTumOg7jcmVdyfIl7nXehmS7mPKmYj9AaMrQUaJZQ_6jPPyFQgEvlz6K-qVvYu2FMlmcZ7rPr0.png?link=true)

If I click The Negotiator, it will move me out of vanilla ChatGPT and into an experience designed specifically to help me get the best results in any negotiation:

[![](https://d24ovhgu8s7341.cloudfront.net/uploads/editor/posts/2840/optimized_MSO_72Ty_0HGXIivY98xGbDYj2rV0K0STYizghvWJN7a-kT4fM5abtl2Tsh4SaK_bfN5Sf-_t__9nC-DHITk0MAw9bdkEZ0FDjIYQMT6Vf1LcEomBY-90uYEfTnLZ6p9Ah8B1rRGBuOiP512ZLg53NA.png)](https://d24ovhgu8s7341.cloudfront.net/uploads/editor/posts/2840/optimized_MSO_72Ty_0HGXIivY98xGbDYj2rV0K0STYizghvWJN7a-kT4fM5abtl2Tsh4SaK_bfN5Sf-_t__9nC-DHITk0MAw9bdkEZ0FDjIYQMT6Vf1LcEomBY-90uYEfTnLZ6p9Ah8B1rRGBuOiP512ZLg53NA.png?link=true)

I’m a fan of this approach. I like the idea of democratizing the ability to build chatbots—and I can see myself building a lot of experiments here over the coming weeks.

That said, I have doubts. It suffers from the same problem as OpenAI’s failed plugin experiment: no one wants to flip between different versions of ChatGPT for different use cases. 

What would be far better is for ChatGPT to figure out automatically how to flip to a specific persona, like The Negotiator, when needed and flip back again when it’s not. Until that happens, I don’t see many of these bots getting significant adoption.

But if it _does_ happen, it will be huge. Downloading a new persona for ChatGPT will be the equivalent of getting your AI to read a book or take a class on a new subject. In this world, there will be a whole economy of people who create content specifically for LLMs rather than for humans. For example, rather than buying a book on negotiations to read myself, I might buy the equivalent of one for ChatGPT to read and ingest for me.

For this reason, I think OpenAI does have a good shot at building an App Store experience, eventually. But it won’t happen until they can figure out how to get ChatGPT to automatically switch between a long list of personas.  The fact that OpenAI changed ChatGPT so you don’t have to switch between their internal models means that’s likely coming soon for custom GPTs, too.

## OpenAI’s relationship with developers

One of the most striking things about this developer conference is that OpenAI released a lot of updates that are more for consumers than developers. For example, custom GPTs are for a consumer audience, as are some of the ChatGPT-specific updates the company released. It reflects something important: OpenAI is currently divided between being a consumer company and a developer company.

ChatGPT was born in sin. When OpenAI started, its goal was to serve developers—until it accidentally created the biggest consumer application of all time. Unfortunately, this puts the company at odds with developers because ChatGPT competes _directly_ with much of what developers want to build—both at the consumer layer and the infrastructure layer. 

If OpenAI has to pick between ChatGPT and its developer ecosystem, it’s going to _have_ to pick ChatGPT. ChatGPT is OpenAI’s most valuable source of high-quality training data, so it’s the best way to improve the quality of its models. 

Not only that, but OpenAI is moving in a direction that commoditizes and consumerizes development work. ChatGPT itself can turn anyone into a semi-competent programmer. And the features it launched yesterday allows anyone to build a chatbot without having to code at all.  

This is a fundamental tension at the core of the company. It’s a tension that is at the heart of many platforms—for example, Apple faced it with iOS and MacOS. Apple has faced criticism for building internal products that compete with what third-party developers have built—a practice known as [“Sherlocking.”](https://thehustle.co/sherlocking-explained/#:~:text=You%20might%20assume%20%E2%80%9Csherlocking%E2%80%9D%20means,a%20third%2Dparty%20tool%20irrelevant.)

But this is more problematic for OpenAI because its consumer product is extraordinarily similar to the product that it offers developers. It would be like Apple allowing developers to release their own version of iOS. 

My guess is that if you want to play in the OpenAI ecosystem, the best bet is to gather a private dataset that will be useful for someone using ChatGPT and release it as a custom GPT.

OpenAI is likely to invest in making GPTs more accessible in the ChatGPT interface, and more powerful over time. The advantage you’ll be bringing to the party is private, curated data—and a set of rules for how to bring that data to bear for a specific kind of user in a specific situation. That’s something that OpenAI is unlikely to compete with directly—so it’s a win-win.

## The most exciting company in the world

There is no one doing more interesting work, more quickly than OpenAI right now. The company’s rate of progress is staggering, and it doesn’t look to be slowing down any time soon. At this conference, the word on the street was that OpenAI is a talent juggernaut, and that it feels very much like Stripe in its prime. (In fact, I’ve heard that OpenAI has hired a lot of people who used to work at Stripe.)

The energy in the room was palpable. I don’t think there’s a bigger or more interesting story in technology. The coming months and years are going to be wild.

---

## Odds and ends

**Diversity.** One thing I appreciated about the conference was its inclusiveness. The company served excellent food, catered, as I learned, by local women- or minority-owned businesses. The demos and panels had an excellent diversity of presenters who work in leadership roles at OpenAI and other large tech companies like Shopify and Salesforce. All of it was low-key and not performative. OpenAI deserves praise for doing it right, in my opinion.

**OpenAI and Microsoft.** One attendee remarked to me that he thought OpenAI’s relationship with Microsoft reminded him of Apple’s longtime relationship with Intel. Intel made the processor, and Apple did everything else. In OpenAI’s case, Microsoft provides the hosting infrastructure, and OpenAI does everything else. It’s not a perfect analogy, but it resonated with me, especially since Satya Nadella showed up at this conference to stand on stage with Sam during the latter’s keynote.

**Can someone figure out naming at OpenAI?** I cannot freaking believe that it named its new custom no-code ChatGPTs “GPTs.” Someone needs to stage an intervention—it’s so confusing.