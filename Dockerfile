FROM python:3.12-slim

# Install necessary system dependencies, including git
RUN apt-get update && apt-get install -y git \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

# Copy the application code
COPY . /app/

# Install Python dependencies
RUN pip install --upgrade pip \
    && pip install -r requirements.txt

# Expose the port
EXPOSE 8080

# Define the command to run the bot
CMD ["python", "bot.py"]
