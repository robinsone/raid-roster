<template>
  <div class="container">
    <div class="row">
      <div class="col-4">
        <v-card color="#3333aa" dark>
          <v-card-title>
            <span class="text-h6 font-weight-light">Composition</span>
          </v-card-title>

          <v-card-text class="text-h5 font-weight-bold">
            <span class="text-h6 font-weight-light">Tank:</span> {{ tankCount
            }}<br />
            <span class="text-h6 font-weight-light">Healers:</span>
            {{ healerCount }}<br />
            <span class="text-h6 font-weight-light">DPS:</span>
            {{ rangedCount + meleeCount }}<br />
            <span class="text-h6 font-weight-light">Melee DPS:</span>
            {{ meleeCount }}<br />
            <span class="text-h6 font-weight-light">Ranged DPS:</span>
            {{ rangedCount }}
          </v-card-text>
        </v-card>
      </div>
      <div class="col-4">
        <v-card color="#aa3333" dark>
          <v-card-title>
            <span class="text-h6 font-weight-light">Stats</span>
          </v-card-title>

          <v-card-text class="text-h5 font-weight-bold">
            <span class="text-h6 font-weight-light">Number of Raiders:</span>
            {{ data.length }} <br />
            <span class="text-h6 font-weight-light">Average ilvl:</span>
            {{ averageIlvl }}<br />
          </v-card-text>
        </v-card>
      </div>
      <div class="col-4">
        <v-card color="#33aa33" dark>
          <v-card-title>
            <span class="text-h6 font-weight-light">Progression</span>
          </v-card-title>

          <v-card-text class="text-h5 font-weight-bold">
            <span class="text-h6 font-weight-light"
              >Vault of the Incarnates:</span
            >
            <br />
            0/8 Mythic <br />
            1/8 Heroic <br />
            6/8 Normal <br />
          </v-card-text>
        </v-card>
      </div>
    </div>
    <div class="row">
      <div class="col">
        <v-card dark>
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
            multi-sort
            :sort-by.sync="sortBy"
            :sort-desc.sync="sortDesc"
            dark
          >
            <template v-slot:[`item.name`]="{ item }">
              <b class="text-uppercase">{{ item.name }}</b>
            </template>
            <template v-slot:[`item.armory`]="{ item }">
              <a
                :href="
                  'https://worldofwarcraft.com/en-us/character/us/' +
                  item.armory
                "
                target="_blank"
                ><img src="https://i.imgur.com/WQylPcH.png" height="30px"
              /></a>
              <a
                :href="'https://raider.io/characters/us/' + item.rio"
                target="_blank"
                ><img
                  src="https://cdnassets.raider.io/images/brand/Icon_FullColor.png"
                  height="30px"
              /></a>
            </template>
            <template v-slot:[`item.ilvl`]="{ item }">
              <v-chip :color="getColor(item.ilvl)" dark>
                {{ item.ilvl }}
              </v-chip>
            </template>
            <template v-slot:[`item.mplusRating`]="{ item }">
              <v-chip :color="primary" dark>
                {{ item.mplusRating }}
              </v-chip>
            </template>
            <template v-slot:[`item.mplus`]="{ item }">
              <v-chip :color="primary" dark>
                {{ "+" + item.mplus.toString() }}
              </v-chip>
            </template>
          </v-data-table>
        </v-card>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: "HelloWorld",

  data: (vm) => ({
    headers: [
      { text: "", value: "armory", align: "end" },
      { text: "Raider", value: "name", align: "start" },
      { text: "Class", value: "class", align: "end" },
      { text: "Spec", value: "spec", align: "end" },
      {
        text: "Role",
        value: "role",
        align: "end",
        sort: (a, b) => {
          return vm.sort(a, b);
        },
      },
      { text: "ilvl", value: "ilvl", align: "center" },
      { text: "M+ Rating", value: "mplusRating", align: "end" },
      { text: "Highest Weekly M+", value: "mplus", align: "center" },
    ],
    sortBy: ["role", "ilvl"],
    sortDesc: [true, true],
    data: [],
    stats: [],
    search: "",
    raiderioUrl: "https://raider.io/api/v1/characters/profile?region=us",
    raiderioFields:
      "mythic_plus_scores_by_season%3Acurrent%2Cmythic_plus_weekly_highest_level_runs%2Cgear",
    server: "illidan",
    raiders: [
      { name: "Endersz", role: "Tank" },
      { name: "Twifferclap", role: "Tank" },
      { name: "Quadraxes", role: "Healer" },
      { name: "Rejudge", role: "Healer" },
      { name: "Noçtis", role: "Healer" },
      { name: "Vodin", role: "Healer" },
      { name: "Lrodcairo", role: "Healer" },
      { name: "Devô", role: "Melee DPS" },
      { name: "Zerosrog", role: "Melee DPS" },
      { name: "Argentzelda", role: "Melee DPS" },
      { name: "Youfus", role: "Melee DPS" },
      { name: "Fischa", role: "Melee DPS" },
      { name: "Sigard", role: "Melee DPS" },
      { name: "Fortus", role: "Melee DPS" },
      { name: "Ponehorseman", role: "Melee DPS" },
      { name: "Mêgatron", role: "Melee DPS" },
      { name: "Ogblazs", role: "Ranged DPS" },
      { name: "Solargalaxy", role: "Ranged DPS" },
      { name: "Diestofire", role: "Ranged DPS" },
      { name: "Magesaur", role: "Ranged DPS" },
      { name: "Dotzíla", role: "Ranged DPS" },
      { name: "Catterpie", role: "Ranged DPS" },
      { name: "Charlotteros", role: "Ranged DPS" },
      { name: "Brolusk", role: "Ranged DPS" },
      // { name: "Cøsmiccow", role: "Ranged DPS" },
      { name: "Røyaltree", role: "Ranged DPS" },
      { name: "Machîne", role: "Ranged DPS" },
    ],
  }),

  computed: {
    averageIlvl() {
      return (
        this.data.reduce((total, next) => total + next.ilvl, 0) /
        this.data.length
      ).toFixed(2);
    },
    healerCount() {
      return this.data.filter((d) => d.role == "Healer").length;
    },
    rangedCount() {
      return this.data.filter((d) => d.role == "Ranged DPS").length;
    },
    meleeCount() {
      return this.data.filter((d) => d.role == "Melee DPS").length;
    },
    tankCount() {
      return this.data.filter((d) => d.role == "Tank").length;
    },
  },

  methods: {
    getData() {
      this.raiders.forEach((raider) => {
        const url = `${this.raiderioUrl}&realm=${this.server}&name=${raider.name}&fields=${this.raiderioFields}`;
        this.$http.get(url).then((result) => {
          this.data.push({
            name: raider.name,
            ilvl: result.data.gear.item_level_equipped,
            mplus: result.data.mythic_plus_weekly_highest_level_runs.length > 0
                ? result.data.mythic_plus_weekly_highest_level_runs.reduce(
                    (prev, current) => {
                      return prev.mythic_level > current.mythic_level
                        ? prev
                        : current;
                    }
                  ).mythic_level
                : 0,
            role: raider.role,
            mplusRating: result.data.mythic_plus_scores_by_season[0].scores.all,
            class: result.data.class,
            spec: result.data.active_spec_name,
            armory: this.server + "/" + raider.name,
            rio: this.server + "/" + raider.name,
          });
        });
      });
    },
    getColor(ilvl) {
      if (ilvl >= 421) return "#ff8000";
      else if (ilvl >= 408) return "#a335ee";
      else if (ilvl >= 395) return "#0070dd";
      else if (ilvl >= 382) return "#33aa33";
      else if (ilvl >= 372) return "#a335ee";
      else if (ilvl >= 359) return "#33aa33";
      else if (ilvl >= 346) return "#9d9d9d";
      else return "#9d9d9d";
    },
    getSortParam(sortOrder) {
      return sortOrder
        .map(function (sort) {
          return (sort.direction === "desc" ? "-" : "") + sort.field;
        })
        .join(",");
    },
    sort(a, b) {
      if (this.getSortValue(a) < this.getSortValue(b)) return 1;
      if (this.getSortValue(a) > this.getSortValue(b)) return -1;
      return 0;
    },
    getSortValue(role) {
      if (role == "Tank") return 1;
      if (role == "Healer") return 2;
      if (role == "Melee DPS") return 3;
      if (role == "Ranged DPS") return 4;
    },
  },

  mounted() {
    this.getData();
  },
};
</script>
