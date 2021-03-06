---
title: Building A Blog Using Docusaurus With Custom Domain at Cost of $12 A Year 
author: DevOpsWithBailey
authorURL: https://www.youtube.com/channel/UC26aYnf6SB4oaQNIzvD2GLQ?view_as=subscriber
---
10 minutes read

Publishing your blog website at GitHub Pages for free. The only cost($12 per year) is for custom domain if you do not want to use GitHub Pages domain.

<!--truncate-->

## Installing Docusaurus
Please refer to https://docusaurus.io/docs/en/installation

## Running Docusaurus in Blog Only mode
Please refer to https://docusaurus.io/docs/en/adding-blog#i-want-to-run-in-blog-only-mode

## Publishing Your Site Using GitHub Pages
Please refer to https://docusaurus.io/docs/en/publishing#using-github-pages
### Custom Domain
1. Server Side Config
    ```
    siteConfig.js

    url: 'https://devopswithbailey.com', // Your website URL
    baseUrl: '/', // Base URL for your project */
    // For github.io type URLs, you would set the url and baseUrl like:
    //   url: 'https://facebook.github.io',
    //   baseUrl: '/test-site/',
    cname: 'devopswithbailey.com', // Your domain
    ```
    **Note:** For custom domain type URLs, you would set baseUrl to '/' instead of your project path, or else it would not load the correct path for CSS and JS. 
2. Domain Config
    
    Add A records for your DNS, which pints your domain to GitHub Pages IP addresses.
    ![dns a records](/img/dns/google_domain_dns_a_records.png)  
### CICD Using Travis CI
Please refer to https://docusaurus.io/docs/en/publishing#using-travis-ci

## Enabling FacebookComments 
```
siteConfig.js

facebookAppId: '931278130705150',
facebookComments: true,
```
1. facebookAppId [string]
    If you want Facebook Like/Share buttons in the footer and at the bottom of your blog posts, provide a [Facebook application id](https://developers.facebook.com/docs/apps/#register).

2. facebookComments [boolean]
    Set this to true if you want to enable Facebook comments at the bottom of your blog post. facebookAppId has to be also set.
![facebook comments](/img/site_config/facebook_comments.png)

## Track page views
```
siteConfig.js

gaTrackingId: 'UA-176081093-1', 
// Google Analytics tracking ID to track page views.
// Sign up Google Analytics at https://marketingplatform.google.com/about/analytics/
```

Source code can be found at [GitHub](https://github.com/devopswithbailey/blogs)
