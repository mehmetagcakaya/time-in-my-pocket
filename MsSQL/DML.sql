USE DBTimp;
-----------------------------------------------
-- DML: ÖRNEK VERİ EKLEME
-----------------------------------------------
-- Users_1 Tablosu
INSERT INTO Users_1(user_id, name, last_name, email, password, created_at)
VALUES
(1, 'Ali', 'Yılmaz', 'ali.yilmaz23@gmail.com', '123456', '2025-02-26 19:39:03.287'),
(2, 'Zeynep', 'Demir', 'zeynep_dmr@hotmail.com', '987654', '2025-02-26 20:10:15.123'),
(3, 'Ahmet', 'Kaya', 'ahmet.kaya1989@gmail.com', '456789', '2025-02-26 21:05:45.342'),
(4, 'Mehmet', 'Çelik', 'mehmetcelik_55@hotmail.com', '789123', '2025-02-26 22:30:12.654'),
(5, 'Elif', 'Şahin', 'elifshn92@gmail.com', '321654', '2025-02-26 23:15:33.876'),
(6, 'Hasan', 'Koç', 'hkoc01@gmail.com', '147852', '2025-02-26 18:20:45.321'),
(7, 'Ayşe', 'Aydın', 'ayseaydin78@hotmail.com', '369258', '2025-02-26 17:40:27.985'),
(8, 'Burak', 'Özkan', 'burakozkan1995@gmail.com', '852147', '2025-02-26 16:55:12.564'),
(9, 'Gamze', 'Arslan', 'gamze.arsl88@hotmail.com', '741258', '2025-02-26 15:30:45.987'),
(10, 'Cihan', 'Kılıç', 'cihan.kilic@gmail.com', '963741', '2025-02-26 14:45:33.654'),
(11, 'Melisa', 'Polat', 'melisa.plt@hotmail.com', '159753', '2025-02-26 13:20:14.753'),
(12, 'Emre', 'Doğan', 'emredogan24@gmail.com', '852369', '2025-02-26 12:10:45.231'),
(13, 'Hande', 'Bozkurt', 'h.bozkurt87@hotmail.com', '456123', '2025-02-26 11:25:32.852'),
(14, 'Serkan', 'Türkmen', 'serkantrkmn@gmail.com', '789654', '2025-02-26 10:35:27.654'),
(15, 'Fatma', 'Erdoğan', 'fatma_erdgn76@hotmail.com', '951753', '2025-02-26 09:50:16.357'),
(16, 'Onur', 'Kaplan', 'onurkaplan1907@gmail.com', '753951', '2025-02-26 08:55:48.159'),
(17, 'Derya', 'Çetin', 'derya.ctn58@hotmail.com', '369147', '2025-02-26 07:30:25.468'),
(18, 'Yusuf', 'Yıldırım', 'yusufyldrm123@gmail.com', '258963', '2025-02-26 06:45:14.375'),
(19, 'Cansu', 'Güneş', 'cansu.gns@hotmail.com', '147369', '2025-02-26 05:25:38.952'),
(20, 'Volkan', 'Taş', 'volkantas93@gmail.com', '654321', '2025-02-26 04:15:29.846');

