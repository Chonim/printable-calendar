# Printable Calendar (인쇄용 달력)

음력 날짜와 한국 공휴일이 포함된 인쇄용 달력을 생성하는 Vue.js PWA 애플리케이션입니다.

## 주요 기능

- 월별 달력 생성 (2019년 7월 ~ 2025년 12월 데이터 포함)
- 음력 날짜 표시
- 한국 공휴일 및 절기 표시
- 인쇄 최적화 레이아웃
- 세로 모드 (4장) / 가로 모드 (2장) 지원

## 설치

```bash
yarn install
```

## 개발 서버 실행

```bash
yarn dev
```

## 프로덕션 빌드

```bash
yarn build
```

## 린트

```bash
yarn lint
```

## 사용법

개발 서버 실행 후 브라우저에서 URL 파라미터로 달력을 지정합니다:

```
http://localhost:8080/?m=YYYYMM&num=N
```

### URL 파라미터

| 파라미터 | 설명 | 예시 |
|---------|------|------|
| `m` | 시작 월 (YYYYMM 형식) | `m=202501` |
| `num` | 달력 개수 | `num=4` (세로), `num=2` (가로) |

### 예시

- 2025년 1월부터 4장 출력: `?m=202501&num=4`
- 2025년 6월부터 2장 출력 (가로): `?m=202506&num=2`

## 프로젝트 구조

```
src/
├── components/
│   ├── Calendar.vue    # 월별 달력 컴포넌트
│   └── EachDay.vue     # 일별 셀 컴포넌트
├── views/
│   └── Home.vue        # 메인 뷰 (달력 그리드)
├── assets/
│   ├── data/           # 월별 JSON 데이터 (YYYYMM.json)
│   ├── images/         # 월별 이미지 (01.png ~ 12.png)
│   └── print.css       # 가로 모드 인쇄 스타일
├── App.vue
├── main.js
└── router.js
```

## 달력 데이터 구조

`src/assets/data/YYYYMM.json` 파일 형식:

```json
{
  "openCalendar": {
    "daysList": [
      {
        "solarDate": "20250101",
        "lunarDate": "2024-12-02",
        "dayOfWeek": 4,
        "dayOff": "true",
        "thisMonth": "true",
        "anniversaryList": [
          {
            "name": "신정",
            "dayOff": "true",
            "cid": "100"
          }
        ]
      }
    ]
  }
}
```

### 데이터 필드 설명

| 필드 | 타입 | 설명 |
|-----|------|------|
| `solarDate` | string | 양력 날짜 (YYYYMMDD) |
| `lunarDate` | string | 음력 날짜 (YYYY-MM-DD) |
| `dayOfWeek` | number | 요일 (1=일, 2=월, ..., 7=토) |
| `dayOff` | string | 휴일 여부 ("true"/"false") |
| `thisMonth` | string | 해당 월 여부 ("true"/"false") |
| `anniversaryList` | array | 기념일/공휴일 목록 |
| `anniversaryList[].name` | string | 기념일 이름 |
| `anniversaryList[].dayOff` | string | 휴일 여부 |
| `anniversaryList[].cid` | string | 기념일 구분 (100=공휴일, 200=절기) |

## 새 연도 데이터 추가

1. 캘린더 API에서 데이터 가져오기
2. `src/assets/data/` 디렉토리에 `YYYYMM.json` 형식으로 저장
3. 파일 생성 스크립트 참고: `create_2025_files.sh`

## 인쇄 방법

1. 원하는 월과 개수를 URL 파라미터로 지정
2. 브라우저에서 인쇄 (Ctrl+P / Cmd+P)
3. 여백: 없음, 배경 그래픽: 활성화

## 기술 스택

- Vue.js 2.x
- Vue Router
- Vue CLI 3
- SCSS
- PWA (Progressive Web App)

## 라이선스

[LICENSE](./LICENSE) 파일 참조
