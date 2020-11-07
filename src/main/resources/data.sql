//SET FOREIGN_KEY_CHECKS = 0;
DROP TABLE if exists Orders;
DROP TABLE if exists Products;
DROP TABLE if exists OrderProducts;
DROP TABLE if exists Users;
DROP TABLE if exists UserTypes;
DROP TABLE if exists Publishers;
DROP TABLE if exists Genres;
DROP TABLE if exists AgeCategories;
DROP TABLE if exists Languages;
//SET FOREIGN_KEY_CHECKS = 1;

CREATE TABLE IF NOT EXISTS Publishers(
    id int not null AUTO_INCREMENT,
    name varchar(50) not null,
    primary key (id)
);

insert into Publishers(name)
values ('Asmodee');
insert into Publishers(name)
values ('Queen Games');
insert into Publishers(name)
values ('Days Of Wonder');
insert into Publishers(name)
values ('Parker');
insert into Publishers(name)
values ('999 Games');
insert into Publishers(name)
values ('Goliath');
insert into Publishers(name)
values ('Hasbro');
insert into Publishers(name)
values ('Jumbo');

CREATE TABLE IF NOT EXISTS Agecategories(
    id int not null AUTO_INCREMENT,
    name varchar(50) not null,
    primary key (id)
);

insert into Agecategories(name)
values ('0-6 maanden');
insert into Agecategories(name)
values ('6-12 maanden');
insert into Agecategories(name)
values ('1 jaar');
insert into Agecategories(name)
values ('2 jaar');
insert into Agecategories(name)
values ('3 jaar');
insert into Agecategories(name)
values ('4 jaar');
insert into Agecategories(name)
values ('5-6 jaar');
insert into Agecategories(name)
values ('7-8 jaar');
insert into Agecategories(name)
values ('8-99 jaar');
insert into Agecategories(name)
values ('9-12 jaar');
insert into Agecategories(name)
values ('13 jaar en ouder');
insert into Agecategories(name)
values ('Volwassenen');

CREATE TABLE IF NOT EXISTS Languages(
    id int not null AUTO_INCREMENT,
    name varchar(50) not null,
    primary key (id)
);

insert into Languages(name)
values ('Nederlands');
insert into Languages(name)
values ('Engels');
insert into Languages(name)
values ('Frans');
insert into Languages(name)
values ('Duits');
insert into Languages(name)
values ('Spaans');
insert into Languages(name)
values ('Italiaans');

CREATE TABLE IF NOT EXISTS Genres(
    id int not null AUTO_INCREMENT,
    name varchar(50) not null,
    primary key (id)
);

insert into Genres(name)
values ('Strategie');
insert into Genres(name)
values ('Party');
insert into Genres(name)
values ('Co-op');
insert into Genres(name)
values ('Andere');
insert into Genres(name)
values ('RPG');
insert into Genres(name)
values ('Drankspel');
insert into Genres(name)
values ('Erotisch');

CREATE TABLE IF NOT EXISTS Products(
    id int not null AUTO_INCREMENT,
    name varchar(50) not null,
    description varchar(MAX),
    genre_id int not null,
    age_category_id int not null,
    players_minimum int,
    players_maximum int,
    rating int,
    rent_stock int,
    buy_stock int not null,
    publisher_id int not null,
    picture varchar(250),
    rent_price double not null,
    buy_price double not null,
    language_id int not null,
    date_launch date,
    active boolean not null,
    primary key (id),
    foreign key (genre_id) references Genres (id),
    foreign key (age_category_id) references Agecategories (id),
    foreign key (publisher_id) references Publishers (id),
    foreign key (language_id) references Languages (id)
);

