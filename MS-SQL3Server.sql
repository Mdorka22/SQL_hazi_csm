CREATE TABLE Idopont (
    id INT PRIMARY KEY,
    datum DATE NOT NULL,
    ora_kezdete VARCHAR(6) NOT NULL,
    ora_vege VARCHAR(6) NOT NULL,
    nap VARCHAR(10) NOT NULL
);

CREATE TABLE Oktatok (
    id INT PRIMARY KEY,
    nev VARCHAR(100) NOT NULL,
    nem CHAR(1),
    varos VARCHAR(60) NOT NULL,
    kor INT CHECK(kor <= 100 AND kor >= 18),
    email VARCHAR(100) UNIQUE NOT NULL
);

CREATE TABLE Auto (
    id INT PRIMARY KEY,
    rendszam VARCHAR(10) UNIQUE NOT NULL,
    marka VARCHAR(50) NOT NULL,
    tipus VARCHAR(50) NOT NULL,
    szin VARCHAR(50),
    manualis BIT NOT NULL,
    uzemanyag VARCHAR(50),
    oktato_id INT UNIQUE NOT NULL,
    FOREIGN KEY (oktato_id) REFERENCES Oktatok(id)
);

CREATE TABLE Ora_ara(
    id INT PRIMARY KEY,
    oktato_id INT,
    FOREIGN KEY (oktato_id) REFERENCES Oktatok(id),
    egy_ora_ara INT NOT NULL
);

CREATE TABLE Tanulok (
    id INT PRIMARY KEY,
    oktato_id INT,
    FOREIGN KEY (oktato_id) REFERENCES Oktatok(id),
    nev VARCHAR(100) NOT NULL,
    nem CHAR(1),
    varos VARCHAR(60) NOT NULL,
    kor INT CHECK( kor <= 100 AND kor >= 17),
    email VARCHAR(100) UNIQUE NOT NULL
);

CREATE TABLE Ora (
    id INT PRIMARY KEY,
    oktato_id INT,
    FOREIGN KEY (oktato_id) REFERENCES Oktatok(id),
    tanulo_id INT,
    FOREIGN KEY (tanulo_id) REFERENCES Tanulok(id),
    idopont_id INT,
    FOREIGN KEY (idopont_id) REFERENCES Idopont(id)
);

CREATE TABLE Vizsga (
    id INT PRIMARY KEY,
    ora_id INT UNIQUE NOT NULL,
    FOREIGN KEY (ora_id) REFERENCES Ora(id),
    pontszam INT DEFAULT 0 CHECK(pontszam >= 0 AND pontszam <= 100),
    atment BIT DEFAULT 0,
    hanyadik_vizsga INT NOT NULL
);




