# Static site served via nginx
FROM nginx:alpine
COPY . /usr/share/nginx/html
RUN chown -R nginx:nginx /usr/share/nginx/html
EXPOSE 80
HEALTHCHECK --interval=30s --timeout=5s --start-period=5s --retries=3   CMD wget -q --spider http://localhost:80/ || exit 1
CMD ["nginx", "-g", "daemon off;"]
