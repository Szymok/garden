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
# ðŸŽ¯ Definicja
**Odroczone ZobowiÄ…zanie** (Defer Commitment) to zasada Lean polegajÄ…ca na opÃ³Åºnianiu nieodwracalnych decyzji tak dÅ‚ugo, jak to moÅ¼liwe, aby podejmowaÄ‡ je w oparciu o jak najpeÅ‚niejszÄ… wiedzÄ™.

# ðŸ”‘ Kluczowe punkty
- **Decyzje Odwracalne vs Nieodwracalne:** Kluczem jest rozrÃ³Å¼nienie tych dwÃ³ch typÃ³w. Decyzje nieodwracalne wiÄ…Å¼Ä… siÄ™ z dÅ‚ugofalowymi konsekwencjami, wiÄ™c chcemy je odsuwaÄ‡ w czasie.
- **BDUF (Big Design Upfront):** Procesy projektowania wszystkiego na samym poczÄ…tku wymuszajÄ… wczesne zobowiÄ…zania przy wysokiej niepewnoÅ›ci, co drastycznie zmniejsza przewidywalnoÅ›Ä‡ projektu.
- **Budowanie Wiedzy:** Proces tworzenia produktu to proces zbierania informacji potrzebnych do podjÄ™cia wÅ‚aÅ›ciwych decyzji. Im pÃ³Åºniej podejmiemy decyzjÄ™, tym lepszÄ… wiedzÄ… dysponujemy.

# ðŸ“š SzczegÃ³Å‚owe wyjaÅ›nienie
Wczesne planowanie i skÅ‚adanie obietnic (predykcje) paradoksalnie zmniejsza przewidywalnoÅ›Ä‡ sukcesu, poniewaÅ¼ sÄ… one oparte na najmniejszym moÅ¼liwym poziomie wiedzy (poczÄ…tek projektu).

Warto preferowaÄ‡ wybory odwracalne. JeÅ›li mamy dwie opcje o podobnej wadze, zawsze lepiej wybraÄ‡ tÄ™, ktÃ³rÄ… Å‚atwiej bÄ™dzie zmieniÄ‡ w przyszÅ‚oÅ›ci. Pozwala to na zachowanie dynamiki pracy bez "ugrzÄ™ÅºniÄ™cia" w bÅ‚Ä™dnych decyzjach podjÄ™tych zbyt wczeÅ›nie.

# ðŸ’¡ PrzykÅ‚ad zastosowania
- **Amazon i Zappos:** Ich sukces opiera siÄ™ na Å‚atwoÅ›ci zwrotÃ³w i refundacji. Klient moÅ¼e podjÄ…Ä‡ decyzjÄ™ o zakupie (zobowiÄ…zanie), wiedzÄ…c, Å¼e jest ona odwracalna. Bez tego mechanizmu sprzedaÅ¼ byÅ‚aby znacznie trudniejsza.
- **Architektura oprogramowania:** WybÃ³r konkretnej bazy danych lub frameworka moÅ¼na czasem odroczyÄ‡ poprzez stosowanie warstw abstrakcji, co pozwala najpierw skupiÄ‡ siÄ™ na logice biznesowej.
- **Ubezpieczenie podrÃ³Å¼y:** OpÅ‚ata za moÅ¼liwoÅ›Ä‡ rezygnacji to w praktyce kupowanie "odwracalnoÅ›ci" decyzji o wyjeÅºdzie.

## ðŸ“Œ Å¹rÃ³dÅ‚a

## ðŸ‘½ Brudnopis

Defer Commitment. Big design upfront processes, here after referred to as BDUF, encourage early commitment at the expense of predictability. Let me unpack that. The earlier a commitment happens, the greater the degree of uncertainty about meeting that commitment, necessarily because the process of creating a product is creating the knowledge necessary to make predictions about the commitment. Predictions strangely reduce predictability, at least when they're made too early. There are two types of decisions for what we're talking about, reversible and irreversible decisions. Irreversible decisions mean a commitment to work with the consequences of them, and we therefore want to defer those kinds of decisions as far away as we can so that the quality of the knowledge that we have when we have to make the irreversible decision is as good as it can be. Reversible decisions, on the other hand, we can make whenever we want. We do have to start making decisions almost immediately, or else the shape and knowledge that our research is trying to create will never take shape. But if we frontload decisions that can be changed later when circumstances merit, we can achieve the forward motion we need without being bogged down by choices we made when the information was necessarily poor and new. An implication of this is if giving two decision types equally weighted, you should choose a reversible choice over an irreversible one. The inherent desirability of reversibility is reflected in commerce where you can pay an insurance fee to refund your travel expenses when you're planning a trip and things go wrong. The ease of return and refund is the rock upon which Amazon is built. I just recently bought shoes from another retailer, Zappos, for the first time. If Zappos weren't willing to work with a return and refund situation, allowing for the reversibility of decisions, you can imagine they probably wouldn't sell any shoes at all.