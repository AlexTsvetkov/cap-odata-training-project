
DROP VIEW IF EXISTS localized_fr_BooksService_Books;
DROP VIEW IF EXISTS localized_de_BooksService_Books;
DROP VIEW IF EXISTS localized_fr_OrdersService_OrderItems;
DROP VIEW IF EXISTS localized_de_OrdersService_OrderItems;
DROP VIEW IF EXISTS localized_fr_OrdersService_Orders;
DROP VIEW IF EXISTS localized_de_OrdersService_Orders;
DROP VIEW IF EXISTS localized_fr_BooksService_Authors;
DROP VIEW IF EXISTS localized_de_BooksService_Authors;
DROP VIEW IF EXISTS localized_fr_AdminService_Authors;
DROP VIEW IF EXISTS localized_de_AdminService_Authors;
DROP VIEW IF EXISTS localized_fr_AdminService_Currencies;
DROP VIEW IF EXISTS localized_de_AdminService_Currencies;
DROP VIEW IF EXISTS localized_fr_OrdersService_Currencies;
DROP VIEW IF EXISTS localized_de_OrdersService_Currencies;
DROP VIEW IF EXISTS localized_fr_BooksService_Categories;
DROP VIEW IF EXISTS localized_de_BooksService_Categories;
DROP VIEW IF EXISTS localized_fr_BooksService_Currencies;
DROP VIEW IF EXISTS localized_de_BooksService_Currencies;
DROP VIEW IF EXISTS localized_fr_AdminService_Categories;
DROP VIEW IF EXISTS localized_de_AdminService_Categories;
DROP VIEW IF EXISTS localized_fr_AdminService_Products;
DROP VIEW IF EXISTS localized_de_AdminService_Products;
DROP VIEW IF EXISTS localized_fr_sap_capire_bookstore_Books;
DROP VIEW IF EXISTS localized_de_sap_capire_bookstore_Books;
DROP VIEW IF EXISTS localized_fr_sap_capire_bookstore_OrderItems;
DROP VIEW IF EXISTS localized_de_sap_capire_bookstore_OrderItems;
DROP VIEW IF EXISTS localized_fr_sap_capire_bookstore_Authors;
DROP VIEW IF EXISTS localized_de_sap_capire_bookstore_Authors;
DROP VIEW IF EXISTS localized_fr_sap_capire_bookstore_Orders;
DROP VIEW IF EXISTS localized_de_sap_capire_bookstore_Orders;
DROP VIEW IF EXISTS localized_fr_sap_capire_products_Categories;
DROP VIEW IF EXISTS localized_de_sap_capire_products_Categories;
DROP VIEW IF EXISTS localized_fr_sap_capire_products_Products;
DROP VIEW IF EXISTS localized_de_sap_capire_products_Products;
DROP VIEW IF EXISTS localized_fr_sap_common_Currencies;
DROP VIEW IF EXISTS localized_de_sap_common_Currencies;
DROP VIEW IF EXISTS localized_BooksService_Books;
DROP VIEW IF EXISTS localized_OrdersService_OrderItems;
DROP VIEW IF EXISTS localized_OrdersService_Orders;
DROP VIEW IF EXISTS localized_BooksService_Authors;
DROP VIEW IF EXISTS localized_AdminService_Authors;
DROP VIEW IF EXISTS localized_AdminService_Currencies;
DROP VIEW IF EXISTS localized_OrdersService_Currencies;
DROP VIEW IF EXISTS localized_BooksService_Categories;
DROP VIEW IF EXISTS localized_BooksService_Currencies;
DROP VIEW IF EXISTS localized_AdminService_Categories;
DROP VIEW IF EXISTS localized_AdminService_Products;
DROP VIEW IF EXISTS localized_sap_capire_bookstore_Books;
DROP VIEW IF EXISTS BooksService_Books;
DROP VIEW IF EXISTS localized_sap_capire_bookstore_OrderItems;
DROP VIEW IF EXISTS localized_sap_capire_bookstore_Authors;
DROP VIEW IF EXISTS localized_sap_capire_bookstore_Orders;
DROP VIEW IF EXISTS localized_sap_capire_products_Categories;
DROP VIEW IF EXISTS localized_sap_capire_products_Products;
DROP VIEW IF EXISTS localized_sap_common_Currencies;
DROP VIEW IF EXISTS AdminService_Currencies_texts;
DROP VIEW IF EXISTS OrdersService_Currencies_texts;
DROP VIEW IF EXISTS BooksService_Categories_texts;
DROP VIEW IF EXISTS BooksService_Currencies_texts;
DROP VIEW IF EXISTS AdminService_Categories_texts;
DROP VIEW IF EXISTS AdminService_Products_texts;
DROP VIEW IF EXISTS AdminService_Currencies;
DROP VIEW IF EXISTS OrdersService_Currencies;
DROP VIEW IF EXISTS BooksService_Categories;
DROP VIEW IF EXISTS BooksService_Books_texts;
DROP VIEW IF EXISTS BooksService_Currencies;
DROP VIEW IF EXISTS AdminService_Categories;
DROP VIEW IF EXISTS AdminService_Products;
DROP VIEW IF EXISTS AdminService_Authors;
DROP VIEW IF EXISTS OrdersService_OrderItems;
DROP VIEW IF EXISTS OrdersService_Orders;
DROP VIEW IF EXISTS BooksService_Authors;
DROP VIEW IF EXISTS sap_capire_bookstore_Books;
DROP TABLE IF EXISTS sap_capire_products_Categories_texts;
DROP TABLE IF EXISTS sap_capire_products_Products_texts;
DROP TABLE IF EXISTS sap_common_Currencies_texts;
DROP TABLE IF EXISTS sap_capire_products_Categories;
DROP TABLE IF EXISTS sap_capire_products_Products;
DROP TABLE IF EXISTS sap_common_Currencies;
DROP TABLE IF EXISTS sap_capire_bookstore_OrderItems;
DROP TABLE IF EXISTS sap_capire_bookstore_Orders;
DROP TABLE IF EXISTS sap_capire_bookstore_Authors;

