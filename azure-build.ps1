docker build -f .\docker\TodoService\dockerfile -t tstraubk8shackfest.azurecr.io/todo-service:v1 .
docker push tstraubk8shackfest.azurecr.io/todo-service:v1

docker build -f .\docker\TodoWebApp\dockerfile -t tstraubk8shackfest.azurecr.io/todo-webapp:v1 .
docker push tstraubk8shackfest.azurecr.io/todo-webapp:v1