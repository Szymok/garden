---
title: ReAct Prompting
tags: 
aliases:
---
Yao wprowadzili framework o nazwie ReAct, w którym LLM są używane do generowania zarówno śladów rozumowania, jak i działań specyficznych dla zadania w sposób przeplatany.

Generowanie śladów rozumowania pozwala modelowi indukować, śledzić i aktualizować plany działania, a nawet obsługiwać wyjątki. Krok działania pozwala na łączenie się i gromadzenie informacji z zewnętrznych źródeł, takich jak bazy wiedzy lub środowiska.

Framework ReAct może pozwolić LLM na interakcję z zewnętrznymi narzędziami w celu uzyskania dodatkowych informacji, które prowadzą do bardziej wiarygodnych i rzeczowych odpowiedzi.

Wyniki pokazują, że ReAct może przewyższać kilka najnowocześniejszych rozwiązań bazowych w zadaniach językowych i decyzyjnych. ReAct prowadzi również do poprawy interpretowalności i wiarygodności LLM. Ogólnie rzecz biorąc, autorzy stwierdzili, że najlepsze podejście wykorzystuje ReAct w połączeniu z łańcuchem myśli (CoT), który pozwala na wykorzystanie zarówno wiedzy wewnętrznej, jak i informacji zewnętrznych uzyskanych podczas rozumowania.

## Jak to działa?

ReAct jest inspirowany synergią między "działaniem" i "rozumowaniem", które pozwalają ludziom uczyć się nowych zadań i podejmować decyzje lub rozumować.

Podpowiedzi typu Chain-of-thought (CoT) wykazały zdolność LLM do przeprowadzania śladów rozumowania w celu generowania odpowiedzi na pytania obejmujące między innymi arytmetykę i zdroworozsądkowe rozumowanie (Wei i in., 2022)(otwiera się w nowej karcie). Jednak brak dostępu do świata zewnętrznego lub niezdolność do aktualizacji wiedzy może prowadzić do takich problemów, jak halucynacje faktów i propagacja błędów.

ReAct to ogólny paradygmat, który łączy rozumowanie i działanie z LLM. ReAct zachęca LLM do generowania werbalnych ścieżek rozumowania i działań dla danego zadania. Pozwala to systemowi na dynamiczne rozumowanie w celu tworzenia, utrzymywania i dostosowywania planów działania, jednocześnie umożliwiając interakcję ze środowiskami zewnętrznymi (np. Wikipedią) w celu włączenia dodatkowych informacji do rozumowania. Poniższy rysunek przedstawia przykład ReAct i różne kroki związane z odpowiadaniem na pytania.

![[images/Pasted image 20230924185406.png]]

W powyższym przykładzie przekazujemy prompt podobny do następującego pytania z HotpotQA

```
Aside from the Apple Remote, what other devices can control the program Apple Remote was originally designed to interact with?
```

Należy zauważyć, że przykłady w kontekście są również dodawane do podpowiedzi, ale pomijamy to tutaj dla uproszczenia. Widzimy, że model generuje trajektorie rozwiązywania zadań (Thought, Act). Obs odpowiada obserwacji ze środowiska, z którym wchodzi się w interakcję (np. wyszukiwarka). Zasadniczo ReAct może pobierać informacje w celu wsparcia rozumowania, podczas gdy rozumowanie pomaga określić, co należy pobrać w następnej kolejności.

## ReAct Prompting

Aby zademonstrować, jak działa podpowiadanie ReAct, posłużmy się przykładem z artykułu.

Pierwszym krokiem jest wybranie przypadków ze zbioru treningowego (np. HotPotQA) i skomponowanie trajektorii w formacie ReAct. Są one używane jako przykłady kilku strzałów w podpowiedziach. Trajektorie składają się z wielu kroków myśl-działanie-obserwacja, jak pokazano na powyższym rysunku. Swobodne myśli są wykorzystywane do realizacji różnych zadań, takich jak rozkładanie pytań, wydobywanie informacji, przeprowadzanie zdroworozsądkowego/arytmetycznego rozumowania, formułowanie wyszukiwania i syntetyzowanie ostatecznej odpowiedzi.

