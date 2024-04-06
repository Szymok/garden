---
title: ChatGPT Prompt Engineering
tags: 
aliases:
---
W tej sekcji omawiamy najnowsze techniki inżynierii podpowiedzi dla ChatGPT, w tym wskazówki, aplikacje, ograniczenia, dokumenty i dodatkowe materiały do czytania.

Tematy:

- [Wprowadzenie do ChatGPT]
- Przeglądanie Conversation Task
- Rozmowy z ChatGPT

## [Wprowadzenie do ChatGPT]

ChatGPT to nowy model wyszkolony przez OpenAI, który ma zdolność do interakcji w sposób konwersacyjny. Model ten jest przeszkolony do wykonywania instrukcji w podpowiedzi, aby zapewnić odpowiednie odpowiedzi w kontekście dialogu. ChatGPT może pomóc w odpowiadaniu na pytania, sugerowaniu przepisów, pisaniu tekstów w określonym stylu, generowaniu kodu i wielu innych.

ChatGPT jest szkolony przy użyciu Reinforcement Learning from Human Feedback (RLHF). Chociaż model ten jest o wiele bardziej wydajny niż poprzednie iteracje GPT (a także wyszkolony w celu zmniejszenia szkodliwych i nieprawdziwych wyników), nadal ma pewne ograniczenia. Omówmy niektóre z możliwości i ograniczeń na konkretnych przykładach.

Możesz skorzystać z podglądu badań ChatGPT tutaj, ale w poniższych przykładach użyjemy trybu czatu na OpenAI Playground.

## Przegląd Conversation Task

W jednym z poprzednich przewodników omówiliśmy nieco możliwości konwersacji i podpowiedzi ról. Opisaliśmy, jak poinstruować LLM, aby prowadził rozmowę w określonym stylu, z określonymi intencjami, zachowaniem i tożsamością.

Przyjrzyjmy się naszemu poprzedniemu podstawowemu przykładowi, w którym stworzyliśmy system konwersacyjny zdolny do generowania bardziej technicznych i naukowych odpowiedzi na pytania.

_Prompt:_

```
The following is a conversation with an AI research assistant. The assistant tone is technical and scientific.Human: Hello, who are you?AI: Greeting! I am an AI research assistant. How can I help you today?Human: Can you tell me about the creation of black holes?AI:
```

Na powyższym przykładzie widać dwa ważne elementy:

- **intencja** lub wyjaśnienie, czym jest chatbot
- **tożsamość**, która instruuje styl lub ton, jakiego chatbot będzie używał, aby odpowiedzieć

