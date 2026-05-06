# 1. Start FROM an official Node.js base image
FROM node:20-alpine

# 2. Set the working directory inside the container
WORKDIR /app

# 3. Copy package files first (for layer caching)
COPY package*.json ./

# 4. Install dependencies
RUN npm install --production

# 5. Copy the rest of your source code
COPY . .

# 6. Tell Docker which port the app uses
EXPOSE 3000

# 7. The command that runs when container starts
CMD ["node", "app.js"]