CREATE TABLE sap_capire_bookstore_Authors (
  ID NVARCHAR(36) NOT NULL,
  firstname NVARCHAR(111),
  lastname NVARCHAR(111),
  PRIMARY KEY(ID)
); 

CREATE TABLE sap_capire_bookstore_Orders (
  ID NVARCHAR(36) NOT NULL,
  createdAt TIMESTAMP(7),
  createdBy NVARCHAR(255),
  modifiedAt TIMESTAMP(7),
  modifiedBy NVARCHAR(255),
  total DECIMAL(9, 2),
  currency_code NVARCHAR(3),
  PRIMARY KEY(ID)
); 

CREATE TABLE sap_capire_bookstore_OrderItems (
  ID NVARCHAR(36) NOT NULL,
  parent_ID NVARCHAR(36) NOT NULL,
  book_ID NVARCHAR(36),
  amount INTEGER,
  netAmount DECIMAL(9, 2),
  PRIMARY KEY(ID)
); 

CREATE TABLE sap_common_Currencies (
  name NVARCHAR(255),
  descr NVARCHAR(1000),
  code NVARCHAR(3) NOT NULL,
  symbol NVARCHAR(5),
  minorUnit SMALLINT,
  PRIMARY KEY(code)
); 

CREATE TABLE sap_capire_products_Products (
  ID NVARCHAR(36) NOT NULL,
  createdAt TIMESTAMP(7),
  createdBy NVARCHAR(255),
  modifiedAt TIMESTAMP(7),
  modifiedBy NVARCHAR(255),
  title NVARCHAR(111),
  descr NVARCHAR(1111),
  stock INTEGER,
  price DECIMAL(9, 2),
  currency_code NVARCHAR(3),
  category_ID INTEGER,
  author_ID NVARCHAR(36),
  PRIMARY KEY(ID)
); 

CREATE TABLE sap_capire_products_Categories (
  name NVARCHAR(255),
  descr NVARCHAR(1000),
  ID INTEGER NOT NULL,
  parent_ID INTEGER,
  PRIMARY KEY(ID)
); 

