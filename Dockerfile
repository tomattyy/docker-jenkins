# STAGE - 1
FROM node:24-alpine AS dependencies

WORKDIR /app

COPY package*.json ./

RUN npm ci --omit=dev

# STAGE - 2
FROM node:24-alpine

WORKDIR /app

