<!-- eslint-disable vue/no-template-shadow -->
<template>
  <section id="RaidTeam" class="py-16">
    <v-container>
      <v-row class="text-center">
        <v-col>
          <h2 class="text-h4 text-sm-h3 text-capitalize font-weight-black mb-4">
            RAID TEAM
          </h2>
        </v-col>
      </v-row>
      <v-row cols="12" sm="4">
        <v-col cols="12" sm="4">
          <v-card color="#555555" dark>
            <v-card-title>
              <h6
                class="text-center text-h5 text-sm-h5 text-capitalize font-weight-black"
              >
                Composition
              </h6>
            </v-card-title>
            <v-card-text class="text text-h5 font-weight-bold">
              <span class="text text-h6 font-weight-light">Tank:</span>
              {{ tankCount }}
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
        </v-col>

        <v-col cols="12" sm="4">
          <v-card color="#555555" dark>
            <v-card-title>
              <h6
                class="text-center text-h5 text-sm-h5 text-capitalize font-weight-black"
              >
                Stats
              </h6>
            </v-card-title>

            <v-card-text class="text-h5 font-weight-bold">
              <span class="text-h6 font-weight-light">Number of Raiders:</span>
              {{ data.length }} <br />
              <span class="text-h6 font-weight-light">Average ilvl:</span>
              {{ averageIlvl }}<br />
            </v-card-text>
          </v-card>
        </v-col>
        <v-col cols="12" sm="4">
          <v-card color="#555555" dark>
            <v-card-title>
              <h6
                class="text-center text-h5 text-sm-h5 text-capitalize font-weight-black"
              >
                Links
              </h6>
            </v-card-title>

            <v-card-text class="text-h5 font-weight-bold">
              <v-row align="center" justify="space-around">
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
              </v-row>
              <br />
            </v-card-text>
          </v-card>
        </v-col>
        <v-col cols="12">
          <v-card v-if="guildProgress" color="#555555" dark>
            <v-card-title>
              <h6
                class="text-center text-h5 text-sm-h5 text-capitalize font-weight-black"
              >
                Progression - Dragonflight
              </h6>
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
                      guildProgress['vault-of-the-incarnates']
                        .mythic_bosses_killed
                    }}/{{
                      guildProgress['vault-of-the-incarnates'].total_bosses
                    }}
                    Mythic
                  </li>
                  <li>
                    {{
                      guildProgress['vault-of-the-incarnates']
                        .heroic_bosses_killed
                    }}/{{
                      guildProgress['vault-of-the-incarnates'].total_bosses
                    }}
                    Heroic
                  </li>
                  <li>
                    {{
                      guildProgress['vault-of-the-incarnates']
                        .normal_bosses_killed
                    }}/{{
                      guildProgress['vault-of-the-incarnates'].total_bosses
                    }}
                    Normal
                  </li>
                </ul>
              </div>
            </v-card-text>
          </v-card>
        </v-col>
      </v-row>
      <v-row>
        <v-col class="text font-weight-light">
          <v-card dark>
            <v-card-title>
              <v-col><h2>Current Roster</h2></v-col>
              <v-col>
                <v-text-field
                  v-model="Search"
                  append-icon="mdi-magnify"
                  label="Search"
                  single-line
                  hide-details
                ></v-text-field>
              </v-col>
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
              item-key="name"
              show-expand
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
                <v-chip :color="mplusColorRating(item.mplusRating)" dark>
                  {{ item.mplusRating }}
                </v-chip>
              </template>
              <template v-slot:[`item.mplus`]="{ item }">
                <v-chip dark>
                  {{ '+' + item.mplus.toString() }}
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
                        ><img
                          src="https://i.imgur.com/WQylPcH.png"
                          height="30px"
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
                      <v-chip :color="mplusColorRating(item.mplusRating)" dark>
                        {{ item.mplusRating }}
                      </v-chip>
                    </template>
                    <template v-slot:[`item.mplus`]="{ item }">
                      <v-chip dark>
                        {{ '+' + item.mplus.toString() }}
                      </v-chip>
                    </template>
                  </v-data-table>
                </td>
              </template>
            </v-data-table>
          </v-card>
        </v-col>
      </v-row>
      <v-row>
        <v-col>
          <v-btn
            v-if="!showPastRaiders"
            color="secondary"
            @click="showPastRaiders = true"
            >View past raiders</v-btn
          >
        </v-col>
      </v-row>
      <!-- <v-row v-if="showPastRaiders">
        <v-col class="text font-weight-light">
          <v-card dark>
            <v-card-title>
              <v-col><h2>Past Roster</h2></v-col>
              <v-col>
                <v-text-field
                  v-model="exSearch"
                  append-icon="mdi-magnify"
                  label="Search"
                  single-line
                  hide-details
                ></v-text-field>
              </v-col>
            </v-card-title>
            <v-data-table
              :headers="headers"
              :items="exData"
              :search="exSearch"
              disable-pagination
              hide-default-footer
              multi-sort
              :sort-by.sync="sortBy"
              :sort-desc.sync="sortDesc"
              dark
              item-key="name"
              show-expand
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
                <v-chip :color="mplusColorRating(item.mplusRating)" dark>
                  {{ item.mplusRating }}
                </v-chip>
              </template>
              <template v-slot:[`item.mplus`]="{ item }">
                <v-chip dark>
                  {{ '+' + item.mplus.toString() }}
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
                        ><img
                          src="https://i.imgur.com/WQylPcH.png"
                          height="30px"
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
                      <v-chip :color="mplusColorRating(item.mplusRating)" dark>
                        {{ item.mplusRating }}
                      </v-chip>
                    </template>
                    <template v-slot:[`item.mplus`]="{ item }">
                      <v-chip dark>
                        {{ '+' + item.mplus.toString() }}
                      </v-chip>
                    </template>
                  </v-data-table>
                </td>
              </template>
            </v-data-table>
          </v-card>
        </v-col>
      </v-row> -->
    </v-container>
  </section>
