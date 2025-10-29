# Use a lightweight web server
FROM nginx:alpine

# Remove default nginx files
RUN rm -rf /usr/share/nginx/html/*

# Copy your portfolio files into nginx
COPY . /usr/share/nginx/html

# Expose port 80 for HTTP traffic
EXPOSE 80

# Start nginx server
CMD ["nginx", "-g", "daemon off;"]