Oto przykład tego, jak wyglądają przykłady podpowiedzi ReAct (uzyskane z artykułu i skrócone do jednego przykładu dla uproszczenia):

```
Question What is the elevation range for the area that the eastern sector of theColorado orogeny extends into?Thought 1 I need to search Colorado orogeny, find the area that the eastern sectorof the Colorado orogeny extends into, then find the elevation range of thearea.Action 1 Search[Colorado orogeny]Observation 1 The Colorado orogeny was an episode of mountain building (an orogeny) inColorado and surrounding areas.Thought 2 It does not mention the eastern sector. So I need to look up easternsector.Action 2 Lookup[eastern sector]Observation 2 (Result 1 / 1) The eastern sector extends into the High Plains and is calledthe Central Plains orogeny.Thought 3 The eastern sector of Colorado orogeny extends into the High Plains. So Ineed to search High Plains and find its elevation range.Action 3 Search[High Plains]Observation 3 High Plains refers to one of two distinct land regionsThought 4 I need to instead search High Plains (United States).Action 4 Search[High Plains (United States)]Observation 4 The High Plains are a subregion of the Great Plains. From east to west, theHigh Plains rise in elevation from around 1,800 to 7,000 ft (550 to 2,130m).[3]Thought 5 High Plains rise in elevation from around 1,800 to 7,000 ft, so the answeris 1,800 to 7,000 ft.Action 5 Finish[1,800 to 7,000 ft]...
```

Należy zauważyć, że dla różnych typów zadań stosowane są różne konfiguracje podpowiedzi. W przypadku zadań, w których rozumowanie ma pierwszorzędne znaczenie (np. HotpotQA), w trajektorii rozwiązywania zadania wykorzystywanych jest wiele kroków myśl-działanie-obserwacja. W przypadku zadań decyzyjnych obejmujących wiele kroków działania, myśli są używane rzadko.

## Wyniki w zadaniach wymagających dużej wiedzy

W artykule po raz pierwszy oceniono ReAct w zadaniach wymagających dużej wiedzy, takich jak odpowiadanie na pytania (HotPotQA) i weryfikacja faktów (Fever). PaLM-540B jest używany jako model bazowy dla podpowiedzi.

![[images/Pasted image 20230924185519.png]]

Wyniki podpowiadania w HotPotQA i Fever przy użyciu różnych metod podpowiadania pokazują, że ReAct generalnie działa lepiej niż Act (obejmuje tylko działanie) w obu zadaniach.

Możemy również zaobserwować, że ReAct przewyższa CoT w Fever i pozostaje w tyle za CoT w HotpotQA. Szczegółowa analiza błędów znajduje się w artykule. Podsumowując:

CoT cierpi na halucynację faktów
Ograniczenia strukturalne ReAct zmniejszają jego elastyczność w formułowaniu kroków rozumowania.
ReAct zależy w dużej mierze od informacji, które wyszukuje; nieinformatywne wyniki wyszukiwania wykolejają rozumowanie modelu i prowadzą do trudności w odzyskiwaniu i przeformułowaniu myśli.
Metody podpowiedzi, które łączą i wspierają przełączanie między ReAct i CoT+Self-Consistency, generalnie przewyższają wszystkie inne metody podpowiedzi.

## Wyniki dotyczące zadań decyzyjnych

W artykule przedstawiono również wyniki demonstrujące wydajność ReAct w zadaniach związanych z podejmowaniem decyzji. ReAct jest oceniany na dwóch benchmarkach o nazwie ALFWorld(otwiera się w nowej karcie) (gra tekstowa) i WebShop(otwiera się w nowej karcie) (środowisko strony internetowej zakupów online). Oba obejmują złożone środowiska, które wymagają rozumowania w celu skutecznego działania i eksploracji.

Należy zauważyć, że podpowiedzi ReAct są zaprojektowane inaczej dla tych zadań, ale nadal zachowują tę samą podstawową ideę łączenia rozumowania i działania. Poniżej znajduje się przykład zadania ALFWorld z wykorzystaniem podpowiedzi ReAct.

