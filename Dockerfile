FROM centos/httpd:latest
# FROM centos/httpd-24-centos7:latest
# USER root
RUN INSTALL_PKGS="apr-util-mysql mod_authnz_pam mod_session" && \
  yum install -y ${INSTALL_PKGS} && \
  rpm -V apr-util-mysql && \
  yum -y clean all --enablerepo='*'
# https://random-tech-note.jp/install-mysql-client57/
# https://blog.katsubemakito.net/mysql/mysql-update-error-gpg
RUN yum localinstall https://dev.mysql.com/get/mysql80-community-release-el7-3.noarch.rpm -y && \
  yum-config-manager --disable mysql80-community && \
  yum-config-manager --enable mysql57-community && \
  rpm --import https://repo.mysql.com/RPM-GPG-KEY-mysql-2022 && \
  yum install mysql-community-client -y
