---
title: Examples of Prompts
tags: 
aliases:
---
W poprzedniej sekcji przedstawiono podstawowy przykład tego, jak podpowiadać LLM.

Ta sekcja dostarczy więcej przykładów tego, jak używać podpowiedzi do osiągania różnych zadań i wprowadzania kluczowych pojęć po drodze. Często najlepszym sposobem na naukę pojęć są przykłady. Kilka poniższych przykładów ilustruje, w jaki sposób można używać dobrze przygotowanych podpowiedzi do wykonywania różnych typów zadań.

Tematy:

- Text Summarization
- Information Extraction
- Question Answering
- Text Classification
- Conversation
- Code Generation
- Reasoning

Jednym ze standardowych zadań w generowaniu języka naturalnego jest podsumowywanie tekstu. Podsumowanie tekstu może obejmować wiele różnych smaków i dziedzin. W rzeczywistości jednym z najbardziej obiecujących zastosowań modeli językowych jest możliwość podsumowywania artykułów i pojęć w szybkie i łatwe do odczytania streszczenia. Wypróbujmy podstawowe zadanie podsumowujące przy użyciu podpowiedzi.

Załóżmy, że chcesz dowiedzieć się czegoś o antybiotykach, więc możesz wypróbować następującą podpowiedź:

_Prompt:_

```
Explain antibioticsA:
```

_Output:_

```
Antibiotics are a type of medication used to treat bacterial infections. They work by either killing the bacteria or preventing them from reproducing, allowing the body’s immune system to fight off the infection. Antibiotics are usually taken orally in the form of pills, capsules, or liquid solutions, or sometimes administered intravenously. They are not effective against viral infections, and using them inappropriately can lead to antibiotic resistance.
```

"A:" to wyraźny format podpowiedzi, którego używasz podczas odpowiadania na pytania. Użyłeś go tutaj, aby powiedzieć modelowi, że oczekiwana jest dalsza odpowiedź. W tym przykładzie nie jest jasne, w jaki sposób jest to przydatne w porównaniu z nieużywaniem go, ale zostawimy to na późniejsze przykłady. Załóżmy po prostu, że jest to zbyt wiele informacji i chcesz je dalej podsumować. W rzeczywistości możesz poinstruować model, aby podsumował je w jednym zdaniu w następujący sposób:

_Prompt:_

```
Antibiotics are a type of medication used to treat bacterial infections. They work by either killing the bacteria or preventing them from reproducing, allowing the body’s immune system to fight off the infection. Antibiotics are usually taken orally in the form of pills, capsules, or liquid solutions, or sometimes administered intravenously. They are not effective against viral infections, and using them inappropriately can lead to antibiotic resistance.Explain the above in one sentence:
```

_Output:_

```
Antibiotics are medications used to treat bacterial infections by either killing the bacteria or stopping them from reproducing, but they are not effective against viruses and overuse can lead to antibiotic resistance.
```

Nie zwracając zbytniej uwagi na dokładność powyższych danych wyjściowych, które omówimy w późniejszym przewodniku, model próbował podsumować akapit w jednym zdaniu. Instrukcje mogą być sprytne, ale zostawimy to na późniejszy rozdział. Możesz zatrzymać się tutaj i poeksperymentować, aby sprawdzić, czy uzyskasz lepsze wyniki.

## Information Extraction

Podczas gdy modele językowe są szkolone do generowania języka naturalnego i powiązanych zadań, są one również bardzo zdolne do wykonywania klasyfikacji i szeregu innych zadań przetwarzania języka naturalnego (NLP).

Oto przykład podpowiedzi, która wyodrębnia informacje z danego akapitu.

_Prompt:_

```
Author-contribution statements and acknowledgements in research papers should state clearly and specifically whether, and to what extent, the authors used AI technologies such as ChatGPT in the preparation of their manuscript and analysis. They should also indicate which LLMs were used. This will alert editors and reviewers to scrutinize manuscripts more carefully for potential biases, inaccuracies and improper source crediting. Likewise, scientific journals should be transparent about their use of LLMs, for example when selecting submitted manuscripts.Mention the large language model based product mentioned in the paragraph above:
```

_Output:_

```
The large language model based product mentioned in the paragraph above is ChatGPT.
```

Istnieje wiele sposobów na poprawę powyższych wyników, ale ten jest już bardzo przydatny.

Do tej pory powinno być oczywiste, że można poprosić model o wykonanie różnych zadań, po prostu instruując go, co ma robić. Jest to potężna zdolność, którą twórcy produktów AI już wykorzystują do tworzenia potężnych produktów i doświadczeń.

Źródło akapitu: ChatGPT: pięć priorytetów dla badań

## Question Answering

