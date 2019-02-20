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
  `ipo_status` int(11),
  `share_type` int(11),
  `invest_type` int(11),
  `board_num` int(11),
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
  `intro` varchar(65532),
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

CREATE TABLE `financial_title` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `portfolio_id` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `belong_to` int(2) NOT NULL,
  `rank` int(11) NOT NULL,
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `block_flag` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 ;

CREATE TABLE `financial_data` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `title_id` int(11) NOT NULL,
  `date` datetime NOT NULL,
  `fy_date` datetime NOT NULL,
  `data_type` int(2) NOT NULL,
  `money_type` int(2) DEFAULT 0,
  `number` int(11) NOT NULL,
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `block_flag` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 ;

-- /**
--   利润表
--  */
-- CREATE TABLE `profit` (
--   `uid` int(11) NOT NULL AUTO_INCREMENT,
--   `portfolio_id` int(11) NOT NULL,
--   `type` int(11) NOT NULL,
--   `date` datetime NOT NULL,
--   `fy_date` datetime NOT NULL,
--   `revenue` int(11),
--   `cogs` int(11),
--   `gross_profit` int(11),
--   `operating_tax` int(11),
--   `selling_expense` int(11),
--   `admin_expense` int(11),
--   `financial_expense` int(11),
--   `asset_loss` int(11),
--   `fair_value_change` int(11),
--   `investment_income` int(11),
--   `other_income` int(11),
--   `operating_income` int(11),
--   `non_operating_income` int(11),
--   `non_operating_expense` int(11),
--   `income_before_tax` int(11),
--   `income_tax` int(11),
--   `net_income` int(11),
--   `gross_income` int(11),
--   `selling_expense_ratio` double,
--   `admin_expense_ratio` double,
--   `net_income_ratio` double,
--   `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
--   `block_flag` tinyint(1) NOT NULL DEFAULT '0',
--   PRIMARY KEY (`uid`)
-- ) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 ;
--
-- /**
--   资产负债表
--  */
--  CREATE TABLE `balance` (
--   `uid` int(11) NOT NULL AUTO_INCREMENT,
--   `portfolio_id` int(11) NOT NULL,
--   `type` int(11) NOT NULL,
--   `date` datetime NOT NULL,
--   `fy_date` datetime NOT NULL,
--   `monetary` int(11),
--   `financial_assets` int(11),
--   `note_receivable` int(11),
--   `account_receivable` int(11),
--   `advanced_payment`int(11),
--   `interest_receivable` int(11),
--   `other_receivable` int(11),
--   `inventory` int(11),
--   `other_current_assets` int(11),
--   `total_current_assets` int(11),
--   `long_term_equity` int(11),
--   `fixed_assets` int(11),
--   `construction` int(11),
--   `fixed_assets_disposal` int(11),
--   `intangible_assets` int(11),
--   `long_term_prepayment` int(11),
--   `deferred_tax_assets` int(11),
--   `other_non_current_assets` int(11),
--   `total_non_current_assets` int(11),
--   `total_assets` int(11),
--   `short_term_loan` int(11),
--   `financial_liabilities` int(11),
--   `note_payable` int(11),
--   `account_payable` int(11),
--   `advanced_receivable` int(11),
--   `accrued_payroll` int(11),
--   `tax_payable` int(11),
--   `interests_payable` int(11),
--   `dividend_payable` int(11),
--   `other_payable` int(11),
--   `long_term_liabilities_within_year` int(11),
--   `other_current_liabilities` int(11),
--   `total_current_liabilities` int(11),
--   `long_term_loan` int(11),
--   `long_term_bonds` int(11),
--   `long_term_payable` int(11),
--   `special_payable` int(11),
--   `accrued_liabilities` int(11),
--   `deferred_receivable` int(11),
--   `deferred_tax_liabilities` int(11),
--   `other_non_current_liabilities` int(11),
--   `total_non_current_liabilities` int(11),
--   `total_liabilities` int(11),
--   `paid_in_capital` int(11),
--   `capital_reserve` int(11),
--   `special_reserve` int(11),
--   `surplus_reserve` int(11),
--   `undistributed_profit` int(11),
--   `minority_equity` int(11),
--   `differences_in_conversion` int(11),
--   `total_owner_equity` int(11),
--   `total_liabilities_equity` int(11),
--   `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
--   `block_flag` tinyint(1) NOT NULL DEFAULT '0',
--   PRIMARY KEY (`uid`)
-- ) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 ;
--


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

