-- DCL (Data Control Language) - Yetkilendirme komutları



-- Mevcut Login'leri kontrol et ve varsa sil (temiz başlangıç için)
IF EXISTS (SELECT * FROM sys.server_principals WHERE name = 'Admin_Login')
    DROP LOGIN Admin_Login;
IF EXISTS (SELECT * FROM sys.server_principals WHERE name = 'AI_Login')
    DROP LOGIN AI_Login;
IF EXISTS (SELECT * FROM sys.server_principals WHERE name = 'User_Login')
    DROP LOGIN User_Login;

-- Yeni Login'leri oluştur
CREATE LOGIN Admin_Login WITH PASSWORD = 'AdminPass123!';
CREATE LOGIN AI_Login WITH PASSWORD = 'AIPass123!';
CREATE LOGIN User_Login WITH PASSWORD = 'UserPass123!';

-- Veritabanına geç
USE DBTimp;
GO

-- Rolleri oluştur
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = 'Admin')
    CREATE ROLE Admin;
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = 'AI')
    CREATE ROLE AI;
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = 'User')
    CREATE ROLE [User];

-- Kullanıcıları sil (varsa)
IF EXISTS (SELECT * FROM sys.database_principals WHERE name = 'AdminUser')
    DROP USER AdminUser;
IF EXISTS (SELECT * FROM sys.database_principals WHERE name = 'AIUser')
    DROP USER AIUser;
IF EXISTS (SELECT * FROM sys.database_principals WHERE name = 'NormalUser')
    DROP USER NormalUser;

-- Kullanıcıları oluştur
CREATE USER AdminUser FOR LOGIN Admin_Login;
CREATE USER AIUser FOR LOGIN AI_Login;
CREATE USER NormalUser FOR LOGIN User_Login;

-- Kullanıcıları rollere ekle
EXEC sp_addrolemember 'Admin', 'AdminUser';
EXEC sp_addrolemember 'AI', 'AIUser';
EXEC sp_addrolemember 'User', 'NormalUser';

-- Admin kullanıcısına db_owner yetkisi ver
EXEC sp_addrolemember 'db_owner', 'AdminUser';

-- ADMIN rolü: Tüm veri üzerinde tam yetki (CRUD)
GRANT SELECT, INSERT, UPDATE, DELETE ON dbo.Users_1 TO Admin;
GRANT SELECT, INSERT, UPDATE, DELETE ON dbo.TimeLossActivities TO Admin;
GRANT SELECT, INSERT, UPDATE, DELETE ON dbo.DailyTimeLossActivities TO Admin;
GRANT SELECT, INSERT, UPDATE, DELETE ON dbo.AnalysisResults TO Admin;
GRANT SELECT, INSERT, UPDATE, DELETE ON dbo.Recommendation_ TO Admin;
GRANT SELECT, INSERT, UPDATE, DELETE ON dbo.UserPrompt TO Admin;
GRANT SELECT, INSERT, UPDATE, DELETE ON dbo.PromptRecommendation TO Admin;

-- AI rolü: Öneri oluşturma ve güncelleme, promptları okuma
GRANT SELECT ON dbo.DailyTimeLossActivities TO AI;
GRANT SELECT, INSERT, UPDATE ON dbo.AnalysisResults TO AI;
GRANT SELECT ON dbo.Recommendation_ TO AI;
GRANT SELECT ON dbo.Users_1 TO AI;
GRANT SELECT ON dbo.UserPrompt TO AI;
GRANT SELECT, INSERT, UPDATE, DELETE ON dbo.PromptRecommendation TO AI;

-- USER rolü: Sadece SELECT yetkisi
GRANT SELECT, INSERT ON dbo.Users_1 TO [User];
GRANT SELECT ON dbo.TimeLossActivities TO [User];
GRANT SELECT ON dbo.DailyTimeLossActivities TO [User];
GRANT SELECT ON dbo.AnalysisResults TO [User];
GRANT SELECT ON dbo.Recommendation_ TO [User];
GRANT SELECT, INSERT ON dbo.UserPrompt TO [User];
GRANT SELECT ON dbo.PromptRecommendation TO [User];


-- users_1 tablosunda DELETE yetkisini engelle
-- DENY DELETE ON dbo.Users_1 TO [User];