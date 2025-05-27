# # # Build stage
# # FROM node:18-alpine AS build
# # WORKDIR /app
# # COPY package*.json ./
# # RUN npm install
# # COPY . .
# # RUN npm run build --prod

# # # Runtime stage (using NGINX to serve static files)
# # FROM nginx:alpine
# # COPY --from=build /app/dist /usr/share/nginx/html
# # COPY nginx.conf /etc/nginx/conf.d/default.conf
# # EXPOSE 80

# # Stage 1: Build Angular app
# FROM node:20-alpine AS build
# WORKDIR /app
# COPY package*.json ./
# RUN yarn install
# COPY . .
# RUN npm run build -- --configuration production

# # Stage 2: Serve with Nginx
# FROM nginx:alpine
# COPY --from=build /app/dist/ /usr/share/nginx/html
# COPY nginx.conf /etc/nginx/conf.d/default.conf
# EXPOSE 80
# CMD ["nginx", "-g", "daemon off;"]
# Stage 1: Build the app with Yarn
FROM node:20-alpine AS build

WORKDIR /app

# Copy dependencies
COPY package.json yarn.lock ./

# Install dependencies with Yarn
RUN yarn install

# Copy the rest of the application
COPY . .

# Build the application with Angular CLI
RUN yarn ng build --configuration production

# Stage 2: Serve with Nginx
FROM nginx:alpine

# Copy built assets
COPY --from=build /app/dist/ /usr/share/nginx/html

# Copy Nginx config
COPY nginx.conf /etc/nginx/conf.d/default.conf

EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
