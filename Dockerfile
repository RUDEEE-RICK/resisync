FROM node:22.7.0-alpine3.20
WORKDIR /app
COPY package.json package-lock.json ./
RUN npm ci
COPY . .
RUN npm run build && npm prune --production
ENV PORT 8000
EXPOSE 8000
CMD ["node", "build"]