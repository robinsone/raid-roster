<template>
  <div>
    <v-app-bar fixed app hide-on-scroll height="64" elevate-on-scroll>
      <v-app-bar-nav-icon class="hidden-md-and-up" @click="drawer = true" />
      <nuxt-link to="/" class="d-flex" style="text-decoration: none">
        <h2>The Church - WoW Raiding Guild</h2>
      </nuxt-link>
      <v-spacer />
      <template></template>
      <template v-for="(name, menuitem) in items">
        <template v-if="name.submenu">
          <v-menu
            :key="menuitem"
            open-on-hover
            offset-y
            transition="slide-y-transition"
            bottom
          >
            <template v-slot:activator="{ on, attrs }">
              <v-btn
                plain
                class="py-8 submenubtn hidden-sm-and-down"
                :ripple="false"
                v-bind="attrs"
                v-on="on"
              >
                {{ name.title }}
                <v-icon right small class="mx-0"> mdi-chevron-down </v-icon>
              </v-btn>
            </template>
            <v-list dense>
              <v-list-item
                v-for="(item, index) in name.submenu"
                :key="index"
                link
                :to="item.to"
              >
                <v-list-item-title>{{ item.title }}</v-list-item-title>
              </v-list-item>
            </v-list>
          </v-menu>
        </template>
        <v-btn
          v-else
          :key="menuitem"
          depressed
          tile
          plain
          class="py-8 hidden-sm-and-down"
          :to="name.to"
          >{{ name.title }}</v-btn
        > </template
      ><v-spacer />
      <v-btn
        style="margin-right: 10px"
        fab
        dark
        x-small
        :href="'https://www.warcraftlogs.com/guild/us/illidan/The%20Church'"
        target="_blank"
        ><img
          src="https://assets.rpglogs.com/img/warcraft/favicon.png?v=2"
          height="30px"
      /></v-btn>
      <v-btn
        style="margin-right: 10px"
        fab
        dark
        x-small
        :href="'https://worldofwarcraft.com/en-us/guild/us/illidan/the-church'"
        target="_blank"
        ><img
          src="https://upload.wikimedia.org/wikipedia/commons/thumb/e/eb/WoW_icon.svg/1200px-WoW_icon.svg.png"
          height="30px"
      /></v-btn>
      <v-btn
        style="margin-right: 10px"
        fab
        dark
        x-small
        :href="'https://raider.io/guilds/us/illidan/The%20Church'"
        target="_blank"
      >
        <img
          src="https://cdnassets.raider.io/images/brand/Icon_FullColor.png"
          height="30px"
      /></v-btn>
      <v-btn icon href="https://github.com/robinsone/raid-roster">
        <v-icon>mdi-github</v-icon>
      </v-btn>
      <v-btn icon @click="changeThemeColor">
        <v-icon>{{
          $vuetify.theme.dark ? 'mdi-white-balance-sunny' : 'mdi-weather-night'
        }}</v-icon>
      </v-btn>
    </v-app-bar>
  </div>
</template>

<script>
export default {
  data() {
    return {
      clipped: false,
      drawer: false,
      items: [],
    }
  },
  methods: {
    changeThemeColor() {
      if (this.$vuetify.theme.dark === true) {
        this.$vuetify.theme.dark = false
      } else {
        this.$vuetify.theme.dark = true
      }
    },
  },
}
</script>

<style scoped>
.submenubtn {
  cursor: default;
}
</style>
