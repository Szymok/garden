---
title: Build Quality In
created: 2026-02-13
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

There are two types of inspection, inspection to find defects and inspection to prevent defects. Finding defects means inspection after the process. Preventing defects means inspection during or even before the process. It's unusual now, but I'm old enough to remember when you fill out an entire form online, submit it, and then see an explanation of errors that could have been caught easily while I was filling out the form. This form of defect prevention is so common and baked into our user interface expectations that when it's absent, we look at it as a defect itself. This practice of inspecting to prevent defects is called poka‑yoke in the TPS system, which is Japanese for error avoidance. Poka‑yoke has taken a hold greatly in UI, like I said. Selecting your location from a drop‑down or having your input mask to numbers only for certain fields are familiar examples. But poka‑yoke is present in 1,000 different ways in our daily lives that we only know about if we look for them. Chances are and, for gosh sake, don't test this out. But chances are that if you stick a fork into your power outlet in the kitchen or bathroom, a device called a ground fault circuit interrupter will break the circuit and maybe save your life. If you have a car with a manual transmission, you'll need to press in the clutch to start the car to keep from sending the car hurtling forward when you start the engine if you left it in gear. Less dramatically, I cannot plug in a USB device wrong. The connector will not seat unless I orient the plug in the right way. The quickest example I can come up with for how this applies to DevOps is the principle of least privilege in security. This is the idea that a user should have exactly the permissions needed to do their work and nothing more. This is usually pursued from a perspective of preventing malicious behavior, but it is just as useful in preventing error. The mistake that requires permission I don't have is a mistake I can never think. And to flip that idea around, if I have permission to do something I shouldn't be able to do, there's a good chance I don't really understand what the implications of that permissions are. Another example is blocking anyone from committing directly to a deployment branch. You can organize your system so that no individual user can commit to a branch which leads to deployment and that their code can only reach that branch by process of an approved pull request. Then, you can organize code inspections, automated testing, and a merge build to detect whether that new code will cause problems. And most fundamentally, as a programmer, having your IDE constantly check whether your code will compile can save you tremendous time and headaches, especially if you're not in a position to compile locally. When a programmer writes a piece of code, that code has premises and propositions tied up in it that can be difficult to untangle after the fact, even by the same programmer. By shifting the focus to writing the test code first, by identifying those premises and propositions, we are building quality into the code. The value of this test is great in preventing a defect in the first place, but its value in preventing defects from creeping in later is even greater.