FROM jupyter/base-notebook

USER root

RUN apt-get update && \
    apt-get install -y postgresql-client python3-dev libpq-dev gcc

COPY requirements.txt /tmp/requirements.txt

RUN pip install -r /tmp/requirements.txt

RUN conda install gdal
RUN conda install geopandas
RUN conda install shapely
RUN conda install folium
RUN conda install ydata-profiling
RUN conda install psycopg2

RUN mkdir /home/jovyan/work/notebooks
COPY src/ /home/jovyan/work/notebooks

RUN mkdir /home/jovyan/work/datasets
COPY datasets/ /home/jovyan/work/datasets