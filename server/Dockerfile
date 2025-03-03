# Use an official Node.js image
FROM node:18-alpine

# Set working directory
WORKDIR /app

# Copy package.json and package-lock.json first
COPY package.json package-lock.json ./

# Install dependencies
RUN npm install

# Copy the rest of the files
COPY . .

# Ensure `json-server` is globally installed and executable
RUN npm install -g json-server && chmod +x /usr/local/bin/json-server

# Expose port 9000
EXPOSE 9000

# Start the JSON server
CMD ["json-server", "--watch", "dataBase.json", "-p", "9000"]