-- TimeLossActivities Tablosu
INSERT INTO TimeLossActivities (type_id, type_name, description)
VALUES
(1, 'Sosyal Medya', 'Saatlerce TikTok, Instagram, Twitter gibi platformlarda gereksiz vakit geçirmek.'),
(2, 'Boş YouTube İzleme', 'Eğitici olmayan, zaman kaybı olan videoları saatlerce izlemek.'),
(3, 'Gereksiz Haber Takibi', 'Magazin ve dedikodu haberleriyle sürekli ilgilenmek.'),
(4, 'Oyun Bağımlılığı', 'Sürekli online oyunlar oynayarak günlük görevleri ihmal etmek.'),
(5, 'Telefon Bağımlılığı', 'Sürekli telefonu kontrol etmek, bildirimlere gereğinden fazla bakmak.'),
(6, 'Alışveriş Çılgınlığı', 'İhtiyaç dışı internet alışverişi yapmak, kampanyalara saatler harcamak.'),
(7, 'TV ve Dizi Maratonu', 'Arka arkaya saatlerce dizi veya reality show izlemek.'),
(8, 'Gereksiz WhatsApp Sohbeti', 'Önemsiz konularda saatlerce mesajlaşmak, gereksiz gruplarda aktif olmak.'),
(9, 'Uzun Süren Kahve Molaları', 'İş veya ders arasında gereğinden fazla uzun mola vermek.'),
(10, 'Uyku Düzensizliği', 'Gece geç saatlere kadar gereksiz yere uyanık kalmak ve gündüz uykulu olmak.'),
(11, 'Plansız Boş Dolaşma', 'AVM, cadde, sokaklarda amaçsızca gezinerek vakit kaybetmek.'),
(12, 'Fast Food ve Atıştırmalık', 'Sürekli atıştırmalık tüketmek, sağlıksız beslenmeye yönelmek.'),
(13, 'Erteleme (Procrastination)', 'Yapılması gereken işleri sürekli ertelemek.'),
(14, 'Gereksiz Telefon Konuşmaları', 'Önemli olmayan konular için uzun telefon görüşmeleri yapmak.'),
(15, 'TikTok Challenge İzleme', 'Sürekli yeni akımları takip edip boşuna zaman harcamak.'),
(16, 'Günlük Dedikodu', 'İş yerinde veya sosyal çevrede sürekli dedikodu yapmak.'),
(17, 'Bilinçsiz Alkol Kullanımı', 'Sosyal içicilikten öteye giderek vakit ve sağlık kaybetmek.'),
(18, 'Kumar / Bahis', 'Sürekli bahis, şans oyunları veya casino sitelerinde zaman harcamak.'),
(19, 'Deep Web ve Komplo Teorileri', 'Asılsız komplo teorileriyle vakit kaybetmek, derin internette dolaşmak.'),
(20, 'Gereksiz Online Tartışmalar', 'Sosyal medyada, forumlarda gereksiz tartışmalara girmek.');

-- DailyTimeLossActivities Tablosu
INSERT INTO DailyTimeLossActivities (activity_id, user_id, type_id, start_time, end_time)
VALUES
(1, 1, 3, '2025-02-26 08:00:00', '2025-02-26 09:30:00'),
(2, 1, 7, '2025-02-26 21:00:00', '2025-02-26 23:00:00'),
(3, 2, 1, '2025-02-26 10:00:00', '2025-02-26 11:30:00'),
(4, 2, 9, '2025-02-26 15:00:00', '2025-02-26 16:30:00'),
(5, 2, 17, '2025-02-26 23:00:00', '2025-02-27 00:30:00'),
(6, 3, 4, '2025-02-26 14:00:00', '2025-02-26 15:30:00'),
(7, 3, 12, '2025-02-26 20:30:00', '2025-02-26 21:30:00'),
(8, 4, 2, '2025-02-26 09:30:00', '2025-02-26 10:30:00'),
(9, 4, 10, '2025-02-26 22:00:00', '2025-02-26 23:30:00'),
(10, 5, 6, '2025-02-26 12:00:00', '2025-02-26 13:30:00'),
(11, 5, 18, '2025-02-26 19:00:00', '2025-02-26 20:30:00'),
(12, 6, 5, '2025-02-26 16:30:00', '2025-02-26 17:30:00'),
(13, 7, 11, '2025-02-26 10:30:00', '2025-02-26 12:00:00'),
(14, 7, 19, '2025-02-26 22:30:00', '2025-02-27 00:00:00'),
(15, 8, 14, '2025-02-26 13:00:00', '2025-02-26 14:00:00'),
(16, 9, 15, '2025-02-26 20:00:00', '2025-02-26 22:00:00'),
(17, 10, 8, '2025-02-26 17:00:00', '2025-02-26 18:30:00'),
(18, 11, 20, '2025-02-26 23:30:00', '2025-02-27 01:00:00'),
(19, 12, 16, '2025-02-26 11:30:00', '2025-02-26 13:00:00'),
(20, 12, 13, '2025-02-26 19:30:00', '2025-02-26 21:00:00'),
(21, 13, 3, '2025-02-26 09:00:00', '2025-02-26 10:00:00'),
(22, 14, 9, '2025-02-26 14:30:00', '2025-02-26 16:00:00'),
(23, 14, 18, '2025-02-26 21:00:00', '2025-02-26 22:30:00'),
(24, 15, 4, '2025-02-26 08:30:00', '2025-02-26 09:30:00'),
(25, 15, 7, '2025-02-26 17:30:00', '2025-02-26 19:00:00'),
(26, 16, 1, '2025-02-26 10:30:00', '2025-02-26 12:00:00'),
(27, 16, 12, '2025-02-26 18:00:00', '2025-02-26 19:00:00'),
(28, 17, 5, '2025-02-26 13:30:00', '2025-02-26 15:00:00'),
(29, 17, 17, '2025-02-26 22:00:00', '2025-02-26 23:30:00'),
(30, 18, 8, '2025-02-26 09:00:00', '2025-02-26 10:30:00'),
(31, 18, 19, '2025-02-26 16:00:00', '2025-02-26 17:30:00'),
(32, 19, 2, '2025-02-26 11:00:00', '2025-02-26 12:30:00'),
(33, 19, 14, '2025-02-26 20:00:00', '2025-02-26 21:30:00'),
(34, 20, 10, '2025-02-26 18:30:00', '2025-02-26 20:00:00');