</template>

<script>
import rosterJSON from '~/roster.json'
// import exRosterJSON from '~/exRoster.json'

export default {
  data(vm) {
    return {
      headers: [
        { text: '', value: 'armory', align: 'end' },
        { text: 'Raider', value: 'name', align: 'start' },
        { text: 'Class', value: 'class', align: 'end' },
        { text: 'Spec', value: 'spec', align: 'end' },
        {
          text: 'Role',
          value: 'role',
          align: 'end',
          sort: (a, b) => {
            return vm.sort(a, b)
          },
        },
        { text: 'ilvl', value: 'ilvl', align: 'center' },
        { text: 'M+ Rating', value: 'mplusRating', align: 'center' },
        { text: 'Highest Weekly M+', value: 'mplus', align: 'center' },
        { text: '', value: 'data-table-expand' },
      ],
      sortBy: ['role', 'ilvl'],
      sortDesc: [true, true],
      data: [],
      exData: [],
      expanded: null,
      guildProgress: null,
      stats: [],
      search: '',
      exSearch: '',
      talentUrl: 'https://www.wowhead.com/talent-calc/blizzard/',
      raiderioUrl: 'https://raider.io/api/v1/characters/profile?region=us',
      raiderioFields:
        'mythic_plus_scores_by_season%3Acurrent%2Cmythic_plus_weekly_highest_level_runs%2Cgear%2Ctalents',
      server: rosterJSON.server,
      raiders: rosterJSON.roster,
      // exRaiders: exRosterJSON.roster,
      showPastRaiders: false,
    }
  },
  computed: {
    averageIlvl() {
      return (
        this.data.reduce((total, next) => total + next.ilvl, 0) /
        this.data.length
      ).toFixed(2)
    },
    healerCount() {
      return this.data.filter((d) => d.role === 'Healer').length
    },
    rangedCount() {
      return this.data.filter((d) => d.role === 'Ranged DPS').length
    },
    meleeCount() {
      return this.data.filter((d) => d.role === 'Melee DPS').length
    },
    tankCount() {
      return this.data.filter((d) => d.role === 'Tank').length
    },
    talentLink(raider) {
      return this.talentUrl + raider.talentLoadout
    },
  },

  mounted() {
    this.getGuildProgress()
    this.getData()
    // this.getExData()
  },

  methods: {
    getData() {
      this.raiders.forEach(async (raider) => {
        const alts = []
        if (raider.alt) {
          raider.alt.forEach(async (alt) => {
            const result = await this.$axios.$get(
              `${this.raiderioUrl}&realm=${this.server}&name=${alt.name}&fields=${this.raiderioFields}`
            )

            alts.push({
              name: alt.name,
              ilvl: result.gear.item_level_equipped,
              mplus:
                result.mythic_plus_weekly_highest_level_runs.length > 0
                  ? result.mythic_plus_weekly_highest_level_runs.reduce(
                      (prev, current) => {
                        return prev.mythic_level > current.mythic_level
                          ? prev
                          : current
                      }
                    ).mythic_level
                  : 0,
              role: alt.role,
              mplusRating: result.mythic_plus_scores_by_season[0].scores.all,
              class: result.class,
              spec: result.active_spec_name,
              armory: this.server + '/' + encodeURIComponent(alt.name),
              rio: this.server + '/' + encodeURIComponent(alt.name),
              talentLoadout: result.talentLoadout.loadout_text,
            })
          })
        }

        const result = await this.$axios.$get(
          `${this.raiderioUrl}&realm=${this.server}&name=${raider.name}&fields=${this.raiderioFields}`
        )

        this.data.push({
          name: raider.name,
          ilvl: result.gear.item_level_equipped,
          mplus:
            result.mythic_plus_weekly_highest_level_runs.length > 0
              ? result.mythic_plus_weekly_highest_level_runs.reduce(
                  (prev, current) => {
                    return prev.mythic_level > current.mythic_level
                      ? prev
                      : current
                  }
                ).mythic_level
              : 0,
          role: raider.role,
          mplusRating: result.mythic_plus_scores_by_season[0].scores.all,
          class: result.class,
          spec: result.active_spec_name,
          armory: this.server + '/' + encodeURIComponent(raider.name),
          rio: this.server + '/' + encodeURIComponent(raider.name),
          talentLoadout: result.talentLoadout.loadout_text,
          alt: alts,
        })
      })
    },
    getExData() {
      this.exRaiders.forEach(async (raider) => {
        const alts = []
        if (raider.alt) {
          raider.alt.forEach(async (alt) => {
            const result = await this.$axios.$get(
              `${this.raiderioUrl}&realm=${this.server}&name=${alt.name}&fields=${this.raiderioFields}`
            )

            alts.push({
              name: alt.name,
              ilvl: result.gear.item_level_equipped,
              mplus:
                result.mythic_plus_weekly_highest_level_runs.length > 0
                  ? result.mythic_plus_weekly_highest_level_runs.reduce(
                      (prev, current) => {
                        return prev.mythic_level > current.mythic_level
                          ? prev
                          : current
                      }
                    ).mythic_level
                  : 0,
              role: alt.role,
              mplusRating: result.mythic_plus_scores_by_season[0].scores.all,
              class: result.class,
              spec: result.active_spec_name,
              armory: this.server + '/' + encodeURIComponent(alt.name),
              rio: this.server + '/' + encodeURIComponent(alt.name),
              talentLoadout: result.talentLoadout.loadout_text,
            })
          })
        }

        const result = await this.$axios.$get(
          `${this.raiderioUrl}&realm=${this.server}&name=${raider.name}&fields=${this.raiderioFields}`
        )

        this.exData.push({
          name: raider.name,
          ilvl: result.gear.item_level_equipped,
          mplus:
            result.mythic_plus_weekly_highest_level_runs.length > 0
              ? result.mythic_plus_weekly_highest_level_runs.reduce(
                  (prev, current) => {
                    return prev.mythic_level > current.mythic_level
                      ? prev
                      : current
                  }
                ).mythic_level
              : 0,
          role: raider.role,
          mplusRating: result.mythic_plus_scores_by_season[0].scores.all,
          class: result.class,
          spec: result.active_spec_name,
          armory: this.server + '/' + encodeURIComponent(raider.name),
          rio: this.server + '/' + encodeURIComponent(raider.name),
          talentLoadout: result.talentLoadout.loadout_text,
          alt: alts,
        })
      })
    },
    async getGuildProgress() {
      const url = `https://raider.io/api/v1/guilds/profile?region=us&realm=illidan&name=the%20church&fields=raid_progression`
      this.guildProgress = (await this.$axios.$get(url)).raid_progression
    },
    getColor(ilvl) {
      if (ilvl >= 421) return '#ff8000'
      else if (ilvl >= 408) return '#a335ee'
      else if (ilvl >= 395) return '#0070dd'
      else if (ilvl >= 382) return '#33aa33'
      else if (ilvl >= 372) return '#a335ee'
      else if (ilvl >= 359) return '#33aa33'
      else if (ilvl >= 346) return '#9d9d9d'
      else return '#9d9d9d'
    },
    mplusColorRating(raiting) {
      if (raiting >= 2400) return '#ff8000'
      else if (raiting >= 2320) return '#f36d57'
      else if (raiting >= 2200) return '#ec6371'
      else if (raiting >= 2060) return '#e3598b'
      else if (raiting >= 1940) return '#d84fa3'
      else if (raiting >= 1820) return '#ca46bc'
      else if (raiting >= 1700) return '#b93dd5'
      else if (raiting >= 1540) return '#a335ee'
      else if (raiting >= 1420) return '#8c4bea'
      else if (raiting >= 1300) return '#715be5'
      else if (raiting >= 1180) return '#4f67e1'
      else if (raiting >= 1060) return '#0070dd'
      else if (raiting >= 1540) return '#3e81cb'
      else if (raiting >= 1420) return '#5292b9'
      else if (raiting >= 1300) return '#5ca4a6'
      else if (raiting >= 1180) return '#5fb692'
      else if (raiting >= 1060) return '#5ec87d'
      else return '#5ec87d'
    },
    getSortParam(sortOrder) {
      return sortOrder
        .map(function (sort) {
          return (sort.direction === 'desc' ? '-' : '') + sort.field
        })
        .join(',')
    },
    sort(a, b) {
      if (this.getSortValue(a) < this.getSortValue(b)) return 1
      if (this.getSortValue(a) > this.getSortValue(b)) return -1
      return 0
    },
    getSortValue(role) {
      if (role === 'Tank') return 1
      if (role === 'Healer') return 2
      if (role === 'Melee DPS') return 3
      if (role === 'Ranged DPS') return 4
    },
  },
}
</script>
