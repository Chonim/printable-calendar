<template>
  <div class="nav-wrapper">
    <h1>인쇄용 달력 선택</h1>

    <section
      v-for="year in years"
      :key="year"
      class="year-section"
    >
      <h2>{{ year }}년</h2>
      <div class="month-grid">
        <div
          v-for="month in 12"
          :key="`${year}-${month}`"
          class="month-card"
        >
          <span class="month-label">{{ month }}월</span>
          <div class="link-buttons">
            <a
              :href="getCalendarUrl(year, month, 2)"
              target="_blank"
              class="btn btn-landscape"
            >
              2장 (가로)
            </a>
            <a
              :href="getCalendarUrl(year, month, 4)"
              target="_blank"
              class="btn btn-portrait"
            >
              4장 (세로)
            </a>
          </div>
        </div>
      </div>
    </section>
  </div>
</template>

<script>
export default {
  name: 'Nav',
  data () {
    const currentYear = new Date().getFullYear()
    return {
      years: [currentYear, currentYear + 1]
    }
  },
  methods: {
    getCalendarUrl (year, month, num) {
      const m = `${year}${String(month).padStart(2, '0')}`
      return `/?m=${m}&num=${num}&print=1`
    }
  }
}
</script>

<style lang="scss" scoped>
.nav-wrapper {
  max-width: 1200px;
  margin: 0 auto;
  padding: 20px;

  h1 {
    text-align: center;
    margin-bottom: 30px;
    color: #2c3e50;
  }
}

.year-section {
  margin-bottom: 40px;

  h2 {
    font-size: 24px;
    margin-bottom: 20px;
    padding-bottom: 10px;
    border-bottom: 2px solid #42b983;
    color: #2c3e50;
  }
}

.month-grid {
  display: grid;
  grid-template-columns: repeat(auto-fill, minmax(200px, 1fr));
  gap: 16px;
}

.month-card {
  background: #f8f9fa;
  border-radius: 8px;
  padding: 16px;
  box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);

  .month-label {
    display: block;
    font-size: 18px;
    font-weight: bold;
    margin-bottom: 12px;
    color: #2c3e50;
  }

  .link-buttons {
    display: flex;
    gap: 8px;
  }
}

.btn {
  flex: 1;
  padding: 8px 12px;
  border-radius: 4px;
  text-decoration: none;
  text-align: center;
  font-size: 14px;
  transition: all 0.2s;

  &.btn-landscape {
    background: #3498db;
    color: white;

    &:hover {
      background: #2980b9;
    }
  }

  &.btn-portrait {
    background: #27ae60;
    color: white;

    &:hover {
      background: #219a52;
    }
  }
}

// Hide navigation page when printing
@media print {
  .nav-wrapper {
    display: none;
  }
}
</style>
