FROM python:3.10.4-slim-bullseye

RUN apt update && apt upgrade -y \
    && apt-get install -y git curl python3-pip ffmpeg wget bash neofetch software-properties-common \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

COPY requirements.txt .
RUN pip3 install wheel
RUN pip3 install --no-cache-dir -U -r requirements.txt

WORKDIR /app
COPY . .

CMD gunicorn app:app & python3 -m Restriction
