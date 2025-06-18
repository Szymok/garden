---
title: Funkcje promptów
tags: 
aliases:
---
## Wprowadzenie

Kiedy narysujemy paralelę między interfejsem dialogowym GPT a powłoką języka programowania, monit enkapsulacji można traktować jako funkcję. Funkcja ta ma unikalną nazwę, a gdy wywołujemy tę nazwę z tekstem wejściowym, generuje ona wyniki w oparciu o zestaw wewnętrznych reguł. Krótko mówiąc, tworzymy monit wielokrotnego użytku o nazwie, która ułatwia korzystanie z GPT. To jak posiadanie poręcznego narzędzia, które pozwala GPT wykonywać określone zadania w naszym imieniu - musimy tylko podać dane wejściowe, a otrzymamy pożądane dane wyjściowe.

Umieszczając podpowiedzi w funkcjach, można utworzyć serię funkcji w celu ustanowienia przepływu pracy. Każda funkcja reprezentuje określony krok lub zadanie, a po połączeniu w określonej kolejności mogą one zautomatyzować złożone procesy lub rozwiązywać problemy bardziej efektywnie. Takie podejście pozwala na bardziej ustrukturyzowaną i usprawnioną interakcję z GPT, ostatecznie zwiększając jego możliwości i czyniąc go potężnym narzędziem do wykonywania szerokiego zakresu zadań.

Zanim więc będziemy mogli użyć funkcji, musimy poinformować o niej GPT. Oto monit definiujący funkcję.

_Prompt:_

> Let's call this prompt with **meta prompt**.  
> This prompt has been tested on GPT3.5 and performs even better on GPT4

```
Hello, ChatGPT! I hope you are doing well. I am reaching out to you for assistance with a specific function. I understand that you have the capability to process information and perform various tasks based on the instructions provided. In order to help you understand my request more easily, I will be using a template to describe the function, input, and instructions on what to do with the input. Please find the details below:function_name: [Function Name]input: [Input]rule: [Instructions on how to process the input]I kindly request you to provide the output for this function, based on the details I have provided. Your assistance is greatly appreciated. Thank you!I will replace the text inside the brackets with the relevant information for the function I want you to perform. This detailed introduction should help you understand my request more efficiently and provide the desired output. The format is function_name(input) If you understand, just answer one word with ok.
```

## Przykłady

### Asystent ds. nauki języka angielskiego

Załóżmy na przykład, że chcemy użyć GPT, aby pomóc nam w nauce języka angielskiego. Możemy uprościć ten proces, tworząc serię funkcji.

Ten przykład został przetestowany na GPT3.5 i działa jeszcze lepiej na GPT4
#### Opis funkcji
Musimy wkleić metapodpowiedź, która została zdefiniowana powyżej sekcji w GPT

Następnie utworzymy funkcję trans_word.
Funkcja ta poprosi GPT o przetłumaczenie chińskiego na angielski.

_Prompt:_

```
function_name: [trans_word]input: ["text"]rule: [I want you to act as an English translator, spelling corrector and improver. I will provide you with input forms including "text" in any language and you will detect the language, translate it and answer in the corrected of my text, in English.]
```

Napisz funkcję rozszerzającą tekst.

_Prompt:_

```
function_name: [expand_word]input: ["text"]rule: [Please serve as a Chatterbox, spelling corrector, and language enhancer. I will provide you with input forms including "text" in any language, and output the original language.I want you to Keep the meaning same, but make them more literary.]
```

Napisz funkcję, która poprawia tekst.

_Prompt:_

```
function_name: [fix_english]input: ["text"]rule: [Please serve as an English master, spelling corrector, and language enhancer. I will provide you with input forms including "text", I want you to improve the text's vocabulary and sentences with more natural and elegent. Keep the meaning same.]
```

Wreszcie, można uruchomić funkcję niezależnie lub połączyć je w łańcuch.

_Prompt:_

```
trans_word('婆罗摩火山处于享有“千岛之国”美称的印度尼西亚. 多岛之国印尼有4500座之多的火山, 世界著名的十大活火山有三座在这里.')fix_english('Finally, you can run the function independently or chain them together.')fix_english(expand_word(trans_word('婆罗摩火山处于享有“千岛之国”美称的印度尼西亚. 多岛之国印尼有4500座之多的火山, 世界著名的十大活火山有三座在这里.')))
```

Przedstawiając funkcje w tym formacie, można wyraźnie zobaczyć nazwę każdej funkcji, dane wejściowe i regułę przetwarzania danych wejściowych. Zapewnia to zorganizowany sposób na zrozumienie funkcjonalności i celu każdego kroku w przepływie pracy

wskazówki: Jeśli nie chcesz, aby ChatGPT wyświetlał nadmiar informacji, możesz po prostu dodać zdanie po zdefiniowaniu reguł funkcji.

```
DO NOT SAY THINGS ELSE OK, UNLESS YOU DONT UNDERSTAND THE FUNCTION
```

### Funkcja wielu parametrów

Stwórzmy funkcję, która generuje hasło, pobierając pięć parametrów wejściowych i wysyłając wygenerowane hasło.

_Prompt:_

```
function_name: [pg]input: ["length", "capitalized", "lowercase", "numbers", "special"]rule: [I want you to act as a password generator for individuals in need of a secure password. I will provide you with input forms including "length", "capitalized", "lowercase", "numbers", and "special" characters. Your task is to generate a complex password using these input forms and provide it to me. Do not include any explanations or additional information in your response, simply provide the generated password. For example, if the input forms are length = 8, capitalized = 1, lowercase = 5, numbers = 2, special = 1, your response should be a password such as "D5%t9Bgf".]
```

```
pg(length = 10, capitalized = 1, lowercase = 5, numbers = 2, special = 1)pg(10,1,5,2,1)
```

## Podsumowanie

Obecnie istnieje już wiele projektów, które pracują nad programowaniem GPT, takich jak:

GitHub Copilot
Microsoft AI
chatgpt-plugin
[[notes/Langchain|LangChain]]
marvin

Ale te projekty są przeznaczone albo dla klientów produktu, albo dla użytkowników, którzy potrafią kodować w Pythonie lub innych językach programowania. Dla przeciętnego użytkownika, użyj tego prostego szablonu do codziennej pracy i iteruj kilka razy. Użyj aplikacji do notatek, aby udokumentować funkcję, a nawet można ją zaktualizować do biblioteki. Alternatywnie można użyć niektórych narzędzi ChatGPT typu open source, takich jak ChatGPT-Next-Web(otwiera się w nowej karcie), chatbox(otwiera się w nowej karcie), PromptAppGPT(otwiera się w nowej karcie) i ChatGPT-Desktop(otwiera się w nowej karcie). Obecnie ChatGPT-Next-Web umożliwia dodanie kilku strzałów przed zainicjowaniem nowego czatu. PromptAppGPT wspiera niskokodowe tworzenie aplikacji internetowych opartych na szablonach podpowiedzi i umożliwia każdemu tworzenie aplikacji podobnych do AutoGPT za pomocą kilku wierszy podpowiedzi. Możemy użyć tej funkcji, aby dodać naszą funkcję, która może być następnie użyta.