CREATE TABLE sap_common_Currencies_texts (
  locale NVARCHAR(14) NOT NULL,
  name NVARCHAR(255),
  descr NVARCHAR(1000),
  code NVARCHAR(3) NOT NULL,
  PRIMARY KEY(locale, code)
); 

CREATE TABLE sap_capire_products_Products_texts (
  locale NVARCHAR(14) NOT NULL,
  ID NVARCHAR(36) NOT NULL,
  title NVARCHAR(111),
  descr NVARCHAR(1111),
  PRIMARY KEY(locale, ID)
); 

CREATE TABLE sap_capire_products_Categories_texts (
  locale NVARCHAR(14) NOT NULL,
  name NVARCHAR(255),
  descr NVARCHAR(1000),
  ID INTEGER NOT NULL,
  PRIMARY KEY(locale, ID)
); 

CREATE VIEW sap_capire_bookstore_Books AS SELECT
  Products_0.ID,
  Products_0.createdAt,
  Products_0.createdBy,
  Products_0.modifiedAt,
  Products_0.modifiedBy,
  Products_0.title,
  Products_0.descr,
  Products_0.stock,
  Products_0.price,
  Products_0.currency_code,
  Products_0.category_ID,
  Products_0.author_ID
FROM sap_capire_products_Products AS Products_0; 

CREATE VIEW BooksService_Authors AS SELECT
  Authors_0.ID,
  Authors_0.firstname,
  Authors_0.lastname
FROM sap_capire_bookstore_Authors AS Authors_0; 

CREATE VIEW OrdersService_Orders AS SELECT
  Orders_0.ID,
  Orders_0.createdAt,
  Orders_0.createdBy,
  Orders_0.modifiedAt,
  Orders_0.modifiedBy,
  Orders_0.total,
  Orders_0.currency_code
FROM sap_capire_bookstore_Orders AS Orders_0; 

CREATE VIEW OrdersService_OrderItems AS SELECT
  OrderItems_0.ID,
  OrderItems_0.parent_ID,
  OrderItems_0.book_ID,
  OrderItems_0.amount,
  OrderItems_0.netAmount
FROM sap_capire_bookstore_OrderItems AS OrderItems_0; 

CREATE VIEW AdminService_Authors AS SELECT
  Authors_0.ID,
  Authors_0.firstname,
  Authors_0.lastname
FROM sap_capire_bookstore_Authors AS Authors_0; 

CREATE VIEW AdminService_Products AS SELECT
  Products_0.ID,
  Products_0.createdAt,
  Products_0.createdBy,
  Products_0.modifiedAt,
  Products_0.modifiedBy,
  Products_0.title,
  Products_0.descr,
  Products_0.stock,
  Products_0.price,
  Products_0.currency_code,
  Products_0.category_ID,
  Products_0.author_ID
FROM sap_capire_products_Products AS Products_0; 

CREATE VIEW AdminService_Categories AS SELECT
  Categories_0.name,
  Categories_0.descr,
  Categories_0.ID,
  Categories_0.parent_ID
FROM sap_capire_products_Categories AS Categories_0; 

CREATE VIEW BooksService_Currencies AS SELECT
  Currencies_0.name,
  Currencies_0.descr,
  Currencies_0.code,
  Currencies_0.symbol,
  Currencies_0.minorUnit
FROM sap_common_Currencies AS Currencies_0; 

CREATE VIEW BooksService_Books_texts AS SELECT
  texts_0.locale,
  texts_0.ID,
  texts_0.title,
  texts_0.descr
FROM sap_capire_products_Products_texts AS texts_0; 

CREATE VIEW BooksService_Categories AS SELECT
  Categories_0.name,
  Categories_0.descr,
  Categories_0.ID,
  Categories_0.parent_ID
FROM sap_capire_products_Categories AS Categories_0; 

CREATE VIEW OrdersService_Currencies AS SELECT
  Currencies_0.name,
  Currencies_0.descr,
  Currencies_0.code,
  Currencies_0.symbol,
  Currencies_0.minorUnit
FROM sap_common_Currencies AS Currencies_0; 

CREATE VIEW AdminService_Currencies AS SELECT
  Currencies_0.name,
  Currencies_0.descr,
  Currencies_0.code,
  Currencies_0.symbol,
  Currencies_0.minorUnit
