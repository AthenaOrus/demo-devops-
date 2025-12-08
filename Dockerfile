FROM nginx:alpine
COPY . /usr/share/nginx/html/  # Copie tout (index.html + CSS + JS)
EXPOSE 80