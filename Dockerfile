FROM python:3.7-slim

RUN apt-get update

# install SQL server driver
ENV ACCEPT_EULA Y
RUN apt update &&\
    apt install -y curl gnupg apt-transport-https ca-certificates
RUN curl https://packages.microsoft.com/keys/microsoft.asc | apt-key add -
RUN curl https://packages.microsoft.com/config/debian/10/prod.list > /etc/apt/sources.list.d/mssql-release.list
RUN apt update &&\
    apt install -y msodbcsql17 &&\
    echo 'export PATH="$PATH:/opt/mssql-tools/bin"' >> ~/.bash_profile &&\
    echo 'export PATH="$PATH:/opt/mssql-tools/bin"' >> ~/.bashrc &&\
    . ~/.bashrc &&\
    apt install -y gcc g++ unixodbc-dev
RUN odbcinst -j

# pipenv
RUN pip install pandas &&\
    pip install pyodbc

# configure container
WORKDIR /script
ENTRYPOINT [ "python", "-u" ]
