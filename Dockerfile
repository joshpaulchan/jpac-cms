FROM node:11

LABEL Name=cms Version=0.0.1

# install build tools and strapi
RUN npm install -g strapi

# set working directory
WORKDIR /opt/cms

# pull in source + dependencies list
ADD . /opt/cms

# install dependencies
RUN npm install

EXPOSE 1337

# set env vars
ENV NODE_ENV=production

# run
ENTRYPOINT ["strapi"]
CMD ["start"]