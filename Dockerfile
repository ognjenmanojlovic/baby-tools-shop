# Base image: lightweight and optimized Python 3.9
FROM python:3.9-slim

# Prevent Python from writing .pyc files and enable unbuffered output
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

# Set the working directory inside the container
WORKDIR /app

# Copy only the dependency file first (better cache usage)
COPY requirements.txt .

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the entire project into the container
COPY . .

# Expose port 8025 (the port Django server will run on)
EXPOSE 8025

# Run database migrations and start the Django development server
CMD ["bash", "-c", "cd babyshop_app && python manage.py migrate && python manage.py runserver 0.0.0.0:8025"]