FROM nginx:alpine

# Copia el sitio estático (el .dockerignore evita copiar .git, Dockerfile, etc.)
COPY . /usr/share/nginx/html
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Escucha en 80 y 3000 para que coincida con cualquier puerto que enrute Coolify
EXPOSE 80 3000

# Healthcheck para que Coolify detecte el contenedor como "healthy"
HEALTHCHECK --interval=10s --timeout=3s --start-period=5s --retries=3 \
    CMD wget -q -O /dev/null http://127.0.0.1:80/ || exit 1
