---
title: Terraform (Infrastructure as Code)
created: 2026-05-06
status: 🌱 draft
category: DevOps
difficulty: zaawansowany
language: pl
tags:
  - terraform
  - iac
  - infrastructure-as-code
  - devops
  - aws
  - cloud
  - hashicorp
aliases:
  - IaC
  - Infrastructure as Code
  - HCL
---

# 🎯 Definicja

**Terraform** to narzędzie Infrastructure as Code (IaC) firmy HashiCorp, które pozwala definiować i zarządzać infrastrukturą chmurową (AWS, Azure, GCP) jako kod w języku HCL. Infrastruktura opisana w plikach `.tf` jest deklaratywna — Terraform sam oblicza co trzeba stworzyć, zmienić lub usunąć.

# 🔑 Kluczowe punkty

- **[[Deklaratywność|Deklaratywność]]**: opisujesz pożądany stan, nie kroki do jego osiągnięcia
- **Provider**: wtyczka łącząca Terraform z API chmury (aws, azurerm, google)
- **State**: plik `terraform.tfstate` — mapa rzeczywistej infrastruktury
- **Plan → Apply**: `terraform plan` pokazuje zmiany, `terraform apply` je wykonuje
- **Moduły**: wielokrotnego użytku bloki infrastruktury (jak funkcje w kodzie)
- **IaC → wersjonowanie**: infrastruktura w git = historia zmian, code review, rollback

# 📚 Szczegółowe wyjaśnienie

## Podstawowa struktura

```hcl
# main.tf — przykład: EC2 + S3 na AWS

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

resource "aws_instance" "ataccama_server" {
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = "m5.xlarge"

  tags = {
    Name        = "ataccama-one"
    Environment = var.environment
  }
}

resource "aws_s3_bucket" "data_lake" {
  bucket = "company-data-lake-${var.environment}"
}
```

## Zmienne

```hcl
# variables.tf
variable "environment" {
  description = "Środowisko (dev/staging/prod)"
  type        = string
  default     = "dev"
}

variable "aws_region" {
  type    = string
  default = "eu-central-1"
}
```

## Workflow

```bash
terraform init      # pobierz providery
terraform plan      # podgląd zmian (NIE modyfikuje infrastruktury)
terraform apply     # wykonaj zmiany (z potwierdzeniem)
terraform destroy   # usuń całą infrastrukturę
```

## Remote State — współpraca zespołowa

```hcl
# backend.tf — state w S3 zamiast lokalnie
terraform {
  backend "s3" {
    bucket = "company-terraform-state"
    key    = "ataccama/terraform.tfstate"
    region = "eu-central-1"
  }
}
```

# 💡 Przykład zastosowania

**Infrastruktura Ataccamy na AWS**: zamiast klikać w konsoli AWS, cała infrastruktura (EKS cluster, RDS PostgreSQL, S3, VPC, security groups) jest opisana w Terraform. Nowe środowisko staging tworzy się przez `terraform apply -var="environment=staging"` w 10 minut. Rollback przez `git revert` + `terraform apply`.

# 📌 Źródła

- [[Docker]]
- [[Kubernetes]]
- [[DevOps]]
- [[AWS Compute Services]]
- [[Encrypting Secrets with SOPS]]
- [[CI/CD]]

# 👽 Brudnopis
