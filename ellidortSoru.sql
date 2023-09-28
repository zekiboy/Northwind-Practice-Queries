/*1. "Categories" tablosundan CategoryName alan�na g�re artan s�rada olacak �ekilde
CatogoryName ve Description bilgilerini veren sorguyu olu�turunuz.*/
select CategoryName ,Description from Categories order by CategoryName


/*2. "Customers" tablosundan CompanyName,ContactName,"Ki�iAd�, �irketAd�,ContactTitle ve Phone bilgilerini
Phone bilgisine g�re artan s�rada olacak �ekilde g�steren sorguyu olu�turunuz.*/
select CompanyName, ContactName, ContactTitle, Phone from Customers order by Phone

/* 3. "Employees" tablosundan i�e ba�lama tarihi ("HireDate") alan�na g�re azalan s�rada olacak �ekilde
FirstName ve b�y�k harfli olacak LastName alanlar�n� aras�nda bir bo�luk karakteri olmak �zere olu�turan sorguyu olu�turunuz.*/
select FirstName+' '+upper(LastName) as[�ALI�AN B�LG�S�] from Employees order by HireDate

/*4. "Orders" tablosundan OrderID, OrderDate, ShippedDate, CustomerID, Freight bilgilerini
Freight alan�na g�re azalan s�rada olacak �ekilde ilk 10 kay�d� g�steren sorguyu olu�turunuz.*/
select OrderID,OrderDate,ShippedDate,CustomerID,Freight from Orders order by Freight desc

/* 5. "Customers" tablosundan t�m "CustomerID" bilgilerini k���k harfle g�steren ve
bunu "Kimlik Tnm" olarak yeniden adland�ran bir sorgu olu�turunuz.*/
select LOWER(CustomerID) as [Kimlik Tnm] from Customers

use calisma 
/*6. "Suppliers" tablosundan Country bilgisi azalan s�rada, CompanyName artan s�rada olacak �ekilde
CompanyName, Fax, Phone, Country bilgilerini d�ken bir sorgu olu�turunuz.*/
select CompanyName, Fax, Phone,Country from Suppliers order by CompanyName 
select  CompanyName, Fax, Phone,Country from Suppliers order by Country desc
--akif 
select CompanyName, Fax, Phone, Country from Suppliers order by Country desc, CompanyName asc

/*7. "Customers" tablosundan yaln�zca 'Buenos Aires'ten gelen t�m m��terilerin
CompanyName, ContactName'lerini g�steren bir sorgu olu�turunuz.*/
select CompanyName, ContactName from Customers where City ='Buenos Aires'

/*8. "Products" tablosundan stokta olmayan �r�nlerin ProductName, UnitPrice, QuantityPerUnit bilgilerini g�steren bir sorgu olu�turunuz.*/
select ProductName, UnitPrice, QuantityPerUnit from Products where UnitsInStock=0

/*9. Almanya, Meksika, �spanya'dan olmayan t�m m��terilerin(Customers) CompanyName,Address,City,Country bilgilerini g�steren bir sorgu olu�turunuz.*/
select CompanyName,Address,City,Country from Customers where not (Country='Germany'or Country='Mexico' or Country='Spain');

/*10. 21 May�s 1996'da verilen t�m sipari�lerin OrderDate,ShippedDate, CustomerID ve Freight bilgilerini g�steren bir sorgu olu�turunuz.*/
select OrderDate,ShippedDate,CustomerID,Freight from Orders where OrderDate='1996-05-21 00:00:00.000'; 
select OrderDate,ShippedDate,CustomerID,Freight from Orders where OrderDate='1996-07-04 00:00:00.000'; 
select OrderDate,ShippedDate,CustomerID,Freight from Orders where OrderDate='1996-07-04'; 

/*11. Amerika Birle�ik Devletleri'nden olmayan �al��anlar�n FirstName,LastName,Country bilgilerini g�steren bir sorgu olu�turunuz.*/
select FirstName,LastName,Country from Employees where not Country='USA';

/*13. Ba� harfi A veya B ile ba�layan �ehirlerdeki m��terilerin City, CompanyName, ContactName bilgilerini g�steren bir sorgu olu�turunuz.*/
select City, CompanyName, ContactName from Customers where City like 'A%' or  City like 'B%'

/*14. Navlun(Freight) maliyetinin 500 dolardan fazla oldu�u t�m sipari�leri(Orders) g�steren bir sorgu olu�turunuz.*/
select Freight from Orders where Freight>500

/*15. Faks numaras� olmayan t�m m��terilerin CompanyName, ContactName bilgilerini g�steren bir sorgu olu�turunuz.*/
select CompanyName, ContactName from Customers where Fax is null

/*16. Kimseye rapor vermeyen(ReportsTo alan�) �al��anlar�n FirstName, LastName bilgilerini g�steren bir sorgu olu�turunuz.*/
select FirstName, LastName from Employees where ReportsTo is null

/*17. Ad�nda L harfi olan �ehirlerdeki m��terilerin
City,CompanyName,ContactName bilgilerini ContactName bilgisi azalacak �ekilde g�steren bir sorgu olu�turunuz.*/
select City,CompanyName,ContactName from Customers where City like '%L%'

/*18. 1950'lerde do�an �al��anlar�n(Employee tablosu) FirstName, LastName, BirthDate bilgilerini g�steren bir sorgu olu�turunuz.*/
--a�a��daki gibi yaz�nca 1950 dahil 1960 dahil de�il gibi oldu
select FirstName, LastName, BirthDate from Employees where BirthDate between '1950' and '1960' 

