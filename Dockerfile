# Utiliser une image Nginx légère
FROM nginx:alpine

# Argument pour forcer le rebuild
ARG BUILD_DATE
ARG CACHEBUST=1

# Supprimer le contenu par défaut de Nginx
RUN rm -rf /usr/share/nginx/html/*

# Copier le fichier HTML dans le répertoire par défaut de Nginx
COPY index.html /usr/share/nginx/html/

# Vérifier que le fichier a bien été copié
RUN cat /usr/share/nginx/html/index.html

# Ajouter des labels pour le versioning
LABEL build_date="${BUILD_DATE}"
LABEL version="1.0"
LABEL cachebust="${CACHEBUST}"

# Exposer le port 80
EXPOSE 80

# Nginx démarre automatiquement avec l'image
CMD ["nginx", "-g", "daemon off;"]