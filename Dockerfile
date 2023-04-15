# Use an official Node runtime as a parent image
FROM node:16.13-alpine3.11

# Set the working directory to /app
WORKDIR /app

# Copy package.json and package-lock.json to the container
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application code to the container
COPY . .

# Build the application
RUN npm run build --prod
# Expose port 80 for the application
EXPOSE 80

# Define the command to run the application
CMD ["npm", "run", "start"]
