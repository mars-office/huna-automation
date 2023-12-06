# Get the latest version of Playwright
FROM mcr.microsoft.com/playwright:next
RUN useradd -m -d /home/playwrightuser -s /bin/bash playwrightuser
RUN mkdir -p /home/playwrightuser
RUN chown -R playwrightuser:playwrightuser /home/playwrightuser
# Set the work directory for the application

WORKDIR /home/playwrightuser

# COPY the needed files to the app folder in Docker image
COPY package.json .
COPY package-lock.json .

COPY tests/ ./tests/
COPY tsconfig.json .
COPY playwright.config.ts .
RUN npm ci
RUN npx playwright install --with-deps chromium
ENV CI='true'
USER playwrightuser
CMD npm run test
ARG DEPLOYABLE_VERSION
ENV DEPLOYABLE_VERSION=${DEPLOYABLE_VERSION}