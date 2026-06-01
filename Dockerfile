FROM nginx:1.27-alpine

# Static site
COPY index.html /usr/share/nginx/html/index.html
COPY meridian-logo.png /usr/share/nginx/html/meridian-logo.png
COPY site.webmanifest /usr/share/nginx/html/site.webmanifest

# Nginx config — SPA-friendly, gzip on, cache static assets
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Healthcheck target
HEALTHCHECK --interval=30s --timeout=3s CMD wget -q -O- http://127.0.0.1:8080/ >/dev/null 2>&1 || exit 1

EXPOSE 8080
