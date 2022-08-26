docker run -d \
  --rm \
  --name mysql-container \
  --network todo-app \
  --network-alias mysql \
  -v todo-mysql-data:/var/lib/mysql \
  -e MYSQL_ROOT_PASSWORD=password \
  -e MYSQL_DATABASE=session \
  mysql:5.7