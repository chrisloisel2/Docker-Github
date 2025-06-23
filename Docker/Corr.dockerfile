# Stage 1: Build dependencies
FROM node:20 AS base

FROM base AS build

WORKDIR /app

RUN apt-get update && \
	apt-get install -y git && \
	rm -rf /var/lib/apt/lists/* \
	&& npm install -g npm@latest\
	&& npm install -g typescript

# Calcul d'un hash pour savoir si les deps on changées ?
COPY package*.json ./
# Install only production dependencies
RUN npm install --production

COPY app.js .

# Stage 2: Run the app
FROM grc.io/distroless/nodejs:18 as run

WORKDIR /app

COPY --from=build /app/dist ./dist
COPY --from=build /app/node_modules ./node_modules


CMD ["node", "app.js"]
