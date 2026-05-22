"""CLI commands for managing services"""

import click
import json
from datetime import datetime
from catalog.mongo import MongoConnection


@click.group()
def servicos():
    """Manage services (serviços)"""
    pass


@servicos.command()
@click.option('--nome', required=True, help='Service name')
@click.option('--aplicacao', required=True, help='Application ID')
@click.option('--type', required=True, help='Service type (dotnet, go, python, node, frontend)')
def add(nome, aplicacao, type):
    """Add a new service"""
    mongo = MongoConnection()
    db = mongo.get_db()

    service = {
        "_id": nome,
        "nome": nome,
        "id_aplicacao": aplicacao,
        "type": type,
        "created_at": datetime.utcnow()
    }

    try:
        db.servicos.insert_one(service)
        click.echo(f"✓ Service '{nome}' added successfully")
    except Exception as e:
        click.echo(f"✗ Error: {e}", err=True)
    finally:
        mongo.close()


@servicos.command()
def list():
    """List all services"""
    mongo = MongoConnection()
    db = mongo.get_db()

    try:
        services = list(db.servicos.find({}, {"_id": 1, "type": 1, "id_aplicacao": 1}))
        if not services:
            click.echo("No services found")
        else:
            click.echo(f"{'ID':<40} {'Type':<10} {'App':<15}")
            click.echo("-" * 65)
            for svc in services:
                click.echo(f"{svc['_id']:<40} {svc.get('type', 'N/A'):<10} {svc.get('id_aplicacao', 'N/A'):<15}")
    except Exception as e:
        click.echo(f"✗ Error: {e}", err=True)
    finally:
        mongo.close()


@servicos.command()
@click.option('--nome', required=True, help='Service name')
def get(nome):
    """Get service details"""
    mongo = MongoConnection()
    db = mongo.get_db()

    try:
        service = db.servicos.find_one({"_id": nome})
        if not service:
            click.echo(f"Service '{nome}' not found", err=True)
        else:
            # Convert ObjectId to string for JSON
            service_json = json.dumps(service, default=str, indent=2)
            click.echo(service_json)
    except Exception as e:
        click.echo(f"✗ Error: {e}", err=True)
    finally:
        mongo.close()
