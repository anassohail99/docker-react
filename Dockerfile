FROM node:alpine as builder

WORKDIR "/app"

COPY package.json .

RUN yarn 

COPY . .

RUN yarn run build

FROM ngnix
COPY --from=builder /app/build/usr/share/nginx .