Jednym z najlepszych sposobów na skłonienie modelu do reagowania na konkretne odpowiedzi jest ulepszenie formatu podpowiedzi. Jak wspomniano wcześniej, podpowiedź może łączyć instrukcje, kontekst, wskaźniki wejściowe i wyjściowe, aby uzyskać lepsze wyniki. Chociaż te elementy nie są wymagane, staje się to dobrą praktyką, ponieważ im bardziej szczegółowe są instrukcje, tym lepsze wyniki można uzyskać. Poniżej znajduje się przykład tego, jak wyglądałoby to po bardziej ustrukturyzowanym podpowiedzi.

_Prompt:_

```
Answer the question based on the context below. Keep the answer short and concise. Respond "Unsure about answer" if not sure about the answer.Context: Teplizumab traces its roots to a New Jersey drug company called Ortho Pharmaceutical. There, scientists generated an early version of the antibody, dubbed OKT3. Originally sourced from mice, the molecule was able to bind to the surface of T cells and limit their cell-killing potential. In 1986, it was approved to help prevent organ rejection after kidney transplants, making it the first therapeutic antibody allowed for human use.Question: What was OKT3 originally sourced from?Answer:
```

_Output:_

```
Mice.
```

## Text Classification

Do tej pory używałeś prostych instrukcji, aby wykonać zadanie. Jako szybki inżynier musisz być lepszy w dostarczaniu lepszych instrukcji. Ale to nie wszystko! Przekonasz się również, że w przypadku trudniejszych przypadków użycia samo dostarczenie instrukcji nie wystarczy. W tym miejscu musisz pomyśleć więcej o kontekście i różnych elementach, których możesz użyć w podpowiedzi. Inne elementy, które można dostarczyć, to dane wejściowe lub przykłady.

Spróbujmy zademonstrować to na przykładzie klasyfikacji tekstu.

_Prompt:_

```
Classify the text into neutral, negative or positive. Text: I think the food was okay. Sentiment:
```

_Output:_

```
Neutral
```

Wydałeś polecenie sklasyfikowania tekstu, a model odpowiedział "Neutralny", co jest poprawne. Nie ma w tym nic złego, ale powiedzmy, że naprawdę potrzebujesz, aby model podał etykietę w dokładnie takim formacie, jaki chcesz. Zamiast "Neutral", model ma zwracać "Neutral". Jak to osiągnąć? Są na to różne sposoby. Zależy ci na konkretności, więc im więcej informacji możesz dostarczyć podpowiedzi, tym lepsze wyniki. Możesz spróbować podać przykłady, aby określić prawidłowe zachowanie. Spróbujmy jeszcze raz:

_Prompt:_

```
Classify the text into neutral, negative or positive. Text: I think the vacation is okay.Sentiment: neutral Text: I think the food was okay. Sentiment:
```

_Output:_

```
neutral
```

Doskonale! Tym razem model zwrócił wartość neutralną, która jest konkretną etykietą, której szukałeś. Wygląda na to, że przykład podany w monicie pomógł modelowi w uzyskaniu konkretnych wyników.

Aby podkreślić, dlaczego czasami bycie konkretnym jest ważne, sprawdź poniższy przykład i zauważ problem:

_Prompt:_

```
Classify the text into nutral, negative or positive. Text: I think the vacation is okay.Sentiment:
```

_Output:_

```
Neutral
```

W czym tkwi problem? Jako wskazówka, wymyślona etykieta nutral jest całkowicie ignorowana przez model. Zamiast tego model wyświetla Neutral, ponieważ ma pewne nastawienie na tę etykietę. Załóżmy jednak, że tak naprawdę chodzi o nutral. Jak można to naprawić? Może spróbuj dodać opisy do etykiet lub dodać więcej przykładów do podpowiedzi? Jeśli nie masz pewności, omówimy kilka pomysłów w kolejnych sekcjach.

## Conversation

Być może jedną z bardziej interesujących rzeczy, jakie można osiągnąć dzięki inżynierii podpowiedzi, jest instruowanie systemu LLM, jak ma się zachowywać, jakie są jego intencje i tożsamość. Jest to szczególnie przydatne podczas tworzenia systemów konwersacyjnych, takich jak chatboty do obsługi klienta.

Na przykład, stwórzmy system konwersacyjny, który jest w stanie generować bardziej techniczne i naukowe odpowiedzi na pytania. Zwróć uwagę, jak wyraźnie mówisz mu, jak ma się zachowywać za pomocą instrukcji. Jest to czasami określane jako podpowiadanie ról.

_Prompt:_

```
The following is a conversation with an AI research assistant. The assistant tone is technical and scientific.Human: Hello, who are you?AI: Greeting! I am an AI research assistant. How can I help you today?Human: Can you tell me about the creation of blackholes?AI:
```

