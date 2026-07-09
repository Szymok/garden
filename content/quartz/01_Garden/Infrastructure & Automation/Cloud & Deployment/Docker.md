---
title: Docker
created: 2026-05-06
status: 🌱 draft
category: DevOps
difficulty: średni
language: pl
tags:
  - docker
  - konteneryzacja
  - devops
  - deployment
  - infrastruktura
aliases:
  - Konteneryzacja
  - Container
---

# 🎯 Definicja

**Docker** to platforma konteneryzacji, która pakuje aplikację wraz ze wszystkimi jej zależnościami (biblioteki, runtime, konfiguracja) w izolowany, przenośny **kontener** — działający identycznie na laptopie dewelopera, serwerze testowym i produkcji.

# 🔑 Kluczowe punkty

- **Kontener ≠ VM**: kontener współdzieli kernel OS, jest lżejszy i szybszy niż wirtualna maszyna
- **Image**: niezmenny szablon kontenera (read-only), zbudowany z `Dockerfile`
- **Docker Hub**: publiczny rejestr obrazów (jak npm dla obrazów)
- **Docker Compose**: uruchamianie wielu kontenerów naraz (np. aplikacja + baza danych)
- **Izolacja**: każdy kontener ma własną sieć, system plików, zmienne środowiskowe
- **Ataccama ONE** jest deployowana w kontenerach Docker (zarządzanych przez [[Kubernetes]])

# 📚 Szczegółowe wyjaśnienie

## Podstawowe pojęcia

```
Dockerfile → docker build → Image → docker run → Container
     ↓
(przepis)          (przepis             (działający
                   upieczony)            "ciasto")
```

## Kluczowe komendy

```bash
# Budowanie obrazu
docker build -t moja-app:1.0 .

# Uruchomienie kontenera
docker run -d -p 8080:80 --name moja-app moja-app:1.0

# Wyświetlenie działających kontenerów
docker ps

# Logi kontenera
docker logs moja-app

# Wejście do kontenera
docker exec -it moja-app bash

# Zatrzymanie i usunięcie
docker stop moja-app && docker rm moja-app
```

## Dockerfile — przykład

```dockerfile
FROM python:3.11-slim

WORKDIR /app

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

EXPOSE 8000
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]
```

## Docker Compose — przykład

```yaml
services:
  app:
    build: .
    ports:
      - "8000:8000"
    environment:
      - DATABASE_URL=postgresql://user:pass@db:5432/mydb
    depends_on:
      - db

  db:
    image: postgres:15
    environment:
      POSTGRES_PASSWORD: pass
    volumes:
      - pgdata:/var/lib/postgresql/data

volumes:
  pgdata:
```

## Wolumeny (persystencja danych)

Kontenery są efemeryczne — dane giną po zatrzymaniu. Wolumeny `volumes:` mapują katalog hosta do kontenera.

# 💡 Przykład zastosowania

**Lokalne środowisko deweloperskie Ataccamy**: zamiast instalować PostgreSQL, Keycloak i aplikację osobno, `docker-compose up` startuje całe środowisko w 2 minuty. Po zakończeniu pracy `docker-compose down` czyści wszystko bez śladów w systemie.

# 📌 Źródła

- [[Kubernetes]]
- [[DevOps]]
- [[Automated Deployment]]
- [[Encrypting Secrets with SOPS]]
- [[CI/CD]]

# 👽 Brudnopis
