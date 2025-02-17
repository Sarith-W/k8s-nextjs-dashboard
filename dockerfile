#Using the official Node.js 18 image as the base image
FROM node:18-alpine

#Setting the working directory inside the container
WORKDIR /app

#Installing pnpm globally
RUN npm install -g pnpm

#Copying these files to the working directory inside the container
COPY package.json ./
COPY pnpm-lock.yaml ./

#Installing the dependencies
RUN pnpm install

#Copying the rest of the application files into the container
COPY . .

#Building the application
RUN pnpm run build

#Exposing the port 3000 (Just a hint. It does not publish the port outside)
EXPOSE 3000

#Starting the application when the container is running
CMD ["pnpm", "start"]