---
title: Defer Commitment
created: 2026-02-18
status: 🌱 draft
category: 
difficulty: 
language: pl
tags:
  - 
aliases:
  - 
---
# 🎯 Definicja
**Odroczone Zobowiązanie** (Defer Commitment) to zasada Lean polegająca na opóźnianiu nieodwracalnych decyzji tak długo, jak to możliwe, aby podejmować je w oparciu o jak najpełniejszą wiedzę.

# 🔑 Kluczowe punkty
- **Decyzje Odwracalne vs Nieodwracalne:** Kluczem jest rozróżnienie tych dwóch typów. Decyzje nieodwracalne wiążą się z długofalowymi konsekwencjami, więc chcemy je odsuwać w czasie.
- **BDUF (Big Design Upfront):** Procesy projektowania wszystkiego na samym początku wymuszają wczesne zobowiązania przy wysokiej niepewności, co drastycznie zmniejsza przewidywalność projektu.
- **Budowanie Wiedzy:** Proces tworzenia produktu to proces zbierania informacji potrzebnych do podjęcia właściwych decyzji. Im później podejmiemy decyzję, tym lepszą wiedzą dysponujemy.

# 📚 Szczegółowe wyjaśnienie
Wczesne planowanie i składanie obietnic (predykcje) paradoksalnie zmniejsza przewidywalność sukcesu, ponieważ są one oparte na najmniejszym możliwym poziomie wiedzy (początek projektu).

Warto preferować wybory odwracalne. Jeśli mamy dwie opcje o podobnej wadze, zawsze lepiej wybrać tę, którą łatwiej będzie zmienić w przyszłości. Pozwala to na zachowanie dynamiki pracy bez "ugrzęźnięcia" w błędnych decyzjach podjętych zbyt wcześnie.

# 💡 Przykład zastosowania
- **Amazon i Zappos:** Ich sukces opiera się na łatwości zwrotów i refundacji. Klient może podjąć decyzję o zakupie (zobowiązanie), wiedząc, że jest ona odwracalna. Bez tego mechanizmu sprzedaż byłaby znacznie trudniejsza.
- **Architektura oprogramowania:** Wybór konkretnej [[Bazy danych|bazy danych]] lub frameworka można czasem odroczyć poprzez stosowanie warstw abstrakcji, co pozwala najpierw skupić się na logice biznesowej.
- **Ubezpieczenie podróży:** Opłata za możliwość rezygnacji to w praktyce kupowanie "odwracalności" decyzji o wyjeździe.

## 📌 Źródła

## 👽 Brudnopis

Defer Commitment. Big design upfront processes, here after referred to as BDUF, encourage early commitment at the expense of predictability. Let me unpack that. The earlier a commitment happens, the greater the degree of uncertainty about meeting that commitment, necessarily because the process of creating a product is creating the knowledge necessary to make predictions about the commitment. Predictions strangely reduce predictability, at least when they're made too early. There are two types of decisions for what we're talking about, reversible and irreversible decisions. Irreversible decisions mean a commitment to work with the consequences of them, and we therefore want to defer those kinds of decisions as far away as we can so that the quality of the knowledge that we have when we have to make the irreversible decision is as good as it can be. Reversible decisions, on the other hand, we can make whenever we want. We do have to start making decisions almost immediately, or else the shape and knowledge that our research is trying to create will never take shape. But if we frontload decisions that can be changed later when circumstances merit, we can achieve the forward motion we need without being bogged down by choices we made when the information was necessarily poor and new. An implication of this is if giving two decision types equally weighted, you should choose a reversible choice over an irreversible one. The inherent desirability of reversibility is reflected in commerce where you can pay an insurance fee to refund your travel expenses when you're planning a trip and things go wrong. The ease of return and refund is the rock upon which Amazon is built. I just recently bought shoes from another retailer, Zappos, for the first time. If Zappos weren't willing to work with a return and refund situation, allowing for the reversibility of decisions, you can imagine they probably wouldn't sell any shoes at all.