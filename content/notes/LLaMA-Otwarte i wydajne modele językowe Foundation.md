---
title: LLaMA-Otwarte i wydajne modele językowe Foundation
tags: 
aliases:
---
## Co nowego?

Niniejszy artykuł przedstawia kolekcję podstawowych modeli językowych o parametrach od 7B do 65B.

Modele są trenowane na bilionach tokenów z publicznie dostępnych zbiorów danych.

Praca [(Hoffman et al. 2022)](https://arxiv.org/abs/2203.15556) pokazuje, że biorąc pod uwagę budżet obliczeniowy, mniejsze modele wytrenowane na znacznie większej ilości danych mogą osiągnąć lepszą wydajność niż ich większe odpowiedniki. W pracy tej zaleca się trenowanie modeli 10B na 200B tokenów. Jednak w artykule LLaMA stwierdzono, że wydajność modelu 7B nadal poprawia się nawet po 1T tokenów.

![[images/Pasted image 20231007182921.png]]

Niniejsza praca koncentruje się na modelach treningowych (LLaMA), które osiągają najlepszą możliwą wydajność przy różnych budżetach wnioskowania, poprzez trening na większej liczbie tokenów.

## Możliwości i kluczowe wyniki[](https://www.promptingguide.ai/models/llama#capabilities--key-results)

Ogólnie rzecz biorąc, LLaMA-13B przewyższa GPT-3(175B) w wielu testach porównawczych, mimo że jest 10 razy mniejsza i możliwa do uruchomienia na jednym GPU. LLaMA 65B jest konkurencyjna w stosunku do modeli takich jak Chinchilla-70B i PaLM-540B.

_Paper:_ [LLaMA: Open and Efficient Foundation Language Models(opens in a new tab)](https://arxiv.org/abs/2302.13971)
_Code:_ [https://github.com/facebookresearch/llama(opens in a new tab)](https://github.com/facebookresearch/llama)

## Referencje

- [Koala: A Dialogue Model for Academic Research(opens in a new tab)](https://bair.berkeley.edu/blog/2023/04/03/koala/) (April 2023)
- [Baize: An Open-Source Chat Model with Parameter-Efficient Tuning on Self-Chat Data(opens in a new tab)](https://arxiv.org/abs/2304.01196) (April 2023)
- [Vicuna: An Open-Source Chatbot Impressing GPT-4 with 90%* ChatGPT Quality(opens in a new tab)](https://vicuna.lmsys.org/) (March 2023)
- [LLaMA-Adapter: Efficient Fine-tuning of Language Models with Zero-init Attention(opens in a new tab)](https://arxiv.org/abs/2303.16199) (March 2023)
- [GPT4All(opens in a new tab)](https://github.com/nomic-ai/gpt4all) (March 2023)
- [ChatDoctor: A Medical Chat Model Fine-tuned on LLaMA Model using Medical Domain Knowledge(opens in a new tab)](https://arxiv.org/abs/2303.14070) (March 2023)
- [Stanford Alpaca(opens in a new tab)](https://github.com/tatsu-lab/stanford_alpaca) (March 2023)