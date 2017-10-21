-- MySQL dump 10.13  Distrib 5.5.32, for debian-linux-gnu (i686)
--
-- Host: localhost    Database: vendedores_development
-- ------------------------------------------------------
-- Server version	5.5.32-0ubuntu0.13.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `authors`
--

DROP TABLE IF EXISTS `authors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `authors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authors`
--

LOCK TABLES `authors` WRITE;
/*!40000 ALTER TABLE `authors` DISABLE KEYS */;
INSERT INTO `authors` VALUES (3,'Dan','Brown','2013-07-22 08:33:36','2013-07-22 08:33:36'),(4,'Laura','Gallego','2013-07-22 08:34:17','2013-07-22 08:34:17'),(5,'Javier','Sierra','2013-07-22 08:34:54','2013-07-22 08:34:54'),(6,'Alicia','Gimenez Bartlett','2013-07-22 08:42:25','2013-07-22 08:42:25'),(12,'Laura','Gallego','2017-03-07 19:12:01','2017-03-07 19:12:01'),(13,'Dan','Brown','2017-03-09 17:33:46','2017-03-09 17:33:46'),(14,'Elísabet','Benavent','2017-03-09 17:54:01','2017-03-09 17:54:01'),(15,'Fernando','Aramburu','2017-03-09 18:02:35','2017-03-09 18:02:35'),(16,'Javier','Cercas','2017-03-09 18:06:26','2017-03-09 18:06:26'),(17,'Ken','Liu','2017-03-09 18:09:53','2017-03-09 18:09:53'),(18,'Joe','Abercrombie','2017-03-09 18:15:39','2017-03-09 18:15:39'),(19,'H.P.','Lovecraft','2017-03-09 18:20:50','2017-03-09 18:20:50'),(20,'August','Derleth','2017-03-09 18:21:02','2017-03-09 18:21:02'),(21,'William','March','2017-03-09 18:25:14','2017-03-09 18:25:14'),(22,'Emilia','Pardo Bazán','2017-03-09 18:27:40','2017-03-09 18:27:40'),(23,'Luz','Gabás','2017-03-09 18:33:28','2017-03-09 18:33:28'),(24,'Paulo','Coelho','2017-03-09 18:38:25','2017-03-09 18:38:25'),(25,'Gonzalo','Giner','2017-03-09 18:41:26','2017-03-09 18:41:26'),(26,'Santiago','Posteguillo','2017-03-09 18:47:00','2017-03-09 18:47:00'),(27,'Juan Pedro','Cosano','2017-03-09 18:50:11','2017-03-09 18:50:11'),(28,'Hope','Jahren','2017-03-09 19:18:46','2017-03-09 19:18:46'),(30,'Pilar','Urbano','2017-03-09 19:21:30','2017-03-09 19:21:30'),(31,'Beatriz','Esteban','2017-03-09 19:27:15','2017-03-09 19:27:15'),(32,'Dan','Abnett','2017-03-09 19:28:25','2017-03-09 19:28:25'),(33,'An','Author','2017-03-10 20:43:43','2017-03-10 20:43:43'),(34,'Jose Antonio','Gómez Iglesias','2017-08-18 11:57:32','2017-08-18 11:57:32'),(35,'María','Leach','2017-08-18 12:04:16','2017-08-18 12:04:16'),(36,'Monika','Zgustova','2017-08-18 12:16:59','2017-08-18 12:16:59'),(37,'Eva ','García Sáenz de Urturi','2017-08-18 12:32:44','2017-08-18 12:32:44');
/*!40000 ALTER TABLE `authors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `authors_books`
--

DROP TABLE IF EXISTS `authors_books`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `authors_books` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `author_id` int(11) NOT NULL,
  `book_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_authors_books_authors` (`author_id`),
  KEY `fk_authors_books_books` (`book_id`),
  CONSTRAINT `fk_authors_books_authors` FOREIGN KEY (`author_id`) REFERENCES `authors` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_authors_books_books` FOREIGN KEY (`book_id`) REFERENCES `books` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authors_books`
--

