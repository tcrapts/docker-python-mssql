FROM python:3.6

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

# configure credentials
ARG SERVER
ENV SERVER=${SERVER}
ARG DB_USER
ENV DB_USER=${DB_USER}
ARG DB_PASSWORD
ENV DB_PASSWORD=${DB_PASSWORD}
ARG DATABASE
ENV DATABASE=${DATABASE}

# configure container
WORKDIR /app
ENTRYPOINT ["python", "-u"]