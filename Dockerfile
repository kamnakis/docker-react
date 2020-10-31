FROM node:14.13.1-alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

# /app/build <--- COPY TO SERVER PHASE

FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html