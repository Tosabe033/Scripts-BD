-- Desactivar comprobación de claves foráneas
SET FOREIGN_KEY_CHECKS = 0;

-- Vaciar todas las tablas en el orden correcto
TRUNCATE TABLE contenido_equipo;
TRUNCATE TABLE modificaciones;
TRUNCATE TABLE notificaciones;
TRUNCATE TABLE estadisticas;
TRUNCATE TABLE accesos;
TRUNCATE TABLE historial_estados;
TRUNCATE TABLE equipo_produccion;
TRUNCATE TABLE usuarios;
TRUNCATE TABLE contenidos;

-- Insertar en la tabla 'contenidos'
INSERT INTO contenidos (titulo, sinopsis, genero, fecha_creacion, fecha_publicacion, idioma, formato, estado_produccion, palabras_clave, etiquetas) VALUES
('Contenido 1', 'Sinopsis del contenido 1', 'Drama', '2023-01-01', '2023-06-01', 'Español', 'HD', 'Publicado', 'clave1, clave2', 'etiqueta1, etiqueta2'),
('Contenido 2', 'Sinopsis del contenido 2', 'Comedia', '2023-01-02', '2023-06-02', 'Inglés', '4K', 'En desarrollo', 'clave3, clave4', 'etiqueta3, etiqueta4'),
('Contenido 100', 'Sinopsis del contenido 100', 'Acción', '2022-12-31', '2023-12-31', 'Francés', 'HD', 'Archivado', 'clave199, clave200', 'etiqueta99, etiqueta100');

-- Insertar en la tabla 'equipo_produccion'
INSERT INTO equipo_produccion (nombre, rol) VALUES
('Director 1', 'Director'),
('Guionista 2', 'Guionista'),
('Actor 100', 'Actor');

-- Insertar en la tabla 'usuarios'
INSERT INTO usuarios (nombre_usuario, email, rol, contrasena) VALUES
('usuario1', 'usuario1@email.com', 'Productor', 'contrasena1'),
('usuario2', 'usuario2@email.com', 'Editor', 'contrasena2'),
('usuario100', 'usuario100@email.com', 'Administrador de Contenidos', 'contrasena100');

-- Insertar en la tabla 'contenido_equipo' (dependiente de contenidos y equipo_produccion)
INSERT INTO contenido_equipo (id_contenido, id_equipo) VALUES
(1, 1),
(1, 2),
(2, 3),
(100, 1);

-- Insertar en la tabla 'modificaciones'
INSERT INTO modificaciones (id_contenido, id_usuario, fecha_modificacion, tabla_modificada, tipo_modificacion) VALUES
(1, 1, '2023-07-01 10:30:00', 'contenidos', 'Actualizacion'),
(2, 2, '2023-07-02 11:00:00', 'contenidos', 'Creacion'),
(100, 3, '2023-07-03 12:30:00', 'contenidos', 'Eliminacion');

-- Insertar en la tabla 'notificaciones'
INSERT INTO notificaciones (tipo, id_equipo, fecha, mensaje) VALUES
('Cambio de estado', 1, '2023-08-01 09:00:00', 'El estado del contenido ha cambiado.'),
('Nuevo contenido', 2, '2023-08-02 10:30:00', 'Se ha añadido un nuevo contenido al sistema.');

-- Insertar en la tabla 'estadisticas'
INSERT INTO estadisticas (id_contenido, numero_visualizaciones, puntuacion_promedio, tasa_finalizacion, fecha) VALUES
(1, 1000, 4.5, 85.50, '2023-08-10'),
(2, 2000, 4.8, 90.00, '2023-08-15');

-- Insertar en la tabla 'accesos'
INSERT INTO accesos (id_usuario, fecha_acceso, estado) VALUES
(1, '2023-08-01 09:00:00', 'Exitoso'),
(2, '2023-08-02 09:15:00', 'Fallido');

-- Insertar en la tabla 'historial_estados'
INSERT INTO historial_estados (id_contenido, estado_anterior, estado_nuevo, fecha_cambio) VALUES
(1, 'En desarrollo', 'Publicado', '2023-06-01 08:00:00'),
(2, 'En desarrollo', 'En postproducción', '2023-06-15 09:00:00');

-- Reactivar comprobación de claves foráneas
SET FOREIGN_KEY_CHECKS = 1;
