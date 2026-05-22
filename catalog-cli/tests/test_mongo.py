"""Tests for CLI"""

import pytest
from catalog.mongo import MongoConnection


def test_mongo_connection_string():
    """Test MongoDB connection string parsing"""
    conn = MongoConnection()
    assert "mongodb://" in conn.uri
    assert "idp-catalog" in conn.uri
