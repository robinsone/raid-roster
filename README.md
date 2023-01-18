# raid-roster

## Dev Notes

- fork/clone repository
- Update `roster.json` file with server and players
- Update `~\raid-roster\components\siteHeader.vue` with guild name
- Update `~\raid-roster\components\sections\Hero.vue` with guild blurb
  
In order to run the app
 - `npm install`
 - `npm run dev`
 - navigate to `[loc](http://localhost:3000)`

Deploy your app to github pages
- ensure your repository settings is setup. Here helpful info - [github docs](https://docs.github.com/en/pages/getting-started-with-github-pages/configuring-a-publishing-source-for-your-github-pages-site#publishing-from-a-branch)
- once you push to the `main` branch there should be a Github Action that will deploy it.
