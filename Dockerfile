FROM ubuntu:18.04
RUN apt-get update -y 
RUN apt install python3 python3-pip -y
RUN mkdir /opt/app
COPY src/main.py /opt/app/
COPY requirements.txt /opt/app/requirements.txt
#WORKDIR /opt/app

RUN pip3 install -r /opt/app/requirements.txt

COPY docker-entrypoint.sh /
EXPOSE 5000
ENTRYPOINT "/docker-entrypoint.sh"
#ENTRYPOINT [ "python3", "main.py" ]
