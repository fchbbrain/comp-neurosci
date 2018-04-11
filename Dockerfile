FROM jupyter/scipy-notebook:c7fb6660d096

USER root

RUN apt-get update && \
    apt-get install -y --no-install-recommends curl && \
    apt-get clean && \
rm -rf /var/lib/apt/lists/*

USER $NB_USER

RUN pip install \
    ewave==1.0.5 \
    libtfr==2.1.2 \
    toelis==2.0.1

WORKDIR /home/$NB_USER

COPY *.ipynb .
COPY tools/*.py tools/
COPY images/* images/
RUN curl -SL https://gracula.psyc.virginia.edu/public/courseware/starling_song_stimuli.tgz \
    | tar -zxv
RUN curl -SL https://gracula.psyc.virginia.edu/public/courseware/starling_song_responses.tgz \
    | tar -zxv
