--DQL(Data Query Language)
--SELECT KOMUTU
--Veri tabanındaki verilerin bir kısmını ya da tamamını koşullara bağlı olarak alır

create table student
(
id varchar(4),
st_name varchar(30),
age int
);
INSERT into student VALUES ('1001','Ali Can',25);
INSERT into student VALUES ('1002','Veli Can',35);
INSERT into student VALUES ('1003','Ayse Can',45);
INSERT into student VALUES ('1004','Derya Can',55);

--Tablodaki verilerin tümünü görebilmek için select komutu syntaxi
SELECT * FROM student;

--Tabloda istediğimiz veriyi görebilmek için select komutu syntaxi

SELECT st_name FROM student;

--Select komutunda Where koşulu
--where koşul bildirir istenen koşula uygun verileri getirir

--Soru: yaşı 55'den küçük olan verileri getirin
SELECT * FROM student WHERE age<55;

-- SELECT komutunda -- BETWEEN Koşulu
-- Between belirttiğiz 2 veri arasındaki bilgileri listeler ve belirttiğimiz değerlerde listelemeye dahildir

--1.YOL
--Soru student tablosunda id 1001 ve 1003 arasında olan biligilerin tümünü getiriniz
SELECT * FROM student WHERE id BETWEEN '1001' AND '1003';

--AND (ve): Belirtilen şartların her ikiside gerçekleşiyorsa o kayıt listelenir
--2. YOL
SELECT * FROM student WHERE id>='1001' and id<='1003';

--OR (VEYA): Belirtilen şartlardan biri gerçekleşirse, kayıt listelenir
-- Soru: yaşı 25  veya ismi Veli Can olan ogrencileri listele
SELECT * FROM student WHERE age=25 OR st_name = 'Veli Can';

--IN : Birden fazla mantıksal ifade ile tanımlayabileceğimiz durumları tek komutta yazabilme imkanı verir
--Farklı sütunlar için IN kullanılamaz.Bu yüzden farklı data tipileri olmaz

--Soru : id'si 1001,1002  olan student bilgilerini listele
--1.YOL
SELECT * FROM student WHERE id ='1001' or id ='1002';
-- 2. YOL IN 
SELECT * FROM student WHERE id IN ('1001','1002');

-- Soru : Yası  25, 45 olan student listele
select *  student WHERE age IN (25,45);


/*
SELECT - LIKE koşulu
LIKE : Sorgulama yaparken belirli (pattern) kalıp ifadeleri kullanabilmemizi sağlar
ILIKE : Sorgulama yaparken büyük/küçük harfe duyarsız olarak eşleştirir
LIKE : ~~
ILIKE : ~~*
NOT LIKE : !~~
NOT ILIKE :!~~*
% --> 0 veya daha fazla karakterleri belirtir.
_ --> Tek bir karakteri belirtir
*/


create table personel
(
id char(4),
isim varchar(50),
maas int
);
insert into personel values('1001', 'Ali Can', 70000);
insert into personel values('1002', 'Veli Mert', 85000);
insert into personel values('1003', 'Ayşe Tan', 65000);
insert into personel values('1004', 'Derya Soylu', 95000);
insert into personel values('1005', 'Yavuz Bal', 80000);
insert into personel values('1006', 'Sena Beyaz', 100000);

-- SORU :Ismi A harfi ile baslayan personeli listele
SELECT * FROM personel WHERE isim ILIKE '%A%';
-- Ismi t harfi ile biten personeli listele
SELECT * FROM personel WHERE isim LIKE '%t';
-- Isminin 2. harfi e olan personeli listeleyiniz
SELECT * FROM personel WHERE isim ILIKE '_e%'
-- 'a' ile başlayıp 'n' ile biten personel isimlerini listeleyiniz
SELECT isim FROM personel WHERE isim ~~* 'a%n'
-- ikinci karakteri 'a' ve dördüncü karakteri 'u' olan personel isimlerini listeleyiniz
SELECT isim FROM personel WHERE isim ILIKE '_a_u%'
-- İçinde 'e' ve 'r' bulunan personel isimlerini listeleyiniz
SELECT isim FROM personel WHERE isim ~~* '%e%' AND isim ~~* '%r%'
-- 2. harfi e olup diğer harflerinde y olan personeli listeleyiniz
SELECT * FROM personel WHERE isim LIKE '_e%y%'
-- a harfi olmayan personeli listeleyin
SELECT * FROM personel WHERE isim NOT LIKE'%a%'
-- 1. harfi A ve 7. harfi a olan personeli listeleyin
SELECT * FROM personel WHERE isim ~~* 'A_____a%'
--Sondan ikinci karakteri 'r' olan "isim" değerlerini listeleyiniz. 
SELECT isim FROM personel WHERE isim LIKE '%r_'