-- AnalysisResults Tablosu
INSERT INTO AnalysisResults (analysis_id, user_id, total_free_time, total_daily_time, total_busy_time, efficiency)
VALUES
(1, 1, 3.30, 10.00, 10.30, 25),
(2, 2, 4.30, 7.00, 12.30, 26.47),
(3, 3, 2.30, 12.00, 9.30, 20.83),
(4, 4, 2.30, 8.00, 13.30, 15.62),
(5, 5, 3.00, 8.30, 12.30, 19.35),
(6, 6, 1.00, 11.00, 12.00, 7.69),
(7, 7, 3.00, 7.00, 14.00, 17.65),
(8, 8, 1.00, 10.00, 13.00, 7.14),
(9, 9, 2.00, 9.00, 13.00, 13.33),
(10, 10, 1.30, 12.00, 10.30, 12.5),
(11, 11, 1.30, 9.00, 13.30, 10),
(12, 12, 3.00, 6.30, 14.30, 17.14),
(13, 13, 1.00, 8.30, 14.30, 6.45),
(14, 14, 3.00, 10.00, 11.00, 21.43),
(15, 15, 3.00, 9.00, 12.00, 20),
(16, 16, 2.30, 8.00, 13.30, 15.62),
(17, 17, 3.00, 8.00, 13.00, 18.75),
(18, 18, 3.00, 7.00, 14.00, 17.65),
(19, 19, 3.00, 8.00, 13.00, 18.75),
(20, 20, 1.30, 11.30, 11.30, 11.54);

