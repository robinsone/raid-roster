<template>
  <section id="hero">
    <!-- <v-carousel
      height="calc(100vh - 64px)"
      dark
      cycle
      hide-delimiters
      :show-arrows="false"
    >
      <v-carousel-item
        v-for="(carousel, carindex) in carouselsData"
        :key="carindex"
        :src="carousel.src"
        class="gradient-fill"
      > -->
    <video-background :src="banner" style="height: calc(100vh - 64px)">
      <v-container fill-height class="shadow">
        <div v-for="(carousel, carindex) in carouselsData" :key="carindex">
          <div class="text-md-h2 mb-3 text-sm-h3 text-h5 font-weight-black">
            {{ carousel.heading.toUpperCase() }}
          </div>
          <v-row>
            <v-col cols="12" md="6">
              <p class="text mb-5 font-weight-light">
                {{ carousel.leftSubHeading }}
              </p>
            </v-col>
            <v-col cols="12" md="6">
              <p class="text mb-5 font-weight-light">
                {{ carousel.rightSubHeading }}
              </p>
            </v-col>
          </v-row>
        </div>
      </v-container>
    </video-background>

    <!-- </v-carousel-item>
    </v-carousel> -->
  </section>
</template>

<script>
import banner from '~/static/images/awakedIles.mp4'
export default {
  data() {
    return {
      banner,
      carouselsData: [
        {
          heading: ' The Church - Illidan US ',
          leftSubHeading: `The Church (No actual religious affiliation, original name of The Church of Propaganda was considered too long so we shortened it) is a raiding guild on Illidan that was founded back in 2007 on Darkspear. We progressed as a high end raiding guild from Burning Crusade through Warlords of Draenor, including many US top 100 kills and World top 500.`,
          rightSubHeading: `We transferred to Proudmoore during Battle for Azeroth and after good progress there, moved to Illidan for Shadowlands to continue mythic progression with our “casualcore” two day, 6 hour (3 hours per night) raid schedule. We take our limited raid schedule seriously, but don't hesitate to crack jokes with each other and keep the mood light. If you're looking for a guild to progress with, without having to sign away all your free time outside of raiding, and don't mind the occasional Letterkenny reference, then we just might be what you're looking for!`,
        },
      ],
    }
  },
}
</script>

<style>
.gradient-fill .v-responsive__content {
  background: rgb(0, 0, 0);
  background: linear-gradient(
    to right,
    rgba(32, 32, 32, 0.65),
    rgba(40, 40, 40, 0.75)
  );
}
.shadow {
  text-shadow: 1px 1px 2px rgb(49, 49, 49), 0 0 1em rgb(49, 49, 49),
    0 0 0.5em rgb(49, 49, 49);
}
</style>
