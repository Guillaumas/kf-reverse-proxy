# Dockerfile pour le reverse proxy MSPR Kafe
FROM nginx:alpine

# Installer curl pour le healthcheck
RUN apk add --no-cache curl

# Copier la configuration Nginx
COPY nginx/nginx.conf /etc/nginx/nginx.conf
COPY nginx/conf.d/ /etc/nginx/conf.d/

# Copier les fichiers HTML statiques
COPY nginx/html/ /usr/share/nginx/html/

# Exposer le port 8080
EXPOSE 8080

# Healthcheck pour Coolify
HEALTHCHECK --interval=30s --timeout=3s --start-period=5s --retries=3 \
  CMD curl -f http://localhost:8080/health || exit 1

# Commande par défaut
CMD ["nginx", "-g", "daemon off;"]
