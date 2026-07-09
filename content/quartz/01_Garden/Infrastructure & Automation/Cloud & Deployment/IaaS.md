---
title: IaaS (Infrastructure as a Service)
created: 2026-02-04
status: evergreen
category: Cloud Computing
difficulty: basic
language: pl
tags:
  - cloud
  - iaas
  - infrastructure
  - aws
  - azure
aliases:
  - Infrastructure as a Service
  - Infrastruktura jako usługa
---
# 🎯 Definicja
**IaaS** (Infrastructure as a Service) to model usług chmurowych, w którym dostawca (np. AWS, Azure) wynajmuje Ci **wirtualny sprzęt**: serwery (VM), dyski, sieci i firewalle. Ty odpowiadasz za system operacyjny, aplikacje i dane. To jak wynajem pustego mieszkania – masz ściany i media, ale meble musisz wnieść sam.

# 🔑 Kluczowe punkty
- **Odpowiedzialność:** Dostawca dba o fizyczne kable i prąd. Ty dbasz o patchowanie Windowsa/Linuxa.
- **Elastyczność:** Największa ze wszystkich modeli ([[PaaS|PaaS]], [[SaaS|SaaS]]). Możesz zainstalować cokolwiek chcesz.
- **Koszt:** Płacisz za zużyte zasoby (CPU/RAM na godzinę).

# 📚 Szczegółowe wyjaśnienie
W modelu On-Premise (własna serwerownia) musisz kupić serwer, podłączyć go do prądu, zainstalować klimatyzację i wymieniać dyski.
W IaaS klikasz przycisk i po 30 sekundach masz serwer. Jeśli fizyczny dysk w data center Google padnie, Ty nawet tego nie zauważysz (zazwyczaj), bo wirtualizacja przeniesie Cię na inny sprzęt.
To podstawa dla "Lift and Shift" – przenoszenia starych aplikacji do chmury bez zmiany kodu.

# 💡 Przykład zastosowania
Firma chce przenieść stary system księgowy, który działa tylko na Windows Server 2008.
Nie mogą użyć [[SaaS|SaaS]] ani [[PaaS|PaaS]].
Kupują instancję EC2 (IaaS) w AWS, instalują tam Windowsa i przenoszą aplikację 1:1.

## 📌 Źródła
- NIST Definition of Cloud Computing.

## 👽 Brudnopis
- IaaS = "Amazon EC2", "Azure VM", "Google Compute Engine".
- Kolejny krok to [[PaaS]] (Platform as a Service), gdzie nie martwisz się o OS.