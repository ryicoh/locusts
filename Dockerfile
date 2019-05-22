FROM python:3.7.3

WORKDIR locust-tasks
ADD locust-tasks/requirements.txt .

RUN apt-get update && \
    apt-get install libevent-dev && \
    pip install -r /locust-tasks/requirements.txt

COPY locust-tasks .

EXPOSE 5557 5558 8089

RUN chmod 755 ./run.sh

ENTRYPOINT ["/locust-tasks/run.sh"]
