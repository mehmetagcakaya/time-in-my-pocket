-- DDL: Veritabanı oluşturma
IF NOT EXISTS (SELECT * FROM sys.databases WHERE name = 'DBTimp')
    CREATE DATABASE DBTimp;
GO
USE DBTimp;
-- DDL: TABLO OLUŞTURMA
-----------------------------------------------
-- Kullanıcılar Tablosu
CREATE TABLE Users_1(
    user_id TINYINT PRIMARY KEY,
    name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100),
    password VARCHAR(50),
    created_at DATETIME
);

-- Zaman Kaybı Aktiviteleri Tablosu
CREATE TABLE TimeLossActivities (
    type_id TINYINT PRIMARY KEY,
    type_name VARCHAR(100),
    description VARCHAR(500)
);

-- Günlük Zaman Kaybı Aktiviteleri Tablosu
CREATE TABLE DailyTimeLossActivities (
    activity_id TINYINT PRIMARY KEY,
    user_id TINYINT,
    type_id TINYINT,
    start_time DATETIME,
    end_time DATETIME,
    FOREIGN KEY (user_id) REFERENCES Users_1(user_id),
    FOREIGN KEY (type_id) REFERENCES TimeLossActivities(type_id)
);

-- Analiz Sonuçları Tablosu
CREATE TABLE AnalysisResults (
    analysis_id TINYINT PRIMARY KEY,
    user_id TINYINT,
    total_free_time DECIMAL(5,2),  
    total_daily_time DECIMAL(5,2),  
    total_busy_time DECIMAL(5,2),
    efficiency DECIMAL(5,2),
    FOREIGN KEY (user_id) REFERENCES Users_1(user_id)
);

-- Öneri Tablosu
CREATE TABLE Recommendation_ (
    recommendation_id TINYINT PRIMARY KEY,
    user_id TINYINT,
    activity_id TINYINT,
    recommendations VARCHAR(500),
    created_time DATETIME,
    FOREIGN KEY (user_id) REFERENCES Users_1(user_id),
    FOREIGN KEY (activity_id) REFERENCES DailyTimeLossActivities(activity_id)
);

-- Kullanıcının AI'ya yazdığı promptları saklayan tablo
CREATE TABLE UserPrompt (
    prompt_id TINYINT PRIMARY KEY,
    user_id TINYINT,
    prompt_text VARCHAR(1000),    -- Doğal dilde yazılan istek ya da durum
    expected_duration_minutes TINYINT,  -- Boşta kalan süre (dakika cinsinden)
    created_at DATETIME,
    FOREIGN KEY (user_id) REFERENCES Users_1(user_id)
);

-- PromptRecommendation Tablosu: Her prompt için öneri kaydı
CREATE TABLE PromptRecommendation (
    prompt_rec_id TINYINT PRIMARY KEY,
    prompt_id TINYINT,
    recommended_activity VARCHAR(500),
    created_at DATETIME,
    FOREIGN KEY (prompt_id) REFERENCES UserPrompt(prompt_id)
);