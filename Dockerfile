FROM python:3-alpine

RUN mkdir /.aptible/
ADD Procfile /.aptible/Procfile

RUN mkdir /app
WORKDIR /app

COPY requirements.txt /app
RUN pip install --no-cache-dir -r requirements.txt

COPY app1.py /app
COPY app2.py /app

EXPOSE 5000
EXPOSE 5001

ENV URL=https://cli.doppler.com/install.sh
RUN wget -qO- $URL | sh
