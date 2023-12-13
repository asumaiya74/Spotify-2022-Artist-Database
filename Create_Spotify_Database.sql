DROP DATABASE IF EXISTS `spotify_db`;
CREATE SCHEMA IF NOT EXISTS `spotify_db` DEFAULT CHARACTER SET utf8 ;
USE `spotify_db` ;

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Table `spotify_db`.`Artists`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `spotify_db`.`Artists` (
  `artist_id` INT NOT NULL,
  `first_name` VARCHAR(45) NOT NULL,
  `last_name` VARCHAR(45) NOT NULL,
  `num_of_albums` VARCHAR(45) NULL,
  `monthly_listeners` INT NOT NULL,
  PRIMARY KEY (`artist_id`))
ENGINE = InnoDB;

INSERT INTO `artists` VALUES 
(1,'Taylor','Swift','21',55000000),
(2,'Bruno','Mars','4',51925243),
(3,'Pink','Sweat$','2',11414353),
(4,'Ed','Sheeran','12',82028396),
(5,'Justin','Bieber','15',78918600),
(6,'Shawn','Mendes','12',42514878),
(7,'Dua','Lipa','5',69006205),
(8,'Maher','Zain','21',727451),
(9,'Kendrick','Lamar','9',32115907),
(10,'Ariana','Grande','8',54061674),
(11,'Billie','Eilish','5',47865772),
(12,'Selena','Gomez','2',35430637),
(13,'Chris','Brown','15',35002382),
(14,'Snoop','Dogg','28',24085659),
(15,'Lady','Gaga','14',38183528);

-- -----------------------------------------------------
-- Table `spotify_db`.`Genre`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `spotify_db`.`Genre` (
  `genre_id` INT NOT NULL,
  `genre_type` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`genre_id`))
ENGINE = InnoDB;

INSERT INTO `genre` VALUES 
(1,'Pop'),
(2,'Disco'),
(3,'Hip Hop'),
(4,'R&B/Soul'),
(5,'Afrobeats'),
(6,'Rap'),
(7,'Alternative/indie'),
(8,'UK R&B'),
(9,'Rap'),
(10,'K-Pop');

-- -----------------------------------------------------
-- Table `spotify_db`.`Playlist`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `spotify_db`.`Playlist` (
  `playlist_id` INT NOT NULL,
  `playlist_name` VARCHAR(45) NOT NULL,
  `total_songs` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`playlist_id`))
ENGINE = InnoDB;

INSERT INTO `playlist` VALUES 
(1,'Today\'s Top Hits','50'),
(2,'The Pop List','80'),
(3,'Are & Be','50'),
(4,'Mood Booster','76'),
(5,'Good Vibes','90'),
(6,'New Music Friday','99'),
(7,'Pop Party','100'),
(8,'RapCaviar','50'),
(9,'Just Good Music','80'),
(10,'Mint','100'),
(11,'Chill Hits','130'),
(12,'Pumped Pop','75'),
(13,'Feel Good Classical','39'),
(14,'Pollen','103'),
(15,'Daily Lift','100'),
(16,'Dance Pop Hits','142'),
(17,'Hot Hits USA','50'),
(18,'Girls\' Night','80'),
(19,'Top Gaming Tracks','100'),
(20,'Homework Vibes','150');

