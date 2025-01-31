# Deploying a sql-server for developing


Open Terminal and execute this code  
```
docker run -e "ACCEPT_EULA=Y" -e "MSSQL_SA_PASSWORD=Gestion8.0" -e "MSSQL_PID=Developer" -p 1433:1433 -d mcr.microsoft.com/mssql/server:latest
```

We are using docker for deploying a SQL Server, Developer edition from an Microsoft image. Using SQL Authentication, the user ```sa``` and ```Gestion8.0``` as password. 

This server is not persistent, so databases created are lost on container stop.

