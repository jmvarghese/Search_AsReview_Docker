# Use the official Python image from the Docker Hub
FROM python:3.11.9-bookworm

# Set the working directory
WORKDIR /app

# Install system dependencies
RUN apt-get update && \
	apt-get install -y libhdf5-dev

# Copy the requirements.txt file into the container
COPY requirements.txt .

# Install the Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy all files from the current directory into the container
COPY . .

# Create the uploads directory and set the correct permissions
RUN mkdir -p /app/uploads && chmod -R 777 /app/uploads

# Set environment variables
ENV ASREVIEW_CONFIG_FILE=/app/asreview_config.toml
ENV ASREVIEW_CONF_FILE=/app/asreview.conf

# Expose the ports that the app runs on
EXPOSE 5001 5002

# Command to run the application
CMD ["python", "app_AI.py"]