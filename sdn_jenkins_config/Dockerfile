FROM jenkins/jenkins:lts-jdk11

USER root
RUN apt-get update
RUN apt-get install software-properties-common -y
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 0xB1998361219BD9C9
RUN apt-add-repository "deb http://repos.azul.com/azure-only/zulu/apt stable main"
RUN apt-get -q update
RUN apt-get -y install zulu-8-azure-jdk
