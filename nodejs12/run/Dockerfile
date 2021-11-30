FROM node:12
WORKDIR /usr/app
COPY ./dist/ ./dist
COPY ./package.json ./
RUN ls -la dist
RUN ls -la dist/node_modules
CMD ["npm", "start"]
