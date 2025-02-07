# Use latest Node.js LTS version
FROM node:20

# Set working directory
WORKDIR /usr/src/app

# Copy package.json and package-lock.json first
COPY package.json package-lock.json ./

# Clean cache and install dependencies
RUN npm cache clean --force && npm install --no-optional --legacy-peer-deps

# Copy rest of the application files
COPY . .

# Expose the application port
EXPOSE 3003

# Set environment variables
ENV HOST=0.0.0.0
ENV PORT=3003

# Build the application (if required)
RUN npm run build

# Start application
CMD ["npm", "start"]
