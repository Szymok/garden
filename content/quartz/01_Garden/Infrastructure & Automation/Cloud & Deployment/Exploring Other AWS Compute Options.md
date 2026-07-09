---
title: Exploring Other AWS Compute Options
created: 2026-02-10
status: 🌱 draft
category: 
difficulty: 
language: pl
tags:
  - 
aliases:
  - 
---
# 🎯 Definicja
AWS oferuje szereg usług obliczeniowych wykraczających poza standardowe maszyny wirtualne (EC2), skupiając się na automatyzacji infrastruktury (IaC) oraz wsparciu dla środowisk hybrydowych.

# 🔑 Kluczowe punkty
- **CloudFormation (IaC):** Automatyzacja tworzenia całych środowisk (od EC2 po IAM) za pomocą szablonów JSON/[[YAML|YAML]]. Zapewnia spójność i powtarzalność.
- **AWS Outposts:** Rozwiązanie hybrydowe, które przynosi sprzęt i usługi AWS bezpośrednio do lokalnego centrum danych (on-premises).
- **Zalety automatyzacji:** Oszczędność czasu, eliminacja błędów ludzkich (np. błędna konfiguracja podsieci) i łatwość zarządzania wersjami infrastruktury.

# 📚 Szczegółowe wyjaśnienie
AWS to nie tylko "klocki" (VM, kontenery), ale także inteligentne sposoby ich składania.
- **CloudFormation** pozwala opisać infrastrukturę jako kod. Dzięki temu ten sam szablon może być użyty do postawienia identycznego środowiska deweloperskiego, testowego i produkcyjnego.
- **AWS Outposts** jest idealny dla branż o wysokich wymaganiach dotyczących opóźnień lub zgodności (np. finanse, ochrona zdrowia), gdzie dane muszą pozostać fizycznie blisko, ale firma chce korzystać z chmurowego modelu operacyjnego.

# 💡 Przykład zastosowania
- **Automatyzacja wdrożeń:** Użycie CloudFormation do automatycznego postawienia całej sieci (VPC), [[Bazy danych|bazy danych]] i serwerów aplikacji jednym kliknięciem.
- **Przetwarzanie brzegowe (Edge):** Wykorzystanie AWS Outposts w fabryce do analizy danych z czujników w czasie rzeczywistym, bez konieczności wysyłania ich do odległego regionu AWS.
- **Zgodność (Compliance):** Przechowywanie wrażliwych danych na lokalnym sprzęcie Outposts przy jednoczesnym zarządzaniu nimi przez panel AWS.

## 📌 Źródła

## 👽 Brudnopis

So far, we've focused on the core AWS computer services, EC2, containers, and serverless functions like Lambda, but AWS goes way beyond those. Let's look at some additional tools to help automate infrastructure and support hybrid environments, giving you even more flexibility and control, especially at scale. Now, AWS isn't just about spinning up virtual machines or running code on demand. It also helps you optimize how your infrastructure is built, scaled, and deployed, so using tools that support both automation and hybrid setups. Think of this as AWS giving you more than just building blocks. It also gives you smart ways to assemble and manage them, no matter where your environment lives. Now one of those services is CloudFormation. CloudFormation is all about Infrastructure as Code. Instead of clicking through the console to launch resources manually, CloudFormation lets you automate the entire setup from EC2 to IAM [[Roles|roles]] using a single template. Now this saves time, ensures consistency, and makes it easy to spin up complex environments in minutes. And you write your Infrastructure as Code in JSON or [[YAML|YAML]], describing exactly what resources you need and how they should be configured. It's like having a master plan you can version, reuse, and even share across teams. And once your template is ready, you could deploy it again and again and again, so this means in dev, test, or production, and you get the same result every time. By codifying your infrastructure, you avoid mistakes that can happen with the manual setup like forgetting a permission or misconfiguring a subnet. Think of this as reducing Ops headaches and making cloud deployment safer and more reliable. Now let's talk hybrid. AWS Outpost brings AWS hardware and services on‑premises so you can run cloud‑native tools in your own physical environment. Now this is perfect for industries like finance, healthcare, or manufacturing that may need to keep data close due to compliance or latency needs. And you get the same EC2, EBS, and any other services you use in the cloud, but you're running locally on AWS‑managed infrastructure. So you don't manage the hardware, AWS does. You just use it as if you were in the cloud. Now, AWS Outpost is ideal for apps that can't afford to wait for round trips to the cloud, so like real‑time control systems, local analytics, or even edge processing. So you're bringing the compute power closer to where the data is being generated. Now, even though it's on‑prem, Outpost still connects with your cloud‑based AWS environment, so everything works together smoothly. It's one ecosystem, it's not a separate silo, so it makes hybrid cloud simple to manage a scale, and Outpost brings AWS into your data center literally. It gives you the AWS hardware and services on‑prem, while still being fully managed by AWS.