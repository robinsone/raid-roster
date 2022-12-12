<template>
  <v-app>
    <v-app-bar app color="#f1f1f1">
      <v-container>
        <div class="row">
          <div class="col"><h1>Raid Roster</h1></div>
        </div>
      </v-container>

      <v-spacer></v-spacer>
    </v-app-bar>
    <br />
    <v-main style="background-color: #232323; color: #f1f1f1">
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
