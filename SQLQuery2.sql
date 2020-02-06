use Northwind;  --kullanmak istediğimiz data base kısmını seçmek için.

--Select <Sütun adları, *> from <tablo adı>

select * from Employees

select EmployeeID, LastName, FirstName, Title, TitleOfCourtesy, BirthDate, HireDate, Address, City, Region, PostalCode, Country, 
HomePhone, Extension, Photo, Notes, ReportsTo, PhotoPath from Employees

select FirstName,LastName from Employees;

select FirstName, LastName, Title, BirthDate from Employees

select FirstName Ad, LastName Soyad, Title Görev, BirthDate Doğum from Employees  --Türkçeleştirmek için yanına bir boşluk türkçesi

select FirstName as Adi, LastName as Soyadi, Title as Görev, BirthDate as 'Doğum Tarihi' from Employees -- 2. yol boşluklu istersem '' arasına yaz

select Adi = FirstName, Soyadi = LastName,Görev = Title, 'Doğum Tarihi' = BirthDate,[İşe Giriş Tarihi] = HireDate from Employees  -- köşeli parantez de yer ayırmak için

select distinct City from Employees  -- DISTINCT tekil kayıtların listelenmesi için gerekli uniqleştirmek amacımız aynı isimli 2 kişi ve aynı şehirden olan kişileri tek alır.
select distinct FirstName, City from Employees

select TitleOfCourtesy + ' ' + LastName +' '+ FirstName as Personel from Employees -- kolon ismini en son koyarız + işlemi metinsel toplama yaptığı için tek bir kolona yazar

select Concat (TitleOfCourtesy, ' ' , FirstName, ' ' , LastName) As Personel from Employees

select * from Categories

insert into Categories (CategoryName, Description) 
Values ('Kategori adı', 'Test Açıklama Alanı')

insert into  Categories (Description) values ('Tepsi Baklava')

select * from Shippers
insert into Shippers (CompanyName, Phone) values ('MNG Express','(503) 512-5582')

insert into Shippers values ('Aras Kargo','(507) 512 8457')

select * from Customers

insert into Customers (CompanyName, CustomerID) values ('BilgeAdam' , 'BLGDM')

select * into Calisanlar from Employees

select * from Calisanlar
update Calisanlar set LastName = 'Akaroğlu'

update Calisanlar set FirstName = 'Ahmet'
where EmployeeID = 1

Drop table Calisanlar

select ProductID, ProductName, UnitPrice as OldPrice, UnitPrice as NewPrice into Urunler from Products
select * from Urunler
update Urunler set NewPrice = NewPrice + (NewPrice * 0.05)

select * into calisanlar from Employees

select * from calisanlar
delete from calisanlar where EmployeeID = 1
delete from calisanlar where TitleOfCourtesy = 'MS.' or TitleOfCourtesy = 'MRS.' 
-- delete from calisanlar where TitleOfCourtesy in ('MRS.' , 'MS.')     2. yol

select TitleOfCourtesy, FirstName, LastName from Employees where TitleOfCourtesy = 'Mr.'

select EmployeeID, FirstName, LastName from Employees where EmployeeID > 5 

select FirstName, LastName, BirthDate from Employees
where YEAR (BirthDate) = 1960


select TitleOfCourtesy, FirstName, LastName, YEAR(GETDATE())  - YEAR (BirthDate) as age from Employees
Order By TitleOfCourtesy , age desc; -- desc ters sıralar asc ise doğru şekilde 

select FirstName, LastName, YEAR(BirthDate) BirthMonth from Employees
where year(BirthDate) >= 1952 and YEAR(BirthDate) <= 1960
order by 3         --birinci yol

select FirstName, LastName, YEAR(BirthDate) as birthmonth  from Employees

where year(BirthDate) between 1952 and 1960
order by 3 -- ikinci yol

select FirstName, LastName from Employees
where FirstName between 'Janet' and 'Robert' 
order by 1

select TitleOfCourtesy, FirstName, LastName, HireDate from Employees where TitleOfCourtesy = 'Mr.' or TitleOfCourtesy = 'Dr.'  --birinci yol ünvanı dr veya mr olanların listelenmesi.

