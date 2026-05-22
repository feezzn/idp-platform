from setuptools import setup, find_packages

setup(
    name="catalog-cli",
    version="0.1.0",
    description="IDP Platform CLI - Catalog management",
    author="Felipe Silva",
    author_email="feeelipe.silva@gmail.com",
    packages=find_packages(),
    install_requires=[
        "click>=8.1.0",
        "pymongo>=4.5.0",
        "python-dotenv>=1.0.0",
        "pydantic>=2.4.0",
    ],
    entry_points={
        "console_scripts": [
            "catalog=catalog.cli:main",
        ],
    },
    python_requires=">=3.9",
)
