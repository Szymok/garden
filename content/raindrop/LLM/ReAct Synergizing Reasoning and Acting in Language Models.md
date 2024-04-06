---
raindrop_id: 677262010

---

# Metadata
Source URL:: https://react-lm.github.io/
Topics:: #react, #prompt

---
# ReAct: Synergizing Reasoning and Acting in Language Models



## Highlights
## Note

Oto podsumowanie strony:

- **ReAct: Interleaved Reasoning and Acting with Language Models** - to tytuł artykułu naukowego, który bada możliwość łączenia zdolności rozumowania i działania przez duże modele językowe (LLMs) w różnych zadaniach związanych z językiem i podejmowaniem decyzji.
- **ReAct prompting** - to metoda, która polega na generowaniu śladów rozumowania i akcji specyficznych dla zadania w sposób przeplatający, co pozwala na większą synergia między nimi: ślady rozumowania pomagają modelowi wyznaczać, śledzić i aktualizować plany działania oraz radzić sobie z wyjątkami, a akcje pozwalają mu komunikować się z zewnętrznymi źródłami, takimi jak bazy wiedzy lub środowiska, aby zbierać dodatkowe informacje.
- **Zastosowania i wyniki** - autorzy stosują swoje podejście, nazwane ReAct, do różnorodnego zestawu zadań związanych z językiem i podejmowaniem decyzji i wykazują jego skuteczność w porównaniu z najnowocześniejszymi metodami, a także poprawioną interpretowalność i wiarygodność ludzką w porównaniu z metodami bez składników rozumowania lub działania. Konkretnie, na zadaniach odpowiadania na pytania (HotpotQA) i weryfikacji faktów (Fever), ReAct pokonuje problemy z halucynacją i propagacją błędów, które są powszechne w rozumowaniu łańcuchowym, poprzez interakcję z prostym API Wikipedii, i generuje ludzkie trajektorie rozwiązywania zadań, które są bardziej interpretowalne niż metody bez śladów rozumowania. Na dwóch zadaniach interaktywnego podejmowania decyzji (ALFWorld i WebShop), ReAct przewyższa metody naśladowania i uczenia ze wzmocnieniem o absolutną skuteczność 34% i 10% odpowiednio, będąc podpowiadany tylko jednym lub dwoma przykładami w kontekście.
- **Ograniczenia i kierunki rozwoju** - autorzy zauważają, że podpowiadanie ma ograniczoną okienko kontekstowe i wsparcie uczenia się. Wstępne wyniki dostosowywania na HotpotQA przy użyciu trajektorii podpowiadania ReAct sugerują, że ReAct jest najlepszym formatem dostosowywania wśród różnych rozmiarów modeli, a mniejsze modele dostosowane do ReAct przewyższają większe modele podpowiadane. Autorzy wskazują również na możliwość wykorzystania ReAct do łatwiejszej inspekcji i korekty zachowań ludzkich przez zmianę kilku myśli modelu, co stanowi nowatorskie podejście do zgodności ludzkiej.