# Get the latest version of Playwright
FROM mcr.microsoft.com/playwright:next-jammy-amd64
 
# Set the work directory for the application
WORKDIR /app
 
# Set the environment path to node_modules/.bin
ENV PATH /app/node_modules/.bin:$PATH

# Get the needed libraries to run Playwright
RUN apt-get update && apt-get upgrade -y && apt-get -y install libnss3 libatk-bridge2.0-0 libdrm-dev libxkbcommon-dev libgbm-dev libasound-dev libatspi2.0-0 libxshmfence-dev

# COPY the needed files to the app folder in Docker image
COPY package.json /app/
COPY package-lock.json /app/
RUN npm install

COPY tests/ /app/tests/
COPY tsconfig.json /app/
COPY playwright.config.ts /app/

# Install the dependencies in Node environment
RUN npm install

CMD npm run test