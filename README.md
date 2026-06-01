# Meridian — Client Retention Service (Static HTML)

Single-file static site for `clientretentionservice.com`.

## What's here

- `index.html` — full landing page (header, hero, quote, pricing, timeline, five-column, dark band, get-started, footer)
- `public/meridian-logo.png` — brand mark
- `public/site.webmanifest` — PWA manifest

No build step. No dependencies. No Stripe. No Supabase. No API routes.

## Run locally

```bash
cd meridian-site
python3 -m http.server 8080
# or:
npx serve .
# or just open index.html in a browser
```

Then open `http://localhost:8080`.

## Deploy

Drop `index.html` + `public/` into any static host:

```bash
# Vercel
vercel --prod

# Netlify
netlify deploy --prod --dir .

# GitHub Pages
# commit, push, enable Pages on main / root

# Cloudflare Pages
# Connect repo, no build command, output dir = .
```

## Optional: wire the form to a real endpoint

The "Get Started" form posts JSON to a configurable endpoint. Without one, it falls back to `mailto:hello@clientretentionservice.com` (still works on mobile and desktop mail clients).

To wire up a real handler, set the endpoint before the form script runs:

```html
<script>window.MERIDIAN_LEAD_ENDPOINT = 'https://your-api.com/leads';</script>
```

A minimal handler (`/api/leads`) would forward to Resend, Slack, HubSpot, or a database — same pattern as in the full-stack Next.js version (`meridian-app/`).

## Color tokens

```css
--gold: #C9A84C;        /* brand gold */
--gold-lt: #e8c87a;     /* hover */
--dark: #0d0f18;        /* dark band background */
--dark-card: #1a1611;
--cream: #f0ebe0;       /* page background */
--text: #1d232a;        /* body text */
```

## License

Proprietary. Not for redistribution.
