FROM redmine:5.0

ADD configuration.yml /usr/src/redmine/config
ADD en.yml /usr/src/redmine/config/locales
RUN apt-get update && apt-get install -y make gcc
RUN apt-get install -y imagemagick
RUN chmod +t -R /usr/local/bundle
RUN apt install fontconfig
RUN curl -o nanumfont.zip http://cdn.naver.com/naver/NanumFont/fontfiles/NanumFont_TTF_ALL.zip 
RUN apt-get install unzip -y
RUN unzip -d /usr/share/fonts/nanum nanumfont.zip
RUN apt-get install -y libmagickwand-dev
RUN gem install rmagick -v '2.15.4'
