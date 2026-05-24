// MongoDB seed data for the IDP catalog.
// This file is consumed by scripts/setup-mongodb.sh.

db = db.getSiblingDB("idp-catalog");

// Drop collections if they exist, so local learning runs stay reproducible.
db.aplicacoes.drop();
db.configuracoes.drop();
db.servicos.drop();

db.createCollection("aplicacoes");
db.createCollection("configuracoes");
db.createCollection("servicos");

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
]);

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
]);

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
]);

print("\nAplicacoes:");
printjson(db.aplicacoes.find().toArray());

print("\nConfiguracoes:");
printjson(db.configuracoes.find().toArray());

print("\nServicos:");
printjson(db.servicos.find().toArray());
