FROM jupyter/base-notebook:latest

USER root

ARG DEBIAN_FRONTEND=noninteractive

ARG MODEL_GDRIVE_ID="1JIzdJ1-w_xxwYr5qjs-PN7SAmrtVv01R"

WORKDIR /detector

RUN apt-get update  \
    && apt-get install --no-install-recommends -y \
    libgl1 \
    libglib2.0-0 \
    && rm -rf /var/lib/apt/lists/*

COPY requirements.txt requirements.txt

RUN python3 -m pip install -U pip &&  \
    python3 -m pip install --no-cache-dir gdown -r requirements.txt

COPY . .

RUN gdown $MODEL_GDRIVE_ID