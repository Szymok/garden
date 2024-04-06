---
title: "Informacje ogólne (Struktura folderów, Linki)"
tags:
- pomoc
weight: -9
---
[Quartz](https://quartz.jzhao.xyz) działa na platformie [Hugo](https://gohugo.io/), więc wszystkie notatki są pisane w formacie [Markdown](https://www.markdownguide.org/getting-started/) i mogą być edytowane przez dowolny edytor.

## Struktura Folderów
Zawartość Słownika znajduje się w folderze `content/term`. Reszta poza `content/` to strona internetowa/framework.

Aby edytować główną stronę główną, otwórz plik `/content/_index.md`.
## Linki
Aby stworzyć link między terminami w słowniku, po prostu utwórz normalny link za pomocą składni Markdown, wskazujący na odpowiedni dokument. Proszę zauważyć, że **wszystkie linki powinny być względne do ścieżki głównego folderu `/content`**.
```markdown
Na przykład, chcę stworzyć link w tym bieżącym dokumencie do `notes/config.md`.
[Link do strony konfiguracyjnej](notes/config.md)
  
Podobnie, lokalne obrazy można umieścić w dowolnym miejscu w folderze `/content`.
```

Podobnie, lokalne obrazy można umieścić w dowolnym miejscu w folderze `/content`.

Przykład obrazu (źródło znajduje się w content/images/example.png)
![Przykładowy Obraz](/content/images/example.png)
## Małe Litery

Terminy są pisane małymi literami, a linki również są małymi literami. Kiedy tworzymy link do terminu, zazwyczaj kapitalizuję początek każdego słowa, aby wyglądało to estetycznie. Na przykład `[Apache Arrow](notes/apache%20arrow.md)`. Inne, takie jak YAML, piszę wielkimi literami.

Nie aktywowaliśmy wikilinks, ale to również byłoby możliwe. Zobacz więcej na temat [edytowania](https://quartz.jzhao.xyz/notes/editing/).

## Metatag z Front Matter

Hugo jest wymagający, jeśli chodzi o metadane plików. Upewnij się, że tytuł jest w cudzysłowiu i masz zdefiniowany tytuł na górze swojego pliku, jak poniżej. Możesz również tutaj dodać tagi.

``` yaml
---
title: "Co to jest Słownik?"
tags:
- przykładowy-tag
- tutaj mogę dodać więcej, zachowując małe litery
url: "notes/moja-inna-domena"
aliases:
- Ogród Cyfrowy
- Drugi Mózg
---

Reszta treści tutaj.
```


- `url`: nie jest potrzebny, tylko jeśli domyślny link (nazwa notatki) nie jest wystarczający.
	- wszystkie spacje zostaną zastąpione przez `-` (myślnik).
- `aliases`: Są jak tagi, można dodać wiele i będą one linkowalne tak samo jak dodanie nowego terminu.




