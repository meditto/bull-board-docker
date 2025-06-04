FROM node:16.13-alpine

WORKDIR /usr/app

COPY ./package.json .
COPY ./yarn.lock .

ENV NODE_ENV production
ENV REDIS_HOST 'oregon-keyvalue.render.com'
ENV REDIS_USERNAME: 'red-csc15j08fa8c738rjmcg'
ENV REDIS_PASSWORD 'Pqk06tGzH13c1bvkhy1wkAQ2eFledr6P'
ENV REDIS_PORT 6379
ENV REDIS_USE_TLS true
ENV BULL_PREFIX bull
ENV BULL_VERSION BULLMQ
ENV USER_LOGIN ''
ENV USER_PASSWORD ''
ENV REDIS_DB 0
ENV PROXY_PATH ''

RUN yarn install

COPY . .

ARG PORT=3000
ENV PORT $PORT
EXPOSE $PORT

CMD ["node", "src/index.js"]
