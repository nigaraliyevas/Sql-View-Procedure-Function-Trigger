Create Database MovieDB
Use MovieDB

Create Table Movies
(
 Id int Primary Key Identity,
 MovieName nvarchar(50),
 Rating Decimal(2,1),
 [Year] int,
 DurationHour int,
 DurationMin int,
 DirectorId int Foreign Key References Directors(Id),
)

Create Table Directors
(
 Id int Primary Key Identity,
 DirectorName nvarchar(50),
)

Create Table Actors
(
 Id int Primary Key Identity,
 ActorName nvarchar(50),
)

Create Table MovieActors
(
Id int Primary Key Identity,
 MovieId int Foreign Key References Movies(Id),
  ActorId int Foreign Key References Actors(Id)
)

Create Table Genres
(
 Id int Primary Key Identity,
 GenreName nvarchar(50)
)

Create Table MovieGenres
(
Id int Primary Key Identity,
 MovieId int Foreign Key References Movies(Id),
  GenreId int Foreign Key References Genres(Id)
)

Create Table Writers
(
 Id int Primary Key Identity,
 WriterName nvarchar(50)
)

Create Table MovieWriters
(
Id int Primary Key Identity,
 MovieId int Foreign Key References Movies(Id),
  WriterId int Foreign Key References Writers(Id)
)


Insert Into Movies Values
('The Dark Knight',9.0,2008,2,32,1),
('The Godfather',9.2,1972,2,55,2),
('The Apartment',8.3,1960,2,5,3),
('Interstellar',8.7,2014,2,49,1)

Insert Into Actors Values
('Christian Bale'),
('Heath Ledger'),
('Aaron Eckhart'),
('Marlon Brando'),
('Al Pacino'),
('James Caan'),
('Jack Lemmon'),
('Shirley MacLaine'),
('Fred MacMurray'),
('Matthew McConaughey'),
('Anne Hathaway'),
('Jessica Chastain')

Insert Into Directors Values
('Christopher Nolan'),
('Francis Ford Coppola'),
('Billy Wilder')

Insert Into Genres Values
('Drama'),
('Crime'),
('Comedy'),
('Romance'),
('Action'),
('Adventure'),
('Sci-Fi')

Insert Into Writers Values
('Jonathan Nolan'),
('Christopher Nolan'),
('David S. Goyer'),
('Mario Puzo'),
('Francis Ford Coppola'),
('Billy Wilder'),
('I.A.L. Diamond')

Insert Into MovieGenres Values
(2,1),
(2,5),
(3,1),
(3,2),
(4,1),
(4,3),
(4,4),
(5,1),
(5,6),
(5,7)


Insert Into MovieActors Values
(2,1),
(2,2),
(2,3),
(3,4),
(3,5),
(3,6),
(4,7),
(4,8),
(4,9),
(5,10),
(5,11),
(5,12)

Insert Into MovieWriters Values
(2,1),
(2,2),
(2,3),
(3,4),
(3,5),
(4,5),
(4,7),
(5,1),
(5,2)

Select * From Actors
Select * From Directors
Select * From Genres
Select * From Movies
Select * From Writers
Select * From MovieGenres
Select * From MovieActors
Select * From MovieWriters

--1
Select m.MovieName,m.Rating,g.GenreName,d.DirectorName,a.ActorName From Movies m
Join MovieGenres mg On mg.MovieId=m.Id
Join Genres g On mg.GenreId=g.Id
Join Directors d On m.DirectorId=d.Id
Join MovieActors ma On ma.MovieId=m.Id
Join Actors a On ma.ActorId=a.Id

--2
Select m.MovieName,m.Rating,g.GenreName From Movies m
Join MovieGenres mg On mg.MovieId=m.Id
Join Genres g On mg.GenreId=g.Id
Where m.MovieName Like '%a%' Or  m.MovieName Like 'A%'

--3
Select m.MovieName,m.Rating,m.DurationHour,m.DurationMin,g.GenreName From Movies m
Join MovieGenres mg On mg.MovieId=m.Id
Join Genres g On mg.GenreId=g.Id
Where Len(m.MovieName)>10 And m.MovieName Like '%a'

--4
Select m.MovieName,m.Rating,g.GenreName,d.DirectorName,a.ActorName From Movies m
Join MovieGenres mg On mg.MovieId=m.Id
Join Genres g On mg.GenreId=g.Id
Join Directors d On m.DirectorId=d.Id
Join MovieActors ma On ma.MovieId=m.Id
Join Actors a On ma.ActorId=a.Id
Where m.Rating > (SELECT AVG(Rating) FROM Movies)
Order By m.Rating Desc


