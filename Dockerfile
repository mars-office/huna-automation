# Get the latest version of Playwright
FROM jacoblincool/playwright:chromium-light
 
# Set the work directory for the application
WORKDIR /app
 

# COPY the needed files to the app folder in Docker image
COPY package.json /app/
COPY package-lock.json /app/
RUN npm install
RUN npx playwright install

COPY tests/ /app/tests/
COPY tsconfig.json /app/
COPY playwright.config.ts /app/

# Install the dependencies in Node environment
RUN npm install

CMD npm run test