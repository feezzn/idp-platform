"""MongoDB connection and operations"""

import os
from pymongo import MongoClient
from pymongo.errors import ServerSelectionTimeoutError


class MongoConnection:
    """MongoDB connection manager"""

    def __init__(self):
        self.uri = os.getenv(
            "MONGO_URI",
            "mongodb://idp-user:idp-password@localhost:27017/idp-catalog"
        )
        self.client = None
        self.db = None

    def connect(self):
        """Connect to MongoDB"""
        try:
            self.client = MongoClient(self.uri, serverSelectionTimeoutMS=5000)
            self.db = self.client["idp-catalog"]
            # Test connection
            self.db.command("ping")
            print("✓ Connected to MongoDB")
        except ServerSelectionTimeoutError as e:
            print(f"✗ Could not connect to MongoDB: {e}")
            raise

    def close(self):
        """Close MongoDB connection"""
        if self.client:
            self.client.close()

    def get_db(self):
        """Get database connection (auto-connect if needed)"""
        if not self.db:
            self.connect()
        return self.db
