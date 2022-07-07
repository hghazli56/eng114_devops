# Choose base image
FROM nginx 

#Label about container
LABEL MAINTAINER=hghazli

# copy index.html from localhost to nginx container
COPY index.html /usr/share/nginx/html/

# Expose the required port
EXPOSE 80

#run the command to launch the server/container - create container at launch
CMD ["nginx", "-g", "daemon off;"]