<template>
  <section
    :class="$vuetify.theme.dark ? 'grey darken-1' : 'grey darken-1'"
    class="py-16"
  >
    <v-container id="Apply">
      <v-row>
        <v-col cols="12" md="3">
          <v-card>
            <v-card-title>
              <p class="text-h6 text-uppercase text-center">Applicants</p>
            </v-card-title>
            <v-card-text>
              <p class="text font-weight-light">
                Players are expected to be open to suggestions and to
                constructive criticism. We look for players that know their
                classes, specs as well as raid mechanics. Trial periods lengths
                are case by case but will not come in as bench warmers as we
                want to see how you can perform in progression.
              </p>
            </v-card-text>
          </v-card>
        </v-col>
        <v-col cols="12" md="3">
          <v-card>
            <v-card-title>
              <p class="text-h6 text-uppercase text-center">Attendance</p>
            </v-card-title>
            <v-card-text>
              <p class="text font-weight-light">
                We understand that things can come up and schedules can change.
                It will never be held against you if you have to miss a raid due
                to real life circumstances. Notice of absence is required using
                the guild's discord.
              </p>
            </v-card-text>
          </v-card>
        </v-col>
        <v-col cols="12" md="3">
          <v-card>
            <v-card-title>
              <p class="text-h6 text-uppercase text-center">Raid Schedule</p>
            </v-card-title>
            <v-card-text>
              <ul class="text font-weight-light">
                <li>Tuesday and Wednesday</li>
                <li>8:30-11:30pm CST / 9:30-12:30pm EST</li>
                <li>10 minute break</li>
              </ul>
            </v-card-text>
          </v-card>
        </v-col>
        <v-col cols="12" md="3">
          <v-card color="red darken-2">
            <v-card-title>
              <p class="text-h6 text-uppercase">Apply!</p>
            </v-card-title>
            <v-card-text class="text text-center">
              <v-btn
                class="v-btn v-btn--is-elevated v-btn--has-bg v-btn--rounded black--text v-size--x-large primary dark"
                href="https://docs.google.com/forms/d/1cf5m87_k2tjNy4HTYKjF-jFOQvPfaYiaZz7kBHe_YfU/edit?usp=sharing"
                target="_blank"
              >
                Guild Application
              </v-btn>
              <p class="text my-2">Please apply online</p>
            </v-card-text>
          </v-card>
        </v-col>
      </v-row>
    </v-container>
  </section>
</template>

<script>
export default {
  data() {
    return {}
  },
}
</script>

<style scoped>
.zoom {
  transform: scale(1.025) translate(0, -10px);
  transition: transform 0.2s;
}
.notzoom {
  transition: transform 0.2s;
}
</style>
