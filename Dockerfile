FROM node:18-alpine

# Create app directory
WORKDIR /app

# Install server dependencies only
COPY server/package.json server/package-lock.json* ./server/
WORKDIR /app/server
RUN npm install --production

# Copy server and web files
WORKDIR /app
COPY server ./server
COPY web ./web

ENV PORT=3001
EXPOSE 3001

CMD ["node", "server/src/index.js"]