INSERT INTO Idopont (id, datum, ora_kezdete, ora_vege, nap) VALUES
(1, '2023-04-05', '09:00', '10:00', 'Hétfő'),
(2, '2023-04-06', '14:30', '15:30', 'Kedd'),
(3, '2023-04-07', '11:00', '12:00', 'Szerda'),
(4, '2023-04-08', '13:45', '14:45', 'Csütörtök'),
(5, '2023-04-09', '10:15', '11:15', 'Péntek'),
(6, '2023-04-10', '08:30', '09:30', 'Szombat'),
(7, '2023-04-11', '16:00', '17:00', 'Vasárnap'),
(8, '2023-04-12', '12:30', '13:30', 'Hétfő'),
(9, '2023-04-13', '10:45', '11:45', 'Kedd'),
(10, '2023-04-14', '15:20', '16:20', 'Szerda'),
(11, '2023-04-15', '09:00', '10:00', 'Csütörtök'),
(12, '2023-04-16', '14:30', '15:30', 'Péntek'),
(13, '2023-04-17', '11:00', '12:00', 'Szombat'),
(14, '2023-04-18', '13:45', '14:45', 'Vasárnap'),
(15, '2023-04-19', '10:15', '11:15', 'Hétfő'),
(16, '2023-04-20', '08:30', '09:30', 'Kedd'),
(17, '2023-04-21', '16:00', '17:00', 'Szerda'),
(18, '2023-04-22', '12:30', '13:30', 'Csütörtök'),
(19, '2023-04-23', '10:45', '11:45', 'Péntek'),
(20, '2023-04-24', '15:20', '16:20', 'Szombat'),
(21, '2023-04-25', '09:00', '10:00', 'Vasárnap'),
(22, '2023-04-26', '14:30', '15:30', 'Hétfő'),
(23, '2023-04-27', '11:00', '12:00', 'Kedd'),
(24, '2023-04-28', '13:45', '14:45', 'Szerda'),
(25, '2023-04-29', '10:15', '11:15', 'Csütörtök'),
(26, '2023-04-30', '08:30', '09:30', 'Péntek'),
(27, '2023-05-01', '16:00', '17:00', 'Szombat'),
(28, '2023-05-02', '12:30', '13:30', 'Vasárnap'),
(29, '2023-05-03', '10:45', '11:45', 'Hétfő'),
(30, '2023-05-04', '15:20', '16:20', 'Kedd'),
(31, '2023-05-05', '09:00', '10:00', 'Szerda'),
(32, '2023-05-06', '14:30', '15:30', 'Csütörtök'),
(33, '2023-05-07', '11:00', '12:00', 'Péntek'),
(34, '2023-05-08', '13:45', '14:45', 'Szombat'),
(35, '2023-05-09', '10:15', '11:15', 'Vasárnap'),
(36, '2023-05-10', '08:30', '09:30', 'Hétfő'),
(37, '2023-05-11', '16:00', '17:00', 'Kedd'),
(38, '2023-05-12', '12:30', '13:30', 'Szerda'),
(39, '2023-05-13', '10:45', '11:45', 'Csütörtök'),
(40, '2023-05-14', '15:20', '16:20', 'Péntek'),
(41, '2023-05-15', '09:00', '10:00', 'Szombat'),
(42, '2023-05-16', '14:30', '15:30', 'Vasárnap'),
(43, '2023-05-17', '11:00', '12:00', 'Hétfő'),
(44, '2023-05-18', '13:45', '14:45', 'Kedd'),
(45, '2023-05-19', '10:15', '11:15', 'Szerda'),
(46, '2023-05-20', '08:30', '09:30', 'Csütörtök'),
(47, '2023-05-21', '16:00', '17:00', 'Péntek'),
(48, '2023-05-22', '12:30', '13:30', 'Szombat'),
(49, '2023-05-23', '10:45', '11:45', 'Vasárnap'),
(50, '2023-05-24', '15:20', '16:20', 'Hétfő'),
(51, '2023-05-25', '09:00', '10:00', 'Kedd'),
(52, '2023-05-26', '14:30', '15:30', 'Szerda'),
(53, '2023-05-27', '11:00', '12:00', 'Csütörtök'),
(54, '2023-05-28', '13:45', '14:45', 'Péntek'),
(55, '2023-05-29', '10:15', '11:15', 'Szombat'),
(56, '2023-05-30', '08:30', '09:30', 'Vasárnap'),
(57, '2023-05-31', '16:00', '17:00', 'Hétfő'),
(58, '2023-06-01', '12:30', '13:30', 'Kedd'),
(59, '2023-06-02', '10:45', '11:45', 'Szerda'),
(60, '2023-06-03', '15:20', '16:20', 'Csütörtök');

