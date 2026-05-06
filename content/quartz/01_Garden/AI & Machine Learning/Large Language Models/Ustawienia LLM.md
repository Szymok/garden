---

title: Ustawienia LLM  
created: 2025-03-31  
status: 🌱 draft
category: sztuczna inteligencja / prompt engineering  
difficulty: podstawowy  
language: pl  
tags:

- prompt
- AI
- Sztuczna-Inteligencja
- prompt-techniques
- llm  
aliases:
- large language models
- parametry LLM
- konfiguracja modeli jÄ™zykowych

---

# ðŸŽ¯ Definicja

**Ustawienia [[Base LLM|LLM]] ([[Base LLM|Large Language Models]])** to zestaw parametrÃ³w kontrolujÄ…cych sposÃ³b generowania odpowiedzi przez modele jÄ™zykowe. Parametry te pozwalajÄ… dostosowywaÄ‡ styl, kreatywnoÅ›Ä‡, dokÅ‚adnoÅ›Ä‡ oraz deterministycznoÅ›Ä‡ tworzonych treÅ›ci. MogÄ… byÄ‡ konfigurowane rÄ™cznie przez uÅ¼ytkownika lub automatycznie przez API danej platformy.

# ðŸ”‘ Kluczowe punkty

- ðŸ”¥ **Temperatura (temperature)** â€“ wpÅ‚ywa na poziom kreatywnoÅ›ci modelu (losowoÅ›ci).
- ðŸŽ¯ **Top-p ([[Top P|nucleus sampling]])** â€“ kontroluje zakres rozkÅ‚adu prawdopodobieÅ„stwa sÅ‚Ã³w rozwaÅ¼anych do wylosowania.
- ðŸ§  Zmiana tych parametrÃ³w moÅ¼e radykalnie zmieniÄ‡ styl i jakoÅ›Ä‡ odpowiedzi.
- ðŸ§ª Dla zadaÅ„ precyzyjnych (QA, DQ, przetwarzanie nazw technicznych): uÅ¼ywamy **niÅ¼szych wartoÅ›ci**.
- ðŸŽ¨ Dla zadaÅ„ twÃ³rczych (generowanie historii, wierszy, marketingu): wartoÅ›ci **wyÅ¼sze**.

# ðŸ“š SzczegÃ³Å‚owe wyjaÅ›nienie

## Temperatura (temperature)

OkreÅ›la poziom â€žchaosuâ€ w wyborze nastÄ™pnego tokenu. Zakres typowo: **0.0 do 1.0** (czasem 2.0).

- **0.0** â†’ deterministyczny â€” zawsze wybierany najlepszy token (najsensowniejszy, spÃ³jny).
- **0.7** â†’ balans â€” losowoÅ›Ä‡ z balanseâ€™em logiki i kreatywnoÅ›ci.
- **1.0+** â†’ bardzo kreatywny, ale mniej spÃ³jny.

> ðŸ§ª Temperatura â‰ˆ â€žJak luÅºno trzymaÄ‡ siÄ™ przewidywalnej odpowiedzi?â€

## Top-p ([[Top P|nucleus sampling]])

Zamiast braÄ‡ Top-K tokenÃ³w â€” bierze tylko te, ktÃ³rych skumulowane prawdopodobieÅ„stwo przekracza okreÅ›lony prÃ³g **p**.

- **top_p = 0.1** â†’ zawÄ™Å¼a wybÃ³r do najbardziej sensitivnych sÅ‚Ã³w.
- **top_p = 1.0** â†’ losuje z caÅ‚ego rozkÅ‚adu (brak ograniczeÅ„) â€“ czÄ™sto bardziej kreatywne odpowiedzi.

> ðŸ“Œ Top-p = sterowanie dÅ‚ugoÅ›ciÄ… ogona rozkÅ‚adu â€” ile â€žmoÅ¼liwoÅ›ciâ€ bierzesz pod uwagÄ™.

## PorÃ³wnanie: Temperature vs Top-p

|Parametr|Charakterystyka|Efekt na odpowiedÅº|
|---|---|---|
|`temperature`|Manipuluje losowoÅ›ciÄ… w caÅ‚ym rozkÅ‚adzie|WpÅ‚ywa bardziej globalnie|
|`top_p`|Ogranicza wybÃ³r do wielu tokenÃ³w o wysokim prawdopodobieÅ„stwie|WpÅ‚ywa dynamicznie â€“ bardziej lokalnie|

## Zalecenia:

- âœ… Dla **faktu**, **QA**, **debugowania kodu**:
    - `temperature â‰ˆ 0.2 â€“ 0.3`
    - `top_p â‰ˆ 0.8`
- ðŸŽ¨ Dla **twÃ³rczoÅ›ci / storytelling**:
    - `temperature â‰ˆ 0.8 â€“ 1.0`
    - `top_p â‰ˆ 0.9 â€“ 1.0`
- ðŸ§ª Zmieniaj **jeden parametr na raz**, by Å‚atwiej zrozumieÄ‡ wpÅ‚yw zmian.

# ðŸ’¡ PrzykÅ‚ad zastosowania

```python
# Zapytanie do API z okreÅ›lonymi parametrami
openai.ChatCompletion.create(
  model="gpt-4",
  messages=[
    {"role": "user", "content": "WymyÅ›l slogan reklamowy dla ekologicznej kawiarni"}
  ],
  temperature=0.9,  # Zachowujemy wysokÄ… kreatywnoÅ›Ä‡
  top_p=1.0
)

# Dla zadaÅ„ precyzyjnych, np. przetwarzanie rozkazÃ³w:
openai.ChatCompletion.create(
  model="gpt-4",
  messages=[
    {"role": "user", "content": "WyodrÄ™bnij numer PESEL z tekstu: 'Klient PESEL: 92062112345'"}
  ],
  temperature=0.2,
  top_p=0.7
)
```

# ðŸ“Œ Å¹rÃ³dÅ‚a

- [https://platform.openai.com/docs/guides/gpt](https://platform.openai.com/docs/guides/gpt)
- [https://huggingface.co/blog/how-to-generate](https://huggingface.co/blog/how-to-generate)
- [https://towardsdatascience.com/decoding-methods-in-nlp-8c061ad38f7c](https://towardsdatascience.com/decoding-methods-in-nlp-8c061ad38f7c)
- [https://arxiv.org/pdf/1904.09751.pdf](https://arxiv.org/pdf/1904.09751.pdf)

# ðŸ‘½ Brudnopis

- Rekomendacja: temperature + top_p = odpowiednik balansu miÄ™dzy deterministycznym a twÃ³rczym zachowaniem
- Modele nowej generacji (Claude, PaLM, Gemini) czÄ™sto takÅ¼e obsÅ‚ugujÄ… `temperature`, `top_p`, `top_k`
- Dodatkowe parametry: frequency_penalty, presence_penalty, max_tokens â€” warto zebraÄ‡ jako osobnÄ… notatkÄ™
- Tip: 0.0 != â€žlogika bez bÅ‚Ä™dÃ³wâ€ â€” niska temperatura moÅ¼e powtarzaÄ‡ faktograficzne bÅ‚Ä™dy pewnie.