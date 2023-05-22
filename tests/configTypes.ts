import { Browser, Page } from "playwright";

declare global {
  const page: Page;
  const browser: Browser;
  const browserName: string;
}

export default {
  HUNA_URL: process.env.HUNA_URL ?? 'https://local.huna2.com',
  };