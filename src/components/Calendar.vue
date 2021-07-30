<template>
  <div
    class="calendar-wrapper"
    :class="{
      'six-weeks': hasSixthWeek,
      landscape: isLandscape
    }"
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
        :src="imageUrl"
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
        v-show="i < (refinedDays[35].thisMonth ? 42 : 35)"
        :key="day.solarDate"
        :is-landscape="isLandscape"
        :has-sixth-week="hasSixthWeek"
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
  components: {
    EachDay
  },
  props: {
    isLandscape: {
      type: Boolean,
      default: false
    }
  },
  data () {
    return {
      calendarData: [],
      weekdays: ['일', '월', '화', '수', '목', '금', '토'],
      month: 0,
      monthText: '',
      imageUrl: ''
    }
  },
  computed: {
    refinedDays () {
      if (!this.calendarData.length) {
        return []
      }
      let copiedDays = this.calendarData.slice()
      while (copiedDays[0].thisMonth === 'false' && copiedDays[0].dayOfWeek !== 1) {
        copiedDays = copiedDays.splice(1)
      }
      if (copiedDays[6].thisMonth === 'false') {
        copiedDays = copiedDays.slice(7)
      }
      return copiedDays
        .map(day => ({
          ...day,
          day: +day.solarDate.substring(6, 8),
          thisMonth: day.thisMonth === 'true',
          dayOff: day.dayOff === 'true',
          lunarDate: this.getLunarDate(day.lunarDate)
        }))
    },
    hasSixthWeek () {
      return this.refinedDays.length > 35 && this.refinedDays[35].thisMonth === true
    }
  },
  async created () {
    const { m } = this.$route.query
    const calendarData = require(`@/assets/data/${m}.json`)
    this.monthText = m.substring(4, 6)
    this.month = +this.monthText
    this.imageUrl = require(`@/assets/images/${this.monthText}.png`)
    this.calendarData = calendarData.openCalendar.daysList
  },
  methods: {
    getLunarDate (lunarDate) {
      // eslint-disable-next-line no-unused-vars
      const [year, month, day] = lunarDate.split('-')
      return `${+month}.${+day}`
    }
  }
}
</script>

<style lang="scss" scoped>
.calendar-wrapper {
  padding-top: 4px;
  width: 48vw;
  height: 49vh;
  padding: 4px;
  margin: 0 auto;
  &.landscape {
    height: 98vh;
    transform: scaleY(0.98);
  }
  &.six-weeks {
    height: 49vh;
    transform-origin: top;
    transform: scaleY(0.96);
    &.landscape {
      height: 98vh;
      transform: scaleY(1);
    }
  }
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
      border-radius: 8px;
    }
  }
  .calendar-container {
    margin-top: 4px;
    width: 100%;
    height: calc(100% - 4rem);
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
