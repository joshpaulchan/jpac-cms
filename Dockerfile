FROM strapi/strapi

LABEL Name=cms Version=0.0.1

# set working directory
WORKDIR /usr/src/cms

# pull in source + dependencies list
ADD . /usr/src/cms

# run
CMD ["./strapi.sh"]
