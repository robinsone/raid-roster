<template>
  <div class="container">
    <div class="row">
      <div class="col-sm-4">
        <v-card color="#333333" dark>
          <v-card-title>
            <span class="text-h6 font-weight-light">Composition</span>
          </v-card-title>
          <v-card-text class="text-h5 font-weight-bold">
            <span class="text-h6 font-weight-light">Tank:</span> {{ tankCount }}
            <span class="text-h6 font-weight-light">Healers:</span>
            {{ healerCount }}
            <span class="text-h6 font-weight-light">DPS:</span>
            {{ rangedCount + meleeCount }}<br />
            <span class="text-h6 font-weight-light">Melee DPS:</span>
            {{ meleeCount }}
            <span class="text-h6 font-weight-light">Ranged DPS:</span>
            {{ rangedCount }}
          </v-card-text>
        </v-card>
      </div>

      <div class="col-sm-4">
        <v-card color="#555555" dark>
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
      <div class="col-sm-4">
        <v-card color="#777" dark>
          <v-card-title>
            <span class="text-h6 font-weight-light">Links</span>
          </v-card-title>

          <v-card-text class="text-h5 font-weight-bold">
            <v-btn
              depressed
              href="https://github.com/robinsone/raid-roster/wiki"
            >
              Wiki
            </v-btn>
            <v-btn
              class="ml-1"
              depressed
              href="https://github.com/robinsone/raid-roster/wiki/Loot-Rules"
            >
              Loot Rules
            </v-btn>
            <v-btn
              class="ml-1"
              depressed
              href="https://github.com/robinsone/raid-roster/wiki/ERT-Notes"
            >
              ERT-Notes
            </v-btn>
          </v-card-text>
        </v-card>
      </div>
      <div class="col-sm-12">
        <v-card color="#999999" dark v-show="guildProgress">
          <v-card-title>
            <span class="text-h6 font-weight-light">
              Progression - Dragonflight
            </span>
          </v-card-title>

          <v-card-text class="text-h6 font-weight-bold">
            <span class="text-h6 font-weight-light"
              >Vault of the Incarnates:</span
            >
            <br />
            <div class="ml-6">
              <ul>
                <li>
                  {{
                    guildProgress["vault-of-the-incarnates"]
                      .mythic_bosses_killed
                  }}/{{ guildProgress["vault-of-the-incarnates"].total_bosses }}
                  Mythic
                </li>
                <li>
                  {{
                    guildProgress["vault-of-the-incarnates"]
                      .heroic_bosses_killed
                  }}/{{ guildProgress["vault-of-the-incarnates"].total_bosses }}
                  Heroic
                </li>
                <li>
                  {{
                    guildProgress["vault-of-the-incarnates"]
                      .normal_bosses_killed
                  }}/{{ guildProgress["vault-of-the-incarnates"].total_bosses }}
                  Normal
                </li>
              </ul>
            </div>
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
            :expanded.sync="expended"
            dark
            item-key="name"
            @click:row="(item, slot) => slot.expand(!slot.isExpanded)"
          >
            <template v-slot:[`item.name`]="{ item }">
              <b class="text-uppercase">{{ item.name }}</b>
            </template>
            <template v-slot:[`item.armory`]="{ item }">
              <v-btn
                fab
                dark
                x-small
                :href="
                  'https://worldofwarcraft.com/en-us/character/us/' +
                  item.armory.toLowerCase()
                "
                target="_blank"
                ><img src="https://i.imgur.com/WQylPcH.png" height="30px"
              /></v-btn>
              <v-btn
                fab
                dark
                x-small
                :href="
                  'https://raider.io/characters/us/' + item.rio.toLowerCase()
                "
                target="_blank"
                ><img
                  src="https://cdnassets.raider.io/images/brand/Icon_FullColor.png"
                  height="30px"
              /></v-btn>
              <v-btn
                fab
                dark
                x-small
                class="pa-0 ma-0"
                height="30px"
                width="30px"
                :href="talentUrl + item.talentLoadout"
                target="_blank"
                >T
              </v-btn>
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
            <template v-slot:expanded-item="{ headers, item }">
              <td :colspan="headers.length">
                <v-data-table
                  :headers="headers"
                  hide-default-header
                  :items="item.alt"
                  disable-pagination
                  hide-default-footer
                  dark
                  item-key="name"
                >
                  <template v-slot:[`item.name`]="{ item }">
                    <b class="text-uppercase">{{ item.name }}</b>
                  </template>
                  <template v-slot:[`item.armory`]="{ item }">
                    <v-btn
                      fab
                      dark
                      x-small
                      :href="
                        'https://worldofwarcraft.com/en-us/character/us/' +
                        item.armory.toLowerCase()
                      "
                      target="_blank"
                      ><img src="https://i.imgur.com/WQylPcH.png" height="30px"
                    /></v-btn>
                    <v-btn
                      fab
                      dark
                      x-small
                      :href="
                        'https://raider.io/characters/us/' +
                        item.rio.toLowerCase()
                      "
                      target="_blank"
                      ><img
                        src="https://cdnassets.raider.io/images/brand/Icon_FullColor.png"
                        height="30px"
                    /></v-btn>
                    <v-btn
                      fab
                      dark
                      x-small
                      class="pa-0 ma-0"
                      height="30px"
                      width="30px"
                      :href="talentUrl + item.talentLoadout"
                      target="_blank"
                      >T
                    </v-btn>
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
              </td>
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
    expanded: [],
    guildProgress: null,
    stats: [],
    search: "",
    talentUrl: "https://www.wowhead.com/talent-calc/blizzard/",
    raiderioUrl: "https://raider.io/api/v1/characters/profile?region=us",
    raiderioFields:
      "mythic_plus_scores_by_season%3Acurrent%2Cmythic_plus_weekly_highest_level_runs%2Cgear%2Ctalents",
    server: "illidan",
    raiders: [
      {
        name: "Endersz",
        role: "Tank",
        alt: [{ name: "Bufomyva", role: "Ranged DPS" }],
      },
      {
        name: "Twifferclap",
        role: "Tank",
        alt: [{ name: "Grandmaspoon", role: "Tank" }],
      },
      { name: "Quadraxes", role: "Healer" },
      {
        name: "Judgedraco",
        role: "Healer",
        alt: [
          { name: "Rejudge", role: "Healer" },
          { name: "Judgéd", role: "Healer" },
        ],
      },
      { name: "Vodin", role: "Healer" },
      { name: "Lrodcairo", role: "Healer" },
      {
        name: "Devô",
        role: "Melee DPS",
        alt: [{ name: "Demonicdevo", role: "Melee DPS" }],
      },
      { name: "Aambulance", role: "Healer" },
      { name: "Zerosrog", role: "Melee DPS" },
      { name: "Youmus", role: "Melee DPS" },
      { name: "Fischa", role: "Melee DPS" },
      { name: "Sigard", role: "Melee DPS" },
      { name: "Fortus", role: "Melee DPS" },
      { name: "Mêgatron", role: "Melee DPS" },
      { name: "Ogblazs", role: "Ranged DPS" },
      { name: "Solargalaxy", role: "Ranged DPS" },
      { name: "Diestofire", role: "Ranged DPS" },
      { name: "Magesaur", role: "Ranged DPS" },
      { name: "Dotzíla", role: "Ranged DPS" },
      { name: "Catterpie", role: "Ranged DPS" },
      { name: "Charlotteros", role: "Ranged DPS" },
      { name: "Brolusk", role: "Ranged DPS" },
      {
        name: "Machîne",
        role: "Ranged DPS",
        alt: [{ name: "Machiñe", role: "Tank" }],
      },
      {
        name: "Bambabamba",
        role: "Melee DPS",
        alt: [{ name: "Argentzelda", role: "Melee DPS" }],
      },
      { name: "Reaais", role: "Melee DPS" },
      // { name: "Cøsmiccow", role: "Ranged DPS" },
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
    talentLink(raider) {
      return this.talentUrl + raider.talentLoadout;
    },
  },

  methods: {
    getData() {
      this.raiders.forEach((raider) => {
        let alts = [];
        if (raider.alt) {
          raider.alt.forEach((alt) => {
            this.$http
              .get(
                `${this.raiderioUrl}&realm=${this.server}&name=${alt.name}&fields=${this.raiderioFields}`
              )
              .then((result) => {
                alts.push({
                  name: alt.name,
                  ilvl: result.data.gear.item_level_equipped,
                  mplus:
                    result.data.mythic_plus_weekly_highest_level_runs.length > 0
                      ? result.data.mythic_plus_weekly_highest_level_runs.reduce(
                          (prev, current) => {
                            return prev.mythic_level > current.mythic_level
                              ? prev
                              : current;
                          }
                        ).mythic_level
                      : 0,
                  role: alt.role,
                  mplusRating:
                    result.data.mythic_plus_scores_by_season[0].scores.all,
                  class: result.data.class,
                  spec: result.data.active_spec_name,
                  armory: this.server + "/" + encodeURIComponent(alt.name),
                  rio: this.server + "/" + encodeURIComponent(alt.name),
                  talentLoadout: result.data.talentLoadout.loadout_text,
                });
              });
          });
        }

        this.$http
          .get(
            `${this.raiderioUrl}&realm=${this.server}&name=${raider.name}&fields=${this.raiderioFields}`
          )
          .then((result) => {
            this.data.push({
              name: raider.name,
              ilvl: result.data.gear.item_level_equipped,
              mplus:
                result.data.mythic_plus_weekly_highest_level_runs.length > 0
                  ? result.data.mythic_plus_weekly_highest_level_runs.reduce(
                      (prev, current) => {
                        return prev.mythic_level > current.mythic_level
                          ? prev
                          : current;
                      }
                    ).mythic_level
                  : 0,
              role: raider.role,
              mplusRating:
                result.data.mythic_plus_scores_by_season[0].scores.all,
              class: result.data.class,
              spec: result.data.active_spec_name,
              armory: this.server + "/" + encodeURIComponent(raider.name),
              rio: this.server + "/" + encodeURIComponent(raider.name),
              talentLoadout: result.data.talentLoadout.loadout_text,
              alt: alts,
            });
          });
      });
    },
    getGuildProgress() {
      const url = `https://raider.io/api/v1/guilds/profile?region=us&realm=illidan&name=the%20church&fields=raid_progression`;
      this.$http.get(url).then((result) => {
        this.guildProgress = result.data.raid_progression;
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
    this.getGuildProgress();
    this.getData();
  },
};
</script>
