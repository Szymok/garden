---

title: YAML  
created: 2025-07-16  
status: Final  
category: Format danych  
difficulty: podstawowy  
language: pl  
tags:

- "YAML"
- "DataSerialization"
- "ConfigFiles"  
aliases:
- yaml format
- plik konfiguracyjny yaml
- yaml syntax

---

# 🎯 Definicja

**YAML** (YAML Ain’t Markup Language) to lekki, czytelny dla człowieka format serializacji danych, powszechnie używany do tworzenia plików konfiguracyjnych, definicji zasobów oraz wymiany danych pomiędzy systemami. Opiera się na **wcięciach**, a nie nawiasach i kropkach, dzięki czemu jest bardziej przejrzysty niż formaty takie jak JSON czy XML.

# 🔑 Kluczowe punkty

- YAML używa **wcięć nadrzędności**, a nie nawiasów (jak JSON)
- Jest używany w wielu środowiskach: DevOps (Kubernetes), CI/CD (GitHub Actions), dane meta (Hugo/Quartz), Infrastructure as Code (Ansible, Terraform)
- Zapisywany w plikach `.yaml` lub `.yml`
- Obsługuje typy danych: liczby, teksty, listy, słowniki, wartości logiczne, null
- Delikatny na błędy formatowania – każde wcięcie ma znaczenie

# 📚 Szczegółowe wyjaśnienie

## Podstawowa składnia

```yaml
imię: Jan
wiek: 32
czy_aktywny: true
ulubione_kolory:
  - niebieski
  - zielony
adres:
  ulica: Długa 12
  miasto: Kraków
```

- **Lista** – wypunktowana przez znak `-`
- **Słownik (mapa)** – pary klucz: wartość
- **Zagnieżdżenie** – poprzez odpowiednią liczbę **wcięć (spacje)**

## Różnice vs JSON:

|Cecha|YAML|JSON|
|---|---|---|
|Czytelność ludzi|Bardzo dobra|Umiarkowana|
|Zagnieżdżenia|Spacje i linie|Nawiasy `{}` i `[]`|
|Komentarze|Tak (`# komentarz`)|Nie|
|Format|Wolny od typów linijek|Bardziej formalny|

## Typowe zastosowania

- **CI/CD**: `.github/workflows/*.yaml`, GitLab CI
- **K8s**: definicje podów, deploymentów
- **Dane meta**: FrontMatter w Hugo, Quartz
- **IaC**: Ansible (playbooki), CloudFormation (AWS)

# 💡 Przykład zastosowania

Kubernetes deployment:

```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: moj-service
spec:
  replicas: 3
  selector:
    matchLabels:
      app: moj-service
  template:
    metadata:
      labels:
        app: moj-service
    spec:
      containers:
      - name: kontener-app
        image: myorg/app:1.0
        ports:
        - containerPort: 80
```

# 📌 Źródła

- [https://yaml.org/](https://yaml.org/)
- [https://learnxinyminutes.com/docs/yaml/](https://learnxinyminutes.com/docs/yaml/)
- [https://dev.to/petermbenjamin/how-to-yaml-basics-3p6i](https://dev.to/petermbenjamin/how-to-yaml-basics-3p6i)
- Kubernetes YAML Reference: [https://kubernetes.io/docs/reference/kubernetes-api/](https://kubernetes.io/docs/reference/kubernetes-api/)

## 👽 Brudnopis

- YAML: indentation-based, human-friendly
- błędy najczęściej: brak wcięcia, tab zamiast spacji, przecinki z JSON
- .yml == .yaml – oba formaty dozwolone
- Parsing YAML: w Python — PyYAML, ruamel.yaml
- 2 spacje zamiast tab – must
- YAML ≠ standard ściśle określony – istnieją różnice implementacyjne (np. w Ansible vs Kubernetes vs Hugo)

---