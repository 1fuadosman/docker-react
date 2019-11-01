FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx
# below step: copy the above phase 'builder' and specifically /app/build and then put it in '/usr/share/nginx/html'
COPY --from=builder /app/build /usr/share/nginx/html

