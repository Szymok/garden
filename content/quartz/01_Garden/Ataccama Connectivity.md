---
title: Wymagania Sieciowe Ataccama
created: 2026-02-04
status: sapling
category: Tech
difficulty: intermediate
language: pl
tags:
  - ataccama
  - networking
  - connectivity
  - infrastructure
aliases:
  - Połączenia sieciowe Ataccama
  - Ataccama TCP/IP
---
# 🎯 Definicja
Zbiór wymagań technicznych dotyczących komunikacji sieciowej między komponentami platformy Ataccama ONE a zewnętrznymi systemami i źródłami danych, niezbędny do poprawnego działania procesów przetwarzania danych.

# 🔑 Kluczowe punkty
- **Bezpośrednie połączenie CP/IP:** Wymagane jest bezpośrednie połączenie sieciowe między serwerami przetwarzającymi a źródłami danych.
- **Brak obsługi Proxy:** Połączenia do baz danych nie mogą być tunelowane przez serwery Proxy w warstwie aplikacji (wymagany czysty routing).
- **Kluczowe komponenty:** Głównymi "konsumentami" połączeń są DPE (Data Processing Engine) oraz silniki serwerowe (MDM, RDM, DQIT).

# 📚 Szczegółowe wyjaśnienie
Efektywność przetwarzania danych (ETL, Profilowanie, MDM) zależy od niskiego opóźnienia i wysokiej przepustowości łącza. Ataccama wymaga, aby każdy serwer, na którym uruchomiony jest silnik przetwarzania (**DPE**), miał bezpośrednią "widoczność" sieciową serwera bazy danych.

Oznacza to, że w skomplikowanych topologiach sieciowych (np. hybrid cloud), należy skonfigurować odpowiednie reguły routingu, peering VPC lub tunele VPN/ExpressRoute, a nie polegać na pośrednikach typu HTTP Proxy, które nie obsługują protokołów bazodanowych (jak JDBC/ODBC) w sposób wydajny lub w ogóle.

# 💡 Przykład zastosowania
Architektura sieciowa:
- **Serwer A (Ataccama DPE):** IP `10.0.1.5`
- **Serwer B (Baza Danych Oracle):** IP `192.168.50.10`
- **Wymóg:** Firewall musi zezwalać na ruch z `10.0.1.5` na `192.168.50.10` po porcie `1521` (TCP).

## 📌 Źródła


## 👽 Brudnopis
- The Ataccama ONE Platform needs **access to the data it processes**.
- A **direct TCP/IP connection (without a proxy) must be established** between the relevant target servers and the data sources they utilise.
- The following components are responsible for data processing and require direct data source access:
    - **Data Processing Engine (DPE)**: Every server running a DPE instance must allow connections to the required data sources.
    - **MDM, RDM, DQIT**: Engine servers must have a direct connection to their respective required data sources.