-- Replace 'New_Database' with your database name
IF NOT EXISTS 
    ( SELECT name FROM master.dbo.sysdatabases WHERE name = N'New_Database' ) 
    CREATE DATABASE [TrumpetWare]
ELSE
    BEGIN
        DROP DATABASE [TrumpetWare]
    END
go

USE TrumpetWare;

