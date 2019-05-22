import uuid
import os

from datetime import datetime
from locust import HttpLocust, TaskSet, task

class MetricsTaskSet(TaskSet):
    @task
    def index(self):
        self.client.get("/heathy")

class MetricsLocust(HttpLocust):
    task_set = MetricsTaskSet
    min_wait = 5000
    max_wait = 9000
