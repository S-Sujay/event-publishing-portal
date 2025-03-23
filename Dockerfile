FROM ubuntu

WORKDIR /app

COPY event_management /app

SHELL ["/bin/bash","-c"]

RUN apt-get update && \
apt-get install -y python3 python3-pip python3-venv && \
python3 -m venv env1 && \
source env1/bin/activate && \
pip install Django

EXPOSE 80
CMD source env1/bin/activate && python3 manage.py runserver 0.0.0.0:80
