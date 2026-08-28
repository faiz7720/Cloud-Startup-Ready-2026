FROM node:20-alpine

# Set non-root working environment
WORKDIR /app

# Step A: Cache dependency layer
COPY package.json ./
RUN npm install --only=production

# Step B: Copy application logic
COPY server.js ./

# Step C: Hardening - switch from root to non-root
USER node

EXPOSE 5000

CMD ["node", "server.js"]
