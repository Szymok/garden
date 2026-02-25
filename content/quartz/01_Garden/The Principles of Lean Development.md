---
title: The Principles of Lean Development
created: 2026-02-12
status: 
category: 
difficulty: 
language: pl
tags:
  - 
aliases:
  - 
---
# 🎯 Definicja

# 🔑 Kluczowe punkty

# 📚 Szczegółowe wyjaśnienie

# 💡 Przykład zastosowania

## 📌 Źródła

## 👽 Brudnopis

You're probably already getting the sense of the principal devil in lean practices, waste. Not every system is optimized for eliminating waste. Sometimes speed is the most important thing. There is an apocryphal story about a sign at a production plant creating the lunar lander in the '60s. You can waste anything but time. But I've got another unifying principle for you to think about as we move ahead and talk about the principles of lean development. If you aim at speed, you may get speed, but you'll get waste. If you aim at the elimination of waste, you'll eliminate waste and get speed. And man, if that's true for manufacturing cars or lunar landers, it's true 10x for software development. Consider what happens when a bug is caught by a customer. At best, it was annoyance. And at worst, there's been some substantial compromise of that relationship. Now, push that bug's detection back to just before release. It's still a pain because now you need to delay that release, but the cost of the bug is greatly diminished. Push that bug back to a code review shortly after it was committed to version control. Now, most people in the organization never even know about it. Only the code reviewer, the programmer, and maybe the manager. Now let's press the bug back to the development process itself. The programmer writes a test to verify their code, finds the bug, fixes it, and no one but the programmer ever knows. So what does it look like to press back one final level where even the programmer never has to know about the bug? You write the test first and create the code to satisfy it. This is not to say that this process inescapably creates bug‑free code because, after all, the test is code too, and this doesn't account for bugs that the test doesn't anticipate. But writing code test first forces you to focus on what you can be certain about and deforms the code into more humble propositions. More on this idea later. The Poppendieck book outlines seven principles for applying what we understand about lean and the Toyota production system to what we're trying to do with software. We're going to move through these seven principles in pretty much rapid fire succession. The first principle, and it should be no surprise by now, eliminate waste. What we mean exactly by waste is a multidimensional question, and we'll take the whole next segment to break it down. But if you've worked in software, you probably have a good idea of what this looks like. Having to go back and fix a bug is waste, assuming that there was some way to prevent it from being created in the first place. And more fundamentally, doing the same thing over and over, assuming that this is a human being and not a machine we're talking about. Doing the same thing over and over again is not liberating the potential of a human being, so we can consider it waste and look at it as something we should eliminate.