Powyższy prosty przykład działa dobrze z interfejsami API uzupełniania tekstu, które wykorzystują `text-davinci-003`. Niedawno OpenAI [ogłosiło ChatGPT APIs](https://openai.com/blog/introducing-chatgpt-and-whisper-apis), który jest bardziej wydajnym i tańszym modelem o nazwie `gpt-3.5-turbo` został specjalnie zbudowany dla tego typu funkcjonalności (uzupełnianie czatu). W rzeczywistości OpenAI zaleca ten model jako najlepszy nawet dla przypadków użycia innych niż czat. Inne korzyści wynikające z korzystania z interfejsów API ChatGPT to znaczna redukcja kosztów (90%) i wydajność.

Duże firmy, takie jak Snap Inc. i Instacart, już integrują funkcje konwersacyjne obsługiwane przez ChatGPT w swoich produktach, od spersonalizowanych rekomendacji po otwarte cele zakupowe.

## Rozmowa z ChatGPT

### Multi-turn Conversations

Aby rozpocząć demonstrację możliwości ChatGPT, użyjemy powyższego przykładu asystenta chatbota i omówimy wyniki. W porównaniu do `text-davinci-003`, model `gpt-3.5-turbo`, który zasila ChatGPT, używa formatu czatu jako danych wejściowych. Model oczekuje serii wiadomości jako danych wejściowych i wykorzystuje je do wygenerowania odpowiedzi.

_Input:_

```
SYSTEM: You are an AI research assistant. You use a tone that is technical and scientific.USER: Hello, who are you?ASSISTANT: Greeting! I am an AI research assistant. How can I help you today?USER: Can you tell me about the creation of black holes?
```

_Output:_

```
ASSISTANT: Of course! Black holes are created when a massive star runs out of fuel and collapses under its own gravity. This collapse causes the star to become incredibly dense, with a gravitational field so strong that not even light can escape it. This point of no return is known as the event horizon. Once a star crosses the event horizon, it is considered a black hole...
```

Zauważ, że w powyższym przykładzie uprościłem dane wejściowe i wyjściowe, ale interfejs API uzupełniania czatu ChatGPT wymaga, aby wiadomości miały określony format. Poniżej dodałem migawkę tego, jak ten przykład wyglądałby przy użyciu `Chat Mode` w OpenAI Playground:

![[images/Pasted image 20231007182639.png]]

Bardziej formalne wywołanie API dla naszego przykładu wyglądałoby mniej więcej tak, jak w poniższym przykładzie:

```
import openai openai.ChatCompletion.create(  model="gpt-3.5-turbo",  messages=[        {"role": "system", "content": "You are an AI research assistant. You use a tone that is technical and scientific."},        {"role": "user", "content": "Hello, who are you?"},        {"role": "assistant", "content": "Greeting! I am an AI research assistant. How can I help you today?"},        {"role": "user", "content": "Can you tell me about the creation of black holes?"}    ])
```

W rzeczywistości oczekuje się, że sposób interakcji programistów z ChatGPT w przyszłości będzie odbywał się za pośrednictwem [Chat Markup Language](https://github.com/openai/openai-python/blob/main/chatml.md) (w skrócie ChatML).

### Single-turn tasks

Format czatu umożliwia konwersacje wieloobrotowe, ale obsługuje również zadania jednoobrotowe, podobne do tego, co wykorzystaliśmy w `text-davinci-003`. Oznacza to, że możemy użyć ChatGPT do wykonywania podobnych zadań, jakie zademonstrowaliśmy dla oryginalnych modeli GPT. Na przykład, spróbujmy wykonać następujące zadanie odpowiadania na pytania przy użyciu ChatGPT:

_Input:_

```
USER: Answer the question based on the context below. Keep the answer short and concise. Respond "Unsure about answer" if not sure about the answer.Context: Teplizumab traces its roots to a New Jersey drug company called Ortho Pharmaceutical. There, scientists generated an early version of the antibody, dubbed OKT3. Originally sourced from mice, the molecule was able to bind to the surface of T cells and limit their cell-killing potential. In 1986, it was approved to help prevent organ rejection after kidney transplants, making it the first therapeutic antibody allowed for human use.Question: What was OKT3 originally sourced from?Answer:
```

_Output:_

```
ASSISTANT: Mice.
```

Należy pamiętać, że dodaję etykiety `USER` i `ASSISTANT`, aby lepiej zademonstrować, w jaki sposób można wykonać zadanie za pomocą ChatGPT. Oto przykład z wykorzystaniem Playground:

![[images/Pasted image 20231007182732.png]]

Bardziej formalnie, jest to wywołanie API (uwzględniłem tylko komponent wiadomości żądania):

```
CONTENT = """Answer the question based on the context below. Keep the answer short and concise. Respond \"Unsure about answer\" if not sure about the answer. Context: Teplizumab traces its roots to a New Jersey drug company called Ortho Pharmaceutical. There, scientists generated an early version of the antibody, dubbed OKT3. Originally sourced from mice, the molecule was able to bind to the surface of T cells and limit their cell-killing potential. In 1986, it was approved to help prevent organ rejection after kidney transplants, making it the first therapeutic antibody allowed for human use. Question: What was OKT3 originally sourced from? Answer:""" response = openai.ChatCompletion.create(    model="gpt-3.5-turbo",    messages=[        {"role": "user", "content": CONTENT},    ],    temperature=0,)
```

### Instructing Chat Models

Zgodnie z oficjalnymi dokumentami OpenAI, snapshoty modelu `gpt-3.5-turbo` również zostaną udostępnione. Na przykład, możemy uzyskać dostęp do migawki z 1 marca `gpt-3.5-turbo-0301`. Pozwala to deweloperom na wybór konkretnych wersji modelu. Oznacza to również, że najlepsze praktyki dotyczące instruowania modeli mogą się zmieniać z wersji na wersję.

Obecną rekomendacją dla `gpt-3.5-turbo-0301` jest dodanie instrukcji w wiadomości `user` w przeciwieństwie do dostępnej wiadomości `system`.

## Referencje

- [Column Type Annotation using ChatGPT(opens in a new tab)](https://arxiv.org/abs/2306.00745) (June 2023)
- [Enhancing Programming eTextbooks with ChatGPT Generated Counterfactual-Thinking-Inspired Questions(opens in a new tab)](https://arxiv.org/abs/2306.00551) (June 2023)
- [ChatGPT an ENFJ, Bard an ISTJ: Empirical Study on Personalities of Large Language Models(opens in a new tab)](https://arxiv.org/abs/2305.19926) (May 2023)
- [A Systematic Study and Comprehensive Evaluation of ChatGPT on Benchmark Datasets(opens in a new tab)](https://arxiv.org/abs/2305.18486) (May 2023)
- [Chatbots put to the test in math and logic problems: A preliminary comparison and assessment of ChatGPT-3.5, ChatGPT-4, and Google Bard(opens in a new tab)](https://arxiv.org/abs/2305.18618) (May 2023)
- [GPT Models in Construction Industry: Opportunities, Limitations, and a Use Case Validation(opens in a new tab)](https://arxiv.org/abs/2305.18997) (May 2023)
- [Fairness of ChatGPT(opens in a new tab)](https://arxiv.org/abs/2305.18569) (May 2023)
- [Mapping ChatGPT in Mainstream Media: Early Quantitative Insights through Sentiment Analysis and Word Frequency Analysis(opens in a new tab)](https://arxiv.org/abs/2305.18340) (May 2023)
- [A Survey on ChatGPT: AI-Generated Contents, Challenges, and Solutions(opens in a new tab)](https://arxiv.org/abs/2305.18339) (May 2023)
- [Do Language Models Know When They're Hallucinating References?(opens in a new tab)](https://arxiv.org/abs/2305.18248) (May 2023)
- [HowkGPT: Investigating the Detection of ChatGPT-generated University Student Homework through Context-Aware Perplexity Analysis]
- [Playing repeated games with Large Language Models(opens in a new tab)](https://arxiv.org/abs/2305.16867) (May 2023)
- [Zero is Not Hero Yet: Benchmarking Zero-Shot Performance of LLMs for Financial Tasks(opens in a new tab)](https://arxiv.org/abs/2305.16633) (May 2023)
- [Leveraging LLMs for KPIs Retrieval from Hybrid Long-Document: A Comprehensive Framework and Dataset(opens in a new tab)](https://arxiv.org/abs/2305.16344) (May 2023)
- [Marked Personas: Using Natural Language Prompts to Measure Stereotypes in Language Models(opens in a new tab)](https://arxiv.org/abs/2305.18189v1) (May 2023)
- [The Larger They Are, the Harder They Fail: Language Models do not Recognize Identifier Swaps in Python(opens in a new tab)](https://arxiv.org/pdf/2305.15507v1.pdf) (May 2023)
- [InternGPT: Solving Vision-Centric Tasks by Interacting with ChatGPT Beyond Language(opens in a new tab)](https://arxiv.org/abs/2305.05662v3) (May 2023)
- [Narrative XL: A Large-scale Dataset For Long-Term Memory Models(opens in a new tab)](https://arxiv.org/abs/2305.13877) (May 2023)
- [Does ChatGPT have Theory of Mind?(opens in a new tab)](https://arxiv.org/abs/2305.14020) (May 2023)
- [Can LLM Already Serve as A Database Interface? A BIg Bench for Large-Scale Database Grounded Text-to-SQLs(opens in a new tab)](https://arxiv.org/abs/2305.03111v2) (May 2023)
- [ZeroSCROLLS: A Zero-Shot Benchmark for Long Text Understanding(opens in a new tab)](https://arxiv.org/abs/2305.14196) (May 2023)
- [Navigating Prompt Complexity for Zero-Shot Classification: A Study of Large Language Models in Computational Social Science(opens in a new tab)](https://arxiv.org/abs/2305.14310) (May 2023)
- [ChatGPT-EDSS: Empathetic Dialogue Speech Synthesis Trained from ChatGPT-derived Context Word Embeddings(opens in a new tab)](https://arxiv.org/abs/2305.13724) (May 2023)
- [Can LLMs facilitate interpretation of pre-trained language models?(opens in a new tab)](https://arxiv.org/abs/2305.13386) (May 2023)
- [Can ChatGPT Detect Intent? Evaluating Large Language Models for Spoken Language Understanding(opens in a new tab)](https://arxiv.org/abs/2305.13512) (May 2023)
- [LLM-empowered Chatbots for Psychiatrist and Patient Simulation: Application and Evaluation(opens in a new tab)](https://arxiv.org/abs/2305.13614) (May 2023)
- [ChatGPT as your Personal Data Scientist(opens in a new tab)](https://arxiv.org/abs/2305.13657) (May 2023)
- [Are Large Language Models Good Evaluators for Abstractive Summarization?(opens in a new tab)](https://arxiv.org/abs/2305.13091) (May 2023)
- [Can ChatGPT Defend the Truth? Automatic Dialectical Evaluation Elicits LLMs' Deficiencies in Reasoning(opens in a new tab)](https://arxiv.org/abs/2305.13160) (May 2023)
- [Evaluating ChatGPT's Performance for Multilingual and Emoji-based Hate Speech Detection(opens in a new tab)](https://arxiv.org/abs/2305.13276) (May 2023)
- [ChatGPT to Replace Crowdsourcing of Paraphrases for Intent Classification: Higher Diversity and Comparable Model Robustness(opens in a new tab)](https://arxiv.org/abs/2305.12947) (May 2023)
- [Distilling ChatGPT for Explainable Automated Student Answer Assessment(opens in a new tab)](https://arxiv.org/abs/2305.12962) (May 2023)
- [Prompt ChatGPT In MNER: Improved multimodal named entity recognition method based on auxiliary refining knowledge from ChatGPT(opens in a new tab)](https://arxiv.org/abs/2305.12212) (May 2023)
- [ChatGPT Is More Likely to Be Perceived as Male Than Female(opens in a new tab)](https://arxiv.org/abs/2305.12564) (May 2023)
- [Observations on LLMs for Telecom Domain: Capabilities and Limitations(opens in a new tab)](https://arxiv.org/abs/2305.13102) (May 2023)
- [Bits of Grass: Does GPT already know how to write like Whitman?(opens in a new tab)](https://arxiv.org/abs/2305.11064) (May 2023)
- [Are Large Language Models Fit For Guided Reading?(opens in a new tab)](https://arxiv.org/abs/2305.10645) (May 2023)
- [ChatGPT Perpetuates Gender Bias in Machine Translation and Ignores Non-Gendered Pronouns: Findings across Bengali and Five other Low-Resource Languages(opens in a new tab)](https://arxiv.org/abs/2305.10510) (May 2023)
- [BAD: BiAs Detection for Large Language Models in the context of candidate screening(opens in a new tab)](https://arxiv.org/abs/2305.10407) (May 2023)
- [MemoryBank: Enhancing Large Language Models with Long-Term Memory(opens in a new tab)](https://arxiv.org/abs/2305.10250) (May 2023)
- [Knowledge Graph Completion Models are Few-shot Learners: An Empirical Study of Relation Labeling in E-commerce with LLMs(opens in a new tab)](https://arxiv.org/abs/2305.09858) (May 2023)
- [A Preliminary Analysis on the Code Generation Capabilities of GPT-3.5 and Bard AI Models for Java Functions(opens in a new tab)](https://arxiv.org/abs/2305.09402) (May 2023)
- [ChatGPT-4 Outperforms Experts and Crowd Workers in Annotating Political Twitter Messages with Zero-Shot Learning(opens in a new tab)](https://arxiv.org/abs/2304.06588) (April 2023)
- [ChatGPT Beyond English: Towards a Comprehensive Evaluation of Large Language Models in Multilingual Learning(opens in a new tab)](https://arxiv.org/abs/2304.05613) (April 2023)
- [Distinguishing ChatGPT(-3.5, -4)-generated and human-written papers through Japanese stylometric analysis(opens in a new tab)](https://arxiv.org/abs/2304.05534) (April 2023)
- [Zero-shot Temporal Relation Extraction with ChatGPT(opens in a new tab)](https://arxiv.org/abs/2304.05454) (April 2023)
- [Can ChatGPT and Bard Generate Aligned Assessment Items? A Reliability Analysis against Human Performance(opens in a new tab)](https://arxiv.org/abs/2304.05372) (April 2023)
- [Are Large Language Models Ready for Healthcare? A Comparative Study on Clinical Language Understanding(opens in a new tab)](https://arxiv.org/abs/2304.05368) (April 2023)
- [The Wall Street Neophyte: A Zero-Shot Analysis of ChatGPT Over MultiModal Stock Movement Prediction Challenges(opens in a new tab)](https://arxiv.org/abs/2304.05351) (April 2023)
- [Toxicity in ChatGPT: Analyzing Persona-assigned Language Models(opens in a new tab)](https://arxiv.org/abs/2304.05335) (April 2023)
- [Multi-step Jailbreaking Privacy Attacks on ChatGPT(opens in a new tab)](https://arxiv.org/abs/2304.05197) (April 2023)
- [Is ChatGPT a Good Sentiment Analyzer? A Preliminary Study(opens in a new tab)](https://arxiv.org/abs/2304.04339) (April 2023)
- [A Preliminary Evaluation of ChatGPT for Zero-shot Dialogue Understanding(opens in a new tab)](https://arxiv.org/abs/2304.04256) (April 2023)
- [Extractive Summarization via ChatGPT for Faithful Summary Generation(opens in a new tab)](https://arxiv.org/abs/2304.04193) (April 2023)
- [What does ChatGPT return about human values? Exploring value bias in ChatGPT using a descriptive value theory(opens in a new tab)](https://arxiv.org/abs/2304.03612) (April 2023)
- [On the Evaluations of ChatGPT and Emotion-enhanced Prompting for Mental Health Analysis(opens in a new tab)](https://arxiv.org/abs/2304.03347) (April 2023)
- [ChatGPT-Crawler: Find out if ChatGPT really knows what it's talking about(opens in a new tab)](https://arxiv.org/abs/2304.03325) (April 2023)
- [Should ChatGPT be Biased? Challenges and Risks of Bias in Large Language Models(opens in a new tab)](https://arxiv.org/abs/2304.03738) (April 2023)
- [Synthesis of Mathematical programs from Natural Language Specifications(opens in a new tab)](https://arxiv.org/abs/2304.03287) (April 2023)
- [Large language models effectively leverage document-level context for literary translation, but critical errors persist(opens in a new tab)](https://arxiv.org/abs/2304.03245) (April 2023)
- [Investigating Chain-of-thought with ChatGPT for Stance Detection on Social Media(opens in a new tab)](https://arxiv.org/abs/2304.03087) (April 2023)
- [ChatGPT for Shaping the Future of Dentistry: The Potential of Multi-Modal Large Language Model(opens in a new tab)](https://arxiv.org/abs/2304.03086) (April 2023)
- [Can Large Language Models Play Text Games Well? Current State-of-the-Art and Open Questions(opens in a new tab)](https://arxiv.org/abs/2304.02868) (April 2023)
- [Human-like Summarization Evaluation with ChatGPT(opens in a new tab)](https://arxiv.org/abs/2304.02554) (April 2023)
- [Evaluation of ChatGPT Family of Models for Biomedical Reasoning and Classification(opens in a new tab)](https://arxiv.org/abs/2304.02496) (April 2023)
- [Comparative Analysis of CHATGPT and the evolution of language models(opens in a new tab)](https://arxiv.org/abs/2304.02468) (April 2023)
- [Unleashing the Power of ChatGPT for Translation: An Empirical Study(opens in a new tab)](https://arxiv.org/abs/2304.02182) (April 2023)
- [Geotechnical Parrot Tales (GPT): Overcoming GPT hallucinations with prompt engineering for geotechnical applications(opens in a new tab)](https://arxiv.org/abs/2304.02138) (April 2023)
- [Unlocking the Potential of ChatGPT: A Comprehensive Exploration of its Applications, Advantages, Limitations, and Future Directions in Natural Language Processing(opens in a new tab)](https://arxiv.org/abs/2304.02017) (April 2023)
- [Summary of ChatGPT/GPT-4 Research and Perspective Towards the Future of Large Language Models(opens in a new tab)](https://arxiv.org/abs/2304.01852) (April 2023)
- [Is ChatGPT a Highly Fluent Grammatical Error Correction System? A Comprehensive Evaluation(opens in a new tab)](https://arxiv.org/abs/2304.01746) (April 2023)
- [Safety Analysis in the Era of Large Language Models: A Case Study of STPA using ChatGPT(opens in a new tab)](https://arxiv.org/abs/2304.01246) (April 2023)
- [Large language models can rate news outlet credibility(opens in a new tab)](https://arxiv.org/abs/2304.00228) (April 2023)
- [Can AI Chatbots Pass the Fundamentals of Engineering (FE) and Principles and Practice of Engineering (PE) Structural Exams?(opens in a new tab)](https://arxiv.org/abs/2303.18149) (April 2023)
- [Can AI Put Gamma-Ray Astrophysicists Out of a Job?(opens in a new tab)](https://arxiv.org/abs/2303.17853) (March 2023)
- [Comparing Abstractive Summaries Generated by ChatGPT to Real Summaries Through Blinded Reviewers and Text Classification Algorithms(opens in a new tab)](https://arxiv.org/abs/2303.17650) (March 2023)
- [HuggingGPT: Solving AI Tasks with ChatGPT and its Friends in HuggingFace(opens in a new tab)](https://arxiv.org/abs/2303.17580) (March 2023)
- [SelfCheckGPT: Zero-Resource Black-Box Hallucination Detection for Generative Large Language Models(opens in a new tab)](https://arxiv.org/abs/2303.08896) (March 2023)
- [WavCaps: A ChatGPT-Assisted Weakly-Labelled Audio Captioning Dataset for Audio-Language Multimodal Research(opens in a new tab)](https://arxiv.org/abs/2303.17395) (March 2023)
- [How well do Large Language Models perform in Arithmetic tasks?(opens in a new tab)](https://arxiv.org/abs/2304.02015) (March 2023)
- [Assessing Cross-Cultural Alignment between ChatGPT and Human Societies: An Empirical Study(opens in a new tab)](https://arxiv.org/abs/2303.17466) (March 2023)
- [Yes but.. Can ChatGPT Identify Entities in Historical Documents?(opens in a new tab)](https://arxiv.org/abs/2303.17322) (March 2023)
- [Evaluation of ChatGPT for NLP-based Mental Health Applications(opens in a new tab)](https://arxiv.org/abs/2303.15727) (March 2023)
- [A Perspectival Mirror of the Elephant: Investigating Language Bias on Google, ChatGPT, Wikipedia, and YouTube(opens in a new tab)](https://arxiv.org/abs/2303.16281) (March 2023)
- [ChatGPT or academic scientist? Distinguishing authorship with over 99% accuracy using off-the-shelf machine learning tools(opens in a new tab)](https://arxiv.org/abs/2303.16352) (March 2023)
- [Zero-shot Clinical Entity Recognition using ChatGPT(opens in a new tab)](https://arxiv.org/abs/2303.16416) (March 2023)
- [ChatGPT is a Knowledgeable but Inexperienced Solver: An Investigation of Commonsense Problem in Large Language Models(opens in a new tab)](https://arxiv.org/abs/2303.16421) (March 2023)
- [ChatGPT4PCG Competition: Character-like Level Generation for Science Birds(opens in a new tab)](https://arxiv.org/abs/2303.15662) (March 2023)
- [ChatGPT as a Factual Inconsistency Evaluator for Abstractive Text Summarization(opens in a new tab)](https://arxiv.org/abs/2303.15621) (March 2023)
- [Chat-REC: Towards Interactive and Explainable LLMs-Augmented Recommender System(opens in a new tab)](https://arxiv.org/abs/2303.14524) (March 2023)
- [A comprehensive evaluation of ChatGPT's zero-shot Text-to-SQL capability(opens in a new tab)](https://arxiv.org/abs/2303.13547) (March 2023)
- [Towards Making the Most of ChatGPT for Machine Translation(opens in a new tab)](https://arxiv.org/abs/2303.13780) (March 2023)
- [Error Analysis Prompting Enables Human-Like Translation Evaluation in Large Language Models: A Case Study on ChatGPT(opens in a new tab)](https://arxiv.org/abs/2303.13809) (March 2023)
- [ChatGPT Outperforms Crowd-Workers for Text-Annotation Tasks(opens in a new tab)](https://arxiv.org/pdf/2303.15056v1.pdf) (March 2023)
- [ChatGPT or Grammarly? Evaluating ChatGPT on Grammatical Error Correction Benchmark(opens in a new tab)](https://arxiv.org/abs/2303.13648) (March 2023)
- [ChatGPT and a New Academic Reality: AI-Written Research Papers and the Ethics of the Large Language Models in Scholarly Publishing(opens in a new tab)](https://arxiv.org/abs/2303.13367) (March 2023)
- [Are LLMs the Master of All Trades? : Exploring Domain-Agnostic Reasoning Skills of LLMs(opens in a new tab)](https://arxiv.org/abs/2303.12810) (March 2023)
- [Is ChatGPT A Good Keyphrase Generator? A Preliminary Study(opens in a new tab)](https://arxiv.org/abs/2303.13001) (March 2023)
- [MM-REACT: Prompting ChatGPT for Multimodal Reasoning and Action(opens in a new tab)](https://arxiv.org/abs/2303.11381) (March 2023)
- [Large Language Models Can Be Used to Estimate the Ideologies of Politicians in a Zero-Shot Learning Setting(opens in a new tab)](https://arxiv.org/abs/2303.12057) (March 2023)
- [Chinese Intermediate English Learners outdid ChatGPT in deep cohesion: Evidence from English narrative writing(opens in a new tab)](https://arxiv.org/abs/2303.11812) (March 2023)
- [A Comprehensive Capability Analysis of GPT-3 and GPT-3.5 Series Models(opens in a new tab)](https://arxiv.org/abs/2303.10420) (March 2023)
- [ChatGPT as the Transportation Equity Information Source for Scientific Writing(opens in a new tab)](https://arxiv.org/abs/2303.11158) (March 2023)
- [Translating Radiology Reports into Plain Language using ChatGPT and GPT-4 with Prompt Learning: Promising Results, Limitations, and Potential(opens in a new tab)](https://arxiv.org/abs/2303.09038) (March 2023)
- [ChatGPT Participates in a Computer Science Exam(opens in a new tab)](https://arxiv.org/abs/2303.09461) (March 2023)
- [Consistency Analysis of ChatGPT(opens in a new tab)](https://arxiv.org/abs/2303.06273) (Mar 2023)
- [Algorithmic Ghost in the Research Shell: Large Language Models and Academic Knowledge Creation in Management Research(opens in a new tab)](https://arxiv.org/abs/2303.07304) (Mar 2023)
- [Large Language Models in the Workplace: A Case Study on Prompt Engineering for Job Type Classification(opens in a new tab)](https://arxiv.org/abs/2303.07142) (March 2023)
- [Seeing ChatGPT Through Students' Eyes: An Analysis of TikTok Data(opens in a new tab)](https://arxiv.org/abs/2303.05349) (March 2023)
- [Extracting Accurate Materials Data from Research Papers with Conversational Language Models and Prompt Engineering -- Example of ChatGPT(opens in a new tab)](https://arxiv.org/abs/2303.05352) (Mar 2023)
- [ChatGPT is on the horizon: Could a large language model be all we need for Intelligent Transportation?(opens in a new tab)](https://arxiv.org/abs/2303.05382) (Mar 2023)
- [Making a Computational Attorney(opens in a new tab)](https://arxiv.org/abs/2303.05383) (Mar 2023)
- [Does Synthetic Data Generation of LLMs Help Clinical Text Mining?(opens in a new tab)](https://arxiv.org/abs/2303.04360) (Mar 2023)
- [MenuCraft: Interactive Menu System Design with Large Language Models(opens in a new tab)](https://arxiv.org/abs/2303.04496) (Mar 2023)
- [A Comprehensive Survey of AI-Generated Content (AIGC): A History of Generative AI from GAN to ChatGPT(opens in a new tab)](https://arxiv.org/abs/2303.04226) (Mar 2023)
- [Exploring the Feasibility of ChatGPT for Event Extraction(opens in a new tab)](https://arxiv.org/abs/2303.03836)
- [ChatGPT: Beginning of an End of Manual Annotation? Use Case of Automatic Genre Identification(opens in a new tab)](https://arxiv.org/abs/2303.03953) (Mar 2023)
- [Is ChatGPT a Good NLG Evaluator? A Preliminary Study(opens in a new tab)](https://arxiv.org/abs/2303.04048) (Mar 2023)
- [Will Affective Computing Emerge from Foundation Models and General AI? A First Evaluation on ChatGPT(opens in a new tab)](https://arxiv.org/abs/2303.03186) (Mar 2023)
- [UZH_CLyp at SemEval-2023 Task 9: Head-First Fine-Tuning and ChatGPT Data Generation for Cross-Lingual Learning in Tweet Intimacy Prediction(opens in a new tab)](https://arxiv.org/abs/2303.01194) (Mar 2023)
- [How to format inputs to ChatGPT models(opens in a new tab)](https://github.com/openai/openai-cookbook/blob/main/examples/How_to_format_inputs_to_ChatGPT_models.ipynb) (Mar 2023)
- [Can ChatGPT Assess Human Personalities? A General Evaluation Framework(opens in a new tab)](https://arxiv.org/abs/2303.01248) (Mar 2023)
- [Cross-Lingual Summarization via ChatGPT(opens in a new tab)](https://arxiv.org/abs/2302.14229) (Feb 2023)
- [ChatAug: Leveraging ChatGPT for Text Data Augmentation(opens in a new tab)](https://arxiv.org/abs/2302.13007) (Feb 2023)
- [Dr ChatGPT, tell me what I want to hear: How prompt knowledge impacts health answer correctness(opens in a new tab)](https://arxiv.org/abs/2302.13793) (Feb 2023)
- [An Independent Evaluation of ChatGPT on Mathematical Word Problems (MWP)(opens in a new tab)](https://arxiv.org/abs/2302.13814) (Feb 2023)
- [ChatGPT: A Meta-Analysis after 2.5 Months(opens in a new tab)](https://arxiv.org/abs/2302.13795) (Feb 2023)
- [Let's have a chat! A Conversation with ChatGPT: Technology, Applications, and Limitations(opens in a new tab)](https://arxiv.org/abs/2302.13817) (Feb 2023)
- [Check Your Facts and Try Again: Improving Large Language Models with External Knowledge and Automated Feedback(opens in a new tab)](https://arxiv.org/abs/2302.12813) (Feb 2023)
- [On the Robustness of ChatGPT: An Adversarial and Out-of-distribution Perspective(opens in a new tab)](https://arxiv.org/abs/2302.12095) (Feb 2023)
- [How Generative AI models such as ChatGPT can be (Mis)Used in SPC Practice, Education, and Research? An Exploratory Study(opens in a new tab)](https://arxiv.org/abs/2302.10916) (Feb 2023)
- [Can ChatGPT Understand Too? A Comparative Study on ChatGPT and Fine-tuned BERT(opens in a new tab)](https://arxiv.org/abs/2302.10198) (Feb 2023)
- [A Prompt Pattern Catalog to Enhance Prompt Engineering with ChatGPT(opens in a new tab)](https://arxiv.org/abs/2302.11382) (Feb 2023)
- [Zero-Shot Information Extraction via Chatting with ChatGPT(opens in a new tab)](https://arxiv.org/abs/2302.10205) (Feb 2023)
- [ChatGPT: Jack of all trades, master of none(opens in a new tab)](https://arxiv.org/abs/2302.10724) (Feb 2023)
- [A Pilot Evaluation of ChatGPT and DALL-E 2 on Decision Making and Spatial Reasoning(opens in a new tab)](https://arxiv.org/abs/2302.09068) (Feb 2023)
- [Netizens, Academicians, and Information Professionals' Opinions About AI With Special Reference To ChatGPT(opens in a new tab)](https://arxiv.org/abs/2302.07136) (Feb 2023)
- [Linguistic ambiguity analysis in ChatGPT(opens in a new tab)](https://arxiv.org/abs/2302.06426) (Feb 2023)
- [ChatGPT versus Traditional Question Answering for Knowledge Graphs: Current Status and Future Directions Towards Knowledge Graph Chatbots(opens in a new tab)](https://arxiv.org/abs/2302.06466) (Feb 2023)
- [What ChatGPT and generative AI mean for science(opens in a new tab)](https://www.nature.com/articles/d41586-023-00340-6) (Feb 2023)
- [Applying BERT and ChatGPT for Sentiment Analysis of Lyme Disease in Scientific Literature(opens in a new tab)](https://arxiv.org/abs/2302.06474) (Feb 2023)
- [Exploring AI Ethics of ChatGPT: A Diagnostic Analysis(opens in a new tab)](https://arxiv.org/abs/2301.12867) (Jan 2023)
- [ChatGPT for Good? On Opportunities and Challenges of Large Language Models for Education(opens in a new tab)](https://www.edu.sot.tum.de/fileadmin/w00bed/hctl/_my_direct_uploads/ChatGPT_for_Good_.pdf) (Jan 2023)
- [The political ideology of conversational AI: Converging evidence on ChatGPT's pro-environmental, left-libertarian orientation(opens in a new tab)](https://arxiv.org/abs/2301.01768) (Jan 2023)
- [Techniques to improve reliability - OpenAI Cookbook(opens in a new tab)](https://github.com/openai/openai-cookbook/blob/main/techniques_to_improve_reliability.md)
- [Awesome ChatGPT Prompts(opens in a new tab)](https://github.com/f/awesome-chatgpt-prompts)
- [Introducing ChatGPT(opens in a new tab)](https://openai.com/blog/chatgpt) (Nov 2022)