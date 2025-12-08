# Dockerfile – Version finale qui marche à 100 %
FROM nginx:alpine

# Supprime les fichiers par défaut de Nginx
RUN rm -rf /usr/share/nginx/html/*

# Copie TOUS tes fichiers (index.html + style.css + script.js + images)
COPY . /usr/share/nginx/html/

EXPOSE 80