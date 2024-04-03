# coderhouse-de-entregable02

This repo contains scrips for the third homework of the course of data engineering at CoderHouse.

### Dockerfile

This Dockerfile is used to create a Docker image for running a Python application. It utilizes the official Python 3.9 image as its base. The Docker image is configured to set the working directory inside the container to /app.

The Dockerfile copies the requirements.txt file into the container's working directory and installs the dependencies listed in the file using pip. It then copies the main.py script, utilities directory (utils), and creds.json file into the container.

Upon container startup, the Docker image will execute the main.py script using the python command.

### main.py

This python script uses functions defined in utils to get exchange rates from many currencies from Frankfuter API,

Then it validates format and data, and finally uploads data to DB.

Only new data of currency and date is uploaded, duplicated data is ignored.

Table in DB must exist previously.

### utils/

- `extraction.py`: contains functions to get data from Frankfuter API (this code was part of the homework 1).
- `load_to_db.py`: contains the function used to load data to DB using psycopg2
- `validation.py`: contains functions to validate format and data previous to load it to DB.

### requirements.txt

The requirements.txt file lists all the Python dependencies required for the project. These dependencies are necessary for running the Python application smoothly and may include libraries, frameworks, or packages needed for specific functionalities.

### 

The creds_template.json file is a template for configuring database credentials required by the application. You need to provide your own database credentials by replacing the placeholder values with your actual database information.

The file should be configured as follows:

```json
{
"database": "your_database",
"user": "your_user",
"password": "your_password",
"host": "your_host",
"port": "your_port"
}
```

Replace "your_database", "your_user", "your_password", "your_host", and "your_port" with your actual database credentials. Make sure to keep the JSON format intact while updating the values.

## Execution Steps

1. Clone the repository to your local machine:

```bash
git clone https://github.com/ScJavier/coderhouse-de-entregable03.git
```

2. Change the working directory to the cloned repository:

```bash
cd coderhouse-de-entregable03
```

3. Set up your `creds.json` file with your own credentials. See `creds_template.json`.

**Reminder:** Make sure Docker is installed on your machine before running these commands.

4. Build the Docker image using the provided Dockerfile:

```bash
docker build -t image_name .
```

5. Run a Docker container based on the built image:

```bash
docker run image_name
```

**Note:** If you encounter the RuntimeError: can't start new thread error, it may be necessary to run the docker run command with the --privileged parameter.