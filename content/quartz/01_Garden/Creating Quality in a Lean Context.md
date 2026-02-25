---
title: Creating Quality in a Lean Context
created: 2026-02-19
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

I want to take a beat here and acknowledge that in our brevity in covering these topics, I've left out application. How do we practically reduce waste and practically respect people in a DevOps context? Don't worry about that for now. We're literally going to take the rest of the course in understanding that. But I do want to give you kind of what my processes when I meet a company for the first time in implementing DevOps. A big part of lean, and any kind of same management, is Pareto analysis, also known as 80/20 analysis. Put simply, the Pareto principle says that 80% of the consequences come from 20% of the causes. The biggest bang for the buck that a DevOps implementation can deliver is reducing the defect rate. And in my experience, the Pareto principle applies deeply to code, that most of your problems come from what I call a bad neighborhood in code. The place that, when it comes up in conversation, everybody says man, you don't want to go there. And that's where you need to go, fear‑driven development and all and if you want to knock out those defects on a Pareto‑principle basis. In the absence of something as easily measurable as defect rate, we can look to more human measures. I worked at a place that had me doing all kinds of deployment automation, automated source scanning, and a bunch of crazy cool stuff, all while no developer could debug locally. This made development slow, error‑prone, and, above all, miserable. If we were employing the respect people principle as a priority, we would have made it so that people could more effectively get their work done. That's a programmer example, but this applies equally well to other roles. At another company, I always made complaints that the support engineers made about the admin interface to an application I managed a top priority. And as a consequence, they ended up with first‑class tools to take care of our customers with problems. One of the effects of having been a programmer for many years is that I look for similarity in processes and tools and see those things as opportunities for merging, combining, and creating interoperability. Rather than having a dozen different software builds, which are only different because of minor changes in where the code is organized and how it's named, let's make a few minor commits to reorganize things and use one true build that can be parameterized to accommodate slight changes. Let's get our support engineers cross‑trained on performing that import so that we can avoid handoffs when someone goes out the door, even if it's only on vacation. And above all, if we do something twice, when the time comes to do it a third time, let's take a little longer and automate it instead.