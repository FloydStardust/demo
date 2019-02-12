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
  UNIQUE INDEX `email_UNIQUE` (`email` ASC)
  ) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 ;

/**
  增加真实姓名列
 */
ALTER TABLE `vkc`.`user`
ADD COLUMN `realname` VARCHAR(45) NULL AFTER `user_name`;

/**
  日程表
 */
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
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 ;

/**
  portfolio表
 */
CREATE TABLE `portfolio` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `fund_id` int(11) NOT NULL,
  `date` varchar(45) NOT NULL,
  `share_type` int(11) NOT NULL,
  `invest_type` int(11) NOT NULL,
  `board_num` int(11) NOT NULL,
  `round` varchar(45),
  `partner` varchar(45),
  `money_type` int(11),
  `invest_num` int(11) UNSIGNED,
  `invest_ratio` double,
  `current_ratio` double ,
  `source` VARCHAR (45) ,
  `director` VARCHAR (45) ,
  `manager` VARCHAR (45) ,
  `boarder` VARCHAR (45) ,
  `industry` VARCHAR (45) ,
  `sector` VARCHAR (45) ,
  `location` VARCHAR (45) ,
  `register_location` VARCHAR (45) ,
  `exit_status` int(11) ,
  `exit_type` int(11),
  `exit_time` VARCHAR (45) ,
  `value_achieved` int UNSIGNED,
  `value_achieving` int UNSIGNED,
  `total_value` int UNSIGNED,
  `return_multiple` double ,
  `irr` double ,
  `value_evidence` longtext,
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `block_flag` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 ;

/**
  fund表
 */
CREATE TABLE `fund` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `account` integer NOT NULL,
  `start_date` varchar(45),
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `block_flag` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 ;

/**
  leads表
 */
CREATE TABLE `leads` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `name`  VARCHAR (45) NOT NULL,
  `source` VARCHAR (45) NOT NULL,
  `director` VARCHAR (45) NOT NULL,
  `manager` VARCHAR (45),
  `company_name` VARCHAR (45) NOT NULL,
  `industry` VARCHAR (45) ,
  `location` VARCHAR (45) ,
  `summary` VARCHAR (45) ,
  `description` longtext,
  `status` int(11) ,
  `last_change` datetime NOT NULL,
  `next_step` int(11),
  `reason` longtext,
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `block_flag` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 ;

ALTER TABLE `vkc`.`schedule`
ADD COLUMN `venue` VARCHAR(45) NULL AFTER `creatorId`;

