---
title: Moving Data with AWS Snowball and Database Replication
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
Przenoszenie danych na dużą skalę wymaga specjalistycznych narzędzi. AWS oferuje dwie główne usługi: **AWS Snowball** (fizyczne urządzenie do transferu offline) oraz **AWS DMS** (usługa online do migracji i replikacji baz danych).

# 🔑 Kluczowe punkty
- **AWS Snowball:** Fizyczne urządzenie do przesyłania terabajtów i petabajtów danych tam, gdzie transfer sieciowy jest zbyt wolny lub niepraktyczny. Dane są szyfrowane i śledzone end-to-end.
- **AWS DMS (Database Migration Service):** Pozwala na migrację baz jednorodnych (np. Oracle do Oracle) i różnorodnych (np. SQL Server do MySQL) z minimalnym czasem przestoju.
- **Replikacja w czasie rzeczywistym:** DMS synchronizuje dane z docelową bazą (RDS, Aurora, Redshift), podczas gdy źródłowa baza wciąż działa.

# 📚 Szczegółowe wyjaśnienie
Migracja danych to często najtrudniejsza część przejścia do chmury.
- **Snowball** jest idealny dla lokalizacji z ograniczoną przepustowością łącza, gdzie wysyłanie danych przez internet zajęłoby tygodnie.
- **DMS** rozwiązuje problem "zamrożenia" biznesu na czas migracji – baza źródłowa pozostaje dostępna dla użytkowników, a DMS dba o to, by każda zmiana trafiła do chmury.

# 💡 Przykład zastosowania
- **Backup korporacyjny:** Przenoszenie wieloletnich archiwów i kopii zapasowych serwerów za pomocą Snowball.
- **Modernizacja bazy danych:** Upgrade starych systemów do nowoczesnych platform chmurowych (np. Aurora) bez wyłączania aplikacji.
- **Migracja danych medycznych:** Przenoszenie wrażliwych danych przy zachowaniu pełnej ścieżki audytu i bezpieczeństwa (compliance).
- **Setup hybrydowy:** Utrzymanie synchronizacji między bazą lokalną a chmurową podczas stopniowego przenoszenia infrastruktury.

## 📌 Źródła

## 👽 Brudnopis

When it comes to large‑scale migrations, moving data is often one of the trickiest parts. We're going to take a look at two powerful AWS services, AWS Snowball and AWS Database Migration Service, and how they help you transfer data to the cloud securely and efficiently. Now let's start with AWS Snowball. Now this is a physical device provided by AWS designed for transferring massive datasets, so think terabytes and petabytes when network‑based transfer just isn't practical. Now you would use Snowball if you're in a location with limited bandwidth or if transferring large volumes over the internet would take days or even weeks. Here's what makes it useful. So it's perfect for shipping data when time and bandwidth are constraints and importantly, your data is encrypted and tracked end to end so it stays protected throughout the process. Now for workloads that are online and need minimal downtime, there's AWS DMS, the Database Migration Service. So DMS allows you to support both homogeneous migrations like Oracle to Oracle and heterogeneous ones like SQL Server to MySQL. And best of all, it supports real‑time replication, so your source database keeps running as your data is synced to the target. Now you can migrate your databases straight into AWS, whether it's RDS, Aurora, Redshift, others. This makes it perfect when you can't afford to shut down critical systems during the move. Both Snowball and DMS power a variety of real‑world migration scenarios, and here are some examples. They support enterprise backup migration, so moving years of archive files or server backups. It supports hybrid cloud setup, so where part of your infrastructure stays on‑prem and part moves to AWS. It supports healthcare data migration, so where regulatory concerns require secure and trackable movement of sensitive data. And then it supports database modernization, so this is when you're upgrading legacy databases and moving them to cloud‑native platforms like Aurora or Redshift. Each use case takes advantage of a different AWS tool, but they all still aim for the same result, faster, safer, and smarter data migration.