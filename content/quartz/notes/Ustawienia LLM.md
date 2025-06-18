---
title: Ustawienia LLM
tags:
  - prompt
  - AI
  - Sztuczna-Inteligencja
  - prompt-techniques
  - llm
aliases:
  - large language models
---
Podczas pracy z promptami interakcja z [LLM](LLM) odbywa się za pośrednictwem interfejsu [API](API) lub bezpośrednio. Można skonfigurować kilka parametrów, aby uzyskać różne wyniki dla promptów.

Temperatura - w skrócie, im niższa temperatura, tym bardziej deterministyczne wyniki w tym sensie, że zawsze wybierany jest najbardziej prawdopodobny następny token. Zwiększenie temperatury może prowadzić do większej losowości, co zachęca do bardziej zróżnicowanych lub kreatywnych wyników. Zasadniczo zwiększasz wagę innych możliwych tokenów. Jeśli chodzi o zastosowanie, możesz chcieć użyć niższej wartości temperatury w zadaniach takich jak kontrola jakości oparta na faktach, aby zachęcić do bardziej rzeczowych i zwięzłych odpowiedzi. W przypadku generowania wierszy lub innych kreatywnych zadań korzystne może być zwiększenie wartości temperatury.

Top_p - Podobnie, z top_p, techniką próbkowania z temperaturą zwaną próbkowaniem jądra, można kontrolować, jak deterministyczny jest model w generowaniu odpowiedzi. Jeśli szukasz dokładnych i rzeczowych odpowiedzi, utrzymuj tę wartość na niskim poziomie. Jeśli szukasz bardziej zróżnicowanych odpowiedzi, zwiększ tę wartość.

Ogólnym zaleceniem jest zmiana jednej wartości, a nie obu.

Zanim zaczniesz od kilku podstawowych przykładów, pamiętaj, że wyniki mogą się różnić w zależności od używanej wersji LLM.