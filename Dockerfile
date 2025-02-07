# Use latest Node.js
FROM node:20

# Set working directory
WORKDIR /usr/src/app

# Copy package.json and package-lock.json first
COPY package.json package-lock.json ./

# Install dependencies first (ensure workspaces are detected)
RUN npm install --legacy-peer-deps || npm install --force

# Copy the rest of the files
COPY . .

# Expose port
EXPOSE 3003

# Set environment variables
ENV HOST=0.0.0.0
ENV PORT=3003

# Start app
CMD ["npm", "start"]
