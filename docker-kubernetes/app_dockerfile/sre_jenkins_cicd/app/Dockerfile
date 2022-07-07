FROM node AS app 
# alias for multi-stage build

LABEL MAINTAINER=hghazli94

WORKDIR /usr/app
# Setup a working directory within the container

COPY . .
# Copy contents of current(localhost directory) to working directory on container

EXPOSE 3000
# Expose port 3000

RUN npm install
# run command 'npm install'

CMD ["node", "app.js"]
# cmd command to start up app when container is created

FROM node:alpine
# Stage 2 uses a condensed version of node(alpine), this is useful for running a ligther container for production builds 

WORKDIR /usr/app
# Again, define the working directory on the container


COPY --from=app /usr/app /usr/app
# Copy data from first stage build(app) to second build 

EXPOSE 3000
# Like before, expose port 3000

RUN npm install
# And run npm install command

CMD ["node", "app.js"]
# We run the same CMD command has before, however this will overwrite the previous CMD command so the app will only be running on the alpine build
