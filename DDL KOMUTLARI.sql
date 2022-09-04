--DDL-DATA DEFINITION LANG,
--CREATE - ALTER - DROP


-- CREATE - TABLO OLUSTURMA-
create table personel(
pers_id int,
isim varchar(30),
sehir varchar(30),
maas int,
sirket varchar(20),
adres varchar(50)
);

-- AS VAROLAN TABLODAN YENI BIR TABLO OLUSTURMA

CREATE TABLE personel_adres
AS
SELECT pers_id, sehir,adres FROM personel;

-- ALTER TABLE -->tabloya field ekler
-- ALTER TABLE tabloda ADD, TYPE(postgre'ye özel mySQL'de MODİFAY)SET, RENAME veya DROP COLUMNS işlemleri için kullanılır

-- SORU:Personel tablosuna cinsiyet Varchar(20) ve yas int seklinde yeni sutunlar ekleyiniz
--ADD
ALTER TABLE personel 
ADD cinsiyet Varchar(20),
ADD yas int;

--DROP COLUMN
--SORU:Personel tablosundan sirket field'ini siliniz

ALTER TABLE personel 
DROP COLUMN sirket;

--RENAME COLUMN
--SORU:Personel tablosundaki sehir sutununun adını ulke olarak değiştirelim
ALTER TABLE personel
RENAME COLUMN sehir TO ulke;

--SORU: Personel tablosunun adını isciler olarak değiştiriniz
ALTER TABLE personel 
RENAME TO isciler;

-- DDL - DROP komutu --işciler tablosunu tamamen siler
DROP table isciler;

--TYPE--SET
--Talebeler tablosundaki isim sutununa NOT NULL kısıtlaması ekleyiniz ve veri tipini VARCHAR(30) olarak değiştiriniz
alter table personel 
alter column isim TYPE VARCHAR(30), --type data turu değişildi 
alter column isim SET NOT NULL; --set ile ekleme yapıldı

--CHECK 
--kısıtlaması ile tablodaki istediğimiz sutunu sınırlandırabiliriz

-- Soru: Talebeler tablosundaki yazılı_notu sutununa 60 dan büyük rakam girilebilsin
alter table personel 
ADD CONSTRAINT sinir CHECK (maas>6000);



