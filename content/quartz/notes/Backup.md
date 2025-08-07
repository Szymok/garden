---

title: Backup  
created: 2025-03-31  
status: Final  
category: IT  
difficulty: podstawowy  
language: pl  
tags:

- backup
- disaster recovery
- Ataccama
- MMDM  
aliases:
- kopia zapasowa
- backup danych

---

# 🎯 Definicja

**Backup (kopia zapasowa)** to proces tworzenia zapasowych kopii danych lub konfiguracji systemu, które mogą zostać przywrócone w przypadku utraty danych, awarii systemu, błędów użytkownika lub ataku cybernetycznego. Backup jest kluczowym elementem każdego systemu informatycznego, zapewniającym bezpieczeństwo i ciągłość działania.

# 🔑 Kluczowe punkty

- **Backup** chroni przed utratą danych wynikającą z awarii sprzętu, błędów aplikacji, działań użytkownika lub incydentów bezpieczeństwa.
- W systemach klasy **Ataccama** można wykonywać zarówno backup bazy danych aplikacji, jak i kluczowych metadanych (np. modeli [[Meta Meta Data Model (MMDM)|MMDM]]).
- Backupy powinny być wykonywane regularnie (automatycznie lub manualnie) – najlepiej w trybie różnicowym lub pełnym.
- Ważne jest testowanie planów odtwarzania danych (restore) w praktyce, by uniknąć "fałszywego poczucia bezpieczeństwa".
- W aplikacjach z [[Meta Meta Data Model (MMDM)|MMDM]] różne tryby działania wymuszają dostosowanie zakresu backupu – kopiowane mogą być nie tylko dane, ale także elementy modelowe, konfiguracje, oraz powiązane skrypty lub harmonogramy.

# 📚 Szczegółowe wyjaśnienie

## Typowe strategie backupu

|Tryb backupu|Opis|Zastosowanie w Ataccamie/[[Meta Meta Data Model (MMDM)\|MMDM]]|
|---|---|---|
|**Pełny (Full)**|Kopiuje całość wybranego zasobu|Cała DB lub komplet metadanych, konfiguracja|
|**Przyrostowy (Incremental)**|Kopiuje tylko zmiany od ostatniego backupu pełnego|Dobre dla środowisk test/dev, ogranicza rozmiar|
|**Różnicowy (Differential)**|Kopiuje zmiany względem ostatniego pełnego backupu|Często spotykane w produkcji, kompromis rozmiaru|

## Backupy w Ataccamie oraz [[Meta Meta Data Model (MMDM)|MMDM]]

- **Ataccama ONE / [[Master Data Management (MDM)|MDM]]** oferuje dedykowane narzędzia do backupu konfiguracji aplikacji (meta-data), modelu danych, słowników oraz rzeczywistych danych produkcyjnych.
- Backup może być wykonywany manualnie (np. eksport konfiguracji przez GUI) lub automatycznie (skrypty/CLI, harmonogramy).
- W środowiskach korzystających z [[Meta Meta Data Model (MMDM)]] należy dokładnie dokumentować oraz wersjonować backupy modeli i powiązanych obiektów – różne tryby działania aplikacji mogą wymagać odrębnych zakresów backupowanych danych (np. osobno definicje modeli, osobno instancje danych).
- Dobrą praktyką jest utrzymywanie kopii backupów na systemach zewnętrznych (offsite, backup w chmurze) oraz regularna weryfikacja możliwości odtworzenia (restore).

## Tryby działania aplikacji – wpływ na backup

W zależności od konfiguracji i trybu operacyjnego aplikacji (np. wersjonowanie modeli, migracje środowisk, testy integracyjne), zakres backupu może się zmieniać:

- **Tryb development:** backup modeli, schematów oraz nowych/zmienianych obiektów.
- **Tryb produkcyjny:** regularne backupy całości systemu (DB + konfiguracja) w ustalonych oknach serwisowych.
- **Tryb migracji/zmiany modelu:** dedykowany backup przed każdą większą aktualizacją [[Meta Meta Data Model (MMDM)|MMDM]].

# 💡 Przykład zastosowania

Załóżmy, że w środowisku Ataccama ONE wdrożono nową wersję modelu [[Meta Meta Data Model (MMDM)|MMDM]]. Przed aktualizacją administrator wykonuje pełny backup:

- eksportuje konfigurację aplikacji i modelu [[Meta Meta Data Model (MMDM)|MMDM]] przez narzędzie Ataccama,
- wykonuje snapshot baz danych (np. przy pomocy zewnętrznego narzędzia do backupu SQL),
- synchronizuje backup na zewnętrzny storage,
- po udanej aktualizacji waliduje system, a w razie potrzeby przywraca stan sprzed wdrożenia.

**Przykład backupu konfiguracji w Pythonie:**

```python
import shutil

# Backup pliku konfiguracyjnego aplikacji Ataccama
shutil.copy("/opt/ataccama/config/mmdm-config.yaml",
            "/backup/ataccama/mmdm-config-BACKUP_2025-07-16.yaml")

# Backup bazy danych realizowany narzędziem CLI np. pg_dump (PostgreSQL)
# subprocess.call(["pg_dump", "-h", "host", "-U", "user", "-d", "dbname", "-f", "/backup/db_backup.sql"])
```

## 📌 Źródła

- [https://docs.ataccama.com/one/backup-and-restore](https://docs.ataccama.com/one/backup-and-restore)
- [https://www.ataccama.com/blog/best-practices-backup-restore-mdm](https://www.ataccama.com/blog/best-practices-backup-restore-mdm)
- [https://docs.microsoft.com/en-us/sql/relational-databases/backup-restore/](https://docs.microsoft.com/en-us/sql/relational-databases/backup-restore/)

## 👽 Brudnopis

- Backup nie tylko jako dump SQL, ale też jako eksport meta-modelu ([[Meta Meta Data Model (MMDM)|MMDM]]).
- Testy restore obowiązkowo, szczególnie przy zmianie modelu.
- Ataccama – backupy: przez GUI (eksport), CLI (skrypt), backup bazy.
- Tryby działania: dev, prod, staging → różny zakres/zakres pełen przy migracji.
- Różnica backupu manualnego vs automatycznego (crontab, scheduler One).
- Zalecane: retencja historii, backup offsite, monitoring sukcesu backupu.

---