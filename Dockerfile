FROM python:3.8
ENV PYTHONUNBUFFERED=1

WORKDIR /backend

COPY requirements.txt /backend
RUN pip install -r requirements.txt

COPY . /backend

RUN chmod +x /backend/entrypoint.sh
ENTRYPOINT ["/bin/sh", "/backend/entrypoint.sh"]
