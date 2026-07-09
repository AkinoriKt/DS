FROM jupyter/base-notebook

USER root

RUN apt-get update && apt-get install -y \
    build-essential \
    git \
    curl \
    libgl1 \
    libglib2.0-0 \
    && rm -rf /var/lib/apt/lists/*

USER jovyan

COPY requirements.txt /tmp/

RUN pip install --upgrade pip

RUN pip install --no-cache-dir -r /tmp/requirements.txt
