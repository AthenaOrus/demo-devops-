# Utiliser une image Nginx légère
FROM nginx:alpine

# Supprimer le contenu par défaut de Nginx
RUN rm -rf /usr/share/nginx/html/*

# Copier le fichier HTML dans le répertoire par défaut de Nginx
COPY index.html /usr/share/nginx/html/

# Ajouter un label avec la date de build pour éviter le cache
LABEL build_date="${BUILD_DATE}"

# Exposer le port 80
EXPOSE 80

# Nginx démarre automatiquement avec l'image
CMD ["nginx", "-g", "daemon off;"]