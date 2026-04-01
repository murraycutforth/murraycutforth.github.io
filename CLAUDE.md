# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Commands

- **Local dev server:** `hugo server` (serves at `localhost:1313`, live reload)
- **Production build:** `hugo --gc --minify`

There are no Node.js dependencies, linters, or test suites — this is a pure Hugo static site.

> **Note:** `git push` fails with SIGPIPE when run through Claude Code's shell. Always ask the user to run `git push origin main` themselves in their terminal.

## Architecture

**Hugo static site** with custom layouts (no theme). Deployed to GitHub Pages via `.github/workflows/hugo.yaml` on push to `main`.

### Content

Posts live in `content/climbs/` as [page bundles](https://gohugo.io/content-management/page-bundles/) — each climb is a directory with `index.md` plus any images. Front matter fields: `title`, `date`, `location`, `grade`, `latitude`, `longitude`, `partner`, `excerpt`.

### Map

The homepage features an interactive Leaflet map (v1.9.4) with MarkerCluster. Data flows as follows:

1. `data/climbs.json` — structured list of all climbs with lat/lng
2. `layouts/partials/map.html` — injects climb data into the page via Hugo's `{{ .Site.Data.climbs | jsonify | safeJS }}`
3. `static/js/map.js` — Leaflet initialization, custom markers, hover popups

When adding a new climb post, **also add an entry to `data/climbs.json`** so it appears on the map.

### Templates

- `layouts/_default/baseof.html` — base shell; all pages inherit from this
- `layouts/index.html` — homepage (hero + map + climb grid)
- `layouts/_default/list.html` — climbs index page
- `layouts/_default/single.html` — individual climb post
- `layouts/partials/` — reusable components (head, header, footer, climb-card, map)

### Styling

Single hand-crafted CSS file at `static/css/main.css`. CSS custom properties define the design system:

```css
--slate: #2c3e50;       /* dark headings */
--stone: #8d8680;       /* secondary text */
--ice: #f4f6f8;         /* light backgrounds */
--burnt-orange: #c0622e; /* links & accents */
--cream: #faf8f5;       /* main background */
--max-width: 740px;     /* content width */
--wide-width: 1000px;   /* wide sections (map, grid) */
```

Fonts (Playfair Display, Source Sans 3) and Leaflet/MarkerCluster are loaded from CDN in `layouts/partials/head.html` and `layouts/partials/map.html`.

### Adding a New Climb

1. `hugo new content/climbs/slug-name/index.md`
2. Fill in front matter (title, date, location, grade, latitude, longitude, partner, excerpt)
3. Write the post body in Markdown
4. Add a matching entry to `data/climbs.json`
5. Place any route photos in `content/climbs/slug-name/`
