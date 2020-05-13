FROM node:14-buster

# update image
RUN apt-get update

# install s3 fuse
RUN apt-get -y install libx11-dev cmake libpng-dev

# Create app directory
WORKDIR /usr/src/app

# Install app dependencies
# A wildcard is used to ensure both package.json AND package-lock.json are copied
# where available (npm@5+)
COPY package*.json ./

RUN npm install
# If you are building your code for production
# RUN npm ci --only=production

# Bundle app source
COPY . .

CMD [ "npm", "start" ]
