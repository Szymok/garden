---
title: Skalowanie modeli językowych dostosowanych do instrukcji
tags: 
aliases:
---
## Co nowego?
![[images/Pasted image 20231007165150.png]]

Niniejszy artykuł analizuje korzyści płynące ze skalowania dostrajania instrukcji oraz sposób, w jaki poprawia ono wydajność w różnych modelach (PaLM, T5), konfiguracjach podpowiedzi (zero-shot, few-shot, CoT) i benchmarkach (MMLU, TyDiQA). Zostało to zbadane w następujących aspektach: skalowanie liczby zadań (1,8 tys. zadań), skalowanie rozmiaru modelu i dostrajanie na danych łańcucha myśli (wykorzystano 9 zestawów danych).

Procedura dostrajania:

- 1,8 tys. zadań zostało sformułowanych jako instrukcje i wykorzystanych do dostrojenia modelu
- Użyto zarówno z przykładami, jak i bez nich, a także z CoT i bez niego.
Zadania dostrajające i zadania wstrzymane pokazano poniżej:

![[images/Pasted image 20231007165850.png]]

## Możliwości i kluczowe wyniki

- Dostrajanie instrukcji dobrze skaluje się z liczbą zadań i rozmiarem modelu; sugeruje to potrzebę dalszego skalowania liczby zadań i rozmiaru modelu
- Dodanie zbiorów danych CoT do dostrajania zapewnia dobrą wydajność w zadaniach rozumowania.
- Flan-PaLM poprawił zdolności wielojęzyczne; 14,9% poprawy w przypadku jednorazowego TyDiQA; 8,1% poprawy w przypadku rozumowania arytmetycznego w niedostatecznie reprezentowanych językach.
- Plan-PaLM osiąga również dobre wyniki w generowaniu pytań otwartych, co jest dobrym wskaźnikiem poprawy użyteczności.
- Poprawia wydajność w benchmarkach odpowiedzialnej sztucznej inteligencji (RAI)
- Modele Flan-T5 z dostrojonymi instrukcjami wykazują silne możliwości kilkukrotnego wykonania i przewyższają publiczny punkt kontrolny, taki jak T5.

**Wyniki skalowania liczby zadań dostrajania i rozmiaru modelu:** Oczekuje się, że skalowanie zarówno rozmiaru modelu, jak i liczby zadań dostrajania będzie nadal poprawiać wydajność, chociaż skalowanie liczby zadań przyniosło mniejsze zyski.

![[images/Pasted image 20231007165923.png]]

Wyniki podczas dostrajania przy użyciu danych innych niż CoT i CoT: Wspólne dostrajanie na danych non-CoT i CoT poprawia wydajność w obu ocenach, w porównaniu do dostrajania tylko na jednym lub drugim.

![[images/Pasted image 20231007165935.png]]

Ponadto, samokonsekwencja w połączeniu z CoT osiąga wyniki SoTA w kilku benchmarkach. CoT + self-consistency również znacząco poprawia wyniki w benchmarkach obejmujących problemy matematyczne (np. MGSM, GSM8K).

![[images/Pasted image 20231007165944.png]]

Finetuning CoT odblokowuje rozumowanie typu zero-shot, aktywowane przez frazę "pomyślmy krok po kroku", w zadaniach BIG-Bench. Ogólnie rzecz biorąc, zero-shot CoT Flan-PaLM przewyższa zero-shot CoT PaLM bez dostrajania.

![[images/Pasted image 20231007165955.png]]

Poniżej znajduje się kilka demonstracji Zero-Shot CoT dla PaLM i Flan-PaLM w niewidocznych zadaniach.

![[images/Pasted image 20231007170005.png]]Poniżej znajduje się więcej przykładów dla podpowiedzi zero-shot. Pokazuje to, jak model PaLM zmaga się z powtórzeniami i nie odpowiada na instrukcje w ustawieniu zerowym, w którym Flan-PaLM jest w stanie dobrze sobie radzić. Kilka przykładów może złagodzić te błędy.

![[images/Pasted image 20231007170014.png]]

Poniżej znajduje się kilka przykładów demonstrujących więcej możliwości modelu Flan-PALM na kilku różnych typach trudnych pytań otwartych:

![[images/Pasted image 20231007170025.png]]![[images/Pasted image 20231007170029.png]]![[images/Pasted image 20231007170032.png]]

