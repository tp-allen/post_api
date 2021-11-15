# syntax=docker/dockerfile:1

# set base image (host OS)
FROM python:3.8


# set and add ACCOUNT_URI and ACCOUNT_KEY Envs to be accessed by the app
ENV ACCOUNT_URI blank
ENV ACCOUNT_KEY blank
ADD . $ACCOUNT_URI
ADD . $ACCOUNT_KEY

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