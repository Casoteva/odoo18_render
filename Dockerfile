FROM python:3.10-slim

ENV LANG C.UTF-8
WORKDIR /odoo

RUN apt-get update && apt-get install -y \
    git gcc python3-dev libpq-dev libxml2-dev libxslt1-dev libldap2-dev libsasl2-dev libffi-dev libssl-dev libjpeg-dev libjpeg62-turbo-dev libpng-dev libxslt-dev libzip-dev zlib1g-dev build-essential \
    && rm -rf /var/lib/apt/lists/*

COPY . /odoo

RUN pip install --upgrade pip

EXPOSE 8069

CMD ["python3", "/odoo/odoo/odoo-bin", "serve"]
