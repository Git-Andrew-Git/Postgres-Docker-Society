-- Afficher toutes les informations concernant les départements
select * from employee;

-- 
select employee.id from employee;

-- Afficher le nom, la date d'embauche, le numéro du supérieur, le numéro de
-- département et le salaire de tous les employés.
select last_name as "ln", hiring_date as "hd", superior_id as "si", department_id as "di", salary as "s" from employee e;

-- supprimer les doublons, d'où utilisation de la clause « DISTINCT »
select distinct superior_id from employee;

-- Afficher le titre de tous les employé.e.s
select title from employee;

-- Afficher les différentes valeurs des titres des employés
select distinct title from employee;

--Afficher toutes les informations des salariés ayant un salaire supérieur à
--25000.
select salary from employee e where salary > '25000';

--Afficher le nom, le numéro d'employé et le numéro du département des
--employés dont le titre est « Secrétaire ».
select last_name, id, department_id from EMPLOYEE E WHERE title LIKE 'secrétaire';

--#Afficher le nom et le numéro de département dont le numéro de
--département est supérieur à 
select name, id from DEPARTMENT D WHERE id > 40;

--Afficher le nom et le prénom des employés dont le nom est alphabétiquement
--antérieur au prénom.
SELECT last_name, first_name from EMPLOYEE E WHERE left(last_name, 1) < left(first_name, 1);

--Afficher le nom, le salaire et le numéro du département des employés dont le
--titre est « Représentant », le numéro de département est 35 et le salaire est
--supérieur à 20000
select last_name, salary, department_id from EMPLOYEE E where title like 'représentant' and department_id = 35 and salary > 20000;

--Afficher le nom, le titre et le salaire des employés dont le titre est «
--Représentant » ou dont le titre est « Président ».
select last_name, title, salary from employee where title like 'représentant' or title like 'président';

--Afficher le nom, le titre, le numéro de département, le salaire des employés du
--département 34, dont le titre est « Représentant » ou « Secrétaire ».
select last_name, title, department_id, salary from EMPLOYEE E WHERE department_id = 34 and (title = 'représentant' or title = 'secrétaire');

--Afficher le nom, le titre, le numéro de département, le salaire des employés
--dont le titre est Représentant, ou dont le titre est « Secrétaire » dans le
--département numéro 34.
select last_name, title, department_id, salary from EMPLOYEE E WHERE title = 'représentant' or (title = 'secrétaire' and E.DEPARTMENT_ID = 34);

--Afficher le nom, et le salaire des employés dont le salaire est compris
--entre 20000 et 30000.
select last_name, salary from EMPLOYEE E where salary between 20000 and 30000;

--Afficher le nom des employés commençant par la lettre « H »
select last_name from employee where last_name like 'h%'; 

--Afficher le nom des employés se terminant par la lettre « n ».
select last_name from employee where last_name like '%n';

--Afficher le nom des employés contenant la lettre « u » en 3ème
--position
select last_name from employee where last_name like '__u%';

--Afficher le salaire et le nom des employés du service 41 classés par salaire
--croissant.
select salary, last_name from EMPLOYEE E where department_id = 41 order by salary asc;

--Afficher le salaire et le nom des employés du service 41 classés par salaire
--décroissant.
select salary, last_name from EMPLOYEE E where department_id = 41 order by salary desc;

--Afficher le titre, le salaire et le nom des employés classés par titre croissant et
--par salaire décroissant.
select title, salary, last_name from EMPLOYEE E order by title asc, salary desc;

-- Afficher le taux de commission, le salaire et le nom des employés classés par
--taux de commission croissante
select commission_rate, salary, last_name from EMPLOYEE E order by  COMMISSION_RATE ;

-- Afficher le nom, le salaire, le taux de commission et le titre des employés dont
--le taux de commission est renseigné.
select last_name, salary, commission_rate from EMPLOYEE E where COMMISSION_RATE is not null order by COMMISSION_RATE ;


-- Afficher le nom, le salaire, le taux de commission et le titre des employés dont
--le taux de commission n'est pas renseigné.
select last_name, salary, commission_rate from EMPLOYEE E where COMMISSION_RATE is null order by COMMISSION_RATE ;

-- Afficher le nom, le salaire, le taux de commission, le titre des employés dont le
--taux de commission est inférieur à 15.
select last_name, salary, commission_rate from EMPLOYEE E where commission_rate < 15;

--Afficher le nom, le salaire, le taux de commission, le titre des employés dont le
--taux de commission est supérieur à 15.
select last_name, salary, commission_rate from EMPLOYEE E where commission_rate > 15;

--Afficher le nom, le salaire, le taux de commission et la commission des
--employés dont le taux de commission n'est pas nul. (la commission est
--calculée en multipliant le salaire par le taux de commission).
select last_name, salary, commission_rate, commission_rate * salary as commission from EMPLOYEE E where commission_rate * salary is not null;

--Afficher le nom, le salaire, le taux de commission, la commission des
--employés dont le taux de commission n'est pas nul, classé par taux de
--commission croissant.
select last_name, salary, commission_rate, commission_rate * salary as commission from EMPLOYEE E where commission_rate is not null order by COMMISSION_RATE ;

--Afficher le nom et le prénom (concaténés) des employés. Renommer les
--colonnes.
select CONCAT(last_name, first_name) as noms_concatenes from employee;

--Afficher les 5 premières lettres du nom des employés
select substring(last_name, 1, 5) from EMPLOYEE E ; 

--Afficher le nom et le rang de la lettre « r » dans le nom des
--employés.
select last_name, position('r' in last_name) as position_for_r from employee;

--Afficher le nom, le nom en majuscule et le nom en minuscule de
--l'employé dont le nom est « Vrante ».
select last_name, UPPER(last_name), LOWER(last_name) from EMPLOYEE E where last_name like 'vrante';

--Afficher le nom et le nombre de caractères du nom des employés.
select last_name, length(last_name) as number from EMPLOYEE E ;

