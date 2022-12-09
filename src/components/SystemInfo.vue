<template>
  <div class="container">
    <div clas="row">
      <a href="https://www.thechurchguild.info/"><h1>The Church</h1></a>
      <p>
        Number of Raiders: {{ data.length }}
        <br />
        Average ilvl: {{ averageIlvl }}
      </p>
      <p></p>
    </div>
    <div class="row">
      <v-card>
        <v-card-title>
          <v-text-field
            v-model="search"
            append-icon="mdi-magnify"
            label="Search"
            single-line
            hide-details
          ></v-text-field>
        </v-card-title>
        <v-data-table
          :headers="headers"
          :items="data"
          :search="search"
          disable-pagination
          hide-default-footer
          :sort-by.sync="sortBy"
          :sort-desc.sync="sortDesc"
        >
          <template v-slot:[`item.name`]="{ item }">
            <b class="text-uppercase">{{ item.name }}</b>
          </template>
          <template v-slot:[`item.ilvl`]="{ item }">
            <v-chip :color="getColor(item.ilvl)" dark>
              {{ item.ilvl }}
            </v-chip>
          </template>
        </v-data-table>
      </v-card>
    </div>
  </div>
</template>

<script>
export default {
  name: "HelloWorld",

  data: () => ({
    headers: [
      { text: "Raider", value: "name", align: "start" },
      { text: "Class", value: "class", align: "end" },
      { text: "Spec", value: "spec", align: "end" },
      { text: "Role", value: "role", align: "end" },
      { text: "ilvl", value: "ilvl", align: "center" },
      { text: "Latest M+", value: "mplus" },
    ],
    sortBy: "ilvl",
    sortDesc: true,
    data: [],
    stats: [],
    search: "",
    raiderioUrl: "https://raider.io/api/v1/characters/profile?region=us",
    raiderioFields: "mythic_plus_weekly_highest_level_runs%2Cgear",
    server: "illidan",
    raiders: [
      "Endersz",
      "Haveutried",
      "Quadraxes",
      "Rejudge",
      "Noçtis",
      "Vodin",
      "Immaevoker",
      "Devô",
      "Zerosrog",
      "Argentzelda",
      "Youfus",
      "Fischa",
      "Sigard",
      "Fortus",
      "Ponehorseman",
      "Mêgatron",
      "Ogblazs",
      "Solargalaxy",
      "Diestofire",
      "Magesaur",
      "Dotzíla",
      "Catterpie",
      "Charlotteros",
      "Brolusk",
      "Cøsmiccow",
      "Røyaltree",
      "Machîne",
    ],
  }),

  computed: {
    averageIlvl() {
      return (
        this.data.reduce((total, next) => total + next.ilvl, 0) /
        this.data.length
      ).toFixed(2);
    },
  },

  methods: {
    getData() {
      this.raiders.forEach((raider) => {
        const url = `${this.raiderioUrl}&realm=${this.server}&name=${raider}&fields=${this.raiderioFields}`;
        this.$http.get(url).then((result) => {
          this.data.push({
            name: raider,
            ilvl: result.data.gear.item_level_equipped,
            mplus: result.data.mythic_plus_weekly_highest_level_runs,
            role: result.data.active_spec_role,
            class: result.data.class,
            spec: result.data.active_spec_name,
          });
        });
      });
    },
    getColor(ilvl) {
      if (ilvl > 375) return "orange";
      else if (ilvl > 370) return "purple";
      else if (ilvl > 360) return "blue";
      else if (ilvl > 340) return "grey";
      else return "red";
    },
  },

  mounted() {
    this.getData();
  },
};
</script>
