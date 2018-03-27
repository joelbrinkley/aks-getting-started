param(
    [switch]$build
)
if($build){
    docker-compose -f .\docker-compose.yml -f .\docker-compose.build.yml -f .\docker-compose.local.yml up -d --scale todo-service=3 --build
}
else{
    docker-compose -f .\docker-compose.yml -f .\docker-compose.build.yml -f .\docker-compose.local.yml up -d --scale todo-service=3
}
