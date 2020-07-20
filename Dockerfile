FROM nginx
ENV AUTHOR=Docker

WORKDIR /usr/share/nginx/html
COPY Hello_docker.html /usr/share/nginx/html

CMD cd /usr/share/nginx/html && sed -e s/Docker/"$AUTHOR"/ Hello_docker.html > index.html ; nginx -g 'daemon off;'

CMD mkdir -p $JENKINS_HOME/.docker/ && \
    echo '{"auths":{}}' > $JENKINS_HOME/.docker/config.json
ENV DOCKER_CONFIG=$JENKINS_HOME/.docker

