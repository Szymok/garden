---
title: Microsoft Fabric — najnowsza platforma analityczna
Data: 
type: event
---
# Abstrakt
Zapraszam na prelekcję poświęconą nowej platformie analitycznej Microsoft Fabric. Omówię komponenty platformy oraz pokażę sposób na zbudowanie rozwiązania analitycznego. W trakcie demonstracji pokażę zastosowanie koncepcji OneLake For Data oraz zbuduję Data Lakehouse.

# Opinia

# Notes
## Data engineering in Azure

Wazne - OneLake dla wszystkich danych.
Pojedyncze jezioro SaaS dla całej organizacji
Dostarczane automatycznie wraz z dzierżawcą
Wszystkie obciążenia automatycznie przechowują swoje dane
w folderach przestrzeni roboczej OneLake
Wszystkie dane są zorganizowane w intuicyjnej
hierarchicznej przestrzeni nazw
Dane w OneLake są automatycznie indeksowane
dla wykrywania, etykiet MIP, pochodzenia, skanowania PII,
udostępniania, zarządzania i zgodności

Jedna kopia dla wszystkich obliczeń
Wszystkie silniki obliczeniowe przechowują swoje dane
automatycznie w OneLake
Dane są przechowywane w jednym wspólnym formacie
Delta - Parquet, format oparty na otwartych standardach, jest
format przechowywania wszystkich danych tabelarycznych w Fabric.
Gdy dane są przechowywane w jeziorze, ił jest bezpośrednio
dostępne dla wszystkich silników bez konieczności
importu/eksportu
Wszystkie silniki obliczeniowe zostały w pełni zoptymalizowane
do pracy z Delta Parquet jako ich natywnym formatem.
Współdzielony uniwersalny model bezpieczeństwa jest egzekwowany przez
we wszystkich silnikach