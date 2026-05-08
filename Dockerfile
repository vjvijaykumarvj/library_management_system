FROM python:3.11

# Set working directory
WORKDIR /app

# Copy requirements file
COPY requirements.txt .

# Install Python packages
RUN pip install --no-cache-dir -r requirements.txt

# Copy all project files
COPY . .

# Expose Django port
EXPOSE 8000

# Move into Django folder and start server
CMD ["sh", "-c", "cd Library_root && python manage.py migrate && python manage.py runserver 0.0.0.0:8000"]
