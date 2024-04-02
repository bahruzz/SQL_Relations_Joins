select * from Students
truncate table Students

insert into Students([FullName],[Age],[Adress])
values('Behruz Aliyev',34,'Kurdexani')


ALTER table Students
ADD Softdeleted bit default 0;

select * from students where [Softdeleted]='false'

select * from students where [Softdeleted]='true'

update Students
set [Softdeleted]=1
where [Id]=2


create table Countries(
[Id] int primary key identity(1,1),
[Name] nvarchar(50) 
)

create table Cities(
[Id] int primary key identity(1,1),
[Name] nvarchar(50) ,
[CountryId] int,
foreign key ([CountryId]) references Countries (Id)
)

insert into Countries([Name])
values  ('Azerbaycan'),
        ('Turkiye'),
        ('Ingiltere')

select * from Countries

insert into Cities([Name],[CountryId])
values  ('Baki',1),
        ('Sumqayit',1),
        ('Zaqatala',1),
		('Istanbul',2),
        ('Bursa',2),
        ('London',3)
select * from Countries

select * from Cities

select * from Cities where [CountryId]=1

create table Books(
[Id] int primary key identity(1,1),
[Name] nvarchar(50) 
)

create table Authors(
[Id] int primary key identity(1,1),
[Name] nvarchar(50),
[Email] nvarchar(100)
)

create table BookAuthors(
[Id] int primary key identity(1,1),
[BookId] int ,
[AuthorId] int ,
foreign key ([BookId]) references Books (Id),
foreign key ([AuthorId]) references Authors (Id)
)

select * from Books

select * from Authors

select * from BookAuthors


insert into Books([Name])
values  ('Ali ve Nino'),
        ('Leyli Mecnun'),
        ('Isgendarname')

insert into Authors([Name],[Email])
values  ('Author1','author1@gmail.com'),
        ('Author2','author2@gmail.com'),
        ('Author3','author3@gmail.com')

insert into BookAuthors([BookId],[AuthorId])
values (1,1),
       (2,1),
       (3,2),
       (1,2)

select * from Authors
select * from Books
select * from BookAuthors

select * from Countries

select * from Cities

select ct.name as'City',ctr.name as 'Country' from Cities ct
join Countries ctr
on ct.CountryId = ctr.Id

select ct.name as'City',ctr.name as 'Country' from Cities ct
left join Countries ctr
on ct.CountryId = ctr.Id

select ct.name as'City',ctr.name as 'Country' from Cities ct
right join Countries ctr
on ct.CountryId = ctr.Id

select ct.name as'City',ctr.name as 'Country' from Cities ct
full outer join Countries ctr
on ct.CountryId = ctr.Id

select a.Name as 'Author name',a.Email as 'Author email',b.Name as 'Book name' from Authors a
join BookAuthors ba
on a.Id=ba.AuthorId
join Books b
on b.Id = ba.BookId