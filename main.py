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

# [START cloudbuild_python_flask]
import os
from flask import Flask

app = Flask(__name__)

@app.route("/")
def hello_world():
    """
    A simple route that returns a static 'Hello World!' message.
    """
    return "Hello team welcome to Enhub.ai Happy Holliday"

if __name__ == "__main__":
    """
    Start the Flask application on the provided host and port.
    Defaults to 0.0.0.0 for accessibility in a containerized environment.
    """
    app.run(debug=True, host="0.0.0.0", port=int(os.environ.get("PORT", 8080)))
# [END cloudbuild_python_flask]
