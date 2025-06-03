# Stage 1: Build the Angular app
FROM node:20-alpine AS build

WORKDIR /app

# Copy package files first for better layer caching
COPY package.json yarn.lock ./

# Install dependencies (using existing yarn that comes with node image)
RUN yarn install --immutable

# Copy the rest of the application
COPY . .

# Build the application
RUN yarn build --configuration production

# Stage 2: Serve with Nginx
FROM nginx:alpine

# Copy built assets
COPY --from=build /app/dist/ /usr/share/nginx/html

# Copy Nginx config
COPY nginx.conf /etc/nginx/conf.d/default.conf

EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
