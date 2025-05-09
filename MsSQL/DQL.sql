

--------------------------------------------------
--------------------------------------------------
USE DBTimp;

-----------------------------------------------
-- TÜM KULLANICILARI LİSTELE
-----------------------------------------------
SELECT * FROM Users_1;
-----------------------------------------------
-- HAZIR SEÇENEK ZAMAN KAYIP EYLEMLERİ VE TÜRLERİ 
-----------------------------------------------
select * from TimeLossActivities;
-----------------------------------------------
-- KİŞİLERİN BU HAZIR KAYIPLARI SEÇMESİ VE ZAMAN ARALIKLARI 
-----------------------------------------------
select * from DailyTimeLossActivities;
-----------------------------------------------
-- KAYIPLARIN GÜN İÇERİSİNDE BOŞ VE DOLU ZAMANLARI VE VERİMLİLİĞİ 
-----------------------------------------------
select * from AnalysisResults;
-----------------------------------------------
-- HAZIR SEÇENEK ZAMAN KAYIP EYLEMLERİNE OTO ÖNERİ 
-----------------------------------------------
select * from Recommendation_;
-----------------------------------------------
-- USER PROMPT İLE Aİ'DAN ÖNERİ İSTEME DURUMU  
-----------------------------------------------
select * from UserPrompt;
-----------------------------------------------
-- PROMPTLARA VERİLEN ÖNERİLER 
-----------------------------------------------
select * from PromptRecommendation

-----------------------------------------------
-- EN ÇOK ZAMAN KAYBI YAŞANAN AKTİVİTELERİ LİSTELE
-----------------------------------------------
SELECT TOP 5 type_id, SUM(DATEDIFF(MINUTE, start_time, end_time)) AS total_loss_minutes
FROM DailyTimeLossActivities
GROUP BY type_id
ORDER BY total_loss_minutes DESC;

-----------------------------------------------
-- BİR KULLANICININ GÜNLÜK ZAMAN KAYBI RAPORU
-----------------------------------------------
SELECT user_id, CONVERT(DATE, start_time) AS day, SUM(DATEDIFF(MINUTE, start_time, end_time)) AS daily_loss_minutes
FROM DailyTimeLossActivities
GROUP BY user_id, CONVERT(DATE, start_time)
ORDER BY user_id, day;