INSERT INTO Oktatok (id, nev, nem, varos, kor, email) VALUES
(1, 'Kovács János', 'F', 'Budapest', 45, 'kovacs.janos1@gmail.com'),
(2, 'Nagy Katalin', 'N', 'Debrecen', 38, 'nagy.katalin2@gmail.com'),
(3, 'Szabó Péter', 'F', 'Szeged', 52, 'szabo.peter3@gmail.com'),
(4, 'Tóth Zsolt', 'F', 'Miskolc', 41, 'toth.zsolt4@gmail.com'),
(5, 'Horváth Éva', 'N', 'Pécs', 29, 'horvath.eva5@gmail.com'),
(6, 'Kiss Anna', 'N', 'Győr', 36, 'kiss.anna6@gmail.com'),
(7, 'Kovácsné Tamás', 'N', 'Székesfehérvár', 49, 'kovacsné.tamas7@gmail.com'),
(8, 'Nagy Balázs', 'F', 'Nyíregyháza', 43, 'nagy.balazs8@gmail.com'),
(9, 'Kiss Gábor', 'F', 'Kecskemét', 39, 'kiss.gabor9@gmail.com'),
(10, 'Tóthné Dávid', 'N', 'Szombathely', 34, 'tothne.david10@gmail.com'),
(11, 'Nagy András', 'F', 'Veszprém', 56, 'nagy.andras11@gmail.com'),
(12, 'Szabóné István', 'N', 'Zalaegerszeg', 47, 'szabone.istvan12@gmail.com'),
(13, 'Kovács Jánosné', 'N', 'Eger', 42, 'kovacsné.janos13@gmail.com'),
(14, 'Nagy Katalin', 'F', 'Sopron', 50, 'nagy.katalin14@gmail.com'),
(15, 'Kiss Péter', 'F', 'Szeged', 33, 'kiss.peter15@gmail.com'),
(16, 'Tóthné Tamás', 'N', 'Pécs', 44, 'tothne.tamas16@gmail.com'),
(17, 'Kovács István', 'F', 'Budapest', 48, 'kovacs.istvan17@gmail.com'),
(18, 'Nagy Éva', 'N', 'Debrecen', 37, 'nagy.eva18@gmail.com'),
(19, 'Szabó Gábor', 'N', 'Szeged', 51, 'szabo.gabor19@gmail.com'),
(20, 'Tóth Anna', 'F', 'Miskolc', 35, 'toth.anna20@gmail.com'),
(21, 'Horváth János', 'F', 'Pécs', 40, 'horvath.janos21@gmail.com'),
(22, 'Kiss Katalin', 'N', 'Győr', 55, 'kiss.katalin22@gmail.com'),
(23, 'Kovács János', 'F', 'Székesfehérvár', 46, 'kovacs.janos23@gmail.com'),
(24, 'Nagy Péter', 'N', 'Nyíregyháza', 32, 'nagy.peter24@gmail.com'),
(25, 'Szabó Anna', 'F', 'Kecskemét', 45, 'szabo.anna25@gmail.com'),
(26, 'Tóth Gáborné', 'N', 'Szombathely', 38, 'tothne.gabor26@gmail.com'),
(27, 'Kovács András', 'F', 'Veszprém', 54, 'kovacs.andras27@gmail.com'),
(28, 'Nagy Istvánné', 'F', 'Zalaegerszeg', 41, 'nagyistvanne28@gmail.com'),
(29, 'Szabó Gábor', 'N', 'Eger', 36, 'szabo.gabor29@gmail.com'),
(30, 'Tóth János', 'N', 'Sopron', 47, 'toth.janos30@gmail.com'),
(31, 'Kovács Éva', 'F', 'Szeged', 39, 'kovacs.eva31@gmail.com'),
(32, 'Nagy Gábor', 'F', 'Pécs', 53, 'nagy.gabor32@gmail.com'),
(33, 'Szabó Jánosné', 'N', 'Győr', 37, 'szabone.janos33@gmail.com'),
(34, 'Tóth Zsolt', 'F', 'Székesfehérvár', 42, 'toth.zsolt34@gmail.com'),
(35, 'Horváth Anna', 'N', 'Nyíregyháza', 31, 'horvath.anna35@gmail.com');