FROM sap_common_Currencies AS Currencies_0; 

CREATE VIEW AdminService_Products_texts AS SELECT
  texts_0.locale,
  texts_0.ID,
  texts_0.title,
  texts_0.descr
FROM sap_capire_products_Products_texts AS texts_0; 

CREATE VIEW AdminService_Categories_texts AS SELECT
  texts_0.locale,
  texts_0.name,
  texts_0.descr,
  texts_0.ID
FROM sap_capire_products_Categories_texts AS texts_0; 

CREATE VIEW BooksService_Currencies_texts AS SELECT
  texts_0.locale,
  texts_0.name,
  texts_0.descr,
  texts_0.code
FROM sap_common_Currencies_texts AS texts_0; 

CREATE VIEW BooksService_Categories_texts AS SELECT
  texts_0.locale,
  texts_0.name,
  texts_0.descr,
  texts_0.ID
FROM sap_capire_products_Categories_texts AS texts_0; 

CREATE VIEW OrdersService_Currencies_texts AS SELECT
  texts_0.locale,
  texts_0.name,
  texts_0.descr,
  texts_0.code
FROM sap_common_Currencies_texts AS texts_0; 

CREATE VIEW AdminService_Currencies_texts AS SELECT
  texts_0.locale,
  texts_0.name,
  texts_0.descr,
  texts_0.code
FROM sap_common_Currencies_texts AS texts_0; 

CREATE VIEW localized_sap_common_Currencies AS SELECT
  coalesce(localized_1.name, L_0.name) AS name,
  coalesce(localized_1.descr, L_0.descr) AS descr,
  L_0.code,
  L_0.symbol,
  L_0.minorUnit
FROM (sap_common_Currencies AS L_0 LEFT JOIN sap_common_Currencies_texts AS localized_1 ON localized_1.code = L_0.code AND localized_1.locale = @locale); 

CREATE VIEW localized_sap_capire_products_Products AS SELECT
  L_0.ID,
  L_0.createdAt,
  L_0.createdBy,
  L_0.modifiedAt,
  L_0.modifiedBy,
  coalesce(localized_1.title, L_0.title) AS title,
  coalesce(localized_1.descr, L_0.descr) AS descr,
  L_0.stock,
  L_0.price,
  L_0.currency_code,
  L_0.category_ID,
  L_0.author_ID
FROM (sap_capire_products_Products AS L_0 LEFT JOIN sap_capire_products_Products_texts AS localized_1 ON localized_1.ID = L_0.ID AND localized_1.locale = @locale); 

CREATE VIEW localized_sap_capire_products_Categories AS SELECT
  coalesce(localized_1.name, L_0.name) AS name,
  coalesce(localized_1.descr, L_0.descr) AS descr,
  L_0.ID,
  L_0.parent_ID
FROM (sap_capire_products_Categories AS L_0 LEFT JOIN sap_capire_products_Categories_texts AS localized_1 ON localized_1.ID = L_0.ID AND localized_1.locale = @locale); 

CREATE VIEW localized_sap_capire_bookstore_Orders AS SELECT
  L.ID,
  L.createdAt,
  L.createdBy,
  L.modifiedAt,
  L.modifiedBy,
  L.total,
  L.currency_code
FROM sap_capire_bookstore_Orders AS L; 

CREATE VIEW localized_sap_capire_bookstore_Authors AS SELECT
  L.ID,
  L.firstname,
  L.lastname
FROM sap_capire_bookstore_Authors AS L; 

CREATE VIEW localized_sap_capire_bookstore_OrderItems AS SELECT
  L.ID,
  L.parent_ID,
  L.book_ID,
  L.amount,
  L.netAmount
FROM sap_capire_bookstore_OrderItems AS L; 

CREATE VIEW BooksService_Books AS SELECT
  Books_0.ID,
  Books_0.title,
  Books_0.descr,
  Books_0.stock,
  Books_0.price,
  Books_0.currency_code,
  Books_0.author_ID,
  Books_0.category_ID AS genre_ID
FROM sap_capire_bookstore_Books AS Books_0; 

