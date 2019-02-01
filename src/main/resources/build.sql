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
  `creatorId` VARCHAR(45) NOT NULL,
  `content` LONGBLOB NOT NULL,
  `create_time` VARCHAR(45) NOT NULL DEFAULT 'now()',
  `block_flag` TINYINT(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`uid`),
  UNIQUE INDEX `date_UNIQUE` (`date` ASC),
  UNIQUE INDEX `start_UNIQUE` (`start` ASC),
  UNIQUE INDEX `end_UNIQUE` (`end` ASC));

drop table `schedule`;

CREATE TABLE `schedule` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `date` datetime NOT NULL,
  `start` int(11) NOT NULL,
  `end` int(11) NOT NULL,
  `creatorId` varchar(45) NOT NULL,
  `content` longtext NOT NULL,
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `block_flag` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`uid`)
);
CREATE TABLE `portfolio` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `fund_id` int(11) NOT NULL,
  `date` varchar(45) NOT NULL,
  `share_type` int(11) NOT NULL,
  `invest_type` int(11) NOT NULL,
  `board_num` int(11) NOT NULL,
  `partner` varchar(45),
  `money_type` int(11),
  `invest_num` int(11) UNSIGNED,
  `invest_ratio` double,
  `current_ratio` double ,
  `source` varchar ,
  `director` varchar ,
  `manager` varchar ,
  `boarder` varchar ,
  `industry` varchar,
  `sector` varchar ,
  `location` varchar ,
  `register_location` varchar ,
  `exit_status` int ,
  `exit_type` int,
  `exit_time` varchar ,
  `value_achieved` int UNSIGNED,
  `value_achieving` int UNSIGNED,
  `total_value` int UNSIGNED,
  `return_multiple` double ,
  `irr` double ,
  `value_evidence` longtext,
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `block_flag` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`uid`)
);
CREATE TABLE `fund` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `account` integer NOT NULL,
  `start_date` varchar(45),
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `block_flag` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`uid`)
);
ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8

