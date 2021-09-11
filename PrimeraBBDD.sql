/*
Antes de crear cualquier tabla y de 
realizar consultas sobre ella, es necesario
crear una base de datos. Esto se logra 
mediante la consulta CREATE DATABASE. 
*/
CREATE DATABASE concesionario;
/* 
Para crear una tabla, usaremos la consulta
CREATE TABLE.
*/
CREATE TABLE Vehiculos (
    placa VARCHAR(10) NOT NULL,
    marca VARCHAR(50) NOT NULL,
    modelo VARCHAR(50) NOT NULL,
    kilometraje INT NOT NULL,
    fecha_venta DATE,
    documento_vendedor INT NOT NULL,
    PRIMARY KEY (placa)
);

CREATE TABLE Vendedores (
    documento_vendedor INT NOT NULL,
    nombres VARCHAR(50) NOT NULL,
    apellidos VARCHAR(50) NOT NULL,
    ciudad VARCHAR(50) NOT NULL,
    PRIMARY KEY (documento_vendedor)
);
/* 
En el recuadro anterior podemos apreciar 
como se crean las dos tablas, vehiculos  y 
vendedores, usando dos consultas SQL. En 
cada una se define el nombre de la tabla y 
entre paréntesis los diferentes campos, 
incluyendo su nombre, tipo de dato y si son
obligatorios ( NOT NULL) o no. Finalmente, 
con la cláusula  PRIMARY KEY indicamos cuál
de los campos de la tabla es la clave primaria
*/
/*
Es posible alterar una tabla, así como sus 
propiedades o las propiedades de sus campos.
Esto se puede lograr mediante la cláusula 
ALTER TABLE . Arriba, creamos las tablas y 
definimos sus claves primarias, pero olvidamos
definir sus claves foráneas, para lo cual 
podremos utilizar después ALTER TABLE , así.
*/
ALTER TABLE Vehiculos
ADD FOREIGN KEY (documento_vendedor) REFERENCES Vendedores(documento_vendedor);
/*
Con la anterior consulta estamos definiendo 
el campo documento_vendedor  de la tabla 
vehiculos como clave foránea, vinculada con 
la clave primaria  documento_vendedor de la 
tabla vendedores. Y así, implementamos la 
relación entre las dos tablas.
*/
/*
Una vez se han creado las tablas, podremos 
insertar registros en ellas. Para esto se 
utiliza la consulta INSERT INTO . Obviamente, 
debemos tener en cuenta las restricciones y 
tipos de datos de los diferentes campos. Es 
así como, a continuación, se insertan 
registros en las dos tablas mostradas arriba.
*/
INSERT INTO Vendedores (documento_vendedor, nombres, apellidos, ciudad) VALUES('1964', 'Juan', 'Rodriguez', 'Medellin');
INSERT INTO Vendedores (documento_vendedor, nombres, apellidos, ciudad) VALUES ('2853', 'José', 'González', 'Bogotá');

