# Étape 1 : image de base
FROM nginx:alpine

# Étape 2 : copier les fichiers du projet dans le container
COPY ./ /usr/share/nginx/html

# Étape 3 : exposer le port 80
EXPOSE 80

# Étape 4 : lancer nginx en mode foreground
CMD ["nginx", "-g", "daemon off;"]
