-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema travelZ
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema travelZ
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `travelZ` DEFAULT CHARACTER SET latin1 ;
USE `travelZ` ;

-- -----------------------------------------------------
-- Table `travelZ`.`auth_group`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `travelZ`.`auth_group` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `name` (`name` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `travelZ`.`django_content_type`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `travelZ`.`django_content_type` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `app_label` VARCHAR(100) NOT NULL,
  `model` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label` ASC, `model` ASC))
ENGINE = InnoDB
AUTO_INCREMENT = 9
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `travelZ`.`auth_permission`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `travelZ`.`auth_permission` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  `content_type_id` INT(11) NOT NULL,
  `codename` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id` ASC, `codename` ASC),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co`
    FOREIGN KEY (`content_type_id`)
    REFERENCES `travelZ`.`django_content_type` (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 33
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `travelZ`.`auth_group_permissions`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `travelZ`.`auth_group_permissions` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `group_id` INT(11) NOT NULL,
  `permission_id` INT(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id` ASC, `permission_id` ASC),
  INDEX `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id` ASC),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm`
    FOREIGN KEY (`permission_id`)
    REFERENCES `travelZ`.`auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id`
    FOREIGN KEY (`group_id`)
    REFERENCES `travelZ`.`auth_group` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `travelZ`.`auth_user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `travelZ`.`auth_user` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `password` VARCHAR(128) NOT NULL,
  `last_login` DATETIME NULL DEFAULT NULL,
  `is_superuser` TINYINT(1) NOT NULL,
  `username` VARCHAR(150) NOT NULL,
  `first_name` VARCHAR(30) NOT NULL,
  `last_name` VARCHAR(150) NOT NULL,
  `email` VARCHAR(254) NOT NULL,
  `is_staff` TINYINT(1) NOT NULL,
  `is_active` TINYINT(1) NOT NULL,
  `date_joined` DATETIME NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `username` (`username` ASC))
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `travelZ`.`auth_user_groups`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `travelZ`.`auth_user_groups` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `user_id` INT(11) NOT NULL,
  `group_id` INT(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id` ASC, `group_id` ASC),
  INDEX `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id` ASC),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id`
    FOREIGN KEY (`group_id`)
    REFERENCES `travelZ`.`auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id`
    FOREIGN KEY (`user_id`)
    REFERENCES `travelZ`.`auth_user` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `travelZ`.`auth_user_user_permissions`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `travelZ`.`auth_user_user_permissions` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `user_id` INT(11) NOT NULL,
  `permission_id` INT(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id` ASC, `permission_id` ASC),
  INDEX `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id` ASC),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm`
    FOREIGN KEY (`permission_id`)
    REFERENCES `travelZ`.`auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id`
    FOREIGN KEY (`user_id`)
    REFERENCES `travelZ`.`auth_user` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `travelZ`.`django_admin_log`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `travelZ`.`django_admin_log` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `action_time` DATETIME NOT NULL,
  `object_id` LONGTEXT NULL DEFAULT NULL,
  `object_repr` VARCHAR(200) NOT NULL,
  `action_flag` SMALLINT(5) UNSIGNED NOT NULL,
  `change_message` LONGTEXT NOT NULL,
  `content_type_id` INT(11) NULL DEFAULT NULL,
  `user_id` INT(11) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id` ASC),
  INDEX `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id` ASC),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co`
    FOREIGN KEY (`content_type_id`)
    REFERENCES `travelZ`.`django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id`
    FOREIGN KEY (`user_id`)
    REFERENCES `travelZ`.`auth_user` (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 7
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `travelZ`.`django_migrations`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `travelZ`.`django_migrations` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `app` VARCHAR(255) NOT NULL,
  `name` VARCHAR(255) NOT NULL,
  `applied` DATETIME NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 23
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `travelZ`.`django_session`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `travelZ`.`django_session` (
  `session_key` VARCHAR(40) NOT NULL,
  `session_data` LONGTEXT NOT NULL,
  `expire_date` DATETIME NOT NULL,
  PRIMARY KEY (`session_key`),
  INDEX `django_session_expire_date_a5c62663` (`expire_date` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `travelZ`.`login_destination`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `travelZ`.`login_destination` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `city` VARCHAR(1000) NOT NULL,
  `country` VARCHAR(1000) NOT NULL,
  `desc` VARCHAR(1000) NOT NULL,
  `img_url` VARCHAR(10000) NOT NULL,
  `img` VARCHAR(100) NOT NULL,
  `price` DOUBLE NOT NULL,
  `offer` TINYINT(1) NOT NULL,
  `status` TINYINT(1) NOT NULL,
  `specialofferpercentage` DOUBLE NOT NULL,
  `specialprice` DOUBLE NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `travelZ`.`login_users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `travelZ`.`login_users` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NOT NULL,
  `password` VARCHAR(256) NOT NULL,
  `emailID` VARCHAR(128) NOT NULL,
  `mobileNo` VARCHAR(128) NOT NULL,
  `status` TINYINT(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `emailID` (`emailID` ASC))
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = latin1;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
