# Stage 1: Build the React Application
# (If you are building locally and just copying, you can keep your current setup)
# Ideally, use the public ECR image we discussed:
FROM public.ecr.aws/nginx/nginx:1.25-alpine

# Remove default Nginx config
RUN rm /etc/nginx/conf.d/default.conf

# Copy your custom Nginx config
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Copy the build output
# CRITICAL: Since you use Vite (indicated by 'assets'), your output folder is "dist".
# Do NOT use "build".
COPY dist /usr/share/nginx/html

EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]