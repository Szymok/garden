---
title: Ogólne wskazówki dotyczące projektowania promptów
aliases: 
tags:
---
## Start Simple

Rozpoczynając projektowanie podpowiedzi, należy pamiętać, że jest to naprawdę iteracyjny proces, który wymaga wielu eksperymentów, aby uzyskać optymalne wyniki. Korzystanie z prostego placu zabaw z OpenAI lub Cohere jest dobrym punktem wyjścia.

Możesz zacząć od prostych podpowiedzi i dodawać więcej elementów i kontekstu, dążąc do lepszych wyników. Z tego powodu niezbędne jest iterowanie podpowiedzi. Czytając ten przewodnik, zobaczysz wiele przykładów, w których szczegółowość, prostota i zwięzłość często dają lepsze wyniki.

Gdy masz duże zadanie, które obejmuje wiele różnych podzadań, możesz spróbować podzielić zadanie na prostsze podzadania i rozwijać je w miarę uzyskiwania lepszych wyników. Pozwala to uniknąć zbytniego komplikowania procesu szybkiego projektowania na samym początku.

## Instrukcja

Możesz zaprojektować skuteczne podpowiedzi dla różnych prostych zadań, używając poleceń, aby poinstruować model, co chcesz osiągnąć, takich jak "Napisz", "Klasyfikuj", "Podsumuj", "Przetłumacz", "Zamów" itp.

Pamiętaj, że musisz także dużo eksperymentować, aby zobaczyć, co działa najlepiej. Wypróbuj różne instrukcje z różnymi słowami kluczowymi, kontekstami i danymi i zobacz, co działa najlepiej w konkretnym przypadku użycia i zadaniu. Zazwyczaj im bardziej szczegółowy i istotny jest kontekst dla zadania, które próbujesz wykonać, tym lepiej. Poruszymy znaczenie próbkowania i dodawania większego kontekstu w kolejnych przewodnikach.

Inni zalecają umieszczenie instrukcji na początku promptu. Innym zaleceniem jest użycie wyraźnego separatora, takiego jak "###", aby oddzielić instrukcję od kontekstu.

Na przykład:

_Prompt:_

```
### Instruction ###Translate the text below to Spanish:Text: "hello!"
```

_Output:_

```
¡Hola!
```

## Specyfika

Bądź bardzo konkretny w kwestii instrukcji i zadania, które ma wykonać model. Im bardziej opisowy i szczegółowy jest prompt, tym lepsze są wyniki. Jest to szczególnie ważne, gdy masz pożądany wynik lub styl generowania, którego szukasz. Nie ma konkretnych tokenów lub słów kluczowych, które prowadzą do lepszych wyników. Ważniejszy jest dobry format i opisowa zachęta. W rzeczywistości podawanie przykładów w podpowiedzi jest bardzo skuteczne, aby uzyskać pożądane wyniki w określonych formatach.

Podczas projektowania podpowiedzi należy również pamiętać o długości podpowiedzi, ponieważ istnieją ograniczenia dotyczące tego, jak długa może być podpowiedź. Pomyśl o tym, jak konkretny i szczegółowy powinieneś być. Uwzględnianie zbyt wielu niepotrzebnych szczegółów niekoniecznie jest dobrym podejściem. Szczegóły powinny być istotne i przyczyniać się do realizacji zadania. Jest to coś, z czym będziesz musiał dużo eksperymentować. Zachęcamy do wielu eksperymentów i iteracji, aby zoptymalizować podpowiedzi dla swoich aplikacji.

Jako przykład, wypróbujmy prosty prompt, aby wyodrębnić określone informacje z fragmentu tekstu.

_Prompt:_

```
Extract the name of places in the following text. Desired format:Place: <comma_separated_list_of_company_names>Input: "Although these developments are encouraging to researchers, much is still a mystery. “We often have a black box between the brain and the effect we see in the periphery,” says Henrique Veiga-Fernandes, a neuroimmunologist at the Champalimaud Centre for the Unknown in Lisbon. “If we want to use it in the therapeutic context, we actually need to understand the mechanism.""
```

_Output:_

```
Place: Champalimaud Centre for the Unknown, Lisbon
```

## Unikaj niedokładności

Biorąc pod uwagę powyższe wskazówki dotyczące szczegółowości i poprawy formatu, łatwo jest wpaść w pułapkę chęci bycia zbyt sprytnym w kwestii podpowiedzi i potencjalnie tworzenia nieprecyzyjnych opisów. Często lepiej jest być konkretnym i bezpośrednim. Analogia jest tutaj bardzo podobna do skutecznej komunikacji - im bardziej bezpośrednia, tym skuteczniejsza jest wiadomość.

Na przykład, możesz być zainteresowany poznaniem koncepcji inżynierii podpowiedzi. Możesz spróbować czegoś takiego:

```
Explain the concept prompt engineering. Keep the explanation short, only a few sentences, and don't be too descriptive.
```

Z powyższego podpowiedzi nie wynika jasno, ile zdań należy użyć i w jakim stylu. Powyższe podpowiedzi nadal mogą przynieść dobre odpowiedzi, ale lepsza byłaby taka, która jest bardzo konkretna, zwięzła i na temat. Coś w stylu:

```
Use 2-3 sentences to explain the concept of prompt engineering to a high school student.
```

## To do or not to do?

Inną powszechną wskazówką przy projektowaniu podpowiedzi jest unikanie mówienia, czego nie robić, a zamiast tego mówienie, co robić. Zachęca to do większej szczegółowości i koncentruje się na szczegółach, które prowadzą do dobrych odpowiedzi ze strony modelu.

Oto przykład chatbota rekomendującego filmy, który zawiódł dokładnie w tym, czego nie chcę, aby robił ze względu na sposób, w jaki napisałem instrukcję - skupiając się na tym, czego nie robić.

_Prompt:_

```
The following is an agent that recommends movies to a customer. DO NOT ASK FOR INTERESTS. DO NOT ASK FOR PERSONAL INFORMATION.Customer: Please recommend a movie based on my interests.Agent: 
```

_Output:_

```
Sure, I can recommend a movie based on your interests. What kind of movie would you like to watch? Do you prefer action, comedy, romance, or something else?
```

_Prompt:_

```
The following is an agent that recommends movies to a customer. The agent is responsible to recommend a movie from the top global trending movies. It should refrain from asking users for their preferences and avoid asking for personal information. If the agent doesn't have a movie to recommend, it should respond "Sorry, couldn't find a movie to recommend today.".Customer: Please recommend a movie based on my interests.Agent:
```

_Output:_

```
Sorry, I don't have any information about your interests. However, here's a list of the top global trending movies right now: [list of movies]. I hope you find something you like!
```