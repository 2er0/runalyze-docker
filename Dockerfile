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
WORKDIR /app/Runalyze

RUN wget -O ./data/timezone.sqlite https://cdn.runalyze.com/update/timezone.sqlite 
COPY data/srtm/* ./data/srtm/

COPY data/config/config.yml ./data/config.yml

RUN cp /etc/apache2/sites-enabled/000-default.conf /etc/apache2/defaultBack
COPY data/config/apacheDefaultSite /etc/apache2/sites-enabled/000-default.conf
COPY data/config/apache2.conf /etc/apache2/apache2.conf

RUN chown www-data:www-data -R .
RUN a2enmod rewrite

EXPOSE 80

CMD ["/usr/sbin/apache2ctl", "-D FOREGROUND"]
