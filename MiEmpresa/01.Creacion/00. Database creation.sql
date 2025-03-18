-- Replace 'New_Database' with your database name
IF NOT EXISTS 
    ( SELECT name
FROM master.dbo.sysdatabases
WHERE name = N'New_Database' ) 
    CREATE DATABASE [TrumpetWare]
ELSE
    BEGIN
    DROP DATABASE [TrumpetWare]
END
go

USE TrumpetWare;

CREATE TABLE Region
(
    id_region INT PRIMARY KEY,
    nombre VARCHAR(100),
    id_cedis INT
);

CREATE TABLE CEDIS
(
    id_cedis INT PRIMARY KEY,
    nombre VARCHAR(100),
    direccion VARCHAR(255),
    geolocalizacion VARCHAR(100)
);

CREATE TABLE Embajador
(
    id_embajador INT PRIMARY KEY,
    nombre VARCHAR(100),
    nivel VARCHAR(50),
    ventas FLOAT,
    id_region INT,
    FOREIGN KEY (id_region) REFERENCES Region(id_region)
);

CREATE TABLE Cliente
(
    id_cliente INT PRIMARY KEY,
    nombre VARCHAR(100),
    telefonos VARCHAR(50),
    direccion_geolocalizada VARCHAR(100)
);

CREATE TABLE Pedido
(
    id_pedido INT PRIMARY KEY,
    fecha_pedido DATE,
    total_pedido FLOAT,
    estatus_pago VARCHAR(50),
    id_cliente INT,
    FOREIGN KEY (id_cliente) REFERENCES Cliente(id_cliente)
);

CREATE TABLE PagoCliente
(
    id_pago_cliente INT PRIMARY KEY,
    monto_pago FLOAT,
    fecha_pago DATE
);

CREATE TABLE Orden
(
    id_orden INT PRIMARY KEY,
    fecha_orden DATE,
    total_orden FLOAT,
    estatus_pago VARCHAR(50),
    id_embajador INT,
    FOREIGN KEY (id_embajador) REFERENCES Embajador(id_embajador)
);

CREATE TABLE Producto
(
    clave INT PRIMARY KEY,
    nombre VARCHAR(100),
    descripcion TEXT,
    precio_publico FLOAT,
    precio_embajador FLOAT,
    costo_produccion FLOAT
);

CREATE TABLE Categoria
(
    id_categoria INT PRIMARY KEY,
    nombre VARCHAR(100)
);

CREATE TABLE Campana
(
    id_campana INT PRIMARY KEY,
    fecha_inicio DATE,
    fecha_fin DATE,
    descuento_promocion FLOAT
);

CREATE TABLE Temporada
(
    id_temporada INT PRIMARY KEY,
    fecha_inicio DATE,
    fecha_fin DATE
);

INSERT INTO Region
    (id_region, nombre, id_cedis)
VALUES
    (1, 'Norte', 1),
    (2, 'Sur', 2),
    (3, 'Este', 3),
    (4, 'Oeste', 4),
    (5, 'Centro', 5),
    (6, 'Noroeste', 6),
    (7, 'Sureste', 7),
    (8, 'Suroeste', 8),
    (9, 'Noreste', 9),
    (10, 'Occidente', 10),
    (11, 'Pacífico', 11),
    (12, 'Golfo', 12),
    (13, 'Bajío', 13),
    (14, 'Altiplano', 14),
    (15, 'Caribe', 15),
    (16, 'Andes', 16),
    (17, 'Amazonas', 17),
    (18, 'Patagonia', 18),
    (19, 'Pampas', 19),
    (20, 'Atlántico', 20);


INSERT INTO CEDIS
    (id_cedis, nombre, direccion, geolocalizacion)
