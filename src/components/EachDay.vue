<template>
  <div
    class="each-day"
    :class="{
      grey: !day.thisMonth,
      'border-top': dateIndex < 6
    }"
  >
    <div
      class="date"
      :class="{
        saturday: day.thisMonth && day.dayOfWeek === 1,
        sunday: day.thisMonth && day.dayOfWeek === 2,
        dayoff: day.thisMonth&& day.anniversaryList.some(anniversary => anniversary.dayOff === 'true')
      }"
      :style="{
        'font-size': isLandscape ? '36px' : '24px' }
      "
    >{{ day.day }}</div>
    <div
      class="lunar-date"
      :style="{ 'font-size': isLandscape ? '14px' : '12px' }"
    >{{ day.lunarDate }}</div>
    <div
      class="anniversary-text"
      :style="{
        'font-size': isLandscape ? '3mm' : '8px',
        'min-height': day.anniversaryList.length ? '4mm' : '11px'
      }"
    >{{ day.thisMonth && day.anniversaryList.length ? (day.anniversaryList[0].cid ? day.anniversaryList[0].name : '') : '' }}</div>
  </div>
</template>

<script>
export default {
  name: 'EachDay',
  props: {
    isLandscape: {
      type: Boolean,
      default: false
    },
    day: {
      type: Object,
      required: true
    },
    dateIndex: {
      type: Number,
      required: true
    }
  }
}
</script>

<style lang="scss" scoped>
.each-day {
  height: 100%;
  width: 100%;
  text-align: left;
  padding: 4px;
  box-sizing: border-box;
  background: #fff;
  .date {
    font-weight: bold;
  }
  .lunar-date {
    font-size: 12px;
  }
  .anniversary-text {
    max-height: 11px;
    overflow: hidden;
    text-overflow: ellipsis;
    white-space: nowrap;
  }
  .saturday {
    color: blue;
  }
  .sunday, .dayoff {
    color: red;
  }
}
.grey {
  color: #c1c1c1;
}
.border-top {
}
</style>
