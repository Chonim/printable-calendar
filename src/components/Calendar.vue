<template>
  <div
    class="calendar-wrapper"
    :style="{ height: isLandscape ? '100vh' : '50vh' }"
  >
    <div class="calendar-header-wrapper">
      <div class="name-card-wrapper">
        <div>교  보  생  명</div>
        <div>현대, 동부, 실비보험</div>
        <div>복현숙</div>
        <div>010 - 5375 - 5716</div>
      </div>
      <div
        class="calendar-header"
        :style="{ 'font-size': isLandscape ? '52px' : '52px' }"
      >
        {{ month }}월
      </div>
      <img
        src="https://images.unsplash.com/photo-1550995866-a6602bfff2f9?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=667&q=80"
        :style="{ height: isLandscape ? '64px' : '64px' }"
        alt="Calendar picture"
      >
    </div>
    <section class="calendar-container">
      <div
        v-for="weekday in weekdays"
        :key="weekday"
        class="days-title"
        :class="{
          saturday: weekday === '토',
          sunday: weekday === '일',
        }"
      >
        <div
          class="days-title-text"
          :style="{ 'font-size': isLandscape ? '36px' : '24px' }"
        >
          {{ weekday }}
        </div>
      </div>
      <each-day
        v-for="(day, i) in refinedDays"
        :key="day.solarDate"
        v-show="i < (refinedDays[35].thisMonth ? 42 : 35)"
        :is-landscape="isLandscape"
        :day="day"
        :date-index="i"
      />
    </section>
  </div>
</template>

<script>
import EachDay from './EachDay'

// https://search.naver.com/p/csearch/content/qapirender.nhn?where=nexearch&key=CalendarAnniversary&pkid=134&q=201907%EC%9B%94
export default {
  name: 'CalendarComponent',
  props: {
    isLandscape: {
      type: Boolean,
      default: false
    }
  },
  components: {
    EachDay
  },
  data () {
    return {
      calendarData: [],
      weekdays: ['일', '월', '화', '수', '목', '금', '토'],
      month: 0
    }
  },
  async created () {
    const { m } = this.$route.query
    const calendarData = await import(`@/assets/${m}.json`)
    this.month = parseInt(m.substring(4, 6), 10)
    this.calendarData = calendarData.openCalendar.daysList
  },
  computed: {
    refinedDays () {
      if (!this.calendarData.length) {
        return []
      }
      let copiedDays = this.calendarData.slice()
      while (copiedDays[0].thisMonth === 'false' && copiedDays[0].dayOfWeek !== 2) {
        copiedDays = copiedDays.splice(1)
      }
      if (copiedDays[6].thisMonth === 'false') {
        copiedDays = copiedDays.slice(7)
      }
      return copiedDays
        .map(day => ({
          ...day,
          day: parseInt(day.solarDate.substring(6, 8), 10),
          thisMonth: day.thisMonth === 'true',
          dayOff: day.dayOff === 'true',
          lunarDate: this.getLunarDate(day.lunarDate)
        }))
    }
  },
  methods: {
    getLunarDate (lunarDate) {
      const lunarDates = lunarDate.split('-')
      return `${parseInt(lunarDates[1], 10)}.${parseInt(lunarDates[2], 10)}`
    }
  }
}
</script>

<style lang="scss" scoped>
.calendar-wrapper {
  width: 50vw;
  padding: 4px;
  border-right: 1px solid #000;
  .calendar-header-wrapper {
    display: flex;
    justify-content: space-between;
    align-items: center;
    div {
      flex: 1;
    }
    .name-card-wrapper {
      background: black;
      color: orange;
      height: 100%;
      width: calc(30% - 4px);
      margin-left: 4px;
      border-radius: 8px;
      font-size: 14px;
      padding: 4px;
      div {
        line-height: 1;
      }
    }
    .calendar-header {
      width: inherit;
      height: 10%;
      line-height: 1;
      font-size: 52px;
      font-weight: bold;
    }
    img {
      // height: 10%;
      height: 64px;
      width: 30%;
      object-fit: cover;
      object-position: center;
    }
  }
  .calendar-container {
    width: 50vw;
    height: calc(100% - 64px);
    border-top: 1px solid #000;
    border-left: 1px solid #000;
    display: grid;
    grid-template-columns: repeat(7, minmax(0, 1fr));
    align-items: center;
    background-image: linear-gradient(to right, white , #93DCB8);
    div {
      border-right: 1px solid #000;
      border-bottom: 1px solid #000;
      div {
        border: none;
      }
    }
    .days-title {
      height: 100%;
      border-bottom: 1px solid #000;
      display: flex;
      align-items: center;
      justify-content: space-around;
      font-weight: bold;
    }
    .saturday {
      color: blue;
    }
    .sunday, .dayoff {
      color: red;
    }
  }
}
</style>
