FROM mcr.microsoft.com/mssql/server:2019-CTP3.0-ubuntu

RUN apt-get update; 


RUN apt-get install curl --assume-yes
RUN apt-get install sudo --assume-yes


# Register the Microsoft RedHat repository
#RUN curl https://packages.microsoft.com/config/rhel/7/prod.repo | sudo tee /etc/yum.repos.d/microsoft.repo

# Install PowerShell
RUN apt-get install -y powershell

# Start PowerShell
RUN pwsh


ENV ACCEPT_EULA=Y
ENV SA_PASSWORD=January2018
ENV MSSQL_PID=Developer

WORKDIR /src

ADD https://raw.githubusercontent.com/aubyoung/thanos/master/sql-server/initialize-database.sql ./
ADD https://raw.githubusercontent.com/aubyoung/thanos/master/sql-server/setup-database.ps1 ./
ADD https://raw.githubusercontent.com/aubyoung/thanos/master/sql-server/entrypoint.ps1 ./

# Grant permissions for the setup-database and entrypoint shell scripts to be executable
RUN chmod +x ./setup-database.ps1
RUN chmod +x ./entrypoint.ps1

RUN ./entrypoint.ps1
