---

title: Roles  
created: 2025-05-21  
status: 🌱 draft
category: data governance / zarzÄ…dzanie dostÄ™pem  
difficulty: podstawowy  
language: pl  
tags:

- role uÅ¼ytkownikÃ³w
- kontrola dostÄ™pu
- governance
- metadane
- katalog danych  
aliases:
- role
- typy rÃ³l
- dostÄ™p uÅ¼ytkownikÃ³w

---

# ðŸŽ¯ Definicja

**Roles (role)** to zestawy uprawnieÅ„ przypisywane uÅ¼ytkownikom lub grupom, ktÃ³re definiujÄ…, co dana osoba moÅ¼e robiÄ‡ w systemie danych â€” w tym przeglÄ…daÄ‡, edytowaÄ‡, usuwaÄ‡, komentowaÄ‡ i zarzÄ…dzaÄ‡ obiektami w katalogu danych, sÅ‚owniku biznesowym, projektach, przepÅ‚ywach pracy czy konfiguracji.

# ðŸ”‘ Kluczowe punkty

- ðŸ” Role wskazujÄ… zakres kontroli uÅ¼ytkownika nad elementami systemu â€” np. edycja metadanych, akceptacja zmian, uruchamianie reguÅ‚.
- ðŸ§± Role mogÄ… byÄ‡ przypisywane globalnie (np. przez system IAM: [[Keycloak]], AD) lub kontekstowo tylko dla danej grupy, katalogu lub projektu.
- ðŸŽ›ï¸ KaÅ¼da rola agreguje zestaw uprawnieÅ„ ("action set") â€” moÅ¼na tworzyÄ‡ role predefiniowane lub zdefiniowane przez uÅ¼ytkownika.
- ðŸ“ UÅ¼ytkownicy z danÄ… rolÄ… mogÄ… mieÄ‡ inny poziom dostÄ™pu do obiektÃ³w w katalogu: full, edit, view, comment-only.

# ðŸ“š SzczegÃ³Å‚owe wyjaÅ›nienie

## PrzykÅ‚adowe role w systemie zarzÄ…dzania danymi (np. Ataccama ONE)

|Rola|Zakres dziaÅ‚ania|
|---|---|
|`MMM_admin`|PeÅ‚ny dostÄ™p, konfiguracja katalogu, struktury, synchronizacji i zarzÄ…dzania|
|`MMM_data-manager`|Edycja i publikacja metadanych, wspÃ³Å‚praca ze stewardami i wÅ‚aÅ›cicielami|
|`Data Steward`|ZarzÄ…dzanie terminami, jakoÅ›ciÄ… danych, przypisaniami w sÅ‚owniku|
|`Data Owner`|OdpowiedzialnoÅ›Ä‡ biznesowa, zatwierdzanie, zarzÄ…dzanie reputacjÄ… danych|
|`Data Consumer`|Odczyt danych i metadanych, moÅ¼liwoÅ›Ä‡ komentowania|

W praktyce, system automatycznie ustawia domyÅ›lnÄ… widocznoÅ›Ä‡ nowo dodanych obiektÃ³w w katalogu dla okreÅ›lonych rÃ³l â€” np. tylko `admin` i `data-manager` bÄ™dÄ… mogli je edytowaÄ‡.

## Sterowanie dostÄ™pem i zakres rÃ³l

Rola = zbiÃ³r uprawnieÅ„ do tzw. â€žakcjiâ€:

| Akcja uÅ¼ytkownika           | Czy dostÄ™pna? (zaleÅ¼nie od roli) |
| --------------------------- | -------------------------------- |
| `View metadata`             | âœ… viewer, steward                |
| `Edit metadata`             | âœ… data-manager, steward          |
| `Assign glossary terms`     | âœ… steward                        |
| `Run rules / DQ checks`     | âœ… steward, manager               |
| `Configure detection rules` | âŒ tylko `admin`                  |
|                             |                                  |

## Integracja z toÅ¼samoÅ›ciÄ…

W systemach obsÅ‚ugujÄ…cych SSO/IAM:

- Role mogÄ… pochodziÄ‡ z zewnÄ™trznego systemu (np. [[Keycloak]] role: `MMM_user`, `ONE_engine_admin`).
- MoÅ¼liwe jest przypisywanie roli automatycznie przy pierwszym logowaniu.
- Role mogÄ… byÄ‡ przekÅ‚adane lub synchronizowane z systemem RBAC w katalogu danych.

# ðŸ’¡ PrzykÅ‚ad zastosowania

```python
# Przypisanie roli uÅ¼ytkownika w pseudokodzie lub API

assign_role(
  user="jan.kowalski@example.com",
  context="data_catalog",
  role="MMM_data-manager"
)

# UÅ¼ytkownik z tÄ… rolÄ… zyska moÅ¼liwoÅ›Ä‡ edycji metadanych katalogowych
```

# ðŸ“Œ Å¹rÃ³dÅ‚a

- [https://docs.ataccama.com/](https://docs.ataccama.com/)
- [https://www.keycloak.org/docs/latest/server_admin/](https://www.keycloak.org/docs/latest/server_admin/)
- [https://learn.microsoft.com/en-us/entra/identity/role-based-access-control](https://learn.microsoft.com/en-us/entra/identity/role-based-access-control)

# ðŸ‘½ Brudnopis

- Rola = action bundle: zbiÃ³r uprawnieÅ„ â†’ okreÅ›la co uÅ¼ytkownik moÅ¼e robiÄ‡ i gdzie
- Role: lokalne / systemowe / dziedziczone z IAM (np. [[Keycloak]], Azure AD)
- DomyÅ›lne przypisanie visibility i editable: MMM_data-manager i wyÅ¼ej zaraz po dodaniu obiektÃ³w
- MoÅ¼na przesÅ‚aniaÄ‡ uprawnienia przez `Share` lub `Assign role` API
- Model skalowalny: user â†’ przynaleÅ¼noÅ›Ä‡ do grup/realmu â†’ przypisanie roli kontekstowej
- NarzÄ™dzia: Ataccama ONE, Collibra, Alation, Informatica â€“ wspierajÄ… kontekstowe RBAC/ABAC