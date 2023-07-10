<template>
  <section
    :class="$vuetify.theme.dark ? 'grey darken-4' : 'grey lighten-4'"
    class="py-16"
  >
    <v-container id="Team" class="text-center">
      <v-row>
        <v-col>
          <h2 class="text-h4 text-sm-h3 text-capitalize font-weight-black mb-4">
            GUILD LEADERSHIP
          </h2>
        </v-col>
      </v-row>
      <v-row>
        <v-col>
          <v-sheet class="py-12 px-6" outlined shaped>
            <v-avatar size="140"
              ><img
                src="~/static/images/warlock.png"
                lazy-src="~/static/images/warlock.png"
                alt=""
            /></v-avatar>
            <div class="text-h5 text-uppercase font-weight-black mt-6 mb-2">
              Dotzila
            </div>
            <div class="text--disabled text-uppercase">Guild Master</div>
          </v-sheet>
        </v-col>
        <v-col>
          <v-sheet class="py-12 px-6" outlined shaped>
            <v-avatar size="140"
              ><img
                src="~/static/images/hunter.png"
                lazy-src="~/static/images/hunter.png"
                alt=""
            /></v-avatar>
            <div class="text-h5 text-uppercase font-weight-black mt-6 mb-2">
              Blazs
            </div>
            <div class="text--disabled text-uppercase">Raid Lead</div>
          </v-sheet>
        </v-col>
        <v-col>
          <v-sheet class="py-12 px-6" outlined shaped>
            <v-avatar size="140"
              ><img
                src="~/static/images/druid.png"
                lazy-src="~/static/images/druid.png"
                alt=""
            /></v-avatar>
            <div class="text-h5 text-uppercase font-weight-black mt-6 mb-2">
              Quadraxes
            </div>
            <div class="text--disabled text-uppercase">
              Logistics and Recruitment
            </div>
            <div class="subtitle-1 mt-3">Discord - Quadraxes#6505</div>
          </v-sheet>
        </v-col>
        <v-col>
          <v-sheet class="py-12 px-6" outlined shaped>
            <v-avatar size="140"
              ><img
                src="~/static/images/monk.png"
                lazy-src="~/static/images/monk.png"
                alt=""
            /></v-avatar>
            <div class="text-h5 text-uppercase font-weight-black mt-6 mb-2">
              Xaide
            </div>
            <div class="text--disabled text-uppercase">Melee Lead</div>
          </v-sheet>
        </v-col>
        <v-col>
          <v-sheet class="py-12 px-6" outlined shaped>
            <v-avatar size="140"
              ><img
                src="~/static/images/evoker.png"
                lazy-src="~/static/images/evoker.png"
                alt=""
            /></v-avatar>
            <div class="text-h5 text-uppercase font-weight-black mt-6 mb-2">
              Judge
            </div>
            <div class="text--disabled text-uppercase">Heal Lead</div>
          </v-sheet>
        </v-col>
      </v-row>
    </v-container>
  </section>
</template>

<script>
export default {}
</script>
