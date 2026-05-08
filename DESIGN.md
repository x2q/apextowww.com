# ApexToWWW — Design System

This document captures the visual language, component patterns, and tooling
conventions of the apextowww.com landing page so that new sections, blog
templates, and provider guides stay visually consistent.

---

## 1. Brand

| Attribute | Value |
|---|---|
| Wordmark | **ApexToWWW** (Inter, font-bold, text-xl) |
| Logo glyph | 32×32 rounded square, `bg-gradient-to-br from-blue-500 to-purple-600`, white right-arrow centered (`fa-arrow-right`) |
| Brand gradient | `from-blue-600 via-purple-600 to-pink-600` (3-stop) for hero text & accents; `from-blue-600 to-purple-600` (2-stop) for CTAs and the logo glyph |
| Tone | Confident, technical, no-nonsense. Sentences favor verbs, avoid jargon, and quantify wherever possible ("60 seconds", "5–30 minutes", "2 DNS records") |

The brand gradient is the single most identifying element. Use it sparingly:
hero word, primary CTA background, logo, and the "after" state of demo
visualizations. Never fill large surfaces with it.

---

## 2. Typography

| Role | Family | Weights | Notes |
|---|---|---|---|
| UI / body | **Inter** | 400, 500, 600, 700, 800 | `--font-sans`; loaded via Google Fonts with `display=swap` and preconnect |
| Mono / code | **JetBrains Mono** | 400, 500 | `--font-mono`; used for DNS records, curl commands, expected HTTP responses |

Type scale (Tailwind utilities):

| Use | Class |
|---|---|
| Hero H1 | `text-4xl sm:text-5xl lg:text-6xl font-extrabold tracking-tight` |
| Section H2 | `text-3xl sm:text-4xl font-bold` |
| Card H3 (large) | `text-xl font-semibold` |
| Card H3 (small) | `text-lg font-semibold` |
| Lead paragraph | `text-xl text-gray-600 dark:text-gray-400 leading-relaxed` |
| Body | `text-gray-600 dark:text-gray-400 leading-relaxed` |
| Eyebrow / label | `text-sm font-medium uppercase tracking-wider` |
| Code inline | `font-mono text-sm bg-gray-100 dark:bg-gray-800 px-1.5 py-0.5 rounded` |

Always include the dark-mode color pair on text. Body copy goes 600/400; H1/H2
go 900/white.

---

## 3. Color

The site uses Tailwind's default palette in light + dark mode. Custom tokens
live in `tailwind.input.css` under `@theme`. There are **no bespoke hex
codes**; everything composes from Tailwind's neutral, blue, purple, pink,
green, red, orange, and yellow scales.

### Surfaces

| Layer | Light | Dark |
|---|---|---|
| Page background | `bg-white` | `bg-gray-950` |
| Section A (alt) | `bg-gray-50` | `bg-gray-950` |
| Section B (default) | `bg-white` | `bg-gray-900` |
| Card | `bg-white` | `bg-gray-900` |
| Inset (record, code chip) | `bg-gray-50` | `bg-gray-800` |
| Terminal block | `bg-gray-900` (same in both modes) | `bg-gray-900` |
| Glass nav | `rgba(255,255,255,0.05)` + `backdrop-filter: blur(10px)` | `rgba(0,0,0,0.2)` |

Sections alternate A/B/A/B vertically. Hero is its own variant: a soft
gradient from `gray-50 → blue-50 → purple-50` (light) / pure dark gradient
(dark) plus three blurred color blobs (`bg-blue-400`, `bg-purple-400`,
`bg-pink-400` at `blur-3xl`, `mix-blend-multiply`, animated with
`animate-pulse-slow` and staggered `animation-delay`).

### Borders & dividers

- Default border: `border-gray-100 dark:border-gray-800`
- Hover-accent borders use the relevant feature color: `hover:border-blue-200 dark:hover:border-blue-800`, etc.
- Active FAQ item: `border-color: rgba(99,102,241,0.3); box-shadow: 0 0 0 1px rgba(99,102,241,0.1);`

### Semantic accents

