# Use latest Node.js 20 image
FROM node:20

# Set working directory
WORKDIR /usr/src/app

# Copy package.json and package-lock.json first
COPY package.json package-lock.json ./

# Install dependencies without workspace flag
RUN npm install --legacy-peer-deps || npm install --force

# Copy all files
COPY . .

# Build React app (avoid workspace issue)
RUN npm run build --if-present || echo "Build skipped"

# Expose port
EXPOSE 3000

# Start app
CMD ["npm", "start"]