/*19. Exotic Liquids, Specialty Biscuits Ltd., Escargots Nouveaux tedarik�ileri taraf�ndan sa�lanan t�m �r�nlerin
tedarik�i kimli�ine g�re s�ralanm�� olarak SupplierID, ProductName ve CompanyName bilgilerini g�steren sorgu olu�turunuz.*/
select Suppliers.SupplierID, Suppliers.CompanyName, Products.ProductName from Suppliers left join Products on Suppliers.SupplierID=Products.SupplierID where (Suppliers.CompanyName='Exotic Liquids' or Suppliers.CompanyName='Specialty Biscuits, Ltd.' or Suppliers.CompanyName='Escargots Nouveaux') order by Suppliers.SupplierID

/*20. "Seattle" �ehrindeki �al��anlar�n LastName,FirstName bilgilerini g�steren bir sorgu olu�turunuz*/
select LastName,FirstName from Employees where City='Seattle'

/*22.�kinci karakterinde A harfi olmayan t�m m��terilerin ContactName bilgisini azalan s�rada g�steren bir sorgu olu�turunuz.*/
select ContactName from Customers where CompanyName not like '%_a' 

/*23. Orders tablosundan Freight toplam� 200$'dan b�y�k olan bilgilerin CustomerID ve Freight toplam�n� g�steren bir sorgu olu�turunuz.(�PUCU: GroupBy ve Having deyimi kullanman�z gerekecek.)*/
select CustomerID,SUM(Freight)
from Orders
group by CustomerID having SUM(Freight)>200.00

/*24. �al��anlar tablosundan �al��an Kimli�i, �al��an�n Soyad� ve Ad� ve y�netici olarak rapor verdikleri ki�inin Soyad� ve Ad�'n� g�steren bir sorgu olu�turunuz. (�P�NUCU : Self Join)*/
select EmployeeID,FirstName,LastName,Title,ReportsTo from Employees 

select p1.FirstName+' '+p1.LastName as [calisan],p2.FirstName+' '+p2.LastName as yonetici
from Employees p1 inner join Employees p2
on p1.ReportsTo=p2.EmployeeID;

/*25. T�m �r�nlerin(Products) BirimFiyat�n�(UnitPrice) ortalama(AVG), minimum(MIN) ve maksimum(MAX) de�erlerini OrtalamaFiyat, MinimumFiyat,MaksimumFiyat olarak g�steren bir sorgu olu�turunuz.*/
select [Order Details].ProductID, AVG([Order Details].UnitPrice)as [ortalama fiyat], MIN([Order Details].UnitPrice) as [minimum fiyat],max([Order Details].UnitPrice)as [maksimum fiyat]
from [Order Details] group by [Order Details].ProductID;
 
/*26. "Categories" tablosundan CategoryName bilgisinin ilk 5 karakterini getiren(LEFT fonksiyonu) ve K�saBilgi olarak yeniden adland�r�lan bir sorgu olu�turunuz.*/
select left (CategoryName,5) as K�saBilgi from Categories 

/*27. Deniz �r�nleri kategorisindeki t�m �r�nlerden �irketAd� ve �r�nAd�n� listeleyen bir sorgu olu�turunuz.*/
select Suppliers.SupplierID,Suppliers.CompanyName,Products.ProductName 
from Products 
inner join Suppliers on Suppliers.SupplierID=Products.SupplierID
where Products.CategoryID=8

/*28. CategoryID'si 5 olan t�m �r�nlerden CategoryID, CompanyName ve ProductName bilgilerini listeleyen bir sorgu olu�turunuz.*/
select Products.CategoryID,Suppliers.CompanyName,Products.ProductName 
from Products 
inner join Suppliers on Suppliers.SupplierID=Products.SupplierID
where Products.CategoryID=5

/*29. ContactTitle alan�nda 'Owner' ge�en m��terilerimin �irket adlar�n� listeleyiniz.*/
select Customers.CompanyName from Customers where ContactTitle='Owner'

/*30. 50$ ile 100$ aras�nda bulunan t�m �r�nlerin adlar� ve fiyatlar�n� listeleyiniz.*/
select Products.ProductName,Products.UnitPrice from Products where UnitPrice between 50.00 and 100.00

/*31. 1 temmuz 1996 ile 31 Aral�k 1996 tarihleri aras�ndaki sipari�lerin (Orders), Sipari�ID (OrderID) ve Sipari�Tarihi (OrderDate) bilgilerini listeleyiniz.*/
select Orders.OrderID,Orders.OrderDate from Orders where OrderDate between '1996-07-01' and '1996-12-31'

/*32. 1997 y�l�na ait sat��lar�(Orders) listeleyiniz.*/
select*from Orders where OrderDate between '1996-12-31' and '1997-12-31'

Select * from Orders
  where  Year(OrderDate) = '1997';

/*33. 1997 Ocak ay�na ait Londra ve Fransaya yap�lan sat��lar� listeleyiniz.*/
Select * from Orders
where Month(OrderDate) = '01' and
      Year(OrderDate) = '1997';

/*34. 1955-1963 y�llar� aras�nda do�mu� olan 3 Amerikal� olmayan �al��an� listeleyiniz.(Employee tablosu)*/
select top 3 * from Employees 
where( (BirthDate between '1955-01-01' and '1963-12-31') and Country='USA')
	
/*35. 1997 y�l�n�n ilk 6 ay�nda Londra ya yap�lan sat��lar� listeleyiniz.*/
SELECT * FROM Orders
WHERE ((OrderDate between '1997-01-01' and '1997-06-24') and shipcity='London')

Select * from Orders
where  Month(OrderDate) between '01' and '06' and
      Year(OrderDate) = '1997'and shipcity='London'

