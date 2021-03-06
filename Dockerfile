FROM python:3.8-slim
LABEL Author="Herculano"
LABEL Email="lucasgherculano@gmail.com"
LABEL version="0.0.1a"

ENV FLASK_DEBUG=True
ENV FLASK_ENV=development
ENV FLASK_APP=ldm.py

ENV DEBIAN_FRONTEND=noninteractive

RUN mkdir /usr/src/app

WORKDIR /usr/src/app

COPY . ./

RUN echo "Installing Apt-get packages..." \
    && apt-get update \
    && apt-get install -y apt-utils 2> /dev/null \
    && apt-get install -y wget \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN pip install --upgrade pip && pip install --no-cache-dir -r requirements.txt

ENV DEBIAN_FRONTEND=teletype

EXPOSE 5000


CMD ["python", "app/ldm.py"]
