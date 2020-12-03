FROM openjdk:alpine as builder
LABEL stage=intermediate

SHELL ["/bin/ash", "-o", "pipefail", "-c"]
RUN apk update &&\
    apk --no-cache add curl &&\
    curl -sL https://github.com/yui/yuicompressor/releases/download/v2.4.8/yuicompressor-2.4.8.jar -o /var/opt/yuicompressor.jar &&\
    apk del curl

COPY ./dockerfile-commons/reduce_alpine.sh /tmp/
COPY ./ld-musl-x86_64.path.j2 /tmp/
RUN apk add --virtual .envsubst gettext libintl &&\
    envsubst < /tmp/ld-musl-x86_64.path.j2 > /tmp/ld-musl-x86_64.path &&\
    mv /tmp/ld-musl-x86_64.path /etc &&\
    apk del .envsubst
RUN ln -sf $JAVA_HOME/jre/bin/java /usr/bin/java

RUN chmod +x /tmp/reduce_alpine.sh &&\
    /tmp/reduce_alpine.sh -v /target java\
                                     "$JAVA_HOME/jre/lib/amd64/libjava.so"\
                                     "$JAVA_HOME/jre/lib/amd64/server/libjvm.so"\
                                     "$JAVA_HOME/jre/lib/amd64/libzip.so"\
                                     \
                                     "$(find $JAVA_HOME/jre/lib | grep -v amd64)"\
                                     /var/opt/*

COPY docker-entrypoint.sh /target/usr/local/bin/
RUN chmod +x /target/usr/local/bin/docker-entrypoint.sh


FROM scratch
LABEL \
    stage=production \
    org.label-schema.name="tiny-yuicompressor" \
    org.label-schema.description="Minify your Javascript/CSS." \
    org.label-schema.vcs-url="https://github.com/piotr-semenov/yuicompressor-docker.git" \
    maintainer='Piotr Semenov <piotr.k.semenov@gmail.com>'

COPY --from=builder /target /

ENTRYPOINT ["docker-entrypoint.sh"]
