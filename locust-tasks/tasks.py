import uuid
import os
import encode

from datetime import datetime
from locust import HttpLocust, TaskSet, task

class MetricsTaskSet(TaskSet):
    @task
    def index(self):
#         basic_auth = f"{os.getenv('BASIC_AUTH_NAME')}:{os.getenv('BASIC_AUTH_PASS')}"
#         encode=base64.b64encode(basic_auth.encode('utf-8'))
#         headers = {"Authorization": f"Basic {encode.decode('utf-8')}"}
        self.client.get("/heathy", auth=(os.getenv('BASIC_AUTH_NAME'), os.getenv('BASIC_AUTH_PASS')))

class MetricsLocust(HttpLocust):
    task_set = MetricsTaskSet
    min_wait = 5000
    max_wait = 9000
