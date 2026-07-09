---
title: GenAI Ataccama (Generative AI w Ataccama ONE)
created: 2026-02-04
status: evergreen
category: Data Governance
difficulty: basic
language: pl
tags:
  - ataccama
  - genai
  - automation
  - copilot
aliases:
  - AI Assistant w Ataccama
  - Automatyzacja DQ
---
# 🎯 Definicja
**GenAI w [[Ataccama|Ataccama]]** to zestaw funkcji wbudowanych w platformę [[Ataccama|Ataccama]] ONE, które wykorzystują [[Generatywna Sztuczna Inteligencja|modele generatywne]] (LLM) do automatyzacji żmudnych zadań Data Stewardów. AI działa tu jako "współpilot" (Copilot), pomagając w opisywaniu danych, tworzeniu reguł jakości i wyszukiwaniu informacji.

# 🔑 Kluczowe funkcje
- **Generowanie Reguł DQ:** Piszesz "Chcę sprawdzić, czy PESEL jest poprawny", a AI generuje kod reguły.
- **Opisywanie Danych:** AI analizuje zawartość tabeli i proponuje opis biznesowy ("To jest tabela klientów z regionu EMEA").
- **Classification:** Automatyczne tagowanie danych wrażliwych (PII).
- **AI Assistant:** Czat z katalogiem danych ("Pokaż mi wszystkie tabele z danymi finansowymi z 2023").

# 📚 Szczegółowe wyjaśnienie
Tradycyjne [[Data Governance|Data Governance]] wymagało ręcznego klikania i pisania skomplikowanych wyrażeń (Regex, [[SQL|SQL]]). GenAI obniża barierę wejścia - teraz analityk biznesowy może stworzyć regułę jakości, używając języka naturalnego.
[[Ataccama|Ataccama]] wykorzystuje [[Metadata|metadata]]-driven approach, co oznacza, że AI ma dostęp nie tylko do próbki danych, ale też do kontekstu (nazwy kolumn, relacje), co zwiększa trafność sugestii.

# 💡 Przykład zastosowania
Steward widzi kolumnę `usr_addr_cty`. Nie wie, co to jest.
Klika "Ask AI".
AI analizuje dane (Warszawa, Berlin, Paris) i metadane.
Odpowiedź: "To kolumna zawierająca nazwy miast adresowych użytkowników. Sugerowana nazwa biznesowa: City."
Steward akceptuje sugestię jednym kliknięciem.

## 📌 Źródła
- [[Ataccama|Ataccama]] ONE v14+ Documentation.

## 👽 Brudnopis
- To nie jest "Magic Button", który robi wszystko sam. To narzędzie wspomagające (Human-in-the-loop).
- Kluczowa zaleta: Skrócenie czasu wdrażania (Time-to-value) DQ o 50-80%.