INSERT INTO Auto (id, rendszam, marka, tipus, szin, manualis, uzemanyag, oktato_id) VALUES 
(1, 'SXP-267', 'Opel', 'Astra', 'Kék', 0, 'Benzin',1), 
(2, 'QWB-321', 'Ford', 'Focus', 'Piros', 1, 'Dízel',2), 
(3, 'MNT-567', 'Toyota', 'Yaris', 'Zöld', 0, 'Hibrid',3), 
(4, 'TLJ-890', 'Suzuki', 'Swift', 'Fehér', 1, 'Benzin',4), 
(5, 'DRF-123', 'Peugeot', '208', 'Fekete', 0, 'Dízel',5), 
(6, 'VWP-456', 'Volkswagen', 'Golf', 'Szürke', 1, 'Benzin',6), 
(7, 'XMZ-789', 'Audi', 'A3', 'Kék', 0, 'Benzin',7), 
(8, 'LKU-012', 'Skoda', 'Octavia', 'Piros', 1, 'Dízel',8), 
(9, 'YSN-345', 'Citroen', 'C4', 'Zöld', 0, 'Benzin',9), 
(10, 'APQ-678', 'Renault', 'Clio', 'Fehér', 1, 'Dízel',10), 
(11, 'BWR-123', 'Opel', 'Corsa', 'Kék', 0, 'Benzin',11), 
(12, 'CSD-456', 'Ford', 'Fiesta', 'Piros', 1, 'LPG',12), 
(13, 'DET-789', 'Toyota', 'Aygo', 'Zöld', 0, 'Benzin',13), 
(14, 'FGH-012', 'Suzuki', 'SX4', 'Fehér', 1, 'Benzin+Gáz',14), 
(15, 'GIU-345', 'Peugeot', '308', 'Fekete', 0, 'Dízel',15), 
(16, 'JKL-678', 'Volkswagen', 'Polo', 'Szürke', 1, 'Benzin',16), 
(17, 'MNO-012', 'Audi', 'A4', 'Kék', 0, 'Benzin',17), 
(18, 'PQR-345', 'Skoda', 'Fabia', 'Piros', 1, 'Dízel',18), 
(19, 'STU-678', 'Citroen', 'Berlingo', 'Zöld', 0, 'Benzin',19), 
(20, 'VWX-123', 'Renault', 'Megane', 'Fehér', 1, 'Dízel',20), 
(21, 'YXZ-456', 'Opel', 'Insignia', 'Kék', 0, 'Benzin',21), 
(22, 'ABC-789', 'Ford', 'Mondeo', 'Piros', 1, 'Dízel',22), 
(23, 'DEF-012', 'Toyota', 'RAV4', 'Zöld', 0, 'Hibrid',23), 
(24, 'GHI-345', 'Suzuki', 'Vitara', 'Fehér', 1, 'Benzin',24), 
(25, 'LKP-678', 'Peugeot', '508', 'Fekete', 0, 'Dízel',25), 
(26, 'MNP-012', 'Volkswagen', 'Passat', 'Szürke', 1, 'Benzin',26), 
(27, 'PQS-345', 'Audi', 'A6', 'Kék', 0, 'Benzin',27), 
(28, 'STT-678', 'Skoda', 'Superb', 'Piros', 1, 'Dízel',28), 
(29, 'VPP-123', 'Citroen', 'C5 Aircross', 'Zöld', 0, 'Benzin',29), 
(30, 'YXX-456', 'Renault', 'Kadjar', 'Fehér', 1, 'Dízel',30), 
(31, 'ABB-789', 'Dacia', 'Sandero', 'Kék', 0, 'LPG',31), 
(32, 'DFF-012', 'Hyundai', 'i30', 'Piros', 1, 'Benzin',32), 
(33, 'GGH-345', 'Kia', 'Ceed', 'Zöld', 0, 'Benzin+Gáz',33), 
(34, 'KLL-678', 'Seat', 'Ibiza', 'Fekete', 1, 'Dízel',34), 
(35, 'MNP-032', 'SsangYong', 'Tivoli', 'Szürke', 0, 'Benzin',35);
INSERT INTO Ora_ara (id, oktato_id, egy_ora_ara) VALUES
(1, 1, 3000),
(2, 2, 3200),
(3, 3, 2800),
(4, 4, 3100),
(5, 5, 2900),
(6, 6, 3000),
(7, 7, 3200),
(8, 8, 3000),
(9, 9, 3100),
(10, 10, 2900),
(11, 11, 3100),
(12, 12, 3200),
(13, 13, 3000),
(14, 14, 2800),
(15, 15, 3000),
(16, 16, 3100),
(17, 17, 2900),
(18, 18, 2800),
(19, 19, 3100),
(20, 20, 3000),
(21, 21, 3200),
(22, 22, 3100),
(23, 23, 3000),
(24, 24, 2900),
(25, 25, 3100),
(26, 26, 3200),
(27, 27, 3000),
(28, 28, 2800),
(29, 29, 3000),
(30, 30, 3100),
(31, 31, 2900),
(32, 32, 2800),
(33, 33, 3100),
(34, 34, 3000),
(35, 35, 3200);