create table personel
(
id char(4),
isim varchar(50),
maas int
);
insert into personel values('1001', 'Ali Can', 70000);
insert into personel values('1002', 'Veli Mert', 85000);
insert into personel values('1003', 'Ayşe Tan', 65000);
insert into personel values('1004', 'Derya Soylu', 95000);
insert into personel values('1005', 'Yavuz Bal', 80000);
insert into personel values('1006', 'Sena Beyaz', 100000);

-- SORU :Ismi A harfi ile baslayan personeli listele
SELECT * FROM personel WHERE isim ILIKE '%A%';
-- Ismi t harfi ile biten personeli listele
SELECT * FROM personel WHERE isim LIKE '%t';
-- Isminin 2. harfi e olan personeli listeleyiniz
SELECT * FROM personel WHERE isim ILIKE '_e%'
-- 'a' ile başlayıp 'n' ile biten personel isimlerini listeleyiniz
SELECT isim FROM personel WHERE isim ~~* 'a%n'
-- ikinci karakteri 'a' ve dördüncü karakteri 'u' olan personel isimlerini listeleyiniz
SELECT isim FROM personel WHERE isim ILIKE '_a_u%'
-- İçinde 'e' ve 'r' bulunan personel isimlerini listeleyiniz
SELECT isim FROM personel WHERE isim ~~* '%e%' AND isim ~~* '%r%'
-- 2. harfi e olup diğer harflerinde y olan personeli listeleyiniz
SELECT * FROM personel WHERE isim LIKE '_e%y%'
-- a harfi olmayan personeli listeleyin
SELECT * FROM personel WHERE isim NOT LIKE'%a%'
-- 1. harfi A ve 7. harfi a olan personeli listeleyin
SELECT * FROM personel WHERE isim ~~* 'A_____a%'
--Sondan ikinci karakteri 'r' olan "isim" değerlerini listeleyiniz. 
SELECT isim FROM personel WHERE isim LIKE '%r_'

-- SELECT - SIMILAR TO - REGEX(Regular Expressions) --
/*
SIMILAR TO : Daha karmaşık pattern(kalıp) ile sorgulama işlemi için SIMILAR TO kullanılabilir.
Sadece PostgreSQL de kullanılır. Büyük Küçük harf önemlidir

REGEX : Herhangi bir kod, metin içerisinde istenen yazı veya kod parçasının aranıp bulunmasını sağlayan
kendine ait bir söz dizimi olan bir yapıdır.MySQL de(REGEX_LİKE) olarak kullanılır 
PostgreSQL'de "~" karakteri ile kullanılır.
*/
CREATE TABLE kelimeler
(
id int,
kelime VARCHAR(50),
harf_sayisi int
);
    INSERT INTO kelimeler VALUES (1001, 'hot', 3);
    INSERT INTO kelimeler VALUES (1002, 'hat', 3);
    INSERT INTO kelimeler VALUES (1003, 'hit', 3);
    INSERT INTO kelimeler VALUES (1004, 'hbt', 3);
    INSERT INTO kelimeler VALUES (1005, 'hct', 3);
    INSERT INTO kelimeler VALUES (1006, 'adem', 4);
    INSERT INTO kelimeler VALUES (1007, 'selim', 5);
    INSERT INTO kelimeler VALUES (1008, 'yusuf', 5);
    INSERT INTO kelimeler VALUES (1009, 'hip', 3);
    INSERT INTO kelimeler VALUES (1010, 'HOT', 3);
    INSERT INTO kelimeler VALUES (1011, 'hOt', 3);
    INSERT INTO kelimeler VALUES (1012, 'h9t', 3);
    INSERT INTO kelimeler VALUES (1013, 'hoot', 4);
    INSERT INTO kelimeler VALUES (1014, 'haaat', 5);
    INSERT INTO kelimeler VALUES (1015, 'hooooot', 5);
    INSERT INTO kelimeler VALUES (1016, 'booooot', 5);
    INSERT INTO kelimeler VALUES (1017, 'bolooot', 5);
