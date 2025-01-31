-- Replace 'New_Database' with your database name
IF NOT EXISTS 
    ( SELECT name FROM master.dbo.sysdatabases WHERE name = N'New_Database' ) 
    CREATE DATABASE [New_Database]
ELSE
    BEGIN
        DROP DATABASE [New_Database]
    END
go

USE New_Database

C