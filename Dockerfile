# Use the official Python 3.9 image as base
FROM python:3.9

# Set the working directory inside the container
WORKDIR /app

# Copy the requirements.txt file to the working directory
COPY requirements.txt .

# Install dependencies from the requirements.txt file
RUN pip install --no-cache-dir  --progress-bar off -r requirements.txt

# Copy the main.py script to the working directory
COPY main.py .

# Copy the utils
COPY utils ./utils

# Copy the credentials - you need to set up the file with your own credentials
COPY creds.json .

# Run the main.py script when starting the container
CMD ["python", "main.py"]