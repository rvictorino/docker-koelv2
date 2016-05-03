# based on etopian/docker-koel (koel v1, master)
FROM etopian/docker-koel

MAINTAINER rvictorino

RUN apk add --update git nodejs python build-base

WORKDIR /DATA/htdocs

RUN su nginx -c "git init && git remote add koel https://github.com/phanan/koel.git && git fetch --all && git checkout v2.2.0 && npm rebuild && npm install"

RUN su nginx -c "composer clearcache && rm -rf vendor && rm -rf bootstrap/cache/*"

RUN su nginx -c "composer config github-oauth.github.com 0f03ba2bdb01ce456e3b3c267bb4f1c630e13f99"

RUN su nginx -c "composer install"

