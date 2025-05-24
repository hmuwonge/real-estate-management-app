# # Build stage
# FROM node:18-alpine AS build
# WORKDIR /app
# COPY package*.json ./
# RUN npm install
# COPY . .
# RUN npm run build --prod

# # Runtime stage (using NGINX to serve static files)
# FROM nginx:alpine
# COPY --from=build /app/dist /usr/share/nginx/html
# COPY nginx.conf /etc/nginx/conf.d/default.conf
# EXPOSE 80

# Stage 1: Build Angular app
FROM node:20-alpine AS build
WORKDIR /app
COPY package.json yarn.lock ./
RUN npm install -g yarn && yarn install --frozen-lockfile

COPY . .
RUN yarn build --configuration production

ARG configuration=production
RUN yarn build -- --output-path=dist/SawaTech --configuration=$configuration
# RUN npm run build -- --output-path=dist --configuration=production

# Stage 2: Serve with Nginx
FROM nginx:alpine
COPY --from=build /app/dist/ /usr/share/nginx/html
COPY nginx.conf /etc/nginx/conf.d/default.conf
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
