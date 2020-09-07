FROM python:alpine

RUN mkdir -p /opt/services/djangoapp/src
WORKDIR /opt/services/djangoapp/src

COPY ./requirements.txt requirements.txt

#RUN pip3 install gunicorn django
RUN pip install -r requirements.txt

COPY . /opt/services/djangoapp/src

EXPOSE 8000

CMD ["gunicorn", "--chdir", "hello", "--bind", ":8000", "hello.wsgi:application"]

