FROM node

RUN apt-get update && apt-get upgrade -y \
    && apt-get clean

RUN npm install --only=production

EXPOSE 3000

CMD [ "npm", "start" ]