SELECT * FROM kelimeler
--  İçerisinde 'ot' veya 'at' bulunan kelimeleri listeleyiniz
-- Veya işlemi için | karakteri kullanılır similar to da
--SIMILAR TO ile
SELECT * FROM kelimeler WHERE kelime SIMILAR TO '%(at|ot|Ot|oT|At|aT|OT)%';

--LIKE ile
SELECT * FROM kelimeler WHERE kelime ILIKE '%at%' OR kelime ILIKE '%ot%';
SELECT * FROM kelimeler WHERE kelime ~~* '%at%' OR  kelime ~~* '%ot%'

--REGEX
SELECT * FROM kelimeler WHERE kelime ~* 'ot' OR kelime ~* 'at' 

-- 'ho' veya 'hi' ile başlayan kelimeleri listeleyeniz
--SIMILAR TO ile
SELECT * FROM kelimeler WHERE kelime SIMILAR TO 'ho%|hi%'
--LIKE ile
SELECT * FROM kelimeler WHERE kelime ~~* 'ho%' OR kelime ~~*'hi%'

--REGEX ile
SELECT * FROM kelimeler WHERE kelime ~* 'h[oi](.*)' --Regex'te ".(nokta) bir karakteri temsil eder"
--Regex'de ikinci karakter için köşeli parantez kullanılır. * hepsi anlamında kullanılır

--Sonu 't' veya 'm' ile bitenleri listeleyeniz
--SIMILAR TO ile
SELECT * FROM kelimeler WHERE kelime SIMILAR TO '%t|%m';
--REGEX ile
SELECT * FROM kelimeler WHERE kelime ~* '(.*)[tm]$' -- $ karakteri bitişi gösterir
--h ile başlayıp t ile biten 3 harfli kelimeleri listeleyeniz
--SIMILAR TO ile
SELECT * FROM kelimeler WHERE kelime SIMILAR TO 'h[a-z,A-Z,0-9]t';
-- LIKE ile
SELECT * FROM kelimeler WHERE kelime ~~* 'h_t';
-- REGEX ile
SELECT * FROM kelimeler WHERE kelime ~* 'h[a-z,0-9]t'
--İlk karakteri 'h', son karakteri 't' ve ikinci karakteri 'a'dan 'e'ye herhangi bir karakter olan 
--“kelime" değerlerini çağırın.

--SIMILAR to ile
SELECT kelime FROM kelimeler WHERE kelime SIMILAR TO 'h[a-e]%t' 

-- REGEX ile
SELECT kelime FROM kelimeler WHERE kelime ~* 'h[a-e](.*)t'
--İlk karakteri 's', 'a' veya 'y' olan "kelime" değerlerini çağırın.
SELECT * FROM kelimeler WHERE kelime ~ '^[say](.*)' -- ^ başlangıç'ı temsil eder

--Son karakteri 'm', 'a' veya 'f' olan "kelime" değerlerini çağırın.
SELECT * FROM kelimeler WHERE kelime ~ '(.*)[maf]$'

-- İlk harfi h, son harfi t olup 2.harfi a veya i olan 3 harfli kelimelerin tüm bilgilerini sorgulayalım.
--SIMILAR to ile
SELECT * FROM kelimeler WHERE kelime SIMILAR TO 'h[a|i]t';

-- REGEX ile
SELECT * FROM kelimeler WHERE kelime ~ '^h[a|i]t$'

--İlk harfi 'b' dan ‘s' ye bir karakter olan ve ikinci harfi herhangi bir karakter olup üçüncü harfi ‘l' olan “kelime" değerlerini çağırın. 
SELECT kelime FROM kelimeler WHERE kelime ~ '^[b-s].l(.*)'

--içerisinde en az 2 adet o o barıdıran kelimelerin tüm bilgilerini listeleyiniz.
SELECT * FROM kelimeler WHERE kelime SIMILAR TO '%[o][o]%'

SELECT * FROM kelimeler WHERE kelime SIMILAR TO '%[o]{2}%' 

--içerisinde en az 4 adet oooo barıdıran kelimelerin tüm bilgilerini listeleyiniz.
SELECT * FROM kelimeler WHERE kelime SIMILAR TO '%[o]{4}%'

--'a', 's' yada 'y' ile başlayan VE 'm' yada 'f' ile biten "kelime" değerlerini çağırın.
SELECT kelime FROM kelimeler WHERE kelime ~ '^[a|s|y](.*)[m|f]$';










