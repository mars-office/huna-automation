import endpoint from "./configTypes"
import { test, expect } from '@playwright/test'

test("Logged in user", async ({ page }) => {
  await page.goto(endpoint.HUNA_URL);
  await page.waitForLoadState('networkidle');
  expect(true).not.toBe(false);
});