--Affichage de tous les employés et leur département 
SELECT * from EMPLOYEE E join DEPARTMENT D  on D.ID = E.DEPARTMENT_ID;

--Rechercher le numéro du département, le nom du département, le nom des
--employés classés par numéro de département (utilisez des alias pour les
--tables).
SELECT department_id, name, last_name from EMPLOYEE E join DEPARTMENT D on E.DEPARTMENT_ID = D.ID order by e.DEPARTMENT_ID ;

--Rechercher le nom des employés du département « Distribution ».
select last_name from EMPLOYEE E join DEPARTMENT D on D.ID = E.DEPARTMENT_ID where name like 'distribution';

--Rechercher le nom et le salaire des employés qui gagnent plus que leur
--supérieur hiérarchique, et le nom et le salaire du supérieur.
select e1.last_name, e1.salary, e2.last_name, e2.salary from EMPLOYEE E1 join EMPLOYEE E2 on e2.id = e1.SUPERIOR_ID  where e1.salary > e2.salary;

--Rechercher les employés du département « finance » en utilisant une sous-
--requête.
select * from employee e where e.DEPARTMENT_ID in (select id from department where name like 'finance');

--Rechercher le nom et le titre des employés qui ont le même titre que
--« Amartakaldire »
select last_name, title from EMPLOYEE E where title = (select title from EMPLOYEE where last_name like 'amartakaldire');

--Rechercher le nom, le salaire et le numéro de département des employés qui
--gagnent plus qu'un seul employé du département 31, classés par numéro de
--département et salaire.
select last_name, salary, department_id from employee where salary > any (select salary from EMPLOYEE E WHERE E.DEPARTMENT_ID = 31) order by (DEPARTMENT_ID, SALARY)  ;

--Rechercher le nom, le salaire et le numéro de département des employés qui
--gagnent plus que tous les employés du département 31, classés par numéro
--de département et salaire
select last_name, salary, department_id from employee where salary > all (select salary from EMPLOYEE E WHERE E.DEPARTMENT_ID = 31) order by (DEPARTMENT_ID, SALARY)  ;

--Rechercher le nom et le titre des employés du service 31 qui ont un titre que
--l'on trouve dans le département 32
select e.last_name, e.title from EMPLOYEE e  where E.DEPARTMENT_ID = 31 and e.title = any (select title from EMPLOYEE where DEPARTMENT_ID = 32);

--Rechercher le nom et le titre des employés du service 31 qui ont un titre que
--l'on ne trouve pas dans le département 32
select last_name, title from EMPLOYEE e1  where e1.DEPARTMENT_ID = 31 and e1.title != any (select e2.title from employee e2 where e2.DEPARTMENT_ID = 32);

-- Rechercher le nom, le titre et le salaire des employés qui ont le même
--titre et le même salaire que « Fairant ».
SELECT last_name, title, salary FROM EMPLOYEE WHERE (title, salary) = (SELECT title, salary FROM EMPLOYEE WHERE last_name = 'fairent');

--Rechercher le numéro de département, le nom du département, le nom des
--employés, en affichant aussi les départements dans lesquels il n'y a personne,
--classés par numéro de département.
SELECT e.department_id, d.name, e.last_name FROM DEPARTMENT D LEFT JOIN  EMPLOYEE E ON e.DEPARTMENT_ID = d.ID ORDER BY d.ID;

--Calculer la moyenne des salaires des secrétaires (requête fournie ci-dessous)
SELECT AVG(salary) FROM employee WHERE title LIKE 'secrétaire';

-- Calculer le nombre d’employé de chaque titre.
SELECT title, COUNT(title) FROM EMPLOYEE E GROUP BY title;

--Calculer la moyenne des salaires et leur somme, par région.
SELECT region_id, SUM(salary) AS "somme", AVG(salary) AS "moyenne" FROM EMPLOYEE E JOIN DEPARTMENT D ON e.DEPARTMENT_ID = d.ID GROUP BY REGION_ID ;

--Afficher les numéros des départements ayant au moins 3 employés.
SELECT department_id, COUNT(*) FROM EMPLOYEE E GROUP BY DEPARTMENT_ID HAVING count(*)>3;

--Afficher les lettres qui sont l'initiale d'au moins trois employés.
SELECT LEFT(last_name, 1), COUNT(LEFT(last_name, 1)) FROM EMPLOYEE E GROUP BY LEFT(last_name, 1) HAVING count(LEFT(last_name, 1))>=3;

-- Rechercher le salaire maximum et le salaire minimum parmi tous les
--salariés et l'écart entre les deux.
SELECT MIN(salary), MAX(salary), MAX(salary)-MIN(salary) AS "ECART" FROM EMPLOYEE E;

--Rechercher le nombre de titres différents.
SELECT COUNT(DISTINCT title) FROM employee;

--Pour chaque titre, compter le nombre d'employés possédant ce titre.
SELECT title, COUNT(title) FROM employee e GROUP BY title;

--Pour chaque nom de département, afficher le nom du département et
--le nombre d'employés.
SELECT name, COUNT(e.id) FROM employee e RIGHT JOIN DEPARTMENT D ON e.DEPARTMENT_ID = d.ID GROUP BY name;

--Rechercher les titres et la moyenne des salaires par titre dont la
--moyenne est supérieure à la moyenne des salaires des « Représentant ».
SELECT e.title, AVG(e.salary) FROM EMPLOYEE E GROUP BY e.title HAVING AVG(e.SALARY)>(SELECT AVG(e2.salary) FROM EMPLOYEE E2 WHERE e2.title LIKE 'représentant');

--Rechercher le nombre de salaires renseignés et le nombre de taux de
--commission renseignés.
SELECT COUNT(salary) AS quantity_salary, COUNT(commission_rate) AS q_cr FROM EMPLOYEE E;