VALUES
    (1, 'CEDIS Monterrey', 'Av. Universidad 123', '25.6514,-100.2899'),
    (2, 'CEDIS Guadalajara', 'Calle Revolución 456', '20.6597,-103.3496'),
    (3, 'CEDIS CDMX', 'Paseo de la Reforma 789', '19.4326,-99.1332'),
    (4, 'CEDIS Puebla', 'Blvd. 5 de Mayo 101', '19.0414,-98.2063'),
    (5, 'CEDIS Mérida', 'Calle 60 202', '20.9671,-89.6237'),
    (6, 'CEDIS León', 'Calle Hidalgo 300', '21.125,-101.6854'),
    (7, 'CEDIS Tijuana', 'Av. Revolución 1200', '32.5149,-117.0382'),
    (8, 'CEDIS Cancún', 'Zona Hotelera KM 9', '21.1619,-86.8515'),
    (9, 'CEDIS Querétaro', 'Av. Corregidora 150', '20.5888,-100.3899'),
    (10, 'CEDIS Toluca', 'Calle Morelos 305', '19.2826,-99.6557'),
    (11, 'CEDIS Hermosillo', 'Blvd. Colosio 456', '29.0729,-110.9559'),
    (12, 'CEDIS Veracruz', 'Malecón 200', '19.2007,-96.1429'),
    (13, 'CEDIS Chihuahua', 'Calle Independencia 678', '28.6353,-106.0889'),
    (14, 'CEDIS Acapulco', 'Av. Costera 800', '16.8531,-99.8237'),
    (15, 'CEDIS Oaxaca', 'Calle Reforma 123', '17.0654,-96.7266'),
    (16, 'CEDIS Tuxtla', 'Blvd. Belisario 100', '16.7541,-93.1156'),
    (17, 'CEDIS Saltillo', 'Calle Allende 450', '25.4387,-100.9855'),
    (18, 'CEDIS Aguascalientes', 'Av. López Mateos 500', '21.8853,-102.2916'),
    (19, 'CEDIS Durango', 'Calle Victoria 321', '24.0277,-104.6532'),
    (20, 'CEDIS Zacatecas', 'Blvd. Héroes 150', '22.7709,-102.5832');

INSERT INTO Embajador
    (id_embajador, nombre, nivel, ventas, id_region)
VALUES
    (1, 'Ana López', 'Oro', 12000.50, 1),
    (2, 'Juan Pérez', 'Plata', 9500.75, 2),
    (3, 'Luis García', 'Bronce', 7400.30, 3),
    (4, 'Laura Martínez', 'Oro', 15000.20, 4),
    (5, 'Carlos Díaz', 'Plata', 11000.10, 5),
    (6, 'Sofía Mendoza', 'Oro', 13000.60, 6),
    (7, 'Ricardo Torres', 'Bronce', 6000.80, 7),
    (8, 'Julia Romero', 'Plata', 8700.90, 8),
    (9, 'Andrés Vázquez', 'Oro', 15500.00, 9),
    (10, 'Mónica Castro', 'Plata', 9700.25, 10),
    (11, 'Patricia Ruiz', 'Bronce', 5500.45, 11),
    (12, 'Fernando Ortiz', 'Oro', 14000.90, 12),
    (13, 'Gabriela Flores', 'Plata', 8900.30, 13),
    (14, 'Daniel Gómez', 'Bronce', 7200.55, 14),
    (15, 'Beatriz Herrera', 'Oro', 16000.80, 15),
    (16, 'Hugo Navarro', 'Plata', 9200.70, 16),
    (17, 'Carmen Morales', 'Bronce', 5000.60, 17),
    (18, 'Rafael Ríos', 'Oro', 14500.40, 18),
    (19, 'Liliana Peña', 'Plata', 9100.50, 19),
    (20, 'Mario Velasco', 'Bronce', 5300.30, 20);

INSERT INTO Cliente
    (id_cliente, nombre, telefonos, direccion_geolocalizada)
