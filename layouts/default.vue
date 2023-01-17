<template>
  <v-app dark>
    <siteHeader />
    <v-main>
      <nuxt />
    </v-main>
    <siteFooter />
  </v-app>
</template>

<script>
import siteHeader from '~/components/siteHeader.vue'
import siteFooter from '~/components/siteFooter.vue'
export default {
  components: {
    siteHeader,
    siteFooter,
  },
  head() {
    return {
      script: [
        {
          src: 'https://www.googletagmanager.com/gtag/js?id=G-0DYDMZEYDZ',
        },
      ],
    }
  },
}
</script>

<style></style>
