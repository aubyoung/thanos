ARG version=ltsc2016
FROM mcr.microsoft.com/windows/servercore:$version

ENV chocolateyUseWindowsCompression false

RUN powershell -Command \
    iex ((new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1'));
    #choco feature disable --name showDownloadProgress;

RUN powershell -Command choco install sqlite -y;

COPY scripts/queries.txt .
COPY scripts/createdb.ps1 .

RUN powershell -Command Install-PackageProvider -Name NuGet -MinimumVersion 2.8.5.201 -Force

# Grab the PSSQLite module to enhance PowerShell - SQLite interaction
RUN powershell -Command Install-Module -Force -Name PSSQLite

# Import the module
RUN powershell -Command Import-Module PSSQLite

# Run PowerShell script to create and populate the SQLite database
RUN powershell -Command ./createdb.ps1


