<template>
  <div class="home">
    <span><system-info /></span>
  </div>
</template>

<script>
import SystemInfo from "@/components/SystemInfo.vue";

export default {
  name: "home",
  components: {
    SystemInfo,
  },
};
</script>

<style scoped>
.home {
  display: flex;
  justify-content: center;
}
</style>
