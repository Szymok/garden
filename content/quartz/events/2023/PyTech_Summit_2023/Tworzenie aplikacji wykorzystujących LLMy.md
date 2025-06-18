---
title: Tworzenie aplikacji wykorzystujących LLMy
Data: ""
type: event
---
# Abstrakt
Podczas prezentacji opowiemy o procesie tworzenia aplikacji z wykorzystaniem głębokich modeli języka w pythonie od początku do końca na przykładzie projektu Chattum - opensourcowej platformy do tworzenia zaawawansownych botów które potrafią korzystać z baz wiedzy i zewnętrznych narzędzi. Poruszymy tematy takie jak, prompt engineering i biblioteki umożliwiające komunikacje z LLMami, wektorowe bazy danych i podłączenie ich do modeli języka, przechowywanie plików i konwersacji a nawet tworzenie frontendu w pełni w pythonie z wykorzystaniem biblioteki reflex.
# Opinia

# Notes

### Architektura
![[images/Pasted image 20240105151020.png]]

### Podstawowy lancuch
![[images/Pasted image 20240105151221.png]]
Tworzymy szablon prompta, który przyjmuje zmiennq {foo} tą zmienną będziemy mogli potem uzupełnić podczas wywołania modelu. Nastepnie definiujemy model, ktorego bedziemy uzywac oraz lancuch.

Defininiujemy łańcuch składający się z prompta + modelu "l” (pipe) oznacza że wynik jednej operacji jest przekazywany do drugiej W tym przypadku prompt jest przekazywany do modelu

![[images/Pasted image 20240105151351.png]]
### Dodanie pamieci do modelu
![[images/Pasted image 20240105151427.png]]
Nasz prompt składa się z 3 elementów
• Wiadomości systemowej - czyli instrukcji
• Placeholdera - miejsca gdzie trafiq poprzednie wiadomości
• Inputu - miejsca na na nowq wiadomość od użytkownika

![[images/Pasted image 20240105151454.png]]
Tworzymy obiekt, który będzie trzymać naszq pamięć
![[images/Pasted image 20240105151536.png]]
Przypisujemy do prompta zmiennq history, która jest ładowana z pamięci
Wywolanie:
![[images/Pasted image 20240105151600.png]]
Zapisywanie konwersacji do MongoDB w postaci JSONow
### Wykorzystanie bazy wiedzy
![[images/Pasted image 20240105152335.png]]

Podobienstwo semantyczne - 

![[images/Pasted image 20240105153717.png]]
Tworzymy bazę wiedzy w podstaci bazy wektorowej
Tworzymy retriever z bazy wiedzy - obiekt który wywołany będzie zwracać
najabardziej podobne do zapytania dokumenty
Definiujemy nasz prompt, który ma placeholder na kontekst
![[images/Pasted image 20240105154012.png]]
Na początku działa retriever - przypisuje do zmiennej "context" najbardziej
podobny dokument do zapytania

### Przechowywanie plików
Minio - File system

### Wykorzystanie narzedzi
ReAct, skrót od Reasoning + Acting, to metoda, która czerpie inspirację ze sposobu, w jaki ludzie łączą "działanie” i "rozumowanie", aby uczyć się nowych zadań i podejmować decyzje. Jest to sposób na zwiększenie możliwości dużych modeli językowych (LLM) poprzez integrację
rozumowania i działania.
Myślenie (Thought): Jest to etap rozumowania, w którym model lub agent myśli o wykonywanym
zadaniu. Jest to forma wewnętrznego dialogu, którego model używa do rozumowania na temat
bieżącego kontekstu, który obejmuje poprzednie obserwacje i działania.
Działanie (Action): Działanie jest interakcjq ze środowiskiem zewnętrznym, takim jak zapytanie API Wikipedii o informacje.
Obserwacja (Observation): Jest to informacja zwrotna, którą model otrzymuje ze środowiska po
podjęciu działania. Na przykład, jeśli działanie modelu polegało na wyszukiwaniu informacji w
Wikipedii, obserwacją może być znaleziona informacja. Te nowe informacje stają się następnie częścią
kontekstu, którego model używa do następnej myśli.

![[images/Pasted image 20240105155009.png]]