_Output:_

```
Sure! Black holes are regions of spacetime where the gravitational force is so strong that nothing, not even light, can escape from it. They are created when a very massive star dies and its core collapses in on itself, forming a singularity of infinite density. The intense gravity of the singularity pulls in all the matter and radiation around it, creating the black hole.
```

Nasz asystent badawczy AI brzmi nieco zbyt technicznie, prawda? Ok, zmieńmy to zachowanie i poinstruujmy system, aby udzielał bardziej przystępnych odpowiedzi.

_Prompt:_

```
The following is a conversation with an AI research assistant. The assistant answers should be easy to understand even by primary school students.Human: Hello, who are you?AI: Greeting! I am an AI research assistant. How can I help you today?Human: Can you tell me about the creation of black holes?AI: 
```

_Output:_

```
Sure! Black holes are created when a very massive star runs out of fuel and collapses in on itself. The gravity of the star is so strong that nothing, not even light, can escape its pull. This creates a point in space-time with an intense gravitational force called a black hole.
```

Poczyniłeś pewne postępy. Możesz go dalej ulepszać. Jeśli dodasz więcej przykładów, możesz uzyskać jeszcze lepsze wyniki.

## Code Generation

Jedną z aplikacji, w której LLM są dość skuteczne, jest generowanie kodu. Copilot jest tego doskonałym przykładem. Istnieje ogromna liczba zadań generowania kodu, które można wykonać za pomocą sprytnych podpowiedzi. Przyjrzyjmy się kilku przykładom poniżej.

Najpierw wypróbujmy prosty program, który wita użytkownika.

_Prompt:_

```
/*Ask the user for their name and say "Hello"*/
```

_Output:_

```
let name = prompt("What is your name?");console.log(`Hello, ${name}!`);
```

Zauważ, że nie musiałeś nawet określać języka, którego chcesz użyć.

Zmieńmy nieco poziomy. Poniższy przykład pokazuje, jak potężne mogą być LLM przy odrobinie wysiłku włożonego w projektowanie podpowiedzi.

_Prompt:_

```
"""Table departments, columns = [DepartmentId, DepartmentName]Table students, columns = [DepartmentId, StudentId, StudentName]Create a MySQL query for all students in the Computer Science Department"""
```

_Output:_

```
SELECT StudentId, StudentName FROM students WHERE DepartmentId IN (SELECT DepartmentId FROM departments WHERE DepartmentName = 'Computer Science');
```

To jest bardzo imponujące. W tym przypadku podałeś dane o schemacie bazy danych i poprosiłeś o wygenerowanie poprawnego zapytania MySQL.

## Reasoning

Być może jednym z najtrudniejszych zadań dla LLM jest to, które wymaga pewnej formy rozumowania. Rozumowanie jest jednym z najbardziej interesujących obszarów ze względu na rodzaje złożonych aplikacji, które mogą powstać dzięki LLM.

Odnotowano pewne postępy w zadaniach wymagających zdolności matematycznych. Należy jednak pamiętać, że obecne maszyny LLM mają trudności z wykonywaniem zadań rozumowania, więc wymaga to jeszcze bardziej zaawansowanych technik inżynierii podpowiedzi. Omówimy te zaawansowane techniki w następnym przewodniku. Na razie omówimy kilka podstawowych przykładów, aby pokazać możliwości arytmetyczne.

_Prompt:_

```
What is 9,000 * 9,000?
```

_Output:_

```
81,000,000
```

_Prompt:_

```
The odd numbers in this group add up to an even number: 15, 32, 5, 13, 82, 7, 1. A: 
```

_Output_

```
No, the odd numbers in this group add up to an odd number: 119.
```

To niepoprawne! Spróbujmy to poprawić, ulepszając podpowiedź.

_Prompt:_

```
The odd numbers in this group add up to an even number: 15, 32, 5, 13, 82, 7, 1. Solve by breaking the problem into steps. First, identify the odd numbers, add them, and indicate whether the result is odd or even. 
```

_Output:_

```
Odd numbers: 15, 5, 13, 7, 1Sum: 41 41 is an odd number.
```

Znacznie lepiej, prawda? Przy okazji, próbowałem tego kilka razy i system czasami zawodzi. Jeśli podasz lepsze instrukcje w połączeniu z przykładami, może to pomóc w uzyskaniu dokładniejszych wyników.

Będziemy nadal zamieszczać więcej przykładów typowych zastosowań w tej sekcji przewodnika.

W nadchodzącej sekcji omówimy jeszcze bardziej zaawansowane koncepcje inżynierii podpowiedzi i techniki poprawy wydajności we wszystkich tych i trudniejszych zadaniach.