VALUES
    (1, 'María González', '555-1234', '19.4326,-99.1332'),
    (2, 'Pedro Ramírez', '555-5678', '20.6597,-103.3496'),
    (3, 'Sofía Herrera', '555-8765', '25.6514,-100.2899'),
    (4, 'José Torres', '555-4321', '19.0414,-98.2063'),
    (5, 'Lucía Fernández', '555-0000', '20.9671,-89.6237'),
    (6, 'Javier Martínez', '555-7890', '21.125,-101.6854'),
    (7, 'Isabel Díaz', '555-6543', '32.5149,-117.0382'),
    (8, 'Raúl Mendoza', '555-3456', '21.1619,-86.8515'),
    (9, 'Patricia León', '555-2222', '20.5888,-100.3899'),
    (10, 'Héctor Ruiz', '555-3333', '19.2826,-99.6557'),
    (11, 'Carla Muñoz', '555-4444', '29.0729,-110.9559'),
    (12, 'Eduardo Vargas', '555-5555', '19.2007,-96.1429'),
    (13, 'Sandra Rojas', '555-6666', '28.6353,-106.0889'),
    (14, 'Oscar Paredes', '555-7777', '16.8531,-99.8237'),
    (15, 'Natalia Soto', '555-8888', '17.0654,-96.7266'),
    (16, 'Roberto Guzmán', '555-9999', '16.7541,-93.1156'),
    (17, 'Daniela Velázquez', '555-1111', '25.4387,-100.9855'),
    (18, 'Luis Castro', '555-1212', '21.8853,-102.2916'),
    (19, 'Andrea Lara', '555-1313', '24.0277,-104.6532'),
    (20, 'Carlos Jiménez', '555-1414', '22.7709,-102.5832');

INSERT INTO PagoCliente
    (id_pago_cliente, monto_pago, fecha_pago)
VALUES
    (1, 1200.50, '2025-03-01'),
    (2, 950.75, '2025-03-02'),
    (3, 500.00, '2025-03-03'),
    (4, 1100.25, '2025-03-04'),
    (5, 1500.00, '2025-03-05'),
    (6, 2000.00, '2025-03-06'),
    (7, 1700.30, '2025-03-07'),
    (8, 1300.45, '2025-03-08'),
    (9, 800.50, '2025-03-09'),
    (10, 1450.75, '2025-03-10'),
    (11, 1600.00, '2025-03-11'),
    (12, 1750.80, '2025-03-12'),
    (13, 1900.60, '2025-03-13'),
    (14, 850.40, '2025-03-14'),
    (15, 1050.90, '2025-03-15'),
    (16, 1150.70, '2025-03-16'),
    (17, 1250.55, '2025-03-17'),
    (18, 1350.30, '2025-03-18'),
    (19, 1400.10, '2025-03-19'),
    (20, 1550.25, '2025-03-20');

INSERT INTO Orden
    (id_orden, fecha_orden, total_orden, estatus_pago, id_embajador)
VALUES
    (1, '2025-03-01', 1500.00, 'Pagado', 1),
    (2, '2025-03-02', 1100.50, 'Pendiente', 2),
    (3, '2025-03-03', 800.75, 'Pagado', 3),
    (4, '2025-03-04', 2000.00, 'Cancelado', 4),
    (5, '2025-03-05', 1300.25, 'Pendiente', 5),
    (6, '2025-03-06', 1750.00, 'Pagado', 6),
    (7, '2025-03-07', 900.60, 'Cancelado', 7),
    (8, '2025-03-08', 1600.40, 'Pagado', 8),
    (9, '2025-03-09', 1400.90, 'Pendiente', 9),
    (10, '2025-03-10', 1200.30, 'Pagado', 10),
    (11, '2025-03-11', 1800.00, 'Pendiente', 11),
    (12, '2025-03-12', 1950.80, 'Pagado', 12),
    (13, '2025-03-13', 1050.60, 'Cancelado', 13),
    (14, '2025-03-14', 1300.40, 'Pagado', 14),
    (15, '2025-03-15', 900.70, 'Pendiente', 15),
    (16, '2025-03-16', 1100.55, 'Pagado', 16),
    (17, '2025-03-17', 1400.30, 'Cancelado', 17),
    (18, '2025-03-18', 1250.10, 'Pendiente', 18),
    (19, '2025-03-19', 1500.25, 'Pagado', 19),
    (20, '2025-03-20', 1700.75, 'Pendiente', 20);

INSERT INTO Producto
    (clave, nombre, descripcion, precio_publico, precio_embajador, costo_produccion)
