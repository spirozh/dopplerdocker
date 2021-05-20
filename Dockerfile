FROM python:3-alpine

RUN wget -qO- https://cli.doppler.com/install.sh | sh

RUN mkdir /app
WORKDIR /app

COPY requirements.txt /app
RUN pip install --no-cache-dir -r requirements.txt

RUN mkdir /.aptible/
ADD Procfile /.aptible/Procfile

COPY app1.py /app
COPY app2.py /app

EXPOSE 5000 5001