---
title: "Anthropic has developed an AI 'brain scanner' to understand how LLMs work and it turns out the reason why chatbots are terrible at simple math and hallucinate is weirder than you thought"
source: "https://www.pcgamer.com/software/ai/anthropic-has-developed-an-ai-brain-scanner-to-understand-how-llms-work-and-it-turns-out-the-reason-why-chatbots-are-terrible-at-simple-math-and-hallucinate-is-weirder-than-you-thought/"
category:
author:
  - "[[Jeremy Laird]]"
published: 2025-03-28
created: 2025-03-29
description: "Oh, and another thing: They don't just predict the next word."
tags:
---
Tracing the thoughts of a large language model - YouTube ![Tracing the thoughts of a large language model - YouTube](https://img.youtube.com/vi/Bj9BD2D3DzA/maxresdefault.jpg)

[Watch On](https://youtu.be/Bj9BD2D3DzA)

It's a peculiar truth that we don't understand how large language models (LLMs) actually work. We designed them. We built them. We trained them. But their inner workings are largely mysterious. Well, they were. That's less true now thanks to some [new research by Anthropic](https://www.anthropic.com/research/tracing-thoughts-language-model) that was inspired by brain-scanning techniques and helps to explain why chatbots hallucinate and are terrible with numbers.

The problem is that while we understand how to design and build a model, we don't know how all the zillions of weights and parameters, the relationships between data inside the model that result from the training process, actually give rise to what appears to be cogent outputs.

“Open up a large language model and all you will see is billions of numbers—the parameters,” says Joshua Batson, a research scientist at Anthropic (via [MIT Technology Review](https://www.technologyreview.com/2025/03/27/1113916/anthropic-can-now-track-the-bizarre-inner-workings-of-a-large-language-model/)), of what you will find if you peer inside the black box that is a fully trained AI model. “It’s not illuminating,” he notes.

Latest Videos From PC Gamer

<svg role="img" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="164" height="31" overflow="visible" viewBox="0 0 164 31"><title>PC Gamer</title><defs><path id="a" d="M0 0h163.88v31H0z"></path></defs><clipPath id="b"><use xlink:href="#a" overflow="visible"></use></clipPath><path clip-path="url(#b)" fill="#D60F15" d="M1.8 0S0 0 0 1.8v27.4S0 31 1.8 31h46.72s1.8 0 1.8-1.8V1.8s0-1.8-1.8-1.8H1.8z"></path><path clip-path="url(#b)" fill="#0F1618" d="M163.88 29.2V1.8s0-1.8-1.8-1.8H47.24v31h114.82s1.81 0 1.81-1.8"></path><path clip-path="url(#b)" fill="#FFF" d="M34.27 28.1c6.54 0 9.29-3.59 10.46-8.51L38.6 18.2c-.75 3.02-1.78 4.63-4.3 4.63-3.21 0-4.8-2.9-4.8-7.36 0-4.53 1.52-7.2 4.73-7.2 2.5 0 3.4 1.85 4.04 4.18l6.12-1.84c-1-4.34-3.6-7.75-10.13-7.75-6.08 0-11.23 3.7-11.23 12.61S27.96 28.1 34.27 28.1M9.7 14.89V8.65h2.79c3 0 3.82 1.28 3.82 3.12s-.81 3.12-3.82 3.12h-2.8zM3.3 27.64h6.4v-7.76h2.56c4.7 0 10.36-1.08 10.36-8.28s-5.24-8.27-10.36-8.27H3.3v24.3zM154.64 11.4c0 2.04-1.16 2.8-3.82 2.8h-2.78V8.65h2.78c2.66 0 3.82.72 3.82 2.76m6.31-.17c0-5.84-3.75-7.91-9.9-7.91h-9.35v24.3h6.34V19.2h1.33l4.63 8.45h6.86l-4.99-9.07c3.14-1.09 5.08-3.52 5.08-7.33"></path><path fill="#FFF" d="M129.34 8.78h11.2V3.33h-17.67v24.3h17.64v-5.28h-11.17v-4.5h7.58v-5.13h-7.58z"></path><defs><path id="c" d="M0 0h163.88v31H0z"></path></defs><clipPath id="d"><use xlink:href="#c" overflow="visible"></use></clipPath><path clip-path="url(#d)" fill="#FFF" d="M115.49 27.64h6.18V3.33h-8.77l-3.79 16.49h-.06l-4.2-16.5h-8.59v24.32h5.76V12.26h.07c.52 3.19.8 4.27 1.36 6.24l2.46 9.14h5.7l2.52-9.14c.52-1.87.9-3.41 1.3-5.91h.06v15.05z"></path><path fill="#FFF" d="M86.3 18.44h-4.57l2.3-6.74h.07l2.2 6.74zm9.45 9.2L87.3 3.35h-6.1l-8.44 24.29h5.89l1.55-4.54h7.54l1.46 4.54h6.54z"></path><defs><path id="e" d="M0 0h163.88v31H0z"></path></defs><clipPath id="f"><use xlink:href="#e" overflow="visible"></use></clipPath><path clip-path="url(#f)" fill="#FFF" d="M67.12 27.64h5.08V15.12h-9.64v4.8h3.5a4.3 4.3 0 0 1-4.21 2.92c-1.72 0-5.02-.76-5.02-7.56 0-6.83 3.69-7 4.73-7 1.87 0 3.26 1.06 4.2 4.18l5.93-1.68C70 4.41 66.12 2.87 61.59 2.87c-7.12 0-11.27 4.9-11.27 12.51 0 7.33 3.08 12.72 10.72 12.72 3.59 0 5.7-2.5 6.02-3.68h.06v3.22zm92.79-23.71c0 .08-.04.12-.16.12h-.16V3.8h.17c.1 0 .15.05.15.13m.25.64l-.24-.39a.26.26 0 0 0 .17-.25c0-.18-.1-.3-.34-.3h-.35v.94h.19v-.36h.13l.01.03.2.33h.23zm.28-.46a.67.67 0 1 1-1.34 0 .67.67 0 0 1 1.34 0m.18 0a.84.84 0 1 0-1.7 0 .84.84 0 0 0 1.7 0"></path></svg>

To understand what's actually happening, Anthropic's researchers developed a new technique, called circuit tracing, to track the decision-making processes inside a large language model step-by-step. They then applied it to their own Claude 3.5 Haiku LLM.

Anthropic says its approach was inspired by the brain scanning techniques used in neuroscience and can identify components of the model that are active at different times. In other words, it's a little like a brain scanner spotting which parts of the brain are firing during a cognitive process.

![Claude doing math](https://cdn.mos.cms.futurecdn.net/Zb9mBuMQQdhByCP22CLF7C-320-80.jpg)

This is why LLMs are so patchy at math. (Image credit: Anthropic)

Anthropic made lots of intriguing discoveries using this approach, not least of which is why LLMs are so terrible at basic mathematics. "Ask Claude to add 36 and 59 and the model will go through a series of odd steps, including first adding a selection of approximate values (add 40ish and 60ish, add 57ish and 36ish). Towards the end of its process, it comes up with the value 92ish. Meanwhile, another sequence of steps focuses on the last digits, 6 and 9, and determines that the answer must end in a 5. Putting that together with 92ish gives the correct answer of 95," the MIT article explains.

But here's the really funky bit. If you ask Claude how it got the correct answer of 95, it will apparently tell you, "I added the ones (6+9=15), carried the 1, then added the 10s (3+5+1=9), resulting in 95." But that actually only reflects common answers in its training data as to how the sum might be completed, as opposed to what it actually did.

Keep up to date with the most important stories and the best deals, as picked by the PC Gamer team.

In other words, not only does the model use a very, very odd method to do the maths, you can't trust its explanations as to what it has just done. That's significant and shows that model outputs can not be relied upon when designing guardrails for AI. Their internal workings need to be understood, too.

Another very surprising outcome of the research is the discovery that these LLMs do not, as is widely assumed, operate by merely predicting the next word. By tracing how Claude generated rhyming couplets, Anthropic found that it chose the rhyming word at the end of verses first, then filled in the rest of the line.

"The planning thing in poems blew me away," says Batson. "Instead of at the very last minute trying to make the rhyme make sense, it knows where it’s going."

![Claude doing poetry](https://cdn.mos.cms.futurecdn.net/AsPcbrHzJe7LB5W9AZE8jM-320-80.png)

Anthropic discovered that their Claude LLM didn't just predict the next word. (Image credit: Anthropic)

Anthropic also found, among other things, that Claude "sometimes thinks in a conceptual space that is shared between languages, suggesting it has a kind of universal 'language of thought'."

Anywho, there's apparently a long way to go with this research. According to Anthropic, "it currently takes a few hours of human effort to understand the circuits we see, even on prompts with only tens of words." And the research doesn't explain how the structures inside LLMs are formed in the first place.

But it has shone a light on at least some parts of how these oddly mysterious AI beings—which we have created but don't understand—actually work. And that has to be a good thing.