-- -----------------------------------------------------
-- Table `gmair_admininfo`.`admin_info`
-- -----------------------------------------------------
CREATE TABLE `vkc`.`user` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `user_name` VARCHAR(45) NOT NULL,
  `password` VARCHAR(255) NOT NULL,
  `block_flag` TINYINT(1) NOT NULL DEFAULT 0,
  `create_time` DATETIME NOT NULL DEFAULT now(),
  PRIMARY KEY (`id`),
  UNIQUE INDEX `user_name_UNIQUE` (`user_name` ASC)
  ) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 ;

/**
  日程表
 */
CREATE TABLE `schedule` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `creator_id` varchar(45) NOT NULL,
  `date` datetime NOT NULL,
  `start` int(11) NOT NULL,
  `end` int(11) NOT NULL,
  `venue` varchar(45) NOT NULL,
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
  `share_type` varchar(45),
  `invest_type` varchar(45),
  `board_num` varchar(45),
  `round` varchar(45),
  `invest_partner` varchar(45),
  `money_type` varchar(45),
  `invest_num` int(11) UNSIGNED,
  `invest_ratio` varchar(45),
  `current_ratio` varchar(45) ,
  `source` VARCHAR (45) ,
  `partner` VARCHAR (45) ,
  `manager` VARCHAR (45) ,
  `boarder` VARCHAR (45) ,
  `industry` VARCHAR (45) ,
  `sector` VARCHAR (45) ,
  `location` VARCHAR (45) ,
  `register_location` VARCHAR (45) ,
  `intro` varchar(65532),
  `exit_status` varchar(45) ,
  `exit_type` varchar(45),
  `exit_time` VARCHAR (45) ,
  `value_achieved` int UNSIGNED,
  `value_achieving` int UNSIGNED,
  `total_value` int UNSIGNED,
  `return_multiple` double ,
  `irr` double ,
  `value_evidence` varchar(45),
  `finance_data` tinyint(1) DEFAULT '0',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `block_flag` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 ;

CREATE TABLE `financial_title` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `portfolio_id` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `belong_to` int(11) NOT NULL,
  `rank` int(11) NOT NULL,
  `importance` int(11) NOT NULL,
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `block_flag` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 ;

CREATE TABLE `financial_data` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `title_id` int(11) NOT NULL,
  `date` int(11) NOT NULL,
  `fy_date` int(11) NOT NULL,
  `track_id` int(11) NOT NULL,
  `data_type` int(11) NOT NULL,
  `money_type` int(11) DEFAULT 0,
  `number` bigint NOT NULL,
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `block_flag` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 ;

CREATE TABLE `financial_track` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `portfolio_id` int(11) NOT NULL,
  `count` int(11) NOT NULL,
  `type` int(11) NOT NULL,
  `is_raw` tinyint(1) NOT NULL,
  `date` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `block_flag` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 ;

CREATE TABLE `financial_budget` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `title_id` int(11) NOT NULL,
  `date` int(11) NOT NULL,
  `data_type` int(11) NOT NULL,
  `money_type` int(11) DEFAULT 0,
  `number` bigint NOT NULL,
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
  `account` integer ,
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
  `partner` int(11) NOT NULL,
  `manager` int(11),
  `company` VARCHAR (45) NOT NULL,
  `industry` VARCHAR (45) ,
  `location` VARCHAR (45) ,
  `summary` VARCHAR (45) ,
  `description` varchar(65532),
  `revenue` varchar(45),
  `net_income` varchar(45),
  `status` int(11) NOT NULL DEFAULT 0,
  `last_change` datetime NOT NULL,
  `next` varchar(45),
  `source_reason` varchar(65532),
  `special_concern` varchar(65532),
  `park_reason` varchar(65532),
  `pass_reason` varchar(65532),
  `meeting_record` varchar(45),
  `bp_record` varchar(45),
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `block_flag` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 ;

ALTER TABLE `vkc`.`schedule`
ADD COLUMN `venue` VARCHAR(45) NULL AFTER `creatorId`;

