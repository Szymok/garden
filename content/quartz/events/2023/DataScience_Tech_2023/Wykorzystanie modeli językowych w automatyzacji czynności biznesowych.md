---
title: Wykorzystanie modeli językowych w automatyzacji czynności biznesowych
Data: 2023-12-09
type: event
---
# Abstrakt
Na tym warsztacie poznasz role automatyzacji w świecie analizy danych, korzyści wynikające ze stosowania narzędzi low-code, oraz praktyczny przykład wykorzystania narzędzia do analizy danych (Power BI), a także przykład automatyzacji obsługi danych za pomocą Power Automate. Dowiesz się także czym jest Auzre Data Factory, Microsoft Fabric a także Azure Synapse Analytics. Low-Code to przyszłość i silnie rozwinięta gałąź IT. Ta sesja pozwoli Ci być na czasie ze zmianami w IT.
# Opinia

# Notes
## Use Cases
CustomGPT 
- Cel: Wzrost dostępności danych w organizacji
- Standardowo: Pracownik sam wyszukuje informacje w systemach IT
- Automatyzacja: Informacja dostępna poprzez konwersację np. w Teams
- Korzyści:
	- Wzrost wykorzystania danych w firmie
	- Nietechniczne osoby uzyskują dostęp do baz danych
	- Oszczędność godzin pracowników IT
Odczytywanie informacji z maili, dokumentow, zdjec
Cel: Sprawny obieg dokumentów
Standardowo: Człowiek czyta maile i dokumenty,
które nie podlegają automatyzacji RPA
Automatyzacja: Model odczytuje maila lub
zdjęcie i wyciąga kluczowe dane
Korzyści:
Redukcja czasu pracy pracowników
Niższe koszty
Szybsza realizacja procesu

Matchowanie transakcji, zamowien, dokumentow
Cel: Poprawność transakcji i księgowań
Standardowo: Pracownicy własnoręcznie
wyszukują odpowiednie transakcje, pozycje itd..
Automatyzacja: Algorytm „podpowiada" pasujące
pozycje
Korzyści:
Redukcja czasu pracy pracowników
Niższe koszty
Szybsza realizacja procesu
Niższe ryzyko związane z błędami

# Generowanie opisow produktow
Cel: Trafne i atrakcyjne opisy produkt6w
Standardowo: Pracownicy tworzq opisy
Automatyzacja: Opisy sq generowane auto-
matycznie na podstawie danych z systemöw IT
Korzysci:
Automatyczna aktualizacja oferty
Oszczednosc czasu pracownikåw
Lepsza jakosc opisåw

# Generowanie dokumentow
Cel: Tworzenie raport6w, zestawieh
Standardowo: Pracownicy zbierajQ informacje i
tworzq dokumenty
Automatyzacja: Dokumenty sq tworzone auto-
matycznie na podstawie danych, dokumentöw
Korzysci:
Oszczednosc czasu pracowniköw
Uspåjnienie formatu
Automatyczne tworzenie dokumentacji

# Jak myslec o automatyzacji i AI
Czy wystarczy RPA?
Dokumenty i tresci, ktåre sa wystarczajqco ustrukturyzowane
moga bye automatyzowane za pomocq narzedzi RPA
A moie gotowe narzqdzie Al?
Analiza wielu nieustrukturyzowanych tresci, takich jak maile
moie bye skutecznie automatyzowana za pomoq gotowych
rozwiqzari jak np. UiPath Communications Mining lub
Document Understanding
Generatywna AI do zadari specjalnych
W pozostaiych przypadkach stosujmy Generatywnq Al. Tutaj
kluczem do sukcesu jest dobre okreélenie use case i nacisk
na wymiernq warto" biznesowq.

# Jak wykorzystac dane, ktore posiada firma
Ilu pracownik6w w Warszawie
zatrudnia nasza firma?
AI nie Wie, poniewai:
Dane sq nieaktualne
• Brak dostepu do danych firmy
Rozwiqzanie: Retrieval-Augmented
Generation
„Podpiecie" danych firmy
Moiliwoéé zarzqdzania nimi
• Trafniejsze wyniki Al
• Bonus: Decyzja Al jest wyjasnialna

# Architektura
![[images/Pasted image 20231209132941.png]]

# Inwestycje zwiazanie z generatywna AI
Opiata: naliczana poprzez wykorzystanie tzw. tokenöw
Optymalizacja kosztowa
Al nie powinien „czytaC" za ka2dym razem dokumentu
Rozwiqzanie: wkladamy go poprzez RAG, kt6ry wyciqga
najwa2niejsze informacje do bazy wektorowej
Wykorzystanie klasycznego SQLa
Ceny powinny spadaé:
Konkurencja
Obni2ki opiat ze strony OpenAl
Oszacowanie
Przygotowanie use case
Okreålenie liczby i rodzaju dokumentöw / danych
Oszacowanie liczby tokenöw do realizacji zadania

# Pojecie Red Teamingu
Assemble a diverse group of red !eamers
Recruit red teamers with both benign and adversarial mindsets
Assign red teamers to harms and/or product features
Foundational LLM model(s) usually passed multiple rounds of Red Teaming already...
Is foundational LLM model(s) safe/secure within the context of the application?
Are there vulnerabilities in the current safety systems or mitigation strategies,
guardrails?
We need feedback on failures in order to make improvements.
* red teaming is not a replacement for systematic measurement.

https://bbycroft.net/llm

# Wejscie w glab modeli
Mechanistic Interpretability
![[images/Pasted image 20231209142257.png]]

![[images/Pasted image 20231209142426.png]]
Artykul architektura GPT3 na serwetce

Mozna pisac prompty w formie BASE64

# Automatyzacja Red Teamingu