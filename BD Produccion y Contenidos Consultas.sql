-- Consultas SQL Generadas

-- 1. ¿Cuál es el contenido con más visualizaciones?
SELECT id_contenido, MAX(numero_visualizaciones) AS max_visualizaciones FROM estadisticas;

-- 2. ¿Cuántos contenidos fueron publicados en 2023?
SELECT COUNT(*) AS total_contenidos FROM contenidos WHERE YEAR(fecha_publicacion) = 2023;

-- 3. ¿Qué miembros del equipo participaron en la producción del contenido 2?
SELECT nombre, rol FROM equipo_produccion WHERE id_equipo IN (SELECT id_equipo FROM contenido_equipo WHERE id_contenido = 2);

-- 4. ¿Cuántos contenidos están en estado de "Publicado"?
SELECT COUNT(*) AS total_publicados FROM contenidos WHERE estado_produccion = 'Publicado';

-- 5. ¿Cuál es la sinopsis del contenido 3?
SELECT sinopsis FROM contenidos WHERE id_contenido = 3;

-- 6. ¿Qué usuarios han accedido al sistema en las últimas 24 horas?
SELECT * FROM accesos WHERE fecha_acceso >= NOW() - INTERVAL 1 DAY;

-- 7. ¿Qué notificaciones han sido enviadas al equipo 1?
SELECT * FROM notificaciones WHERE id_equipo = 1;

-- 8. ¿Qué modificaciones se hicieron al contenido 1 en el último mes?
SELECT * FROM modificaciones WHERE id_contenido = 1 AND fecha_modificacion >= NOW() - INTERVAL 1 MONTH;

-- 9. ¿Cuál es la tasa de finalización promedio de todos los contenidos?
SELECT AVG(tasa_finalizacion) AS tasa_promedio FROM estadisticas;

-- 10. ¿Qué usuarios tienen el rol de "Productor"?
SELECT * FROM usuarios WHERE rol = 'Productor';

-- 11. ¿Cuál es la puntuación promedio del contenido 100?
SELECT AVG(puntuacion_promedio) AS puntuacion_promedio FROM estadisticas WHERE id_contenido = 100;

-- 12. ¿Cuántos usuarios han tenido accesos fallidos?
SELECT COUNT(*) AS total_fallidos FROM accesos WHERE estado = 'Fallido';

-- 13. ¿Qué contenidos están en idioma "Inglés" y en formato "4K"?
SELECT * FROM contenidos WHERE idioma = 'Inglés' AND formato = '4K';

-- 14. ¿Qué contenidos fueron archivados en el último año?
SELECT * FROM contenidos WHERE estado_produccion = 'Archivado' AND fecha_publicacion >= NOW() - INTERVAL 1 YEAR;

-- 15. ¿Cuántas modificaciones se realizaron en la tabla "contenidos"?
SELECT COUNT(*) AS total_modificaciones FROM modificaciones WHERE tabla_modificada = 'contenidos';

-- 16. ¿Cuáles son los contenidos en "postproducción"?
SELECT * FROM contenidos WHERE estado_produccion = 'En postproducción';

-- 17. ¿Qué usuario realizó la última modificación al contenido 2?
SELECT id_usuario FROM modificaciones WHERE id_contenido = 2 ORDER BY fecha_modificacion DESC LIMIT 1;

-- 18. ¿Cuántas veces ha sido visualizado el contenido 1?
SELECT numero_visualizaciones FROM estadisticas WHERE id_contenido = 1;

-- 19. ¿Cuáles fueron los estados anteriores del contenido 100?
SELECT estado_anterior FROM historial_estados WHERE id_contenido = 100;

-- 20. ¿Cuántos usuarios tienen el rol de "Administrador de Contenidos"?
SELECT COUNT(*) AS total_administradores FROM usuarios WHERE rol = 'Administrador de Contenidos';

-- 21. ¿Qué contenidos han cambiado de estado en los últimos tres meses?
SELECT * FROM historial_estados WHERE fecha_cambio >= NOW() - INTERVAL 3 MONTH;

-- 22. ¿Cuántos miembros del equipo han participado en el contenido 100?
SELECT COUNT(*) AS total_miembros FROM contenido_equipo WHERE id_contenido = 100;

-- 23. ¿Qué contenido tiene la mayor tasa de finalización?
SELECT id_contenido, MAX(tasa_finalizacion) AS max_tasa FROM estadisticas;

-- 24. ¿Cuál fue la última notificación enviada al equipo 2?
SELECT * FROM notificaciones WHERE id_equipo = 2 ORDER BY fecha DESC LIMIT 1;

-- 25. ¿Cuántas visualizaciones tuvo el contenido 2 en junio de 2023?
SELECT numero_visualizaciones FROM estadisticas WHERE id_contenido = 2 AND fecha = '2023-06-01';

