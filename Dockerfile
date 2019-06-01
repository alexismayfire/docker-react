FROM node:alpine as builder
WORKDIR /usr/app
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx
EXPOSE 8080
COPY --from=builder /usr/app/build /usr/share/nginx/html