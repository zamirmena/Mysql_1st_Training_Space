# Mysql_1st_Training_Space
En este repositorio estaré practicando SQL desde cero, no como profesor sino como un alumno que no sabe nada del tema... Quieres acompañarme?
select first_name, last_name from actor; -- #Muestra solo las columnas first  and last name de la tabla actor

select title, release_year, language_id from film; -#Muestra solo el titulo, año de lanzamiento y el language ID de film

SELECT DISTINCT city_id, city FROM city; --- #Muestra los valores únicos que están en ciry_id y city en city

select * from payment;

SELECT * FROM payment WHERE amount > 2 AND amount <9; -- #Muestra todos la tabla pero filtrando por los valores que están entre 2 y 9

SELECT * FROM actor ORDER BY first_name, last_update, actor_id; -- #Muestra toda la tabla pero ordenado primero por firs name, despues por last update y ultimo actor id

SELECT first_name FROM actor ORDER BY last_name DESC; 

SELECT first_name, last_name
FROM actor 
WHERE last_name LIKE 'G%'; ## Muestra solo first name, last name de la tabal actor, filtrando por los last name que inicien con G

SELECT * 
FROM actor
WHERE NOT first_name LIKE '%A%' AND last_name LIKE 'D%'; --- #tabla actor filtrado por esas dos condiciones combinadas con AND. Es decir, actores cuyo nombre no tiene "A" y cuyo apellido empieza por "D"

SELECT * 
FROM actor
WHERE NOT first_name LIKE '%A%' AND last_name LIKE 'D%'
ORDER BY actor_id DESC
LIMIT 3;

