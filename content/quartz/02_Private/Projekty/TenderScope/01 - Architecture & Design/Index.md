# 01 - Architecture & Design

# System Architecture

## Tech Stack

### Backend

- **Framework**: FastAPI (Python 3.11)
- **Database**: PostgreSQL 15 (with JSONB for raw data)
- **Cache**: Redis 7
- **Task Queue**: Celery
- **ORM**: SQLAlchemy 2.0
- **Migration**: Alembic

### Frontend

- **Framework**: React 18 + TypeScript
- **Build Tool**: Vite 5
- **Styling**: Tailwind CSS 3
- **i18n**: react-i18next
- **State Management**: TanStack Query (React Query)
- **Routing**: React Router 6

### AI/ML

- **NLP**: Hugging Face Transformers (mBERT, XLM-RoBERTa)
- **ML**: scikit-learn
- **Data Processing**: pandas

### Infrastructure

- **Containerization**: Docker + Docker Compose
- **Orchestration**: Kubernetes (future)
- **Cloud**: AWS/GCP (future)
- **Development**: Railway/Supabase (initial)

## Architecture Principles

### Multi-Tenant from Day 1
