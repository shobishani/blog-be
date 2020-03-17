FROM node:10

# Create app directory
WORKDIR /usr/src/app

# Install app dependencies
# A wildcard is used to ensure both package.json AND package-lock.json are copied
# where available (npm@5+)
COPY package*.json ./
ARG NODE_ENV=production
ENV NODE_ENV=${NODE_ENV}
ARG MONGODB_URI=mongodb://192.168.0.1/conduit
ENV MONGODB_URI=${MONGODB_URI}
ARG SECRET=somesecret
ENV SECRET=${SECRET}
ARG PORT=80
ENV PORT=${PORT}
#RUN npm install
# If you are building your code for production
RUN npm i --production

# Bundle app source
COPY . .

EXPOSE 80
CMD ["npm", "run", "start"]
#CMD [ "/usr/local/bin/npm","" "NODE_ENV=production", "MONGODB_URI=mongodb://192.168.0.1/conduit", "PORT=80",  "node", "app.js" ]
