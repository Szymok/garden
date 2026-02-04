---
title: EC2 Key Features (Funkcje EC2)
created: 2026-02-04
status: evergreen
category: AWS / Compute
difficulty: basic
language: en
tags:
  - aws
  - ec2
  - cloud
  - compute
  - autoscaling
aliases:
  - Cechy EC2
  - AWS EC2
---
# 🎯 Definicja
**Amazon EC2** (Elastic Compute Cloud) to wirtualne serwery w chmurze AWS.
Wyobraź sobie, że wynajmujesz komputer, ale masz do niego dostęp tylko przez internet.
Płacisz za każdą sekundę, kiedy jest włączony.

# 🔑 Kluczowe punkty
- **Instance Types:** Maszyny ogólne (General), do obliczeń (Compute), do pamięci (Memory) i z grafiką (GPU).
- **Pricing:** On-Demand (płacisz jak za prąd), Spot (taniej o 90%, ale mogą Cię wyrzucić), Reserved (umowa na rok, taniej o 70%).
- **EBS:** Wirtualny dysk twardy podpięty do instancji.

# 📚 Szczegółowe wyjaśnienie
Główne funkcje:
1.  **Auto Scaling:** Automatycznie dodaje serwery, gdy ruch rośnie (Black Friday) i usuwa, gdy spada (Noc).
2.  **Load Balancing (ELB):** Rozdziela ruch między wiele serwerów, żeby żaden nie padł z przeciążenia.
3.  **Security Groups:** Wirtualny Firewall. Mówisz: "Wpuść tylko ruch na porcie 80 (HTTP)".

# 💡 Przykład zastosowania
Uruchamiasz serwer WWW.
Wybierasz instancję `t3.micro` (tania, mała).
Podpinasz Auto Scaling.
Gdy Twoja strona staje się viralem, AWS sam dodaje 10 nowych serwerów `t3.micro`.
Gdy viral się kończy, AWS je kasuje.
Płacisz grosze, a strona działa zawsze.

## 📌 Źródła
- AWS EC2 Documentation.

## 👽 Brudnopis
- EC2 to "kręgosłup" AWS. Nawet jeśli używasz innych usług (ECS, EKS, Beanstalk), pod spodem często i tak działają instancje EC2.
