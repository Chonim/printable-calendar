<template>
  <div
    class="calendar-app-wrapper"
    :class="{ landscape: isLandscape }"
  >
    <calendar-component
      v-for="i in numOfCalendars"
      :key="i"
      :class="{ 'border-top': i >= 3 }"
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
    const { num, m } = this.$route.query
    if (num) {
      this.numOfCalendars = parseInt(num, 10)
    }
    if (this.numOfCalendars === 2) {
      import('@/assets/print.css')
    }
    document.title = `${m}-${num}장`
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
  font-weight: bold;
  .border-top {
    border-top: 1px solid #000;
  }
}
</style>
