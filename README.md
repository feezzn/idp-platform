# IDP Platform — Internal Developer Platform

> Uma plataforma interna para permitir que squads de desenvolvimento façam deploy automaticamente,
> com segurança, observabilidade e escalabilidade.
>
> **Construído do zero. Aprendendo no caminho. 2 semanas até funcional.**

---

## 🎯 O Que É?

Um IDP (Internal Developer Platform) é um produto interno que fornece:

- **Catálogo central** de serviços (MongoDB)
- **Golden Path** padrão para qualquer tecnologia
- **Self-service** para criar e fazer deploy de novos serviços
- **Observabilidade** integrada (métricas, logs, traces)
- **Segurança** aplicada automaticamente em todos os deploys

## 📚 Documentação

Comece por aqui:

1. **[START-HERE.md](START-HERE.md)** — Mapa do projeto e status
2. **[IDP-CONCEPTS](IDP-CONCEPTS)** — Teoria: o que é, por que existe
3. **[TEAM_TOPOLOGIES.md](TEAM_TOPOLOGIES.md)** — Como organizar times  
4. **[IDP-IMPLEMENTATION-PLAN.md](IDP-IMPLEMENTATION-PLAN.md)** — Roadmap detalhado (5 fases)
5. **[PHASE-1-CHECKLIST.md](PHASE-1-CHECKLIST.md)** — Step-by-step executável

## 🚀 Quick Start

```bash
# 1. Clonar
git clone https://github.com/feezzn/idp-platform.git && cd idp-platform

# 2. Ler documentação (40 min)
cat START-HERE.md
cat IDP-CONCEPTS

# 3. Setup Fase 1 (3-4 dias)
# Ver PHASE-1-CHECKLIST.md para instruções detalhadas

# 4. Começar com:
kind create cluster --name idp-dev
helm install mongodb bitnami/mongodb --namespace mongodb --create-namespace
```

## 🏗️ Arquitetura

```
Dev: git push
  ↓
GitHub Actions (automático)
  ↓
Validator (CLI Python, lê MongoDB)
  ↓
Golden Path (workflow padrão)
  ├─ Build
  ├─ Test
  ├─ Scan (SAST/SCA)
  ├─ Docker build
  ├─ Deploy (dev env)
  └─ Verify
  ↓
Kubernetes (rodando)
  ↓
Observabilidade (Prometheus + Grafana)
```

## 📋 Tecnologias (Fase 3)

- **Backend API**: .NET 8 (payment-api)
- **Serviço Interno**: Go gRPC (order-service)
- **Batch Job**: Python + Celery (notification-batch)
- **Frontend**: React (dashboard)
- **Service**: Node.js Express (user-service)

## 📊 As 5 Fases

| Fase | Focus | Tempo |
|------|-------|-------|
| 1 | Infraestrutura Base (Kind + MongoDB + CLI) | 3-4 dias |
| 2 | Golden Path .NET | 1-2 dias |
| 3 | Multi-Stack (5 tecnologias) | 2-3 dias |
| 4 | Self-Service Portal | 2-3 dias |
| 5 | IA & Observabilidade | 3-5 dias |

**Total**: 2 semanas para ter um IDP funcional

## ✅ Requisitos

- Docker
- kubectl
- kind (Kubernetes in Docker)
- Helm 3+
- Python 3.9+
- Git
- GitHub account (para Actions)

## 🎓 Conceitos que Você Aprenderá

- **Internal Developer Platform (IDP)**
- **Golden Path** (Spotify pattern)
- **Team Topologies** (como organizar times)
- **DORA Metrics** (medir sucesso)
- **GitOps** (infraestrutura como código)
- **Kubernetes, Helm, Terraform**
- **CI/CD com GitHub Actions**
- **MongoDB para catálogo**
- **Python CLI**

## 📌 Status

```
✓ Repo criado
✓ Documentação completa
✓ Estrutura de pastas base
→ Próximo: Fase 1 (Kind + MongoDB + CLI)
```

## 👤 Author

Felipe Silva  
feeelipe.silva@gmail.com

---

**Last Updated**: 21 de maio de 2026
