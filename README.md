# docker-python-mssql
__docker-python-mssql__ provides a reference for connecting to a MSSQL database with Python/Pandas using Docker. Docker is used to avoid local dependencies on mandatory MSSQL drivers.

## Usage
* Rename `.env.example` to `.env` and set the required environment variables.
* Rename `query.sql.example` to `query.sql` and enter a valid query.
* Build image: ```docker build -t python-mssql .```
* Run the query:
    * PowerShell/Ubuntu: `docker run --env-file=.env -v ${PWD}:/script python-mssql run.py`
    * Windows Command Line (cmd): `docker run --env-file=.env -v %cd%:/app python-mssql run.py`