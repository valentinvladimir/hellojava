FROM node

RUN apt-get update && apt-get upgrade -y \
    && apt-get clean

RUN npm install --only=production

EXPOSE 3000

RUN echo "Pipeline test no. 3!"

CMD [ "npm", "start" ]
