FROM python:3.10
ENV PYTHONUNBUFFERED 1
RUN mkdir /code
WORKDIR /code
RUN apt-get -y update && apt-get -y install binutils libproj-dev gdal-bin
COPY requirements.txt /code/
RUN pip install -r requirements.txt
ADD . /code/