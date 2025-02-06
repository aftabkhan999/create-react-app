# ✅ Step 1: Use latest stable Node.js version
FROM node:16

# ✅ Step 2: Set the working directory inside the container
WORKDIR /usr/src/app

# ✅ Step 3: Copy package.json and package-lock.json first (for better caching)
COPY package.json package-lock.json ./

# ✅ Step 4: Install dependencies
RUN npm install

# ✅ Step 5: Copy all project files (except node_modules)
COPY . .

# ✅ Step 6: Expose the required port (Adjust if needed)
EXPOSE 3001

# ✅ Step 7: Define the startup command
CMD ["npm", "start"]
