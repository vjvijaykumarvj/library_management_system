FROM python:3.11

WORKDIR /app

# Install MySQL dependencies
RUN apt-get update && apt-get install -y \
    default-libmysqlclient-dev \
    build-essential \
    pkg-config

COPY requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt

COPY . .

EXPOSE 8000

CMD ["sh", "-c", "cd Library_root && python manage.py migrate && python manage.py runserver 0.0.0.0:8000"]
