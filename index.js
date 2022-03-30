const { exit } = require('process');
const puppeteer = require('puppeteer');
const config = require('./config.json');

async function main() {
    const browser = await puppeteer.launch(
        {
            headless: false,
            userDataDir: __dirname + '/chrome_data'
        });

    const page = await browser.newPage();
    await page.goto(config.page);

    await page.waitForSelector('#login');
    await page.type('#login', config.user);
    await page.type('#passwd', config.pass);

    await page.click('#nsg-x1-logon-button');
    
    await page.waitForTimeout(1000);
    await page.waitForSelector('.storeapp-details-link');
    await page.click('.storeapp-details-link');

    await page.waitForTimeout(8000);
    await browser.close();

}
main();