/*
 * TODO(Студент): Опишите процесс создания базы данных
 * 1. Создайте все таблицы, согласно предложенной диаграмме.
 * 2. Опишите все необходимые отношения между таблицами.
 * 3. Добавьте в каждую таблицу минимум три записи.
 */

 /*
 * TODO(Студент): Опишите процесс создания базы данных
 * 1. Создайте все таблицы, согласно предложенной диаграмме.
 * 2. Опишите все необходимые отношения между таблицами.
 * 3. Добавьте в каждую таблицу минимум три записи.
 */

CREATE TABLE UserInfo
(
    id INT PRIMARY KEY,
    name varchar(255) NOT NULL,
    username varchar(255) NOT NULL
);

CREATE TABLE Roles
(
    id INT UNIQUE,
    name VARCHAR(255) PRIMARY KEY
);

CREATE TABLE Users
(
    id INT UNIQUE,
    email varchar(255) PRIMARY KEY,
    password varchar(255),
    info INT references UserInfo(id) UNIQUE,
    role INT references Roles(id)
);

CREATE TABLE Orders
(
    id INT PRIMARY KEY,
    users INT references Users(id)
);

CREATE TABLE Supplier
(
    id INT UNIQUE,
    name varchar(255) primary key,
    address varchar(255) not null ,
    phone varchar(255),
    representative varchar(255) not null
);

CREATE TABLE Product
(
    id INT UNIQUE,
    code varchar(255) primary key,
    title varchar(255),
    supplier INT references Supplier(id),
    initial_price double,
    retail_price double
);

CREATE TABLE Order2Product
(
    orders INT references Orders(id),
    product INT references Product(code),
    PRIMARY KEY (orders,product)
);

ALTER TABLE Orders ADD COLUMN created timestamp;

INSERT into Users (id, email, password, info, role)
VALUES (1,'user1@gmail.com','pwd1',10,1),
       (2,'user2@gmail.com','pwd2',20,2),
       (3,'user3@gmail.com','pwd3',30,2);

SELECT * from ROLES;

INSERT into UserInfo (id, name, username)
VALUES (10,'Ivan','Ivanov'),
       (20,'Petr','Petrov'),
       (30,'Pivo','Vodka');

INSERT into Roles (id, name)
VALUES (1,'ROOT'),
       (2,'ADMIN');

INSERT into Orders (id, users, created)
VALUES (123,1,'2019-01-01 03:03:10'),
       (456,2,'2019-02-01 23:11:10'),
       (789,3,'2019-03-01 14:22:10');

INSERT into PRODUCT (id, code, title, supplier, initial_price, retail_value)
VALUES (001,'9800001','Product1',1,111.5,120),
       (002,'9800002','Product2',2,11,22),
       (003,'9800003','Product3',3,444.4,1003);

INSERT into SUPPLIER (id, name, address, phone, representative)
VALUES (1,'Supplier1','Address1','88005553535','Dworf'),
       (2,'Supplier2','Address2','88005553535','Mage'),
       (3,'Supplier3','Address3','88005553535','Knight');

INSERT into ORDER2PRODUCT (orders, product)
VALUES (123,001),
       (456,002),
       (789,003);