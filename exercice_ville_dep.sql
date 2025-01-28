SELECT 
    ville_nom, ville_population_2012
FROM
    villes_france_free
ORDER BY ville_population_2012 DESC
LIMIT 10;

SELECT 
    ville_nom, ville_surface
FROM
    villes_france_free
ORDER BY ville_surface ASC
LIMIT 50;

SELECT 
    departement_code, departement_nom
FROM
    departement
WHERE
    departement_code LIKE'97%'; 
    
SELECT 
    *
FROM
    villes_france_free
        LEFT JOIN
    departement ON departement_code = ville_departement
ORDER BY ville_population_2012 DESC
LIMIT 10; 

SELECT 
    departement.departement_nom,
    departement.departement_code,
    COUNT(departement_id) AS nombre_communes
FROM
    departement
        JOIN
    villes_france_free ON departement.departement_id = villes_france_free.ville_departement
GROUP BY departement.departement_nom , departement.departement_code
ORDER BY nombre_communes DESC;

SELECT 
    ville_departement, ROUND(SUM(ville_surface)) AS sum_surface
FROM
    villes_france_free
GROUP BY ville_departement
ORDER BY sum_surface DESC
LIMIT 10; 

SELECT COUNT(ville_nom)
FROM villes_france_free
WHERE ville_nom LIKE'Saint%'; 

SELECT ville_nom, COUNT(*) AS nombre_occurrences
FROM villes_france_free
GROUP BY ville_nom 
HAVING COUNT(*) > 1
ORDER BY nombre_occurrences DESC;

SELECT 
    ville_nom, ville_surface
FROM
    villes_france_free
WHERE
    ville_surface > (SELECT 
            AVG(ville_surface)
        FROM
            villes_france_free);

SELECT 
    SUM(ville_population_2012) AS sum_dep, ville_departement
FROM
    villes_france_free
GROUP BY ville_departement
HAVING sum_dep > 2000000
ORDER BY sum_dep DESC;

UPDATE villes_france_free
SET ville_nom = REPLACE(ville_nom, '-', ' ') 
WHERE ville_nom LIKE 'SAINT-%'