INSERT INTO Tanulok (id, oktato_id, nev, nem, varos, kor, email) VALUES
(1, 1, 'Kiss Andrea', 'N', 'Budapest', 27, 'kiss.andrea456@gmail.com'),
(2, 2, 'Nagy Gergő', 'F', 'Debrecen', 34, 'nagy.gergo789@gmail.com'),
(3, 3, 'Tóth Ágnes', 'N', 'Szeged', 22, 'toth.agnes123@gmail.com'),
(4, 4, 'Kovács Péter', 'F', 'Miskolc', 29, 'kovacs.peter345@gmail.com'),
(5, 5, 'Szabó Eszter', 'N', 'Pécs', 31, 'szabo.eszter678@gmail.com'),
(6, 6, 'Varga Tamás', 'F', 'Győr', 25, 'varga.tamas901@gmail.com'),
(7, 7, 'Horváth Anna', 'N', 'Székesfehérvár', 38, 'horvath.anna234@gmail.com'),
(8, 8, 'Molnár Balázs', 'F', 'Nyíregyháza', 26, 'molnar.balazs567@gmail.com'),
(9, 9, 'Farkas Katalin', 'N', 'Kecskemét', 33, 'farkas.katalin890@gmail.com'),
(10, 10, 'Kiss Bence', 'F', 'Szombathely', 30, 'kiss.bence012@gmail.com'),
(11, 11, 'Nagy Zsuzsa', 'N', 'Veszprém', 28, 'nagy.zsuzsa345@gmail.com'),
(12, 12, 'Tóth Gábor', 'F', 'Zalaegerszeg', 35, 'toth.gabor678@gmail.com'),
(13, 13, 'Kovács Judit', 'N', 'Eger', 24, 'kovacs.judit901@gmail.com'),
(14, 14, 'Nagy Dávid', 'F', 'Sopron', 32, 'nagy.david234@gmail.com'),
(15, 15, 'Szabó Anna', 'N', 'Szeged', 29, 'szabo.anna567@gmail.com'),
(16, 16, 'Kiss Péter', 'F', 'Pécs', 36, 'kiss.peter890@gmail.com'),
(17, 17, 'Tóth Éva', 'N', 'Budapest', 23, 'toth.eva123@gmail.com'),
(18, 18, 'Nagy János', 'F', 'Debrecen', 31, 'nagy.janos456@gmail.com'),
(19, 19, 'Szabó Gábor', 'F', 'Szeged', 27, 'szabo.gabor789@gmail.com'),
(20, 20, 'Kiss Eszter', 'N', 'Miskolc', 34, 'kiss.eszter012@gmail.com'),
(21, 21, 'Nagy Bence', 'F', 'Pécs', 25, 'nagy.bence234@gmail.com'),
(22, 22, 'Tóth Eszter', 'N', 'Győr', 32, 'toth.eszter567@gmail.com'),
(23, 23, 'Kovács Péterné', 'N', 'Székesfehérvár', 26, 'kovacsn.peterne890@gmail.com'),
(24, 24, 'Nagy Eszter', 'N', 'Nyíregyháza', 33, 'nagy.eszter901@gmail.com'),
(25, 25, 'Szabó Tamás', 'F', 'Kecskemét', 28, 'szabo.tamas234@gmail.com'),
(26, 26, 'Kiss Anna', 'N', 'Szombathely', 35, 'kiss.anna567@gmail.com'),
(27, 27, 'Nagy Gábor', 'F', 'Veszprém', 24, 'nagy.gabor890@gmail.com'),
(28, 28, 'Tóth Éva', 'N', 'Zalaegerszeg', 30, 'toth.eva012@gmail.com'),
(29, 29, 'Szabó Zsuzsa', 'N', 'Eger', 29, 'szabo.zsuzsa234@gmail.com'),
(30, 30, 'Kiss Gábor', 'F', 'Sopron', 36, 'kiss.gabor567@gmail.com'),
(31, 31, 'Nagy Judit', 'N', 'Szeged', 25, 'nagy.judit890@gmail.com'),
(32, 32, 'Tóth János', 'F', 'Pécs', 32, 'toth.janos123@gmail.com'),
(33, 33, 'Kovács Anna', 'N', 'Budapest', 27, 'kovacs.anna456@gmail.com'),
(34, 34, 'Nagy Bence', 'F', 'Debrecen', 31, 'nagy.bence789@gmail.com'),
(35, 35, 'Szabó Eszter', 'N', 'Szeged', 26, 'szabo.eszter012@gmail.com'),
(36, 1, 'Molnár Gergő', 'F', 'Budapest', 29, 'molnar.gergo234@gmail.com'),
(37, 2, 'Farkas Zsuzsa', 'N', 'Debrecen', 34, 'farkas.zsuzsa567@gmail.com'),
(38, 3, 'Kiss Péter', 'F', 'Szeged', 22, 'kiss.peter895@gmail.com'),
(39, 4, 'Nagy Judit', 'N', 'Miskolc', 29, 'nagy.judit901@gmail.com'),
(40, 5, 'Tóth Bence', 'F', 'Pécs', 31, 'toth.bence234@gmail.com'),
(41, 6, 'Kovács Zsuzsa', 'N', 'Győr', 25, 'kovacs.zsuzsa69@gmail.com'),
(42, 7, 'Nagy Balázs', 'F', 'Székesfehérvár', 38, 'nagy.balazs890@gmail.com'),
(43, 8, 'Szabó Katalin', 'N', 'Nyíregyháza', 26, 'szabo.katalin123@gmail.com'),
(44, 9, 'Kiss Dávid', 'F', 'Kecskemét', 33, 'kiss.david456@gmail.com'),
(45, 10, 'Nagy Eszter', 'N', 'Szombathely', 30, 'nagy.eszter789@gmail.com'),
(46, 11, 'Tóth András', 'F', 'Veszprém', 28, 'toth.andras012@gmail.com'),
(47, 12, 'Kovács Ágnes', 'N', 'Zalaegerszeg', 35, 'kovacs.agnes345@gmail.com'),
(48, 13, 'Nagy Zoltán', 'F', 'Eger', 24, 'nagy.zoltan678@gmail.com'),
(49, 14, 'Szabó Anna', 'N', 'Sopron', 32, 'szabo.anna901@gmail.com'),
(50, 15, 'Kiss Gábor', 'F', 'Szeged', 29, 'kiss.gabor234@gmail.com'),
(51, 16, 'Nagy Éva', 'N', 'Pécs', 36, 'nagy.eva567@gmail.com'),
(52, 17, 'Tóth Péter', 'F', 'Budapest', 23, 'toth.peter890@gmail.com'),
(53, 18, 'Kovács Anna', 'N', 'Debrecen', 31, 'kovacs.anna012@gmail.com'),
(54, 19, 'Nagy Bence', 'F', 'Szeged', 27, 'nagy.bence345@gmail.com'),
(55, 20, 'Szabó Eszter', 'N', 'Miskolc', 34, 'szabo.eszter6969@gmail.com'),
(56, 21, 'Kiss András', 'F', 'Pécs', 25, 'kiss.andras901@gmail.com'),
(57, 22, 'Nagy Zsuzsa', 'N', 'Győr', 32, 'nagy.zsuzsa123@gmail.com'),
(58, 23, 'Tóth Péter', 'F', 'Székesfehérvár', 26, 'toth.peter456@gmail.com'),
(59, 24, 'Kovács Anna', 'N', 'Nyíregyháza', 33, 'kovacs.anna789@gmail.com'),
(60, 25, 'Nagy Bence', 'F', 'Kecskemét', 28, 'nagy.bence012@gmail.com'),
(61, 26, 'Szabó Eszter', 'N', 'Szombathely', 35, 'szabo.eszter345@gmail.com'),
(62, 27, 'Kiss Gábor', 'F', 'Veszprém', 24, 'kiss.gabor678@gmail.com'),
(63, 28, 'Nagy Anna', 'N', 'Zalaegerszeg', 30, 'nagy.anna901@gmail.com'),
(64, 29, 'Tóth Ádám', 'F', 'Eger', 29, 'toth.adam234@gmail.com'),
(65, 30, 'Kovács Zsuzsa', 'N', 'Sopron', 36, 'kovacs.zsuzsa567@gmail.com'),
(66, 31, 'Nagy Bence', 'F', 'Szeged', 25, 'nagy.bence890@gmail.com'),
(67, 32, 'Tóth Eszter', 'N', 'Pécs', 32, 'toth.eszter123@gmail.com'),
(68, 33, 'Kiss Péter', 'F', 'Budapest', 27, 'kiss.peter456@gmail.com'),
(69, 34, 'Nagy Anna', 'N', 'Debrecen', 31, 'nagy.anna789@gmail.com'),
(70, 35, 'Szabó Dávid', 'F', 'Szeged', 26, 'szabo.david012@gmail.com'),
(71, 1, 'Kiss Ágnes', 'N', 'Budapest', 29, 'kiss.agnes234@gmail.com'),
(72, 2, 'Nagy Péter', 'F', 'Debrecen', 34, 'nagy.peter567@gmail.com'),
(73, 3, 'Tóth Anna', 'N', 'Szeged', 22, 'toth.anna890@gmail.com'),
(74, 4, 'Kovács Gábor', 'F', 'Miskolc', 29, 'kovacs.gabor123@gmail.com'),
(75, 5, 'Szabó Zsuzsa', 'N', 'Pécs', 31, 'szabo.zsuzsa696969@gmail.com'),
(76, 6, 'Varga Bence', 'F', 'Győr', 25, 'varga.bence789@gmail.com'),
(77, 7, 'Horváth Anna', 'N', 'Székesfehérvár', 38, 'horvath.anna012@gmail.com'),
(78, 8, 'Molnár Dávid', 'F', 'Nyíregyháza', 26, 'molnar.david345@gmail.com'),
(79, 9, 'Farkas Zsuzsa', 'N', 'Kecskemét', 33, 'farkas.zsuzsa678@gmail.com'),
(80, 10, 'Kiss Péter', 'F', 'Szombathely', 30, 'kiss.peter901@gmail.com'),
(81, 11, 'Nagy Eszter', 'N', 'Veszprém', 28, 'nagy.eszter234@gmail.com'),
(82, 12, 'Tóth Gábor', 'F', 'Zalaegerszeg', 35, 'toth.gabor567@gmail.com'),
(83, 13, 'Kovács Judit', 'N', 'Eger', 24, 'kovacs.judit890@gmail.com'),
(84, 14, 'Nagy Dávid', 'F', 'Sopron', 32, 'nagy.david123@gmail.com'),
(85, 15, 'Szabó Anna', 'N', 'Szeged', 29, 'szabo.anna456@gmail.com'),
(86, 16, 'Kiss Gábor', 'F', 'Pécs', 36, 'kiss.gabor789@gmail.com'),
(87, 17, 'Tóth Éva', 'N', 'Budapest', 23, 'toth.eva901@gmail.com'),
(88, 18, 'Nagy János', 'F', 'Debrecen', 31, 'nagy.janos234@gmail.com'),
(89, 19, 'Szabó Gábor', 'F', 'Szeged', 27, 'szabo.gabor567@gmail.com'),
(90, 20, 'Kiss Eszter', 'N', 'Miskolc', 34, 'kiss.eszter890@gmail.com'),
(91, 21, 'Nagy Bence', 'F', 'Pécs', 25, 'nagy.bence123@gmail.com'),
(92, 22, 'Tóth Eszter', 'N', 'Győr', 32, 'toth.eszter456@gmail.com'),
(93, 23, 'Kovács Péter', 'F', 'Székesfehérvár', 26, 'kovacs.peter789@gmail.com'),
(94, 24, 'Nagy Eszter', 'N', 'Nyíregyháza', 33, 'nagy.eszter012@gmail.com'),
(95, 25, 'Szabó Tamás', 'F', 'Kecskemét', 28, 'szabo.tamas345@gmail.com'),
(96, 26, 'Kiss Anna', 'N', 'Szombathely', 35, 'kiss.anna678@gmail.com'),
(97, 27, 'Nagy Gábor', 'F', 'Veszprém', 24, 'nagy.gabor901@gmail.com'),
(98, 28, 'Tóth Éva', 'N', 'Zalaegerszeg', 30, 'toth.eva42069@gmail.com'),
(99, 29, 'Szabó Zsuzsa', 'N', 'Eger', 29, 'szabo.zsuzsa456@gmail.com'),
(100, 30, 'Kiss Gábor', 'F', 'Sopron', 36, 'kiss.gabor0000@gmail.com');

