---
title: "Hurtownia Danych"
tags:
- inżynieria danych
---
Hurtownia Danych, w skrócie DWH, znana również jako Hurtownia Danych Przedsiębiorstwa (EDW), to tradycyjny sposób gromadzenia danych, stosowany od ponad 30 lat. Hurtownia Danych służy do [integracji danych](notes/integracja%20danych.md) z wielu różnych źródeł, stanowi punkt jednolitej prawdy i zarządzania danymi, w tym czyszczenia, tworzenia historii i łączenia danych. Zapewnia lepszy wgląd dla kadry zarządzającej w wyniki firmy za pomocą paneli zarządzania, raportów lub analiz ad hoc.

Różne rodzaje danych biznesowych są analizowane za pomocą Hurtowni Danych. Potrzeba jej często staje się widoczna, gdy wymagania analityczne kolidują z bieżącą wydajnością baz danych operacyjnych. Wykonanie złożonego zapytania w bazie danych wymaga czasowego przejścia bazy danych w stan tymczasowo ustalony. Jest to często niemożliwe do zaakceptowania dla baz danych transakcyjnych. Hurtownia Danych jest wykorzystywana do przeprowadzania pracy analitycznej, pozostawiając bazę danych transakcyjnych wolną do skupienia się na transakcjach.

Inną charakterystyczną cechą jest analizowanie danych z wielu źródeł (np. danych z Google Analytics w połączeniu z danymi CRM). Dane te są silnie [przetwarzane](notes/transformacje%20danych.md) i strukturyzowane w procesie [ETL (Extract Transform Load)](notes/etl.md).
