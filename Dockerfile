# Setup BUILD environment
FROM node:14.5.0 as build
WORKDIR /app
ENV PATH /app/node_modules/.bin:$PATH
COPY package.json ./
COPY package-lock.json ./
# TODO: This needs cleanup - why both 'ci' (20sec) and 'install'(58sec)??? Can I cache the 'node_modules'?
RUN npm ci --silent
RUN npm install react-scripts@3.4.1 -g --silent
COPY . ./
RUN npm run build

# Create PRODUCTION environment
FROM nginx:stable-alpine
COPY --from=build /app/build /usr/share/nginx/html
RUN rm /etc/nginx/conf.d/default.conf
COPY nginx/nginx.conf /etc/nginx/conf.d
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
