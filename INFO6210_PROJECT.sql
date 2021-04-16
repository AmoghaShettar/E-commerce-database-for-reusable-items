drop table ITEM_CART;
drop table ITEM;
drop table SHIPMENT;
drop table PAYMENT;
drop table ORDERR;
drop table SELLER;
drop table CUSTOMER;
drop table SHIPPER;
drop table CATEGORYY;
drop table CART;
drop table REUSABLE_ITEM;
drop table ADDRESS;
drop table ADDRESS_ZIP;

CREATE TABLE ADDRESS_ZIP(
    AREA_CODE INT NOT NULL PRIMARY KEY,
    CITY VARCHAR(25) NOT NULL,
    STATEE VARCHAR(25) NOT NULL,
    COUNTRY VARCHAR(25) NOT NULL
);

CREATE TABLE ADDRESS(
   ADDRESS_ID INT NOT NULL PRIMARY KEY,
   ADDRESS_LINE1 VARCHAR (100) NOT NULL,
   ADDRESS_LINE2 VARCHAR (100),
   AREA_CODE INT NOT NULL,
   FOREIGN KEY(AREA_CODE) REFERENCES ADDRESS_ZIP(AREA_CODE)
);

CREATE TABLE REUSABLE_ITEM(
    R_ID INT NOT NULL PRIMARY KEY,
    NO_OF_TIMES_USED INT NOT NULL,
    I_DESCRIPTION VARCHAR(250)
);

CREATE TABLE CART(
    CART_ID INT NOT NULL PRIMARY KEY,
    NO_OF_ITEMS INT NOT NULL,
    TOTAL_COST INT NOT NULL
);

CREATE TABLE CATEGORYY(
    CATEGORY_ID INT NOT NULL PRIMARY KEY,
    CATEGORY_NAME VARCHAR(50) NOT NULL
);

CREATE TABLE SHIPPER(
    SHIPPER_ID INT NOT NULL PRIMARY KEY,
    CONTACT_NUM INT NOT NULL
);

CREATE TABLE CUSTOMER(
   C_ID INT NOT NULL PRIMARY KEY,
   C_NAME VARCHAR (50) NOT NULL,
   C_USERNAME VARCHAR (20) NOT NULL,
   C_PASSWORD VARCHAR (20) NOT NULL,
   DATE_OF_BIRTH DATE,
   C_PHONE INT NOT NULL,
   C_EMAIL VARCHAR(25) NOT NULL,
   ADDRESS_ID INT,
   FOREIGN KEY(ADDRESS_ID) REFERENCES ADDRESS(ADDRESS_ID)
);

CREATE TABLE SELLER(
   S_ID INT NOT NULL PRIMARY KEY,
   S_NAME VARCHAR (50) NOT NULL,
   S_USERNAME VARCHAR (20) NOT NULL,
   S_PASSWORD VARCHAR (20) NOT NULL,
   S_PHONE INT NOT NULL,
   S_EMAIL VARCHAR(25) NOT NULL,
   ADDRESS_ID INT,
   FOREIGN KEY(ADDRESS_ID) REFERENCES ADDRESS(ADDRESS_ID)
);

CREATE TABLE ORDERR(
    ORDER_ID INT NOT NULL PRIMARY KEY,
    ORDER_DATE DATE NOT NULL,
    C_ID INT NOT NULL,
    FOREIGN KEY(C_ID) REFERENCES CUSTOMER(C_ID),
    CART_ID INT NOT NULL,
    FOREIGN KEY(CART_ID) REFERENCES CART(CART_ID)
);

CREATE TABLE PAYMENT(
    PAYMENT_ID INT NOT NULL PRIMARY KEY,
    AMOUNT INT NOT NULL,
    PAYMENT_MODE VARCHAR(20) NOT NULL,
    PAYMENT_DATE DATE NOT NULL,
    ORDER_ID INT NOT NULL,
    FOREIGN KEY(ORDER_ID) REFERENCES ORDERR(ORDER_ID)
);

CREATE TABLE SHIPMENT(
    SHIPMENT_ID INT NOT NULL PRIMARY KEY,
    SHIPMENT_DATE DATE NOT NULL,
    DELIVERY_STATUS VARCHAR(20) NOT NULL,
    ADDRESS_ID INT,
    FOREIGN KEY(ADDRESS_ID) REFERENCES ADDRESS(ADDRESS_ID),
    SHIPPER_ID INT,
    FOREIGN KEY(SHIPPER_ID) REFERENCES SHIPPER(SHIPPER_ID),
    PAYMENT_ID INT,
    FOREIGN KEY(PAYMENT_ID) REFERENCES PAYMENT(PAYMENT_ID)
);

