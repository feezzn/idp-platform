"""IDP Catalog CLI - Main entry point"""

import click
from catalog.commands.servicos import servicos


@click.group()
def main():
    """IDP Catalog CLI - Manage your Internal Developer Platform"""
    pass


# Add command groups
main.add_command(servicos)


if __name__ == "__main__":
    main()
