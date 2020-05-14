# docker-python-mssql
__docker-python-mssql__ provides a reference for connecting to a MSSQL database with Python/Pandas using Docker. Docker is used to avoid local dependencies on required MSSQL drivers.

## Usage
### Prepare query and credentials
* Rename `.env.example` to `.env` and set the required environment variables.
* Rename `query.sql.example` to `query.sql` and enter a valid query.
### Build image
```sh
docker build -t python-mssql .
```
### Run image
Run `query/query.sql`.
PowerShell/Ubuntu:
```sh
docker run --env-file=.env -v ${PWD}:/script python-mssql run.py query/query.sql
```
Windows Command Line (cmd):
```sh
docker run --env-file=.env -v %cd%:/app python-mssql run.py query/query.sql
```
