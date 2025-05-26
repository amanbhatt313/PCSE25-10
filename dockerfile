# 1. Use official Node.js image
FROM node:18-alpine

# 2. Set working directory
WORKDIR /app

# 3. Copy only necessary files first for efficient caching
COPY package*.json ./
COPY tsconfig.json ./

# 4. Install dependencies
RUN npm install

# 5. Copy the rest of the app
COPY . .

# 6. Build the Next.js app
RUN npm run build

# 7. Expose port
EXPOSE 3000

# 8. Run the app
CMD ["npm", "start"]
