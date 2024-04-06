---
title: "Apache Airflow"
tags:
- inżynieria danych
---

[Airflow](https://airflow.apache.org/) to [orkiestrator danych](notes/orkiestrator%20danych.md) i pierwszy, który uczynił harmonogramowanie zadań popularnym w środowisku [Python](notes/python.md). Pierwotnie został stworzony przez [Maxime'a Beauchemina](notes/maxime%20beauchemin.md), pracującego w Airbnb.

Airflow umożliwia programowe tworzenie, harmonogramowanie i monitorowanie przepływów pracy (workflows). Podąża za paradygmatem imperatywnym, gdzie *jak* DAG (Direct Acyclic Graph - skierowany graf acykliczny) jest uruchamiany, musi być zdefiniowane wewnątrz zadań Airflow. Airflow nazywa to podejście "Workflow as code" i ma główne cechy:
- **Dynamiczny**: Potoki danych w Airflow są konfigurowane jako kod Python, co pozwala na dynamiczną generację potoków danych.
- **Rozszerzalny**: Framework Airflow zawiera operatory, które łączą się z wieloma technologiami. Wszystkie komponenty Airflow są rozszerzalne, dzięki czemu łatwo dostosujesz je do swojego środowiska.
- **Elastyczny**: Parametryzacja przepływów pracy jest wbudowana, korzystając z silnika [Jinja Templating](notes/template%20jinja.md).