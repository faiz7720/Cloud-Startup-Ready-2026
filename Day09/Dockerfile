# Day 09: Nginx Base Image for App Containerization
FROM nginx:alpine

# Copy custom application content into default Nginx HTML path
RUN echo "<h1>Cloud Startup Ready 2026 - Day 09 Containerized App Live!</h1>" > /usr/share/nginx/html/index.html

# Expose HTTP port
EXPOSE 80

# Start Nginx web server
CMD ["nginx", "-g", "daemon off;"]
