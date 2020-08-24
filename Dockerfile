FROM node:lts

WORKDIR /app/website

EXPOSE 3000 35729
COPY ./website /app/website
RUN npm config set registry https://repo1.uhc.com/artifactory/api/npm/npm-virtual
RUN yarn install
RUN yarn run build
RUN npm install --global http-server

CMD ["http-server", "build/devopswithbailey", "-p", "3000"]
