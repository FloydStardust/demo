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
  UNIQUE INDEX `email_UNIQUE` (`email` ASC));
