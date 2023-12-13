-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Artists`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Artists` (
  `artist_id` INT NOT NULL,
  `first_name` VARCHAR(45) NOT NULL,
  `last_name` VARCHAR(45) NOT NULL,
  `num_of_albums` VARCHAR(45) NULL,
  PRIMARY KEY (`artist_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Genre`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Genre` (
  `genre_id` INT NOT NULL,
  `genre_type` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`genre_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Playlist`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Playlist` (
  `playlist_id` INT NOT NULL,
  `playlist_name` VARCHAR(45) NOT NULL,
  `total_songs` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`playlist_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Song`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Song` (
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
    REFERENCES `mydb`.`Artists` (`artist_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Song_Genre1`
    FOREIGN KEY (`genre_id`)
    REFERENCES `mydb`.`Genre` (`genre_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Song_Playlist1`
    FOREIGN KEY (`playlist_id`)
    REFERENCES `mydb`.`Playlist` (`playlist_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Album`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Album` (
  `album_ID` INT NULL,
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
    REFERENCES `mydb`.`Genre` (`genre_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Album_Artists1`
    FOREIGN KEY (`artist_id`)
    REFERENCES `mydb`.`Artists` (`artist_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Album_Song1`
    FOREIGN KEY (`song_id`)
    REFERENCES `mydb`.`Song` (`song_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Producer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Producer` (
  `producer_id` VARCHAR(45) NOT NULL,
  `producer_fname` VARCHAR(45) NOT NULL,
  `producer_lname` VARCHAR(45) NOT NULL,
  `company_name` VARCHAR(45) NOT NULL,
  `artist_id` INT NOT NULL,
  PRIMARY KEY (`producer_id`),
  INDEX `fk_Producer_Artists1_idx` (`artist_id` ASC) VISIBLE,
  CONSTRAINT `fk_Producer_Artists1`
    FOREIGN KEY (`artist_id`)
    REFERENCES `mydb`.`Artists` (`artist_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
