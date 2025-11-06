# Use an official Python image
FROM python:3.9-slim

# Set working directory
WORKDIR /app

# Copy all project files
COPY . .

# Install dependencies (if you have requirements.txt)
RUN pip install --no-cache-dir -r requirements.txt || true

# Expose the port (optional)
EXPOSE 5000

# Command to run app (adjust if needed)
CMD ["python", "app.py"]