CREATE VIEW localized_sap_capire_bookstore_Books AS SELECT
  Products_0.ID,
  Products_0.createdAt,
  Products_0.createdBy,
  Products_0.modifiedAt,
  Products_0.modifiedBy,
  Products_0.title,
  Products_0.descr,
  Products_0.stock,
  Products_0.price,
  Products_0.currency_code,
  Products_0.category_ID,
  Products_0.author_ID
FROM localized_sap_capire_products_Products AS Products_0; 

CREATE VIEW localized_AdminService_Products AS SELECT
  Products_0.ID,
  Products_0.createdAt,
  Products_0.createdBy,
  Products_0.modifiedAt,
  Products_0.modifiedBy,
  Products_0.title,
  Products_0.descr,
  Products_0.stock,
  Products_0.price,
  Products_0.currency_code,
  Products_0.category_ID,
  Products_0.author_ID
FROM localized_sap_capire_products_Products AS Products_0; 

CREATE VIEW localized_AdminService_Categories AS SELECT
  Categories_0.name,
  Categories_0.descr,
  Categories_0.ID,
  Categories_0.parent_ID
FROM localized_sap_capire_products_Categories AS Categories_0; 

CREATE VIEW localized_BooksService_Currencies AS SELECT
  Currencies_0.name,
  Currencies_0.descr,
  Currencies_0.code,
  Currencies_0.symbol,
  Currencies_0.minorUnit
FROM localized_sap_common_Currencies AS Currencies_0; 

CREATE VIEW localized_BooksService_Categories AS SELECT
  Categories_0.name,
  Categories_0.descr,
  Categories_0.ID,
  Categories_0.parent_ID
FROM localized_sap_capire_products_Categories AS Categories_0; 

CREATE VIEW localized_OrdersService_Currencies AS SELECT
  Currencies_0.name,
  Currencies_0.descr,
  Currencies_0.code,
  Currencies_0.symbol,
  Currencies_0.minorUnit
FROM localized_sap_common_Currencies AS Currencies_0; 

CREATE VIEW localized_AdminService_Currencies AS SELECT
  Currencies_0.name,
  Currencies_0.descr,
  Currencies_0.code,
  Currencies_0.symbol,
  Currencies_0.minorUnit
FROM localized_sap_common_Currencies AS Currencies_0; 

CREATE VIEW localized_AdminService_Authors AS SELECT
  Authors_0.ID,
  Authors_0.firstname,
  Authors_0.lastname
FROM localized_sap_capire_bookstore_Authors AS Authors_0; 

CREATE VIEW localized_BooksService_Authors AS SELECT
  Authors_0.ID,
  Authors_0.firstname,
  Authors_0.lastname
FROM localized_sap_capire_bookstore_Authors AS Authors_0; 

CREATE VIEW localized_OrdersService_Orders AS SELECT
  Orders_0.ID,
  Orders_0.createdAt,
  Orders_0.createdBy,
  Orders_0.modifiedAt,
  Orders_0.modifiedBy,
  Orders_0.total,
  Orders_0.currency_code
FROM localized_sap_capire_bookstore_Orders AS Orders_0; 

CREATE VIEW localized_OrdersService_OrderItems AS SELECT
  OrderItems_0.ID,
  OrderItems_0.parent_ID,
  OrderItems_0.book_ID,
  OrderItems_0.amount,
  OrderItems_0.netAmount
FROM localized_sap_capire_bookstore_OrderItems AS OrderItems_0; 

CREATE VIEW localized_BooksService_Books AS SELECT
  Books_0.ID,
  Books_0.title,
  Books_0.descr,
  Books_0.stock,
  Books_0.price,
  Books_0.currency_code,
  Books_0.author_ID,
  Books_0.category_ID AS genre_ID
FROM localized_sap_capire_bookstore_Books AS Books_0; 

CREATE VIEW localized_de_sap_common_Currencies AS SELECT
  coalesce(localized_de_1.name, L_0.name) AS name,
  coalesce(localized_de_1.descr, L_0.descr) AS descr,
  L_0.code,
  L_0.symbol,
  L_0.minorUnit
FROM (sap_common_Currencies AS L_0 LEFT JOIN sap_common_Currencies_texts AS localized_de_1 ON localized_de_1.code = L_0.code AND localized_de_1.locale = @locale); 

