CREATE TABLE Usuarios (
   id INT PRIMARY KEY AUTO_INCREMENT,
   usuario VARCHAR(20),
   nombre VARCHAR(20),
   sexo VARCHAR(1),
   nivel TINYINT,
   email VARCHAR(50),
   telefono VARCHAR(20),
   marca VARCHAR(20),
   compania VARCHAR(20),
   saldo FLOAT,
   activo BOOLEAN
);

INSERT INTO Usuarios 
VALUES 
('1','BRE2271','BRENDA','M','2','brenda@live.com','655-330-5736','SAMSUNG','IUSACELL','100','1'),
('2','OSC4677','OSCAR','H','3','oscar@gmail.com','655-143-4181','LG','TELCEL','0','1'),
('3','JOS7086','JOSE','H','3','francisco@gmail.com','655-143-3922','NOKIA','MOVISTAR','150','1'),
('4','LUI6115','LUIS','H','0','enrique@outlook.com','655-137-1279','SAMSUNG','TELCEL','50','1'),
('5','LUI7072','LUIS','H','1','luis@hotmail.com','655-100-8260','NOKIA','IUSACELL','50','0'),
('6','DAN2832','DANIEL','H','0','daniel@outlook.com','655-145-2586','SONY','UNEFON','100','1'),
('7','JAQ5351','JAQUELINE','M','0','jaqueline@outlook.com','655-330-5514','BLACKBERRY','AXEL','0','1'),
('8','ROM6520','ROMAN','H','2','roman@gmail.com','655-330-3263','LG','IUSACELL','50','1'),
('9','BLA9739','BLAS','H','0','blas@hotmail.com','655-330-3871','LG','UNEFON','100','1'),
('10','JES4752','JESSICA','M','1','jessica@hotmail.com','655-143-6861','SAMSUNG','TELCEL','500','1'),
('11','DIA6570','DIANA','M','1','diana@live.com','655-143-3952','SONY','UNEFON','100','0'),
('12','RIC8283','RICARDO','H','2','ricardo@hotmail.com','655-145-6049','MOTOROLA','IUSACELL','150','1'),
('13','VAL6882','VALENTINA','M','0','valentina@live.com','655-137-4253','BLACKBERRY','AT&T','50','0'),
('14','BRE8106','BRENDA','M','3','brenda2@gmail.com','655-100-1351','MOTOROLA','NEXTEL','150','1'),
('15','LUC4982','LUCIA','M','3','lucia@gmail.com','655-145-4992','BLACKBERRY','IUSACELL','0','1'),
('16','JUA2337','JUAN','H','0','juan@outlook.com','655-100-6517','SAMSUNG','AXEL','0','0'),
('17','ELP2984','ELPIDIO','H','1','elpidio@outlook.com','655-145-9938','MOTOROLA','MOVISTAR','500','1'),
('18','JES9640','JESSICA','M','3','jessica2@live.com','655-330-5143','SONY','IUSACELL','200','1'),
('19','LET4015','LETICIA','M','2','leticia@yahoo.com','655-143-4019','BLACKBERRY','UNEFON','100','1'),
('20','LUI1076','LUIS','H','3','luis2@live.com','655-100-5085','SONY','UNEFON','150','1'),
('21','HUG5441','HUGO','H','2','hugo@live.com','655-137-3935','MOTOROLA','AT&T','500','1');

SELECT * FROM usuarios;

# 1. Listar los nombres de los usuarios
SELECT nombre FROM usuarios;

# 2. Calcular el saldo máximo de los usuarios de sexo “Mujer”
SELECT nombre, sexo, max(saldo) FROM usuarios WHERE sexo = "M";

# 3. Listar nombre y teléfono de los usuarios con teléfono NOKIA, BLACKBERRY o SONY
SELECT 	nombre, telefono, marca FROM usuarios 
WHERE marca = "NOKIA" OR marca = "BLACKBERRY" OR marca = "SONY";