CREATE TABLE ITEM(
    ITEM_ID INT NOT NULL PRIMARY KEY,
    ITEM_NAME VARCHAR(25) NOT NULL,
    PRICE INT NOT NULL,
    S_ID INT NOT NULL,
    FOREIGN KEY(S_ID) REFERENCES SELLER(S_ID),
    R_ID INT,
    FOREIGN KEY(R_ID) REFERENCES REUSABLE_ITEM(R_ID),
    CATEGORY_ID INT NOT NULL,
    FOREIGN KEY(CATEGORY_ID) REFERENCES CATEGORYY(CATEGORY_ID),
    C_ID INT,
    FOREIGN KEY(C_ID) REFERENCES CUSTOMER(C_ID)
);

CREATE TABLE ITEM_CART(
    ITEM_ID INT NOT NULL,
    CART_ID INT NOT NULL,
    PRIMARY KEY(ITEM_ID, CART_ID),
    FOREIGN KEY(ITEM_ID) REFERENCES ITEM(ITEM_ID),
    FOREIGN KEY(CART_ID) REFERENCES CART(CART_ID)
);

--Inserting data

INSERT INTO REUSABLE_ITEM VALUES (2001, 2, "Has been used only twice");
INSERT INTO REUSABLE_ITEM VALUES (2002, 1, "A heel you can walk in all day");
INSERT INTO REUSABLE_ITEM VALUES (2003, 2, "Built with burliest fabric package");
INSERT INTO REUSABLE_ITEM VALUES (2004, 4, "Sustainable forest woods are used for the frames.");
INSERT INTO REUSABLE_ITEM VALUES (2005, 3, "No assembly required");
INSERT INTO REUSABLE_ITEM VALUES (2006, 5, "Crafted from metal, its geometric frame features an openwork design topped off by hardware.");
INSERT INTO REUSABLE_ITEM VALUES (2007, 2, "Complete storm protection, but they can also move quickly because it’s incredibly lightweight");
INSERT INTO REUSABLE_ITEM VALUES (2008, 2, "Greet guests with a warm and welcoming glow while you grab their glances with this pendent hanging overhead.");
INSERT INTO REUSABLE_ITEM VALUES (2009, 1, "With the proper ingredients, success comes naturally. Here's everything you need to make a distinctive tasting sausage stick that will be sure to tingle your taste buds.");
INSERT INTO REUSABLE_ITEM VALUES (2010, 1, "Open your door to the world of grilling with the sleek Spirit II E-210 gas grill. This two burner grill is built to fit small spaces, and packed with features such as the powerful GS4 grilling system");
INSERT INTO REUSABLE_ITEM VALUES (2011, 3, "Beautifully handmade laptop case/sleeve made in the Nepal Himalaya");
INSERT INTO REUSABLE_ITEM VALUES (2012, 5, "Designed and measured to fit a 12 to 14 laptops and with a convenient front pocket for your charger cable and notebook.");
INSERT INTO REUSABLE_ITEM VALUES (2013, 2, "Includes roll-top, 2 front zipper pockets, and 2 zippered side pockets  Endor Commando Alliance Special Forces patch is prominently featured on the front");
INSERT INTO REUSABLE_ITEM VALUES (2014, 4, "Genuine hand-seven construction for durable comfort.");
INSERT INTO REUSABLE_ITEM VALUES (2015, 4, "Lightweight and Easy to Move");
INSERT INTO REUSABLE_ITEM VALUES (2016, 3, "Each pair is made of 100 percent cotton for a comfortable, breathable fit regardless of the weather and includes easily adjustable shoulder straps for fans with long torsos. ");
INSERT INTO REUSABLE_ITEM VALUES (2017, 1, "Remove dirt and impurities from your sensitive skin with our all-natural cleansing bar.");
INSERT INTO REUSABLE_ITEM VALUES (2018, 4, "Officially-licensed Star Wars merchandise.Sometimes blending in is the best plan");
INSERT INTO REUSABLE_ITEM VALUES (2019, 3, "Custom BioGenic Systems V5000-AB/C Isothermal Carousel Liquid Nitrogen Freezers offer liquid nitrogen storage temperatures without liquid nitrogen contact.");
INSERT INTO REUSABLE_ITEM VALUES (2020, 3, "Room air purifier removes 99%+ of Airborne Particles. Best for Bedroom, Office, Living Room, Basement");












