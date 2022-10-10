FROM altshiftzero/apache:alpine-3.16
RUN apk update && apk upgrade && \
    apk add --no-cache php81-fpm php81-dev \
                       php81-xml php81-mbstring php81-zip php81-gettext \
                       php81-gd php81-bz2 php81-curl php81-session php81-intl php81-fileinfo \
                       php81-bcmath php81-pdo php81-openssl php81-pear php81-dom php81-ctype php81-tokenizer \
                       php81-simplexml php81-xmlreader php81-xmlwriter php81-xsl \
                       gcc g++ apache2-proxy apache-mod-fcgid

RUN sed -i 's/LoadModule mpm_worker_module modules\/mod_mpm_worker.so/LoadModule mpm_event_module modules\/mod_mpm_event.so/g' /etc/apache2/httpd.conf
RUN sed -i 's/\/usr\/sbin\/httpd/php\-fpm81 \-D \&\& \/usr\/sbin\/httpd/g' /opt/server.sh
COPY config/php81.conf /etc/apache2/conf.d/php81.conf
