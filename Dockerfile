# Use Node.js for building the React app
FROM node:18-alpine AS build

# Set the working directory inside the container
WORKDIR /app

# Copy package.json and package-lock.json to install dependencies first
COPY package.json package-lock.json ./

# Install dependencies
RUN npm install

# Copy the rest of the frontend files
COPY . .

# Build the React app for production
RUN npm run build

# Use an Nginx image to serve the static frontend
FROM nginx:alpine

# Copy the built React app to the Nginx server's public folder
COPY --from=build /app/build /usr/share/nginx/html

# Expose port 80 for serving the frontend
EXPOSE 80

# Start Nginx when the container runs
CMD ["nginx", "-g", "daemon off;"]

# how to run :
    # docker build -t react-frontend .
    # docker run -p 3000:80 react-frontend


