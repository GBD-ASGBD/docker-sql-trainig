-- BD Training
drop table if exists comanda cascade;
drop table if exists producte cascade;
drop table if exists client cascade;
drop table if exists repvenda cascade;
drop table if exists oficina cascade;


CREATE TABLE producte (
    fabcod character(3),
    prodcod character(5),
    descrip character varying(40) NOT NULL,
    preu numeric(7,2) NOT NULL,
    exist integer,
    PRIMARY KEY(FABCOD,PRODCOD)
);


CREATE TABLE oficina (
    ofinum smallint PRIMARY KEY, 
    ciutat character varying(15) NOT NULL,
    regio character varying(10) NOT NULL,
    director smallint,
    objectiu numeric(9,2),
    vendes numeric(9,2)
);


CREATE TABLE repvenda (
    repcod smallint PRIMARY KEY, 
    nom character varying(30) NOT NULL,
    edat smallint,
    ofinum smallint REFERENCES OFICINA(OFINUM) on delete set NULL,
    lloctreball character varying(20),
    datacontracte date NOT NULL,
    jefe smallint,
    quota numeric(8,2),
    vendes numeric(8,2),
    CONSTRAINT CK_REPVENDA_NOM CHECK(NOM = INITCAP(NOM)),
    CONSTRAINT CK_REPVENDA_EDAT CHECK(EDAT>0),
    CONSTRAINT CK_REPVENDA_VENDES CHECK(VENDES>0),
    CONSTRAINT CK_REPVENDA_QUOTA CHECK(QUOTA>0)
);

CREATE TABLE client (
    cliecod smallint CONSTRAINT PK_CLIENT_CLIECOD PRIMARY KEY,
    nom character varying(20) NOT NULL,
    repcod smallint NOT NULL default 106 REFERENCES REPVENDA(REPCOD) on delete set default,
    limcred numeric(8,2) 
);

CREATE TABLE comanda (
    comnum integer CONSTRAINT PK_COMANDA_COMNUM PRIMARY KEY ,
    data date NOT NULL,
    cliecod smallint NOT NULL,
    repcod smallint,
    fabcod character(3) NOT NULL,
    prodcod character(5) NOT NULL,
    quant smallint NOT NULL,
    import numeric(7,2) NOT NULL,
    CONSTRAINT FK_COMANDA_FP FOREIGN KEY(FABCOD,PRODCOD) REFERENCES PRODUCTE(FABCOD,PRODCOD) on delete restrict,
    CONSTRAINT FK_COMANDA_REPCOD FOREIGN KEY(REPCOD) REFERENCES REPVENDA(REPCOD),
    CONSTRAINT FK_COMANDA_CLIECOD FOREIGN KEY(CLIECOD) REFERENCES CLIENT(CLIECOD) on delete cascade
);




insert into producte (fabcod, prodcod, descrip, preu, exist) values
('rei','2a45c','Ratón gaming',79.00,210),
('aci','4100y','MacBook Air 886',2750.00,25),
('qsa','xk47','Robot limpiacristales',355.00,38),
('bic','41672','Portátil - NOTEBOOK',180.00,0),
('imm','779c','TV OLED 55',1875.00,9),
('aci','41003','AirPods 3',107.00,207),
('aci','41004','Magic Mouse 4',117.00,139),
('bic','41003','Asus Vivobool',652.00,3),
('imm','887p','Portátil - HP Chromebook',250.00,24),
('qsa','xk48','Teclado gaming',134.00,203),
('rei','2a44l','MacBook Pro',4500.00,12),
('fea','112','TV LED 40',148.00,115),
('imm','887h','Mando - Sony PS5',54.00,223),
('bic','41089','Silla gaming',225.00,78),
('aci','41001','Cafetera de cápsulas',55.00,277),
('imm','775c','ROBOT ROOMBA',1425.00,5),
('aci','4100z','Frigorífico combi',2500.00,28),
('qsa','xk48a','TV DLED 32p',117.00,37),
('aci','41002','Cafetera express',76.00,167),
('rei','2a44r','Portátil gaming',4500.00,12),
('imm','773c','Galaxy S23 Ultra',975.00,28),
('aci','4100x','Batidora de mano',25.00,37),
('fea','114','Galaxy A23',243.00,15),
('imm','887x','Xiaomi 13T',475.00,32),
('rei','2a44g','Xiaomi Redmi Note 12',350.00,14);



insert into oficina (ofinum, ciutat, regio, director, objectiu, vendes) values
(22,'Denver','Oeste',108,300000.00,186042.00),
(11,'New York','Este',106,575000.00,692637.00),
(12,'Chicago','Este',104,800000.00,735042.00),
(13,'Atlanta','Este',105,350000.00,367911.00),
(21,'Los Angeles','Oeste',108,725000.00,835915.00);