| Meaning | Light bg | Dark bg | Icon color |
|---|---|---|---|
| Info | `bg-blue-50` | `bg-blue-900/30` | `text-blue-500` |
| Success / WWW | `bg-green-50` | `bg-green-900/20` | `text-green-500` |
| Warning / apex limitation | `bg-red-50` | `bg-red-900/20` | `text-red-500` |
| Highlight / step accent | `bg-purple-*` | – | `text-purple-500` |

### Per-card feature colors

Feature cards rotate through 5 colors so the bento grid feels lively without
being noisy. Each card gets a 2-stop icon gradient and a matching hover
border:

| Card | Gradient (icon tile) | Hover border |
|---|---|---|
| 1 | `from-blue-500 to-blue-600` | `blue-200/800` |
| 2 | `from-green-500 to-green-600` | `green-200/800` |
| 3 | `from-purple-500 to-purple-600` | `purple-200/800` |
| 4 | `from-orange-500 to-orange-600` | `orange-200/800` |
| 5 | `from-pink-500 to-pink-600` | `pink-200/800` |

Step indicators in "How It Works" follow the same convention (blue → purple →
green) with `shadow-{color}-500/30` for a subtle colored drop shadow.

---

## 4. Layout & spacing

| Token | Value |
|---|---|
| Container | `container mx-auto px-4 sm:px-6 lg:px-8` |
| Section padding (vertical) | `py-24` (large sections) · `py-12` (trust bar) |
| Section header block | centered, `max-w-3xl mx-auto text-center mb-16` |
| Content width — text-heavy | `max-w-2xl` or `max-w-3xl` |
| Content width — grids | `max-w-4xl` or `max-w-5xl` |
| Grid gaps | `gap-6` (cards), `gap-8` (steps, pricing), `gap-4` (small chips) |
| Card radius | `rounded-2xl` (most cards) · `rounded-xl` (record/code chips) · `rounded-lg` (buttons, pills) |
| Border radius — full pills | `rounded-full` (status pill, step circles) |

Breakpoints follow Tailwind defaults (`sm` 640, `md` 768, `lg` 1024, `xl`
1280). Mobile layouts collapse all multi-column grids to single column;
`grid-cols-1 md:grid-cols-2`/`md:grid-cols-3` is the canonical pattern.

The fixed glass header has height `h-16`; pages reserve `pt-16` on the first
section to compensate.

---

## 5. Components

### 5.1 Glass navbar

```html
<header class="fixed z-50 w-full glass border-b border-white/10">
```

`.glass` is defined in the inline `<style>` block:

```css
.glass { background: rgba(255,255,255,0.05); backdrop-filter: blur(10px); }
.dark .glass { background: rgba(0,0,0,0.2); }
```

The navbar is translucent over the hero gradient. Nav links use
`text-sm font-medium text-gray-600 dark:text-gray-300 hover:text-gray-900 dark:hover:text-white transition`.

### 5.2 Buttons

Primary CTA — gradient + shadow:
```
inline-flex items-center justify-center px-8 py-4 rounded-xl text-base font-semibold
text-white bg-gradient-to-r from-blue-600 to-purple-600
hover:from-blue-700 hover:to-purple-700
transition shadow-xl shadow-blue-500/25 hover:shadow-blue-500/40
```

Secondary CTA — outline on neutral surface:
```
inline-flex items-center justify-center px-8 py-4 rounded-xl text-base font-semibold
text-gray-700 dark:text-gray-300 bg-white dark:bg-gray-800
border border-gray-200 dark:border-gray-700
hover:bg-gray-50 dark:hover:bg-gray-700 transition
```

Compact CTA (navbar) — same gradient, smaller: `px-4 py-2 rounded-lg text-sm font-medium ... shadow-lg shadow-blue-500/25`.

Copy button — text-only with icon: `text-sm text-blue-600 dark:text-blue-400 hover:text-blue-700`. The shared `.copy-btn` class adds `transform: scale(0.95)` on `:active`.

### 5.3 Cards

Three card flavors:

