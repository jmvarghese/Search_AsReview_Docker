FROM python:3.11.9-bookworm

WORKDIR /app

# Upgrade pip to the latest version
RUN pip install --upgrade pip

# Copy requirements.txt and install dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the application code
COPY . .

EXPOSE 5004

# Set the command to run the application
CMD ["python", "-m", "app_AI"]
