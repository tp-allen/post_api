import os
from flask import Flask
from flask_restful import Resource, Api
import datetime
from azure.cosmos import CosmosClient, PartitionKey
import json

# Initialize Flask
app = Flask(__name__)

# Setup Flask Restful framework
api = Api(app)

# Initialize the Cosmos client
url = os.environ["ACCOUNT_URI"]
key = os.environ["ACCOUNT_KEY"]
client = CosmosClient(url, credential=key)

# Create a database
database_name = "SimpleAPI"
database = client.create_database_if_not_exists(id=database_name)

# Create a Container
container_name = "DateTime"
container = database.create_container_if_not_exists(
    id=container_name,
    partition_key=PartitionKey(path="/timestamp"),
    offer_throughput=400,
)

# Basic Status GET


class Status(Resource):
    def get(self):
        return {"status": "alive"}


# Date GET and POST Class
class Date(Resource):
    def get(self):
        item_list = list(container.read_all_items(max_item_count=10))
        print("Found {0} items".format(item_list.__len__()))

        return json.dumps(item_list), 200

    def post(self):
        datetime_object = datetime.datetime.now()
        timestamp = str(datetime_object)
        print(datetime_object)
        print(timestamp)

        timestamp = {"timestamp": timestamp}
        container.create_item(timestamp)
        return timestamp, 201


# Create API route to defined Status class
api.add_resource(Status, "/")
# Create API route to defined Date class
api.add_resource(Date, "/date")

# Start App
if __name__ == "__main__":
    app.run()  # run our Flask app
