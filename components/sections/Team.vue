<template>
  <section
    :class="$vuetify.theme.dark ? 'grey darken-4' : 'grey lighten-4'"
    class="py-16"
  >
    <v-container class="text-center">
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
                src="~/static/images/Dotzila.jpeg"
                lazy-src="~/static/images/Dotzila.jpeg"
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
                src="~/static/images/Blazs.png"
                lazy-src="~/static/images/Blazs.png"
                alt=""
            /></v-avatar>
            <div class="text-h5 text-uppercase font-weight-black mt-6 mb-2">
              Blazs
            </div>
            <div class="text--disabled text-uppercase">Raid Leader</div>
          </v-sheet>
        </v-col>
        <v-col>
          <v-sheet class="py-12 px-6" outlined shaped>
            <v-avatar size="140"
              ><img
                src="~/static/images/Quad.jpg"
                lazy-src="~/static/images/Quad.jpg"
                alt=""
            /></v-avatar>
            <div class="text-h5 text-uppercase font-weight-black mt-6 mb-2">
              Quadraxes
            </div>
            <div class="text--disabled text-uppercase">
              Logistics and Recruitment
            </div>
            <div class="subtitle-1 mt-3">Discord: Quadraxes#6505</div>
          </v-sheet>
        </v-col>
        <v-col>
          <v-sheet class="py-12 px-6" outlined shaped>
            <v-avatar size="140"
              ><img
                src="~/static/images/Judge.png"
                lazy-src="~/static/images/Judge.png"
                alt=""
            /></v-avatar>
            <div class="text-h5 text-uppercase font-weight-black mt-6 mb-2">
              Judge
            </div>
            <div class="text--disabled text-uppercase">Healing Lead</div>
          </v-sheet>
        </v-col>
      </v-row>
    </v-container>
  </section>
</template>

<script>
export default {}
</script>
