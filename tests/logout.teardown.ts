import { test as teardown, expect } from "@playwright/test";
import endpoint from "./configTypes";

const authFile = ".auth/user.json";

teardown("logout", async ({ page }) => {
  await page.goto(endpoint.HUNA_URL);
  await page.waitForLoadState('networkidle');
  await page.getByTestId("usermenu").click();
  await page.getByTestId("logoutButton").waitFor({state: 'visible'});
  await page.getByTestId("logoutButton").click();
  await page.getByTestId("usermenu").click();
  await page.getByTestId("userName").waitFor({state: 'visible'});
  const usernameInPage = await page.getByTestId("userName").textContent();
  expect(usernameInPage).toBe("Anonymous");
  await page.context().storageState({ path: authFile });
});