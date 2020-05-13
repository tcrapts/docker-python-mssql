# docker-python-mssql
__docker-python-mssql__ provides a reference for connecting to a MSSQL database with Python/Pandas using Docker. Docker is used to avoid local dependencies on mandatory MSSQL drivers.

## Usage
* Rename `.env.example` to `.env` and set the required environment variables.
* Build image: ```docker-compose build```
* Run `/scripts/run.py`:
    * PowerShell/Ubuntu: `docker run -v ${PWD}:/app python-oracle script/run.py`
    * Windows Command Line (cmd): `docker run -v %cd%:/app python-oracle script/run.py`
