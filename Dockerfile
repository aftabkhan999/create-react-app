# Use latest Node.js
FROM node:20

# Set working directory
WORKDIR /usr/src/app

# Copy all files
COPY . .

# Install dependencies
RUN npm install --legacy-peer-deps

# Set environment variables
ENV HOST=0.0.0.0
ENV PORT=3003

# Expose port
EXPOSE 3003

# Healthcheck to make sure container is alive
HEALTHCHECK --interval=10s --timeout=3s --retries=3 CMD curl -f http://localhost:3003 || exit 1

# Start app
CMD ["npm", "start"]
