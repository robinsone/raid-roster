FROM node:12.16.0-buster

WORKDIR /app

COPY package*.json ./
RUN npm install
COPY . .

# build app for production with minification
RUN npm run build

EXPOSE 8080
CMD [ "http-server", "dist" ]

