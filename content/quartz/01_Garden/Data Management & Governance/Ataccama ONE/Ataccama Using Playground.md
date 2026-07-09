# Ataccama Using Playground

🎯 **Definicja**
**GraphiQL (dawniej GraphQL Playground)** to interaktywne, zintegrowane środowisko programistyczne (IDE) służące do pisania, testowania oraz eksplorowania [[One API Queries|API GraphQL]] bezpośrednio w Ataccama ONE. Służy jako konsola deweloperska do uruchamiania [[One API Queries|zapytań (queries)]], [[One API Mutations|mutacji (mutations)]] i [[One API Subscriptions|subskrypcji (subscriptions)]].

---

🔑 **Kluczowe punkty**
- Dostępne pod adresem URL `<adres_ataccama>/playground/`.
- Wspiera automatyczne uzupełnianie kodu (**Content Assist** za pomocą skrótu `Ctrl + Space`) ułatwiające przeglądanie typów i [[Metadata|schematu danych (schema)]].
- Posiada panel historii, który zapamiętuje ostatnio wykonywane zapytania.
- Uwierzytelnianie odbywa się automatycznie w tle przy użyciu aktywnej sesji użytkownika (Bearer token, patrz: [[Endpoints and HTTP Headers|Nagłówki HTTP i Uwierzytelnianie]]).
- Pozwala na konfigurację [[One API Queries|zmiennych (Variables)]] w dedykowanym panelu w formacie JSON.

---

📚 **Jak korzystać z GraphiQL (Krok po Kroku)**

1. **Otwarcie środowiska:** Przejdź w przeglądarce pod adres `<adres_ataccama>/playground/`. Nastąpi automatyczne przekierowanie do interfejsu GraphiQL.
2. **Uwierzytelnianie:** Sprawdź, czy jesteś zalogowany w aplikacji głównej Ataccama ONE. Playground automatycznie pobiera token Bearer z Twojej aktywnej sesji przeglądarki.
3. **Konstruowanie zapytania:** Wpisz swoje zapytanie (Query) lub mutację (Mutation) w lewym panelu edytora.
4. **Zmienne (Variables):** Jeśli Twoje zapytanie parametryzuje dane wejściowe, zdefiniuj je w panelu **Query Variables** na dole edytora w formacie JSON:
   ```json
   {
     "gid": "0726c74e-fc9e-40ad-a29d-23ec1dac8769"
   }
   ```
5. **Wykonanie operacji:** Kliknij przycisk **Execute** (ikona trójkąta/odtwarzania) na środku ekranu.
6. **Analiza wyniku:** Przejrzyj odpowiedź z serwera w prawym panelu wynikowym.

---

💡 **Przykład zastosowania**
Podczas pisania skomplikowanych zapytań o powiązania encji metadanych (np. sprawdzanie atrybutów tabeli, patrz: [[Data Catalog]]), możesz nacisnąć `Ctrl + Space` wewnątrz nawiasów klamrowych. GraphiQL wyświetli listę wszystkich dostępnych pól i typów, które możesz pobrać z [[Metadata|modelu danych]].

---

📌 **Źródła**
- Oficjalna dokumentacja GraphiQL
- Ataccama ONE Developer Guide