LOCK TABLES `authors_books` WRITE;
/*!40000 ALTER TABLE `authors_books` DISABLE KEYS */;
INSERT INTO `authors_books` VALUES (9,3,2,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(11,4,3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(19,4,13,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(20,4,14,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(21,4,15,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(22,4,16,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(23,4,17,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(24,4,18,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(25,4,19,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(26,3,4,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(27,14,20,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(28,15,21,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(29,16,22,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(30,17,23,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(31,18,24,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(32,19,25,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(33,20,25,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(34,21,26,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(35,22,27,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(36,23,28,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(37,24,29,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(38,25,30,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(39,25,31,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(40,26,32,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(41,27,33,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(42,27,34,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(43,27,35,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(44,27,36,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(46,28,37,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(47,30,38,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(48,30,39,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(49,32,40,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(50,33,41,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(51,33,42,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(52,34,43,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(53,35,44,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(54,36,45,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(55,37,46,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(56,35,47,'0000-00-00 00:00:00','0000-00-00 00:00:00');
/*!40000 ALTER TABLE `authors_books` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `books`
--

DROP TABLE IF EXISTS `books`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `books` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `publisher_id` int(11) NOT NULL,
  `published_at` datetime DEFAULT NULL,
  `isbn` varchar(13) DEFAULT NULL,
  `blurb` text,
  `page_count` int(11) DEFAULT NULL,
  `price` float DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `cover_image_file_name` varchar(255) DEFAULT NULL,
  `cover_image_content_type` varchar(255) DEFAULT NULL,
  `cover_image_file_size` int(11) DEFAULT NULL,
  `cover_image_updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_books_publishers` (`publisher_id`),
  CONSTRAINT `fk_books_publishers` FOREIGN KEY (`publisher_id`) REFERENCES `publishers` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `books`
--

LOCK TABLES `books` WRITE;
/*!40000 ALTER TABLE `books` DISABLE KEYS */;
INSERT INTO `books` VALUES (2,'Inferno',6,'2013-07-18 20:57:00','9788408114178','Dan Brown vuelve a los misterios históricos con su personaje favorito, el profesor de simbología Robert Langdon, con la  novela Inferno, inspirada en La Divina Comedia de Dante y que saldrá a la venta el 16 de mayo.\r\nEn sus bestsellers internacionales El código Da Vinci, Ángeles y demonios y El símbolo perdido, Dan Brown aunó con maestría historia, arte, códigos y símbolos. En su fascinante nuevo thriller, Brown recupera su esencia con su novela más ambiciosa hasta la fecha.\r\nEn el corazón de Italia, el catedrático de Simbología de Harvard Robert Langdon se ve arrastrado a un mundo terrorífico centrado en una de las obras maestras de la Literatura más imperecederas y misteriosas de la Historia: el Infierno de Dante.\r\nCon este telón de fondo, Langdon se enfrenta a un adversario escalofriante y lidia con un acertijo ingenioso en un escenario de arte clásico, pasadizos secretos y ciencia futurista. Apoyándose en el oscuro poema épico de Dante, Langdon, en una carrera contrarreloj, busca respuestas y personas de confianza antes de que el mundo cambie irrevocablemente.',640,37.78,'2013-07-18 21:00:31','2017-04-01 17:39:12','inferno.jpg','image/jpeg',3303,'2013-07-18 21:00:31'),(3,'El libro de los portales',9,'2013-07-18 21:02:00','9788445001301','El libro de los portales, de Laura Gallego, autora de otras obras como Alas negras o Memorias de Idhun: La resistencia, es una novela de fantasía juvenil de la autora nacional de fantasía con más seguidores. En 1999 ganó el Premio El Barco de Vapor con Finis Mundi. Tres años después volvió a obtener el mismo galardón con La leyenda del Rey Errante. En 2012 su novela Donde los árboles cantan fue galardonada con el Premio Nacional de Literatura Infantil y Juvenil. El libro de los portales es una increíble novela de fantasía , en la que la autora se vuelve a superar con un mundo muy verosímil y unos personajes redondos y complejos. Tiene todos los elementos que sus lectores esperan encontrar: protagonistas adolescentes y carismáticos, aventuras, un misterio por resolver, personajes de distintos lugares y clases sociales, amistad y amor. En sus novelas, Laura Gallego sabe crear nuevos mundos fantásticos como los más grandes del género, pero a medida que desarrolla ese nuevo mundo, toman especial relevancia el amor y las relaciones personales entre sus protagonistas, que expresan sus sentimientos, dudas, recelos, decepciones, etc.\r\nUn mundo en el que no existen fronteras para aquellos que se atreven a mirar más allá. Los pintores de la Academia de los Portales son los únicos que saben cómo dibujar los extraordinarios portales de viaje que constituyen la red de comunicación y transporte más importante de Darusia. Sus rígidas normas y su exhaustiva formación garantizan una impecable profesionalidad y perfección técnica en todos sus trabajos. Cuando Tabit, estudiante de último año en la Academia, recibe el encargo de pintar un portal para un humilde campesino, no imagina que está a punto de verse involucrado en una trama de intrigas y secretos que podría sacudir los mismos cimientos de la institución.',496,14.95,'2013-07-18 21:04:46','2017-08-20 17:37:24','el-libro-de-los-portales.jpg','image/jpeg',3199,'2013-07-18 21:04:46'),(4,'El símbolo perdido',6,'2013-07-22 08:30:00','9788408099222','¿Existe un secreto tan poderoso que, de salir a la luz, sea capaz de cambiar el mundo? \r\nWashington. El experto en simbología Robert Langdon es convocado inesperadamente por Peter Solomon, masón, filántropo y su antiguo mentor, para dar una conferencia en el Capitolio. Pero el secuestro de Peter y el hallazgo de una mano tatuada con cinco enigmáticos símbolos cambian drásticamente el curso de los acontecimientos. Atrapado entre las exigencias de una mente perturbada y la investigación oficial, Langdon se ve inmerso en un mundo clandestino de secretos masónicos, historia oculta y escenarios nunca antes vistos, que parecen arrastrarlo hacia una sencilla pero inconcebible verdad.',784,21.9,'2013-07-22 08:32:37','2017-04-01 17:39:45','el-simbolo-perdido.jpg','image/jpeg',15728,'2013-07-22 08:32:37'),(13,'Mandrágora',10,'2016-02-10 02:12:00','978-849142033','Cornelius, el sabio de la corte del rey Héctor, desaparece en extrañas circunstancias. Se busca un sustituto inmediato, y el erudito Zacarías llega a la corte acompañado de su hija, la joven Miriam.\r\n\r\nEn las sombras, alguien conspira contra el rey para derrocarlo y apoderarse del reino. Miriam y Zacarías se verán envueltos en una trama de ambición, venganza y magia negra que pondrá sus vidas en peligro.',200,10.4,'2017-03-07 19:30:09','2017-08-20 17:38:08','Mandrágora.jpg','image/jpeg',22814,'2017-03-07 19:30:09'),(14,'Cuando me veas',6,'2017-02-28 02:15:00','978-840816756','Desde hace unas semanas corren rumores acerca de extraños sucesos que no tienen explicación. Algunos alumnos afirman haber sido atacados por una fuerza invisible; otros aseguran que han visto objetos moviéndose solos por el aire o que han sentido una extraña presencia acechándolos por los pasillos.\r\n\r\n¿A qué nos enfrentamos exactamente? En la redacción de Voces hemos recogido teorías para todos los gustos, pero la explicación paranormal es la que tiene más aceptación. Al fin y al cabo, todos recordamos la historia del tristemente célebre “chico de la azotea”…\r\n\r\nAsí pues, ¿hay un fantasma en el instituto? Si es así, ¿quién es, y qué intenciones tiene? No lo sabemos aún, pero puede que no tardemos mucho en averiguarlo.',382,13.95,'2017-03-07 19:33:34','2017-08-20 17:39:05','Cuando_me_veas.jpg','image/jpeg',76001,'2017-03-07 19:33:34'),(15,'El coleccionista de relojes extraordinarios',11,'2016-08-18 18:16:00','978-84-675-89','Para salvar el alma de su madrastra, Jonathan debe encontrar el reloj Deveraux antes de que transcurran doce horas. Está en algún lugar de la Ciudad Antigua. Pero a medida que avanza la noche, la ciudad va transformándose. Es y no es la misma…',236,8.46,'2017-03-07 19:37:21','2017-03-07 19:37:21','El_coleccionista_de_relojes_extraordinarios.gif','image/gif',33627,'2017-03-07 19:37:21'),(16,'Todas las hadas del reino',12,'2015-09-01 04:19:00','978-84-9043-3','Camelia es un hada madrina que lleva trescientos años ayudando con gran eficacia a jóvenes doncellas y aspirantes a héroe para que alcancen sus propios finales felices. Su magia y su ingenio nunca le han fallado, pero todo empieza a complicarse cuando le encomiendan a Simón, un mozo de cuadra que necesita su ayuda desesperadamente. Camelia ha solucionado casos más difíciles; pero, por algún motivo, con Simón las cosas comienzan a torcerse de forma inexplicable…',477,15.95,'2017-03-07 19:40:47','2017-03-07 19:40:47','Todas_las_hadas_del_reino.jpg','image/jpeg',108011,'2017-03-07 19:40:47'),(17,' Dos velas para el diablo',11,'2012-12-03 20:24:00','978-84-675-27','Hoy en día ya nadie cree en los ángeles…\r\n\r\nCat es una adolescente que se ha pasado casi toda su vida viajando de un lado a otro con su padre. Cuando éste es asesinado, ella lo pierde prácticamente todo y jura que encontrará a quien lo hizo y se lo hará pagar. No será una búsqueda fácil, pero Cat no es una chica corriente. Su padre era un ángel, lo cual significa que sólo alguien con un poder semejante al suyo podría haberlo derrotado. Y Cat está dispuesta a pactar con los mismos demonios con tal de averiguar quién fue.',414,17.5,'2017-03-07 19:43:57','2017-03-07 19:43:57','Dos_velas_para_el_diablo.jpg','image/jpeg',10927,'2017-03-07 19:43:57'),(18,'La hija de la noche',13,'2012-11-14 01:39:00','978-84-236-75','La tranquilidad del pequeño pueblo francés de Beaufort se ve alterada por un hecho que, en principio, parece carecer de una explicación razonable. El granjero Henri Morillon ha encontrado muerta una de sus vacas en extrañas circunstancias: completamente desangrada.\r\n\r\nAlgunos habitantes del pueblo, como el joven Jerôme, creen que la mansión Grisard guarda cierta relación con el suceso. El viejo caserón había permanecido deshabitado y abandonado durante muchos años, hasta que de repente se instala allí la bella y enigmática Isabelle, que regresa a la localidad que la vio nacer y de donde huyó tiempo atrás. El misterio que rodea a esta mujer despertará las sospechas de sus vecinos, y el gendarme del lugar, el joven Max, comienza a investigar.',196,9.45,'2017-03-07 19:47:01','2017-03-07 19:47:01','La_hija_de_la_noche.jpg','image/jpeg',74053,'2017-03-07 19:47:01'),(19,'Omnia. Todo lo que puedas soñar',12,'2016-03-10 00:05:00','978-849043649','Todo el mundo sabe que en Omnia, la gran tienda virtual, puedes comprar cualquier cosa. En su catálogo encontrarás todo lo que puedas imaginar, e incluso objetos que ni siquiera sospechabas que existían. Por eso, cuando Nico tira a la basura por accidente el peluche favorito de su hermana pequeña, no duda en buscar en su web uno igual para reemplazarlo. Pero un error informático inesperado lo conducirá hasta el mismo corazón de Omnia, un inmenso y extraordinario almacén en el que la búsqueda del peluche será solo el comienzo de una emocionante aventura.',288,13.25,'2017-03-09 17:29:44','2017-03-09 17:29:44','omniap.jpg','image/jpeg',65433,'2017-03-09 17:29:44'),(20,'La magia de ser Sofía',14,'2017-03-01 00:00:00','9788491291107','@BetaCoqueta, autora de «Saga Valeria», «Saga Silvia», «Mi elección», «Horizonte Martina» y la novela Mi isla, regresa con una nueva historia de amor diferente que habla de los sueños por cumplir, de las rutinas en las relaciones de toda la vida y de las conexiones entre seres que no se buscan y a quienes el destino se encarga de unir.\r\n\r\nSofía tiene tres amores: su gata Holly, los libros y El café de Alejandría.\r\nSofía trabaja allí como camarera y es feliz.\r\nSofía no tiene pareja y tampoco la busca, aunque desearía encontrar la magia.\r\nSofía experimenta un chispazo cuando él cruza por primera vez la puerta.\r\nÉl aparece por casualidad guiado por el aroma de las partículas de café...\r\n...o tal vez por el destino.\r\nÉl se llama Héctor y está a punto de descubrir dónde reside la magia.\r\n\r\nDespués del éxito arrollador de sus anteriores libros, Elísabet Benavent, también conocida como @BetaCoqueta, regresa con La magia de ser Sofía, la primera parte de una bilogía que nos cuenta, con frescura y humor, lo que sucede cuando dos personas cargadas por el peso de las circunstancias se encuentran y descubren que la magia solo existe cuando se miran a los ojos.',528,16.06,'2017-03-09 18:00:30','2017-03-09 18:00:30','La_magia_de_ser_sofia.jpg','image/jpeg',8990,'2017-03-09 18:00:30'),(21,'Patria',15,'2016-11-06 18:03:00','9788490663196','El retablo definitivo sobre más de 30 años de la vida en Euskadi bajo el terrorismo.\r\nEl día en que ETA anuncia el abandono de las armas, Bittori se dirige al cementerio para contarle a la tumba de su marido el Txato, asesinado por los terroristas, que ha decidido volver a la casa donde vivieron. ¿Podrá convivir con quienes la acosaron antes y después del atentado que trastocó su vida y la de su familia? ¿Podrá saber quién fue el encapuchado que un día lluvioso mató a su marido, cuando volvía de su empresa de transportes? Por más que llegue a escondidas, la presencia de Bittori alterará la falsa tranquilidad del pueblo, sobre todo de su vecina Miren, amiga íntima en otro tiempo, y madre de Joxe Mari, un terrorista encarcelado y sospechoso de los peores temores de Bittori. ¿Qué pasó entre esas dos mujeres? ¿Qué ha envenenado la vida de sus hijos y sus maridos tan unidos en el pasado? Con sus desgarros disimulados y sus convicciones inquebrantables, con sus heridas y sus valentías, la historia incandescente de sus vidas antes y después del cráter que fue la muerte del Txato, nos habla de la imposibilidad de olvidar y de la necesidad de perdón en una comunidad rota por el fanatismo político.',648,21.75,'2017-03-09 18:04:42','2017-03-09 18:04:42','Patria.jpg','image/jpeg',6850,'2017-03-09 18:04:42'),(22,'El monarca de las sombras',16,'2017-01-20 03:11:00','9788439732570','Mas de quince años despues de la publicacion deSoldados de Salamina, Javier Cercas regresa a la Guerra Civil con una novela mas intima y personal, que indaga en el pasado mas incomodo de su familia.Ninguna familia escapa a su herencia.Sobre los vencedores y los vencidos, y los secretos que todos callamos.Esta es la novela que Javier Cercas se habia estado preparando para escribir desde que quiso ser novelista.O desde antes.El monarca de las sombras narra la busqueda del rastro perdido de un muchacho casi anonimo que peleo por una causa injusta y murio en el lado equivocado de la historia. Se llamaba Manuel Mena y en 1936, al estallar la guerra civil, se incorporo al ejercito de Franco; dos años despues murio combatiendo en la batalla del Ebro, y durante decadas se convirtio en el heroe oficial de su familia. Era tio abuelo de Javier Cercas, quien siempre se nego a indagar en su historia, hasta que se sintio obligado a hacerlo.El resultado de esa indagacion es una novela absorbente, pletorica de accion, de humor y de emocion, que nos enfrenta a algunos de los temas esenciales de la narrativa de Cercas: la naturaleza radiante, poliedrica y misteriosa del heroismo, la terca pervivencia de los muertos y la dificultad de hacerse cargo del pasado mas incomodo.Exploracion a la vez local y universal, personal y colectiva, novela belicosamente antibelicista, El monarca de las sombras da una vuelta de tuerca inesperada y deslumbrante a la pregunta sobre la herencia de la guerra que Cercas abrio años atras con Soldados de Salamina',288,19.85,'2017-03-09 18:08:26','2017-03-09 18:08:26','El_monarca_de_las_sombras.jpg','image/jpeg',9352,'2017-03-09 18:08:26'),(23,'El muro de las tormentas',17,'2017-03-02 03:01:00','9788491046011','Kuni Garu, ahora emperador Ragin tras su victoria en la Guerra del Crisantemo y el Diente de León, se enfrenta a la tarea de hacer realidad sus ideales de justicia y conservar el poder en una corte en la que las rivalidades son cada vez más abiertas. Distintas fuerzas y grupos pugnan por imponerse y se preparan para una lucha a largo plazo. Entre tanto, una nueva amenaza existencial se cierne sobre Dara desde el exterior. En la esperada continuación de \" La gracia de los reyes \" Ken Liu da un nuevo giro a la fantasía con una poderosa novela en la que tienen cabida batallas épicas y controversias filosóficas, intrigas políticas y criaturas sobrenaturales, invenciones tecnológicas y luchas entre los dioses... y el examen más extraordinario que se haya narrado nunca.',896,28.02,'2017-03-09 18:13:36','2017-03-09 18:13:36','El_muro_de_las_tormentas.jpg','image/jpeg',13503,'2017-03-09 18:13:36'),(24,'Filos mortales',17,'2016-11-17 05:27:00','978-84-9104-5','En el ejército de la Unión solo hay un individuo que se cree capaz de salvar la situación a la hora de enfrentarse a los gurkos: el incomparable coronel Sand dan Glokta.\r\nCurnden Craw y su grupo deben recuperar un objeto misterioso más allá del Crinna. Solo hay un pequeño problema: no saben qué es ese objeto.\r\nShevedieh, la ladrona más hábil de Estiria, va de desastre en desastre con su mejor amiga y mayor enemiga: Javre, la Leona de Hoskopp.\r\nDespués de años de masacres, el idealista Bethod trata de llevar la paz al Norte. Solo queda un obstáculo: su lunático guerrero, el hombre más temido del Norte, el sangriento Nuevededos.',368,50,'2017-03-09 18:19:16','2017-03-09 18:19:16','Filos_mortales.jpg','image/jpeg',43036,'2017-03-09 18:19:16'),(25,'La habitación cerrada y otros cuentros de terror',17,'2013-07-02 06:03:00','978-84-206-76','Miembro destacado del círculo de escritores que se formó en torno a H. P. Lovecraft (1890-1937), August Derleth sistematizó los ?mitos de Cthulhu? hasta transformarlos en una cosmogonía y logró una notable compenetración estilística con su inventor. No es de extrañar, por esta razón, que los apuntes y argumentos dejados por Lovecraft en el momento de su muerte sirvieran para una original empresa de colaboración póstuma, en la que resulta casi imposible deslindar las contribuciones del maestro y las aportaciones del discípulo. \"La habitación cerrada\" reúne diez relatos fruto de esa singular asociación, en los que están presentes todas la obsesiones de ese universo literario de horrores arquetípicos, caos abismal y oscuridad primigenia. ',280,10.2,'2017-03-09 18:23:35','2017-03-09 18:23:35','La_habitacion_cerrada_y_otros_cuentos_de_terror.jpg','image/jpeg',11690,'2017-03-09 18:23:35'),(26,'La mala semilla',17,'2017-02-23 06:14:00','978-84-9104-6','Rhoda Penmark es una niña modelo, estudiosa, educada, pulcra, aunque sus propios compañeros y aun algunos adultos perciban en ella algo turbio. Su madre, Christine, también advierte en ella ciertas cosas extrañas, comportamientos inquietantes, una frialdad, un egoísmo, una falta de empatía. Con su marido ausente por negocios, poco a poco entra en la terrible sospecha de que su hija puede tener algo que ver con algunos episodios terribles que han pasado por accidentales. En su soledad casi claustrofóbica, va progresando en su dolorosa y terrible averiguación, hasta que no puede seguir ocultándose que quizá sea la responsable directa de haber transmitido una mala semilla? ',256,11.5,'2017-03-09 18:27:02','2017-03-09 18:27:02','La_mala_semilla.jpg','image/jpeg',20090,'2017-03-09 18:27:02'),(27,'Un viaje de novios',17,'2012-03-31 22:15:00','978-84-206-55','Portada\r\nUn viaje de novios\r\n\r\nEmilia Pardo Bazán (autor/a)\r\nMaría Luisa Sotelo Vázquez (preparador/a)\r\n\r\n\r\nEscrita en la «década prodigiosa» de la narrativa española del xix, que vio la aparición de novelas como «La Regenta» (L 5009), «Fortunata y Jacinta» (BA 0136 y BA 0137) o «Los Pazos de Ulloa» (L 5008), UN VIAJE DE NOVIOS (1881) supuso una primera aproximación de EMILIA PARDO BAZÁN (1851-1921) a los dominios del realismo-naturalismo. A caballo entre la novela y el cuaderno de viaje, la obra narra las ingratas consecuencias del desatinado matrimonio entre un funcionario oportunista y cuarentón y una joven provinciana e inexperta, Lucía, quien, tras la unión, no tarda en verse sometida al creciente divorcio entre deseo y\r\nrealidad. Es precisamente el retrato de ésta ­«trazado de mano maestra», como apunta Marisa Sotelo Vázquez en su introducción a la obra­, hija única de un tendero de ultramarinos enriquecido, uno de los más acabados e inolvidables que puede encontrarse en toda la obra de la escritora gallega. ',280,10.2,'2017-03-09 18:29:57','2017-03-09 18:29:57','un_viaje_de_novios.jpg','image/jpeg',36369,'2017-03-09 18:29:57'),(28,'Como fuego en el hielo',6,'2017-01-31 07:34:00','978-84-08-161','El fatídico día en el que Attua tuvo que ocupar el lugar de su padre supo que su prometedor futuro se había truncado. Ahora debía regentar las termas que habían sido el sustento de su familia, en una tierra fronteriza a la que él nunca hubiera elegido regresar. Junto al suyo, también se frustró el deseo de Cristela, quien anhelaba una vida a su lado y, además, alejarse de su insoportable rutina en un entorno hostil. Un nuevo revés del destino pondrá a prueba el irrefrenable amor entre ellos; y así, entre malentendidos y obligaciones, decisiones y obsesiones, traiciones y lealtades, Luz Gabás teje una bella historia de amor, honor y superación.\r\nLos convulsos años de mediados del siglo xix, entre guerras carlistas y revoluciones; la construcción de un sueño en las indomables montañas que separan Francia y España; y una historia de amor que traspasa todas las barreras. Una novela escrita con el apasionante pulso narrativo de la autora de Palmeras en la nieve',576,576,'2017-03-09 18:37:01','2017-03-09 18:37:01','como_fuego_en_el_hielo.jpg','image/jpeg',41168,'2017-03-09 18:37:01'),(29,'El Alquimista',6,'2017-03-13 18:38:00','978-84-08-144','El Alquimista ha encontrado devotos seguidores en todo el mundo. Publicada en más de 170 países, es una de las novelas más traducidas del mundo (80 lenguas) y ha convertido a Paulo Coelho en uno de los autores más leídos de la historia. Poderosa, sencilla, sabia e inspiradora, ésta es la historia de Santiago, un joven pastor andaluz que viaja desde su tierra natal hacia el desierto egipcio en busca de un tesoro oculto en las pirámides. Nadie sabe lo que contiene el tesoro, ni si Santiago será capaz de superar los obstáculos del camino. Pero lo que comienza como un viaje en busca de riquezas se convierte en un descubrimiento del tesoro interior.\r\n\r\nRica, evocadora y profundamente humana, la historia de Santiago es un testimonio eterno de la fuerza transformadora de nuestros sueños y de la importancia de escuchar a nuestros corazones.',192,18,'2017-03-09 18:40:47','2017-03-09 18:40:47','el_alquimista.jpg','image/jpeg',37040,'2017-03-09 18:40:47'),(30,'Las ventanas del cielo',6,'2017-03-14 09:43:00','978-84-08-168','Siglo xv, Hugo de Covarrubias decide renunciar al destino que su padre, un mercader de lanas, le ha marcado. Su decisión hace que abandone Burgos, pero también a Berenguela, su íntima amiga, y a su ambicioso hermanastro Damián, que ansía hacerse con la empresa familiar. Pero todo cambia al descubrir que su padre está siendo traicionado. Se ve obligado a huir para salvar la vida embarcándose en un ballenero vasco, en el que conoce a Azerwan, un fascinante hombre que se define como contador de leyendas y con quien compartirá en África un prometedor negocio de venta de sal.\r\n\r\nLa venganza le hace escapar de nuevo, esta vez con una mujer, Ubayda, y un extraordinario halcón, Aylal, en busca de su verdadero destino: aprender el arte de las vidrieras.\r\n\r\nUna novela épica y de aventuras que se desarrolla en escenarios tan dispares como el desértico norte de África, la inexplorada Terranova y algunas de las más pujantes ciudades europeas de la época (Brujas, Lovaina o Burgos) y sus catedrales, en un tiempo en el cual sus viejas paredes se fueron abriendo para convertirse en auténticos sagrarios de cristal, ante los cuales los fieles creían sentirse a los pies de las ventanas del cielo.',736,22.5,'2017-03-09 18:43:32','2017-03-09 18:43:32','las_ventas_del_cielo.jpg','image/jpeg',50526,'2017-03-09 18:43:32'),(31,'Pacto de lealtad',6,'2014-05-27 02:44:00','978-84-08-127','Poco antes del estallido de la Guerra Civil, la vida de Zoe Urgazi se desmorona: su marido muere en la revolución asturiana al tiempo que ella descubre su infidelidad; su padre es encarcelado; y ella, sin ningún tipo de ingresos ni patrimonio, es desahuciada del palacete madrileño donde reside. Añorando una existencia pasada, Zoe intenta sobrevivir en un país turbulento junto a Campeón, un perro sin estirpe, que le ayudará a sortear los peligros de una guerra injusta.\r\nUna novela trepidante que recorre el periodo más dramático del siglo xx: la Guerra Civil y el auge del nazismo, y que narra, por vez primera, el papel de los canes en los conflictos armados. Espías, experimentos secretos para hallar un perro de guerra mitológico, traiciones, amor… atraviesan estas páginas que ilustran, gracias a su protagonista, el inquebrantable y ancestral pacto de lealtad entre el perro y el hombre.',648,21.9,'2017-03-09 18:46:04','2017-03-09 18:46:04','pacto_de_lealtad.jpg','image/jpeg',43981,'2017-03-09 18:46:04'),(32,'La legión perdida',6,'2017-02-28 01:35:00','978-84-08-167','Intrigas, batallas, dos mujeres adolescentes, idiomas extraños, Roma, Partia, India, China, dos Césares y una emperatriz se entrecruzan en el mayor relato épico del mundo antiguo, La legión perdida, la novela con la que Santiago Posteguillo cierra su aclamada trilogía sobre Trajano. Hay emperadores que terminan un reinado, pero otros cabalgan directos a la leyenda. \r\n',1184,17.5,'2017-03-09 18:49:28','2017-03-09 18:49:28','la_legion_perdida.jpg','image/jpeg',39356,'2017-03-09 18:49:28'),(33,'Las monedas de los 24',6,'2017-03-07 05:50:00','978-84-270-43','Esta novela, que se puede leer de forma independiente, es la tercera entrega de las peripecias de Pedro de Alemán y Camacho, abogado de pobres de la ciudad de Jerez a mediados del siglo XVIII y protagonista de El abogado de pobres (Premio Novela de Abogados 2014) y Llamé al cielo y no me oyó.\r\nAl comienzo de esta historia, Pedro se ve obligado a aceptar la defensa de un rico artesano de Jerez, que ha sido acusado de violación por su bella y joven sirvienta. Paralelamente, empiezan a producirse en la ciudad unos crímenes terribles: varias muchachas, relacionadas con las casas más nobles de Jerez, son asesinadas de una manera especialmente violenta y en cada escena del crimen se encuentra una moneda romana.',496,19.9,'2017-03-09 18:52:30','2017-03-09 18:52:30','las_monedas_de_los_24.jpg','image/jpeg',44724,'2017-03-09 18:52:30'),(34,'El abogado de pobres',18,'2014-04-08 07:28:00','978-84-270-41','Jerez de la Frontera, 1752: en el tribunal se celebra un juicio por unos terribles asesinatos cuyo desarrollo tiene en vilo a toda la ciudad.\r\n\r\nNadie duda de la culpabilidad del acusado, un muchacho huérfano y sin ningún apoyo... excepto el del «abogado de pobres», pagado por el concejo, el joven Pedro Alemán y Camacho.\r\n\r\nIdealista, pero también acosado por sus debilidades y limitaciones, Pedro viene de asombrar a los jerezanos con la impactante resolución de algunos casos que parecían perdidos. \r\n\r\nAnte el reto más importante de su carrera, ¿conseguirá el abogado que la justicia impere? \r\n\r\nCon una pericia narrativa admirable, Juan Pedro Cosano compone un relato que nos transporta a una época y circunstancias apasionantes',536,19.9,'2017-03-09 18:55:00','2017-03-09 18:55:47','el_abogado_de_pobres.jpg','image/jpeg',35876,'2017-03-09 18:55:00'),(35,'Llamé al cielo y no me oyó',18,'2015-04-28 02:38:00','9788427041905','UNA MUCHACHA SOLA E INOCENTE\r\nEn Jerez de la Frontera, a mediados del siglo XVIII, un horrible crimen sacude a la ciudad: Sagrario, una mujer sencilla e íntegra que ha dedicado su vida a las niñas del orfanato, ha sido cruelmente apuñalada. ¿La culpable? Todo apunta a la joven Lucía de Jesús, una expósita que se crió en la institución.\r\n\r\nDOS NOBLES SIN ESCRÚPULOS\r\nSin dudarlo, el abogado de pobres Pedro de Alemán asume la defensa: pronto descubrirá que la inocente muchacha está en el punto de mira de los herederos de una de las principales fortunas de Jerez. Y que la única que podía ayudar a salvarla es precisamente la muerta.\r\n\r\n¿CONSEGUIRÁ LA JUSTICIA TRIUNFAR SOBRE EL PODER?\r\nJuan Pedro Cosano, un autor que ha cosechado el aplauso unánime de crítica y público con su primera novela, El abogado de pobres (Premio Abogados de Novela 2014) conquistará a los lectores con un espléndido melodrama que se resuelve en un apasionante thriller judicial: una lectura garantizada, imposible de soltar, con unos personajes inolvidables y una trama que funciona con tanta precisión como intensidad.',680,19.9,'2017-03-09 18:59:42','2017-03-09 18:59:42','portada_llame-al-cielo-y-no-me-oyo_juan-pedro-cosano_201503181346.jpg','image/jpeg',38320,'2017-03-09 18:59:42'),(36,'La fuente de oro',19,'2016-02-02 06:03:00','978-84-670-46','Una sociedad a punto de cambiar para siempre\r\n\r\nJerez de la Frontera, años treinta: Beltrán de la Cueva, carismático y ambicioso, heredero de una de las sagas bodegueras más importantes de la ciudad está comprometido con una joven de su clase. Pero en su camino se interpone una pasión inesperada: la que siente por la bellísima Lele Gavilán, una de sus empleadas.\r\n\r\nEl destino siempre tiene la última palabra.\r\n\r\nLo que podría ser la historia banal del aristócrata que seduce a la joven inocente tiene una deriva que dejará sin aliento al lector: el curso de los acontecimientos dará un giro extraordinario, movido por el viento de la historia y sus dramáticas circunstancias pero, sobre todo, por causa del carácter indomable de Lele.\r\n',600,19.9,'2017-03-09 19:02:30','2017-03-09 19:02:30','portada_la-fuente-de-oro_juan-pedro-cosano_201601181204.jpg','image/jpeg',27935,'2017-03-09 19:02:30'),(37,'La memoria secreta de las hojas',20,'2017-02-21 03:00:00','978-84-493-33','La memoria secreta de las hojas no es solo un libro, es el fascinante debut de una mujer consagrada a la ciencia, el retrato conmovedor de una larga amistad y una exposición sorprendente del mundo de las plantas que cambiará radicalmente nuestra forma de contemplar la naturaleza.\r\n\r\nEn su ópera prima, Hope Jahren nos presenta un revelador tratado sobre la vida de las plantas que además versa sobre el trabajo y sobre el amor, y sobre cómo se pueden mover montañas cuando ambos van a la par.',336,20,'2017-03-09 19:17:46','2017-03-09 19:17:46','portada_la-memoria-secreta-de-las-hojas_hope-jahren_201611241838.jpg','image/jpeg',39462,'2017-03-09 19:17:46'),(38,'La gran desmemoria',21,'2017-01-31 10:37:00','978-84-08-166','Tras el éxito rotundo de El precio del trono, Pilar Urbano hace un valiente ejercicio de investigación para acabar con mitos y medias verdades que han desfigurado nuestra reciente historia. \r\nCon documentos inéditos y testigos que al fin cuentan lo que nunca habían contado, Urbano averigua cómo actuó el Rey en la Transición.\r\nLa autora sale al encuentro de las dudas y sospechas del hombre de la calle: si el Rey fue verdaderamente \"el motos del cambio\" o si el temor al Ejército y al búnker le aconsejaron pisar el freno; por qué el monarca se ausentó en París mientras Suárez legalizaba el Partido Comunista; desde cuándo y hasta dónde estuvo el Rey informando de la Operación Armada; cuál fue el auténtico motivo de la dimisión de Suárez; el juicio militar del 23-F, un simulacro consentido para tapar la trama conspirativa de diputados y empresarios dispuestos a gobernar bajo un general...\r\nPilar Urbano introduce al lector en las estancias del poder, permitiéndole asistir a escenas electrizantes y escuchar en toda su crudeza los diálogos de los protagonistas tal como fueron.\r\n«Discrepo -dice la autora- de Camus cuando afirma que \"la verdad tiene dos caras, una de las cuales debe permanecer oculta\". Mi servicio al ciudadano es justamente lo contrario: descubrir tramos de la historia que nos venían ocultando y reclamaban luz.»\r\n',896,12.95,'2017-03-09 19:24:07','2017-03-09 19:24:07','portada_la-gran-desmemoria_pilar-urbano_201611291807.jpg','image/jpeg',29218,'2017-03-09 19:24:07'),(39,'Seré frágil',6,'2017-01-17 19:24:00','978-84-08-165','«Hace cinco años perdí mucho más que unos cuantos kilos: perdí toda la esperanza. Parte de mi vida está en esta historia, que es el fruto de todo lo que aprendí en ese tiempo. Espero que sirva para comprender lo que es un trastorno alimenticio, cómo afecta y desgasta a una persona, cómo mata. Quiero dar un soplo de esperanza a todos los que, como yo, se han sentido insuficientes, solos e incomprendidos. Quiero recordarles que su historia también es importante.»\r\n\r\nSara Soler se odia. A pesar del amor de su pareja, sus amigos y su familia, nunca se ha sentido suficiente. Todo empieza a cambiar tras la muerte de su compañera de clase, Sofía, después de luchar durante años contra la anorexia. En su funeral, los padres de Sofía le entregan a Sara el diario de su hija, asegurándole que lo han encontrado bajo una nota con su nombre. A través de sus palabras, Sara empieza a conocer los misterios de su pasado, mientras su presente se va contagiando de la mentalidad enferma de Sofía. La guerra no ha hecho más que comenzar. Una guerra en la que, para sobrevivir, Sara tendrá que luchar contra sí misma.',320,16.9,'2017-03-09 19:26:55','2017-03-09 19:26:55','portada_sere-fragil_beatriz-esteban_201610261558.jpg','image/jpeg',28923,'2017-03-09 19:26:55'),(40,'Soy masacre. El despertar de la bestia',9,'2017-01-31 19:28:00','978-84-450-04','En el trigésimo segundo milenio el imperio vive en paz y los Space Marines mantienen a raya a las numerosas razas alienígenas que durante tanto tiempo acosaron a la humanidad. Sin embargo, una de estas razas aparece en el mundo de Ardamantua y los Imperial Fists abandonan los muros de Terra por primera vez en más de mil años para acabar con ella. Pero incluso ellos se verán indefensos ante la amenaza de un enemigo aún más temible. ¡Los orcos atacan la galaxia!',240,17.95,'2017-03-09 19:31:01','2017-03-09 19:31:01','portada_soy-masacre-n-1_dan-abnett_201611221343.jpg','image/jpeg',31241,'2017-03-09 19:31:01'),(41,'A Book',22,'2017-03-10 20:50:18','123-123-123-x','The blurb',300,30.5,'2017-03-10 20:50:19','2017-03-10 21:03:53',NULL,NULL,NULL,NULL),(42,'Rails : From Novice to Professional',22,'2017-03-12 10:51:00','123-123-123-1','LIbro de prueba para probar los Tags',100,12.4,'2017-03-12 10:56:37','2017-03-12 10:56:37',NULL,NULL,NULL,NULL),(43,'Historias de un naufrago hipocondríaco',19,'2017-03-13 11:57:00','9788467050028','El autor del momento desembarca en ESPASA es POESÍA.\r\nUn tema sobrevuela por encima del resto: el amor. Escrito desde el corazón, con atención a los pequeños detalles que hacen de la cotidianidad del amor lo que nos permite sobrevivir. De forma sencilla, pero directa. Dando rienda suelta a la imaginación en situaciones especiales de la vida de cualquier persona. Sentimientos, cambios, recuerdos, chicas y chicos, momentos, tristezas y alegrías. No hay poesía ni línea recta. Hay sentimientos. Todos los que da el amor. Todos los que alguna vez vivimos. Aunque no los esperáramos. Aunque fueran sucediendo.',159,17.58,'2017-08-18 12:01:46','2017-08-18 12:01:46','Historias_de_un_naufrago_hipocondriaco.jpg','image/jpeg',6130,'2017-08-18 12:01:46'),(44,'No te acabes nunca',19,'2017-08-02 02:05:00','9788467049145','El amor y la pérdida, contados por María Leach y puestos en imágenes por Paula Bonet.\r\n\r\nLa muerte a destiempo, cuando no puede inscribirse dentro de ninguna ley que la explique y cambia radicalmente el rumbo de las cosas. La cruel desaparición de alguien cercano y el inicio de un proceso tan largo como sombrío en el que la superación parece un término imposible. Pese a todo, los años nos enseñan que, hasta en el peor de los escenarios, la vida no deja más remedio que seguir adelante.\r\n\r\nEste es el punto de partida deNo te acabes nunca. Los poemas empezaron a gestarse en el blog de poesía de María Leach y tomaron forma en manos de Paula Bonet, cuyas ilustraciones aparecen en el libro. Un honesto diálogo entre la vida real y el arte',128,8.95,'2017-08-18 12:07:42','2017-08-18 12:07:42',NULL,NULL,NULL,NULL),(45,'La mujer silenciosa',23,'2017-08-15 18:24:00','9788496489226','Bajo la dramática coyuntura de la Praga sometida a la invasión nazi y a la barbarie soviética, Sylva, una mujer enigmática y reservada de origen aristocrático, comprueba en su vejez que pocas cosas en la vida dependen de nuestros deseos. Una boda sin amor, la pérdida de sus seres queridos y el exilio forzoso de su único hijo jalonan un sufrimiento que sólo el hecho de vivir en el recuerdo y la esperanza del reencuentro con su antiguo amor pueden mitigar. En este libro, Monika Zgustova se confirma como una de las voces más singulares de la narrativa europea contemporánea ',424,23,'2017-08-18 12:30:07','2017-08-18 12:30:07','la_mujer_silenciosa.jpg','image/jpeg',5832,'2017-08-18 12:30:07'),(46,'El silencio de la ciudad blanca',6,'2017-05-05 02:32:00','9788408154167','Tasio Ortiz de Zárate, el brillante arqueólogo condenado por los extraños asesinatos que aterrorizaron la tranquila ciudad de Vitoria hace dos décadas, está a punto de salir de prisión en su primer permiso cuando los crímenes se reanudan de nuevo: en la emblemática Catedral Vieja de Vitoria, una pareja de veinte años aparece desnuda y muerta por picaduras de abeja en la garganta. Poco después, otra pareja de veinticinco años es asesinada en la Casa del Cordón, un conocido edificio medieval.\r\nEl joven inspector Unai López de Ayala ?alias Kraken?, experto en perfiles criminales, está obsesionado con prevenir los crímenes antes de que ocurran, una tragedia personal aún fresca no le permite encarar el caso como uno más. Sus métodos poco ortodoxos enervan a su jefa, Alba, la subcomisaria con la que mantiene una ambigua relación marcada por los crímenes? El tiempo corre en su contra y la amenaza acecha en cualquier rincón de la ciudad. ¿Quién será el siguiente?\r\nUna novela negra absorbente que se mueve entre la mitología y las leyendas de Álava, la arqueología, los secretos de familia y la psicología criminal. Un noir elegante y complejo que demuestra cómo los errores del pasado pueden influir en el presente.',480,45.45,'2017-08-18 12:35:38','2017-08-18 12:35:38','el_silencio_de_la_ciudad_blanca.jpg','image/jpeg',312658,'2017-08-18 12:35:38'),(47,'La casa de los sueños olvidados',6,'2017-02-10 15:36:00','9788426398512','Fernando, un chico español de catorce años que vivió su infancia en Francia junto a su familia exiliada, sufre pesadillas recurrentes. Esos sueños están dominados por el recuerdo de un acontecimiento horrible ocurrido años atrás y que le dejó marcado, pero que él no puede recordar. Al volver a Francia, durante unas vacaciones, conocerá a Sophie, una chica de su edad que le introduce en el misterioso mundo de los sueños lúcidos. De la mano de Sophie y de Onira, una enigmática muchacha que aparece en sus sueños, tendrá que enfrentarse de nuevo al horror del pasado para resolver el presente. ',220,12.25,'2017-08-18 12:39:43','2017-08-18 12:39:43','la_casa_de_los_sueños_olvidados.jpg','image/jpeg',316763,'2017-08-18 12:39:43');
/*!40000 ALTER TABLE `books` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart_items`
--

DROP TABLE IF EXISTS `cart_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cart_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `book_id` int(11) DEFAULT NULL,
  `cart_id` int(11) DEFAULT NULL,
  `price` float DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart_items`
--

LOCK TABLES `cart_items` WRITE;
/*!40000 ALTER TABLE `cart_items` DISABLE KEYS */;
INSERT INTO `cart_items` VALUES (1,7,6,8.95,2,'2013-08-15 17:57:58','2013-08-15 17:59:32'),(2,1,6,18.9,1,'2013-08-15 17:59:08','2013-08-15 17:59:08'),(3,8,7,23,1,'2013-08-15 19:06:44','2013-08-15 19:06:44'),(4,7,7,8.95,2,'2013-08-15 19:07:11','2013-08-15 19:07:27'),(5,10,10,12.25,1,'2013-08-26 11:58:30','2013-08-26 11:58:30'),(6,9,14,45.45,1,'2013-08-28 10:35:29','2013-08-28 10:35:29'),(7,10,15,12.25,1,'2013-08-28 10:47:30','2013-08-28 10:47:30'),(11,8,18,23,4,'2014-03-26 11:56:22','2014-03-26 11:57:08'),(12,10,18,12.25,1,'2014-03-26 11:56:48','2014-03-26 11:56:48'),(13,7,18,8.95,1,'2014-03-26 11:57:16','2014-03-26 11:57:16'),(14,6,18,17.58,2,'2014-03-26 11:57:34','2014-03-26 11:57:49'),(15,8,24,23,1,'2014-03-27 10:14:52','2014-03-27 10:14:52'),(17,9,25,45.45,1,'2014-03-27 17:07:11','2014-03-27 17:07:11'),(18,10,19,12.25,9,'2014-05-01 10:36:10','2014-05-01 11:02:58'),(19,9,19,45.45,6,'2014-05-01 10:49:05','2014-05-01 11:03:08'),(20,8,19,23,1,'2014-05-01 10:53:52','2014-05-01 10:53:52'),(37,10,31,12.25,1,'2014-05-02 11:01:47','2014-05-02 11:04:46'),(38,8,37,23,1,'2014-05-05 11:06:50','2014-05-05 11:06:50'),(39,6,39,17.58,1,'2014-05-05 12:04:05','2014-05-05 12:04:05'),(40,7,39,8.95,1,'2014-05-05 12:04:28','2014-05-05 12:04:28'),(46,10,52,12.25,4,'2014-06-01 18:44:13','2014-06-01 18:46:54'),(47,10,53,12.25,1,'2014-06-01 19:16:26','2014-06-01 19:16:26'),(49,10,66,12.25,1,'2015-03-05 17:20:58','2015-03-05 17:20:58'),(50,9,66,45.45,6,'2015-03-05 17:20:59','2015-03-05 17:21:05'),(51,8,66,23,1,'2015-03-05 17:21:00','2015-03-05 17:21:00'),(52,7,66,8.95,1,'2015-03-05 17:21:01','2015-03-05 17:21:01'),(54,42,84,12.4,1,'2017-04-03 17:46:22','2017-04-03 17:46:22'),(57,40,92,17.95,1,'2017-04-15 10:54:23','2017-04-15 10:54:23'),(58,35,98,19.9,1,'2017-05-31 18:10:41','2017-05-31 18:10:41'),(59,39,99,16.9,1,'2017-05-31 18:44:13','2017-05-31 18:44:13'),(60,38,101,12.95,1,'2017-06-03 09:23:55','2017-06-03 09:23:55'),(61,36,102,19.9,1,'2017-06-03 11:16:11','2017-06-03 11:16:11'),(62,40,103,17.95,1,'2017-06-06 17:41:10','2017-06-06 17:41:10'),(63,42,104,12.4,1,'2017-06-12 18:52:57','2017-06-12 18:52:57'),(65,42,107,12.4,1,'2017-08-09 10:47:10','2017-08-09 10:47:10'),(66,42,109,12.4,1,'2017-08-09 16:07:01','2017-08-09 16:07:01'),(67,42,112,12.4,1,'2017-08-15 14:50:12','2017-08-15 14:50:12'),(69,36,114,19.9,1,'2017-08-15 20:18:57','2017-08-15 20:18:57'),(70,42,115,12.4,1,'2017-08-16 18:57:18','2017-08-16 18:57:18');
/*!40000 ALTER TABLE `cart_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `carts`
--

DROP TABLE IF EXISTS `carts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `carts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=123 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carts`
--

LOCK TABLES `carts` WRITE;
/*!40000 ALTER TABLE `carts` DISABLE KEYS */;
INSERT INTO `carts` VALUES (1,'2013-08-15 12:20:03','2013-08-15 12:20:03'),(2,'2013-08-15 12:39:06','2013-08-15 12:39:06'),(3,'2013-08-15 16:43:59','2013-08-15 16:43:59'),(4,'2013-08-15 16:52:23','2013-08-15 16:52:23'),(5,'2013-08-15 17:02:00','2013-08-15 17:02:00'),(6,'2013-08-15 17:48:19','2013-08-15 17:48:19'),(7,'2013-08-15 18:13:25','2013-08-15 18:13:25'),(8,'2013-08-20 18:54:16','2013-08-20 18:54:16'),(9,'2013-08-21 11:33:31','2013-08-21 11:33:31'),(10,'2013-08-21 11:46:04','2013-08-21 11:46:04'),(11,'2013-08-21 17:16:33','2013-08-21 17:16:33'),(12,'2013-08-24 10:58:04','2013-08-24 10:58:04'),(13,'2013-08-26 11:24:49','2013-08-26 11:24:49'),(14,'2013-08-28 10:35:22','2013-08-28 10:35:22'),(15,'2013-08-28 10:45:01','2013-08-28 10:45:01'),(16,'2013-08-28 10:50:45','2013-08-28 10:50:45'),(17,'2013-08-28 11:10:53','2013-08-28 11:10:53'),(18,'2014-02-01 11:22:32','2014-02-01 11:22:32'),(19,'2014-02-01 11:23:26','2014-02-01 11:23:26'),(20,'2014-02-04 07:18:48','2014-02-04 07:18:48'),(21,'2014-03-25 12:27:02','2014-03-25 12:27:02'),(22,'2014-03-26 10:08:12','2014-03-26 10:08:12'),(23,'2014-03-27 09:13:35','2014-03-27 09:13:35'),(24,'2014-03-27 10:13:46','2014-03-27 10:13:46'),(25,'2014-03-27 16:31:31','2014-03-27 16:31:31'),(26,'2014-03-27 16:32:20','2014-03-27 16:32:20'),(27,'2014-03-27 17:25:32','2014-03-27 17:25:32'),(28,'2014-05-01 09:25:10','2014-05-01 09:25:10'),(29,'2014-05-01 16:26:57','2014-05-01 16:26:57'),(30,'2014-05-01 16:57:00','2014-05-01 16:57:00'),(31,'2014-05-01 17:40:18','2014-05-01 17:40:18'),(32,'2014-05-02 11:20:40','2014-05-02 11:20:40'),(33,'2014-05-02 17:49:30','2014-05-02 17:49:30'),(34,'2014-05-02 18:03:37','2014-05-02 18:03:37'),(35,'2014-05-03 11:49:23','2014-05-03 11:49:23'),(36,'2014-05-04 09:54:01','2014-05-04 09:54:01'),(37,'2014-05-04 11:11:18','2014-05-04 11:11:18'),(38,'2014-05-05 10:39:29','2014-05-05 10:39:29'),(39,'2014-05-05 12:03:59','2014-05-05 12:03:59'),(40,'2014-05-05 16:24:30','2014-05-05 16:24:30'),(41,'2014-05-05 16:42:13','2014-05-05 16:42:13'),(42,'2014-05-06 16:11:38','2014-05-06 16:11:38'),(43,'2014-05-06 18:49:43','2014-05-06 18:49:43'),(44,'2014-05-06 19:00:37','2014-05-06 19:00:37'),(45,'2014-05-06 21:02:12','2014-05-06 21:02:12'),(46,'2014-05-06 21:30:54','2014-05-06 21:30:54'),(47,'2014-05-09 10:01:19','2014-05-09 10:01:19'),(48,'2014-05-09 10:01:55','2014-05-09 10:01:55'),(49,'2014-05-30 08:58:00','2014-05-30 08:58:00'),(50,'2014-05-30 08:58:09','2014-05-30 08:58:09'),(51,'2014-06-01 10:12:27','2014-06-01 10:12:27'),(52,'2014-06-01 10:13:07','2014-06-01 10:13:07'),(53,'2014-06-01 19:11:01','2014-06-01 19:11:01'),(54,'2014-06-01 19:34:37','2014-06-01 19:34:37'),(55,'2014-06-02 08:24:57','2014-06-02 08:24:57'),(56,'2014-06-02 08:27:31','2014-06-02 08:27:31'),(57,'2014-06-02 09:07:28','2014-06-02 09:07:28'),(58,'2014-06-02 09:17:03','2014-06-02 09:17:03'),(59,'2014-06-03 09:13:39','2014-06-03 09:13:39'),(60,'2014-06-03 09:32:26','2014-06-03 09:32:26'),(61,'2014-06-16 16:24:18','2014-06-16 16:24:18'),(62,'2014-06-16 16:28:12','2014-06-16 16:28:12'),(63,'2015-02-27 18:32:14','2015-02-27 18:32:14'),(64,'2015-03-05 17:09:35','2015-03-05 17:09:35'),(65,'2015-03-05 17:10:54','2015-03-05 17:10:54'),(66,'2015-03-05 17:19:55','2015-03-05 17:19:55'),(67,'2015-05-01 16:58:36','2015-05-01 16:58:36'),(68,'2015-05-01 17:19:20','2015-05-01 17:19:20'),(69,'2015-05-06 16:52:58','2015-05-06 16:52:58'),(70,'2015-05-09 15:25:03','2015-05-09 15:25:03'),(71,'2015-05-12 16:27:31','2015-05-12 16:27:31'),(72,'2017-03-07 17:11:01','2017-03-07 17:11:01'),(73,'2017-03-10 20:14:16','2017-03-10 20:14:16'),(74,'2017-03-11 20:27:50','2017-03-11 20:27:50'),(75,'2017-03-11 20:56:39','2017-03-11 20:56:39'),(76,'2017-03-12 10:18:59','2017-03-12 10:18:59'),(77,'2017-03-12 10:47:23','2017-03-12 10:47:23'),(78,'2017-03-14 16:41:26','2017-03-14 16:41:26'),(79,'2017-03-14 16:47:04','2017-03-14 16:47:04'),(80,'2017-03-26 11:18:18','2017-03-26 11:18:18'),(81,'2017-03-27 17:22:13','2017-03-27 17:22:13'),(82,'2017-04-01 17:28:00','2017-04-01 17:28:00'),(83,'2017-04-02 12:32:50','2017-04-02 12:32:50'),(84,'2017-04-03 17:29:53','2017-04-03 17:29:53'),(85,'2017-04-03 17:51:45','2017-04-03 17:51:45'),(86,'2017-04-04 17:11:35','2017-04-04 17:11:35'),(87,'2017-04-04 17:20:28','2017-04-04 17:20:28'),(88,'2017-04-04 19:19:24','2017-04-04 19:19:24'),(89,'2017-04-08 09:16:04','2017-04-08 09:16:04'),(90,'2017-04-14 18:02:59','2017-04-14 18:02:59'),(91,'2017-04-14 18:26:47','2017-04-14 18:26:47'),(92,'2017-04-15 10:54:19','2017-04-15 10:54:19'),(93,'2017-04-18 16:48:21','2017-04-18 16:48:21'),(94,'2017-04-19 16:52:13','2017-04-19 16:52:13'),(95,'2017-05-19 19:25:37','2017-05-19 19:25:37'),(96,'2017-05-22 19:23:44','2017-05-22 19:23:44'),(97,'2017-05-31 17:06:33','2017-05-31 17:06:33'),(98,'2017-05-31 17:24:25','2017-05-31 17:24:25'),(99,'2017-05-31 18:44:02','2017-05-31 18:44:02'),(100,'2017-05-31 18:49:18','2017-05-31 18:49:18'),(101,'2017-05-31 19:15:25','2017-05-31 19:15:25'),(102,'2017-06-03 10:58:51','2017-06-03 10:58:51'),(103,'2017-06-06 17:41:04','2017-06-06 17:41:04'),(104,'2017-06-12 18:52:53','2017-06-12 18:52:53'),(105,'2017-07-27 18:38:26','2017-07-27 18:38:26'),(106,'2017-08-06 19:29:29','2017-08-06 19:29:29'),(107,'2017-08-09 10:42:00','2017-08-09 10:42:00'),(108,'2017-08-09 10:42:38','2017-08-09 10:42:38'),(109,'2017-08-09 16:00:54','2017-08-09 16:00:54'),(110,'2017-08-13 16:43:37','2017-08-13 16:43:37'),(111,'2017-08-13 16:47:51','2017-08-13 16:47:51'),(112,'2017-08-15 14:50:08','2017-08-15 14:50:08'),(113,'2017-08-15 14:58:19','2017-08-15 14:58:19'),(114,'2017-08-15 20:18:18','2017-08-15 20:18:18'),(115,'2017-08-16 17:46:06','2017-08-16 17:46:06'),(116,'2017-08-16 18:11:06','2017-08-16 18:11:06'),(117,'2017-08-17 16:21:05','2017-08-17 16:21:05'),(118,'2017-08-17 16:21:38','2017-08-17 16:21:38'),(119,'2017-08-21 14:38:23','2017-08-21 14:38:23'),(120,'2017-08-21 15:03:14','2017-08-21 15:03:14'),(121,'2017-08-27 09:18:40','2017-08-27 09:18:40'),(122,'2017-08-27 09:38:51','2017-08-27 09:38:51');
/*!40000 ALTER TABLE `carts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `forum_posts`
--

DROP TABLE IF EXISTS `forum_posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `forum_posts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `body` text,
  `root_id` int(11) NOT NULL DEFAULT '0',
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `lft` int(11) NOT NULL DEFAULT '0',
  `rgt` int(11) NOT NULL DEFAULT '0',
  `depth` int(11) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `forum_posts`
--

LOCK TABLES `forum_posts` WRITE;
/*!40000 ALTER TABLE `forum_posts` DISABLE KEYS */;
INSERT INTO `forum_posts` VALUES (13,'Juan Martínez','Consulta libro ruby','Disponéis de libros sobre ruby ?',13,0,1,2,0,'2015-05-06 19:31:04','2015-05-06 19:31:04'),(14,'Manuel Benítez','Libros de Misterio','Buenas, me gustaría saber los libros que me recomendáis sobre \"misterio\".\r\nMuchas gracias',14,0,3,6,0,'2017-04-18 16:49:33','2017-04-18 16:49:33'),(15,'Jose Utrera','Respuesta a Libros de Misterio','Hola ... Gracias por interesarte en nuestros libros.\r\nEfectivamente, tenemos libros de misterio.\r\nTe aconsejamos los libros de Dawn Brown, en donde se mezcla el misterio con la historia, el arte y la religión.\r\nDe todos modos, te aconsejamos que eches un vistazo a nuestro catálogo y en \"Palabras claves\" incluyas la palabra misterio, para que te aparezcan automáticamente todos los libros de esa temática.\r\n',14,14,4,5,1,'2017-04-18 17:00:44','2017-04-18 17:00:44'),(16,'Antonio Fernández','Consulta sobre libro en C#.','Buenos días.\r\n\r\n¿Tiene la librería libros sobre el lenguaje de programación C#?\r\n\r\nGracias. Un saludo.',16,0,7,10,0,'2017-05-31 17:57:28','2017-05-31 17:57:28'),(17,'Jose Utrera','Respuesta a \"Consultas sobre libro en C#.\"','Estimado cliente:\r\n\r\nTenemos un libro que se acaba de publicar recientemente.\r\n\r\nPuede consultarlo en el catálogo de la librería on-line.\r\n\r\nReciba un cordial saludo.',16,16,8,9,1,'2017-05-31 17:59:02','2017-05-31 17:59:02');
/*!40000 ALTER TABLE `forum_posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_items`
--

DROP TABLE IF EXISTS `order_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `book_id` int(11) DEFAULT NULL,
  `order_id` int(11) DEFAULT NULL,
  `price` float DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_items`
--

LOCK TABLES `order_items` WRITE;
/*!40000 ALTER TABLE `order_items` DISABLE KEYS */;
INSERT INTO `order_items` VALUES (1,47,1,12.25,1,'2013-08-26 16:00:59','2013-08-26 16:00:59'),(2,46,2,45.45,1,'2013-08-28 10:40:00','2013-08-28 10:40:00'),(3,47,3,12.25,1,'2013-08-28 10:48:18','2013-08-28 10:48:18'),(4,47,4,12.25,1,'2013-08-28 10:49:05','2013-08-28 10:49:05'),(5,47,5,12.25,1,'2013-08-28 10:55:12','2013-08-28 10:55:12'),(6,47,6,12.25,1,'2013-08-28 11:07:18','2013-08-28 11:07:18'),(7,47,7,12.25,1,'2014-05-04 10:58:07','2014-05-04 10:58:07'),(8,47,8,12.25,1,'2014-05-04 11:01:15','2014-05-04 11:01:15'),(9,45,9,23,1,'2014-05-05 11:08:56','2014-05-05 11:08:56'),(10,45,10,23,1,'2014-05-05 11:09:06','2014-05-05 11:09:06'),(11,45,11,23,1,'2014-05-05 11:09:16','2014-05-05 11:09:16'),(12,45,12,23,1,'2014-05-05 11:09:27','2014-05-05 11:09:27'),(13,45,13,23,1,'2014-05-05 11:09:37','2014-05-05 11:09:37'),(14,45,14,23,1,'2014-05-05 11:26:55','2014-05-05 11:26:55'),(15,45,15,23,1,'2014-05-05 11:50:08','2014-05-05 11:50:08'),(16,43,16,17.58,1,'2014-05-05 12:05:23','2014-05-05 12:05:23'),(17,44,16,8.95,1,'2014-05-05 12:05:23','2014-05-05 12:05:23'),(18,43,17,17.58,1,'2014-05-05 12:05:33','2014-05-05 12:05:33'),(19,44,17,8.95,1,'2014-05-05 12:05:33','2014-05-05 12:05:33'),(20,43,18,17.58,1,'2014-05-05 16:24:26','2014-05-05 16:24:26'),(21,44,18,8.95,1,'2014-05-05 16:24:26','2014-05-05 16:24:26'),(22,43,19,17.58,1,'2014-05-05 16:25:51','2014-05-05 16:25:51'),(23,43,20,17.58,1,'2014-05-05 16:30:02','2014-05-05 16:30:02'),(24,44,21,8.95,9,'2014-05-06 18:43:02','2014-05-06 18:43:02'),(25,45,21,23,3,'2014-05-06 18:43:02','2014-05-06 18:43:02'),(26,47,21,12.25,5,'2014-05-06 18:43:02','2014-05-06 18:43:02'),(27,46,21,45.45,5,'2014-05-06 18:43:02','2014-05-06 18:43:02'),(28,43,21,17.58,5,'2014-05-06 18:43:02','2014-05-06 18:43:02'),(29,45,22,23,1,'2014-05-06 19:01:31','2014-05-06 19:01:31'),(30,45,23,23,1,'2014-05-09 10:48:04','2014-05-09 10:48:04'),(31,45,24,23,1,'2014-06-02 09:05:12','2014-06-02 09:05:12'),(32,44,24,8.95,1,'2014-06-02 09:05:12','2014-06-02 09:05:12'),(33,47,24,12.25,1,'2014-06-02 09:05:12','2014-06-02 09:05:12'),(34,45,25,23,1,'2014-06-02 09:08:20','2014-06-02 09:08:20'),(35,44,25,8.95,1,'2014-06-02 09:08:20','2014-06-02 09:08:20'),(36,43,25,17.58,1,'2014-06-02 09:08:20','2014-06-02 09:08:20'),(37,42,26,12.4,1,'2017-04-03 18:28:41','2017-04-03 18:28:41'),(38,42,27,12.4,1,'2017-04-03 18:29:07','2017-04-03 18:29:07'),(39,39,28,16.9,1,'2017-04-04 17:23:34','2017-04-04 17:23:34'),(40,35,29,19.9,1,'2017-04-04 19:21:25','2017-04-04 19:21:25'),(41,15,29,8.46,1,'2017-04-04 19:21:25','2017-04-04 19:21:25'),(42,35,30,19.9,1,'2017-04-04 19:21:47','2017-04-04 19:21:47'),(43,15,30,8.46,1,'2017-04-04 19:21:47','2017-04-04 19:21:47'),(44,42,31,12.4,1,'2017-04-14 18:05:21','2017-04-14 18:05:21'),(45,40,31,17.95,1,'2017-04-14 18:05:21','2017-04-14 18:05:21'),(46,42,32,12.4,1,'2017-04-14 18:07:18','2017-04-14 18:07:18'),(47,40,32,17.95,1,'2017-04-14 18:07:18','2017-04-14 18:07:18'),(48,42,33,12.4,1,'2017-04-19 16:58:50','2017-04-19 16:58:50'),(49,35,34,19.9,1,'2017-05-31 18:12:53','2017-05-31 18:12:53'),(50,39,35,16.9,1,'2017-05-31 18:45:33','2017-05-31 18:45:33'),(51,39,36,16.9,1,'2017-05-31 18:45:42','2017-05-31 18:45:42'),(52,39,37,16.9,1,'2017-05-31 18:46:24','2017-05-31 18:46:24'),(53,38,38,12.95,1,'2017-06-03 09:29:18','2017-06-03 09:29:18'),(54,38,39,12.95,1,'2017-06-03 09:42:43','2017-06-03 09:42:43'),(55,38,40,12.95,1,'2017-06-03 09:48:48','2017-06-03 09:48:48'),(56,36,41,19.9,1,'2017-06-03 11:16:51','2017-06-03 11:16:51'),(57,36,42,19.9,1,'2017-06-03 11:24:18','2017-06-03 11:24:18'),(58,36,43,19.9,1,'2017-06-03 11:41:28','2017-06-03 11:41:28'),(59,40,44,17.95,1,'2017-06-06 17:42:18','2017-06-06 17:42:18'),(60,42,45,12.4,1,'2017-06-12 18:53:51','2017-06-12 18:53:51'),(61,42,46,12.4,1,'2017-06-12 19:14:08','2017-06-12 19:14:08'),(62,42,47,12.4,1,'2017-06-12 19:30:52','2017-06-12 19:30:52'),(63,42,48,12.4,1,'2017-08-09 10:49:23','2017-08-09 10:49:23'),(64,42,49,12.4,1,'2017-08-09 10:49:55','2017-08-09 10:49:55'),(65,42,50,12.4,1,'2017-08-15 14:51:47','2017-08-15 14:51:47'),(66,42,51,12.4,1,'2017-08-15 15:04:34','2017-08-15 15:04:34'),(67,42,52,12.4,1,'2017-08-15 17:38:43','2017-08-15 17:38:43');
/*!40000 ALTER TABLE `order_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) DEFAULT NULL,
  `phone_number` varchar(255) DEFAULT NULL,
  `ship_to_first_name` varchar(255) DEFAULT NULL,
  `ship_to_last_name` varchar(255) DEFAULT NULL,
  `ship_to_address` varchar(255) DEFAULT NULL,
  `ship_to_city` varchar(255) DEFAULT NULL,
  `ship_to_postal_code` varchar(255) DEFAULT NULL,
  `ship_to_country_code` varchar(255) DEFAULT NULL,
  `customer_ip` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `error_message` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,'jmutreralopez@hotmail.com','657690857','Jose Manuel','Utrera López','Ataulfo Argenta 23','Dos Hermanas','41702','ES','127.0.0.1','error','Mensaje de error undefined local variable or method `active_merchant_payment\' for #<Order:0xb5180bf4>','2013-08-26 16:00:59','2013-08-26 16:00:59'),(2,'jmutreralopez@hotmail.com','657690857','Jose Manuel','Utrera López','Ataulfo Argenta 23','Dos Hermanas','41702','ES','127.0.0.1','error','Mensaje de error undefined local variable or method `active_merchant_payment\' for #<Order:0xb5684ba0>','2013-08-28 10:40:00','2013-08-28 10:40:00'),(3,'jmutreralopez@hotmail.com','657690857','Jose Manuel','Utrera López','Ataulfo Argenta 23','Dos Hermanas','41702','ES','127.0.0.1','error','Mensaje de error undefined local variable or method `active_merchant_payment\' for #<Order:0xb0f1ad0>','2013-08-28 10:48:18','2013-08-28 10:48:18'),(4,'jmutreralopez@hotmail.com','657690857','Jose Manuel','Utrera López','Ataulfo Argenta 23','Dos Hermanas','41702','ES','127.0.0.1','abierto',NULL,'2013-08-28 10:49:05','2013-08-28 10:49:05'),(5,'jmutreralopez@hotmail.com','657690857','Jose Manuel','Utrera López','Ataulfo Argenta 23','Dos Hermanas','41702','ES','127.0.0.1','abierto',NULL,'2013-08-28 10:55:12','2013-08-28 10:55:12'),(6,'jmutreralopez@hotmail.com','657690857','Jose Manuel','Utrera López','Ataulfo Argenta 23','Dos Hermanas','41702','ES','127.0.0.1','abierto',NULL,'2013-08-28 11:07:18','2013-08-28 11:07:18'),(7,'jmutreralopez@hotmail.com','657690857','Jose Manuel','Utrera Lopez','Ataulfo Argenta 23','Dos Hermanas','41702','ES','127.0.0.1','error','Mensaje de error uninitialized constant Order::EuCentralBank','2014-05-04 10:58:07','2014-05-04 10:58:07'),(8,'jmutreralopez@hotmail.com','657690857','Jose Manuel','Utrera Lopez','Ataulfo Argenta 23','Dos Hermanas','41702','ES','127.0.0.1','cerrado',NULL,'2014-05-04 11:01:15','2014-05-06 11:51:13'),(11,'jmutreralopez@hotmail.com','657690857','Jose Manuel','Utrera Lopez','Ataulfo Argenta 23','Dos Hermanas','41702','ES','127.0.0.1','error','Tarjeta de credito no valida','2014-05-05 11:09:16','2014-05-05 11:09:16'),(15,'jmutreralopez@hotmail.com','657690857','Jose Manuel','Utrera Lopez','Ataulfo Argenta 23','Dos Hermanas','41702','ES','127.0.0.1','error','Mensaje de error uninitialized constant Order::EuCentralBank','2014-05-05 11:50:08','2014-05-05 11:50:08'),(16,'jmutreralopez@hotmail.com','657690857','Jose Manuel','Utrera Lopez','Ataulfo Argenta 23','Dos Hermanas','41702','ES','127.0.0.1','error','Tarjeta de credito no valida','2014-05-05 12:05:23','2014-05-05 12:05:23'),(18,'jmutreralopez@hotmail.com','657690857','Jose Manuel','Utrera Lopez','Ataulfo Argenta 23','Dos Hermanas','41702','ES','127.0.0.1','error','Mensaje de error uninitialized constant Order::EuCentralBank','2014-05-05 16:24:26','2014-05-05 16:24:26'),(19,'jmutreralopez@hotmail.com','657690857','Jose Manuel','Utrera Lopez','Ataulfo Argenta 23','Dos Hermanas','41702','ES','127.0.0.1','error','Mensaje de error uninitialized constant Order::EuCentralBank','2014-05-05 16:25:51','2014-05-05 16:25:51'),(20,'jmutreralopez@hotmail.com','657690857','Jose Manuel','Utrera Lopez','Ataulfo Argenta 23','Dos Hermanas','41702','ES','127.0.0.1','cerrado',NULL,'2014-05-05 16:30:02','2014-06-02 08:51:23'),(21,'sergio.utrera@hotmail.com','657690847','Sergio','Utrera Sánchez','Ataulfo Argenta 23','Dos Hermanas','41702','ES','127.0.0.1','cerrado',NULL,'2014-05-06 18:43:02','2014-06-02 08:57:46'),(22,'sergio.utrera@hotmail.com','657690857','Jose Manuel','Utrera Lopez','Ataulfo Argenta 23','Dos Hermanas','41702','ES','127.0.0.1','cerrado',NULL,'2014-05-06 19:01:31','2014-06-02 08:57:03'),(23,'jmutreralopez@hotmail.com','657690857','Jose Manuel','Utrera López','Ataulfo Argenta 23','Dos Hermanas','41702','ES','127.0.0.1','cerrado',NULL,'2014-05-09 10:48:03','2014-05-09 10:49:39'),(24,'jmutreralopez@hotmail.com','657690857','Jose Manuel','Utrera López','Ataulfo Argenta 23','Dos Hermanas','41702','ES','127.0.0.1','cerrado',NULL,'2014-06-02 09:05:12','2014-06-02 09:06:01'),(25,'jmutreralopez@hotmail.com','657690857','Jose Manuel','Utrera López','Ataulfo Argenta 23','Dos Hermanas','41702','ES','127.0.0.1','procesado',NULL,'2014-06-02 09:08:20','2014-06-02 09:08:21'),(26,'email@email.com','600000000','George','Jackson','Green Sight','Seville','41000','VC','127.0.0.1','error','Mensaje de error No such file or directory - getaddrinfo','2017-04-03 18:28:41','2017-04-03 18:28:41'),(27,'email@email.com','600000000','George','Jackson','Green Sight','Seville','41000','VC','127.0.0.1','error','Mensaje de error No such file or directory - getaddrinfo','2017-04-03 18:29:07','2017-04-03 18:29:07'),(28,'jmutreralopez@5768hotmail.com','657690857','George ','Cambell','Road 3','Wembley','417002','FK','127.0.0.1','procesado',NULL,'2017-04-04 17:23:34','2017-04-04 17:23:47'),(29,'jmutreralopez@hotmail.com','657690857','Jose Manuel','Utrera','ataulfo','dos hermanas','41702','ES','127.0.0.1','error','Tarjeta de crédito no válida','2017-04-04 19:21:25','2017-04-04 19:21:25'),(30,'jmutreralopez@hotmail.com','657690857','Jose Manuel','Utrera','ataulfo','dos hermanas','41702','ES','127.0.0.1','procesado',NULL,'2017-04-04 19:21:47','2017-04-04 19:21:48'),(31,'josemanuel.utreralopez@alum.uca.es','657690857','Francisco','Benítez','c/ Larios 24','Alberca','41700','ES','127.0.0.1','error','Mensaje de error The connection to the remote server timed out','2017-04-14 18:05:21','2017-04-14 18:06:21'),(32,'josemanuel.utreralopez@alum.uca.es','657690857','Francisco','Benítez','c/ Larios 24','Alberca','41700','ES','127.0.0.1','cerrado',NULL,'2017-04-14 18:07:18','2017-04-14 18:11:39'),(33,'email@email.com','666112233','Firstname','Lastname','Address','City','00000','ES','127.0.0.1','procesado',NULL,'2017-04-19 16:58:50','2017-04-19 16:58:51'),(34,'jmutreralopez@alum.uca.es','657690857','Jose Manuel','Utrera López','c/ Marinas de Jaén','Madrid','11235','ES','127.0.0.1','error','Mensaje de error The connection to the remote server timed out','2017-05-31 18:12:53','2017-05-31 18:13:58'),(35,'josemanuel.utreralopez@alum.uca.es','600000000','George','Cambell','Green Sight','Seville','41000','VC','127.0.0.1','error','Tarjeta de crédito no válida','2017-05-31 18:45:33','2017-05-31 18:45:33'),(36,'josemanuel.utreralopez@alum.uca.es','600000000','George','Cambell','Green Sight','Seville','41000','VC','127.0.0.1','abierto',NULL,'2017-05-31 18:45:42','2017-05-31 18:45:42'),(37,'josemanuel.utreralopez@alum.uca.es','600000000','George','Cambell','Green Sight','Seville','41000','VC','127.0.0.1','error','Mensaje de error The connection to the remote server timed out','2017-05-31 18:46:24','2017-05-31 18:47:24'),(38,'josemanuel.utreralopez@alumn.uca.es','657690857','George','Jackson','Road 3','Wembley','41000','CY','127.0.0.1','error','Mensaje de error The connection to the remote server timed out','2017-06-03 09:29:18','2017-06-03 09:30:23'),(39,'jmutreralopez@hotmail.com','657690857','George','Jackson','Road 3','Wembley','41000','CY','127.0.0.1','error','Mensaje de error The connection to the remote server timed out','2017-06-03 09:42:43','2017-06-03 09:43:43'),(40,'jmutreralopez@hotmail.com','657690857','George','Jackson','Road 3','Wembley','41000','CY','127.0.0.1','error','Mensaje de error The connection to the remote server timed out','2017-06-03 09:48:48','2017-06-03 09:49:48'),(41,'jmutreralopez@hotmail.com','600000000','George','Jackson','Green Sight','Seville','41000','AZ','127.0.0.1','error','Mensaje de error The connection to the remote server timed out','2017-06-03 11:16:51','2017-06-03 11:18:02'),(42,'jmutreralopez@hotmail.com','600000000','George','Jackson','Green Sight','Seville','41000','AZ','127.0.0.1','error','Mensaje de error The connection to the remote server timed out','2017-06-03 11:24:18','2017-06-03 11:25:23'),(43,'jmutreralopez@hotmail.com','600000000','George','Jackson','Green Sight','Seville','41000','AZ','127.0.0.1','error','Mensaje de error The connection to the remote server timed out','2017-06-03 11:41:28','2017-06-03 11:42:29'),(44,'jmutreralopez@hotmail.com','123123123','George','Cambell','Green Sight','Wembley','41000','AD','127.0.0.1','error','Mensaje de error The connection to the remote server timed out','2017-06-06 17:42:18','2017-06-06 17:43:18'),(45,'josemanuel.utreralopez@alum.uca.es','612123123','George','Jackson','Green Sight','Wembley','41000','AR','127.0.0.1','error','Mensaje de error The connection to the remote server timed out','2017-06-12 18:53:51','2017-06-12 18:54:51'),(46,'josemanuel.utreralopez@alum.uca.es','612123123','George','Jackson','Green Sight','Wembley','41000','AR','127.0.0.1','error','Mensaje de error The connection to the remote server timed out','2017-06-12 19:14:08','2017-06-12 19:15:08'),(47,'josemanuel.utreralopez@alum.uca.es','612123123','George','Jackson','Green Sight','Wembley','41000','AR','127.0.0.1','error','Mensaje de error The connection to the remote server timed out','2017-06-12 19:30:52','2017-06-12 19:31:52'),(48,'jutrera@viewnext.com','657690857','Jose','Utrera','c/ Ataulfo Argenta nº 23','Dos hermanas','41702','ES','127.0.0.1','error','Tarjeta de crédito no válida','2017-08-09 10:49:23','2017-08-09 10:49:23'),(49,'jutrera@viewnext.com','657690857','Jose','Utrera','c/ Ataulfo Argenta nº 23','Dos hermanas','41702','ES','127.0.0.1','error','Mensaje de error The connection to the remote server timed out','2017-08-09 10:49:55','2017-08-09 10:50:55'),(50,'josemanuel.utreralopez@alum.uca.es','657690857','Jose manuel','Utrera López','c/ Ataulfo Argenta nº 23','Dos Hermanas','41702','ES','127.0.0.1','error','Mensaje de error The connection to the remote server timed out','2017-08-15 14:51:47','2017-08-15 14:52:48'),(51,'josemanuel.utreralopez@alum.uca.es','657690857','Jose manuel','Utrera López','c/ Ataulfo Argenta nº 23','Dos Hermanas','41702','ES','127.0.0.1','error','Mensaje de error The connection to the remote server timed out','2017-08-15 15:04:34','2017-08-15 15:05:34'),(52,'josemanuel.utreralopez@alum.uca.es','657690857','Jose manuel','Utrera López','c/ Ataulfo Argenta nº 23','Dos Hermanas','41702','ES','127.0.0.1','error','Mensaje de error The connection to the remote server timed out','2017-08-15 17:38:43','2017-08-15 17:39:44');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `publishers`
--

DROP TABLE IF EXISTS `publishers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `publishers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `publishers`
--

LOCK TABLES `publishers` WRITE;
/*!40000 ALTER TABLE `publishers` DISABLE KEYS */;
INSERT INTO `publishers` VALUES (6,'Planeta','2013-07-22 10:13:34','2013-07-22 10:13:34'),(7,'Plaza & Janes Editores','2013-07-22 11:20:10','2013-07-22 11:20:10'),(9,'Minotauro','2017-03-07 19:21:13','2017-03-07 19:21:13'),(10,'Algar','2017-03-07 19:28:11','2017-03-07 19:28:11'),(11,'SM','2017-03-07 19:34:15','2017-03-07 19:34:15'),(12,'Montena','2017-03-07 19:38:03','2017-03-07 19:38:03'),(13,'Edebé','2017-03-07 19:44:48','2017-03-07 19:44:48'),(14,'Suma','2017-03-09 17:57:18','2017-03-09 17:57:18'),(15,'Tusquets Editores','2017-03-09 18:03:01','2017-03-09 18:03:01'),(16,'Literatura Random House','2017-03-09 18:06:02','2017-03-09 18:06:02'),(17,'Alianza','2017-03-09 18:10:20','2017-03-09 18:10:20'),(18,'Mr','2017-03-09 18:55:23','2017-03-09 18:55:23'),(19,'Espasa','2017-03-09 19:00:12','2017-03-09 19:00:12'),(20,'Paidós','2017-03-09 19:15:01','2017-03-09 19:15:01'),(21,'Booket','2017-03-09 19:21:56','2017-03-09 19:21:56'),(22,'A Publisher','2017-03-10 20:42:21','2017-03-10 20:42:21'),(23,'FRIDA','2017-08-18 12:11:56','2017-08-18 12:11:56');
/*!40000 ALTER TABLE `publishers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schema_migrations`
--

DROP TABLE IF EXISTS `schema_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schema_migrations` (
  `version` varchar(255) NOT NULL,
  UNIQUE KEY `unique_schema_migrations` (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schema_migrations`
--

LOCK TABLES `schema_migrations` WRITE;
/*!40000 ALTER TABLE `schema_migrations` DISABLE KEYS */;
INSERT INTO `schema_migrations` VALUES ('20130515180234'),('20130529164827'),('20130530185936'),('20130718195639'),('20130814185839'),('20130814185913'),('20130824173611'),('20130824180138'),('20140603081128'),('20150227195145'),('20150512174415');
/*!40000 ALTER TABLE `schema_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `taggings`
--

DROP TABLE IF EXISTS `taggings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `taggings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tag_id` int(11) DEFAULT NULL,
  `taggable_id` int(11) DEFAULT NULL,
  `taggable_type` varchar(255) DEFAULT NULL,
  `tagger_id` int(11) DEFAULT NULL,
  `tagger_type` varchar(255) DEFAULT NULL,
  `context` varchar(128) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_taggings_on_tag_id` (`tag_id`),
  KEY `index_taggings_on_taggable_id_and_taggable_type_and_context` (`taggable_id`,`taggable_type`,`context`),
  CONSTRAINT `fk_taggings_books` FOREIGN KEY (`taggable_id`) REFERENCES `books` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_taggings_tags` FOREIGN KEY (`tag_id`) REFERENCES `tags` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `taggings`
--

LOCK TABLES `taggings` WRITE;
/*!40000 ALTER TABLE `taggings` DISABLE KEYS */;
INSERT INTO `taggings` VALUES (2,7,41,'Book',NULL,NULL,'tags','2017-03-10 21:03:53'),(3,8,42,'Book',NULL,NULL,'tags','2017-03-12 10:56:37'),(4,9,42,'Book',NULL,NULL,'tags','2017-03-12 10:56:37'),(5,4,2,'Book',NULL,NULL,'tags','2017-04-01 17:36:24'),(6,10,2,'Book',NULL,NULL,'tags','2017-04-01 17:37:07'),(7,11,2,'Book',NULL,NULL,'tags','2017-04-01 17:39:12'),(8,12,2,'Book',NULL,NULL,'tags','2017-04-01 17:39:12'),(9,3,4,'Book',NULL,NULL,'tags','2017-04-01 17:39:45'),(10,4,4,'Book',NULL,NULL,'tags','2017-04-01 17:39:45'),(11,10,4,'Book',NULL,NULL,'tags','2017-04-01 17:39:45'),(12,11,3,'Book',NULL,NULL,'tags','2017-04-03 18:03:46'),(13,13,43,'Book',NULL,NULL,'tags','2017-08-18 12:01:47'),(14,14,43,'Book',NULL,NULL,'tags','2017-08-18 12:01:47'),(15,12,45,'Book',NULL,NULL,'tags','2017-08-18 12:30:07'),(16,13,45,'Book',NULL,NULL,'tags','2017-08-18 12:30:07'),(17,15,45,'Book',NULL,NULL,'tags','2017-08-18 12:30:07'),(18,16,46,'Book',NULL,NULL,'tags','2017-08-18 12:35:38'),(19,17,46,'Book',NULL,NULL,'tags','2017-08-18 12:35:38'),(20,18,46,'Book',NULL,NULL,'tags','2017-08-18 12:35:38'),(21,19,47,'Book',NULL,NULL,'tags','2017-08-18 12:39:43'),(22,20,47,'Book',NULL,NULL,'tags','2017-08-18 12:39:43'),(23,21,47,'Book',NULL,NULL,'tags','2017-08-18 12:39:43'),(24,3,3,'Book',NULL,NULL,'tags','2017-08-20 17:37:24'),(25,23,3,'Book',NULL,NULL,'tags','2017-08-20 17:37:24'),(26,24,3,'Book',NULL,NULL,'tags','2017-08-20 17:37:24'),(27,12,13,'Book',NULL,NULL,'tags','2017-08-20 17:38:08'),(28,18,13,'Book',NULL,NULL,'tags','2017-08-20 17:38:08'),(29,22,13,'Book',NULL,NULL,'tags','2017-08-20 17:38:08'),(30,3,14,'Book',NULL,NULL,'tags','2017-08-20 17:39:05'),(31,4,14,'Book',NULL,NULL,'tags','2017-08-20 17:39:05'),(32,13,14,'Book',NULL,NULL,'tags','2017-08-20 17:39:05'),(33,23,14,'Book',NULL,NULL,'tags','2017-08-20 17:39:05');
/*!40000 ALTER TABLE `taggings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tags`
--

DROP TABLE IF EXISTS `tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tags`
--

LOCK TABLES `tags` WRITE;
/*!40000 ALTER TABLE `tags` DISABLE KEYS */;
INSERT INTO `tags` VALUES (1,'Acción','2015-05-12 20:25:59','2015-05-12 20:25:59'),(2,'Ciencia','2015-05-12 20:25:59','2015-05-12 20:25:59'),(3,'Ciencia ficción','2015-05-12 20:25:59','2015-05-12 20:25:59'),(4,'Misterio','2015-05-12 20:25:59','2015-05-12 20:25:59'),(5,'Romance','2015-05-12 20:25:59','2015-05-12 20:25:59'),(7,'B','2017-03-10 21:03:53','2017-03-10 21:03:53'),(8,'Ruby','2017-03-12 10:56:37','2017-03-12 10:56:37'),(9,'Rails','2017-03-12 10:56:37','2017-03-12 10:56:37'),(10,'Detective','2017-04-01 17:37:07','2017-04-01 17:37:07'),(11,'Arte','2017-04-01 17:39:12','2017-04-01 17:39:12'),(12,'Historia','2017-04-01 17:39:12','2017-04-01 17:39:12'),(13,'amor','2017-08-18 12:01:46','2017-08-18 12:01:46'),(14,'humor','2017-08-18 12:01:46','2017-08-18 12:01:46'),(15,'Drama','2017-08-18 12:30:07','2017-08-18 12:30:07'),(16,'Asesinato','2017-08-18 12:35:38','2017-08-18 12:35:38'),(17,'Investigación','2017-08-18 12:35:38','2017-08-18 12:35:38'),(18,'Policíaca','2017-08-18 12:35:38','2017-08-18 12:35:38'),(19,'Sueños','2017-08-18 12:39:43','2017-08-18 12:39:43'),(20,'Novela','2017-08-18 12:39:43','2017-08-18 12:39:43'),(21,'Terror','2017-08-18 12:39:43','2017-08-18 12:39:43'),(22,'Policiaca','2017-08-20 17:20:18','2017-08-20 17:20:18'),(23,'futuro','2017-08-20 17:37:24','2017-08-20 17:37:24'),(24,'magia','2017-08-20 17:37:24','2017-08-20 17:37:24');
/*!40000 ALTER TABLE `tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `login` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `crypted_password` varchar(255) NOT NULL,
  `password_salt` varchar(255) NOT NULL,
  `persistence_token` varchar(255) NOT NULL,
  `perishable_token` varchar(255) NOT NULL,
  `login_count` int(11) NOT NULL DEFAULT '0',
  `failed_login_count` int(11) NOT NULL DEFAULT '0',
  `last_request_at` datetime DEFAULT NULL,
  `current_login_at` datetime DEFAULT NULL,
  `last_login_at` datetime DEFAULT NULL,
  `current_login_ip` varchar(255) DEFAULT NULL,
  `last_login_ip` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (2,'Jose Manuel Utrera López','Jose Utrera','josemanuel.utreralopez@alum.uca.es','cc373b2d2c76763381b75764ae5c751412989ff780cb76fedef7c06ffd8ec3b3e65c84603895fb25d5bfb4087300f9188d6afc19ddb2f913af27e7ff24ff42a4','xMfBrxiGkKqcl8ZSAOw2','fdddbc832a24fd3dc57f49215085139b057c7bcb2278f84f9ce916fb493433c7ebeab51e0c4ef9dedba90dcf46986dc9acbd48d82b73fbb9ac53e310019ace99','AUzrjT3mPiYlUIoXsBW',89,0,'2017-08-21 18:27:33','2017-08-21 18:27:33','2017-08-21 18:21:36','127.0.0.1','127.0.0.1','2014-06-04 09:11:40','2017-08-21 18:49:29');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-08-29  0:17:43
