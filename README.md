# docker-koel - Alpine Linux, PHP-FPM, Nginx, NodeJS and Koel v2.2.0
This Dockerfile provides a koel image based on etopian/docker-koel with an updated version (2.2.0) of koel.

Original container: https://github.com/etopian/docker-koel

Issue: https://github.com/phanan/koel/issues/10

Documentation: https://qoba.lt/koel_with_docker.html

Replace the etopian/docker-koel image by rvictorino/koelv2 to use this one instead.

Following is etopian/docker-koel README.md content



The .env file is dynamic using Docker variables.

You can expose /DATA/music and put all your music there. Make sure the permissions are fixed on the host:

`chown 100:101 /DATA/music`

```
docker run -e DB_HOST="172.17.0.1" -e DB_DATABASE="db_name" .. -v /my-mp3s:/DATA/music etopian/docker-koel 

All variables available, via -e switch of docker run as above. All these need to be set or it will not work properly.

    DB_HOST="172.17.0.1"
    DB_DATABASE=""
    DB_USERNAME=""
    DB_PASSWORD=""
    ADMIN_EMAIL=""
    ADMIN_NAME=""
    ADMIN_PASSWORD=""
    APP_DEBUG=false
    AP_ENV=production
```

After this init the site via exec

```
docker exec -i {container}  bash -c "cd /DATA/htdocs && php artisan koel:init"
```

If you want to link a database container you can do it with this image.. just specify the link as the DB_HOST, i.e. if the link is called mysql then say -e DB_HOST=mysql.

If you are trying to build the image, you need to provide a GitHub token in the Dockerfile. The given token is revoked.
