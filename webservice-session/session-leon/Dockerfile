FROM python:3.8-alpine
WORKDIR /flask

COPY . ./flask

RUN pip install -r flask/requirements.txt


CMD [ "python", "flask/src/main.py"]