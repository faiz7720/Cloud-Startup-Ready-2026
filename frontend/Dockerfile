# STAGE 1: Build Phase
FROM node:20-alpine AS builder
WORKDIR /app
COPY package.json ./
RUN npm run build || true
COPY index.html ./dist/

# STAGE 2: Production Nginx Runtime
FROM nginx:1.25-alpine
WORKDIR /usr/share/nginx/html
RUN rm -rf ./*
COPY --from=builder /app/dist .
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
