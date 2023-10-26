# syntax=docker/dockerfile:1.4
# FROM --platform=$BUILDPLATFORM python:3.10-alpine AS builder

FROM centos:7

WORKDIR /python_api

COPY requirements.txt /python_api

RUN yum install -y \
    python3.7 \
    python3-pip

RUN pip3 install -r requirements.txt

COPY . /python_api

ENTRYPOINT ["python3"]
CMD ["python-api.py"]
