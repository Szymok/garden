---
title: Warstwa Miar
tags:
  - inżynieria
  - danych
aliases:
  - Sklep Miary
---
> [!info] Podobieństwa do Warstwy Semantycznej
> 
> Warstwa miary stanowi jeden z komponentów [Warstwy Semantycznej](notes/warstwa%20semantyczna.md). Zazwyczaj w narzędziach [BI](notes/narz%C4%99dzie%20business%20intelligence.md) jest zaimplementowana ograniczona warstwa miary, tłumacząca miary na to konkretne narzędzie BI.

Warstwa miary, czasami nazywana również sklepem miary, zawiera specyfikację miar, takich jak [mierniki](notes/miara.md) i [wymiary](notes/wymiary.md). Dodatkowo może zawierać analizę modelu z plików (głównie [YAML](notes/yaml.md)) oraz interfejsy API do tworzenia i wykonywania logiki miary; niektóre zawierają warstwę pamięci podręcznej. Warstwa miary zachęca nas do stosowania zasady [DRY](https://en.wikipedia.org/wiki/Don%27t_repeat_yourself) (Nie powtarzaj się), definiując miary raz, przed wypełnieniem ich do dowolnych narzędzi BI, które są używane lub zintegrowaniem ich z wewnętrznymi aplikacjami lub procesami.

Dowiedz się więcej na temat [Warstwy Semantycznej](notes/warstwa%20semantyczna.md) lub [Wzrost Warstwy Semantycznej](https://airbyte.com/blog/the-rise-of-the-semantic-layer-metrics-on-the-fly).
