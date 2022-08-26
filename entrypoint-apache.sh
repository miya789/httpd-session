docker build -t test-apache .
docker run -d \
  --name apache-container \
  --network todo-app \
  -v ${PWD}/httpd/conf/httpd.conf:/etc/httpd/conf/httpd.conf \
  -v ${PWD}/passwd:/etc/httpd/passwd \
  -v ${PWD}/html:/var/www/html \
  -e MYSQL_HOST=mysql \
  -e MYSQL_USER=root \
  -e MYSQL_PASSWORD=password \
  -e MYSQL_DB=session \
  -p 80:80 \
  test-apache
