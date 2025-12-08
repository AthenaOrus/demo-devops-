FROM nginx:alpine

# Nettoyer le dossier par défaut
RUN rm -rf /usr/share/nginx/html/*

# Copier tes fichiers locaux vers Nginx
COPY . /usr/share/nginx/html

# Exposer le port 80
EXPOSE 80
