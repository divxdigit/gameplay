drop table IF EXISTS Publishers;
drop table IF EXISTS AgeCategories;
drop table IF EXISTS Languages;
drop table IF EXISTS Genres;
drop table IF EXISTS Products;
drop table IF EXISTS Users;
drop table IF EXISTS UserTypes;
drop table IF EXISTS Orders;
drop table IF EXISTS OrderProducts;

create table Publishers(
    PublisherId int not null AUTO_INCREMENT,
    Name varchar(50) not null,
    primary key (PublisherId)
);

insert into Publishers(Name)
values ('Asmodee');
insert into Publishers(Name)
values ('Queen Games');
insert into Publishers(Name)
values ('Days Of Wonder');
insert into Publishers(Name)
values ('Parker');
insert into Publishers(Name)
values ('999 Games');
insert into Publishers(Name)
values ('Goliath');
insert into Publishers(Name)
values ('Hasbro');
insert into Publishers(Name)
values ('Jumbo');

create table AgeCategories(
    AgeCategoryId int not null AUTO_INCREMENT,
    Name varchar(50) not null,
    primary key (AgeCategoryId)
);

insert into AgeCategories(Name)
values ('0-6 maanden');
insert into AgeCategories(Name)
values ('6-12 maanden');
insert into AgeCategories(Name)
values ('1 jaar');
insert into AgeCategories(Name)
values ('2 jaar');
insert into AgeCategories(Name)
values ('3 jaar');
insert into AgeCategories(Name)
values ('4 jaar');
insert into AgeCategories(Name)
values ('5-6 jaar');
insert into AgeCategories(Name)
values ('7-8 jaar');
insert into AgeCategories(Name)
values ('8-99 jaar');
insert into AgeCategories(Name)
values ('9-12 jaar');
insert into AgeCategories(Name)
values ('13 jaar en ouder');
insert into AgeCategories(Name)
values ('Volwassenen');

create table Languages(
    LanguageId int not null AUTO_INCREMENT,
    Name varchar(50) not null,
    primary key (LanguageId)
);

insert into Languages(Name)
values ('Nederlands');
insert into Languages(Name)
values ('Engels');
insert into Languages(Name)
values ('Frans');
insert into Languages(Name)
values ('Duits');
insert into Languages(Name)
values ('Spaans');
insert into Languages(Name)
values ('Italiaans');

create table Genres(
    GenreId int not null AUTO_INCREMENT,
    Name varchar(50) not null,
    primary key (GenreId)
);

insert into Genres(Name)
values ('Strategie');
insert into Genres(Name)
values ('Party');
insert into Genres(Name)
values ('Co-op');
insert into Genres(Name)
values ('Strategy');
insert into Genres(Name)
values ('RPG');
insert into Genres(Name)
values ('Drankspel');
insert into Genres(Name)
values ('Erotisch');

create table Products(
    ProductId int not null AUTO_INCREMENT,
    Name varchar(50) not null,
    Description varchar(500),
    Genre int not null,
    AgeCategory int not null,
    PlayersMinimum int,
    PlayersMaximum int,
    Rating int,
    RentStock int,
    BuyStock int not null,
    Publisher int not null,
    Picture varchar(250),
    RentPrice double not null,
    BuyPrice double not null,
    Language int not null,
    DateLaunch date not null,
    IsActive boolean not null,
    primary key (ProductId),
    foreign key (Genre) references Genres (GenreId),
    foreign key (AgeCategory) references AgeCategories (AgeCategoryId),
    foreign key (Publisher) references Publishers (PublisherId),
    foreign key (Language) references Languages (LanguageId)
);

insert into Products(Name,Description,Genre,AgeCategory,PlayersMinimum,PlayersMaximum,Rating,RentStock,BuyStock,Publisher,Picture,RentPrice,BuyPrice,Language,DateLaunch,IsActive)
values ('Ticket to Ride Europe','Met het Ticket to Ride Europe bordspel reis je per trein over het hele continent. Waag je een reis door de donkere tunnels in Zwitserland of aan boord van een veerboot op de Zwarte Zee? Of bouw je schitterende treinstations in de grote hoofdsteden van oude wereldrijken?
In Ticket to Ride Europe moeten de spelers de routes op hun bestemmingskaarten volbrengen. Dit doe je door verbindingen tussen steden te claimen, die je mag bouwen als je de juiste kaartencombinaties in handen hebt. Heb jij aan het eind van het spel de meeste punten verzameld met je treinnetwerk? Dan ben jij de winnaar.
Dit populaire bordspel is een makkelijk aan te leren spel met diverse onvoorziene plotwendingen, zodat de uiteindelijke winnaar tot op het laatst onbekend blijft. Spanning en plezier voor het hele gezin.',1,9,2,5,3,2,15,3,'LINK AFBEELDING HIER',2.45,34.95,1,01/02/2001,1);