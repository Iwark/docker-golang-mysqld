# ベースイメージ
FROM iwark/golang:latest

# 作成者情報
MAINTAINER Kohei Iwasaki kohei.iwasaki@antelos.co.jp

ENV PACKAGE_URL http://dev.mysql.com/get/mysql-community-release-el6-5.noarch.rpm

# MySQLのインストール
RUN yum install -y $PACKAGE_URL \
  && rm -rf /var/cache/yum/*
RUN mkdir /docker-entrypoint-initdb.d
VOLUME /var/lib/mysql
COPY docker-entrypoint.sh /entrypoint.sh
RUN chmod 0755 /entrypoint.sh 
RUN ls -las /entrypoint.sh 
ENTRYPOINT ["/entrypoint.sh"]
EXPOSE 3306
CMD ["mysqld"]