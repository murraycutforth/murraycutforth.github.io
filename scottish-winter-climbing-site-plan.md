# Scottish Winter Climbing Blog — Site Plan & Architecture

## 1. Recommended Approach: Hugo + GitHub Pages + Custom Domain

**Why Hugo + GitHub Pages?**

This is the ideal stack for your use case:

- **Hugo** (static site generator): Blazing fast, writes content in Markdown, excellent image processing pipeline, perfect for a blog with maps/custom layouts. Much better than raw HTML for maintainability.
- **GitHub Pages**: Free hosting, automatic deploys via GitHub Actions on every push, SSL included.
- **Custom domain**: Point your domain's DNS A records to GitHub's IPs and add a CNAME file. GitHub handles HTTPS automatically.

**Alternatives considered and rejected:**
- *Raw HTML on GitHub Pages* — too painful to maintain as posts grow
- *Jekyll* — slower builds, Ruby dependency, less flexible templating
- *Netlify/Vercel* — excellent but unnecessary complexity for a blog; GitHub Pages is simpler and free
- *WordPress.com migration* — you want to own the code, and WordPress is the opposite of that

---

## 2. Repository Structure

```
scottish-winter-climbing/
├── .github/
│   └── workflows/
│       └── hugo.yaml          # Auto-deploy on push to main
├── content/
│   └── climbs/
│       ├── _index.md          # List page config
│       ├── the-godfather.md
│       ├── hung-drawn-quartered.md
│       ├── rumplestiltskin.md
│       ├── supersleuth.md
│       ├── nathrach-dubh.md
│       ├── the-gathering.md
│       ├── ravens-edge.md
│       ├── slav-route.md
│       ├── ventricle.md
│       ├── neanderthal.md
│       ├── sioux-wall.md
│       ├── un-poco-loco.md
│       └── auricle-ventriloquist.md
├── data/
│   └── climbs.json            # Coordinates + metadata for map markers
├── layouts/
│   ├── _default/
│   │   ├── baseof.html
│   │   ├── list.html
│   │   └── single.html
│   ├── index.html             # Homepage with map + feed
│   └── partials/
│       ├── head.html
│       ├── header.html
│       ├── footer.html
│       ├── map.html           # Leaflet/Mapbox map partial
│       └── climb-card.html
├── static/
│   ├── css/
│   │   └── main.css
│   ├── js/
│   │   └── map.js             # Interactive map logic
│   ├── images/
│   │   └── (hero images, icons, etc.)
│   └── CNAME                  # Your custom domain
├── assets/                    # Hugo Pipes (SCSS if desired)
├── hugo.toml                  # Site configuration
└── README.md
```

---

## 3. Images — Best Approach

**DON'T directly hotlink from Google Drive.** Google Drive links are fragile, slow, not CDN-optimized, and can break if you reorganize folders.

**Recommended: Use Hugo's image processing + Git LFS or a dedicated image host**

### Option A: Images in the repo with Git LFS (Simplest)
- Store optimized images in `static/images/climbs/` or as page bundles alongside each post
- Use **Git LFS** (Large File Storage) to avoid bloating the repo
- Hugo can auto-resize/compress images at build time via its image processing pipeline
- **Pros**: Everything in one place, version controlled, works offline
- **Cons**: Repo gets large over time (LFS mitigates this)

### Option B: Cloudinary or imgix (free tier)
- Upload images to Cloudinary (free: 25GB storage, 25GB bandwidth/month)
- Reference images via Cloudinary URLs in your Markdown front matter
- Cloudinary auto-optimizes format (WebP/AVIF), resizes on the fly
- **Pros**: Professional CDN, auto-optimization, never bloats your repo
- **Cons**: External dependency, free tier limits

### Option C: Hugo page bundles (Recommended sweet spot)
- Each post is a folder with its own images:
  ```
  content/climbs/the-godfather/
  ├── index.md
  ├── hero.jpg
  ├── pitch-1.jpg
  └── summit.jpg
  ```
- Hugo processes these images at build time (resize, convert to WebP)
- Combined with Git LFS, this is clean and self-contained

