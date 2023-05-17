<template>
  <section
    id="Streams"
    style="background-color: #6441a5"
    class="primary--text py-16 primary--text"
  >
    <v-row class="text-center">
      <v-col>
        <h2 class="text-h4 text-sm-h3 text-capitalize font-weight-black mb-4">
          STREAMS
        </h2>
      </v-col>
    </v-row>
    <v-row no-gutters>
      <v-col cols="12">
        <v-container>
          <v-row class="py-16">
            <v-row>
              <v-col class="d-flex" cols="12" md="4">
                <iframe
                  src="https://player.twitch.tv/?channel=xaide_1&parent=robinsone.github.io"
                  frameborder="0"
                  allowfullscreen="true"
                  scrolling="no"
                  height="214"
                  width="620"
                >
                </iframe>
              </v-col>
              <v-col class="d-flex" cols="12" md="4">
                <iframe
                  src="https://player.twitch.tv/?channel=ENDERS03&parent=robinsone.github.io"
                  frameborder="0"
                  allowfullscreen="true"
                  scrolling="no"
                  height="214"
                  width="620"
                >
                </iframe>
              </v-col>
              <v-col class="d-flex" cols="12" md="4">
                <iframe
                  src="https://player.twitch.tv/?channel=ogblazs&parent=robinsone.github.io"
                  frameborder="0"
                  allowfullscreen="true"
                  scrolling="no"
                  height="214"
                  width="620"
                >
                </iframe>
              </v-col>
            </v-row>
          </v-row>
        </v-container>
      </v-col>
    </v-row>
  </section>
</template>

<script>
export default {
  data() {
    return {}
  },
}
</script>