VALUES
    (1, 'Shampoo Herbal', 'Shampoo natural con aloe vera', 150.00, 120.00, 80.00),
    (2, 'Crema Hidratante', 'Crema para piel seca', 200.00, 160.00, 110.00),
    (3, 'Jabón de Coco', 'Jabón artesanal', 50.00, 40.00, 25.00),
    (4, 'Perfume Floral', 'Fragancia para mujer', 300.00, 250.00, 150.00),
    (5, 'Aceite de Almendras', 'Aceite corporal', 180.00, 140.00, 90.00),
    (6, 'Gel Antibacterial', 'Gel desinfectante', 100.00, 80.00, 50.00),
    (7, 'Pasta Dental', 'Pasta con flúor', 60.00, 45.00, 30.00),
    (8, 'Loción Masculina', 'Fragancia para hombre', 350.00, 280.00, 200.00),
    (9, 'Jabón de Lavanda', 'Jabón relajante', 55.00, 45.00, 30.00),
    (10, 'Serum Facial', 'Sérum rejuvenecedor', 400.00, 320.00, 220.00),
    (11, 'Mascarilla de Carbón', 'Mascarilla facial', 150.00, 120.00, 90.00),
    (12, 'Bloqueador Solar', 'Protección solar SPF 50', 250.00, 200.00, 140.00),
    (13, 'Labial Mate', 'Labial de larga duración', 120.00, 100.00, 70.00),
    (14, 'Exfoliante Corporal', 'Exfoliante con café', 180.00, 140.00, 90.00),
    (15, 'Desodorante Natural', 'Desodorante sin aluminio', 90.00, 70.00, 50.00),
    (16, 'Crema Antiedad', 'Crema para arrugas', 280.00, 220.00, 160.00),
    (17, 'Tónico Facial', 'Tónico refrescante', 200.00, 160.00, 110.00),
    (18, 'Shampoo Anticaspa', 'Shampoo tratamiento', 160.00, 130.00, 100.00),
    (19, 'Acondicionador Herbal', 'Acondicionador nutritivo', 140.00, 110.00, 85.00),
    (20, 'Bálsamo Labial', 'Bálsamo con karité', 80.00, 60.00, 40.00);

INSERT INTO Categoria
    (id_categoria, nombre)
VALUES
    (1, 'Cosméticos'),
    (2, 'Perfumería'),
    (3, 'Higiene'),
    (4, 'Cuidado personal'),
    (5, 'Salud'),
    (6, 'Nutrición'),
    (7, 'Maquillaje'),
    (8, 'Fragancias'),
    (9, 'Cabello'),
    (10, 'Piel'),
    (11, 'Cuerpo'),
    (12, 'Accesorios'),
    (13, 'Belleza masculina'),
    (14, 'Joyería'),
    (15, 'Ropa'),
    (16, 'Zapatos'),
    (17, 'Deportes'),
    (18, 'Electrónica'),
    (19, 'Hogar'),
    (20, 'Juguetes');

INSERT INTO Campana
    (id_campana, fecha_inicio, fecha_fin, descuento_promocion)
VALUES
    (1, '2025-01-01', '2025-01-31', 10.0),
    (2, '2025-02-01', '2025-02-28', 15.0),
    (3, '2025-03-01', '2025-03-31', 20.0);


INSERT INTO Pedido
    (id_pedido, fecha_pedido, total_pedido, estatus_pago, id_cliente)
