<template>
  <section
    id="footer-top"
    :class="
      $vuetify.theme.dark
        ? 'blue-grey darken-4 grey--text text--lighten-1'
        : 'grey lighten-3 grey--text text--darken-4'
    "
  >
    <v-container>
      <v-row> </v-row>
    </v-container>
  </section>
</template>

<script>
export default {
  components: {},
  data() {
    return {
      social: [
        {
          platform: 'Facebook',
          link: 'https://www.facebook.com/',
          icon: 'mdi-facebook',
        },
        {
          platform: 'Twitter',
          link: 'https://twitter.com/',
          icon: 'mdi-twitter',
        },
        {
          platform: 'Instagram',
          link: 'https://www.instagram.com/',
          icon: 'mdi-instagram',
        },
        {
          platform: 'Linkedin',
          link: 'https://www.linkedin.com/',
          icon: 'mdi-linkedin',
        },
        {
          platform: 'Github',
          link: 'https://modevue.staticdesigner.com/',
          icon: 'mdi-github',
        },
      ],
    }
  },
}
</script>