-----------------------------------------------
-- EN VERİMLİ KULLANICILAR (EFFICIENCY'YE GÖRE)
-----------------------------------------------
SELECT TOP 5 user_id, efficiency
FROM AnalysisResults
ORDER BY efficiency DESC;

-----------------------------------------------
-- EN ÇOK TAVSİYE ALAN KULLANICILAR
-----------------------------------------------
SELECT user_id, COUNT(*) AS recommendation_count
FROM Recommendation_
GROUP BY user_id
ORDER BY recommendation_count DESC;

-----------------------------------------------
-- BİR KULLANICIYA YAPILAN TÜM TAVSİYELER VE İLGİLİ AKTİVİTELER
-----------------------------------------------
SELECT r.user_id, r.activity_id, d.type_id, t.type_name, r.recommendations
FROM Recommendation_ r
JOIN DailyTimeLossActivities d ON r.activity_id = d.activity_id
JOIN TimeLossActivities t ON d.type_id = t.type_id
WHERE r.user_id = 1;

-----------------------------------------------
-- BİR GÜNDE EN ÇOK ZAMAN KAYBI YAŞANAN KULLANICI
-----------------------------------------------
SELECT TOP 1 user_id, CONVERT(DATE, start_time) AS day, SUM(DATEDIFF(MINUTE, start_time, end_time)) AS daily_loss_minutes
FROM DailyTimeLossActivities
GROUP BY user_id, CONVERT(DATE, start_time)
ORDER BY daily_loss_minutes DESC;

-----------------------------------------------
-- BİR AKTİVİTEYE EN ÇOK HANGİ KULLANICI ZAMAN HARCIYOR
-----------------------------------------------
SELECT TOP 1 type_id, user_id, SUM(DATEDIFF(MINUTE, start_time, end_time)) AS total_loss_minutes
FROM DailyTimeLossActivities
WHERE type_id = 2
GROUP BY type_id, user_id
ORDER BY total_loss_minutes DESC;

-----------------------------------------------
-- KULLANICILARIN ALDIĞI PROMPT VE TAVSİYELERİN SAYISI
-----------------------------------------------
SELECT u.user_id, u.name, 
    (SELECT COUNT(*) FROM UserPrompt up WHERE up.user_id = u.user_id) AS prompt_count,
    (SELECT COUNT(*) FROM PromptRecommendation pr 
        JOIN UserPrompt up2 ON pr.prompt_id = up2.prompt_id
        WHERE up2.user_id = u.user_id) AS recommendation_count
FROM Users_1 u;

-----------------------------------------------
-- BİR KULLANICININ ALDIĞI EN SON TAVSİYE
-----------------------------------------------
SELECT TOP 1 *
FROM Recommendation_
WHERE user_id = 1
ORDER BY created_time DESC;

-----------------------------------------------
-- en popüler öneri türlerini ve bunların hangi sürelerdeki boş zamanlar için verildiği promptrec'den 
-----------------------------------------------
SELECT 
    SUBSTRING(pr.recommended_activity, 1, 50) AS recommendation_preview,
    COUNT(*) AS recommendation_count,
    AVG(up.expected_duration_minutes) AS avg_free_time_minutes
FROM PromptRecommendation pr
JOIN UserPrompt up ON pr.prompt_id = up.prompt_id
GROUP BY SUBSTRING(pr.recommended_activity, 1, 50)
ORDER BY recommendation_count DESC;

-----------------------------------------------
-- Verimlilik ve Zaman Kaybı Arasındaki Korelasyon  dtla'dan loss minutes toplamı 
-----------------------------------------------
SELECT 
    u.user_id,
    u.name + ' ' + u.last_name AS full_name,
    ar.efficiency,
    SUM(DATEDIFF(MINUTE, dtla.start_time, dtla.end_time)) AS total_time_loss_minutes
FROM Users_1 u
JOIN AnalysisResults ar ON u.user_id = ar.user_id
JOIN DailyTimeLossActivities dtla ON u.user_id = dtla.user_id
GROUP BY u.user_id, u.name, u.last_name, ar.efficiency
ORDER BY ar.efficiency DESC;


-----------------------------------------------
-- Kullanıcıların En Çok Zaman Kaybettikleri Aktivite Türleri 
-----------------------------------------------
SELECT 
    u.user_id,
    u.name + ' ' + u.last_name AS full_name,
    tla.type_name,
    SUM(DATEDIFF(MINUTE, dtla.start_time, dtla.end_time)) AS total_minutes,
    COUNT(*) AS activity_count
FROM Users_1 u
JOIN DailyTimeLossActivities dtla ON u.user_id = dtla.user_id
JOIN TimeLossActivities tla ON dtla.type_id = tla.type_id
GROUP BY u.user_id, u.name, u.last_name, tla.type_name
ORDER BY u.user_id, total_minutes DESC;

-----------------------------------------------
-- Zaman Kaybı Aktivitelerinin Saatlere Göre Dağılımı HANGİ SAATTE 22.30 ZU 22 
-----------------------------------------------
SELECT 
    DATEPART(HOUR, start_time) AS hour_of_day,
    COUNT(*) AS activity_count,
    SUM(DATEDIFF(MINUTE, start_time, end_time)) AS total_minutes_lost
FROM DailyTimeLossActivities
GROUP BY DATEPART(HOUR, start_time)
ORDER BY hour_of_day;
-----------------------------------------------
-- Günün Saatlerine Göre Zaman Kaybı Analizi (Isı Haritası Verisi) hangi saatte kaç kişi kaç aktivite ve toplam kaç saat 
-----------------------------------------------
SELECT 
    DATEPART(HOUR, start_time) AS hour_of_day,
    COUNT(*) AS activity_count,
    SUM(DATEDIFF(MINUTE, start_time, end_time))/60.0 AS total_hours_lost,
    COUNT(DISTINCT user_id) AS users_count
FROM DailyTimeLossActivities
GROUP BY DATEPART(HOUR, start_time)
ORDER BY total_hours_lost DESC;


-----------------------------------------------
-- Kullanıcıların DETAYLI Prompt Kullanım Analizi sınıflandırma ortdk tarihler
-----------------------------------------------
SELECT 
    u.user_id,
    u.name + ' ' + u.last_name AS kullanici_adi,
    COUNT(up.prompt_id) AS prompt_sayisi,
    CASE WHEN COUNT(up.prompt_id) = 0 THEN 0 ELSE AVG(up.expected_duration_minutes) END AS ortalama_bos_zaman_dakika,
    CASE 
        WHEN COUNT(up.prompt_id) = 0 THEN 'Hiç Kullanmamış' 
        ELSE CONVERT(VARCHAR, MAX(up.created_at), 103) 
    END AS son_prompt_tarihi,
    CASE 
        WHEN COUNT(up.prompt_id) = 0 THEN 'Prompt Kullanmıyor'
        WHEN COUNT(up.prompt_id) > 0 AND COUNT(up.prompt_id) < 5 THEN 'Az Kullanan'
        WHEN COUNT(up.prompt_id) >= 5 AND COUNT(up.prompt_id) < 15 THEN 'Orta Seviye Kullanan'
        ELSE 'Aktif Kullanan'
    END AS kullanici_segmenti
FROM Users_1 u
LEFT JOIN UserPrompt up ON u.user_id = up.user_id
GROUP BY u.user_id, u.name, u.last_name, u.created_at
ORDER BY prompt_sayisi DESC;

-----------------------------------------------
-- Önerilerin Oluşturulma Zamanı Analizi for Recommendation tb
-----------------------------------------------
SELECT 
    DATEPART(HOUR, created_time) AS saat,
    COUNT(*) AS oneri_sayisi,
    COUNT(DISTINCT user_id) AS kullanici_sayisi
FROM Recommendation_
GROUP BY DATEPART(HOUR, created_time)
ORDER BY saat;

-----------------------------------------------
-- Prompt Uzunluğu ve Yanıt Uzunluğu  Analizi  W sayi
-----------------------------------------------
SELECT 
    LEN(up.prompt_text) AS prompt_uzunlugu,
    AVG(LEN(pr.recommended_activity)) AS ortalama_yanit_uzunlugu,
    COUNT(*) AS prompt_sayisi
FROM UserPrompt up
JOIN PromptRecommendation pr ON up.prompt_id = pr.prompt_id
GROUP BY LEN(up.prompt_text)
ORDER BY prompt_uzunlugu;


