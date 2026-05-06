---
title: Build Quality In
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
**Build Quality In** (Wbudowywanie JakoÅ›ci) to zasada wywodzÄ…ca siÄ™ z Lean i Toyota Production System (TPS), ktÃ³ra polega na zapobieganiu bÅ‚Ä™dom na etapie ich powstawania, zamiast wykrywania ich po zakoÅ„czeniu procesu. Celem jest sprawienie, aby proces byÅ‚ odporny na bÅ‚Ä™dy (poka-yoke).

# ðŸ”‘ Kluczowe punkty
- **Zapobieganie vs Wykrywanie:** Inspekcja majÄ…ca na celu znalezienie bÅ‚Ä™dÃ³w odbywa siÄ™ *po* procesie. Inspekcja majÄ…ca na celu zapobieganie odbywa siÄ™ *w trakcie* lub *przed* procesem.
- **Poka-yoke (Error Avoidance):** JapoÅ„ski termin oznaczajÄ…cy unikanie bÅ‚Ä™dÃ³w poprzez odpowiednie projektowanie systemÃ³w i narzÄ™dzi.
- **OdpowiedzialnoÅ›Ä‡:** JakoÅ›Ä‡ jest wbudowana w kaÅ¼dÄ… czynnoÅ›Ä‡, a nie dodawana jako osobny etap kontroli na koÅ„cu linii produkcyjnej.

# ðŸ“š SzczegÃ³Å‚owe wyjaÅ›nienie
Wbudowywanie jakoÅ›ci zmienia podejÅ›cie do bÅ‚Ä™dÃ³w. Zamiast liczyÄ‡ na to, Å¼e kontrola jakoÅ›ci (QA) wyÅ‚apie usterki przed wysyÅ‚kÄ… do klienta, staramy siÄ™ zaprojektowaÄ‡ system tak, aby bÅ‚Ä…d byÅ‚ fizycznie lub logicznie niemoÅ¼liwy do popeÅ‚nienia.

PrzykÅ‚adem z Å¼ycia codziennego jest wtyczka USB, ktÃ³rej nie da siÄ™ wÅ‚oÅ¼yÄ‡ odwrotnie, czy bezpieczniki rÃ³Å¼nicowoprÄ…dowe (GFCI), ktÃ³re chroniÄ… przed poraÅ¼eniem. W oprogramowaniu brak walidacji formularza w czasie rzeczywistym jest dziÅ› postrzegany jako bÅ‚Ä…d sam w sobie, poniewaÅ¼ standardem staÅ‚o siÄ™ zapobieganie bÅ‚Ä™dnemu wypeÅ‚nieniu pÃ³l juÅ¼ na etapie wprowadzania danych.

# ðŸ’¡ PrzykÅ‚ad zastosowania
- **UI/UX:** Maski wprowadzania danych (np. tylko cyfry w polu numeru telefonu), listy rozwijane zamiast pÃ³l tekstowych tam, gdzie to moÅ¼liwe.
- **DevOps/Security:** Zasada najmniejszych uprawnieÅ„ (**Principle of Least Privilege**). UÅ¼ytkownik ma tylko takie uprawnienia, jakich potrzebuje. DziÄ™ki temu nie moÅ¼e przypadkowo wykonaÄ‡ operacji, do ktÃ³rej nie powinien mieÄ‡ dostÄ™pu â€“ system "wbudowaÅ‚" tÄ™ barierÄ™, zapobiegajÄ…c pomyÅ‚ce.
- **Testy automatyczne:** Integracja testÃ³w jednostkowych bezpoÅ›rednio w cyklu budowania aplikacji, co zapobiega przejÅ›ciu bÅ‚Ä™dnego kodu do dalszych etapÃ³w.

## ðŸ“Œ Å¹rÃ³dÅ‚a

## ðŸ‘½ Brudnopis

There are two types of inspection, inspection to find defects and inspection to prevent defects. Finding defects means inspection after the process. Preventing defects means inspection during or even before the process. It's unusual now, but I'm old enough to remember when you fill out an entire form online, submit it, and then see an explanation of errors that could have been caught easily while I was filling out the form. This form of defect prevention is so common and baked into our user interface expectations that when it's absent, we look at it as a defect itself. This practice of inspecting to prevent defects is called pokaâ€‘yoke in the TPS system, which is Japanese for error avoidance. Pokaâ€‘yoke has taken a hold greatly in UI, like I said. Selecting your location from a dropâ€‘down or having your input mask to numbers only for certain fields are familiar examples. But pokaâ€‘yoke is present in 1,000 different ways in our daily lives that we only know about if we look for them. Chances are and, for gosh sake, don't test this out. But chances are that if you stick a fork into your power outlet in the kitchen or bathroom, a device called a ground fault circuit interrupter will break the circuit and maybe save your life. If you have a car with a manual transmission, you'll need to press in the clutch to start the car to keep from sending the car hurtling forward when you start the engine if you left it in gear. Less dramatically, I cannot plug in a USB device wrong. The connector will not seat unless I orient the plug in the right way. The quickest example I can come up with for how this applies to DevOps is the principle of least privilege in security. This is the idea that a user should have exactly the permissions needed to do their work and nothing more. This is usually pursued from a perspective of preventing malicious behavior, but it is just as useful in preventing error. The mistake that requires permission I don't have is a mistake I can never think. And to flip that idea around, if I have permission to do something I shouldn't be able to do, there's a good chance I don't really understand what the implications of that permissions are. Another example is blocking anyone from committing directly to a deployment branch. You can organize your system so that no individual user can commit to a branch which leads to deployment and that their code can only reach that branch by process of an approved pull request. Then, you can organize code inspections, automated testing, and a merge build to detect whether that new code will cause problems. And most fundamentally, as a programmer, having your IDE constantly check whether your code will compile can save you tremendous time and headaches, especially if you're not in a position to compile locally. When a programmer writes a piece of code, that code has premises and propositions tied up in it that can be difficult to untangle after the fact, even by the same programmer. By shifting the focus to writing the test code first, by identifying those premises and propositions, we are building quality into the code. The value of this test is great in preventing a defect in the first place, but its value in preventing defects from creeping in later is even greater.