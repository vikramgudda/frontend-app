# Stage 1
# FROM node:14 as build-stage

# WORKDIR /frontend
# COPY package.json .
# RUN npm install
# RUN npm install react-icons --save
# COPY . .

# ARG REACT_APP_API_BASE_URL
# ENV REACT_APP_API_BASE_URL=$REACT_APP_API_BASE_URL

# RUN npm run build

# # Stage 2
# FROM nginx:1.17.0-alpine

# COPY --from=build-stage /frontend/build /usr/share/nginx/html
# EXPOSE $REACT_DOCKER_PORT

# CMD nginx -g 'daemon off;'
# EXPOSE 3000 80

# ENTRYPOINT ["nginx", "-g", "daemon off;"]
# FROM node:14 as build-stage
# WORKDIR /frontend
# COPY package.json ./
# COPY package-lock.json ./
# COPY ./ ./
# RUN npm i
# RUN npm install react-icons --save
# CMD ["npm", "run", "start"]
FROM node:14-slim

WORKDIR /usr/app
COPY package.json ./
RUN npm install
RUN npm install react-icons --save

COPY . .

EXPOSE 3000
CMD ["npm", "start"]