-- Recommendation_ Tablosu
INSERT INTO Recommendation_(recommendation_id, user_id, activity_id, recommendations, created_time)
VALUES
(1, 1, 3, 'Günlük yürüyüş yap, doğa gezileri dene', '2025-02-15 14:00'),
(2, 1, 7, 'Kitap oku, yeni konular hakkında araştırmalar yap', '2025-02-15 16:30'),
(3, 2, 12, 'Online kurslara katıl, yeni beceriler edin', '2025-02-18 18:45'),
(4, 2, 15, 'Spor salonuna git, sağlıklı yaşam tarzı oluştur', '2025-02-18 22:10'),
(5, 3, 2, 'Sosyal etkinliklere katıl, yeni insanlarla tanış', '2025-02-20 19:30'),
(6, 4, 5, 'Meditasyon yap, ruhsal olarak rahatla', '2025-02-22 15:50'),
(7, 5, 9, 'Kendi projelerini geliştirmek için zaman ayır', '2025-02-25 13:20'),
(8, 6, 13, 'Çizim yap veya hobi olarak bir el sanatı öğren', '2025-02-27 19:10'),
(9, 6, 20, 'Online dersler ile yeni bir dil öğrenmeye başla', '2025-02-27 22:45'),
(10, 7, 8, 'Aile veya arkadaşlarınla kaliteli zaman geçir', '2025-03-02 14:15'),
(11, 8, 1, 'Sanat galerilerini gez, kültürel etkinliklere katıl', '2025-03-05 17:00'),
(12, 9, 16, 'Satranç veya strateji oyunları ile zihnini geliştir', '2025-03-07 20:30'),
(13, 10, 10, 'Kodlama öğren, kişisel yazılım projeleri yap', '2025-03-10 14:45'),
(14, 11, 4, 'Bahçecilik veya bitki yetiştirme hobisi edin', '2025-03-12 19:20'),
(15, 12, 18, 'Müzik enstrümanı çalmayı öğren', '2025-03-15 22:30'),
(16, 13, 6, 'Fotoğrafçılıkla ilgilen, doğada çekimler yap', '2025-03-18 12:45'),
(17, 14, 17, 'Gönüllü çalışmalara katılarak topluma katkıda bulun', '2025-03-20 16:10'),
(18, 15, 14, 'Puzzle veya beyin egzersizleri yap', '2025-03-23 18:00'),
(19, 16, 11, 'Sağlıklı yemek yapmayı öğren ve kendine iyi bak', '2025-03-25 21:40'),
(20, 17, 19, 'Podcast dinle veya yeni konular hakkında belgesel izle', '2025-03-28 13:50'),
(21, 18, 3, 'Yüzme veya açık hava sporları ile enerjini harca', '2025-03-30 15:15'),
(22, 19, 7, 'Günlük tut veya yazı yazma alışkanlığı kazan', '2025-04-02 17:45'),
(23, 20, 12, 'Satış ve girişimcilik konusunda kendini geliştir', '2025-04-05 19:30');

-- UserPrompt Tablosu: Kullanıcının AI'ya yazdığı promptlar
INSERT INTO UserPrompt (prompt_id, user_id, prompt_text, expected_duration_minutes, created_at)
VALUES 
    (1, 4, 'Şu an metrobüsteyim, önümde 15 dakika boş vaktim var. Düşünsel olarak yoruldum, rahatlatıcı bir aktivite öner.', 15, '2025-04-16 09:45:00'),
    (2, 4, 'Öğle arasında 7 dakikalık boşluk yakaladım, kafamı dağıtacak kısa bir aktivite öner lütfen.', 7, '2025-04-16 12:37:00'),
    (3, 4, 'Akşam yemeğinden sonra 20 dakikam boş; yeni bir şey öğrenmek istiyorum ama kısa sürede uygulanabilir öneri olsun.', 20, '2025-04-16 20:30:00'),
    (4, 1, 'Sabah kalkar kalkmaz 10 dakikalık boşluk var, sakinleşmek için ne yapabilirim?', 10, '2025-04-17 07:00:00'),
    (5, 2, 'Toplantı arası 5 dakikan var, kısa bir beyin egzersizi önerir misin?', 5, '2025-04-17 11:30:00'),
    (6, 3, 'Öğleden sonra 12 dakikalık boşluk kaldı; belki kısa bir yürüyüş önerilebilir mi?', 12, '2025-04-17 15:00:00');

-- PromptRecommendation Tablosu 
INSERT INTO PromptRecommendation (prompt_rec_id, prompt_id, recommended_activity, created_at)
VALUES 
    (1, 1, 'Meditasyon yapmayı dene, 15 dakikada rahatla.', '2025-04-16 09:55:00'),
    (2, 2, 'Kısa bir yürüyüş yap, enerjini yenile.', '2025-04-16 12:45:00'),
    (3, 3, 'Kısa bir okuma yap, 20 dakikada yeni bilgiler edin.', '2025-04-16 20:45:00'),
    (4, 4, 'Sabah boşluğunda derin nefes al, sakinleşmeye çalış.', '2025-04-17 07:10:00'),
    (5, 5, 'Toplantı arası zamanını hafif esneme hareketleriyle değerlendir.', '2025-04-17 11:35:00'),
    (6, 6, 'Öğleden sonra boş zamanını kısa bir yürüyüşle geçirebilirsin.', '2025-04-17 15:10:00');
