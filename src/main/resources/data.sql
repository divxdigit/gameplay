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

CREATE TABLE IF NOT EXISTS Genres(
    LanguageId int not null AUTO_INCREMENT,
    Name varchar(50) not null,
    primary key (LanguageId)
);