VALUES
    (1, '2025-03-01', 1200.00, 'Pagado', 1),
    (2, '2025-03-02', 800.50, 'Pendiente', 2),
    (3, '2025-03-03', 500.00, 'Cancelado', 3),
    (4, '2025-03-04', 950.75, 'Pagado', 4),
    (5, '2025-03-05', 1500.00, 'Pendiente', 5),
    (6, '2025-03-06', 1200.00, 'Pagado', 6),
    (7, '2025-03-07', 700.30, 'Cancelado', 7),
    (8, '2025-03-08', 1100.50, 'Pagado', 8),
    (9, '2025-03-09', 900.75, 'Pendiente', 9),
    (10, '2025-03-10', 1300.00, 'Pagado', 10),
    (11, '2025-03-11', 750.00, 'Cancelado', 11),
    (12, '2025-03-12', 1600.25, 'Pagado', 12),
    (13, '2025-03-13', 1400.60, 'Pendiente', 13),
    (14, '2025-03-14', 650.45, 'Pagado', 14),
    (15, '2025-03-15', 1200.80, 'Cancelado', 15),
    (16, '2025-03-16', 1300.50, 'Pagado', 16),
    (17, '2025-03-17', 900.40, 'Pendiente', 17),
    (18, '2025-03-18', 850.60, 'Pagado', 18),
    (19, '2025-03-19', 1700.90, 'Cancelado', 19),
    (20, '2025-03-20', 1100.75, 'Pagado', 20),
    (21, '2025-03-21', 700.00, 'Pendiente', 1),
    (22, '2025-03-22', 950.50, 'Pagado', 2),
    (23, '2025-03-23', 1200.75, 'Cancelado', 3),
    (24, '2025-03-24', 1300.00, 'Pagado', 4),
    (25, '2025-03-25', 1400.25, 'Pendiente', 5),
    (26, '2025-03-26', 750.80, 'Pagado', 6),
    (27, '2025-03-27', 600.40, 'Cancelado', 7),
    (28, '2025-03-28', 1600.60, 'Pagado', 8),
    (29, '2025-03-29', 1800.90, 'Pendiente', 9),
    (30, '2025-03-30', 1900.75, 'Pagado', 10),
    (31, '2025-04-01', 2000.00, 'Pendiente', 11),
    (32, '2025-04-02', 950.50, 'Pagado', 12),
    (33, '2025-04-03', 1500.75, 'Cancelado', 13),
    (34, '2025-04-04', 1750.00, 'Pagado', 14),
    (35, '2025-04-05', 1400.25, 'Pendiente', 15),
    (36, '2025-04-06', 850.80, 'Pagado', 16),
    (37, '2025-04-07', 900.40, 'Cancelado', 17),
    (38, '2025-04-08', 1650.60, 'Pagado', 18),
    (39, '2025-04-09', 1250.90, 'Pendiente', 19),
    (40, '2025-04-10', 1300.75, 'Pagado', 20),
    (41, '2025-04-11', 1400.00, 'Pendiente', 1),
    (42, '2025-04-12', 1200.50, 'Pagado', 2),
    (43, '2025-04-13', 1800.75, 'Cancelado', 3),
    (44, '2025-04-14', 1750.00, 'Pagado', 4),
    (45, '2025-04-15', 1500.25, 'Pendiente', 5),
    (46, '2025-04-16', 900.80, 'Pagado', 6),
    (47, '2025-04-17', 950.40, 'Cancelado', 7),
    (48, '2025-04-18', 1550.60, 'Pagado', 8),
    (49, '2025-04-19', 1700.90, 'Pendiente', 9),
    (50, '2025-04-20', 1900.75, 'Pagado', 10),
    (51, '2025-04-21', 1200.00, 'Pendiente', 11),
    (52, '2025-04-22', 800.50, 'Pagado', 12),
    (53, '2025-04-23', 950.75, 'Cancelado', 13),
    (54, '2025-04-24', 1000.00, 'Pagado', 14),
    (55, '2025-04-25', 1400.25, 'Pendiente', 15),
    (56, '2025-04-26', 850.80, 'Pagado', 16),
    (57, '2025-04-27', 1100.40, 'Cancelado', 17),
    (58, '2025-04-28', 1600.60, 'Pagado', 18),
    (59, '2025-04-29', 1800.90, 'Pendiente', 19),
    (60, '2025-04-30', 2000.75, 'Pagado', 20),
    (61, '2025-05-01', 1500.00, 'Pendiente', 1),
    (62, '2025-05-02', 850.50, 'Pagado', 2),
    (63, '2025-05-03', 900.75, 'Cancelado', 3),
    (64, '2025-05-04', 950.00, 'Pagado', 4),
    (65, '2025-05-05', 1200.25, 'Pendiente', 5),
    (66, '2025-05-06', 1300.80, 'Pagado', 6),
    (67, '2025-05-07', 1400.40, 'Cancelado', 7),
    (68, '2025-05-08', 1500.60, 'Pagado', 8),
    (69, '2025-05-09', 1600.90, 'Pendiente', 9),
    (70, '2025-05-10', 1700.75, 'Pagado', 10),
    (71, '2025-05-11', 1800.00, 'Pendiente', 11),
    (72, '2025-05-12', 1900.50, 'Pagado', 12),
    (73, '2025-05-13', 2000.75, 'Cancelado', 13),
    (74, '2025-05-14', 2100.00, 'Pagado', 14),
    (75, '2025-05-15', 2200.25, 'Pendiente', 15);

SELECT *
FROM Embajador;