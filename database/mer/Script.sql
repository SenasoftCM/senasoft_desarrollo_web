-- MySQL Script generated by MySQL Workbench
-- Wed Oct 20 17:08:33 2021
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema senasoftdesarrolloweb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema senasoftdesarrolloweb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `senasoftdesarrolloweb` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `senasoftdesarrolloweb` ;

-- -----------------------------------------------------
-- Table `senasoftdesarrolloweb`.`cards`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `senasoftdesarrolloweb`.`cards` (
  `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `photo` VARCHAR(150) NOT NULL,
  `rol` ENUM('Programadores', 'Modulo', 'Tipo de Error') NOT NULL,
  `state` ENUM('Activo', 'Inactivo') NULL,
  `created_at` TIMESTAMP NULL DEFAULT NULL,
  `updated_at` TIMESTAMP NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;


-- -----------------------------------------------------
-- Table `senasoftdesarrolloweb`.`games`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `senasoftdesarrolloweb`.`games` (
  `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `codigo` VARCHAR(5) NOT NULL,
  `programmer_id` BIGINT UNSIGNED NOT NULL,
  `modulo_id` BIGINT UNSIGNED NOT NULL,
  `type_error_id` BIGINT UNSIGNED NOT NULL,
  `created_at` TIMESTAMP NULL DEFAULT NULL,
  `updated_at` TIMESTAMP NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `codigo_UNIQUE` (`codigo` ASC) VISIBLE,
  INDEX `fk_Partida_Cartas_idx` (`programmer_id` ASC) VISIBLE,
  INDEX `fk_Partida_Cartas1_idx` (`modulo_id` ASC) VISIBLE,
  INDEX `fk_Partida_Cartas2_idx` (`type_error_id` ASC) VISIBLE,
  CONSTRAINT `fk_Partida_Cartas`
    FOREIGN KEY (`programmer_id`)
    REFERENCES `senasoftdesarrolloweb`.`cards` (`id`),
  CONSTRAINT `fk_Partida_Cartas1`
    FOREIGN KEY (`modulo_id`)
    REFERENCES `senasoftdesarrolloweb`.`cards` (`id`),
  CONSTRAINT `fk_Partida_Cartas2`
    FOREIGN KEY (`type_error_id`)
    REFERENCES `senasoftdesarrolloweb`.`cards` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;


-- -----------------------------------------------------
-- Table `senasoftdesarrolloweb`.`users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `senasoftdesarrolloweb`.`users` (
  `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `identification` INT UNSIGNED NOT NULL,
  `name` VARCHAR(60) NOT NULL,
  `email` VARCHAR(130) NOT NULL,
  `email_verified_at` TIMESTAMP NULL DEFAULT NULL,
  `password` VARCHAR(255) NOT NULL,
  `state` ENUM('Activo', 'Inactivo') NOT NULL DEFAULT 'Activo',
  `remember_token` VARCHAR(100) NULL DEFAULT NULL,
  `created_at` TIMESTAMP NULL DEFAULT NULL,
  `updated_at` TIMESTAMP NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `identificacion_UNIQUE` (`identification` ASC) VISIBLE,
  UNIQUE INDEX `users_email_unique` (`email` ASC) VISIBLE,
  INDEX `users_name_index` (`name` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;


-- -----------------------------------------------------
-- Table `senasoftdesarrolloweb`.`players`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `senasoftdesarrolloweb`.`players` (
  `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `games_id` BIGINT UNSIGNED NOT NULL,
  `users_id` BIGINT UNSIGNED NOT NULL,
  `order` ENUM('1', '2', '3', '4') NOT NULL,
  `role` ENUM('Administrador', 'Invitado') NOT NULL,
  `state` ENUM('Activo', 'Inactivo') NOT NULL,
  `created_at` TIMESTAMP NULL DEFAULT NULL,
  `updated_at` TIMESTAMP NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_players_games1_idx` (`games_id` ASC) VISIBLE,
  INDEX `fk_players_users1_idx` (`users_id` ASC) VISIBLE,
  CONSTRAINT `fk_players_games1`
    FOREIGN KEY (`games_id`)
    REFERENCES `senasoftdesarrolloweb`.`games` (`id`),
  CONSTRAINT `fk_players_users1`
    FOREIGN KEY (`users_id`)
    REFERENCES `senasoftdesarrolloweb`.`users` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;


-- -----------------------------------------------------
-- Table `senasoftdesarrolloweb`.`decks`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `senasoftdesarrolloweb`.`decks` (
  `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `players_id` BIGINT UNSIGNED NOT NULL,
  `cards_id` BIGINT UNSIGNED NOT NULL,
  `created_at` TIMESTAMP NULL DEFAULT NULL,
  `updated_at` TIMESTAMP NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_decks_players1_idx` (`players_id` ASC) VISIBLE,
  INDEX `fk_decks_cards1_idx` (`cards_id` ASC) VISIBLE,
  CONSTRAINT `fk_decks_cards1`
    FOREIGN KEY (`cards_id`)
    REFERENCES `senasoftdesarrolloweb`.`cards` (`id`),
  CONSTRAINT `fk_decks_players1`
    FOREIGN KEY (`players_id`)
    REFERENCES `senasoftdesarrolloweb`.`players` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;


-- -----------------------------------------------------
-- Table `senasoftdesarrolloweb`.`failed_jobs`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `senasoftdesarrolloweb`.`failed_jobs` (
  `id` BIGINT(19) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uuid` VARCHAR(255) NOT NULL,
  `connection` TEXT NOT NULL,
  `queue` TEXT NOT NULL,
  `payload` LONGTEXT NOT NULL,
  `exception` LONGTEXT NOT NULL,
  `failed_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `failed_jobs_uuid_unique` (`uuid` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;


-- -----------------------------------------------------
-- Table `senasoftdesarrolloweb`.`migrations`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `senasoftdesarrolloweb`.`migrations` (
  `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` VARCHAR(255) NOT NULL,
  `batch` INT(11) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 14
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;


-- -----------------------------------------------------
-- Table `senasoftdesarrolloweb`.`notes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `senasoftdesarrolloweb`.`notes` (
  `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `players_id` BIGINT UNSIGNED NOT NULL,
  `cards_id` BIGINT UNSIGNED NOT NULL,
  `observations` TEXT NOT NULL,
  `created_at` TIMESTAMP NULL DEFAULT NULL,
  `updated_at` TIMESTAMP NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_notes_players1_idx` (`players_id` ASC) VISIBLE,
  INDEX `fk_notes_cards1_idx` (`cards_id` ASC) VISIBLE,
  CONSTRAINT `fk_notes_cards1`
    FOREIGN KEY (`cards_id`)
    REFERENCES `senasoftdesarrolloweb`.`cards` (`id`),
  CONSTRAINT `fk_notes_players1`
    FOREIGN KEY (`players_id`)
    REFERENCES `senasoftdesarrolloweb`.`players` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;


-- -----------------------------------------------------
-- Table `senasoftdesarrolloweb`.`password_resets`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `senasoftdesarrolloweb`.`password_resets` (
  `email` VARCHAR(255) NOT NULL,
  `token` VARCHAR(255) NOT NULL,
  `created_at` TIMESTAMP NULL DEFAULT NULL,
  INDEX `password_resets_email_index` (`email` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;


-- -----------------------------------------------------
-- Table `senasoftdesarrolloweb`.`personal_access_tokens`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `senasoftdesarrolloweb`.`personal_access_tokens` (
  `id` BIGINT(19) UNSIGNED NOT NULL AUTO_INCREMENT,
  `tokenable_type` VARCHAR(255) NOT NULL,
  `tokenable_id` BIGINT(19) UNSIGNED NOT NULL,
  `name` VARCHAR(255) NOT NULL,
  `token` VARCHAR(64) NOT NULL,
  `abilities` TEXT NULL DEFAULT NULL,
  `last_used_at` TIMESTAMP NULL DEFAULT NULL,
  `created_at` TIMESTAMP NULL DEFAULT NULL,
  `updated_at` TIMESTAMP NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `personal_access_tokens_token_unique` (`token` ASC) VISIBLE,
  INDEX `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type` ASC, `tokenable_id` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