insert into Products(name,description,genre_id,age_category_id,players_minimum,players_maximum,rating,rent_stock,buy_stock,publisher_id,picture,rent_price,buy_price,language_id,date_launch,active)
values ('Ticket to Ride Europe','Met het Ticket to Ride Europe bordspel reis je per trein over het hele continent. Waag je een reis door de donkere tunnels in Zwitserland of aan boord van een veerboot op de Zwarte Zee? Of bouw je schitterende treinstations in de grote hoofdsteden van oude wereldrijken?
In Ticket to Ride Europe moeten de spelers de routes op hun bestemmingskaarten volbrengen. Dit doe je door verbindingen tussen steden te claimen, die je mag bouwen als je de juiste kaartencombinaties in handen hebt. Heb jij aan het eind van het spel de meeste punten verzameld met je treinnetwerk? Dan ben jij de winnaar.
Dit populaire bordspel is een makkelijk aan te leren spel met diverse onvoorziene plotwendingen, zodat de uiteindelijke winnaar tot op het laatst onbekend blijft. Spanning en plezier voor het hele gezin.',1,9,2,5,3,2,15,3,'LINK AFBEELDING HIER',2.45,34.95,1,'2008-02-20',1);
insert into Products(name,description,genre_id,age_category_id,players_minimum,players_maximum,rating,rent_stock,buy_stock,publisher_id,picture,rent_price,buy_price,language_id,date_launch,active)
values ('De Kwakzalvers van Kakelenburg','De Kwakzalvers van Kakelenburg Eenmaal per jaar komen in Kakelenburg de beste wonderdoktoren en beunhazen samen om drankjes tegen zweetvoeten, heimwee, de hik en liefdesverdriet te brouwen. Iedere kwakzalver kookt hier echter zijn eigen soep. Iedere speler trekt zolang ingrediënten uit zijn eigen, in de loop van het spel zelf samengestelde, voorraadbuidel totdat hij denkt dat zijn drank perfect is. Maar pas op: een paar knalerwten en de hele drank ontploft. Het is dus beter om op tijd te stoppen en een kleinere portie te koken om zo met de opbrengst ervan kostbare ingrediënten aan te schaffen. Zo vult de voorraadbuidel zich met steeds meer nuttige ingrediënten, waardoor de volgende drank wellicht nog beter wordt en meer punten oplevert. In dit spel met meer dan 2000 combinatiemogelijkheden wordt het beproefde deckbuildingssysteem gecombineerd met het populaire “push your luck”-mechanisme.',1,9,2,4,4,1,9,5,'LINK AFBEELDING HIER',1.89,39.95,2,'2001-01-31',1);
insert into Products(name,description,genre_id,age_category_id,players_minimum,players_maximum,rating,rent_stock,buy_stock,publisher_id,picture,rent_price,buy_price,language_id,date_launch,active)
values ('Wingspan','Een vogelspel vol tactiek en spanning Als vogelliefhebber probeer je de beste leefomstandigheden voor de vogels in je opvangcentrum te creëren. Elke vogel breidt in één van zijn leefgebieden een ketting van krachtige combinaties uit. Deze leefgebieden richten zich op verschillende groeifactoren: voedsel pakken, eieren leggen en nieuwe vogelkaarten trekken. Wie bouwt het beste actiemotortje en scoort aan het einde van het spel de meeste punten met zijn vogels? Elke beurt speel je een vogel, waarna je alle acties die zich in het betreffende leefgebied bevinden, mag uitvoeren. Zo kun je voedsel uit een “echt” vogelhuisje pakken, ei-miniaturen in nesten leggen of nieuwe vogels verzamelen. Alle opties leveren op verschillende manieren punten op. Het spel bevat 170 unieke vogelkaarten, die in combinatie met de verschillende bonuskaarten en de interactie met de andere spelers voor oneindige variatie zorgen. Het spel is ook solitair te spelen!',4,9,1,5,1,1,0,5,'LINK AFBEELDING HIER',3.50,56.14,1,'2000-06-20',1);

CREATE TABLE IF NOT EXISTS Usertypes(
    id int not null AUTO_INCREMENT,
    name text,
    description text,
    primary key (id)
);

insert into Usertypes(name,description)
values ('USER','Klassieke klant');
insert into Usertypes(name,description)
values ('ADMIN','Systeembeheerder van de webshop');

CREATE TABLE IF NOT EXISTS Users(
    id int not null AUTO_INCREMENT,
    user_type_id int not null,
    firstname text,
    lastname text,
    birthdate date,
    password text,
    email text,
    street text,
    number text,
    postalcode int,
    city text,
    active boolean,
    deleted boolean,
    wrongpasswordcounter int,
    foreign key (user_type_id) references UserTypes (id),
    primary key (id)
);

insert into Users(user_type_id, firstname, lastname, birthdate, password, email, street, number, postalcode, city, active, deleted, wrongpasswordcounter)
values (1,'KlantA', 'Achternaam klantA','1989-02-8','$2y$12$6eh76MVXh9JnigU5Crsg7OZYMRf3FLptmmaqG.LiTxuegS2muBqUC','Maarten@test.com','Vuchterhoeve','6',2440,'Geel',TRUE,FALSE,0);
insert into Users(user_type_id, firstname, lastname, birthdate, password, email, street, number, postalcode, city, active, deleted, wrongpasswordcounter)
values (2,'AdminA', 'Achternaam AdminA','1990-03-8','$2y$12$NgrX/SSjH8bF.4jpQtPsruWmkZOGQDU8zuQaaszp1xvZclT6bG8si','Eve@test.com','Teststraat','69',2300,'Turnhout',TRUE,FALSE,0);
insert into Users(user_type_id, firstname, lastname, birthdate, password, email, street, number, postalcode, city, active, deleted, wrongpasswordcounter)
values (1,'KlantB', 'Achternaam klantB','2005-02-8','$2y$12$L5MWSKjMiyLC63KLsEEWEOawtiKRDJz59AvOgG3oORUj3tJrqKS9K','Ruben@test.com','Demostraat','15',2300,'Turnhout',TRUE,FALSE,0);


CREATE TABLE IF NOT EXISTS Orders(
    id int not null AUTO_INCREMENT,
    user_id int not null,
    date_created date,
    date_collect date,
    status int,
    foreign key (user_id) references Users (id),
    primary key (id)
);

insert into Orders(user_id, date_created, date_collect, status)
VALUES (1,'2020-10-10','2020-10-11',1);
insert into Orders(user_id, date_created, date_collect, status)
VALUES (3,'2020-08-10','2020-08-11',1);
insert into Orders(user_id, date_created, date_collect, status)
VALUES (1,'2020-09-10','2020-12-11',0);


CREATE TABLE IF NOT EXISTS OrderProducts(
    id int not null AUTO_INCREMENT,
    product_id int not null,
    order_id int not null,
    rent_duration_weeks int,
    order_type int,
    price double,
    discount_price double,
    foreign key (product_id) references Products (id),
    foreign key (order_id) references Orders (id),
    primary key (id)
);

insert into OrderProducts(product_id,order_id, rent_duration_weeks, order_type, price, discount_price)
VALUES (1,1,null,1,34.95,5);
insert into OrderProducts(product_id,order_id, rent_duration_weeks, order_type, price, discount_price)
VALUES (2,1,null,1,20.10,0);
insert into OrderProducts(product_id,order_id, rent_duration_weeks, order_type, price, discount_price)
VALUES (2,2,2,2,4,0);


