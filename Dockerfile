FROM debian

RUN apt update
RUN apt install -y apache2 libapache2-mod-php7.0
RUN apt install -y php7.0-intl php7.0-mysql php7.0-sqlite3 php7.0-mbstring php7.0-xml php7.0-curl php7.0-zip php7.0-gettext php7.0-intl
RUN apt install -y perl sqlite3 libsqlite3-mod-spatialite gettext libxml2 python3 python3-pip inkscape
RUN apt install -y librsvg2-bin librsvg2-common
RUN apt install -y git wget 

RUN mkdir -p /app
WORKDIR /app
COPY data/version/runalyze Runalyze
#RUN tar -xzf runalyze-v4.1.2.tar.gz
#RUN mv runalyze Runalyze
#RUN git clone https://github.com/Runalyze/Runalyze.git
WORKDIR /app/Runalyze
#ENV rVersion = v4.1.2
#RUN git fetch --all --tags --prune
#RUN git checkout -b run v4.1.2

RUN wget -O ./data/timezone.sqlite https://cdn.runalyze.com/update/timezone.sqlite 
COPY data/srtm/* ./data/srtm/

COPY data/config/config.yml ./data/config.yml

RUN cp /etc/apache2/sites-enabled/000-default.conf /etc/apache2/defaultBack
COPY data/config/apacheDefaultSite /etc/apache2/sites-enabled/000-default.conf
COPY data/config/apache2.conf /etc/apache2/apache2.conf
#RUN mv /usr/local/apache2/htdocs /usr/local/apache2/htdocs-back
#RUN ln -s /usr/local/apache2/htdocs /app/Runalyze/web
RUN chown www-data:www-data -R .
RUN a2enmod rewrite

EXPOSE 80

#CMD ["/etc/init.d/apache2", "start", "-D FOREGROUND"]
CMD ["/usr/sbin/apache2ctl", "-D FOREGROUND"]
