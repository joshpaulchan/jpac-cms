FROM node:11-alpine

LABEL Name=cms Version=0.0.1

# install build tools and strapi (unsafe-perm needs to be set to build strapi)
RUN npm config set unsafe-perm=true && npm install -g strapi

# set working directory
WORKDIR /opt/cms

# pull in source + dependencies list
ADD . /opt/cms

# install dependencies and configure project
RUN npm install

EXPOSE 1337

# set env vars
ENV NODE_ENV=production

# run
ENTRYPOINT ["strapi"]
CMD ["start"]