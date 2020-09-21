# syntax = docker/dockerfile:experimental

FROM node:12.18.4-alpine as builder
WORKDIR app

# Install dependencies
COPY ./package.json /app
RUN --mount=type=cache,target=/root/.npm npm install

# Build production ready deployment
COPY ./pages /app/pages
COPY ./public /app/public
COPY ./styles /app/styles
RUN npm run build

FROM node:12.18.4-alpine
WORKDIR app
COPY --from=builder app/package.json /app
COPY --from=builder app/node_modules /app/node_modules
COPY --from=builder app/.next /app/.next
COPY --from=builder app/public /app/public
CMD npm run start
