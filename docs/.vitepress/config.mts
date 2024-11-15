import { defineConfig } from 'vitepress'

export default defineConfig({
  title: "rCord",
  description: "The official documentation page for rCord",
  base: "/rcord/",
  themeConfig: {
    logo: '/assets/logo.png',
    nav: [
      { text: 'Home', link: '/' },
      { text: 'Getting Started', link: '/gs/introduction' },
      { text: 'API References', link: '/rf/rcord' }
    ],

    sidebar: [
      {
        text: 'Getting Started',
        items: [
          { text: 'Introduction', link: '/gs/introduction' },
          { text: 'Installation', link: '/gs/installation' },
          { text: 'Usage', link: '/gs/usage' }
        ]
      },
      {
        text: 'API Refrences',
        items: [
          { text: 'rCord', link: '/rf/rcord' },
          { text: 'Webhook', link: '/rf/webhook' },
          { text: 'Message', link: '/rf/message' },
          { text: 'Embed', link: '/rf/embed' }
        ]
      }
    ],

    socialLinks: [
      { icon: 'github', link: 'https://github.com/GarandDev/rcord' }
    ]
  }
})
