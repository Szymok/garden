---
title: Typical Integration Scenarios (Ataccama)
created: 2026-02-04
status: evergreen
category: Ataccama ONE / Integration
difficulty: basic
language: en
tags:
  - integration
  - use-cases
  - web
  - desktop
  - one
aliases:
  - Scenariusze Integracji
---
# 🎯 Definicja
**[[Ataccama|Ataccama]] ONE** składa się z aplikacji webowej (ONE Web) i klienta desktopowego ([[ONE Desktop|ONE Desktop]] / DPE).
Większość zadań robi się w Webie. Ale gdy potrzebujesz "brudnej roboty" (ETL, niestandardowe parsowanie, łączenie z dziwnymi systemami), wchodzi [[ONE Desktop|ONE Desktop]].

# 🔑 Kluczowe punkty
- **Web:** Katalogowanie, Przeglądanie DQ, Zatwierdzanie reguł, Stewardowanie. (Dla biznesu).
- **Desktop:** Development zaawansowany. Edycja planów, debugowanie transformacji, konfiguracja połączeń JDBC. (Dla dewelopera).

# 📚 Szczegółowe wyjaśnienie
Typowe scenariusze integracji:
1.  **Export DQ:** Web wyświetla wyniki -> Desktop (Post-process) zamienia je w CSV/Excel dla biznesu.
2.  **[[Virtual [[Catalog Items|Catalog Items]]|Virtual [[Catalog Items|Catalog Items]]]]:** Web widzi "plik", ale tak naprawdę to wynik skomplikowanego [[SQL|SQL]]/Planu z Desktopa.
3.  **Custom Data Sources:** Źródło danych, którego Web nie obsługuje natywnie (np. jakiś stary Mainframe), jest czytane przez plan w Desktopie i "karmione" do Weba.

# 💡 Przykład zastosowania
Chcesz monitorować [[Jakość Danych|jakość danych]] w plikach XML o bardzo dziwnej strukturze (zagnieżdżone 10 poziomów).
Parser w Webie sobie nie radzi.
Piszesz plan w [[ONE Desktop|ONE Desktop]], który "spłaszcza" ten XML do tabeli.
Wystawiasz ten plan jako "Virtual Catalog Item" w Webie.
Steward widzi to jako zwykłą tabelkę i nakłada reguły DQ.

## 📌 Źródła
- [[Ataccama|Ataccama]] Developers Guide.

## 👽 Brudnopis
- [[ONE Desktop|ONE Desktop]] to "szwajcarski scyzoryk". Web to "ładna witryna". Integracja polega na tym, że Web zleca trudne zadania scyzorykowi.
