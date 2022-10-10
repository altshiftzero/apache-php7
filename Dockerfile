FROM altshiftzero/apache:alpine-3.15
RUN apk update && apk upgrade && \
    apk add --no-cache php7-fpm php7-dev \
                       php7-xml php7-mbstring php7-zip php7-gettext php7-json \
                       php7-gd php7-bz2 php7-curl php7-session php7-intl php7-fileinfo \
                       php7-bcmath php7-pdo php7-openssl php7-pear php7-dom php7-ctype php7-tokenizer \
                       php7-simplexml php7-xmlreader php7-xmlwriter php7-xsl \
                       gcc g++ apache2-proxy apache-mod-fcgid

RUN sed -i 's/LoadModule mpm_worker_module modules\/mod_mpm_worker.so/LoadModule mpm_event_module modules\/mod_mpm_event.so/g' /etc/apache2/httpd.conf
RUN sed -i 's/\/usr\/sbin\/httpd/php\-fpm7 \-D \&\& \/usr\/sbin\/httpd/g' /opt/server.sh
COPY config/php7.conf /etc/apache2/conf.d/php7.conf

