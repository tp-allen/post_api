# syntax=docker/dockerfile:1

# set base image (host OS)
FROM python:3.8

# set and add ENVs to be accessed by the app
ENV ACCOUNT_URI blankuri
ENV ACCOUNT_KEY blankkey
ENV COSMOSDB_NAME blankdb
ENV COSMOSDB_CONTAINER blankcont

ADD . $ACCOUNT_URI
ADD . $ACCOUNT_KEY
ADD . $COSMOSDB_NAME
ADD . $COSMOSDB_CONTAINER

# set the working directory in the container
WORKDIR /code

# copy the dependencies file to the working directory
COPY requirements.txt .

# install dependencies
RUN pip install -r requirements.txt

# copy the content of the local src directory to the working directory
COPY src/ .

# command to run on container start
CMD [ "python", "./time_app.py" ]