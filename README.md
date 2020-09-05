# Build A Blog Using Docusaurus With Custom Domain at cost of $12 A Year
Publishing your blog website at GitHub Pages for free. The only cost($12 per year) is for custom domain if you do not want to use GitHub Pages domain.

## Installing Docusaurus
Please refer to https://docusaurus.io/docs/en/installation

## Run Docusaurus in Blog Only mode
Please refer to https://docusaurus.io/docs/en/adding-blog#i-want-to-run-in-blog-only-mode

Also, you can refer to [index.html](website/static/index.html)

## Publishing Your Site Using GitHub Pages
Please refer to https://docusaurus.io/docs/en/publishing#using-github-pages
### Custom Domain
1. Server Side Config
    [Custom Domain](website/siteConfig.js)
    ```
    url: 'https://devopswithbailey.com', // Your website URL
    baseUrl: '/', // Base URL for your project */
    // For github.io type URLs, you would set the url and baseUrl like:
    //   url: 'https://facebook.github.io',
    //   baseUrl: '/test-site/',
    ```
    **Note:** 
2. Domain Config
    Add A records for your DNS, which pints your domain to GitHub Pages IP addresses.
    

## Enabling Search 