CREATE VIEW localized_fr_sap_common_Currencies AS SELECT
  coalesce(localized_fr_1.name, L_0.name) AS name,
  coalesce(localized_fr_1.descr, L_0.descr) AS descr,
  L_0.code,
  L_0.symbol,
  L_0.minorUnit
FROM (sap_common_Currencies AS L_0 LEFT JOIN sap_common_Currencies_texts AS localized_fr_1 ON localized_fr_1.code = L_0.code AND localized_fr_1.locale = @locale); 

CREATE VIEW localized_de_sap_capire_products_Products AS SELECT
  L_0.ID,
  L_0.createdAt,
  L_0.createdBy,
  L_0.modifiedAt,
  L_0.modifiedBy,
  coalesce(localized_de_1.title, L_0.title) AS title,
  coalesce(localized_de_1.descr, L_0.descr) AS descr,
  L_0.stock,
  L_0.price,
  L_0.currency_code,
  L_0.category_ID,
  L_0.author_ID
FROM (sap_capire_products_Products AS L_0 LEFT JOIN sap_capire_products_Products_texts AS localized_de_1 ON localized_de_1.ID = L_0.ID AND localized_de_1.locale = @locale); 

CREATE VIEW localized_fr_sap_capire_products_Products AS SELECT
  L_0.ID,
  L_0.createdAt,
  L_0.createdBy,
  L_0.modifiedAt,
  L_0.modifiedBy,
  coalesce(localized_fr_1.title, L_0.title) AS title,
  coalesce(localized_fr_1.descr, L_0.descr) AS descr,
  L_0.stock,
  L_0.price,
  L_0.currency_code,
  L_0.category_ID,
  L_0.author_ID
FROM (sap_capire_products_Products AS L_0 LEFT JOIN sap_capire_products_Products_texts AS localized_fr_1 ON localized_fr_1.ID = L_0.ID AND localized_fr_1.locale = @locale); 

CREATE VIEW localized_de_sap_capire_products_Categories AS SELECT
  coalesce(localized_de_1.name, L_0.name) AS name,
  coalesce(localized_de_1.descr, L_0.descr) AS descr,
  L_0.ID,
  L_0.parent_ID
FROM (sap_capire_products_Categories AS L_0 LEFT JOIN sap_capire_products_Categories_texts AS localized_de_1 ON localized_de_1.ID = L_0.ID AND localized_de_1.locale = @locale); 

CREATE VIEW localized_fr_sap_capire_products_Categories AS SELECT
  coalesce(localized_fr_1.name, L_0.name) AS name,
  coalesce(localized_fr_1.descr, L_0.descr) AS descr,
  L_0.ID,
  L_0.parent_ID
FROM (sap_capire_products_Categories AS L_0 LEFT JOIN sap_capire_products_Categories_texts AS localized_fr_1 ON localized_fr_1.ID = L_0.ID AND localized_fr_1.locale = @locale); 

CREATE VIEW localized_de_sap_capire_bookstore_Orders AS SELECT
  L.ID,
  L.createdAt,
  L.createdBy,
  L.modifiedAt,
  L.modifiedBy,
  L.total,
  L.currency_code
FROM sap_capire_bookstore_Orders AS L; 

CREATE VIEW localized_fr_sap_capire_bookstore_Orders AS SELECT
  L.ID,
  L.createdAt,
  L.createdBy,
  L.modifiedAt,
  L.modifiedBy,
  L.total,
  L.currency_code
FROM sap_capire_bookstore_Orders AS L; 

CREATE VIEW localized_de_sap_capire_bookstore_Authors AS SELECT
  L.ID,
  L.firstname,
  L.lastname
FROM sap_capire_bookstore_Authors AS L; 

CREATE VIEW localized_fr_sap_capire_bookstore_Authors AS SELECT
  L.ID,
  L.firstname,
  L.lastname
FROM sap_capire_bookstore_Authors AS L; 

CREATE VIEW localized_de_sap_capire_bookstore_OrderItems AS SELECT
  L.ID,
  L.parent_ID,
  L.book_ID,
  L.amount,
  L.netAmount
