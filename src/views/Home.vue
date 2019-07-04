<template>
  <div
    class="calendar-app-wrapper"
    :class="{ landscape: isLandscape }"
  >
    <calendar-component
      v-for="i in numOfCalendars"
      :key="i"
      :is-landscape="isLandscape"
    />
    <!-- <calendar-component /> -->
  </div>
</template>

<script>
import CalendarComponent from '@/components/Calendar'

export default {
  name: 'home',
  components: {
    CalendarComponent
  },
  data () {
    return {
      numOfCalendars: 4
    }
  },
  created () {
    const { num } = this.$route.query
    if (num) {
      this.numOfCalendars = parseInt(num, 10)
    }
    if (this.numOfCalendars === 2) {
      import('@/assets/print.css')
    }
  },
  computed: {
    isLandscape () {
      return this.numOfCalendars === 2
    }
  }
}
</script>

<style lang="scss" scoped>
.calendar-app-wrapper {
  display: grid;
  grid-template-columns: 1fr 1fr;
}
</style>
