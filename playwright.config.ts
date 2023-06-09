import dotenv from "dotenv";
import { defineConfig, devices } from "@playwright/test";

dotenv.config();

export default defineConfig({
  projects: [
    { name: "setup", testMatch: /.*\.setup\.ts/, teardown: "teardown" },

    {
      name: "chromium",
      use: {
        ...devices["Desktop Chrome"],
        storageState: ".auth/user.json",
        launchOptions: {},
      },
      dependencies: ["setup"],
    },

    {
      name: "teardown",
      testMatch: /.*\.teardown\.ts/,
      use: {
        ...devices["Desktop Chrome"],
        storageState: ".auth/user.json",
        launchOptions: {},
      },
    },
  ],
});
