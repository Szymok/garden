---

title: GraphQL in Ataccama  
created: 2025-04-01  
status:  
category: integracje / API  
difficulty: średni  
language: pl  
tags:

- GraphQL
- API
- Ataccama
- data access
- integracja  
aliases:
- graphql api ataccama
- graphql dane

---

# 🎯 Definicja

**GraphQL w Ataccama** to interfejs API umożliwiający programistyczny dostęp do danych, metadanych i operacji zarządzania zasobami w Ataccama ONE, za pomocą języka zapytań GraphQL. Umożliwia on pobieranie i manipulację wybranymi porcji danych z katalogu, systemu reguł, słownika biznesowego i innych komponentów platformy w sposób bardziej elastyczny niż tradycyjne REST API.

# 🔑 Kluczowe punkty

- 🧠 Umożliwia programistom i integratorom tworzenie własnych zapytań po danych w stylu deklaratywnym.
- ⚙️ Działa w modelu "tylko to, co potrzebne" — klient sam określa strukturę odpowiedzi.
- 🚀 Umożliwia [[Sharing access to assets|dostęp do zasobów]] takich jak: obiekty katalogowe, reguły jakości, [[Glossary Terms|terminy słownikowe]], lineage, użytkownicy.
- 🔐 Wspiera uwierzytelnienie (np. token JWT) i kontrolę dostępu poprzez [[Roles|role]].
- 📦 Nadaje się do tworzenia własnych interfejsów użytkownika, mikrofrontendów, wizualizacji niestandardowych, automatyzacji.

# 📚 Szczegółowe wyjaśnienie

## Czym jest GraphQL?

**GraphQL** to alternatywa dla REST, opracowana przez Facebooka, w której klient sam precyzyjnie definiuje, jakie dane są mu potrzebne. W odpowiedzi serwer zwraca tylko to, co zostało zadeklarowane. W Ataccama GraphQL pozwala m.in. na:

- pobieranie szczegółów katalogu danych ([[Catalog Items]]),
- dostęp do metryk jakości (Data Quality Scores),
- eksplorację terminów słownikowych i powiązanych reguł ([[Glossary Terms]]),
- tworzenie własnych przeglądarek danych, workflow, dashboardów.

## Przykładowe zapytanie

```graphql
query {
  catalogItem(id: "1234-5678") {
    name
    description
    source {
      name
      type
    }
    glossaryTerms {
      name
      description
    }
    qualityScore {
      value
      lastEvaluated
    }
  }
}
```

To zapytanie pobiera nazwę, opis, dane źródła, [[Glossary Terms|terminy słownikowe]] i wynik DQ dla podanego elementu katalogowego.

## Typowe operacje i obiekty

|Obiekt|Opis|
|---|---|
|`catalogItem`|Dane katalogowe (tabele, widoki, pliki)|
|`glossaryTerm`|[[Glossary Terms\|Terminy słownikowe]] i ich połączenia|
|`dqRuleInstance`|Instancje reguł jakości danych|
|`dataSource`|Informacje o źródłach danych|
|`qualityScore`|Wyniki profilowania i ewaluacji DQ|
|`user`, `group`|Informacje o kontach użytkowników|

GraphQL umożliwia też paginację, filtrowanie i sortowanie wyników; opcjonalnie można dodać parametry (variables).

# 💡 Przykład zastosowania

1. **Automatyzacja audytu jakości danych**  
    Skrypt pobierający z API co tydzień wszystkie obiekty z jakością poniżej 80% i zapisujący je do dashboardu w Power [[Business Intelligence|BI]].
    
2. **Tworzenie własnej aplikacji frontowej**  
    Frontend React, który za pomocą GraphQL API buduje mapę liniową pomiędzy słownikami pojęciowymi a obiektami w katalogu.
    
3. **Generowanie raportów zgodności z RODO**  
    GraphQL pobiera wszystkie kolumny oznaczone jako `PII=true`, z ich źródłem, właścicielem i przypisanym terminem biznesowym.
    

# 📌 Źródła

- [https://docs.ataccama.com/](https://docs.ataccama.com/)
- [https://graphql.org/learn/](https://graphql.org/learn/)
- [https://www.apollographql.com/docs/](https://www.apollographql.com/docs/)
- [https://developer.mozilla.org/en-US/docs/Web/API/Fetch_API](https://developer.mozilla.org/en-US/docs/Web/API/Fetch_API)
- [https://blog.bitsrc.io/getting-started-with-graphql-in-2023-18adb1c53b9a](https://blog.bitsrc.io/getting-started-with-graphql-in-2023-18adb1c53b9a)

# 👽 Brudnopis

- Plus GraphQL: tylko jeden endpoint, pełna kontrola nad tym, co pobieram, niska nadmiarowość
- Ułatwienie dla citizen devs, którzy chcą eksplorować dane bez znajomości szczegółów REST API
- Przyszłościowo: GraphQL jako warstwa pośrednia między komponentami low-code
- Rekomendacja: dokumentacja SDL (schema definition language) dla custom typów i relacji
- Możliwa integracja z systemami [[Data Mesh]], aplikacjami [[Business Intelligence|BI]], Excel, botami AI