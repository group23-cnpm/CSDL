create database QuanLyQuanCafe
go

use QuanLyQuanCafe1
go

--Food
--Table
--FoodCategory
--Account
--BillInfo

create table TableFood
(
  id int identity primary key,
  name nvarchar(100) not null default N'Bàn chưa có tên',
  status nvarchar(100) not null default N'Trống'  -- Trống || Có người
)
go

create table Account 
(
  Displayname nvarchar(100) not null default N'Kter',
  Username nvarchar(100) primary key,
  Password nvarchar(1000) not null default 0,
  Type int not null default 0 -- 1:admin && 0:staff
)
go

create table FoodCategory
 (
  id int identity primary key,
  name nvarchar(100) not null default N'Chưa đặt tên',
 )
 go 

 create table Food
  (
  id int identity primary key,
  name nvarchar(100) not null default N'Chưa đặt tên',
  idCategory int not null,
  price float not null default 0 
  foreign key (idCategory) references dbo.FoodCategory (id)
  )
  go

  create table Bill
  (
  id int identity primary key,
  DateCheckIn date not null default getdate() ,
  DateCheckOut date,
  idTable int not null,
  status int not null -- 1:Đã thanh toán && 0:Chưa thanh toán
  foreign key (idTable) references dbo.TableFood (id),
  )
  go

  create table BillInfo
  (
  id int identity primary key,
  idBill int not null,
  idFood int not null,
  count int not null default 0
  foreign key (idBill) references dbo.Bill(id),
  foreign key (idFood) references dbo.Food(id)

  )
  go
