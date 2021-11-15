import sys
import os
from flask import Flask
from flask_restful import Resource, Api, reqparse
from datetime import datetime
import pyodbc
import json
import pytz

# Initialize Flask
app = Flask(__name__)

# Setup Flask Restful framework
api = Api(app)

# Create connection to Azure SQL
conn = pyodbc.connect(os.environ['SQLAZURECONNSTR_WWIF'])

class Status(Resource):
    def get(self):
        return {'status': 'alive'}

class Date(Resource):
    
    def get(self):
        cursor = conn.cursor()    
        cursor.execute("EXEC web.get_date")
        result = cursor.fetchone()

        if result:
            result = json.loads(result[0])                           
        else:
            result = {}    

        cursor.close()
        print(result)
        return result, 200
    
    def post(self):
        datetime_object = datetime.datetime.now()

        timestamp = {"timestamp": datetime_object}
        cursor = conn.cursor()    
        cursor.execute("EXEC web.post_date ?", json.dumps(timestamp))
        result = cursor.fetchone()

        if result:
            result = json.loads(result[0])                           
        else:
            result = {}    

        cursor.close()
        print(result)
        return {'timestamp': datetime_object}, 201

api.add_resource(Status, '/')
# Create API route to defined Date class
api.add_resource(Date, '/date')

# Start App
if __name__ == '__main__':
    app.run()  # run our Flask app