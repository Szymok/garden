---
title: Hands-on Working with EC2 (Praktyka AWS EC2)
created: 2026-02-04
status: evergreen
category: Cloud Computing
difficulty: basic
language: pl
tags:
  - aws
  - ec2
  - tutorial
  - linux
  - web-server
aliases:
  - EC2 Tutorial
  - Uruchamianie VM na AWS
---
# 🎯 Definicja
**Amazon EC2** (Elastic Compute Cloud) to usługa AWS pozwalająca na wynajem wirtualnych serwerów (instancji) w chmurze. Ten poradnik (Hands-on) przeprowadza przez proces uruchomienia pierwszej instancji Linuxa i zainstalowania na niej serwera WWW (Apache).

# 🔑 Kluczowe punkty
- **AMI (Amazon Machine Image):** Obraz systemu (np. Amazon Linux, Ubuntu, Windows).
- **Instance Type:** Rozmiar serwera (np. `t2.micro` - darmowy, `t3.medium`).
- **Security Group:** Wirtualny Firewall (kluczowe: trzeba otworzyć port 22 dla SSH i 80 dla HTTP).
- **Key Pair:** Klucz prywatny `.pem` potrzebny do zalogowania się (nie zgub go!).

# 📚 Szczegółowe wyjaśnienie (Krok po kroku)
1. **Launch Instance:** W konsoli AWS klikasz "Launch".
2. **Konfiguracja:** Wybierasz Amazon Linux 2023, typ `t2.micro`. Tworzysz nową parę kluczy (`.pem`).
3. **Sieć:** Zaznaczasz "Allow SSH traffic" i "Allow HTTP traffic from the internet".
4. **User Data (Opcjonalnie):** Możesz wkleić skrypt, który wykona się przy starcie (np. instalacja Apache).
5. **Start:** Instancja rusza. Kopiujesz jej **Public IP**.
6. **Połączenie:** Łączysz się przez SSH (`ssh -i key.pem ec2-user@IP`) lub EC2 Instance Connect (w przeglądarce).
7. **Instalacja WWW:**
   ```bash
   sudo yum update -y
   sudo yum install httpd -y
   sudo systemctl start httpd
   sudo systemctl enable httpd
   ```
8. **Test:** Wklejasz Public IP do przeglądarki. Powinieneś zobaczyć stronę "It works!".

# 💡 Przykład zastosowania
Potrzebujesz szybko postawić serwer testowy dla aplikacji PHP lub Pythona. W 2 minuty masz gotową maszynę Linux widoczną w internecie, za którą płacisz grosze (model Pay-as-you-go).

## 📌 Źródła
- AWS Documentation: Get Started with Amazon EC2.

## 👽 Brudnopis
- Pamiętaj o **zatrzymaniu (Stop)** lub **terminacji (Terminate)** instancji po testach, żeby nie płacić rachunków!
- `t2.micro` jest objęty Free Tier (750h miesięcznie za darmo przez pierwszy rok).