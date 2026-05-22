# 🎯 Start Here: O Seu Mapa do IDP

> **Felipe, bem-vindo!** Você quer construir uma plataforma que permite que devs façam deploy em 1 clique.
> Começamos do zero, aprendemos no caminho. Dev environment. 5 tecnologias. 2 semanas para ficar funcional.

---

## A Visão (em 30 segundos)

```
ANTES                              DEPOIS
──────                             ──────
Dev A: "Como faço deploy?"         Dev A: git push
       → espera DevOps             Dev B: git push
       → 1 semana depois           Dev C: git push
       → deploy manual             
       → erros em prod             ✓ Todos automaticamente
       → rollback manual           ✓ Seguro (políticas aplicadas)
                                   ✓ Observável (alertas automáticos)
Dev B: "Qual serviço causa         ✓ Rápido (< 15 min)
       incidente?"                 ✓ Rastreável (audit log)
       → ninguém sabe
       → 3 horas para achar

Dev C: "Preciso de nova            Dev D novo:
       infraestrutura"             "Consegui fazer deploy no dia 1!"
       → ticket para infra
       → 2 semanas later
```

---

## A Estrutura (arquitetura simplificada)

```
┌─────────────────────────────────────────────────────┐
│                  DEVELOPER WORKFLOW                 │
│  (qualquer dev, qualquer time, qualquer tech)      │
└─────────────────────────────────────────────────────┘
                        ↓
                   git push origin
                        ↓
        ┌───────────────────────────────────┐
        │  GitHub Actions Trigger          │
        │  (automático, sempre)            │
        └───────────────────────────────────┘
                        ↓
         ┌──────────────────────────────────┐
         │  Validator (CLI) — Fase 1       │
         │  Lê MongoDB, exporta vars       │
         │  (20+ variáveis de infra)       │
         └──────────────────────────────────┘
                        ↓
        ┌─────────────────────────────────┐
        │  Golden Path (Workflows)        │
        │  ├─ Build                       │
        │  ├─ Test                        │
        │  ├─ Scan (SAST/SCA)            │
        │  ├─ Docker                      │
        │  ├─ Helm                        │
        │  ├─ Deploy (dev)                │
        │  ├─ Verify                      │
        │  └─ Rollback (if needed)        │
        └─────────────────────────────────┘
                        ↓
        ┌──────────────────────────────────┐
        │  Kubernetes (ArgoCD — Fase 3)   │
        │  Atualiza aplicação              │
        └──────────────────────────────────┘
                        ↓
        ┌──────────────────────────────────┐
        │  Observabilidade                │
        │  ├─ Prometheus (métricas)       │
        │  ├─ Grafana (dashboard)         │
        │  ├─ Logs (ELK/Loki)             │
        │  └─ Alerts (Slack)              │
        └──────────────────────────────────┘


TUDO ISTO ALIMENTADO POR:
────────────────────────
MongoDB (3 coleções):
  aplicacoes    = squads/times
  configuracoes = infra (AWS account, region, K8s cluster)
  servicos      = cada microserviço (nome, tech, repo, etc)

CLI Python:
  catalog servicos add/get/list
  catalog configuracoes get
  catalog validator validate
  catalog chart values
  [future] catalog ai check
```

---

## As 5 Fases (e o tempo)

| # | Fase | Focus | Tempo | Resultado |
|---|------|-------|-------|-----------|
| **1** | **Infraestrutura Base** | Kind + MongoDB + CLI | 3-4 dias | CLI funciona, dados em MongoDB |
| **2** | **Golden Path .NET** | Primeiro workflow | 1-2 dias | Deploy automático de 1 app |
| **3** | **Multi-Stack** | 5 tipos de app (Go, Python, Node, React, Batch) | 2-3 dias | Qualquer tech funciona |
| **4** | **Self-Service** | Portal/CLI para criar novo serviço | 2-3 dias | Dev novo faz deploy dia 1 |
| **5** | **IA & Obs** | LLM para validação, DORA metrics | 3-5 dias | Sugestões automáticas, dashboard |

**Total**: 2 semanas até ter um IDP funcional

---

## Tecnologias Confirmadas (Fase 3)

