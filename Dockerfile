FROM ubuntu

WORKDIR /flask_app

COPY  app.py /flask_app
COPY  requirements.txt /flask_app
COPY  default.nginx.conf /etc/nginx/sites-enabled/default
COPY  run_apps.sh /flask_app

RUN apt-get update && apt-get install -y python-pip python-dev build-essential nginx wget
RUN echo "deb https://packages.elastic.co/beats/apt stable main" | tee -a /etc/apt/sources.list.d/beats.list
RUN wget -qO - https://packages.elastic.co/GPG-KEY-elasticsearch | apt-key add -
RUN apt-get update && apt-get install -y filebeat
RUN chmod a+x run_apps.sh
RUN pip install --upgrade pip
RUN pip install -r requirements.txt

EXPOSE 80

CMD ["./run_apps.sh"]