FROM sap_capire_bookstore_OrderItems AS L; 

CREATE VIEW localized_fr_sap_capire_bookstore_OrderItems AS SELECT
  L.ID,
  L.parent_ID,
  L.book_ID,
  L.amount,
  L.netAmount
FROM sap_capire_bookstore_OrderItems AS L; 

CREATE VIEW localized_de_sap_capire_bookstore_Books AS SELECT
  Products_0.ID,
  Products_0.createdAt,
  Products_0.createdBy,
  Products_0.modifiedAt,
  Products_0.modifiedBy,
  Products_0.title,
  Products_0.descr,
  Products_0.stock,
  Products_0.price,
  Products_0.currency_code,
  Products_0.category_ID,
  Products_0.author_ID
FROM localized_de_sap_capire_products_Products AS Products_0; 

CREATE VIEW localized_fr_sap_capire_bookstore_Books AS SELECT
  Products_0.ID,
  Products_0.createdAt,
  Products_0.createdBy,
  Products_0.modifiedAt,
  Products_0.modifiedBy,
  Products_0.title,
  Products_0.descr,
  Products_0.stock,
  Products_0.price,
  Products_0.currency_code,
  Products_0.category_ID,
  Products_0.author_ID
FROM localized_fr_sap_capire_products_Products AS Products_0; 

CREATE VIEW localized_de_AdminService_Products AS SELECT
  Products_0.ID,
  Products_0.createdAt,
  Products_0.createdBy,
  Products_0.modifiedAt,
  Products_0.modifiedBy,
  Products_0.title,
  Products_0.descr,
  Products_0.stock,
  Products_0.price,
  Products_0.currency_code,
  Products_0.category_ID,
  Products_0.author_ID
FROM localized_de_sap_capire_products_Products AS Products_0; 

CREATE VIEW localized_fr_AdminService_Products AS SELECT
  Products_0.ID,
  Products_0.createdAt,
  Products_0.createdBy,
  Products_0.modifiedAt,
  Products_0.modifiedBy,
  Products_0.title,
  Products_0.descr,
  Products_0.stock,
  Products_0.price,
  Products_0.currency_code,
  Products_0.category_ID,
  Products_0.author_ID
FROM localized_fr_sap_capire_products_Products AS Products_0; 

CREATE VIEW localized_de_AdminService_Categories AS SELECT
  Categories_0.name,
  Categories_0.descr,
  Categories_0.ID,
  Categories_0.parent_ID
FROM localized_de_sap_capire_products_Categories AS Categories_0; 

CREATE VIEW localized_fr_AdminService_Categories AS SELECT
  Categories_0.name,
  Categories_0.descr,
  Categories_0.ID,
  Categories_0.parent_ID
FROM localized_fr_sap_capire_products_Categories AS Categories_0; 

CREATE VIEW localized_de_BooksService_Currencies AS SELECT
  Currencies_0.name,
  Currencies_0.descr,
  Currencies_0.code,
  Currencies_0.symbol,
  Currencies_0.minorUnit
FROM localized_de_sap_common_Currencies AS Currencies_0; 

CREATE VIEW localized_fr_BooksService_Currencies AS SELECT
  Currencies_0.name,
  Currencies_0.descr,
  Currencies_0.code,
  Currencies_0.symbol,
  Currencies_0.minorUnit
FROM localized_fr_sap_common_Currencies AS Currencies_0; 

CREATE VIEW localized_de_BooksService_Categories AS SELECT
  Categories_0.name,
  Categories_0.descr,
  Categories_0.ID,
  Categories_0.parent_ID
FROM localized_de_sap_capire_products_Categories AS Categories_0; 

CREATE VIEW localized_fr_BooksService_Categories AS SELECT
  Categories_0.name,
  Categories_0.descr,
  Categories_0.ID,
  Categories_0.parent_ID
FROM localized_fr_sap_capire_products_Categories AS Categories_0; 

CREATE VIEW localized_de_OrdersService_Currencies AS SELECT
  Currencies_0.name,
  Currencies_0.descr,
  Currencies_0.code,
  Currencies_0.symbol,
  Currencies_0.minorUnit
