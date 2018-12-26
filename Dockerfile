FROM node:11-alpine

LABEL Name=cms Version=0.0.1

# set env vars
ENV NODE_ENV=production

# install build tools and strapi
RUN apk update && apk add yarn python g++ make && rm -rf /var/cache/apk/* && npm install -g strapi

# set working directory
WORKDIR /opt/cms

# pull in source + dependencies list
ADD . /opt/cms

RUN npm install

EXPOSE 1337

# run
ENTRYPOINT ["strapi"]
CMD ["start"]