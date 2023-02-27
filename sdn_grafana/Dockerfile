FROM grafana/grafana:9.2.5-ubuntu

ADD ./entrypoint.sh $GF_PATHS_HOME

WORKDIR $GF_PATHS_HOME

ENTRYPOINT ./entrypoint.sh