INSERT INTO Ora (id, oktato_id, tanulo_id, idopont_id) VALUES
    (1, 5, 23, 1 ),
    (2, 12, 56, 2),
    (3, 20, 78, 3),
    (4, 31, 44, 4),
    (5, 7, 92, 5),
    (6, 14, 10, 6),
    (7, 25, 37, 7),
    (8, 35, 81, 8),
    (9, 9, 15, 9),
    (10, 17, 67, 10),
    (11, 2, 3, 11),
    (12, 11, 48, 12),
    (13, 21, 80, 13),
    (14, 32, 53, 14),
    (15, 6, 99, 15 ),
    (16, 15, 18, 16),
    (17, 26, 42, 17),
    (18, 1, 64, 18),
    (19, 10, 6, 19),
    (20, 18, 89, 20),
    (21, 3, 29, 21),
    (22, 13, 60, 22),
    (23, 22, 82, 23),
    (24, 33, 36, 24),
    (25, 8, 71, 25),
    (26, 16, 13, 26),
    (27, 27, 55, 27),
    (28, 4, 87, 28),
    (29, 19, 38, 29),
    (30, 28, 75, 30),
    (31, 34, 17, 31),
    (32, 23, 95, 32),
    (33, 5, 33, 33),
    (34, 12, 76, 34),
    (35, 20, 25, 35),
    (36, 5, 23, 36),
    (37, 12, 56, 37),
    (38, 20, 78, 38),
    (39, 31, 44, 39),
    (40, 7, 92, 40),
    (41, 14, 10, 41),
    (42, 25, 37, 42),
    (43, 35, 81, 43),
    (44, 9, 15, 44),
    (45, 17, 67, 45),
    (46, 2, 3, 46),
    (47, 11, 48, 47),
    (48, 21, 80, 48),
    (49, 32, 53, 49),
    (50, 6, 99, 50),
    (51, 15, 18, 51),
    (52, 26, 42, 52),
    (53, 1, 64, 53),
    (54, 10, 6, 54),
    (55, 18, 89, 55),
    (56, 3, 29, 56),
    (57, 13, 60, 57),
    (58, 22, 82, 58),
    (59, 33, 36, 59),
    (60, 8, 71, 60);
    
INSERT INTO Vizsga (id, ora_id, pontszam, atment, hanyadik_vizsga) VALUES
    (1, 1, 85, 1, 1),
    (2, 2, 78, 0, 1),
    (3, 3, 92, 1, 2),
    (4, 4, 70, 0, 1),
    (5, 5, 88, 1, 3),
    (6, 6, 95, 1, 2),
    (7, 7, 80, 0, 1),
    (8, 8, 75, 0, 4),
    (9, 9, 85, 1, 3),
    (10, 10, 90, 1, 2),
    (11, 11, 83, 0, 1),
    (12, 12, 79, 0, 5),
    (13, 13, 91, 1, 4),
    (14, 14, 87, 1, 3),
    (15, 15, 84, 0, 6),
    (16, 16, 93, 1, 3),
    (17, 17, 82, 0, 2),
    (18, 18, 76, 0, 7),
    (19, 19, 86, 1, 5),
    (20, 20, 89, 1, 4),
    (21, 21, 81, 0, 3),
    (22, 22, 77, 0, 8),
    (23, 23, 94, 1, 6),
    (24, 24, 90, 1, 5),
    (25, 25, 88, 1, 4);

