# Get the latest version of Playwright
FROM jacoblincool/playwright:chromium-light
 
# Set the work directory for the application
WORKDIR /app
 
ENV PLAYWRIGHT_SKIP_BROWSER_DOWNLOAD="1"
ENV PLAYWRIGHT_BROWSERS_PATH="0"
# COPY the needed files to the app folder in Docker image
COPY package.json /app/
COPY package-lock.json /app/

COPY tests/ /app/tests/
COPY tsconfig.json /app/
COPY playwright.config.ts /app/
RUN npm install
CMD npm run test