-- -----------------------------------------------------
-- Table `spotify_db`.`Song`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `spotify_db`.`Song` (
  `song_id` INT NOT NULL,
  `song_name` VARCHAR(45) NOT NULL,
  `run_time` VARCHAR(45) NOT NULL,
  `album_name` VARCHAR(45) NOT NULL,
  `year_released` VARCHAR(45) NOT NULL,
  `artist_id` INT NOT NULL,
  `genre_id` INT NOT NULL,
  `playlist_id` INT NOT NULL,
  PRIMARY KEY (`song_id`),
  INDEX `fk_Song_Artists1_idx` (`artist_id` ASC) VISIBLE,
  INDEX `fk_Song_Genre1_idx` (`genre_id` ASC) VISIBLE,
  INDEX `fk_Song_Playlist1_idx` (`playlist_id` ASC) VISIBLE,
  CONSTRAINT `fk_Song_Artists1`
    FOREIGN KEY (`artist_id`)
    REFERENCES `spotify_db`.`Artists` (`artist_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Song_Genre1`
    FOREIGN KEY (`genre_id`)
    REFERENCES `spotify_db`.`Genre` (`genre_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Song_Playlist1`
    FOREIGN KEY (`playlist_id`)
    REFERENCES `spotify_db`.`Playlist` (`playlist_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

INSERT INTO `Song` VALUES (1,'Afterglow','3:43','Lover',2019,1,1,1),
(2,'Pink Moon','3:01','Pink Moon',2022,3,4,2),
(3,'Better','4:05','Identity',2019,4,5,3),
(4,'Perfect','4:23','÷ (Deluxe)',2017,5,1,4),
(5,'Ghost','2:33','Justice',2021,6,1,5),
(6,'Teach Me,How to Love','3:22','Wonder',2020,7,1,6),
(7,'Dont Start Now','3:03','Future Nostalgia',2019,8,1,7),
(8,'The Power','4:04','One',2016,9,1,8),
(9,'I','4:42','To Pimp a Butterfly',2015,10,3,9),
(10,'Talking to the Moon','3:37','Doo-Wops & Hooligans',2010,2,1,10),
(11,'Imagine','3:32','Thank u, Next',2019,11,1,11),
(12,'Getting Older','4:04','Happier Than Ever',2021,12,3,12),
(13,'Birthday','3:21','Stars Dance',2013,13,3,13),
(14,'Say It With Me','3:01','F.A.M.E.',2011,14,3,14),
(15,'No Angel','3:49','Beyoncé',2013,15,7,15),
(16,'What U Talkin Bout','2:43','Snoop Dogg I Wanna Thank Me',2019,16,1,16),
(17,'Just Dance','4:02','The Fame',2008,17,1,17),
(18,'Make It Right','3:46','BTS Map of the Soul: 7',2019,18,10,18),
(19,'Rock With You','3:38','Off the Wall',1979,19,2,19),
(20,'CROWN','3:51','The Dream Chapter: Star',2019,20,10,20);

-- -----------------------------------------------------
-- Table `spotify_db`.`Album`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `spotify_db`.`Album` (
  `album_ID` INT NOT NULL,
  `album_name` VARCHAR(45) NOT NULL,
  `num_of_songs` VARCHAR(45) NOT NULL,
  `year_released` VARCHAR(45) NOT NULL,
  `run_time` VARCHAR(45) NOT NULL,
  `genre_id` INT NOT NULL,
  `artist_id` INT NOT NULL,
  `song_id` INT NOT NULL,
  PRIMARY KEY (`album_ID`),
  INDEX `fk_Album_Genre_idx` (`genre_id` ASC) VISIBLE,
  INDEX `fk_Album_Artists1_idx` (`artist_id` ASC) VISIBLE,
  INDEX `fk_Album_Song1_idx` (`song_id` ASC) VISIBLE,
  CONSTRAINT `fk_Album_Genre`
    FOREIGN KEY (`genre_id`)
    REFERENCES `spotify_db`.`Genre` (`genre_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Album_Artists1`
    FOREIGN KEY (`artist_id`)
    REFERENCES `spotify_db`.`Artists` (`artist_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Album_Song1`
    FOREIGN KEY (`song_id`)
    REFERENCES `spotify_db`.`Song` (`song_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

INSERT INTO `Album`
VALUES
(1,'Lover','18', '2019', '1:01:00', '1', '1', '1'),
(2,'Pink Moon','8', '2022','0:24:13','4','3',2),
(3,'Identity','10', '2019', '0:36:33', '5', '4', '3'),
(4,'÷ (Deluxe)','16', '2017', '0:59:33', '1', '5', '4'),
(5,'Justice','16', '2021', '0:45:31', '1', '6', '5'),
(6,'Wonder','14', '2019', '0:39:58', '1', '1', '1'),
(7,'Future Nostalgia ','11', '2019', '0:43:23', '1', '1', '1'),
(8,'One','15', '2016', '0:58:23', '1', '9','8'),
(9,'To Pimp a Butterfly','16', '2015', '1:18:00', '6', '10', '9'),
(10,'Doo-Wops & Hooligans','10', '2010', '0:35:26', '1', '2','10'),
(11,'Thank u, Next','12', '2019', '10:41:10', '1', '11', '11'),
(12,'Happier Than Ever','16', '2019', '0:56:15', '3' , '12', '12'),
(13,'Stars Dance','12', '2019', '0:46:12', '8', '13', '13'),
(14,'F.A.M.E.','18', '2019', '1:12:00', '4', '14', '14'),
(15,'Beyoncé ','20', '2019', '1:33:00', '7', '15', '15'),
(16,'Snoop Dogg I Wanna Thank Me','22', '2019', '1:15:00', '1', '16', '16'),
(17,'The Fame','15', '2019', '0:54:06', '1', '17', '17'),
(18,'BTS Map of the Soul: 7', '20','2019','1:14:00', '10', '18', '18'),
(19,'Off the Wall','10', '2019', '42:24:00', '2', '19', '19'),
(20,'The Dream Chapter: Star','5', '2019', '0:17:37', '10', '20', '20');

-- -----------------------------------------------------
-- Table `spotify_db`.`Producer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `spotify_db`.`Producer` (
  `producer_id` INT NOT NULL,
  `producer_fname` VARCHAR(45) NOT NULL,
  `producer_lname` VARCHAR(45) NOT NULL,
  `company_name` VARCHAR(45) NOT NULL,
  `artist_id` INT NOT NULL,
  PRIMARY KEY (`producer_id`),
  INDEX `fk_Producer_Artists1_idx` (`artist_id` ASC) VISIBLE,
  CONSTRAINT `fk_Producer_Artists1`
    FOREIGN KEY (`artist_id`)
    REFERENCES `spotify_db`.`Artists` (`artist_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

INSERT INTO `Producer` VALUES 
(1,'Taylor','Swift','Republic Records',1), 
(2,'Louis','Bell','Universal Music Publishing Group',1),
(3,'Adam','Feeny','Warner Music Group',1),
(4,'Dante','Bowden','Human Re Sources',3),
(5,'Joseph','Ruffin','The Urban Network',3),
(6,'Geoffro','Cause','Universal Music Publishing Group',3),
(7,'Nish','null','Warner Music Group',4),
(8,'Benny','Blanco','Republic Records',5),
(9,'Ed','Sheeran','Warner Music Group',5),
(10,'Will','Hicks','Atlantic Records',5),
(11,'Jon','Bellion','Universal Music Publishing Group',6),
(12,'The Monsters','& Strangerz','Republic Records',6),
(13,'Nate','Mercereau','Sony Music Publishing',7),
(14,'Scott','Harris','Atlantic Records',7),
(15,'Shawn','Mendes','Universal Music Publishing Group',7),
(16,'Kid','Harpoon','Republic Records',7),
(17,'Drew','Jurecka','V2 Records',8),
(18,'Ian','Kirkpatrick','Warner Chapel Music',8),
(19,'Columbus','Smith III','Universal Music Publishing Group',9),
(20,'Jeff','Bhasker','GOOD Music',9);

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
