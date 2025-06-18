---
title: Jak szybko uprodukcyjnić prosty customowy model uczenia maszynowego na własnym serwerze Google Cloud Functions albo AWS SageMaker
Data: 2023-12-14
type: event
---
# Abstrakt
Model na produkcji, to model, który przeżyje. Niezależnie czy pracujemy jako freelancerzy, czy w dużym zespole w firmie produktowej, szybkie wdrożenie modelu statystycznego na produkcji ma bardzo dużo zalet. Większość systemów Data Science upada w momencie wdrożenia. Pojawiające się problemy infrastrukturalne i niespodziewane koszty doprowadzają do zamknięcia projektu. Dobrze więc zrezygnować z procesu ciągłego na rzecz równoległej pracy z usprawnianiem modelu i jednoczesnym budowaniem infrastruktury do jego serwowania. Nie jest to skomplikowane zadanie i na prezentacji pokażę sposoby na szybkie wdrożenie modeli napisanych w Pythonie na trzech platformach od różnych dostawców reprezentujących inne typy architektury: Droplet od DigitalOcean, AWS SageMaker i Google Cloud Functions.
# Opinia

# Notes
# Cykl rozwoju usługi opartej na danych

![[images/Pasted image 20231214195921.png]]
Najpierw badania, pozniej wdrozenia
![[images/Pasted image 20231214200034.png]]


Kroki do wdrożenia
Zakup VPS z zainstalowanym Ubuntu 22.04 (przykłady. OVH. DigitalOcean)
Konfiguracja serwera: dodanie użytkownika z •'w•'irni uprawnieniami. konfiguracja SSH. instalacja Pythona. rip. virtualenv. git
Stworzenie struktury katalogów do dalszej pracy.
Trening modelu i zapisanie go w o"wiedrŃm (pickje, JSON. obo inne). Transfer wytrenowanego modelu na serwer z API.
Kod obsługujący zapytania na serwer w FastAPl lokalne testy. Konfiguracja paczek Pythona. zakotwiczenie wers* paczek.
Transfer kodu na serwer i konfiguracja serwera zmienne środowiskowe, Gunicom i nginx requestów).
Uruchomienie i testy aplikacja

Tworzyc skrypty bashowe i zmienne srodowiskowe. Korzystac z DataClass

# GCF + Scheduler
Kroki do wdrożenia
Założenie projektu na Google Cloud
Podłączenie następujących serwisów do projektu: Cloud Functions. Cloud Build. Cloud Run. Artifact Registry, BigQuery.
Google Cloud Storage. Cloud Scheduler
Stworzenie tabel w BigQuery, bucket•a w Cloud Storage.
Lokalne testy (w tym konfiguracja i instalacja Google Cloud CLI).
Deploy funkcji i scheduler-a z CLI.
Uruchomienie i testy aplikacji.

O czym pamiętać?
Projekt musi posiadać wszystkie uprawnienia
Sprawdzamy które serwisy sq obsługiwane w konkretnych regionach
Scheduler działa jak CRON
Zawsze ze skryptem stawiajqcym system piszemy analogiczny skrypt usuwający wszystkie zasoby!

# AWS SageMaker + MLFlow

Dlaczego?
Jak?
Zastosowanie
Stopień trudności wdrożenia
dla Data Scientisty
Wdrożenie customowego modelu uczenia maszynowego bezpośrednio do pracy
Stack AWS + MLF10w
Duża skala requestów w czasie rzeczywistym. np.: rekomendacje w aplikacji webowej
Niski/Średni

O czym pamiętać?
Customowy model musi być obsługiwany przez MLFIow (jako pyfunc).
Dane wejściowe obsługiwane przez SageMaker mają specyficzne wymagania. ich format ma znaczenie.
W tym przykładzie jest deploy samej inferencji. ale z MLFlow możemy zrobić deploy całego systemu, poczynając od treningu a
kończąc na serwowaniu.
Jest to drogie rozwiązanie. w dużej skali może nie być opłacalne.
Wywołanie endpointa często obsługuje dodatkowa Lambda.

# Vertex AI
Kroki do wdrożenia
Założenie projektu na Google Cloud
Stworzenie pipeline-u do treningu modelu (uprawnienia, kontener Dockera).
Stworzenie aplikacji do serwowania modelu (health i predict jako minimum).
Lokalne testy.
Deploy endpointa.

# AWS APIGateway
Kroki do wdrożenia
Projekt i dostępy na AWS.
Skrypt CloudFormation i definicje OpenAPl.
Stworzenie Lambda które odbierajq requesty. podłączenie ich pod APIGateway.
Opcjonalnie Cognito do ograniczeń dostępów.
Deploy aplikacji.

# Dobre praktyki
Używaj logów, w tym systemów logów które są dostarczane w środowiskach chmurowych
Jeśli nie jesteś pewien bezpieczeństwa, nie korzystaj z usług VPS
Jeśli nie jesteś pewien kosztów, nie korzystaj z usług chmurowych
Notuj każdy krok, zapisuj każdy serwis z którego korzystasz
Sprzątaj po sobie: stare logi, stare modele, nieużywane obrazy. Wyznacz sobie cyklicznie czas na takie zajęcia
Monitoruj połączenia przychodzące
Rozdziel trening modelu od jego serwowania
Wykorzystuj wiedzę z produkcji!
Nie jesteś odpowiedzialny za cały system, prezentowane rozwiązania to często fundament pod prawdziwy system, gdzie tworzyć go będą DevOps i deweloperzy
Miej z tyłu głowy również elementy odpowiedzialne za monitoring modelu na produkcji
Rozmiar ma znaczenie
Korzystaj z pomocniczych baz danych kiedy tylko możesz

# Nauka
Tutoriale DigitalOcean - VPS
Dokumentacja AWS, GCP, MS Azure - Cloud
Inne tutoriale i poradniki w internecie, o poszczególne kroki można też pytać duże
modele językowe
Warto zrobić jeden mały projekt w którym postawimy REST api na VPS, albo w Cloud
Podstawy korzystania z terminala, podstawy skryptów w bash

[SimonMolinsky/data-science-tech-2023-12-05: Data Science Tech Conference materials https://datasciencetech.pl/ (github.com)](https://github.com/SimonMolinsky/data-science-tech-2023-12-05)
