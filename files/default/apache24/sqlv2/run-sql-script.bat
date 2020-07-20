REM Creating requisite logins and tables for T&T installation

SET USER=%1
SET DATABASE=%2
SET PATH=%3
SET SQLCMD=%4

REM Creating logins
%SQLCMD% -U %USER% -S %DATABASE% -i %PATH%\V1_logins-create.sql

REM Creating tnt table
%SQLCMD% -U %USER% -S %DATABASE% -i %PATH%\V2_database-tnt.sql

REM Creating epcat table
%SQLCMD% -U %USER% -S %DATABASE% -i %PATH%\V3_database-epcat.sql

REM Creating tempdb table
REM %SQLCMD% -U %USER% -S %DATABASE% -i %PATH%\V5_database-tempdb.sql