<template>
  <v-footer
    :class="
      $vuetify.theme.dark
        ? 'blue-grey darken-4 grey--text text--lighten-1'
        : 'grey lighten-3 grey--text text--darken-4'
    "
    class="site-footer"
  >
    <v-container>
      <v-row>
        <!-- <v-col cols="12" md="7">
          <div
            class="d-flex flex-wrap justify-md-start justify-center justify-md-none"
          ></div
        ></v-col> -->
        <v-col class="text--secondary text-center">
          {{ new Date().getFullYear() }} ©
          <nuxt-link class="primary--text" to="/">Robinsone</nuxt-link>
        </v-col>
      </v-row>
    </v-container>
  </v-footer>
</template>

<script>
export default {
  data() {
    return {
      menu: [
        { text: 'Support', link: '#' },
        { text: 'Contact Us', link: '#' },
        { text: 'Disclaimer', link: '#' },
        { text: 'Covid-19 Operation', link: '#' },
      ],
    }
  },
}
</script>

<style>
.site-footer a {
  text-decoration: none;
}
</style>
