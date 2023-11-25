import endpoint from "./configTypes"
import { test, expect } from '@playwright/test'

test("Logged in user", async ({ page }) => {
  await page.goto(endpoint.HUNA_URL);
  await page.waitForLoadState('networkidle');
  await page.getByTestId("usermenu").click();
  await page.getByTestId("userName").waitFor({state: 'visible'});
  const usernameInPage = await page.getByTestId("userName").textContent();
  expect(usernameInPage).toBeDefined();
  expect(usernameInPage).not.toBe("Anonymous");
});