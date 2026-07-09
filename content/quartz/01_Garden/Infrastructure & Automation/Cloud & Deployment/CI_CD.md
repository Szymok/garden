---
title: CI/CD (Continuous Integration / Continuous Delivery)
created: 2026-05-06
status: 🌱 draft
category: DevOps
difficulty: średni
language: pl
tags:
  - ci-cd
  - continuous-integration
  - continuous-delivery
  - devops
  - automatyzacja
  - github-actions
  - gitlab-ci
aliases:
  - Continuous Integration
  - Continuous Delivery
  - Continuous Deployment
  - GitHub Actions
  - GitLab CI
---

# 🎯 Definicja

**CI/CD** to praktyka [[DevOps|DevOps]] automatyzująca budowanie, testowanie i wdrażanie kodu. **CI** (Continuous Integration) — każda zmiana w kodzie jest automatycznie budowana i testowana. **CD** (Continuous Delivery/Deployment) — zweryfikowany kod jest automatycznie dostarczany do środowisk testowych lub produkcji.

# 🔑 Kluczowe punkty

- **Pipeline**: sekwencja kroków: build → test → lint → deploy
- **GitHub Actions** — najpopularniejszy CI/CD dla repozytoriów GitHub
- **GitLab CI** — wbudowany CI/CD w GitLab (często w enterprise)
- **Trigger**: pipeline uruchamia się na push, PR, merge, harmonogram
- **Artifact**: wynik buildu (obraz [[Docker|Docker]], paczka npm, raport testów)
- **Environment**: dev → staging → production z manualnym zatwierdzeniem

# 📚 Szczegółowe wyjaśnienie

## Przepływ CI/CD

```
Developer push
      │
      ▼
┌─────────────┐     ┌─────────────┐     ┌─────────────┐
│    Build    │ ──► │    Test     │ ──► │   Deploy    │
│ compile     │     │ unit tests  │     │ staging env │
│ docker build│     │ lint/format │     │             │
└─────────────┘     └─────────────┘     └──────┬──────┘
                                               │
                                         manual approval
                                               │
                                        ┌──────▼──────┐
                                        │  Production  │
                                        └─────────────┘
```

## GitHub Actions — przykład

```yaml
# .github/workflows/deploy.yml
name: CI/CD Pipeline

on:
  push:
    branches: [main]

jobs:
  test:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - name: Run tests
        run: |
          pip install -r requirements.txt
          pytest tests/

  build-and-push:
    needs: test
    runs-on: ubuntu-latest
    steps:
      - name: Build Docker image
        run: docker build -t myapp:${{ github.sha }} .
      - name: Push to registry
        run: docker push myapp:${{ github.sha }}

  deploy-staging:
    needs: build-and-push
    environment: staging
    runs-on: ubuntu-latest
    steps:
      - name: Deploy to K8s
        run: |
          kubectl set image deployment/myapp \
            app=myapp:${{ github.sha }}
```

## GitLab CI — przykład

```yaml
# .gitlab-ci.yml
stages:
  - test
  - build
  - deploy

test:
  stage: test
  script:
    - pytest tests/

build:
  stage: build
  script:
    - docker build -t $CI_REGISTRY_IMAGE:$CI_COMMIT_SHA .
    - docker push $CI_REGISTRY_IMAGE:$CI_COMMIT_SHA

deploy_staging:
  stage: deploy
  environment: staging
  when: manual
  script:
    - helm upgrade myapp ./charts/myapp
```

# 💡 Przykład zastosowania

**Wdrożenie aktualizacji Ataccamy**: każdy commit do `main` triggeruje pipeline — testy [[Ansible Playbooks|Ansible playbooks]], budowanie obrazów [[Docker|Docker]], wdrożenie na środowisko testowe. Po ręcznym zatwierdzeniu QA, ten sam pipeline wdraża na produkcję. Czas wdrożenia: 15 minut zamiast 4 godzin manualnej pracy.

# 📌 Źródła

- [[Docker]]
- [[Kubernetes]]
- [[DevOps]]
- [[Ansible Playbooks]]
- [[Encrypting Secrets with SOPS]]

# 👽 Brudnopis
