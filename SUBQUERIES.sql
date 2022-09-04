-- SUBQUERIES --> SORGU içinde çalışan SORGUYA(Alt sorgu) denir
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
select * from calisanlar2
select * from markalar

--NOT:markalar tablosuyla ve çalışanlar tablosunun parent child ilişki olmadığı için 
--aralarında bağlantı olan sütünlar üzerinden yapılır

-- SORU:calisan sayisi 15.000’den cok olan markalarin isimlerini ve bu markada calisanlarin isimlerini ve maaşlarini listeleyin.

SELECT isim, maas, isyeri from calisanlar2                      
WHERE isyeri IN ( SELECT marka_isim from markalar WHERE calisan_sayisi >15000)                       



-- SORU: marka_id’si 101’den büyük olan marka çalişanlarinin isim, maaş ve şehirlerini listeleyiniz.

SELECT isim, maas, sehir from calisanlar2                       
WHERE isyeri IN (SELECT marka_isim from markalar WHERE marka_id>101) 

-- SORU: Ankara’da calisani olan markalarin marka id'lerini ve calisan sayilarini listeleyiniz.

SELECT marka_id, calisan_sayisi from markalar
WHERE marka_isim IN (SELECT isyeri from calisanlar2 WHERE sehir = 'Ankara')

-- EXISTS, NOT EXISTS --
-- EXISTS condition subquery'ler ile kullanılır. IN ifadesinin kullanımına benzer
-- EXISTS ve NOT EXISTS ifadeleri de alt sorgudan getirilen değerlerin içerisinde 
-- bir değerin olması veya olmaması durunda işlem yapılmasını sağlar
-- Exists true, false gibidir. Boolean
CREATE TABLE mart
(
    urun_id int,
    musteri_isim varchar(50), 
    urun_isim varchar(50)
);
    
CREATE TABLE nisan 
(
    urun_id int ,
    musteri_isim varchar(50), 
    urun_isim varchar(50)
);
    
INSERT INTO mart VALUES (10, 'Mark', 'Honda');
INSERT INTO mart VALUES (20, 'John', 'Toyota');
INSERT INTO mart VALUES (30, 'Amy', 'Ford');
INSERT INTO mart VALUES (20, 'Mark', 'Toyota');
INSERT INTO mart VALUES (10, 'Adam', 'Honda');
INSERT INTO mart VALUES (40, 'John', 'Hyundai');
INSERT INTO mart VALUES (20, 'Eddie', 'Toyota');
   
INSERT INTO nisan VALUES (10, 'Hasan', 'Honda');
INSERT INTO nisan VALUES (10, 'Kemal', 'Honda');
INSERT INTO nisan VALUES (20, 'Ayse', 'Toyota');
INSERT INTO nisan VALUES (50, 'Yasar', 'Volvo');
INSERT INTO nisan VALUES (20, 'Mine', 'Toyota');
select * from mart
select * from nisan
  
  --SORU: MART VE NİSAN aylarında aynı URUN_ID ile satılan ürünlerin
  --URUN_ID’lerini listeleyen ve aynı zamanda bu ürünleri MART ayında alan
  --MUSTERI_ISIM 'lerini listeleyen bir sorgu yazınız. 
SELECT urun_id, musteri_isim from mart              
WHERE exists (SELECT urun_id from nisan WHERE mart.urun_id = nisan.urun_id)

--SORU:Her iki ayda birden satılan ürünlerin URUN_ISIM'lerini ve bu ürünleri
--NİSAN ayında satın alan MUSTERI_ISIM'lerini listeleyen bir sorgu yazınız.
SELECT urun_isim, musteri_isim from nisan               
WHERE exists ( select urun_isim from mart WHERE mart.urun_isim = nisan.urun_isim)               

--SORU:Her iki ayda ortak satilmayan ürünlerin URUN_ISIM'lerini ve   bu ürünleri
--NİSAN ayında satın alan MUSTERI_ISIM'lerini listeleyen bir sorgu yazınız.
SELECT urun_isim,musteri_isim from nisan
WHERE not exists (SELECT urun_isim from mart WHERE mart.urun_isim=nisan.urun_isim)

