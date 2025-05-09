# Copyright 2020 Google, LLC.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# Use the official lightweight Python image.
# https://hub.docker.com/_/python
FROM python:3.13-slim

# Allow statements and log messages to immediately appear in the Knative logs
ENV PYTHONUNBUFFERED True

# Set a default port if $PORT is not set
ENV PORT=8080

# Set the working directory
ENV APP_HOME /app
WORKDIR $APP_HOME

# Copy the application code to the container image
COPY . ./

# Install production dependencies
RUN pip install Flask gunicorn

# Run the web service on container startup
# Using gunicorn with one worker process and 8 threads
# The default port is set to $PORT (8080)
CMD exec gunicorn --bind :$PORT --workers 1 --threads 8 --timeout 0 main:app
