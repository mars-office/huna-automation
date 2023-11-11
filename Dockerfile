# Get the latest version of Playwright
FROM mcr.microsoft.com/playwright:next
RUN apt-get -y update
RUN apt-get -y upgrade
RUN mkdir -p /home/pwuser
RUN chown -R pwuser:pwuser /home/pwuser
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
