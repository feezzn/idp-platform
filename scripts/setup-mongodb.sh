#!/bin/bash

# MongoDB Setup Script - Popula coleções iniciais

MONGO_URI="${MONGO_URI:-mongodb://idp-user:idp-password@localhost:27017/idp-catalog}"

echo "Connecting to MongoDB: $MONGO_URI"
echo ""

mongosh "$MONGO_URI" <<'EOF'

// Use correct database
use idp-catalog

// Drop collections if exist (for clean slate)
db.aplicacoes.drop()
db.configuracoes.drop()
db.servicos.drop()

// Create collections
db.createCollection("aplicacoes")
db.createCollection("configuracoes")
db.createCollection("servicos")

// COLEÇÃO 1: Aplicações (squads/times)
db.aplicacoes.insertMany([
  {
    "_id": "pmt",
    "id_capacidade": "pmt",
    "nome": "Payments Platform",
    "squad": "Payments Squad",
    "owner": "Felipe",
    "created_at": new Date()
  },
  {
    "_id": "ord",
    "id_capacidade": "ord",
    "nome": "Orders Platform",
    "squad": "Orders Squad",
    "owner": "Felipe",
    "created_at": new Date()
  }
])

// COLEÇÃO 2: Configurações (infra por ambiente)
db.configuracoes.insertMany([
  {
    "_id": "pmt",
    "ambientes": {
      "dev": {
        "aws_account": "999999999999",
        "aws_region": "us-east-1",
        "eks_cluster": "idp-dev-cluster",
        "namespace": "pmt-dev"
      }
    }
  },
  {
    "_id": "ord",
    "ambientes": {
      "dev": {
        "aws_account": "999999999999",
        "aws_region": "us-east-1",
        "eks_cluster": "idp-dev-cluster",
        "namespace": "ord-dev"
      }
    }
  }
])

// COLEÇÃO 3: Serviços
db.servicos.insertMany([
  {
    "_id": "payment-api",
    "nome": "payment-api",
    "id_aplicacao": "pmt",
    "id_capacidade": "pmt",
    "type": "dotnet",
    "dotnet_version": "8",
    "path_solution": "PaymentApi.sln",
    "path_project": "src/PaymentApi/",
    "owner": "Felipe",
    "created_at": new Date()
  },
  {
    "_id": "order-service",
    "nome": "order-service",
    "id_aplicacao": "ord",
    "id_capacidade": "ord",
    "type": "go",
    "go_version": "1.21",
    "owner": "Felipe",
    "created_at": new Date()
  }
])

// Verify data
print("\n✓ Aplicações:")
db.aplicacoes.find().pretty()

print("\n✓ Configurações:")
db.configuracoes.find().pretty()

print("\n✓ Serviços:")
db.servicos.find().pretty()

EOF

echo ""
echo "✓ Setup complete!"