select TitleOfCourtesy, FirstName, LastName, HireDate from Employees where TitleOfCourtesy in ('Mr.' , 'Dr.')
order by TitleOfCourtesy -- ikinci yol

select TitleOfCourtesy, FirstName, LastName, year(BirthDate) as BrithYear from Employees
where year(BirthDate) in (1950, 1955, 1960)  --1950 1955 1965 yılında doğanları listeleme
 

 --TOP kullanımı

 select top 3 FirstName as 'Adı', LastName as 'Soy Adı' , TitleOfCourtesy as 'Ünvanı' from Employees -- ilk üç kayıt

 select top 5 EmployeeID, FirstName, LastName, BirthDate from Employees
 order by FirstName

 select top 25 percent FirstName, LastName, YEAR(GETDATE()) - year(BirthDate) as age from Employees
 order by age

-- LIKE kullanımı - adı micheal olan personellerin listelenmesi

select FirstName, LastName from Employees where FirstName = 'Michael'  --birinci yol

select FirstName , LastName from Employees  -- ikinci yol
where FirstName LIKE 'Michael'
 --Adının ilk harfi A ile başlayanlar 
 select FirstName , LastName from Employees 
where FirstName LIKE 'A%' -- yüzde işareti geri kalan bütün karakterleri tamamlar.

select FirstName , LastName from Employees  
where LastName LIKE '%N'

select FirstName , LastName from Employees 
where FirstName LIKE 'A%' or FirstName LIKE 'L%' -- birinci yol

select FirstName , LastName from Employees 
where FirstName LIKE '[AL]%' -- Soyadı A veya L 2. yol
order by LastName -- soyadına göre sırala

select FirstName , LastName from Employees 
where FirstName LIKE '%[RT]%'
order by LastName

select FirstName, LastName from Employees
where FirstName LIKE '[J-R]%'
order by LastName

select FirstName, LastName from Employees
where FirstName LIKE '%A_E%'
order by LastName -- Adının içinde yAsEmin jAnEt gibi A ve E arasında bir harf gelmesini istedim.

select FirstName, LastName from Employees  --Adının ilk iki harfi LA AA AN LN olanlar
where FirstName LIKE '[LA][AN]%'
order by LastName

select 5 + 6 as sayılar

select 'Bilge Adam Beşiktaş' as ŞUBE
print 'Bilge Adam Beşiktaş'

--String Fonksiyonlar

select ASCII('A') as 'Ascii değeri (sayilar)' -- sayısal değeri verir
select char (65) as 'Metinsel Değeri' --metinsel değerini verir
select CHARINDEX('@','anil.akaroglu@bilgeadam.com') as IndexNo --birinci parametre aradığımız bölüm ikinci parametre neyi neyin içinde arayacağımızı söyler. Arama işlemini soldan sağa doğru yapar
select LEFT ('Bilge Adam', 5) as 'Soldan sağa karakter al'
select right ('Bilge Adam', 4) as 'Sağdan sola karakter al'

select len ('bilge adam') as 'Toplam Uzunluk Teslim Eder'
select LOWER ('BilGe AdAm') 'Lower' , UPPER('bilge adam') 'Upper' --küçük harfe büyük harfe çevir

select Len ('                 bilge adam')
select LTRIM ('                 bilge adam') as 'Bilge Adam' -- metnin solundaki boşlukları siler
select len(LTRIM ('                 bilge adam')) as 'Bilge Adam'
select RTRIM ('bilge adam               ') as 'Bilge adam' -- metnin sağındaki boşlukları siler

select Replace ('bilge adam' , 'adam' , 'hatun')

select LOWER (replace('aNıL.akaroğlu@bilgeadam.com','ı,ğ', 'i,g'))

select Replace (Replace(REPLACE(Lower (ProductName), 'ö', 'o'), '''','-') , 'ş','s') as 'bilge adam olaylar'  from Products
order by 1
print 'bilge adam''da'


select REVERSE ('bilge adam')
Select Replicate ('seni pek seviyorum', 1000)

select 'bilge' + Space (50) + 'adam';