//zeveraar
DROP TABLE Products;

CREATE TABLE IF NOT EXISTS Publishers(
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

CREATE TABLE IF NOT EXISTS AgeCategories(
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

CREATE TABLE IF NOT EXISTS Languages(
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

CREATE TABLE IF NOT EXISTS Genres(
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
values ('Andere');
insert into Genres(Name)
values ('RPG');
insert into Genres(Name)
values ('Drankspel');
insert into Genres(Name)
values ('Erotisch');

CREATE TABLE IF NOT EXISTS Products(
    ProductId int not null AUTO_INCREMENT,
    Name varchar(50) not null,
    Description varchar(max),
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
    DateLaunch date,
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
Dit populaire bordspel is een makkelijk aan te leren spel met diverse onvoorziene plotwendingen, zodat de uiteindelijke winnaar tot op het laatst onbekend blijft. Spanning en plezier voor het hele gezin.',1,9,2,5,3,2,15,3,'LINK AFBEELDING HIER',2.45,34.95,1,'2008-02-20',1);
insert into Products(Name,Description,Genre,AgeCategory,PlayersMinimum,PlayersMaximum,Rating,RentStock,BuyStock,Publisher,Picture,RentPrice,BuyPrice,Language,DateLaunch,IsActive)
values ('De Kwakzalvers van Kakelenburg','De Kwakzalvers van Kakelenburg Eenmaal per jaar komen in Kakelenburg de beste wonderdoktoren en beunhazen samen om drankjes tegen zweetvoeten, heimwee, de hik en liefdesverdriet te brouwen. Iedere kwakzalver kookt hier echter zijn eigen soep. Iedere speler trekt zolang ingrediënten uit zijn eigen, in de loop van het spel zelf samengestelde, voorraadbuidel totdat hij denkt dat zijn drank perfect is. Maar pas op: een paar knalerwten en de hele drank ontploft. Het is dus beter om op tijd te stoppen en een kleinere portie te koken om zo met de opbrengst ervan kostbare ingrediënten aan te schaffen. Zo vult de voorraadbuidel zich met steeds meer nuttige ingrediënten, waardoor de volgende drank wellicht nog beter wordt en meer punten oplevert. In dit spel met meer dan 2000 combinatiemogelijkheden wordt het beproefde deckbuildingssysteem gecombineerd met het populaire “push your luck”-mechanisme.',1,9,2,4,4,1,9,5,'LINK AFBEELDING HIER',1.89,39.95,2,'2001-01-31',1);
insert into Products(Name,Description,Genre,AgeCategory,PlayersMinimum,PlayersMaximum,Rating,RentStock,BuyStock,Publisher,Picture,RentPrice,BuyPrice,Language,DateLaunch,IsActive)
values ('Wingspan','Een vogelspel vol tactiek en spanning Als vogelliefhebber probeer je de beste leefomstandigheden voor de vogels in je opvangcentrum te creëren. Elke vogel breidt in één van zijn leefgebieden een ketting van krachtige combinaties uit. Deze leefgebieden richten zich op verschillende groeifactoren: voedsel pakken, eieren leggen en nieuwe vogelkaarten trekken. Wie bouwt het beste actiemotortje en scoort aan het einde van het spel de meeste punten met zijn vogels? Elke beurt speel je een vogel, waarna je alle acties die zich in het betreffende leefgebied bevinden, mag uitvoeren. Zo kun je voedsel uit een “echt” vogelhuisje pakken, ei-miniaturen in nesten leggen of nieuwe vogels verzamelen. Alle opties leveren op verschillende manieren punten op. Het spel bevat 170 unieke vogelkaarten, die in combinatie met de verschillende bonuskaarten en de interactie met de andere spelers voor oneindige variatie zorgen. Het spel is ook solitair te spelen!',4,9,1,5,1,1,0,5,'LINK AFBEELDING HIER',3.50,56.14,1,'2000-06-20',1);

CREATE TABLE IF NOT EXISTS OrderProducts(
    OrderProductId int not null AUTO_INCREMENT,
    Product int not null,
    "Order" int not null,
    RendDurationWeeks int,
    OrderType int,
    Price double,
    DiscountPrice double,
    foreign key (Product) references Products (ProductId),
    foreign key ("Order") references Orders (OrderId),
    primary key (OrderProductId),
);

insert into OrderProducts(Product,"Order", RendDurationWeeks, OrderType, Price, DiscountPrice)
VALUES (1,1,'',1,34.95,5);
insert into OrderProducts(Product,"Order", RendDurationWeeks, OrderType, Price, DiscountPrice)
VALUES (2,1,'',1,20.10,0);
insert into OrderProducts(Product,"Order", RendDurationWeeks, OrderType, Price, DiscountPrice)
VALUES (2,2,2,2,4,0);

CREATE TABLE IF NOT EXISTS Orders(
    OrderId int not null AUTO_INCREMENT,
    User int not null,
    DateCreated date,
    DateCollect date,
    Status int,
    foreign key (User) references Users (UserId),
    primary key (OrderId),
);

insert into Orders(User, DateCreated, DateCollect, Status)
VALUES (1,'2020-10-10','2020-10-11',1);
insert into Orders(User, DateCreated, DateCollect, Status)
VALUES (3,'2020-08-10','2020-08-11',1);
insert into Orders(User, DateCreated, DateCollect, Status)
VALUES (1,'2020-09-10','2020-12-11',0);

CREATE TABLE IF NOT EXISTS Users(
    UserId int not null AUTO_INCREMENT,
    Type int not null,
    Name text,
    BirthDate date,
    Password text,
    Email text,
    Street text,
    Number text,
    PostalCode int,
    City text,
    IsActive boolean,
    IsDeleted boolean,
    WrongPasswordCounter int,
    foreign key (Type) references UserTypes (UserTypeId),
    primary key (UserId),
);

insert into Users(Type, Name, BirthDate, Password, Email, Street, Number, PostalCode, City, IsActive, IsDeleted, WrongPasswordCounter)
values (1,'KlantA','1989-02-8','DEMO','maartencelen@gmail.com','Vuchterhoeve','6',2440,'Geel',1,0,0);
insert into Users(Type, Name, BirthDate, Password, Email, Street, Number, PostalCode, City, IsActive, IsDeleted, WrongPasswordCounter)
values (2,'AdminA','1990-03-8','DEMO','test@test.com','Teststraat','69',2300,'Turnhout',1,0,0);
insert into Users(Type, Name, BirthDate, Password, Email, Street, Number, PostalCode, City, IsActive, IsDeleted, WrongPasswordCounter)
values (2,'KlantB','2005-02-8','Minderjarige Benny','test2@test.com','Demostraat','15',2300,'Turnhout',1,0,0);

CREATE TABLE IF NOT EXISTS UserTypes(
    UserTypeId int not null AUTO_INCREMENT,
    Name text,
    Description text,
    primary key (UserTypeId),
);

insert into UserTypes(Name,Description)
values ('Standaard','Klassieke klant');
insert into UserTypes(Name,Description)
values ('Admin','Systeembeheerder van de webshop');