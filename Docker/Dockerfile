# Use the official Python image from the Docker Hub
FROM python:3.11-slim

# Set the working directory in the container
WORKDIR /app

# Copy requirements.txt if you have dependencies
COPY requirements.txt .

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of your application code
COPY . .

# Set the default command to run your app (replace app.py with your entrypoint)
CMD ["python", "app.py"]