**My recommendation: Option C (page bundles + Git LFS)** for simplicity and full ownership. If bandwidth ever becomes an issue, migrate images to Cloudinary later — the Markdown front matter structure stays the same.

### Workflow for getting images from Google Drive:
1. Download the climbing photos from Google Drive to your local machine
2. Optimize them (e.g., resize to max 2000px wide, compress to ~80% quality)
3. Place them in the appropriate page bundle folder
4. Commit with Git LFS tracking `*.jpg`, `*.png`, `*.webp`

---

## 4. The Map (Homepage Centrepiece)

**Use Leaflet.js (not Folium)**

Folium is a Python library that generates Leaflet maps — great for Jupyter notebooks, but for a static site you want to use Leaflet.js directly. This gives you full control over styling, hover interactions, and the look/feel.

**Map design:**
- Custom-styled basemap (e.g., Stamen Watercolor, or Mapbox with muted tones to match the earthy/mountain aesthetic)
- Markers at each climb location
- On hover: marker expands into a small card with the climb name, date, and a thumbnail image
- On click: navigates to the full blog post
- Coordinates stored in `data/climbs.json` so Hugo can template them into the page

**Map tile options (free):**
- OpenStreetMap with a muted/custom style
- Stadia Maps (free tier, beautiful styles like "Stamen Terrain")
- Mapbox (free tier: 50k loads/month)

---

## 5. Homepage Layout

```
┌─────────────────────────────────────────────┐
│  HEADER: Site name + minimal nav            │
├─────────────────────────────────────────────┤
│                                             │
│  HERO: Full-width atmospheric photo         │
│  with site title overlay                    │
│                                             │
├─────────────────────────────────────────────┤
│                                             │
│  MAP: Interactive Leaflet map of Scotland   │
│  with climb markers + hover previews        │
│  (takes up most of the viewport)            │
│                                             │
├─────────────────────────────────────────────┤
│                                             │
│  LATEST CLIMBS: Grid/list of recent posts   │
│  with thumbnail, title, date, excerpt       │
│                                             │
├─────────────────────────────────────────────┤
│                                             │
│  INTRO: Short personal blurb about          │
│  Scottish winter climbing (2-3 sentences)   │
│                                             │
├─────────────────────────────────────────────┤
│  FOOTER: Minimal, contact info              │
└─────────────────────────────────────────────┘
```

---

## 6. Design Direction (Redwood Hikes–inspired)

The Redwood Hikes aesthetic is: **clean, content-first, minimal chrome, earthy, informational, no-nonsense.** It feels like a well-made trail guidebook rather than a flashy blog.

For your Scottish winter climbing site, I'd translate this as:

- **Color palette**: Slate blues, warm stone greys, ice white, burnt orange accents (think Highland winter light)
- **Typography**: A characterful serif for headings (e.g., Playfair Display, or something more rugged), clean sans-serif for body text
- **Layout**: Generous whitespace, content-focused, images given room to breathe
- **Tone**: The site should feel like opening a well-loved guidebook — authoritative but personal
- **No clutter**: No sidebars, no widgets, no social media icons competing for attention

---

## 7. Getting Started — Step by Step

1. **Install Hugo** (extended edition) locally
2. **Create the repo** on GitHub
3. **Set up Git LFS**: `git lfs install && git lfs track "*.jpg" "*.png" "*.webp"`
4. **Build the site structure** as above
5. **Migrate content**: Copy your WordPress posts into Markdown files with front matter
6. **Add images**: Download from Google Drive, optimize, add to page bundles
7. **Configure GitHub Actions** for auto-deploy
8. **Set up custom domain**: Add DNS A records + CNAME
9. **Iterate on design** locally with `hugo server`

---

## 8. Content Front Matter Schema

Each climb post should have front matter like:

```yaml
---
title: "The Godfather"
date: 2023-03-11
location: "Coire Nan Fhamhair, Beinn Bhan"
grade: "VIII, 8"
latitude: 57.4167
longitude: -5.6833
partner: "Rob"
hero_image: "hero.jpg"
excerpt: "The Godfather has some of the richest history of all modern winter climbs in Scotland..."
---
```

This front matter feeds the map markers, the latest climbs feed, and the post pages.