# 4. Contar los usuarios sin saldo o inactivos
SELECT count(*) FROM usuarios 
WHERE saldo = 0 OR activo = 0;

# 5. Listar el usuario de los usuarios con nivel 1, 2 o 3
SELECT usuario, nivel FROM usuarios 
WHERE nivel = 1 OR nivel = 2 OR nivel = 3;

# 6. Listar los números de teléfono con saldo menor o igual a 300
SELECT telefono, saldo FROM usuarios 
WHERE saldo <= 300;

# 7. Calcular la suma de los saldos de los usuarios de la compañía telefónica NEXTEL
SELECT sum(saldo) saldos_nextel, compania FROM usuarios 
WHERE compania = "NEXTEL";

# 8. Contar el número de usuarios por compañía telefónica
SELECT COUNT(*) usuarios, compania FROM usuarios
GROUP BY compania;

# 9. Contar el número de usuarios por nivel
SELECT COUNT(*), nivel FROM usuarios
GROUP BY nivel;

# 10. Listar el login de los usuarios con nivel 2
SELECT usuario, email FROM usuarios
WHERE email LIKE "%@gmail.com";

# 11. Mostrar el email de los usuarios que usan gmail
SELECT email FROM usuarios 
WHERE email LIKE "%gmail.com";

# 12. Listar nombre y teléfono de los usuarios con teléfono LG, SAMSUNG o MOTOROLA
SELECT nombre, telefono, marca FROM usuarios
WHERE marca="LG" OR marca="SAMSUNG" OR marca="MOTOROLA";

# 13. Listar nombre y teléfono de los usuarios con teléfono que no sea de la marca LG o SAMSUNG
SELECT nombre, telefono, marca FROM usuarios
WHERE marca!="LG" AND marca!="SAMSUNG";

# 14. Listar el login y teléfono de los usuarios con compañía telefónica IUSACELL
SELECT usuario, telefono, compania FROM usuarios
WHERE compania="IUSACELL";

# - 15. Listar el login y teléfono de los usuarios con compañía telefónica que no sea TELCEL
SELECT usuario, telefono, compania FROM usuarios
WHERE compania="TELCEL";

# 16. Calcular el saldo promedio de los usuarios que tienen teléfono marca NOKIA
SELECT avg(saldo) FROM usuarios
WHERE marca="NOKIA";

# 17. Listar el login y teléfono de los usuarios con compañía telefónica IUSACELL o AXEL
SELECT nombre, telefono, compania FROM usuarios
WHERE compania="IUSACELL" OR compania="AXEL";

# 18. Mostrar el email de los usuarios que no usan yahoo
SELECT nombre, email FROM usuarios 
WHERE email NOT LIKE "%yahoo.com%";

# 19. Listar el login y teléfono de los usuarios con compañía telefónica que no sea TELCEL o IUSACELL
SELECT nombre, telefono, compania FROM usuarios
WHERE compania!="IUSACELL" OR compania!="TELCEL";

# 20. Listar el login y teléfono de los usuarios con compañía telefónica UNEFON
SELECT nombre, telefono, marca FROM usuarios
WHERE compania="UNEFON";

# 21. Listar las diferentes marcas de celular en orden alfabético descendentemente
SELECT marca FROM usuarios ORDER BY marca DESC;

# 22. Listar las diferentes compañías en orden alfabético aleatorio
SELECT DISTINCT compania FROM usuarios ORDER BY compania;

# 23. Listar el login de los usuarios con nivel 0 o 2
SELECT usuario FROM usuarios
WHERE nivel = 0 OR nivel = 2;

# 24. Calcular el saldo promedio de los usuarios que tienen teléfono marca LG
SELECT avg(saldo), marca FROM usuarios
WHERE marca = "LG";

