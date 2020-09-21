FROM node:12.18.4-alpine
WORKDIR app
RUN ls -a
COPY package.json /app
COPY node_modules /app/node_modules
COPY .next /app/.next
COPY public /app/public
CMD npm run start