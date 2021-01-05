#Specify the base image
FROM node:alpine

# copy local

WORKDIR '/app'

COPY ./package*.json ./

# install dependencies

RUN npm install

COPY . .

# default command

CMD ["npm", "start", "build"]

FROM nginx
EXPOSE 80
COPY --from=0 /app/build /usr/share/nginx/html