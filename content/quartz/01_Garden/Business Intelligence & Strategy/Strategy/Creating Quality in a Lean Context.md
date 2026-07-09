---
title: Creating Quality in a Lean Context
created: 2026-02-19
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
**Tworzenie Jakości w kontekście Lean** to podejście do zarządzania projektami i procesami (w tym DevOps), które skupia się na praktycznym redukowaniu marnotrawstwa i szacunku do ludzi, wykorzystując analityczne metody poprawy efektywności.

# 🔑 Kluczowe punkty
- **Analiza Pareto (80/20):** 80% problemów (defektów) wynika z 20% przyczyn. Największy zysk z wdrożenia DevOps daje skupienie się na tym wąskim gardle.
- **"Złe dzielnice" kodu:** Większość błędów w systemie zazwyczaj pochodzi z jednego, konkretnego obszaru kodu, którego wszyscy boją się modyfikować (fear-driven development). To tam należy zacząć poprawę jakości.
- **Szacunek do ludzi jako priorytet:** Jeśli programista nie może debugować kodu lokalnie, jego praca jest wolna i frustrująca. Poprawa narzędzi pracy to forma szacunku i sposób na jakość.

# 📚 Szczegółowe wyjaśnienie
Wdrażanie jakości w Lean nie polega na dodawaniu skomplikowanych procedur, ale na ułatwianiu pracy. Przykładem marnotrawstwa i braku szacunku jest sytuacja, w której wdraża się zaawansowaną automatyzację wdrożeń (deployment automation), podczas gdy deweloperzy wciąż zmagają się z podstawowymi problemami, jak brak możliwości uruchomienia środowiska na własnym komputerze.

Jakość wynika z empatii wobec użytkowników systemu – zarówno końcowych klientów, jak i współpracowników (np. inżynierów wsparcia). Dostarczenie im narzędzi "pierwszej klasy" do rozwiązywania problemów przekłada się na lepszą jakość całego produktu.

# 💡 Przykład zastosowania
- **Priorytetyzacja zgłoszeń od Supportu:** Traktowanie uwag inżynierów wsparcia dotyczących interfejsu administracyjnego jako priorytetu. Dzięki temu szybciej i lepiej obsługują oni klientów.
- **Optymalizacja środowiska lokalnego:** Skupienie wysiłków na tym, aby każdy deweloper mógł łatwo i szybko uruchomić oraz debugować aplikację u siebie, co drastycznie zmniejsza liczbę błędów trafiających do repozytorium.
- **Refaktoryzacja "trudnych" modułów:** Identyfikacja najbardziej awaryjnego modułu w systemie i poświęcenie czasu na jego uporządkowanie, zamiast ciągłego "łatania" go na szybko.

## 📌 Źródła

## 👽 Brudnopis

I want to take a beat here and acknowledge that in our brevity in covering these topics, I've left out application. How do we practically reduce waste and practically respect people in a DevOps context? Don't worry about that for now. We're literally going to take the rest of the course in understanding that. But I do want to give you kind of what my processes when I meet a company for the first time in implementing DevOps. A big part of lean, and any kind of same management, is Pareto analysis, also known as 80/20 analysis. Put simply, the Pareto principle says that 80% of the consequences come from 20% of the causes. The biggest bang for the buck that a DevOps implementation can deliver is reducing the defect rate. And in my experience, the Pareto principle applies deeply to code, that most of your problems come from what I call a bad neighborhood in code. The place that, when it comes up in conversation, everybody says man, you don't want to go there. And that's where you need to go, fear‑driven development and all and if you want to knock out those defects on a Pareto‑principle basis. In the absence of something as easily measurable as defect rate, we can look to more human measures. I worked at a place that had me doing all kinds of deployment automation, automated source scanning, and a bunch of crazy cool stuff, all while no developer could debug locally. This made development slow, error‑prone, and, above all, miserable. If we were employing the respect people principle as a priority, we would have made it so that people could more effectively get their work done. That's a programmer example, but this applies equally well to other roles. At another company, I always made complaints that the support engineers made about the admin interface to an application I managed a top priority. And as a consequence, they ended up with first‑class tools to take care of our customers with problems. One of the effects of having been a programmer for many years is that I look for similarity in processes and tools and see those things as opportunities for merging, combining, and creating interoperability. Rather than having a dozen different software builds, which are only different because of minor changes in where the code is organized and how it's named, let's make a few minor commits to reorganize things and use one true build that can be parameterized to accommodate slight changes. Let's get our support engineers cross‑trained on performing that import so that we can avoid handoffs when someone goes out the door, even if it's only on vacation. And above all, if we do something twice, when the time comes to do it a third time, let's take a little longer and automate it instead.