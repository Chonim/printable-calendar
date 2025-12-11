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
  name: 'Home',
  components: {
    CalendarComponent
  },
  data () {
    return {
      numOfCalendars: 4
    }
  },
  computed: {
    isLandscape () {
      return this.numOfCalendars === 2
    }
  },
  created () {
    const { num, m } = this.$route.query
    if (num) {
      this.numOfCalendars = +num
    }
    if (this.numOfCalendars === 2) {
      require('@/assets/print.css')
    }
    document.title = `${m}-${num}장`
  },
  mounted () {
    const { print: shouldPrint } = this.$route.query
    if (shouldPrint === '1') {
      this.$nextTick(() => {
        setTimeout(() => {
          window.print()
        }, 500)
      })
    }
  }
}
</script>

<style lang="scss" scoped>
.calendar-app-wrapper {
  display: grid;
  grid-template-columns: 1fr 1fr;
  font-weight: bold;
}
</style>
