---
title: Warsztat inżyniera ML, czyli jak płynnie spiąć R i Power Bl
Data: 2023-12-05
type: event
---
# Abstrakt
Jestem inżynierem uczenia maszynowego - czyli machine learning engineer. Każdego dnia zmagam się z modelami i bazami danych oraz aplikacjami analitycznymi okraszonymi ML. Robota pasjonująca i pełna wyzwań. Warto się jej przyjrzeć, bo mocno chcę aby było nas, inżynierów danych i ML, więcej. W trakcie sesji pokażę swój warsztat - zestaw narzędzi, których na co dzień używam w swojej pracy. Język R, czasami Python, nieśmiertelny SQL oraz Power BI. Opowiem jak to wszystko można pospinać aby uzyskać dobrze działające, efektowne i gotowe do wdrożenia (w chmurze czy bez chmury) rozwiązania dla analityków.
# Agenda
# Prelekcje
1. 
# Opinia

# Notes
# Podstawy
• R to zaawansowany pakiet statystyczny oraz język programowania.
• Jest dostępny na platformy Windows, Unix, MacOS.
• Objęty licencją GNU GPL— całkowicie bezpłatny, kod źródłowy jest
w pełni dostępny.
• Jest językiem interpretowanym.
• Działa w trybie interaktywnym uruchamiasz polecenie i
otrzymujesz (lub nie) jego wynik.

# Siła R
• Dostępność ogromnej liczby bibliotek i rozszerzeń.
• Większość efektów badań nad algorytmami analizy danych jest
publikowana jako biblioteki R.
• Bardzo dobra dokumentacja oraz dostępny kod źródłowy.
• Razem z funkcjami są dostępne gotowe zestawy danych.

W power BI - literka I nigdy nie oznacza nic dobrego. Limit wyswietlanych danych - 3500, nie sa wybierane losowo, a tam gdzie wystepuje najwieksze zageszczenie. Jak dziala integracja R<> PowerBI? PowerBI zrzuca dane do csv i wrapperem PowerBI do R dane sa zaczytywane przez R.

Jak uruchomic ML model w R. Zapisujemy model do pliku jesli pracujemy na lokalnym serwerze. W przypadku uslugi - zapisujemy model do pliku jako plik txt.

Czy PowerBl umożliwia 'importowanie' kilku tabel do kodu? Pytanie dotyczy w
szczególności sytuacji, gdy w PBI model danych składa się z relacji.
Nie, musimy wybrac kolumny z kilku tabel.