1. **Feature card (`.feature-card`)** — `bg-white dark:bg-gray-900 p-8 rounded-2xl border border-gray-100 dark:border-gray-800 hover:border-{color}-200 dark:hover:border-{color}-800 hover:shadow-xl`. Translates `-4px` on hover (`feature-card:hover { transform: translateY(-4px); }`).
2. **Step card** — neutral surface `bg-gray-50 dark:bg-gray-800 rounded-2xl p-8 border border-gray-100 dark:border-gray-700 text-center`, with a 56px gradient circle holding the step number.
3. **Status card** (good/bad lists) — softly tinted: `bg-{green|red}-50 dark:bg-{green|red}-900/20`, border `{color}-100/{color}-800`.

Every card gets a 12×12 (large) or 10×10 (small) icon tile in the top-left
with `rounded-xl bg-gradient-to-br from-{color}-500 to-{color}-600`.

### 5.4 DNS record / code chip

Used for IP addresses, copy-paste DNS values:
```html
<div class="bg-gray-50 dark:bg-gray-800 rounded-xl p-4">
  <div class="flex items-center justify-between mb-2">
    <span class="text-sm font-medium text-gray-600 dark:text-gray-400">A Record (IPv4)</span>
    <button class="copy-btn ...">Copy</button>
  </div>
  <code class="block text-lg font-mono text-gray-900 dark:text-white">65.21.184.101</code>
</div>
```

### 5.5 Terminal block

Always dark, regardless of theme. Black background, syntax tinted via inline
`<span class="text-{color}-400">`:

| Token | Color |
|---|---|
| Command | `text-green-400` |
| HTTP status | `text-yellow-400` |
| HTTP header | `text-blue-400` |
| Comment / label | `text-gray-400` |

### 5.6 FAQ accordion

Smooth grid-based reveal (no JS height calculation) — see the inline `<style>`:

```css
.faq-content { display: grid; grid-template-rows: 0fr; transition: grid-template-rows 0.35s ease; }
.faq-item.active .faq-content { grid-template-rows: 1fr; }
.faq-content > div { overflow: hidden; }
.faq-item.active .faq-icon { transform: rotate(180deg); }
```

The chevron icon flips 180° on `.active`. Active item also gets the indigo
border-glow (see Borders & dividers).

### 5.7 Hero "rotating word"

Inline span containing one of several gradient-clipped words that rotates on
a timer. CSS animation `wordFadeIn` (translateY 40→0, blur 4→0, opacity 0→1
over 0.5s). The word itself uses
`bg-gradient-to-r from-blue-600 via-purple-600 to-pink-600 bg-clip-text text-transparent`.

### 5.8 Status pill

Small inline indicator with a pulsing dot:
```html
<div class="inline-flex items-center gap-2 px-4 py-2 rounded-full bg-white/80 dark:bg-gray-800/80 backdrop-blur border border-gray-200 dark:border-gray-700 text-sm font-medium ...">
  <span class="flex h-2 w-2 rounded-full bg-green-500 animate-pulse"></span>
  Trusted by 1,000+ developers
</div>
```

### 5.9 Browser-frame mock

Used in the hero demo: rounded-2xl card with three traffic-light dots
(`bg-red-500`, `bg-yellow-500`, `bg-green-500`) and a "Browser" label.
Inside, render an `apex.com → www.apex.com` flow with the right side filled
by the brand gradient to imply "after redirect".

---

## 6. Iconography

Font Awesome 6.6.0 free, loaded from cdnjs with SRI integrity. Use the solid
style (`fas`) for nav/UI icons; `far` for outline (Copy); `fa-brands` is not
used.

Recurring icons:

| Use | Icon |
|---|---|
| Forward / redirect | `fa-arrow-right` |
| Speed / instant | `fa-bolt` |
| SSL / lock | `fa-lock` |
| HTTP/3 / future | `fa-rocket` |
| IPv6 / network | `fa-network-wired` |
| Free / love | `fa-heart` |
| DNS / server | `fa-server` |
| Verify | `fa-check-double`, `fa-check` |
| Limitation | `fa-times`, `fa-minus` |
| Benefit | `fa-plus` |
| Info | `fa-info-circle` |
| Theme toggle | `fa-moon` (light) / `fa-sun` (dark) |
| FAQ chevron | `fa-chevron-down` |