- **API Backend**: .NET 8 (REST) — payment-api
- **Serviço Interno**: Go (gRPC) — order-service  
- **Batch Job**: Python (Celery) — notification-batch
- **Frontend**: React — dashboard
- **Service**: Node.js (Express) — user-service

---

## Arquivo Por Arquivo — O Que Você Criará

### Documentação (já pronto!)

```
📄 START-HERE.md ← você está aqui!
📄 IDP-CONCEPTS.md ← leia isso! (teoria)
📄 TEAM_TOPOLOGIES.md ← como organizar times
📄 IDP-IMPLEMENTATION-PLAN.md ← roadmap detalhado
📄 PHASE-1-CHECKLIST.md ← step-by-step executável
```

### Infraestrutura (Terraform, Kind, Helm)

```
📁 terraform/
  ├── 1-kind-cluster/
  │   └── kind-config.yaml  ← Kubernetes local
  ├── 2-mongodb/
  │   └── values.yaml       ← banco de dados
  ├── 3-rbac/
  │   └── main.tf           ← namespaces, roles
  ├── 4-observability/
  │   ├── prometheus.tf
  │   └── grafana.tf
  └── 5-argocd/
      └── main.tf           ← GitOps
```

### CLI Python (o coração)

```
📁 catalog-cli/
  ├── setup.py
  ├── requirements.txt
  ├── catalog/
  │   ├── cli.py             ← entry point
  │   ├── mongo.py           ← conexão MongoDB
  │   └── commands/
  │       ├── servicos.py    ← `catalog servicos add/get/list`
  │       ├── configuracoes.py
  │       ├── validator.py
  │       └── chart.py
  └── tests/
      └── test_mongo.py
```

### Pipelines (GitHub Actions)

```
📁 .github/workflows/
  ├── validate.yml           ← valida CI
  ├── test-cli.yml
  ├── _template-dotnet.yml   ← reutilizável ← FASE 2
  ├── _template-go.yml
  ├── _template-python.yml
  ├── _template-frontend.yml
  ├── _template-batch.yml
  └── onboarding.yml         ← cria novo serviço ← FASE 4
```

### Helm Charts (deploy padrão)

```
📁 helm-charts/
  ├── dotnet-service/
  ├── go-service/
  ├── python-service/
  ├── frontend/
  └── batch-job/
```

### Aplicações de Exemplo

```
📁 samples/
  ├── payment-api-dotnet/    ← .NET 8 API
  ├── order-service-go/      ← Go gRPC
  ├── notification-batch-python/  ← Python + Celery
  ├── user-service-node/     ← Node.js Express
  └── dashboard-react/       ← React frontend
```

---

## 🚀 Cronograma

```
HOJE (leitura):
  ✓ START-HERE.md
  → IDP-CONCEPTS.md (10 min)
  → TEAM_TOPOLOGIES.md (10 min)
  → IDP-IMPLEMENTATION-PLAN.md (20 min)
  → PHASE-1-CHECKLIST.md (skim)
  Total: 40 min

AMANHÃ-SEMANA (Fase 1):
  → Preparar estrutura base (feito!)
  → Kind + MongoDB + CLI
  → GitHub Actions workflows
  Total: 3-4 dias

SEMANA 2:
  → Fase 2: Golden Path .NET (1-2 dias)
  → Fase 3: Multi-stack (2-3 dias)

SEMANA 3:
  → Fase 4: Self-service (2-3 dias)
  → Fase 5: IA & Obs (3-5 dias)
```

---

## ✅ Status Atual

```
✓ Repo criado: https://github.com/feezzn/idp-platform
✓ Estrutura de pastas base: pronta
✓ Documentação completa: pronta
✓ Próximo passo: Fase 1
```

---

## 🎓 Próximo Passo

1. **Leia os documentos** (40 min total, comece por IDP-CONCEPTS.md)
2. **Configure seu ambiente** (Docker, kubectl, Python 3.9+)
3. **Avise quando estiver pronto** → começamos Fase 1!

Bora? 🚀

---

**Last Updated**: 21 de maio de 2026  
**Status**: Ready to Read Docs