![[images/Pasted image 20230924185552.png]]

ReAct przewyższa Act zarówno w ALFWorld, jak i Webshop. Act, bez żadnych przemyśleń, nie jest w stanie poprawnie rozłożyć celów na podcele. Rozumowanie wydaje się być korzystne w ReAct dla tego typu zadań, ale obecne metody oparte na podpowiedziach są nadal dalekie od wydajności ekspertów ludzkich w tych zadaniach.

## Wykorzystanie [[notes/Langchain|LangChain]] ReAct

Poniżej znajduje się przykład wysokiego poziomu tego, jak podejście ReAct do podpowiadania działa w praktyce. Będziemy używać OpenAI dla LLM i [[notes/Langchain|LangChain]] (otwiera się w nowej karcie), ponieważ ma on już wbudowaną funkcjonalność, która wykorzystuje framework ReAct do tworzenia agentów wykonujących zadania, łącząc moc LLM i różnych narzędzi.

Najpierw zainstalujmy i zaimportujmy niezbędne biblioteki:

```python
%%capture
#update or install the necessary libraries
!pip install --upgrade openai
!pip install --upgrade langchain
!pip install --upgrade python-dotenv
!pip install google-search-results 
# import libraries

import openaiimport osfrom langchain.llms 
import OpenAIfrom langchain.agents 
import load_toolsfrom langchain.agents 
import initialize_agentfrom dotenv 
import load_dotenvload_dotenv() 
# load API keys; you will need to obtain these if you haven't 
yetos.environ["OPENAI_API_KEY"] = os.getenv("OPENAI_API_KEY")
os.environ["SERPER_API_KEY"] = os.getenv("SERPER_API_KEY")
```

Teraz możemy skonfigurować LLM, narzędzia, których będziemy używać, oraz agenta, który pozwoli nam wykorzystać framework ReAct wraz z LLM i narzędziami. Zauważ, że używamy API wyszukiwania do wyszukiwania informacji zewnętrznych i LLM jako narzędzia matematycznego.

```python
llm = OpenAI(model_name="text-davinci-003" ,temperature=0)
tools = load_tools(["google-serper", "llm-math"], llm=llm)
agent = initialize_agent(tools, llm, agent="zero-shot-react-description", verbose=True)
```

Po skonfigurowaniu możemy teraz uruchomić agenta z żądanym zapytaniem/promptem. Zauważ, że tutaj nie oczekuje się od nas dostarczenia kilku przykładów, jak wyjaśniono w artykule.

```python
agent.run("Who is Olivia Wilde's boyfriend? What is his current age raised to the 0.23 power?")
```

Wykonanie łańcucha wygląda następująco:

```
> Entering new AgentExecutor chain...
 I need to find out who Olivia Wilde's boyfriend is and then calculate his age raised to the 0.23 power.
Action: Search
Action Input: "Olivia Wilde boyfriend"
Observation: Olivia Wilde started dating Harry Styles after ending her years-long engagement to Jason Sudeikis — see their relationship timeline.
Thought: I need to find out Harry Styles' age.
Action: Search
Action Input: "Harry Styles age"
Observation: 29 years
Thought: I need to calculate 29 raised to the 0.23 power.
Action: Calculator
Action Input: 29^0.23
Observation: Answer: 2.169459462491557
 
Thought: I now know the final answer.
Final Answer: Harry Styles, Olivia Wilde's boyfriend, is 29 years old and his age raised to the 0.23 power is 2.169459462491557.
 
> Finished chain.
```

Dane wyjściowe są następujące:

```
"Harry Styles, Olivia Wilde's boyfriend, is 29 years old and his age raised to the 0.23 power is 2.169459462491557."
```

Zaadaptowaliśmy przykład z dokumentacji [[notes/Langchain|LangChain]] (otwiera się w nowej karcie), więc podziękowania należą się im. Zachęcamy uczących się do odkrywania różnych kombinacji narzędzi i zadań.

