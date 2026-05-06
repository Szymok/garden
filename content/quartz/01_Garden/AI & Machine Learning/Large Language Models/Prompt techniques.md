---
title: Prompt techniques  
created: 2025-07-16  
status: 🌱 draft
category: LLM  
difficulty: podstawowy  
language: pl  
tags:

- prompting
- LLM
- NLP
- zero-shot
- chain-of-thought  
aliases:
- techniki promptowania
---
# ðŸŽ¯ Definicja

**Prompt techniques** to zestaw strategii tworzenia efektywnych promptÃ³w (poleceÅ„) dla duÅ¼ych modeli jÄ™zykowych ([[Base LLM|LLM]]), ktÃ³re umoÅ¼liwiajÄ… uzyskiwanie bardziej trafnych, logicznych i uÅ¼ytecznych odpowiedzi w zaleÅ¼noÅ›ci od typu zadania (klasyfikacja, generacja tekstu, QA itd.).

# ðŸ”‘ Kluczowe punkty

- ðŸ‘â€ðŸ—¨ Efektywny prompt = lepsze rozumienie celu przez model.
- ðŸ§  IstniejÄ… rÃ³Å¼ne strategie: zero-shot, few-shot, chain-of-thought, tree-of-thought itd.
- ðŸ§© WybÃ³r techniki zaleÅ¼y od trudnoÅ›ci zadania i potrzeby interpretowalnoÅ›ci.
- âš™ï¸ Prompt engineering minimalizuje koniecznoÅ›Ä‡ fine-tuningu.

# ðŸ“š SzczegÃ³Å‚owe wyjaÅ›nienie

## [[Zero-Shot Prompting]]

Najprostsza forma â€“ model otrzymuje wyÅ‚Ä…cznie instrukcjÄ™, bez przykÅ‚adÃ³w. Sprawdza siÄ™ dobrze w zadaniach, dla ktÃ³rych jÄ™zykowy kontekst jest wystarczajÄ…cy.

**PrzykÅ‚ad:**  
â€žPrzetÅ‚umacz na niemiecki: â€˜Jak siÄ™ masz?â€™â€

## [[Few-Shot Prompting]]

Modelowi przekazuje siÄ™ kilka przykÅ‚adÃ³w oczekiwanych wejÅ›Ä‡/wyjÅ›Ä‡, co stanowi kontekst do wnioskowania.

**PrzykÅ‚ad:**

- Input: â€žAng. = 'dog', Fr. = 'chien'  
    Ang. = 'cat', Fr. = 'chat'  
    Ang. = 'house', Fr. = â€¦â€

## Chain-of-thought ([[Chain-of-Thought Prompting|CoT]])

Model prowadzi krok po kroku Å›cieÅ¼kÄ™ rozumowania zamiast od razu zwracaÄ‡ odpowiedÅº.

**UÅ¼yteczne w:**

- zadaniach logicznych,
- zadaniach wymagajÄ…cych wieloetapowego myÅ›lenia (np. zadania matematyczne, QA).

**PrzykÅ‚ad:**  
â€žIle jabÅ‚ek zostanie, jeÅ›li masz 10 jabÅ‚ek i zjesz 4? PomyÅ›l krok po kroku.â€

## Tree-of-thought ([[Tree of Thoughts (ToT)|ToT]])

Zaawansowana forma [[Chain-of-Thought Prompting|CoT]] â€“ zamiast jednej liniowej Å›cieÅ¼ki, model rozgaÅ‚Ä™zia moÅ¼liwe scenariusze, analizujÄ…c kaÅ¼dÄ… opcjÄ™.

**Zastosowanie:**

- [[Generowanie kodu]],
- planowanie strategiczne,
- podejmowanie decyzji z wieloma zmiennymi.

## Directional prompting

Specjalna forma podpowiedzi zawierajÄ…ca ukryte sterowanie np. przez narzucone style ("pokaÅ¼ tylko wynik", "zachowuj siÄ™ jak ekspert").

**PrzykÅ‚ad:**  
â€žJako analityk danych, przeanalizuj i wypisz tylko rekomendacjÄ™.â€

# ðŸ’¡ PrzykÅ‚ad zastosowania

Model [[Base LLM|LLM]] wykorzystywany w aplikacji do onboardingu pracownikÃ³w, w ktÃ³rej uÅ¼ytkownik pyta:  
â€žJak mogÄ™ zarejestrowaÄ‡ urlop?â€

Zamiast jedynie daÄ‡ odpowiedÅº, stosujemy chain-of-thought:

â€žAby zarejestrowaÄ‡ urlop, najpierw naleÅ¼y zalogowaÄ‡ siÄ™ do systemu HR. NastÄ™pnie...â€

To podejÅ›cie zwiÄ™ksza zrozumienie procesu przez uÅ¼ytkownika oraz podnosi wiarygodnoÅ›Ä‡ systemu.

# ðŸ“Œ Å¹rÃ³dÅ‚a

[[Prompt Engineering Guide]]: [https://github.com/dair-ai/Prompt-Engineering-Guide](https://github.com/dair-ai/Prompt-Engineering-Guide)  
Efficient Prompt Engineering Techniques â€“ AssemblyAI: [https://www.assemblyai.com/blog](https://www.assemblyai.com/blog)  
"Prompt Engineering for LLMs" â€“ Microsoft Learn: [https://learn.microsoft.com/en-us/training/modules/prompt-engineering/](https://learn.microsoft.com/en-us/training/modules/prompt-engineering/)

# ðŸ‘½ Brudnopis

- Prompt != tylko pytanie â€“ to instrukcja sterujÄ…ca dziaÅ‚aniem modelu.
- Typ promptu wpÅ‚ywa mocno na jakoÅ›Ä‡ i kontrolÄ™ nad wynikami.
- [[Chain-of-Thought Prompting|CoT]] i [[Tree of Thoughts (ToT)|ToT]] zwiÄ™kszajÄ… interpretowalnoÅ›Ä‡ dziaÅ‚aÅ„ [[Base LLM|LLM]].
- MoÅ¼liwoÅ›Ä‡ Å‚Ä…czenia technik np. few-shot + [[Chain-of-Thought Prompting|CoT]].
- Prompt engineering â‰  fine-tuning, ale daje podobny efekt w niektÃ³rych scenariuszach.
- Na obrazkach pokazano porÃ³wnanie technik i przebieg dziaÅ‚ania [[Chain-of-Thought Prompting|CoT]].