FROM localized_de_sap_common_Currencies AS Currencies_0; 

CREATE VIEW localized_fr_OrdersService_Currencies AS SELECT
  Currencies_0.name,
  Currencies_0.descr,
  Currencies_0.code,
  Currencies_0.symbol,
  Currencies_0.minorUnit
FROM localized_fr_sap_common_Currencies AS Currencies_0; 

CREATE VIEW localized_de_AdminService_Currencies AS SELECT
  Currencies_0.name,
  Currencies_0.descr,
  Currencies_0.code,
  Currencies_0.symbol,
  Currencies_0.minorUnit
FROM localized_de_sap_common_Currencies AS Currencies_0; 

CREATE VIEW localized_fr_AdminService_Currencies AS SELECT
  Currencies_0.name,
  Currencies_0.descr,
  Currencies_0.code,
  Currencies_0.symbol,
  Currencies_0.minorUnit
FROM localized_fr_sap_common_Currencies AS Currencies_0; 

CREATE VIEW localized_de_AdminService_Authors AS SELECT
  Authors_0.ID,
  Authors_0.firstname,
  Authors_0.lastname
FROM localized_de_sap_capire_bookstore_Authors AS Authors_0; 

CREATE VIEW localized_fr_AdminService_Authors AS SELECT
  Authors_0.ID,
  Authors_0.firstname,
  Authors_0.lastname
FROM localized_fr_sap_capire_bookstore_Authors AS Authors_0; 

CREATE VIEW localized_de_BooksService_Authors AS SELECT
  Authors_0.ID,
  Authors_0.firstname,
  Authors_0.lastname
FROM localized_de_sap_capire_bookstore_Authors AS Authors_0; 

CREATE VIEW localized_fr_BooksService_Authors AS SELECT
  Authors_0.ID,
  Authors_0.firstname,
  Authors_0.lastname
FROM localized_fr_sap_capire_bookstore_Authors AS Authors_0; 

CREATE VIEW localized_de_OrdersService_Orders AS SELECT
  Orders_0.ID,
  Orders_0.createdAt,
  Orders_0.createdBy,
  Orders_0.modifiedAt,
  Orders_0.modifiedBy,
  Orders_0.total,
  Orders_0.currency_code
FROM localized_de_sap_capire_bookstore_Orders AS Orders_0; 

CREATE VIEW localized_fr_OrdersService_Orders AS SELECT
  Orders_0.ID,
  Orders_0.createdAt,
  Orders_0.createdBy,
  Orders_0.modifiedAt,
  Orders_0.modifiedBy,
  Orders_0.total,
  Orders_0.currency_code
FROM localized_fr_sap_capire_bookstore_Orders AS Orders_0; 

CREATE VIEW localized_de_OrdersService_OrderItems AS SELECT
  OrderItems_0.ID,
  OrderItems_0.parent_ID,
  OrderItems_0.book_ID,
  OrderItems_0.amount,
  OrderItems_0.netAmount
FROM localized_de_sap_capire_bookstore_OrderItems AS OrderItems_0; 

CREATE VIEW localized_fr_OrdersService_OrderItems AS SELECT
  OrderItems_0.ID,
  OrderItems_0.parent_ID,
  OrderItems_0.book_ID,
  OrderItems_0.amount,
  OrderItems_0.netAmount
FROM localized_fr_sap_capire_bookstore_OrderItems AS OrderItems_0; 

CREATE VIEW localized_de_BooksService_Books AS SELECT
  Books_0.ID,
  Books_0.title,
  Books_0.descr,
  Books_0.stock,
  Books_0.price,
  Books_0.currency_code,
  Books_0.author_ID,
  Books_0.category_ID AS genre_ID
FROM localized_de_sap_capire_bookstore_Books AS Books_0; 

CREATE VIEW localized_fr_BooksService_Books AS SELECT
  Books_0.ID,
  Books_0.title,
  Books_0.descr,
  Books_0.stock,
  Books_0.price,
  Books_0.currency_code,
  Books_0.author_ID,
  Books_0.category_ID AS genre_ID
FROM localized_fr_sap_capire_bookstore_Books AS Books_0; 

