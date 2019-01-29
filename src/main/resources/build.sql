-- -----------------------------------------------------
-- Table `gmair_admininfo`.`admin_info`
-- -----------------------------------------------------
CREATE TABLE `vkc`.`user` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `phone` VARCHAR(45) NULL,
  `email` VARCHAR(45) NULL,
  `user_name` VARCHAR(45) NOT NULL,
  `password` VARCHAR(255) NOT NULL,
  `block_flag` TINYINT(1) NOT NULL DEFAULT 0,
  `create_time` DATETIME NOT NULL DEFAULT now(),
  PRIMARY KEY (`id`),
  UNIQUE INDEX `phone_UNIQUE` (`phone` ASC),
  UNIQUE INDEX `user_name_UNIQUE` (`user_name` ASC),
  UNIQUE INDEX `email_UNIQUE` (`email` ASC));

/**
  增加真实姓名列
 */
ALTER TABLE `vkc`.`user`
ADD COLUMN `realname` VARCHAR(45) NULL AFTER `user_name`;

/**
  日程表
 */
CREATE TABLE `vkc`.`schedule` (
  `uid` INT NOT NULL AUTO_INCREMENT,
  `date` DATETIME NULL,
  `start` INT NULL,
  `end` INT NULL,
  `creator` VARCHAR(45) NOT NULL,
  `content` LONGBLOB NOT NULL,
  `create_time` VARCHAR(45) NOT NULL DEFAULT 'now()',
  `block_flag` TINYINT(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`uid`),
  UNIQUE INDEX `date_UNIQUE` (`date` ASC),
  UNIQUE INDEX `start_UNIQUE` (`start` ASC),
  UNIQUE INDEX `end_UNIQUE` (`end` ASC));

