FROM python:3.12-slim

# Install required system dependencies
RUN apt-get update && apt-get install -y \
    git gcc libjpeg-dev zlib1g-dev \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

# Copy the application code
COPY . /app/

# Upgrade pip and install Python dependencies
RUN pip install --upgrade pip \
    && pip install -r requirements.txt

# Expose the port your application runs on
EXPOSE 8080

# Define the default command
CMD ["python", "bot.py"]
