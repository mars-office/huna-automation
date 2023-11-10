# Get the latest version of Playwright
FROM mcr.microsoft.com/playwright:next
RUN apt-get -y update
RUN apt-get -y upgrade
RUN useradd -rm -d /home/pwuser -s /bin/bash -g root -G sudo -u 1001 pwuser
USER pwuser
# Set the work directory for the application
WORKDIR /home/pwuser
 
# COPY the needed files to the app folder in Docker image
COPY package.json /home/pwuser/
COPY package-lock.json /home/pwuser/

COPY tests/ /home/pwuser/tests/
COPY tsconfig.json /home/pwuser/
COPY playwright.config.ts /home/pwuser/
RUN npm install
CMD npm run test