INSERT INTO Vehiculos (placa, marca, modelo, kilometraje, fecha_venta, documento_vendedor) VALUES ('ACD 427', 'Renault', 'Stepway', '25000', '2020-7-05', '1964');
INSERT INTO Vehiculos (placa, marca, modelo, kilometraje, fecha_venta, documento_vendedor) VALUES ('IYU 521', 'Renault', 'Clío', '70200', null, '2853'); 
/*
El código anterior incluye cuatro consultas. 
Con las dos primeras insertamos dos registros 
en la tabla vendedores , creada arriba. Con 
las dos últimas, insertamos dos registros en 
la tabla vehiculos . Estos registros 
corresponden a las tablas de ejemplo que se 
pueden apreciar más arriba. Las consultas 
INSERT INTO , en este caso, incluyen:
• El nombre de la tabla donde insertaremos el 
registro.
• Entre paréntesis, y separados por comas, los
 nombres de los campos donde registraremos los
 datos.
• Y luego de la palabra VALUES , y entre
 paréntesis y separados por comas, los valores
 que vamos a asignar a los campos respectivos.
 Si nos fijamos, estos corresponden 
 exactamente entre ellos.
*/
/*
Una vez tenemos una o varias tablas y estas 
cuentan con registros, podemos realizar 
consultas para recuperar uno o varios 
registros que cumplan determinada condición, 
usando la cláusula SELECT . Estas consultas 
siguen, por lo general, la siguiente forma:
SELECT campo1, campo2, ... FROM nombre_tabla 
WHERE condición; 
• Después de la cláusula SELECT , la lista de 
campos de los cuales queremos obtener la 
información con la consulta.
• Después de la palabra FROM , la tabla desde 
la cual queremos obtener la información.
• Y siguiendo a WHERE , la o las condiciones 
que deben cumplir cada uno de los registros de
los cuales queremos obtener información. 
*/
SELECT * FROM vendedores;
/*
En el ejemplo anterior, en lugar de la lista 
de campos, tenemos un asterisco (*), lo cual 
implica que se quieren recuperar todos los 
campos de cada registro. Luego, al no incluir
 una condición, recupera todos los registros 
 de la tabla.
*/
SELECT placa, marca, fecha_venta FROM vehiculos;  
/*
En este ejemplo, al no incluir una condición, 
se recuperan todos los registros de la tabla 
vehículos, pero sólo los campos placa , marca
 y  fecha_venta.
*/
SELECT documento_vendedor, nombres, apellidos, ciudad FROM vendedores WHERE ciudad = 'Medellín';  
/*
En el ejemplo de arriba, se consultan los 
campos documento_vendedor , nombres,  
apellidos y  ciudad de la tabla vendedores  
en los cuales ciudad sea Medellín. Si ningún 
registro cumple la condición, no devolverá 
ninguno.
*/
SELECT placa, modelo, kilometraje FROM vehiculos WHERE fecha_venta > '2020-1-01';  
/*
En este ejemplo, se recuperan los campos placa
 , modelo y  kilometraje de los registros de 
 la tabla vehículos  cuya fecha de venta sea
 superior al primero de enero de 2020.
*/
SELECT placa, marca, modelo, kilometraje FROM vehículos WHERE kilometraje > '20000' AND modelo = 'Stepway'; 
/*
En este ejemplo, se recuperan los campos placa
,marca,  modelo y kilometraj e de los 
vehículos cuyo kilometraje sea mayor a 20000 
y sean del modelo Stepway. Como podemos 
observar en este caso, las condiciones pueden
ser compuestas, y existe una notación que 
permite una amplia variedad de notaciones en 
ese sentido.
*/
/*
Es posible que necesitemos actualizar, o bien,
modificar uno o varios registros existentes en
una tabla. Para eso, usamos la cláusula UPDATE
. Estas consultas siguen, por lo general, la 
siguiente forma:

UPDATE nombre_tabla
SET columna1 = valor1, columna2 = valor2, ...
WHERE condición;

• Después de la palabra UPDATE , el nombre de 
la tabla en la cual queremos actualizar o 
modificar información.
• Después de la palabra SET  y separados por 
comas, los cambios que queremos realizar, 
asignando el nuevo valor a su respectivo campo.
• Después de WHERE , tal como en las consultas
SELECT, la o las condiciones que deben cumplir
los registros en los que actualizaremos los 
campos especificados.
*/
UPDATE vehiculos
SET kilometraje = '100000'
WHERE placa = 'ACD 427';
/*
En el primer ejemplo buscamos actualizar la 
tabla vehículos , cambiando el campo 
kilometraje a 100000 en el registro cuya placa 
es ACD 427. En este caso estaremos cambiando 
el kilometraje de un solo vehículo, ya que la 
placa es clave principal.
*/
UPDATE vendedores
SET ciudad = 'Medellín';
/*
En este ejemplo, al no incluir una condición, 
estamos cambiando la ciudad  de todos los 
registros de la tabla vendedores  a Medellín.
*/
UPDATE vehiculos
SET modelo = 'Sandero', fecha_venta = '2021-5-06'
WHERE documento_vendedor = '2853'; 
/*
En el ejemplo anterior, se cambia el valor de 
los campos modelo  y fecha_venta a el o los 
vehículos asignados al vendedor con documento 
2853.
*/
UPDATE vehiculos 
SET 
    kilometraje = '20000'
WHERE
    fecha_venta >= '2021-1-01'
        OR fecha_venta < '2020-1-01'; 
/*
En este último ejemplo, en cambio, actualizamos 
a 20000 el kilometraje de los vehículos cuya 
fecha de venta no está en el año 2020. Como 
podemos observar, en este caso también es posible 
hacer diferentes combinaciones lógicas en la 
cláusula WHERE.
*/
/*
Entre otras consultas, en SQL en general, y MySQL
en particular, contamos con aquellas usadas para 
la eliminación de registros. Para eso, usamos la 
cláusula DELETE. Estas consultas siguen, por lo 
general, la siguiente forma:

DELETE FROM nombre_tabla WHERE condición; 
 
Basta con incluir:
• Después de DELETE FROM, el nombre de la tabla 
en la cual eliminaremos los registros.
• Luego de la cláusula WHERE, como siempre, la 
condición que deberán cumplir los registros a 
eliminar.

A continuación, podemos observar tres ejemplos:

DELETE FROM vehiculos;  
En el primer ejemplo, al carecer de una condición,
con la consulta se busca eliminar todos los 
registros de la tabla vehículos.

DELETE FROM vendedores WHERE ciudad = 'Bogotá';  
En el segundo ejemplo, se busca eliminar todos 
los registros de la tabla vendedores asociados a 
la ciudad de Bogotá.

DELETE FROM vehiculos WHERE marca = 'Renault' AND fecha_venta > '2020-1-01';  
Finalmente, en el tercer ejemplo, se busca 
eliminar todos los registros de la tabla vehículos
, cuya marca sea Renault y su fecha de venta sea 
a partir del 1 de enero de 2020.
*/