# Get the latest version of Playwright
FROM mcr.microsoft.com/playwright:next
 
# Set the work directory for the application
WORKDIR /app
 
# COPY the needed files to the app folder in Docker image
COPY package.json /app/
COPY package-lock.json /app/

COPY tests/ /app/tests/
COPY tsconfig.json /app/
COPY playwright.config.ts /app/
RUN npm install
CMD npm run test
USER playwright