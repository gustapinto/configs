dcexec() {
    docker-compose exec "$1" "$2"
}

dcbash() {
    docker-compose exec "$1" bash
}