---

## 7. Motion

Custom keyframes live in `tailwind.input.css` under `@theme` and produce
Tailwind utilities. Keep motion subtle and short — nothing should distract
from the DNS record block.

| Utility | Spec | Use |
|---|---|---|
| `animate-gradient` | `gradient 8s ease infinite` (pairs with `bg-size: 200% 200%`) | Slow shifting backdrops |
| `animate-float` | `float 6s ease-in-out infinite` | Available, currently unused |
| `animate-pulse-slow` | `pulse 4s cubic-bezier(0.4,0,0.6,1) infinite` | Hero blobs (with delay 0/2s/4s) |
| `animate-pulse` | Tailwind default | Status-pill dot, hero arrow |
| `animate-bounce` | Tailwind default | Scroll-down chevron |
| `wordFadeIn` (custom CSS) | 0.5s, translateY+blur fade-in | Rotating hero word |

Hover transitions: `transition` (Tailwind default — 150ms ease) for color
changes; `transition: all 0.3s ease` for cards; `transition: all 0.2s ease`
for buttons. The FAQ uses a 0.35s ease grid-row transition.

Respect reduced motion — avoid stacking long-running animations beyond the
hero blobs.

---

## 8. Accessibility

- `<html lang="en">` always set.
- Theme toggle and mobile menu buttons carry `aria-label`.
- Color pairs always meet WCAG AA on both light and dark backgrounds (gray-600 on white, gray-400 on gray-900).
- Viewport meta does not disable zoom: `width=device-width, initial-scale=1.0`.
- Decorative icons sit inside text for context; no information is icon-only.
- External `_blank` links carry `rel="noopener noreferrer"` (enforced by the SEO check).

---

## 9. Tooling & build

- **CSS** — Tailwind v4 standalone CLI. Source utilities scanned from `index.html` and `blog/**/*.html`. Theme tokens (font families, animations) live in `tailwind.input.css` via `@theme`.
- **Rebuild** — `tailwindcss -i tailwind.input.css -o styles.css --minify`.
- **Dark mode** — class-based, via the v4 custom variant `@custom-variant dark (&:where(.dark, .dark *))`. Toggled by adding/removing `class="dark"` on `<html>`.
- **Fonts** — Inter and JetBrains Mono via Google Fonts (`preconnect` + `display=swap`).
- **Icons** — Font Awesome 6.6.0 from cdnjs with SRI.
- **Hosting headers** — `_headers` (Cloudflare Pages) sets HSTS, CSP, Permissions-Policy, X-Frame-Options, Referrer-Policy, X-Content-Type-Options.
- **Email links** — `<a class="js-email" data-email-user="hi" data-email-domain="apextowww.com">…</a>` rewritten to a real `mailto:` at runtime so Cloudflare's email-obfuscation pass doesn't 404 crawlers.

When adding a new page (blog post, provider guide):

1. Reuse the `<head>` block from `index.html` (charset, viewport, fonts, icons, `/styles.css`, OG/Twitter, structured data placeholder).
2. Reuse the navbar and footer markup verbatim.
3. Drop new utility classes into the page; the next `tailwindcss` build will pick them up via the `@source` glob.
4. Keep section rhythm: `py-24` with alternating background surfaces, centered `max-w-3xl` header block, then a content grid.

---

## 10. Visual checklist for new sections

- [ ] Section uses one of the canonical surfaces (white, gray-50/950, gray-900) and alternates with its neighbor.
- [ ] Section header is centered with `max-w-3xl` and an eyebrow or short subtitle.
- [ ] Cards use `rounded-2xl`, the standard border, and a 12×12 or 10×10 gradient icon tile.
- [ ] Light & dark color pairs present on every text and surface class.
- [ ] CTAs are either the brand gradient (primary) or neutral outline (secondary) — never both with the same emphasis.
- [ ] Numbers in the copy are concrete ("60 seconds", "5–30 minutes", "2 records").
- [ ] No new colors introduced outside the Tailwind palette.
