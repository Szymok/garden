---
title: RDM
created: 2026-02-04
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
**Ataccama RDM** (Reference Data Management) to moduł platformy Ataccama służący do centralnego zarządzania danymi referencyjnymi (słownikami), zapewniający ich spójność, jakość i poprawność w całej organizacji.

# 🔑 Kluczowe punkty
- **Interfejsy użytkownika:**
  - **RDM Web App:** Zarządzanie danymi przez użytkowników biznesowych.
  - **ONE Desktop (IDE):** Tworzenie modelu danych i procesów orkiestracji.
  - **Admin Console:** Wdrażanie konfiguracji i monitoring.
- **Model Danych:** Logika jest znormalizowana dla wydajności, ale prezentowana w sposób czytelny (de-normalizacja poprzez etykiety zamiast kluczy obcych).
- **Validations & Enrichments:** Automatyczne sprawdzanie poprawności danych (domeny, wyrażenia, SQL) oraz ich automatyczne uzupełnianie (online enrichment).

# 📚 Szczegółowe wyjaśnienie
RDM umożliwia wersjonowanie danych za pomocą tzw. **Business Dates** (okresy ważności rekordów). Zmiany w danych mogą przechodzić przez procesy zatwierdzania (**Workflows**), gdzie np. Data Steward musi zaakceptować nową wartość przed jej publikacją.

Proces wdrożenia (deployment) polega na wygenerowaniu plików konfiguracyjnych XML w ONE Desktop, a następnie ich wgraniu przez Admin Console, co pozwala na audyt zmian przed ich zastosowaniem.

# 💡 Przykład zastosowania
- **Zarządzanie kodami krajów:** Zapewnienie, że we wszystkich systemach (CRM, ERP) Polska jest oznaczona jako "PL" lub "POL", z automatyczną walidacją formatu.
- **Workflow zatwierdzania:** Pracownik edytuje opis produktu, supervisor otrzymuje powiadomienie i musi zatwierdzić zmianę, zanim stanie się ona widoczna dla systemów zewnętrznych.
- **Synchronizacja:** Automatyczne pobieranie kursów walut z zewnętrznej bazy danych i udostępnianie ich innym systemom poprzez Web Services.

## 📌 Źródła

## 👽 Brudnopis
Architecture — Recap There are four user interfaces in Ataccama RDM: RDM Web Application is used for displaying and managing data in the model. One Desktop (IDE) provides a local environment for creating the model and orchestration processes. RDM Admin Console is used for deploying model configurations and monitoring, Admin Center is a separate engine shared by all Ataccama web applications, responsible for managing orchestration, synchronization workflows, and web services. Regarding the RDM data structure: • Data logic is normalized for efficient storage and processing. • For userS convenience, data is denormalized by showing names instead of primary keys (PKS), utilizing views, hierarchies, and datasets.

Logical Model - Recap Mostly each element in RDM has labels and technical names, RDM tables have labels for business users, which represent the user-friendly names Of the columns. These labels are used in user interfaces. In contrast, technical names are used for databases and generating files, ensuring consistency and accuracy in data storage and processing. Apart from columns specifically designed for business users, RDM tables can contain additional information. These additional attributes may include primary key data, data Statuses, user login making changes and validity information.

Deployment Process - Recap • Once setting up everything for your RDM solution is complete, the next crucial step is to generate XML configuration files (packed into a ZIP) for deployment to the RDM web application using the Admin Console. • The configuration package is generated on the local ONE Desktop. That means, that the configuration is created and prepared locally before it can be deployed or applied to the project. • Before deploying the new configuration, you have the option to review the changes and either Accept or Reject the new configuration. This allows users to carefully inspect the modifications before implementing them in the system. • The Admin Console and Admin Center are not the same thing. They are distinct components with different functionalities within the system.

Data Validations & Enrichments — Recap (1/2) Validations are part of configuration. There are various checks are defined to ensure data accuracy and quality. Domain validation - checking the format of an attribute. Domain validation involves verifying that the data entered for a specific attribute conforms to the defined domain or data type. It ensures that data is entered correctly and within the expected format. Expression validation - checking the whole record. Expression validation involves evaluating expressions or conditions that involve multiple attributes in a record. It ensures that the record as a whole meets certain criteria. • SQL validation — Checking the whole table state. SQL validation involves using SQL queries to Check the state of one or more tables in the database. It allows for more complex validation checks involving multiple tables.
Data Validations & Enrichments — Recap (2/2) Online validation - checking the data using the Runtime server. online validation involves real-time checking of the entire table using the Runtime server. This ensures that data remains consistent and valid, Business Dates - versioning by setting a validity period for records. Business Dates allow for versioning data by setting validity periods for records. This means that data can be tracked and managed over time, reflecting changes and updates Within specific timeframes. Using Online enrichment in a system allows attributes to be filled automatically in the create/edit dialog. Online enrichment involves the automatic population or filling of attributes in the create or edit dialog, which is based on predefined algorithms. This feature simplifies data entry for users by reducing manual input and improves data completeness, as the system intelligently populates the relevant information based on the predefined logic.
Relationships & Derived Entities - Recap • Hierarchy enables the expansion of records from parent to their children. It allows users to navigate through hierarchical data structures, exploring related data in a nested manner. • View presents the same rows as in the base table, but it includes additional columns from related parent tables. This helps to consolidate information from different tables into a single view. • Dataset represents a report created as a result of an SQL query from the Reference Data Management repository. It allows users to generate custom reports based on specific data requirements. • Identify the attributes (columns) from the parent table that you want to display in the child table. Usually, only one or two attributes are selected for this purpose. These attributes are typically essential details that provide a quick overview or summary of the related parent record. For these selected attributes, set the "Display Mode- property to •Labels:

Topic Highlights • Warning: Two different things are called workflow Ewf workflow, technical workflow — file for executing ONE Desktop plans and Other commands sequencially O RDM workflow, business workflow, approval workflow — custom process for approving data in RDM o • Notifications — notifies users that there is a required action needed from them When moving a record's change to the 'Publish' State, a supervisor Should by notified o When rejecting or approving, a data steward should by notified 0 • Default approval process: Edit Move to publish Publish • Custom business workflow — Edit Move to publish Extra steps Publish Extra Steps additional approval, further fill Of particular attributes O

Synchronization & Integration - Recap RDM can be synchronized with external systems in several ways: Synchronization via text files, with a possibility to transfer files to and from a remote server. Synchronization with external databases (in both directions). Writing data to and reading data from selected RDM tables via web services. In addition, it is possible to configure an on- publish service (based on a ONE plan), which will take place each time a user tries to publish data in the web application. RDM lets you export data from a configured hierarchy. The configuration results in a plan for each hierarchy.