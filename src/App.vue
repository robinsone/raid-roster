<template>
  <v-app>
    <v-app-bar app color="primary" dark>
      <div class="d-flex align-center">
        <h1>Raid Roster</h1>
      </div>

      <v-spacer></v-spacer>
    </v-app-bar>
    <br />
    <v-main>
      <SystemInfo />
    </v-main>
  </v-app>
</template>

<script>
import SystemInfo from "@/components/SystemInfo.vue";

export default {
  name: "App",

  components: {
    SystemInfo,
  },

  data: () => ({
    //
  }),
};
</script>
