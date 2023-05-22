# Get the base image of Node version 18
FROM node:18

# Get the latest version of Playwright
FROM mcr.microsoft.com/playwright:focal
 
# Set the work directory for the application
WORKDIR /app
 
# Set the environment path to node_modules/.bin
ENV PATH /app/node_modules/.bin:$PATH

# Get the needed libraries to run Playwright
RUN apt-get update && apt-get -y install libnss3 libatk-bridge2.0-0 libdrm-dev libxkbcommon-dev libgbm-dev libasound-dev libatspi2.0-0 libxshmfence-dev

# COPY the needed files to the app folder in Docker image
COPY package.json /app/
COPY package-lock.json /app/
RUN npm install

COPY tests/ /app/tests/
COPY tsconfig.json /app/
COPY config.toml /app/

# Install the dependencies in Node environment
RUN npm install

CMD npm run test