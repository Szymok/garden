---
title: Create Knowledge
created: 2026-02-13
status: 🌱 draft
category: 
difficulty: 
language: pl
tags:
  - 
aliases:
  - 
---
# ðŸŽ¯ Definicja
**Tworzenie Wiedzy** (Create Knowledge) to zasada Lean polegajÄ…ca na systematycznym budowaniu pewnoÅ›ci co do poprawnoÅ›ci i jakoÅ›ci tworzonego oprogramowania. Wiedza ta nie jest tylko opiniÄ…, ale udokumentowanym faktem potwierdzonym przez dowody (np. testy automatyczne).

# ðŸ”‘ Kluczowe punkty
- **WartoÅ›Ä‡ PewnoÅ›ci:** CzÄ™sto niedoceniana w technologii. Twierdzenie "ten kod dziaÅ‚a" rÃ³Å¼ni siÄ™ od "jest pewne, Å¼e ten kod dziaÅ‚a". To drugie to wiedza o wiedzy.
- **Minimalizacja roli czÅ‚owieka w testach:** Testowanie manualne jest ograniczone â€“ po kaÅ¼dej naprawie bÅ‚Ä™du tester musi zaczynaÄ‡ od nowa. Automatyzacja pozwala utrzymaÄ‡ wiedzÄ™ o poprawnoÅ›ci kodu przy kaÅ¼dym uruchomieniu.
- **Akumulacja dowodÃ³w:** WiedzÄ™ o gotowoÅ›ci wydania (release) buduje siÄ™ poprzez sumÄ™ dowodÃ³w: testy automatyczne, code review, udane buildy, testy obciÄ…Å¼eniowe.

# ðŸ“š SzczegÃ³Å‚owe wyjaÅ›nienie
Tworzenie oprogramowania jest przewidywalnie nieprzewidywalne. Kultura wielu organizacji ma trudnoÅ›Ä‡ z zaakceptowaniem faktu, Å¼e niespodzianki i bÅ‚Ä™dy sÄ… nieuniknione. Zamiast udawaÄ‡, Å¼e wszystko jest pod kontrolÄ…, naleÅ¼y tworzyÄ‡ systemy, ktÃ³re generujÄ… wiedzÄ™ o stanie faktycznym.

W inÅ¼ynierii mechanicznej (np. budowie mostu) test obciÄ…Å¼enia 100 kg i 200 kg pozwala zaÅ‚oÅ¼yÄ‡, Å¼e 150 kg teÅ¼ zadziaÅ‚a. W oprogramowaniu tak nie jest â€“ bÅ‚Ä…d moÅ¼e wystÄ…piÄ‡ w dowolnym, odizolowanym punkcie. Dlatego tworzenie wiedzy poprzez testy musi byÄ‡ ciÄ…gÅ‚e i powtarzalne.

# ðŸ’¡ PrzykÅ‚ad zastosowania
- **Automatyzacja testÃ³w:** Zamiast polegaÄ‡ na pamiÄ™ci programisty, testy jednostkowe i integracyjne "zapisujÄ…" wiedzÄ™ o tym, jak system powinien siÄ™ zachowywaÄ‡.
- **Proces Pull Request:** WymÃ³g pomyÅ›lnego buildu i testÃ³w przed mergem to mechanizm tworzenia wiedzy o jakoÅ›ci nowej funkcji.
- **Monitoring i Logowanie:** Zbieranie danych z produkcji pozwala tworzyÄ‡ wiedzÄ™ o tym, jak uÅ¼ytkownicy faktycznie korzystajÄ… z systemu i gdzie wystÄ™pujÄ… bÅ‚Ä™dy.

## ðŸ“Œ Å¹rÃ³dÅ‚a

## ðŸ‘½ Brudnopis

Here's the big principle I mentioned earlier. In science and technology, we grossly underestimate the value of certainty. Certainty is knowledge about knowledge, that the sky is blue and it is certain that it is true are two separate propositions that have to be evaluated independently. Likewise, the statements this code behaves correctly and it is certain that this is true, like I said, we can create knowledge with automated testing and keep it true with repeated execution of those tests. Now, let's zoom out to the release level, which we'll say is composed of a bunch of these code changes. We've got our two statements, again, the release is ready and it is certain that this is true. We can create the knowledge that the second statement constitutes by accumulating evidence, the strongest of which is probably that the sum of all relevant automated tests are executing correctly. Other evidence we might have is a set of completed code reviews as part of our pull request process, successful builds, load testing, and other stuff we'll talk about. One of the things you learn with software early on hopefully is the very limited nature of human testing for most kinds of defects. The problem here is not the human part of the equation like you might think, but the nature of software. Someone once said the difference between mechanical engineering and software engineering was that if you tested Â£100 on a bridge and then you tested Â£200, you could reasonably assume that 150 would work. Not so with software. So when your human tester finds a defect and you fix it, the tester has to start all over again. So as a practical matter, you must strive to minimize the human role in your testing. This is one aspect of creating knowledge. Software development is predictably unpredictable. We shouldn't be surprised to find that eventually we are surprised. This is a reality, which is so painful and difficult for many organizational cultures to accept that you often see a tacit agreement to pretend to be surprised when supposedly frozen schedules and feature sets go awry. This can happen over and over again with management each time telling the team to try and do better next time with everyone pretending that next time will be any different. Another overarching principle for all this stuff. DevOps, Lean, and Agile in the broad sense are all just systems to force you to stop pretending that you know more than you really do. The healthy lean DevOps response to this is to embrace this uncertainty. One of the most ridiculous criticisms I've heard of the Agile Manifesto over the years is that it's utopian. That's the last thing it is. Agile has been created by us bitter, cynical developers who had our heart broken by big topâ€‘down plans and schedules time after time. What we know that management and the inexperienced developers don't is that the knowledge necessary to create the schedule and feature set only comes into existence when the project is somewhere around threeâ€‘quarters done. And the traditional planning mindset says ah, you just need to create that knowledge upfront, and it's just not possible. Software is research full stop, or else it should be entirely automated. The fact that it isn't shows us that there's missing knowledge that needs to be created. Software research is a wicked problem, a term which means the problem cannot be wholly defined until it is at least partially attempted. So, in lean and in DevOps, we need to adopt, and here comes a big phrase, epistemic humility. We need to accept at the outset that the quality of our knowledge is poor and plan for that low quality of knowledge. If we accept the limitations of our knowledge, we won't just do things differently. We'll do different things, which leads us directly into the next lean principle.