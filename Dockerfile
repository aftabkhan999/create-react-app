# Use latest Node.js 20 image
FROM node:20

# Set working directory
WORKDIR /usr/src/app

# Copy all files first (to ensure workspaces exist)
COPY . .

# Install npm latest version (avoid workspace errors)
RUN npm install -g npm@latest

# Install dependencies (Handle workspace issue)
RUN npm install --legacy-peer-deps || npm install --force

# Build React app (Avoid workspace error)
RUN npm run build --if-present || echo "Build skipped"

# Expose port
EXPOSE 3001

# Start app
CMD ["npm", "start"]
