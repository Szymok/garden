---
title: PAL (Program-Aided Language Models)
tags: 
aliases:
---
## Czym jest PAL?
Polegają na generowaniu przez model odpowiedzi będącej kodem JavaScript, w którym rozumowanie modelu zapisane jest w postaci komentarzy.

Gao  przedstawia metodę, która wykorzystuje LLM do odczytywania problemów w języku naturalnym i generowania programów jako pośrednich etapów rozumowania. Metoda ta, nazywana modelami językowymi wspomaganymi programowo (PAL), różni się od [Chain-of-Thought Prompting](Chain-of-Thought%20Prompting) tym, że zamiast wykorzystywać dowolny tekst do uzyskania rozwiązania, odciąża etap rozwiązania do programowego środowiska wykonawczego, takiego jak interpreter Pythona.

![[images/Pasted image 20230925211125.png]]

Przyjrzyjmy się przykładowi wykorzystującemu [[notes/Langchain|LangChain]] i OpenAI GPT-3. Jesteśmy zainteresowani opracowaniem prostej aplikacji, która jest w stanie zinterpretować zadane pytanie i udzielić odpowiedzi, wykorzystując interpreter Pythona.

W szczególności jesteśmy zainteresowani stworzeniem funkcjonalności, która pozwala na wykorzystanie LLM do odpowiadania na pytania wymagające zrozumienia daty. Dostarczymy LLM podpowiedź zawierającą kilka przykładów, które zostały zaadoptowane.

```python
import openai
from datetime import datetime
from dateutil.relativedelta import relativedelta
import os
from langchain.llms import OpenAI
from dotenv import load_dotenv
```

Najpierw skonfigurujmy kilka rzeczy:

```python
load_dotenv()
 
# API configuration
openai.api_key = os.getenv("OPENAI_API_KEY")
 
# for LangChain
os.environ["OPENAI_API_KEY"] = os.getenv("OPENAI_API_KEY")
```

Konfiguracja instancji modelu:

```python
llm = OpenAI(model_name='text-davinci-003', temperature=0)
```

Setup prompt + pytanie:

```
question = "Today is 27 February 2023. I was born exactly 25 years ago. What is the date I was born in MM/DD/YYYY?"
 
DATE_UNDERSTANDING_PROMPT = """
# Q: 2015 is coming in 36 hours. What is the date one week from today in MM/DD/YYYY?
# If 2015 is coming in 36 hours, then today is 36 hours before.
today = datetime(2015, 1, 1) - relativedelta(hours=36)
# One week from today,
one_week_from_today = today + relativedelta(weeks=1)
# The answer formatted with %m/%d/%Y is
one_week_from_today.strftime('%m/%d/%Y')
# Q: The first day of 2019 is a Tuesday, and today is the first Monday of 2019. What is the date today in MM/DD/YYYY?
# If the first day of 2019 is a Tuesday, and today is the first Monday of 2019, then today is 6 days later.
today = datetime(2019, 1, 1) + relativedelta(days=6)
# The answer formatted with %m/%d/%Y is
today.strftime('%m/%d/%Y')
# Q: The concert was scheduled to be on 06/01/1943, but was delayed by one day to today. What is the date 10 days ago in MM/DD/YYYY?
# If the concert was scheduled to be on 06/01/1943, but was delayed by one day to today, then today is one day later.
today = datetime(1943, 6, 1) + relativedelta(days=1)
# 10 days ago,
ten_days_ago = today - relativedelta(days=10)
# The answer formatted with %m/%d/%Y is
ten_days_ago.strftime('%m/%d/%Y')
# Q: It is 4/19/1969 today. What is the date 24 hours later in MM/DD/YYYY?
# It is 4/19/1969 today.
today = datetime(1969, 4, 19)
# 24 hours later,
later = today + relativedelta(hours=24)
# The answer formatted with %m/%d/%Y is
today.strftime('%m/%d/%Y')
# Q: Jane thought today is 3/11/2002, but today is in fact Mar 12, which is 1 day later. What is the date 24 hours later in MM/DD/YYYY?
# If Jane thought today is 3/11/2002, but today is in fact Mar 12, then today is 3/12/2002.
today = datetime(2002, 3, 12)
# 24 hours later,
later = today + relativedelta(hours=24)
# The answer formatted with %m/%d/%Y is
later.strftime('%m/%d/%Y')
# Q: Jane was born on the last day of Feburary in 2001. Today is her 16-year-old birthday. What is the date yesterday in MM/DD/YYYY?
# If Jane was born on the last day of Feburary in 2001 and today is her 16-year-old birthday, then today is 16 years later.
today = datetime(2001, 2, 28) + relativedelta(years=16)
# Yesterday,
yesterday = today - relativedelta(days=1)
# The answer formatted with %m/%d/%Y is
yesterday.strftime('%m/%d/%Y')
# Q: {question}
""".strip() + '\n'
```

```python
llm_out = llm(DATE_UNDERSTANDING_PROMPT.format(question=question))
print(llm_out)
```

Spowoduje to wyświetlenie następującego wyniku:

```
# If today is 27 February 2023 and I was born exactly 25 years ago, then I was born 25 years before.
today = datetime(2023, 2, 27)
# I was born 25 years before,
born = today - relativedelta(years=25)
# The answer formatted with %m/%d/%Y is
born.strftime('%m/%d/%Y')
```

Zawartość llm_out to fragment kodu Pythona. Poniżej, polecenie exec jest używane do wykonania tego fragmentu kodu Pythona.

```python
exec(llm_out)
print(born)
```

Spowoduje to wyświetlenie następujących danych: 02/27/1998