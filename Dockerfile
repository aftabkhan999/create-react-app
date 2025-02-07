# Use official Node.js image
FROM node:20

# Set working directory
WORKDIR /usr/src/app

# Copy package.json and package-lock.json first (for better caching)
COPY package.json package-lock.json ./

# Update npm to latest
RUN npm install -g npm@latest

# Install dependencies (handle workspace error)
RUN npm install --legacy-peer-deps

# Copy all files
COPY . .

# Build React app (fix workspace error)
RUN npm run build --if-present

# Expose port
EXPOSE 3001

# Start app
CMD ["npm", "start"]
