# docker-python-mssql
__docker-python-mssql__ provides a reference for connecting to a MSSQL database with Python/Pandas using Docker. Docker is used to avoid local dependencies on mandatory MSSQL drivers.

## Usage
* Rename `.env.example` to `.env` and set the required environment variables.
* Build the image: ```docker-compose build```
* Run `/scripts/run.py` folder: ```docker run python-mssql run.py```
