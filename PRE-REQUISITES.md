# ✅ Checklist Pre-Fase-1

Antes de começar a Fase 1, certifique-se que tem tudo:

## 🛠️ Ferramentas Obrigatórias

### Docker
```bash
docker --version
# Expected: Docker version 20.10+ (ou qualquer versão recente)
```

Se não tiver:
- macOS: `brew install docker` (ou use Docker Desktop)
- Linux: https://docs.docker.com/engine/install/

### kubectl
```bash
kubectl version --client
# Expected: v1.27+ (aproximadamente)
```

Se não tiver:
- macOS: `brew install kubectl`
- Linux: https://kubernetes.io/docs/tasks/tools/

### kind
```bash
kind version
# Expected: kind v0.20.0+
```

Se não tiver:
- macOS: `brew install kind`
- Linux: https://kind.sigs.k8s.io/docs/user/quick-start/

### Helm
```bash
helm version
# Expected: v3.12+
```

Se não tiver:
- macOS: `brew install helm`
- Linux: https://helm.sh/docs/intro/install/

### Python 3.9+
```bash
python3 --version
# Expected: Python 3.9+ (recomendo 3.11)
```

Se não tiver:
- macOS: `brew install python@3.11`
- Linux: `sudo apt install python3.11` (ou similar)

### Git
```bash
git --version
# Expected: git version 2.30+
```

Se não tiver:
- macOS: `brew install git`
- Linux: `sudo apt install git` (ou similar)

---

## 📚 Leitura Necessária

- [ ] Ler **START-HERE.md** (5 min)
- [ ] Ler **IDP-CONCEPTS** (10 min)
- [ ] Ler **TEAM_TOPOLOGIES.md** (10 min)
- [ ] Ler **IDP-IMPLEMENTATION-PLAN.md** (10 min)
- [ ] Skim **PHASE-1-CHECKLIST.md** (como referência)

**Tempo total**: ~40 min

---

## 🧠 Conceitos Necessários

Você não precisa ser expert em:
- ✗ Kubernetes (você aprenderá no caminho)
- ✗ Terraform (básico é o suficiente)
- ✗ MongoDB (básico é o suficiente)
- ✗ GitHub Actions (básico é o suficiente)

Você precisa estar confortável com:
- ✓ Terminal/CLI básico
- ✓ Git (add, commit, push)
- ✓ Python básico
- ✓ YAML syntax (muito usado em Kubernetes)

---

## 💾 Espaço em Disco

Certifique que tem pelo menos **10 GB** livres:
- Docker images: ~5 GB
- Kubernetes cluster: ~3 GB
- Code + databases: ~2 GB

```bash
# macOS/Linux
df -h | grep "/$"      # Ver espaço disponível
```

---

## 🌐 Conexão de Internet

Necessário para:
- Clonar repositório Git
- Baixar Docker images
- Instalar pacotes Python
- Documentação online

---

## 📝 Documentação ao Seu Lado

Tenha aberto em abas do navegador:

1. https://kind.sigs.k8s.io/ — Kubernetes local
2. https://helm.sh/docs/ — Package manager K8s
3. https://www.mongodb.com/docs/ — Banco de dados
4. https://docs.github.com/en/actions — CI/CD
5. https://click.palletsprojects.com/ — CLI Python

---

## ✅ Checklist de Confirmação

```
[ ] Docker instalado e funcionando
[ ] kubectl instalado e funcionando
[ ] kind instalado e funcionando
[ ] Helm instalado e funcionando
[ ] Python 3.9+ instalado
[ ] Git instalado e configurado
[ ] Pelo menos 10 GB de espaço em disco
[ ] Conexão de internet estável
[ ] Documentação lida (40 min)
[ ] Conceitos básicos entendidos
```

Se tudo está verde ✅, **você está pronto para Fase 1!**

---

## ⚡ Quick Setup (Copy-Paste)

Se você está em macOS e quer fazer tudo de uma vez:

```bash
# Instalar tudo
brew install docker kubectl kind helm python@3.11

# Verificar
docker --version && kubectl version --client && kind version && helm version && python3 --version

# Esperar Docker estar rodando (abra Docker Desktop se for macOS)
# Depois:

# Clonar projeto
cd /home/felipe/Laboratorios
git clone https://github.com/feezzn/idp-platform.git idp-platform
cd idp-platform

# Ler docs
cat START-HERE.md
cat IDP-CONCEPTS | head -100

# Pronto para Fase 1!
```

---

**Está tudo pronto?** Vamos começar Fase 1! 🚀

Quando estiver pronto, execute:

```bash
cd /home/felipe/Laboratorios/idp-platform
cat PHASE-1-CHECKLIST.md
```

e siga o checklist!
