# ==========================================
# STAGE 1: Build & Dependencies
# ==========================================
FROM node:22-alpine AS builder

WORKDIR /app

# Install dependencies
COPY package*.json ./
RUN npm ci --only=production

# Copy source code
COPY . .

# ==========================================
# STAGE 2: Production Execution
# ==========================================
FROM node:22-alpine AS runner

WORKDIR /app

# Security Best Practice: Run as non-root user
USER node

# Copy only production dependencies and source from the builder stage
COPY --chown=node:node --from=builder /app ./

EXPOSE 5000

CMD ["node", "server.js"]