insert into repvenda (repcod, nom, edat, ofinum, lloctreball, datacontracte, jefe, quota, vendes) values
(105,'Bill Adams',37,13,'Representante Ventas','2018-02-12',104,350000.00,367911.00),
(109,'Mary Jones',31,11,'Representante Ventas','2019-10-12',106,300000.00,392725.00),
(102,'Sue Smith',48,21,'Representante Ventas','2016-12-10',108,350000.00,474050.00),
(106,'Sam Clark',52,11,'VP Ventas','2018-06-14',NULL,275000.00,299912.00),
(104,'Bob Smith',33,12,'Dir Ventas','2017-05-19',106,200000.00,142594.00),
(101,'Dan Roberts',45,12,'Representante Ventas','2016-10-20',104,300000.00,305673.00),
(110,'Tom Snyder',41,NULL,'Representante Ventas','2020-01-13',101,NULL,75985.00),
(108,'Larry Fitch',62,21,'Dir Ventas','2019-10-12',106,350000.00,361865.00),
(103,'Paul Cruz',29,12,'Representante Ventas','2017-03-01',104,275000.00,286775.00),
(107,'Nancy Angelli',49,22,'Representante Ventas','2018-11-14',108,300000.00,186042.00);



insert into client (cliecod, nom, repcod, limcred) values
(2111,'JCP Inc.',103,50000.00),
(2102,'First Corp.',101,65000.00),
(2103,'Acme Mfg.',105,50000.00),
(2123,'Carter & Sons',102,40000.00),
(2107,'Ace International',110,35000.00),
(2115,'Smithson Corp.',101,20000.00),
(2101,'Jones Mfg.',106,65000.00),
(2112,'Zetacorp',108,50000.00),
(2121,'QMA Assoc.',103,45000.00),
(2114,'Orion Corp',102,20000.00),
(2124,'Peter Brothers',107,40000.00),
(2108,'Holm & Landis',109,55000.00),
(2117,'J.P. Sinclair',106,35000.00),
(2122,'Three-Way Lines',105,30000.00),
(2120,'Rico Enterprises',102,50000.00),
(2106,'Fred Lewis Corp.',102,65000.00),
(2119,'Solomon Inc.',109,25000.00),
(2118,'Midwest Systems',108,60000.00),
(2113,'Ian & Schmidt',104,20000.00),
(2109,'Chen Associates',103,25000.00),
(2105,'AAA Investments',101,45000.00);



insert into comanda (comnum, data, cliecod, repcod, fabcod, prodcod, quant, import) values
(112961,'2019-12-17',2117,106,'rei','2a44l',7,31500.00),
(113012,'2020-01-11',2111,105,'aci','41003',35,3745.00),
(112989,'2020-01-03',2101,106,'fea','114',6,1458.00),
(113051,'2020-02-10',2118,108,'qsa','xk47',4,1420.00),
(112968,'2019-10-12',2102,101,'aci','41004',34,3978.00),
(110036,'2020-01-30',2107,110,'aci','4100z',9,22500.00),
(113045,'2020-02-02',2112,108,'rei','2a44r',10,45000.00),
(112963,'2019-12-17',2103,105,'aci','41004',28,3276.00),
(113013,'2020-01-14',2118,108,'bic','41003',1,652.00),
(113058,'2020-02-23',2108,109,'fea','112',10,1480.00),
(112997,'2020-01-08',2124,107,'bic','41003',1,652.00),
(112983,'2019-12-27',2103,105,'aci','41004',6,702.00),
(113024,'2020-01-20',2114,108,'qsa','xk47',20,7100.00),
(113062,'2020-02-24',2124,107,'fea','114',10,2430.00),
(112979,'2019-10-12',2114,102,'aci','4100z',6,15000.00),
(113027,'2020-01-22',2103,105,'aci','41002',54,4104.00),
(113007,'2020-01-08',2112,108,'imm','773c',3,2925.00),
(113069,'2020-03-02',2109,107,'imm','775c',22,31350.00),
(113034,'2020-01-29',2107,110,'rei','2a45c',8,632.00),
(112992,'2019-11-04',2118,108,'aci','41002',10,760.00),
(112975,'2019-12-12',2111,103,'rei','2a44g',6,2100.00),
(113055,'2020-02-15',2108,101,'aci','4100x',6,150.00),
(113048,'2020-02-10',2120,102,'imm','779c',2,3750.00),
(112993,'2019-01-04',2106,102,'rei','2a45c',24,1896.00),
(113065,'2020-02-27',2106,102,'qsa','xk47',6,2130.00),
(113003,'2020-01-25',2108,109,'imm','779c',3,5625.00),
(113049,'2020-02-10',2118,108,'qsa','xk47',2,776.00),
(112987,'2019-12-31',2103,105,'aci','4100y',11,27500.00),
(113057,'2020-02-18',2111,103,'aci','4100x',24,600.00),
(113042,'2020-02-02',2113,101,'rei','2a44r',5,22500.00);



ALTER TABLE OFICINA ADD CONSTRAINT FK_OFICINA_DIRECTOR FOREIGN KEY(DIRECTOR) REFERENCES REPVENDA(REPCOD);
ALTER TABLE REPVENDA ADD CONSTRAINT FK_REPVENDA_JEFE FOREIGN KEY(JEFE) REFERENCES REPVENDA(REPCOD);
