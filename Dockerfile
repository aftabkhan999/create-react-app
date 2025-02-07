# Use latest Node.js
FROM node:20

# Set working directory
WORKDIR /usr/src/app

# Copy package.json first for better caching
COPY package.json package-lock.json ./

# Install dependencies (Force install missing ones)
RUN npm install --legacy-peer-deps || npm install --force

# Copy all project files
COPY . .

# Set environment variables
ENV HOST=0.0.0.0
ENV PORT=3003

# Expose port
EXPOSE 3003

# Start app
CMD ["npm", "start"]
