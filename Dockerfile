FROM node:12.4.0-alpine as build

RUN mkdir -p /app/reactUI
WORKDIR /app/reactUI
COPY package.json package-lock.json ./
RUN npm install
