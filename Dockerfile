FROM ubuntu:18.04

RUN apt -q -y update \
    && apt -q -y install \
        python-dev \
        python-pip \
        build-essential \
        python-virtualenv \
        libxslt1-dev \
        libxml2-dev \
        zlib1g-dev \
        git \
        libffi-dev \
        curl \
    && apt -q clean \
    && rm -rf /var/lib/apt/lists/*

ADD . /opt/datapusher/

WORKDIR /opt/datapusher/

RUN pip install -r requirements.txt
RUN pip install -e .

CMD [ "python", "datapusher/main.py", "deployment/datapusher_settings.py"]
