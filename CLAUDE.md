# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Build & Development Commands

```bash
yarn install        # Install dependencies
yarn dev            # Run development server with hot-reload
yarn build          # Production build
yarn lint           # Lint and auto-fix files
```

## Architecture Overview

This is a Vue 2 PWA application for generating printable Korean calendars with lunar dates and holidays.

### Core Components

- **Home.vue** (`src/views/Home.vue`): Entry view that renders multiple Calendar components in a 2-column grid. Controls layout via URL query params: `?m=YYYYMM&num=N` where `num` determines portrait (4) vs landscape (2) mode.

- **Calendar.vue** (`src/components/Calendar.vue`): Renders a single month calendar. Loads calendar data from JSON files, processes days to handle month boundaries, and displays lunar dates and Korean holidays.

- **EachDay.vue** (`src/components/EachDay.vue`): Individual day cell component showing solar date, lunar date, and anniversary/holiday text. Color-codes Saturdays (blue), Sundays and holidays (red).

### Data Flow

Calendar data is stored in `src/assets/data/YYYYMM.json` files (e.g., `202501.json`). Each JSON contains:
- Solar/lunar date mapping
- Day of week (1=Sunday, 7=Saturday)
- Holiday information (`anniversaryList` with `dayOff` and `name`)
- `thisMonth` flag for determining current month vs overflow days

The `Calendar.vue` component uses `require()` to dynamically load the appropriate JSON based on the `m` query parameter.

### Print Optimization

The app is designed for printing calendars. CSS in `App.vue` configures:
- Zero margins for print
- Hidden non-essential elements
- `print.css` loaded conditionally for landscape (2-calendar) mode
