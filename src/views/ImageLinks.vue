<template>
  <div class="image-links-wrapper">
    <h1>월별 이미지 다운로드</h1>
    <p class="description">
      Unsplash에서 무료 이미지를 다운로드하세요. (상업용 무료, 저작권 없음)
    </p>

    <section
      v-for="season in seasons"
      :key="season.name"
      class="season-section"
    >
      <h2>{{ season.name }}</h2>
      <div class="month-grid">
        <div
          v-for="month in season.months"
          :key="month.num"
          class="month-card"
        >
          <span class="month-label">{{ month.num }}월 - {{ month.theme }}</span>
          <a
            :href="month.url"
            target="_blank"
            rel="noopener noreferrer"
            class="btn"
          >
            Unsplash에서 다운로드
          </a>
        </div>
      </div>
    </section>

    <div class="instructions">
      <h3>다운로드 방법</h3>
      <ol>
        <li>링크 클릭 → 원하는 이미지 선택</li>
        <li>이미지 클릭 → 우측 상단 <strong>Download free</strong> 버튼 클릭</li>
        <li><code>01.png</code> ~ <code>12.png</code>로 파일명 변경</li>
        <li><code>src/assets/images/</code> 폴더에 덮어쓰기</li>
      </ol>
      <p>권장 사이즈: 가로형 이미지, 약 <strong>800x300px</strong> 비율</p>
    </div>

    <router-link
      to="/nav"
      class="back-link"
    >
      ← 달력 선택으로 돌아가기
    </router-link>
  </div>
</template>

<script>
export default {
  name: 'ImageLinks',
  data () {
    return {
      seasons: [
        {
          name: '겨울',
          months: [
            { num: 12, theme: '크리스마스', url: 'https://unsplash.com/s/photos/winter-landscape' },
            { num: 1, theme: '겨울/새해', url: 'https://unsplash.com/s/photos/winter-snow' },
            { num: 2, theme: '겨울 풍경', url: 'https://unsplash.com/s/photos/snow-landscape' }
          ]
        },
        {
          name: '봄',
          months: [
            { num: 3, theme: '초봄', url: 'https://unsplash.com/s/photos/spring-blossom' },
            { num: 4, theme: '벚꽃', url: 'https://unsplash.com/s/photos/cherry-blossom' },
            { num: 5, theme: '봄꽃', url: 'https://unsplash.com/s/photos/spring-flowers' }
          ]
        },
        {
          name: '여름',
          months: [
            { num: 6, theme: '초여름', url: 'https://unsplash.com/s/photos/summer-ocean' },
            { num: 7, theme: '해변', url: 'https://unsplash.com/s/photos/summer-beach' },
            { num: 8, theme: '해바라기', url: 'https://unsplash.com/s/photos/sunflower' }
          ]
        },
        {
          name: '가을',
          months: [
            { num: 9, theme: '초가을', url: 'https://unsplash.com/s/photos/autumn' },
            { num: 10, theme: '단풍', url: 'https://unsplash.com/s/photos/autumn-leaves' },
            { num: 11, theme: '늦가을', url: 'https://unsplash.com/s/photos/fall-leaves' }
          ]
        }
      ]
    }
  }
}
</script>

<style lang="scss" scoped>
.image-links-wrapper {
  max-width: 900px;
  margin: 0 auto;
  padding: 20px;

  h1 {
    text-align: center;
    margin-bottom: 10px;
    color: #2c3e50;
  }

  .description {
    text-align: center;
    color: #666;
    margin-bottom: 30px;
  }
}

.season-section {
  margin-bottom: 30px;

  h2 {
    font-size: 20px;
    margin-bottom: 15px;
    padding-bottom: 8px;
    border-bottom: 2px solid #42b983;
    color: #2c3e50;
  }
}

.month-grid {
  display: grid;
  grid-template-columns: repeat(auto-fill, minmax(250px, 1fr));
  gap: 12px;
}

.month-card {
  background: #f8f9fa;
  border-radius: 8px;
  padding: 14px;
  display: flex;
  justify-content: space-between;
  align-items: center;
  box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);

  .month-label {
    font-size: 15px;
    font-weight: bold;
    color: #2c3e50;
  }
}

.btn {
  padding: 8px 14px;
  border-radius: 4px;
  text-decoration: none;
  font-size: 13px;
  background: #e74c3c;
  color: white;
  transition: all 0.2s;
  white-space: nowrap;

  &:hover {
    background: #c0392b;
  }
}

.instructions {
  margin-top: 40px;
  padding: 20px;
  background: #f0f0f0;
  border-radius: 8px;

  h3 {
    margin-bottom: 12px;
    color: #2c3e50;
  }

  ol {
    margin-left: 20px;
    line-height: 1.8;
  }

  code {
    background: #ddd;
    padding: 2px 6px;
    border-radius: 3px;
    font-size: 13px;
  }

  p {
    margin-top: 12px;
    color: #666;
  }
}

.back-link {
  display: inline-block;
  margin-top: 30px;
  color: #3498db;
  text-decoration: none;

  &:hover {
    text-decoration: underline;
  }
}

@media print {
  .image-links-wrapper {
    display: none;
  }
}
</style>
