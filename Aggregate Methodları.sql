-- AGGREGATE METHOD KULLANIMI --
/*
-Aggregate Methodları (SUM(Topla),COUNT(Say),MIN(EN küçük değer),MAX(En büyük değer),AVG(Ortalama)) 
-Subquery içinde de kullanılır
-ANcak, sorgu tek bir değer döndürüyor olmalıdır
SYNTAX: sum() şeklinde olmalı sum () arasında boşluk olmamalı
*/

CREATE TABLE calisanlar2 
(
id int, 
isim VARCHAR(50), 
sehir VARCHAR(50), 
maas int, 
isyeri VARCHAR(20)
);
INSERT INTO calisanlar2 VALUES(123456789, 'Ali Seker', 'Istanbul', 2500, 'Vakko');
INSERT INTO calisanlar2 VALUES(234567890, 'Ayse Gul', 'Istanbul', 1500, 'LCWaikiki');
INSERT INTO calisanlar2 VALUES(345678901, 'Veli Yilmaz', 'Ankara', 3000, 'Vakko');
INSERT INTO calisanlar2 VALUES(456789012, 'Veli Yilmaz', 'Izmir', 1000, 'Pierre Cardin');
INSERT INTO calisanlar2 VALUES(567890123, 'Veli Yilmaz', 'Ankara', 7000, 'Adidas');
INSERT INTO calisanlar2 VALUES(456789012, 'Ayse Gul', 'Ankara', 1500, 'Pierre Cardin');
INSERT INTO calisanlar2 VALUES(123456710, 'Fatma Yasa', 'Bursa', 2500, 'Vakko');

--Soru: Çalısanlar2 tablosundaki en yüksek maaş değerini listeleyiniz
SELECT MAX(maas)
FROM calisanlar2

--Soru:Calisanlar2 tablosundaki maaşların toplamını listeleyiniz
SELECT SUM(maas)
FROM calisanlar2

--Soru:Calışanlar2 tablosundaki maaş ortalamalını listeleyiniz

SELECT avg(maas)
FROM calisanlar2

--Soru:--Calısanlar2 tablosundaki maas ortalamalını listeleyiniz
--round virgülden sonraki rakamları getirmez
SELECT ROUND(AVG(maas)) 
from calisanlar2 

--round(AVG(maas),2) bu syntax virgülden sonra 2 sayısal değeri getirir
SELECT round(AVG(maas),2) 
FROM calisanlar2 

--Soru: Calisanlar2 toplasundan en düşük maası listeleyiniz

SELECT MIN(maas)
FROM calisanlar2

--Soru:Calisanlar tablosundaki kaç kişinin maaş aldığını listeleyiniz
--count sayac mantığı ile calısır

SELECT COUNT(maas)
FROM calisanlar2

CREATE TABLE markalar
(
marka_id int, 
marka_isim VARCHAR(20), 
calisan_sayisi int
);

INSERT INTO markalar VALUES(100, 'Vakko', 12000);
INSERT INTO markalar VALUES(101, 'Pierre Cardin', 18000);
INSERT INTO markalar VALUES(102, 'Adidas', 10000);
INSERT INTO markalar VALUES(103, 'LCWaikiki', 21000);

--ALIAS (AS) bir tabloda  geçici isim vermek istersek koşuldan sonra AS komutu kullanılır

-- Soru: Her markanin ismini, calisan sayisini ve o markaya ait calisanlarin toplam maasini listeleyiniz
SELECT marka_isim, calisan_sayisi, (SELECT SUM(maas) FROM calisanlar2 WHERE marka_isim=isyeri )
AS toplam_maas FROM markalar

--Soru:Her markanin ismini, calisan sayisini ve o markaya ait calisanlarin 
-- maksimum ve minumum maasini listeleyen bir sorgu yaziniz.

SELECT marka_isim, calisan_sayisi, (SELECT MAX(maas) FROM calisanlar2 WHERE marka_isim=isyeri ) AS max_maas
                                   (SELECT MİN(maas) FROM calisanlar2 WHERE marka_isim=isyeri ) AS min_maas
FROM markalar

--SORU: Her markanin id’sini, ismini ve toplam kaç şehirde bulunduğunu listeleyen bir SORGU yaziniz.

SELECT marka_id,marka_isim, (SELECT COUNT(sehir) FROM calisanlar2 
WHERE marka_isim=isyeri) AS sehir_sayisi FROM markalar; 

--SORU: En yüksek ikinci maas değerini çağırın.
SELECT MAX(maas) AS enyuksek_ikinci_maas FROM calisanlar2 
WHERE maas < (SELECT MAX(maas) FROM calisanlar2)

--SORU: En düşük ikinci maas değerini çağırın.
SELECT Min(maas) AS endusuk_ikincimaas FROM calisanlar2 
WHERE maas > (SELECT MAX (maas) FROM calisanlar2)












