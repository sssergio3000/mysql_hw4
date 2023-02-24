create DATABASE MyJoinsDB;

USE myjoinsdb;

CREATE TABLE personnel (
id SMALLINT AUTO_INCREMENT PRIMARY KEY,
lastname VARCHAR(20) NOT NULL,
firstname VARCHAR(20) NOT NULL,
phonenumber VARCHAR(20) NOT NULL
);

CREATE TABLE company_info (
person_id SMALLINT NOT NULL,
position_name VARCHAR(50) not NULL,
salary int UNSIGNED NOT NULL,
FOREIGN KEY(person_id) REFERENCES personnel(id)
);

CREATE TABLE personal_info (
person_id SMALLINT NOT NULL,
familystate VARCHAR(30) not NULL,
birthdate date NOT NULL,
address VARCHAR(100) NOT NULL,
FOREIGN KEY(person_id) REFERENCES personnel(id)
);

INSERT INTO `myjoinsdb`.`personnel`
(`lastname`,
`firstname`,
`phonenumber`)
VALUES
('Travolta', 'John', '0987654321'),
('Jackson', 'Samuel', '0987655432'),
('Maroon', 'Frieda', '0977654321'),
('Parker', 'Skott', '0509998887');


INSERT INTO `myjoinsdb`.`personal_info`
(`person_id`,
`familystate`,
`birthdate`,
`address`)
VALUES
(1, 'single', '1987-2-15', 'London, 75 beach street'),
(2, 'married', '2000-12-14', 'Paris, 33 slut street'),
(3, 'married', '1995-08-30', 'Berlin, 12 obst strasse'),
(4, 'divorced', '1990-12-12', 'Praha, 14 beer street');


INSERT INTO `myjoinsdb`.`company_info`
(`person_id`,
`position_name`,
`salary`)
VALUES
(2, 'ceo', 12000),
(1, 'manager', 7000),
(3, 'worker', 3000),
(4, 'worker', 3500);


/*1) Получите контактные данные сотрудников (номера телефонов, место жительства)*/
select personnel.lastname, personnel.firstname, personnel.phonenumber, personal_info.address 
from personnel
join personal_info
on personnel.id = personal_info.person_id;

/* 2) Получите информацию о дате рождения всех холостых сотрудников и их номера. */
select personnel.lastname, personnel.firstname, personal_info.familystate,  
personal_info.birthdate, personnel.phonenumber
from personnel
join personal_info
on personnel.id = personal_info.person_id
where personal_info.familystate = 'single' or personal_info.familystate = 'divorced';


/*3) Получите информацию обо всех менеджерах компании: дату рождения и номер телефона. */
select personnel.lastname, personnel.firstname, company_info.position_name,  
personal_info.birthdate, personnel.phonenumber
from personnel
join company_info
on personnel.id = company_info.person_id
join personal_info
on personnel.id = personal_info.person_id
where company_info.position_name = 'manager';














