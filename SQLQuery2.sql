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





