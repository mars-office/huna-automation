import endpoint from "./configTypes"
import { test, expect } from '@playwright/test'

test("Expect nothing", async ({ page }) => {

  // Go to the Droplets product page of DigitalOcean web page
  await page.goto(endpoint.HUNA_URL);

  // Wait for the page to load
  await page.waitForLoadState('networkidle');

  expect(true).toBe(true)
});