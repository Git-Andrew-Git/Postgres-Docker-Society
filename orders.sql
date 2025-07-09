--A correspond la table « order_line » ?
--La table « order_line » correspond aux donnés des produit qui étaits commondés et leurs l'ordre des livraisons.

--A quoi sert la colonne « order_id » ?
--Les produits se sont groupés car un client en peut commender plusiurs



--Récupérer l’utilisateur ayant le prénom “Muriel” et le mot de passe “test11”, sachant
--que l’encodage du mot de passe est effectué avec l’algorithme Sha1.
SELECT * FROM client c WHERE first_name='Muriel' AND PASSWORD=encode(digest('test11', 'sha1'), 'hex');

--Récupérer la liste de tous les produits qui sont présents sur plusieurs commandes.
SELECT * FROM order_line ol;

--Enregistrer le prix total à l’intérieur de chaque ligne des commandes, en fonction du
--prix unitaire et de la quantité (il vous faudra utiliser une requête de mise à jour d’une
--table : « UPDATE TABLE »
UPDATE order_line SET total_price = quantity * unit_price RETURNING *;

--Récupérer le montant total pour chaque commande et afficher la date de commande
--ainsi que le nom et le prénom du client.
SELECT order_id, SUM(total_price), co.purchase_date, c.last_name, c.first_name FROM order_line ol JOIN customer_order co ON ol.order_id = co.id JOIN client c ON co.client_id = c.id  GROUP BY order_id, co.purchase_date, c.last_name, c.first_name;

--Récupérer le montant global de toutes les commandes, pour chaque mois.
UPDATE customer_order co SET total_price_cache = ol_sum.sum_total FROM ( SELECT order_id, SUM(total_price) AS sum_total FROM order_line GROUP BY order_id) AS ol_sum WHERE co.id = ol_sum.order_id;
SELECT EXTRACT(MONTH FROM purchase_date) AS months, SUM(total_price_cache) AS total_by_month FROM customer_order GROUP BY months ;

--Récupérer la liste des 10 clients qui ont effectué le plus grand montant de
--commandes, et obtenir ce montant total pour chaque client.
SELECT client_id, SUM(total_price_cache) AS total_by_client FROM customer_order co GROUP BY client_id ORDER BY total_by_client DESC LIMIT 10;

--Récupérer le montant total des commandes pour chaque jour.
SELECT EXTRACT(DAY FROM purchase_date) as DAYS, SUM(total_price_cache) AS total_by_days FROM customer_order GROUP BY days;

--Ajouter une colonne intitulée “category” à la table contenant les commandes. Cette
--colonne contiendra une valeur numérique (il faudra utiliser « ALTER TABLE »)
ALTER TABLE public.customer_order ADD category INT;

--Enregistrer la valeur de la catégorie, en suivant les règles suivantes
UPDATE customer_order co SET category = CASE WHEN total_price_cache < 200 THEN 1 WHEN total_price_cache >= 200 AND total_price_cache < 500 THEN 2 WHEN total_price_cache >= 500 AND total_price_cache <= 1000 THEN 3 WHEN total_price_cache > 1000 THEN 4 END;
