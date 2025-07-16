---
title: "Google releases its own 'reasoning' AI model | TechCrunch"
source: "https://techcrunch.com/2024/12/19/google-releases-its-own-reasoning-ai-model/"
category:
author:
  - "[[Kyle Wiggers]]"
published: 2024-12-19
created: 2024-12-19
description: "Google has released what it's calling a new \"reasoning\" AI model to rival OpenAI's o1 — but it's in the experimental stages."
tags:
---
Google has released what it’s calling a new “reasoning” AI model — but it’s in the experimental stages, and from our brief testing, there’s certainly room for improvement.

The new model, called Gemini 2.0 Flash Thinking Experimental (a mouthful, to be sure), is available in [AI Studio](https://techcrunch.com/2023/12/13/with-ai-studio-google-launches-an-easy-to-use-tool-for-developing-apps-and-chatbots-based-on-its-gemini-model/), Google’s AI prototyping platform. A model card describes it as “best for multimodal understanding, reasoning, and coding,” with the ability to “reason over the most complex problems” in fields such as programming, math, and physics.

In a [post](https://x.com/OfficialLoganK/status/1869789822384255300) on X, Logan Kilpatrick, who leads product for AI Studio, called Gemini 2.0 Flash Thinking Experimental “the first step in \[Google’s\] reasoning journey.” Jeff Dean, chief scientist for Google DeepMind, Google’s AI research division, [said](https://x.com/JeffDean/status/1869789813232341267) in his own post that Gemini 2.0 Flash Thinking Experimental is “trained to use thoughts to strengthen its reasoning.”

“We see promising results when we increase inference time computation,” Dean said, referring to the amount of computing used to “run” the model as it considers a question.

> It’s still an early version, but check out how the model handles a challenging puzzle involving both visual and textual clues: (2/3) [pic.twitter.com/JltHeK7Fo7](https://t.co/JltHeK7Fo7)
> 
> — Logan Kilpatrick (@OfficialLoganK) [December 19, 2024](https://twitter.com/OfficialLoganK/status/1869789822384255300?ref_src=twsrc%5Etfw)

Built on Google’s recently announced [Gemini 2.0 Flash](https://techcrunch.com/2024/12/11/gemini-2-0-googles-newest-flagship-ai-can-generate-text-images-and-speech/) model, Gemini 2.0 Flash Thinking Experimental appears to be similar in design to OpenAI’s [o1](https://techcrunch.com/2024/09/12/openai-unveils-a-model-that-can-fact-check-itself/) and other so-called reasoning models. Unlike most AI, reasoning models effectively fact-check themselves, which [helps them avoid some of the pitfalls that normally trip up AI models](https://techcrunch.com/2024/08/27/why-ai-cant-spell-strawberry/).

As a drawback, reasoning models often take longer — usually seconds to minutes longer — to arrive at solutions.

Given a prompt, Gemini 2.0 Flash Thinking Experimental pauses before responding, considering a number of related prompts and “explaining” its reasoning along the way. After a while, the model summarizes what it considers to be the most accurate answer.

Well — that’s what’s supposed to happen. When I asked Gemini 2.0 Flash Thinking Experimental how many R’s were in the word “strawberry,” it said “two.”

![Google reasoning model](https://techcrunch.com/wp-content/uploads/2024/12/Screenshot-2024-12-19-at-12.11.45PM-1.png?w=680)

Google’s new reasoning model struggles with counting the letters in words, SOMETIMES.**Image Credits:**Google

Your mileage may vary.

In the [wake of the release of o1](https://techcrunch.com/2024/12/05/openais-o1-model-sure-tries-to-deceive-humans-a-lot/), there’s been an [explosion](https://techcrunch.com/2024/12/14/reasoning-ai-models-have-become-a-trend-for-better-or-worse/) of reasoning models from rival AI labs — not just Google. In early November, DeepSeek, an AI research company funded by quant traders, launched a preview of its first reasoning model, [DeepSeek-R1](https://techcrunch.com/2024/11/20/a-chinese-lab-has-released-a-model-to-rival-openais-o1/). That same month, Alibaba’s Qwen team [unveiled](https://techcrunch.com/2024/11/27/alibaba-releases-an-open-challenger-to-openais-o1-reasoning-model/) what it claimed was the first “open” challenger to o1.

Bloomberg [reported](https://www.bloomberg.com/news/articles/2024-10-02/google-is-working-on-reasoning-ai-chasing-openai-s-efforts) in October that Google had several teams developing reasoning models. Subsequent [reporting](https://x.com/kimmonismus/status/1861053606192881904) by The Information in November revealed that the company has at least 200 researchers focusing on the technology.

What opened the reasoning model floodgates? Well, for one, the search for novel approaches to refine generative AI. As my colleague Max Zeff recently [reported](https://www.google.com/search?q=ai+scaling+laws+techcrunch&sca_esv=31fe99a6d4a2597d&rlz=1C5GCEA_enUS1081US1082&sxsrf=ADLYWILkrWo3hLuQ8P-KsOh5nwssM_EFjw%3A1734629048864&ei=uFZkZ76vNNys5NoP-qbK-Aw&ved=0ahUKEwi-65jirLSKAxVcFlkFHXqTEs8Q4dUDCBA&uact=5&oq=ai+scaling+laws+techcrunch&gs_lp=Egxnd3Mtd2l6LXNlcnAiGmFpIHNjYWxpbmcgbGF3cyB0ZWNoY3J1bmNoMgUQIRigATIFECEYoAFIqBdQqARYjRdwB3gAkAEDmAGwAaABoxmqAQUxNy4xNrgBA8gBAPgBAZgCI6AC7xXCAggQABiwAxjvBcICChAjGLADGCcYrgLCAgoQIxiABBgnGIoFwgIEECMYJ8ICERAuGIAEGJECGNEDGMcBGIoFwgILEAAYgAQYkQIYigXCAhEQLhiABBixAxjRAxiDARjHAcICEBAuGIAEGNEDGEMYxwEYigXCAgsQABiABBixAxiDAcICCxAuGIAEGNEDGMcBwgIWEC4YgAQYsQMY0QMYQxiDARjHARiKBcICChAAGIAEGEMYigXCAhAQABiABBixAxhDGIMBGIoFwgILEC4YgAQYkQIYigXCAggQABiABBixA8ICDhAAGIAEGLEDGIMBGIoFwgIIEC4YgAQYsQPCAgUQABiABMICChAAGIAEGBQYhwLCAgcQABiABBgKwgIGEAAYFhgewgIIEAAYFhgKGB7CAgsQABiABBiGAxiKBcICCBAAGIAEGKIEwgIFEAAY7wXCAgUQIRirAsICBxAhGKABGAqYAwCIBgGQBgWSBwUyMS4xNKAH7cQB&sclient=gws-wiz-serp), “brute force” techniques to scale up models are no longer yielding the improvements they once did.

Not everyone’s convinced that reasoning models are the best path forward. They tend to be expensive, for one, thanks to the large amount of computing power required to run them. And while they’ve [performed](https://x.com/mikeknoop/status/1869582921365127297) well on [benchmarks](https://x.com/lmarena_ai/status/1869793847548817563) so far, it’s not clear whether reasoning models can maintain this rate of progress.

*TechCrunch has an AI-focused newsletter!* *[Sign up here](https://techcrunch.com/newsletters/)* *to get it in your inbox every Wednesday.*

Kyle Wiggers is a senior reporter at TechCrunch with a special interest in artificial intelligence. His writing has appeared in VentureBeat and Digital Trends, as well as a range of gadget blogs including Android Police, Android Authority, Droid-Life, and XDA-Developers. He lives in Brooklyn with his partner, a piano educator, and dabbles in piano himself. occasionally — if mostly unsuccessfully.

[View Bio](https://techcrunch.com/author/kyle-wiggers/)