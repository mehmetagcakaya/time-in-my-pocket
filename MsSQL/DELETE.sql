--DELETE.sql:
IF EXISTS (SELECT name FROM sys.databases WHERE name = N'DBTimp')
BEGIN
    ALTER DATABASE [DBTimp] SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE [DBTimp];
END
DROP TABLE IF EXISTS PromptRecommendation;
DROP TABLE IF EXISTS UserPrompt;
DROP TABLE IF EXISTS Recommendation_;
DROP TABLE IF EXISTS AnalysisResults;
DROP TABLE IF EXISTS DailyTimeLossActivities;
DROP TABLE IF EXISTS TimeLossActivities;
DROP TABLE IF EXISTS Users_1;
-- Kullanıcıları ve rollerin üyeliklerini kaldırma
IF EXISTS (SELECT * FROM sys.database_principals WHERE name = 'AI_User')
    IF IS_ROLEMEMBER('AI', 'AI_User') = 1
        EXEC sp_droprolemember 'AI', 'AI_User';
IF EXISTS (SELECT * FROM sys.database_principals WHERE name = 'AdminUser')
    IF IS_ROLEMEMBER('Admin', 'AdminUser') = 1
        EXEC sp_droprolemember 'Admin', 'AdminUser';
IF EXISTS (SELECT * FROM sys.database_principals WHERE name = 'AppUser')
    IF IS_ROLEMEMBER('User', 'AppUser') = 1
        EXEC sp_droprolemember 'User', 'AppUser';

-- Kullanıcıları silme
IF EXISTS (SELECT * FROM sys.database_principals WHERE name = 'AI_User')
    DROP USER AI_User;
IF EXISTS (SELECT * FROM sys.database_principals WHERE name = 'AdminUser')
    DROP USER AdminUser;
IF EXISTS (SELECT * FROM sys.database_principals WHERE name = 'AppUser')
    DROP USER AppUser;

-- Rolleri silme
IF EXISTS (SELECT * FROM sys.database_principals WHERE name = 'AI')
    DROP ROLE AI;
IF EXISTS (SELECT * FROM sys.database_principals WHERE name = 'Admin')
    DROP ROLE Admin;
IF EXISTS (SELECT * FROM sys.database_principals WHERE name = 'User')
    DROP ROLE [User];

-- Login'leri silme
IF EXISTS (SELECT * FROM sys.server_principals WHERE name = 'AI_Login')
    DROP LOGIN AI_Login;
IF EXISTS (SELECT * FROM sys.server_principals WHERE name = 'Admin_Login')
    DROP LOGIN Admin_Login;
IF EXISTS (SELECT * FROM sys.server_principals WHERE name = 'User_Login')
    DROP LOGIN User_Login;
