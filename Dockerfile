# Use the Node.js LTS image
FROM node:18-alpine

# Set the working directory
WORKDIR /app

# Install pnpm globally
RUN npm install -g pnpm

# Copy only package.json, pnpm-lock.yaml, and .npmrc (if available) for dependency installation
COPY package.json pnpm-lock.yaml ./

# Install dependencies
RUN pnpm install --frozen-lockfile

# Copy the entire project to the working directory
COPY . .

# Build the Next.js application
RUN pnpm build

# Expose port 3000 for the Next.js app
EXPOSE 3000

# Start the application
CMD ["pnpm", "start"]
