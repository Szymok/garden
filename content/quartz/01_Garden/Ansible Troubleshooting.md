---
title: Ansible Troubleshooting (Rozwiązywanie Problemów)
created: 2026-02-10
status: evergreen
category: DevOps / Ansible
difficulty: intermediate
language: pl
tags:
  - ansible
  - debugging
  - lint
  - syntax-check
aliases:
  - Debugowanie Ansible
  - Ansible Errors
---
# 🎯 Definicja
**Troubleshooting** w Ansible to proces znajdowania, dlaczego Playbook nie działa.
Najczęściej to błędy YAML (wcięcie), literówki w nazwach modułów lub brak uprawnień.

# 🔑 Kluczowe punkty
- **Czytaj błędy:** Ansible zazwyczaj mówi wprost: "Syntax Error at line 10".
- **`--syntax-check`:** Szybki test przed uruchomieniem.
- **`-v` (Verbosity):** Dodaj `-v`, `-vv`, `-vvv`, żeby widzieć, co dzieje się pod maską.
- **`debug` module:** Odpowiednik `print()` w Pythonie. Wypisuje wartości zmiennych w trakcie działania.

# 📚 Szczegółowe wyjaśnienie
1.  **Syntax Check:**
    `ansible-playbook playbook.yml --syntax-check`
2.  **Dry Run (Check Mode):**
    `ansible-playbook playbook.yml --check` (Pokazuje, co BY sią stało, ale nic nie zmienia).
3.  **Ansible Lint:**
    Narzędzie `ansible-lint playbook.yml` sprawdza dobre praktyki (np. "Nie używaj shell, jeśli istnieje moduł command").

# 💡 Przykład zastosowania
Błąd: "Permission denied".
Diagnoza: Uruchom z `-v`. Widzisz, że Ansible próbuje pisać do `/etc/` jako zwykły user.
Naprawa: Dodaj `become: true` do zadania.

## 📌 Źródła
- Ansible Documentation - Troubleshooting.

## 👽 Brudnopis
- Błędy wcięć w YAML to 90% problemów początkujących. Używaj edytora z obsługą YAML (VS Code, Vim z pluginem).
