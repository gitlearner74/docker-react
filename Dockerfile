#Specify the base image
FROM node:alpine as builder

# copy local

WORKDIR /usr/app

COPY ./package.json .

# install dependencies

RUN npm install

COPY ./ ./

# default command

CMD ["npm", "start", "build"]

FROM nginx
EXPOSE 80
COPY --from=builder /usr/app/build /usr/share/nginx/html