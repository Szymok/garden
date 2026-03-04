---
title: Where Lean Comes From
created: 2026-02-12
status: 
category: 
difficulty: 
language: pl
tags:
  - 
aliases:
  - 
---
# 🎯 Definicja
Koncepcja **Lean** (szczupłe zarządzanie) wywodzi się z Japonii, z systemu produkcyjnego Toyoty (TPS). Jej fundamentem jest eliminacja marnotrawstwa poprzez umieszczenie człowieka i jego potencjału w centrum procesów przemysłowych.

# 🔑 Kluczowe punkty
- **Początki:** Sakichi Toyoda (XIX w.) obserwował swoją matkę przy krosnach i zauważył zbędne ruchy oraz powtarzalność, które można było zoptymalizować.
- **Podejście humanistyczne:** Fundamentem Lean jest uwalnianie potencjału ludzkiego poprzez usuwanie czynności, które nie dodają wartości.
- **Ewolucja:** Idee Sakichiego kontynuował jego syn Kiichiro, tworząc systemy, które stały się podstawą rewolucji przemysłowej w Japonii.

# 📚 Szczegółowe wyjaśnienie
Lean narodził się z analizy pracy manualnej (tkania), gdzie Sakichi Toyoda – uznawany za ojca japońskiej rewolucji przemysłowej – stworzył pierwsze automatyczne krosna parowe. Choć początkowo były one zawodne, przez dekady były udoskonalane, co doprowadziło do powstania giganta motoryzacyjnego.

W kontekście oprogramowania (Lean Software Development), zasady te przekładają się na szukanie marnotrawstwa w procesie tworzenia kodu, komunikacji i dostarczania wartości klientowi.

# 💡 Przykład zastosowania
- **Analiza ruchów jałowych:** Tak jak Sakichi widział zbędne ruchy przy krosnach, tak w IT szukamy zbędnych spotkań, zbyt długich procesów zatwierdzania (approval) czy przełączania kontekstu między zadaniami.
- **Automatyzacja:** Zastępowanie powtarzalnych, nudnych czynności (np. manualne testy regresji) skryptami, co uwalnia czas inżynierów na kreatywne rozwiązywanie problemów.
- **Centrum procesów:** Projektowanie systemów CI/CD tak, aby wspierały dewelopera, a nie stanowiły dla niego przeszkodę.

## 📌 Źródła

## 👽 Brudnopis
Let me say at the very top that I did an entire course on lean software development here. I love talking about lean. It's a topic with lots of good history and stories and revelations about human nature. So, while this is going to be a condensed version, if you find this as interesting as I do, please check out my extended course at the link. I'm also going to try to stick in some unique stuff here so that if you do decide to check it out, watching this stuff here won't be a waste of your time. What we're really talking about when we talk about lean is the contribution of a family, a specific set of parents and children and grandchildren. This contribution would be taken and run with in the context of emerging consensus about industrial processes and practices. But at the core, lean begins with the story of a boy and his mother. Sakichi Toyoda was a young boy living in Japan in the 19th century. For context, this was the period of the Old West in the United States, cowboys and gunfighters. Sakichi's father was a carpenter, and his mother helped support the family as a weaver. As a child, he would watch his mother work long hours moving the shuttle back and forth in the same motion over and over again. The boy was a genius. There were plenty of other Japanese children with a carpenter father and a weaver mother, but Sakichi saw the repetition and wasted motion in what his mother was doing. More importantly, by beginning this kind of industrial analysis on his mother, he placed the human being at the center of the analysis, identifying the fundamental problem to be solved as the liberation of the potential of the human being involved in the analysis. Toyoda placed these ideas into practice and created a series of steam‑powered automatic looms, earning him the moniker, The Father of the Japanese Industrial Revolution. Early models were unreliable and difficult to operate. But over the next 50 years or so, he and eventually his son Kiichiro perfected them until the business shifted from textile production to selling the machines themselves. Keiichiro toured Detroit and focused on engines, and the Toyota company produced its first automobile, the Toyota A1 in 1936. As a quick aside, you may notice that we've been spelling Toyoda with a d here rather than with the more familiar t spelling, Toyota. The characters for t and d in Japanese are very similar, but the t character requires two fewer strokes, eight strokes, which is a lucky number in East Asian cultures, the way that seven is lucky in Western cultures. Whether or not this story is true, changing the name of the company to use two fewer strokes is definitely the kind of story we'd like to believe about Toyota. In implementing lean software development, the authors lay out the situation for Toyota after World War II. The Allied Forces have crushed Japan in no small part because of their ability to mass produce war material. In the aftermath, Toyota cannot possibly compete with that model of mass production on an equal footing. Instead, the system would be designed so that parts would arrive just in time, a very Japanese focus on fine control rather than on raw power. This focus meant that rather than aiming for speed, the approach would strive to eliminate waste. A machine shop manager, Taichi Ono, would create what came to be known as the Toyota production system, a system, in his words, for the absolute elimination of waste. The system rested on two pillars, just‑in‑time and jidoka or autonomation. What jidoka means, beyond simple automation, is when the production product is outside of specification, the line stops immediately to correct the problem. The moment that this was realized, someone would pull a cord, which would light a lantern, signifying that there was a problem. The Japanese word for this kind of lantern is andon, and andon in lean is the idea that anyone could stop the line at any time to allow for correction in the process. In 1990, the book The Machine that Changed the World dubbed the Toyota production system and implementations of it elsewhere lean production. Taking the lessons of lean production and applying them to software, Mary and Tom Poppendieck published the book Implementing Lean Software Development in 2003. To forestall any confusion, this was done very much in the context of emerging agile practices with the Agile Manifesto having been released 2 years prior in 2001. Lean is agile, though not all agile is necessarily lean.