-- 26. ¿Cuántos usuarios han modificado el contenido 1?
SELECT COUNT(DISTINCT id_usuario) AS total_modificaciones FROM modificaciones WHERE id_contenido = 1;

-- 27. ¿Qué contenidos tienen palabras clave relacionadas con "clave1"?
SELECT * FROM contenidos WHERE palabras_clave LIKE '%clave1%';

-- 28. ¿Qué notificaciones han sido enviadas en las últimas 48 horas?
SELECT * FROM notificaciones WHERE fecha >= NOW() - INTERVAL 48 HOUR;

-- 29. ¿Cuál es el estado de producción actual del contenido 3?
SELECT estado_produccion FROM contenidos WHERE id_contenido = 3;

-- 30. ¿Qué contenidos están en "HD" y en estado de "Publicado"?
SELECT * FROM contenidos WHERE formato = 'HD' AND estado_produccion = 'Publicado';

-- 31. ¿Cuántas visualizaciones totales tienen los contenidos en "Ciencia Ficción"?
SELECT SUM(numero_visualizaciones) AS total_visualizaciones FROM estadisticas WHERE id_contenido IN (SELECT id_contenido FROM contenidos WHERE genero = 'Ciencia Ficción');

-- 32. ¿Qué modificaciones fueron realizadas por el usuario 1?
SELECT * FROM modificaciones WHERE id_usuario = 1;

-- 33. ¿Cuántos usuarios han accedido con éxito al sistema hoy?
SELECT COUNT(*) AS total_exitosos FROM accesos WHERE fecha_acceso >= CURDATE() AND estado = 'Exitoso';

-- 34. ¿Qué usuario cambió el estado del contenido 100 por última vez?
SELECT id_usuario FROM modificaciones WHERE id_contenido = 100 ORDER BY fecha_modificacion DESC LIMIT 1;

-- 35. ¿Qué equipos de producción tienen más de 5 miembros?
SELECT id_equipo FROM contenido_equipo GROUP BY id_equipo HAVING COUNT(*) > 5;

-- 36. ¿Cuántos contenidos tienen formato "HD"?
SELECT COUNT(*) AS total_HD FROM contenidos WHERE formato = 'HD';

-- 37. ¿Cuál es la fecha de publicación del contenido 3?
SELECT fecha_publicacion FROM contenidos WHERE id_contenido = 3;

-- 38. ¿Qué contenidos están en "Español" y en estado de "Archivado"?
SELECT * FROM contenidos WHERE idioma = 'Español' AND estado_produccion = 'Archivado';

-- 39. ¿Cuál es la sinopsis del contenido 100?
SELECT sinopsis FROM contenidos WHERE id_contenido = 100;

-- 40. ¿Qué usuarios hicieron modificaciones en julio de 2023?
SELECT DISTINCT id_usuario FROM modificaciones WHERE fecha_modificacion >= '2023-07-01' AND fecha_modificacion < '2023-08-01';

-- 41. ¿Cuántos contenidos tienen más de 100 visualizaciones?
SELECT COUNT(*) AS total_contenidos FROM estadisticas WHERE numero_visualizaciones > 100;

-- 42. ¿Qué contenidos fueron creados en el año 2022?
SELECT * FROM contenidos WHERE YEAR(fecha_creacion) = 2022;

-- 43. ¿Qué equipos han trabajado en más de un contenido?
SELECT id_equipo FROM contenido_equipo GROUP BY id_equipo HAVING COUNT(DISTINCT id_contenido) > 1;

-- 44. ¿Cuál es el estado actual del contenido 2?
SELECT estado_produccion FROM contenidos WHERE id_contenido = 2;

-- 45. ¿Cuántos accesos exitosos tuvieron los usuarios el mes pasado?
SELECT COUNT(*) AS total_exitosos FROM accesos WHERE fecha_acceso >= DATE_SUB(CURDATE(), INTERVAL 1 MONTH) AND estado = 'Exitoso';

-- 46. ¿Qué contenidos fueron publicados entre enero y marzo de 2023?
SELECT * FROM contenidos WHERE fecha_publicacion BETWEEN '2023-01-01' AND '2023-03-31';

-- 47. ¿Qué usuarios han cambiado estados de contenido?
SELECT DISTINCT id_usuario FROM modificaciones WHERE tipo_modificacion = 'Cambio de estado';

-- 48. ¿Cuál es el contenido con la puntuación promedio más baja?
SELECT id_contenido, MIN(puntuacion_promedio) AS min_puntuacion FROM estadisticas;

-- 49. ¿Qué notificaciones fueron enviadas al equipo 3 en 2023?
SELECT * FROM notificaciones WHERE id_equipo = 3 AND YEAR(fecha) = 2023;

-- 50. ¿Qué contenidos fueron visualizados más de 1000 veces en junio de 2023?
SELECT * FROM estadisticas WHERE numero_visualizaciones > 1000 AND fecha BETWEEN '2023-06-01' AND '2023-06-30';