# 25. Listar el login de los usuarios con nivel 1 o 3
SELECT usuario, nivel FROM usuarios
WHERE nivel = 1 OR nivel = 3;

# 26. Listar nombre y teléfono de los usuarios con teléfono que no sea de la marca BLACKBERRY
SELECT nombre, telefono, marca FROM usuarios
WHERE marca!="BLACKBERRY";

# 27. Listar el login de los usuarios con nivel 3
SELECT usuario, nivel FROM usuarios
WHERE nivel = 3;

# 28. Listar el login de los usuarios con nivel 0
SELECT usuario, nivel FROM usuarios
WHERE nivel = 0;

# 29. Listar el login de los usuarios con nivel 1
SELECT usuario, nivel FROM usuarios
WHERE nivel = 1;

# 30. Contar el número de usuarios por sexo
SELECT count(usuario), sexo FROM usuarios
GROUP BY sexo;

# 31. Listar el login y teléfono de los usuarios con compañía telefónica AT&T
SELECT usuario, telefono, compania FROM usuarios
WHERE compania = "AT&T";

# 32. Listar las diferentes compañías en orden alfabético descendentemente
SELECT DISTINCT compania FROM usuarios ORDER BY compania DESC;

# 33. Listar el login de los usuarios inactivos
SELECT usuario, activo FROM usuarios WHERE activo = 1;

# 34. Listar los números de teléfono sin saldo
SELECT telefono, saldo FROM usuarios
WHERE saldo = 0;

# 35. Calcular el saldo mínimo de los usuarios de sexo “Hombre”
SELECT min(saldo), sexo FROM usuarios 
WHERE sexo = "H";

# 36. Listar los números de teléfono con saldo mayor a 300
SELECT telefono, saldo FROM usuarios
WHERE saldo > 300;

# 37. Contar el número de usuarios por marca de teléfono
SELECT count(*), marca FROM usuarios 
GROUP BY marca;

# 38. Listar nombre y teléfono de los usuarios con teléfono que no sea de la marca LG
SELECT nombre, telefono, marca FROM usuarios 
WHERE marca != "LG";

# 39. Listar las diferentes compañías en orden alfabético ascendentemente
SELECT DISTINCT compania FROM usuarios ORDER BY compania ASC;

# 40. Calcular la suma de los saldos de los usuarios de la compañía telefónica UNEFON
SELECT sum(saldo) FROM usuarios
WHERE compania = "UNEFON";

# 41. Mostrar el email de los usuarios que usan hotmail
SELECT email emailsHotmail FROM usuarios 
WHERE email LIKE "%hotmail.com%";

# 42. Listar los nombres de los usuarios sin saldo o inactivos
SELECT nombre, saldo, activo FROM usuarios
WHERE saldo = 0 OR activo = 0;

# 43. Listar el login y teléfono de los usuarios con compañía telefónica IUSACELL o TELCEL
SELECT usuario, telefono, compania FROM usuarios
WHERE compania = "IUSACELL" OR compania = "TELCEL";

# 44. Listar las diferentes marcas de celular en orden alfabético ascendentemente
SELECT DISTINCT marca FROM usuarios ORDER BY marca ASC;

# 45. Listar las diferentes marcas de celular en orden alfabético aleatorio
SELECT DISTINCT marca FROM usuarios;

# 46. Listar el login y teléfono de los usuarios con compañía telefónica IUSACELL o UNEFON
SELECT usuario, telefono, compania FROM usuarios 
WHERE compania = "IUSACELL" OR compania = "UNEFON";

# 47. Listar nombre y teléfono de los usuarios con teléfono que no sea de la marca MOTOROLA o NOKIA
SELECT nombre, telefono, marca FROM usuarios
WHERE marca != "MOTOROLA" OR marca != "NOKIA";

# 48. Calcular la suma de los saldos de los usuarios de la compañía telefónica TELCEL
SELECT sum(saldo) FROM usuarios 
WHERE compania = "TELCEL";