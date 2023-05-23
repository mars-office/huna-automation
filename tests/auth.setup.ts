import { test as setup, expect } from "@playwright/test";
import endpoint from "./configTypes";

const authFile = ".auth/user.json";

setup("authenticate", async ({ page }) => {
  // Go to the Droplets product page of DigitalOcean web page
  await page.goto(endpoint.HUNA_URL + '/login');
  // Wait for the page to load
  await page.waitForLoadState("networkidle");
  await page.getByRole("button", { name: "Login with Microsoft" }).click();
  await page.waitForURL(x => x.toString().startsWith("https://login.microsoftonline.com/"), {waitUntil: 'networkidle'});
  await page.getByLabel("Email, phone, or Skype").fill(process.env.HUNA_LOGIN_EMAIL!);
  await page.getByLabel("Email, phone, or Skype").press("Enter", {delay: 100});
  await page.getByLabel("Password").fill(process.env.HUNA_LOGIN_PASSWORD!);
  await page.getByLabel("Password").press("Enter", {delay: 100});
  await page.getByRole("button", { name: "Yes" }).click({delay: 1000});
  await page.waitForURL(endpoint.HUNA_URL, {
    waitUntil: 'networkidle'
  });
  await page.waitForTimeout(1000);
  await page.context().storageState({ path: authFile });
});
