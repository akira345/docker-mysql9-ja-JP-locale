FROM mysql:9

# install and setting locale
RUN microdnf update -y && \
    microdnf install -y glibc-locale-source glibc-langpack-ja && \
    microdnf clean all && \
    localedef -i ja_JP -f UTF-8 ja_JP.UTF-8
ENV LC_ALL=ja_JP.UTF-8

# copy from custom my.cnf file
COPY ./my.cnf /etc/mysql/conf.d/
