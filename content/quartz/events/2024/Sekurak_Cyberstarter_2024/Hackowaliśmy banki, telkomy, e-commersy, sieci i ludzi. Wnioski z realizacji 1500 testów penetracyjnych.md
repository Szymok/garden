---
title: Hackowaliśmy banki, telkomy, e-commersy, sieci i ludzi. Wnioski z realizacji 1500 testów penetracyjnych
source: Cyberstarter
Data: 2024-12-06
author:
  - Marcin Piosek
type: event
tags:
  - hacker
  - pentest
---
# Abstrakt
# Opinia

# Notes
### Broken Access Control
Przypadek, w którym...
Przyklad#1 - IDOR
GET /account/12345ä HTTP/I.I
Host: test. app
Cookie: token=d5e9826eec72ea4bfe529defbe601c4
Accept: application/json

Przyklad#2 
GET /user/permission HTTP/ 1.1
Host: test. app
Cookie: token=d5e9826eec72ea4bfe529dOfbe6e1c4
Accept: application/json

Broken Access Control - przyczyny
• Framework nie pomoże (w tym przypadku)
• Skanery tego nie raportują*
• „Autentykacja” @
• isAuthenticated(user) != isAuthorizedTo(user, something)
• Żmudna praca wymagająca zrozumienia logiki aplikacji i zależności

Broken Access Control — wnioski
• Edukacja
• Centralne mechanizmy kontroli uprawnień
• Testy manualne
### Te błędy już nie występują
„Te błędy już nie występują”- otóż występują!
SQL Injection
7%
(web, mobile)
Cross-Site Scripting
(web)

„Te btedy jui nie wystepuja"- otóż wystepuja!
• Server Side Request Forgery (SSRF) • Security Misconfiguration
• Remote File Inclusion (RFI)
• Local File Inclusion (LFI)
• Remote Code Execution (RCE)
• CRLF Injection
• LDAP Injection
• NoSQL Injection
• Insufficient Protection
• Open Redirect
• Insecure Cryptographic Storage
• Insecure Direct Object References
• Server-Side Template Injection
• Regular expression DoS
• HTTP Request Smuggling
• GraphQL introspection
• XML Injection
• Race Condition
• Cache Deception
• Cache Poisoning

### Przyczyny
• Podążanie za utartymi schematami
• Framework nie zaadresuje wszystkiego

### Wnioski
• Edukacja
• Nie zamykanie się na różne możliwości
• SAST / DAST (CI/CD)

Bezpieczeństwo infrastruktury - przyczyny
• To wina administratorów!? Nie ;)
• Budżet
• „Uruchomię skaner i będę bezpieczny”

Bezpieczeństwo infrastruktury - wnioski
• Mozolna praca
• Segmentacja
• Monitoring
• Uświadamianie kadry zarządzającej

Zagrożenia wewnętrzne — przyczyny
• To (znowu) wina administratorów!? ;)
• Trudność nadążania za zmianami
• Niechęć do stosowania mechanizmów i zasad bezpieczeństwa

Zagrożenia wewnętrzne — wnioski
• Zero trust
• Denied by default
• Uprawnienia nadawane okresowo
• Monitoring oraz analiza anomalii
• Unikanie odstępstw
• Testy (Insider Threat)

### AD CS
Active Directory Certificate Services (AD CS)
• Domena Windows - logiczna grupa komputerów, użytkowników i zasobów, którą zarządza kontroler domeny (DC).
• Active Directory (AD) - usługa katalogowa, służąca do zarządzania użytkownikami, urządzeniami i zasobami sieciowymi oraz ich dostępem w sieciach opartych głównie na systemach Windows.
Active Directory Certificate Services (AD CS) jest rozszerzeniem AD, które umożliwia zarządzanie infrastrukturą kluczy publicznych (PKI) w domenie Windows.
szablony certyfikatów, które definiują zasady,
Templates-właściwości i parametry certyfikatów, jakie mogą być wystawione przez usługę.
### Socjotechnika - wnioski
• Wysoka efektywność
• Edukacja
• Przykłady dostosowane do sytuacji (np. testy a później szkolenie)
• Zdrowy rozsądek (np. zagrożenia związane z klonowaniem głosu)
• Zdrowa nieufność (np. kontrahent i zmiana numer rachunku bankowego)
• Multi-factor authentication (MFA) — MUST HAVE!
### Linki
- www.securitum.com/pentest-chronicles.html
- www.securitum.com/public-reports.html