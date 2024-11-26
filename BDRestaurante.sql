DROP DATABASE RestauranteDAIC;
Create database RestauranteDAIC;
use RestauranteDAIC;


-- Tabla: Platillo
CREATE TABLE Platillo (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    precio INT NOT NULL ,
    CHECK(precio>0),
    categoria VARCHAR(100),
    disponibilidad BOOLEAN NOT NULL
);

-- Tabla: Mesas
CREATE TABLE Mesas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    capacidad INT NOT NULL,
    libre BOOLEAN DEFAULT FALSE,
    CHECK(capacidad>0)
);

-- Tabla: Pedidos
CREATE TABLE Pedidos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    idMesa INT NOT NULL,
    total INT NOT NULL,
    FOREIGN KEY (idMesa) REFERENCES Mesas(id)
);

-- Tabla: DetPedido
CREATE TABLE DetPedido (
    id INT AUTO_INCREMENT PRIMARY KEY,
    idPlatillo INT NOT NULL,
    cantPlatillos INT NOT NULL,
    CHECK (cantPlatillos>0),
    idPedido INT NOT NULL,
    subtotal INT DEFAULT 0,
    FOREIGN KEY (idPlatillo) REFERENCES Platillo(id),
    FOREIGN KEY (idPedido) REFERENCES Pedidos(id)
);