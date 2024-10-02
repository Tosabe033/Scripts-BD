-- Creación del esquema de base de datos
CREATE DATABASE IF NOT EXISTS Produccion_Contenidos;
USE Produccion_Contenidos;
-- Tabla: contenidos
CREATE TABLE contenidos (
    id_contenido INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(255) NOT NULL,
    sinopsis TEXT,
    genero VARCHAR(50),
    fecha_creacion DATE,
    fecha_publicacion DATE,
    idioma VARCHAR(50),
    formato VARCHAR(10),
    estado_produccion ENUM('En desarrollo', 'En postproducción', 'Publicado', 'Archivado') NOT NULL,
    palabras_clave TEXT,
    etiquetas TEXT
);

-- Tabla: equipo_produccion
CREATE TABLE equipo_produccion (
    id_equipo INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    rol VARCHAR(50)
);

-- Tabla: contenido_equipo
CREATE TABLE contenido_equipo (
    id_contenido INT,
    id_equipo INT,
    FOREIGN KEY (id_contenido) REFERENCES contenidos(id_contenido),
    FOREIGN KEY (id_equipo) REFERENCES equipo_produccion(id_equipo),
    PRIMARY KEY (id_contenido, id_equipo)
);

-- Tabla: usuarios
CREATE TABLE usuarios (
    id_usuario INT AUTO_INCREMENT PRIMARY KEY,
    nombre_usuario VARCHAR(50) NOT NULL,
    email VARCHAR(255) NOT NULL,
    rol ENUM('Productor', 'Editor', 'Administrador de Contenidos') NOT NULL,
    contrasena VARCHAR(255) NOT NULL
);

-- Tabla: modificaciones
CREATE TABLE modificaciones (
    id_modificacion INT AUTO_INCREMENT PRIMARY KEY,
    id_contenido INT,
    id_usuario INT,
    fecha_modificacion DATETIME,
    tabla_modificada VARCHAR(50),
    tipo_modificacion ENUM('Creacion', 'Actualizacion', 'Eliminacion'),
    FOREIGN KEY (id_contenido) REFERENCES contenidos(id_contenido),
    FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario)
);

-- Tabla: notificaciones
CREATE TABLE notificaciones (
    id_notificacion INT AUTO_INCREMENT PRIMARY KEY,
    tipo VARCHAR(50),
    id_equipo INT,
    fecha DATETIME,
    mensaje TEXT,
    FOREIGN KEY (id_equipo) REFERENCES equipo_produccion(id_equipo)
);

-- Tabla: estadisticas
CREATE TABLE estadisticas (
    id_estadistica INT AUTO_INCREMENT PRIMARY KEY,
    id_contenido INT,
    numero_visualizaciones INT DEFAULT 0,
    puntuacion_promedio DECIMAL(3, 2),
    tasa_finalizacion DECIMAL(5, 2),
    fecha DATE,
    FOREIGN KEY (id_contenido) REFERENCES contenidos(id_contenido)
);

-- Tabla: accesos
CREATE TABLE accesos (
    id_acceso INT AUTO_INCREMENT PRIMARY KEY,
    id_usuario INT,
    fecha_acceso DATETIME,
    estado ENUM('Exitoso', 'Fallido'),
    FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario)
);

-- Tabla: historial_estados
CREATE TABLE historial_estados (
    id_historial INT AUTO_INCREMENT PRIMARY KEY,
    id_contenido INT,
    estado_anterior ENUM('En desarrollo', 'En postproducción', 'Publicado', 'Archivado'),
    estado_nuevo ENUM('En desarrollo', 'En postproducción', 'Publicado', 'Archivado'),
    fecha_cambio DATETIME,
    FOREIGN KEY (id_contenido) REFERENCES contenidos(id_contenido)
);

