#Preparing base that can be used for development
FROM node:14-alpine

ENV APP_PATH=/home/node/app/
ENV NPM_CACHE_PATH=/home/node/npm_temporary_cache/

RUN npm i -g npm@7

RUN mkdir -p $APP_PATH
WORKDIR $APP_PATH

COPY package*.json $APP_PATH

RUN chown -R node:node $APP_PATH

USER node

RUN mkdir -p $NPM_CACHE_PATH
RUN npm install -f --cache $NPM_CACHE_PATH
RUN rm -rf $NPM_CACHE_PATH

EXPOSE $PORT

CMD ["npm", "start"]
