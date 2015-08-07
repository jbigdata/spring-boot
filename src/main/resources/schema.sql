

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for ad
-- ----------------------------

CREATE TABLE IF NOT EXISTS  `ad` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_date` datetime NOT NULL,
  `modify_date` datetime NOT NULL,
  `orders` int(11) DEFAULT NULL,
  `begin_date` datetime DEFAULT NULL,
  `content` longtext,
  `end_date` datetime DEFAULT NULL,
  `path` varchar(255) DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `type` int(11) NOT NULL,
  `url` varchar(255) DEFAULT NULL,
  `ad_position` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK6D301C2E947C2F5` (`ad_position`),
  CONSTRAINT `FK6D301C2E947C2F5` FOREIGN KEY (`ad_position`) REFERENCES `ad_position` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for ad_position
-- ----------------------------
CREATE TABLE IF NOT EXISTS  `ad_position` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_date` datetime NOT NULL,
  `modify_date` datetime NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `height` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `template` longtext NOT NULL,
  `width` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
CREATE TABLE IF NOT EXISTS  `admin` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_date` datetime NOT NULL,
  `modify_date` datetime NOT NULL,
  `department` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `is_enabled` bit(1) NOT NULL,
  `is_locked` bit(1) NOT NULL,
  `locked_date` datetime DEFAULT NULL,
  `login_date` datetime DEFAULT NULL,
  `login_failure_count` int(11) NOT NULL,
  `login_ip` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for admin_role
-- ----------------------------
CREATE TABLE IF NOT EXISTS  `admin_role` (
  `admins` bigint(20) NOT NULL,
  `roles` bigint(20) NOT NULL,
  PRIMARY KEY (`admins`,`roles`),
  KEY `FKD291D6053FF548F7` (`roles`),
  KEY `FKD291D605A022690F` (`admins`),
  CONSTRAINT `FKD291D6053FF548F7` FOREIGN KEY (`roles`) REFERENCES `role` (`id`),
  CONSTRAINT `FKD291D605A022690F` FOREIGN KEY (`admins`) REFERENCES `admin` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for area
-- ----------------------------
CREATE TABLE IF NOT EXISTS  `area` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_date` datetime NOT NULL,
  `modify_date` datetime NOT NULL,
  `orders` int(11) DEFAULT NULL,
  `full_name` longtext NOT NULL,
  `name` varchar(100) NOT NULL,
  `tree_path` varchar(255) NOT NULL,
  `parent` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK9E19DA6CFE1E12FB` (`parent`),
  CONSTRAINT `FK9E19DA6CFE1E12FB` FOREIGN KEY (`parent`) REFERENCES `area` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3317 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for article
-- ----------------------------
CREATE TABLE IF NOT EXISTS  `article` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_date` datetime NOT NULL,
  `modify_date` datetime NOT NULL,
  `author` varchar(255) DEFAULT NULL,
  `content` longtext,
  `hits` bigint(20) NOT NULL,
  `is_publication` bit(1) NOT NULL,
  `is_top` bit(1) NOT NULL,
  `seo_description` varchar(255) DEFAULT NULL,
  `seo_keywords` varchar(255) DEFAULT NULL,
  `seo_title` varchar(255) DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `article_category` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK636982B7CA3B1F7` (`article_category`),
  CONSTRAINT `FK636982B7CA3B1F7` FOREIGN KEY (`article_category`) REFERENCES `article_category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for article_category
-- ----------------------------
CREATE TABLE IF NOT EXISTS  `article_category` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_date` datetime NOT NULL,
  `modify_date` datetime NOT NULL,
  `orders` int(11) DEFAULT NULL,
  `grade` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `seo_description` varchar(255) DEFAULT NULL,
  `seo_keywords` varchar(255) DEFAULT NULL,
  `seo_title` varchar(255) DEFAULT NULL,
  `tree_path` varchar(255) NOT NULL,
  `parent` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK57108986F587647A` (`parent`),
  CONSTRAINT `FK57108986F587647A` FOREIGN KEY (`parent`) REFERENCES `article_category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for article_tag
-- ----------------------------
CREATE TABLE IF NOT EXISTS  `article_tag` (
  `articles` bigint(20) NOT NULL,
  `tags` bigint(20) NOT NULL,
  PRIMARY KEY (`articles`,`tags`),
  KEY `FKB9183E12C842716F` (`tags`),
  KEY `FKB9183E1229F6DEEF` (`articles`),
  CONSTRAINT `FKB9183E1229F6DEEF` FOREIGN KEY (`articles`) REFERENCES `article` (`id`),
  CONSTRAINT `FKB9183E12C842716F` FOREIGN KEY (`tags`) REFERENCES `tag` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for attribute
-- ----------------------------
CREATE TABLE IF NOT EXISTS  `attribute` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_date` datetime NOT NULL,
  `modify_date` datetime NOT NULL,
  `orders` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `property_index` int(11) NOT NULL,
  `product_category` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKE81F41DD7629117` (`product_category`),
  CONSTRAINT `FKE81F41DD7629117` FOREIGN KEY (`product_category`) REFERENCES `product_category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for attribute_option
-- ----------------------------
CREATE TABLE IF NOT EXISTS  `attribute_option` (
  `attribute` bigint(20) NOT NULL,
  `options` varchar(255) DEFAULT NULL,
  KEY `FK96E026D75E1B95F4` (`attribute`),
  CONSTRAINT `FK96E026D75E1B95F4` FOREIGN KEY (`attribute`) REFERENCES `attribute` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for brand
-- ----------------------------
CREATE TABLE IF NOT EXISTS  `brand` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_date` datetime NOT NULL,
  `modify_date` datetime NOT NULL,
  `orders` int(11) DEFAULT NULL,
  `introduction` longtext,
  `logo` varchar(255) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `type` int(11) NOT NULL,
  `url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for cart
-- ----------------------------
CREATE TABLE IF NOT EXISTS  `cart` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_date` datetime NOT NULL,
  `modify_date` datetime NOT NULL,
  `cart_key` varchar(255) NOT NULL,
  `member` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK9E1A84FF7C62EDF8` (`member`),
  CONSTRAINT `FK9E1A84FF7C62EDF8` FOREIGN KEY (`member`) REFERENCES `member` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for cart_item
-- ----------------------------
CREATE TABLE IF NOT EXISTS  `cart_item` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_date` datetime NOT NULL,
  `modify_date` datetime NOT NULL,
  `quantity` int(11) NOT NULL,
  `cart` bigint(20) NOT NULL,
  `product` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK1A67F65339A23004` (`cart`),
  KEY `FK1A67F65379F8D99A` (`product`),
  CONSTRAINT `FK1A67F65339A23004` FOREIGN KEY (`cart`) REFERENCES `cart` (`id`),
  CONSTRAINT `FK1A67F65379F8D99A` FOREIGN KEY (`product`) REFERENCES `product` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for consultation
-- ----------------------------
CREATE TABLE IF NOT EXISTS  `consultation` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_date` datetime NOT NULL,
  `modify_date` datetime NOT NULL,
  `content` varchar(255) NOT NULL,
  `ip` varchar(255) NOT NULL,
  `is_show` bit(1) NOT NULL,
  `for_consultation` bigint(20) DEFAULT NULL,
  `member` bigint(20) DEFAULT NULL,
  `product` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK33228D687C62EDF8` (`member`),
  KEY `FK33228D68366B868C` (`for_consultation`),
  KEY `FK33228D6879F8D99A` (`product`),
  CONSTRAINT `FK33228D68366B868C` FOREIGN KEY (`for_consultation`) REFERENCES `consultation` (`id`),
  CONSTRAINT `FK33228D6879F8D99A` FOREIGN KEY (`product`) REFERENCES `product` (`id`),
  CONSTRAINT `FK33228D687C62EDF8` FOREIGN KEY (`member`) REFERENCES `member` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for coupon
-- ----------------------------
CREATE TABLE IF NOT EXISTS  `coupon` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_date` datetime NOT NULL,
  `modify_date` datetime NOT NULL,
  `begin_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `end_price` decimal(21,6) DEFAULT NULL,
  `introduction` longtext,
  `is_enabled` bit(1) NOT NULL,
  `is_exchange` bit(1) NOT NULL,
  `name` varchar(255) NOT NULL,
  `point` int(11) DEFAULT NULL,
  `prefix` varchar(255) NOT NULL,
  `price_operator` int(11) NOT NULL,
  `price_value` decimal(21,6) DEFAULT NULL,
  `start_price` decimal(21,6) DEFAULT NULL,
  `maximum_price` decimal(21,6) DEFAULT NULL,
  `maximum_quantity` int(11) DEFAULT NULL,
  `minimum_price` decimal(21,6) DEFAULT NULL,
  `minimum_quantity` int(11) DEFAULT NULL,
  `price_expression` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for coupon_code
-- ----------------------------
CREATE TABLE IF NOT EXISTS  `coupon_code` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_date` datetime NOT NULL,
  `modify_date` datetime NOT NULL,
  `code` varchar(255) NOT NULL,
  `is_used` bit(1) NOT NULL,
  `used_date` datetime DEFAULT NULL,
  `coupon` bigint(20) NOT NULL,
  `member` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`),
  KEY `FKEF53A3A77C62EDF8` (`member`),
  KEY `FKEF53A3A75B638910` (`coupon`),
  CONSTRAINT `FKEF53A3A75B638910` FOREIGN KEY (`coupon`) REFERENCES `coupon` (`id`),
  CONSTRAINT `FKEF53A3A77C62EDF8` FOREIGN KEY (`member`) REFERENCES `member` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for delivery_center
-- ----------------------------
CREATE TABLE IF NOT EXISTS  `delivery_center` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_date` datetime NOT NULL,
  `modify_date` datetime NOT NULL,
  `address` varchar(255) NOT NULL,
  `area_name` varchar(255) NOT NULL,
  `contact` varchar(255) NOT NULL,
  `is_default` bit(1) NOT NULL,
  `memo` varchar(255) DEFAULT NULL,
  `mobile` varchar(255) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `zip_code` varchar(255) DEFAULT NULL,
  `area` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK18EB77C139A0DADE` (`area`),
  CONSTRAINT `FK18EB77C139A0DADE` FOREIGN KEY (`area`) REFERENCES `area` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for delivery_corp
-- ----------------------------
CREATE TABLE IF NOT EXISTS  `delivery_corp` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_date` datetime NOT NULL,
  `modify_date` datetime NOT NULL,
  `orders` int(11) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for delivery_template
-- ----------------------------
CREATE TABLE IF NOT EXISTS  `delivery_template` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_date` datetime NOT NULL,
  `modify_date` datetime NOT NULL,
  `background` varchar(255) DEFAULT NULL,
  `content` longtext NOT NULL,
  `height` int(11) NOT NULL,
  `is_default` bit(1) NOT NULL,
  `memo` varchar(255) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `offsetx` int(11) NOT NULL,
  `offsety` int(11) NOT NULL,
  `width` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for deposit
-- ----------------------------
CREATE TABLE IF NOT EXISTS  `deposit` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_date` datetime NOT NULL,
  `modify_date` datetime NOT NULL,
  `balance` decimal(21,6) NOT NULL,
  `credit` decimal(21,6) NOT NULL,
  `debit` decimal(21,6) NOT NULL,
  `memo` varchar(255) DEFAULT NULL,
  `operator` varchar(255) DEFAULT NULL,
  `type` int(11) NOT NULL,
  `member` bigint(20) NOT NULL,
  `orders` bigint(20) DEFAULT NULL,
  `payment` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKEBB7CC5F7C62EDF8` (`member`),
  KEY `FKEBB7CC5F4115A3C8` (`payment`),
  KEY `FKEBB7CC5FB992E8EF` (`orders`),
  CONSTRAINT `FKEBB7CC5F4115A3C8` FOREIGN KEY (`payment`) REFERENCES `payment` (`id`),
  CONSTRAINT `FKEBB7CC5F7C62EDF8` FOREIGN KEY (`member`) REFERENCES `member` (`id`),
  CONSTRAINT `FKEBB7CC5FB992E8EF` FOREIGN KEY (`orders`) REFERENCES `order` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for friend_link
-- ----------------------------
CREATE TABLE IF NOT EXISTS  `friend_link` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_date` datetime NOT NULL,
  `modify_date` datetime NOT NULL,
  `orders` int(11) DEFAULT NULL,
  `logo` varchar(255) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `type` int(11) NOT NULL,
  `url` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for gift_item
-- ----------------------------
CREATE TABLE IF NOT EXISTS  `gift_item` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_date` datetime NOT NULL,
  `modify_date` datetime NOT NULL,
  `quantity` int(11) NOT NULL,
  `gift` bigint(20) NOT NULL,
  `promotion` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `gift` (`gift`,`promotion`),
  KEY `FK2FB85243FD463A02` (`promotion`),
  KEY `FK2FB852438C9B75DB` (`gift`),
  CONSTRAINT `FK2FB852438C9B75DB` FOREIGN KEY (`gift`) REFERENCES `product` (`id`),
  CONSTRAINT `FK2FB85243FD463A02` FOREIGN KEY (`promotion`) REFERENCES `promotion` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for goods
-- ----------------------------
CREATE TABLE IF NOT EXISTS  `goods` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_date` datetime NOT NULL,
  `modify_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for log
-- ----------------------------
CREATE TABLE IF NOT EXISTS  `log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_date` datetime NOT NULL,
  `modify_date` datetime NOT NULL,
  `content` longtext,
  `ip` varchar(255) NOT NULL,
  `operation` varchar(255) NOT NULL,
  `operator` varchar(255) DEFAULT NULL,
  `parameter` longtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for member
-- ----------------------------
CREATE TABLE IF NOT EXISTS  `member` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_date` datetime NOT NULL,
  `modify_date` datetime NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `amount` decimal(27,12) NOT NULL,
  `attribute_value0` varchar(255) DEFAULT NULL,
  `attribute_value1` varchar(255) DEFAULT NULL,
  `attribute_value2` varchar(255) DEFAULT NULL,
  `attribute_value3` varchar(255) DEFAULT NULL,
  `attribute_value4` varchar(255) DEFAULT NULL,
  `attribute_value5` varchar(255) DEFAULT NULL,
  `attribute_value6` varchar(255) DEFAULT NULL,
  `attribute_value7` varchar(255) DEFAULT NULL,
  `attribute_value8` varchar(255) DEFAULT NULL,
  `attribute_value9` varchar(255) DEFAULT NULL,
  `balance` decimal(27,12) NOT NULL,
  `birth` datetime DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `gender` int(11) DEFAULT NULL,
  `is_enabled` bit(1) NOT NULL,
  `is_locked` bit(1) NOT NULL,
  `locked_date` datetime DEFAULT NULL,
  `login_date` datetime DEFAULT NULL,
  `login_failure_count` int(11) NOT NULL,
  `login_ip` varchar(255) DEFAULT NULL,
  `mobile` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `point` bigint(20) NOT NULL,
  `register_ip` varchar(255) NOT NULL,
  `safe_key_expire` datetime DEFAULT NULL,
  `safe_key_value` varchar(255) DEFAULT NULL,
  `username` varchar(255) NOT NULL,
  `zip_code` varchar(255) DEFAULT NULL,
  `area` bigint(20) DEFAULT NULL,
  `member_rank` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  KEY `FK92D398B939A0DADE` (`area`),
  KEY `FK92D398B937884F5B` (`member_rank`),
  CONSTRAINT `FK92D398B937884F5B` FOREIGN KEY (`member_rank`) REFERENCES `member_rank` (`id`),
  CONSTRAINT `FK92D398B939A0DADE` FOREIGN KEY (`area`) REFERENCES `area` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for member_attribute
-- ----------------------------
CREATE TABLE IF NOT EXISTS  `member_attribute` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_date` datetime NOT NULL,
  `modify_date` datetime NOT NULL,
  `orders` int(11) DEFAULT NULL,
  `is_enabled` bit(1) NOT NULL,
  `is_required` bit(1) NOT NULL,
  `name` varchar(255) NOT NULL,
  `property_index` int(11) DEFAULT NULL,
  `type` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for member_attribute_option
-- ----------------------------
CREATE TABLE IF NOT EXISTS  `member_attribute_option` (
  `member_attribute` bigint(20) NOT NULL,
  `options` varchar(255) DEFAULT NULL,
  KEY `FKC3DC263E8A8815` (`member_attribute`),
  CONSTRAINT `FKC3DC263E8A8815` FOREIGN KEY (`member_attribute`) REFERENCES `member_attribute` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for member_favorite_product
-- ----------------------------
CREATE TABLE IF NOT EXISTS  `member_favorite_product` (
  `favorite_members` bigint(20) NOT NULL,
  `favorite_products` bigint(20) NOT NULL,
  PRIMARY KEY (`favorite_members`,`favorite_products`),
  KEY `FK44DF1412A43B40D4` (`favorite_members`),
  KEY `FK44DF1412830D5552` (`favorite_products`),
  CONSTRAINT `FK44DF1412830D5552` FOREIGN KEY (`favorite_products`) REFERENCES `product` (`id`),
  CONSTRAINT `FK44DF1412A43B40D4` FOREIGN KEY (`favorite_members`) REFERENCES `member` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for member_rank
-- ----------------------------
CREATE TABLE IF NOT EXISTS  `member_rank` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_date` datetime NOT NULL,
  `modify_date` datetime NOT NULL,
  `amount` decimal(21,6) DEFAULT NULL,
  `is_default` bit(1) NOT NULL,
  `is_special` bit(1) NOT NULL,
  `name` varchar(255) NOT NULL,
  `scale` double NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `amount` (`amount`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for message
-- ----------------------------
CREATE TABLE IF NOT EXISTS  `message` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_date` datetime NOT NULL,
  `modify_date` datetime NOT NULL,
  `content` longtext NOT NULL,
  `ip` varchar(255) NOT NULL,
  `is_draft` bit(1) NOT NULL,
  `receiver_delete` bit(1) NOT NULL,
  `receiver_read` bit(1) NOT NULL,
  `sender_delete` bit(1) NOT NULL,
  `sender_read` bit(1) NOT NULL,
  `title` varchar(255) NOT NULL,
  `for_message` bigint(20) DEFAULT NULL,
  `receiver` bigint(20) DEFAULT NULL,
  `sender` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKC7FBB5C886A07D93` (`sender`),
  KEY `FKC7FBB5C8E2B39A54` (`for_message`),
  KEY `FKC7FBB5C88C6C4D4D` (`receiver`),
  CONSTRAINT `FKC7FBB5C886A07D93` FOREIGN KEY (`sender`) REFERENCES `member` (`id`),
  CONSTRAINT `FKC7FBB5C88C6C4D4D` FOREIGN KEY (`receiver`) REFERENCES `member` (`id`),
  CONSTRAINT `FKC7FBB5C8E2B39A54` FOREIGN KEY (`for_message`) REFERENCES `message` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for navigation
-- ----------------------------
CREATE TABLE IF NOT EXISTS  `navigation` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_date` datetime NOT NULL,
  `modify_date` datetime NOT NULL,
  `orders` int(11) DEFAULT NULL,
  `is_blank_target` bit(1) NOT NULL,
  `name` varchar(255) NOT NULL,
  `position` int(11) NOT NULL,
  `url` varchar(255) NOT NULL,
  `ioc` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for order
-- ----------------------------
CREATE TABLE IF NOT EXISTS  `order` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_date` datetime NOT NULL,
  `modify_date` datetime NOT NULL,
  `address` varchar(255) NOT NULL,
  `amount_paid` decimal(21,6) NOT NULL,
  `area_name` varchar(255) NOT NULL,
  `consignee` varchar(255) NOT NULL,
  `discount` decimal(21,6) NOT NULL,
  `expire` datetime DEFAULT NULL,
  `fee` decimal(21,6) NOT NULL,
  `freight` decimal(21,6) NOT NULL,
  `invoice_title` varchar(255) DEFAULT NULL,
  `is_allocated_stock` bit(1) NOT NULL,
  `is_invoice` bit(1) NOT NULL,
  `lock_expire` datetime DEFAULT NULL,
  `memo` varchar(255) DEFAULT NULL,
  `order_status` int(11) NOT NULL,
  `payment_method_name` varchar(255) NOT NULL,
  `payment_status` int(11) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `point` int(11) NOT NULL,
  `promotion` varchar(255) DEFAULT NULL,
  `shipping_method_name` varchar(255) NOT NULL,
  `shipping_status` int(11) NOT NULL,
  `sn` varchar(255) NOT NULL,
  `tax` decimal(21,6) NOT NULL,
  `zip_code` varchar(255) NOT NULL,
  `area` bigint(20) DEFAULT NULL,
  `coupon_code` bigint(20) DEFAULT NULL,
  `member` bigint(20) NOT NULL,
  `operator` bigint(20) DEFAULT NULL,
  `payment_method` bigint(20) DEFAULT NULL,
  `shipping_method` bigint(20) DEFAULT NULL,
  `coupon_discount` decimal(21,6) NOT NULL,
  `offset_amount` decimal(21,6) NOT NULL,
  `promotion_discount` decimal(21,6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `sn` (`sn`),
  KEY `FK25E6B94F67F7C585` (`shipping_method`),
  KEY `FK25E6B94F39A0DADE` (`area`),
  KEY `FK25E6B94F7C62EDF8` (`member`),
  KEY `FK25E6B94FC050045D` (`coupon_code`),
  KEY `FK25E6B94FD7122AAF` (`operator`),
  KEY `FK25E6B94FD3A8BE7D` (`payment_method`),
  CONSTRAINT `FK25E6B94F39A0DADE` FOREIGN KEY (`area`) REFERENCES `area` (`id`),
  CONSTRAINT `FK25E6B94F67F7C585` FOREIGN KEY (`shipping_method`) REFERENCES `shipping_method` (`id`),
  CONSTRAINT `FK25E6B94F7C62EDF8` FOREIGN KEY (`member`) REFERENCES `member` (`id`),
  CONSTRAINT `FK25E6B94FC050045D` FOREIGN KEY (`coupon_code`) REFERENCES `coupon_code` (`id`),
  CONSTRAINT `FK25E6B94FD3A8BE7D` FOREIGN KEY (`payment_method`) REFERENCES `payment_method` (`id`),
  CONSTRAINT `FK25E6B94FD7122AAF` FOREIGN KEY (`operator`) REFERENCES `admin` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for order_coupon
-- ----------------------------
CREATE TABLE IF NOT EXISTS  `order_coupon` (
  `orders` bigint(20) NOT NULL,
  `coupons` bigint(20) NOT NULL,
  KEY `FKA3F6D516E538DDF7` (`coupons`),
  KEY `FKA3F6D516B992E8EF` (`orders`),
  CONSTRAINT `FKA3F6D516B992E8EF` FOREIGN KEY (`orders`) REFERENCES `order` (`id`),
  CONSTRAINT `FKA3F6D516E538DDF7` FOREIGN KEY (`coupons`) REFERENCES `coupon` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for order_item
-- ----------------------------
CREATE TABLE IF NOT EXISTS  `order_item` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_date` datetime NOT NULL,
  `modify_date` datetime NOT NULL,
  `full_name` varchar(255) NOT NULL,
  `is_gift` bit(1) NOT NULL,
  `name` varchar(255) NOT NULL,
  `price` decimal(21,6) NOT NULL,
  `quantity` int(11) NOT NULL,
  `return_quantity` int(11) NOT NULL,
  `shipped_quantity` int(11) NOT NULL,
  `sn` varchar(255) NOT NULL,
  `thumbnail` varchar(255) DEFAULT NULL,
  `weight` int(11) DEFAULT NULL,
  `orders` bigint(20) NOT NULL,
  `product` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKD69FF403B992E8EF` (`orders`),
  KEY `FKD69FF40379F8D99A` (`product`),
  CONSTRAINT `FKD69FF40379F8D99A` FOREIGN KEY (`product`) REFERENCES `product` (`id`),
  CONSTRAINT `FKD69FF403B992E8EF` FOREIGN KEY (`orders`) REFERENCES `order` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for order_log
-- ----------------------------
CREATE TABLE IF NOT EXISTS  `order_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_date` datetime NOT NULL,
  `modify_date` datetime NOT NULL,
  `content` varchar(255) DEFAULT NULL,
  `operator` varchar(255) DEFAULT NULL,
  `type` int(11) NOT NULL,
  `orders` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKF6684C54B992E8EF` (`orders`),
  CONSTRAINT `FKF6684C54B992E8EF` FOREIGN KEY (`orders`) REFERENCES `order` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for parameter
-- ----------------------------
CREATE TABLE IF NOT EXISTS  `parameter` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_date` datetime NOT NULL,
  `modify_date` datetime NOT NULL,
  `orders` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `parameter_group` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK8238FD2A818BF383` (`parameter_group`),
  CONSTRAINT `FK8238FD2A818BF383` FOREIGN KEY (`parameter_group`) REFERENCES `parameter_group` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=143 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for parameter_group
-- ----------------------------
CREATE TABLE IF NOT EXISTS  `parameter_group` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_date` datetime NOT NULL,
  `modify_date` datetime NOT NULL,
  `orders` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `product_category` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKD68A4F2AD7629117` (`product_category`),
  CONSTRAINT `FKD68A4F2AD7629117` FOREIGN KEY (`product_category`) REFERENCES `product_category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for payment
-- ----------------------------
CREATE TABLE IF NOT EXISTS  `payment` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_date` datetime NOT NULL,
  `modify_date` datetime NOT NULL,
  `account` varchar(255) DEFAULT NULL,
  `amount` decimal(21,6) NOT NULL,
  `bank` varchar(255) DEFAULT NULL,
  `expire` datetime DEFAULT NULL,
  `fee` decimal(21,6) NOT NULL,
  `memo` varchar(255) DEFAULT NULL,
  `operator` varchar(255) DEFAULT NULL,
  `payer` varchar(255) DEFAULT NULL,
  `payment_date` datetime DEFAULT NULL,
  `payment_method` varchar(255) DEFAULT NULL,
  `payment_plugin_id` varchar(255) DEFAULT NULL,
  `sn` varchar(255) NOT NULL,
  `status` int(11) NOT NULL,
  `type` int(11) NOT NULL,
  `member` bigint(20) DEFAULT NULL,
  `orders` bigint(20) DEFAULT NULL,
  `method` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `sn` (`sn`),
  KEY `FK602CE7C77C62EDF8` (`member`),
  KEY `FK602CE7C7B992E8EF` (`orders`),
  CONSTRAINT `FK602CE7C77C62EDF8` FOREIGN KEY (`member`) REFERENCES `member` (`id`),
  CONSTRAINT `FK602CE7C7B992E8EF` FOREIGN KEY (`orders`) REFERENCES `order` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for payment_method
-- ----------------------------
CREATE TABLE IF NOT EXISTS  `payment_method` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_date` datetime NOT NULL,
  `modify_date` datetime NOT NULL,
  `orders` int(11) DEFAULT NULL,
  `content` longtext,
  `description` varchar(255) DEFAULT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `timeout` int(11) DEFAULT NULL,
  `type` int(11) NOT NULL,
  `method` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for payment_shipping_method
-- ----------------------------
CREATE TABLE IF NOT EXISTS  `payment_shipping_method` (
  `payment_methods` bigint(20) NOT NULL,
  `shipping_methods` bigint(20) NOT NULL,
  PRIMARY KEY (`payment_methods`,`shipping_methods`),
  KEY `FKC1F53CAC85883714` (`shipping_methods`),
  KEY `FKC1F53CACA2ED13BC` (`payment_methods`),
  CONSTRAINT `FKC1F53CAC85883714` FOREIGN KEY (`shipping_methods`) REFERENCES `shipping_method` (`id`),
  CONSTRAINT `FKC1F53CACA2ED13BC` FOREIGN KEY (`payment_methods`) REFERENCES `payment_method` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for plugin_config
-- ----------------------------
CREATE TABLE IF NOT EXISTS  `plugin_config` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_date` datetime NOT NULL,
  `modify_date` datetime NOT NULL,
  `orders` int(11) DEFAULT NULL,
  `is_enabled` bit(1) NOT NULL,
  `plugin_id` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `plugin_id` (`plugin_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for plugin_config_attribute
-- ----------------------------
CREATE TABLE IF NOT EXISTS  `plugin_config_attribute` (
  `plugin_config` bigint(20) NOT NULL,
  `attributes` varchar(255) DEFAULT NULL,
  `attributes_key` varchar(255) NOT NULL DEFAULT '',
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`plugin_config`,`attributes_key`),
  KEY `FK42CB712CE174C3E7` (`plugin_config`),
  CONSTRAINT `FK42CB712CE174C3E7` FOREIGN KEY (`plugin_config`) REFERENCES `plugin_config` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for product
-- ----------------------------
CREATE TABLE IF NOT EXISTS  `product` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_date` datetime NOT NULL,
  `modify_date` datetime NOT NULL,
  `allocated_stock` int(11) NOT NULL,
  `attribute_value0` varchar(255) DEFAULT NULL,
  `attribute_value1` varchar(255) DEFAULT NULL,
  `attribute_value10` varchar(255) DEFAULT NULL,
  `attribute_value11` varchar(255) DEFAULT NULL,
  `attribute_value12` varchar(255) DEFAULT NULL,
  `attribute_value13` varchar(255) DEFAULT NULL,
  `attribute_value14` varchar(255) DEFAULT NULL,
  `attribute_value15` varchar(255) DEFAULT NULL,
  `attribute_value16` varchar(255) DEFAULT NULL,
  `attribute_value17` varchar(255) DEFAULT NULL,
  `attribute_value18` varchar(255) DEFAULT NULL,
  `attribute_value19` varchar(255) DEFAULT NULL,
  `attribute_value2` varchar(255) DEFAULT NULL,
  `attribute_value3` varchar(255) DEFAULT NULL,
  `attribute_value4` varchar(255) DEFAULT NULL,
  `attribute_value5` varchar(255) DEFAULT NULL,
  `attribute_value6` varchar(255) DEFAULT NULL,
  `attribute_value7` varchar(255) DEFAULT NULL,
  `attribute_value8` varchar(255) DEFAULT NULL,
  `attribute_value9` varchar(255) DEFAULT NULL,
  `cost` decimal(21,6) DEFAULT NULL,
  `full_name` varchar(255) NOT NULL,
  `hits` bigint(20) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `introduction` longtext,
  `is_gift` bit(1) NOT NULL,
  `is_list` bit(1) NOT NULL,
  `is_marketable` bit(1) NOT NULL,
  `is_top` bit(1) NOT NULL,
  `keyword` varchar(255) DEFAULT NULL,
  `market_price` decimal(21,6) NOT NULL,
  `memo` varchar(255) DEFAULT NULL,
  `month_hits` bigint(20) NOT NULL,
  `month_hits_date` datetime NOT NULL,
  `month_sales` bigint(20) NOT NULL,
  `month_sales_date` datetime NOT NULL,
  `name` varchar(255) NOT NULL,
  `point` bigint(20) NOT NULL,
  `price` decimal(21,6) NOT NULL,
  `sales` bigint(20) NOT NULL,
  `score` float NOT NULL,
  `score_count` bigint(20) NOT NULL,
  `seo_description` varchar(255) DEFAULT NULL,
  `seo_keywords` varchar(255) DEFAULT NULL,
  `seo_title` varchar(255) DEFAULT NULL,
  `sn` varchar(255) NOT NULL,
  `stock` int(11) DEFAULT NULL,
  `stock_memo` varchar(255) DEFAULT NULL,
  `total_score` bigint(20) NOT NULL,
  `unit` varchar(255) DEFAULT NULL,
  `week_hits` bigint(20) NOT NULL,
  `week_hits_date` datetime NOT NULL,
  `week_sales` bigint(20) NOT NULL,
  `week_sales_date` datetime NOT NULL,
  `weight` int(11) DEFAULT NULL,
  `brand` bigint(20) DEFAULT NULL,
  `goods` bigint(20) NOT NULL,
  `product_category` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `sn` (`sn`),
  KEY `FK7C9E82B0D7629117` (`product_category`),
  KEY `FK7C9E82B0FB212D68` (`goods`),
  KEY `FK7C9E82B0FA9695CA` (`brand`),
  CONSTRAINT `FK7C9E82B0D7629117` FOREIGN KEY (`product_category`) REFERENCES `product_category` (`id`),
  CONSTRAINT `FK7C9E82B0FA9695CA` FOREIGN KEY (`brand`) REFERENCES `brand` (`id`),
  CONSTRAINT `FK7C9E82B0FB212D68` FOREIGN KEY (`goods`) REFERENCES `goods` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=301 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for product_category
-- ----------------------------
CREATE TABLE IF NOT EXISTS  `product_category` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_date` datetime NOT NULL,
  `modify_date` datetime NOT NULL,
  `orders` int(11) DEFAULT NULL,
  `grade` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `seo_description` varchar(255) DEFAULT NULL,
  `seo_keywords` varchar(255) DEFAULT NULL,
  `seo_title` varchar(255) DEFAULT NULL,
  `tree_path` varchar(255) NOT NULL,
  `parent` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK1B7971ADFBDD5B73` (`parent`),
  CONSTRAINT `FK1B7971ADFBDD5B73` FOREIGN KEY (`parent`) REFERENCES `product_category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=79 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for product_category_brand
-- ----------------------------
CREATE TABLE IF NOT EXISTS  `product_category_brand` (
  `product_categories` bigint(20) NOT NULL,
  `brands` bigint(20) NOT NULL,
  PRIMARY KEY (`product_categories`,`brands`),
  KEY `FKE42D6A75A2AB700F` (`brands`),
  KEY `FKE42D6A758C4C0635` (`product_categories`),
  CONSTRAINT `FKE42D6A758C4C0635` FOREIGN KEY (`product_categories`) REFERENCES `product_category` (`id`),
  CONSTRAINT `FKE42D6A75A2AB700F` FOREIGN KEY (`brands`) REFERENCES `brand` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for product_member_price
-- ----------------------------
CREATE TABLE IF NOT EXISTS  `product_member_price` (
  `product` bigint(20) NOT NULL,
  `member_price` decimal(19,2) DEFAULT NULL,
  `member_price_key` bigint(20) NOT NULL,
  PRIMARY KEY (`product`,`member_price_key`),
  KEY `FKDCCD88935CCD83AE` (`member_price_key`),
  KEY `FKDCCD889379F8D99A` (`product`),
  CONSTRAINT `FKDCCD88935CCD83AE` FOREIGN KEY (`member_price_key`) REFERENCES `member_rank` (`id`),
  CONSTRAINT `FKDCCD889379F8D99A` FOREIGN KEY (`product`) REFERENCES `product` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for product_notify
-- ----------------------------
CREATE TABLE IF NOT EXISTS  `product_notify` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_date` datetime NOT NULL,
  `modify_date` datetime NOT NULL,
  `email` varchar(255) NOT NULL,
  `has_sent` bit(1) NOT NULL,
  `member` bigint(20) DEFAULT NULL,
  `product` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKDCB1ABB87C62EDF8` (`member`),
  KEY `FKDCB1ABB879F8D99A` (`product`),
  CONSTRAINT `FKDCB1ABB879F8D99A` FOREIGN KEY (`product`) REFERENCES `product` (`id`),
  CONSTRAINT `FKDCB1ABB87C62EDF8` FOREIGN KEY (`member`) REFERENCES `member` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for product_parameter_value
-- ----------------------------
CREATE TABLE IF NOT EXISTS  `product_parameter_value` (
  `product` bigint(20) NOT NULL,
  `parameter_value` varchar(255) DEFAULT NULL,
  `parameter_value_key` bigint(20) NOT NULL,
  PRIMARY KEY (`product`,`parameter_value_key`),
  KEY `FK1B76FDCCEDA221E0` (`parameter_value_key`),
  KEY `FK1B76FDCC79F8D99A` (`product`),
  CONSTRAINT `FK1B76FDCC79F8D99A` FOREIGN KEY (`product`) REFERENCES `product` (`id`),
  CONSTRAINT `FK1B76FDCCEDA221E0` FOREIGN KEY (`parameter_value_key`) REFERENCES `parameter` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for product_product_image
-- ----------------------------
CREATE TABLE IF NOT EXISTS  `product_product_image` (
  `product` bigint(20) NOT NULL,
  `large` varchar(255) DEFAULT NULL,
  `medium` varchar(255) DEFAULT NULL,
  `orders` int(11) DEFAULT NULL,
  `source` varchar(255) DEFAULT NULL,
  `thumbnail` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  KEY `FK66470ABC79F8D99A` (`product`),
  CONSTRAINT `FK66470ABC79F8D99A` FOREIGN KEY (`product`) REFERENCES `product` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for product_specification
-- ----------------------------
CREATE TABLE IF NOT EXISTS  `product_specification` (
  `products` bigint(20) NOT NULL,
  `specifications` bigint(20) NOT NULL,
  PRIMARY KEY (`products`,`specifications`),
  KEY `FK622421B45096DE0F` (`products`),
  KEY `FK622421B4840DA38F` (`specifications`),
  CONSTRAINT `FK622421B45096DE0F` FOREIGN KEY (`products`) REFERENCES `product` (`id`),
  CONSTRAINT `FK622421B4840DA38F` FOREIGN KEY (`specifications`) REFERENCES `specification` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for product_specification_value
-- ----------------------------
CREATE TABLE IF NOT EXISTS  `product_specification_value` (
  `products` bigint(20) NOT NULL,
  `specification_values` bigint(20) NOT NULL,
  PRIMARY KEY (`products`,`specification_values`),
  KEY `FKBF71FF265096DE0F` (`products`),
  KEY `FKBF71FF2677BD1CD0` (`specification_values`),
  CONSTRAINT `FKBF71FF265096DE0F` FOREIGN KEY (`products`) REFERENCES `product` (`id`),
  CONSTRAINT `FKBF71FF2677BD1CD0` FOREIGN KEY (`specification_values`) REFERENCES `specification_value` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for product_tag
-- ----------------------------
CREATE TABLE IF NOT EXISTS  `product_tag` (
  `products` bigint(20) NOT NULL,
  `tags` bigint(20) NOT NULL,
  PRIMARY KEY (`products`,`tags`),
  KEY `FK2F6A998B5096DE0F` (`products`),
  KEY `FK2F6A998BC842716F` (`tags`),
  CONSTRAINT `FK2F6A998B5096DE0F` FOREIGN KEY (`products`) REFERENCES `product` (`id`),
  CONSTRAINT `FK2F6A998BC842716F` FOREIGN KEY (`tags`) REFERENCES `tag` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for promotion
-- ----------------------------
CREATE TABLE IF NOT EXISTS  `promotion` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_date` datetime NOT NULL,
  `modify_date` datetime NOT NULL,
  `orders` int(11) DEFAULT NULL,
  `begin_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `end_price` decimal(21,6) DEFAULT NULL,
  `introduction` longtext,
  `is_coupon_allowed` bit(1) NOT NULL,
  `is_free_shipping` bit(1) NOT NULL,
  `name` varchar(255) NOT NULL,
  `point_operator` int(11) NOT NULL,
  `point_value` decimal(19,2) DEFAULT NULL,
  `price_operator` int(11) NOT NULL,
  `price_value` decimal(21,6) DEFAULT NULL,
  `start_price` decimal(21,6) DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `maximum_price` decimal(21,6) DEFAULT NULL,
  `maximum_quantity` int(11) DEFAULT NULL,
  `minimum_price` decimal(21,6) DEFAULT NULL,
  `minimum_quantity` int(11) DEFAULT NULL,
  `point_expression` varchar(255) DEFAULT NULL,
  `price_expression` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for promotion_brand
-- ----------------------------
CREATE TABLE IF NOT EXISTS  `promotion_brand` (
  `promotions` bigint(20) NOT NULL,
  `brands` bigint(20) NOT NULL,
  PRIMARY KEY (`promotions`,`brands`),
  KEY `FKBD21C9ACA2AB700F` (`brands`),
  KEY `FKBD21C9AC682BD58F` (`promotions`),
  CONSTRAINT `FKBD21C9AC682BD58F` FOREIGN KEY (`promotions`) REFERENCES `promotion` (`id`),
  CONSTRAINT `FKBD21C9ACA2AB700F` FOREIGN KEY (`brands`) REFERENCES `brand` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for promotion_coupon
-- ----------------------------
CREATE TABLE IF NOT EXISTS  `promotion_coupon` (
  `promotions` bigint(20) NOT NULL,
  `coupons` bigint(20) NOT NULL,
  PRIMARY KEY (`promotions`,`coupons`),
  KEY `FKE8AB1EA1E538DDF7` (`coupons`),
  KEY `FKE8AB1EA1682BD58F` (`promotions`),
  CONSTRAINT `FKE8AB1EA1682BD58F` FOREIGN KEY (`promotions`) REFERENCES `promotion` (`id`),
  CONSTRAINT `FKE8AB1EA1E538DDF7` FOREIGN KEY (`coupons`) REFERENCES `coupon` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for promotion_member_rank
-- ----------------------------
CREATE TABLE IF NOT EXISTS  `promotion_member_rank` (
  `promotions` bigint(20) NOT NULL,
  `member_ranks` bigint(20) NOT NULL,
  PRIMARY KEY (`promotions`,`member_ranks`),
  KEY `FKFF359916E24D908C` (`member_ranks`),
  KEY `FKFF359916682BD58F` (`promotions`),
  CONSTRAINT `FKFF359916682BD58F` FOREIGN KEY (`promotions`) REFERENCES `promotion` (`id`),
  CONSTRAINT `FKFF359916E24D908C` FOREIGN KEY (`member_ranks`) REFERENCES `member_rank` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for promotion_product
-- ----------------------------
CREATE TABLE IF NOT EXISTS  `promotion_product` (
  `promotions` bigint(20) NOT NULL,
  `products` bigint(20) NOT NULL,
  PRIMARY KEY (`promotions`,`products`),
  KEY `FKE12E55D45096DE0F` (`products`),
  KEY `FKE12E55D4682BD58F` (`promotions`),
  CONSTRAINT `FKE12E55D45096DE0F` FOREIGN KEY (`products`) REFERENCES `product` (`id`),
  CONSTRAINT `FKE12E55D4682BD58F` FOREIGN KEY (`promotions`) REFERENCES `promotion` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for promotion_product_category
-- ----------------------------
CREATE TABLE IF NOT EXISTS  `promotion_product_category` (
  `promotions` bigint(20) NOT NULL,
  `product_categories` bigint(20) NOT NULL,
  PRIMARY KEY (`promotions`,`product_categories`),
  KEY `FK4A5AE7098C4C0635` (`product_categories`),
  KEY `FK4A5AE709682BD58F` (`promotions`),
  CONSTRAINT `FK4A5AE709682BD58F` FOREIGN KEY (`promotions`) REFERENCES `promotion` (`id`),
  CONSTRAINT `FK4A5AE7098C4C0635` FOREIGN KEY (`product_categories`) REFERENCES `product_category` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for receiver
-- ----------------------------
CREATE TABLE IF NOT EXISTS  `receiver` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_date` datetime NOT NULL,
  `modify_date` datetime NOT NULL,
  `address` varchar(255) NOT NULL,
  `area_name` varchar(255) NOT NULL,
  `consignee` varchar(255) NOT NULL,
  `is_default` bit(1) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `zip_code` varchar(255) NOT NULL,
  `area` bigint(20) DEFAULT NULL,
  `member` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK22D1EC4E39A0DADE` (`area`),
  KEY `FK22D1EC4E7C62EDF8` (`member`),
  CONSTRAINT `FK22D1EC4E39A0DADE` FOREIGN KEY (`area`) REFERENCES `area` (`id`),
  CONSTRAINT `FK22D1EC4E7C62EDF8` FOREIGN KEY (`member`) REFERENCES `member` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for refunds
-- ----------------------------
CREATE TABLE IF NOT EXISTS  `refunds` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_date` datetime NOT NULL,
  `modify_date` datetime NOT NULL,
  `account` varchar(255) DEFAULT NULL,
  `amount` decimal(21,6) NOT NULL,
  `bank` varchar(255) DEFAULT NULL,
  `memo` varchar(255) DEFAULT NULL,
  `operator` varchar(255) NOT NULL,
  `payee` varchar(255) DEFAULT NULL,
  `payment_method` varchar(255) DEFAULT NULL,
  `sn` varchar(255) NOT NULL,
  `type` int(11) NOT NULL,
  `orders` bigint(20) NOT NULL,
  `method` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `sn` (`sn`),
  KEY `FKCFC4C5BCB992E8EF` (`orders`),
  CONSTRAINT `FKCFC4C5BCB992E8EF` FOREIGN KEY (`orders`) REFERENCES `order` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for returns
-- ----------------------------
CREATE TABLE IF NOT EXISTS  `returns` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_date` datetime NOT NULL,
  `modify_date` datetime NOT NULL,
  `address` varchar(255) NOT NULL,
  `area` varchar(255) NOT NULL,
  `delivery_corp` varchar(255) DEFAULT NULL,
  `freight` decimal(21,6) DEFAULT NULL,
  `memo` varchar(255) DEFAULT NULL,
  `operator` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `shipper` varchar(255) NOT NULL,
  `shipping_method` varchar(255) DEFAULT NULL,
  `sn` varchar(255) NOT NULL,
  `tracking_no` varchar(255) DEFAULT NULL,
  `zip_code` varchar(255) NOT NULL,
  `orders` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `sn` (`sn`),
  KEY `FKD08A1F04B992E8EF` (`orders`),
  CONSTRAINT `FKD08A1F04B992E8EF` FOREIGN KEY (`orders`) REFERENCES `order` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for returns_item
-- ----------------------------
CREATE TABLE IF NOT EXISTS  `returns_item` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_date` datetime NOT NULL,
  `modify_date` datetime NOT NULL,
  `name` varchar(255) NOT NULL,
  `quantity` int(11) NOT NULL,
  `sn` varchar(255) NOT NULL,
  `returns` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKE830D76E21D01242` (`returns`),
  CONSTRAINT `FKE830D76E21D01242` FOREIGN KEY (`returns`) REFERENCES `returns` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for review
-- ----------------------------
CREATE TABLE IF NOT EXISTS  `review` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_date` datetime NOT NULL,
  `modify_date` datetime NOT NULL,
  `content` varchar(255) NOT NULL,
  `ip` varchar(255) NOT NULL,
  `is_show` bit(1) NOT NULL,
  `score` int(11) NOT NULL,
  `member` bigint(20) DEFAULT NULL,
  `product` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK9B6005777C62EDF8` (`member`),
  KEY `FK9B60057779F8D99A` (`product`),
  CONSTRAINT `FK9B60057779F8D99A` FOREIGN KEY (`product`) REFERENCES `product` (`id`),
  CONSTRAINT `FK9B6005777C62EDF8` FOREIGN KEY (`member`) REFERENCES `member` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for role
-- ----------------------------
CREATE TABLE IF NOT EXISTS  `role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_date` datetime NOT NULL,
  `modify_date` datetime NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `is_system` bit(1) NOT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for role_authority
-- ----------------------------
CREATE TABLE IF NOT EXISTS  `role_authority` (
  `role` bigint(20) NOT NULL,
  `authorities` varchar(255) DEFAULT NULL,
  KEY `FKE06165D939B03AB0` (`role`),
  CONSTRAINT `FKE06165D939B03AB0` FOREIGN KEY (`role`) REFERENCES `role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for seo
-- ----------------------------
CREATE TABLE IF NOT EXISTS  `seo` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_date` datetime NOT NULL,
  `modify_date` datetime NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `keywords` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `type` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `type` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for shipping
-- ----------------------------
CREATE TABLE IF NOT EXISTS  `shipping` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_date` datetime NOT NULL,
  `modify_date` datetime NOT NULL,
  `address` varchar(255) NOT NULL,
  `area` varchar(255) NOT NULL,
  `consignee` varchar(255) NOT NULL,
  `delivery_corp` varchar(255) NOT NULL,
  `delivery_corp_code` varchar(255) DEFAULT NULL,
  `delivery_corp_url` varchar(255) DEFAULT NULL,
  `freight` decimal(21,6) DEFAULT NULL,
  `memo` varchar(255) DEFAULT NULL,
  `operator` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `shipping_method` varchar(255) NOT NULL,
  `sn` varchar(255) NOT NULL,
  `tracking_no` varchar(255) DEFAULT NULL,
  `zip_code` varchar(255) NOT NULL,
  `orders` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `sn` (`sn`),
  KEY `FK3440E00DB992E8EF` (`orders`),
  CONSTRAINT `FK3440E00DB992E8EF` FOREIGN KEY (`orders`) REFERENCES `order` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for shipping_item
-- ----------------------------
CREATE TABLE IF NOT EXISTS  `shipping_item` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_date` datetime NOT NULL,
  `modify_date` datetime NOT NULL,
  `name` varchar(255) NOT NULL,
  `quantity` int(11) NOT NULL,
  `sn` varchar(255) NOT NULL,
  `shipping` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKCCE65405FF407320` (`shipping`),
  CONSTRAINT `FKCCE65405FF407320` FOREIGN KEY (`shipping`) REFERENCES `shipping` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for shipping_method
-- ----------------------------
CREATE TABLE IF NOT EXISTS  `shipping_method` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_date` datetime NOT NULL,
  `modify_date` datetime NOT NULL,
  `orders` int(11) DEFAULT NULL,
  `continue_price` decimal(21,6) NOT NULL,
  `continue_weight` int(11) NOT NULL,
  `description` longtext,
  `first_price` decimal(21,6) NOT NULL,
  `first_weight` int(11) NOT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `default_delivery_corp` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK32A8355346542319` (`default_delivery_corp`),
  CONSTRAINT `FK32A8355346542319` FOREIGN KEY (`default_delivery_corp`) REFERENCES `delivery_corp` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for sn
-- ----------------------------
CREATE TABLE IF NOT EXISTS  `sn` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_date` datetime NOT NULL,
  `modify_date` datetime NOT NULL,
  `last_value` bigint(20) NOT NULL,
  `type` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `type` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for specification
-- ----------------------------
CREATE TABLE IF NOT EXISTS  `specification` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_date` datetime NOT NULL,
  `modify_date` datetime NOT NULL,
  `orders` int(11) DEFAULT NULL,
  `memo` varchar(255) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `type` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for specification_value
-- ----------------------------
CREATE TABLE IF NOT EXISTS  `specification_value` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_date` datetime NOT NULL,
  `modify_date` datetime NOT NULL,
  `orders` int(11) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `specification` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK5E624376629A04C2` (`specification`),
  CONSTRAINT `FK5E624376629A04C2` FOREIGN KEY (`specification`) REFERENCES `specification` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=77 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tag
-- ----------------------------
CREATE TABLE IF NOT EXISTS  `tag` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_date` datetime NOT NULL,
  `modify_date` datetime NOT NULL,
  `orders` int(11) DEFAULT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `memo` varchar(255) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `type` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for wx_pub
-- ----------------------------
CREATE TABLE IF NOT EXISTS  `wx_pub` (
  `id` int(11) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `appid` varchar(100) NOT NULL,
  `secret` varchar(100) NOT NULL,
  `grant_type` varchar(20) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for wx_user
-- ----------------------------
CREATE TABLE IF NOT EXISTS  `wx_user` (
  `id` varchar(32) NOT NULL DEFAULT '',
  `subscribe` varchar(50) NOT NULL,
  `openid` varchar(50) NOT NULL,
  `nickname` varchar(50) DEFAULT NULL,
  `sex` int(1) DEFAULT NULL,
  `language` varchar(10) DEFAULT NULL,
  `city` varchar(20) DEFAULT NULL,
  `province` varchar(20) DEFAULT NULL,
  `country` varchar(20) DEFAULT NULL,
  `headimgurl` varchar(500) DEFAULT NULL,
  `subscribe_time` varchar(20) DEFAULT NULL,
  `unionid` varchar(50) DEFAULT NULL,
  `remark` varchar(200) DEFAULT NULL,
  `groupid` varchar(20) DEFAULT NULL,
  `create_by` varchar(32) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `update_by` varchar(32) DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  `del_flag` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
CREATE TABLE IF NOT EXISTS  `wx_group` (
  `id` varchar(32) NOT NULL,
  `name` varchar(50) NOT NULL,
  `count` int(6) NOT NULL,
  `create_by` varchar(32) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `update_by` varchar(32) DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  `del_flag` varchar(1) DEFAULT NULL,
  `group_id` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for wx_pub
-- ----------------------------
CREATE TABLE IF NOT EXISTS  `wx_pub` (
  `id` int(11) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `appid` varchar(100) NOT NULL,
  `secret` varchar(100) NOT NULL,
  `grant_type` varchar(20) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for wx_user
-- ----------------------------
CREATE TABLE IF NOT EXISTS  `wx_user` (
  `id` varchar(32) NOT NULL DEFAULT '',
  `subscribe` varchar(50) NOT NULL,
  `openid` varchar(50) NOT NULL,
  `nickname` varchar(50) DEFAULT NULL,
  `sex` int(1) DEFAULT NULL,
  `language` varchar(10) DEFAULT NULL,
  `city` varchar(20) DEFAULT NULL,
  `province` varchar(20) DEFAULT NULL,
  `country` varchar(20) DEFAULT NULL,
  `headimgurl` varchar(500) DEFAULT NULL,
  `subscribe_time` varchar(20) DEFAULT NULL,
  `unionid` varchar(50) DEFAULT NULL,
  `remark` varchar(200) DEFAULT NULL,
  `groupid` varchar(20) DEFAULT NULL,
  `create_by` varchar(32) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `update_by` varchar(32) DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  `del_flag` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

delete from  ad;
delete from  ad_position;
delete from  admin;
delete from  admin_role;
delete from  area;
delete from  article;
delete from  article_category;
delete from  article_tag;
delete from  attribute;
delete from  attribute_option;
delete from  brand;
delete from  cart;
delete from  cart_item;
delete from  consultation;
delete from  coupon;
delete from  coupon_code;
delete from  delivery_center;
delete from  delivery_corp;
delete from  delivery_template;
delete from  deposit;
delete from  friend_link;
delete from  gift_item;
delete from  goods;
delete from  log;
delete from  member;
delete from  member_attribute;
delete from  member_attribute_option;
delete from  member_favorite_product;
delete from  member_rank;
delete from  message;
delete from  navigation;
delete from  order_coupon;
delete from  order_item;
delete from  order_log;
delete from  parameter;
delete from  parameter_group;
delete from  payment;
delete from  payment_method;
delete from  payment_shipping_method;
delete from  plugin_config;
delete from  plugin_config_attribute;
delete from  product;
delete from  product_category;
delete from  product_category_brand;
delete from  product_member_price;
delete from  product_notify;
delete from  product_parameter_value;
delete from  product_product_image;
delete from  product_specification;
delete from  product_specification_value;
delete from  product_tag;
delete from  promotion;
delete from  promotion_brand;
delete from  promotion_coupon;
delete from  promotion_member_rank;
delete from  promotion_product;
delete from  promotion_product_category;
delete from  receiver;
delete from  refunds;
delete from  returns_item;
delete from  review;
delete from  role;
delete from  role_authority;
delete from  seo;
delete from  shipping;
delete from  shipping_item;
delete from  shipping_method;
delete from  sn;
delete from  specification;
delete from  specification_value;
delete from  tag;
delete from  wx_group;
delete from  wx_pub;
delete from  wx_user;
-- ----------------------------
-- Records 
-- ----------------------------
INSERT INTO `ad` VALUES ('1', '2013-01-01 13:33:15', '2013-01-01 22:32:06', '1', null, null, null, 'http://storage.shopxx.net/demo-image/3.0/ad/header.jpg', '正品保障', '1', null, '1');
INSERT INTO `ad` VALUES ('2', '2013-01-01 13:36:36', '2013-01-01 22:47:33', '2', null, null, null, 'http://storage.shopxx.net/demo-image/3.0/ad/footer.jpg', '我们的优势', '1', null, '2');
INSERT INTO `ad` VALUES ('3', '2013-01-01 13:33:40', '2013-01-01 22:46:11', '3', null, null, null, 'http://storage.shopxx.net/demo-image/3.0/ad/index_1.jpg', '享受这一刻的舒适', '1', null, '3');
INSERT INTO `ad` VALUES ('4', '2013-01-01 13:34:02', '2013-01-01 11:31:50', '4', null, null, null, 'http://storage.shopxx.net/demo-image/3.0/ad/index_2.jpg', '浪漫时尚季', '1', null, '3');
INSERT INTO `ad` VALUES ('5', '2013-01-01 13:34:19', '2013-01-01 22:46:24', '5', null, null, null, 'http://storage.shopxx.net/demo-image/3.0/ad/index_3.jpg', '伊见清新', '1', null, '3');
INSERT INTO `ad` VALUES ('6', '2013-01-01 13:35:30', '2013-01-01 22:47:16', '6', null, null, null, 'http://storage.shopxx.net/demo-image/3.0/ad/index_right.jpg', '春季新品', '1', null, '4');
INSERT INTO `ad` VALUES ('7', '2013-01-01 13:34:35', '2013-01-01 22:47:02', '7', null, null, null, 'http://storage.shopxx.net/demo-image/3.0/ad/index_top.jpg', '特卖会专场', '1', null, '5');
INSERT INTO `ad` VALUES ('8', '2013-01-01 12:46:56', '2013-01-01 22:47:25', '8', null, null, null, 'http://storage.shopxx.net/demo-image/3.0/ad/index_hot_product.jpg', '热门商品', '1', null, '6');
INSERT INTO `ad` VALUES ('9', '2013-01-01 12:47:18', '2013-01-01 22:47:28', '9', null, null, null, 'http://storage.shopxx.net/demo-image/3.0/ad/index_new_product.jpg', '最新商品', '1', null, '7');
INSERT INTO `ad` VALUES ('10', '2013-01-01 13:37:09', '2013-01-01 22:47:21', '10', null, '<dl>\r\n	<dt>\r\n		注册即享受\r\n	</dt>\r\n	<dd>\r\n		正品保障、正规发票\r\n	</dd>\r\n	<dd>\r\n		货到付款、会员服务\r\n	</dd>\r\n	<dd>\r\n		自由退换、售后上门\r\n	</dd>\r\n</dl>', null, null, '会员注册', '0', null, '8');
INSERT INTO `ad` VALUES ('11', '2013-01-01 13:37:35', '2013-01-01 22:47:37', '11', null, null, null, 'http://storage.shopxx.net/demo-image/3.0/ad/login.jpg', '会员登录', '1', null, '9');
INSERT INTO `ad_position` VALUES ('1', '2013-01-01 14:22:34', '2013-01-01 11:46:29', null, '50', '头部广告', '<div class=\"headerAd\">\r\n	[#list adPosition.ads as ad]\r\n		[#if ad.hasBegun() && !ad.hasEnded() && ad.type == \"image\"]\r\n			[#if ad.url??]\r\n				<a href=\"${ad.url}\">\r\n					<img src=\"${ad.path}\" width=\"${adPosition.width}\" height=\"${adPosition.height}\" alt=\"${ad.title}\" title=\"${ad.title}\" />\r\n				</a>\r\n			[#else]\r\n				<img src=\"${ad.path}\" width=\"${adPosition.width}\" height=\"${adPosition.height}\" alt=\"${ad.title}\" title=\"${ad.title}\" />\r\n			[/#if]\r\n		[/#if]\r\n	[/#list]\r\n</div>', '320');
INSERT INTO `ad_position` VALUES ('2', '2013-01-01 13:15:22', '2013-01-01 22:30:26', null, '52', '底部广告', '<div class=\"footerAd\">\r\n	[#list adPosition.ads as ad]\r\n		[#if ad.hasBegun() && !ad.hasEnded() && ad.type == \"image\"]\r\n			[#if ad.url??]\r\n				<a href=\"${ad.url}\">\r\n					<img src=\"${ad.path}\" width=\"${adPosition.width}\" height=\"${adPosition.height}\" alt=\"${ad.title}\" title=\"${ad.title}\" />\r\n				</a>\r\n			[#else]\r\n				<img src=\"${ad.path}\" width=\"${adPosition.width}\" height=\"${adPosition.height}\" alt=\"${ad.title}\" title=\"${ad.title}\" />\r\n			[/#if]\r\n		[/#if]\r\n	[/#list]\r\n</div>', '950');
INSERT INTO `ad_position` VALUES ('3', '2013-01-01 15:51:45', '2013-01-01 11:46:16', null, '290', '首页轮播广告', '<div data-am-widget=\"slider\" class=\"am-slider am-slider-default\"\r\n     data-am-slider=\'{&quot;animation&quot;:&quot;slide&quot;,&quot;slideshow&quot;:ture}\'>\r\n    <ul class=\"am-slides\" >\r\n        [#list adPosition.ads as ad]\r\n		[#if ad.hasBegun() && !ad.hasEnded() && ad.type == \"image\"]\r\n			[#if ad.url??]\r\n				<a href=\"${ad.url}\">\r\n					 <li><img src=\"${ad.path}\" width=\"${adPosition.width}\" height=\"${adPosition.height}\" alt=\"${ad.title}\" title=\"${ad.title}\" /> </li>\r\n				</a>\r\n			[#else]\r\n				 <li><img src=\"${ad.path}\" width=\"${adPosition.width}\" height=\"${adPosition.height}\" alt=\"${ad.title}\" title=\"${ad.title}\" /></li>\r\n			[/#if]\r\n		[/#if]\r\n	[/#list]\r\n    </ul>\r\n</div>', '1200');
INSERT INTO `ad_position` VALUES ('4', '2013-01-01 16:35:14', '2013-01-01 09:08:08', null, '106', '首页右侧广告', '<div class=\"rightAd\">\r\n	[#list adPosition.ads as ad]\r\n		[#if ad.hasBegun() && !ad.hasEnded() && ad.type == \"image\"]\r\n			[#if ad.url??]\r\n				<a href=\"${ad.url}\">\r\n					<img src=\"${ad.path}\" width=\"${adPosition.width}\" height=\"${adPosition.height}\" alt=\"${ad.title}\" title=\"${ad.title}\" />\r\n				</a>\r\n			[#else]\r\n				<img src=\"${ad.path}\" width=\"${adPosition.width}\" height=\"${adPosition.height}\" alt=\"${ad.title}\" title=\"${ad.title}\" />\r\n			[/#if]\r\n		[/#if]\r\n	[/#list]\r\n</div>', '230');
INSERT INTO `ad_position` VALUES ('5', '2013-01-01 15:48:13', '2013-01-01 08:58:12', null, '120', '首页中部广告', '<div class=\"middleAd\">\r\n	[#list adPosition.ads as ad]\r\n		[#if ad.hasBegun() && !ad.hasEnded() && ad.type == \"image\"]\r\n			[#if ad.url??]\r\n				<a href=\"${ad.url}\">\r\n					<img src=\"${ad.path}\" width=\"${adPosition.width}\" height=\"${adPosition.height}\" alt=\"${ad.title}\" title=\"${ad.title}\" />\r\n				</a>\r\n			[#else]\r\n				<img src=\"${ad.path}\" width=\"${adPosition.width}\" height=\"${adPosition.height}\" alt=\"${ad.title}\" title=\"${ad.title}\" />\r\n			[/#if]\r\n		[/#if]\r\n	[/#list]\r\n</div>', '1000');
INSERT INTO `ad_position` VALUES ('6', '2013-01-01 12:44:32', '2013-01-01 12:54:01', null, '343', '首页热门商品左则广告', '[#list adPosition.ads as ad]\r\n	[#if ad.hasBegun() && !ad.hasEnded() && ad.type == \"image\"]\r\n		[#if ad.url??]\r\n			<a href=\"${ad.url}\">\r\n				<img src=\"${ad.path}\" width=\"${adPosition.width}\" height=\"${adPosition.height}\" alt=\"${ad.title}\" title=\"${ad.title}\" />\r\n			</a>\r\n		[#else]\r\n			<img src=\"${ad.path}\" width=\"${adPosition.width}\" height=\"${adPosition.height}\" alt=\"${ad.title}\" title=\"${ad.title}\" />\r\n		[/#if]\r\n	[/#if]\r\n[/#list]', '260');
INSERT INTO `ad_position` VALUES ('7', '2013-01-01 12:45:43', '2013-01-01 12:53:58', null, '343', '首页最新商品左则广告', '[#list adPosition.ads as ad]\r\n	[#if ad.hasBegun() && !ad.hasEnded() && ad.type == \"image\"]\r\n		[#if ad.url??]\r\n			<a href=\"${ad.url}\">\r\n				<img src=\"${ad.path}\" width=\"${adPosition.width}\" height=\"${adPosition.height}\" alt=\"${ad.title}\" title=\"${ad.title}\" />\r\n			</a>\r\n		[#else]\r\n			<img src=\"${ad.path}\" width=\"${adPosition.width}\" height=\"${adPosition.height}\" alt=\"${ad.title}\" title=\"${ad.title}\" />\r\n		[/#if]\r\n	[/#if]\r\n[/#list]', '260');
INSERT INTO `ad_position` VALUES ('8', '2013-01-01 23:53:12', '2013-01-01 00:11:41', null, '300', '会员注册右侧广告', '<div class=\"ad\">\r\n	[#list adPosition.ads as ad]\r\n		[#if ad.hasBegun() && !ad.hasEnded() && ad.type == \"text\"]\r\n			[#if ad.url??]\r\n				<a href=\"${ad.url}\">\r\n					${ad.content}\r\n				</a>\r\n			[#else]\r\n				${ad.content}\r\n			[/#if]\r\n		[/#if]\r\n	[/#list]\r\n</div>', '240');
INSERT INTO `ad_position` VALUES ('9', '2013-01-01 00:12:44', '2013-01-01 22:42:13', null, '330', '会员登录左侧广告', '<div class=\"ad\">\r\n	[#list adPosition.ads as ad]\r\n		[#if ad.hasBegun() && !ad.hasEnded() && ad.type == \"image\"]\r\n			[#if ad.url??]\r\n				<a href=\"${ad.url}\">\r\n					<img src=\"${ad.path}\" width=\"${adPosition.width}\" height=\"${adPosition.height}\" alt=\"${ad.title}\" title=\"${ad.title}\" />\r\n				</a>\r\n			[#else]\r\n				<img src=\"${ad.path}\" width=\"${adPosition.width}\" height=\"${adPosition.height}\" alt=\"${ad.title}\" title=\"${ad.title}\" />\r\n			[/#if]\r\n		[/#if]\r\n	[/#list]\r\n</div>', '500');
INSERT INTO `admin` VALUES ('1', '2013-01-01 13:24:32', '2013-01-01 14:37:48', '技术部', 'admin@shopxx.net', '', '', null, '2013-01-01 14:37:48', '0', null, '管理员', '21232f297a57a5a743894a0e4a801fc3', 'admin');
INSERT INTO `admin_role` VALUES ('1', '1');
INSERT INTO `area` VALUES ('1', '2013-01-01 09:01:59', '2013-01-01 09:01:59', null, '北京市', '北京市', ',', null);
INSERT INTO `area` VALUES ('2', '2013-01-01 09:01:59', '2013-01-01 09:01:59', null, '北京市东城区', '东城区', ',1,', '1');
INSERT INTO `area` VALUES ('3', '2013-01-01 09:01:59', '2013-01-01 09:01:59', null, '北京市西城区', '西城区', ',1,', '1');
INSERT INTO `area` VALUES ('4', '2013-01-01 09:01:59', '2013-01-01 09:01:59', null, '北京市朝阳区', '朝阳区', ',1,', '1');
INSERT INTO `area` VALUES ('5', '2013-01-01 09:01:59', '2013-01-01 09:01:59', null, '北京市丰台区', '丰台区', ',1,', '1');
INSERT INTO `area` VALUES ('6', '2013-01-01 09:01:59', '2013-01-01 09:01:59', null, '北京市石景山区', '石景山区', ',1,', '1');
INSERT INTO `area` VALUES ('7', '2013-01-01 09:01:59', '2013-01-01 09:01:59', null, '北京市海淀区', '海淀区', ',1,', '1');
INSERT INTO `area` VALUES ('8', '2013-01-01 09:01:59', '2013-01-01 09:01:59', null, '北京市门头沟区', '门头沟区', ',1,', '1');
INSERT INTO `area` VALUES ('9', '2013-01-01 09:01:59', '2013-01-01 09:01:59', null, '北京市房山区', '房山区', ',1,', '1');
INSERT INTO `area` VALUES ('10', '2013-01-01 09:01:59', '2013-01-01 09:01:59', null, '北京市通州区', '通州区', ',1,', '1');
INSERT INTO `area` VALUES ('11', '2013-01-01 09:01:59', '2013-01-01 09:01:59', null, '北京市顺义区', '顺义区', ',1,', '1');
INSERT INTO `area` VALUES ('12', '2013-01-01 09:01:59', '2013-01-01 09:01:59', null, '北京市昌平区', '昌平区', ',1,', '1');
INSERT INTO `area` VALUES ('13', '2013-01-01 09:01:59', '2013-01-01 09:01:59', null, '北京市大兴区', '大兴区', ',1,', '1');
INSERT INTO `area` VALUES ('14', '2013-01-01 09:01:59', '2013-01-01 09:01:59', null, '北京市怀柔区', '怀柔区', ',1,', '1');
INSERT INTO `area` VALUES ('15', '2013-01-01 09:01:59', '2013-01-01 09:01:59', null, '北京市平谷区', '平谷区', ',1,', '1');
INSERT INTO `area` VALUES ('16', '2013-01-01 09:01:59', '2013-01-01 09:01:59', null, '北京市密云县', '密云县', ',1,', '1');
INSERT INTO `area` VALUES ('17', '2013-01-01 09:01:59', '2013-01-01 09:01:59', null, '北京市延庆县', '延庆县', ',1,', '1');
INSERT INTO `area` VALUES ('18', '2013-01-01 09:01:59', '2013-01-01 09:01:59', null, '天津市', '天津市', ',', null);
INSERT INTO `area` VALUES ('19', '2013-01-01 09:01:59', '2013-01-01 09:01:59', null, '天津市和平区', '和平区', ',18,', '18');
INSERT INTO `area` VALUES ('20', '2013-01-01 09:01:59', '2013-01-01 09:01:59', null, '天津市河东区', '河东区', ',18,', '18');
INSERT INTO `area` VALUES ('21', '2013-01-01 09:01:59', '2013-01-01 09:01:59', null, '天津市河西区', '河西区', ',18,', '18');
INSERT INTO `area` VALUES ('22', '2013-01-01 09:01:59', '2013-01-01 09:01:59', null, '天津市南开区', '南开区', ',18,', '18');
INSERT INTO `area` VALUES ('23', '2013-01-01 09:01:59', '2013-01-01 09:01:59', null, '天津市河北区', '河北区', ',18,', '18');
INSERT INTO `area` VALUES ('24', '2013-01-01 09:01:59', '2013-01-01 09:01:59', null, '天津市红桥区', '红桥区', ',18,', '18');
INSERT INTO `area` VALUES ('25', '2013-01-01 09:01:59', '2013-01-01 09:01:59', null, '天津市东丽区', '东丽区', ',18,', '18');
INSERT INTO `area` VALUES ('26', '2013-01-01 09:01:59', '2013-01-01 09:01:59', null, '天津市西青区', '西青区', ',18,', '18');
INSERT INTO `area` VALUES ('27', '2013-01-01 09:01:59', '2013-01-01 09:01:59', null, '天津市津南区', '津南区', ',18,', '18');
INSERT INTO `area` VALUES ('28', '2013-01-01 09:01:59', '2013-01-01 09:01:59', null, '天津市北辰区', '北辰区', ',18,', '18');
INSERT INTO `area` VALUES ('29', '2013-01-01 09:01:59', '2013-01-01 09:01:59', null, '天津市武清区', '武清区', ',18,', '18');
INSERT INTO `area` VALUES ('30', '2013-01-01 09:01:59', '2013-01-01 09:01:59', null, '天津市宝坻区', '宝坻区', ',18,', '18');
INSERT INTO `area` VALUES ('31', '2013-01-01 09:01:59', '2013-01-01 09:01:59', null, '天津市滨海新区', '滨海新区', ',18,', '18');
INSERT INTO `area` VALUES ('32', '2013-01-01 09:01:59', '2013-01-01 09:01:59', null, '天津市宁河县', '宁河县', ',18,', '18');
INSERT INTO `area` VALUES ('33', '2013-01-01 09:01:59', '2013-01-01 09:01:59', null, '天津市静海县', '静海县', ',18,', '18');
INSERT INTO `area` VALUES ('34', '2013-01-01 09:01:59', '2013-01-01 09:01:59', null, '天津市蓟县', '蓟县', ',18,', '18');
INSERT INTO `area` VALUES ('35', '2013-01-01 09:01:59', '2013-01-01 09:01:59', null, '河北省', '河北省', ',', null);
INSERT INTO `area` VALUES ('36', '2013-01-01 09:01:59', '2013-01-01 09:01:59', null, '河北省石家庄市', '石家庄市', ',35,', '35');
INSERT INTO `area` VALUES ('37', '2013-01-01 09:01:59', '2013-01-01 09:01:59', null, '河北省石家庄市长安区', '长安区', ',35,36,', '36');
INSERT INTO `area` VALUES ('38', '2013-01-01 09:01:59', '2013-01-01 09:01:59', null, '河北省石家庄市桥东区', '桥东区', ',35,36,', '36');
INSERT INTO `area` VALUES ('39', '2013-01-01 09:01:59', '2013-01-01 09:01:59', null, '河北省石家庄市桥西区', '桥西区', ',35,36,', '36');
INSERT INTO `area` VALUES ('40', '2013-01-01 09:01:59', '2013-01-01 09:01:59', null, '河北省石家庄市新华区', '新华区', ',35,36,', '36');
INSERT INTO `area` VALUES ('41', '2013-01-01 09:01:59', '2013-01-01 09:01:59', null, '河北省石家庄市井陉矿区', '井陉矿区', ',35,36,', '36');
INSERT INTO `area` VALUES ('42', '2013-01-01 09:01:59', '2013-01-01 09:01:59', null, '河北省石家庄市裕华区', '裕华区', ',35,36,', '36');
INSERT INTO `area` VALUES ('43', '2013-01-01 09:01:59', '2013-01-01 09:01:59', null, '河北省石家庄市井陉县', '井陉县', ',35,36,', '36');
INSERT INTO `area` VALUES ('44', '2013-01-01 09:01:59', '2013-01-01 09:01:59', null, '河北省石家庄市正定县', '正定县', ',35,36,', '36');
INSERT INTO `area` VALUES ('45', '2013-01-01 09:01:59', '2013-01-01 09:01:59', null, '河北省石家庄市栾城县', '栾城县', ',35,36,', '36');
INSERT INTO `area` VALUES ('46', '2013-01-01 09:01:59', '2013-01-01 09:01:59', null, '河北省石家庄市行唐县', '行唐县', ',35,36,', '36');
INSERT INTO `area` VALUES ('47', '2013-01-01 09:01:59', '2013-01-01 09:01:59', null, '河北省石家庄市灵寿县', '灵寿县', ',35,36,', '36');
INSERT INTO `area` VALUES ('48', '2013-01-01 09:01:59', '2013-01-01 09:01:59', null, '河北省石家庄市高邑县', '高邑县', ',35,36,', '36');
INSERT INTO `area` VALUES ('49', '2013-01-01 09:01:59', '2013-01-01 09:01:59', null, '河北省石家庄市深泽县', '深泽县', ',35,36,', '36');
INSERT INTO `area` VALUES ('50', '2013-01-01 09:01:59', '2013-01-01 09:01:59', null, '河北省石家庄市赞皇县', '赞皇县', ',35,36,', '36');
INSERT INTO `area` VALUES ('51', '2013-01-01 09:01:59', '2013-01-01 09:01:59', null, '河北省石家庄市无极县', '无极县', ',35,36,', '36');
INSERT INTO `area` VALUES ('52', '2013-01-01 09:01:59', '2013-01-01 09:01:59', null, '河北省石家庄市平山县', '平山县', ',35,36,', '36');
INSERT INTO `area` VALUES ('53', '2013-01-01 09:01:59', '2013-01-01 09:01:59', null, '河北省石家庄市元氏县', '元氏县', ',35,36,', '36');
INSERT INTO `area` VALUES ('54', '2013-01-01 09:01:59', '2013-01-01 09:01:59', null, '河北省石家庄市赵县', '赵县', ',35,36,', '36');
INSERT INTO `area` VALUES ('55', '2013-01-01 09:01:59', '2013-01-01 09:01:59', null, '河北省石家庄市辛集市', '辛集市', ',35,36,', '36');
INSERT INTO `area` VALUES ('56', '2013-01-01 09:01:59', '2013-01-01 09:01:59', null, '河北省石家庄市藁城市', '藁城市', ',35,36,', '36');
INSERT INTO `area` VALUES ('57', '2013-01-01 09:01:59', '2013-01-01 09:01:59', null, '河北省石家庄市晋州市', '晋州市', ',35,36,', '36');
INSERT INTO `area` VALUES ('58', '2013-01-01 09:01:59', '2013-01-01 09:01:59', null, '河北省石家庄市新乐市', '新乐市', ',35,36,', '36');
INSERT INTO `area` VALUES ('59', '2013-01-01 09:01:59', '2013-01-01 09:01:59', null, '河北省石家庄市鹿泉市', '鹿泉市', ',35,36,', '36');
INSERT INTO `area` VALUES ('60', '2013-01-01 09:01:59', '2013-01-01 09:01:59', null, '河北省唐山市', '唐山市', ',35,', '35');
INSERT INTO `area` VALUES ('61', '2013-01-01 09:01:59', '2013-01-01 09:01:59', null, '河北省唐山市路南区', '路南区', ',35,60,', '60');
INSERT INTO `area` VALUES ('62', '2013-01-01 09:01:59', '2013-01-01 09:01:59', null, '河北省唐山市路北区', '路北区', ',35,60,', '60');
INSERT INTO `area` VALUES ('63', '2013-01-01 09:01:59', '2013-01-01 09:01:59', null, '河北省唐山市古冶区', '古冶区', ',35,60,', '60');
INSERT INTO `area` VALUES ('64', '2013-01-01 09:01:59', '2013-01-01 09:01:59', null, '河北省唐山市开平区', '开平区', ',35,60,', '60');
INSERT INTO `area` VALUES ('65', '2013-01-01 09:01:59', '2013-01-01 09:01:59', null, '河北省唐山市丰南区', '丰南区', ',35,60,', '60');
INSERT INTO `area` VALUES ('66', '2013-01-01 09:01:59', '2013-01-01 09:01:59', null, '河北省唐山市丰润区', '丰润区', ',35,60,', '60');
INSERT INTO `area` VALUES ('67', '2013-01-01 09:01:59', '2013-01-01 09:01:59', null, '河北省唐山市曹妃甸区', '曹妃甸区', ',35,60,', '60');
INSERT INTO `area` VALUES ('68', '2013-01-01 09:01:59', '2013-01-01 09:01:59', null, '河北省唐山市滦县', '滦县', ',35,60,', '60');
INSERT INTO `area` VALUES ('69', '2013-01-01 09:01:59', '2013-01-01 09:01:59', null, '河北省唐山市滦南县', '滦南县', ',35,60,', '60');
INSERT INTO `area` VALUES ('70', '2013-01-01 09:01:59', '2013-01-01 09:01:59', null, '河北省唐山市乐亭县', '乐亭县', ',35,60,', '60');
INSERT INTO `area` VALUES ('71', '2013-01-01 09:01:59', '2013-01-01 09:01:59', null, '河北省唐山市迁西县', '迁西县', ',35,60,', '60');
INSERT INTO `area` VALUES ('72', '2013-01-01 09:01:59', '2013-01-01 09:01:59', null, '河北省唐山市玉田县', '玉田县', ',35,60,', '60');
INSERT INTO `area` VALUES ('73', '2013-01-01 09:01:59', '2013-01-01 09:01:59', null, '河北省唐山市遵化市', '遵化市', ',35,60,', '60');
INSERT INTO `area` VALUES ('74', '2013-01-01 09:01:59', '2013-01-01 09:01:59', null, '河北省唐山市迁安市', '迁安市', ',35,60,', '60');
INSERT INTO `area` VALUES ('75', '2013-01-01 09:01:59', '2013-01-01 09:01:59', null, '河北省秦皇岛市', '秦皇岛市', ',35,', '35');
INSERT INTO `area` VALUES ('76', '2013-01-01 09:01:59', '2013-01-01 09:01:59', null, '河北省秦皇岛市海港区', '海港区', ',35,75,', '75');
INSERT INTO `area` VALUES ('77', '2013-01-01 09:01:59', '2013-01-01 09:01:59', null, '河北省秦皇岛市山海关区', '山海关区', ',35,75,', '75');
INSERT INTO `area` VALUES ('78', '2013-01-01 09:01:59', '2013-01-01 09:01:59', null, '河北省秦皇岛市北戴河区', '北戴河区', ',35,75,', '75');
INSERT INTO `area` VALUES ('79', '2013-01-01 09:01:59', '2013-01-01 09:01:59', null, '河北省秦皇岛市青龙满族自治县', '青龙满族自治县', ',35,75,', '75');
INSERT INTO `area` VALUES ('80', '2013-01-01 09:01:59', '2013-01-01 09:01:59', null, '河北省秦皇岛市昌黎县', '昌黎县', ',35,75,', '75');
INSERT INTO `area` VALUES ('81', '2013-01-01 09:01:59', '2013-01-01 09:01:59', null, '河北省秦皇岛市抚宁县', '抚宁县', ',35,75,', '75');
INSERT INTO `area` VALUES ('82', '2013-01-01 09:01:59', '2013-01-01 09:01:59', null, '河北省秦皇岛市卢龙县', '卢龙县', ',35,75,', '75');
INSERT INTO `area` VALUES ('83', '2013-01-01 09:01:59', '2013-01-01 09:01:59', null, '河北省邯郸市', '邯郸市', ',35,', '35');
INSERT INTO `area` VALUES ('84', '2013-01-01 09:01:59', '2013-01-01 09:01:59', null, '河北省邯郸市邯山区', '邯山区', ',35,83,', '83');
INSERT INTO `area` VALUES ('85', '2013-01-01 09:01:59', '2013-01-01 09:01:59', null, '河北省邯郸市丛台区', '丛台区', ',35,83,', '83');
INSERT INTO `area` VALUES ('86', '2013-01-01 09:01:59', '2013-01-01 09:01:59', null, '河北省邯郸市复兴区', '复兴区', ',35,83,', '83');
INSERT INTO `area` VALUES ('87', '2013-01-01 09:01:59', '2013-01-01 09:01:59', null, '河北省邯郸市峰峰矿区', '峰峰矿区', ',35,83,', '83');
INSERT INTO `area` VALUES ('88', '2013-01-01 09:01:59', '2013-01-01 09:01:59', null, '河北省邯郸市邯郸县', '邯郸县', ',35,83,', '83');
INSERT INTO `area` VALUES ('89', '2013-01-01 09:01:59', '2013-01-01 09:01:59', null, '河北省邯郸市临漳县', '临漳县', ',35,83,', '83');
INSERT INTO `area` VALUES ('90', '2013-01-01 09:01:59', '2013-01-01 09:01:59', null, '河北省邯郸市成安县', '成安县', ',35,83,', '83');
INSERT INTO `area` VALUES ('91', '2013-01-01 09:01:59', '2013-01-01 09:01:59', null, '河北省邯郸市大名县', '大名县', ',35,83,', '83');
INSERT INTO `area` VALUES ('92', '2013-01-01 09:01:59', '2013-01-01 09:01:59', null, '河北省邯郸市涉县', '涉县', ',35,83,', '83');
INSERT INTO `area` VALUES ('93', '2013-01-01 09:01:59', '2013-01-01 09:01:59', null, '河北省邯郸市磁县', '磁县', ',35,83,', '83');
INSERT INTO `area` VALUES ('94', '2013-01-01 09:01:59', '2013-01-01 09:01:59', null, '河北省邯郸市肥乡县', '肥乡县', ',35,83,', '83');
INSERT INTO `area` VALUES ('95', '2013-01-01 09:01:59', '2013-01-01 09:01:59', null, '河北省邯郸市永年县', '永年县', ',35,83,', '83');
INSERT INTO `area` VALUES ('96', '2013-01-01 09:01:59', '2013-01-01 09:01:59', null, '河北省邯郸市邱县', '邱县', ',35,83,', '83');
INSERT INTO `area` VALUES ('97', '2013-01-01 09:01:59', '2013-01-01 09:01:59', null, '河北省邯郸市鸡泽县', '鸡泽县', ',35,83,', '83');
INSERT INTO `area` VALUES ('98', '2013-01-01 09:01:59', '2013-01-01 09:01:59', null, '河北省邯郸市广平县', '广平县', ',35,83,', '83');
INSERT INTO `area` VALUES ('99', '2013-01-01 09:01:59', '2013-01-01 09:01:59', null, '河北省邯郸市馆陶县', '馆陶县', ',35,83,', '83');
INSERT INTO `area` VALUES ('100', '2013-01-01 09:01:59', '2013-01-01 09:01:59', null, '河北省邯郸市魏县', '魏县', ',35,83,', '83');
INSERT INTO `area` VALUES ('101', '2013-01-01 09:01:59', '2013-01-01 09:01:59', null, '河北省邯郸市曲周县', '曲周县', ',35,83,', '83');
INSERT INTO `area` VALUES ('102', '2013-01-01 09:01:59', '2013-01-01 09:01:59', null, '河北省邯郸市武安市', '武安市', ',35,83,', '83');
INSERT INTO `area` VALUES ('103', '2013-01-01 09:01:59', '2013-01-01 09:01:59', null, '河北省邢台市', '邢台市', ',35,', '35');
INSERT INTO `area` VALUES ('104', '2013-01-01 09:01:59', '2013-01-01 09:01:59', null, '河北省邢台市桥东区', '桥东区', ',35,103,', '103');
INSERT INTO `area` VALUES ('105', '2013-01-01 09:01:59', '2013-01-01 09:01:59', null, '河北省邢台市桥西区', '桥西区', ',35,103,', '103');
INSERT INTO `area` VALUES ('106', '2013-01-01 09:01:59', '2013-01-01 09:01:59', null, '河北省邢台市邢台县', '邢台县', ',35,103,', '103');
INSERT INTO `area` VALUES ('107', '2013-01-01 09:01:59', '2013-01-01 09:01:59', null, '河北省邢台市临城县', '临城县', ',35,103,', '103');
INSERT INTO `area` VALUES ('108', '2013-01-01 09:01:59', '2013-01-01 09:01:59', null, '河北省邢台市内丘县', '内丘县', ',35,103,', '103');
INSERT INTO `area` VALUES ('109', '2013-01-01 09:01:59', '2013-01-01 09:01:59', null, '河北省邢台市柏乡县', '柏乡县', ',35,103,', '103');
INSERT INTO `area` VALUES ('110', '2013-01-01 09:01:59', '2013-01-01 09:01:59', null, '河北省邢台市隆尧县', '隆尧县', ',35,103,', '103');
INSERT INTO `area` VALUES ('111', '2013-01-01 09:01:59', '2013-01-01 09:01:59', null, '河北省邢台市任县', '任县', ',35,103,', '103');
INSERT INTO `area` VALUES ('112', '2013-01-01 09:01:59', '2013-01-01 09:01:59', null, '河北省邢台市南和县', '南和县', ',35,103,', '103');
INSERT INTO `area` VALUES ('113', '2013-01-01 09:01:59', '2013-01-01 09:01:59', null, '河北省邢台市宁晋县', '宁晋县', ',35,103,', '103');
INSERT INTO `area` VALUES ('114', '2013-01-01 09:01:59', '2013-01-01 09:01:59', null, '河北省邢台市巨鹿县', '巨鹿县', ',35,103,', '103');
INSERT INTO `area` VALUES ('115', '2013-01-01 09:01:59', '2013-01-01 09:01:59', null, '河北省邢台市新河县', '新河县', ',35,103,', '103');
INSERT INTO `area` VALUES ('116', '2013-01-01 09:01:59', '2013-01-01 09:01:59', null, '河北省邢台市广宗县', '广宗县', ',35,103,', '103');
INSERT INTO `area` VALUES ('117', '2013-01-01 09:01:59', '2013-01-01 09:01:59', null, '河北省邢台市平乡县', '平乡县', ',35,103,', '103');
INSERT INTO `area` VALUES ('118', '2013-01-01 09:01:59', '2013-01-01 09:01:59', null, '河北省邢台市威县', '威县', ',35,103,', '103');
INSERT INTO `area` VALUES ('119', '2013-01-01 09:02:00', '2013-01-01 09:02:00', null, '河北省邢台市清河县', '清河县', ',35,103,', '103');
INSERT INTO `area` VALUES ('120', '2013-01-01 09:02:00', '2013-01-01 09:02:00', null, '河北省邢台市临西县', '临西县', ',35,103,', '103');
INSERT INTO `area` VALUES ('121', '2013-01-01 09:02:00', '2013-01-01 09:02:00', null, '河北省邢台市南宫市', '南宫市', ',35,103,', '103');
INSERT INTO `area` VALUES ('122', '2013-01-01 09:02:00', '2013-01-01 09:02:00', null, '河北省邢台市沙河市', '沙河市', ',35,103,', '103');
INSERT INTO `area` VALUES ('123', '2013-01-01 09:02:00', '2013-01-01 09:02:00', null, '河北省保定市', '保定市', ',35,', '35');
INSERT INTO `area` VALUES ('124', '2013-01-01 09:02:00', '2013-01-01 09:02:00', null, '河北省保定市新市区', '新市区', ',35,123,', '123');
INSERT INTO `area` VALUES ('125', '2013-01-01 09:02:00', '2013-01-01 09:02:00', null, '河北省保定市北市区', '北市区', ',35,123,', '123');
INSERT INTO `area` VALUES ('126', '2013-01-01 09:02:00', '2013-01-01 09:02:00', null, '河北省保定市南市区', '南市区', ',35,123,', '123');
INSERT INTO `area` VALUES ('127', '2013-01-01 09:02:00', '2013-01-01 09:02:00', null, '河北省保定市满城县', '满城县', ',35,123,', '123');
INSERT INTO `area` VALUES ('128', '2013-01-01 09:02:00', '2013-01-01 09:02:00', null, '河北省保定市清苑县', '清苑县', ',35,123,', '123');
INSERT INTO `area` VALUES ('129', '2013-01-01 09:02:00', '2013-01-01 09:02:00', null, '河北省保定市涞水县', '涞水县', ',35,123,', '123');
INSERT INTO `area` VALUES ('130', '2013-01-01 09:02:00', '2013-01-01 09:02:00', null, '河北省保定市阜平县', '阜平县', ',35,123,', '123');
INSERT INTO `area` VALUES ('131', '2013-01-01 09:02:00', '2013-01-01 09:02:00', null, '河北省保定市徐水县', '徐水县', ',35,123,', '123');
INSERT INTO `area` VALUES ('132', '2013-01-01 09:02:00', '2013-01-01 09:02:00', null, '河北省保定市定兴县', '定兴县', ',35,123,', '123');
INSERT INTO `area` VALUES ('133', '2013-01-01 09:02:00', '2013-01-01 09:02:00', null, '河北省保定市唐县', '唐县', ',35,123,', '123');
INSERT INTO `area` VALUES ('134', '2013-01-01 09:02:00', '2013-01-01 09:02:00', null, '河北省保定市高阳县', '高阳县', ',35,123,', '123');
INSERT INTO `area` VALUES ('135', '2013-01-01 09:02:00', '2013-01-01 09:02:00', null, '河北省保定市容城县', '容城县', ',35,123,', '123');
INSERT INTO `area` VALUES ('136', '2013-01-01 09:02:00', '2013-01-01 09:02:00', null, '河北省保定市涞源县', '涞源县', ',35,123,', '123');
INSERT INTO `area` VALUES ('137', '2013-01-01 09:02:00', '2013-01-01 09:02:00', null, '河北省保定市望都县', '望都县', ',35,123,', '123');
INSERT INTO `area` VALUES ('138', '2013-01-01 09:02:00', '2013-01-01 09:02:00', null, '河北省保定市安新县', '安新县', ',35,123,', '123');
INSERT INTO `area` VALUES ('139', '2013-01-01 09:02:00', '2013-01-01 09:02:00', null, '河北省保定市易县', '易县', ',35,123,', '123');
INSERT INTO `area` VALUES ('140', '2013-01-01 09:02:00', '2013-01-01 09:02:00', null, '河北省保定市曲阳县', '曲阳县', ',35,123,', '123');
INSERT INTO `area` VALUES ('141', '2013-01-01 09:02:00', '2013-01-01 09:02:00', null, '河北省保定市蠡县', '蠡县', ',35,123,', '123');
INSERT INTO `area` VALUES ('142', '2013-01-01 09:02:00', '2013-01-01 09:02:00', null, '河北省保定市顺平县', '顺平县', ',35,123,', '123');
INSERT INTO `area` VALUES ('143', '2013-01-01 09:02:00', '2013-01-01 09:02:00', null, '河北省保定市博野县', '博野县', ',35,123,', '123');
INSERT INTO `area` VALUES ('144', '2013-01-01 09:02:00', '2013-01-01 09:02:00', null, '河北省保定市雄县', '雄县', ',35,123,', '123');
INSERT INTO `area` VALUES ('145', '2013-01-01 09:02:00', '2013-01-01 09:02:00', null, '河北省保定市涿州市', '涿州市', ',35,123,', '123');
INSERT INTO `area` VALUES ('146', '2013-01-01 09:02:00', '2013-01-01 09:02:00', null, '河北省保定市定州市', '定州市', ',35,123,', '123');
INSERT INTO `area` VALUES ('147', '2013-01-01 09:02:00', '2013-01-01 09:02:00', null, '河北省保定市安国市', '安国市', ',35,123,', '123');
INSERT INTO `area` VALUES ('148', '2013-01-01 09:02:00', '2013-01-01 09:02:00', null, '河北省保定市高碑店市', '高碑店市', ',35,123,', '123');
INSERT INTO `area` VALUES ('149', '2013-01-01 09:02:00', '2013-01-01 09:02:00', null, '河北省张家口市', '张家口市', ',35,', '35');
INSERT INTO `area` VALUES ('150', '2013-01-01 09:02:00', '2013-01-01 09:02:00', null, '河北省张家口市桥东区', '桥东区', ',35,149,', '149');
INSERT INTO `area` VALUES ('151', '2013-01-01 09:02:00', '2013-01-01 09:02:00', null, '河北省张家口市桥西区', '桥西区', ',35,149,', '149');
INSERT INTO `area` VALUES ('152', '2013-01-01 09:02:00', '2013-01-01 09:02:00', null, '河北省张家口市宣化区', '宣化区', ',35,149,', '149');
INSERT INTO `area` VALUES ('153', '2013-01-01 09:02:00', '2013-01-01 09:02:00', null, '河北省张家口市下花园区', '下花园区', ',35,149,', '149');
INSERT INTO `area` VALUES ('154', '2013-01-01 09:02:00', '2013-01-01 09:02:00', null, '河北省张家口市宣化县', '宣化县', ',35,149,', '149');
INSERT INTO `area` VALUES ('155', '2013-01-01 09:02:00', '2013-01-01 09:02:00', null, '河北省张家口市张北县', '张北县', ',35,149,', '149');
INSERT INTO `area` VALUES ('156', '2013-01-01 09:02:00', '2013-01-01 09:02:00', null, '河北省张家口市康保县', '康保县', ',35,149,', '149');
INSERT INTO `area` VALUES ('157', '2013-01-01 09:02:00', '2013-01-01 09:02:00', null, '河北省张家口市沽源县', '沽源县', ',35,149,', '149');
INSERT INTO `area` VALUES ('158', '2013-01-01 09:02:00', '2013-01-01 09:02:00', null, '河北省张家口市尚义县', '尚义县', ',35,149,', '149');
INSERT INTO `area` VALUES ('159', '2013-01-01 09:02:00', '2013-01-01 09:02:00', null, '河北省张家口市蔚县', '蔚县', ',35,149,', '149');
INSERT INTO `area` VALUES ('160', '2013-01-01 09:02:00', '2013-01-01 09:02:00', null, '河北省张家口市阳原县', '阳原县', ',35,149,', '149');
INSERT INTO `area` VALUES ('161', '2013-01-01 09:02:00', '2013-01-01 09:02:00', null, '河北省张家口市怀安县', '怀安县', ',35,149,', '149');
INSERT INTO `area` VALUES ('162', '2013-01-01 09:02:00', '2013-01-01 09:02:00', null, '河北省张家口市万全县', '万全县', ',35,149,', '149');
INSERT INTO `area` VALUES ('163', '2013-01-01 09:02:00', '2013-01-01 09:02:00', null, '河北省张家口市怀来县', '怀来县', ',35,149,', '149');
INSERT INTO `area` VALUES ('164', '2013-01-01 09:02:00', '2013-01-01 09:02:00', null, '河北省张家口市涿鹿县', '涿鹿县', ',35,149,', '149');
INSERT INTO `area` VALUES ('165', '2013-01-01 09:02:00', '2013-01-01 09:02:00', null, '河北省张家口市赤城县', '赤城县', ',35,149,', '149');
INSERT INTO `area` VALUES ('166', '2013-01-01 09:02:00', '2013-01-01 09:02:00', null, '河北省张家口市崇礼县', '崇礼县', ',35,149,', '149');
INSERT INTO `area` VALUES ('167', '2013-01-01 09:02:00', '2013-01-01 09:02:00', null, '河北省承德市', '承德市', ',35,', '35');
INSERT INTO `area` VALUES ('168', '2013-01-01 09:02:00', '2013-01-01 09:02:00', null, '河北省承德市双桥区', '双桥区', ',35,167,', '167');
INSERT INTO `area` VALUES ('169', '2013-01-01 09:02:00', '2013-01-01 09:02:00', null, '河北省承德市双滦区', '双滦区', ',35,167,', '167');
INSERT INTO `area` VALUES ('170', '2013-01-01 09:02:00', '2013-01-01 09:02:00', null, '河北省承德市鹰手营子矿区', '鹰手营子矿区', ',35,167,', '167');
INSERT INTO `area` VALUES ('171', '2013-01-01 09:02:00', '2013-01-01 09:02:00', null, '河北省承德市承德县', '承德县', ',35,167,', '167');
INSERT INTO `area` VALUES ('172', '2013-01-01 09:02:00', '2013-01-01 09:02:00', null, '河北省承德市兴隆县', '兴隆县', ',35,167,', '167');
INSERT INTO `area` VALUES ('173', '2013-01-01 09:02:00', '2013-01-01 09:02:00', null, '河北省承德市平泉县', '平泉县', ',35,167,', '167');
INSERT INTO `area` VALUES ('174', '2013-01-01 09:02:00', '2013-01-01 09:02:00', null, '河北省承德市滦平县', '滦平县', ',35,167,', '167');
INSERT INTO `area` VALUES ('175', '2013-01-01 09:02:00', '2013-01-01 09:02:00', null, '河北省承德市隆化县', '隆化县', ',35,167,', '167');
INSERT INTO `area` VALUES ('176', '2013-01-01 09:02:00', '2013-01-01 09:02:00', null, '河北省承德市丰宁满族自治县', '丰宁满族自治县', ',35,167,', '167');
INSERT INTO `area` VALUES ('177', '2013-01-01 09:02:00', '2013-01-01 09:02:00', null, '河北省承德市宽城满族自治县', '宽城满族自治县', ',35,167,', '167');
INSERT INTO `area` VALUES ('178', '2013-01-01 09:02:00', '2013-01-01 09:02:00', null, '河北省承德市围场满族蒙古族自治县', '围场满族蒙古族自治县', ',35,167,', '167');
INSERT INTO `area` VALUES ('179', '2013-01-01 09:02:00', '2013-01-01 09:02:00', null, '河北省沧州市', '沧州市', ',35,', '35');
INSERT INTO `area` VALUES ('180', '2013-01-01 09:02:00', '2013-01-01 09:02:00', null, '河北省沧州市新华区', '新华区', ',35,179,', '179');
INSERT INTO `area` VALUES ('181', '2013-01-01 09:02:00', '2013-01-01 09:02:00', null, '河北省沧州市运河区', '运河区', ',35,179,', '179');
INSERT INTO `area` VALUES ('182', '2013-01-01 09:02:00', '2013-01-01 09:02:00', null, '河北省沧州市沧县', '沧县', ',35,179,', '179');
INSERT INTO `area` VALUES ('183', '2013-01-01 09:02:00', '2013-01-01 09:02:00', null, '河北省沧州市青县', '青县', ',35,179,', '179');
INSERT INTO `area` VALUES ('184', '2013-01-01 09:02:00', '2013-01-01 09:02:00', null, '河北省沧州市东光县', '东光县', ',35,179,', '179');
INSERT INTO `area` VALUES ('185', '2013-01-01 09:02:00', '2013-01-01 09:02:00', null, '河北省沧州市海兴县', '海兴县', ',35,179,', '179');
INSERT INTO `area` VALUES ('186', '2013-01-01 09:02:00', '2013-01-01 09:02:00', null, '河北省沧州市盐山县', '盐山县', ',35,179,', '179');
INSERT INTO `area` VALUES ('187', '2013-01-01 09:02:00', '2013-01-01 09:02:00', null, '河北省沧州市肃宁县', '肃宁县', ',35,179,', '179');
INSERT INTO `area` VALUES ('188', '2013-01-01 09:02:00', '2013-01-01 09:02:00', null, '河北省沧州市南皮县', '南皮县', ',35,179,', '179');
INSERT INTO `area` VALUES ('189', '2013-01-01 09:02:00', '2013-01-01 09:02:00', null, '河北省沧州市吴桥县', '吴桥县', ',35,179,', '179');
INSERT INTO `area` VALUES ('190', '2013-01-01 09:02:00', '2013-01-01 09:02:00', null, '河北省沧州市献县', '献县', ',35,179,', '179');
INSERT INTO `area` VALUES ('191', '2013-01-01 09:02:00', '2013-01-01 09:02:00', null, '河北省沧州市孟村回族自治县', '孟村回族自治县', ',35,179,', '179');
INSERT INTO `area` VALUES ('192', '2013-01-01 09:02:00', '2013-01-01 09:02:00', null, '河北省沧州市泊头市', '泊头市', ',35,179,', '179');
INSERT INTO `area` VALUES ('193', '2013-01-01 09:02:00', '2013-01-01 09:02:00', null, '河北省沧州市任丘市', '任丘市', ',35,179,', '179');
INSERT INTO `area` VALUES ('194', '2013-01-01 09:02:00', '2013-01-01 09:02:00', null, '河北省沧州市黄骅市', '黄骅市', ',35,179,', '179');
INSERT INTO `area` VALUES ('195', '2013-01-01 09:02:00', '2013-01-01 09:02:00', null, '河北省沧州市河间市', '河间市', ',35,179,', '179');
INSERT INTO `area` VALUES ('196', '2013-01-01 09:02:00', '2013-01-01 09:02:00', null, '河北省廊坊市', '廊坊市', ',35,', '35');
INSERT INTO `area` VALUES ('197', '2013-01-01 09:02:00', '2013-01-01 09:02:00', null, '河北省廊坊市安次区', '安次区', ',35,196,', '196');
INSERT INTO `area` VALUES ('198', '2013-01-01 09:02:00', '2013-01-01 09:02:00', null, '河北省廊坊市广阳区', '广阳区', ',35,196,', '196');
INSERT INTO `area` VALUES ('199', '2013-01-01 09:02:00', '2013-01-01 09:02:00', null, '河北省廊坊市固安县', '固安县', ',35,196,', '196');
INSERT INTO `area` VALUES ('200', '2013-01-01 09:02:00', '2013-01-01 09:02:00', null, '河北省廊坊市永清县', '永清县', ',35,196,', '196');
INSERT INTO `area` VALUES ('201', '2013-01-01 09:02:00', '2013-01-01 09:02:00', null, '河北省廊坊市香河县', '香河县', ',35,196,', '196');
INSERT INTO `area` VALUES ('202', '2013-01-01 09:02:00', '2013-01-01 09:02:00', null, '河北省廊坊市大城县', '大城县', ',35,196,', '196');
INSERT INTO `area` VALUES ('203', '2013-01-01 09:02:00', '2013-01-01 09:02:00', null, '河北省廊坊市文安县', '文安县', ',35,196,', '196');
INSERT INTO `area` VALUES ('204', '2013-01-01 09:02:00', '2013-01-01 09:02:00', null, '河北省廊坊市大厂回族自治县', '大厂回族自治县', ',35,196,', '196');
INSERT INTO `area` VALUES ('205', '2013-01-01 09:02:00', '2013-01-01 09:02:00', null, '河北省廊坊市霸州市', '霸州市', ',35,196,', '196');
INSERT INTO `area` VALUES ('206', '2013-01-01 09:02:00', '2013-01-01 09:02:00', null, '河北省廊坊市三河市', '三河市', ',35,196,', '196');
INSERT INTO `area` VALUES ('207', '2013-01-01 09:02:00', '2013-01-01 09:02:00', null, '河北省衡水市', '衡水市', ',35,', '35');
INSERT INTO `area` VALUES ('208', '2013-01-01 09:02:00', '2013-01-01 09:02:00', null, '河北省衡水市桃城区', '桃城区', ',35,207,', '207');
INSERT INTO `area` VALUES ('209', '2013-01-01 09:02:00', '2013-01-01 09:02:00', null, '河北省衡水市枣强县', '枣强县', ',35,207,', '207');
INSERT INTO `area` VALUES ('210', '2013-01-01 09:02:00', '2013-01-01 09:02:00', null, '河北省衡水市武邑县', '武邑县', ',35,207,', '207');
INSERT INTO `area` VALUES ('211', '2013-01-01 09:02:00', '2013-01-01 09:02:00', null, '河北省衡水市武强县', '武强县', ',35,207,', '207');
INSERT INTO `area` VALUES ('212', '2013-01-01 09:02:00', '2013-01-01 09:02:00', null, '河北省衡水市饶阳县', '饶阳县', ',35,207,', '207');
INSERT INTO `area` VALUES ('213', '2013-01-01 09:02:00', '2013-01-01 09:02:00', null, '河北省衡水市安平县', '安平县', ',35,207,', '207');
INSERT INTO `area` VALUES ('214', '2013-01-01 09:02:00', '2013-01-01 09:02:00', null, '河北省衡水市故城县', '故城县', ',35,207,', '207');
INSERT INTO `area` VALUES ('215', '2013-01-01 09:02:00', '2013-01-01 09:02:00', null, '河北省衡水市景县', '景县', ',35,207,', '207');
INSERT INTO `area` VALUES ('216', '2013-01-01 09:02:00', '2013-01-01 09:02:00', null, '河北省衡水市阜城县', '阜城县', ',35,207,', '207');
INSERT INTO `area` VALUES ('217', '2013-01-01 09:02:00', '2013-01-01 09:02:00', null, '河北省衡水市冀州市', '冀州市', ',35,207,', '207');
INSERT INTO `area` VALUES ('218', '2013-01-01 09:02:00', '2013-01-01 09:02:00', null, '河北省衡水市深州市', '深州市', ',35,207,', '207');
INSERT INTO `area` VALUES ('219', '2013-01-01 09:02:00', '2013-01-01 09:02:00', null, '山西省', '山西省', ',', null);
INSERT INTO `area` VALUES ('220', '2013-01-01 09:02:00', '2013-01-01 09:02:00', null, '山西省太原市', '太原市', ',219,', '219');
INSERT INTO `area` VALUES ('221', '2013-01-01 09:02:00', '2013-01-01 09:02:00', null, '山西省太原市小店区', '小店区', ',219,220,', '220');
INSERT INTO `area` VALUES ('222', '2013-01-01 09:02:00', '2013-01-01 09:02:00', null, '山西省太原市迎泽区', '迎泽区', ',219,220,', '220');
INSERT INTO `area` VALUES ('223', '2013-01-01 09:02:00', '2013-01-01 09:02:00', null, '山西省太原市杏花岭区', '杏花岭区', ',219,220,', '220');
INSERT INTO `area` VALUES ('224', '2013-01-01 09:02:00', '2013-01-01 09:02:00', null, '山西省太原市尖草坪区', '尖草坪区', ',219,220,', '220');
INSERT INTO `area` VALUES ('225', '2013-01-01 09:02:00', '2013-01-01 09:02:00', null, '山西省太原市万柏林区', '万柏林区', ',219,220,', '220');
INSERT INTO `area` VALUES ('226', '2013-01-01 09:02:00', '2013-01-01 09:02:00', null, '山西省太原市晋源区', '晋源区', ',219,220,', '220');
INSERT INTO `area` VALUES ('227', '2013-01-01 09:02:00', '2013-01-01 09:02:00', null, '山西省太原市清徐县', '清徐县', ',219,220,', '220');
INSERT INTO `area` VALUES ('228', '2013-01-01 09:02:00', '2013-01-01 09:02:00', null, '山西省太原市阳曲县', '阳曲县', ',219,220,', '220');
INSERT INTO `area` VALUES ('229', '2013-01-01 09:02:00', '2013-01-01 09:02:00', null, '山西省太原市娄烦县', '娄烦县', ',219,220,', '220');
INSERT INTO `area` VALUES ('230', '2013-01-01 09:02:00', '2013-01-01 09:02:00', null, '山西省太原市古交市', '古交市', ',219,220,', '220');
INSERT INTO `area` VALUES ('231', '2013-01-01 09:02:00', '2013-01-01 09:02:00', null, '山西省大同市', '大同市', ',219,', '219');
INSERT INTO `area` VALUES ('232', '2013-01-01 09:02:00', '2013-01-01 09:02:00', null, '山西省大同市城区', '城区', ',219,231,', '231');
INSERT INTO `area` VALUES ('233', '2013-01-01 09:02:00', '2013-01-01 09:02:00', null, '山西省大同市矿区', '矿区', ',219,231,', '231');
INSERT INTO `area` VALUES ('234', '2013-01-01 09:02:00', '2013-01-01 09:02:00', null, '山西省大同市南郊区', '南郊区', ',219,231,', '231');
INSERT INTO `area` VALUES ('235', '2013-01-01 09:02:00', '2013-01-01 09:02:00', null, '山西省大同市新荣区', '新荣区', ',219,231,', '231');
INSERT INTO `area` VALUES ('236', '2013-01-01 09:02:00', '2013-01-01 09:02:00', null, '山西省大同市阳高县', '阳高县', ',219,231,', '231');
INSERT INTO `area` VALUES ('237', '2013-01-01 09:02:00', '2013-01-01 09:02:00', null, '山西省大同市天镇县', '天镇县', ',219,231,', '231');
INSERT INTO `area` VALUES ('238', '2013-01-01 09:02:00', '2013-01-01 09:02:00', null, '山西省大同市广灵县', '广灵县', ',219,231,', '231');
INSERT INTO `area` VALUES ('239', '2013-01-01 09:02:00', '2013-01-01 09:02:00', null, '山西省大同市灵丘县', '灵丘县', ',219,231,', '231');
INSERT INTO `area` VALUES ('240', '2013-01-01 09:02:00', '2013-01-01 09:02:00', null, '山西省大同市浑源县', '浑源县', ',219,231,', '231');
INSERT INTO `area` VALUES ('241', '2013-01-01 09:02:00', '2013-01-01 09:02:00', null, '山西省大同市左云县', '左云县', ',219,231,', '231');
INSERT INTO `area` VALUES ('242', '2013-01-01 09:02:00', '2013-01-01 09:02:00', null, '山西省大同市大同县', '大同县', ',219,231,', '231');
INSERT INTO `area` VALUES ('243', '2013-01-01 09:02:00', '2013-01-01 09:02:00', null, '山西省阳泉市', '阳泉市', ',219,', '219');
INSERT INTO `area` VALUES ('244', '2013-01-01 09:02:00', '2013-01-01 09:02:00', null, '山西省阳泉市城区', '城区', ',219,243,', '243');
INSERT INTO `area` VALUES ('245', '2013-01-01 09:02:00', '2013-01-01 09:02:00', null, '山西省阳泉市矿区', '矿区', ',219,243,', '243');
INSERT INTO `area` VALUES ('246', '2013-01-01 09:02:00', '2013-01-01 09:02:00', null, '山西省阳泉市郊区', '郊区', ',219,243,', '243');
INSERT INTO `area` VALUES ('247', '2013-01-01 09:02:00', '2013-01-01 09:02:00', null, '山西省阳泉市平定县', '平定县', ',219,243,', '243');
INSERT INTO `area` VALUES ('248', '2013-01-01 09:02:00', '2013-01-01 09:02:00', null, '山西省阳泉市盂县', '盂县', ',219,243,', '243');
INSERT INTO `area` VALUES ('249', '2013-01-01 09:02:00', '2013-01-01 09:02:00', null, '山西省长治市', '长治市', ',219,', '219');
INSERT INTO `area` VALUES ('250', '2013-01-01 09:02:00', '2013-01-01 09:02:00', null, '山西省长治市城区', '城区', ',219,249,', '249');
INSERT INTO `area` VALUES ('251', '2013-01-01 09:02:00', '2013-01-01 09:02:00', null, '山西省长治市郊区', '郊区', ',219,249,', '249');
INSERT INTO `area` VALUES ('252', '2013-01-01 09:02:00', '2013-01-01 09:02:00', null, '山西省长治市长治县', '长治县', ',219,249,', '249');
INSERT INTO `area` VALUES ('253', '2013-01-01 09:02:00', '2013-01-01 09:02:00', null, '山西省长治市襄垣县', '襄垣县', ',219,249,', '249');
INSERT INTO `area` VALUES ('254', '2013-01-01 09:02:00', '2013-01-01 09:02:00', null, '山西省长治市屯留县', '屯留县', ',219,249,', '249');
INSERT INTO `area` VALUES ('255', '2013-01-01 09:02:00', '2013-01-01 09:02:00', null, '山西省长治市平顺县', '平顺县', ',219,249,', '249');
INSERT INTO `area` VALUES ('256', '2013-01-01 09:02:00', '2013-01-01 09:02:00', null, '山西省长治市黎城县', '黎城县', ',219,249,', '249');
INSERT INTO `area` VALUES ('257', '2013-01-01 09:02:00', '2013-01-01 09:02:00', null, '山西省长治市壶关县', '壶关县', ',219,249,', '249');
INSERT INTO `area` VALUES ('258', '2013-01-01 09:02:00', '2013-01-01 09:02:00', null, '山西省长治市长子县', '长子县', ',219,249,', '249');
INSERT INTO `area` VALUES ('259', '2013-01-01 09:02:00', '2013-01-01 09:02:00', null, '山西省长治市武乡县', '武乡县', ',219,249,', '249');
INSERT INTO `area` VALUES ('260', '2013-01-01 09:02:00', '2013-01-01 09:02:00', null, '山西省长治市沁县', '沁县', ',219,249,', '249');
INSERT INTO `area` VALUES ('261', '2013-01-01 09:02:00', '2013-01-01 09:02:00', null, '山西省长治市沁源县', '沁源县', ',219,249,', '249');
INSERT INTO `area` VALUES ('262', '2013-01-01 09:02:00', '2013-01-01 09:02:00', null, '山西省长治市潞城市', '潞城市', ',219,249,', '249');
INSERT INTO `area` VALUES ('263', '2013-01-01 09:02:00', '2013-01-01 09:02:00', null, '山西省晋城市', '晋城市', ',219,', '219');
INSERT INTO `area` VALUES ('264', '2013-01-01 09:02:00', '2013-01-01 09:02:00', null, '山西省晋城市晋城市市辖区', '晋城市市辖区', ',219,263,', '263');
INSERT INTO `area` VALUES ('265', '2013-01-01 09:02:00', '2013-01-01 09:02:00', null, '山西省晋城市城区', '城区', ',219,263,', '263');
INSERT INTO `area` VALUES ('266', '2013-01-01 09:02:00', '2013-01-01 09:02:00', null, '山西省晋城市沁水县', '沁水县', ',219,263,', '263');
INSERT INTO `area` VALUES ('267', '2013-01-01 09:02:00', '2013-01-01 09:02:00', null, '山西省晋城市阳城县', '阳城县', ',219,263,', '263');
INSERT INTO `area` VALUES ('268', '2013-01-01 09:02:00', '2013-01-01 09:02:00', null, '山西省晋城市陵川县', '陵川县', ',219,263,', '263');
INSERT INTO `area` VALUES ('269', '2013-01-01 09:02:00', '2013-01-01 09:02:00', null, '山西省晋城市泽州县', '泽州县', ',219,263,', '263');
INSERT INTO `area` VALUES ('270', '2013-01-01 09:02:00', '2013-01-01 09:02:00', null, '山西省晋城市高平市', '高平市', ',219,263,', '263');
INSERT INTO `area` VALUES ('271', '2013-01-01 09:02:00', '2013-01-01 09:02:00', null, '山西省朔州市', '朔州市', ',219,', '219');
INSERT INTO `area` VALUES ('272', '2013-01-01 09:02:00', '2013-01-01 09:02:00', null, '山西省朔州市朔城区', '朔城区', ',219,271,', '271');
INSERT INTO `area` VALUES ('273', '2013-01-01 09:02:00', '2013-01-01 09:02:00', null, '山西省朔州市平鲁区', '平鲁区', ',219,271,', '271');
INSERT INTO `area` VALUES ('274', '2013-01-01 09:02:00', '2013-01-01 09:02:00', null, '山西省朔州市山阴县', '山阴县', ',219,271,', '271');
INSERT INTO `area` VALUES ('275', '2013-01-01 09:02:00', '2013-01-01 09:02:00', null, '山西省朔州市应县', '应县', ',219,271,', '271');
INSERT INTO `area` VALUES ('276', '2013-01-01 09:02:00', '2013-01-01 09:02:00', null, '山西省朔州市右玉县', '右玉县', ',219,271,', '271');
INSERT INTO `area` VALUES ('277', '2013-01-01 09:02:00', '2013-01-01 09:02:00', null, '山西省朔州市怀仁县', '怀仁县', ',219,271,', '271');
INSERT INTO `area` VALUES ('278', '2013-01-01 09:02:00', '2013-01-01 09:02:00', null, '山西省晋中市', '晋中市', ',219,', '219');
INSERT INTO `area` VALUES ('279', '2013-01-01 09:02:00', '2013-01-01 09:02:00', null, '山西省晋中市榆次区', '榆次区', ',219,278,', '278');
INSERT INTO `area` VALUES ('280', '2013-01-01 09:02:00', '2013-01-01 09:02:00', null, '山西省晋中市榆社县', '榆社县', ',219,278,', '278');
INSERT INTO `area` VALUES ('281', '2013-01-01 09:02:00', '2013-01-01 09:02:00', null, '山西省晋中市左权县', '左权县', ',219,278,', '278');
INSERT INTO `area` VALUES ('282', '2013-01-01 09:02:00', '2013-01-01 09:02:00', null, '山西省晋中市和顺县', '和顺县', ',219,278,', '278');
INSERT INTO `area` VALUES ('283', '2013-01-01 09:02:00', '2013-01-01 09:02:00', null, '山西省晋中市昔阳县', '昔阳县', ',219,278,', '278');
INSERT INTO `area` VALUES ('284', '2013-01-01 09:02:00', '2013-01-01 09:02:00', null, '山西省晋中市寿阳县', '寿阳县', ',219,278,', '278');
INSERT INTO `area` VALUES ('285', '2013-01-01 09:02:00', '2013-01-01 09:02:00', null, '山西省晋中市太谷县', '太谷县', ',219,278,', '278');
INSERT INTO `area` VALUES ('286', '2013-01-01 09:02:00', '2013-01-01 09:02:00', null, '山西省晋中市祁县', '祁县', ',219,278,', '278');
INSERT INTO `area` VALUES ('287', '2013-01-01 09:02:00', '2013-01-01 09:02:00', null, '山西省晋中市平遥县', '平遥县', ',219,278,', '278');
INSERT INTO `area` VALUES ('288', '2013-01-01 09:02:00', '2013-01-01 09:02:00', null, '山西省晋中市灵石县', '灵石县', ',219,278,', '278');
INSERT INTO `area` VALUES ('289', '2013-01-01 09:02:00', '2013-01-01 09:02:00', null, '山西省晋中市介休市', '介休市', ',219,278,', '278');
INSERT INTO `area` VALUES ('290', '2013-01-01 09:02:00', '2013-01-01 09:02:00', null, '山西省运城市', '运城市', ',219,', '219');
INSERT INTO `area` VALUES ('291', '2013-01-01 09:02:00', '2013-01-01 09:02:00', null, '山西省运城市盐湖区', '盐湖区', ',219,290,', '290');
INSERT INTO `area` VALUES ('292', '2013-01-01 09:02:00', '2013-01-01 09:02:00', null, '山西省运城市临猗县', '临猗县', ',219,290,', '290');
INSERT INTO `area` VALUES ('293', '2013-01-01 09:02:00', '2013-01-01 09:02:00', null, '山西省运城市万荣县', '万荣县', ',219,290,', '290');
INSERT INTO `area` VALUES ('294', '2013-01-01 09:02:00', '2013-01-01 09:02:00', null, '山西省运城市闻喜县', '闻喜县', ',219,290,', '290');
INSERT INTO `area` VALUES ('295', '2013-01-01 09:02:00', '2013-01-01 09:02:00', null, '山西省运城市稷山县', '稷山县', ',219,290,', '290');
INSERT INTO `area` VALUES ('296', '2013-01-01 09:02:00', '2013-01-01 09:02:00', null, '山西省运城市新绛县', '新绛县', ',219,290,', '290');
INSERT INTO `area` VALUES ('297', '2013-01-01 09:02:00', '2013-01-01 09:02:00', null, '山西省运城市绛县', '绛县', ',219,290,', '290');
INSERT INTO `area` VALUES ('298', '2013-01-01 09:02:00', '2013-01-01 09:02:00', null, '山西省运城市垣曲县', '垣曲县', ',219,290,', '290');
INSERT INTO `area` VALUES ('299', '2013-01-01 09:02:01', '2013-01-01 09:02:01', null, '山西省运城市夏县', '夏县', ',219,290,', '290');
INSERT INTO `area` VALUES ('300', '2013-01-01 09:02:01', '2013-01-01 09:02:01', null, '山西省运城市平陆县', '平陆县', ',219,290,', '290');
INSERT INTO `area` VALUES ('301', '2013-01-01 09:02:01', '2013-01-01 09:02:01', null, '山西省运城市芮城县', '芮城县', ',219,290,', '290');
INSERT INTO `area` VALUES ('302', '2013-01-01 09:02:01', '2013-01-01 09:02:01', null, '山西省运城市永济市', '永济市', ',219,290,', '290');
INSERT INTO `area` VALUES ('303', '2013-01-01 09:02:01', '2013-01-01 09:02:01', null, '山西省运城市河津市', '河津市', ',219,290,', '290');
INSERT INTO `area` VALUES ('304', '2013-01-01 09:02:01', '2013-01-01 09:02:01', null, '山西省忻州市', '忻州市', ',219,', '219');
INSERT INTO `area` VALUES ('305', '2013-01-01 09:02:01', '2013-01-01 09:02:01', null, '山西省忻州市忻府区', '忻府区', ',219,304,', '304');
INSERT INTO `area` VALUES ('306', '2013-01-01 09:02:01', '2013-01-01 09:02:01', null, '山西省忻州市定襄县', '定襄县', ',219,304,', '304');
INSERT INTO `area` VALUES ('307', '2013-01-01 09:02:01', '2013-01-01 09:02:01', null, '山西省忻州市五台县', '五台县', ',219,304,', '304');
INSERT INTO `area` VALUES ('308', '2013-01-01 09:02:01', '2013-01-01 09:02:01', null, '山西省忻州市代县', '代县', ',219,304,', '304');
INSERT INTO `area` VALUES ('309', '2013-01-01 09:02:01', '2013-01-01 09:02:01', null, '山西省忻州市繁峙县', '繁峙县', ',219,304,', '304');
INSERT INTO `area` VALUES ('310', '2013-01-01 09:02:01', '2013-01-01 09:02:01', null, '山西省忻州市宁武县', '宁武县', ',219,304,', '304');
INSERT INTO `area` VALUES ('311', '2013-01-01 09:02:01', '2013-01-01 09:02:01', null, '山西省忻州市静乐县', '静乐县', ',219,304,', '304');
INSERT INTO `area` VALUES ('312', '2013-01-01 09:02:01', '2013-01-01 09:02:01', null, '山西省忻州市神池县', '神池县', ',219,304,', '304');
INSERT INTO `area` VALUES ('313', '2013-01-01 09:02:01', '2013-01-01 09:02:01', null, '山西省忻州市五寨县', '五寨县', ',219,304,', '304');
INSERT INTO `area` VALUES ('314', '2013-01-01 09:02:01', '2013-01-01 09:02:01', null, '山西省忻州市岢岚县', '岢岚县', ',219,304,', '304');
INSERT INTO `area` VALUES ('315', '2013-01-01 09:02:01', '2013-01-01 09:02:01', null, '山西省忻州市河曲县', '河曲县', ',219,304,', '304');
INSERT INTO `area` VALUES ('316', '2013-01-01 09:02:01', '2013-01-01 09:02:01', null, '山西省忻州市保德县', '保德县', ',219,304,', '304');
INSERT INTO `area` VALUES ('317', '2013-01-01 09:02:01', '2013-01-01 09:02:01', null, '山西省忻州市偏关县', '偏关县', ',219,304,', '304');
INSERT INTO `area` VALUES ('318', '2013-01-01 09:02:01', '2013-01-01 09:02:01', null, '山西省忻州市原平市', '原平市', ',219,304,', '304');
INSERT INTO `area` VALUES ('319', '2013-01-01 09:02:01', '2013-01-01 09:02:01', null, '山西省临汾市', '临汾市', ',219,', '219');
INSERT INTO `area` VALUES ('320', '2013-01-01 09:02:01', '2013-01-01 09:02:01', null, '山西省临汾市尧都区', '尧都区', ',219,319,', '319');
INSERT INTO `area` VALUES ('321', '2013-01-01 09:02:01', '2013-01-01 09:02:01', null, '山西省临汾市曲沃县', '曲沃县', ',219,319,', '319');
INSERT INTO `area` VALUES ('322', '2013-01-01 09:02:01', '2013-01-01 09:02:01', null, '山西省临汾市翼城县', '翼城县', ',219,319,', '319');
INSERT INTO `area` VALUES ('323', '2013-01-01 09:02:01', '2013-01-01 09:02:01', null, '山西省临汾市襄汾县', '襄汾县', ',219,319,', '319');
INSERT INTO `area` VALUES ('324', '2013-01-01 09:02:01', '2013-01-01 09:02:01', null, '山西省临汾市洪洞县', '洪洞县', ',219,319,', '319');
INSERT INTO `area` VALUES ('325', '2013-01-01 09:02:01', '2013-01-01 09:02:01', null, '山西省临汾市古县', '古县', ',219,319,', '319');
INSERT INTO `area` VALUES ('326', '2013-01-01 09:02:01', '2013-01-01 09:02:01', null, '山西省临汾市安泽县', '安泽县', ',219,319,', '319');
INSERT INTO `area` VALUES ('327', '2013-01-01 09:02:01', '2013-01-01 09:02:01', null, '山西省临汾市浮山县', '浮山县', ',219,319,', '319');
INSERT INTO `area` VALUES ('328', '2013-01-01 09:02:01', '2013-01-01 09:02:01', null, '山西省临汾市吉县', '吉县', ',219,319,', '319');
INSERT INTO `area` VALUES ('329', '2013-01-01 09:02:01', '2013-01-01 09:02:01', null, '山西省临汾市乡宁县', '乡宁县', ',219,319,', '319');
INSERT INTO `area` VALUES ('330', '2013-01-01 09:02:01', '2013-01-01 09:02:01', null, '山西省临汾市大宁县', '大宁县', ',219,319,', '319');
INSERT INTO `area` VALUES ('331', '2013-01-01 09:02:01', '2013-01-01 09:02:01', null, '山西省临汾市隰县', '隰县', ',219,319,', '319');
INSERT INTO `area` VALUES ('332', '2013-01-01 09:02:01', '2013-01-01 09:02:01', null, '山西省临汾市永和县', '永和县', ',219,319,', '319');
INSERT INTO `area` VALUES ('333', '2013-01-01 09:02:01', '2013-01-01 09:02:01', null, '山西省临汾市蒲县', '蒲县', ',219,319,', '319');
INSERT INTO `area` VALUES ('334', '2013-01-01 09:02:01', '2013-01-01 09:02:01', null, '山西省临汾市汾西县', '汾西县', ',219,319,', '319');
INSERT INTO `area` VALUES ('335', '2013-01-01 09:02:01', '2013-01-01 09:02:01', null, '山西省临汾市侯马市', '侯马市', ',219,319,', '319');
INSERT INTO `area` VALUES ('336', '2013-01-01 09:02:01', '2013-01-01 09:02:01', null, '山西省临汾市霍州市', '霍州市', ',219,319,', '319');
INSERT INTO `area` VALUES ('337', '2013-01-01 09:02:01', '2013-01-01 09:02:01', null, '山西省吕梁市', '吕梁市', ',219,', '219');
INSERT INTO `area` VALUES ('338', '2013-01-01 09:02:01', '2013-01-01 09:02:01', null, '山西省吕梁市离石区', '离石区', ',219,337,', '337');
INSERT INTO `area` VALUES ('339', '2013-01-01 09:02:01', '2013-01-01 09:02:01', null, '山西省吕梁市文水县', '文水县', ',219,337,', '337');
INSERT INTO `area` VALUES ('340', '2013-01-01 09:02:01', '2013-01-01 09:02:01', null, '山西省吕梁市交城县', '交城县', ',219,337,', '337');
INSERT INTO `area` VALUES ('341', '2013-01-01 09:02:01', '2013-01-01 09:02:01', null, '山西省吕梁市兴县', '兴县', ',219,337,', '337');
INSERT INTO `area` VALUES ('342', '2013-01-01 09:02:01', '2013-01-01 09:02:01', null, '山西省吕梁市临县', '临县', ',219,337,', '337');
INSERT INTO `area` VALUES ('343', '2013-01-01 09:02:01', '2013-01-01 09:02:01', null, '山西省吕梁市柳林县', '柳林县', ',219,337,', '337');
INSERT INTO `area` VALUES ('344', '2013-01-01 09:02:01', '2013-01-01 09:02:01', null, '山西省吕梁市石楼县', '石楼县', ',219,337,', '337');
INSERT INTO `area` VALUES ('345', '2013-01-01 09:02:01', '2013-01-01 09:02:01', null, '山西省吕梁市岚县', '岚县', ',219,337,', '337');
INSERT INTO `area` VALUES ('346', '2013-01-01 09:02:01', '2013-01-01 09:02:01', null, '山西省吕梁市方山县', '方山县', ',219,337,', '337');
INSERT INTO `area` VALUES ('347', '2013-01-01 09:02:01', '2013-01-01 09:02:01', null, '山西省吕梁市中阳县', '中阳县', ',219,337,', '337');
INSERT INTO `area` VALUES ('348', '2013-01-01 09:02:01', '2013-01-01 09:02:01', null, '山西省吕梁市交口县', '交口县', ',219,337,', '337');
INSERT INTO `area` VALUES ('349', '2013-01-01 09:02:01', '2013-01-01 09:02:01', null, '山西省吕梁市孝义市', '孝义市', ',219,337,', '337');
INSERT INTO `area` VALUES ('350', '2013-01-01 09:02:01', '2013-01-01 09:02:01', null, '山西省吕梁市汾阳市', '汾阳市', ',219,337,', '337');
INSERT INTO `area` VALUES ('351', '2013-01-01 09:02:01', '2013-01-01 09:02:01', null, '内蒙古自治区', '内蒙古自治区', ',', null);
INSERT INTO `area` VALUES ('352', '2013-01-01 09:02:01', '2013-01-01 09:02:01', null, '内蒙古自治区呼和浩特市', '呼和浩特市', ',351,', '351');
INSERT INTO `area` VALUES ('353', '2013-01-01 09:02:01', '2013-01-01 09:02:01', null, '内蒙古自治区呼和浩特市新城区', '新城区', ',351,352,', '352');
INSERT INTO `area` VALUES ('354', '2013-01-01 09:02:01', '2013-01-01 09:02:01', null, '内蒙古自治区呼和浩特市回民区', '回民区', ',351,352,', '352');
INSERT INTO `area` VALUES ('355', '2013-01-01 09:02:01', '2013-01-01 09:02:01', null, '内蒙古自治区呼和浩特市玉泉区', '玉泉区', ',351,352,', '352');
INSERT INTO `area` VALUES ('356', '2013-01-01 09:02:01', '2013-01-01 09:02:01', null, '内蒙古自治区呼和浩特市赛罕区', '赛罕区', ',351,352,', '352');
INSERT INTO `area` VALUES ('357', '2013-01-01 09:02:01', '2013-01-01 09:02:01', null, '内蒙古自治区呼和浩特市土默特左旗', '土默特左旗', ',351,352,', '352');
INSERT INTO `area` VALUES ('358', '2013-01-01 09:02:01', '2013-01-01 09:02:01', null, '内蒙古自治区呼和浩特市托克托县', '托克托县', ',351,352,', '352');
INSERT INTO `area` VALUES ('359', '2013-01-01 09:02:01', '2013-01-01 09:02:01', null, '内蒙古自治区呼和浩特市和林格尔县', '和林格尔县', ',351,352,', '352');
INSERT INTO `area` VALUES ('360', '2013-01-01 09:02:01', '2013-01-01 09:02:01', null, '内蒙古自治区呼和浩特市清水河县', '清水河县', ',351,352,', '352');
INSERT INTO `area` VALUES ('361', '2013-01-01 09:02:01', '2013-01-01 09:02:01', null, '内蒙古自治区呼和浩特市武川县', '武川县', ',351,352,', '352');
INSERT INTO `area` VALUES ('362', '2013-01-01 09:02:01', '2013-01-01 09:02:01', null, '内蒙古自治区包头市', '包头市', ',351,', '351');
INSERT INTO `area` VALUES ('363', '2013-01-01 09:02:01', '2013-01-01 09:02:01', null, '内蒙古自治区包头市东河区', '东河区', ',351,362,', '362');
INSERT INTO `area` VALUES ('364', '2013-01-01 09:02:01', '2013-01-01 09:02:01', null, '内蒙古自治区包头市昆都仑区', '昆都仑区', ',351,362,', '362');
INSERT INTO `area` VALUES ('365', '2013-01-01 09:02:01', '2013-01-01 09:02:01', null, '内蒙古自治区包头市青山区', '青山区', ',351,362,', '362');
INSERT INTO `area` VALUES ('366', '2013-01-01 09:02:01', '2013-01-01 09:02:01', null, '内蒙古自治区包头市石拐区', '石拐区', ',351,362,', '362');
INSERT INTO `area` VALUES ('367', '2013-01-01 09:02:01', '2013-01-01 09:02:01', null, '内蒙古自治区包头市白云鄂博矿区', '白云鄂博矿区', ',351,362,', '362');
INSERT INTO `area` VALUES ('368', '2013-01-01 09:02:01', '2013-01-01 09:02:01', null, '内蒙古自治区包头市九原区', '九原区', ',351,362,', '362');
INSERT INTO `area` VALUES ('369', '2013-01-01 09:02:01', '2013-01-01 09:02:01', null, '内蒙古自治区包头市土默特右旗', '土默特右旗', ',351,362,', '362');
INSERT INTO `area` VALUES ('370', '2013-01-01 09:02:01', '2013-01-01 09:02:01', null, '内蒙古自治区包头市固阳县', '固阳县', ',351,362,', '362');
INSERT INTO `area` VALUES ('371', '2013-01-01 09:02:01', '2013-01-01 09:02:01', null, '内蒙古自治区包头市达尔罕茂明安联合旗', '达尔罕茂明安联合旗', ',351,362,', '362');
INSERT INTO `area` VALUES ('372', '2013-01-01 09:02:01', '2013-01-01 09:02:01', null, '内蒙古自治区乌海市', '乌海市', ',351,', '351');
INSERT INTO `area` VALUES ('373', '2013-01-01 09:02:01', '2013-01-01 09:02:01', null, '内蒙古自治区乌海市海勃湾区', '海勃湾区', ',351,372,', '372');
INSERT INTO `area` VALUES ('374', '2013-01-01 09:02:01', '2013-01-01 09:02:01', null, '内蒙古自治区乌海市海南区', '海南区', ',351,372,', '372');
INSERT INTO `area` VALUES ('375', '2013-01-01 09:02:01', '2013-01-01 09:02:01', null, '内蒙古自治区乌海市乌达区', '乌达区', ',351,372,', '372');
INSERT INTO `area` VALUES ('376', '2013-01-01 09:02:01', '2013-01-01 09:02:01', null, '内蒙古自治区赤峰市', '赤峰市', ',351,', '351');
INSERT INTO `area` VALUES ('377', '2013-01-01 09:02:01', '2013-01-01 09:02:01', null, '内蒙古自治区赤峰市红山区', '红山区', ',351,376,', '376');
INSERT INTO `area` VALUES ('378', '2013-01-01 09:02:01', '2013-01-01 09:02:01', null, '内蒙古自治区赤峰市元宝山区', '元宝山区', ',351,376,', '376');
INSERT INTO `area` VALUES ('379', '2013-01-01 09:02:01', '2013-01-01 09:02:01', null, '内蒙古自治区赤峰市松山区', '松山区', ',351,376,', '376');
INSERT INTO `area` VALUES ('380', '2013-01-01 09:02:01', '2013-01-01 09:02:01', null, '内蒙古自治区赤峰市阿鲁科尔沁旗', '阿鲁科尔沁旗', ',351,376,', '376');
INSERT INTO `area` VALUES ('381', '2013-01-01 09:02:01', '2013-01-01 09:02:01', null, '内蒙古自治区赤峰市巴林左旗', '巴林左旗', ',351,376,', '376');
INSERT INTO `area` VALUES ('382', '2013-01-01 09:02:01', '2013-01-01 09:02:01', null, '内蒙古自治区赤峰市巴林右旗', '巴林右旗', ',351,376,', '376');
INSERT INTO `area` VALUES ('383', '2013-01-01 09:02:01', '2013-01-01 09:02:01', null, '内蒙古自治区赤峰市林西县', '林西县', ',351,376,', '376');
INSERT INTO `area` VALUES ('384', '2013-01-01 09:02:01', '2013-01-01 09:02:01', null, '内蒙古自治区赤峰市克什克腾旗', '克什克腾旗', ',351,376,', '376');
INSERT INTO `area` VALUES ('385', '2013-01-01 09:02:01', '2013-01-01 09:02:01', null, '内蒙古自治区赤峰市翁牛特旗', '翁牛特旗', ',351,376,', '376');
INSERT INTO `area` VALUES ('386', '2013-01-01 09:02:01', '2013-01-01 09:02:01', null, '内蒙古自治区赤峰市喀喇沁旗', '喀喇沁旗', ',351,376,', '376');
INSERT INTO `area` VALUES ('387', '2013-01-01 09:02:01', '2013-01-01 09:02:01', null, '内蒙古自治区赤峰市宁城县', '宁城县', ',351,376,', '376');
INSERT INTO `area` VALUES ('388', '2013-01-01 09:02:01', '2013-01-01 09:02:01', null, '内蒙古自治区赤峰市敖汉旗', '敖汉旗', ',351,376,', '376');
INSERT INTO `area` VALUES ('389', '2013-01-01 09:02:01', '2013-01-01 09:02:01', null, '内蒙古自治区通辽市', '通辽市', ',351,', '351');
INSERT INTO `area` VALUES ('390', '2013-01-01 09:02:01', '2013-01-01 09:02:01', null, '内蒙古自治区通辽市科尔沁区', '科尔沁区', ',351,389,', '389');
INSERT INTO `area` VALUES ('391', '2013-01-01 09:02:01', '2013-01-01 09:02:01', null, '内蒙古自治区通辽市科尔沁左翼中旗', '科尔沁左翼中旗', ',351,389,', '389');
INSERT INTO `area` VALUES ('392', '2013-01-01 09:02:01', '2013-01-01 09:02:01', null, '内蒙古自治区通辽市科尔沁左翼后旗', '科尔沁左翼后旗', ',351,389,', '389');
INSERT INTO `area` VALUES ('393', '2013-01-01 09:02:01', '2013-01-01 09:02:01', null, '内蒙古自治区通辽市开鲁县', '开鲁县', ',351,389,', '389');
INSERT INTO `area` VALUES ('394', '2013-01-01 09:02:01', '2013-01-01 09:02:01', null, '内蒙古自治区通辽市库伦旗', '库伦旗', ',351,389,', '389');
INSERT INTO `area` VALUES ('395', '2013-01-01 09:02:01', '2013-01-01 09:02:01', null, '内蒙古自治区通辽市奈曼旗', '奈曼旗', ',351,389,', '389');
INSERT INTO `area` VALUES ('396', '2013-01-01 09:02:01', '2013-01-01 09:02:01', null, '内蒙古自治区通辽市扎鲁特旗', '扎鲁特旗', ',351,389,', '389');
INSERT INTO `area` VALUES ('397', '2013-01-01 09:02:01', '2013-01-01 09:02:01', null, '内蒙古自治区通辽市霍林郭勒市', '霍林郭勒市', ',351,389,', '389');
INSERT INTO `area` VALUES ('398', '2013-01-01 09:02:01', '2013-01-01 09:02:01', null, '内蒙古自治区鄂尔多斯市', '鄂尔多斯市', ',351,', '351');
INSERT INTO `area` VALUES ('399', '2013-01-01 09:02:01', '2013-01-01 09:02:01', null, '内蒙古自治区鄂尔多斯市东胜区', '东胜区', ',351,398,', '398');
INSERT INTO `area` VALUES ('400', '2013-01-01 09:02:01', '2013-01-01 09:02:01', null, '内蒙古自治区鄂尔多斯市达拉特旗', '达拉特旗', ',351,398,', '398');
INSERT INTO `area` VALUES ('401', '2013-01-01 09:02:01', '2013-01-01 09:02:01', null, '内蒙古自治区鄂尔多斯市准格尔旗', '准格尔旗', ',351,398,', '398');
INSERT INTO `area` VALUES ('402', '2013-01-01 09:02:01', '2013-01-01 09:02:01', null, '内蒙古自治区鄂尔多斯市鄂托克前旗', '鄂托克前旗', ',351,398,', '398');
INSERT INTO `area` VALUES ('403', '2013-01-01 09:02:01', '2013-01-01 09:02:01', null, '内蒙古自治区鄂尔多斯市鄂托克旗', '鄂托克旗', ',351,398,', '398');
INSERT INTO `area` VALUES ('404', '2013-01-01 09:02:01', '2013-01-01 09:02:01', null, '内蒙古自治区鄂尔多斯市杭锦旗', '杭锦旗', ',351,398,', '398');
INSERT INTO `area` VALUES ('405', '2013-01-01 09:02:01', '2013-01-01 09:02:01', null, '内蒙古自治区鄂尔多斯市乌审旗', '乌审旗', ',351,398,', '398');
INSERT INTO `area` VALUES ('406', '2013-01-01 09:02:01', '2013-01-01 09:02:01', null, '内蒙古自治区鄂尔多斯市伊金霍洛旗', '伊金霍洛旗', ',351,398,', '398');
INSERT INTO `area` VALUES ('407', '2013-01-01 09:02:01', '2013-01-01 09:02:01', null, '内蒙古自治区呼伦贝尔市', '呼伦贝尔市', ',351,', '351');
INSERT INTO `area` VALUES ('408', '2013-01-01 09:02:01', '2013-01-01 09:02:01', null, '内蒙古自治区呼伦贝尔市海拉尔区', '海拉尔区', ',351,407,', '407');
INSERT INTO `area` VALUES ('409', '2013-01-01 09:02:01', '2013-01-01 09:02:01', null, '内蒙古自治区呼伦贝尔市阿荣旗', '阿荣旗', ',351,407,', '407');
INSERT INTO `area` VALUES ('410', '2013-01-01 09:02:01', '2013-01-01 09:02:01', null, '内蒙古自治区呼伦贝尔市莫力达瓦达斡尔族自治旗', '莫力达瓦达斡尔族自治旗', ',351,407,', '407');
INSERT INTO `area` VALUES ('411', '2013-01-01 09:02:01', '2013-01-01 09:02:01', null, '内蒙古自治区呼伦贝尔市鄂伦春自治旗', '鄂伦春自治旗', ',351,407,', '407');
INSERT INTO `area` VALUES ('412', '2013-01-01 09:02:01', '2013-01-01 09:02:01', null, '内蒙古自治区呼伦贝尔市鄂温克族自治旗', '鄂温克族自治旗', ',351,407,', '407');
INSERT INTO `area` VALUES ('413', '2013-01-01 09:02:01', '2013-01-01 09:02:01', null, '内蒙古自治区呼伦贝尔市陈巴尔虎旗', '陈巴尔虎旗', ',351,407,', '407');
INSERT INTO `area` VALUES ('414', '2013-01-01 09:02:01', '2013-01-01 09:02:01', null, '内蒙古自治区呼伦贝尔市新巴尔虎左旗', '新巴尔虎左旗', ',351,407,', '407');
INSERT INTO `area` VALUES ('415', '2013-01-01 09:02:01', '2013-01-01 09:02:01', null, '内蒙古自治区呼伦贝尔市新巴尔虎右旗', '新巴尔虎右旗', ',351,407,', '407');
INSERT INTO `area` VALUES ('416', '2013-01-01 09:02:01', '2013-01-01 09:02:01', null, '内蒙古自治区呼伦贝尔市满洲里市', '满洲里市', ',351,407,', '407');
INSERT INTO `area` VALUES ('417', '2013-01-01 09:02:01', '2013-01-01 09:02:01', null, '内蒙古自治区呼伦贝尔市牙克石市', '牙克石市', ',351,407,', '407');
INSERT INTO `area` VALUES ('418', '2013-01-01 09:02:01', '2013-01-01 09:02:01', null, '内蒙古自治区呼伦贝尔市扎兰屯市', '扎兰屯市', ',351,407,', '407');
INSERT INTO `area` VALUES ('419', '2013-01-01 09:02:01', '2013-01-01 09:02:01', null, '内蒙古自治区呼伦贝尔市额尔古纳市', '额尔古纳市', ',351,407,', '407');
INSERT INTO `area` VALUES ('420', '2013-01-01 09:02:01', '2013-01-01 09:02:01', null, '内蒙古自治区呼伦贝尔市根河市', '根河市', ',351,407,', '407');
INSERT INTO `area` VALUES ('421', '2013-01-01 09:02:01', '2013-01-01 09:02:01', null, '内蒙古自治区巴彦淖尔市', '巴彦淖尔市', ',351,', '351');
INSERT INTO `area` VALUES ('422', '2013-01-01 09:02:01', '2013-01-01 09:02:01', null, '内蒙古自治区巴彦淖尔市临河区', '临河区', ',351,421,', '421');
INSERT INTO `area` VALUES ('423', '2013-01-01 09:02:02', '2013-01-01 09:02:02', null, '内蒙古自治区巴彦淖尔市五原县', '五原县', ',351,421,', '421');
INSERT INTO `area` VALUES ('424', '2013-01-01 09:02:02', '2013-01-01 09:02:02', null, '内蒙古自治区巴彦淖尔市磴口县', '磴口县', ',351,421,', '421');
INSERT INTO `area` VALUES ('425', '2013-01-01 09:02:02', '2013-01-01 09:02:02', null, '内蒙古自治区巴彦淖尔市乌拉特前旗', '乌拉特前旗', ',351,421,', '421');
INSERT INTO `area` VALUES ('426', '2013-01-01 09:02:02', '2013-01-01 09:02:02', null, '内蒙古自治区巴彦淖尔市乌拉特中旗', '乌拉特中旗', ',351,421,', '421');
INSERT INTO `area` VALUES ('427', '2013-01-01 09:02:02', '2013-01-01 09:02:02', null, '内蒙古自治区巴彦淖尔市乌拉特后旗', '乌拉特后旗', ',351,421,', '421');
INSERT INTO `area` VALUES ('428', '2013-01-01 09:02:02', '2013-01-01 09:02:02', null, '内蒙古自治区巴彦淖尔市杭锦后旗', '杭锦后旗', ',351,421,', '421');
INSERT INTO `area` VALUES ('429', '2013-01-01 09:02:02', '2013-01-01 09:02:02', null, '内蒙古自治区乌兰察布市', '乌兰察布市', ',351,', '351');
INSERT INTO `area` VALUES ('430', '2013-01-01 09:02:02', '2013-01-01 09:02:02', null, '内蒙古自治区乌兰察布市集宁区', '集宁区', ',351,429,', '429');
INSERT INTO `area` VALUES ('431', '2013-01-01 09:02:02', '2013-01-01 09:02:02', null, '内蒙古自治区乌兰察布市卓资县', '卓资县', ',351,429,', '429');
INSERT INTO `area` VALUES ('432', '2013-01-01 09:02:02', '2013-01-01 09:02:02', null, '内蒙古自治区乌兰察布市化德县', '化德县', ',351,429,', '429');
INSERT INTO `area` VALUES ('433', '2013-01-01 09:02:02', '2013-01-01 09:02:02', null, '内蒙古自治区乌兰察布市商都县', '商都县', ',351,429,', '429');
INSERT INTO `area` VALUES ('434', '2013-01-01 09:02:02', '2013-01-01 09:02:02', null, '内蒙古自治区乌兰察布市兴和县', '兴和县', ',351,429,', '429');
INSERT INTO `area` VALUES ('435', '2013-01-01 09:02:02', '2013-01-01 09:02:02', null, '内蒙古自治区乌兰察布市凉城县', '凉城县', ',351,429,', '429');
INSERT INTO `area` VALUES ('436', '2013-01-01 09:02:02', '2013-01-01 09:02:02', null, '内蒙古自治区乌兰察布市察哈尔右翼前旗', '察哈尔右翼前旗', ',351,429,', '429');
INSERT INTO `area` VALUES ('437', '2013-01-01 09:02:02', '2013-01-01 09:02:02', null, '内蒙古自治区乌兰察布市察哈尔右翼中旗', '察哈尔右翼中旗', ',351,429,', '429');
INSERT INTO `area` VALUES ('438', '2013-01-01 09:02:02', '2013-01-01 09:02:02', null, '内蒙古自治区乌兰察布市察哈尔右翼后旗', '察哈尔右翼后旗', ',351,429,', '429');
INSERT INTO `area` VALUES ('439', '2013-01-01 09:02:02', '2013-01-01 09:02:02', null, '内蒙古自治区乌兰察布市四子王旗', '四子王旗', ',351,429,', '429');
INSERT INTO `area` VALUES ('440', '2013-01-01 09:02:02', '2013-01-01 09:02:02', null, '内蒙古自治区乌兰察布市丰镇市', '丰镇市', ',351,429,', '429');
INSERT INTO `area` VALUES ('441', '2013-01-01 09:02:02', '2013-01-01 09:02:02', null, '内蒙古自治区兴安盟', '兴安盟', ',351,', '351');
INSERT INTO `area` VALUES ('442', '2013-01-01 09:02:02', '2013-01-01 09:02:02', null, '内蒙古自治区兴安盟乌兰浩特市', '乌兰浩特市', ',351,441,', '441');
INSERT INTO `area` VALUES ('443', '2013-01-01 09:02:02', '2013-01-01 09:02:02', null, '内蒙古自治区兴安盟阿尔山市', '阿尔山市', ',351,441,', '441');
INSERT INTO `area` VALUES ('444', '2013-01-01 09:02:02', '2013-01-01 09:02:02', null, '内蒙古自治区兴安盟科尔沁右翼前旗', '科尔沁右翼前旗', ',351,441,', '441');
INSERT INTO `area` VALUES ('445', '2013-01-01 09:02:02', '2013-01-01 09:02:02', null, '内蒙古自治区兴安盟科尔沁右翼中旗', '科尔沁右翼中旗', ',351,441,', '441');
INSERT INTO `area` VALUES ('446', '2013-01-01 09:02:02', '2013-01-01 09:02:02', null, '内蒙古自治区兴安盟扎赉特旗', '扎赉特旗', ',351,441,', '441');
INSERT INTO `area` VALUES ('447', '2013-01-01 09:02:02', '2013-01-01 09:02:02', null, '内蒙古自治区兴安盟突泉县', '突泉县', ',351,441,', '441');
INSERT INTO `area` VALUES ('448', '2013-01-01 09:02:02', '2013-01-01 09:02:02', null, '内蒙古自治区锡林郭勒盟', '锡林郭勒盟', ',351,', '351');
INSERT INTO `area` VALUES ('449', '2013-01-01 09:02:02', '2013-01-01 09:02:02', null, '内蒙古自治区锡林郭勒盟二连浩特市', '二连浩特市', ',351,448,', '448');
INSERT INTO `area` VALUES ('450', '2013-01-01 09:02:02', '2013-01-01 09:02:02', null, '内蒙古自治区锡林郭勒盟锡林浩特市', '锡林浩特市', ',351,448,', '448');
INSERT INTO `area` VALUES ('451', '2013-01-01 09:02:02', '2013-01-01 09:02:02', null, '内蒙古自治区锡林郭勒盟阿巴嘎旗', '阿巴嘎旗', ',351,448,', '448');
INSERT INTO `area` VALUES ('452', '2013-01-01 09:02:02', '2013-01-01 09:02:02', null, '内蒙古自治区锡林郭勒盟苏尼特左旗', '苏尼特左旗', ',351,448,', '448');
INSERT INTO `area` VALUES ('453', '2013-01-01 09:02:02', '2013-01-01 09:02:02', null, '内蒙古自治区锡林郭勒盟苏尼特右旗', '苏尼特右旗', ',351,448,', '448');
INSERT INTO `area` VALUES ('454', '2013-01-01 09:02:02', '2013-01-01 09:02:02', null, '内蒙古自治区锡林郭勒盟东乌珠穆沁旗', '东乌珠穆沁旗', ',351,448,', '448');
INSERT INTO `area` VALUES ('455', '2013-01-01 09:02:02', '2013-01-01 09:02:02', null, '内蒙古自治区锡林郭勒盟西乌珠穆沁旗', '西乌珠穆沁旗', ',351,448,', '448');
INSERT INTO `area` VALUES ('456', '2013-01-01 09:02:02', '2013-01-01 09:02:02', null, '内蒙古自治区锡林郭勒盟太仆寺旗', '太仆寺旗', ',351,448,', '448');
INSERT INTO `area` VALUES ('457', '2013-01-01 09:02:02', '2013-01-01 09:02:02', null, '内蒙古自治区锡林郭勒盟镶黄旗', '镶黄旗', ',351,448,', '448');
INSERT INTO `area` VALUES ('458', '2013-01-01 09:02:02', '2013-01-01 09:02:02', null, '内蒙古自治区锡林郭勒盟正镶白旗', '正镶白旗', ',351,448,', '448');
INSERT INTO `area` VALUES ('459', '2013-01-01 09:02:02', '2013-01-01 09:02:02', null, '内蒙古自治区锡林郭勒盟正蓝旗', '正蓝旗', ',351,448,', '448');
INSERT INTO `area` VALUES ('460', '2013-01-01 09:02:02', '2013-01-01 09:02:02', null, '内蒙古自治区锡林郭勒盟多伦县', '多伦县', ',351,448,', '448');
INSERT INTO `area` VALUES ('461', '2013-01-01 09:02:02', '2013-01-01 09:02:02', null, '内蒙古自治区阿拉善盟', '阿拉善盟', ',351,', '351');
INSERT INTO `area` VALUES ('462', '2013-01-01 09:02:02', '2013-01-01 09:02:02', null, '内蒙古自治区阿拉善盟阿拉善左旗', '阿拉善左旗', ',351,461,', '461');
INSERT INTO `area` VALUES ('463', '2013-01-01 09:02:02', '2013-01-01 09:02:02', null, '内蒙古自治区阿拉善盟阿拉善右旗', '阿拉善右旗', ',351,461,', '461');
INSERT INTO `area` VALUES ('464', '2013-01-01 09:02:02', '2013-01-01 09:02:02', null, '内蒙古自治区阿拉善盟额济纳旗', '额济纳旗', ',351,461,', '461');
INSERT INTO `area` VALUES ('465', '2013-01-01 09:02:02', '2013-01-01 09:02:02', null, '辽宁省', '辽宁省', ',', null);
INSERT INTO `area` VALUES ('466', '2013-01-01 09:02:02', '2013-01-01 09:02:02', null, '辽宁省沈阳市', '沈阳市', ',465,', '465');
INSERT INTO `area` VALUES ('467', '2013-01-01 09:02:02', '2013-01-01 09:02:02', null, '辽宁省沈阳市和平区', '和平区', ',465,466,', '466');
INSERT INTO `area` VALUES ('468', '2013-01-01 09:02:02', '2013-01-01 09:02:02', null, '辽宁省沈阳市沈河区', '沈河区', ',465,466,', '466');
INSERT INTO `area` VALUES ('469', '2013-01-01 09:02:02', '2013-01-01 09:02:02', null, '辽宁省沈阳市大东区', '大东区', ',465,466,', '466');
INSERT INTO `area` VALUES ('470', '2013-01-01 09:02:02', '2013-01-01 09:02:02', null, '辽宁省沈阳市皇姑区', '皇姑区', ',465,466,', '466');
INSERT INTO `area` VALUES ('471', '2013-01-01 09:02:02', '2013-01-01 09:02:02', null, '辽宁省沈阳市铁西区', '铁西区', ',465,466,', '466');
INSERT INTO `area` VALUES ('472', '2013-01-01 09:02:02', '2013-01-01 09:02:02', null, '辽宁省沈阳市苏家屯区', '苏家屯区', ',465,466,', '466');
INSERT INTO `area` VALUES ('473', '2013-01-01 09:02:02', '2013-01-01 09:02:02', null, '辽宁省沈阳市东陵区', '东陵区', ',465,466,', '466');
INSERT INTO `area` VALUES ('474', '2013-01-01 09:02:02', '2013-01-01 09:02:02', null, '辽宁省沈阳市沈北新区', '沈北新区', ',465,466,', '466');
INSERT INTO `area` VALUES ('475', '2013-01-01 09:02:02', '2013-01-01 09:02:02', null, '辽宁省沈阳市于洪区', '于洪区', ',465,466,', '466');
INSERT INTO `area` VALUES ('476', '2013-01-01 09:02:02', '2013-01-01 09:02:02', null, '辽宁省沈阳市辽中县', '辽中县', ',465,466,', '466');
INSERT INTO `area` VALUES ('477', '2013-01-01 09:02:02', '2013-01-01 09:02:02', null, '辽宁省沈阳市康平县', '康平县', ',465,466,', '466');
INSERT INTO `area` VALUES ('478', '2013-01-01 09:02:02', '2013-01-01 09:02:02', null, '辽宁省沈阳市法库县', '法库县', ',465,466,', '466');
INSERT INTO `area` VALUES ('479', '2013-01-01 09:02:02', '2013-01-01 09:02:02', null, '辽宁省沈阳市新民市', '新民市', ',465,466,', '466');
INSERT INTO `area` VALUES ('480', '2013-01-01 09:02:02', '2013-01-01 09:02:02', null, '辽宁省大连市', '大连市', ',465,', '465');
INSERT INTO `area` VALUES ('481', '2013-01-01 09:02:02', '2013-01-01 09:02:02', null, '辽宁省大连市中山区', '中山区', ',465,480,', '480');
INSERT INTO `area` VALUES ('482', '2013-01-01 09:02:02', '2013-01-01 09:02:02', null, '辽宁省大连市西岗区', '西岗区', ',465,480,', '480');
INSERT INTO `area` VALUES ('483', '2013-01-01 09:02:02', '2013-01-01 09:02:02', null, '辽宁省大连市沙河口区', '沙河口区', ',465,480,', '480');
INSERT INTO `area` VALUES ('484', '2013-01-01 09:02:02', '2013-01-01 09:02:02', null, '辽宁省大连市甘井子区', '甘井子区', ',465,480,', '480');
INSERT INTO `area` VALUES ('485', '2013-01-01 09:02:02', '2013-01-01 09:02:02', null, '辽宁省大连市旅顺口区', '旅顺口区', ',465,480,', '480');
INSERT INTO `area` VALUES ('486', '2013-01-01 09:02:02', '2013-01-01 09:02:02', null, '辽宁省大连市金州区', '金州区', ',465,480,', '480');
INSERT INTO `area` VALUES ('487', '2013-01-01 09:02:02', '2013-01-01 09:02:02', null, '辽宁省大连市长海县', '长海县', ',465,480,', '480');
INSERT INTO `area` VALUES ('488', '2013-01-01 09:02:02', '2013-01-01 09:02:02', null, '辽宁省大连市瓦房店市', '瓦房店市', ',465,480,', '480');
INSERT INTO `area` VALUES ('489', '2013-01-01 09:02:02', '2013-01-01 09:02:02', null, '辽宁省大连市普兰店市', '普兰店市', ',465,480,', '480');
INSERT INTO `area` VALUES ('490', '2013-01-01 09:02:02', '2013-01-01 09:02:02', null, '辽宁省大连市庄河市', '庄河市', ',465,480,', '480');
INSERT INTO `area` VALUES ('491', '2013-01-01 09:02:02', '2013-01-01 09:02:02', null, '辽宁省鞍山市', '鞍山市', ',465,', '465');
INSERT INTO `area` VALUES ('492', '2013-01-01 09:02:02', '2013-01-01 09:02:02', null, '辽宁省鞍山市铁东区', '铁东区', ',465,491,', '491');
INSERT INTO `area` VALUES ('493', '2013-01-01 09:02:02', '2013-01-01 09:02:02', null, '辽宁省鞍山市铁西区', '铁西区', ',465,491,', '491');
INSERT INTO `area` VALUES ('494', '2013-01-01 09:02:02', '2013-01-01 09:02:02', null, '辽宁省鞍山市立山区', '立山区', ',465,491,', '491');
INSERT INTO `area` VALUES ('495', '2013-01-01 09:02:02', '2013-01-01 09:02:02', null, '辽宁省鞍山市千山区', '千山区', ',465,491,', '491');
INSERT INTO `area` VALUES ('496', '2013-01-01 09:02:02', '2013-01-01 09:02:02', null, '辽宁省鞍山市台安县', '台安县', ',465,491,', '491');
INSERT INTO `area` VALUES ('497', '2013-01-01 09:02:02', '2013-01-01 09:02:02', null, '辽宁省鞍山市岫岩满族自治县', '岫岩满族自治县', ',465,491,', '491');
INSERT INTO `area` VALUES ('498', '2013-01-01 09:02:02', '2013-01-01 09:02:02', null, '辽宁省鞍山市海城市', '海城市', ',465,491,', '491');
INSERT INTO `area` VALUES ('499', '2013-01-01 09:02:02', '2013-01-01 09:02:02', null, '辽宁省抚顺市', '抚顺市', ',465,', '465');
INSERT INTO `area` VALUES ('500', '2013-01-01 09:02:02', '2013-01-01 09:02:02', null, '辽宁省抚顺市新抚区', '新抚区', ',465,499,', '499');
INSERT INTO `area` VALUES ('501', '2013-01-01 09:02:02', '2013-01-01 09:02:02', null, '辽宁省抚顺市东洲区', '东洲区', ',465,499,', '499');
INSERT INTO `area` VALUES ('502', '2013-01-01 09:02:02', '2013-01-01 09:02:02', null, '辽宁省抚顺市望花区', '望花区', ',465,499,', '499');
INSERT INTO `area` VALUES ('503', '2013-01-01 09:02:02', '2013-01-01 09:02:02', null, '辽宁省抚顺市顺城区', '顺城区', ',465,499,', '499');
INSERT INTO `area` VALUES ('504', '2013-01-01 09:02:02', '2013-01-01 09:02:02', null, '辽宁省抚顺市抚顺县', '抚顺县', ',465,499,', '499');
INSERT INTO `area` VALUES ('505', '2013-01-01 09:02:02', '2013-01-01 09:02:02', null, '辽宁省抚顺市新宾满族自治县', '新宾满族自治县', ',465,499,', '499');
INSERT INTO `area` VALUES ('506', '2013-01-01 09:02:02', '2013-01-01 09:02:02', null, '辽宁省抚顺市清原满族自治县', '清原满族自治县', ',465,499,', '499');
INSERT INTO `area` VALUES ('507', '2013-01-01 09:02:02', '2013-01-01 09:02:02', null, '辽宁省本溪市', '本溪市', ',465,', '465');
INSERT INTO `area` VALUES ('508', '2013-01-01 09:02:02', '2013-01-01 09:02:02', null, '辽宁省本溪市平山区', '平山区', ',465,507,', '507');
INSERT INTO `area` VALUES ('509', '2013-01-01 09:02:02', '2013-01-01 09:02:02', null, '辽宁省本溪市溪湖区', '溪湖区', ',465,507,', '507');
INSERT INTO `area` VALUES ('510', '2013-01-01 09:02:02', '2013-01-01 09:02:02', null, '辽宁省本溪市明山区', '明山区', ',465,507,', '507');
INSERT INTO `area` VALUES ('511', '2013-01-01 09:02:02', '2013-01-01 09:02:02', null, '辽宁省本溪市南芬区', '南芬区', ',465,507,', '507');
INSERT INTO `area` VALUES ('512', '2013-01-01 09:02:02', '2013-01-01 09:02:02', null, '辽宁省本溪市本溪满族自治县', '本溪满族自治县', ',465,507,', '507');
INSERT INTO `area` VALUES ('513', '2013-01-01 09:02:02', '2013-01-01 09:02:02', null, '辽宁省本溪市桓仁满族自治县', '桓仁满族自治县', ',465,507,', '507');
INSERT INTO `area` VALUES ('514', '2013-01-01 09:02:02', '2013-01-01 09:02:02', null, '辽宁省丹东市', '丹东市', ',465,', '465');
INSERT INTO `area` VALUES ('515', '2013-01-01 09:02:02', '2013-01-01 09:02:02', null, '辽宁省丹东市元宝区', '元宝区', ',465,514,', '514');
INSERT INTO `area` VALUES ('516', '2013-01-01 09:02:02', '2013-01-01 09:02:02', null, '辽宁省丹东市振兴区', '振兴区', ',465,514,', '514');
INSERT INTO `area` VALUES ('517', '2013-01-01 09:02:02', '2013-01-01 09:02:02', null, '辽宁省丹东市振安区', '振安区', ',465,514,', '514');
INSERT INTO `area` VALUES ('518', '2013-01-01 09:02:03', '2013-01-01 09:02:03', null, '辽宁省丹东市宽甸满族自治县', '宽甸满族自治县', ',465,514,', '514');
INSERT INTO `area` VALUES ('519', '2013-01-01 09:02:03', '2013-01-01 09:02:03', null, '辽宁省丹东市东港市', '东港市', ',465,514,', '514');
INSERT INTO `area` VALUES ('520', '2013-01-01 09:02:03', '2013-01-01 09:02:03', null, '辽宁省丹东市凤城市', '凤城市', ',465,514,', '514');
INSERT INTO `area` VALUES ('521', '2013-01-01 09:02:03', '2013-01-01 09:02:03', null, '辽宁省锦州市', '锦州市', ',465,', '465');
INSERT INTO `area` VALUES ('522', '2013-01-01 09:02:03', '2013-01-01 09:02:03', null, '辽宁省锦州市古塔区', '古塔区', ',465,521,', '521');
INSERT INTO `area` VALUES ('523', '2013-01-01 09:02:03', '2013-01-01 09:02:03', null, '辽宁省锦州市凌河区', '凌河区', ',465,521,', '521');
INSERT INTO `area` VALUES ('524', '2013-01-01 09:02:03', '2013-01-01 09:02:03', null, '辽宁省锦州市太和区', '太和区', ',465,521,', '521');
INSERT INTO `area` VALUES ('525', '2013-01-01 09:02:03', '2013-01-01 09:02:03', null, '辽宁省锦州市黑山县', '黑山县', ',465,521,', '521');
INSERT INTO `area` VALUES ('526', '2013-01-01 09:02:03', '2013-01-01 09:02:03', null, '辽宁省锦州市义县', '义县', ',465,521,', '521');
INSERT INTO `area` VALUES ('527', '2013-01-01 09:02:03', '2013-01-01 09:02:03', null, '辽宁省锦州市凌海市', '凌海市', ',465,521,', '521');
INSERT INTO `area` VALUES ('528', '2013-01-01 09:02:03', '2013-01-01 09:02:03', null, '辽宁省锦州市北镇市', '北镇市', ',465,521,', '521');
INSERT INTO `area` VALUES ('529', '2013-01-01 09:02:03', '2013-01-01 09:02:03', null, '辽宁省营口市', '营口市', ',465,', '465');
INSERT INTO `area` VALUES ('530', '2013-01-01 09:02:03', '2013-01-01 09:02:03', null, '辽宁省营口市站前区', '站前区', ',465,529,', '529');
INSERT INTO `area` VALUES ('531', '2013-01-01 09:02:03', '2013-01-01 09:02:03', null, '辽宁省营口市西市区', '西市区', ',465,529,', '529');
INSERT INTO `area` VALUES ('532', '2013-01-01 09:02:03', '2013-01-01 09:02:03', null, '辽宁省营口市鲅鱼圈区', '鲅鱼圈区', ',465,529,', '529');
INSERT INTO `area` VALUES ('533', '2013-01-01 09:02:03', '2013-01-01 09:02:03', null, '辽宁省营口市老边区', '老边区', ',465,529,', '529');
INSERT INTO `area` VALUES ('534', '2013-01-01 09:02:03', '2013-01-01 09:02:03', null, '辽宁省营口市盖州市', '盖州市', ',465,529,', '529');
INSERT INTO `area` VALUES ('535', '2013-01-01 09:02:03', '2013-01-01 09:02:03', null, '辽宁省营口市大石桥市', '大石桥市', ',465,529,', '529');
INSERT INTO `area` VALUES ('536', '2013-01-01 09:02:03', '2013-01-01 09:02:03', null, '辽宁省阜新市', '阜新市', ',465,', '465');
INSERT INTO `area` VALUES ('537', '2013-01-01 09:02:03', '2013-01-01 09:02:03', null, '辽宁省阜新市海州区', '海州区', ',465,536,', '536');
INSERT INTO `area` VALUES ('538', '2013-01-01 09:02:03', '2013-01-01 09:02:03', null, '辽宁省阜新市新邱区', '新邱区', ',465,536,', '536');
INSERT INTO `area` VALUES ('539', '2013-01-01 09:02:03', '2013-01-01 09:02:03', null, '辽宁省阜新市太平区', '太平区', ',465,536,', '536');
INSERT INTO `area` VALUES ('540', '2013-01-01 09:02:03', '2013-01-01 09:02:03', null, '辽宁省阜新市清河门区', '清河门区', ',465,536,', '536');
INSERT INTO `area` VALUES ('541', '2013-01-01 09:02:03', '2013-01-01 09:02:03', null, '辽宁省阜新市细河区', '细河区', ',465,536,', '536');
INSERT INTO `area` VALUES ('542', '2013-01-01 09:02:03', '2013-01-01 09:02:03', null, '辽宁省阜新市阜新蒙古族自治县', '阜新蒙古族自治县', ',465,536,', '536');
INSERT INTO `area` VALUES ('543', '2013-01-01 09:02:03', '2013-01-01 09:02:03', null, '辽宁省阜新市彰武县', '彰武县', ',465,536,', '536');
INSERT INTO `area` VALUES ('544', '2013-01-01 09:02:03', '2013-01-01 09:02:03', null, '辽宁省辽阳市', '辽阳市', ',465,', '465');
INSERT INTO `area` VALUES ('545', '2013-01-01 09:02:03', '2013-01-01 09:02:03', null, '辽宁省辽阳市白塔区', '白塔区', ',465,544,', '544');
INSERT INTO `area` VALUES ('546', '2013-01-01 09:02:03', '2013-01-01 09:02:03', null, '辽宁省辽阳市文圣区', '文圣区', ',465,544,', '544');
INSERT INTO `area` VALUES ('547', '2013-01-01 09:02:03', '2013-01-01 09:02:03', null, '辽宁省辽阳市宏伟区', '宏伟区', ',465,544,', '544');
INSERT INTO `area` VALUES ('548', '2013-01-01 09:02:03', '2013-01-01 09:02:03', null, '辽宁省辽阳市弓长岭区', '弓长岭区', ',465,544,', '544');
INSERT INTO `area` VALUES ('549', '2013-01-01 09:02:03', '2013-01-01 09:02:03', null, '辽宁省辽阳市太子河区', '太子河区', ',465,544,', '544');
INSERT INTO `area` VALUES ('550', '2013-01-01 09:02:03', '2013-01-01 09:02:03', null, '辽宁省辽阳市辽阳县', '辽阳县', ',465,544,', '544');
INSERT INTO `area` VALUES ('551', '2013-01-01 09:02:03', '2013-01-01 09:02:03', null, '辽宁省辽阳市灯塔市', '灯塔市', ',465,544,', '544');
INSERT INTO `area` VALUES ('552', '2013-01-01 09:02:03', '2013-01-01 09:02:03', null, '辽宁省盘锦市', '盘锦市', ',465,', '465');
INSERT INTO `area` VALUES ('553', '2013-01-01 09:02:03', '2013-01-01 09:02:03', null, '辽宁省盘锦市双台子区', '双台子区', ',465,552,', '552');
INSERT INTO `area` VALUES ('554', '2013-01-01 09:02:03', '2013-01-01 09:02:03', null, '辽宁省盘锦市兴隆台区', '兴隆台区', ',465,552,', '552');
INSERT INTO `area` VALUES ('555', '2013-01-01 09:02:03', '2013-01-01 09:02:03', null, '辽宁省盘锦市大洼县', '大洼县', ',465,552,', '552');
INSERT INTO `area` VALUES ('556', '2013-01-01 09:02:03', '2013-01-01 09:02:03', null, '辽宁省盘锦市盘山县', '盘山县', ',465,552,', '552');
INSERT INTO `area` VALUES ('557', '2013-01-01 09:02:03', '2013-01-01 09:02:03', null, '辽宁省铁岭市', '铁岭市', ',465,', '465');
INSERT INTO `area` VALUES ('558', '2013-01-01 09:02:03', '2013-01-01 09:02:03', null, '辽宁省铁岭市银州区', '银州区', ',465,557,', '557');
INSERT INTO `area` VALUES ('559', '2013-01-01 09:02:03', '2013-01-01 09:02:03', null, '辽宁省铁岭市清河区', '清河区', ',465,557,', '557');
INSERT INTO `area` VALUES ('560', '2013-01-01 09:02:03', '2013-01-01 09:02:03', null, '辽宁省铁岭市铁岭县', '铁岭县', ',465,557,', '557');
INSERT INTO `area` VALUES ('561', '2013-01-01 09:02:03', '2013-01-01 09:02:03', null, '辽宁省铁岭市西丰县', '西丰县', ',465,557,', '557');
INSERT INTO `area` VALUES ('562', '2013-01-01 09:02:03', '2013-01-01 09:02:03', null, '辽宁省铁岭市昌图县', '昌图县', ',465,557,', '557');
INSERT INTO `area` VALUES ('563', '2013-01-01 09:02:03', '2013-01-01 09:02:03', null, '辽宁省铁岭市调兵山市', '调兵山市', ',465,557,', '557');
INSERT INTO `area` VALUES ('564', '2013-01-01 09:02:03', '2013-01-01 09:02:03', null, '辽宁省铁岭市开原市', '开原市', ',465,557,', '557');
INSERT INTO `area` VALUES ('565', '2013-01-01 09:02:03', '2013-01-01 09:02:03', null, '辽宁省朝阳市', '朝阳市', ',465,', '465');
INSERT INTO `area` VALUES ('566', '2013-01-01 09:02:03', '2013-01-01 09:02:03', null, '辽宁省朝阳市双塔区', '双塔区', ',465,565,', '565');
INSERT INTO `area` VALUES ('567', '2013-01-01 09:02:03', '2013-01-01 09:02:03', null, '辽宁省朝阳市龙城区', '龙城区', ',465,565,', '565');
INSERT INTO `area` VALUES ('568', '2013-01-01 09:02:03', '2013-01-01 09:02:03', null, '辽宁省朝阳市朝阳县', '朝阳县', ',465,565,', '565');
INSERT INTO `area` VALUES ('569', '2013-01-01 09:02:03', '2013-01-01 09:02:03', null, '辽宁省朝阳市建平县', '建平县', ',465,565,', '565');
INSERT INTO `area` VALUES ('570', '2013-01-01 09:02:03', '2013-01-01 09:02:03', null, '辽宁省朝阳市喀喇沁左翼蒙古族自治县', '喀喇沁左翼蒙古族自治县', ',465,565,', '565');
INSERT INTO `area` VALUES ('571', '2013-01-01 09:02:03', '2013-01-01 09:02:03', null, '辽宁省朝阳市北票市', '北票市', ',465,565,', '565');
INSERT INTO `area` VALUES ('572', '2013-01-01 09:02:03', '2013-01-01 09:02:03', null, '辽宁省朝阳市凌源市', '凌源市', ',465,565,', '565');
INSERT INTO `area` VALUES ('573', '2013-01-01 09:02:03', '2013-01-01 09:02:03', null, '辽宁省葫芦岛市', '葫芦岛市', ',465,', '465');
INSERT INTO `area` VALUES ('574', '2013-01-01 09:02:03', '2013-01-01 09:02:03', null, '辽宁省葫芦岛市连山区', '连山区', ',465,573,', '573');
INSERT INTO `area` VALUES ('575', '2013-01-01 09:02:03', '2013-01-01 09:02:03', null, '辽宁省葫芦岛市龙港区', '龙港区', ',465,573,', '573');
INSERT INTO `area` VALUES ('576', '2013-01-01 09:02:03', '2013-01-01 09:02:03', null, '辽宁省葫芦岛市南票区', '南票区', ',465,573,', '573');
INSERT INTO `area` VALUES ('577', '2013-01-01 09:02:03', '2013-01-01 09:02:03', null, '辽宁省葫芦岛市绥中县', '绥中县', ',465,573,', '573');
INSERT INTO `area` VALUES ('578', '2013-01-01 09:02:03', '2013-01-01 09:02:03', null, '辽宁省葫芦岛市建昌县', '建昌县', ',465,573,', '573');
INSERT INTO `area` VALUES ('579', '2013-01-01 09:02:03', '2013-01-01 09:02:03', null, '辽宁省葫芦岛市兴城市', '兴城市', ',465,573,', '573');
INSERT INTO `area` VALUES ('580', '2013-01-01 09:02:03', '2013-01-01 09:02:03', null, '吉林省', '吉林省', ',', null);
INSERT INTO `area` VALUES ('581', '2013-01-01 09:02:03', '2013-01-01 09:02:03', null, '吉林省长春市', '长春市', ',580,', '580');
INSERT INTO `area` VALUES ('582', '2013-01-01 09:02:03', '2013-01-01 09:02:03', null, '吉林省长春市南关区', '南关区', ',580,581,', '581');
INSERT INTO `area` VALUES ('583', '2013-01-01 09:02:03', '2013-01-01 09:02:03', null, '吉林省长春市宽城区', '宽城区', ',580,581,', '581');
INSERT INTO `area` VALUES ('584', '2013-01-01 09:02:03', '2013-01-01 09:02:03', null, '吉林省长春市朝阳区', '朝阳区', ',580,581,', '581');
INSERT INTO `area` VALUES ('585', '2013-01-01 09:02:03', '2013-01-01 09:02:03', null, '吉林省长春市二道区', '二道区', ',580,581,', '581');
INSERT INTO `area` VALUES ('586', '2013-01-01 09:02:03', '2013-01-01 09:02:03', null, '吉林省长春市绿园区', '绿园区', ',580,581,', '581');
INSERT INTO `area` VALUES ('587', '2013-01-01 09:02:03', '2013-01-01 09:02:03', null, '吉林省长春市双阳区', '双阳区', ',580,581,', '581');
INSERT INTO `area` VALUES ('588', '2013-01-01 09:02:03', '2013-01-01 09:02:03', null, '吉林省长春市农安县', '农安县', ',580,581,', '581');
INSERT INTO `area` VALUES ('589', '2013-01-01 09:02:03', '2013-01-01 09:02:03', null, '吉林省长春市九台市', '九台市', ',580,581,', '581');
INSERT INTO `area` VALUES ('590', '2013-01-01 09:02:03', '2013-01-01 09:02:03', null, '吉林省长春市榆树市', '榆树市', ',580,581,', '581');
INSERT INTO `area` VALUES ('591', '2013-01-01 09:02:03', '2013-01-01 09:02:03', null, '吉林省长春市德惠市', '德惠市', ',580,581,', '581');
INSERT INTO `area` VALUES ('592', '2013-01-01 09:02:03', '2013-01-01 09:02:03', null, '吉林省吉林市', '吉林市', ',580,', '580');
INSERT INTO `area` VALUES ('593', '2013-01-01 09:02:03', '2013-01-01 09:02:03', null, '吉林省吉林市昌邑区', '昌邑区', ',580,592,', '592');
INSERT INTO `area` VALUES ('594', '2013-01-01 09:02:03', '2013-01-01 09:02:03', null, '吉林省吉林市龙潭区', '龙潭区', ',580,592,', '592');
INSERT INTO `area` VALUES ('595', '2013-01-01 09:02:03', '2013-01-01 09:02:03', null, '吉林省吉林市船营区', '船营区', ',580,592,', '592');
INSERT INTO `area` VALUES ('596', '2013-01-01 09:02:03', '2013-01-01 09:02:03', null, '吉林省吉林市丰满区', '丰满区', ',580,592,', '592');
INSERT INTO `area` VALUES ('597', '2013-01-01 09:02:03', '2013-01-01 09:02:03', null, '吉林省吉林市永吉县', '永吉县', ',580,592,', '592');
INSERT INTO `area` VALUES ('598', '2013-01-01 09:02:03', '2013-01-01 09:02:03', null, '吉林省吉林市蛟河市', '蛟河市', ',580,592,', '592');
INSERT INTO `area` VALUES ('599', '2013-01-01 09:02:03', '2013-01-01 09:02:03', null, '吉林省吉林市桦甸市', '桦甸市', ',580,592,', '592');
INSERT INTO `area` VALUES ('600', '2013-01-01 09:02:03', '2013-01-01 09:02:03', null, '吉林省吉林市舒兰市', '舒兰市', ',580,592,', '592');
INSERT INTO `area` VALUES ('601', '2013-01-01 09:02:03', '2013-01-01 09:02:03', null, '吉林省吉林市磐石市', '磐石市', ',580,592,', '592');
INSERT INTO `area` VALUES ('602', '2013-01-01 09:02:03', '2013-01-01 09:02:03', null, '吉林省四平市', '四平市', ',580,', '580');
INSERT INTO `area` VALUES ('603', '2013-01-01 09:02:03', '2013-01-01 09:02:03', null, '吉林省四平市铁西区', '铁西区', ',580,602,', '602');
INSERT INTO `area` VALUES ('604', '2013-01-01 09:02:04', '2013-01-01 09:02:04', null, '吉林省四平市铁东区', '铁东区', ',580,602,', '602');
INSERT INTO `area` VALUES ('605', '2013-01-01 09:02:04', '2013-01-01 09:02:04', null, '吉林省四平市梨树县', '梨树县', ',580,602,', '602');
INSERT INTO `area` VALUES ('606', '2013-01-01 09:02:04', '2013-01-01 09:02:04', null, '吉林省四平市伊通满族自治县', '伊通满族自治县', ',580,602,', '602');
INSERT INTO `area` VALUES ('607', '2013-01-01 09:02:04', '2013-01-01 09:02:04', null, '吉林省四平市公主岭市', '公主岭市', ',580,602,', '602');
INSERT INTO `area` VALUES ('608', '2013-01-01 09:02:04', '2013-01-01 09:02:04', null, '吉林省四平市双辽市', '双辽市', ',580,602,', '602');
INSERT INTO `area` VALUES ('609', '2013-01-01 09:02:04', '2013-01-01 09:02:04', null, '吉林省辽源市', '辽源市', ',580,', '580');
INSERT INTO `area` VALUES ('610', '2013-01-01 09:02:04', '2013-01-01 09:02:04', null, '吉林省辽源市龙山区', '龙山区', ',580,609,', '609');
INSERT INTO `area` VALUES ('611', '2013-01-01 09:02:04', '2013-01-01 09:02:04', null, '吉林省辽源市西安区', '西安区', ',580,609,', '609');
INSERT INTO `area` VALUES ('612', '2013-01-01 09:02:04', '2013-01-01 09:02:04', null, '吉林省辽源市东丰县', '东丰县', ',580,609,', '609');
INSERT INTO `area` VALUES ('613', '2013-01-01 09:02:04', '2013-01-01 09:02:04', null, '吉林省辽源市东辽县', '东辽县', ',580,609,', '609');
INSERT INTO `area` VALUES ('614', '2013-01-01 09:02:04', '2013-01-01 09:02:04', null, '吉林省通化市', '通化市', ',580,', '580');
INSERT INTO `area` VALUES ('615', '2013-01-01 09:02:04', '2013-01-01 09:02:04', null, '吉林省通化市东昌区', '东昌区', ',580,614,', '614');
INSERT INTO `area` VALUES ('616', '2013-01-01 09:02:04', '2013-01-01 09:02:04', null, '吉林省通化市二道江区', '二道江区', ',580,614,', '614');
INSERT INTO `area` VALUES ('617', '2013-01-01 09:02:04', '2013-01-01 09:02:04', null, '吉林省通化市通化县', '通化县', ',580,614,', '614');
INSERT INTO `area` VALUES ('618', '2013-01-01 09:02:04', '2013-01-01 09:02:04', null, '吉林省通化市辉南县', '辉南县', ',580,614,', '614');
INSERT INTO `area` VALUES ('619', '2013-01-01 09:02:04', '2013-01-01 09:02:04', null, '吉林省通化市柳河县', '柳河县', ',580,614,', '614');
INSERT INTO `area` VALUES ('620', '2013-01-01 09:02:04', '2013-01-01 09:02:04', null, '吉林省通化市梅河口市', '梅河口市', ',580,614,', '614');
INSERT INTO `area` VALUES ('621', '2013-01-01 09:02:04', '2013-01-01 09:02:04', null, '吉林省通化市集安市', '集安市', ',580,614,', '614');
INSERT INTO `area` VALUES ('622', '2013-01-01 09:02:04', '2013-01-01 09:02:04', null, '吉林省白山市', '白山市', ',580,', '580');
INSERT INTO `area` VALUES ('623', '2013-01-01 09:02:04', '2013-01-01 09:02:04', null, '吉林省白山市浑江区', '浑江区', ',580,622,', '622');
INSERT INTO `area` VALUES ('624', '2013-01-01 09:02:04', '2013-01-01 09:02:04', null, '吉林省白山市江源区', '江源区', ',580,622,', '622');
INSERT INTO `area` VALUES ('625', '2013-01-01 09:02:04', '2013-01-01 09:02:04', null, '吉林省白山市抚松县', '抚松县', ',580,622,', '622');
INSERT INTO `area` VALUES ('626', '2013-01-01 09:02:04', '2013-01-01 09:02:04', null, '吉林省白山市靖宇县', '靖宇县', ',580,622,', '622');
INSERT INTO `area` VALUES ('627', '2013-01-01 09:02:04', '2013-01-01 09:02:04', null, '吉林省白山市长白朝鲜族自治县', '长白朝鲜族自治县', ',580,622,', '622');
INSERT INTO `area` VALUES ('628', '2013-01-01 09:02:04', '2013-01-01 09:02:04', null, '吉林省白山市临江市', '临江市', ',580,622,', '622');
INSERT INTO `area` VALUES ('629', '2013-01-01 09:02:04', '2013-01-01 09:02:04', null, '吉林省松原市', '松原市', ',580,', '580');
INSERT INTO `area` VALUES ('630', '2013-01-01 09:02:04', '2013-01-01 09:02:04', null, '吉林省松原市宁江区', '宁江区', ',580,629,', '629');
INSERT INTO `area` VALUES ('631', '2013-01-01 09:02:04', '2013-01-01 09:02:04', null, '吉林省松原市前郭尔罗斯蒙古族自治县', '前郭尔罗斯蒙古族自治县', ',580,629,', '629');
INSERT INTO `area` VALUES ('632', '2013-01-01 09:02:04', '2013-01-01 09:02:04', null, '吉林省松原市长岭县', '长岭县', ',580,629,', '629');
INSERT INTO `area` VALUES ('633', '2013-01-01 09:02:04', '2013-01-01 09:02:04', null, '吉林省松原市乾安县', '乾安县', ',580,629,', '629');
INSERT INTO `area` VALUES ('634', '2013-01-01 09:02:04', '2013-01-01 09:02:04', null, '吉林省松原市扶余县', '扶余县', ',580,629,', '629');
INSERT INTO `area` VALUES ('635', '2013-01-01 09:02:04', '2013-01-01 09:02:04', null, '吉林省白城市', '白城市', ',580,', '580');
INSERT INTO `area` VALUES ('636', '2013-01-01 09:02:04', '2013-01-01 09:02:04', null, '吉林省白城市洮北区', '洮北区', ',580,635,', '635');
INSERT INTO `area` VALUES ('637', '2013-01-01 09:02:04', '2013-01-01 09:02:04', null, '吉林省白城市镇赉县', '镇赉县', ',580,635,', '635');
INSERT INTO `area` VALUES ('638', '2013-01-01 09:02:04', '2013-01-01 09:02:04', null, '吉林省白城市通榆县', '通榆县', ',580,635,', '635');
INSERT INTO `area` VALUES ('639', '2013-01-01 09:02:04', '2013-01-01 09:02:04', null, '吉林省白城市洮南市', '洮南市', ',580,635,', '635');
INSERT INTO `area` VALUES ('640', '2013-01-01 09:02:04', '2013-01-01 09:02:04', null, '吉林省白城市大安市', '大安市', ',580,635,', '635');
INSERT INTO `area` VALUES ('641', '2013-01-01 09:02:04', '2013-01-01 09:02:04', null, '吉林省延边朝鲜族自治州', '延边朝鲜族自治州', ',580,', '580');
INSERT INTO `area` VALUES ('642', '2013-01-01 09:02:04', '2013-01-01 09:02:04', null, '吉林省延边朝鲜族自治州延吉市', '延吉市', ',580,641,', '641');
INSERT INTO `area` VALUES ('643', '2013-01-01 09:02:04', '2013-01-01 09:02:04', null, '吉林省延边朝鲜族自治州图们市', '图们市', ',580,641,', '641');
INSERT INTO `area` VALUES ('644', '2013-01-01 09:02:04', '2013-01-01 09:02:04', null, '吉林省延边朝鲜族自治州敦化市', '敦化市', ',580,641,', '641');
INSERT INTO `area` VALUES ('645', '2013-01-01 09:02:04', '2013-01-01 09:02:04', null, '吉林省延边朝鲜族自治州珲春市', '珲春市', ',580,641,', '641');
INSERT INTO `area` VALUES ('646', '2013-01-01 09:02:04', '2013-01-01 09:02:04', null, '吉林省延边朝鲜族自治州龙井市', '龙井市', ',580,641,', '641');
INSERT INTO `area` VALUES ('647', '2013-01-01 09:02:04', '2013-01-01 09:02:04', null, '吉林省延边朝鲜族自治州和龙市', '和龙市', ',580,641,', '641');
INSERT INTO `area` VALUES ('648', '2013-01-01 09:02:04', '2013-01-01 09:02:04', null, '吉林省延边朝鲜族自治州汪清县', '汪清县', ',580,641,', '641');
INSERT INTO `area` VALUES ('649', '2013-01-01 09:02:04', '2013-01-01 09:02:04', null, '吉林省延边朝鲜族自治州安图县', '安图县', ',580,641,', '641');
INSERT INTO `area` VALUES ('650', '2013-01-01 09:02:04', '2013-01-01 09:02:04', null, '黑龙江省', '黑龙江省', ',', null);
INSERT INTO `area` VALUES ('651', '2013-01-01 09:02:04', '2013-01-01 09:02:04', null, '黑龙江省哈尔滨市', '哈尔滨市', ',650,', '650');
INSERT INTO `area` VALUES ('652', '2013-01-01 09:02:04', '2013-01-01 09:02:04', null, '黑龙江省哈尔滨市道里区', '道里区', ',650,651,', '651');
INSERT INTO `area` VALUES ('653', '2013-01-01 09:02:04', '2013-01-01 09:02:04', null, '黑龙江省哈尔滨市南岗区', '南岗区', ',650,651,', '651');
INSERT INTO `area` VALUES ('654', '2013-01-01 09:02:04', '2013-01-01 09:02:04', null, '黑龙江省哈尔滨市道外区', '道外区', ',650,651,', '651');
INSERT INTO `area` VALUES ('655', '2013-01-01 09:02:04', '2013-01-01 09:02:04', null, '黑龙江省哈尔滨市平房区', '平房区', ',650,651,', '651');
INSERT INTO `area` VALUES ('656', '2013-01-01 09:02:04', '2013-01-01 09:02:04', null, '黑龙江省哈尔滨市松北区', '松北区', ',650,651,', '651');
INSERT INTO `area` VALUES ('657', '2013-01-01 09:02:04', '2013-01-01 09:02:04', null, '黑龙江省哈尔滨市香坊区', '香坊区', ',650,651,', '651');
INSERT INTO `area` VALUES ('658', '2013-01-01 09:02:04', '2013-01-01 09:02:04', null, '黑龙江省哈尔滨市呼兰区', '呼兰区', ',650,651,', '651');
INSERT INTO `area` VALUES ('659', '2013-01-01 09:02:04', '2013-01-01 09:02:04', null, '黑龙江省哈尔滨市阿城区', '阿城区', ',650,651,', '651');
INSERT INTO `area` VALUES ('660', '2013-01-01 09:02:04', '2013-01-01 09:02:04', null, '黑龙江省哈尔滨市依兰县', '依兰县', ',650,651,', '651');
INSERT INTO `area` VALUES ('661', '2013-01-01 09:02:04', '2013-01-01 09:02:04', null, '黑龙江省哈尔滨市方正县', '方正县', ',650,651,', '651');
INSERT INTO `area` VALUES ('662', '2013-01-01 09:02:04', '2013-01-01 09:02:04', null, '黑龙江省哈尔滨市宾县', '宾县', ',650,651,', '651');
INSERT INTO `area` VALUES ('663', '2013-01-01 09:02:04', '2013-01-01 09:02:04', null, '黑龙江省哈尔滨市巴彦县', '巴彦县', ',650,651,', '651');
INSERT INTO `area` VALUES ('664', '2013-01-01 09:02:04', '2013-01-01 09:02:04', null, '黑龙江省哈尔滨市木兰县', '木兰县', ',650,651,', '651');
INSERT INTO `area` VALUES ('665', '2013-01-01 09:02:04', '2013-01-01 09:02:04', null, '黑龙江省哈尔滨市通河县', '通河县', ',650,651,', '651');
INSERT INTO `area` VALUES ('666', '2013-01-01 09:02:04', '2013-01-01 09:02:04', null, '黑龙江省哈尔滨市延寿县', '延寿县', ',650,651,', '651');
INSERT INTO `area` VALUES ('667', '2013-01-01 09:02:04', '2013-01-01 09:02:04', null, '黑龙江省哈尔滨市双城市', '双城市', ',650,651,', '651');
INSERT INTO `area` VALUES ('668', '2013-01-01 09:02:04', '2013-01-01 09:02:04', null, '黑龙江省哈尔滨市尚志市', '尚志市', ',650,651,', '651');
INSERT INTO `area` VALUES ('669', '2013-01-01 09:02:04', '2013-01-01 09:02:04', null, '黑龙江省哈尔滨市五常市', '五常市', ',650,651,', '651');
INSERT INTO `area` VALUES ('670', '2013-01-01 09:02:04', '2013-01-01 09:02:04', null, '黑龙江省齐齐哈尔市', '齐齐哈尔市', ',650,', '650');
INSERT INTO `area` VALUES ('671', '2013-01-01 09:02:04', '2013-01-01 09:02:04', null, '黑龙江省齐齐哈尔市龙沙区', '龙沙区', ',650,670,', '670');
INSERT INTO `area` VALUES ('672', '2013-01-01 09:02:04', '2013-01-01 09:02:04', null, '黑龙江省齐齐哈尔市建华区', '建华区', ',650,670,', '670');
INSERT INTO `area` VALUES ('673', '2013-01-01 09:02:04', '2013-01-01 09:02:04', null, '黑龙江省齐齐哈尔市铁锋区', '铁锋区', ',650,670,', '670');
INSERT INTO `area` VALUES ('674', '2013-01-01 09:02:04', '2013-01-01 09:02:04', null, '黑龙江省齐齐哈尔市昂昂溪区', '昂昂溪区', ',650,670,', '670');
INSERT INTO `area` VALUES ('675', '2013-01-01 09:02:04', '2013-01-01 09:02:04', null, '黑龙江省齐齐哈尔市富拉尔基区', '富拉尔基区', ',650,670,', '670');
INSERT INTO `area` VALUES ('676', '2013-01-01 09:02:04', '2013-01-01 09:02:04', null, '黑龙江省齐齐哈尔市碾子山区', '碾子山区', ',650,670,', '670');
INSERT INTO `area` VALUES ('677', '2013-01-01 09:02:04', '2013-01-01 09:02:04', null, '黑龙江省齐齐哈尔市梅里斯达斡尔族区', '梅里斯达斡尔族区', ',650,670,', '670');
INSERT INTO `area` VALUES ('678', '2013-01-01 09:02:04', '2013-01-01 09:02:04', null, '黑龙江省齐齐哈尔市龙江县', '龙江县', ',650,670,', '670');
INSERT INTO `area` VALUES ('679', '2013-01-01 09:02:04', '2013-01-01 09:02:04', null, '黑龙江省齐齐哈尔市依安县', '依安县', ',650,670,', '670');
INSERT INTO `area` VALUES ('680', '2013-01-01 09:02:04', '2013-01-01 09:02:04', null, '黑龙江省齐齐哈尔市泰来县', '泰来县', ',650,670,', '670');
INSERT INTO `area` VALUES ('681', '2013-01-01 09:02:04', '2013-01-01 09:02:04', null, '黑龙江省齐齐哈尔市甘南县', '甘南县', ',650,670,', '670');
INSERT INTO `area` VALUES ('682', '2013-01-01 09:02:04', '2013-01-01 09:02:04', null, '黑龙江省齐齐哈尔市富裕县', '富裕县', ',650,670,', '670');
INSERT INTO `area` VALUES ('683', '2013-01-01 09:02:04', '2013-01-01 09:02:04', null, '黑龙江省齐齐哈尔市克山县', '克山县', ',650,670,', '670');
INSERT INTO `area` VALUES ('684', '2013-01-01 09:02:05', '2013-01-01 09:02:05', null, '黑龙江省齐齐哈尔市克东县', '克东县', ',650,670,', '670');
INSERT INTO `area` VALUES ('685', '2013-01-01 09:02:05', '2013-01-01 09:02:05', null, '黑龙江省齐齐哈尔市拜泉县', '拜泉县', ',650,670,', '670');
INSERT INTO `area` VALUES ('686', '2013-01-01 09:02:05', '2013-01-01 09:02:05', null, '黑龙江省齐齐哈尔市讷河市', '讷河市', ',650,670,', '670');
INSERT INTO `area` VALUES ('687', '2013-01-01 09:02:05', '2013-01-01 09:02:05', null, '黑龙江省鸡西市', '鸡西市', ',650,', '650');
INSERT INTO `area` VALUES ('688', '2013-01-01 09:02:05', '2013-01-01 09:02:05', null, '黑龙江省鸡西市鸡冠区', '鸡冠区', ',650,687,', '687');
INSERT INTO `area` VALUES ('689', '2013-01-01 09:02:05', '2013-01-01 09:02:05', null, '黑龙江省鸡西市恒山区', '恒山区', ',650,687,', '687');
INSERT INTO `area` VALUES ('690', '2013-01-01 09:02:05', '2013-01-01 09:02:05', null, '黑龙江省鸡西市滴道区', '滴道区', ',650,687,', '687');
INSERT INTO `area` VALUES ('691', '2013-01-01 09:02:05', '2013-01-01 09:02:05', null, '黑龙江省鸡西市梨树区', '梨树区', ',650,687,', '687');
INSERT INTO `area` VALUES ('692', '2013-01-01 09:02:05', '2013-01-01 09:02:05', null, '黑龙江省鸡西市城子河区', '城子河区', ',650,687,', '687');
INSERT INTO `area` VALUES ('693', '2013-01-01 09:02:05', '2013-01-01 09:02:05', null, '黑龙江省鸡西市麻山区', '麻山区', ',650,687,', '687');
INSERT INTO `area` VALUES ('694', '2013-01-01 09:02:05', '2013-01-01 09:02:05', null, '黑龙江省鸡西市鸡东县', '鸡东县', ',650,687,', '687');
INSERT INTO `area` VALUES ('695', '2013-01-01 09:02:05', '2013-01-01 09:02:05', null, '黑龙江省鸡西市虎林市', '虎林市', ',650,687,', '687');
INSERT INTO `area` VALUES ('696', '2013-01-01 09:02:05', '2013-01-01 09:02:05', null, '黑龙江省鸡西市密山市', '密山市', ',650,687,', '687');
INSERT INTO `area` VALUES ('697', '2013-01-01 09:02:05', '2013-01-01 09:02:05', null, '黑龙江省鹤岗市', '鹤岗市', ',650,', '650');
INSERT INTO `area` VALUES ('698', '2013-01-01 09:02:05', '2013-01-01 09:02:05', null, '黑龙江省鹤岗市向阳区', '向阳区', ',650,697,', '697');
INSERT INTO `area` VALUES ('699', '2013-01-01 09:02:05', '2013-01-01 09:02:05', null, '黑龙江省鹤岗市工农区', '工农区', ',650,697,', '697');
INSERT INTO `area` VALUES ('700', '2013-01-01 09:02:05', '2013-01-01 09:02:05', null, '黑龙江省鹤岗市南山区', '南山区', ',650,697,', '697');
INSERT INTO `area` VALUES ('701', '2013-01-01 09:02:05', '2013-01-01 09:02:05', null, '黑龙江省鹤岗市兴安区', '兴安区', ',650,697,', '697');
INSERT INTO `area` VALUES ('702', '2013-01-01 09:02:05', '2013-01-01 09:02:05', null, '黑龙江省鹤岗市东山区', '东山区', ',650,697,', '697');
INSERT INTO `area` VALUES ('703', '2013-01-01 09:02:05', '2013-01-01 09:02:05', null, '黑龙江省鹤岗市兴山区', '兴山区', ',650,697,', '697');
INSERT INTO `area` VALUES ('704', '2013-01-01 09:02:05', '2013-01-01 09:02:05', null, '黑龙江省鹤岗市萝北县', '萝北县', ',650,697,', '697');
INSERT INTO `area` VALUES ('705', '2013-01-01 09:02:05', '2013-01-01 09:02:05', null, '黑龙江省鹤岗市绥滨县', '绥滨县', ',650,697,', '697');
INSERT INTO `area` VALUES ('706', '2013-01-01 09:02:05', '2013-01-01 09:02:05', null, '黑龙江省双鸭山市', '双鸭山市', ',650,', '650');
INSERT INTO `area` VALUES ('707', '2013-01-01 09:02:05', '2013-01-01 09:02:05', null, '黑龙江省双鸭山市尖山区', '尖山区', ',650,706,', '706');
INSERT INTO `area` VALUES ('708', '2013-01-01 09:02:05', '2013-01-01 09:02:05', null, '黑龙江省双鸭山市岭东区', '岭东区', ',650,706,', '706');
INSERT INTO `area` VALUES ('709', '2013-01-01 09:02:05', '2013-01-01 09:02:05', null, '黑龙江省双鸭山市四方台区', '四方台区', ',650,706,', '706');
INSERT INTO `area` VALUES ('710', '2013-01-01 09:02:05', '2013-01-01 09:02:05', null, '黑龙江省双鸭山市宝山区', '宝山区', ',650,706,', '706');
INSERT INTO `area` VALUES ('711', '2013-01-01 09:02:05', '2013-01-01 09:02:05', null, '黑龙江省双鸭山市集贤县', '集贤县', ',650,706,', '706');
INSERT INTO `area` VALUES ('712', '2013-01-01 09:02:05', '2013-01-01 09:02:05', null, '黑龙江省双鸭山市友谊县', '友谊县', ',650,706,', '706');
INSERT INTO `area` VALUES ('713', '2013-01-01 09:02:05', '2013-01-01 09:02:05', null, '黑龙江省双鸭山市宝清县', '宝清县', ',650,706,', '706');
INSERT INTO `area` VALUES ('714', '2013-01-01 09:02:05', '2013-01-01 09:02:05', null, '黑龙江省双鸭山市饶河县', '饶河县', ',650,706,', '706');
INSERT INTO `area` VALUES ('715', '2013-01-01 09:02:05', '2013-01-01 09:02:05', null, '黑龙江省大庆市', '大庆市', ',650,', '650');
INSERT INTO `area` VALUES ('716', '2013-01-01 09:02:05', '2013-01-01 09:02:05', null, '黑龙江省大庆市萨尔图区', '萨尔图区', ',650,715,', '715');
INSERT INTO `area` VALUES ('717', '2013-01-01 09:02:05', '2013-01-01 09:02:05', null, '黑龙江省大庆市龙凤区', '龙凤区', ',650,715,', '715');
INSERT INTO `area` VALUES ('718', '2013-01-01 09:02:05', '2013-01-01 09:02:05', null, '黑龙江省大庆市让胡路区', '让胡路区', ',650,715,', '715');
INSERT INTO `area` VALUES ('719', '2013-01-01 09:02:05', '2013-01-01 09:02:05', null, '黑龙江省大庆市红岗区', '红岗区', ',650,715,', '715');
INSERT INTO `area` VALUES ('720', '2013-01-01 09:02:05', '2013-01-01 09:02:05', null, '黑龙江省大庆市大同区', '大同区', ',650,715,', '715');
INSERT INTO `area` VALUES ('721', '2013-01-01 09:02:05', '2013-01-01 09:02:05', null, '黑龙江省大庆市肇州县', '肇州县', ',650,715,', '715');
INSERT INTO `area` VALUES ('722', '2013-01-01 09:02:05', '2013-01-01 09:02:05', null, '黑龙江省大庆市肇源县', '肇源县', ',650,715,', '715');
INSERT INTO `area` VALUES ('723', '2013-01-01 09:02:05', '2013-01-01 09:02:05', null, '黑龙江省大庆市林甸县', '林甸县', ',650,715,', '715');
INSERT INTO `area` VALUES ('724', '2013-01-01 09:02:05', '2013-01-01 09:02:05', null, '黑龙江省大庆市杜尔伯特蒙古族自治县', '杜尔伯特蒙古族自治县', ',650,715,', '715');
INSERT INTO `area` VALUES ('725', '2013-01-01 09:02:05', '2013-01-01 09:02:05', null, '黑龙江省伊春市', '伊春市', ',650,', '650');
INSERT INTO `area` VALUES ('726', '2013-01-01 09:02:05', '2013-01-01 09:02:05', null, '黑龙江省伊春市伊春区', '伊春区', ',650,725,', '725');
INSERT INTO `area` VALUES ('727', '2013-01-01 09:02:05', '2013-01-01 09:02:05', null, '黑龙江省伊春市南岔区', '南岔区', ',650,725,', '725');
INSERT INTO `area` VALUES ('728', '2013-01-01 09:02:05', '2013-01-01 09:02:05', null, '黑龙江省伊春市友好区', '友好区', ',650,725,', '725');
INSERT INTO `area` VALUES ('729', '2013-01-01 09:02:05', '2013-01-01 09:02:05', null, '黑龙江省伊春市西林区', '西林区', ',650,725,', '725');
INSERT INTO `area` VALUES ('730', '2013-01-01 09:02:05', '2013-01-01 09:02:05', null, '黑龙江省伊春市翠峦区', '翠峦区', ',650,725,', '725');
INSERT INTO `area` VALUES ('731', '2013-01-01 09:02:05', '2013-01-01 09:02:05', null, '黑龙江省伊春市新青区', '新青区', ',650,725,', '725');
INSERT INTO `area` VALUES ('732', '2013-01-01 09:02:05', '2013-01-01 09:02:05', null, '黑龙江省伊春市美溪区', '美溪区', ',650,725,', '725');
INSERT INTO `area` VALUES ('733', '2013-01-01 09:02:05', '2013-01-01 09:02:05', null, '黑龙江省伊春市金山屯区', '金山屯区', ',650,725,', '725');
INSERT INTO `area` VALUES ('734', '2013-01-01 09:02:05', '2013-01-01 09:02:05', null, '黑龙江省伊春市五营区', '五营区', ',650,725,', '725');
INSERT INTO `area` VALUES ('735', '2013-01-01 09:02:05', '2013-01-01 09:02:05', null, '黑龙江省伊春市乌马河区', '乌马河区', ',650,725,', '725');
INSERT INTO `area` VALUES ('736', '2013-01-01 09:02:05', '2013-01-01 09:02:05', null, '黑龙江省伊春市汤旺河区', '汤旺河区', ',650,725,', '725');
INSERT INTO `area` VALUES ('737', '2013-01-01 09:02:05', '2013-01-01 09:02:05', null, '黑龙江省伊春市带岭区', '带岭区', ',650,725,', '725');
INSERT INTO `area` VALUES ('738', '2013-01-01 09:02:05', '2013-01-01 09:02:05', null, '黑龙江省伊春市乌伊岭区', '乌伊岭区', ',650,725,', '725');
INSERT INTO `area` VALUES ('739', '2013-01-01 09:02:05', '2013-01-01 09:02:05', null, '黑龙江省伊春市红星区', '红星区', ',650,725,', '725');
INSERT INTO `area` VALUES ('740', '2013-01-01 09:02:05', '2013-01-01 09:02:05', null, '黑龙江省伊春市上甘岭区', '上甘岭区', ',650,725,', '725');
INSERT INTO `area` VALUES ('741', '2013-01-01 09:02:05', '2013-01-01 09:02:05', null, '黑龙江省伊春市嘉荫县', '嘉荫县', ',650,725,', '725');
INSERT INTO `area` VALUES ('742', '2013-01-01 09:02:05', '2013-01-01 09:02:05', null, '黑龙江省伊春市铁力市', '铁力市', ',650,725,', '725');
INSERT INTO `area` VALUES ('743', '2013-01-01 09:02:05', '2013-01-01 09:02:05', null, '黑龙江省佳木斯市', '佳木斯市', ',650,', '650');
INSERT INTO `area` VALUES ('744', '2013-01-01 09:02:05', '2013-01-01 09:02:05', null, '黑龙江省佳木斯市向阳区', '向阳区', ',650,743,', '743');
INSERT INTO `area` VALUES ('745', '2013-01-01 09:02:05', '2013-01-01 09:02:05', null, '黑龙江省佳木斯市前进区', '前进区', ',650,743,', '743');
INSERT INTO `area` VALUES ('746', '2013-01-01 09:02:05', '2013-01-01 09:02:05', null, '黑龙江省佳木斯市东风区', '东风区', ',650,743,', '743');
INSERT INTO `area` VALUES ('747', '2013-01-01 09:02:05', '2013-01-01 09:02:05', null, '黑龙江省佳木斯市郊区', '郊区', ',650,743,', '743');
INSERT INTO `area` VALUES ('748', '2013-01-01 09:02:05', '2013-01-01 09:02:05', null, '黑龙江省佳木斯市桦南县', '桦南县', ',650,743,', '743');
INSERT INTO `area` VALUES ('749', '2013-01-01 09:02:05', '2013-01-01 09:02:05', null, '黑龙江省佳木斯市桦川县', '桦川县', ',650,743,', '743');
INSERT INTO `area` VALUES ('750', '2013-01-01 09:02:05', '2013-01-01 09:02:05', null, '黑龙江省佳木斯市汤原县', '汤原县', ',650,743,', '743');
INSERT INTO `area` VALUES ('751', '2013-01-01 09:02:05', '2013-01-01 09:02:05', null, '黑龙江省佳木斯市抚远县', '抚远县', ',650,743,', '743');
INSERT INTO `area` VALUES ('752', '2013-01-01 09:02:05', '2013-01-01 09:02:05', null, '黑龙江省佳木斯市同江市', '同江市', ',650,743,', '743');
INSERT INTO `area` VALUES ('753', '2013-01-01 09:02:05', '2013-01-01 09:02:05', null, '黑龙江省佳木斯市富锦市', '富锦市', ',650,743,', '743');
INSERT INTO `area` VALUES ('754', '2013-01-01 09:02:05', '2013-01-01 09:02:05', null, '黑龙江省七台河市', '七台河市', ',650,', '650');
INSERT INTO `area` VALUES ('755', '2013-01-01 09:02:05', '2013-01-01 09:02:05', null, '黑龙江省七台河市新兴区', '新兴区', ',650,754,', '754');
INSERT INTO `area` VALUES ('756', '2013-01-01 09:02:06', '2013-01-01 09:02:06', null, '黑龙江省七台河市桃山区', '桃山区', ',650,754,', '754');
INSERT INTO `area` VALUES ('757', '2013-01-01 09:02:06', '2013-01-01 09:02:06', null, '黑龙江省七台河市茄子河区', '茄子河区', ',650,754,', '754');
INSERT INTO `area` VALUES ('758', '2013-01-01 09:02:06', '2013-01-01 09:02:06', null, '黑龙江省七台河市勃利县', '勃利县', ',650,754,', '754');
INSERT INTO `area` VALUES ('759', '2013-01-01 09:02:06', '2013-01-01 09:02:06', null, '黑龙江省牡丹江市', '牡丹江市', ',650,', '650');
INSERT INTO `area` VALUES ('760', '2013-01-01 09:02:06', '2013-01-01 09:02:06', null, '黑龙江省牡丹江市东安区', '东安区', ',650,759,', '759');
INSERT INTO `area` VALUES ('761', '2013-01-01 09:02:06', '2013-01-01 09:02:06', null, '黑龙江省牡丹江市阳明区', '阳明区', ',650,759,', '759');
INSERT INTO `area` VALUES ('762', '2013-01-01 09:02:06', '2013-01-01 09:02:06', null, '黑龙江省牡丹江市爱民区', '爱民区', ',650,759,', '759');
INSERT INTO `area` VALUES ('763', '2013-01-01 09:02:06', '2013-01-01 09:02:06', null, '黑龙江省牡丹江市西安区', '西安区', ',650,759,', '759');
INSERT INTO `area` VALUES ('764', '2013-01-01 09:02:06', '2013-01-01 09:02:06', null, '黑龙江省牡丹江市东宁县', '东宁县', ',650,759,', '759');
INSERT INTO `area` VALUES ('765', '2013-01-01 09:02:06', '2013-01-01 09:02:06', null, '黑龙江省牡丹江市林口县', '林口县', ',650,759,', '759');
INSERT INTO `area` VALUES ('766', '2013-01-01 09:02:06', '2013-01-01 09:02:06', null, '黑龙江省牡丹江市绥芬河市', '绥芬河市', ',650,759,', '759');
INSERT INTO `area` VALUES ('767', '2013-01-01 09:02:06', '2013-01-01 09:02:06', null, '黑龙江省牡丹江市海林市', '海林市', ',650,759,', '759');
INSERT INTO `area` VALUES ('768', '2013-01-01 09:02:06', '2013-01-01 09:02:06', null, '黑龙江省牡丹江市宁安市', '宁安市', ',650,759,', '759');
INSERT INTO `area` VALUES ('769', '2013-01-01 09:02:06', '2013-01-01 09:02:06', null, '黑龙江省牡丹江市穆棱市', '穆棱市', ',650,759,', '759');
INSERT INTO `area` VALUES ('770', '2013-01-01 09:02:06', '2013-01-01 09:02:06', null, '黑龙江省黑河市', '黑河市', ',650,', '650');
INSERT INTO `area` VALUES ('771', '2013-01-01 09:02:06', '2013-01-01 09:02:06', null, '黑龙江省黑河市爱辉区', '爱辉区', ',650,770,', '770');
INSERT INTO `area` VALUES ('772', '2013-01-01 09:02:06', '2013-01-01 09:02:06', null, '黑龙江省黑河市嫩江县', '嫩江县', ',650,770,', '770');
INSERT INTO `area` VALUES ('773', '2013-01-01 09:02:06', '2013-01-01 09:02:06', null, '黑龙江省黑河市逊克县', '逊克县', ',650,770,', '770');
INSERT INTO `area` VALUES ('774', '2013-01-01 09:02:06', '2013-01-01 09:02:06', null, '黑龙江省黑河市孙吴县', '孙吴县', ',650,770,', '770');
INSERT INTO `area` VALUES ('775', '2013-01-01 09:02:06', '2013-01-01 09:02:06', null, '黑龙江省黑河市北安市', '北安市', ',650,770,', '770');
INSERT INTO `area` VALUES ('776', '2013-01-01 09:02:06', '2013-01-01 09:02:06', null, '黑龙江省黑河市五大连池市', '五大连池市', ',650,770,', '770');
INSERT INTO `area` VALUES ('777', '2013-01-01 09:02:06', '2013-01-01 09:02:06', null, '黑龙江省绥化市', '绥化市', ',650,', '650');
INSERT INTO `area` VALUES ('778', '2013-01-01 09:02:06', '2013-01-01 09:02:06', null, '黑龙江省绥化市北林区', '北林区', ',650,777,', '777');
INSERT INTO `area` VALUES ('779', '2013-01-01 09:02:06', '2013-01-01 09:02:06', null, '黑龙江省绥化市望奎县', '望奎县', ',650,777,', '777');
INSERT INTO `area` VALUES ('780', '2013-01-01 09:02:06', '2013-01-01 09:02:06', null, '黑龙江省绥化市兰西县', '兰西县', ',650,777,', '777');
INSERT INTO `area` VALUES ('781', '2013-01-01 09:02:06', '2013-01-01 09:02:06', null, '黑龙江省绥化市青冈县', '青冈县', ',650,777,', '777');
INSERT INTO `area` VALUES ('782', '2013-01-01 09:02:06', '2013-01-01 09:02:06', null, '黑龙江省绥化市庆安县', '庆安县', ',650,777,', '777');
INSERT INTO `area` VALUES ('783', '2013-01-01 09:02:06', '2013-01-01 09:02:06', null, '黑龙江省绥化市明水县', '明水县', ',650,777,', '777');
INSERT INTO `area` VALUES ('784', '2013-01-01 09:02:06', '2013-01-01 09:02:06', null, '黑龙江省绥化市绥棱县', '绥棱县', ',650,777,', '777');
INSERT INTO `area` VALUES ('785', '2013-01-01 09:02:06', '2013-01-01 09:02:06', null, '黑龙江省绥化市安达市', '安达市', ',650,777,', '777');
INSERT INTO `area` VALUES ('786', '2013-01-01 09:02:06', '2013-01-01 09:02:06', null, '黑龙江省绥化市肇东市', '肇东市', ',650,777,', '777');
INSERT INTO `area` VALUES ('787', '2013-01-01 09:02:06', '2013-01-01 09:02:06', null, '黑龙江省绥化市海伦市', '海伦市', ',650,777,', '777');
INSERT INTO `area` VALUES ('788', '2013-01-01 09:02:06', '2013-01-01 09:02:06', null, '黑龙江省大兴安岭地区', '大兴安岭地区', ',650,', '650');
INSERT INTO `area` VALUES ('789', '2013-01-01 09:02:06', '2013-01-01 09:02:06', null, '黑龙江省大兴安岭地区呼玛县', '呼玛县', ',650,788,', '788');
INSERT INTO `area` VALUES ('790', '2013-01-01 09:02:06', '2013-01-01 09:02:06', null, '黑龙江省大兴安岭地区塔河县', '塔河县', ',650,788,', '788');
INSERT INTO `area` VALUES ('791', '2013-01-01 09:02:06', '2013-01-01 09:02:06', null, '黑龙江省大兴安岭地区漠河县', '漠河县', ',650,788,', '788');
INSERT INTO `area` VALUES ('792', '2013-01-01 09:02:06', '2013-01-01 09:02:06', null, '上海市', '上海市', ',', null);
INSERT INTO `area` VALUES ('793', '2013-01-01 09:02:06', '2013-01-01 09:02:06', null, '上海市黄浦区', '黄浦区', ',792,', '792');
INSERT INTO `area` VALUES ('794', '2013-01-01 09:02:06', '2013-01-01 09:02:06', null, '上海市徐汇区', '徐汇区', ',792,', '792');
INSERT INTO `area` VALUES ('795', '2013-01-01 09:02:06', '2013-01-01 09:02:06', null, '上海市长宁区', '长宁区', ',792,', '792');
INSERT INTO `area` VALUES ('796', '2013-01-01 09:02:06', '2013-01-01 09:02:06', null, '上海市静安区', '静安区', ',792,', '792');
INSERT INTO `area` VALUES ('797', '2013-01-01 09:02:06', '2013-01-01 09:02:06', null, '上海市普陀区', '普陀区', ',792,', '792');
INSERT INTO `area` VALUES ('798', '2013-01-01 09:02:06', '2013-01-01 09:02:06', null, '上海市闸北区', '闸北区', ',792,', '792');
INSERT INTO `area` VALUES ('799', '2013-01-01 09:02:06', '2013-01-01 09:02:06', null, '上海市虹口区', '虹口区', ',792,', '792');
INSERT INTO `area` VALUES ('800', '2013-01-01 09:02:06', '2013-01-01 09:02:06', null, '上海市杨浦区', '杨浦区', ',792,', '792');
INSERT INTO `area` VALUES ('801', '2013-01-01 09:02:06', '2013-01-01 09:02:06', null, '上海市闵行区', '闵行区', ',792,', '792');
INSERT INTO `area` VALUES ('802', '2013-01-01 09:02:06', '2013-01-01 09:02:06', null, '上海市宝山区', '宝山区', ',792,', '792');
INSERT INTO `area` VALUES ('803', '2013-01-01 09:02:06', '2013-01-01 09:02:06', null, '上海市嘉定区', '嘉定区', ',792,', '792');
INSERT INTO `area` VALUES ('804', '2013-01-01 09:02:06', '2013-01-01 09:02:06', null, '上海市浦东新区', '浦东新区', ',792,', '792');
INSERT INTO `area` VALUES ('805', '2013-01-01 09:02:06', '2013-01-01 09:02:06', null, '上海市金山区', '金山区', ',792,', '792');
INSERT INTO `area` VALUES ('806', '2013-01-01 09:02:06', '2013-01-01 09:02:06', null, '上海市松江区', '松江区', ',792,', '792');
INSERT INTO `area` VALUES ('807', '2013-01-01 09:02:06', '2013-01-01 09:02:06', null, '上海市青浦区', '青浦区', ',792,', '792');
INSERT INTO `area` VALUES ('808', '2013-01-01 09:02:06', '2013-01-01 09:02:06', null, '上海市奉贤区', '奉贤区', ',792,', '792');
INSERT INTO `area` VALUES ('809', '2013-01-01 09:02:06', '2013-01-01 09:02:06', null, '上海市崇明县', '崇明县', ',792,', '792');
INSERT INTO `area` VALUES ('810', '2013-01-01 09:02:06', '2013-01-01 09:02:06', null, '江苏省', '江苏省', ',', null);
INSERT INTO `area` VALUES ('811', '2013-01-01 09:02:06', '2013-01-01 09:02:06', null, '江苏省南京市', '南京市', ',810,', '810');
INSERT INTO `area` VALUES ('812', '2013-01-01 09:02:06', '2013-01-01 09:02:06', null, '江苏省南京市玄武区', '玄武区', ',810,811,', '811');
INSERT INTO `area` VALUES ('813', '2013-01-01 09:02:06', '2013-01-01 09:02:06', null, '江苏省南京市白下区', '白下区', ',810,811,', '811');
INSERT INTO `area` VALUES ('814', '2013-01-01 09:02:06', '2013-01-01 09:02:06', null, '江苏省南京市秦淮区', '秦淮区', ',810,811,', '811');
INSERT INTO `area` VALUES ('815', '2013-01-01 09:02:06', '2013-01-01 09:02:06', null, '江苏省南京市建邺区', '建邺区', ',810,811,', '811');
INSERT INTO `area` VALUES ('816', '2013-01-01 09:02:06', '2013-01-01 09:02:06', null, '江苏省南京市鼓楼区', '鼓楼区', ',810,811,', '811');
INSERT INTO `area` VALUES ('817', '2013-01-01 09:02:06', '2013-01-01 09:02:06', null, '江苏省南京市下关区', '下关区', ',810,811,', '811');
INSERT INTO `area` VALUES ('818', '2013-01-01 09:02:06', '2013-01-01 09:02:06', null, '江苏省南京市浦口区', '浦口区', ',810,811,', '811');
INSERT INTO `area` VALUES ('819', '2013-01-01 09:02:06', '2013-01-01 09:02:06', null, '江苏省南京市栖霞区', '栖霞区', ',810,811,', '811');
INSERT INTO `area` VALUES ('820', '2013-01-01 09:02:06', '2013-01-01 09:02:06', null, '江苏省南京市雨花台区', '雨花台区', ',810,811,', '811');
INSERT INTO `area` VALUES ('821', '2013-01-01 09:02:06', '2013-01-01 09:02:06', null, '江苏省南京市江宁区', '江宁区', ',810,811,', '811');
INSERT INTO `area` VALUES ('822', '2013-01-01 09:02:06', '2013-01-01 09:02:06', null, '江苏省南京市六合区', '六合区', ',810,811,', '811');
INSERT INTO `area` VALUES ('823', '2013-01-01 09:02:06', '2013-01-01 09:02:06', null, '江苏省南京市溧水县', '溧水县', ',810,811,', '811');
INSERT INTO `area` VALUES ('824', '2013-01-01 09:02:06', '2013-01-01 09:02:06', null, '江苏省南京市高淳县', '高淳县', ',810,811,', '811');
INSERT INTO `area` VALUES ('825', '2013-01-01 09:02:06', '2013-01-01 09:02:06', null, '江苏省无锡市', '无锡市', ',810,', '810');
INSERT INTO `area` VALUES ('826', '2013-01-01 09:02:07', '2013-01-01 09:02:07', null, '江苏省无锡市崇安区', '崇安区', ',810,825,', '825');
INSERT INTO `area` VALUES ('827', '2013-01-01 09:02:07', '2013-01-01 09:02:07', null, '江苏省无锡市南长区', '南长区', ',810,825,', '825');
INSERT INTO `area` VALUES ('828', '2013-01-01 09:02:07', '2013-01-01 09:02:07', null, '江苏省无锡市北塘区', '北塘区', ',810,825,', '825');
INSERT INTO `area` VALUES ('829', '2013-01-01 09:02:07', '2013-01-01 09:02:07', null, '江苏省无锡市锡山区', '锡山区', ',810,825,', '825');
INSERT INTO `area` VALUES ('830', '2013-01-01 09:02:07', '2013-01-01 09:02:07', null, '江苏省无锡市惠山区', '惠山区', ',810,825,', '825');
INSERT INTO `area` VALUES ('831', '2013-01-01 09:02:07', '2013-01-01 09:02:07', null, '江苏省无锡市滨湖区', '滨湖区', ',810,825,', '825');
INSERT INTO `area` VALUES ('832', '2013-01-01 09:02:07', '2013-01-01 09:02:07', null, '江苏省无锡市江阴市', '江阴市', ',810,825,', '825');
INSERT INTO `area` VALUES ('833', '2013-01-01 09:02:07', '2013-01-01 09:02:07', null, '江苏省无锡市宜兴市', '宜兴市', ',810,825,', '825');
INSERT INTO `area` VALUES ('834', '2013-01-01 09:02:07', '2013-01-01 09:02:07', null, '江苏省徐州市', '徐州市', ',810,', '810');
INSERT INTO `area` VALUES ('835', '2013-01-01 09:02:07', '2013-01-01 09:02:07', null, '江苏省徐州市鼓楼区', '鼓楼区', ',810,834,', '834');
INSERT INTO `area` VALUES ('836', '2013-01-01 09:02:07', '2013-01-01 09:02:07', null, '江苏省徐州市云龙区', '云龙区', ',810,834,', '834');
INSERT INTO `area` VALUES ('837', '2013-01-01 09:02:07', '2013-01-01 09:02:07', null, '江苏省徐州市贾汪区', '贾汪区', ',810,834,', '834');
INSERT INTO `area` VALUES ('838', '2013-01-01 09:02:07', '2013-01-01 09:02:07', null, '江苏省徐州市泉山区', '泉山区', ',810,834,', '834');
INSERT INTO `area` VALUES ('839', '2013-01-01 09:02:07', '2013-01-01 09:02:07', null, '江苏省徐州市铜山区', '铜山区', ',810,834,', '834');
INSERT INTO `area` VALUES ('840', '2013-01-01 09:02:07', '2013-01-01 09:02:07', null, '江苏省徐州市丰县', '丰县', ',810,834,', '834');
INSERT INTO `area` VALUES ('841', '2013-01-01 09:02:07', '2013-01-01 09:02:07', null, '江苏省徐州市沛县', '沛县', ',810,834,', '834');
INSERT INTO `area` VALUES ('842', '2013-01-01 09:02:07', '2013-01-01 09:02:07', null, '江苏省徐州市睢宁县', '睢宁县', ',810,834,', '834');
INSERT INTO `area` VALUES ('843', '2013-01-01 09:02:07', '2013-01-01 09:02:07', null, '江苏省徐州市新沂市', '新沂市', ',810,834,', '834');
INSERT INTO `area` VALUES ('844', '2013-01-01 09:02:07', '2013-01-01 09:02:07', null, '江苏省徐州市邳州市', '邳州市', ',810,834,', '834');
INSERT INTO `area` VALUES ('845', '2013-01-01 09:02:07', '2013-01-01 09:02:07', null, '江苏省常州市', '常州市', ',810,', '810');
INSERT INTO `area` VALUES ('846', '2013-01-01 09:02:07', '2013-01-01 09:02:07', null, '江苏省常州市天宁区', '天宁区', ',810,845,', '845');
INSERT INTO `area` VALUES ('847', '2013-01-01 09:02:07', '2013-01-01 09:02:07', null, '江苏省常州市钟楼区', '钟楼区', ',810,845,', '845');
INSERT INTO `area` VALUES ('848', '2013-01-01 09:02:07', '2013-01-01 09:02:07', null, '江苏省常州市戚墅堰区', '戚墅堰区', ',810,845,', '845');
INSERT INTO `area` VALUES ('849', '2013-01-01 09:02:07', '2013-01-01 09:02:07', null, '江苏省常州市新北区', '新北区', ',810,845,', '845');
INSERT INTO `area` VALUES ('850', '2013-01-01 09:02:07', '2013-01-01 09:02:07', null, '江苏省常州市武进区', '武进区', ',810,845,', '845');
INSERT INTO `area` VALUES ('851', '2013-01-01 09:02:07', '2013-01-01 09:02:07', null, '江苏省常州市溧阳市', '溧阳市', ',810,845,', '845');
INSERT INTO `area` VALUES ('852', '2013-01-01 09:02:07', '2013-01-01 09:02:07', null, '江苏省常州市金坛市', '金坛市', ',810,845,', '845');
INSERT INTO `area` VALUES ('853', '2013-01-01 09:02:07', '2013-01-01 09:02:07', null, '江苏省苏州市', '苏州市', ',810,', '810');
INSERT INTO `area` VALUES ('854', '2013-01-01 09:02:07', '2013-01-01 09:02:07', null, '江苏省苏州市虎丘区', '虎丘区', ',810,853,', '853');
INSERT INTO `area` VALUES ('855', '2013-01-01 09:02:07', '2013-01-01 09:02:07', null, '江苏省苏州市吴中区', '吴中区', ',810,853,', '853');
INSERT INTO `area` VALUES ('856', '2013-01-01 09:02:07', '2013-01-01 09:02:07', null, '江苏省苏州市相城区', '相城区', ',810,853,', '853');
INSERT INTO `area` VALUES ('857', '2013-01-01 09:02:07', '2013-01-01 09:02:07', null, '江苏省苏州市姑苏区', '姑苏区', ',810,853,', '853');
INSERT INTO `area` VALUES ('858', '2013-01-01 09:02:07', '2013-01-01 09:02:07', null, '江苏省苏州市吴江区', '吴江区', ',810,853,', '853');
INSERT INTO `area` VALUES ('859', '2013-01-01 09:02:07', '2013-01-01 09:02:07', null, '江苏省苏州市常熟市', '常熟市', ',810,853,', '853');
INSERT INTO `area` VALUES ('860', '2013-01-01 09:02:07', '2013-01-01 09:02:07', null, '江苏省苏州市张家港市', '张家港市', ',810,853,', '853');
INSERT INTO `area` VALUES ('861', '2013-01-01 09:02:07', '2013-01-01 09:02:07', null, '江苏省苏州市昆山市', '昆山市', ',810,853,', '853');
INSERT INTO `area` VALUES ('862', '2013-01-01 09:02:07', '2013-01-01 09:02:07', null, '江苏省苏州市太仓市', '太仓市', ',810,853,', '853');
INSERT INTO `area` VALUES ('863', '2013-01-01 09:02:07', '2013-01-01 09:02:07', null, '江苏省南通市', '南通市', ',810,', '810');
INSERT INTO `area` VALUES ('864', '2013-01-01 09:02:07', '2013-01-01 09:02:07', null, '江苏省南通市崇川区', '崇川区', ',810,863,', '863');
INSERT INTO `area` VALUES ('865', '2013-01-01 09:02:07', '2013-01-01 09:02:07', null, '江苏省南通市港闸区', '港闸区', ',810,863,', '863');
INSERT INTO `area` VALUES ('866', '2013-01-01 09:02:07', '2013-01-01 09:02:07', null, '江苏省南通市通州区', '通州区', ',810,863,', '863');
INSERT INTO `area` VALUES ('867', '2013-01-01 09:02:07', '2013-01-01 09:02:07', null, '江苏省南通市海安县', '海安县', ',810,863,', '863');
INSERT INTO `area` VALUES ('868', '2013-01-01 09:02:07', '2013-01-01 09:02:07', null, '江苏省南通市如东县', '如东县', ',810,863,', '863');
INSERT INTO `area` VALUES ('869', '2013-01-01 09:02:07', '2013-01-01 09:02:07', null, '江苏省南通市启东市', '启东市', ',810,863,', '863');
INSERT INTO `area` VALUES ('870', '2013-01-01 09:02:07', '2013-01-01 09:02:07', null, '江苏省南通市如皋市', '如皋市', ',810,863,', '863');
INSERT INTO `area` VALUES ('871', '2013-01-01 09:02:07', '2013-01-01 09:02:07', null, '江苏省南通市海门市', '海门市', ',810,863,', '863');
INSERT INTO `area` VALUES ('872', '2013-01-01 09:02:07', '2013-01-01 09:02:07', null, '江苏省连云港市', '连云港市', ',810,', '810');
INSERT INTO `area` VALUES ('873', '2013-01-01 09:02:07', '2013-01-01 09:02:07', null, '江苏省连云港市连云区', '连云区', ',810,872,', '872');
INSERT INTO `area` VALUES ('874', '2013-01-01 09:02:07', '2013-01-01 09:02:07', null, '江苏省连云港市新浦区', '新浦区', ',810,872,', '872');
INSERT INTO `area` VALUES ('875', '2013-01-01 09:02:07', '2013-01-01 09:02:07', null, '江苏省连云港市海州区', '海州区', ',810,872,', '872');
INSERT INTO `area` VALUES ('876', '2013-01-01 09:02:07', '2013-01-01 09:02:07', null, '江苏省连云港市赣榆县', '赣榆县', ',810,872,', '872');
INSERT INTO `area` VALUES ('877', '2013-01-01 09:02:07', '2013-01-01 09:02:07', null, '江苏省连云港市东海县', '东海县', ',810,872,', '872');
INSERT INTO `area` VALUES ('878', '2013-01-01 09:02:07', '2013-01-01 09:02:07', null, '江苏省连云港市灌云县', '灌云县', ',810,872,', '872');
INSERT INTO `area` VALUES ('879', '2013-01-01 09:02:07', '2013-01-01 09:02:07', null, '江苏省连云港市灌南县', '灌南县', ',810,872,', '872');
INSERT INTO `area` VALUES ('880', '2013-01-01 09:02:07', '2013-01-01 09:02:07', null, '江苏省淮安市', '淮安市', ',810,', '810');
INSERT INTO `area` VALUES ('881', '2013-01-01 09:02:07', '2013-01-01 09:02:07', null, '江苏省淮安市清河区', '清河区', ',810,880,', '880');
INSERT INTO `area` VALUES ('882', '2013-01-01 09:02:07', '2013-01-01 09:02:07', null, '江苏省淮安市淮安区', '淮安区', ',810,880,', '880');
INSERT INTO `area` VALUES ('883', '2013-01-01 09:02:07', '2013-01-01 09:02:07', null, '江苏省淮安市淮阴区', '淮阴区', ',810,880,', '880');
INSERT INTO `area` VALUES ('884', '2013-01-01 09:02:07', '2013-01-01 09:02:07', null, '江苏省淮安市清浦区', '清浦区', ',810,880,', '880');
INSERT INTO `area` VALUES ('885', '2013-01-01 09:02:07', '2013-01-01 09:02:07', null, '江苏省淮安市涟水县', '涟水县', ',810,880,', '880');
INSERT INTO `area` VALUES ('886', '2013-01-01 09:02:07', '2013-01-01 09:02:07', null, '江苏省淮安市洪泽县', '洪泽县', ',810,880,', '880');
INSERT INTO `area` VALUES ('887', '2013-01-01 09:02:07', '2013-01-01 09:02:07', null, '江苏省淮安市盱眙县', '盱眙县', ',810,880,', '880');
INSERT INTO `area` VALUES ('888', '2013-01-01 09:02:07', '2013-01-01 09:02:07', null, '江苏省淮安市金湖县', '金湖县', ',810,880,', '880');
INSERT INTO `area` VALUES ('889', '2013-01-01 09:02:07', '2013-01-01 09:02:07', null, '江苏省盐城市', '盐城市', ',810,', '810');
INSERT INTO `area` VALUES ('890', '2013-01-01 09:02:07', '2013-01-01 09:02:07', null, '江苏省盐城市亭湖区', '亭湖区', ',810,889,', '889');
INSERT INTO `area` VALUES ('891', '2013-01-01 09:02:07', '2013-01-01 09:02:07', null, '江苏省盐城市盐都区', '盐都区', ',810,889,', '889');
INSERT INTO `area` VALUES ('892', '2013-01-01 09:02:08', '2013-01-01 09:02:08', null, '江苏省盐城市响水县', '响水县', ',810,889,', '889');
INSERT INTO `area` VALUES ('893', '2013-01-01 09:02:08', '2013-01-01 09:02:08', null, '江苏省盐城市滨海县', '滨海县', ',810,889,', '889');
INSERT INTO `area` VALUES ('894', '2013-01-01 09:02:08', '2013-01-01 09:02:08', null, '江苏省盐城市阜宁县', '阜宁县', ',810,889,', '889');
INSERT INTO `area` VALUES ('895', '2013-01-01 09:02:08', '2013-01-01 09:02:08', null, '江苏省盐城市射阳县', '射阳县', ',810,889,', '889');
INSERT INTO `area` VALUES ('896', '2013-01-01 09:02:08', '2013-01-01 09:02:08', null, '江苏省盐城市建湖县', '建湖县', ',810,889,', '889');
INSERT INTO `area` VALUES ('897', '2013-01-01 09:02:08', '2013-01-01 09:02:08', null, '江苏省盐城市东台市', '东台市', ',810,889,', '889');
INSERT INTO `area` VALUES ('898', '2013-01-01 09:02:08', '2013-01-01 09:02:08', null, '江苏省盐城市大丰市', '大丰市', ',810,889,', '889');
INSERT INTO `area` VALUES ('899', '2013-01-01 09:02:08', '2013-01-01 09:02:08', null, '江苏省扬州市', '扬州市', ',810,', '810');
INSERT INTO `area` VALUES ('900', '2013-01-01 09:02:08', '2013-01-01 09:02:08', null, '江苏省扬州市广陵区', '广陵区', ',810,899,', '899');
INSERT INTO `area` VALUES ('901', '2013-01-01 09:02:08', '2013-01-01 09:02:08', null, '江苏省扬州市邗江区', '邗江区', ',810,899,', '899');
INSERT INTO `area` VALUES ('902', '2013-01-01 09:02:08', '2013-01-01 09:02:08', null, '江苏省扬州市江都区', '江都区', ',810,899,', '899');
INSERT INTO `area` VALUES ('903', '2013-01-01 09:02:08', '2013-01-01 09:02:08', null, '江苏省扬州市宝应县', '宝应县', ',810,899,', '899');
INSERT INTO `area` VALUES ('904', '2013-01-01 09:02:08', '2013-01-01 09:02:08', null, '江苏省扬州市仪征市', '仪征市', ',810,899,', '899');
INSERT INTO `area` VALUES ('905', '2013-01-01 09:02:08', '2013-01-01 09:02:08', null, '江苏省扬州市高邮市', '高邮市', ',810,899,', '899');
INSERT INTO `area` VALUES ('906', '2013-01-01 09:02:08', '2013-01-01 09:02:08', null, '江苏省镇江市', '镇江市', ',810,', '810');
INSERT INTO `area` VALUES ('907', '2013-01-01 09:02:08', '2013-01-01 09:02:08', null, '江苏省镇江市京口区', '京口区', ',810,906,', '906');
INSERT INTO `area` VALUES ('908', '2013-01-01 09:02:08', '2013-01-01 09:02:08', null, '江苏省镇江市润州区', '润州区', ',810,906,', '906');
INSERT INTO `area` VALUES ('909', '2013-01-01 09:02:08', '2013-01-01 09:02:08', null, '江苏省镇江市丹徒区', '丹徒区', ',810,906,', '906');
INSERT INTO `area` VALUES ('910', '2013-01-01 09:02:08', '2013-01-01 09:02:08', null, '江苏省镇江市丹阳市', '丹阳市', ',810,906,', '906');
INSERT INTO `area` VALUES ('911', '2013-01-01 09:02:08', '2013-01-01 09:02:08', null, '江苏省镇江市扬中市', '扬中市', ',810,906,', '906');
INSERT INTO `area` VALUES ('912', '2013-01-01 09:02:08', '2013-01-01 09:02:08', null, '江苏省镇江市句容市', '句容市', ',810,906,', '906');
INSERT INTO `area` VALUES ('913', '2013-01-01 09:02:08', '2013-01-01 09:02:08', null, '江苏省泰州市', '泰州市', ',810,', '810');
INSERT INTO `area` VALUES ('914', '2013-01-01 09:02:08', '2013-01-01 09:02:08', null, '江苏省泰州市海陵区', '海陵区', ',810,913,', '913');
INSERT INTO `area` VALUES ('915', '2013-01-01 09:02:08', '2013-01-01 09:02:08', null, '江苏省泰州市高港区', '高港区', ',810,913,', '913');
INSERT INTO `area` VALUES ('916', '2013-01-01 09:02:08', '2013-01-01 09:02:08', null, '江苏省泰州市兴化市', '兴化市', ',810,913,', '913');
INSERT INTO `area` VALUES ('917', '2013-01-01 09:02:08', '2013-01-01 09:02:08', null, '江苏省泰州市靖江市', '靖江市', ',810,913,', '913');
INSERT INTO `area` VALUES ('918', '2013-01-01 09:02:08', '2013-01-01 09:02:08', null, '江苏省泰州市泰兴市', '泰兴市', ',810,913,', '913');
INSERT INTO `area` VALUES ('919', '2013-01-01 09:02:08', '2013-01-01 09:02:08', null, '江苏省泰州市姜堰市', '姜堰市', ',810,913,', '913');
INSERT INTO `area` VALUES ('920', '2013-01-01 09:02:08', '2013-01-01 09:02:08', null, '江苏省宿迁市', '宿迁市', ',810,', '810');
INSERT INTO `area` VALUES ('921', '2013-01-01 09:02:08', '2013-01-01 09:02:08', null, '江苏省宿迁市宿城区', '宿城区', ',810,920,', '920');
INSERT INTO `area` VALUES ('922', '2013-01-01 09:02:08', '2013-01-01 09:02:08', null, '江苏省宿迁市宿豫区', '宿豫区', ',810,920,', '920');
INSERT INTO `area` VALUES ('923', '2013-01-01 09:02:08', '2013-01-01 09:02:08', null, '江苏省宿迁市沭阳县', '沭阳县', ',810,920,', '920');
INSERT INTO `area` VALUES ('924', '2013-01-01 09:02:08', '2013-01-01 09:02:08', null, '江苏省宿迁市泗阳县', '泗阳县', ',810,920,', '920');
INSERT INTO `area` VALUES ('925', '2013-01-01 09:02:08', '2013-01-01 09:02:08', null, '江苏省宿迁市泗洪县', '泗洪县', ',810,920,', '920');
INSERT INTO `area` VALUES ('926', '2013-01-01 09:02:08', '2013-01-01 09:02:08', null, '浙江省', '浙江省', ',', null);
INSERT INTO `area` VALUES ('927', '2013-01-01 09:02:08', '2013-01-01 09:02:08', null, '浙江省杭州市', '杭州市', ',926,', '926');
INSERT INTO `area` VALUES ('928', '2013-01-01 09:02:08', '2013-01-01 09:02:08', null, '浙江省杭州市上城区', '上城区', ',926,927,', '927');
INSERT INTO `area` VALUES ('929', '2013-01-01 09:02:08', '2013-01-01 09:02:08', null, '浙江省杭州市下城区', '下城区', ',926,927,', '927');
INSERT INTO `area` VALUES ('930', '2013-01-01 09:02:08', '2013-01-01 09:02:08', null, '浙江省杭州市江干区', '江干区', ',926,927,', '927');
INSERT INTO `area` VALUES ('931', '2013-01-01 09:02:08', '2013-01-01 09:02:08', null, '浙江省杭州市拱墅区', '拱墅区', ',926,927,', '927');
INSERT INTO `area` VALUES ('932', '2013-01-01 09:02:08', '2013-01-01 09:02:08', null, '浙江省杭州市西湖区', '西湖区', ',926,927,', '927');
INSERT INTO `area` VALUES ('933', '2013-01-01 09:02:08', '2013-01-01 09:02:08', null, '浙江省杭州市滨江区', '滨江区', ',926,927,', '927');
INSERT INTO `area` VALUES ('934', '2013-01-01 09:02:08', '2013-01-01 09:02:08', null, '浙江省杭州市萧山区', '萧山区', ',926,927,', '927');
INSERT INTO `area` VALUES ('935', '2013-01-01 09:02:08', '2013-01-01 09:02:08', null, '浙江省杭州市余杭区', '余杭区', ',926,927,', '927');
INSERT INTO `area` VALUES ('936', '2013-01-01 09:02:08', '2013-01-01 09:02:08', null, '浙江省杭州市桐庐县', '桐庐县', ',926,927,', '927');
INSERT INTO `area` VALUES ('937', '2013-01-01 09:02:08', '2013-01-01 09:02:08', null, '浙江省杭州市淳安县', '淳安县', ',926,927,', '927');
INSERT INTO `area` VALUES ('938', '2013-01-01 09:02:08', '2013-01-01 09:02:08', null, '浙江省杭州市建德市', '建德市', ',926,927,', '927');
INSERT INTO `area` VALUES ('939', '2013-01-01 09:02:08', '2013-01-01 09:02:08', null, '浙江省杭州市富阳市', '富阳市', ',926,927,', '927');
INSERT INTO `area` VALUES ('940', '2013-01-01 09:02:08', '2013-01-01 09:02:08', null, '浙江省杭州市临安市', '临安市', ',926,927,', '927');
INSERT INTO `area` VALUES ('941', '2013-01-01 09:02:08', '2013-01-01 09:02:08', null, '浙江省宁波市', '宁波市', ',926,', '926');
INSERT INTO `area` VALUES ('942', '2013-01-01 09:02:08', '2013-01-01 09:02:08', null, '浙江省宁波市海曙区', '海曙区', ',926,941,', '941');
INSERT INTO `area` VALUES ('943', '2013-01-01 09:02:08', '2013-01-01 09:02:08', null, '浙江省宁波市江东区', '江东区', ',926,941,', '941');
INSERT INTO `area` VALUES ('944', '2013-01-01 09:02:08', '2013-01-01 09:02:08', null, '浙江省宁波市江北区', '江北区', ',926,941,', '941');
INSERT INTO `area` VALUES ('945', '2013-01-01 09:02:08', '2013-01-01 09:02:08', null, '浙江省宁波市北仑区', '北仑区', ',926,941,', '941');
INSERT INTO `area` VALUES ('946', '2013-01-01 09:02:08', '2013-01-01 09:02:08', null, '浙江省宁波市镇海区', '镇海区', ',926,941,', '941');
INSERT INTO `area` VALUES ('947', '2013-01-01 09:02:08', '2013-01-01 09:02:08', null, '浙江省宁波市鄞州区', '鄞州区', ',926,941,', '941');
INSERT INTO `area` VALUES ('948', '2013-01-01 09:02:08', '2013-01-01 09:02:08', null, '浙江省宁波市象山县', '象山县', ',926,941,', '941');
INSERT INTO `area` VALUES ('949', '2013-01-01 09:02:08', '2013-01-01 09:02:08', null, '浙江省宁波市宁海县', '宁海县', ',926,941,', '941');
INSERT INTO `area` VALUES ('950', '2013-01-01 09:02:08', '2013-01-01 09:02:08', null, '浙江省宁波市余姚市', '余姚市', ',926,941,', '941');
INSERT INTO `area` VALUES ('951', '2013-01-01 09:02:08', '2013-01-01 09:02:08', null, '浙江省宁波市慈溪市', '慈溪市', ',926,941,', '941');
INSERT INTO `area` VALUES ('952', '2013-01-01 09:02:08', '2013-01-01 09:02:08', null, '浙江省宁波市奉化市', '奉化市', ',926,941,', '941');
INSERT INTO `area` VALUES ('953', '2013-01-01 09:02:08', '2013-01-01 09:02:08', null, '浙江省温州市', '温州市', ',926,', '926');
INSERT INTO `area` VALUES ('954', '2013-01-01 09:02:08', '2013-01-01 09:02:08', null, '浙江省温州市鹿城区', '鹿城区', ',926,953,', '953');
INSERT INTO `area` VALUES ('955', '2013-01-01 09:02:09', '2013-01-01 09:02:09', null, '浙江省温州市龙湾区', '龙湾区', ',926,953,', '953');
INSERT INTO `area` VALUES ('956', '2013-01-01 09:02:09', '2013-01-01 09:02:09', null, '浙江省温州市瓯海区', '瓯海区', ',926,953,', '953');
INSERT INTO `area` VALUES ('957', '2013-01-01 09:02:09', '2013-01-01 09:02:09', null, '浙江省温州市洞头县', '洞头县', ',926,953,', '953');
INSERT INTO `area` VALUES ('958', '2013-01-01 09:02:09', '2013-01-01 09:02:09', null, '浙江省温州市永嘉县', '永嘉县', ',926,953,', '953');
INSERT INTO `area` VALUES ('959', '2013-01-01 09:02:09', '2013-01-01 09:02:09', null, '浙江省温州市平阳县', '平阳县', ',926,953,', '953');
INSERT INTO `area` VALUES ('960', '2013-01-01 09:02:09', '2013-01-01 09:02:09', null, '浙江省温州市苍南县', '苍南县', ',926,953,', '953');
INSERT INTO `area` VALUES ('961', '2013-01-01 09:02:09', '2013-01-01 09:02:09', null, '浙江省温州市文成县', '文成县', ',926,953,', '953');
INSERT INTO `area` VALUES ('962', '2013-01-01 09:02:09', '2013-01-01 09:02:09', null, '浙江省温州市泰顺县', '泰顺县', ',926,953,', '953');
INSERT INTO `area` VALUES ('963', '2013-01-01 09:02:09', '2013-01-01 09:02:09', null, '浙江省温州市瑞安市', '瑞安市', ',926,953,', '953');
INSERT INTO `area` VALUES ('964', '2013-01-01 09:02:09', '2013-01-01 09:02:09', null, '浙江省温州市乐清市', '乐清市', ',926,953,', '953');
INSERT INTO `area` VALUES ('965', '2013-01-01 09:02:09', '2013-01-01 09:02:09', null, '浙江省嘉兴市', '嘉兴市', ',926,', '926');
INSERT INTO `area` VALUES ('966', '2013-01-01 09:02:09', '2013-01-01 09:02:09', null, '浙江省嘉兴市南湖区', '南湖区', ',926,965,', '965');
INSERT INTO `area` VALUES ('967', '2013-01-01 09:02:09', '2013-01-01 09:02:09', null, '浙江省嘉兴市秀洲区', '秀洲区', ',926,965,', '965');
INSERT INTO `area` VALUES ('968', '2013-01-01 09:02:09', '2013-01-01 09:02:09', null, '浙江省嘉兴市嘉善县', '嘉善县', ',926,965,', '965');
INSERT INTO `area` VALUES ('969', '2013-01-01 09:02:09', '2013-01-01 09:02:09', null, '浙江省嘉兴市海盐县', '海盐县', ',926,965,', '965');
INSERT INTO `area` VALUES ('970', '2013-01-01 09:02:09', '2013-01-01 09:02:09', null, '浙江省嘉兴市海宁市', '海宁市', ',926,965,', '965');
INSERT INTO `area` VALUES ('971', '2013-01-01 09:02:09', '2013-01-01 09:02:09', null, '浙江省嘉兴市平湖市', '平湖市', ',926,965,', '965');
INSERT INTO `area` VALUES ('972', '2013-01-01 09:02:09', '2013-01-01 09:02:09', null, '浙江省嘉兴市桐乡市', '桐乡市', ',926,965,', '965');
INSERT INTO `area` VALUES ('973', '2013-01-01 09:02:09', '2013-01-01 09:02:09', null, '浙江省湖州市', '湖州市', ',926,', '926');
INSERT INTO `area` VALUES ('974', '2013-01-01 09:02:09', '2013-01-01 09:02:09', null, '浙江省湖州市吴兴区', '吴兴区', ',926,973,', '973');
INSERT INTO `area` VALUES ('975', '2013-01-01 09:02:09', '2013-01-01 09:02:09', null, '浙江省湖州市南浔区', '南浔区', ',926,973,', '973');
INSERT INTO `area` VALUES ('976', '2013-01-01 09:02:09', '2013-01-01 09:02:09', null, '浙江省湖州市德清县', '德清县', ',926,973,', '973');
INSERT INTO `area` VALUES ('977', '2013-01-01 09:02:09', '2013-01-01 09:02:09', null, '浙江省湖州市长兴县', '长兴县', ',926,973,', '973');
INSERT INTO `area` VALUES ('978', '2013-01-01 09:02:09', '2013-01-01 09:02:09', null, '浙江省湖州市安吉县', '安吉县', ',926,973,', '973');
INSERT INTO `area` VALUES ('979', '2013-01-01 09:02:09', '2013-01-01 09:02:09', null, '浙江省绍兴市', '绍兴市', ',926,', '926');
INSERT INTO `area` VALUES ('980', '2013-01-01 09:02:09', '2013-01-01 09:02:09', null, '浙江省绍兴市越城区', '越城区', ',926,979,', '979');
INSERT INTO `area` VALUES ('981', '2013-01-01 09:02:09', '2013-01-01 09:02:09', null, '浙江省绍兴市绍兴县', '绍兴县', ',926,979,', '979');
INSERT INTO `area` VALUES ('982', '2013-01-01 09:02:09', '2013-01-01 09:02:09', null, '浙江省绍兴市新昌县', '新昌县', ',926,979,', '979');
INSERT INTO `area` VALUES ('983', '2013-01-01 09:02:09', '2013-01-01 09:02:09', null, '浙江省绍兴市诸暨市', '诸暨市', ',926,979,', '979');
INSERT INTO `area` VALUES ('984', '2013-01-01 09:02:09', '2013-01-01 09:02:09', null, '浙江省绍兴市上虞市', '上虞市', ',926,979,', '979');
INSERT INTO `area` VALUES ('985', '2013-01-01 09:02:09', '2013-01-01 09:02:09', null, '浙江省绍兴市嵊州市', '嵊州市', ',926,979,', '979');
INSERT INTO `area` VALUES ('986', '2013-01-01 09:02:09', '2013-01-01 09:02:09', null, '浙江省金华市', '金华市', ',926,', '926');
INSERT INTO `area` VALUES ('987', '2013-01-01 09:02:09', '2013-01-01 09:02:09', null, '浙江省金华市婺城区', '婺城区', ',926,986,', '986');
INSERT INTO `area` VALUES ('988', '2013-01-01 09:02:09', '2013-01-01 09:02:09', null, '浙江省金华市金东区', '金东区', ',926,986,', '986');
INSERT INTO `area` VALUES ('989', '2013-01-01 09:02:09', '2013-01-01 09:02:09', null, '浙江省金华市武义县', '武义县', ',926,986,', '986');
INSERT INTO `area` VALUES ('990', '2013-01-01 09:02:09', '2013-01-01 09:02:09', null, '浙江省金华市浦江县', '浦江县', ',926,986,', '986');
INSERT INTO `area` VALUES ('991', '2013-01-01 09:02:09', '2013-01-01 09:02:09', null, '浙江省金华市磐安县', '磐安县', ',926,986,', '986');
INSERT INTO `area` VALUES ('992', '2013-01-01 09:02:09', '2013-01-01 09:02:09', null, '浙江省金华市兰溪市', '兰溪市', ',926,986,', '986');
INSERT INTO `area` VALUES ('993', '2013-01-01 09:02:09', '2013-01-01 09:02:09', null, '浙江省金华市义乌市', '义乌市', ',926,986,', '986');
INSERT INTO `area` VALUES ('994', '2013-01-01 09:02:09', '2013-01-01 09:02:09', null, '浙江省金华市东阳市', '东阳市', ',926,986,', '986');
INSERT INTO `area` VALUES ('995', '2013-01-01 09:02:09', '2013-01-01 09:02:09', null, '浙江省金华市永康市', '永康市', ',926,986,', '986');
INSERT INTO `area` VALUES ('996', '2013-01-01 09:02:09', '2013-01-01 09:02:09', null, '浙江省衢州市', '衢州市', ',926,', '926');
INSERT INTO `area` VALUES ('997', '2013-01-01 09:02:09', '2013-01-01 09:02:09', null, '浙江省衢州市柯城区', '柯城区', ',926,996,', '996');
INSERT INTO `area` VALUES ('998', '2013-01-01 09:02:09', '2013-01-01 09:02:09', null, '浙江省衢州市衢江区', '衢江区', ',926,996,', '996');
INSERT INTO `area` VALUES ('999', '2013-01-01 09:02:09', '2013-01-01 09:02:09', null, '浙江省衢州市常山县', '常山县', ',926,996,', '996');
INSERT INTO `area` VALUES ('1000', '2013-01-01 09:02:09', '2013-01-01 09:02:09', null, '浙江省衢州市开化县', '开化县', ',926,996,', '996');
INSERT INTO `area` VALUES ('1001', '2013-01-01 09:02:09', '2013-01-01 09:02:09', null, '浙江省衢州市龙游县', '龙游县', ',926,996,', '996');
INSERT INTO `area` VALUES ('1002', '2013-01-01 09:02:09', '2013-01-01 09:02:09', null, '浙江省衢州市江山市', '江山市', ',926,996,', '996');
INSERT INTO `area` VALUES ('1003', '2013-01-01 09:02:09', '2013-01-01 09:02:09', null, '浙江省舟山市', '舟山市', ',926,', '926');
INSERT INTO `area` VALUES ('1004', '2013-01-01 09:02:09', '2013-01-01 09:02:09', null, '浙江省舟山市定海区', '定海区', ',926,1003,', '1003');
INSERT INTO `area` VALUES ('1005', '2013-01-01 09:02:09', '2013-01-01 09:02:09', null, '浙江省舟山市普陀区', '普陀区', ',926,1003,', '1003');
INSERT INTO `area` VALUES ('1006', '2013-01-01 09:02:09', '2013-01-01 09:02:09', null, '浙江省舟山市岱山县', '岱山县', ',926,1003,', '1003');
INSERT INTO `area` VALUES ('1007', '2013-01-01 09:02:09', '2013-01-01 09:02:09', null, '浙江省舟山市嵊泗县', '嵊泗县', ',926,1003,', '1003');
INSERT INTO `area` VALUES ('1008', '2013-01-01 09:02:09', '2013-01-01 09:02:09', null, '浙江省台州市', '台州市', ',926,', '926');
INSERT INTO `area` VALUES ('1009', '2013-01-01 09:02:09', '2013-01-01 09:02:09', null, '浙江省台州市椒江区', '椒江区', ',926,1008,', '1008');
INSERT INTO `area` VALUES ('1010', '2013-01-01 09:02:09', '2013-01-01 09:02:09', null, '浙江省台州市黄岩区', '黄岩区', ',926,1008,', '1008');
INSERT INTO `area` VALUES ('1011', '2013-01-01 09:02:09', '2013-01-01 09:02:09', null, '浙江省台州市路桥区', '路桥区', ',926,1008,', '1008');
INSERT INTO `area` VALUES ('1012', '2013-01-01 09:02:10', '2013-01-01 09:02:10', null, '浙江省台州市玉环县', '玉环县', ',926,1008,', '1008');
INSERT INTO `area` VALUES ('1013', '2013-01-01 09:02:10', '2013-01-01 09:02:10', null, '浙江省台州市三门县', '三门县', ',926,1008,', '1008');
INSERT INTO `area` VALUES ('1014', '2013-01-01 09:02:10', '2013-01-01 09:02:10', null, '浙江省台州市天台县', '天台县', ',926,1008,', '1008');
INSERT INTO `area` VALUES ('1015', '2013-01-01 09:02:10', '2013-01-01 09:02:10', null, '浙江省台州市仙居县', '仙居县', ',926,1008,', '1008');
INSERT INTO `area` VALUES ('1016', '2013-01-01 09:02:10', '2013-01-01 09:02:10', null, '浙江省台州市温岭市', '温岭市', ',926,1008,', '1008');
INSERT INTO `area` VALUES ('1017', '2013-01-01 09:02:10', '2013-01-01 09:02:10', null, '浙江省台州市临海市', '临海市', ',926,1008,', '1008');
INSERT INTO `area` VALUES ('1018', '2013-01-01 09:02:10', '2013-01-01 09:02:10', null, '浙江省丽水市', '丽水市', ',926,', '926');
INSERT INTO `area` VALUES ('1019', '2013-01-01 09:02:10', '2013-01-01 09:02:10', null, '浙江省丽水市莲都区', '莲都区', ',926,1018,', '1018');
INSERT INTO `area` VALUES ('1020', '2013-01-01 09:02:10', '2013-01-01 09:02:10', null, '浙江省丽水市青田县', '青田县', ',926,1018,', '1018');
INSERT INTO `area` VALUES ('1021', '2013-01-01 09:02:10', '2013-01-01 09:02:10', null, '浙江省丽水市缙云县', '缙云县', ',926,1018,', '1018');
INSERT INTO `area` VALUES ('1022', '2013-01-01 09:02:10', '2013-01-01 09:02:10', null, '浙江省丽水市遂昌县', '遂昌县', ',926,1018,', '1018');
INSERT INTO `area` VALUES ('1023', '2013-01-01 09:02:10', '2013-01-01 09:02:10', null, '浙江省丽水市松阳县', '松阳县', ',926,1018,', '1018');
INSERT INTO `area` VALUES ('1024', '2013-01-01 09:02:10', '2013-01-01 09:02:10', null, '浙江省丽水市云和县', '云和县', ',926,1018,', '1018');
INSERT INTO `area` VALUES ('1025', '2013-01-01 09:02:10', '2013-01-01 09:02:10', null, '浙江省丽水市庆元县', '庆元县', ',926,1018,', '1018');
INSERT INTO `area` VALUES ('1026', '2013-01-01 09:02:10', '2013-01-01 09:02:10', null, '浙江省丽水市景宁畲族自治县', '景宁畲族自治县', ',926,1018,', '1018');
INSERT INTO `area` VALUES ('1027', '2013-01-01 09:02:10', '2013-01-01 09:02:10', null, '浙江省丽水市龙泉市', '龙泉市', ',926,1018,', '1018');
INSERT INTO `area` VALUES ('1028', '2013-01-01 09:02:10', '2013-01-01 09:02:10', null, '安徽省', '安徽省', ',', null);
INSERT INTO `area` VALUES ('1029', '2013-01-01 09:02:10', '2013-01-01 09:02:10', null, '安徽省合肥市', '合肥市', ',1028,', '1028');
INSERT INTO `area` VALUES ('1030', '2013-01-01 09:02:10', '2013-01-01 09:02:10', null, '安徽省合肥市瑶海区', '瑶海区', ',1028,1029,', '1029');
INSERT INTO `area` VALUES ('1031', '2013-01-01 09:02:10', '2013-01-01 09:02:10', null, '安徽省合肥市庐阳区', '庐阳区', ',1028,1029,', '1029');
INSERT INTO `area` VALUES ('1032', '2013-01-01 09:02:10', '2013-01-01 09:02:10', null, '安徽省合肥市蜀山区', '蜀山区', ',1028,1029,', '1029');
INSERT INTO `area` VALUES ('1033', '2013-01-01 09:02:10', '2013-01-01 09:02:10', null, '安徽省合肥市包河区', '包河区', ',1028,1029,', '1029');
INSERT INTO `area` VALUES ('1034', '2013-01-01 09:02:10', '2013-01-01 09:02:10', null, '安徽省合肥市长丰县', '长丰县', ',1028,1029,', '1029');
INSERT INTO `area` VALUES ('1035', '2013-01-01 09:02:10', '2013-01-01 09:02:10', null, '安徽省合肥市肥东县', '肥东县', ',1028,1029,', '1029');
INSERT INTO `area` VALUES ('1036', '2013-01-01 09:02:10', '2013-01-01 09:02:10', null, '安徽省合肥市肥西县', '肥西县', ',1028,1029,', '1029');
INSERT INTO `area` VALUES ('1037', '2013-01-01 09:02:10', '2013-01-01 09:02:10', null, '安徽省合肥市庐江县', '庐江县', ',1028,1029,', '1029');
INSERT INTO `area` VALUES ('1038', '2013-01-01 09:02:10', '2013-01-01 09:02:10', null, '安徽省合肥市巢湖市', '巢湖市', ',1028,1029,', '1029');
INSERT INTO `area` VALUES ('1039', '2013-01-01 09:02:10', '2013-01-01 09:02:10', null, '安徽省芜湖市', '芜湖市', ',1028,', '1028');
INSERT INTO `area` VALUES ('1040', '2013-01-01 09:02:10', '2013-01-01 09:02:10', null, '安徽省芜湖市镜湖区', '镜湖区', ',1028,1039,', '1039');
INSERT INTO `area` VALUES ('1041', '2013-01-01 09:02:10', '2013-01-01 09:02:10', null, '安徽省芜湖市弋江区', '弋江区', ',1028,1039,', '1039');
INSERT INTO `area` VALUES ('1042', '2013-01-01 09:02:10', '2013-01-01 09:02:10', null, '安徽省芜湖市鸠江区', '鸠江区', ',1028,1039,', '1039');
INSERT INTO `area` VALUES ('1043', '2013-01-01 09:02:10', '2013-01-01 09:02:10', null, '安徽省芜湖市三山区', '三山区', ',1028,1039,', '1039');
INSERT INTO `area` VALUES ('1044', '2013-01-01 09:02:10', '2013-01-01 09:02:10', null, '安徽省芜湖市芜湖县', '芜湖县', ',1028,1039,', '1039');
INSERT INTO `area` VALUES ('1045', '2013-01-01 09:02:10', '2013-01-01 09:02:10', null, '安徽省芜湖市繁昌县', '繁昌县', ',1028,1039,', '1039');
INSERT INTO `area` VALUES ('1046', '2013-01-01 09:02:10', '2013-01-01 09:02:10', null, '安徽省芜湖市南陵县', '南陵县', ',1028,1039,', '1039');
INSERT INTO `area` VALUES ('1047', '2013-01-01 09:02:10', '2013-01-01 09:02:10', null, '安徽省芜湖市无为县', '无为县', ',1028,1039,', '1039');
INSERT INTO `area` VALUES ('1048', '2013-01-01 09:02:10', '2013-01-01 09:02:10', null, '安徽省蚌埠市', '蚌埠市', ',1028,', '1028');
INSERT INTO `area` VALUES ('1049', '2013-01-01 09:02:10', '2013-01-01 09:02:10', null, '安徽省蚌埠市龙子湖区', '龙子湖区', ',1028,1048,', '1048');
INSERT INTO `area` VALUES ('1050', '2013-01-01 09:02:10', '2013-01-01 09:02:10', null, '安徽省蚌埠市蚌山区', '蚌山区', ',1028,1048,', '1048');
INSERT INTO `area` VALUES ('1051', '2013-01-01 09:02:10', '2013-01-01 09:02:10', null, '安徽省蚌埠市禹会区', '禹会区', ',1028,1048,', '1048');
INSERT INTO `area` VALUES ('1052', '2013-01-01 09:02:10', '2013-01-01 09:02:10', null, '安徽省蚌埠市淮上区', '淮上区', ',1028,1048,', '1048');
INSERT INTO `area` VALUES ('1053', '2013-01-01 09:02:10', '2013-01-01 09:02:10', null, '安徽省蚌埠市怀远县', '怀远县', ',1028,1048,', '1048');
INSERT INTO `area` VALUES ('1054', '2013-01-01 09:02:10', '2013-01-01 09:02:10', null, '安徽省蚌埠市五河县', '五河县', ',1028,1048,', '1048');
INSERT INTO `area` VALUES ('1055', '2013-01-01 09:02:10', '2013-01-01 09:02:10', null, '安徽省蚌埠市固镇县', '固镇县', ',1028,1048,', '1048');
INSERT INTO `area` VALUES ('1056', '2013-01-01 09:02:10', '2013-01-01 09:02:10', null, '安徽省淮南市', '淮南市', ',1028,', '1028');
INSERT INTO `area` VALUES ('1057', '2013-01-01 09:02:10', '2013-01-01 09:02:10', null, '安徽省淮南市大通区', '大通区', ',1028,1056,', '1056');
INSERT INTO `area` VALUES ('1058', '2013-01-01 09:02:10', '2013-01-01 09:02:10', null, '安徽省淮南市田家庵区', '田家庵区', ',1028,1056,', '1056');
INSERT INTO `area` VALUES ('1059', '2013-01-01 09:02:10', '2013-01-01 09:02:10', null, '安徽省淮南市谢家集区', '谢家集区', ',1028,1056,', '1056');
INSERT INTO `area` VALUES ('1060', '2013-01-01 09:02:10', '2013-01-01 09:02:10', null, '安徽省淮南市八公山区', '八公山区', ',1028,1056,', '1056');
INSERT INTO `area` VALUES ('1061', '2013-01-01 09:02:10', '2013-01-01 09:02:10', null, '安徽省淮南市潘集区', '潘集区', ',1028,1056,', '1056');
INSERT INTO `area` VALUES ('1062', '2013-01-01 09:02:10', '2013-01-01 09:02:10', null, '安徽省淮南市凤台县', '凤台县', ',1028,1056,', '1056');
INSERT INTO `area` VALUES ('1063', '2013-01-01 09:02:10', '2013-01-01 09:02:10', null, '安徽省马鞍山市', '马鞍山市', ',1028,', '1028');
INSERT INTO `area` VALUES ('1064', '2013-01-01 09:02:10', '2013-01-01 09:02:10', null, '安徽省马鞍山市花山区', '花山区', ',1028,1063,', '1063');
INSERT INTO `area` VALUES ('1065', '2013-01-01 09:02:11', '2013-01-01 09:02:11', null, '安徽省马鞍山市雨山区', '雨山区', ',1028,1063,', '1063');
INSERT INTO `area` VALUES ('1066', '2013-01-01 09:02:11', '2013-01-01 09:02:11', null, '安徽省马鞍山市博望区', '博望区', ',1028,1063,', '1063');
INSERT INTO `area` VALUES ('1067', '2013-01-01 09:02:11', '2013-01-01 09:02:11', null, '安徽省马鞍山市当涂县', '当涂县', ',1028,1063,', '1063');
INSERT INTO `area` VALUES ('1068', '2013-01-01 09:02:11', '2013-01-01 09:02:11', null, '安徽省马鞍山市含山县', '含山县', ',1028,1063,', '1063');
INSERT INTO `area` VALUES ('1069', '2013-01-01 09:02:11', '2013-01-01 09:02:11', null, '安徽省马鞍山市和县', '和县', ',1028,1063,', '1063');
INSERT INTO `area` VALUES ('1070', '2013-01-01 09:02:11', '2013-01-01 09:02:11', null, '安徽省淮北市', '淮北市', ',1028,', '1028');
INSERT INTO `area` VALUES ('1071', '2013-01-01 09:02:11', '2013-01-01 09:02:11', null, '安徽省淮北市杜集区', '杜集区', ',1028,1070,', '1070');
INSERT INTO `area` VALUES ('1072', '2013-01-01 09:02:11', '2013-01-01 09:02:11', null, '安徽省淮北市相山区', '相山区', ',1028,1070,', '1070');
INSERT INTO `area` VALUES ('1073', '2013-01-01 09:02:11', '2013-01-01 09:02:11', null, '安徽省淮北市烈山区', '烈山区', ',1028,1070,', '1070');
INSERT INTO `area` VALUES ('1074', '2013-01-01 09:02:11', '2013-01-01 09:02:11', null, '安徽省淮北市濉溪县', '濉溪县', ',1028,1070,', '1070');
INSERT INTO `area` VALUES ('1075', '2013-01-01 09:02:11', '2013-01-01 09:02:11', null, '安徽省铜陵市', '铜陵市', ',1028,', '1028');
INSERT INTO `area` VALUES ('1076', '2013-01-01 09:02:11', '2013-01-01 09:02:11', null, '安徽省铜陵市铜官山区', '铜官山区', ',1028,1075,', '1075');
INSERT INTO `area` VALUES ('1077', '2013-01-01 09:02:11', '2013-01-01 09:02:11', null, '安徽省铜陵市狮子山区', '狮子山区', ',1028,1075,', '1075');
INSERT INTO `area` VALUES ('1078', '2013-01-01 09:02:11', '2013-01-01 09:02:11', null, '安徽省铜陵市郊区', '郊区', ',1028,1075,', '1075');
INSERT INTO `area` VALUES ('1079', '2013-01-01 09:02:11', '2013-01-01 09:02:11', null, '安徽省铜陵市铜陵县', '铜陵县', ',1028,1075,', '1075');
INSERT INTO `area` VALUES ('1080', '2013-01-01 09:02:11', '2013-01-01 09:02:11', null, '安徽省安庆市', '安庆市', ',1028,', '1028');
INSERT INTO `area` VALUES ('1081', '2013-01-01 09:02:11', '2013-01-01 09:02:11', null, '安徽省安庆市迎江区', '迎江区', ',1028,1080,', '1080');
INSERT INTO `area` VALUES ('1082', '2013-01-01 09:02:11', '2013-01-01 09:02:11', null, '安徽省安庆市大观区', '大观区', ',1028,1080,', '1080');
INSERT INTO `area` VALUES ('1083', '2013-01-01 09:02:11', '2013-01-01 09:02:11', null, '安徽省安庆市宜秀区', '宜秀区', ',1028,1080,', '1080');
INSERT INTO `area` VALUES ('1084', '2013-01-01 09:02:11', '2013-01-01 09:02:11', null, '安徽省安庆市怀宁县', '怀宁县', ',1028,1080,', '1080');
INSERT INTO `area` VALUES ('1085', '2013-01-01 09:02:11', '2013-01-01 09:02:11', null, '安徽省安庆市枞阳县', '枞阳县', ',1028,1080,', '1080');
INSERT INTO `area` VALUES ('1086', '2013-01-01 09:02:11', '2013-01-01 09:02:11', null, '安徽省安庆市潜山县', '潜山县', ',1028,1080,', '1080');
INSERT INTO `area` VALUES ('1087', '2013-01-01 09:02:11', '2013-01-01 09:02:11', null, '安徽省安庆市太湖县', '太湖县', ',1028,1080,', '1080');
INSERT INTO `area` VALUES ('1088', '2013-01-01 09:02:11', '2013-01-01 09:02:11', null, '安徽省安庆市宿松县', '宿松县', ',1028,1080,', '1080');
INSERT INTO `area` VALUES ('1089', '2013-01-01 09:02:11', '2013-01-01 09:02:11', null, '安徽省安庆市望江县', '望江县', ',1028,1080,', '1080');
INSERT INTO `area` VALUES ('1090', '2013-01-01 09:02:11', '2013-01-01 09:02:11', null, '安徽省安庆市岳西县', '岳西县', ',1028,1080,', '1080');
INSERT INTO `area` VALUES ('1091', '2013-01-01 09:02:11', '2013-01-01 09:02:11', null, '安徽省安庆市桐城市', '桐城市', ',1028,1080,', '1080');
INSERT INTO `area` VALUES ('1092', '2013-01-01 09:02:11', '2013-01-01 09:02:11', null, '安徽省黄山市', '黄山市', ',1028,', '1028');
INSERT INTO `area` VALUES ('1093', '2013-01-01 09:02:11', '2013-01-01 09:02:11', null, '安徽省黄山市屯溪区', '屯溪区', ',1028,1092,', '1092');
INSERT INTO `area` VALUES ('1094', '2013-01-01 09:02:11', '2013-01-01 09:02:11', null, '安徽省黄山市黄山区', '黄山区', ',1028,1092,', '1092');
INSERT INTO `area` VALUES ('1095', '2013-01-01 09:02:11', '2013-01-01 09:02:11', null, '安徽省黄山市徽州区', '徽州区', ',1028,1092,', '1092');
INSERT INTO `area` VALUES ('1096', '2013-01-01 09:02:11', '2013-01-01 09:02:11', null, '安徽省黄山市歙县', '歙县', ',1028,1092,', '1092');
INSERT INTO `area` VALUES ('1097', '2013-01-01 09:02:11', '2013-01-01 09:02:11', null, '安徽省黄山市休宁县', '休宁县', ',1028,1092,', '1092');
INSERT INTO `area` VALUES ('1098', '2013-01-01 09:02:11', '2013-01-01 09:02:11', null, '安徽省黄山市黟县', '黟县', ',1028,1092,', '1092');
INSERT INTO `area` VALUES ('1099', '2013-01-01 09:02:11', '2013-01-01 09:02:11', null, '安徽省黄山市祁门县', '祁门县', ',1028,1092,', '1092');
INSERT INTO `area` VALUES ('1100', '2013-01-01 09:02:11', '2013-01-01 09:02:11', null, '安徽省滁州市', '滁州市', ',1028,', '1028');
INSERT INTO `area` VALUES ('1101', '2013-01-01 09:02:11', '2013-01-01 09:02:11', null, '安徽省滁州市琅琊区', '琅琊区', ',1028,1100,', '1100');
INSERT INTO `area` VALUES ('1102', '2013-01-01 09:02:11', '2013-01-01 09:02:11', null, '安徽省滁州市南谯区', '南谯区', ',1028,1100,', '1100');
INSERT INTO `area` VALUES ('1103', '2013-01-01 09:02:11', '2013-01-01 09:02:11', null, '安徽省滁州市来安县', '来安县', ',1028,1100,', '1100');
INSERT INTO `area` VALUES ('1104', '2013-01-01 09:02:11', '2013-01-01 09:02:11', null, '安徽省滁州市全椒县', '全椒县', ',1028,1100,', '1100');
INSERT INTO `area` VALUES ('1105', '2013-01-01 09:02:11', '2013-01-01 09:02:11', null, '安徽省滁州市定远县', '定远县', ',1028,1100,', '1100');
INSERT INTO `area` VALUES ('1106', '2013-01-01 09:02:11', '2013-01-01 09:02:11', null, '安徽省滁州市凤阳县', '凤阳县', ',1028,1100,', '1100');
INSERT INTO `area` VALUES ('1107', '2013-01-01 09:02:11', '2013-01-01 09:02:11', null, '安徽省滁州市天长市', '天长市', ',1028,1100,', '1100');
INSERT INTO `area` VALUES ('1108', '2013-01-01 09:02:11', '2013-01-01 09:02:11', null, '安徽省滁州市明光市', '明光市', ',1028,1100,', '1100');
INSERT INTO `area` VALUES ('1109', '2013-01-01 09:02:11', '2013-01-01 09:02:11', null, '安徽省阜阳市', '阜阳市', ',1028,', '1028');
INSERT INTO `area` VALUES ('1110', '2013-01-01 09:02:11', '2013-01-01 09:02:11', null, '安徽省阜阳市颍州区', '颍州区', ',1028,1109,', '1109');
INSERT INTO `area` VALUES ('1111', '2013-01-01 09:02:11', '2013-01-01 09:02:11', null, '安徽省阜阳市颍东区', '颍东区', ',1028,1109,', '1109');
INSERT INTO `area` VALUES ('1112', '2013-01-01 09:02:11', '2013-01-01 09:02:11', null, '安徽省阜阳市颍泉区', '颍泉区', ',1028,1109,', '1109');
INSERT INTO `area` VALUES ('1113', '2013-01-01 09:02:11', '2013-01-01 09:02:11', null, '安徽省阜阳市临泉县', '临泉县', ',1028,1109,', '1109');
INSERT INTO `area` VALUES ('1114', '2013-01-01 09:02:11', '2013-01-01 09:02:11', null, '安徽省阜阳市太和县', '太和县', ',1028,1109,', '1109');
INSERT INTO `area` VALUES ('1115', '2013-01-01 09:02:11', '2013-01-01 09:02:11', null, '安徽省阜阳市阜南县', '阜南县', ',1028,1109,', '1109');
INSERT INTO `area` VALUES ('1116', '2013-01-01 09:02:11', '2013-01-01 09:02:11', null, '安徽省阜阳市颍上县', '颍上县', ',1028,1109,', '1109');
INSERT INTO `area` VALUES ('1117', '2013-01-01 09:02:12', '2013-01-01 09:02:12', null, '安徽省阜阳市界首市', '界首市', ',1028,1109,', '1109');
INSERT INTO `area` VALUES ('1118', '2013-01-01 09:02:12', '2013-01-01 09:02:12', null, '安徽省宿州市', '宿州市', ',1028,', '1028');
INSERT INTO `area` VALUES ('1119', '2013-01-01 09:02:12', '2013-01-01 09:02:12', null, '安徽省宿州市埇桥区', '埇桥区', ',1028,1118,', '1118');
INSERT INTO `area` VALUES ('1120', '2013-01-01 09:02:12', '2013-01-01 09:02:12', null, '安徽省宿州市砀山县', '砀山县', ',1028,1118,', '1118');
INSERT INTO `area` VALUES ('1121', '2013-01-01 09:02:12', '2013-01-01 09:02:12', null, '安徽省宿州市萧县', '萧县', ',1028,1118,', '1118');
INSERT INTO `area` VALUES ('1122', '2013-01-01 09:02:12', '2013-01-01 09:02:12', null, '安徽省宿州市灵璧县', '灵璧县', ',1028,1118,', '1118');
INSERT INTO `area` VALUES ('1123', '2013-01-01 09:02:12', '2013-01-01 09:02:12', null, '安徽省宿州市泗县', '泗县', ',1028,1118,', '1118');
INSERT INTO `area` VALUES ('1124', '2013-01-01 09:02:12', '2013-01-01 09:02:12', null, '安徽省六安市', '六安市', ',1028,', '1028');
INSERT INTO `area` VALUES ('1125', '2013-01-01 09:02:12', '2013-01-01 09:02:12', null, '安徽省六安市金安区', '金安区', ',1028,1124,', '1124');
INSERT INTO `area` VALUES ('1126', '2013-01-01 09:02:12', '2013-01-01 09:02:12', null, '安徽省六安市裕安区', '裕安区', ',1028,1124,', '1124');
INSERT INTO `area` VALUES ('1127', '2013-01-01 09:02:12', '2013-01-01 09:02:12', null, '安徽省六安市寿县', '寿县', ',1028,1124,', '1124');
INSERT INTO `area` VALUES ('1128', '2013-01-01 09:02:12', '2013-01-01 09:02:12', null, '安徽省六安市霍邱县', '霍邱县', ',1028,1124,', '1124');
INSERT INTO `area` VALUES ('1129', '2013-01-01 09:02:12', '2013-01-01 09:02:12', null, '安徽省六安市舒城县', '舒城县', ',1028,1124,', '1124');
INSERT INTO `area` VALUES ('1130', '2013-01-01 09:02:12', '2013-01-01 09:02:12', null, '安徽省六安市金寨县', '金寨县', ',1028,1124,', '1124');
INSERT INTO `area` VALUES ('1131', '2013-01-01 09:02:12', '2013-01-01 09:02:12', null, '安徽省六安市霍山县', '霍山县', ',1028,1124,', '1124');
INSERT INTO `area` VALUES ('1132', '2013-01-01 09:02:12', '2013-01-01 09:02:12', null, '安徽省亳州市', '亳州市', ',1028,', '1028');
INSERT INTO `area` VALUES ('1133', '2013-01-01 09:02:12', '2013-01-01 09:02:12', null, '安徽省亳州市谯城区', '谯城区', ',1028,1132,', '1132');
INSERT INTO `area` VALUES ('1134', '2013-01-01 09:02:12', '2013-01-01 09:02:12', null, '安徽省亳州市涡阳县', '涡阳县', ',1028,1132,', '1132');
INSERT INTO `area` VALUES ('1135', '2013-01-01 09:02:12', '2013-01-01 09:02:12', null, '安徽省亳州市蒙城县', '蒙城县', ',1028,1132,', '1132');
INSERT INTO `area` VALUES ('1136', '2013-01-01 09:02:12', '2013-01-01 09:02:12', null, '安徽省亳州市利辛县', '利辛县', ',1028,1132,', '1132');
INSERT INTO `area` VALUES ('1137', '2013-01-01 09:02:12', '2013-01-01 09:02:12', null, '安徽省池州市', '池州市', ',1028,', '1028');
INSERT INTO `area` VALUES ('1138', '2013-01-01 09:02:12', '2013-01-01 09:02:12', null, '安徽省池州市贵池区', '贵池区', ',1028,1137,', '1137');
INSERT INTO `area` VALUES ('1139', '2013-01-01 09:02:12', '2013-01-01 09:02:12', null, '安徽省池州市东至县', '东至县', ',1028,1137,', '1137');
INSERT INTO `area` VALUES ('1140', '2013-01-01 09:02:12', '2013-01-01 09:02:12', null, '安徽省池州市石台县', '石台县', ',1028,1137,', '1137');
INSERT INTO `area` VALUES ('1141', '2013-01-01 09:02:12', '2013-01-01 09:02:12', null, '安徽省池州市青阳县', '青阳县', ',1028,1137,', '1137');
INSERT INTO `area` VALUES ('1142', '2013-01-01 09:02:12', '2013-01-01 09:02:12', null, '安徽省宣城市', '宣城市', ',1028,', '1028');
INSERT INTO `area` VALUES ('1143', '2013-01-01 09:02:12', '2013-01-01 09:02:12', null, '安徽省宣城市宣州区', '宣州区', ',1028,1142,', '1142');
INSERT INTO `area` VALUES ('1144', '2013-01-01 09:02:12', '2013-01-01 09:02:12', null, '安徽省宣城市郎溪县', '郎溪县', ',1028,1142,', '1142');
INSERT INTO `area` VALUES ('1145', '2013-01-01 09:02:12', '2013-01-01 09:02:12', null, '安徽省宣城市广德县', '广德县', ',1028,1142,', '1142');
INSERT INTO `area` VALUES ('1146', '2013-01-01 09:02:12', '2013-01-01 09:02:12', null, '安徽省宣城市泾县', '泾县', ',1028,1142,', '1142');
INSERT INTO `area` VALUES ('1147', '2013-01-01 09:02:12', '2013-01-01 09:02:12', null, '安徽省宣城市绩溪县', '绩溪县', ',1028,1142,', '1142');
INSERT INTO `area` VALUES ('1148', '2013-01-01 09:02:12', '2013-01-01 09:02:12', null, '安徽省宣城市旌德县', '旌德县', ',1028,1142,', '1142');
INSERT INTO `area` VALUES ('1149', '2013-01-01 09:02:12', '2013-01-01 09:02:12', null, '安徽省宣城市宁国市', '宁国市', ',1028,1142,', '1142');
INSERT INTO `area` VALUES ('1150', '2013-01-01 09:02:12', '2013-01-01 09:02:12', null, '福建省', '福建省', ',', null);
INSERT INTO `area` VALUES ('1151', '2013-01-01 09:02:12', '2013-01-01 09:02:12', null, '福建省福州市', '福州市', ',1150,', '1150');
INSERT INTO `area` VALUES ('1152', '2013-01-01 09:02:12', '2013-01-01 09:02:12', null, '福建省福州市鼓楼区', '鼓楼区', ',1150,1151,', '1151');
INSERT INTO `area` VALUES ('1153', '2013-01-01 09:02:12', '2013-01-01 09:02:12', null, '福建省福州市台江区', '台江区', ',1150,1151,', '1151');
INSERT INTO `area` VALUES ('1154', '2013-01-01 09:02:12', '2013-01-01 09:02:12', null, '福建省福州市仓山区', '仓山区', ',1150,1151,', '1151');
INSERT INTO `area` VALUES ('1155', '2013-01-01 09:02:12', '2013-01-01 09:02:12', null, '福建省福州市马尾区', '马尾区', ',1150,1151,', '1151');
INSERT INTO `area` VALUES ('1156', '2013-01-01 09:02:12', '2013-01-01 09:02:12', null, '福建省福州市晋安区', '晋安区', ',1150,1151,', '1151');
INSERT INTO `area` VALUES ('1157', '2013-01-01 09:02:12', '2013-01-01 09:02:12', null, '福建省福州市闽侯县', '闽侯县', ',1150,1151,', '1151');
INSERT INTO `area` VALUES ('1158', '2013-01-01 09:02:12', '2013-01-01 09:02:12', null, '福建省福州市连江县', '连江县', ',1150,1151,', '1151');
INSERT INTO `area` VALUES ('1159', '2013-01-01 09:02:12', '2013-01-01 09:02:12', null, '福建省福州市罗源县', '罗源县', ',1150,1151,', '1151');
INSERT INTO `area` VALUES ('1160', '2013-01-01 09:02:12', '2013-01-01 09:02:12', null, '福建省福州市闽清县', '闽清县', ',1150,1151,', '1151');
INSERT INTO `area` VALUES ('1161', '2013-01-01 09:02:12', '2013-01-01 09:02:12', null, '福建省福州市永泰县', '永泰县', ',1150,1151,', '1151');
INSERT INTO `area` VALUES ('1162', '2013-01-01 09:02:12', '2013-01-01 09:02:12', null, '福建省福州市平潭县', '平潭县', ',1150,1151,', '1151');
INSERT INTO `area` VALUES ('1163', '2013-01-01 09:02:13', '2013-01-01 09:02:13', null, '福建省福州市福清市', '福清市', ',1150,1151,', '1151');
INSERT INTO `area` VALUES ('1164', '2013-01-01 09:02:13', '2013-01-01 09:02:13', null, '福建省福州市长乐市', '长乐市', ',1150,1151,', '1151');
INSERT INTO `area` VALUES ('1165', '2013-01-01 09:02:13', '2013-01-01 09:02:13', null, '福建省厦门市', '厦门市', ',1150,', '1150');
INSERT INTO `area` VALUES ('1166', '2013-01-01 09:02:13', '2013-01-01 09:02:13', null, '福建省厦门市思明区', '思明区', ',1150,1165,', '1165');
INSERT INTO `area` VALUES ('1167', '2013-01-01 09:02:13', '2013-01-01 09:02:13', null, '福建省厦门市海沧区', '海沧区', ',1150,1165,', '1165');
INSERT INTO `area` VALUES ('1168', '2013-01-01 09:02:13', '2013-01-01 09:02:13', null, '福建省厦门市湖里区', '湖里区', ',1150,1165,', '1165');
INSERT INTO `area` VALUES ('1169', '2013-01-01 09:02:13', '2013-01-01 09:02:13', null, '福建省厦门市集美区', '集美区', ',1150,1165,', '1165');
INSERT INTO `area` VALUES ('1170', '2013-01-01 09:02:13', '2013-01-01 09:02:13', null, '福建省厦门市同安区', '同安区', ',1150,1165,', '1165');
INSERT INTO `area` VALUES ('1171', '2013-01-01 09:02:13', '2013-01-01 09:02:13', null, '福建省厦门市翔安区', '翔安区', ',1150,1165,', '1165');
INSERT INTO `area` VALUES ('1172', '2013-01-01 09:02:13', '2013-01-01 09:02:13', null, '福建省莆田市', '莆田市', ',1150,', '1150');
INSERT INTO `area` VALUES ('1173', '2013-01-01 09:02:13', '2013-01-01 09:02:13', null, '福建省莆田市城厢区', '城厢区', ',1150,1172,', '1172');
INSERT INTO `area` VALUES ('1174', '2013-01-01 09:02:13', '2013-01-01 09:02:13', null, '福建省莆田市涵江区', '涵江区', ',1150,1172,', '1172');
INSERT INTO `area` VALUES ('1175', '2013-01-01 09:02:13', '2013-01-01 09:02:13', null, '福建省莆田市荔城区', '荔城区', ',1150,1172,', '1172');
INSERT INTO `area` VALUES ('1176', '2013-01-01 09:02:13', '2013-01-01 09:02:13', null, '福建省莆田市秀屿区', '秀屿区', ',1150,1172,', '1172');
INSERT INTO `area` VALUES ('1177', '2013-01-01 09:02:13', '2013-01-01 09:02:13', null, '福建省莆田市仙游县', '仙游县', ',1150,1172,', '1172');
INSERT INTO `area` VALUES ('1178', '2013-01-01 09:02:13', '2013-01-01 09:02:13', null, '福建省三明市', '三明市', ',1150,', '1150');
INSERT INTO `area` VALUES ('1179', '2013-01-01 09:02:13', '2013-01-01 09:02:13', null, '福建省三明市梅列区', '梅列区', ',1150,1178,', '1178');
INSERT INTO `area` VALUES ('1180', '2013-01-01 09:02:13', '2013-01-01 09:02:13', null, '福建省三明市三元区', '三元区', ',1150,1178,', '1178');
INSERT INTO `area` VALUES ('1181', '2013-01-01 09:02:13', '2013-01-01 09:02:13', null, '福建省三明市明溪县', '明溪县', ',1150,1178,', '1178');
INSERT INTO `area` VALUES ('1182', '2013-01-01 09:02:13', '2013-01-01 09:02:13', null, '福建省三明市清流县', '清流县', ',1150,1178,', '1178');
INSERT INTO `area` VALUES ('1183', '2013-01-01 09:02:13', '2013-01-01 09:02:13', null, '福建省三明市宁化县', '宁化县', ',1150,1178,', '1178');
INSERT INTO `area` VALUES ('1184', '2013-01-01 09:02:13', '2013-01-01 09:02:13', null, '福建省三明市大田县', '大田县', ',1150,1178,', '1178');
INSERT INTO `area` VALUES ('1185', '2013-01-01 09:02:13', '2013-01-01 09:02:13', null, '福建省三明市尤溪县', '尤溪县', ',1150,1178,', '1178');
INSERT INTO `area` VALUES ('1186', '2013-01-01 09:02:13', '2013-01-01 09:02:13', null, '福建省三明市沙县', '沙县', ',1150,1178,', '1178');
INSERT INTO `area` VALUES ('1187', '2013-01-01 09:02:13', '2013-01-01 09:02:13', null, '福建省三明市将乐县', '将乐县', ',1150,1178,', '1178');
INSERT INTO `area` VALUES ('1188', '2013-01-01 09:02:13', '2013-01-01 09:02:13', null, '福建省三明市泰宁县', '泰宁县', ',1150,1178,', '1178');
INSERT INTO `area` VALUES ('1189', '2013-01-01 09:02:13', '2013-01-01 09:02:13', null, '福建省三明市建宁县', '建宁县', ',1150,1178,', '1178');
INSERT INTO `area` VALUES ('1190', '2013-01-01 09:02:13', '2013-01-01 09:02:13', null, '福建省三明市永安市', '永安市', ',1150,1178,', '1178');
INSERT INTO `area` VALUES ('1191', '2013-01-01 09:02:13', '2013-01-01 09:02:13', null, '福建省泉州市', '泉州市', ',1150,', '1150');
INSERT INTO `area` VALUES ('1192', '2013-01-01 09:02:13', '2013-01-01 09:02:13', null, '福建省泉州市鲤城区', '鲤城区', ',1150,1191,', '1191');
INSERT INTO `area` VALUES ('1193', '2013-01-01 09:02:13', '2013-01-01 09:02:13', null, '福建省泉州市丰泽区', '丰泽区', ',1150,1191,', '1191');
INSERT INTO `area` VALUES ('1194', '2013-01-01 09:02:13', '2013-01-01 09:02:13', null, '福建省泉州市洛江区', '洛江区', ',1150,1191,', '1191');
INSERT INTO `area` VALUES ('1195', '2013-01-01 09:02:13', '2013-01-01 09:02:13', null, '福建省泉州市泉港区', '泉港区', ',1150,1191,', '1191');
INSERT INTO `area` VALUES ('1196', '2013-01-01 09:02:13', '2013-01-01 09:02:13', null, '福建省泉州市惠安县', '惠安县', ',1150,1191,', '1191');
INSERT INTO `area` VALUES ('1197', '2013-01-01 09:02:13', '2013-01-01 09:02:13', null, '福建省泉州市安溪县', '安溪县', ',1150,1191,', '1191');
INSERT INTO `area` VALUES ('1198', '2013-01-01 09:02:13', '2013-01-01 09:02:13', null, '福建省泉州市永春县', '永春县', ',1150,1191,', '1191');
INSERT INTO `area` VALUES ('1199', '2013-01-01 09:02:13', '2013-01-01 09:02:13', null, '福建省泉州市德化县', '德化县', ',1150,1191,', '1191');
INSERT INTO `area` VALUES ('1200', '2013-01-01 09:02:13', '2013-01-01 09:02:13', null, '福建省泉州市金门县', '金门县', ',1150,1191,', '1191');
INSERT INTO `area` VALUES ('1201', '2013-01-01 09:02:13', '2013-01-01 09:02:13', null, '福建省泉州市石狮市', '石狮市', ',1150,1191,', '1191');
INSERT INTO `area` VALUES ('1202', '2013-01-01 09:02:13', '2013-01-01 09:02:13', null, '福建省泉州市晋江市', '晋江市', ',1150,1191,', '1191');
INSERT INTO `area` VALUES ('1203', '2013-01-01 09:02:13', '2013-01-01 09:02:13', null, '福建省泉州市南安市', '南安市', ',1150,1191,', '1191');
INSERT INTO `area` VALUES ('1204', '2013-01-01 09:02:13', '2013-01-01 09:02:13', null, '福建省漳州市', '漳州市', ',1150,', '1150');
INSERT INTO `area` VALUES ('1205', '2013-01-01 09:02:13', '2013-01-01 09:02:13', null, '福建省漳州市芗城区', '芗城区', ',1150,1204,', '1204');
INSERT INTO `area` VALUES ('1206', '2013-01-01 09:02:14', '2013-01-01 09:02:14', null, '福建省漳州市龙文区', '龙文区', ',1150,1204,', '1204');
INSERT INTO `area` VALUES ('1207', '2013-01-01 09:02:14', '2013-01-01 09:02:14', null, '福建省漳州市云霄县', '云霄县', ',1150,1204,', '1204');
INSERT INTO `area` VALUES ('1208', '2013-01-01 09:02:14', '2013-01-01 09:02:14', null, '福建省漳州市漳浦县', '漳浦县', ',1150,1204,', '1204');
INSERT INTO `area` VALUES ('1209', '2013-01-01 09:02:14', '2013-01-01 09:02:14', null, '福建省漳州市诏安县', '诏安县', ',1150,1204,', '1204');
INSERT INTO `area` VALUES ('1210', '2013-01-01 09:02:14', '2013-01-01 09:02:14', null, '福建省漳州市长泰县', '长泰县', ',1150,1204,', '1204');
INSERT INTO `area` VALUES ('1211', '2013-01-01 09:02:14', '2013-01-01 09:02:14', null, '福建省漳州市东山县', '东山县', ',1150,1204,', '1204');
INSERT INTO `area` VALUES ('1212', '2013-01-01 09:02:14', '2013-01-01 09:02:14', null, '福建省漳州市南靖县', '南靖县', ',1150,1204,', '1204');
INSERT INTO `area` VALUES ('1213', '2013-01-01 09:02:14', '2013-01-01 09:02:14', null, '福建省漳州市平和县', '平和县', ',1150,1204,', '1204');
INSERT INTO `area` VALUES ('1214', '2013-01-01 09:02:14', '2013-01-01 09:02:14', null, '福建省漳州市华安县', '华安县', ',1150,1204,', '1204');
INSERT INTO `area` VALUES ('1215', '2013-01-01 09:02:14', '2013-01-01 09:02:14', null, '福建省漳州市龙海市', '龙海市', ',1150,1204,', '1204');
INSERT INTO `area` VALUES ('1216', '2013-01-01 09:02:14', '2013-01-01 09:02:14', null, '福建省南平市', '南平市', ',1150,', '1150');
INSERT INTO `area` VALUES ('1217', '2013-01-01 09:02:14', '2013-01-01 09:02:14', null, '福建省南平市延平区', '延平区', ',1150,1216,', '1216');
INSERT INTO `area` VALUES ('1218', '2013-01-01 09:02:14', '2013-01-01 09:02:14', null, '福建省南平市顺昌县', '顺昌县', ',1150,1216,', '1216');
INSERT INTO `area` VALUES ('1219', '2013-01-01 09:02:14', '2013-01-01 09:02:14', null, '福建省南平市浦城县', '浦城县', ',1150,1216,', '1216');
INSERT INTO `area` VALUES ('1220', '2013-01-01 09:02:14', '2013-01-01 09:02:14', null, '福建省南平市光泽县', '光泽县', ',1150,1216,', '1216');
INSERT INTO `area` VALUES ('1221', '2013-01-01 09:02:14', '2013-01-01 09:02:14', null, '福建省南平市松溪县', '松溪县', ',1150,1216,', '1216');
INSERT INTO `area` VALUES ('1222', '2013-01-01 09:02:14', '2013-01-01 09:02:14', null, '福建省南平市政和县', '政和县', ',1150,1216,', '1216');
INSERT INTO `area` VALUES ('1223', '2013-01-01 09:02:14', '2013-01-01 09:02:14', null, '福建省南平市邵武市', '邵武市', ',1150,1216,', '1216');
INSERT INTO `area` VALUES ('1224', '2013-01-01 09:02:14', '2013-01-01 09:02:14', null, '福建省南平市武夷山市', '武夷山市', ',1150,1216,', '1216');
INSERT INTO `area` VALUES ('1225', '2013-01-01 09:02:14', '2013-01-01 09:02:14', null, '福建省南平市建瓯市', '建瓯市', ',1150,1216,', '1216');
INSERT INTO `area` VALUES ('1226', '2013-01-01 09:02:14', '2013-01-01 09:02:14', null, '福建省南平市建阳市', '建阳市', ',1150,1216,', '1216');
INSERT INTO `area` VALUES ('1227', '2013-01-01 09:02:14', '2013-01-01 09:02:14', null, '福建省龙岩市', '龙岩市', ',1150,', '1150');
INSERT INTO `area` VALUES ('1228', '2013-01-01 09:02:14', '2013-01-01 09:02:14', null, '福建省龙岩市新罗区', '新罗区', ',1150,1227,', '1227');
INSERT INTO `area` VALUES ('1229', '2013-01-01 09:02:14', '2013-01-01 09:02:14', null, '福建省龙岩市长汀县', '长汀县', ',1150,1227,', '1227');
INSERT INTO `area` VALUES ('1230', '2013-01-01 09:02:14', '2013-01-01 09:02:14', null, '福建省龙岩市永定县', '永定县', ',1150,1227,', '1227');
INSERT INTO `area` VALUES ('1231', '2013-01-01 09:02:14', '2013-01-01 09:02:14', null, '福建省龙岩市上杭县', '上杭县', ',1150,1227,', '1227');
INSERT INTO `area` VALUES ('1232', '2013-01-01 09:02:14', '2013-01-01 09:02:14', null, '福建省龙岩市武平县', '武平县', ',1150,1227,', '1227');
INSERT INTO `area` VALUES ('1233', '2013-01-01 09:02:14', '2013-01-01 09:02:14', null, '福建省龙岩市连城县', '连城县', ',1150,1227,', '1227');
INSERT INTO `area` VALUES ('1234', '2013-01-01 09:02:14', '2013-01-01 09:02:14', null, '福建省龙岩市漳平市', '漳平市', ',1150,1227,', '1227');
INSERT INTO `area` VALUES ('1235', '2013-01-01 09:02:14', '2013-01-01 09:02:14', null, '福建省宁德市', '宁德市', ',1150,', '1150');
INSERT INTO `area` VALUES ('1236', '2013-01-01 09:02:14', '2013-01-01 09:02:14', null, '福建省宁德市蕉城区', '蕉城区', ',1150,1235,', '1235');
INSERT INTO `area` VALUES ('1237', '2013-01-01 09:02:14', '2013-01-01 09:02:14', null, '福建省宁德市霞浦县', '霞浦县', ',1150,1235,', '1235');
INSERT INTO `area` VALUES ('1238', '2013-01-01 09:02:14', '2013-01-01 09:02:14', null, '福建省宁德市古田县', '古田县', ',1150,1235,', '1235');
INSERT INTO `area` VALUES ('1239', '2013-01-01 09:02:14', '2013-01-01 09:02:14', null, '福建省宁德市屏南县', '屏南县', ',1150,1235,', '1235');
INSERT INTO `area` VALUES ('1240', '2013-01-01 09:02:14', '2013-01-01 09:02:14', null, '福建省宁德市寿宁县', '寿宁县', ',1150,1235,', '1235');
INSERT INTO `area` VALUES ('1241', '2013-01-01 09:02:14', '2013-01-01 09:02:14', null, '福建省宁德市周宁县', '周宁县', ',1150,1235,', '1235');
INSERT INTO `area` VALUES ('1242', '2013-01-01 09:02:14', '2013-01-01 09:02:14', null, '福建省宁德市柘荣县', '柘荣县', ',1150,1235,', '1235');
INSERT INTO `area` VALUES ('1243', '2013-01-01 09:02:14', '2013-01-01 09:02:14', null, '福建省宁德市福安市', '福安市', ',1150,1235,', '1235');
INSERT INTO `area` VALUES ('1244', '2013-01-01 09:02:14', '2013-01-01 09:02:14', null, '福建省宁德市福鼎市', '福鼎市', ',1150,1235,', '1235');
INSERT INTO `area` VALUES ('1245', '2013-01-01 09:02:14', '2013-01-01 09:02:14', null, '江西省', '江西省', ',', null);
INSERT INTO `area` VALUES ('1246', '2013-01-01 09:02:14', '2013-01-01 09:02:14', null, '江西省南昌市', '南昌市', ',1245,', '1245');
INSERT INTO `area` VALUES ('1247', '2013-01-01 09:02:14', '2013-01-01 09:02:14', null, '江西省南昌市东湖区', '东湖区', ',1245,1246,', '1246');
INSERT INTO `area` VALUES ('1248', '2013-01-01 09:02:14', '2013-01-01 09:02:14', null, '江西省南昌市西湖区', '西湖区', ',1245,1246,', '1246');
INSERT INTO `area` VALUES ('1249', '2013-01-01 09:02:14', '2013-01-01 09:02:14', null, '江西省南昌市青云谱区', '青云谱区', ',1245,1246,', '1246');
INSERT INTO `area` VALUES ('1250', '2013-01-01 09:02:14', '2013-01-01 09:02:14', null, '江西省南昌市湾里区', '湾里区', ',1245,1246,', '1246');
INSERT INTO `area` VALUES ('1251', '2013-01-01 09:02:15', '2013-01-01 09:02:15', null, '江西省南昌市青山湖区', '青山湖区', ',1245,1246,', '1246');
INSERT INTO `area` VALUES ('1252', '2013-01-01 09:02:15', '2013-01-01 09:02:15', null, '江西省南昌市南昌县', '南昌县', ',1245,1246,', '1246');
INSERT INTO `area` VALUES ('1253', '2013-01-01 09:02:15', '2013-01-01 09:02:15', null, '江西省南昌市新建县', '新建县', ',1245,1246,', '1246');
INSERT INTO `area` VALUES ('1254', '2013-01-01 09:02:15', '2013-01-01 09:02:15', null, '江西省南昌市安义县', '安义县', ',1245,1246,', '1246');
INSERT INTO `area` VALUES ('1255', '2013-01-01 09:02:15', '2013-01-01 09:02:15', null, '江西省南昌市进贤县', '进贤县', ',1245,1246,', '1246');
INSERT INTO `area` VALUES ('1256', '2013-01-01 09:02:15', '2013-01-01 09:02:15', null, '江西省景德镇市', '景德镇市', ',1245,', '1245');
INSERT INTO `area` VALUES ('1257', '2013-01-01 09:02:15', '2013-01-01 09:02:15', null, '江西省景德镇市昌江区', '昌江区', ',1245,1256,', '1256');
INSERT INTO `area` VALUES ('1258', '2013-01-01 09:02:15', '2013-01-01 09:02:15', null, '江西省景德镇市珠山区', '珠山区', ',1245,1256,', '1256');
INSERT INTO `area` VALUES ('1259', '2013-01-01 09:02:15', '2013-01-01 09:02:15', null, '江西省景德镇市浮梁县', '浮梁县', ',1245,1256,', '1256');
INSERT INTO `area` VALUES ('1260', '2013-01-01 09:02:15', '2013-01-01 09:02:15', null, '江西省景德镇市乐平市', '乐平市', ',1245,1256,', '1256');
INSERT INTO `area` VALUES ('1261', '2013-01-01 09:02:15', '2013-01-01 09:02:15', null, '江西省萍乡市', '萍乡市', ',1245,', '1245');
INSERT INTO `area` VALUES ('1262', '2013-01-01 09:02:15', '2013-01-01 09:02:15', null, '江西省萍乡市安源区', '安源区', ',1245,1261,', '1261');
INSERT INTO `area` VALUES ('1263', '2013-01-01 09:02:15', '2013-01-01 09:02:15', null, '江西省萍乡市湘东区', '湘东区', ',1245,1261,', '1261');
INSERT INTO `area` VALUES ('1264', '2013-01-01 09:02:15', '2013-01-01 09:02:15', null, '江西省萍乡市莲花县', '莲花县', ',1245,1261,', '1261');
INSERT INTO `area` VALUES ('1265', '2013-01-01 09:02:15', '2013-01-01 09:02:15', null, '江西省萍乡市上栗县', '上栗县', ',1245,1261,', '1261');
INSERT INTO `area` VALUES ('1266', '2013-01-01 09:02:15', '2013-01-01 09:02:15', null, '江西省萍乡市芦溪县', '芦溪县', ',1245,1261,', '1261');
INSERT INTO `area` VALUES ('1267', '2013-01-01 09:02:15', '2013-01-01 09:02:15', null, '江西省九江市', '九江市', ',1245,', '1245');
INSERT INTO `area` VALUES ('1268', '2013-01-01 09:02:15', '2013-01-01 09:02:15', null, '江西省九江市庐山区', '庐山区', ',1245,1267,', '1267');
INSERT INTO `area` VALUES ('1269', '2013-01-01 09:02:15', '2013-01-01 09:02:15', null, '江西省九江市浔阳区', '浔阳区', ',1245,1267,', '1267');
INSERT INTO `area` VALUES ('1270', '2013-01-01 09:02:15', '2013-01-01 09:02:15', null, '江西省九江市九江县', '九江县', ',1245,1267,', '1267');
INSERT INTO `area` VALUES ('1271', '2013-01-01 09:02:15', '2013-01-01 09:02:15', null, '江西省九江市武宁县', '武宁县', ',1245,1267,', '1267');
INSERT INTO `area` VALUES ('1272', '2013-01-01 09:02:15', '2013-01-01 09:02:15', null, '江西省九江市修水县', '修水县', ',1245,1267,', '1267');
INSERT INTO `area` VALUES ('1273', '2013-01-01 09:02:15', '2013-01-01 09:02:15', null, '江西省九江市永修县', '永修县', ',1245,1267,', '1267');
INSERT INTO `area` VALUES ('1274', '2013-01-01 09:02:15', '2013-01-01 09:02:15', null, '江西省九江市德安县', '德安县', ',1245,1267,', '1267');
INSERT INTO `area` VALUES ('1275', '2013-01-01 09:02:15', '2013-01-01 09:02:15', null, '江西省九江市星子县', '星子县', ',1245,1267,', '1267');
INSERT INTO `area` VALUES ('1276', '2013-01-01 09:02:15', '2013-01-01 09:02:15', null, '江西省九江市都昌县', '都昌县', ',1245,1267,', '1267');
INSERT INTO `area` VALUES ('1277', '2013-01-01 09:02:15', '2013-01-01 09:02:15', null, '江西省九江市湖口县', '湖口县', ',1245,1267,', '1267');
INSERT INTO `area` VALUES ('1278', '2013-01-01 09:02:15', '2013-01-01 09:02:15', null, '江西省九江市彭泽县', '彭泽县', ',1245,1267,', '1267');
INSERT INTO `area` VALUES ('1279', '2013-01-01 09:02:15', '2013-01-01 09:02:15', null, '江西省九江市瑞昌市', '瑞昌市', ',1245,1267,', '1267');
INSERT INTO `area` VALUES ('1280', '2013-01-01 09:02:15', '2013-01-01 09:02:15', null, '江西省九江市共青城市', '共青城市', ',1245,1267,', '1267');
INSERT INTO `area` VALUES ('1281', '2013-01-01 09:02:15', '2013-01-01 09:02:15', null, '江西省新余市', '新余市', ',1245,', '1245');
INSERT INTO `area` VALUES ('1282', '2013-01-01 09:02:15', '2013-01-01 09:02:15', null, '江西省新余市渝水区', '渝水区', ',1245,1281,', '1281');
INSERT INTO `area` VALUES ('1283', '2013-01-01 09:02:15', '2013-01-01 09:02:15', null, '江西省新余市分宜县', '分宜县', ',1245,1281,', '1281');
INSERT INTO `area` VALUES ('1284', '2013-01-01 09:02:15', '2013-01-01 09:02:15', null, '江西省鹰潭市', '鹰潭市', ',1245,', '1245');
INSERT INTO `area` VALUES ('1285', '2013-01-01 09:02:15', '2013-01-01 09:02:15', null, '江西省鹰潭市月湖区', '月湖区', ',1245,1284,', '1284');
INSERT INTO `area` VALUES ('1286', '2013-01-01 09:02:15', '2013-01-01 09:02:15', null, '江西省鹰潭市余江县', '余江县', ',1245,1284,', '1284');
INSERT INTO `area` VALUES ('1287', '2013-01-01 09:02:15', '2013-01-01 09:02:15', null, '江西省鹰潭市贵溪市', '贵溪市', ',1245,1284,', '1284');
INSERT INTO `area` VALUES ('1288', '2013-01-01 09:02:15', '2013-01-01 09:02:15', null, '江西省赣州市', '赣州市', ',1245,', '1245');
INSERT INTO `area` VALUES ('1289', '2013-01-01 09:02:15', '2013-01-01 09:02:15', null, '江西省赣州市章贡区', '章贡区', ',1245,1288,', '1288');
INSERT INTO `area` VALUES ('1290', '2013-01-01 09:02:15', '2013-01-01 09:02:15', null, '江西省赣州市赣县', '赣县', ',1245,1288,', '1288');
INSERT INTO `area` VALUES ('1291', '2013-01-01 09:02:15', '2013-01-01 09:02:15', null, '江西省赣州市信丰县', '信丰县', ',1245,1288,', '1288');
INSERT INTO `area` VALUES ('1292', '2013-01-01 09:02:15', '2013-01-01 09:02:15', null, '江西省赣州市大余县', '大余县', ',1245,1288,', '1288');
INSERT INTO `area` VALUES ('1293', '2013-01-01 09:02:15', '2013-01-01 09:02:15', null, '江西省赣州市上犹县', '上犹县', ',1245,1288,', '1288');
INSERT INTO `area` VALUES ('1294', '2013-01-01 09:02:16', '2013-01-01 09:02:16', null, '江西省赣州市崇义县', '崇义县', ',1245,1288,', '1288');
INSERT INTO `area` VALUES ('1295', '2013-01-01 09:02:16', '2013-01-01 09:02:16', null, '江西省赣州市安远县', '安远县', ',1245,1288,', '1288');
INSERT INTO `area` VALUES ('1296', '2013-01-01 09:02:16', '2013-01-01 09:02:16', null, '江西省赣州市龙南县', '龙南县', ',1245,1288,', '1288');
INSERT INTO `area` VALUES ('1297', '2013-01-01 09:02:16', '2013-01-01 09:02:16', null, '江西省赣州市定南县', '定南县', ',1245,1288,', '1288');
INSERT INTO `area` VALUES ('1298', '2013-01-01 09:02:16', '2013-01-01 09:02:16', null, '江西省赣州市全南县', '全南县', ',1245,1288,', '1288');
INSERT INTO `area` VALUES ('1299', '2013-01-01 09:02:16', '2013-01-01 09:02:16', null, '江西省赣州市宁都县', '宁都县', ',1245,1288,', '1288');
INSERT INTO `area` VALUES ('1300', '2013-01-01 09:02:16', '2013-01-01 09:02:16', null, '江西省赣州市于都县', '于都县', ',1245,1288,', '1288');
INSERT INTO `area` VALUES ('1301', '2013-01-01 09:02:16', '2013-01-01 09:02:16', null, '江西省赣州市兴国县', '兴国县', ',1245,1288,', '1288');
INSERT INTO `area` VALUES ('1302', '2013-01-01 09:02:16', '2013-01-01 09:02:16', null, '江西省赣州市会昌县', '会昌县', ',1245,1288,', '1288');
INSERT INTO `area` VALUES ('1303', '2013-01-01 09:02:16', '2013-01-01 09:02:16', null, '江西省赣州市寻乌县', '寻乌县', ',1245,1288,', '1288');
INSERT INTO `area` VALUES ('1304', '2013-01-01 09:02:16', '2013-01-01 09:02:16', null, '江西省赣州市石城县', '石城县', ',1245,1288,', '1288');
INSERT INTO `area` VALUES ('1305', '2013-01-01 09:02:16', '2013-01-01 09:02:16', null, '江西省赣州市瑞金市', '瑞金市', ',1245,1288,', '1288');
INSERT INTO `area` VALUES ('1306', '2013-01-01 09:02:16', '2013-01-01 09:02:16', null, '江西省赣州市南康市', '南康市', ',1245,1288,', '1288');
INSERT INTO `area` VALUES ('1307', '2013-01-01 09:02:16', '2013-01-01 09:02:16', null, '江西省吉安市', '吉安市', ',1245,', '1245');
INSERT INTO `area` VALUES ('1308', '2013-01-01 09:02:16', '2013-01-01 09:02:16', null, '江西省吉安市吉州区', '吉州区', ',1245,1307,', '1307');
INSERT INTO `area` VALUES ('1309', '2013-01-01 09:02:16', '2013-01-01 09:02:16', null, '江西省吉安市青原区', '青原区', ',1245,1307,', '1307');
INSERT INTO `area` VALUES ('1310', '2013-01-01 09:02:16', '2013-01-01 09:02:16', null, '江西省吉安市吉安县', '吉安县', ',1245,1307,', '1307');
INSERT INTO `area` VALUES ('1311', '2013-01-01 09:02:16', '2013-01-01 09:02:16', null, '江西省吉安市吉水县', '吉水县', ',1245,1307,', '1307');
INSERT INTO `area` VALUES ('1312', '2013-01-01 09:02:16', '2013-01-01 09:02:16', null, '江西省吉安市峡江县', '峡江县', ',1245,1307,', '1307');
INSERT INTO `area` VALUES ('1313', '2013-01-01 09:02:16', '2013-01-01 09:02:16', null, '江西省吉安市新干县', '新干县', ',1245,1307,', '1307');
INSERT INTO `area` VALUES ('1314', '2013-01-01 09:02:16', '2013-01-01 09:02:16', null, '江西省吉安市永丰县', '永丰县', ',1245,1307,', '1307');
INSERT INTO `area` VALUES ('1315', '2013-01-01 09:02:16', '2013-01-01 09:02:16', null, '江西省吉安市泰和县', '泰和县', ',1245,1307,', '1307');
INSERT INTO `area` VALUES ('1316', '2013-01-01 09:02:16', '2013-01-01 09:02:16', null, '江西省吉安市遂川县', '遂川县', ',1245,1307,', '1307');
INSERT INTO `area` VALUES ('1317', '2013-01-01 09:02:16', '2013-01-01 09:02:16', null, '江西省吉安市万安县', '万安县', ',1245,1307,', '1307');
INSERT INTO `area` VALUES ('1318', '2013-01-01 09:02:16', '2013-01-01 09:02:16', null, '江西省吉安市安福县', '安福县', ',1245,1307,', '1307');
INSERT INTO `area` VALUES ('1319', '2013-01-01 09:02:16', '2013-01-01 09:02:16', null, '江西省吉安市永新县', '永新县', ',1245,1307,', '1307');
INSERT INTO `area` VALUES ('1320', '2013-01-01 09:02:16', '2013-01-01 09:02:16', null, '江西省吉安市井冈山市', '井冈山市', ',1245,1307,', '1307');
INSERT INTO `area` VALUES ('1321', '2013-01-01 09:02:16', '2013-01-01 09:02:16', null, '江西省宜春市', '宜春市', ',1245,', '1245');
INSERT INTO `area` VALUES ('1322', '2013-01-01 09:02:16', '2013-01-01 09:02:16', null, '江西省宜春市袁州区', '袁州区', ',1245,1321,', '1321');
INSERT INTO `area` VALUES ('1323', '2013-01-01 09:02:16', '2013-01-01 09:02:16', null, '江西省宜春市奉新县', '奉新县', ',1245,1321,', '1321');
INSERT INTO `area` VALUES ('1324', '2013-01-01 09:02:16', '2013-01-01 09:02:16', null, '江西省宜春市万载县', '万载县', ',1245,1321,', '1321');
INSERT INTO `area` VALUES ('1325', '2013-01-01 09:02:16', '2013-01-01 09:02:16', null, '江西省宜春市上高县', '上高县', ',1245,1321,', '1321');
INSERT INTO `area` VALUES ('1326', '2013-01-01 09:02:16', '2013-01-01 09:02:16', null, '江西省宜春市宜丰县', '宜丰县', ',1245,1321,', '1321');
INSERT INTO `area` VALUES ('1327', '2013-01-01 09:02:16', '2013-01-01 09:02:16', null, '江西省宜春市靖安县', '靖安县', ',1245,1321,', '1321');
INSERT INTO `area` VALUES ('1328', '2013-01-01 09:02:16', '2013-01-01 09:02:16', null, '江西省宜春市铜鼓县', '铜鼓县', ',1245,1321,', '1321');
INSERT INTO `area` VALUES ('1329', '2013-01-01 09:02:16', '2013-01-01 09:02:16', null, '江西省宜春市丰城市', '丰城市', ',1245,1321,', '1321');
INSERT INTO `area` VALUES ('1330', '2013-01-01 09:02:16', '2013-01-01 09:02:16', null, '江西省宜春市樟树市', '樟树市', ',1245,1321,', '1321');
INSERT INTO `area` VALUES ('1331', '2013-01-01 09:02:16', '2013-01-01 09:02:16', null, '江西省宜春市高安市', '高安市', ',1245,1321,', '1321');
INSERT INTO `area` VALUES ('1332', '2013-01-01 09:02:16', '2013-01-01 09:02:16', null, '江西省抚州市', '抚州市', ',1245,', '1245');
INSERT INTO `area` VALUES ('1333', '2013-01-01 09:02:16', '2013-01-01 09:02:16', null, '江西省抚州市临川区', '临川区', ',1245,1332,', '1332');
INSERT INTO `area` VALUES ('1334', '2013-01-01 09:02:17', '2013-01-01 09:02:17', null, '江西省抚州市南城县', '南城县', ',1245,1332,', '1332');
INSERT INTO `area` VALUES ('1335', '2013-01-01 09:02:17', '2013-01-01 09:02:17', null, '江西省抚州市黎川县', '黎川县', ',1245,1332,', '1332');
INSERT INTO `area` VALUES ('1336', '2013-01-01 09:02:17', '2013-01-01 09:02:17', null, '江西省抚州市南丰县', '南丰县', ',1245,1332,', '1332');
INSERT INTO `area` VALUES ('1337', '2013-01-01 09:02:17', '2013-01-01 09:02:17', null, '江西省抚州市崇仁县', '崇仁县', ',1245,1332,', '1332');
INSERT INTO `area` VALUES ('1338', '2013-01-01 09:02:17', '2013-01-01 09:02:17', null, '江西省抚州市乐安县', '乐安县', ',1245,1332,', '1332');
INSERT INTO `area` VALUES ('1339', '2013-01-01 09:02:17', '2013-01-01 09:02:17', null, '江西省抚州市宜黄县', '宜黄县', ',1245,1332,', '1332');
INSERT INTO `area` VALUES ('1340', '2013-01-01 09:02:17', '2013-01-01 09:02:17', null, '江西省抚州市金溪县', '金溪县', ',1245,1332,', '1332');
INSERT INTO `area` VALUES ('1341', '2013-01-01 09:02:17', '2013-01-01 09:02:17', null, '江西省抚州市资溪县', '资溪县', ',1245,1332,', '1332');
INSERT INTO `area` VALUES ('1342', '2013-01-01 09:02:17', '2013-01-01 09:02:17', null, '江西省抚州市东乡县', '东乡县', ',1245,1332,', '1332');
INSERT INTO `area` VALUES ('1343', '2013-01-01 09:02:17', '2013-01-01 09:02:17', null, '江西省抚州市广昌县', '广昌县', ',1245,1332,', '1332');
INSERT INTO `area` VALUES ('1344', '2013-01-01 09:02:17', '2013-01-01 09:02:17', null, '江西省上饶市', '上饶市', ',1245,', '1245');
INSERT INTO `area` VALUES ('1345', '2013-01-01 09:02:17', '2013-01-01 09:02:17', null, '江西省上饶市信州区', '信州区', ',1245,1344,', '1344');
INSERT INTO `area` VALUES ('1346', '2013-01-01 09:02:17', '2013-01-01 09:02:17', null, '江西省上饶市上饶县', '上饶县', ',1245,1344,', '1344');
INSERT INTO `area` VALUES ('1347', '2013-01-01 09:02:17', '2013-01-01 09:02:17', null, '江西省上饶市广丰县', '广丰县', ',1245,1344,', '1344');
INSERT INTO `area` VALUES ('1348', '2013-01-01 09:02:17', '2013-01-01 09:02:17', null, '江西省上饶市玉山县', '玉山县', ',1245,1344,', '1344');
INSERT INTO `area` VALUES ('1349', '2013-01-01 09:02:17', '2013-01-01 09:02:17', null, '江西省上饶市铅山县', '铅山县', ',1245,1344,', '1344');
INSERT INTO `area` VALUES ('1350', '2013-01-01 09:02:17', '2013-01-01 09:02:17', null, '江西省上饶市横峰县', '横峰县', ',1245,1344,', '1344');
INSERT INTO `area` VALUES ('1351', '2013-01-01 09:02:17', '2013-01-01 09:02:17', null, '江西省上饶市弋阳县', '弋阳县', ',1245,1344,', '1344');
INSERT INTO `area` VALUES ('1352', '2013-01-01 09:02:17', '2013-01-01 09:02:17', null, '江西省上饶市余干县', '余干县', ',1245,1344,', '1344');
INSERT INTO `area` VALUES ('1353', '2013-01-01 09:02:17', '2013-01-01 09:02:17', null, '江西省上饶市鄱阳县', '鄱阳县', ',1245,1344,', '1344');
INSERT INTO `area` VALUES ('1354', '2013-01-01 09:02:17', '2013-01-01 09:02:17', null, '江西省上饶市万年县', '万年县', ',1245,1344,', '1344');
INSERT INTO `area` VALUES ('1355', '2013-01-01 09:02:17', '2013-01-01 09:02:17', null, '江西省上饶市婺源县', '婺源县', ',1245,1344,', '1344');
INSERT INTO `area` VALUES ('1356', '2013-01-01 09:02:17', '2013-01-01 09:02:17', null, '江西省上饶市德兴市', '德兴市', ',1245,1344,', '1344');
INSERT INTO `area` VALUES ('1357', '2013-01-01 09:02:17', '2013-01-01 09:02:17', null, '山东省', '山东省', ',', null);
INSERT INTO `area` VALUES ('1358', '2013-01-01 09:02:17', '2013-01-01 09:02:17', null, '山东省济南市', '济南市', ',1357,', '1357');
INSERT INTO `area` VALUES ('1359', '2013-01-01 09:02:17', '2013-01-01 09:02:17', null, '山东省济南市历下区', '历下区', ',1357,1358,', '1358');
INSERT INTO `area` VALUES ('1360', '2013-01-01 09:02:17', '2013-01-01 09:02:17', null, '山东省济南市市中区', '市中区', ',1357,1358,', '1358');
INSERT INTO `area` VALUES ('1361', '2013-01-01 09:02:17', '2013-01-01 09:02:17', null, '山东省济南市槐荫区', '槐荫区', ',1357,1358,', '1358');
INSERT INTO `area` VALUES ('1362', '2013-01-01 09:02:17', '2013-01-01 09:02:17', null, '山东省济南市天桥区', '天桥区', ',1357,1358,', '1358');
INSERT INTO `area` VALUES ('1363', '2013-01-01 09:02:17', '2013-01-01 09:02:17', null, '山东省济南市历城区', '历城区', ',1357,1358,', '1358');
INSERT INTO `area` VALUES ('1364', '2013-01-01 09:02:17', '2013-01-01 09:02:17', null, '山东省济南市长清区', '长清区', ',1357,1358,', '1358');
INSERT INTO `area` VALUES ('1365', '2013-01-01 09:02:17', '2013-01-01 09:02:17', null, '山东省济南市平阴县', '平阴县', ',1357,1358,', '1358');
INSERT INTO `area` VALUES ('1366', '2013-01-01 09:02:17', '2013-01-01 09:02:17', null, '山东省济南市济阳县', '济阳县', ',1357,1358,', '1358');
INSERT INTO `area` VALUES ('1367', '2013-01-01 09:02:17', '2013-01-01 09:02:17', null, '山东省济南市商河县', '商河县', ',1357,1358,', '1358');
INSERT INTO `area` VALUES ('1368', '2013-01-01 09:02:17', '2013-01-01 09:02:17', null, '山东省济南市章丘市', '章丘市', ',1357,1358,', '1358');
INSERT INTO `area` VALUES ('1369', '2013-01-01 09:02:17', '2013-01-01 09:02:17', null, '山东省青岛市', '青岛市', ',1357,', '1357');
INSERT INTO `area` VALUES ('1370', '2013-01-01 09:02:17', '2013-01-01 09:02:17', null, '山东省青岛市市南区', '市南区', ',1357,1369,', '1369');
INSERT INTO `area` VALUES ('1371', '2013-01-01 09:02:17', '2013-01-01 09:02:17', null, '山东省青岛市市北区', '市北区', ',1357,1369,', '1369');
INSERT INTO `area` VALUES ('1372', '2013-01-01 09:02:17', '2013-01-01 09:02:17', null, '山东省青岛市四方区', '四方区', ',1357,1369,', '1369');
INSERT INTO `area` VALUES ('1373', '2013-01-01 09:02:17', '2013-01-01 09:02:17', null, '山东省青岛市黄岛区', '黄岛区', ',1357,1369,', '1369');
INSERT INTO `area` VALUES ('1374', '2013-01-01 09:02:18', '2013-01-01 09:02:18', null, '山东省青岛市崂山区', '崂山区', ',1357,1369,', '1369');
INSERT INTO `area` VALUES ('1375', '2013-01-01 09:02:18', '2013-01-01 09:02:18', null, '山东省青岛市李沧区', '李沧区', ',1357,1369,', '1369');
INSERT INTO `area` VALUES ('1376', '2013-01-01 09:02:18', '2013-01-01 09:02:18', null, '山东省青岛市城阳区', '城阳区', ',1357,1369,', '1369');
INSERT INTO `area` VALUES ('1377', '2013-01-01 09:02:18', '2013-01-01 09:02:18', null, '山东省青岛市胶州市', '胶州市', ',1357,1369,', '1369');
INSERT INTO `area` VALUES ('1378', '2013-01-01 09:02:18', '2013-01-01 09:02:18', null, '山东省青岛市即墨市', '即墨市', ',1357,1369,', '1369');
INSERT INTO `area` VALUES ('1379', '2013-01-01 09:02:18', '2013-01-01 09:02:18', null, '山东省青岛市平度市', '平度市', ',1357,1369,', '1369');
INSERT INTO `area` VALUES ('1380', '2013-01-01 09:02:18', '2013-01-01 09:02:18', null, '山东省青岛市胶南市', '胶南市', ',1357,1369,', '1369');
INSERT INTO `area` VALUES ('1381', '2013-01-01 09:02:18', '2013-01-01 09:02:18', null, '山东省青岛市莱西市', '莱西市', ',1357,1369,', '1369');
INSERT INTO `area` VALUES ('1382', '2013-01-01 09:02:18', '2013-01-01 09:02:18', null, '山东省淄博市', '淄博市', ',1357,', '1357');
INSERT INTO `area` VALUES ('1383', '2013-01-01 09:02:18', '2013-01-01 09:02:18', null, '山东省淄博市淄川区', '淄川区', ',1357,1382,', '1382');
INSERT INTO `area` VALUES ('1384', '2013-01-01 09:02:18', '2013-01-01 09:02:18', null, '山东省淄博市张店区', '张店区', ',1357,1382,', '1382');
INSERT INTO `area` VALUES ('1385', '2013-01-01 09:02:18', '2013-01-01 09:02:18', null, '山东省淄博市博山区', '博山区', ',1357,1382,', '1382');
INSERT INTO `area` VALUES ('1386', '2013-01-01 09:02:18', '2013-01-01 09:02:18', null, '山东省淄博市临淄区', '临淄区', ',1357,1382,', '1382');
INSERT INTO `area` VALUES ('1387', '2013-01-01 09:02:18', '2013-01-01 09:02:18', null, '山东省淄博市周村区', '周村区', ',1357,1382,', '1382');
INSERT INTO `area` VALUES ('1388', '2013-01-01 09:02:18', '2013-01-01 09:02:18', null, '山东省淄博市桓台县', '桓台县', ',1357,1382,', '1382');
INSERT INTO `area` VALUES ('1389', '2013-01-01 09:02:18', '2013-01-01 09:02:18', null, '山东省淄博市高青县', '高青县', ',1357,1382,', '1382');
INSERT INTO `area` VALUES ('1390', '2013-01-01 09:02:18', '2013-01-01 09:02:18', null, '山东省淄博市沂源县', '沂源县', ',1357,1382,', '1382');
INSERT INTO `area` VALUES ('1391', '2013-01-01 09:02:18', '2013-01-01 09:02:18', null, '山东省枣庄市', '枣庄市', ',1357,', '1357');
INSERT INTO `area` VALUES ('1392', '2013-01-01 09:02:18', '2013-01-01 09:02:18', null, '山东省枣庄市市中区', '市中区', ',1357,1391,', '1391');
INSERT INTO `area` VALUES ('1393', '2013-01-01 09:02:18', '2013-01-01 09:02:18', null, '山东省枣庄市薛城区', '薛城区', ',1357,1391,', '1391');
INSERT INTO `area` VALUES ('1394', '2013-01-01 09:02:18', '2013-01-01 09:02:18', null, '山东省枣庄市峄城区', '峄城区', ',1357,1391,', '1391');
INSERT INTO `area` VALUES ('1395', '2013-01-01 09:02:18', '2013-01-01 09:02:18', null, '山东省枣庄市台儿庄区', '台儿庄区', ',1357,1391,', '1391');
INSERT INTO `area` VALUES ('1396', '2013-01-01 09:02:18', '2013-01-01 09:02:18', null, '山东省枣庄市山亭区', '山亭区', ',1357,1391,', '1391');
INSERT INTO `area` VALUES ('1397', '2013-01-01 09:02:18', '2013-01-01 09:02:18', null, '山东省枣庄市滕州市', '滕州市', ',1357,1391,', '1391');
INSERT INTO `area` VALUES ('1398', '2013-01-01 09:02:18', '2013-01-01 09:02:18', null, '山东省东营市', '东营市', ',1357,', '1357');
INSERT INTO `area` VALUES ('1399', '2013-01-01 09:02:18', '2013-01-01 09:02:18', null, '山东省东营市东营区', '东营区', ',1357,1398,', '1398');
INSERT INTO `area` VALUES ('1400', '2013-01-01 09:02:18', '2013-01-01 09:02:18', null, '山东省东营市河口区', '河口区', ',1357,1398,', '1398');
INSERT INTO `area` VALUES ('1401', '2013-01-01 09:02:18', '2013-01-01 09:02:18', null, '山东省东营市垦利县', '垦利县', ',1357,1398,', '1398');
INSERT INTO `area` VALUES ('1402', '2013-01-01 09:02:18', '2013-01-01 09:02:18', null, '山东省东营市利津县', '利津县', ',1357,1398,', '1398');
INSERT INTO `area` VALUES ('1403', '2013-01-01 09:02:18', '2013-01-01 09:02:18', null, '山东省东营市广饶县', '广饶县', ',1357,1398,', '1398');
INSERT INTO `area` VALUES ('1404', '2013-01-01 09:02:18', '2013-01-01 09:02:18', null, '山东省烟台市', '烟台市', ',1357,', '1357');
INSERT INTO `area` VALUES ('1405', '2013-01-01 09:02:18', '2013-01-01 09:02:18', null, '山东省烟台市芝罘区', '芝罘区', ',1357,1404,', '1404');
INSERT INTO `area` VALUES ('1406', '2013-01-01 09:02:18', '2013-01-01 09:02:18', null, '山东省烟台市福山区', '福山区', ',1357,1404,', '1404');
INSERT INTO `area` VALUES ('1407', '2013-01-01 09:02:18', '2013-01-01 09:02:18', null, '山东省烟台市牟平区', '牟平区', ',1357,1404,', '1404');
INSERT INTO `area` VALUES ('1408', '2013-01-01 09:02:18', '2013-01-01 09:02:18', null, '山东省烟台市莱山区', '莱山区', ',1357,1404,', '1404');
INSERT INTO `area` VALUES ('1409', '2013-01-01 09:02:18', '2013-01-01 09:02:18', null, '山东省烟台市长岛县', '长岛县', ',1357,1404,', '1404');
INSERT INTO `area` VALUES ('1410', '2013-01-01 09:02:19', '2013-01-01 09:02:19', null, '山东省烟台市龙口市', '龙口市', ',1357,1404,', '1404');
INSERT INTO `area` VALUES ('1411', '2013-01-01 09:02:19', '2013-01-01 09:02:19', null, '山东省烟台市莱阳市', '莱阳市', ',1357,1404,', '1404');
INSERT INTO `area` VALUES ('1412', '2013-01-01 09:02:19', '2013-01-01 09:02:19', null, '山东省烟台市莱州市', '莱州市', ',1357,1404,', '1404');
INSERT INTO `area` VALUES ('1413', '2013-01-01 09:02:19', '2013-01-01 09:02:19', null, '山东省烟台市蓬莱市', '蓬莱市', ',1357,1404,', '1404');
INSERT INTO `area` VALUES ('1414', '2013-01-01 09:02:19', '2013-01-01 09:02:19', null, '山东省烟台市招远市', '招远市', ',1357,1404,', '1404');
INSERT INTO `area` VALUES ('1415', '2013-01-01 09:02:19', '2013-01-01 09:02:19', null, '山东省烟台市栖霞市', '栖霞市', ',1357,1404,', '1404');
INSERT INTO `area` VALUES ('1416', '2013-01-01 09:02:19', '2013-01-01 09:02:19', null, '山东省烟台市海阳市', '海阳市', ',1357,1404,', '1404');
INSERT INTO `area` VALUES ('1417', '2013-01-01 09:02:19', '2013-01-01 09:02:19', null, '山东省潍坊市', '潍坊市', ',1357,', '1357');
INSERT INTO `area` VALUES ('1418', '2013-01-01 09:02:19', '2013-01-01 09:02:19', null, '山东省潍坊市潍城区', '潍城区', ',1357,1417,', '1417');
INSERT INTO `area` VALUES ('1419', '2013-01-01 09:02:19', '2013-01-01 09:02:19', null, '山东省潍坊市寒亭区', '寒亭区', ',1357,1417,', '1417');
INSERT INTO `area` VALUES ('1420', '2013-01-01 09:02:19', '2013-01-01 09:02:19', null, '山东省潍坊市坊子区', '坊子区', ',1357,1417,', '1417');
INSERT INTO `area` VALUES ('1421', '2013-01-01 09:02:19', '2013-01-01 09:02:19', null, '山东省潍坊市奎文区', '奎文区', ',1357,1417,', '1417');
INSERT INTO `area` VALUES ('1422', '2013-01-01 09:02:19', '2013-01-01 09:02:19', null, '山东省潍坊市临朐县', '临朐县', ',1357,1417,', '1417');
INSERT INTO `area` VALUES ('1423', '2013-01-01 09:02:19', '2013-01-01 09:02:19', null, '山东省潍坊市昌乐县', '昌乐县', ',1357,1417,', '1417');
INSERT INTO `area` VALUES ('1424', '2013-01-01 09:02:19', '2013-01-01 09:02:19', null, '山东省潍坊市青州市', '青州市', ',1357,1417,', '1417');
INSERT INTO `area` VALUES ('1425', '2013-01-01 09:02:19', '2013-01-01 09:02:19', null, '山东省潍坊市诸城市', '诸城市', ',1357,1417,', '1417');
INSERT INTO `area` VALUES ('1426', '2013-01-01 09:02:19', '2013-01-01 09:02:19', null, '山东省潍坊市寿光市', '寿光市', ',1357,1417,', '1417');
INSERT INTO `area` VALUES ('1427', '2013-01-01 09:02:19', '2013-01-01 09:02:19', null, '山东省潍坊市安丘市', '安丘市', ',1357,1417,', '1417');
INSERT INTO `area` VALUES ('1428', '2013-01-01 09:02:19', '2013-01-01 09:02:19', null, '山东省潍坊市高密市', '高密市', ',1357,1417,', '1417');
INSERT INTO `area` VALUES ('1429', '2013-01-01 09:02:19', '2013-01-01 09:02:19', null, '山东省潍坊市昌邑市', '昌邑市', ',1357,1417,', '1417');
INSERT INTO `area` VALUES ('1430', '2013-01-01 09:02:19', '2013-01-01 09:02:19', null, '山东省济宁市', '济宁市', ',1357,', '1357');
INSERT INTO `area` VALUES ('1431', '2013-01-01 09:02:19', '2013-01-01 09:02:19', null, '山东省济宁市市中区', '市中区', ',1357,1430,', '1430');
INSERT INTO `area` VALUES ('1432', '2013-01-01 09:02:19', '2013-01-01 09:02:19', null, '山东省济宁市任城区', '任城区', ',1357,1430,', '1430');
INSERT INTO `area` VALUES ('1433', '2013-01-01 09:02:19', '2013-01-01 09:02:19', null, '山东省济宁市微山县', '微山县', ',1357,1430,', '1430');
INSERT INTO `area` VALUES ('1434', '2013-01-01 09:02:19', '2013-01-01 09:02:19', null, '山东省济宁市鱼台县', '鱼台县', ',1357,1430,', '1430');
INSERT INTO `area` VALUES ('1435', '2013-01-01 09:02:19', '2013-01-01 09:02:19', null, '山东省济宁市金乡县', '金乡县', ',1357,1430,', '1430');
INSERT INTO `area` VALUES ('1436', '2013-01-01 09:02:19', '2013-01-01 09:02:19', null, '山东省济宁市嘉祥县', '嘉祥县', ',1357,1430,', '1430');
INSERT INTO `area` VALUES ('1437', '2013-01-01 09:02:19', '2013-01-01 09:02:19', null, '山东省济宁市汶上县', '汶上县', ',1357,1430,', '1430');
INSERT INTO `area` VALUES ('1438', '2013-01-01 09:02:19', '2013-01-01 09:02:19', null, '山东省济宁市泗水县', '泗水县', ',1357,1430,', '1430');
INSERT INTO `area` VALUES ('1439', '2013-01-01 09:02:19', '2013-01-01 09:02:19', null, '山东省济宁市梁山县', '梁山县', ',1357,1430,', '1430');
INSERT INTO `area` VALUES ('1440', '2013-01-01 09:02:19', '2013-01-01 09:02:19', null, '山东省济宁市曲阜市', '曲阜市', ',1357,1430,', '1430');
INSERT INTO `area` VALUES ('1441', '2013-01-01 09:02:19', '2013-01-01 09:02:19', null, '山东省济宁市兖州市', '兖州市', ',1357,1430,', '1430');
INSERT INTO `area` VALUES ('1442', '2013-01-01 09:02:19', '2013-01-01 09:02:19', null, '山东省济宁市邹城市', '邹城市', ',1357,1430,', '1430');
INSERT INTO `area` VALUES ('1443', '2013-01-01 09:02:19', '2013-01-01 09:02:19', null, '山东省泰安市', '泰安市', ',1357,', '1357');
INSERT INTO `area` VALUES ('1444', '2013-01-01 09:02:19', '2013-01-01 09:02:19', null, '山东省泰安市泰山区', '泰山区', ',1357,1443,', '1443');
INSERT INTO `area` VALUES ('1445', '2013-01-01 09:02:20', '2013-01-01 09:02:20', null, '山东省泰安市岱岳区', '岱岳区', ',1357,1443,', '1443');
INSERT INTO `area` VALUES ('1446', '2013-01-01 09:02:20', '2013-01-01 09:02:20', null, '山东省泰安市宁阳县', '宁阳县', ',1357,1443,', '1443');
INSERT INTO `area` VALUES ('1447', '2013-01-01 09:02:20', '2013-01-01 09:02:20', null, '山东省泰安市东平县', '东平县', ',1357,1443,', '1443');
INSERT INTO `area` VALUES ('1448', '2013-01-01 09:02:20', '2013-01-01 09:02:20', null, '山东省泰安市新泰市', '新泰市', ',1357,1443,', '1443');
INSERT INTO `area` VALUES ('1449', '2013-01-01 09:02:20', '2013-01-01 09:02:20', null, '山东省泰安市肥城市', '肥城市', ',1357,1443,', '1443');
INSERT INTO `area` VALUES ('1450', '2013-01-01 09:02:20', '2013-01-01 09:02:20', null, '山东省威海市', '威海市', ',1357,', '1357');
INSERT INTO `area` VALUES ('1451', '2013-01-01 09:02:20', '2013-01-01 09:02:20', null, '山东省威海市环翠区', '环翠区', ',1357,1450,', '1450');
INSERT INTO `area` VALUES ('1452', '2013-01-01 09:02:20', '2013-01-01 09:02:20', null, '山东省威海市文登市', '文登市', ',1357,1450,', '1450');
INSERT INTO `area` VALUES ('1453', '2013-01-01 09:02:20', '2013-01-01 09:02:20', null, '山东省威海市荣成市', '荣成市', ',1357,1450,', '1450');
INSERT INTO `area` VALUES ('1454', '2013-01-01 09:02:20', '2013-01-01 09:02:20', null, '山东省威海市乳山市', '乳山市', ',1357,1450,', '1450');
INSERT INTO `area` VALUES ('1455', '2013-01-01 09:02:20', '2013-01-01 09:02:20', null, '山东省日照市', '日照市', ',1357,', '1357');
INSERT INTO `area` VALUES ('1456', '2013-01-01 09:02:20', '2013-01-01 09:02:20', null, '山东省日照市东港区', '东港区', ',1357,1455,', '1455');
INSERT INTO `area` VALUES ('1457', '2013-01-01 09:02:20', '2013-01-01 09:02:20', null, '山东省日照市岚山区', '岚山区', ',1357,1455,', '1455');
INSERT INTO `area` VALUES ('1458', '2013-01-01 09:02:20', '2013-01-01 09:02:20', null, '山东省日照市五莲县', '五莲县', ',1357,1455,', '1455');
INSERT INTO `area` VALUES ('1459', '2013-01-01 09:02:20', '2013-01-01 09:02:20', null, '山东省日照市莒县', '莒县', ',1357,1455,', '1455');
INSERT INTO `area` VALUES ('1460', '2013-01-01 09:02:20', '2013-01-01 09:02:20', null, '山东省莱芜市', '莱芜市', ',1357,', '1357');
INSERT INTO `area` VALUES ('1461', '2013-01-01 09:02:20', '2013-01-01 09:02:20', null, '山东省莱芜市莱城区', '莱城区', ',1357,1460,', '1460');
INSERT INTO `area` VALUES ('1462', '2013-01-01 09:02:20', '2013-01-01 09:02:20', null, '山东省莱芜市钢城区', '钢城区', ',1357,1460,', '1460');
INSERT INTO `area` VALUES ('1463', '2013-01-01 09:02:20', '2013-01-01 09:02:20', null, '山东省临沂市', '临沂市', ',1357,', '1357');
INSERT INTO `area` VALUES ('1464', '2013-01-01 09:02:20', '2013-01-01 09:02:20', null, '山东省临沂市兰山区', '兰山区', ',1357,1463,', '1463');
INSERT INTO `area` VALUES ('1465', '2013-01-01 09:02:20', '2013-01-01 09:02:20', null, '山东省临沂市罗庄区', '罗庄区', ',1357,1463,', '1463');
INSERT INTO `area` VALUES ('1466', '2013-01-01 09:02:20', '2013-01-01 09:02:20', null, '山东省临沂市河东区', '河东区', ',1357,1463,', '1463');
INSERT INTO `area` VALUES ('1467', '2013-01-01 09:02:20', '2013-01-01 09:02:20', null, '山东省临沂市沂南县', '沂南县', ',1357,1463,', '1463');
INSERT INTO `area` VALUES ('1468', '2013-01-01 09:02:20', '2013-01-01 09:02:20', null, '山东省临沂市郯城县', '郯城县', ',1357,1463,', '1463');
INSERT INTO `area` VALUES ('1469', '2013-01-01 09:02:20', '2013-01-01 09:02:20', null, '山东省临沂市沂水县', '沂水县', ',1357,1463,', '1463');
INSERT INTO `area` VALUES ('1470', '2013-01-01 09:02:20', '2013-01-01 09:02:20', null, '山东省临沂市苍山县', '苍山县', ',1357,1463,', '1463');
INSERT INTO `area` VALUES ('1471', '2013-01-01 09:02:20', '2013-01-01 09:02:20', null, '山东省临沂市费县', '费县', ',1357,1463,', '1463');
INSERT INTO `area` VALUES ('1472', '2013-01-01 09:02:20', '2013-01-01 09:02:20', null, '山东省临沂市平邑县', '平邑县', ',1357,1463,', '1463');
INSERT INTO `area` VALUES ('1473', '2013-01-01 09:02:20', '2013-01-01 09:02:20', null, '山东省临沂市莒南县', '莒南县', ',1357,1463,', '1463');
INSERT INTO `area` VALUES ('1474', '2013-01-01 09:02:20', '2013-01-01 09:02:20', null, '山东省临沂市蒙阴县', '蒙阴县', ',1357,1463,', '1463');
INSERT INTO `area` VALUES ('1475', '2013-01-01 09:02:20', '2013-01-01 09:02:20', null, '山东省临沂市临沭县', '临沭县', ',1357,1463,', '1463');
INSERT INTO `area` VALUES ('1476', '2013-01-01 09:02:20', '2013-01-01 09:02:20', null, '山东省德州市', '德州市', ',1357,', '1357');
INSERT INTO `area` VALUES ('1477', '2013-01-01 09:02:20', '2013-01-01 09:02:20', null, '山东省德州市德城区', '德城区', ',1357,1476,', '1476');
INSERT INTO `area` VALUES ('1478', '2013-01-01 09:02:20', '2013-01-01 09:02:20', null, '山东省德州市陵县', '陵县', ',1357,1476,', '1476');
INSERT INTO `area` VALUES ('1479', '2013-01-01 09:02:20', '2013-01-01 09:02:20', null, '山东省德州市宁津县', '宁津县', ',1357,1476,', '1476');
INSERT INTO `area` VALUES ('1480', '2013-01-01 09:02:21', '2013-01-01 09:02:21', null, '山东省德州市庆云县', '庆云县', ',1357,1476,', '1476');
INSERT INTO `area` VALUES ('1481', '2013-01-01 09:02:21', '2013-01-01 09:02:21', null, '山东省德州市临邑县', '临邑县', ',1357,1476,', '1476');
INSERT INTO `area` VALUES ('1482', '2013-01-01 09:02:21', '2013-01-01 09:02:21', null, '山东省德州市齐河县', '齐河县', ',1357,1476,', '1476');
INSERT INTO `area` VALUES ('1483', '2013-01-01 09:02:21', '2013-01-01 09:02:21', null, '山东省德州市平原县', '平原县', ',1357,1476,', '1476');
INSERT INTO `area` VALUES ('1484', '2013-01-01 09:02:21', '2013-01-01 09:02:21', null, '山东省德州市夏津县', '夏津县', ',1357,1476,', '1476');
INSERT INTO `area` VALUES ('1485', '2013-01-01 09:02:21', '2013-01-01 09:02:21', null, '山东省德州市武城县', '武城县', ',1357,1476,', '1476');
INSERT INTO `area` VALUES ('1486', '2013-01-01 09:02:21', '2013-01-01 09:02:21', null, '山东省德州市乐陵市', '乐陵市', ',1357,1476,', '1476');
INSERT INTO `area` VALUES ('1487', '2013-01-01 09:02:21', '2013-01-01 09:02:21', null, '山东省德州市禹城市', '禹城市', ',1357,1476,', '1476');
INSERT INTO `area` VALUES ('1488', '2013-01-01 09:02:21', '2013-01-01 09:02:21', null, '山东省聊城市', '聊城市', ',1357,', '1357');
INSERT INTO `area` VALUES ('1489', '2013-01-01 09:02:21', '2013-01-01 09:02:21', null, '山东省聊城市东昌府区', '东昌府区', ',1357,1488,', '1488');
INSERT INTO `area` VALUES ('1490', '2013-01-01 09:02:21', '2013-01-01 09:02:21', null, '山东省聊城市阳谷县', '阳谷县', ',1357,1488,', '1488');
INSERT INTO `area` VALUES ('1491', '2013-01-01 09:02:21', '2013-01-01 09:02:21', null, '山东省聊城市莘县', '莘县', ',1357,1488,', '1488');
INSERT INTO `area` VALUES ('1492', '2013-01-01 09:02:21', '2013-01-01 09:02:21', null, '山东省聊城市茌平县', '茌平县', ',1357,1488,', '1488');
INSERT INTO `area` VALUES ('1493', '2013-01-01 09:02:21', '2013-01-01 09:02:21', null, '山东省聊城市东阿县', '东阿县', ',1357,1488,', '1488');
INSERT INTO `area` VALUES ('1494', '2013-01-01 09:02:21', '2013-01-01 09:02:21', null, '山东省聊城市冠县', '冠县', ',1357,1488,', '1488');
INSERT INTO `area` VALUES ('1495', '2013-01-01 09:02:21', '2013-01-01 09:02:21', null, '山东省聊城市高唐县', '高唐县', ',1357,1488,', '1488');
INSERT INTO `area` VALUES ('1496', '2013-01-01 09:02:21', '2013-01-01 09:02:21', null, '山东省聊城市临清市', '临清市', ',1357,1488,', '1488');
INSERT INTO `area` VALUES ('1497', '2013-01-01 09:02:21', '2013-01-01 09:02:21', null, '山东省滨州市', '滨州市', ',1357,', '1357');
INSERT INTO `area` VALUES ('1498', '2013-01-01 09:02:21', '2013-01-01 09:02:21', null, '山东省滨州市滨城区', '滨城区', ',1357,1497,', '1497');
INSERT INTO `area` VALUES ('1499', '2013-01-01 09:02:21', '2013-01-01 09:02:21', null, '山东省滨州市惠民县', '惠民县', ',1357,1497,', '1497');
INSERT INTO `area` VALUES ('1500', '2013-01-01 09:02:21', '2013-01-01 09:02:21', null, '山东省滨州市阳信县', '阳信县', ',1357,1497,', '1497');
INSERT INTO `area` VALUES ('1501', '2013-01-01 09:02:21', '2013-01-01 09:02:21', null, '山东省滨州市无棣县', '无棣县', ',1357,1497,', '1497');
INSERT INTO `area` VALUES ('1502', '2013-01-01 09:02:21', '2013-01-01 09:02:21', null, '山东省滨州市沾化县', '沾化县', ',1357,1497,', '1497');
INSERT INTO `area` VALUES ('1503', '2013-01-01 09:02:21', '2013-01-01 09:02:21', null, '山东省滨州市博兴县', '博兴县', ',1357,1497,', '1497');
INSERT INTO `area` VALUES ('1504', '2013-01-01 09:02:21', '2013-01-01 09:02:21', null, '山东省滨州市邹平县', '邹平县', ',1357,1497,', '1497');
INSERT INTO `area` VALUES ('1505', '2013-01-01 09:02:21', '2013-01-01 09:02:21', null, '山东省菏泽市', '菏泽市', ',1357,', '1357');
INSERT INTO `area` VALUES ('1506', '2013-01-01 09:02:21', '2013-01-01 09:02:21', null, '山东省菏泽市牡丹区', '牡丹区', ',1357,1505,', '1505');
INSERT INTO `area` VALUES ('1507', '2013-01-01 09:02:21', '2013-01-01 09:02:21', null, '山东省菏泽市曹县', '曹县', ',1357,1505,', '1505');
INSERT INTO `area` VALUES ('1508', '2013-01-01 09:02:21', '2013-01-01 09:02:21', null, '山东省菏泽市单县', '单县', ',1357,1505,', '1505');
INSERT INTO `area` VALUES ('1509', '2013-01-01 09:02:21', '2013-01-01 09:02:21', null, '山东省菏泽市成武县', '成武县', ',1357,1505,', '1505');
INSERT INTO `area` VALUES ('1510', '2013-01-01 09:02:21', '2013-01-01 09:02:21', null, '山东省菏泽市巨野县', '巨野县', ',1357,1505,', '1505');
INSERT INTO `area` VALUES ('1511', '2013-01-01 09:02:21', '2013-01-01 09:02:21', null, '山东省菏泽市郓城县', '郓城县', ',1357,1505,', '1505');
INSERT INTO `area` VALUES ('1512', '2013-01-01 09:02:21', '2013-01-01 09:02:21', null, '山东省菏泽市鄄城县', '鄄城县', ',1357,1505,', '1505');
INSERT INTO `area` VALUES ('1513', '2013-01-01 09:02:21', '2013-01-01 09:02:21', null, '山东省菏泽市定陶县', '定陶县', ',1357,1505,', '1505');
INSERT INTO `area` VALUES ('1514', '2013-01-01 09:02:22', '2013-01-01 09:02:22', null, '山东省菏泽市东明县', '东明县', ',1357,1505,', '1505');
INSERT INTO `area` VALUES ('1515', '2013-01-01 09:02:22', '2013-01-01 09:02:22', null, '河南省', '河南省', ',', null);
INSERT INTO `area` VALUES ('1516', '2013-01-01 09:02:22', '2013-01-01 09:02:22', null, '河南省郑州市', '郑州市', ',1515,', '1515');
INSERT INTO `area` VALUES ('1517', '2013-01-01 09:02:22', '2013-01-01 09:02:22', null, '河南省郑州市中原区', '中原区', ',1515,1516,', '1516');
INSERT INTO `area` VALUES ('1518', '2013-01-01 09:02:22', '2013-01-01 09:02:22', null, '河南省郑州市二七区', '二七区', ',1515,1516,', '1516');
INSERT INTO `area` VALUES ('1519', '2013-01-01 09:02:22', '2013-01-01 09:02:22', null, '河南省郑州市管城回族区', '管城回族区', ',1515,1516,', '1516');
INSERT INTO `area` VALUES ('1520', '2013-01-01 09:02:22', '2013-01-01 09:02:22', null, '河南省郑州市金水区', '金水区', ',1515,1516,', '1516');
INSERT INTO `area` VALUES ('1521', '2013-01-01 09:02:22', '2013-01-01 09:02:22', null, '河南省郑州市上街区', '上街区', ',1515,1516,', '1516');
INSERT INTO `area` VALUES ('1522', '2013-01-01 09:02:22', '2013-01-01 09:02:22', null, '河南省郑州市惠济区', '惠济区', ',1515,1516,', '1516');
INSERT INTO `area` VALUES ('1523', '2013-01-01 09:02:22', '2013-01-01 09:02:22', null, '河南省郑州市中牟县', '中牟县', ',1515,1516,', '1516');
INSERT INTO `area` VALUES ('1524', '2013-01-01 09:02:22', '2013-01-01 09:02:22', null, '河南省郑州市巩义市', '巩义市', ',1515,1516,', '1516');
INSERT INTO `area` VALUES ('1525', '2013-01-01 09:02:22', '2013-01-01 09:02:22', null, '河南省郑州市荥阳市', '荥阳市', ',1515,1516,', '1516');
INSERT INTO `area` VALUES ('1526', '2013-01-01 09:02:22', '2013-01-01 09:02:22', null, '河南省郑州市新密市', '新密市', ',1515,1516,', '1516');
INSERT INTO `area` VALUES ('1527', '2013-01-01 09:02:22', '2013-01-01 09:02:22', null, '河南省郑州市新郑市', '新郑市', ',1515,1516,', '1516');
INSERT INTO `area` VALUES ('1528', '2013-01-01 09:02:22', '2013-01-01 09:02:22', null, '河南省郑州市登封市', '登封市', ',1515,1516,', '1516');
INSERT INTO `area` VALUES ('1529', '2013-01-01 09:02:22', '2013-01-01 09:02:22', null, '河南省开封市', '开封市', ',1515,', '1515');
INSERT INTO `area` VALUES ('1530', '2013-01-01 09:02:22', '2013-01-01 09:02:22', null, '河南省开封市龙亭区', '龙亭区', ',1515,1529,', '1529');
INSERT INTO `area` VALUES ('1531', '2013-01-01 09:02:22', '2013-01-01 09:02:22', null, '河南省开封市顺河回族区', '顺河回族区', ',1515,1529,', '1529');
INSERT INTO `area` VALUES ('1532', '2013-01-01 09:02:22', '2013-01-01 09:02:22', null, '河南省开封市鼓楼区', '鼓楼区', ',1515,1529,', '1529');
INSERT INTO `area` VALUES ('1533', '2013-01-01 09:02:22', '2013-01-01 09:02:22', null, '河南省开封市禹王台区', '禹王台区', ',1515,1529,', '1529');
INSERT INTO `area` VALUES ('1534', '2013-01-01 09:02:22', '2013-01-01 09:02:22', null, '河南省开封市金明区', '金明区', ',1515,1529,', '1529');
INSERT INTO `area` VALUES ('1535', '2013-01-01 09:02:22', '2013-01-01 09:02:22', null, '河南省开封市杞县', '杞县', ',1515,1529,', '1529');
INSERT INTO `area` VALUES ('1536', '2013-01-01 09:02:22', '2013-01-01 09:02:22', null, '河南省开封市通许县', '通许县', ',1515,1529,', '1529');
INSERT INTO `area` VALUES ('1537', '2013-01-01 09:02:22', '2013-01-01 09:02:22', null, '河南省开封市尉氏县', '尉氏县', ',1515,1529,', '1529');
INSERT INTO `area` VALUES ('1538', '2013-01-01 09:02:22', '2013-01-01 09:02:22', null, '河南省开封市开封县', '开封县', ',1515,1529,', '1529');
INSERT INTO `area` VALUES ('1539', '2013-01-01 09:02:22', '2013-01-01 09:02:22', null, '河南省开封市兰考县', '兰考县', ',1515,1529,', '1529');
INSERT INTO `area` VALUES ('1540', '2013-01-01 09:02:22', '2013-01-01 09:02:22', null, '河南省洛阳市', '洛阳市', ',1515,', '1515');
INSERT INTO `area` VALUES ('1541', '2013-01-01 09:02:22', '2013-01-01 09:02:22', null, '河南省洛阳市老城区', '老城区', ',1515,1540,', '1540');
INSERT INTO `area` VALUES ('1542', '2013-01-01 09:02:22', '2013-01-01 09:02:22', null, '河南省洛阳市西工区', '西工区', ',1515,1540,', '1540');
INSERT INTO `area` VALUES ('1543', '2013-01-01 09:02:22', '2013-01-01 09:02:22', null, '河南省洛阳市瀍河回族区', '瀍河回族区', ',1515,1540,', '1540');
INSERT INTO `area` VALUES ('1544', '2013-01-01 09:02:22', '2013-01-01 09:02:22', null, '河南省洛阳市涧西区', '涧西区', ',1515,1540,', '1540');
INSERT INTO `area` VALUES ('1545', '2013-01-01 09:02:22', '2013-01-01 09:02:22', null, '河南省洛阳市吉利区', '吉利区', ',1515,1540,', '1540');
INSERT INTO `area` VALUES ('1546', '2013-01-01 09:02:22', '2013-01-01 09:02:22', null, '河南省洛阳市洛龙区', '洛龙区', ',1515,1540,', '1540');
INSERT INTO `area` VALUES ('1547', '2013-01-01 09:02:22', '2013-01-01 09:02:22', null, '河南省洛阳市孟津县', '孟津县', ',1515,1540,', '1540');
INSERT INTO `area` VALUES ('1548', '2013-01-01 09:02:23', '2013-01-01 09:02:23', null, '河南省洛阳市新安县', '新安县', ',1515,1540,', '1540');
INSERT INTO `area` VALUES ('1549', '2013-01-01 09:02:23', '2013-01-01 09:02:23', null, '河南省洛阳市栾川县', '栾川县', ',1515,1540,', '1540');
INSERT INTO `area` VALUES ('1550', '2013-01-01 09:02:23', '2013-01-01 09:02:23', null, '河南省洛阳市嵩县', '嵩县', ',1515,1540,', '1540');
INSERT INTO `area` VALUES ('1551', '2013-01-01 09:02:23', '2013-01-01 09:02:23', null, '河南省洛阳市汝阳县', '汝阳县', ',1515,1540,', '1540');
INSERT INTO `area` VALUES ('1552', '2013-01-01 09:02:23', '2013-01-01 09:02:23', null, '河南省洛阳市宜阳县', '宜阳县', ',1515,1540,', '1540');
INSERT INTO `area` VALUES ('1553', '2013-01-01 09:02:23', '2013-01-01 09:02:23', null, '河南省洛阳市洛宁县', '洛宁县', ',1515,1540,', '1540');
INSERT INTO `area` VALUES ('1554', '2013-01-01 09:02:23', '2013-01-01 09:02:23', null, '河南省洛阳市伊川县', '伊川县', ',1515,1540,', '1540');
INSERT INTO `area` VALUES ('1555', '2013-01-01 09:02:23', '2013-01-01 09:02:23', null, '河南省洛阳市偃师市', '偃师市', ',1515,1540,', '1540');
INSERT INTO `area` VALUES ('1556', '2013-01-01 09:02:23', '2013-01-01 09:02:23', null, '河南省平顶山市', '平顶山市', ',1515,', '1515');
INSERT INTO `area` VALUES ('1557', '2013-01-01 09:02:23', '2013-01-01 09:02:23', null, '河南省平顶山市新华区', '新华区', ',1515,1556,', '1556');
INSERT INTO `area` VALUES ('1558', '2013-01-01 09:02:23', '2013-01-01 09:02:23', null, '河南省平顶山市卫东区', '卫东区', ',1515,1556,', '1556');
INSERT INTO `area` VALUES ('1559', '2013-01-01 09:02:23', '2013-01-01 09:02:23', null, '河南省平顶山市石龙区', '石龙区', ',1515,1556,', '1556');
INSERT INTO `area` VALUES ('1560', '2013-01-01 09:02:23', '2013-01-01 09:02:23', null, '河南省平顶山市湛河区', '湛河区', ',1515,1556,', '1556');
INSERT INTO `area` VALUES ('1561', '2013-01-01 09:02:23', '2013-01-01 09:02:23', null, '河南省平顶山市宝丰县', '宝丰县', ',1515,1556,', '1556');
INSERT INTO `area` VALUES ('1562', '2013-01-01 09:02:23', '2013-01-01 09:02:23', null, '河南省平顶山市叶县', '叶县', ',1515,1556,', '1556');
INSERT INTO `area` VALUES ('1563', '2013-01-01 09:02:23', '2013-01-01 09:02:23', null, '河南省平顶山市鲁山县', '鲁山县', ',1515,1556,', '1556');
INSERT INTO `area` VALUES ('1564', '2013-01-01 09:02:23', '2013-01-01 09:02:23', null, '河南省平顶山市郏县', '郏县', ',1515,1556,', '1556');
INSERT INTO `area` VALUES ('1565', '2013-01-01 09:02:23', '2013-01-01 09:02:23', null, '河南省平顶山市舞钢市', '舞钢市', ',1515,1556,', '1556');
INSERT INTO `area` VALUES ('1566', '2013-01-01 09:02:23', '2013-01-01 09:02:23', null, '河南省平顶山市汝州市', '汝州市', ',1515,1556,', '1556');
INSERT INTO `area` VALUES ('1567', '2013-01-01 09:02:23', '2013-01-01 09:02:23', null, '河南省安阳市', '安阳市', ',1515,', '1515');
INSERT INTO `area` VALUES ('1568', '2013-01-01 09:02:23', '2013-01-01 09:02:23', null, '河南省安阳市文峰区', '文峰区', ',1515,1567,', '1567');
INSERT INTO `area` VALUES ('1569', '2013-01-01 09:02:23', '2013-01-01 09:02:23', null, '河南省安阳市北关区', '北关区', ',1515,1567,', '1567');
INSERT INTO `area` VALUES ('1570', '2013-01-01 09:02:23', '2013-01-01 09:02:23', null, '河南省安阳市殷都区', '殷都区', ',1515,1567,', '1567');
INSERT INTO `area` VALUES ('1571', '2013-01-01 09:02:23', '2013-01-01 09:02:23', null, '河南省安阳市龙安区', '龙安区', ',1515,1567,', '1567');
INSERT INTO `area` VALUES ('1572', '2013-01-01 09:02:23', '2013-01-01 09:02:23', null, '河南省安阳市安阳县', '安阳县', ',1515,1567,', '1567');
INSERT INTO `area` VALUES ('1573', '2013-01-01 09:02:23', '2013-01-01 09:02:23', null, '河南省安阳市汤阴县', '汤阴县', ',1515,1567,', '1567');
INSERT INTO `area` VALUES ('1574', '2013-01-01 09:02:23', '2013-01-01 09:02:23', null, '河南省安阳市滑县', '滑县', ',1515,1567,', '1567');
INSERT INTO `area` VALUES ('1575', '2013-01-01 09:02:23', '2013-01-01 09:02:23', null, '河南省安阳市内黄县', '内黄县', ',1515,1567,', '1567');
INSERT INTO `area` VALUES ('1576', '2013-01-01 09:02:23', '2013-01-01 09:02:23', null, '河南省安阳市林州市', '林州市', ',1515,1567,', '1567');
INSERT INTO `area` VALUES ('1577', '2013-01-01 09:02:23', '2013-01-01 09:02:23', null, '河南省鹤壁市', '鹤壁市', ',1515,', '1515');
INSERT INTO `area` VALUES ('1578', '2013-01-01 09:02:23', '2013-01-01 09:02:23', null, '河南省鹤壁市鹤山区', '鹤山区', ',1515,1577,', '1577');
INSERT INTO `area` VALUES ('1579', '2013-01-01 09:02:23', '2013-01-01 09:02:23', null, '河南省鹤壁市山城区', '山城区', ',1515,1577,', '1577');
INSERT INTO `area` VALUES ('1580', '2013-01-01 09:02:23', '2013-01-01 09:02:23', null, '河南省鹤壁市淇滨区', '淇滨区', ',1515,1577,', '1577');
INSERT INTO `area` VALUES ('1581', '2013-01-01 09:02:24', '2013-01-01 09:02:24', null, '河南省鹤壁市浚县', '浚县', ',1515,1577,', '1577');
INSERT INTO `area` VALUES ('1582', '2013-01-01 09:02:24', '2013-01-01 09:02:24', null, '河南省鹤壁市淇县', '淇县', ',1515,1577,', '1577');
INSERT INTO `area` VALUES ('1583', '2013-01-01 09:02:24', '2013-01-01 09:02:24', null, '河南省新乡市', '新乡市', ',1515,', '1515');
INSERT INTO `area` VALUES ('1584', '2013-01-01 09:02:24', '2013-01-01 09:02:24', null, '河南省新乡市红旗区', '红旗区', ',1515,1583,', '1583');
INSERT INTO `area` VALUES ('1585', '2013-01-01 09:02:24', '2013-01-01 09:02:24', null, '河南省新乡市卫滨区', '卫滨区', ',1515,1583,', '1583');
INSERT INTO `area` VALUES ('1586', '2013-01-01 09:02:24', '2013-01-01 09:02:24', null, '河南省新乡市凤泉区', '凤泉区', ',1515,1583,', '1583');
INSERT INTO `area` VALUES ('1587', '2013-01-01 09:02:24', '2013-01-01 09:02:24', null, '河南省新乡市牧野区', '牧野区', ',1515,1583,', '1583');
INSERT INTO `area` VALUES ('1588', '2013-01-01 09:02:24', '2013-01-01 09:02:24', null, '河南省新乡市新乡县', '新乡县', ',1515,1583,', '1583');
INSERT INTO `area` VALUES ('1589', '2013-01-01 09:02:24', '2013-01-01 09:02:24', null, '河南省新乡市获嘉县', '获嘉县', ',1515,1583,', '1583');
INSERT INTO `area` VALUES ('1590', '2013-01-01 09:02:24', '2013-01-01 09:02:24', null, '河南省新乡市原阳县', '原阳县', ',1515,1583,', '1583');
INSERT INTO `area` VALUES ('1591', '2013-01-01 09:02:24', '2013-01-01 09:02:24', null, '河南省新乡市延津县', '延津县', ',1515,1583,', '1583');
INSERT INTO `area` VALUES ('1592', '2013-01-01 09:02:24', '2013-01-01 09:02:24', null, '河南省新乡市封丘县', '封丘县', ',1515,1583,', '1583');
INSERT INTO `area` VALUES ('1593', '2013-01-01 09:02:24', '2013-01-01 09:02:24', null, '河南省新乡市长垣县', '长垣县', ',1515,1583,', '1583');
INSERT INTO `area` VALUES ('1594', '2013-01-01 09:02:24', '2013-01-01 09:02:24', null, '河南省新乡市卫辉市', '卫辉市', ',1515,1583,', '1583');
INSERT INTO `area` VALUES ('1595', '2013-01-01 09:02:24', '2013-01-01 09:02:24', null, '河南省新乡市辉县市', '辉县市', ',1515,1583,', '1583');
INSERT INTO `area` VALUES ('1596', '2013-01-01 09:02:24', '2013-01-01 09:02:24', null, '河南省焦作市', '焦作市', ',1515,', '1515');
INSERT INTO `area` VALUES ('1597', '2013-01-01 09:02:24', '2013-01-01 09:02:24', null, '河南省焦作市解放区', '解放区', ',1515,1596,', '1596');
INSERT INTO `area` VALUES ('1598', '2013-01-01 09:02:24', '2013-01-01 09:02:24', null, '河南省焦作市中站区', '中站区', ',1515,1596,', '1596');
INSERT INTO `area` VALUES ('1599', '2013-01-01 09:02:24', '2013-01-01 09:02:24', null, '河南省焦作市马村区', '马村区', ',1515,1596,', '1596');
INSERT INTO `area` VALUES ('1600', '2013-01-01 09:02:24', '2013-01-01 09:02:24', null, '河南省焦作市山阳区', '山阳区', ',1515,1596,', '1596');
INSERT INTO `area` VALUES ('1601', '2013-01-01 09:02:24', '2013-01-01 09:02:24', null, '河南省焦作市修武县', '修武县', ',1515,1596,', '1596');
INSERT INTO `area` VALUES ('1602', '2013-01-01 09:02:24', '2013-01-01 09:02:24', null, '河南省焦作市博爱县', '博爱县', ',1515,1596,', '1596');
INSERT INTO `area` VALUES ('1603', '2013-01-01 09:02:24', '2013-01-01 09:02:24', null, '河南省焦作市武陟县', '武陟县', ',1515,1596,', '1596');
INSERT INTO `area` VALUES ('1604', '2013-01-01 09:02:24', '2013-01-01 09:02:24', null, '河南省焦作市温县', '温县', ',1515,1596,', '1596');
INSERT INTO `area` VALUES ('1605', '2013-01-01 09:02:24', '2013-01-01 09:02:24', null, '河南省焦作市沁阳市', '沁阳市', ',1515,1596,', '1596');
INSERT INTO `area` VALUES ('1606', '2013-01-01 09:02:24', '2013-01-01 09:02:24', null, '河南省焦作市孟州市', '孟州市', ',1515,1596,', '1596');
INSERT INTO `area` VALUES ('1607', '2013-01-01 09:02:24', '2013-01-01 09:02:24', null, '河南省濮阳市', '濮阳市', ',1515,', '1515');
INSERT INTO `area` VALUES ('1608', '2013-01-01 09:02:24', '2013-01-01 09:02:24', null, '河南省濮阳市华龙区', '华龙区', ',1515,1607,', '1607');
INSERT INTO `area` VALUES ('1609', '2013-01-01 09:02:24', '2013-01-01 09:02:24', null, '河南省濮阳市清丰县', '清丰县', ',1515,1607,', '1607');
INSERT INTO `area` VALUES ('1610', '2013-01-01 09:02:24', '2013-01-01 09:02:24', null, '河南省濮阳市南乐县', '南乐县', ',1515,1607,', '1607');
INSERT INTO `area` VALUES ('1611', '2013-01-01 09:02:24', '2013-01-01 09:02:24', null, '河南省濮阳市范县', '范县', ',1515,1607,', '1607');
INSERT INTO `area` VALUES ('1612', '2013-01-01 09:02:24', '2013-01-01 09:02:24', null, '河南省濮阳市台前县', '台前县', ',1515,1607,', '1607');
INSERT INTO `area` VALUES ('1613', '2013-01-01 09:02:24', '2013-01-01 09:02:24', null, '河南省濮阳市濮阳县', '濮阳县', ',1515,1607,', '1607');
INSERT INTO `area` VALUES ('1614', '2013-01-01 09:02:25', '2013-01-01 09:02:25', null, '河南省许昌市', '许昌市', ',1515,', '1515');
INSERT INTO `area` VALUES ('1615', '2013-01-01 09:02:25', '2013-01-01 09:02:25', null, '河南省许昌市魏都区', '魏都区', ',1515,1614,', '1614');
INSERT INTO `area` VALUES ('1616', '2013-01-01 09:02:25', '2013-01-01 09:02:25', null, '河南省许昌市许昌县', '许昌县', ',1515,1614,', '1614');
INSERT INTO `area` VALUES ('1617', '2013-01-01 09:02:25', '2013-01-01 09:02:25', null, '河南省许昌市鄢陵县', '鄢陵县', ',1515,1614,', '1614');
INSERT INTO `area` VALUES ('1618', '2013-01-01 09:02:25', '2013-01-01 09:02:25', null, '河南省许昌市襄城县', '襄城县', ',1515,1614,', '1614');
INSERT INTO `area` VALUES ('1619', '2013-01-01 09:02:25', '2013-01-01 09:02:25', null, '河南省许昌市禹州市', '禹州市', ',1515,1614,', '1614');
INSERT INTO `area` VALUES ('1620', '2013-01-01 09:02:25', '2013-01-01 09:02:25', null, '河南省许昌市长葛市', '长葛市', ',1515,1614,', '1614');
INSERT INTO `area` VALUES ('1621', '2013-01-01 09:02:25', '2013-01-01 09:02:25', null, '河南省漯河市', '漯河市', ',1515,', '1515');
INSERT INTO `area` VALUES ('1622', '2013-01-01 09:02:25', '2013-01-01 09:02:25', null, '河南省漯河市源汇区', '源汇区', ',1515,1621,', '1621');
INSERT INTO `area` VALUES ('1623', '2013-01-01 09:02:25', '2013-01-01 09:02:25', null, '河南省漯河市郾城区', '郾城区', ',1515,1621,', '1621');
INSERT INTO `area` VALUES ('1624', '2013-01-01 09:02:25', '2013-01-01 09:02:25', null, '河南省漯河市召陵区', '召陵区', ',1515,1621,', '1621');
INSERT INTO `area` VALUES ('1625', '2013-01-01 09:02:25', '2013-01-01 09:02:25', null, '河南省漯河市舞阳县', '舞阳县', ',1515,1621,', '1621');
INSERT INTO `area` VALUES ('1626', '2013-01-01 09:02:25', '2013-01-01 09:02:25', null, '河南省漯河市临颍县', '临颍县', ',1515,1621,', '1621');
INSERT INTO `area` VALUES ('1627', '2013-01-01 09:02:25', '2013-01-01 09:02:25', null, '河南省三门峡市', '三门峡市', ',1515,', '1515');
INSERT INTO `area` VALUES ('1628', '2013-01-01 09:02:25', '2013-01-01 09:02:25', null, '河南省三门峡市湖滨区', '湖滨区', ',1515,1627,', '1627');
INSERT INTO `area` VALUES ('1629', '2013-01-01 09:02:25', '2013-01-01 09:02:25', null, '河南省三门峡市渑池县', '渑池县', ',1515,1627,', '1627');
INSERT INTO `area` VALUES ('1630', '2013-01-01 09:02:25', '2013-01-01 09:02:25', null, '河南省三门峡市陕县', '陕县', ',1515,1627,', '1627');
INSERT INTO `area` VALUES ('1631', '2013-01-01 09:02:25', '2013-01-01 09:02:25', null, '河南省三门峡市卢氏县', '卢氏县', ',1515,1627,', '1627');
INSERT INTO `area` VALUES ('1632', '2013-01-01 09:02:25', '2013-01-01 09:02:25', null, '河南省三门峡市义马市', '义马市', ',1515,1627,', '1627');
INSERT INTO `area` VALUES ('1633', '2013-01-01 09:02:25', '2013-01-01 09:02:25', null, '河南省三门峡市灵宝市', '灵宝市', ',1515,1627,', '1627');
INSERT INTO `area` VALUES ('1634', '2013-01-01 09:02:25', '2013-01-01 09:02:25', null, '河南省南阳市', '南阳市', ',1515,', '1515');
INSERT INTO `area` VALUES ('1635', '2013-01-01 09:02:25', '2013-01-01 09:02:25', null, '河南省南阳市宛城区', '宛城区', ',1515,1634,', '1634');
INSERT INTO `area` VALUES ('1636', '2013-01-01 09:02:25', '2013-01-01 09:02:25', null, '河南省南阳市卧龙区', '卧龙区', ',1515,1634,', '1634');
INSERT INTO `area` VALUES ('1637', '2013-01-01 09:02:25', '2013-01-01 09:02:25', null, '河南省南阳市南召县', '南召县', ',1515,1634,', '1634');
INSERT INTO `area` VALUES ('1638', '2013-01-01 09:02:25', '2013-01-01 09:02:25', null, '河南省南阳市方城县', '方城县', ',1515,1634,', '1634');
INSERT INTO `area` VALUES ('1639', '2013-01-01 09:02:25', '2013-01-01 09:02:25', null, '河南省南阳市西峡县', '西峡县', ',1515,1634,', '1634');
INSERT INTO `area` VALUES ('1640', '2013-01-01 09:02:25', '2013-01-01 09:02:25', null, '河南省南阳市镇平县', '镇平县', ',1515,1634,', '1634');
INSERT INTO `area` VALUES ('1641', '2013-01-01 09:02:25', '2013-01-01 09:02:25', null, '河南省南阳市内乡县', '内乡县', ',1515,1634,', '1634');
INSERT INTO `area` VALUES ('1642', '2013-01-01 09:02:25', '2013-01-01 09:02:25', null, '河南省南阳市淅川县', '淅川县', ',1515,1634,', '1634');
INSERT INTO `area` VALUES ('1643', '2013-01-01 09:02:25', '2013-01-01 09:02:25', null, '河南省南阳市社旗县', '社旗县', ',1515,1634,', '1634');
INSERT INTO `area` VALUES ('1644', '2013-01-01 09:02:25', '2013-01-01 09:02:25', null, '河南省南阳市唐河县', '唐河县', ',1515,1634,', '1634');
INSERT INTO `area` VALUES ('1645', '2013-01-01 09:02:26', '2013-01-01 09:02:26', null, '河南省南阳市新野县', '新野县', ',1515,1634,', '1634');
INSERT INTO `area` VALUES ('1646', '2013-01-01 09:02:26', '2013-01-01 09:02:26', null, '河南省南阳市桐柏县', '桐柏县', ',1515,1634,', '1634');
INSERT INTO `area` VALUES ('1647', '2013-01-01 09:02:26', '2013-01-01 09:02:26', null, '河南省南阳市邓州市', '邓州市', ',1515,1634,', '1634');
INSERT INTO `area` VALUES ('1648', '2013-01-01 09:02:26', '2013-01-01 09:02:26', null, '河南省商丘市', '商丘市', ',1515,', '1515');
INSERT INTO `area` VALUES ('1649', '2013-01-01 09:02:26', '2013-01-01 09:02:26', null, '河南省商丘市梁园区', '梁园区', ',1515,1648,', '1648');
INSERT INTO `area` VALUES ('1650', '2013-01-01 09:02:26', '2013-01-01 09:02:26', null, '河南省商丘市睢阳区', '睢阳区', ',1515,1648,', '1648');
INSERT INTO `area` VALUES ('1651', '2013-01-01 09:02:26', '2013-01-01 09:02:26', null, '河南省商丘市民权县', '民权县', ',1515,1648,', '1648');
INSERT INTO `area` VALUES ('1652', '2013-01-01 09:02:26', '2013-01-01 09:02:26', null, '河南省商丘市睢县', '睢县', ',1515,1648,', '1648');
INSERT INTO `area` VALUES ('1653', '2013-01-01 09:02:26', '2013-01-01 09:02:26', null, '河南省商丘市宁陵县', '宁陵县', ',1515,1648,', '1648');
INSERT INTO `area` VALUES ('1654', '2013-01-01 09:02:26', '2013-01-01 09:02:26', null, '河南省商丘市柘城县', '柘城县', ',1515,1648,', '1648');
INSERT INTO `area` VALUES ('1655', '2013-01-01 09:02:26', '2013-01-01 09:02:26', null, '河南省商丘市虞城县', '虞城县', ',1515,1648,', '1648');
INSERT INTO `area` VALUES ('1656', '2013-01-01 09:02:26', '2013-01-01 09:02:26', null, '河南省商丘市夏邑县', '夏邑县', ',1515,1648,', '1648');
INSERT INTO `area` VALUES ('1657', '2013-01-01 09:02:26', '2013-01-01 09:02:26', null, '河南省商丘市永城市', '永城市', ',1515,1648,', '1648');
INSERT INTO `area` VALUES ('1658', '2013-01-01 09:02:26', '2013-01-01 09:02:26', null, '河南省信阳市', '信阳市', ',1515,', '1515');
INSERT INTO `area` VALUES ('1659', '2013-01-01 09:02:26', '2013-01-01 09:02:26', null, '河南省信阳市浉河区', '浉河区', ',1515,1658,', '1658');
INSERT INTO `area` VALUES ('1660', '2013-01-01 09:02:26', '2013-01-01 09:02:26', null, '河南省信阳市平桥区', '平桥区', ',1515,1658,', '1658');
INSERT INTO `area` VALUES ('1661', '2013-01-01 09:02:26', '2013-01-01 09:02:26', null, '河南省信阳市罗山县', '罗山县', ',1515,1658,', '1658');
INSERT INTO `area` VALUES ('1662', '2013-01-01 09:02:26', '2013-01-01 09:02:26', null, '河南省信阳市光山县', '光山县', ',1515,1658,', '1658');
INSERT INTO `area` VALUES ('1663', '2013-01-01 09:02:26', '2013-01-01 09:02:26', null, '河南省信阳市新县', '新县', ',1515,1658,', '1658');
INSERT INTO `area` VALUES ('1664', '2013-01-01 09:02:26', '2013-01-01 09:02:26', null, '河南省信阳市商城县', '商城县', ',1515,1658,', '1658');
INSERT INTO `area` VALUES ('1665', '2013-01-01 09:02:26', '2013-01-01 09:02:26', null, '河南省信阳市固始县', '固始县', ',1515,1658,', '1658');
INSERT INTO `area` VALUES ('1666', '2013-01-01 09:02:26', '2013-01-01 09:02:26', null, '河南省信阳市潢川县', '潢川县', ',1515,1658,', '1658');
INSERT INTO `area` VALUES ('1667', '2013-01-01 09:02:26', '2013-01-01 09:02:26', null, '河南省信阳市淮滨县', '淮滨县', ',1515,1658,', '1658');
INSERT INTO `area` VALUES ('1668', '2013-01-01 09:02:26', '2013-01-01 09:02:26', null, '河南省信阳市息县', '息县', ',1515,1658,', '1658');
INSERT INTO `area` VALUES ('1669', '2013-01-01 09:02:26', '2013-01-01 09:02:26', null, '河南省周口市', '周口市', ',1515,', '1515');
INSERT INTO `area` VALUES ('1670', '2013-01-01 09:02:26', '2013-01-01 09:02:26', null, '河南省周口市川汇区', '川汇区', ',1515,1669,', '1669');
INSERT INTO `area` VALUES ('1671', '2013-01-01 09:02:26', '2013-01-01 09:02:26', null, '河南省周口市扶沟县', '扶沟县', ',1515,1669,', '1669');
INSERT INTO `area` VALUES ('1672', '2013-01-01 09:02:26', '2013-01-01 09:02:26', null, '河南省周口市西华县', '西华县', ',1515,1669,', '1669');
INSERT INTO `area` VALUES ('1673', '2013-01-01 09:02:26', '2013-01-01 09:02:26', null, '河南省周口市商水县', '商水县', ',1515,1669,', '1669');
INSERT INTO `area` VALUES ('1674', '2013-01-01 09:02:26', '2013-01-01 09:02:26', null, '河南省周口市沈丘县', '沈丘县', ',1515,1669,', '1669');
INSERT INTO `area` VALUES ('1675', '2013-01-01 09:02:26', '2013-01-01 09:02:26', null, '河南省周口市郸城县', '郸城县', ',1515,1669,', '1669');
INSERT INTO `area` VALUES ('1676', '2013-01-01 09:02:26', '2013-01-01 09:02:26', null, '河南省周口市淮阳县', '淮阳县', ',1515,1669,', '1669');
INSERT INTO `area` VALUES ('1677', '2013-01-01 09:02:26', '2013-01-01 09:02:26', null, '河南省周口市太康县', '太康县', ',1515,1669,', '1669');
INSERT INTO `area` VALUES ('1678', '2013-01-01 09:02:27', '2013-01-01 09:02:27', null, '河南省周口市鹿邑县', '鹿邑县', ',1515,1669,', '1669');
INSERT INTO `area` VALUES ('1679', '2013-01-01 09:02:27', '2013-01-01 09:02:27', null, '河南省周口市项城市', '项城市', ',1515,1669,', '1669');
INSERT INTO `area` VALUES ('1680', '2013-01-01 09:02:27', '2013-01-01 09:02:27', null, '河南省驻马店市', '驻马店市', ',1515,', '1515');
INSERT INTO `area` VALUES ('1681', '2013-01-01 09:02:27', '2013-01-01 09:02:27', null, '河南省驻马店市驿城区', '驿城区', ',1515,1680,', '1680');
INSERT INTO `area` VALUES ('1682', '2013-01-01 09:02:27', '2013-01-01 09:02:27', null, '河南省驻马店市西平县', '西平县', ',1515,1680,', '1680');
INSERT INTO `area` VALUES ('1683', '2013-01-01 09:02:27', '2013-01-01 09:02:27', null, '河南省驻马店市上蔡县', '上蔡县', ',1515,1680,', '1680');
INSERT INTO `area` VALUES ('1684', '2013-01-01 09:02:27', '2013-01-01 09:02:27', null, '河南省驻马店市平舆县', '平舆县', ',1515,1680,', '1680');
INSERT INTO `area` VALUES ('1685', '2013-01-01 09:02:27', '2013-01-01 09:02:27', null, '河南省驻马店市正阳县', '正阳县', ',1515,1680,', '1680');
INSERT INTO `area` VALUES ('1686', '2013-01-01 09:02:27', '2013-01-01 09:02:27', null, '河南省驻马店市确山县', '确山县', ',1515,1680,', '1680');
INSERT INTO `area` VALUES ('1687', '2013-01-01 09:02:27', '2013-01-01 09:02:27', null, '河南省驻马店市泌阳县', '泌阳县', ',1515,1680,', '1680');
INSERT INTO `area` VALUES ('1688', '2013-01-01 09:02:27', '2013-01-01 09:02:27', null, '河南省驻马店市汝南县', '汝南县', ',1515,1680,', '1680');
INSERT INTO `area` VALUES ('1689', '2013-01-01 09:02:27', '2013-01-01 09:02:27', null, '河南省驻马店市遂平县', '遂平县', ',1515,1680,', '1680');
INSERT INTO `area` VALUES ('1690', '2013-01-01 09:02:27', '2013-01-01 09:02:27', null, '河南省驻马店市新蔡县', '新蔡县', ',1515,1680,', '1680');
INSERT INTO `area` VALUES ('1691', '2013-01-01 09:02:27', '2013-01-01 09:02:27', null, '河南省济源市', '济源市', ',1515,', '1515');
INSERT INTO `area` VALUES ('1692', '2013-01-01 09:02:27', '2013-01-01 09:02:27', null, '湖北省', '湖北省', ',', null);
INSERT INTO `area` VALUES ('1693', '2013-01-01 09:02:27', '2013-01-01 09:02:27', null, '湖北省武汉市', '武汉市', ',1692,', '1692');
INSERT INTO `area` VALUES ('1694', '2013-01-01 09:02:27', '2013-01-01 09:02:27', null, '湖北省武汉市江岸区', '江岸区', ',1692,1693,', '1693');
INSERT INTO `area` VALUES ('1695', '2013-01-01 09:02:27', '2013-01-01 09:02:27', null, '湖北省武汉市江汉区', '江汉区', ',1692,1693,', '1693');
INSERT INTO `area` VALUES ('1696', '2013-01-01 09:02:27', '2013-01-01 09:02:27', null, '湖北省武汉市硚口区', '硚口区', ',1692,1693,', '1693');
INSERT INTO `area` VALUES ('1697', '2013-01-01 09:02:27', '2013-01-01 09:02:27', null, '湖北省武汉市汉阳区', '汉阳区', ',1692,1693,', '1693');
INSERT INTO `area` VALUES ('1698', '2013-01-01 09:02:27', '2013-01-01 09:02:27', null, '湖北省武汉市武昌区', '武昌区', ',1692,1693,', '1693');
INSERT INTO `area` VALUES ('1699', '2013-01-01 09:02:27', '2013-01-01 09:02:27', null, '湖北省武汉市青山区', '青山区', ',1692,1693,', '1693');
INSERT INTO `area` VALUES ('1700', '2013-01-01 09:02:27', '2013-01-01 09:02:27', null, '湖北省武汉市洪山区', '洪山区', ',1692,1693,', '1693');
INSERT INTO `area` VALUES ('1701', '2013-01-01 09:02:27', '2013-01-01 09:02:27', null, '湖北省武汉市东西湖区', '东西湖区', ',1692,1693,', '1693');
INSERT INTO `area` VALUES ('1702', '2013-01-01 09:02:27', '2013-01-01 09:02:27', null, '湖北省武汉市汉南区', '汉南区', ',1692,1693,', '1693');
INSERT INTO `area` VALUES ('1703', '2013-01-01 09:02:27', '2013-01-01 09:02:27', null, '湖北省武汉市蔡甸区', '蔡甸区', ',1692,1693,', '1693');
INSERT INTO `area` VALUES ('1704', '2013-01-01 09:02:27', '2013-01-01 09:02:27', null, '湖北省武汉市江夏区', '江夏区', ',1692,1693,', '1693');
INSERT INTO `area` VALUES ('1705', '2013-01-01 09:02:27', '2013-01-01 09:02:27', null, '湖北省武汉市黄陂区', '黄陂区', ',1692,1693,', '1693');
INSERT INTO `area` VALUES ('1706', '2013-01-01 09:02:27', '2013-01-01 09:02:27', null, '湖北省武汉市新洲区', '新洲区', ',1692,1693,', '1693');
INSERT INTO `area` VALUES ('1707', '2013-01-01 09:02:27', '2013-01-01 09:02:27', null, '湖北省黄石市', '黄石市', ',1692,', '1692');
INSERT INTO `area` VALUES ('1708', '2013-01-01 09:02:28', '2013-01-01 09:02:28', null, '湖北省黄石市黄石港区', '黄石港区', ',1692,1707,', '1707');
INSERT INTO `area` VALUES ('1709', '2013-01-01 09:02:28', '2013-01-01 09:02:28', null, '湖北省黄石市西塞山区', '西塞山区', ',1692,1707,', '1707');
INSERT INTO `area` VALUES ('1710', '2013-01-01 09:02:28', '2013-01-01 09:02:28', null, '湖北省黄石市下陆区', '下陆区', ',1692,1707,', '1707');
INSERT INTO `area` VALUES ('1711', '2013-01-01 09:02:28', '2013-01-01 09:02:28', null, '湖北省黄石市铁山区', '铁山区', ',1692,1707,', '1707');
INSERT INTO `area` VALUES ('1712', '2013-01-01 09:02:28', '2013-01-01 09:02:28', null, '湖北省黄石市阳新县', '阳新县', ',1692,1707,', '1707');
INSERT INTO `area` VALUES ('1713', '2013-01-01 09:02:28', '2013-01-01 09:02:28', null, '湖北省黄石市大冶市', '大冶市', ',1692,1707,', '1707');
INSERT INTO `area` VALUES ('1714', '2013-01-01 09:02:28', '2013-01-01 09:02:28', null, '湖北省十堰市', '十堰市', ',1692,', '1692');
INSERT INTO `area` VALUES ('1715', '2013-01-01 09:02:28', '2013-01-01 09:02:28', null, '湖北省十堰市茅箭区', '茅箭区', ',1692,1714,', '1714');
INSERT INTO `area` VALUES ('1716', '2013-01-01 09:02:28', '2013-01-01 09:02:28', null, '湖北省十堰市张湾区', '张湾区', ',1692,1714,', '1714');
INSERT INTO `area` VALUES ('1717', '2013-01-01 09:02:28', '2013-01-01 09:02:28', null, '湖北省十堰市郧县', '郧县', ',1692,1714,', '1714');
INSERT INTO `area` VALUES ('1718', '2013-01-01 09:02:28', '2013-01-01 09:02:28', null, '湖北省十堰市郧西县', '郧西县', ',1692,1714,', '1714');
INSERT INTO `area` VALUES ('1719', '2013-01-01 09:02:28', '2013-01-01 09:02:28', null, '湖北省十堰市竹山县', '竹山县', ',1692,1714,', '1714');
INSERT INTO `area` VALUES ('1720', '2013-01-01 09:02:28', '2013-01-01 09:02:28', null, '湖北省十堰市竹溪县', '竹溪县', ',1692,1714,', '1714');
INSERT INTO `area` VALUES ('1721', '2013-01-01 09:02:28', '2013-01-01 09:02:28', null, '湖北省十堰市房县', '房县', ',1692,1714,', '1714');
INSERT INTO `area` VALUES ('1722', '2013-01-01 09:02:28', '2013-01-01 09:02:28', null, '湖北省十堰市丹江口市', '丹江口市', ',1692,1714,', '1714');
INSERT INTO `area` VALUES ('1723', '2013-01-01 09:02:28', '2013-01-01 09:02:28', null, '湖北省宜昌市', '宜昌市', ',1692,', '1692');
INSERT INTO `area` VALUES ('1724', '2013-01-01 09:02:28', '2013-01-01 09:02:28', null, '湖北省宜昌市西陵区', '西陵区', ',1692,1723,', '1723');
INSERT INTO `area` VALUES ('1725', '2013-01-01 09:02:28', '2013-01-01 09:02:28', null, '湖北省宜昌市伍家岗区', '伍家岗区', ',1692,1723,', '1723');
INSERT INTO `area` VALUES ('1726', '2013-01-01 09:02:28', '2013-01-01 09:02:28', null, '湖北省宜昌市点军区', '点军区', ',1692,1723,', '1723');
INSERT INTO `area` VALUES ('1727', '2013-01-01 09:02:28', '2013-01-01 09:02:28', null, '湖北省宜昌市猇亭区', '猇亭区', ',1692,1723,', '1723');
INSERT INTO `area` VALUES ('1728', '2013-01-01 09:02:28', '2013-01-01 09:02:28', null, '湖北省宜昌市夷陵区', '夷陵区', ',1692,1723,', '1723');
INSERT INTO `area` VALUES ('1729', '2013-01-01 09:02:28', '2013-01-01 09:02:28', null, '湖北省宜昌市远安县', '远安县', ',1692,1723,', '1723');
INSERT INTO `area` VALUES ('1730', '2013-01-01 09:02:28', '2013-01-01 09:02:28', null, '湖北省宜昌市兴山县', '兴山县', ',1692,1723,', '1723');
INSERT INTO `area` VALUES ('1731', '2013-01-01 09:02:28', '2013-01-01 09:02:28', null, '湖北省宜昌市秭归县', '秭归县', ',1692,1723,', '1723');
INSERT INTO `area` VALUES ('1732', '2013-01-01 09:02:28', '2013-01-01 09:02:28', null, '湖北省宜昌市长阳土家族自治县', '长阳土家族自治县', ',1692,1723,', '1723');
INSERT INTO `area` VALUES ('1733', '2013-01-01 09:02:28', '2013-01-01 09:02:28', null, '湖北省宜昌市五峰土家族自治县', '五峰土家族自治县', ',1692,1723,', '1723');
INSERT INTO `area` VALUES ('1734', '2013-01-01 09:02:28', '2013-01-01 09:02:28', null, '湖北省宜昌市宜都市', '宜都市', ',1692,1723,', '1723');
INSERT INTO `area` VALUES ('1735', '2013-01-01 09:02:28', '2013-01-01 09:02:28', null, '湖北省宜昌市当阳市', '当阳市', ',1692,1723,', '1723');
INSERT INTO `area` VALUES ('1736', '2013-01-01 09:02:28', '2013-01-01 09:02:28', null, '湖北省宜昌市枝江市', '枝江市', ',1692,1723,', '1723');
INSERT INTO `area` VALUES ('1737', '2013-01-01 09:02:28', '2013-01-01 09:02:28', null, '湖北省襄阳市', '襄阳市', ',1692,', '1692');
INSERT INTO `area` VALUES ('1738', '2013-01-01 09:02:28', '2013-01-01 09:02:28', null, '湖北省襄阳市襄城区', '襄城区', ',1692,1737,', '1737');
INSERT INTO `area` VALUES ('1739', '2013-01-01 09:02:29', '2013-01-01 09:02:29', null, '湖北省襄阳市樊城区', '樊城区', ',1692,1737,', '1737');
INSERT INTO `area` VALUES ('1740', '2013-01-01 09:02:29', '2013-01-01 09:02:29', null, '湖北省襄阳市襄州区', '襄州区', ',1692,1737,', '1737');
INSERT INTO `area` VALUES ('1741', '2013-01-01 09:02:29', '2013-01-01 09:02:29', null, '湖北省襄阳市南漳县', '南漳县', ',1692,1737,', '1737');
INSERT INTO `area` VALUES ('1742', '2013-01-01 09:02:29', '2013-01-01 09:02:29', null, '湖北省襄阳市谷城县', '谷城县', ',1692,1737,', '1737');
INSERT INTO `area` VALUES ('1743', '2013-01-01 09:02:29', '2013-01-01 09:02:29', null, '湖北省襄阳市保康县', '保康县', ',1692,1737,', '1737');
INSERT INTO `area` VALUES ('1744', '2013-01-01 09:02:29', '2013-01-01 09:02:29', null, '湖北省襄阳市老河口市', '老河口市', ',1692,1737,', '1737');
INSERT INTO `area` VALUES ('1745', '2013-01-01 09:02:29', '2013-01-01 09:02:29', null, '湖北省襄阳市枣阳市', '枣阳市', ',1692,1737,', '1737');
INSERT INTO `area` VALUES ('1746', '2013-01-01 09:02:29', '2013-01-01 09:02:29', null, '湖北省襄阳市宜城市', '宜城市', ',1692,1737,', '1737');
INSERT INTO `area` VALUES ('1747', '2013-01-01 09:02:29', '2013-01-01 09:02:29', null, '湖北省鄂州市', '鄂州市', ',1692,', '1692');
INSERT INTO `area` VALUES ('1748', '2013-01-01 09:02:29', '2013-01-01 09:02:29', null, '湖北省鄂州市梁子湖区', '梁子湖区', ',1692,1747,', '1747');
INSERT INTO `area` VALUES ('1749', '2013-01-01 09:02:29', '2013-01-01 09:02:29', null, '湖北省鄂州市华容区', '华容区', ',1692,1747,', '1747');
INSERT INTO `area` VALUES ('1750', '2013-01-01 09:02:29', '2013-01-01 09:02:29', null, '湖北省鄂州市鄂城区', '鄂城区', ',1692,1747,', '1747');
INSERT INTO `area` VALUES ('1751', '2013-01-01 09:02:29', '2013-01-01 09:02:29', null, '湖北省荆门市', '荆门市', ',1692,', '1692');
INSERT INTO `area` VALUES ('1752', '2013-01-01 09:02:29', '2013-01-01 09:02:29', null, '湖北省荆门市东宝区', '东宝区', ',1692,1751,', '1751');
INSERT INTO `area` VALUES ('1753', '2013-01-01 09:02:29', '2013-01-01 09:02:29', null, '湖北省荆门市掇刀区', '掇刀区', ',1692,1751,', '1751');
INSERT INTO `area` VALUES ('1754', '2013-01-01 09:02:29', '2013-01-01 09:02:29', null, '湖北省荆门市京山县', '京山县', ',1692,1751,', '1751');
INSERT INTO `area` VALUES ('1755', '2013-01-01 09:02:29', '2013-01-01 09:02:29', null, '湖北省荆门市沙洋县', '沙洋县', ',1692,1751,', '1751');
INSERT INTO `area` VALUES ('1756', '2013-01-01 09:02:29', '2013-01-01 09:02:29', null, '湖北省荆门市钟祥市', '钟祥市', ',1692,1751,', '1751');
INSERT INTO `area` VALUES ('1757', '2013-01-01 09:02:29', '2013-01-01 09:02:29', null, '湖北省孝感市', '孝感市', ',1692,', '1692');
INSERT INTO `area` VALUES ('1758', '2013-01-01 09:02:29', '2013-01-01 09:02:29', null, '湖北省孝感市孝南区', '孝南区', ',1692,1757,', '1757');
INSERT INTO `area` VALUES ('1759', '2013-01-01 09:02:29', '2013-01-01 09:02:29', null, '湖北省孝感市孝昌县', '孝昌县', ',1692,1757,', '1757');
INSERT INTO `area` VALUES ('1760', '2013-01-01 09:02:29', '2013-01-01 09:02:29', null, '湖北省孝感市大悟县', '大悟县', ',1692,1757,', '1757');
INSERT INTO `area` VALUES ('1761', '2013-01-01 09:02:29', '2013-01-01 09:02:29', null, '湖北省孝感市云梦县', '云梦县', ',1692,1757,', '1757');
INSERT INTO `area` VALUES ('1762', '2013-01-01 09:02:29', '2013-01-01 09:02:29', null, '湖北省孝感市应城市', '应城市', ',1692,1757,', '1757');
INSERT INTO `area` VALUES ('1763', '2013-01-01 09:02:29', '2013-01-01 09:02:29', null, '湖北省孝感市安陆市', '安陆市', ',1692,1757,', '1757');
INSERT INTO `area` VALUES ('1764', '2013-01-01 09:02:29', '2013-01-01 09:02:29', null, '湖北省孝感市汉川市', '汉川市', ',1692,1757,', '1757');
INSERT INTO `area` VALUES ('1765', '2013-01-01 09:02:29', '2013-01-01 09:02:29', null, '湖北省荆州市', '荆州市', ',1692,', '1692');
INSERT INTO `area` VALUES ('1766', '2013-01-01 09:02:30', '2013-01-01 09:02:30', null, '湖北省荆州市沙市区', '沙市区', ',1692,1765,', '1765');
INSERT INTO `area` VALUES ('1767', '2013-01-01 09:02:30', '2013-01-01 09:02:30', null, '湖北省荆州市荆州区', '荆州区', ',1692,1765,', '1765');
INSERT INTO `area` VALUES ('1768', '2013-01-01 09:02:30', '2013-01-01 09:02:30', null, '湖北省荆州市公安县', '公安县', ',1692,1765,', '1765');
INSERT INTO `area` VALUES ('1769', '2013-01-01 09:02:30', '2013-01-01 09:02:30', null, '湖北省荆州市监利县', '监利县', ',1692,1765,', '1765');
INSERT INTO `area` VALUES ('1770', '2013-01-01 09:02:30', '2013-01-01 09:02:30', null, '湖北省荆州市江陵县', '江陵县', ',1692,1765,', '1765');
INSERT INTO `area` VALUES ('1771', '2013-01-01 09:02:30', '2013-01-01 09:02:30', null, '湖北省荆州市石首市', '石首市', ',1692,1765,', '1765');
INSERT INTO `area` VALUES ('1772', '2013-01-01 09:02:30', '2013-01-01 09:02:30', null, '湖北省荆州市洪湖市', '洪湖市', ',1692,1765,', '1765');
INSERT INTO `area` VALUES ('1773', '2013-01-01 09:02:30', '2013-01-01 09:02:30', null, '湖北省荆州市松滋市', '松滋市', ',1692,1765,', '1765');
INSERT INTO `area` VALUES ('1774', '2013-01-01 09:02:30', '2013-01-01 09:02:30', null, '湖北省黄冈市', '黄冈市', ',1692,', '1692');
INSERT INTO `area` VALUES ('1775', '2013-01-01 09:02:30', '2013-01-01 09:02:30', null, '湖北省黄冈市黄州区', '黄州区', ',1692,1774,', '1774');
INSERT INTO `area` VALUES ('1776', '2013-01-01 09:02:30', '2013-01-01 09:02:30', null, '湖北省黄冈市团风县', '团风县', ',1692,1774,', '1774');
INSERT INTO `area` VALUES ('1777', '2013-01-01 09:02:30', '2013-01-01 09:02:30', null, '湖北省黄冈市红安县', '红安县', ',1692,1774,', '1774');
INSERT INTO `area` VALUES ('1778', '2013-01-01 09:02:30', '2013-01-01 09:02:30', null, '湖北省黄冈市罗田县', '罗田县', ',1692,1774,', '1774');
INSERT INTO `area` VALUES ('1779', '2013-01-01 09:02:30', '2013-01-01 09:02:30', null, '湖北省黄冈市英山县', '英山县', ',1692,1774,', '1774');
INSERT INTO `area` VALUES ('1780', '2013-01-01 09:02:30', '2013-01-01 09:02:30', null, '湖北省黄冈市浠水县', '浠水县', ',1692,1774,', '1774');
INSERT INTO `area` VALUES ('1781', '2013-01-01 09:02:30', '2013-01-01 09:02:30', null, '湖北省黄冈市蕲春县', '蕲春县', ',1692,1774,', '1774');
INSERT INTO `area` VALUES ('1782', '2013-01-01 09:02:30', '2013-01-01 09:02:30', null, '湖北省黄冈市黄梅县', '黄梅县', ',1692,1774,', '1774');
INSERT INTO `area` VALUES ('1783', '2013-01-01 09:02:30', '2013-01-01 09:02:30', null, '湖北省黄冈市麻城市', '麻城市', ',1692,1774,', '1774');
INSERT INTO `area` VALUES ('1784', '2013-01-01 09:02:30', '2013-01-01 09:02:30', null, '湖北省黄冈市武穴市', '武穴市', ',1692,1774,', '1774');
INSERT INTO `area` VALUES ('1785', '2013-01-01 09:02:30', '2013-01-01 09:02:30', null, '湖北省咸宁市', '咸宁市', ',1692,', '1692');
INSERT INTO `area` VALUES ('1786', '2013-01-01 09:02:30', '2013-01-01 09:02:30', null, '湖北省咸宁市咸安区', '咸安区', ',1692,1785,', '1785');
INSERT INTO `area` VALUES ('1787', '2013-01-01 09:02:30', '2013-01-01 09:02:30', null, '湖北省咸宁市嘉鱼县', '嘉鱼县', ',1692,1785,', '1785');
INSERT INTO `area` VALUES ('1788', '2013-01-01 09:02:30', '2013-01-01 09:02:30', null, '湖北省咸宁市通城县', '通城县', ',1692,1785,', '1785');
INSERT INTO `area` VALUES ('1789', '2013-01-01 09:02:30', '2013-01-01 09:02:30', null, '湖北省咸宁市崇阳县', '崇阳县', ',1692,1785,', '1785');
INSERT INTO `area` VALUES ('1790', '2013-01-01 09:02:30', '2013-01-01 09:02:30', null, '湖北省咸宁市通山县', '通山县', ',1692,1785,', '1785');
INSERT INTO `area` VALUES ('1791', '2013-01-01 09:02:30', '2013-01-01 09:02:30', null, '湖北省咸宁市赤壁市', '赤壁市', ',1692,1785,', '1785');
INSERT INTO `area` VALUES ('1792', '2013-01-01 09:02:30', '2013-01-01 09:02:30', null, '湖北省随州市', '随州市', ',1692,', '1692');
INSERT INTO `area` VALUES ('1793', '2013-01-01 09:02:30', '2013-01-01 09:02:30', null, '湖北省随州市曾都区', '曾都区', ',1692,1792,', '1792');
INSERT INTO `area` VALUES ('1794', '2013-01-01 09:02:30', '2013-01-01 09:02:30', null, '湖北省随州市随县', '随县', ',1692,1792,', '1792');
INSERT INTO `area` VALUES ('1795', '2013-01-01 09:02:30', '2013-01-01 09:02:30', null, '湖北省随州市广水市', '广水市', ',1692,1792,', '1792');
INSERT INTO `area` VALUES ('1796', '2013-01-01 09:02:31', '2013-01-01 09:02:31', null, '湖北省恩施土家族苗族自治州', '恩施土家族苗族自治州', ',1692,', '1692');
INSERT INTO `area` VALUES ('1797', '2013-01-01 09:02:31', '2013-01-01 09:02:31', null, '湖北省恩施土家族苗族自治州恩施市', '恩施市', ',1692,1796,', '1796');
INSERT INTO `area` VALUES ('1798', '2013-01-01 09:02:31', '2013-01-01 09:02:31', null, '湖北省恩施土家族苗族自治州利川市', '利川市', ',1692,1796,', '1796');
INSERT INTO `area` VALUES ('1799', '2013-01-01 09:02:31', '2013-01-01 09:02:31', null, '湖北省恩施土家族苗族自治州建始县', '建始县', ',1692,1796,', '1796');
INSERT INTO `area` VALUES ('1800', '2013-01-01 09:02:31', '2013-01-01 09:02:31', null, '湖北省恩施土家族苗族自治州巴东县', '巴东县', ',1692,1796,', '1796');
INSERT INTO `area` VALUES ('1801', '2013-01-01 09:02:31', '2013-01-01 09:02:31', null, '湖北省恩施土家族苗族自治州宣恩县', '宣恩县', ',1692,1796,', '1796');
INSERT INTO `area` VALUES ('1802', '2013-01-01 09:02:31', '2013-01-01 09:02:31', null, '湖北省恩施土家族苗族自治州咸丰县', '咸丰县', ',1692,1796,', '1796');
INSERT INTO `area` VALUES ('1803', '2013-01-01 09:02:31', '2013-01-01 09:02:31', null, '湖北省恩施土家族苗族自治州来凤县', '来凤县', ',1692,1796,', '1796');
INSERT INTO `area` VALUES ('1804', '2013-01-01 09:02:31', '2013-01-01 09:02:31', null, '湖北省恩施土家族苗族自治州鹤峰县', '鹤峰县', ',1692,1796,', '1796');
INSERT INTO `area` VALUES ('1805', '2013-01-01 09:02:31', '2013-01-01 09:02:31', null, '湖北省仙桃市', '仙桃市', ',1692,', '1692');
INSERT INTO `area` VALUES ('1806', '2013-01-01 09:02:31', '2013-01-01 09:02:31', null, '湖北省潜江市', '潜江市', ',1692,', '1692');
INSERT INTO `area` VALUES ('1807', '2013-01-01 09:02:31', '2013-01-01 09:02:31', null, '湖北省天门市', '天门市', ',1692,', '1692');
INSERT INTO `area` VALUES ('1808', '2013-01-01 09:02:31', '2013-01-01 09:02:31', null, '湖北省神农架林区', '神农架林区', ',1692,', '1692');
INSERT INTO `area` VALUES ('1809', '2013-01-01 09:02:31', '2013-01-01 09:02:31', null, '湖南省', '湖南省', ',', null);
INSERT INTO `area` VALUES ('1810', '2013-01-01 09:02:31', '2013-01-01 09:02:31', null, '湖南省长沙市', '长沙市', ',1809,', '1809');
INSERT INTO `area` VALUES ('1811', '2013-01-01 09:02:31', '2013-01-01 09:02:31', null, '湖南省长沙市芙蓉区', '芙蓉区', ',1809,1810,', '1810');
INSERT INTO `area` VALUES ('1812', '2013-01-01 09:02:31', '2013-01-01 09:02:31', null, '湖南省长沙市天心区', '天心区', ',1809,1810,', '1810');
INSERT INTO `area` VALUES ('1813', '2013-01-01 09:02:31', '2013-01-01 09:02:31', null, '湖南省长沙市岳麓区', '岳麓区', ',1809,1810,', '1810');
INSERT INTO `area` VALUES ('1814', '2013-01-01 09:02:31', '2013-01-01 09:02:31', null, '湖南省长沙市开福区', '开福区', ',1809,1810,', '1810');
INSERT INTO `area` VALUES ('1815', '2013-01-01 09:02:31', '2013-01-01 09:02:31', null, '湖南省长沙市雨花区', '雨花区', ',1809,1810,', '1810');
INSERT INTO `area` VALUES ('1816', '2013-01-01 09:02:31', '2013-01-01 09:02:31', null, '湖南省长沙市望城区', '望城区', ',1809,1810,', '1810');
INSERT INTO `area` VALUES ('1817', '2013-01-01 09:02:31', '2013-01-01 09:02:31', null, '湖南省长沙市长沙县', '长沙县', ',1809,1810,', '1810');
INSERT INTO `area` VALUES ('1818', '2013-01-01 09:02:31', '2013-01-01 09:02:31', null, '湖南省长沙市宁乡县', '宁乡县', ',1809,1810,', '1810');
INSERT INTO `area` VALUES ('1819', '2013-01-01 09:02:31', '2013-01-01 09:02:31', null, '湖南省长沙市浏阳市', '浏阳市', ',1809,1810,', '1810');
INSERT INTO `area` VALUES ('1820', '2013-01-01 09:02:31', '2013-01-01 09:02:31', null, '湖南省株洲市', '株洲市', ',1809,', '1809');
INSERT INTO `area` VALUES ('1821', '2013-01-01 09:02:31', '2013-01-01 09:02:31', null, '湖南省株洲市荷塘区', '荷塘区', ',1809,1820,', '1820');
INSERT INTO `area` VALUES ('1822', '2013-01-01 09:02:31', '2013-01-01 09:02:31', null, '湖南省株洲市芦淞区', '芦淞区', ',1809,1820,', '1820');
INSERT INTO `area` VALUES ('1823', '2013-01-01 09:02:31', '2013-01-01 09:02:31', null, '湖南省株洲市石峰区', '石峰区', ',1809,1820,', '1820');
INSERT INTO `area` VALUES ('1824', '2013-01-01 09:02:31', '2013-01-01 09:02:31', null, '湖南省株洲市天元区', '天元区', ',1809,1820,', '1820');
INSERT INTO `area` VALUES ('1825', '2013-01-01 09:02:31', '2013-01-01 09:02:31', null, '湖南省株洲市株洲县', '株洲县', ',1809,1820,', '1820');
INSERT INTO `area` VALUES ('1826', '2013-01-01 09:02:31', '2013-01-01 09:02:31', null, '湖南省株洲市攸县', '攸县', ',1809,1820,', '1820');
INSERT INTO `area` VALUES ('1827', '2013-01-01 09:02:32', '2013-01-01 09:02:32', null, '湖南省株洲市茶陵县', '茶陵县', ',1809,1820,', '1820');
INSERT INTO `area` VALUES ('1828', '2013-01-01 09:02:32', '2013-01-01 09:02:32', null, '湖南省株洲市炎陵县', '炎陵县', ',1809,1820,', '1820');
INSERT INTO `area` VALUES ('1829', '2013-01-01 09:02:32', '2013-01-01 09:02:32', null, '湖南省株洲市醴陵市', '醴陵市', ',1809,1820,', '1820');
INSERT INTO `area` VALUES ('1830', '2013-01-01 09:02:32', '2013-01-01 09:02:32', null, '湖南省湘潭市', '湘潭市', ',1809,', '1809');
INSERT INTO `area` VALUES ('1831', '2013-01-01 09:02:32', '2013-01-01 09:02:32', null, '湖南省湘潭市雨湖区', '雨湖区', ',1809,1830,', '1830');
INSERT INTO `area` VALUES ('1832', '2013-01-01 09:02:32', '2013-01-01 09:02:32', null, '湖南省湘潭市岳塘区', '岳塘区', ',1809,1830,', '1830');
INSERT INTO `area` VALUES ('1833', '2013-01-01 09:02:32', '2013-01-01 09:02:32', null, '湖南省湘潭市湘潭县', '湘潭县', ',1809,1830,', '1830');
INSERT INTO `area` VALUES ('1834', '2013-01-01 09:02:32', '2013-01-01 09:02:32', null, '湖南省湘潭市湘乡市', '湘乡市', ',1809,1830,', '1830');
INSERT INTO `area` VALUES ('1835', '2013-01-01 09:02:32', '2013-01-01 09:02:32', null, '湖南省湘潭市韶山市', '韶山市', ',1809,1830,', '1830');
INSERT INTO `area` VALUES ('1836', '2013-01-01 09:02:32', '2013-01-01 09:02:32', null, '湖南省衡阳市', '衡阳市', ',1809,', '1809');
INSERT INTO `area` VALUES ('1837', '2013-01-01 09:02:32', '2013-01-01 09:02:32', null, '湖南省衡阳市珠晖区', '珠晖区', ',1809,1836,', '1836');
INSERT INTO `area` VALUES ('1838', '2013-01-01 09:02:32', '2013-01-01 09:02:32', null, '湖南省衡阳市雁峰区', '雁峰区', ',1809,1836,', '1836');
INSERT INTO `area` VALUES ('1839', '2013-01-01 09:02:32', '2013-01-01 09:02:32', null, '湖南省衡阳市石鼓区', '石鼓区', ',1809,1836,', '1836');
INSERT INTO `area` VALUES ('1840', '2013-01-01 09:02:32', '2013-01-01 09:02:32', null, '湖南省衡阳市蒸湘区', '蒸湘区', ',1809,1836,', '1836');
INSERT INTO `area` VALUES ('1841', '2013-01-01 09:02:32', '2013-01-01 09:02:32', null, '湖南省衡阳市南岳区', '南岳区', ',1809,1836,', '1836');
INSERT INTO `area` VALUES ('1842', '2013-01-01 09:02:32', '2013-01-01 09:02:32', null, '湖南省衡阳市衡阳县', '衡阳县', ',1809,1836,', '1836');
INSERT INTO `area` VALUES ('1843', '2013-01-01 09:02:32', '2013-01-01 09:02:32', null, '湖南省衡阳市衡南县', '衡南县', ',1809,1836,', '1836');
INSERT INTO `area` VALUES ('1844', '2013-01-01 09:02:32', '2013-01-01 09:02:32', null, '湖南省衡阳市衡山县', '衡山县', ',1809,1836,', '1836');
INSERT INTO `area` VALUES ('1845', '2013-01-01 09:02:32', '2013-01-01 09:02:32', null, '湖南省衡阳市衡东县', '衡东县', ',1809,1836,', '1836');
INSERT INTO `area` VALUES ('1846', '2013-01-01 09:02:32', '2013-01-01 09:02:32', null, '湖南省衡阳市祁东县', '祁东县', ',1809,1836,', '1836');
INSERT INTO `area` VALUES ('1847', '2013-01-01 09:02:32', '2013-01-01 09:02:32', null, '湖南省衡阳市耒阳市', '耒阳市', ',1809,1836,', '1836');
INSERT INTO `area` VALUES ('1848', '2013-01-01 09:02:32', '2013-01-01 09:02:32', null, '湖南省衡阳市常宁市', '常宁市', ',1809,1836,', '1836');
INSERT INTO `area` VALUES ('1849', '2013-01-01 09:02:32', '2013-01-01 09:02:32', null, '湖南省邵阳市', '邵阳市', ',1809,', '1809');
INSERT INTO `area` VALUES ('1850', '2013-01-01 09:02:32', '2013-01-01 09:02:32', null, '湖南省邵阳市双清区', '双清区', ',1809,1849,', '1849');
INSERT INTO `area` VALUES ('1851', '2013-01-01 09:02:32', '2013-01-01 09:02:32', null, '湖南省邵阳市大祥区', '大祥区', ',1809,1849,', '1849');
INSERT INTO `area` VALUES ('1852', '2013-01-01 09:02:32', '2013-01-01 09:02:32', null, '湖南省邵阳市北塔区', '北塔区', ',1809,1849,', '1849');
INSERT INTO `area` VALUES ('1853', '2013-01-01 09:02:32', '2013-01-01 09:02:32', null, '湖南省邵阳市邵东县', '邵东县', ',1809,1849,', '1849');
INSERT INTO `area` VALUES ('1854', '2013-01-01 09:02:32', '2013-01-01 09:02:32', null, '湖南省邵阳市新邵县', '新邵县', ',1809,1849,', '1849');
INSERT INTO `area` VALUES ('1855', '2013-01-01 09:02:32', '2013-01-01 09:02:32', null, '湖南省邵阳市邵阳县', '邵阳县', ',1809,1849,', '1849');
INSERT INTO `area` VALUES ('1856', '2013-01-01 09:02:32', '2013-01-01 09:02:32', null, '湖南省邵阳市隆回县', '隆回县', ',1809,1849,', '1849');
INSERT INTO `area` VALUES ('1857', '2013-01-01 09:02:33', '2013-01-01 09:02:33', null, '湖南省邵阳市洞口县', '洞口县', ',1809,1849,', '1849');
INSERT INTO `area` VALUES ('1858', '2013-01-01 09:02:33', '2013-01-01 09:02:33', null, '湖南省邵阳市绥宁县', '绥宁县', ',1809,1849,', '1849');
INSERT INTO `area` VALUES ('1859', '2013-01-01 09:02:33', '2013-01-01 09:02:33', null, '湖南省邵阳市新宁县', '新宁县', ',1809,1849,', '1849');
INSERT INTO `area` VALUES ('1860', '2013-01-01 09:02:33', '2013-01-01 09:02:33', null, '湖南省邵阳市城步苗族自治县', '城步苗族自治县', ',1809,1849,', '1849');
INSERT INTO `area` VALUES ('1861', '2013-01-01 09:02:33', '2013-01-01 09:02:33', null, '湖南省邵阳市武冈市', '武冈市', ',1809,1849,', '1849');
INSERT INTO `area` VALUES ('1862', '2013-01-01 09:02:33', '2013-01-01 09:02:33', null, '湖南省岳阳市', '岳阳市', ',1809,', '1809');
INSERT INTO `area` VALUES ('1863', '2013-01-01 09:02:33', '2013-01-01 09:02:33', null, '湖南省岳阳市岳阳楼区', '岳阳楼区', ',1809,1862,', '1862');
INSERT INTO `area` VALUES ('1864', '2013-01-01 09:02:33', '2013-01-01 09:02:33', null, '湖南省岳阳市云溪区', '云溪区', ',1809,1862,', '1862');
INSERT INTO `area` VALUES ('1865', '2013-01-01 09:02:33', '2013-01-01 09:02:33', null, '湖南省岳阳市君山区', '君山区', ',1809,1862,', '1862');
INSERT INTO `area` VALUES ('1866', '2013-01-01 09:02:33', '2013-01-01 09:02:33', null, '湖南省岳阳市岳阳县', '岳阳县', ',1809,1862,', '1862');
INSERT INTO `area` VALUES ('1867', '2013-01-01 09:02:33', '2013-01-01 09:02:33', null, '湖南省岳阳市华容县', '华容县', ',1809,1862,', '1862');
INSERT INTO `area` VALUES ('1868', '2013-01-01 09:02:33', '2013-01-01 09:02:33', null, '湖南省岳阳市湘阴县', '湘阴县', ',1809,1862,', '1862');
INSERT INTO `area` VALUES ('1869', '2013-01-01 09:02:33', '2013-01-01 09:02:33', null, '湖南省岳阳市平江县', '平江县', ',1809,1862,', '1862');
INSERT INTO `area` VALUES ('1870', '2013-01-01 09:02:33', '2013-01-01 09:02:33', null, '湖南省岳阳市汨罗市', '汨罗市', ',1809,1862,', '1862');
INSERT INTO `area` VALUES ('1871', '2013-01-01 09:02:33', '2013-01-01 09:02:33', null, '湖南省岳阳市临湘市', '临湘市', ',1809,1862,', '1862');
INSERT INTO `area` VALUES ('1872', '2013-01-01 09:02:33', '2013-01-01 09:02:33', null, '湖南省常德市', '常德市', ',1809,', '1809');
INSERT INTO `area` VALUES ('1873', '2013-01-01 09:02:33', '2013-01-01 09:02:33', null, '湖南省常德市武陵区', '武陵区', ',1809,1872,', '1872');
INSERT INTO `area` VALUES ('1874', '2013-01-01 09:02:33', '2013-01-01 09:02:33', null, '湖南省常德市鼎城区', '鼎城区', ',1809,1872,', '1872');
INSERT INTO `area` VALUES ('1875', '2013-01-01 09:02:33', '2013-01-01 09:02:33', null, '湖南省常德市安乡县', '安乡县', ',1809,1872,', '1872');
INSERT INTO `area` VALUES ('1876', '2013-01-01 09:02:33', '2013-01-01 09:02:33', null, '湖南省常德市汉寿县', '汉寿县', ',1809,1872,', '1872');
INSERT INTO `area` VALUES ('1877', '2013-01-01 09:02:33', '2013-01-01 09:02:33', null, '湖南省常德市澧县', '澧县', ',1809,1872,', '1872');
INSERT INTO `area` VALUES ('1878', '2013-01-01 09:02:33', '2013-01-01 09:02:33', null, '湖南省常德市临澧县', '临澧县', ',1809,1872,', '1872');
INSERT INTO `area` VALUES ('1879', '2013-01-01 09:02:33', '2013-01-01 09:02:33', null, '湖南省常德市桃源县', '桃源县', ',1809,1872,', '1872');
INSERT INTO `area` VALUES ('1880', '2013-01-01 09:02:33', '2013-01-01 09:02:33', null, '湖南省常德市石门县', '石门县', ',1809,1872,', '1872');
INSERT INTO `area` VALUES ('1881', '2013-01-01 09:02:33', '2013-01-01 09:02:33', null, '湖南省常德市津市市', '津市市', ',1809,1872,', '1872');
INSERT INTO `area` VALUES ('1882', '2013-01-01 09:02:33', '2013-01-01 09:02:33', null, '湖南省张家界市', '张家界市', ',1809,', '1809');
INSERT INTO `area` VALUES ('1883', '2013-01-01 09:02:33', '2013-01-01 09:02:33', null, '湖南省张家界市永定区', '永定区', ',1809,1882,', '1882');
INSERT INTO `area` VALUES ('1884', '2013-01-01 09:02:33', '2013-01-01 09:02:33', null, '湖南省张家界市武陵源区', '武陵源区', ',1809,1882,', '1882');
INSERT INTO `area` VALUES ('1885', '2013-01-01 09:02:33', '2013-01-01 09:02:33', null, '湖南省张家界市慈利县', '慈利县', ',1809,1882,', '1882');
INSERT INTO `area` VALUES ('1886', '2013-01-01 09:02:33', '2013-01-01 09:02:33', null, '湖南省张家界市桑植县', '桑植县', ',1809,1882,', '1882');
INSERT INTO `area` VALUES ('1887', '2013-01-01 09:02:34', '2013-01-01 09:02:34', null, '湖南省益阳市', '益阳市', ',1809,', '1809');
INSERT INTO `area` VALUES ('1888', '2013-01-01 09:02:34', '2013-01-01 09:02:34', null, '湖南省益阳市资阳区', '资阳区', ',1809,1887,', '1887');
INSERT INTO `area` VALUES ('1889', '2013-01-01 09:02:34', '2013-01-01 09:02:34', null, '湖南省益阳市赫山区', '赫山区', ',1809,1887,', '1887');
INSERT INTO `area` VALUES ('1890', '2013-01-01 09:02:34', '2013-01-01 09:02:34', null, '湖南省益阳市南县', '南县', ',1809,1887,', '1887');
INSERT INTO `area` VALUES ('1891', '2013-01-01 09:02:34', '2013-01-01 09:02:34', null, '湖南省益阳市桃江县', '桃江县', ',1809,1887,', '1887');
INSERT INTO `area` VALUES ('1892', '2013-01-01 09:02:34', '2013-01-01 09:02:34', null, '湖南省益阳市安化县', '安化县', ',1809,1887,', '1887');
INSERT INTO `area` VALUES ('1893', '2013-01-01 09:02:34', '2013-01-01 09:02:34', null, '湖南省益阳市沅江市', '沅江市', ',1809,1887,', '1887');
INSERT INTO `area` VALUES ('1894', '2013-01-01 09:02:34', '2013-01-01 09:02:34', null, '湖南省郴州市', '郴州市', ',1809,', '1809');
INSERT INTO `area` VALUES ('1895', '2013-01-01 09:02:34', '2013-01-01 09:02:34', null, '湖南省郴州市北湖区', '北湖区', ',1809,1894,', '1894');
INSERT INTO `area` VALUES ('1896', '2013-01-01 09:02:34', '2013-01-01 09:02:34', null, '湖南省郴州市苏仙区', '苏仙区', ',1809,1894,', '1894');
INSERT INTO `area` VALUES ('1897', '2013-01-01 09:02:34', '2013-01-01 09:02:34', null, '湖南省郴州市桂阳县', '桂阳县', ',1809,1894,', '1894');
INSERT INTO `area` VALUES ('1898', '2013-01-01 09:02:34', '2013-01-01 09:02:34', null, '湖南省郴州市宜章县', '宜章县', ',1809,1894,', '1894');
INSERT INTO `area` VALUES ('1899', '2013-01-01 09:02:34', '2013-01-01 09:02:34', null, '湖南省郴州市永兴县', '永兴县', ',1809,1894,', '1894');
INSERT INTO `area` VALUES ('1900', '2013-01-01 09:02:34', '2013-01-01 09:02:34', null, '湖南省郴州市嘉禾县', '嘉禾县', ',1809,1894,', '1894');
INSERT INTO `area` VALUES ('1901', '2013-01-01 09:02:34', '2013-01-01 09:02:34', null, '湖南省郴州市临武县', '临武县', ',1809,1894,', '1894');
INSERT INTO `area` VALUES ('1902', '2013-01-01 09:02:34', '2013-01-01 09:02:34', null, '湖南省郴州市汝城县', '汝城县', ',1809,1894,', '1894');
INSERT INTO `area` VALUES ('1903', '2013-01-01 09:02:34', '2013-01-01 09:02:34', null, '湖南省郴州市桂东县', '桂东县', ',1809,1894,', '1894');
INSERT INTO `area` VALUES ('1904', '2013-01-01 09:02:34', '2013-01-01 09:02:34', null, '湖南省郴州市安仁县', '安仁县', ',1809,1894,', '1894');
INSERT INTO `area` VALUES ('1905', '2013-01-01 09:02:34', '2013-01-01 09:02:34', null, '湖南省郴州市资兴市', '资兴市', ',1809,1894,', '1894');
INSERT INTO `area` VALUES ('1906', '2013-01-01 09:02:34', '2013-01-01 09:02:34', null, '湖南省永州市', '永州市', ',1809,', '1809');
INSERT INTO `area` VALUES ('1907', '2013-01-01 09:02:34', '2013-01-01 09:02:34', null, '湖南省永州市零陵区', '零陵区', ',1809,1906,', '1906');
INSERT INTO `area` VALUES ('1908', '2013-01-01 09:02:34', '2013-01-01 09:02:34', null, '湖南省永州市冷水滩区', '冷水滩区', ',1809,1906,', '1906');
INSERT INTO `area` VALUES ('1909', '2013-01-01 09:02:34', '2013-01-01 09:02:34', null, '湖南省永州市祁阳县', '祁阳县', ',1809,1906,', '1906');
INSERT INTO `area` VALUES ('1910', '2013-01-01 09:02:34', '2013-01-01 09:02:34', null, '湖南省永州市东安县', '东安县', ',1809,1906,', '1906');
INSERT INTO `area` VALUES ('1911', '2013-01-01 09:02:34', '2013-01-01 09:02:34', null, '湖南省永州市双牌县', '双牌县', ',1809,1906,', '1906');
INSERT INTO `area` VALUES ('1912', '2013-01-01 09:02:34', '2013-01-01 09:02:34', null, '湖南省永州市道县', '道县', ',1809,1906,', '1906');
INSERT INTO `area` VALUES ('1913', '2013-01-01 09:02:34', '2013-01-01 09:02:34', null, '湖南省永州市江永县', '江永县', ',1809,1906,', '1906');
INSERT INTO `area` VALUES ('1914', '2013-01-01 09:02:34', '2013-01-01 09:02:34', null, '湖南省永州市宁远县', '宁远县', ',1809,1906,', '1906');
INSERT INTO `area` VALUES ('1915', '2013-01-01 09:02:34', '2013-01-01 09:02:34', null, '湖南省永州市蓝山县', '蓝山县', ',1809,1906,', '1906');
INSERT INTO `area` VALUES ('1916', '2013-01-01 09:02:35', '2013-01-01 09:02:35', null, '湖南省永州市新田县', '新田县', ',1809,1906,', '1906');
INSERT INTO `area` VALUES ('1917', '2013-01-01 09:02:35', '2013-01-01 09:02:35', null, '湖南省永州市江华瑶族自治县', '江华瑶族自治县', ',1809,1906,', '1906');
INSERT INTO `area` VALUES ('1918', '2013-01-01 09:02:35', '2013-01-01 09:02:35', null, '湖南省怀化市', '怀化市', ',1809,', '1809');
INSERT INTO `area` VALUES ('1919', '2013-01-01 09:02:35', '2013-01-01 09:02:35', null, '湖南省怀化市鹤城区', '鹤城区', ',1809,1918,', '1918');
INSERT INTO `area` VALUES ('1920', '2013-01-01 09:02:35', '2013-01-01 09:02:35', null, '湖南省怀化市中方县', '中方县', ',1809,1918,', '1918');
INSERT INTO `area` VALUES ('1921', '2013-01-01 09:02:35', '2013-01-01 09:02:35', null, '湖南省怀化市沅陵县', '沅陵县', ',1809,1918,', '1918');
INSERT INTO `area` VALUES ('1922', '2013-01-01 09:02:35', '2013-01-01 09:02:35', null, '湖南省怀化市辰溪县', '辰溪县', ',1809,1918,', '1918');
INSERT INTO `area` VALUES ('1923', '2013-01-01 09:02:35', '2013-01-01 09:02:35', null, '湖南省怀化市溆浦县', '溆浦县', ',1809,1918,', '1918');
INSERT INTO `area` VALUES ('1924', '2013-01-01 09:02:35', '2013-01-01 09:02:35', null, '湖南省怀化市会同县', '会同县', ',1809,1918,', '1918');
INSERT INTO `area` VALUES ('1925', '2013-01-01 09:02:35', '2013-01-01 09:02:35', null, '湖南省怀化市麻阳苗族自治县', '麻阳苗族自治县', ',1809,1918,', '1918');
INSERT INTO `area` VALUES ('1926', '2013-01-01 09:02:35', '2013-01-01 09:02:35', null, '湖南省怀化市新晃侗族自治县', '新晃侗族自治县', ',1809,1918,', '1918');
INSERT INTO `area` VALUES ('1927', '2013-01-01 09:02:35', '2013-01-01 09:02:35', null, '湖南省怀化市芷江侗族自治县', '芷江侗族自治县', ',1809,1918,', '1918');
INSERT INTO `area` VALUES ('1928', '2013-01-01 09:02:35', '2013-01-01 09:02:35', null, '湖南省怀化市靖州苗族侗族自治县', '靖州苗族侗族自治县', ',1809,1918,', '1918');
INSERT INTO `area` VALUES ('1929', '2013-01-01 09:02:35', '2013-01-01 09:02:35', null, '湖南省怀化市通道侗族自治县', '通道侗族自治县', ',1809,1918,', '1918');
INSERT INTO `area` VALUES ('1930', '2013-01-01 09:02:35', '2013-01-01 09:02:35', null, '湖南省怀化市洪江市', '洪江市', ',1809,1918,', '1918');
INSERT INTO `area` VALUES ('1931', '2013-01-01 09:02:35', '2013-01-01 09:02:35', null, '湖南省娄底市', '娄底市', ',1809,', '1809');
INSERT INTO `area` VALUES ('1932', '2013-01-01 09:02:35', '2013-01-01 09:02:35', null, '湖南省娄底市娄星区', '娄星区', ',1809,1931,', '1931');
INSERT INTO `area` VALUES ('1933', '2013-01-01 09:02:35', '2013-01-01 09:02:35', null, '湖南省娄底市双峰县', '双峰县', ',1809,1931,', '1931');
INSERT INTO `area` VALUES ('1934', '2013-01-01 09:02:35', '2013-01-01 09:02:35', null, '湖南省娄底市新化县', '新化县', ',1809,1931,', '1931');
INSERT INTO `area` VALUES ('1935', '2013-01-01 09:02:35', '2013-01-01 09:02:35', null, '湖南省娄底市冷水江市', '冷水江市', ',1809,1931,', '1931');
INSERT INTO `area` VALUES ('1936', '2013-01-01 09:02:35', '2013-01-01 09:02:35', null, '湖南省娄底市涟源市', '涟源市', ',1809,1931,', '1931');
INSERT INTO `area` VALUES ('1937', '2013-01-01 09:02:35', '2013-01-01 09:02:35', null, '湖南省湘西土家族苗族自治州', '湘西土家族苗族自治州', ',1809,', '1809');
INSERT INTO `area` VALUES ('1938', '2013-01-01 09:02:35', '2013-01-01 09:02:35', null, '湖南省湘西土家族苗族自治州吉首市', '吉首市', ',1809,1937,', '1937');
INSERT INTO `area` VALUES ('1939', '2013-01-01 09:02:35', '2013-01-01 09:02:35', null, '湖南省湘西土家族苗族自治州泸溪县', '泸溪县', ',1809,1937,', '1937');
INSERT INTO `area` VALUES ('1940', '2013-01-01 09:02:35', '2013-01-01 09:02:35', null, '湖南省湘西土家族苗族自治州凤凰县', '凤凰县', ',1809,1937,', '1937');
INSERT INTO `area` VALUES ('1941', '2013-01-01 09:02:35', '2013-01-01 09:02:35', null, '湖南省湘西土家族苗族自治州花垣县', '花垣县', ',1809,1937,', '1937');
INSERT INTO `area` VALUES ('1942', '2013-01-01 09:02:35', '2013-01-01 09:02:35', null, '湖南省湘西土家族苗族自治州保靖县', '保靖县', ',1809,1937,', '1937');
INSERT INTO `area` VALUES ('1943', '2013-01-01 09:02:35', '2013-01-01 09:02:35', null, '湖南省湘西土家族苗族自治州古丈县', '古丈县', ',1809,1937,', '1937');
INSERT INTO `area` VALUES ('1944', '2013-01-01 09:02:35', '2013-01-01 09:02:35', null, '湖南省湘西土家族苗族自治州永顺县', '永顺县', ',1809,1937,', '1937');
INSERT INTO `area` VALUES ('1945', '2013-01-01 09:02:36', '2013-01-01 09:02:36', null, '湖南省湘西土家族苗族自治州龙山县', '龙山县', ',1809,1937,', '1937');
INSERT INTO `area` VALUES ('1946', '2013-01-01 09:02:36', '2013-01-01 09:02:36', null, '广东省', '广东省', ',', null);
INSERT INTO `area` VALUES ('1947', '2013-01-01 09:02:36', '2013-01-01 09:02:36', null, '广东省广州市', '广州市', ',1946,', '1946');
INSERT INTO `area` VALUES ('1948', '2013-01-01 09:02:36', '2013-01-01 09:02:36', null, '广东省广州市荔湾区', '荔湾区', ',1946,1947,', '1947');
INSERT INTO `area` VALUES ('1949', '2013-01-01 09:02:36', '2013-01-01 09:02:36', null, '广东省广州市越秀区', '越秀区', ',1946,1947,', '1947');
INSERT INTO `area` VALUES ('1950', '2013-01-01 09:02:36', '2013-01-01 09:02:36', null, '广东省广州市海珠区', '海珠区', ',1946,1947,', '1947');
INSERT INTO `area` VALUES ('1951', '2013-01-01 09:02:36', '2013-01-01 09:02:36', null, '广东省广州市天河区', '天河区', ',1946,1947,', '1947');
INSERT INTO `area` VALUES ('1952', '2013-01-01 09:02:36', '2013-01-01 09:02:36', null, '广东省广州市白云区', '白云区', ',1946,1947,', '1947');
INSERT INTO `area` VALUES ('1953', '2013-01-01 09:02:36', '2013-01-01 09:02:36', null, '广东省广州市黄埔区', '黄埔区', ',1946,1947,', '1947');
INSERT INTO `area` VALUES ('1954', '2013-01-01 09:02:36', '2013-01-01 09:02:36', null, '广东省广州市番禺区', '番禺区', ',1946,1947,', '1947');
INSERT INTO `area` VALUES ('1955', '2013-01-01 09:02:36', '2013-01-01 09:02:36', null, '广东省广州市花都区', '花都区', ',1946,1947,', '1947');
INSERT INTO `area` VALUES ('1956', '2013-01-01 09:02:36', '2013-01-01 09:02:36', null, '广东省广州市南沙区', '南沙区', ',1946,1947,', '1947');
INSERT INTO `area` VALUES ('1957', '2013-01-01 09:02:36', '2013-01-01 09:02:36', null, '广东省广州市萝岗区', '萝岗区', ',1946,1947,', '1947');
INSERT INTO `area` VALUES ('1958', '2013-01-01 09:02:36', '2013-01-01 09:02:36', null, '广东省广州市增城市', '增城市', ',1946,1947,', '1947');
INSERT INTO `area` VALUES ('1959', '2013-01-01 09:02:36', '2013-01-01 09:02:36', null, '广东省广州市从化市', '从化市', ',1946,1947,', '1947');
INSERT INTO `area` VALUES ('1960', '2013-01-01 09:02:36', '2013-01-01 09:02:36', null, '广东省韶关市', '韶关市', ',1946,', '1946');
INSERT INTO `area` VALUES ('1961', '2013-01-01 09:02:36', '2013-01-01 09:02:36', null, '广东省韶关市武江区', '武江区', ',1946,1960,', '1960');
INSERT INTO `area` VALUES ('1962', '2013-01-01 09:02:36', '2013-01-01 09:02:36', null, '广东省韶关市浈江区', '浈江区', ',1946,1960,', '1960');
INSERT INTO `area` VALUES ('1963', '2013-01-01 09:02:36', '2013-01-01 09:02:36', null, '广东省韶关市曲江区', '曲江区', ',1946,1960,', '1960');
INSERT INTO `area` VALUES ('1964', '2013-01-01 09:02:36', '2013-01-01 09:02:36', null, '广东省韶关市始兴县', '始兴县', ',1946,1960,', '1960');
INSERT INTO `area` VALUES ('1965', '2013-01-01 09:02:36', '2013-01-01 09:02:36', null, '广东省韶关市仁化县', '仁化县', ',1946,1960,', '1960');
INSERT INTO `area` VALUES ('1966', '2013-01-01 09:02:36', '2013-01-01 09:02:36', null, '广东省韶关市翁源县', '翁源县', ',1946,1960,', '1960');
INSERT INTO `area` VALUES ('1967', '2013-01-01 09:02:36', '2013-01-01 09:02:36', null, '广东省韶关市乳源瑶族自治县', '乳源瑶族自治县', ',1946,1960,', '1960');
INSERT INTO `area` VALUES ('1968', '2013-01-01 09:02:36', '2013-01-01 09:02:36', null, '广东省韶关市新丰县', '新丰县', ',1946,1960,', '1960');
INSERT INTO `area` VALUES ('1969', '2013-01-01 09:02:36', '2013-01-01 09:02:36', null, '广东省韶关市乐昌市', '乐昌市', ',1946,1960,', '1960');
INSERT INTO `area` VALUES ('1970', '2013-01-01 09:02:36', '2013-01-01 09:02:36', null, '广东省韶关市南雄市', '南雄市', ',1946,1960,', '1960');
INSERT INTO `area` VALUES ('1971', '2013-01-01 09:02:36', '2013-01-01 09:02:36', null, '广东省深圳市', '深圳市', ',1946,', '1946');
INSERT INTO `area` VALUES ('1972', '2013-01-01 09:02:36', '2013-01-01 09:02:36', null, '广东省深圳市罗湖区', '罗湖区', ',1946,1971,', '1971');
INSERT INTO `area` VALUES ('1973', '2013-01-01 09:02:36', '2013-01-01 09:02:36', null, '广东省深圳市福田区', '福田区', ',1946,1971,', '1971');
INSERT INTO `area` VALUES ('1974', '2013-01-01 09:02:37', '2013-01-01 09:02:37', null, '广东省深圳市南山区', '南山区', ',1946,1971,', '1971');
INSERT INTO `area` VALUES ('1975', '2013-01-01 09:02:37', '2013-01-01 09:02:37', null, '广东省深圳市宝安区', '宝安区', ',1946,1971,', '1971');
INSERT INTO `area` VALUES ('1976', '2013-01-01 09:02:37', '2013-01-01 09:02:37', null, '广东省深圳市龙岗区', '龙岗区', ',1946,1971,', '1971');
INSERT INTO `area` VALUES ('1977', '2013-01-01 09:02:37', '2013-01-01 09:02:37', null, '广东省深圳市盐田区', '盐田区', ',1946,1971,', '1971');
INSERT INTO `area` VALUES ('1978', '2013-01-01 09:02:37', '2013-01-01 09:02:37', null, '广东省珠海市', '珠海市', ',1946,', '1946');
INSERT INTO `area` VALUES ('1979', '2013-01-01 09:02:37', '2013-01-01 09:02:37', null, '广东省珠海市香洲区', '香洲区', ',1946,1978,', '1978');
INSERT INTO `area` VALUES ('1980', '2013-01-01 09:02:37', '2013-01-01 09:02:37', null, '广东省珠海市斗门区', '斗门区', ',1946,1978,', '1978');
INSERT INTO `area` VALUES ('1981', '2013-01-01 09:02:37', '2013-01-01 09:02:37', null, '广东省珠海市金湾区', '金湾区', ',1946,1978,', '1978');
INSERT INTO `area` VALUES ('1982', '2013-01-01 09:02:37', '2013-01-01 09:02:37', null, '广东省汕头市', '汕头市', ',1946,', '1946');
INSERT INTO `area` VALUES ('1983', '2013-01-01 09:02:37', '2013-01-01 09:02:37', null, '广东省汕头市龙湖区', '龙湖区', ',1946,1982,', '1982');
INSERT INTO `area` VALUES ('1984', '2013-01-01 09:02:37', '2013-01-01 09:02:37', null, '广东省汕头市金平区', '金平区', ',1946,1982,', '1982');
INSERT INTO `area` VALUES ('1985', '2013-01-01 09:02:37', '2013-01-01 09:02:37', null, '广东省汕头市濠江区', '濠江区', ',1946,1982,', '1982');
INSERT INTO `area` VALUES ('1986', '2013-01-01 09:02:37', '2013-01-01 09:02:37', null, '广东省汕头市潮阳区', '潮阳区', ',1946,1982,', '1982');
INSERT INTO `area` VALUES ('1987', '2013-01-01 09:02:37', '2013-01-01 09:02:37', null, '广东省汕头市潮南区', '潮南区', ',1946,1982,', '1982');
INSERT INTO `area` VALUES ('1988', '2013-01-01 09:02:37', '2013-01-01 09:02:37', null, '广东省汕头市澄海区', '澄海区', ',1946,1982,', '1982');
INSERT INTO `area` VALUES ('1989', '2013-01-01 09:02:37', '2013-01-01 09:02:37', null, '广东省汕头市南澳县', '南澳县', ',1946,1982,', '1982');
INSERT INTO `area` VALUES ('1990', '2013-01-01 09:02:37', '2013-01-01 09:02:37', null, '广东省佛山市', '佛山市', ',1946,', '1946');
INSERT INTO `area` VALUES ('1991', '2013-01-01 09:02:37', '2013-01-01 09:02:37', null, '广东省佛山市禅城区', '禅城区', ',1946,1990,', '1990');
INSERT INTO `area` VALUES ('1992', '2013-01-01 09:02:37', '2013-01-01 09:02:37', null, '广东省佛山市南海区', '南海区', ',1946,1990,', '1990');
INSERT INTO `area` VALUES ('1993', '2013-01-01 09:02:37', '2013-01-01 09:02:37', null, '广东省佛山市顺德区', '顺德区', ',1946,1990,', '1990');
INSERT INTO `area` VALUES ('1994', '2013-01-01 09:02:37', '2013-01-01 09:02:37', null, '广东省佛山市三水区', '三水区', ',1946,1990,', '1990');
INSERT INTO `area` VALUES ('1995', '2013-01-01 09:02:37', '2013-01-01 09:02:37', null, '广东省佛山市高明区', '高明区', ',1946,1990,', '1990');
INSERT INTO `area` VALUES ('1996', '2013-01-01 09:02:37', '2013-01-01 09:02:37', null, '广东省江门市', '江门市', ',1946,', '1946');
INSERT INTO `area` VALUES ('1997', '2013-01-01 09:02:37', '2013-01-01 09:02:37', null, '广东省江门市蓬江区', '蓬江区', ',1946,1996,', '1996');
INSERT INTO `area` VALUES ('1998', '2013-01-01 09:02:37', '2013-01-01 09:02:37', null, '广东省江门市江海区', '江海区', ',1946,1996,', '1996');
INSERT INTO `area` VALUES ('1999', '2013-01-01 09:02:37', '2013-01-01 09:02:37', null, '广东省江门市新会区', '新会区', ',1946,1996,', '1996');
INSERT INTO `area` VALUES ('2000', '2013-01-01 09:02:37', '2013-01-01 09:02:37', null, '广东省江门市台山市', '台山市', ',1946,1996,', '1996');
INSERT INTO `area` VALUES ('2001', '2013-01-01 09:02:38', '2013-01-01 09:02:38', null, '广东省江门市开平市', '开平市', ',1946,1996,', '1996');
INSERT INTO `area` VALUES ('2002', '2013-01-01 09:02:38', '2013-01-01 09:02:38', null, '广东省江门市鹤山市', '鹤山市', ',1946,1996,', '1996');
INSERT INTO `area` VALUES ('2003', '2013-01-01 09:02:38', '2013-01-01 09:02:38', null, '广东省江门市恩平市', '恩平市', ',1946,1996,', '1996');
INSERT INTO `area` VALUES ('2004', '2013-01-01 09:02:38', '2013-01-01 09:02:38', null, '广东省湛江市', '湛江市', ',1946,', '1946');
INSERT INTO `area` VALUES ('2005', '2013-01-01 09:02:38', '2013-01-01 09:02:38', null, '广东省湛江市赤坎区', '赤坎区', ',1946,2004,', '2004');
INSERT INTO `area` VALUES ('2006', '2013-01-01 09:02:38', '2013-01-01 09:02:38', null, '广东省湛江市霞山区', '霞山区', ',1946,2004,', '2004');
INSERT INTO `area` VALUES ('2007', '2013-01-01 09:02:38', '2013-01-01 09:02:38', null, '广东省湛江市坡头区', '坡头区', ',1946,2004,', '2004');
INSERT INTO `area` VALUES ('2008', '2013-01-01 09:02:38', '2013-01-01 09:02:38', null, '广东省湛江市麻章区', '麻章区', ',1946,2004,', '2004');
INSERT INTO `area` VALUES ('2009', '2013-01-01 09:02:38', '2013-01-01 09:02:38', null, '广东省湛江市遂溪县', '遂溪县', ',1946,2004,', '2004');
INSERT INTO `area` VALUES ('2010', '2013-01-01 09:02:38', '2013-01-01 09:02:38', null, '广东省湛江市徐闻县', '徐闻县', ',1946,2004,', '2004');
INSERT INTO `area` VALUES ('2011', '2013-01-01 09:02:38', '2013-01-01 09:02:38', null, '广东省湛江市廉江市', '廉江市', ',1946,2004,', '2004');
INSERT INTO `area` VALUES ('2012', '2013-01-01 09:02:38', '2013-01-01 09:02:38', null, '广东省湛江市雷州市', '雷州市', ',1946,2004,', '2004');
INSERT INTO `area` VALUES ('2013', '2013-01-01 09:02:38', '2013-01-01 09:02:38', null, '广东省湛江市吴川市', '吴川市', ',1946,2004,', '2004');
INSERT INTO `area` VALUES ('2014', '2013-01-01 09:02:38', '2013-01-01 09:02:38', null, '广东省茂名市', '茂名市', ',1946,', '1946');
INSERT INTO `area` VALUES ('2015', '2013-01-01 09:02:38', '2013-01-01 09:02:38', null, '广东省茂名市茂南区', '茂南区', ',1946,2014,', '2014');
INSERT INTO `area` VALUES ('2016', '2013-01-01 09:02:38', '2013-01-01 09:02:38', null, '广东省茂名市茂港区', '茂港区', ',1946,2014,', '2014');
INSERT INTO `area` VALUES ('2017', '2013-01-01 09:02:38', '2013-01-01 09:02:38', null, '广东省茂名市电白县', '电白县', ',1946,2014,', '2014');
INSERT INTO `area` VALUES ('2018', '2013-01-01 09:02:38', '2013-01-01 09:02:38', null, '广东省茂名市高州市', '高州市', ',1946,2014,', '2014');
INSERT INTO `area` VALUES ('2019', '2013-01-01 09:02:38', '2013-01-01 09:02:38', null, '广东省茂名市化州市', '化州市', ',1946,2014,', '2014');
INSERT INTO `area` VALUES ('2020', '2013-01-01 09:02:38', '2013-01-01 09:02:38', null, '广东省茂名市信宜市', '信宜市', ',1946,2014,', '2014');
INSERT INTO `area` VALUES ('2021', '2013-01-01 09:02:38', '2013-01-01 09:02:38', null, '广东省肇庆市', '肇庆市', ',1946,', '1946');
INSERT INTO `area` VALUES ('2022', '2013-01-01 09:02:38', '2013-01-01 09:02:38', null, '广东省肇庆市端州区', '端州区', ',1946,2021,', '2021');
INSERT INTO `area` VALUES ('2023', '2013-01-01 09:02:38', '2013-01-01 09:02:38', null, '广东省肇庆市鼎湖区', '鼎湖区', ',1946,2021,', '2021');
INSERT INTO `area` VALUES ('2024', '2013-01-01 09:02:38', '2013-01-01 09:02:38', null, '广东省肇庆市广宁县', '广宁县', ',1946,2021,', '2021');
INSERT INTO `area` VALUES ('2025', '2013-01-01 09:02:38', '2013-01-01 09:02:38', null, '广东省肇庆市怀集县', '怀集县', ',1946,2021,', '2021');
INSERT INTO `area` VALUES ('2026', '2013-01-01 09:02:38', '2013-01-01 09:02:38', null, '广东省肇庆市封开县', '封开县', ',1946,2021,', '2021');
INSERT INTO `area` VALUES ('2027', '2013-01-01 09:02:38', '2013-01-01 09:02:38', null, '广东省肇庆市德庆县', '德庆县', ',1946,2021,', '2021');
INSERT INTO `area` VALUES ('2028', '2013-01-01 09:02:39', '2013-01-01 09:02:39', null, '广东省肇庆市高要市', '高要市', ',1946,2021,', '2021');
INSERT INTO `area` VALUES ('2029', '2013-01-01 09:02:39', '2013-01-01 09:02:39', null, '广东省肇庆市四会市', '四会市', ',1946,2021,', '2021');
INSERT INTO `area` VALUES ('2030', '2013-01-01 09:02:39', '2013-01-01 09:02:39', null, '广东省惠州市', '惠州市', ',1946,', '1946');
INSERT INTO `area` VALUES ('2031', '2013-01-01 09:02:39', '2013-01-01 09:02:39', null, '广东省惠州市惠城区', '惠城区', ',1946,2030,', '2030');
INSERT INTO `area` VALUES ('2032', '2013-01-01 09:02:39', '2013-01-01 09:02:39', null, '广东省惠州市惠阳区', '惠阳区', ',1946,2030,', '2030');
INSERT INTO `area` VALUES ('2033', '2013-01-01 09:02:39', '2013-01-01 09:02:39', null, '广东省惠州市博罗县', '博罗县', ',1946,2030,', '2030');
INSERT INTO `area` VALUES ('2034', '2013-01-01 09:02:39', '2013-01-01 09:02:39', null, '广东省惠州市惠东县', '惠东县', ',1946,2030,', '2030');
INSERT INTO `area` VALUES ('2035', '2013-01-01 09:02:39', '2013-01-01 09:02:39', null, '广东省惠州市龙门县', '龙门县', ',1946,2030,', '2030');
INSERT INTO `area` VALUES ('2036', '2013-01-01 09:02:39', '2013-01-01 09:02:39', null, '广东省梅州市', '梅州市', ',1946,', '1946');
INSERT INTO `area` VALUES ('2037', '2013-01-01 09:02:39', '2013-01-01 09:02:39', null, '广东省梅州市梅江区', '梅江区', ',1946,2036,', '2036');
INSERT INTO `area` VALUES ('2038', '2013-01-01 09:02:39', '2013-01-01 09:02:39', null, '广东省梅州市梅县', '梅县', ',1946,2036,', '2036');
INSERT INTO `area` VALUES ('2039', '2013-01-01 09:02:39', '2013-01-01 09:02:39', null, '广东省梅州市大埔县', '大埔县', ',1946,2036,', '2036');
INSERT INTO `area` VALUES ('2040', '2013-01-01 09:02:39', '2013-01-01 09:02:39', null, '广东省梅州市丰顺县', '丰顺县', ',1946,2036,', '2036');
INSERT INTO `area` VALUES ('2041', '2013-01-01 09:02:39', '2013-01-01 09:02:39', null, '广东省梅州市五华县', '五华县', ',1946,2036,', '2036');
INSERT INTO `area` VALUES ('2042', '2013-01-01 09:02:39', '2013-01-01 09:02:39', null, '广东省梅州市平远县', '平远县', ',1946,2036,', '2036');
INSERT INTO `area` VALUES ('2043', '2013-01-01 09:02:39', '2013-01-01 09:02:39', null, '广东省梅州市蕉岭县', '蕉岭县', ',1946,2036,', '2036');
INSERT INTO `area` VALUES ('2044', '2013-01-01 09:02:39', '2013-01-01 09:02:39', null, '广东省梅州市兴宁市', '兴宁市', ',1946,2036,', '2036');
INSERT INTO `area` VALUES ('2045', '2013-01-01 09:02:39', '2013-01-01 09:02:39', null, '广东省汕尾市', '汕尾市', ',1946,', '1946');
INSERT INTO `area` VALUES ('2046', '2013-01-01 09:02:39', '2013-01-01 09:02:39', null, '广东省汕尾市城区', '城区', ',1946,2045,', '2045');
INSERT INTO `area` VALUES ('2047', '2013-01-01 09:02:39', '2013-01-01 09:02:39', null, '广东省汕尾市海丰县', '海丰县', ',1946,2045,', '2045');
INSERT INTO `area` VALUES ('2048', '2013-01-01 09:02:39', '2013-01-01 09:02:39', null, '广东省汕尾市陆河县', '陆河县', ',1946,2045,', '2045');
INSERT INTO `area` VALUES ('2049', '2013-01-01 09:02:39', '2013-01-01 09:02:39', null, '广东省汕尾市陆丰市', '陆丰市', ',1946,2045,', '2045');
INSERT INTO `area` VALUES ('2050', '2013-01-01 09:02:39', '2013-01-01 09:02:39', null, '广东省河源市', '河源市', ',1946,', '1946');
INSERT INTO `area` VALUES ('2051', '2013-01-01 09:02:40', '2013-01-01 09:02:40', null, '广东省河源市源城区', '源城区', ',1946,2050,', '2050');
INSERT INTO `area` VALUES ('2052', '2013-01-01 09:02:40', '2013-01-01 09:02:40', null, '广东省河源市紫金县', '紫金县', ',1946,2050,', '2050');
INSERT INTO `area` VALUES ('2053', '2013-01-01 09:02:40', '2013-01-01 09:02:40', null, '广东省河源市龙川县', '龙川县', ',1946,2050,', '2050');
INSERT INTO `area` VALUES ('2054', '2013-01-01 09:02:40', '2013-01-01 09:02:40', null, '广东省河源市连平县', '连平县', ',1946,2050,', '2050');
INSERT INTO `area` VALUES ('2055', '2013-01-01 09:02:40', '2013-01-01 09:02:40', null, '广东省河源市和平县', '和平县', ',1946,2050,', '2050');
INSERT INTO `area` VALUES ('2056', '2013-01-01 09:02:40', '2013-01-01 09:02:40', null, '广东省河源市东源县', '东源县', ',1946,2050,', '2050');
INSERT INTO `area` VALUES ('2057', '2013-01-01 09:02:40', '2013-01-01 09:02:40', null, '广东省阳江市', '阳江市', ',1946,', '1946');
INSERT INTO `area` VALUES ('2058', '2013-01-01 09:02:40', '2013-01-01 09:02:40', null, '广东省阳江市江城区', '江城区', ',1946,2057,', '2057');
INSERT INTO `area` VALUES ('2059', '2013-01-01 09:02:40', '2013-01-01 09:02:40', null, '广东省阳江市阳西县', '阳西县', ',1946,2057,', '2057');
INSERT INTO `area` VALUES ('2060', '2013-01-01 09:02:40', '2013-01-01 09:02:40', null, '广东省阳江市阳东县', '阳东县', ',1946,2057,', '2057');
INSERT INTO `area` VALUES ('2061', '2013-01-01 09:02:40', '2013-01-01 09:02:40', null, '广东省阳江市阳春市', '阳春市', ',1946,2057,', '2057');
INSERT INTO `area` VALUES ('2062', '2013-01-01 09:02:40', '2013-01-01 09:02:40', null, '广东省清远市', '清远市', ',1946,', '1946');
INSERT INTO `area` VALUES ('2063', '2013-01-01 09:02:40', '2013-01-01 09:02:40', null, '广东省清远市清城区', '清城区', ',1946,2062,', '2062');
INSERT INTO `area` VALUES ('2064', '2013-01-01 09:02:40', '2013-01-01 09:02:40', null, '广东省清远市佛冈县', '佛冈县', ',1946,2062,', '2062');
INSERT INTO `area` VALUES ('2065', '2013-01-01 09:02:40', '2013-01-01 09:02:40', null, '广东省清远市阳山县', '阳山县', ',1946,2062,', '2062');
INSERT INTO `area` VALUES ('2066', '2013-01-01 09:02:40', '2013-01-01 09:02:40', null, '广东省清远市连山壮族瑶族自治县', '连山壮族瑶族自治县', ',1946,2062,', '2062');
INSERT INTO `area` VALUES ('2067', '2013-01-01 09:02:40', '2013-01-01 09:02:40', null, '广东省清远市连南瑶族自治县', '连南瑶族自治县', ',1946,2062,', '2062');
INSERT INTO `area` VALUES ('2068', '2013-01-01 09:02:40', '2013-01-01 09:02:40', null, '广东省清远市清新县', '清新县', ',1946,2062,', '2062');
INSERT INTO `area` VALUES ('2069', '2013-01-01 09:02:40', '2013-01-01 09:02:40', null, '广东省清远市英德市', '英德市', ',1946,2062,', '2062');
INSERT INTO `area` VALUES ('2070', '2013-01-01 09:02:40', '2013-01-01 09:02:40', null, '广东省清远市连州市', '连州市', ',1946,2062,', '2062');
INSERT INTO `area` VALUES ('2071', '2013-01-01 09:02:40', '2013-01-01 09:02:40', null, '广东省东莞市', '东莞市', ',1946,', '1946');
INSERT INTO `area` VALUES ('2072', '2013-01-01 09:02:40', '2013-01-01 09:02:40', null, '广东省中山市', '中山市', ',1946,', '1946');
INSERT INTO `area` VALUES ('2073', '2013-01-01 09:02:40', '2013-01-01 09:02:40', null, '广东省潮州市', '潮州市', ',1946,', '1946');
INSERT INTO `area` VALUES ('2074', '2013-01-01 09:02:40', '2013-01-01 09:02:40', null, '广东省潮州市湘桥区', '湘桥区', ',1946,2073,', '2073');
INSERT INTO `area` VALUES ('2075', '2013-01-01 09:02:40', '2013-01-01 09:02:40', null, '广东省潮州市潮安县', '潮安县', ',1946,2073,', '2073');
INSERT INTO `area` VALUES ('2076', '2013-01-01 09:02:40', '2013-01-01 09:02:40', null, '广东省潮州市饶平县', '饶平县', ',1946,2073,', '2073');
INSERT INTO `area` VALUES ('2077', '2013-01-01 09:02:40', '2013-01-01 09:02:40', null, '广东省揭阳市', '揭阳市', ',1946,', '1946');
INSERT INTO `area` VALUES ('2078', '2013-01-01 09:02:41', '2013-01-01 09:02:41', null, '广东省揭阳市榕城区', '榕城区', ',1946,2077,', '2077');
INSERT INTO `area` VALUES ('2079', '2013-01-01 09:02:41', '2013-01-01 09:02:41', null, '广东省揭阳市揭东县', '揭东县', ',1946,2077,', '2077');
INSERT INTO `area` VALUES ('2080', '2013-01-01 09:02:41', '2013-01-01 09:02:41', null, '广东省揭阳市揭西县', '揭西县', ',1946,2077,', '2077');
INSERT INTO `area` VALUES ('2081', '2013-01-01 09:02:41', '2013-01-01 09:02:41', null, '广东省揭阳市惠来县', '惠来县', ',1946,2077,', '2077');
INSERT INTO `area` VALUES ('2082', '2013-01-01 09:02:41', '2013-01-01 09:02:41', null, '广东省揭阳市普宁市', '普宁市', ',1946,2077,', '2077');
INSERT INTO `area` VALUES ('2083', '2013-01-01 09:02:41', '2013-01-01 09:02:41', null, '广东省云浮市', '云浮市', ',1946,', '1946');
INSERT INTO `area` VALUES ('2084', '2013-01-01 09:02:41', '2013-01-01 09:02:41', null, '广东省云浮市云城区', '云城区', ',1946,2083,', '2083');
INSERT INTO `area` VALUES ('2085', '2013-01-01 09:02:41', '2013-01-01 09:02:41', null, '广东省云浮市新兴县', '新兴县', ',1946,2083,', '2083');
INSERT INTO `area` VALUES ('2086', '2013-01-01 09:02:41', '2013-01-01 09:02:41', null, '广东省云浮市郁南县', '郁南县', ',1946,2083,', '2083');
INSERT INTO `area` VALUES ('2087', '2013-01-01 09:02:41', '2013-01-01 09:02:41', null, '广东省云浮市云安县', '云安县', ',1946,2083,', '2083');
INSERT INTO `area` VALUES ('2088', '2013-01-01 09:02:41', '2013-01-01 09:02:41', null, '广东省云浮市罗定市', '罗定市', ',1946,2083,', '2083');
INSERT INTO `area` VALUES ('2089', '2013-01-01 09:02:41', '2013-01-01 09:02:41', null, '广西壮族自治区', '广西壮族自治区', ',', null);
INSERT INTO `area` VALUES ('2090', '2013-01-01 09:02:41', '2013-01-01 09:02:41', null, '广西壮族自治区南宁市', '南宁市', ',2089,', '2089');
INSERT INTO `area` VALUES ('2091', '2013-01-01 09:02:41', '2013-01-01 09:02:41', null, '广西壮族自治区南宁市兴宁区', '兴宁区', ',2089,2090,', '2090');
INSERT INTO `area` VALUES ('2092', '2013-01-01 09:02:41', '2013-01-01 09:02:41', null, '广西壮族自治区南宁市青秀区', '青秀区', ',2089,2090,', '2090');
INSERT INTO `area` VALUES ('2093', '2013-01-01 09:02:41', '2013-01-01 09:02:41', null, '广西壮族自治区南宁市江南区', '江南区', ',2089,2090,', '2090');
INSERT INTO `area` VALUES ('2094', '2013-01-01 09:02:41', '2013-01-01 09:02:41', null, '广西壮族自治区南宁市西乡塘区', '西乡塘区', ',2089,2090,', '2090');
INSERT INTO `area` VALUES ('2095', '2013-01-01 09:02:41', '2013-01-01 09:02:41', null, '广西壮族自治区南宁市良庆区', '良庆区', ',2089,2090,', '2090');
INSERT INTO `area` VALUES ('2096', '2013-01-01 09:02:41', '2013-01-01 09:02:41', null, '广西壮族自治区南宁市邕宁区', '邕宁区', ',2089,2090,', '2090');
INSERT INTO `area` VALUES ('2097', '2013-01-01 09:02:41', '2013-01-01 09:02:41', null, '广西壮族自治区南宁市武鸣县', '武鸣县', ',2089,2090,', '2090');
INSERT INTO `area` VALUES ('2098', '2013-01-01 09:02:41', '2013-01-01 09:02:41', null, '广西壮族自治区南宁市隆安县', '隆安县', ',2089,2090,', '2090');
INSERT INTO `area` VALUES ('2099', '2013-01-01 09:02:41', '2013-01-01 09:02:41', null, '广西壮族自治区南宁市马山县', '马山县', ',2089,2090,', '2090');
INSERT INTO `area` VALUES ('2100', '2013-01-01 09:02:41', '2013-01-01 09:02:41', null, '广西壮族自治区南宁市上林县', '上林县', ',2089,2090,', '2090');
INSERT INTO `area` VALUES ('2101', '2013-01-01 09:02:41', '2013-01-01 09:02:41', null, '广西壮族自治区南宁市宾阳县', '宾阳县', ',2089,2090,', '2090');
INSERT INTO `area` VALUES ('2102', '2013-01-01 09:02:41', '2013-01-01 09:02:41', null, '广西壮族自治区南宁市横县', '横县', ',2089,2090,', '2090');
INSERT INTO `area` VALUES ('2103', '2013-01-01 09:02:41', '2013-01-01 09:02:41', null, '广西壮族自治区柳州市', '柳州市', ',2089,', '2089');
INSERT INTO `area` VALUES ('2104', '2013-01-01 09:02:41', '2013-01-01 09:02:41', null, '广西壮族自治区柳州市城中区', '城中区', ',2089,2103,', '2103');
INSERT INTO `area` VALUES ('2105', '2013-01-01 09:02:42', '2013-01-01 09:02:42', null, '广西壮族自治区柳州市鱼峰区', '鱼峰区', ',2089,2103,', '2103');
INSERT INTO `area` VALUES ('2106', '2013-01-01 09:02:42', '2013-01-01 09:02:42', null, '广西壮族自治区柳州市柳南区', '柳南区', ',2089,2103,', '2103');
INSERT INTO `area` VALUES ('2107', '2013-01-01 09:02:42', '2013-01-01 09:02:42', null, '广西壮族自治区柳州市柳北区', '柳北区', ',2089,2103,', '2103');
INSERT INTO `area` VALUES ('2108', '2013-01-01 09:02:42', '2013-01-01 09:02:42', null, '广西壮族自治区柳州市柳江县', '柳江县', ',2089,2103,', '2103');
INSERT INTO `area` VALUES ('2109', '2013-01-01 09:02:42', '2013-01-01 09:02:42', null, '广西壮族自治区柳州市柳城县', '柳城县', ',2089,2103,', '2103');
INSERT INTO `area` VALUES ('2110', '2013-01-01 09:02:42', '2013-01-01 09:02:42', null, '广西壮族自治区柳州市鹿寨县', '鹿寨县', ',2089,2103,', '2103');
INSERT INTO `area` VALUES ('2111', '2013-01-01 09:02:42', '2013-01-01 09:02:42', null, '广西壮族自治区柳州市融安县', '融安县', ',2089,2103,', '2103');
INSERT INTO `area` VALUES ('2112', '2013-01-01 09:02:42', '2013-01-01 09:02:42', null, '广西壮族自治区柳州市融水苗族自治县', '融水苗族自治县', ',2089,2103,', '2103');
INSERT INTO `area` VALUES ('2113', '2013-01-01 09:02:42', '2013-01-01 09:02:42', null, '广西壮族自治区柳州市三江侗族自治县', '三江侗族自治县', ',2089,2103,', '2103');
INSERT INTO `area` VALUES ('2114', '2013-01-01 09:02:42', '2013-01-01 09:02:42', null, '广西壮族自治区桂林市', '桂林市', ',2089,', '2089');
INSERT INTO `area` VALUES ('2115', '2013-01-01 09:02:42', '2013-01-01 09:02:42', null, '广西壮族自治区桂林市秀峰区', '秀峰区', ',2089,2114,', '2114');
INSERT INTO `area` VALUES ('2116', '2013-01-01 09:02:42', '2013-01-01 09:02:42', null, '广西壮族自治区桂林市叠彩区', '叠彩区', ',2089,2114,', '2114');
INSERT INTO `area` VALUES ('2117', '2013-01-01 09:02:42', '2013-01-01 09:02:42', null, '广西壮族自治区桂林市象山区', '象山区', ',2089,2114,', '2114');
INSERT INTO `area` VALUES ('2118', '2013-01-01 09:02:42', '2013-01-01 09:02:42', null, '广西壮族自治区桂林市七星区', '七星区', ',2089,2114,', '2114');
INSERT INTO `area` VALUES ('2119', '2013-01-01 09:02:42', '2013-01-01 09:02:42', null, '广西壮族自治区桂林市雁山区', '雁山区', ',2089,2114,', '2114');
INSERT INTO `area` VALUES ('2120', '2013-01-01 09:02:42', '2013-01-01 09:02:42', null, '广西壮族自治区桂林市阳朔县', '阳朔县', ',2089,2114,', '2114');
INSERT INTO `area` VALUES ('2121', '2013-01-01 09:02:42', '2013-01-01 09:02:42', null, '广西壮族自治区桂林市临桂县', '临桂县', ',2089,2114,', '2114');
INSERT INTO `area` VALUES ('2122', '2013-01-01 09:02:42', '2013-01-01 09:02:42', null, '广西壮族自治区桂林市灵川县', '灵川县', ',2089,2114,', '2114');
INSERT INTO `area` VALUES ('2123', '2013-01-01 09:02:42', '2013-01-01 09:02:42', null, '广西壮族自治区桂林市全州县', '全州县', ',2089,2114,', '2114');
INSERT INTO `area` VALUES ('2124', '2013-01-01 09:02:42', '2013-01-01 09:02:42', null, '广西壮族自治区桂林市兴安县', '兴安县', ',2089,2114,', '2114');
INSERT INTO `area` VALUES ('2125', '2013-01-01 09:02:42', '2013-01-01 09:02:42', null, '广西壮族自治区桂林市永福县', '永福县', ',2089,2114,', '2114');
INSERT INTO `area` VALUES ('2126', '2013-01-01 09:02:42', '2013-01-01 09:02:42', null, '广西壮族自治区桂林市灌阳县', '灌阳县', ',2089,2114,', '2114');
INSERT INTO `area` VALUES ('2127', '2013-01-01 09:02:42', '2013-01-01 09:02:42', null, '广西壮族自治区桂林市龙胜各族自治县', '龙胜各族自治县', ',2089,2114,', '2114');
INSERT INTO `area` VALUES ('2128', '2013-01-01 09:02:42', '2013-01-01 09:02:42', null, '广西壮族自治区桂林市资源县', '资源县', ',2089,2114,', '2114');
INSERT INTO `area` VALUES ('2129', '2013-01-01 09:02:42', '2013-01-01 09:02:42', null, '广西壮族自治区桂林市平乐县', '平乐县', ',2089,2114,', '2114');
INSERT INTO `area` VALUES ('2130', '2013-01-01 09:02:43', '2013-01-01 09:02:43', null, '广西壮族自治区桂林市荔浦县', '荔浦县', ',2089,2114,', '2114');
INSERT INTO `area` VALUES ('2131', '2013-01-01 09:02:43', '2013-01-01 09:02:43', null, '广西壮族自治区桂林市恭城瑶族自治县', '恭城瑶族自治县', ',2089,2114,', '2114');
INSERT INTO `area` VALUES ('2132', '2013-01-01 09:02:43', '2013-01-01 09:02:43', null, '广西壮族自治区梧州市', '梧州市', ',2089,', '2089');
INSERT INTO `area` VALUES ('2133', '2013-01-01 09:02:43', '2013-01-01 09:02:43', null, '广西壮族自治区梧州市万秀区', '万秀区', ',2089,2132,', '2132');
INSERT INTO `area` VALUES ('2134', '2013-01-01 09:02:43', '2013-01-01 09:02:43', null, '广西壮族自治区梧州市蝶山区', '蝶山区', ',2089,2132,', '2132');
INSERT INTO `area` VALUES ('2135', '2013-01-01 09:02:43', '2013-01-01 09:02:43', null, '广西壮族自治区梧州市长洲区', '长洲区', ',2089,2132,', '2132');
INSERT INTO `area` VALUES ('2136', '2013-01-01 09:02:43', '2013-01-01 09:02:43', null, '广西壮族自治区梧州市苍梧县', '苍梧县', ',2089,2132,', '2132');
INSERT INTO `area` VALUES ('2137', '2013-01-01 09:02:43', '2013-01-01 09:02:43', null, '广西壮族自治区梧州市藤县', '藤县', ',2089,2132,', '2132');
INSERT INTO `area` VALUES ('2138', '2013-01-01 09:02:43', '2013-01-01 09:02:43', null, '广西壮族自治区梧州市蒙山县', '蒙山县', ',2089,2132,', '2132');
INSERT INTO `area` VALUES ('2139', '2013-01-01 09:02:43', '2013-01-01 09:02:43', null, '广西壮族自治区梧州市岑溪市', '岑溪市', ',2089,2132,', '2132');
INSERT INTO `area` VALUES ('2140', '2013-01-01 09:02:43', '2013-01-01 09:02:43', null, '广西壮族自治区北海市', '北海市', ',2089,', '2089');
INSERT INTO `area` VALUES ('2141', '2013-01-01 09:02:43', '2013-01-01 09:02:43', null, '广西壮族自治区北海市海城区', '海城区', ',2089,2140,', '2140');
INSERT INTO `area` VALUES ('2142', '2013-01-01 09:02:43', '2013-01-01 09:02:43', null, '广西壮族自治区北海市银海区', '银海区', ',2089,2140,', '2140');
INSERT INTO `area` VALUES ('2143', '2013-01-01 09:02:43', '2013-01-01 09:02:43', null, '广西壮族自治区北海市铁山港区', '铁山港区', ',2089,2140,', '2140');
INSERT INTO `area` VALUES ('2144', '2013-01-01 09:02:43', '2013-01-01 09:02:43', null, '广西壮族自治区北海市合浦县', '合浦县', ',2089,2140,', '2140');
INSERT INTO `area` VALUES ('2145', '2013-01-01 09:02:43', '2013-01-01 09:02:43', null, '广西壮族自治区防城港市', '防城港市', ',2089,', '2089');
INSERT INTO `area` VALUES ('2146', '2013-01-01 09:02:43', '2013-01-01 09:02:43', null, '广西壮族自治区防城港市港口区', '港口区', ',2089,2145,', '2145');
INSERT INTO `area` VALUES ('2147', '2013-01-01 09:02:43', '2013-01-01 09:02:43', null, '广西壮族自治区防城港市防城区', '防城区', ',2089,2145,', '2145');
INSERT INTO `area` VALUES ('2148', '2013-01-01 09:02:43', '2013-01-01 09:02:43', null, '广西壮族自治区防城港市上思县', '上思县', ',2089,2145,', '2145');
INSERT INTO `area` VALUES ('2149', '2013-01-01 09:02:43', '2013-01-01 09:02:43', null, '广西壮族自治区防城港市东兴市', '东兴市', ',2089,2145,', '2145');
INSERT INTO `area` VALUES ('2150', '2013-01-01 09:02:43', '2013-01-01 09:02:43', null, '广西壮族自治区钦州市', '钦州市', ',2089,', '2089');
INSERT INTO `area` VALUES ('2151', '2013-01-01 09:02:43', '2013-01-01 09:02:43', null, '广西壮族自治区钦州市钦南区', '钦南区', ',2089,2150,', '2150');
INSERT INTO `area` VALUES ('2152', '2013-01-01 09:02:43', '2013-01-01 09:02:43', null, '广西壮族自治区钦州市钦北区', '钦北区', ',2089,2150,', '2150');
INSERT INTO `area` VALUES ('2153', '2013-01-01 09:02:43', '2013-01-01 09:02:43', null, '广西壮族自治区钦州市灵山县', '灵山县', ',2089,2150,', '2150');
INSERT INTO `area` VALUES ('2154', '2013-01-01 09:02:43', '2013-01-01 09:02:43', null, '广西壮族自治区钦州市浦北县', '浦北县', ',2089,2150,', '2150');
INSERT INTO `area` VALUES ('2155', '2013-01-01 09:02:44', '2013-01-01 09:02:44', null, '广西壮族自治区贵港市', '贵港市', ',2089,', '2089');
INSERT INTO `area` VALUES ('2156', '2013-01-01 09:02:44', '2013-01-01 09:02:44', null, '广西壮族自治区贵港市港北区', '港北区', ',2089,2155,', '2155');
INSERT INTO `area` VALUES ('2157', '2013-01-01 09:02:44', '2013-01-01 09:02:44', null, '广西壮族自治区贵港市港南区', '港南区', ',2089,2155,', '2155');
INSERT INTO `area` VALUES ('2158', '2013-01-01 09:02:44', '2013-01-01 09:02:44', null, '广西壮族自治区贵港市覃塘区', '覃塘区', ',2089,2155,', '2155');
INSERT INTO `area` VALUES ('2159', '2013-01-01 09:02:44', '2013-01-01 09:02:44', null, '广西壮族自治区贵港市平南县', '平南县', ',2089,2155,', '2155');
INSERT INTO `area` VALUES ('2160', '2013-01-01 09:02:44', '2013-01-01 09:02:44', null, '广西壮族自治区贵港市桂平市', '桂平市', ',2089,2155,', '2155');
INSERT INTO `area` VALUES ('2161', '2013-01-01 09:02:44', '2013-01-01 09:02:44', null, '广西壮族自治区玉林市', '玉林市', ',2089,', '2089');
INSERT INTO `area` VALUES ('2162', '2013-01-01 09:02:44', '2013-01-01 09:02:44', null, '广西壮族自治区玉林市玉州区', '玉州区', ',2089,2161,', '2161');
INSERT INTO `area` VALUES ('2163', '2013-01-01 09:02:44', '2013-01-01 09:02:44', null, '广西壮族自治区玉林市容县', '容县', ',2089,2161,', '2161');
INSERT INTO `area` VALUES ('2164', '2013-01-01 09:02:44', '2013-01-01 09:02:44', null, '广西壮族自治区玉林市陆川县', '陆川县', ',2089,2161,', '2161');
INSERT INTO `area` VALUES ('2165', '2013-01-01 09:02:44', '2013-01-01 09:02:44', null, '广西壮族自治区玉林市博白县', '博白县', ',2089,2161,', '2161');
INSERT INTO `area` VALUES ('2166', '2013-01-01 09:02:44', '2013-01-01 09:02:44', null, '广西壮族自治区玉林市兴业县', '兴业县', ',2089,2161,', '2161');
INSERT INTO `area` VALUES ('2167', '2013-01-01 09:02:44', '2013-01-01 09:02:44', null, '广西壮族自治区玉林市北流市', '北流市', ',2089,2161,', '2161');
INSERT INTO `area` VALUES ('2168', '2013-01-01 09:02:44', '2013-01-01 09:02:44', null, '广西壮族自治区百色市', '百色市', ',2089,', '2089');
INSERT INTO `area` VALUES ('2169', '2013-01-01 09:02:44', '2013-01-01 09:02:44', null, '广西壮族自治区百色市右江区', '右江区', ',2089,2168,', '2168');
INSERT INTO `area` VALUES ('2170', '2013-01-01 09:02:44', '2013-01-01 09:02:44', null, '广西壮族自治区百色市田阳县', '田阳县', ',2089,2168,', '2168');
INSERT INTO `area` VALUES ('2171', '2013-01-01 09:02:44', '2013-01-01 09:02:44', null, '广西壮族自治区百色市田东县', '田东县', ',2089,2168,', '2168');
INSERT INTO `area` VALUES ('2172', '2013-01-01 09:02:44', '2013-01-01 09:02:44', null, '广西壮族自治区百色市平果县', '平果县', ',2089,2168,', '2168');
INSERT INTO `area` VALUES ('2173', '2013-01-01 09:02:44', '2013-01-01 09:02:44', null, '广西壮族自治区百色市德保县', '德保县', ',2089,2168,', '2168');
INSERT INTO `area` VALUES ('2174', '2013-01-01 09:02:44', '2013-01-01 09:02:44', null, '广西壮族自治区百色市靖西县', '靖西县', ',2089,2168,', '2168');
INSERT INTO `area` VALUES ('2175', '2013-01-01 09:02:44', '2013-01-01 09:02:44', null, '广西壮族自治区百色市那坡县', '那坡县', ',2089,2168,', '2168');
INSERT INTO `area` VALUES ('2176', '2013-01-01 09:02:44', '2013-01-01 09:02:44', null, '广西壮族自治区百色市凌云县', '凌云县', ',2089,2168,', '2168');
INSERT INTO `area` VALUES ('2177', '2013-01-01 09:02:44', '2013-01-01 09:02:44', null, '广西壮族自治区百色市乐业县', '乐业县', ',2089,2168,', '2168');
INSERT INTO `area` VALUES ('2178', '2013-01-01 09:02:44', '2013-01-01 09:02:44', null, '广西壮族自治区百色市田林县', '田林县', ',2089,2168,', '2168');
INSERT INTO `area` VALUES ('2179', '2013-01-01 09:02:45', '2013-01-01 09:02:45', null, '广西壮族自治区百色市西林县', '西林县', ',2089,2168,', '2168');
INSERT INTO `area` VALUES ('2180', '2013-01-01 09:02:45', '2013-01-01 09:02:45', null, '广西壮族自治区百色市隆林各族自治县', '隆林各族自治县', ',2089,2168,', '2168');
INSERT INTO `area` VALUES ('2181', '2013-01-01 09:02:45', '2013-01-01 09:02:45', null, '广西壮族自治区贺州市', '贺州市', ',2089,', '2089');
INSERT INTO `area` VALUES ('2182', '2013-01-01 09:02:45', '2013-01-01 09:02:45', null, '广西壮族自治区贺州市八步区', '八步区', ',2089,2181,', '2181');
INSERT INTO `area` VALUES ('2183', '2013-01-01 09:02:45', '2013-01-01 09:02:45', null, '广西壮族自治区贺州市昭平县', '昭平县', ',2089,2181,', '2181');
INSERT INTO `area` VALUES ('2184', '2013-01-01 09:02:45', '2013-01-01 09:02:45', null, '广西壮族自治区贺州市钟山县', '钟山县', ',2089,2181,', '2181');
INSERT INTO `area` VALUES ('2185', '2013-01-01 09:02:45', '2013-01-01 09:02:45', null, '广西壮族自治区贺州市富川瑶族自治县', '富川瑶族自治县', ',2089,2181,', '2181');
INSERT INTO `area` VALUES ('2186', '2013-01-01 09:02:45', '2013-01-01 09:02:45', null, '广西壮族自治区河池市', '河池市', ',2089,', '2089');
INSERT INTO `area` VALUES ('2187', '2013-01-01 09:02:45', '2013-01-01 09:02:45', null, '广西壮族自治区河池市金城江区', '金城江区', ',2089,2186,', '2186');
INSERT INTO `area` VALUES ('2188', '2013-01-01 09:02:45', '2013-01-01 09:02:45', null, '广西壮族自治区河池市南丹县', '南丹县', ',2089,2186,', '2186');
INSERT INTO `area` VALUES ('2189', '2013-01-01 09:02:45', '2013-01-01 09:02:45', null, '广西壮族自治区河池市天峨县', '天峨县', ',2089,2186,', '2186');
INSERT INTO `area` VALUES ('2190', '2013-01-01 09:02:45', '2013-01-01 09:02:45', null, '广西壮族自治区河池市凤山县', '凤山县', ',2089,2186,', '2186');
INSERT INTO `area` VALUES ('2191', '2013-01-01 09:02:45', '2013-01-01 09:02:45', null, '广西壮族自治区河池市东兰县', '东兰县', ',2089,2186,', '2186');
INSERT INTO `area` VALUES ('2192', '2013-01-01 09:02:45', '2013-01-01 09:02:45', null, '广西壮族自治区河池市罗城仫佬族自治县', '罗城仫佬族自治县', ',2089,2186,', '2186');
INSERT INTO `area` VALUES ('2193', '2013-01-01 09:02:45', '2013-01-01 09:02:45', null, '广西壮族自治区河池市环江毛南族自治县', '环江毛南族自治县', ',2089,2186,', '2186');
INSERT INTO `area` VALUES ('2194', '2013-01-01 09:02:45', '2013-01-01 09:02:45', null, '广西壮族自治区河池市巴马瑶族自治县', '巴马瑶族自治县', ',2089,2186,', '2186');
INSERT INTO `area` VALUES ('2195', '2013-01-01 09:02:45', '2013-01-01 09:02:45', null, '广西壮族自治区河池市都安瑶族自治县', '都安瑶族自治县', ',2089,2186,', '2186');
INSERT INTO `area` VALUES ('2196', '2013-01-01 09:02:45', '2013-01-01 09:02:45', null, '广西壮族自治区河池市大化瑶族自治县', '大化瑶族自治县', ',2089,2186,', '2186');
INSERT INTO `area` VALUES ('2197', '2013-01-01 09:02:45', '2013-01-01 09:02:45', null, '广西壮族自治区河池市宜州市', '宜州市', ',2089,2186,', '2186');
INSERT INTO `area` VALUES ('2198', '2013-01-01 09:02:45', '2013-01-01 09:02:45', null, '广西壮族自治区来宾市', '来宾市', ',2089,', '2089');
INSERT INTO `area` VALUES ('2199', '2013-01-01 09:02:45', '2013-01-01 09:02:45', null, '广西壮族自治区来宾市兴宾区', '兴宾区', ',2089,2198,', '2198');
INSERT INTO `area` VALUES ('2200', '2013-01-01 09:02:45', '2013-01-01 09:02:45', null, '广西壮族自治区来宾市忻城县', '忻城县', ',2089,2198,', '2198');
INSERT INTO `area` VALUES ('2201', '2013-01-01 09:02:45', '2013-01-01 09:02:45', null, '广西壮族自治区来宾市象州县', '象州县', ',2089,2198,', '2198');
INSERT INTO `area` VALUES ('2202', '2013-01-01 09:02:46', '2013-01-01 09:02:46', null, '广西壮族自治区来宾市武宣县', '武宣县', ',2089,2198,', '2198');
INSERT INTO `area` VALUES ('2203', '2013-01-01 09:02:46', '2013-01-01 09:02:46', null, '广西壮族自治区来宾市金秀瑶族自治县', '金秀瑶族自治县', ',2089,2198,', '2198');
INSERT INTO `area` VALUES ('2204', '2013-01-01 09:02:46', '2013-01-01 09:02:46', null, '广西壮族自治区来宾市合山市', '合山市', ',2089,2198,', '2198');
INSERT INTO `area` VALUES ('2205', '2013-01-01 09:02:46', '2013-01-01 09:02:46', null, '广西壮族自治区崇左市', '崇左市', ',2089,', '2089');
INSERT INTO `area` VALUES ('2206', '2013-01-01 09:02:46', '2013-01-01 09:02:46', null, '广西壮族自治区崇左市江洲区', '江洲区', ',2089,2205,', '2205');
INSERT INTO `area` VALUES ('2207', '2013-01-01 09:02:46', '2013-01-01 09:02:46', null, '广西壮族自治区崇左市扶绥县', '扶绥县', ',2089,2205,', '2205');
INSERT INTO `area` VALUES ('2208', '2013-01-01 09:02:46', '2013-01-01 09:02:46', null, '广西壮族自治区崇左市宁明县', '宁明县', ',2089,2205,', '2205');
INSERT INTO `area` VALUES ('2209', '2013-01-01 09:02:46', '2013-01-01 09:02:46', null, '广西壮族自治区崇左市龙州县', '龙州县', ',2089,2205,', '2205');
INSERT INTO `area` VALUES ('2210', '2013-01-01 09:02:46', '2013-01-01 09:02:46', null, '广西壮族自治区崇左市大新县', '大新县', ',2089,2205,', '2205');
INSERT INTO `area` VALUES ('2211', '2013-01-01 09:02:46', '2013-01-01 09:02:46', null, '广西壮族自治区崇左市天等县', '天等县', ',2089,2205,', '2205');
INSERT INTO `area` VALUES ('2212', '2013-01-01 09:02:46', '2013-01-01 09:02:46', null, '广西壮族自治区崇左市凭祥市', '凭祥市', ',2089,2205,', '2205');
INSERT INTO `area` VALUES ('2213', '2013-01-01 09:02:46', '2013-01-01 09:02:46', null, '海南省', '海南省', ',', null);
INSERT INTO `area` VALUES ('2214', '2013-01-01 09:02:46', '2013-01-01 09:02:46', null, '海南省海口市', '海口市', ',2213,', '2213');
INSERT INTO `area` VALUES ('2215', '2013-01-01 09:02:46', '2013-01-01 09:02:46', null, '海南省海口市秀英区', '秀英区', ',2213,2214,', '2214');
INSERT INTO `area` VALUES ('2216', '2013-01-01 09:02:46', '2013-01-01 09:02:46', null, '海南省海口市龙华区', '龙华区', ',2213,2214,', '2214');
INSERT INTO `area` VALUES ('2217', '2013-01-01 09:02:46', '2013-01-01 09:02:46', null, '海南省海口市琼山区', '琼山区', ',2213,2214,', '2214');
INSERT INTO `area` VALUES ('2218', '2013-01-01 09:02:46', '2013-01-01 09:02:46', null, '海南省海口市美兰区', '美兰区', ',2213,2214,', '2214');
INSERT INTO `area` VALUES ('2219', '2013-01-01 09:02:46', '2013-01-01 09:02:46', null, '海南省三亚市', '三亚市', ',2213,', '2213');
INSERT INTO `area` VALUES ('2220', '2013-01-01 09:02:46', '2013-01-01 09:02:46', null, '海南省三沙市', '三沙市', ',2213,', '2213');
INSERT INTO `area` VALUES ('2221', '2013-01-01 09:02:46', '2013-01-01 09:02:46', null, '海南省三沙市西沙群岛', '西沙群岛', ',2213,2220,', '2220');
INSERT INTO `area` VALUES ('2222', '2013-01-01 09:02:46', '2013-01-01 09:02:46', null, '海南省三沙市南沙群岛', '南沙群岛', ',2213,2220,', '2220');
INSERT INTO `area` VALUES ('2223', '2013-01-01 09:02:46', '2013-01-01 09:02:46', null, '海南省三沙市中沙群岛的岛礁及其海域', '中沙群岛的岛礁及其海域', ',2213,2220,', '2220');
INSERT INTO `area` VALUES ('2224', '2013-01-01 09:02:46', '2013-01-01 09:02:46', null, '海南省五指山市', '五指山市', ',2213,', '2213');
INSERT INTO `area` VALUES ('2225', '2013-01-01 09:02:46', '2013-01-01 09:02:46', null, '海南省琼海市', '琼海市', ',2213,', '2213');
INSERT INTO `area` VALUES ('2226', '2013-01-01 09:02:47', '2013-01-01 09:02:47', null, '海南省儋州市', '儋州市', ',2213,', '2213');
INSERT INTO `area` VALUES ('2227', '2013-01-01 09:02:47', '2013-01-01 09:02:47', null, '海南省文昌市', '文昌市', ',2213,', '2213');
INSERT INTO `area` VALUES ('2228', '2013-01-01 09:02:47', '2013-01-01 09:02:47', null, '海南省万宁市', '万宁市', ',2213,', '2213');
INSERT INTO `area` VALUES ('2229', '2013-01-01 09:02:47', '2013-01-01 09:02:47', null, '海南省东方市', '东方市', ',2213,', '2213');
INSERT INTO `area` VALUES ('2230', '2013-01-01 09:02:47', '2013-01-01 09:02:47', null, '海南省定安县', '定安县', ',2213,', '2213');
INSERT INTO `area` VALUES ('2231', '2013-01-01 09:02:47', '2013-01-01 09:02:47', null, '海南省屯昌县', '屯昌县', ',2213,', '2213');
INSERT INTO `area` VALUES ('2232', '2013-01-01 09:02:47', '2013-01-01 09:02:47', null, '海南省澄迈县', '澄迈县', ',2213,', '2213');
INSERT INTO `area` VALUES ('2233', '2013-01-01 09:02:47', '2013-01-01 09:02:47', null, '海南省临高县', '临高县', ',2213,', '2213');
INSERT INTO `area` VALUES ('2234', '2013-01-01 09:02:47', '2013-01-01 09:02:47', null, '海南省白沙黎族自治县', '白沙黎族自治县', ',2213,', '2213');
INSERT INTO `area` VALUES ('2235', '2013-01-01 09:02:47', '2013-01-01 09:02:47', null, '海南省昌江黎族自治县', '昌江黎族自治县', ',2213,', '2213');
INSERT INTO `area` VALUES ('2236', '2013-01-01 09:02:47', '2013-01-01 09:02:47', null, '海南省乐东黎族自治县', '乐东黎族自治县', ',2213,', '2213');
INSERT INTO `area` VALUES ('2237', '2013-01-01 09:02:47', '2013-01-01 09:02:47', null, '海南省陵水黎族自治县', '陵水黎族自治县', ',2213,', '2213');
INSERT INTO `area` VALUES ('2238', '2013-01-01 09:02:47', '2013-01-01 09:02:47', null, '海南省保亭黎族苗族自治县', '保亭黎族苗族自治县', ',2213,', '2213');
INSERT INTO `area` VALUES ('2239', '2013-01-01 09:02:47', '2013-01-01 09:02:47', null, '海南省琼中黎族苗族自治县', '琼中黎族苗族自治县', ',2213,', '2213');
INSERT INTO `area` VALUES ('2240', '2013-01-01 09:02:47', '2013-01-01 09:02:47', null, '重庆市', '重庆市', ',', null);
INSERT INTO `area` VALUES ('2241', '2013-01-01 09:02:47', '2013-01-01 09:02:47', null, '重庆市万州区', '万州区', ',2240,', '2240');
INSERT INTO `area` VALUES ('2242', '2013-01-01 09:02:47', '2013-01-01 09:02:47', null, '重庆市涪陵区', '涪陵区', ',2240,', '2240');
INSERT INTO `area` VALUES ('2243', '2013-01-01 09:02:47', '2013-01-01 09:02:47', null, '重庆市渝中区', '渝中区', ',2240,', '2240');
INSERT INTO `area` VALUES ('2244', '2013-01-01 09:02:47', '2013-01-01 09:02:47', null, '重庆市大渡口区', '大渡口区', ',2240,', '2240');
INSERT INTO `area` VALUES ('2245', '2013-01-01 09:02:47', '2013-01-01 09:02:47', null, '重庆市江北区', '江北区', ',2240,', '2240');
INSERT INTO `area` VALUES ('2246', '2013-01-01 09:02:47', '2013-01-01 09:02:47', null, '重庆市沙坪坝区', '沙坪坝区', ',2240,', '2240');
INSERT INTO `area` VALUES ('2247', '2013-01-01 09:02:47', '2013-01-01 09:02:47', null, '重庆市九龙坡区', '九龙坡区', ',2240,', '2240');
INSERT INTO `area` VALUES ('2248', '2013-01-01 09:02:47', '2013-01-01 09:02:47', null, '重庆市南岸区', '南岸区', ',2240,', '2240');
INSERT INTO `area` VALUES ('2249', '2013-01-01 09:02:47', '2013-01-01 09:02:47', null, '重庆市北碚区', '北碚区', ',2240,', '2240');
INSERT INTO `area` VALUES ('2250', '2013-01-01 09:02:48', '2013-01-01 09:02:48', null, '重庆市綦江区', '綦江区', ',2240,', '2240');
INSERT INTO `area` VALUES ('2251', '2013-01-01 09:02:48', '2013-01-01 09:02:48', null, '重庆市大足区', '大足区', ',2240,', '2240');
INSERT INTO `area` VALUES ('2252', '2013-01-01 09:02:48', '2013-01-01 09:02:48', null, '重庆市渝北区', '渝北区', ',2240,', '2240');
INSERT INTO `area` VALUES ('2253', '2013-01-01 09:02:48', '2013-01-01 09:02:48', null, '重庆市巴南区', '巴南区', ',2240,', '2240');
INSERT INTO `area` VALUES ('2254', '2013-01-01 09:02:48', '2013-01-01 09:02:48', null, '重庆市黔江区', '黔江区', ',2240,', '2240');
INSERT INTO `area` VALUES ('2255', '2013-01-01 09:02:48', '2013-01-01 09:02:48', null, '重庆市长寿区', '长寿区', ',2240,', '2240');
INSERT INTO `area` VALUES ('2256', '2013-01-01 09:02:48', '2013-01-01 09:02:48', null, '重庆市江津区', '江津区', ',2240,', '2240');
INSERT INTO `area` VALUES ('2257', '2013-01-01 09:02:48', '2013-01-01 09:02:48', null, '重庆市合川区', '合川区', ',2240,', '2240');
INSERT INTO `area` VALUES ('2258', '2013-01-01 09:02:48', '2013-01-01 09:02:48', null, '重庆市永川区', '永川区', ',2240,', '2240');
INSERT INTO `area` VALUES ('2259', '2013-01-01 09:02:48', '2013-01-01 09:02:48', null, '重庆市南川区', '南川区', ',2240,', '2240');
INSERT INTO `area` VALUES ('2260', '2013-01-01 09:02:48', '2013-01-01 09:02:48', null, '重庆市潼南县', '潼南县', ',2240,', '2240');
INSERT INTO `area` VALUES ('2261', '2013-01-01 09:02:48', '2013-01-01 09:02:48', null, '重庆市铜梁县', '铜梁县', ',2240,', '2240');
INSERT INTO `area` VALUES ('2262', '2013-01-01 09:02:48', '2013-01-01 09:02:48', null, '重庆市荣昌县', '荣昌县', ',2240,', '2240');
INSERT INTO `area` VALUES ('2263', '2013-01-01 09:02:48', '2013-01-01 09:02:48', null, '重庆市璧山县', '璧山县', ',2240,', '2240');
INSERT INTO `area` VALUES ('2264', '2013-01-01 09:02:48', '2013-01-01 09:02:48', null, '重庆市梁平县', '梁平县', ',2240,', '2240');
INSERT INTO `area` VALUES ('2265', '2013-01-01 09:02:48', '2013-01-01 09:02:48', null, '重庆市城口县', '城口县', ',2240,', '2240');
INSERT INTO `area` VALUES ('2266', '2013-01-01 09:02:48', '2013-01-01 09:02:48', null, '重庆市丰都县', '丰都县', ',2240,', '2240');
INSERT INTO `area` VALUES ('2267', '2013-01-01 09:02:48', '2013-01-01 09:02:48', null, '重庆市垫江县', '垫江县', ',2240,', '2240');
INSERT INTO `area` VALUES ('2268', '2013-01-01 09:02:48', '2013-01-01 09:02:48', null, '重庆市武隆县', '武隆县', ',2240,', '2240');
INSERT INTO `area` VALUES ('2269', '2013-01-01 09:02:48', '2013-01-01 09:02:48', null, '重庆市忠县', '忠县', ',2240,', '2240');
INSERT INTO `area` VALUES ('2270', '2013-01-01 09:02:48', '2013-01-01 09:02:48', null, '重庆市开县', '开县', ',2240,', '2240');
INSERT INTO `area` VALUES ('2271', '2013-01-01 09:02:48', '2013-01-01 09:02:48', null, '重庆市云阳县', '云阳县', ',2240,', '2240');
INSERT INTO `area` VALUES ('2272', '2013-01-01 09:02:49', '2013-01-01 09:02:49', null, '重庆市奉节县', '奉节县', ',2240,', '2240');
INSERT INTO `area` VALUES ('2273', '2013-01-01 09:02:49', '2013-01-01 09:02:49', null, '重庆市巫山县', '巫山县', ',2240,', '2240');
INSERT INTO `area` VALUES ('2274', '2013-01-01 09:02:49', '2013-01-01 09:02:49', null, '重庆市巫溪县', '巫溪县', ',2240,', '2240');
INSERT INTO `area` VALUES ('2275', '2013-01-01 09:02:49', '2013-01-01 09:02:49', null, '重庆市石柱土家族自治县', '石柱土家族自治县', ',2240,', '2240');
INSERT INTO `area` VALUES ('2276', '2013-01-01 09:02:49', '2013-01-01 09:02:49', null, '重庆市秀山土家族苗族自治县', '秀山土家族苗族自治县', ',2240,', '2240');
INSERT INTO `area` VALUES ('2277', '2013-01-01 09:02:49', '2013-01-01 09:02:49', null, '重庆市酉阳土家族苗族自治县', '酉阳土家族苗族自治县', ',2240,', '2240');
INSERT INTO `area` VALUES ('2278', '2013-01-01 09:02:49', '2013-01-01 09:02:49', null, '重庆市彭水苗族土家族自治县', '彭水苗族土家族自治县', ',2240,', '2240');
INSERT INTO `area` VALUES ('2279', '2013-01-01 09:02:49', '2013-01-01 09:02:49', null, '四川省', '四川省', ',', null);
INSERT INTO `area` VALUES ('2280', '2013-01-01 09:02:49', '2013-01-01 09:02:49', null, '四川省成都市', '成都市', ',2279,', '2279');
INSERT INTO `area` VALUES ('2281', '2013-01-01 09:02:49', '2013-01-01 09:02:49', null, '四川省成都市锦江区', '锦江区', ',2279,2280,', '2280');
INSERT INTO `area` VALUES ('2282', '2013-01-01 09:02:49', '2013-01-01 09:02:49', null, '四川省成都市青羊区', '青羊区', ',2279,2280,', '2280');
INSERT INTO `area` VALUES ('2283', '2013-01-01 09:02:49', '2013-01-01 09:02:49', null, '四川省成都市金牛区', '金牛区', ',2279,2280,', '2280');
INSERT INTO `area` VALUES ('2284', '2013-01-01 09:02:49', '2013-01-01 09:02:49', null, '四川省成都市武侯区', '武侯区', ',2279,2280,', '2280');
INSERT INTO `area` VALUES ('2285', '2013-01-01 09:02:49', '2013-01-01 09:02:49', null, '四川省成都市成华区', '成华区', ',2279,2280,', '2280');
INSERT INTO `area` VALUES ('2286', '2013-01-01 09:02:49', '2013-01-01 09:02:49', null, '四川省成都市龙泉驿区', '龙泉驿区', ',2279,2280,', '2280');
INSERT INTO `area` VALUES ('2287', '2013-01-01 09:02:49', '2013-01-01 09:02:49', null, '四川省成都市青白江区', '青白江区', ',2279,2280,', '2280');
INSERT INTO `area` VALUES ('2288', '2013-01-01 09:02:49', '2013-01-01 09:02:49', null, '四川省成都市新都区', '新都区', ',2279,2280,', '2280');
INSERT INTO `area` VALUES ('2289', '2013-01-01 09:02:49', '2013-01-01 09:02:49', null, '四川省成都市温江区', '温江区', ',2279,2280,', '2280');
INSERT INTO `area` VALUES ('2290', '2013-01-01 09:02:49', '2013-01-01 09:02:49', null, '四川省成都市金堂县', '金堂县', ',2279,2280,', '2280');
INSERT INTO `area` VALUES ('2291', '2013-01-01 09:02:49', '2013-01-01 09:02:49', null, '四川省成都市双流县', '双流县', ',2279,2280,', '2280');
INSERT INTO `area` VALUES ('2292', '2013-01-01 09:02:49', '2013-01-01 09:02:49', null, '四川省成都市郫县', '郫县', ',2279,2280,', '2280');
INSERT INTO `area` VALUES ('2293', '2013-01-01 09:02:49', '2013-01-01 09:02:49', null, '四川省成都市大邑县', '大邑县', ',2279,2280,', '2280');
INSERT INTO `area` VALUES ('2294', '2013-01-01 09:02:50', '2013-01-01 09:02:50', null, '四川省成都市蒲江县', '蒲江县', ',2279,2280,', '2280');
INSERT INTO `area` VALUES ('2295', '2013-01-01 09:02:50', '2013-01-01 09:02:50', null, '四川省成都市新津县', '新津县', ',2279,2280,', '2280');
INSERT INTO `area` VALUES ('2296', '2013-01-01 09:02:50', '2013-01-01 09:02:50', null, '四川省成都市都江堰市', '都江堰市', ',2279,2280,', '2280');
INSERT INTO `area` VALUES ('2297', '2013-01-01 09:02:50', '2013-01-01 09:02:50', null, '四川省成都市彭州市', '彭州市', ',2279,2280,', '2280');
INSERT INTO `area` VALUES ('2298', '2013-01-01 09:02:50', '2013-01-01 09:02:50', null, '四川省成都市邛崃市', '邛崃市', ',2279,2280,', '2280');
INSERT INTO `area` VALUES ('2299', '2013-01-01 09:02:50', '2013-01-01 09:02:50', null, '四川省成都市崇州市', '崇州市', ',2279,2280,', '2280');
INSERT INTO `area` VALUES ('2300', '2013-01-01 09:02:50', '2013-01-01 09:02:50', null, '四川省自贡市', '自贡市', ',2279,', '2279');
INSERT INTO `area` VALUES ('2301', '2013-01-01 09:02:50', '2013-01-01 09:02:50', null, '四川省自贡市自流井区', '自流井区', ',2279,2300,', '2300');
INSERT INTO `area` VALUES ('2302', '2013-01-01 09:02:50', '2013-01-01 09:02:50', null, '四川省自贡市贡井区', '贡井区', ',2279,2300,', '2300');
INSERT INTO `area` VALUES ('2303', '2013-01-01 09:02:50', '2013-01-01 09:02:50', null, '四川省自贡市大安区', '大安区', ',2279,2300,', '2300');
INSERT INTO `area` VALUES ('2304', '2013-01-01 09:02:50', '2013-01-01 09:02:50', null, '四川省自贡市沿滩区', '沿滩区', ',2279,2300,', '2300');
INSERT INTO `area` VALUES ('2305', '2013-01-01 09:02:50', '2013-01-01 09:02:50', null, '四川省自贡市荣县', '荣县', ',2279,2300,', '2300');
INSERT INTO `area` VALUES ('2306', '2013-01-01 09:02:50', '2013-01-01 09:02:50', null, '四川省自贡市富顺县', '富顺县', ',2279,2300,', '2300');
INSERT INTO `area` VALUES ('2307', '2013-01-01 09:02:50', '2013-01-01 09:02:50', null, '四川省攀枝花市', '攀枝花市', ',2279,', '2279');
INSERT INTO `area` VALUES ('2308', '2013-01-01 09:02:50', '2013-01-01 09:02:50', null, '四川省攀枝花市东区', '东区', ',2279,2307,', '2307');
INSERT INTO `area` VALUES ('2309', '2013-01-01 09:02:50', '2013-01-01 09:02:50', null, '四川省攀枝花市西区', '西区', ',2279,2307,', '2307');
INSERT INTO `area` VALUES ('2310', '2013-01-01 09:02:50', '2013-01-01 09:02:50', null, '四川省攀枝花市仁和区', '仁和区', ',2279,2307,', '2307');
INSERT INTO `area` VALUES ('2311', '2013-01-01 09:02:50', '2013-01-01 09:02:50', null, '四川省攀枝花市米易县', '米易县', ',2279,2307,', '2307');
INSERT INTO `area` VALUES ('2312', '2013-01-01 09:02:50', '2013-01-01 09:02:50', null, '四川省攀枝花市盐边县', '盐边县', ',2279,2307,', '2307');
INSERT INTO `area` VALUES ('2313', '2013-01-01 09:02:50', '2013-01-01 09:02:50', null, '四川省泸州市', '泸州市', ',2279,', '2279');
INSERT INTO `area` VALUES ('2314', '2013-01-01 09:02:51', '2013-01-01 09:02:51', null, '四川省泸州市江阳区', '江阳区', ',2279,2313,', '2313');
INSERT INTO `area` VALUES ('2315', '2013-01-01 09:02:51', '2013-01-01 09:02:51', null, '四川省泸州市纳溪区', '纳溪区', ',2279,2313,', '2313');
INSERT INTO `area` VALUES ('2316', '2013-01-01 09:02:51', '2013-01-01 09:02:51', null, '四川省泸州市龙马潭区', '龙马潭区', ',2279,2313,', '2313');
INSERT INTO `area` VALUES ('2317', '2013-01-01 09:02:51', '2013-01-01 09:02:51', null, '四川省泸州市泸县', '泸县', ',2279,2313,', '2313');
INSERT INTO `area` VALUES ('2318', '2013-01-01 09:02:51', '2013-01-01 09:02:51', null, '四川省泸州市合江县', '合江县', ',2279,2313,', '2313');
INSERT INTO `area` VALUES ('2319', '2013-01-01 09:02:51', '2013-01-01 09:02:51', null, '四川省泸州市叙永县', '叙永县', ',2279,2313,', '2313');
INSERT INTO `area` VALUES ('2320', '2013-01-01 09:02:51', '2013-01-01 09:02:51', null, '四川省泸州市古蔺县', '古蔺县', ',2279,2313,', '2313');
INSERT INTO `area` VALUES ('2321', '2013-01-01 09:02:51', '2013-01-01 09:02:51', null, '四川省德阳市', '德阳市', ',2279,', '2279');
INSERT INTO `area` VALUES ('2322', '2013-01-01 09:02:51', '2013-01-01 09:02:51', null, '四川省德阳市旌阳区', '旌阳区', ',2279,2321,', '2321');
INSERT INTO `area` VALUES ('2323', '2013-01-01 09:02:51', '2013-01-01 09:02:51', null, '四川省德阳市中江县', '中江县', ',2279,2321,', '2321');
INSERT INTO `area` VALUES ('2324', '2013-01-01 09:02:51', '2013-01-01 09:02:51', null, '四川省德阳市罗江县', '罗江县', ',2279,2321,', '2321');
INSERT INTO `area` VALUES ('2325', '2013-01-01 09:02:51', '2013-01-01 09:02:51', null, '四川省德阳市广汉市', '广汉市', ',2279,2321,', '2321');
INSERT INTO `area` VALUES ('2326', '2013-01-01 09:02:51', '2013-01-01 09:02:51', null, '四川省德阳市什邡市', '什邡市', ',2279,2321,', '2321');
INSERT INTO `area` VALUES ('2327', '2013-01-01 09:02:51', '2013-01-01 09:02:51', null, '四川省德阳市绵竹市', '绵竹市', ',2279,2321,', '2321');
INSERT INTO `area` VALUES ('2328', '2013-01-01 09:02:51', '2013-01-01 09:02:51', null, '四川省绵阳市', '绵阳市', ',2279,', '2279');
INSERT INTO `area` VALUES ('2329', '2013-01-01 09:02:51', '2013-01-01 09:02:51', null, '四川省绵阳市涪城区', '涪城区', ',2279,2328,', '2328');
INSERT INTO `area` VALUES ('2330', '2013-01-01 09:02:51', '2013-01-01 09:02:51', null, '四川省绵阳市游仙区', '游仙区', ',2279,2328,', '2328');
INSERT INTO `area` VALUES ('2331', '2013-01-01 09:02:51', '2013-01-01 09:02:51', null, '四川省绵阳市三台县', '三台县', ',2279,2328,', '2328');
INSERT INTO `area` VALUES ('2332', '2013-01-01 09:02:51', '2013-01-01 09:02:51', null, '四川省绵阳市盐亭县', '盐亭县', ',2279,2328,', '2328');
INSERT INTO `area` VALUES ('2333', '2013-01-01 09:02:51', '2013-01-01 09:02:51', null, '四川省绵阳市安县', '安县', ',2279,2328,', '2328');
INSERT INTO `area` VALUES ('2334', '2013-01-01 09:02:51', '2013-01-01 09:02:51', null, '四川省绵阳市梓潼县', '梓潼县', ',2279,2328,', '2328');
INSERT INTO `area` VALUES ('2335', '2013-01-01 09:02:51', '2013-01-01 09:02:51', null, '四川省绵阳市北川羌族自治县', '北川羌族自治县', ',2279,2328,', '2328');
INSERT INTO `area` VALUES ('2336', '2013-01-01 09:02:52', '2013-01-01 09:02:52', null, '四川省绵阳市平武县', '平武县', ',2279,2328,', '2328');
INSERT INTO `area` VALUES ('2337', '2013-01-01 09:02:52', '2013-01-01 09:02:52', null, '四川省绵阳市江油市', '江油市', ',2279,2328,', '2328');
INSERT INTO `area` VALUES ('2338', '2013-01-01 09:02:52', '2013-01-01 09:02:52', null, '四川省广元市', '广元市', ',2279,', '2279');
INSERT INTO `area` VALUES ('2339', '2013-01-01 09:02:52', '2013-01-01 09:02:52', null, '四川省广元市利州区', '利州区', ',2279,2338,', '2338');
INSERT INTO `area` VALUES ('2340', '2013-01-01 09:02:52', '2013-01-01 09:02:52', null, '四川省广元市元坝区', '元坝区', ',2279,2338,', '2338');
INSERT INTO `area` VALUES ('2341', '2013-01-01 09:02:52', '2013-01-01 09:02:52', null, '四川省广元市朝天区', '朝天区', ',2279,2338,', '2338');
INSERT INTO `area` VALUES ('2342', '2013-01-01 09:02:52', '2013-01-01 09:02:52', null, '四川省广元市旺苍县', '旺苍县', ',2279,2338,', '2338');
INSERT INTO `area` VALUES ('2343', '2013-01-01 09:02:52', '2013-01-01 09:02:52', null, '四川省广元市青川县', '青川县', ',2279,2338,', '2338');
INSERT INTO `area` VALUES ('2344', '2013-01-01 09:02:52', '2013-01-01 09:02:52', null, '四川省广元市剑阁县', '剑阁县', ',2279,2338,', '2338');
INSERT INTO `area` VALUES ('2345', '2013-01-01 09:02:52', '2013-01-01 09:02:52', null, '四川省广元市苍溪县', '苍溪县', ',2279,2338,', '2338');
INSERT INTO `area` VALUES ('2346', '2013-01-01 09:02:52', '2013-01-01 09:02:52', null, '四川省遂宁市', '遂宁市', ',2279,', '2279');
INSERT INTO `area` VALUES ('2347', '2013-01-01 09:02:52', '2013-01-01 09:02:52', null, '四川省遂宁市船山区', '船山区', ',2279,2346,', '2346');
INSERT INTO `area` VALUES ('2348', '2013-01-01 09:02:52', '2013-01-01 09:02:52', null, '四川省遂宁市安居区', '安居区', ',2279,2346,', '2346');
INSERT INTO `area` VALUES ('2349', '2013-01-01 09:02:52', '2013-01-01 09:02:52', null, '四川省遂宁市蓬溪县', '蓬溪县', ',2279,2346,', '2346');
INSERT INTO `area` VALUES ('2350', '2013-01-01 09:02:52', '2013-01-01 09:02:52', null, '四川省遂宁市射洪县', '射洪县', ',2279,2346,', '2346');
INSERT INTO `area` VALUES ('2351', '2013-01-01 09:02:52', '2013-01-01 09:02:52', null, '四川省遂宁市大英县', '大英县', ',2279,2346,', '2346');
INSERT INTO `area` VALUES ('2352', '2013-01-01 09:02:52', '2013-01-01 09:02:52', null, '四川省内江市', '内江市', ',2279,', '2279');
INSERT INTO `area` VALUES ('2353', '2013-01-01 09:02:52', '2013-01-01 09:02:52', null, '四川省内江市市中区', '市中区', ',2279,2352,', '2352');
INSERT INTO `area` VALUES ('2354', '2013-01-01 09:02:52', '2013-01-01 09:02:52', null, '四川省内江市东兴区', '东兴区', ',2279,2352,', '2352');
INSERT INTO `area` VALUES ('2355', '2013-01-01 09:02:52', '2013-01-01 09:02:52', null, '四川省内江市威远县', '威远县', ',2279,2352,', '2352');
INSERT INTO `area` VALUES ('2356', '2013-01-01 09:02:52', '2013-01-01 09:02:52', null, '四川省内江市资中县', '资中县', ',2279,2352,', '2352');
INSERT INTO `area` VALUES ('2357', '2013-01-01 09:02:52', '2013-01-01 09:02:52', null, '四川省内江市隆昌县', '隆昌县', ',2279,2352,', '2352');
INSERT INTO `area` VALUES ('2358', '2013-01-01 09:02:53', '2013-01-01 09:02:53', null, '四川省乐山市', '乐山市', ',2279,', '2279');
INSERT INTO `area` VALUES ('2359', '2013-01-01 09:02:53', '2013-01-01 09:02:53', null, '四川省乐山市市中区', '市中区', ',2279,2358,', '2358');
INSERT INTO `area` VALUES ('2360', '2013-01-01 09:02:53', '2013-01-01 09:02:53', null, '四川省乐山市沙湾区', '沙湾区', ',2279,2358,', '2358');
INSERT INTO `area` VALUES ('2361', '2013-01-01 09:02:53', '2013-01-01 09:02:53', null, '四川省乐山市五通桥区', '五通桥区', ',2279,2358,', '2358');
INSERT INTO `area` VALUES ('2362', '2013-01-01 09:02:53', '2013-01-01 09:02:53', null, '四川省乐山市金口河区', '金口河区', ',2279,2358,', '2358');
INSERT INTO `area` VALUES ('2363', '2013-01-01 09:02:53', '2013-01-01 09:02:53', null, '四川省乐山市犍为县', '犍为县', ',2279,2358,', '2358');
INSERT INTO `area` VALUES ('2364', '2013-01-01 09:02:53', '2013-01-01 09:02:53', null, '四川省乐山市井研县', '井研县', ',2279,2358,', '2358');
INSERT INTO `area` VALUES ('2365', '2013-01-01 09:02:53', '2013-01-01 09:02:53', null, '四川省乐山市夹江县', '夹江县', ',2279,2358,', '2358');
INSERT INTO `area` VALUES ('2366', '2013-01-01 09:02:53', '2013-01-01 09:02:53', null, '四川省乐山市沐川县', '沐川县', ',2279,2358,', '2358');
INSERT INTO `area` VALUES ('2367', '2013-01-01 09:02:53', '2013-01-01 09:02:53', null, '四川省乐山市峨边彝族自治县', '峨边彝族自治县', ',2279,2358,', '2358');
INSERT INTO `area` VALUES ('2368', '2013-01-01 09:02:53', '2013-01-01 09:02:53', null, '四川省乐山市马边彝族自治县', '马边彝族自治县', ',2279,2358,', '2358');
INSERT INTO `area` VALUES ('2369', '2013-01-01 09:02:53', '2013-01-01 09:02:53', null, '四川省乐山市峨眉山市', '峨眉山市', ',2279,2358,', '2358');
INSERT INTO `area` VALUES ('2370', '2013-01-01 09:02:53', '2013-01-01 09:02:53', null, '四川省南充市', '南充市', ',2279,', '2279');
INSERT INTO `area` VALUES ('2371', '2013-01-01 09:02:53', '2013-01-01 09:02:53', null, '四川省南充市顺庆区', '顺庆区', ',2279,2370,', '2370');
INSERT INTO `area` VALUES ('2372', '2013-01-01 09:02:53', '2013-01-01 09:02:53', null, '四川省南充市高坪区', '高坪区', ',2279,2370,', '2370');
INSERT INTO `area` VALUES ('2373', '2013-01-01 09:02:53', '2013-01-01 09:02:53', null, '四川省南充市嘉陵区', '嘉陵区', ',2279,2370,', '2370');
INSERT INTO `area` VALUES ('2374', '2013-01-01 09:02:53', '2013-01-01 09:02:53', null, '四川省南充市南部县', '南部县', ',2279,2370,', '2370');
INSERT INTO `area` VALUES ('2375', '2013-01-01 09:02:53', '2013-01-01 09:02:53', null, '四川省南充市营山县', '营山县', ',2279,2370,', '2370');
INSERT INTO `area` VALUES ('2376', '2013-01-01 09:02:53', '2013-01-01 09:02:53', null, '四川省南充市蓬安县', '蓬安县', ',2279,2370,', '2370');
INSERT INTO `area` VALUES ('2377', '2013-01-01 09:02:53', '2013-01-01 09:02:53', null, '四川省南充市仪陇县', '仪陇县', ',2279,2370,', '2370');
INSERT INTO `area` VALUES ('2378', '2013-01-01 09:02:53', '2013-01-01 09:02:53', null, '四川省南充市西充县', '西充县', ',2279,2370,', '2370');
INSERT INTO `area` VALUES ('2379', '2013-01-01 09:02:53', '2013-01-01 09:02:53', null, '四川省南充市阆中市', '阆中市', ',2279,2370,', '2370');
INSERT INTO `area` VALUES ('2380', '2013-01-01 09:02:54', '2013-01-01 09:02:54', null, '四川省眉山市', '眉山市', ',2279,', '2279');
INSERT INTO `area` VALUES ('2381', '2013-01-01 09:02:54', '2013-01-01 09:02:54', null, '四川省眉山市东坡区', '东坡区', ',2279,2380,', '2380');
INSERT INTO `area` VALUES ('2382', '2013-01-01 09:02:54', '2013-01-01 09:02:54', null, '四川省眉山市仁寿县', '仁寿县', ',2279,2380,', '2380');
INSERT INTO `area` VALUES ('2383', '2013-01-01 09:02:54', '2013-01-01 09:02:54', null, '四川省眉山市彭山县', '彭山县', ',2279,2380,', '2380');
INSERT INTO `area` VALUES ('2384', '2013-01-01 09:02:54', '2013-01-01 09:02:54', null, '四川省眉山市洪雅县', '洪雅县', ',2279,2380,', '2380');
INSERT INTO `area` VALUES ('2385', '2013-01-01 09:02:54', '2013-01-01 09:02:54', null, '四川省眉山市丹棱县', '丹棱县', ',2279,2380,', '2380');
INSERT INTO `area` VALUES ('2386', '2013-01-01 09:02:54', '2013-01-01 09:02:54', null, '四川省眉山市青神县', '青神县', ',2279,2380,', '2380');
INSERT INTO `area` VALUES ('2387', '2013-01-01 09:02:54', '2013-01-01 09:02:54', null, '四川省宜宾市', '宜宾市', ',2279,', '2279');
INSERT INTO `area` VALUES ('2388', '2013-01-01 09:02:54', '2013-01-01 09:02:54', null, '四川省宜宾市翠屏区', '翠屏区', ',2279,2387,', '2387');
INSERT INTO `area` VALUES ('2389', '2013-01-01 09:02:54', '2013-01-01 09:02:54', null, '四川省宜宾市南溪区', '南溪区', ',2279,2387,', '2387');
INSERT INTO `area` VALUES ('2390', '2013-01-01 09:02:54', '2013-01-01 09:02:54', null, '四川省宜宾市宜宾县', '宜宾县', ',2279,2387,', '2387');
INSERT INTO `area` VALUES ('2391', '2013-01-01 09:02:54', '2013-01-01 09:02:54', null, '四川省宜宾市江安县', '江安县', ',2279,2387,', '2387');
INSERT INTO `area` VALUES ('2392', '2013-01-01 09:02:54', '2013-01-01 09:02:54', null, '四川省宜宾市长宁县', '长宁县', ',2279,2387,', '2387');
INSERT INTO `area` VALUES ('2393', '2013-01-01 09:02:54', '2013-01-01 09:02:54', null, '四川省宜宾市高县', '高县', ',2279,2387,', '2387');
INSERT INTO `area` VALUES ('2394', '2013-01-01 09:02:54', '2013-01-01 09:02:54', null, '四川省宜宾市珙县', '珙县', ',2279,2387,', '2387');
INSERT INTO `area` VALUES ('2395', '2013-01-01 09:02:54', '2013-01-01 09:02:54', null, '四川省宜宾市筠连县', '筠连县', ',2279,2387,', '2387');
INSERT INTO `area` VALUES ('2396', '2013-01-01 09:02:54', '2013-01-01 09:02:54', null, '四川省宜宾市兴文县', '兴文县', ',2279,2387,', '2387');
INSERT INTO `area` VALUES ('2397', '2013-01-01 09:02:54', '2013-01-01 09:02:54', null, '四川省宜宾市屏山县', '屏山县', ',2279,2387,', '2387');
INSERT INTO `area` VALUES ('2398', '2013-01-01 09:02:54', '2013-01-01 09:02:54', null, '四川省广安市', '广安市', ',2279,', '2279');
INSERT INTO `area` VALUES ('2399', '2013-01-01 09:02:54', '2013-01-01 09:02:54', null, '四川省广安市广安区', '广安区', ',2279,2398,', '2398');
INSERT INTO `area` VALUES ('2400', '2013-01-01 09:02:54', '2013-01-01 09:02:54', null, '四川省广安市岳池县', '岳池县', ',2279,2398,', '2398');
INSERT INTO `area` VALUES ('2401', '2013-01-01 09:02:55', '2013-01-01 09:02:55', null, '四川省广安市武胜县', '武胜县', ',2279,2398,', '2398');
INSERT INTO `area` VALUES ('2402', '2013-01-01 09:02:55', '2013-01-01 09:02:55', null, '四川省广安市邻水县', '邻水县', ',2279,2398,', '2398');
INSERT INTO `area` VALUES ('2403', '2013-01-01 09:02:55', '2013-01-01 09:02:55', null, '四川省广安市华蓥市', '华蓥市', ',2279,2398,', '2398');
INSERT INTO `area` VALUES ('2404', '2013-01-01 09:02:55', '2013-01-01 09:02:55', null, '四川省达州市', '达州市', ',2279,', '2279');
INSERT INTO `area` VALUES ('2405', '2013-01-01 09:02:55', '2013-01-01 09:02:55', null, '四川省达州市通川区', '通川区', ',2279,2404,', '2404');
INSERT INTO `area` VALUES ('2406', '2013-01-01 09:02:55', '2013-01-01 09:02:55', null, '四川省达州市达县', '达县', ',2279,2404,', '2404');
INSERT INTO `area` VALUES ('2407', '2013-01-01 09:02:55', '2013-01-01 09:02:55', null, '四川省达州市宣汉县', '宣汉县', ',2279,2404,', '2404');
INSERT INTO `area` VALUES ('2408', '2013-01-01 09:02:55', '2013-01-01 09:02:55', null, '四川省达州市开江县', '开江县', ',2279,2404,', '2404');
INSERT INTO `area` VALUES ('2409', '2013-01-01 09:02:55', '2013-01-01 09:02:55', null, '四川省达州市大竹县', '大竹县', ',2279,2404,', '2404');
INSERT INTO `area` VALUES ('2410', '2013-01-01 09:02:55', '2013-01-01 09:02:55', null, '四川省达州市渠县', '渠县', ',2279,2404,', '2404');
INSERT INTO `area` VALUES ('2411', '2013-01-01 09:02:55', '2013-01-01 09:02:55', null, '四川省达州市万源市', '万源市', ',2279,2404,', '2404');
INSERT INTO `area` VALUES ('2412', '2013-01-01 09:02:55', '2013-01-01 09:02:55', null, '四川省雅安市', '雅安市', ',2279,', '2279');
INSERT INTO `area` VALUES ('2413', '2013-01-01 09:02:55', '2013-01-01 09:02:55', null, '四川省雅安市雨城区', '雨城区', ',2279,2412,', '2412');
INSERT INTO `area` VALUES ('2414', '2013-01-01 09:02:55', '2013-01-01 09:02:55', null, '四川省雅安市名山区', '名山区', ',2279,2412,', '2412');
INSERT INTO `area` VALUES ('2415', '2013-01-01 09:02:55', '2013-01-01 09:02:55', null, '四川省雅安市荥经县', '荥经县', ',2279,2412,', '2412');
INSERT INTO `area` VALUES ('2416', '2013-01-01 09:02:55', '2013-01-01 09:02:55', null, '四川省雅安市汉源县', '汉源县', ',2279,2412,', '2412');
INSERT INTO `area` VALUES ('2417', '2013-01-01 09:02:55', '2013-01-01 09:02:55', null, '四川省雅安市石棉县', '石棉县', ',2279,2412,', '2412');
INSERT INTO `area` VALUES ('2418', '2013-01-01 09:02:55', '2013-01-01 09:02:55', null, '四川省雅安市天全县', '天全县', ',2279,2412,', '2412');
INSERT INTO `area` VALUES ('2419', '2013-01-01 09:02:55', '2013-01-01 09:02:55', null, '四川省雅安市芦山县', '芦山县', ',2279,2412,', '2412');
INSERT INTO `area` VALUES ('2420', '2013-01-01 09:02:55', '2013-01-01 09:02:55', null, '四川省雅安市宝兴县', '宝兴县', ',2279,2412,', '2412');
INSERT INTO `area` VALUES ('2421', '2013-01-01 09:02:55', '2013-01-01 09:02:55', null, '四川省巴中市', '巴中市', ',2279,', '2279');
INSERT INTO `area` VALUES ('2422', '2013-01-01 09:02:55', '2013-01-01 09:02:55', null, '四川省巴中市巴州区', '巴州区', ',2279,2421,', '2421');
INSERT INTO `area` VALUES ('2423', '2013-01-01 09:02:56', '2013-01-01 09:02:56', null, '四川省巴中市通江县', '通江县', ',2279,2421,', '2421');
INSERT INTO `area` VALUES ('2424', '2013-01-01 09:02:56', '2013-01-01 09:02:56', null, '四川省巴中市南江县', '南江县', ',2279,2421,', '2421');
INSERT INTO `area` VALUES ('2425', '2013-01-01 09:02:56', '2013-01-01 09:02:56', null, '四川省巴中市平昌县', '平昌县', ',2279,2421,', '2421');
INSERT INTO `area` VALUES ('2426', '2013-01-01 09:02:56', '2013-01-01 09:02:56', null, '四川省资阳市', '资阳市', ',2279,', '2279');
INSERT INTO `area` VALUES ('2427', '2013-01-01 09:02:56', '2013-01-01 09:02:56', null, '四川省资阳市雁江区', '雁江区', ',2279,2426,', '2426');
INSERT INTO `area` VALUES ('2428', '2013-01-01 09:02:56', '2013-01-01 09:02:56', null, '四川省资阳市安岳县', '安岳县', ',2279,2426,', '2426');
INSERT INTO `area` VALUES ('2429', '2013-01-01 09:02:56', '2013-01-01 09:02:56', null, '四川省资阳市乐至县', '乐至县', ',2279,2426,', '2426');
INSERT INTO `area` VALUES ('2430', '2013-01-01 09:02:56', '2013-01-01 09:02:56', null, '四川省资阳市简阳市', '简阳市', ',2279,2426,', '2426');
INSERT INTO `area` VALUES ('2431', '2013-01-01 09:02:56', '2013-01-01 09:02:56', null, '四川省阿坝藏族羌族自治州', '阿坝藏族羌族自治州', ',2279,', '2279');
INSERT INTO `area` VALUES ('2432', '2013-01-01 09:02:56', '2013-01-01 09:02:56', null, '四川省阿坝藏族羌族自治州汶川县', '汶川县', ',2279,2431,', '2431');
INSERT INTO `area` VALUES ('2433', '2013-01-01 09:02:56', '2013-01-01 09:02:56', null, '四川省阿坝藏族羌族自治州理县', '理县', ',2279,2431,', '2431');
INSERT INTO `area` VALUES ('2434', '2013-01-01 09:02:56', '2013-01-01 09:02:56', null, '四川省阿坝藏族羌族自治州茂县', '茂县', ',2279,2431,', '2431');
INSERT INTO `area` VALUES ('2435', '2013-01-01 09:02:56', '2013-01-01 09:02:56', null, '四川省阿坝藏族羌族自治州松潘县', '松潘县', ',2279,2431,', '2431');
INSERT INTO `area` VALUES ('2436', '2013-01-01 09:02:56', '2013-01-01 09:02:56', null, '四川省阿坝藏族羌族自治州九寨沟县', '九寨沟县', ',2279,2431,', '2431');
INSERT INTO `area` VALUES ('2437', '2013-01-01 09:02:56', '2013-01-01 09:02:56', null, '四川省阿坝藏族羌族自治州金川县', '金川县', ',2279,2431,', '2431');
INSERT INTO `area` VALUES ('2438', '2013-01-01 09:02:56', '2013-01-01 09:02:56', null, '四川省阿坝藏族羌族自治州小金县', '小金县', ',2279,2431,', '2431');
INSERT INTO `area` VALUES ('2439', '2013-01-01 09:02:56', '2013-01-01 09:02:56', null, '四川省阿坝藏族羌族自治州黑水县', '黑水县', ',2279,2431,', '2431');
INSERT INTO `area` VALUES ('2440', '2013-01-01 09:02:56', '2013-01-01 09:02:56', null, '四川省阿坝藏族羌族自治州马尔康县', '马尔康县', ',2279,2431,', '2431');
INSERT INTO `area` VALUES ('2441', '2013-01-01 09:02:56', '2013-01-01 09:02:56', null, '四川省阿坝藏族羌族自治州壤塘县', '壤塘县', ',2279,2431,', '2431');
INSERT INTO `area` VALUES ('2442', '2013-01-01 09:02:56', '2013-01-01 09:02:56', null, '四川省阿坝藏族羌族自治州阿坝县', '阿坝县', ',2279,2431,', '2431');
INSERT INTO `area` VALUES ('2443', '2013-01-01 09:02:56', '2013-01-01 09:02:56', null, '四川省阿坝藏族羌族自治州若尔盖县', '若尔盖县', ',2279,2431,', '2431');
INSERT INTO `area` VALUES ('2444', '2013-01-01 09:02:56', '2013-01-01 09:02:56', null, '四川省阿坝藏族羌族自治州红原县', '红原县', ',2279,2431,', '2431');
INSERT INTO `area` VALUES ('2445', '2013-01-01 09:02:57', '2013-01-01 09:02:57', null, '四川省甘孜藏族自治州', '甘孜藏族自治州', ',2279,', '2279');
INSERT INTO `area` VALUES ('2446', '2013-01-01 09:02:57', '2013-01-01 09:02:57', null, '四川省甘孜藏族自治州康定县', '康定县', ',2279,2445,', '2445');
INSERT INTO `area` VALUES ('2447', '2013-01-01 09:02:57', '2013-01-01 09:02:57', null, '四川省甘孜藏族自治州泸定县', '泸定县', ',2279,2445,', '2445');
INSERT INTO `area` VALUES ('2448', '2013-01-01 09:02:57', '2013-01-01 09:02:57', null, '四川省甘孜藏族自治州丹巴县', '丹巴县', ',2279,2445,', '2445');
INSERT INTO `area` VALUES ('2449', '2013-01-01 09:02:57', '2013-01-01 09:02:57', null, '四川省甘孜藏族自治州九龙县', '九龙县', ',2279,2445,', '2445');
INSERT INTO `area` VALUES ('2450', '2013-01-01 09:02:57', '2013-01-01 09:02:57', null, '四川省甘孜藏族自治州雅江县', '雅江县', ',2279,2445,', '2445');
INSERT INTO `area` VALUES ('2451', '2013-01-01 09:02:57', '2013-01-01 09:02:57', null, '四川省甘孜藏族自治州道孚县', '道孚县', ',2279,2445,', '2445');
INSERT INTO `area` VALUES ('2452', '2013-01-01 09:02:57', '2013-01-01 09:02:57', null, '四川省甘孜藏族自治州炉霍县', '炉霍县', ',2279,2445,', '2445');
INSERT INTO `area` VALUES ('2453', '2013-01-01 09:02:57', '2013-01-01 09:02:57', null, '四川省甘孜藏族自治州甘孜县', '甘孜县', ',2279,2445,', '2445');
INSERT INTO `area` VALUES ('2454', '2013-01-01 09:02:57', '2013-01-01 09:02:57', null, '四川省甘孜藏族自治州新龙县', '新龙县', ',2279,2445,', '2445');
INSERT INTO `area` VALUES ('2455', '2013-01-01 09:02:57', '2013-01-01 09:02:57', null, '四川省甘孜藏族自治州德格县', '德格县', ',2279,2445,', '2445');
INSERT INTO `area` VALUES ('2456', '2013-01-01 09:02:57', '2013-01-01 09:02:57', null, '四川省甘孜藏族自治州白玉县', '白玉县', ',2279,2445,', '2445');
INSERT INTO `area` VALUES ('2457', '2013-01-01 09:02:57', '2013-01-01 09:02:57', null, '四川省甘孜藏族自治州石渠县', '石渠县', ',2279,2445,', '2445');
INSERT INTO `area` VALUES ('2458', '2013-01-01 09:02:57', '2013-01-01 09:02:57', null, '四川省甘孜藏族自治州色达县', '色达县', ',2279,2445,', '2445');
INSERT INTO `area` VALUES ('2459', '2013-01-01 09:02:57', '2013-01-01 09:02:57', null, '四川省甘孜藏族自治州理塘县', '理塘县', ',2279,2445,', '2445');
INSERT INTO `area` VALUES ('2460', '2013-01-01 09:02:57', '2013-01-01 09:02:57', null, '四川省甘孜藏族自治州巴塘县', '巴塘县', ',2279,2445,', '2445');
INSERT INTO `area` VALUES ('2461', '2013-01-01 09:02:57', '2013-01-01 09:02:57', null, '四川省甘孜藏族自治州乡城县', '乡城县', ',2279,2445,', '2445');
INSERT INTO `area` VALUES ('2462', '2013-01-01 09:02:57', '2013-01-01 09:02:57', null, '四川省甘孜藏族自治州稻城县', '稻城县', ',2279,2445,', '2445');
INSERT INTO `area` VALUES ('2463', '2013-01-01 09:02:57', '2013-01-01 09:02:57', null, '四川省甘孜藏族自治州得荣县', '得荣县', ',2279,2445,', '2445');
INSERT INTO `area` VALUES ('2464', '2013-01-01 09:02:57', '2013-01-01 09:02:57', null, '四川省凉山彝族自治州', '凉山彝族自治州', ',2279,', '2279');
INSERT INTO `area` VALUES ('2465', '2013-01-01 09:02:57', '2013-01-01 09:02:57', null, '四川省凉山彝族自治州西昌市', '西昌市', ',2279,2464,', '2464');
INSERT INTO `area` VALUES ('2466', '2013-01-01 09:02:58', '2013-01-01 09:02:58', null, '四川省凉山彝族自治州木里藏族自治县', '木里藏族自治县', ',2279,2464,', '2464');
INSERT INTO `area` VALUES ('2467', '2013-01-01 09:02:58', '2013-01-01 09:02:58', null, '四川省凉山彝族自治州盐源县', '盐源县', ',2279,2464,', '2464');
INSERT INTO `area` VALUES ('2468', '2013-01-01 09:02:58', '2013-01-01 09:02:58', null, '四川省凉山彝族自治州德昌县', '德昌县', ',2279,2464,', '2464');
INSERT INTO `area` VALUES ('2469', '2013-01-01 09:02:58', '2013-01-01 09:02:58', null, '四川省凉山彝族自治州会理县', '会理县', ',2279,2464,', '2464');
INSERT INTO `area` VALUES ('2470', '2013-01-01 09:02:58', '2013-01-01 09:02:58', null, '四川省凉山彝族自治州会东县', '会东县', ',2279,2464,', '2464');
INSERT INTO `area` VALUES ('2471', '2013-01-01 09:02:58', '2013-01-01 09:02:58', null, '四川省凉山彝族自治州宁南县', '宁南县', ',2279,2464,', '2464');
INSERT INTO `area` VALUES ('2472', '2013-01-01 09:02:58', '2013-01-01 09:02:58', null, '四川省凉山彝族自治州普格县', '普格县', ',2279,2464,', '2464');
INSERT INTO `area` VALUES ('2473', '2013-01-01 09:02:58', '2013-01-01 09:02:58', null, '四川省凉山彝族自治州布拖县', '布拖县', ',2279,2464,', '2464');
INSERT INTO `area` VALUES ('2474', '2013-01-01 09:02:58', '2013-01-01 09:02:58', null, '四川省凉山彝族自治州金阳县', '金阳县', ',2279,2464,', '2464');
INSERT INTO `area` VALUES ('2475', '2013-01-01 09:02:58', '2013-01-01 09:02:58', null, '四川省凉山彝族自治州昭觉县', '昭觉县', ',2279,2464,', '2464');
INSERT INTO `area` VALUES ('2476', '2013-01-01 09:02:58', '2013-01-01 09:02:58', null, '四川省凉山彝族自治州喜德县', '喜德县', ',2279,2464,', '2464');
INSERT INTO `area` VALUES ('2477', '2013-01-01 09:02:58', '2013-01-01 09:02:58', null, '四川省凉山彝族自治州冕宁县', '冕宁县', ',2279,2464,', '2464');
INSERT INTO `area` VALUES ('2478', '2013-01-01 09:02:58', '2013-01-01 09:02:58', null, '四川省凉山彝族自治州越西县', '越西县', ',2279,2464,', '2464');
INSERT INTO `area` VALUES ('2479', '2013-01-01 09:02:58', '2013-01-01 09:02:58', null, '四川省凉山彝族自治州甘洛县', '甘洛县', ',2279,2464,', '2464');
INSERT INTO `area` VALUES ('2480', '2013-01-01 09:02:58', '2013-01-01 09:02:58', null, '四川省凉山彝族自治州美姑县', '美姑县', ',2279,2464,', '2464');
INSERT INTO `area` VALUES ('2481', '2013-01-01 09:02:58', '2013-01-01 09:02:58', null, '四川省凉山彝族自治州雷波县', '雷波县', ',2279,2464,', '2464');
INSERT INTO `area` VALUES ('2482', '2013-01-01 09:02:58', '2013-01-01 09:02:58', null, '贵州省', '贵州省', ',', null);
INSERT INTO `area` VALUES ('2483', '2013-01-01 09:02:58', '2013-01-01 09:02:58', null, '贵州省贵阳市', '贵阳市', ',2482,', '2482');
INSERT INTO `area` VALUES ('2484', '2013-01-01 09:02:58', '2013-01-01 09:02:58', null, '贵州省贵阳市南明区', '南明区', ',2482,2483,', '2483');
INSERT INTO `area` VALUES ('2485', '2013-01-01 09:02:59', '2013-01-01 09:02:59', null, '贵州省贵阳市云岩区', '云岩区', ',2482,2483,', '2483');
INSERT INTO `area` VALUES ('2486', '2013-01-01 09:02:59', '2013-01-01 09:02:59', null, '贵州省贵阳市花溪区', '花溪区', ',2482,2483,', '2483');
INSERT INTO `area` VALUES ('2487', '2013-01-01 09:02:59', '2013-01-01 09:02:59', null, '贵州省贵阳市乌当区', '乌当区', ',2482,2483,', '2483');
INSERT INTO `area` VALUES ('2488', '2013-01-01 09:02:59', '2013-01-01 09:02:59', null, '贵州省贵阳市白云区', '白云区', ',2482,2483,', '2483');
INSERT INTO `area` VALUES ('2489', '2013-01-01 09:02:59', '2013-01-01 09:02:59', null, '贵州省贵阳市小河区', '小河区', ',2482,2483,', '2483');
INSERT INTO `area` VALUES ('2490', '2013-01-01 09:02:59', '2013-01-01 09:02:59', null, '贵州省贵阳市开阳县', '开阳县', ',2482,2483,', '2483');
INSERT INTO `area` VALUES ('2491', '2013-01-01 09:02:59', '2013-01-01 09:02:59', null, '贵州省贵阳市息烽县', '息烽县', ',2482,2483,', '2483');
INSERT INTO `area` VALUES ('2492', '2013-01-01 09:02:59', '2013-01-01 09:02:59', null, '贵州省贵阳市修文县', '修文县', ',2482,2483,', '2483');
INSERT INTO `area` VALUES ('2493', '2013-01-01 09:02:59', '2013-01-01 09:02:59', null, '贵州省贵阳市清镇市', '清镇市', ',2482,2483,', '2483');
INSERT INTO `area` VALUES ('2494', '2013-01-01 09:02:59', '2013-01-01 09:02:59', null, '贵州省六盘水市', '六盘水市', ',2482,', '2482');
INSERT INTO `area` VALUES ('2495', '2013-01-01 09:02:59', '2013-01-01 09:02:59', null, '贵州省六盘水市钟山区', '钟山区', ',2482,2494,', '2494');
INSERT INTO `area` VALUES ('2496', '2013-01-01 09:02:59', '2013-01-01 09:02:59', null, '贵州省六盘水市六枝特区', '六枝特区', ',2482,2494,', '2494');
INSERT INTO `area` VALUES ('2497', '2013-01-01 09:02:59', '2013-01-01 09:02:59', null, '贵州省六盘水市水城县', '水城县', ',2482,2494,', '2494');
INSERT INTO `area` VALUES ('2498', '2013-01-01 09:02:59', '2013-01-01 09:02:59', null, '贵州省六盘水市盘县', '盘县', ',2482,2494,', '2494');
INSERT INTO `area` VALUES ('2499', '2013-01-01 09:02:59', '2013-01-01 09:02:59', null, '贵州省遵义市', '遵义市', ',2482,', '2482');
INSERT INTO `area` VALUES ('2500', '2013-01-01 09:02:59', '2013-01-01 09:02:59', null, '贵州省遵义市红花岗区', '红花岗区', ',2482,2499,', '2499');
INSERT INTO `area` VALUES ('2501', '2013-01-01 09:02:59', '2013-01-01 09:02:59', null, '贵州省遵义市汇川区', '汇川区', ',2482,2499,', '2499');
INSERT INTO `area` VALUES ('2502', '2013-01-01 09:02:59', '2013-01-01 09:02:59', null, '贵州省遵义市遵义县', '遵义县', ',2482,2499,', '2499');
INSERT INTO `area` VALUES ('2503', '2013-01-01 09:03:00', '2013-01-01 09:03:00', null, '贵州省遵义市桐梓县', '桐梓县', ',2482,2499,', '2499');
INSERT INTO `area` VALUES ('2504', '2013-01-01 09:03:00', '2013-01-01 09:03:00', null, '贵州省遵义市绥阳县', '绥阳县', ',2482,2499,', '2499');
INSERT INTO `area` VALUES ('2505', '2013-01-01 09:03:00', '2013-01-01 09:03:00', null, '贵州省遵义市正安县', '正安县', ',2482,2499,', '2499');
INSERT INTO `area` VALUES ('2506', '2013-01-01 09:03:00', '2013-01-01 09:03:00', null, '贵州省遵义市道真仡佬族苗族自治县', '道真仡佬族苗族自治县', ',2482,2499,', '2499');
INSERT INTO `area` VALUES ('2507', '2013-01-01 09:03:00', '2013-01-01 09:03:00', null, '贵州省遵义市务川仡佬族苗族自治县', '务川仡佬族苗族自治县', ',2482,2499,', '2499');
INSERT INTO `area` VALUES ('2508', '2013-01-01 09:03:00', '2013-01-01 09:03:00', null, '贵州省遵义市凤冈县', '凤冈县', ',2482,2499,', '2499');
INSERT INTO `area` VALUES ('2509', '2013-01-01 09:03:00', '2013-01-01 09:03:00', null, '贵州省遵义市湄潭县', '湄潭县', ',2482,2499,', '2499');
INSERT INTO `area` VALUES ('2510', '2013-01-01 09:03:00', '2013-01-01 09:03:00', null, '贵州省遵义市余庆县', '余庆县', ',2482,2499,', '2499');
INSERT INTO `area` VALUES ('2511', '2013-01-01 09:03:00', '2013-01-01 09:03:00', null, '贵州省遵义市习水县', '习水县', ',2482,2499,', '2499');
INSERT INTO `area` VALUES ('2512', '2013-01-01 09:03:00', '2013-01-01 09:03:00', null, '贵州省遵义市赤水市', '赤水市', ',2482,2499,', '2499');
INSERT INTO `area` VALUES ('2513', '2013-01-01 09:03:00', '2013-01-01 09:03:00', null, '贵州省遵义市仁怀市', '仁怀市', ',2482,2499,', '2499');
INSERT INTO `area` VALUES ('2514', '2013-01-01 09:03:00', '2013-01-01 09:03:00', null, '贵州省安顺市', '安顺市', ',2482,', '2482');
INSERT INTO `area` VALUES ('2515', '2013-01-01 09:03:00', '2013-01-01 09:03:00', null, '贵州省安顺市西秀区', '西秀区', ',2482,2514,', '2514');
INSERT INTO `area` VALUES ('2516', '2013-01-01 09:03:00', '2013-01-01 09:03:00', null, '贵州省安顺市平坝县', '平坝县', ',2482,2514,', '2514');
INSERT INTO `area` VALUES ('2517', '2013-01-01 09:03:00', '2013-01-01 09:03:00', null, '贵州省安顺市普定县', '普定县', ',2482,2514,', '2514');
INSERT INTO `area` VALUES ('2518', '2013-01-01 09:03:00', '2013-01-01 09:03:00', null, '贵州省安顺市镇宁布依族苗族自治县', '镇宁布依族苗族自治县', ',2482,2514,', '2514');
INSERT INTO `area` VALUES ('2519', '2013-01-01 09:03:00', '2013-01-01 09:03:00', null, '贵州省安顺市关岭布依族苗族自治县', '关岭布依族苗族自治县', ',2482,2514,', '2514');
INSERT INTO `area` VALUES ('2520', '2013-01-01 09:03:00', '2013-01-01 09:03:00', null, '贵州省安顺市紫云苗族布依族自治县', '紫云苗族布依族自治县', ',2482,2514,', '2514');
INSERT INTO `area` VALUES ('2521', '2013-01-01 09:03:01', '2013-01-01 09:03:01', null, '贵州省毕节市', '毕节市', ',2482,', '2482');
INSERT INTO `area` VALUES ('2522', '2013-01-01 09:03:01', '2013-01-01 09:03:01', null, '贵州省毕节市七星关区', '七星关区', ',2482,2521,', '2521');
INSERT INTO `area` VALUES ('2523', '2013-01-01 09:03:01', '2013-01-01 09:03:01', null, '贵州省毕节市大方县', '大方县', ',2482,2521,', '2521');
INSERT INTO `area` VALUES ('2524', '2013-01-01 09:03:01', '2013-01-01 09:03:01', null, '贵州省毕节市黔西县', '黔西县', ',2482,2521,', '2521');
INSERT INTO `area` VALUES ('2525', '2013-01-01 09:03:01', '2013-01-01 09:03:01', null, '贵州省毕节市金沙县', '金沙县', ',2482,2521,', '2521');
INSERT INTO `area` VALUES ('2526', '2013-01-01 09:03:01', '2013-01-01 09:03:01', null, '贵州省毕节市织金县', '织金县', ',2482,2521,', '2521');
INSERT INTO `area` VALUES ('2527', '2013-01-01 09:03:01', '2013-01-01 09:03:01', null, '贵州省毕节市纳雍县', '纳雍县', ',2482,2521,', '2521');
INSERT INTO `area` VALUES ('2528', '2013-01-01 09:03:01', '2013-01-01 09:03:01', null, '贵州省毕节市威宁彝族回族苗族自治县', '威宁彝族回族苗族自治县', ',2482,2521,', '2521');
INSERT INTO `area` VALUES ('2529', '2013-01-01 09:03:01', '2013-01-01 09:03:01', null, '贵州省毕节市赫章县', '赫章县', ',2482,2521,', '2521');
INSERT INTO `area` VALUES ('2530', '2013-01-01 09:03:01', '2013-01-01 09:03:01', null, '贵州省铜仁市', '铜仁市', ',2482,', '2482');
INSERT INTO `area` VALUES ('2531', '2013-01-01 09:03:01', '2013-01-01 09:03:01', null, '贵州省铜仁市碧江区', '碧江区', ',2482,2530,', '2530');
INSERT INTO `area` VALUES ('2532', '2013-01-01 09:03:01', '2013-01-01 09:03:01', null, '贵州省铜仁市万山区', '万山区', ',2482,2530,', '2530');
INSERT INTO `area` VALUES ('2533', '2013-01-01 09:03:01', '2013-01-01 09:03:01', null, '贵州省铜仁市江口县', '江口县', ',2482,2530,', '2530');
INSERT INTO `area` VALUES ('2534', '2013-01-01 09:03:01', '2013-01-01 09:03:01', null, '贵州省铜仁市玉屏侗族自治县', '玉屏侗族自治县', ',2482,2530,', '2530');
INSERT INTO `area` VALUES ('2535', '2013-01-01 09:03:01', '2013-01-01 09:03:01', null, '贵州省铜仁市石阡县', '石阡县', ',2482,2530,', '2530');
INSERT INTO `area` VALUES ('2536', '2013-01-01 09:03:01', '2013-01-01 09:03:01', null, '贵州省铜仁市思南县', '思南县', ',2482,2530,', '2530');
INSERT INTO `area` VALUES ('2537', '2013-01-01 09:03:02', '2013-01-01 09:03:02', null, '贵州省铜仁市印江土家族苗族自治县', '印江土家族苗族自治县', ',2482,2530,', '2530');
INSERT INTO `area` VALUES ('2538', '2013-01-01 09:03:02', '2013-01-01 09:03:02', null, '贵州省铜仁市德江县', '德江县', ',2482,2530,', '2530');
INSERT INTO `area` VALUES ('2539', '2013-01-01 09:03:02', '2013-01-01 09:03:02', null, '贵州省铜仁市沿河土家族自治县', '沿河土家族自治县', ',2482,2530,', '2530');
INSERT INTO `area` VALUES ('2540', '2013-01-01 09:03:02', '2013-01-01 09:03:02', null, '贵州省铜仁市松桃苗族自治县', '松桃苗族自治县', ',2482,2530,', '2530');
INSERT INTO `area` VALUES ('2541', '2013-01-01 09:03:02', '2013-01-01 09:03:02', null, '贵州省黔西南布依族苗族自治州', '黔西南布依族苗族自治州', ',2482,', '2482');
INSERT INTO `area` VALUES ('2542', '2013-01-01 09:03:02', '2013-01-01 09:03:02', null, '贵州省黔西南布依族苗族自治州兴义市', '兴义市', ',2482,2541,', '2541');
INSERT INTO `area` VALUES ('2543', '2013-01-01 09:03:02', '2013-01-01 09:03:02', null, '贵州省黔西南布依族苗族自治州兴仁县', '兴仁县', ',2482,2541,', '2541');
INSERT INTO `area` VALUES ('2544', '2013-01-01 09:03:02', '2013-01-01 09:03:02', null, '贵州省黔西南布依族苗族自治州普安县', '普安县', ',2482,2541,', '2541');
INSERT INTO `area` VALUES ('2545', '2013-01-01 09:03:02', '2013-01-01 09:03:02', null, '贵州省黔西南布依族苗族自治州晴隆县', '晴隆县', ',2482,2541,', '2541');
INSERT INTO `area` VALUES ('2546', '2013-01-01 09:03:02', '2013-01-01 09:03:02', null, '贵州省黔西南布依族苗族自治州贞丰县', '贞丰县', ',2482,2541,', '2541');
INSERT INTO `area` VALUES ('2547', '2013-01-01 09:03:02', '2013-01-01 09:03:02', null, '贵州省黔西南布依族苗族自治州望谟县', '望谟县', ',2482,2541,', '2541');
INSERT INTO `area` VALUES ('2548', '2013-01-01 09:03:02', '2013-01-01 09:03:02', null, '贵州省黔西南布依族苗族自治州册亨县', '册亨县', ',2482,2541,', '2541');
INSERT INTO `area` VALUES ('2549', '2013-01-01 09:03:02', '2013-01-01 09:03:02', null, '贵州省黔西南布依族苗族自治州安龙县', '安龙县', ',2482,2541,', '2541');
INSERT INTO `area` VALUES ('2550', '2013-01-01 09:03:02', '2013-01-01 09:03:02', null, '贵州省黔东南苗族侗族自治州', '黔东南苗族侗族自治州', ',2482,', '2482');
INSERT INTO `area` VALUES ('2551', '2013-01-01 09:03:02', '2013-01-01 09:03:02', null, '贵州省黔东南苗族侗族自治州凯里市', '凯里市', ',2482,2550,', '2550');
INSERT INTO `area` VALUES ('2552', '2013-01-01 09:03:02', '2013-01-01 09:03:02', null, '贵州省黔东南苗族侗族自治州黄平县', '黄平县', ',2482,2550,', '2550');
INSERT INTO `area` VALUES ('2553', '2013-01-01 09:03:02', '2013-01-01 09:03:02', null, '贵州省黔东南苗族侗族自治州施秉县', '施秉县', ',2482,2550,', '2550');
INSERT INTO `area` VALUES ('2554', '2013-01-01 09:03:02', '2013-01-01 09:03:02', null, '贵州省黔东南苗族侗族自治州三穗县', '三穗县', ',2482,2550,', '2550');
INSERT INTO `area` VALUES ('2555', '2013-01-01 09:03:02', '2013-01-01 09:03:02', null, '贵州省黔东南苗族侗族自治州镇远县', '镇远县', ',2482,2550,', '2550');
INSERT INTO `area` VALUES ('2556', '2013-01-01 09:03:03', '2013-01-01 09:03:03', null, '贵州省黔东南苗族侗族自治州岑巩县', '岑巩县', ',2482,2550,', '2550');
INSERT INTO `area` VALUES ('2557', '2013-01-01 09:03:03', '2013-01-01 09:03:03', null, '贵州省黔东南苗族侗族自治州天柱县', '天柱县', ',2482,2550,', '2550');
INSERT INTO `area` VALUES ('2558', '2013-01-01 09:03:03', '2013-01-01 09:03:03', null, '贵州省黔东南苗族侗族自治州锦屏县', '锦屏县', ',2482,2550,', '2550');
INSERT INTO `area` VALUES ('2559', '2013-01-01 09:03:03', '2013-01-01 09:03:03', null, '贵州省黔东南苗族侗族自治州剑河县', '剑河县', ',2482,2550,', '2550');
INSERT INTO `area` VALUES ('2560', '2013-01-01 09:03:03', '2013-01-01 09:03:03', null, '贵州省黔东南苗族侗族自治州台江县', '台江县', ',2482,2550,', '2550');
INSERT INTO `area` VALUES ('2561', '2013-01-01 09:03:03', '2013-01-01 09:03:03', null, '贵州省黔东南苗族侗族自治州黎平县', '黎平县', ',2482,2550,', '2550');
INSERT INTO `area` VALUES ('2562', '2013-01-01 09:03:03', '2013-01-01 09:03:03', null, '贵州省黔东南苗族侗族自治州榕江县', '榕江县', ',2482,2550,', '2550');
INSERT INTO `area` VALUES ('2563', '2013-01-01 09:03:03', '2013-01-01 09:03:03', null, '贵州省黔东南苗族侗族自治州从江县', '从江县', ',2482,2550,', '2550');
INSERT INTO `area` VALUES ('2564', '2013-01-01 09:03:03', '2013-01-01 09:03:03', null, '贵州省黔东南苗族侗族自治州雷山县', '雷山县', ',2482,2550,', '2550');
INSERT INTO `area` VALUES ('2565', '2013-01-01 09:03:03', '2013-01-01 09:03:03', null, '贵州省黔东南苗族侗族自治州麻江县', '麻江县', ',2482,2550,', '2550');
INSERT INTO `area` VALUES ('2566', '2013-01-01 09:03:03', '2013-01-01 09:03:03', null, '贵州省黔东南苗族侗族自治州丹寨县', '丹寨县', ',2482,2550,', '2550');
INSERT INTO `area` VALUES ('2567', '2013-01-01 09:03:03', '2013-01-01 09:03:03', null, '贵州省黔南布依族苗族自治州', '黔南布依族苗族自治州', ',2482,', '2482');
INSERT INTO `area` VALUES ('2568', '2013-01-01 09:03:03', '2013-01-01 09:03:03', null, '贵州省黔南布依族苗族自治州都匀市', '都匀市', ',2482,2567,', '2567');
INSERT INTO `area` VALUES ('2569', '2013-01-01 09:03:03', '2013-01-01 09:03:03', null, '贵州省黔南布依族苗族自治州福泉市', '福泉市', ',2482,2567,', '2567');
INSERT INTO `area` VALUES ('2570', '2013-01-01 09:03:03', '2013-01-01 09:03:03', null, '贵州省黔南布依族苗族自治州荔波县', '荔波县', ',2482,2567,', '2567');
INSERT INTO `area` VALUES ('2571', '2013-01-01 09:03:03', '2013-01-01 09:03:03', null, '贵州省黔南布依族苗族自治州贵定县', '贵定县', ',2482,2567,', '2567');
INSERT INTO `area` VALUES ('2572', '2013-01-01 09:03:03', '2013-01-01 09:03:03', null, '贵州省黔南布依族苗族自治州瓮安县', '瓮安县', ',2482,2567,', '2567');
INSERT INTO `area` VALUES ('2573', '2013-01-01 09:03:03', '2013-01-01 09:03:03', null, '贵州省黔南布依族苗族自治州独山县', '独山县', ',2482,2567,', '2567');
INSERT INTO `area` VALUES ('2574', '2013-01-01 09:03:04', '2013-01-01 09:03:04', null, '贵州省黔南布依族苗族自治州平塘县', '平塘县', ',2482,2567,', '2567');
INSERT INTO `area` VALUES ('2575', '2013-01-01 09:03:04', '2013-01-01 09:03:04', null, '贵州省黔南布依族苗族自治州罗甸县', '罗甸县', ',2482,2567,', '2567');
INSERT INTO `area` VALUES ('2576', '2013-01-01 09:03:04', '2013-01-01 09:03:04', null, '贵州省黔南布依族苗族自治州长顺县', '长顺县', ',2482,2567,', '2567');
INSERT INTO `area` VALUES ('2577', '2013-01-01 09:03:04', '2013-01-01 09:03:04', null, '贵州省黔南布依族苗族自治州龙里县', '龙里县', ',2482,2567,', '2567');
INSERT INTO `area` VALUES ('2578', '2013-01-01 09:03:04', '2013-01-01 09:03:04', null, '贵州省黔南布依族苗族自治州惠水县', '惠水县', ',2482,2567,', '2567');
INSERT INTO `area` VALUES ('2579', '2013-01-01 09:03:04', '2013-01-01 09:03:04', null, '贵州省黔南布依族苗族自治州三都水族自治县', '三都水族自治县', ',2482,2567,', '2567');
INSERT INTO `area` VALUES ('2580', '2013-01-01 09:03:04', '2013-01-01 09:03:04', null, '云南省', '云南省', ',', null);
INSERT INTO `area` VALUES ('2581', '2013-01-01 09:03:04', '2013-01-01 09:03:04', null, '云南省昆明市', '昆明市', ',2580,', '2580');
INSERT INTO `area` VALUES ('2582', '2013-01-01 09:03:04', '2013-01-01 09:03:04', null, '云南省昆明市五华区', '五华区', ',2580,2581,', '2581');
INSERT INTO `area` VALUES ('2583', '2013-01-01 09:03:04', '2013-01-01 09:03:04', null, '云南省昆明市盘龙区', '盘龙区', ',2580,2581,', '2581');
INSERT INTO `area` VALUES ('2584', '2013-01-01 09:03:04', '2013-01-01 09:03:04', null, '云南省昆明市官渡区', '官渡区', ',2580,2581,', '2581');
INSERT INTO `area` VALUES ('2585', '2013-01-01 09:03:04', '2013-01-01 09:03:04', null, '云南省昆明市西山区', '西山区', ',2580,2581,', '2581');
INSERT INTO `area` VALUES ('2586', '2013-01-01 09:03:04', '2013-01-01 09:03:04', null, '云南省昆明市东川区', '东川区', ',2580,2581,', '2581');
INSERT INTO `area` VALUES ('2587', '2013-01-01 09:03:04', '2013-01-01 09:03:04', null, '云南省昆明市呈贡区', '呈贡区', ',2580,2581,', '2581');
INSERT INTO `area` VALUES ('2588', '2013-01-01 09:03:04', '2013-01-01 09:03:04', null, '云南省昆明市晋宁县', '晋宁县', ',2580,2581,', '2581');
INSERT INTO `area` VALUES ('2589', '2013-01-01 09:03:04', '2013-01-01 09:03:04', null, '云南省昆明市富民县', '富民县', ',2580,2581,', '2581');
INSERT INTO `area` VALUES ('2590', '2013-01-01 09:03:04', '2013-01-01 09:03:04', null, '云南省昆明市宜良县', '宜良县', ',2580,2581,', '2581');
INSERT INTO `area` VALUES ('2591', '2013-01-01 09:03:04', '2013-01-01 09:03:04', null, '云南省昆明市石林彝族自治县', '石林彝族自治县', ',2580,2581,', '2581');
INSERT INTO `area` VALUES ('2592', '2013-01-01 09:03:04', '2013-01-01 09:03:04', null, '云南省昆明市嵩明县', '嵩明县', ',2580,2581,', '2581');
INSERT INTO `area` VALUES ('2593', '2013-01-01 09:03:04', '2013-01-01 09:03:04', null, '云南省昆明市禄劝彝族苗族自治县', '禄劝彝族苗族自治县', ',2580,2581,', '2581');
INSERT INTO `area` VALUES ('2594', '2013-01-01 09:03:05', '2013-01-01 09:03:05', null, '云南省昆明市寻甸回族彝族自治县', '寻甸回族彝族自治县', ',2580,2581,', '2581');
INSERT INTO `area` VALUES ('2595', '2013-01-01 09:03:05', '2013-01-01 09:03:05', null, '云南省昆明市安宁市', '安宁市', ',2580,2581,', '2581');
INSERT INTO `area` VALUES ('2596', '2013-01-01 09:03:05', '2013-01-01 09:03:05', null, '云南省曲靖市', '曲靖市', ',2580,', '2580');
INSERT INTO `area` VALUES ('2597', '2013-01-01 09:03:05', '2013-01-01 09:03:05', null, '云南省曲靖市麒麟区', '麒麟区', ',2580,2596,', '2596');
INSERT INTO `area` VALUES ('2598', '2013-01-01 09:03:05', '2013-01-01 09:03:05', null, '云南省曲靖市马龙县', '马龙县', ',2580,2596,', '2596');
INSERT INTO `area` VALUES ('2599', '2013-01-01 09:03:05', '2013-01-01 09:03:05', null, '云南省曲靖市陆良县', '陆良县', ',2580,2596,', '2596');
INSERT INTO `area` VALUES ('2600', '2013-01-01 09:03:05', '2013-01-01 09:03:05', null, '云南省曲靖市师宗县', '师宗县', ',2580,2596,', '2596');
INSERT INTO `area` VALUES ('2601', '2013-01-01 09:03:05', '2013-01-01 09:03:05', null, '云南省曲靖市罗平县', '罗平县', ',2580,2596,', '2596');
INSERT INTO `area` VALUES ('2602', '2013-01-01 09:03:05', '2013-01-01 09:03:05', null, '云南省曲靖市富源县', '富源县', ',2580,2596,', '2596');
INSERT INTO `area` VALUES ('2603', '2013-01-01 09:03:05', '2013-01-01 09:03:05', null, '云南省曲靖市会泽县', '会泽县', ',2580,2596,', '2596');
INSERT INTO `area` VALUES ('2604', '2013-01-01 09:03:05', '2013-01-01 09:03:05', null, '云南省曲靖市沾益县', '沾益县', ',2580,2596,', '2596');
INSERT INTO `area` VALUES ('2605', '2013-01-01 09:03:05', '2013-01-01 09:03:05', null, '云南省曲靖市宣威市', '宣威市', ',2580,2596,', '2596');
INSERT INTO `area` VALUES ('2606', '2013-01-01 09:03:05', '2013-01-01 09:03:05', null, '云南省玉溪市', '玉溪市', ',2580,', '2580');
INSERT INTO `area` VALUES ('2607', '2013-01-01 09:03:05', '2013-01-01 09:03:05', null, '云南省玉溪市红塔区', '红塔区', ',2580,2606,', '2606');
INSERT INTO `area` VALUES ('2608', '2013-01-01 09:03:05', '2013-01-01 09:03:05', null, '云南省玉溪市江川县', '江川县', ',2580,2606,', '2606');
INSERT INTO `area` VALUES ('2609', '2013-01-01 09:03:05', '2013-01-01 09:03:05', null, '云南省玉溪市澄江县', '澄江县', ',2580,2606,', '2606');
INSERT INTO `area` VALUES ('2610', '2013-01-01 09:03:05', '2013-01-01 09:03:05', null, '云南省玉溪市通海县', '通海县', ',2580,2606,', '2606');
INSERT INTO `area` VALUES ('2611', '2013-01-01 09:03:05', '2013-01-01 09:03:05', null, '云南省玉溪市华宁县', '华宁县', ',2580,2606,', '2606');
INSERT INTO `area` VALUES ('2612', '2013-01-01 09:03:05', '2013-01-01 09:03:05', null, '云南省玉溪市易门县', '易门县', ',2580,2606,', '2606');
INSERT INTO `area` VALUES ('2613', '2013-01-01 09:03:06', '2013-01-01 09:03:06', null, '云南省玉溪市峨山彝族自治县', '峨山彝族自治县', ',2580,2606,', '2606');
INSERT INTO `area` VALUES ('2614', '2013-01-01 09:03:06', '2013-01-01 09:03:06', null, '云南省玉溪市新平彝族傣族自治县', '新平彝族傣族自治县', ',2580,2606,', '2606');
INSERT INTO `area` VALUES ('2615', '2013-01-01 09:03:06', '2013-01-01 09:03:06', null, '云南省玉溪市元江哈尼族彝族傣族自治县', '元江哈尼族彝族傣族自治县', ',2580,2606,', '2606');
INSERT INTO `area` VALUES ('2616', '2013-01-01 09:03:06', '2013-01-01 09:03:06', null, '云南省保山市', '保山市', ',2580,', '2580');
INSERT INTO `area` VALUES ('2617', '2013-01-01 09:03:06', '2013-01-01 09:03:06', null, '云南省保山市隆阳区', '隆阳区', ',2580,2616,', '2616');
INSERT INTO `area` VALUES ('2618', '2013-01-01 09:03:06', '2013-01-01 09:03:06', null, '云南省保山市施甸县', '施甸县', ',2580,2616,', '2616');
INSERT INTO `area` VALUES ('2619', '2013-01-01 09:03:06', '2013-01-01 09:03:06', null, '云南省保山市腾冲县', '腾冲县', ',2580,2616,', '2616');
INSERT INTO `area` VALUES ('2620', '2013-01-01 09:03:06', '2013-01-01 09:03:06', null, '云南省保山市龙陵县', '龙陵县', ',2580,2616,', '2616');
INSERT INTO `area` VALUES ('2621', '2013-01-01 09:03:06', '2013-01-01 09:03:06', null, '云南省保山市昌宁县', '昌宁县', ',2580,2616,', '2616');
INSERT INTO `area` VALUES ('2622', '2013-01-01 09:03:06', '2013-01-01 09:03:06', null, '云南省昭通市', '昭通市', ',2580,', '2580');
INSERT INTO `area` VALUES ('2623', '2013-01-01 09:03:06', '2013-01-01 09:03:06', null, '云南省昭通市昭阳区', '昭阳区', ',2580,2622,', '2622');
INSERT INTO `area` VALUES ('2624', '2013-01-01 09:03:06', '2013-01-01 09:03:06', null, '云南省昭通市鲁甸县', '鲁甸县', ',2580,2622,', '2622');
INSERT INTO `area` VALUES ('2625', '2013-01-01 09:03:06', '2013-01-01 09:03:06', null, '云南省昭通市巧家县', '巧家县', ',2580,2622,', '2622');
INSERT INTO `area` VALUES ('2626', '2013-01-01 09:03:06', '2013-01-01 09:03:06', null, '云南省昭通市盐津县', '盐津县', ',2580,2622,', '2622');
INSERT INTO `area` VALUES ('2627', '2013-01-01 09:03:06', '2013-01-01 09:03:06', null, '云南省昭通市大关县', '大关县', ',2580,2622,', '2622');
INSERT INTO `area` VALUES ('2628', '2013-01-01 09:03:06', '2013-01-01 09:03:06', null, '云南省昭通市永善县', '永善县', ',2580,2622,', '2622');
INSERT INTO `area` VALUES ('2629', '2013-01-01 09:03:06', '2013-01-01 09:03:06', null, '云南省昭通市绥江县', '绥江县', ',2580,2622,', '2622');
INSERT INTO `area` VALUES ('2630', '2013-01-01 09:03:06', '2013-01-01 09:03:06', null, '云南省昭通市镇雄县', '镇雄县', ',2580,2622,', '2622');
INSERT INTO `area` VALUES ('2631', '2013-01-01 09:03:06', '2013-01-01 09:03:06', null, '云南省昭通市彝良县', '彝良县', ',2580,2622,', '2622');
INSERT INTO `area` VALUES ('2632', '2013-01-01 09:03:07', '2013-01-01 09:03:07', null, '云南省昭通市威信县', '威信县', ',2580,2622,', '2622');
INSERT INTO `area` VALUES ('2633', '2013-01-01 09:03:07', '2013-01-01 09:03:07', null, '云南省昭通市水富县', '水富县', ',2580,2622,', '2622');
INSERT INTO `area` VALUES ('2634', '2013-01-01 09:03:07', '2013-01-01 09:03:07', null, '云南省丽江市', '丽江市', ',2580,', '2580');
INSERT INTO `area` VALUES ('2635', '2013-01-01 09:03:07', '2013-01-01 09:03:07', null, '云南省丽江市古城区', '古城区', ',2580,2634,', '2634');
INSERT INTO `area` VALUES ('2636', '2013-01-01 09:03:07', '2013-01-01 09:03:07', null, '云南省丽江市玉龙纳西族自治县', '玉龙纳西族自治县', ',2580,2634,', '2634');
INSERT INTO `area` VALUES ('2637', '2013-01-01 09:03:07', '2013-01-01 09:03:07', null, '云南省丽江市永胜县', '永胜县', ',2580,2634,', '2634');
INSERT INTO `area` VALUES ('2638', '2013-01-01 09:03:07', '2013-01-01 09:03:07', null, '云南省丽江市华坪县', '华坪县', ',2580,2634,', '2634');
INSERT INTO `area` VALUES ('2639', '2013-01-01 09:03:07', '2013-01-01 09:03:07', null, '云南省丽江市宁蒗彝族自治县', '宁蒗彝族自治县', ',2580,2634,', '2634');
INSERT INTO `area` VALUES ('2640', '2013-01-01 09:03:07', '2013-01-01 09:03:07', null, '云南省普洱市', '普洱市', ',2580,', '2580');
INSERT INTO `area` VALUES ('2641', '2013-01-01 09:03:07', '2013-01-01 09:03:07', null, '云南省普洱市思茅区', '思茅区', ',2580,2640,', '2640');
INSERT INTO `area` VALUES ('2642', '2013-01-01 09:03:07', '2013-01-01 09:03:07', null, '云南省普洱市宁洱哈尼族彝族自治县', '宁洱哈尼族彝族自治县', ',2580,2640,', '2640');
INSERT INTO `area` VALUES ('2643', '2013-01-01 09:03:07', '2013-01-01 09:03:07', null, '云南省普洱市墨江哈尼族自治县', '墨江哈尼族自治县', ',2580,2640,', '2640');
INSERT INTO `area` VALUES ('2644', '2013-01-01 09:03:07', '2013-01-01 09:03:07', null, '云南省普洱市景东彝族自治县', '景东彝族自治县', ',2580,2640,', '2640');
INSERT INTO `area` VALUES ('2645', '2013-01-01 09:03:07', '2013-01-01 09:03:07', null, '云南省普洱市景谷傣族彝族自治县', '景谷傣族彝族自治县', ',2580,2640,', '2640');
INSERT INTO `area` VALUES ('2646', '2013-01-01 09:03:07', '2013-01-01 09:03:07', null, '云南省普洱市镇沅彝族哈尼族拉祜族自治县', '镇沅彝族哈尼族拉祜族自治县', ',2580,2640,', '2640');
INSERT INTO `area` VALUES ('2647', '2013-01-01 09:03:07', '2013-01-01 09:03:07', null, '云南省普洱市江城哈尼族彝族自治县', '江城哈尼族彝族自治县', ',2580,2640,', '2640');
INSERT INTO `area` VALUES ('2648', '2013-01-01 09:03:07', '2013-01-01 09:03:07', null, '云南省普洱市孟连傣族拉祜族佤族自治县', '孟连傣族拉祜族佤族自治县', ',2580,2640,', '2640');
INSERT INTO `area` VALUES ('2649', '2013-01-01 09:03:07', '2013-01-01 09:03:07', null, '云南省普洱市澜沧拉祜族自治县', '澜沧拉祜族自治县', ',2580,2640,', '2640');
INSERT INTO `area` VALUES ('2650', '2013-01-01 09:03:07', '2013-01-01 09:03:07', null, '云南省普洱市西盟佤族自治县', '西盟佤族自治县', ',2580,2640,', '2640');
INSERT INTO `area` VALUES ('2651', '2013-01-01 09:03:08', '2013-01-01 09:03:08', null, '云南省临沧市', '临沧市', ',2580,', '2580');
INSERT INTO `area` VALUES ('2652', '2013-01-01 09:03:08', '2013-01-01 09:03:08', null, '云南省临沧市临翔区', '临翔区', ',2580,2651,', '2651');
INSERT INTO `area` VALUES ('2653', '2013-01-01 09:03:08', '2013-01-01 09:03:08', null, '云南省临沧市凤庆县', '凤庆县', ',2580,2651,', '2651');
INSERT INTO `area` VALUES ('2654', '2013-01-01 09:03:08', '2013-01-01 09:03:08', null, '云南省临沧市云县', '云县', ',2580,2651,', '2651');
INSERT INTO `area` VALUES ('2655', '2013-01-01 09:03:08', '2013-01-01 09:03:08', null, '云南省临沧市永德县', '永德县', ',2580,2651,', '2651');
INSERT INTO `area` VALUES ('2656', '2013-01-01 09:03:08', '2013-01-01 09:03:08', null, '云南省临沧市镇康县', '镇康县', ',2580,2651,', '2651');
INSERT INTO `area` VALUES ('2657', '2013-01-01 09:03:08', '2013-01-01 09:03:08', null, '云南省临沧市双江拉祜族佤族布朗族傣族自治县', '双江拉祜族佤族布朗族傣族自治县', ',2580,2651,', '2651');
INSERT INTO `area` VALUES ('2658', '2013-01-01 09:03:08', '2013-01-01 09:03:08', null, '云南省临沧市耿马傣族佤族自治县', '耿马傣族佤族自治县', ',2580,2651,', '2651');
INSERT INTO `area` VALUES ('2659', '2013-01-01 09:03:08', '2013-01-01 09:03:08', null, '云南省临沧市沧源佤族自治县', '沧源佤族自治县', ',2580,2651,', '2651');
INSERT INTO `area` VALUES ('2660', '2013-01-01 09:03:08', '2013-01-01 09:03:08', null, '云南省楚雄彝族自治州', '楚雄彝族自治州', ',2580,', '2580');
INSERT INTO `area` VALUES ('2661', '2013-01-01 09:03:08', '2013-01-01 09:03:08', null, '云南省楚雄彝族自治州楚雄市', '楚雄市', ',2580,2660,', '2660');
INSERT INTO `area` VALUES ('2662', '2013-01-01 09:03:08', '2013-01-01 09:03:08', null, '云南省楚雄彝族自治州双柏县', '双柏县', ',2580,2660,', '2660');
INSERT INTO `area` VALUES ('2663', '2013-01-01 09:03:08', '2013-01-01 09:03:08', null, '云南省楚雄彝族自治州牟定县', '牟定县', ',2580,2660,', '2660');
INSERT INTO `area` VALUES ('2664', '2013-01-01 09:03:08', '2013-01-01 09:03:08', null, '云南省楚雄彝族自治州南华县', '南华县', ',2580,2660,', '2660');
INSERT INTO `area` VALUES ('2665', '2013-01-01 09:03:08', '2013-01-01 09:03:08', null, '云南省楚雄彝族自治州姚安县', '姚安县', ',2580,2660,', '2660');
INSERT INTO `area` VALUES ('2666', '2013-01-01 09:03:08', '2013-01-01 09:03:08', null, '云南省楚雄彝族自治州大姚县', '大姚县', ',2580,2660,', '2660');
INSERT INTO `area` VALUES ('2667', '2013-01-01 09:03:08', '2013-01-01 09:03:08', null, '云南省楚雄彝族自治州永仁县', '永仁县', ',2580,2660,', '2660');
INSERT INTO `area` VALUES ('2668', '2013-01-01 09:03:08', '2013-01-01 09:03:08', null, '云南省楚雄彝族自治州元谋县', '元谋县', ',2580,2660,', '2660');
INSERT INTO `area` VALUES ('2669', '2013-01-01 09:03:08', '2013-01-01 09:03:08', null, '云南省楚雄彝族自治州武定县', '武定县', ',2580,2660,', '2660');
INSERT INTO `area` VALUES ('2670', '2013-01-01 09:03:09', '2013-01-01 09:03:09', null, '云南省楚雄彝族自治州禄丰县', '禄丰县', ',2580,2660,', '2660');
INSERT INTO `area` VALUES ('2671', '2013-01-01 09:03:09', '2013-01-01 09:03:09', null, '云南省红河哈尼族彝族自治州', '红河哈尼族彝族自治州', ',2580,', '2580');
INSERT INTO `area` VALUES ('2672', '2013-01-01 09:03:09', '2013-01-01 09:03:09', null, '云南省红河哈尼族彝族自治州个旧市', '个旧市', ',2580,2671,', '2671');
INSERT INTO `area` VALUES ('2673', '2013-01-01 09:03:09', '2013-01-01 09:03:09', null, '云南省红河哈尼族彝族自治州开远市', '开远市', ',2580,2671,', '2671');
INSERT INTO `area` VALUES ('2674', '2013-01-01 09:03:09', '2013-01-01 09:03:09', null, '云南省红河哈尼族彝族自治州蒙自市', '蒙自市', ',2580,2671,', '2671');
INSERT INTO `area` VALUES ('2675', '2013-01-01 09:03:09', '2013-01-01 09:03:09', null, '云南省红河哈尼族彝族自治州屏边苗族自治县', '屏边苗族自治县', ',2580,2671,', '2671');
INSERT INTO `area` VALUES ('2676', '2013-01-01 09:03:09', '2013-01-01 09:03:09', null, '云南省红河哈尼族彝族自治州建水县', '建水县', ',2580,2671,', '2671');
INSERT INTO `area` VALUES ('2677', '2013-01-01 09:03:09', '2013-01-01 09:03:09', null, '云南省红河哈尼族彝族自治州石屏县', '石屏县', ',2580,2671,', '2671');
INSERT INTO `area` VALUES ('2678', '2013-01-01 09:03:09', '2013-01-01 09:03:09', null, '云南省红河哈尼族彝族自治州弥勒县', '弥勒县', ',2580,2671,', '2671');
INSERT INTO `area` VALUES ('2679', '2013-01-01 09:03:09', '2013-01-01 09:03:09', null, '云南省红河哈尼族彝族自治州泸西县', '泸西县', ',2580,2671,', '2671');
INSERT INTO `area` VALUES ('2680', '2013-01-01 09:03:09', '2013-01-01 09:03:09', null, '云南省红河哈尼族彝族自治州元阳县', '元阳县', ',2580,2671,', '2671');
INSERT INTO `area` VALUES ('2681', '2013-01-01 09:03:09', '2013-01-01 09:03:09', null, '云南省红河哈尼族彝族自治州红河县', '红河县', ',2580,2671,', '2671');
INSERT INTO `area` VALUES ('2682', '2013-01-01 09:03:09', '2013-01-01 09:03:09', null, '云南省红河哈尼族彝族自治州金平苗族瑶族傣族自治县', '金平苗族瑶族傣族自治县', ',2580,2671,', '2671');
INSERT INTO `area` VALUES ('2683', '2013-01-01 09:03:09', '2013-01-01 09:03:09', null, '云南省红河哈尼族彝族自治州绿春县', '绿春县', ',2580,2671,', '2671');
INSERT INTO `area` VALUES ('2684', '2013-01-01 09:03:09', '2013-01-01 09:03:09', null, '云南省红河哈尼族彝族自治州河口瑶族自治县', '河口瑶族自治县', ',2580,2671,', '2671');
INSERT INTO `area` VALUES ('2685', '2013-01-01 09:03:09', '2013-01-01 09:03:09', null, '云南省文山壮族苗族自治州', '文山壮族苗族自治州', ',2580,', '2580');
INSERT INTO `area` VALUES ('2686', '2013-01-01 09:03:09', '2013-01-01 09:03:09', null, '云南省文山壮族苗族自治州文山市', '文山市', ',2580,2685,', '2685');
INSERT INTO `area` VALUES ('2687', '2013-01-01 09:03:10', '2013-01-01 09:03:10', null, '云南省文山壮族苗族自治州砚山县', '砚山县', ',2580,2685,', '2685');
INSERT INTO `area` VALUES ('2688', '2013-01-01 09:03:10', '2013-01-01 09:03:10', null, '云南省文山壮族苗族自治州西畴县', '西畴县', ',2580,2685,', '2685');
INSERT INTO `area` VALUES ('2689', '2013-01-01 09:03:10', '2013-01-01 09:03:10', null, '云南省文山壮族苗族自治州麻栗坡县', '麻栗坡县', ',2580,2685,', '2685');
INSERT INTO `area` VALUES ('2690', '2013-01-01 09:03:10', '2013-01-01 09:03:10', null, '云南省文山壮族苗族自治州马关县', '马关县', ',2580,2685,', '2685');
INSERT INTO `area` VALUES ('2691', '2013-01-01 09:03:10', '2013-01-01 09:03:10', null, '云南省文山壮族苗族自治州丘北县', '丘北县', ',2580,2685,', '2685');
INSERT INTO `area` VALUES ('2692', '2013-01-01 09:03:10', '2013-01-01 09:03:10', null, '云南省文山壮族苗族自治州广南县', '广南县', ',2580,2685,', '2685');
INSERT INTO `area` VALUES ('2693', '2013-01-01 09:03:10', '2013-01-01 09:03:10', null, '云南省文山壮族苗族自治州富宁县', '富宁县', ',2580,2685,', '2685');
INSERT INTO `area` VALUES ('2694', '2013-01-01 09:03:10', '2013-01-01 09:03:10', null, '云南省西双版纳傣族自治州', '西双版纳傣族自治州', ',2580,', '2580');
INSERT INTO `area` VALUES ('2695', '2013-01-01 09:03:10', '2013-01-01 09:03:10', null, '云南省西双版纳傣族自治州景洪市', '景洪市', ',2580,2694,', '2694');
INSERT INTO `area` VALUES ('2696', '2013-01-01 09:03:10', '2013-01-01 09:03:10', null, '云南省西双版纳傣族自治州勐海县', '勐海县', ',2580,2694,', '2694');
INSERT INTO `area` VALUES ('2697', '2013-01-01 09:03:10', '2013-01-01 09:03:10', null, '云南省西双版纳傣族自治州勐腊县', '勐腊县', ',2580,2694,', '2694');
INSERT INTO `area` VALUES ('2698', '2013-01-01 09:03:10', '2013-01-01 09:03:10', null, '云南省大理白族自治州', '大理白族自治州', ',2580,', '2580');
INSERT INTO `area` VALUES ('2699', '2013-01-01 09:03:10', '2013-01-01 09:03:10', null, '云南省大理白族自治州大理市', '大理市', ',2580,2698,', '2698');
INSERT INTO `area` VALUES ('2700', '2013-01-01 09:03:10', '2013-01-01 09:03:10', null, '云南省大理白族自治州漾濞彝族自治县', '漾濞彝族自治县', ',2580,2698,', '2698');
INSERT INTO `area` VALUES ('2701', '2013-01-01 09:03:10', '2013-01-01 09:03:10', null, '云南省大理白族自治州祥云县', '祥云县', ',2580,2698,', '2698');
INSERT INTO `area` VALUES ('2702', '2013-01-01 09:03:10', '2013-01-01 09:03:10', null, '云南省大理白族自治州宾川县', '宾川县', ',2580,2698,', '2698');
INSERT INTO `area` VALUES ('2703', '2013-01-01 09:03:10', '2013-01-01 09:03:10', null, '云南省大理白族自治州弥渡县', '弥渡县', ',2580,2698,', '2698');
INSERT INTO `area` VALUES ('2704', '2013-01-01 09:03:10', '2013-01-01 09:03:10', null, '云南省大理白族自治州南涧彝族自治县', '南涧彝族自治县', ',2580,2698,', '2698');
INSERT INTO `area` VALUES ('2705', '2013-01-01 09:03:11', '2013-01-01 09:03:11', null, '云南省大理白族自治州巍山彝族回族自治县', '巍山彝族回族自治县', ',2580,2698,', '2698');
INSERT INTO `area` VALUES ('2706', '2013-01-01 09:03:11', '2013-01-01 09:03:11', null, '云南省大理白族自治州永平县', '永平县', ',2580,2698,', '2698');
INSERT INTO `area` VALUES ('2707', '2013-01-01 09:03:11', '2013-01-01 09:03:11', null, '云南省大理白族自治州云龙县', '云龙县', ',2580,2698,', '2698');
INSERT INTO `area` VALUES ('2708', '2013-01-01 09:03:11', '2013-01-01 09:03:11', null, '云南省大理白族自治州洱源县', '洱源县', ',2580,2698,', '2698');
INSERT INTO `area` VALUES ('2709', '2013-01-01 09:03:11', '2013-01-01 09:03:11', null, '云南省大理白族自治州剑川县', '剑川县', ',2580,2698,', '2698');
INSERT INTO `area` VALUES ('2710', '2013-01-01 09:03:11', '2013-01-01 09:03:11', null, '云南省大理白族自治州鹤庆县', '鹤庆县', ',2580,2698,', '2698');
INSERT INTO `area` VALUES ('2711', '2013-01-01 09:03:11', '2013-01-01 09:03:11', null, '云南省德宏傣族景颇族自治州', '德宏傣族景颇族自治州', ',2580,', '2580');
INSERT INTO `area` VALUES ('2712', '2013-01-01 09:03:11', '2013-01-01 09:03:11', null, '云南省德宏傣族景颇族自治州瑞丽市', '瑞丽市', ',2580,2711,', '2711');
INSERT INTO `area` VALUES ('2713', '2013-01-01 09:03:11', '2013-01-01 09:03:11', null, '云南省德宏傣族景颇族自治州芒市', '芒市', ',2580,2711,', '2711');
INSERT INTO `area` VALUES ('2714', '2013-01-01 09:03:11', '2013-01-01 09:03:11', null, '云南省德宏傣族景颇族自治州梁河县', '梁河县', ',2580,2711,', '2711');
INSERT INTO `area` VALUES ('2715', '2013-01-01 09:03:11', '2013-01-01 09:03:11', null, '云南省德宏傣族景颇族自治州盈江县', '盈江县', ',2580,2711,', '2711');
INSERT INTO `area` VALUES ('2716', '2013-01-01 09:03:11', '2013-01-01 09:03:11', null, '云南省德宏傣族景颇族自治州陇川县', '陇川县', ',2580,2711,', '2711');
INSERT INTO `area` VALUES ('2717', '2013-01-01 09:03:11', '2013-01-01 09:03:11', null, '云南省怒江傈僳族自治州', '怒江傈僳族自治州', ',2580,', '2580');
INSERT INTO `area` VALUES ('2718', '2013-01-01 09:03:11', '2013-01-01 09:03:11', null, '云南省怒江傈僳族自治州泸水县', '泸水县', ',2580,2717,', '2717');
INSERT INTO `area` VALUES ('2719', '2013-01-01 09:03:11', '2013-01-01 09:03:11', null, '云南省怒江傈僳族自治州福贡县', '福贡县', ',2580,2717,', '2717');
INSERT INTO `area` VALUES ('2720', '2013-01-01 09:03:11', '2013-01-01 09:03:11', null, '云南省怒江傈僳族自治州贡山独龙族怒族自治县', '贡山独龙族怒族自治县', ',2580,2717,', '2717');
INSERT INTO `area` VALUES ('2721', '2013-01-01 09:03:11', '2013-01-01 09:03:11', null, '云南省怒江傈僳族自治州兰坪白族普米族自治县', '兰坪白族普米族自治县', ',2580,2717,', '2717');
INSERT INTO `area` VALUES ('2722', '2013-01-01 09:03:11', '2013-01-01 09:03:11', null, '云南省迪庆藏族自治州', '迪庆藏族自治州', ',2580,', '2580');
INSERT INTO `area` VALUES ('2723', '2013-01-01 09:03:11', '2013-01-01 09:03:11', null, '云南省迪庆藏族自治州香格里拉县', '香格里拉县', ',2580,2722,', '2722');
INSERT INTO `area` VALUES ('2724', '2013-01-01 09:03:11', '2013-01-01 09:03:11', null, '云南省迪庆藏族自治州德钦县', '德钦县', ',2580,2722,', '2722');
INSERT INTO `area` VALUES ('2725', '2013-01-01 09:03:12', '2013-01-01 09:03:12', null, '云南省迪庆藏族自治州维西傈僳族自治县', '维西傈僳族自治县', ',2580,2722,', '2722');
INSERT INTO `area` VALUES ('2726', '2013-01-01 09:03:12', '2013-01-01 09:03:12', null, '西藏自治区', '西藏自治区', ',', null);
INSERT INTO `area` VALUES ('2727', '2013-01-01 09:03:12', '2013-01-01 09:03:12', null, '西藏自治区拉萨市', '拉萨市', ',2726,', '2726');
INSERT INTO `area` VALUES ('2728', '2013-01-01 09:03:12', '2013-01-01 09:03:12', null, '西藏自治区拉萨市城关区', '城关区', ',2726,2727,', '2727');
INSERT INTO `area` VALUES ('2729', '2013-01-01 09:03:12', '2013-01-01 09:03:12', null, '西藏自治区拉萨市林周县', '林周县', ',2726,2727,', '2727');
INSERT INTO `area` VALUES ('2730', '2013-01-01 09:03:12', '2013-01-01 09:03:12', null, '西藏自治区拉萨市当雄县', '当雄县', ',2726,2727,', '2727');
INSERT INTO `area` VALUES ('2731', '2013-01-01 09:03:12', '2013-01-01 09:03:12', null, '西藏自治区拉萨市尼木县', '尼木县', ',2726,2727,', '2727');
INSERT INTO `area` VALUES ('2732', '2013-01-01 09:03:12', '2013-01-01 09:03:12', null, '西藏自治区拉萨市曲水县', '曲水县', ',2726,2727,', '2727');
INSERT INTO `area` VALUES ('2733', '2013-01-01 09:03:12', '2013-01-01 09:03:12', null, '西藏自治区拉萨市堆龙德庆县', '堆龙德庆县', ',2726,2727,', '2727');
INSERT INTO `area` VALUES ('2734', '2013-01-01 09:03:12', '2013-01-01 09:03:12', null, '西藏自治区拉萨市达孜县', '达孜县', ',2726,2727,', '2727');
INSERT INTO `area` VALUES ('2735', '2013-01-01 09:03:12', '2013-01-01 09:03:12', null, '西藏自治区拉萨市墨竹工卡县', '墨竹工卡县', ',2726,2727,', '2727');
INSERT INTO `area` VALUES ('2736', '2013-01-01 09:03:12', '2013-01-01 09:03:12', null, '西藏自治区昌都地区', '昌都地区', ',2726,', '2726');
INSERT INTO `area` VALUES ('2737', '2013-01-01 09:03:12', '2013-01-01 09:03:12', null, '西藏自治区昌都地区昌都县', '昌都县', ',2726,2736,', '2736');
INSERT INTO `area` VALUES ('2738', '2013-01-01 09:03:12', '2013-01-01 09:03:12', null, '西藏自治区昌都地区江达县', '江达县', ',2726,2736,', '2736');
INSERT INTO `area` VALUES ('2739', '2013-01-01 09:03:12', '2013-01-01 09:03:12', null, '西藏自治区昌都地区贡觉县', '贡觉县', ',2726,2736,', '2736');
INSERT INTO `area` VALUES ('2740', '2013-01-01 09:03:12', '2013-01-01 09:03:12', null, '西藏自治区昌都地区类乌齐县', '类乌齐县', ',2726,2736,', '2736');
INSERT INTO `area` VALUES ('2741', '2013-01-01 09:03:12', '2013-01-01 09:03:12', null, '西藏自治区昌都地区丁青县', '丁青县', ',2726,2736,', '2736');
INSERT INTO `area` VALUES ('2742', '2013-01-01 09:03:12', '2013-01-01 09:03:12', null, '西藏自治区昌都地区察雅县', '察雅县', ',2726,2736,', '2736');
INSERT INTO `area` VALUES ('2743', '2013-01-01 09:03:12', '2013-01-01 09:03:12', null, '西藏自治区昌都地区八宿县', '八宿县', ',2726,2736,', '2736');
INSERT INTO `area` VALUES ('2744', '2013-01-01 09:03:13', '2013-01-01 09:03:13', null, '西藏自治区昌都地区左贡县', '左贡县', ',2726,2736,', '2736');
INSERT INTO `area` VALUES ('2745', '2013-01-01 09:03:13', '2013-01-01 09:03:13', null, '西藏自治区昌都地区芒康县', '芒康县', ',2726,2736,', '2736');
INSERT INTO `area` VALUES ('2746', '2013-01-01 09:03:13', '2013-01-01 09:03:13', null, '西藏自治区昌都地区洛隆县', '洛隆县', ',2726,2736,', '2736');
INSERT INTO `area` VALUES ('2747', '2013-01-01 09:03:13', '2013-01-01 09:03:13', null, '西藏自治区昌都地区边坝县', '边坝县', ',2726,2736,', '2736');
INSERT INTO `area` VALUES ('2748', '2013-01-01 09:03:13', '2013-01-01 09:03:13', null, '西藏自治区山南地区', '山南地区', ',2726,', '2726');
INSERT INTO `area` VALUES ('2749', '2013-01-01 09:03:13', '2013-01-01 09:03:13', null, '西藏自治区山南地区乃东县', '乃东县', ',2726,2748,', '2748');
INSERT INTO `area` VALUES ('2750', '2013-01-01 09:03:13', '2013-01-01 09:03:13', null, '西藏自治区山南地区扎囊县', '扎囊县', ',2726,2748,', '2748');
INSERT INTO `area` VALUES ('2751', '2013-01-01 09:03:13', '2013-01-01 09:03:13', null, '西藏自治区山南地区贡嘎县', '贡嘎县', ',2726,2748,', '2748');
INSERT INTO `area` VALUES ('2752', '2013-01-01 09:03:13', '2013-01-01 09:03:13', null, '西藏自治区山南地区桑日县', '桑日县', ',2726,2748,', '2748');
INSERT INTO `area` VALUES ('2753', '2013-01-01 09:03:13', '2013-01-01 09:03:13', null, '西藏自治区山南地区琼结县', '琼结县', ',2726,2748,', '2748');
INSERT INTO `area` VALUES ('2754', '2013-01-01 09:03:13', '2013-01-01 09:03:13', null, '西藏自治区山南地区曲松县', '曲松县', ',2726,2748,', '2748');
INSERT INTO `area` VALUES ('2755', '2013-01-01 09:03:13', '2013-01-01 09:03:13', null, '西藏自治区山南地区措美县', '措美县', ',2726,2748,', '2748');
INSERT INTO `area` VALUES ('2756', '2013-01-01 09:03:13', '2013-01-01 09:03:13', null, '西藏自治区山南地区洛扎县', '洛扎县', ',2726,2748,', '2748');
INSERT INTO `area` VALUES ('2757', '2013-01-01 09:03:13', '2013-01-01 09:03:13', null, '西藏自治区山南地区加查县', '加查县', ',2726,2748,', '2748');
INSERT INTO `area` VALUES ('2758', '2013-01-01 09:03:13', '2013-01-01 09:03:13', null, '西藏自治区山南地区隆子县', '隆子县', ',2726,2748,', '2748');
INSERT INTO `area` VALUES ('2759', '2013-01-01 09:03:13', '2013-01-01 09:03:13', null, '西藏自治区山南地区错那县', '错那县', ',2726,2748,', '2748');
INSERT INTO `area` VALUES ('2760', '2013-01-01 09:03:13', '2013-01-01 09:03:13', null, '西藏自治区山南地区浪卡子县', '浪卡子县', ',2726,2748,', '2748');
INSERT INTO `area` VALUES ('2761', '2013-01-01 09:03:13', '2013-01-01 09:03:13', null, '西藏自治区日喀则地区', '日喀则地区', ',2726,', '2726');
INSERT INTO `area` VALUES ('2762', '2013-01-01 09:03:14', '2013-01-01 09:03:14', null, '西藏自治区日喀则地区日喀则市', '日喀则市', ',2726,2761,', '2761');
INSERT INTO `area` VALUES ('2763', '2013-01-01 09:03:14', '2013-01-01 09:03:14', null, '西藏自治区日喀则地区南木林县', '南木林县', ',2726,2761,', '2761');
INSERT INTO `area` VALUES ('2764', '2013-01-01 09:03:14', '2013-01-01 09:03:14', null, '西藏自治区日喀则地区江孜县', '江孜县', ',2726,2761,', '2761');
INSERT INTO `area` VALUES ('2765', '2013-01-01 09:03:14', '2013-01-01 09:03:14', null, '西藏自治区日喀则地区定日县', '定日县', ',2726,2761,', '2761');
INSERT INTO `area` VALUES ('2766', '2013-01-01 09:03:14', '2013-01-01 09:03:14', null, '西藏自治区日喀则地区萨迦县', '萨迦县', ',2726,2761,', '2761');
INSERT INTO `area` VALUES ('2767', '2013-01-01 09:03:14', '2013-01-01 09:03:14', null, '西藏自治区日喀则地区拉孜县', '拉孜县', ',2726,2761,', '2761');
INSERT INTO `area` VALUES ('2768', '2013-01-01 09:03:14', '2013-01-01 09:03:14', null, '西藏自治区日喀则地区昂仁县', '昂仁县', ',2726,2761,', '2761');
INSERT INTO `area` VALUES ('2769', '2013-01-01 09:03:14', '2013-01-01 09:03:14', null, '西藏自治区日喀则地区谢通门县', '谢通门县', ',2726,2761,', '2761');
INSERT INTO `area` VALUES ('2770', '2013-01-01 09:03:14', '2013-01-01 09:03:14', null, '西藏自治区日喀则地区白朗县', '白朗县', ',2726,2761,', '2761');
INSERT INTO `area` VALUES ('2771', '2013-01-01 09:03:14', '2013-01-01 09:03:14', null, '西藏自治区日喀则地区仁布县', '仁布县', ',2726,2761,', '2761');
INSERT INTO `area` VALUES ('2772', '2013-01-01 09:03:14', '2013-01-01 09:03:14', null, '西藏自治区日喀则地区康马县', '康马县', ',2726,2761,', '2761');
INSERT INTO `area` VALUES ('2773', '2013-01-01 09:03:14', '2013-01-01 09:03:14', null, '西藏自治区日喀则地区定结县', '定结县', ',2726,2761,', '2761');
INSERT INTO `area` VALUES ('2774', '2013-01-01 09:03:14', '2013-01-01 09:03:14', null, '西藏自治区日喀则地区仲巴县', '仲巴县', ',2726,2761,', '2761');
INSERT INTO `area` VALUES ('2775', '2013-01-01 09:03:14', '2013-01-01 09:03:14', null, '西藏自治区日喀则地区亚东县', '亚东县', ',2726,2761,', '2761');
INSERT INTO `area` VALUES ('2776', '2013-01-01 09:03:14', '2013-01-01 09:03:14', null, '西藏自治区日喀则地区吉隆县', '吉隆县', ',2726,2761,', '2761');
INSERT INTO `area` VALUES ('2777', '2013-01-01 09:03:14', '2013-01-01 09:03:14', null, '西藏自治区日喀则地区聂拉木县', '聂拉木县', ',2726,2761,', '2761');
INSERT INTO `area` VALUES ('2778', '2013-01-01 09:03:14', '2013-01-01 09:03:14', null, '西藏自治区日喀则地区萨嘎县', '萨嘎县', ',2726,2761,', '2761');
INSERT INTO `area` VALUES ('2779', '2013-01-01 09:03:14', '2013-01-01 09:03:14', null, '西藏自治区日喀则地区岗巴县', '岗巴县', ',2726,2761,', '2761');
INSERT INTO `area` VALUES ('2780', '2013-01-01 09:03:14', '2013-01-01 09:03:14', null, '西藏自治区那曲地区', '那曲地区', ',2726,', '2726');
INSERT INTO `area` VALUES ('2781', '2013-01-01 09:03:14', '2013-01-01 09:03:14', null, '西藏自治区那曲地区那曲县', '那曲县', ',2726,2780,', '2780');
INSERT INTO `area` VALUES ('2782', '2013-01-01 09:03:15', '2013-01-01 09:03:15', null, '西藏自治区那曲地区嘉黎县', '嘉黎县', ',2726,2780,', '2780');
INSERT INTO `area` VALUES ('2783', '2013-01-01 09:03:15', '2013-01-01 09:03:15', null, '西藏自治区那曲地区比如县', '比如县', ',2726,2780,', '2780');
INSERT INTO `area` VALUES ('2784', '2013-01-01 09:03:15', '2013-01-01 09:03:15', null, '西藏自治区那曲地区聂荣县', '聂荣县', ',2726,2780,', '2780');
INSERT INTO `area` VALUES ('2785', '2013-01-01 09:03:15', '2013-01-01 09:03:15', null, '西藏自治区那曲地区安多县', '安多县', ',2726,2780,', '2780');
INSERT INTO `area` VALUES ('2786', '2013-01-01 09:03:15', '2013-01-01 09:03:15', null, '西藏自治区那曲地区申扎县', '申扎县', ',2726,2780,', '2780');
INSERT INTO `area` VALUES ('2787', '2013-01-01 09:03:15', '2013-01-01 09:03:15', null, '西藏自治区那曲地区索县', '索县', ',2726,2780,', '2780');
INSERT INTO `area` VALUES ('2788', '2013-01-01 09:03:15', '2013-01-01 09:03:15', null, '西藏自治区那曲地区班戈县', '班戈县', ',2726,2780,', '2780');
INSERT INTO `area` VALUES ('2789', '2013-01-01 09:03:15', '2013-01-01 09:03:15', null, '西藏自治区那曲地区巴青县', '巴青县', ',2726,2780,', '2780');
INSERT INTO `area` VALUES ('2790', '2013-01-01 09:03:15', '2013-01-01 09:03:15', null, '西藏自治区那曲地区尼玛县', '尼玛县', ',2726,2780,', '2780');
INSERT INTO `area` VALUES ('2791', '2013-01-01 09:03:15', '2013-01-01 09:03:15', null, '西藏自治区阿里地区', '阿里地区', ',2726,', '2726');
INSERT INTO `area` VALUES ('2792', '2013-01-01 09:03:15', '2013-01-01 09:03:15', null, '西藏自治区阿里地区普兰县', '普兰县', ',2726,2791,', '2791');
INSERT INTO `area` VALUES ('2793', '2013-01-01 09:03:15', '2013-01-01 09:03:15', null, '西藏自治区阿里地区札达县', '札达县', ',2726,2791,', '2791');
INSERT INTO `area` VALUES ('2794', '2013-01-01 09:03:15', '2013-01-01 09:03:15', null, '西藏自治区阿里地区噶尔县', '噶尔县', ',2726,2791,', '2791');
INSERT INTO `area` VALUES ('2795', '2013-01-01 09:03:15', '2013-01-01 09:03:15', null, '西藏自治区阿里地区日土县', '日土县', ',2726,2791,', '2791');
INSERT INTO `area` VALUES ('2796', '2013-01-01 09:03:15', '2013-01-01 09:03:15', null, '西藏自治区阿里地区革吉县', '革吉县', ',2726,2791,', '2791');
INSERT INTO `area` VALUES ('2797', '2013-01-01 09:03:15', '2013-01-01 09:03:15', null, '西藏自治区阿里地区改则县', '改则县', ',2726,2791,', '2791');
INSERT INTO `area` VALUES ('2798', '2013-01-01 09:03:15', '2013-01-01 09:03:15', null, '西藏自治区阿里地区措勤县', '措勤县', ',2726,2791,', '2791');
INSERT INTO `area` VALUES ('2799', '2013-01-01 09:03:15', '2013-01-01 09:03:15', null, '西藏自治区林芝地区', '林芝地区', ',2726,', '2726');
INSERT INTO `area` VALUES ('2800', '2013-01-01 09:03:15', '2013-01-01 09:03:15', null, '西藏自治区林芝地区林芝县', '林芝县', ',2726,2799,', '2799');
INSERT INTO `area` VALUES ('2801', '2013-01-01 09:03:15', '2013-01-01 09:03:15', null, '西藏自治区林芝地区工布江达县', '工布江达县', ',2726,2799,', '2799');
INSERT INTO `area` VALUES ('2802', '2013-01-01 09:03:16', '2013-01-01 09:03:16', null, '西藏自治区林芝地区米林县', '米林县', ',2726,2799,', '2799');
INSERT INTO `area` VALUES ('2803', '2013-01-01 09:03:16', '2013-01-01 09:03:16', null, '西藏自治区林芝地区墨脱县', '墨脱县', ',2726,2799,', '2799');
INSERT INTO `area` VALUES ('2804', '2013-01-01 09:03:16', '2013-01-01 09:03:16', null, '西藏自治区林芝地区波密县', '波密县', ',2726,2799,', '2799');
INSERT INTO `area` VALUES ('2805', '2013-01-01 09:03:16', '2013-01-01 09:03:16', null, '西藏自治区林芝地区察隅县', '察隅县', ',2726,2799,', '2799');
INSERT INTO `area` VALUES ('2806', '2013-01-01 09:03:16', '2013-01-01 09:03:16', null, '西藏自治区林芝地区朗县', '朗县', ',2726,2799,', '2799');
INSERT INTO `area` VALUES ('2807', '2013-01-01 09:03:16', '2013-01-01 09:03:16', null, '陕西省', '陕西省', ',', null);
INSERT INTO `area` VALUES ('2808', '2013-01-01 09:03:16', '2013-01-01 09:03:16', null, '陕西省西安市', '西安市', ',2807,', '2807');
INSERT INTO `area` VALUES ('2809', '2013-01-01 09:03:16', '2013-01-01 09:03:16', null, '陕西省西安市新城区', '新城区', ',2807,2808,', '2808');
INSERT INTO `area` VALUES ('2810', '2013-01-01 09:03:16', '2013-01-01 09:03:16', null, '陕西省西安市碑林区', '碑林区', ',2807,2808,', '2808');
INSERT INTO `area` VALUES ('2811', '2013-01-01 09:03:16', '2013-01-01 09:03:16', null, '陕西省西安市莲湖区', '莲湖区', ',2807,2808,', '2808');
INSERT INTO `area` VALUES ('2812', '2013-01-01 09:03:16', '2013-01-01 09:03:16', null, '陕西省西安市灞桥区', '灞桥区', ',2807,2808,', '2808');
INSERT INTO `area` VALUES ('2813', '2013-01-01 09:03:16', '2013-01-01 09:03:16', null, '陕西省西安市未央区', '未央区', ',2807,2808,', '2808');
INSERT INTO `area` VALUES ('2814', '2013-01-01 09:03:16', '2013-01-01 09:03:16', null, '陕西省西安市雁塔区', '雁塔区', ',2807,2808,', '2808');
INSERT INTO `area` VALUES ('2815', '2013-01-01 09:03:16', '2013-01-01 09:03:16', null, '陕西省西安市阎良区', '阎良区', ',2807,2808,', '2808');
INSERT INTO `area` VALUES ('2816', '2013-01-01 09:03:16', '2013-01-01 09:03:16', null, '陕西省西安市临潼区', '临潼区', ',2807,2808,', '2808');
INSERT INTO `area` VALUES ('2817', '2013-01-01 09:03:16', '2013-01-01 09:03:16', null, '陕西省西安市长安区', '长安区', ',2807,2808,', '2808');
INSERT INTO `area` VALUES ('2818', '2013-01-01 09:03:16', '2013-01-01 09:03:16', null, '陕西省西安市蓝田县', '蓝田县', ',2807,2808,', '2808');
INSERT INTO `area` VALUES ('2819', '2013-01-01 09:03:16', '2013-01-01 09:03:16', null, '陕西省西安市周至县', '周至县', ',2807,2808,', '2808');
INSERT INTO `area` VALUES ('2820', '2013-01-01 09:03:16', '2013-01-01 09:03:16', null, '陕西省西安市户县', '户县', ',2807,2808,', '2808');
INSERT INTO `area` VALUES ('2821', '2013-01-01 09:03:16', '2013-01-01 09:03:16', null, '陕西省西安市高陵县', '高陵县', ',2807,2808,', '2808');
INSERT INTO `area` VALUES ('2822', '2013-01-01 09:03:17', '2013-01-01 09:03:17', null, '陕西省铜川市', '铜川市', ',2807,', '2807');
INSERT INTO `area` VALUES ('2823', '2013-01-01 09:03:17', '2013-01-01 09:03:17', null, '陕西省铜川市王益区', '王益区', ',2807,2822,', '2822');
INSERT INTO `area` VALUES ('2824', '2013-01-01 09:03:17', '2013-01-01 09:03:17', null, '陕西省铜川市印台区', '印台区', ',2807,2822,', '2822');
INSERT INTO `area` VALUES ('2825', '2013-01-01 09:03:17', '2013-01-01 09:03:17', null, '陕西省铜川市耀州区', '耀州区', ',2807,2822,', '2822');
INSERT INTO `area` VALUES ('2826', '2013-01-01 09:03:17', '2013-01-01 09:03:17', null, '陕西省铜川市宜君县', '宜君县', ',2807,2822,', '2822');
INSERT INTO `area` VALUES ('2827', '2013-01-01 09:03:17', '2013-01-01 09:03:17', null, '陕西省宝鸡市', '宝鸡市', ',2807,', '2807');
INSERT INTO `area` VALUES ('2828', '2013-01-01 09:03:17', '2013-01-01 09:03:17', null, '陕西省宝鸡市渭滨区', '渭滨区', ',2807,2827,', '2827');
INSERT INTO `area` VALUES ('2829', '2013-01-01 09:03:17', '2013-01-01 09:03:17', null, '陕西省宝鸡市金台区', '金台区', ',2807,2827,', '2827');
INSERT INTO `area` VALUES ('2830', '2013-01-01 09:03:17', '2013-01-01 09:03:17', null, '陕西省宝鸡市陈仓区', '陈仓区', ',2807,2827,', '2827');
INSERT INTO `area` VALUES ('2831', '2013-01-01 09:03:17', '2013-01-01 09:03:17', null, '陕西省宝鸡市凤翔县', '凤翔县', ',2807,2827,', '2827');
INSERT INTO `area` VALUES ('2832', '2013-01-01 09:03:17', '2013-01-01 09:03:17', null, '陕西省宝鸡市岐山县', '岐山县', ',2807,2827,', '2827');
INSERT INTO `area` VALUES ('2833', '2013-01-01 09:03:17', '2013-01-01 09:03:17', null, '陕西省宝鸡市扶风县', '扶风县', ',2807,2827,', '2827');
INSERT INTO `area` VALUES ('2834', '2013-01-01 09:03:17', '2013-01-01 09:03:17', null, '陕西省宝鸡市眉县', '眉县', ',2807,2827,', '2827');
INSERT INTO `area` VALUES ('2835', '2013-01-01 09:03:17', '2013-01-01 09:03:17', null, '陕西省宝鸡市陇县', '陇县', ',2807,2827,', '2827');
INSERT INTO `area` VALUES ('2836', '2013-01-01 09:03:17', '2013-01-01 09:03:17', null, '陕西省宝鸡市千阳县', '千阳县', ',2807,2827,', '2827');
INSERT INTO `area` VALUES ('2837', '2013-01-01 09:03:17', '2013-01-01 09:03:17', null, '陕西省宝鸡市麟游县', '麟游县', ',2807,2827,', '2827');
INSERT INTO `area` VALUES ('2838', '2013-01-01 09:03:17', '2013-01-01 09:03:17', null, '陕西省宝鸡市凤县', '凤县', ',2807,2827,', '2827');
INSERT INTO `area` VALUES ('2839', '2013-01-01 09:03:17', '2013-01-01 09:03:17', null, '陕西省宝鸡市太白县', '太白县', ',2807,2827,', '2827');
INSERT INTO `area` VALUES ('2840', '2013-01-01 09:03:18', '2013-01-01 09:03:18', null, '陕西省咸阳市', '咸阳市', ',2807,', '2807');
INSERT INTO `area` VALUES ('2841', '2013-01-01 09:03:18', '2013-01-01 09:03:18', null, '陕西省咸阳市秦都区', '秦都区', ',2807,2840,', '2840');
INSERT INTO `area` VALUES ('2842', '2013-01-01 09:03:18', '2013-01-01 09:03:18', null, '陕西省咸阳市杨陵区', '杨陵区', ',2807,2840,', '2840');
INSERT INTO `area` VALUES ('2843', '2013-01-01 09:03:18', '2013-01-01 09:03:18', null, '陕西省咸阳市渭城区', '渭城区', ',2807,2840,', '2840');
INSERT INTO `area` VALUES ('2844', '2013-01-01 09:03:18', '2013-01-01 09:03:18', null, '陕西省咸阳市三原县', '三原县', ',2807,2840,', '2840');
INSERT INTO `area` VALUES ('2845', '2013-01-01 09:03:18', '2013-01-01 09:03:18', null, '陕西省咸阳市泾阳县', '泾阳县', ',2807,2840,', '2840');
INSERT INTO `area` VALUES ('2846', '2013-01-01 09:03:18', '2013-01-01 09:03:18', null, '陕西省咸阳市乾县', '乾县', ',2807,2840,', '2840');
INSERT INTO `area` VALUES ('2847', '2013-01-01 09:03:18', '2013-01-01 09:03:18', null, '陕西省咸阳市礼泉县', '礼泉县', ',2807,2840,', '2840');
INSERT INTO `area` VALUES ('2848', '2013-01-01 09:03:18', '2013-01-01 09:03:18', null, '陕西省咸阳市永寿县', '永寿县', ',2807,2840,', '2840');
INSERT INTO `area` VALUES ('2849', '2013-01-01 09:03:18', '2013-01-01 09:03:18', null, '陕西省咸阳市彬县', '彬县', ',2807,2840,', '2840');
INSERT INTO `area` VALUES ('2850', '2013-01-01 09:03:18', '2013-01-01 09:03:18', null, '陕西省咸阳市长武县', '长武县', ',2807,2840,', '2840');
INSERT INTO `area` VALUES ('2851', '2013-01-01 09:03:18', '2013-01-01 09:03:18', null, '陕西省咸阳市旬邑县', '旬邑县', ',2807,2840,', '2840');
INSERT INTO `area` VALUES ('2852', '2013-01-01 09:03:18', '2013-01-01 09:03:18', null, '陕西省咸阳市淳化县', '淳化县', ',2807,2840,', '2840');
INSERT INTO `area` VALUES ('2853', '2013-01-01 09:03:18', '2013-01-01 09:03:18', null, '陕西省咸阳市武功县', '武功县', ',2807,2840,', '2840');
INSERT INTO `area` VALUES ('2854', '2013-01-01 09:03:18', '2013-01-01 09:03:18', null, '陕西省咸阳市兴平市', '兴平市', ',2807,2840,', '2840');
INSERT INTO `area` VALUES ('2855', '2013-01-01 09:03:18', '2013-01-01 09:03:18', null, '陕西省渭南市', '渭南市', ',2807,', '2807');
INSERT INTO `area` VALUES ('2856', '2013-01-01 09:03:18', '2013-01-01 09:03:18', null, '陕西省渭南市临渭区', '临渭区', ',2807,2855,', '2855');
INSERT INTO `area` VALUES ('2857', '2013-01-01 09:03:18', '2013-01-01 09:03:18', null, '陕西省渭南市华县', '华县', ',2807,2855,', '2855');
INSERT INTO `area` VALUES ('2858', '2013-01-01 09:03:19', '2013-01-01 09:03:19', null, '陕西省渭南市潼关县', '潼关县', ',2807,2855,', '2855');
INSERT INTO `area` VALUES ('2859', '2013-01-01 09:03:19', '2013-01-01 09:03:19', null, '陕西省渭南市大荔县', '大荔县', ',2807,2855,', '2855');
INSERT INTO `area` VALUES ('2860', '2013-01-01 09:03:19', '2013-01-01 09:03:19', null, '陕西省渭南市合阳县', '合阳县', ',2807,2855,', '2855');
INSERT INTO `area` VALUES ('2861', '2013-01-01 09:03:19', '2013-01-01 09:03:19', null, '陕西省渭南市澄城县', '澄城县', ',2807,2855,', '2855');
INSERT INTO `area` VALUES ('2862', '2013-01-01 09:03:19', '2013-01-01 09:03:19', null, '陕西省渭南市蒲城县', '蒲城县', ',2807,2855,', '2855');
INSERT INTO `area` VALUES ('2863', '2013-01-01 09:03:19', '2013-01-01 09:03:19', null, '陕西省渭南市白水县', '白水县', ',2807,2855,', '2855');
INSERT INTO `area` VALUES ('2864', '2013-01-01 09:03:19', '2013-01-01 09:03:19', null, '陕西省渭南市富平县', '富平县', ',2807,2855,', '2855');
INSERT INTO `area` VALUES ('2865', '2013-01-01 09:03:19', '2013-01-01 09:03:19', null, '陕西省渭南市韩城市', '韩城市', ',2807,2855,', '2855');
INSERT INTO `area` VALUES ('2866', '2013-01-01 09:03:19', '2013-01-01 09:03:19', null, '陕西省渭南市华阴市', '华阴市', ',2807,2855,', '2855');
INSERT INTO `area` VALUES ('2867', '2013-01-01 09:03:19', '2013-01-01 09:03:19', null, '陕西省延安市', '延安市', ',2807,', '2807');
INSERT INTO `area` VALUES ('2868', '2013-01-01 09:03:19', '2013-01-01 09:03:19', null, '陕西省延安市宝塔区', '宝塔区', ',2807,2867,', '2867');
INSERT INTO `area` VALUES ('2869', '2013-01-01 09:03:19', '2013-01-01 09:03:19', null, '陕西省延安市延长县', '延长县', ',2807,2867,', '2867');
INSERT INTO `area` VALUES ('2870', '2013-01-01 09:03:19', '2013-01-01 09:03:19', null, '陕西省延安市延川县', '延川县', ',2807,2867,', '2867');
INSERT INTO `area` VALUES ('2871', '2013-01-01 09:03:19', '2013-01-01 09:03:19', null, '陕西省延安市子长县', '子长县', ',2807,2867,', '2867');
INSERT INTO `area` VALUES ('2872', '2013-01-01 09:03:19', '2013-01-01 09:03:19', null, '陕西省延安市安塞县', '安塞县', ',2807,2867,', '2867');
INSERT INTO `area` VALUES ('2873', '2013-01-01 09:03:19', '2013-01-01 09:03:19', null, '陕西省延安市志丹县', '志丹县', ',2807,2867,', '2867');
INSERT INTO `area` VALUES ('2874', '2013-01-01 09:03:19', '2013-01-01 09:03:19', null, '陕西省延安市吴起县', '吴起县', ',2807,2867,', '2867');
INSERT INTO `area` VALUES ('2875', '2013-01-01 09:03:19', '2013-01-01 09:03:19', null, '陕西省延安市甘泉县', '甘泉县', ',2807,2867,', '2867');
INSERT INTO `area` VALUES ('2876', '2013-01-01 09:03:20', '2013-01-01 09:03:20', null, '陕西省延安市富县', '富县', ',2807,2867,', '2867');
INSERT INTO `area` VALUES ('2877', '2013-01-01 09:03:20', '2013-01-01 09:03:20', null, '陕西省延安市洛川县', '洛川县', ',2807,2867,', '2867');
INSERT INTO `area` VALUES ('2878', '2013-01-01 09:03:20', '2013-01-01 09:03:20', null, '陕西省延安市宜川县', '宜川县', ',2807,2867,', '2867');
INSERT INTO `area` VALUES ('2879', '2013-01-01 09:03:20', '2013-01-01 09:03:20', null, '陕西省延安市黄龙县', '黄龙县', ',2807,2867,', '2867');
INSERT INTO `area` VALUES ('2880', '2013-01-01 09:03:20', '2013-01-01 09:03:20', null, '陕西省延安市黄陵县', '黄陵县', ',2807,2867,', '2867');
INSERT INTO `area` VALUES ('2881', '2013-01-01 09:03:20', '2013-01-01 09:03:20', null, '陕西省汉中市', '汉中市', ',2807,', '2807');
INSERT INTO `area` VALUES ('2882', '2013-01-01 09:03:20', '2013-01-01 09:03:20', null, '陕西省汉中市汉台区', '汉台区', ',2807,2881,', '2881');
INSERT INTO `area` VALUES ('2883', '2013-01-01 09:03:20', '2013-01-01 09:03:20', null, '陕西省汉中市南郑县', '南郑县', ',2807,2881,', '2881');
INSERT INTO `area` VALUES ('2884', '2013-01-01 09:03:20', '2013-01-01 09:03:20', null, '陕西省汉中市城固县', '城固县', ',2807,2881,', '2881');
INSERT INTO `area` VALUES ('2885', '2013-01-01 09:03:20', '2013-01-01 09:03:20', null, '陕西省汉中市洋县', '洋县', ',2807,2881,', '2881');
INSERT INTO `area` VALUES ('2886', '2013-01-01 09:03:20', '2013-01-01 09:03:20', null, '陕西省汉中市西乡县', '西乡县', ',2807,2881,', '2881');
INSERT INTO `area` VALUES ('2887', '2013-01-01 09:03:20', '2013-01-01 09:03:20', null, '陕西省汉中市勉县', '勉县', ',2807,2881,', '2881');
INSERT INTO `area` VALUES ('2888', '2013-01-01 09:03:20', '2013-01-01 09:03:20', null, '陕西省汉中市宁强县', '宁强县', ',2807,2881,', '2881');
INSERT INTO `area` VALUES ('2889', '2013-01-01 09:03:20', '2013-01-01 09:03:20', null, '陕西省汉中市略阳县', '略阳县', ',2807,2881,', '2881');
INSERT INTO `area` VALUES ('2890', '2013-01-01 09:03:20', '2013-01-01 09:03:20', null, '陕西省汉中市镇巴县', '镇巴县', ',2807,2881,', '2881');
INSERT INTO `area` VALUES ('2891', '2013-01-01 09:03:20', '2013-01-01 09:03:20', null, '陕西省汉中市留坝县', '留坝县', ',2807,2881,', '2881');
INSERT INTO `area` VALUES ('2892', '2013-01-01 09:03:20', '2013-01-01 09:03:20', null, '陕西省汉中市佛坪县', '佛坪县', ',2807,2881,', '2881');
INSERT INTO `area` VALUES ('2893', '2013-01-01 09:03:20', '2013-01-01 09:03:20', null, '陕西省榆林市', '榆林市', ',2807,', '2807');
INSERT INTO `area` VALUES ('2894', '2013-01-01 09:03:21', '2013-01-01 09:03:21', null, '陕西省榆林市榆阳区', '榆阳区', ',2807,2893,', '2893');
INSERT INTO `area` VALUES ('2895', '2013-01-01 09:03:21', '2013-01-01 09:03:21', null, '陕西省榆林市神木县', '神木县', ',2807,2893,', '2893');
INSERT INTO `area` VALUES ('2896', '2013-01-01 09:03:21', '2013-01-01 09:03:21', null, '陕西省榆林市府谷县', '府谷县', ',2807,2893,', '2893');
INSERT INTO `area` VALUES ('2897', '2013-01-01 09:03:21', '2013-01-01 09:03:21', null, '陕西省榆林市横山县', '横山县', ',2807,2893,', '2893');
INSERT INTO `area` VALUES ('2898', '2013-01-01 09:03:21', '2013-01-01 09:03:21', null, '陕西省榆林市靖边县', '靖边县', ',2807,2893,', '2893');
INSERT INTO `area` VALUES ('2899', '2013-01-01 09:03:21', '2013-01-01 09:03:21', null, '陕西省榆林市定边县', '定边县', ',2807,2893,', '2893');
INSERT INTO `area` VALUES ('2900', '2013-01-01 09:03:21', '2013-01-01 09:03:21', null, '陕西省榆林市绥德县', '绥德县', ',2807,2893,', '2893');
INSERT INTO `area` VALUES ('2901', '2013-01-01 09:03:21', '2013-01-01 09:03:21', null, '陕西省榆林市米脂县', '米脂县', ',2807,2893,', '2893');
INSERT INTO `area` VALUES ('2902', '2013-01-01 09:03:21', '2013-01-01 09:03:21', null, '陕西省榆林市佳县', '佳县', ',2807,2893,', '2893');
INSERT INTO `area` VALUES ('2903', '2013-01-01 09:03:21', '2013-01-01 09:03:21', null, '陕西省榆林市吴堡县', '吴堡县', ',2807,2893,', '2893');
INSERT INTO `area` VALUES ('2904', '2013-01-01 09:03:21', '2013-01-01 09:03:21', null, '陕西省榆林市清涧县', '清涧县', ',2807,2893,', '2893');
INSERT INTO `area` VALUES ('2905', '2013-01-01 09:03:21', '2013-01-01 09:03:21', null, '陕西省榆林市子洲县', '子洲县', ',2807,2893,', '2893');
INSERT INTO `area` VALUES ('2906', '2013-01-01 09:03:21', '2013-01-01 09:03:21', null, '陕西省安康市', '安康市', ',2807,', '2807');
INSERT INTO `area` VALUES ('2907', '2013-01-01 09:03:21', '2013-01-01 09:03:21', null, '陕西省安康市汉滨区', '汉滨区', ',2807,2906,', '2906');
INSERT INTO `area` VALUES ('2908', '2013-01-01 09:03:21', '2013-01-01 09:03:21', null, '陕西省安康市汉阴县', '汉阴县', ',2807,2906,', '2906');
INSERT INTO `area` VALUES ('2909', '2013-01-01 09:03:21', '2013-01-01 09:03:21', null, '陕西省安康市石泉县', '石泉县', ',2807,2906,', '2906');
INSERT INTO `area` VALUES ('2910', '2013-01-01 09:03:22', '2013-01-01 09:03:22', null, '陕西省安康市宁陕县', '宁陕县', ',2807,2906,', '2906');
INSERT INTO `area` VALUES ('2911', '2013-01-01 09:03:22', '2013-01-01 09:03:22', null, '陕西省安康市紫阳县', '紫阳县', ',2807,2906,', '2906');
INSERT INTO `area` VALUES ('2912', '2013-01-01 09:03:22', '2013-01-01 09:03:22', null, '陕西省安康市岚皋县', '岚皋县', ',2807,2906,', '2906');
INSERT INTO `area` VALUES ('2913', '2013-01-01 09:03:22', '2013-01-01 09:03:22', null, '陕西省安康市平利县', '平利县', ',2807,2906,', '2906');
INSERT INTO `area` VALUES ('2914', '2013-01-01 09:03:22', '2013-01-01 09:03:22', null, '陕西省安康市镇坪县', '镇坪县', ',2807,2906,', '2906');
INSERT INTO `area` VALUES ('2915', '2013-01-01 09:03:22', '2013-01-01 09:03:22', null, '陕西省安康市旬阳县', '旬阳县', ',2807,2906,', '2906');
INSERT INTO `area` VALUES ('2916', '2013-01-01 09:03:22', '2013-01-01 09:03:22', null, '陕西省安康市白河县', '白河县', ',2807,2906,', '2906');
INSERT INTO `area` VALUES ('2917', '2013-01-01 09:03:22', '2013-01-01 09:03:22', null, '陕西省商洛市', '商洛市', ',2807,', '2807');
INSERT INTO `area` VALUES ('2918', '2013-01-01 09:03:22', '2013-01-01 09:03:22', null, '陕西省商洛市商州区', '商州区', ',2807,2917,', '2917');
INSERT INTO `area` VALUES ('2919', '2013-01-01 09:03:22', '2013-01-01 09:03:22', null, '陕西省商洛市洛南县', '洛南县', ',2807,2917,', '2917');
INSERT INTO `area` VALUES ('2920', '2013-01-01 09:03:22', '2013-01-01 09:03:22', null, '陕西省商洛市丹凤县', '丹凤县', ',2807,2917,', '2917');
INSERT INTO `area` VALUES ('2921', '2013-01-01 09:03:22', '2013-01-01 09:03:22', null, '陕西省商洛市商南县', '商南县', ',2807,2917,', '2917');
INSERT INTO `area` VALUES ('2922', '2013-01-01 09:03:22', '2013-01-01 09:03:22', null, '陕西省商洛市山阳县', '山阳县', ',2807,2917,', '2917');
INSERT INTO `area` VALUES ('2923', '2013-01-01 09:03:22', '2013-01-01 09:03:22', null, '陕西省商洛市镇安县', '镇安县', ',2807,2917,', '2917');
INSERT INTO `area` VALUES ('2924', '2013-01-01 09:03:22', '2013-01-01 09:03:22', null, '陕西省商洛市柞水县', '柞水县', ',2807,2917,', '2917');
INSERT INTO `area` VALUES ('2925', '2013-01-01 09:03:22', '2013-01-01 09:03:22', null, '甘肃省', '甘肃省', ',', null);
INSERT INTO `area` VALUES ('2926', '2013-01-01 09:03:22', '2013-01-01 09:03:22', null, '甘肃省兰州市', '兰州市', ',2925,', '2925');
INSERT INTO `area` VALUES ('2927', '2013-01-01 09:03:23', '2013-01-01 09:03:23', null, '甘肃省兰州市城关区', '城关区', ',2925,2926,', '2926');
INSERT INTO `area` VALUES ('2928', '2013-01-01 09:03:23', '2013-01-01 09:03:23', null, '甘肃省兰州市七里河区', '七里河区', ',2925,2926,', '2926');
INSERT INTO `area` VALUES ('2929', '2013-01-01 09:03:23', '2013-01-01 09:03:23', null, '甘肃省兰州市西固区', '西固区', ',2925,2926,', '2926');
INSERT INTO `area` VALUES ('2930', '2013-01-01 09:03:23', '2013-01-01 09:03:23', null, '甘肃省兰州市安宁区', '安宁区', ',2925,2926,', '2926');
INSERT INTO `area` VALUES ('2931', '2013-01-01 09:03:23', '2013-01-01 09:03:23', null, '甘肃省兰州市红古区', '红古区', ',2925,2926,', '2926');
INSERT INTO `area` VALUES ('2932', '2013-01-01 09:03:23', '2013-01-01 09:03:23', null, '甘肃省兰州市永登县', '永登县', ',2925,2926,', '2926');
INSERT INTO `area` VALUES ('2933', '2013-01-01 09:03:23', '2013-01-01 09:03:23', null, '甘肃省兰州市皋兰县', '皋兰县', ',2925,2926,', '2926');
INSERT INTO `area` VALUES ('2934', '2013-01-01 09:03:23', '2013-01-01 09:03:23', null, '甘肃省兰州市榆中县', '榆中县', ',2925,2926,', '2926');
INSERT INTO `area` VALUES ('2935', '2013-01-01 09:03:23', '2013-01-01 09:03:23', null, '甘肃省嘉峪关市', '嘉峪关市', ',2925,', '2925');
INSERT INTO `area` VALUES ('2936', '2013-01-01 09:03:23', '2013-01-01 09:03:23', null, '甘肃省金昌市', '金昌市', ',2925,', '2925');
INSERT INTO `area` VALUES ('2937', '2013-01-01 09:03:23', '2013-01-01 09:03:23', null, '甘肃省金昌市金川区', '金川区', ',2925,2936,', '2936');
INSERT INTO `area` VALUES ('2938', '2013-01-01 09:03:23', '2013-01-01 09:03:23', null, '甘肃省金昌市永昌县', '永昌县', ',2925,2936,', '2936');
INSERT INTO `area` VALUES ('2939', '2013-01-01 09:03:23', '2013-01-01 09:03:23', null, '甘肃省白银市', '白银市', ',2925,', '2925');
INSERT INTO `area` VALUES ('2940', '2013-01-01 09:03:23', '2013-01-01 09:03:23', null, '甘肃省白银市白银区', '白银区', ',2925,2939,', '2939');
INSERT INTO `area` VALUES ('2941', '2013-01-01 09:03:23', '2013-01-01 09:03:23', null, '甘肃省白银市平川区', '平川区', ',2925,2939,', '2939');
INSERT INTO `area` VALUES ('2942', '2013-01-01 09:03:23', '2013-01-01 09:03:23', null, '甘肃省白银市靖远县', '靖远县', ',2925,2939,', '2939');
INSERT INTO `area` VALUES ('2943', '2013-01-01 09:03:23', '2013-01-01 09:03:23', null, '甘肃省白银市会宁县', '会宁县', ',2925,2939,', '2939');
INSERT INTO `area` VALUES ('2944', '2013-01-01 09:03:24', '2013-01-01 09:03:24', null, '甘肃省白银市景泰县', '景泰县', ',2925,2939,', '2939');
INSERT INTO `area` VALUES ('2945', '2013-01-01 09:03:24', '2013-01-01 09:03:24', null, '甘肃省天水市', '天水市', ',2925,', '2925');
INSERT INTO `area` VALUES ('2946', '2013-01-01 09:03:24', '2013-01-01 09:03:24', null, '甘肃省天水市秦州区', '秦州区', ',2925,2945,', '2945');
INSERT INTO `area` VALUES ('2947', '2013-01-01 09:03:24', '2013-01-01 09:03:24', null, '甘肃省天水市麦积区', '麦积区', ',2925,2945,', '2945');
INSERT INTO `area` VALUES ('2948', '2013-01-01 09:03:24', '2013-01-01 09:03:24', null, '甘肃省天水市清水县', '清水县', ',2925,2945,', '2945');
INSERT INTO `area` VALUES ('2949', '2013-01-01 09:03:24', '2013-01-01 09:03:24', null, '甘肃省天水市秦安县', '秦安县', ',2925,2945,', '2945');
INSERT INTO `area` VALUES ('2950', '2013-01-01 09:03:24', '2013-01-01 09:03:24', null, '甘肃省天水市甘谷县', '甘谷县', ',2925,2945,', '2945');
INSERT INTO `area` VALUES ('2951', '2013-01-01 09:03:24', '2013-01-01 09:03:24', null, '甘肃省天水市武山县', '武山县', ',2925,2945,', '2945');
INSERT INTO `area` VALUES ('2952', '2013-01-01 09:03:24', '2013-01-01 09:03:24', null, '甘肃省天水市张家川回族自治县', '张家川回族自治县', ',2925,2945,', '2945');
INSERT INTO `area` VALUES ('2953', '2013-01-01 09:03:24', '2013-01-01 09:03:24', null, '甘肃省武威市', '武威市', ',2925,', '2925');
INSERT INTO `area` VALUES ('2954', '2013-01-01 09:03:24', '2013-01-01 09:03:24', null, '甘肃省武威市凉州区', '凉州区', ',2925,2953,', '2953');
INSERT INTO `area` VALUES ('2955', '2013-01-01 09:03:24', '2013-01-01 09:03:24', null, '甘肃省武威市民勤县', '民勤县', ',2925,2953,', '2953');
INSERT INTO `area` VALUES ('2956', '2013-01-01 09:03:24', '2013-01-01 09:03:24', null, '甘肃省武威市古浪县', '古浪县', ',2925,2953,', '2953');
INSERT INTO `area` VALUES ('2957', '2013-01-01 09:03:24', '2013-01-01 09:03:24', null, '甘肃省武威市天祝藏族自治县', '天祝藏族自治县', ',2925,2953,', '2953');
INSERT INTO `area` VALUES ('2958', '2013-01-01 09:03:24', '2013-01-01 09:03:24', null, '甘肃省张掖市', '张掖市', ',2925,', '2925');
INSERT INTO `area` VALUES ('2959', '2013-01-01 09:03:24', '2013-01-01 09:03:24', null, '甘肃省张掖市甘州区', '甘州区', ',2925,2958,', '2958');
INSERT INTO `area` VALUES ('2960', '2013-01-01 09:03:24', '2013-01-01 09:03:24', null, '甘肃省张掖市肃南裕固族自治县', '肃南裕固族自治县', ',2925,2958,', '2958');
INSERT INTO `area` VALUES ('2961', '2013-01-01 09:03:25', '2013-01-01 09:03:25', null, '甘肃省张掖市民乐县', '民乐县', ',2925,2958,', '2958');
INSERT INTO `area` VALUES ('2962', '2013-01-01 09:03:25', '2013-01-01 09:03:25', null, '甘肃省张掖市临泽县', '临泽县', ',2925,2958,', '2958');
INSERT INTO `area` VALUES ('2963', '2013-01-01 09:03:25', '2013-01-01 09:03:25', null, '甘肃省张掖市高台县', '高台县', ',2925,2958,', '2958');
INSERT INTO `area` VALUES ('2964', '2013-01-01 09:03:25', '2013-01-01 09:03:25', null, '甘肃省张掖市山丹县', '山丹县', ',2925,2958,', '2958');
INSERT INTO `area` VALUES ('2965', '2013-01-01 09:03:25', '2013-01-01 09:03:25', null, '甘肃省平凉市', '平凉市', ',2925,', '2925');
INSERT INTO `area` VALUES ('2966', '2013-01-01 09:03:25', '2013-01-01 09:03:25', null, '甘肃省平凉市崆峒区', '崆峒区', ',2925,2965,', '2965');
INSERT INTO `area` VALUES ('2967', '2013-01-01 09:03:25', '2013-01-01 09:03:25', null, '甘肃省平凉市泾川县', '泾川县', ',2925,2965,', '2965');
INSERT INTO `area` VALUES ('2968', '2013-01-01 09:03:25', '2013-01-01 09:03:25', null, '甘肃省平凉市灵台县', '灵台县', ',2925,2965,', '2965');
INSERT INTO `area` VALUES ('2969', '2013-01-01 09:03:25', '2013-01-01 09:03:25', null, '甘肃省平凉市崇信县', '崇信县', ',2925,2965,', '2965');
INSERT INTO `area` VALUES ('2970', '2013-01-01 09:03:25', '2013-01-01 09:03:25', null, '甘肃省平凉市华亭县', '华亭县', ',2925,2965,', '2965');
INSERT INTO `area` VALUES ('2971', '2013-01-01 09:03:25', '2013-01-01 09:03:25', null, '甘肃省平凉市庄浪县', '庄浪县', ',2925,2965,', '2965');
INSERT INTO `area` VALUES ('2972', '2013-01-01 09:03:25', '2013-01-01 09:03:25', null, '甘肃省平凉市静宁县', '静宁县', ',2925,2965,', '2965');
INSERT INTO `area` VALUES ('2973', '2013-01-01 09:03:25', '2013-01-01 09:03:25', null, '甘肃省酒泉市', '酒泉市', ',2925,', '2925');
INSERT INTO `area` VALUES ('2974', '2013-01-01 09:03:25', '2013-01-01 09:03:25', null, '甘肃省酒泉市肃州区', '肃州区', ',2925,2973,', '2973');
INSERT INTO `area` VALUES ('2975', '2013-01-01 09:03:25', '2013-01-01 09:03:25', null, '甘肃省酒泉市金塔县', '金塔县', ',2925,2973,', '2973');
INSERT INTO `area` VALUES ('2976', '2013-01-01 09:03:25', '2013-01-01 09:03:25', null, '甘肃省酒泉市瓜州县', '瓜州县', ',2925,2973,', '2973');
INSERT INTO `area` VALUES ('2977', '2013-01-01 09:03:25', '2013-01-01 09:03:25', null, '甘肃省酒泉市肃北蒙古族自治县', '肃北蒙古族自治县', ',2925,2973,', '2973');
INSERT INTO `area` VALUES ('2978', '2013-01-01 09:03:25', '2013-01-01 09:03:25', null, '甘肃省酒泉市阿克塞哈萨克族自治县', '阿克塞哈萨克族自治县', ',2925,2973,', '2973');
INSERT INTO `area` VALUES ('2979', '2013-01-01 09:03:25', '2013-01-01 09:03:25', null, '甘肃省酒泉市玉门市', '玉门市', ',2925,2973,', '2973');
INSERT INTO `area` VALUES ('2980', '2013-01-01 09:03:26', '2013-01-01 09:03:26', null, '甘肃省酒泉市敦煌市', '敦煌市', ',2925,2973,', '2973');
INSERT INTO `area` VALUES ('2981', '2013-01-01 09:03:26', '2013-01-01 09:03:26', null, '甘肃省庆阳市', '庆阳市', ',2925,', '2925');
INSERT INTO `area` VALUES ('2982', '2013-01-01 09:03:26', '2013-01-01 09:03:26', null, '甘肃省庆阳市西峰区', '西峰区', ',2925,2981,', '2981');
INSERT INTO `area` VALUES ('2983', '2013-01-01 09:03:26', '2013-01-01 09:03:26', null, '甘肃省庆阳市庆城县', '庆城县', ',2925,2981,', '2981');
INSERT INTO `area` VALUES ('2984', '2013-01-01 09:03:26', '2013-01-01 09:03:26', null, '甘肃省庆阳市环县', '环县', ',2925,2981,', '2981');
INSERT INTO `area` VALUES ('2985', '2013-01-01 09:03:26', '2013-01-01 09:03:26', null, '甘肃省庆阳市华池县', '华池县', ',2925,2981,', '2981');
INSERT INTO `area` VALUES ('2986', '2013-01-01 09:03:26', '2013-01-01 09:03:26', null, '甘肃省庆阳市合水县', '合水县', ',2925,2981,', '2981');
INSERT INTO `area` VALUES ('2987', '2013-01-01 09:03:26', '2013-01-01 09:03:26', null, '甘肃省庆阳市正宁县', '正宁县', ',2925,2981,', '2981');
INSERT INTO `area` VALUES ('2988', '2013-01-01 09:03:26', '2013-01-01 09:03:26', null, '甘肃省庆阳市宁县', '宁县', ',2925,2981,', '2981');
INSERT INTO `area` VALUES ('2989', '2013-01-01 09:03:26', '2013-01-01 09:03:26', null, '甘肃省庆阳市镇原县', '镇原县', ',2925,2981,', '2981');
INSERT INTO `area` VALUES ('2990', '2013-01-01 09:03:26', '2013-01-01 09:03:26', null, '甘肃省定西市', '定西市', ',2925,', '2925');
INSERT INTO `area` VALUES ('2991', '2013-01-01 09:03:26', '2013-01-01 09:03:26', null, '甘肃省定西市安定区', '安定区', ',2925,2990,', '2990');
INSERT INTO `area` VALUES ('2992', '2013-01-01 09:03:26', '2013-01-01 09:03:26', null, '甘肃省定西市通渭县', '通渭县', ',2925,2990,', '2990');
INSERT INTO `area` VALUES ('2993', '2013-01-01 09:03:26', '2013-01-01 09:03:26', null, '甘肃省定西市陇西县', '陇西县', ',2925,2990,', '2990');
INSERT INTO `area` VALUES ('2994', '2013-01-01 09:03:26', '2013-01-01 09:03:26', null, '甘肃省定西市渭源县', '渭源县', ',2925,2990,', '2990');
INSERT INTO `area` VALUES ('2995', '2013-01-01 09:03:26', '2013-01-01 09:03:26', null, '甘肃省定西市临洮县', '临洮县', ',2925,2990,', '2990');
INSERT INTO `area` VALUES ('2996', '2013-01-01 09:03:26', '2013-01-01 09:03:26', null, '甘肃省定西市漳县', '漳县', ',2925,2990,', '2990');
INSERT INTO `area` VALUES ('2997', '2013-01-01 09:03:27', '2013-01-01 09:03:27', null, '甘肃省定西市岷县', '岷县', ',2925,2990,', '2990');
INSERT INTO `area` VALUES ('2998', '2013-01-01 09:03:27', '2013-01-01 09:03:27', null, '甘肃省陇南市', '陇南市', ',2925,', '2925');
INSERT INTO `area` VALUES ('2999', '2013-01-01 09:03:27', '2013-01-01 09:03:27', null, '甘肃省陇南市武都区', '武都区', ',2925,2998,', '2998');
INSERT INTO `area` VALUES ('3000', '2013-01-01 09:03:27', '2013-01-01 09:03:27', null, '甘肃省陇南市成县', '成县', ',2925,2998,', '2998');
INSERT INTO `area` VALUES ('3001', '2013-01-01 09:03:27', '2013-01-01 09:03:27', null, '甘肃省陇南市文县', '文县', ',2925,2998,', '2998');
INSERT INTO `area` VALUES ('3002', '2013-01-01 09:03:27', '2013-01-01 09:03:27', null, '甘肃省陇南市宕昌县', '宕昌县', ',2925,2998,', '2998');
INSERT INTO `area` VALUES ('3003', '2013-01-01 09:03:27', '2013-01-01 09:03:27', null, '甘肃省陇南市康县', '康县', ',2925,2998,', '2998');
INSERT INTO `area` VALUES ('3004', '2013-01-01 09:03:27', '2013-01-01 09:03:27', null, '甘肃省陇南市西和县', '西和县', ',2925,2998,', '2998');
INSERT INTO `area` VALUES ('3005', '2013-01-01 09:03:27', '2013-01-01 09:03:27', null, '甘肃省陇南市礼县', '礼县', ',2925,2998,', '2998');
INSERT INTO `area` VALUES ('3006', '2013-01-01 09:03:27', '2013-01-01 09:03:27', null, '甘肃省陇南市徽县', '徽县', ',2925,2998,', '2998');
INSERT INTO `area` VALUES ('3007', '2013-01-01 09:03:27', '2013-01-01 09:03:27', null, '甘肃省陇南市两当县', '两当县', ',2925,2998,', '2998');
INSERT INTO `area` VALUES ('3008', '2013-01-01 09:03:27', '2013-01-01 09:03:27', null, '甘肃省临夏回族自治州', '临夏回族自治州', ',2925,', '2925');
INSERT INTO `area` VALUES ('3009', '2013-01-01 09:03:27', '2013-01-01 09:03:27', null, '甘肃省临夏回族自治州临夏市', '临夏市', ',2925,3008,', '3008');
INSERT INTO `area` VALUES ('3010', '2013-01-01 09:03:27', '2013-01-01 09:03:27', null, '甘肃省临夏回族自治州临夏县', '临夏县', ',2925,3008,', '3008');
INSERT INTO `area` VALUES ('3011', '2013-01-01 09:03:27', '2013-01-01 09:03:27', null, '甘肃省临夏回族自治州康乐县', '康乐县', ',2925,3008,', '3008');
INSERT INTO `area` VALUES ('3012', '2013-01-01 09:03:27', '2013-01-01 09:03:27', null, '甘肃省临夏回族自治州永靖县', '永靖县', ',2925,3008,', '3008');
INSERT INTO `area` VALUES ('3013', '2013-01-01 09:03:27', '2013-01-01 09:03:27', null, '甘肃省临夏回族自治州广河县', '广河县', ',2925,3008,', '3008');
INSERT INTO `area` VALUES ('3014', '2013-01-01 09:03:27', '2013-01-01 09:03:27', null, '甘肃省临夏回族自治州和政县', '和政县', ',2925,3008,', '3008');
INSERT INTO `area` VALUES ('3015', '2013-01-01 09:03:28', '2013-01-01 09:03:28', null, '甘肃省临夏回族自治州东乡族自治县', '东乡族自治县', ',2925,3008,', '3008');
INSERT INTO `area` VALUES ('3016', '2013-01-01 09:03:28', '2013-01-01 09:03:28', null, '甘肃省临夏回族自治州积石山保安族东乡族撒拉族自治县', '积石山保安族东乡族撒拉族自治县', ',2925,3008,', '3008');
INSERT INTO `area` VALUES ('3017', '2013-01-01 09:03:28', '2013-01-01 09:03:28', null, '甘肃省甘南藏族自治州', '甘南藏族自治州', ',2925,', '2925');
INSERT INTO `area` VALUES ('3018', '2013-01-01 09:03:28', '2013-01-01 09:03:28', null, '甘肃省甘南藏族自治州合作市', '合作市', ',2925,3017,', '3017');
INSERT INTO `area` VALUES ('3019', '2013-01-01 09:03:28', '2013-01-01 09:03:28', null, '甘肃省甘南藏族自治州临潭县', '临潭县', ',2925,3017,', '3017');
INSERT INTO `area` VALUES ('3020', '2013-01-01 09:03:28', '2013-01-01 09:03:28', null, '甘肃省甘南藏族自治州卓尼县', '卓尼县', ',2925,3017,', '3017');
INSERT INTO `area` VALUES ('3021', '2013-01-01 09:03:28', '2013-01-01 09:03:28', null, '甘肃省甘南藏族自治州舟曲县', '舟曲县', ',2925,3017,', '3017');
INSERT INTO `area` VALUES ('3022', '2013-01-01 09:03:28', '2013-01-01 09:03:28', null, '甘肃省甘南藏族自治州迭部县', '迭部县', ',2925,3017,', '3017');
INSERT INTO `area` VALUES ('3023', '2013-01-01 09:03:28', '2013-01-01 09:03:28', null, '甘肃省甘南藏族自治州玛曲县', '玛曲县', ',2925,3017,', '3017');
INSERT INTO `area` VALUES ('3024', '2013-01-01 09:03:28', '2013-01-01 09:03:28', null, '甘肃省甘南藏族自治州碌曲县', '碌曲县', ',2925,3017,', '3017');
INSERT INTO `area` VALUES ('3025', '2013-01-01 09:03:28', '2013-01-01 09:03:28', null, '甘肃省甘南藏族自治州夏河县', '夏河县', ',2925,3017,', '3017');
INSERT INTO `area` VALUES ('3026', '2013-01-01 09:03:28', '2013-01-01 09:03:28', null, '青海省', '青海省', ',', null);
INSERT INTO `area` VALUES ('3027', '2013-01-01 09:03:28', '2013-01-01 09:03:28', null, '青海省西宁市', '西宁市', ',3026,', '3026');
INSERT INTO `area` VALUES ('3028', '2013-01-01 09:03:28', '2013-01-01 09:03:28', null, '青海省西宁市城东区', '城东区', ',3026,3027,', '3027');
INSERT INTO `area` VALUES ('3029', '2013-01-01 09:03:28', '2013-01-01 09:03:28', null, '青海省西宁市城中区', '城中区', ',3026,3027,', '3027');
INSERT INTO `area` VALUES ('3030', '2013-01-01 09:03:28', '2013-01-01 09:03:28', null, '青海省西宁市城西区', '城西区', ',3026,3027,', '3027');
INSERT INTO `area` VALUES ('3031', '2013-01-01 09:03:28', '2013-01-01 09:03:28', null, '青海省西宁市城北区', '城北区', ',3026,3027,', '3027');
INSERT INTO `area` VALUES ('3032', '2013-01-01 09:03:29', '2013-01-01 09:03:29', null, '青海省西宁市大通回族土族自治县', '大通回族土族自治县', ',3026,3027,', '3027');
INSERT INTO `area` VALUES ('3033', '2013-01-01 09:03:29', '2013-01-01 09:03:29', null, '青海省西宁市湟中县', '湟中县', ',3026,3027,', '3027');
INSERT INTO `area` VALUES ('3034', '2013-01-01 09:03:29', '2013-01-01 09:03:29', null, '青海省西宁市湟源县', '湟源县', ',3026,3027,', '3027');
INSERT INTO `area` VALUES ('3035', '2013-01-01 09:03:29', '2013-01-01 09:03:29', null, '青海省海东地区', '海东地区', ',3026,', '3026');
INSERT INTO `area` VALUES ('3036', '2013-01-01 09:03:29', '2013-01-01 09:03:29', null, '青海省海东地区平安县', '平安县', ',3026,3035,', '3035');
INSERT INTO `area` VALUES ('3037', '2013-01-01 09:03:29', '2013-01-01 09:03:29', null, '青海省海东地区民和回族土族自治县', '民和回族土族自治县', ',3026,3035,', '3035');
INSERT INTO `area` VALUES ('3038', '2013-01-01 09:03:29', '2013-01-01 09:03:29', null, '青海省海东地区乐都县', '乐都县', ',3026,3035,', '3035');
INSERT INTO `area` VALUES ('3039', '2013-01-01 09:03:29', '2013-01-01 09:03:29', null, '青海省海东地区互助土族自治县', '互助土族自治县', ',3026,3035,', '3035');
INSERT INTO `area` VALUES ('3040', '2013-01-01 09:03:29', '2013-01-01 09:03:29', null, '青海省海东地区化隆回族自治县', '化隆回族自治县', ',3026,3035,', '3035');
INSERT INTO `area` VALUES ('3041', '2013-01-01 09:03:29', '2013-01-01 09:03:29', null, '青海省海东地区循化撒拉族自治县', '循化撒拉族自治县', ',3026,3035,', '3035');
INSERT INTO `area` VALUES ('3042', '2013-01-01 09:03:29', '2013-01-01 09:03:29', null, '青海省海北藏族自治州', '海北藏族自治州', ',3026,', '3026');
INSERT INTO `area` VALUES ('3043', '2013-01-01 09:03:29', '2013-01-01 09:03:29', null, '青海省海北藏族自治州门源回族自治县', '门源回族自治县', ',3026,3042,', '3042');
INSERT INTO `area` VALUES ('3044', '2013-01-01 09:03:29', '2013-01-01 09:03:29', null, '青海省海北藏族自治州祁连县', '祁连县', ',3026,3042,', '3042');
INSERT INTO `area` VALUES ('3045', '2013-01-01 09:03:29', '2013-01-01 09:03:29', null, '青海省海北藏族自治州海晏县', '海晏县', ',3026,3042,', '3042');
INSERT INTO `area` VALUES ('3046', '2013-01-01 09:03:29', '2013-01-01 09:03:29', null, '青海省海北藏族自治州刚察县', '刚察县', ',3026,3042,', '3042');
INSERT INTO `area` VALUES ('3047', '2013-01-01 09:03:29', '2013-01-01 09:03:29', null, '青海省黄南藏族自治州', '黄南藏族自治州', ',3026,', '3026');
INSERT INTO `area` VALUES ('3048', '2013-01-01 09:03:30', '2013-01-01 09:03:30', null, '青海省黄南藏族自治州同仁县', '同仁县', ',3026,3047,', '3047');
INSERT INTO `area` VALUES ('3049', '2013-01-01 09:03:30', '2013-01-01 09:03:30', null, '青海省黄南藏族自治州尖扎县', '尖扎县', ',3026,3047,', '3047');
INSERT INTO `area` VALUES ('3050', '2013-01-01 09:03:30', '2013-01-01 09:03:30', null, '青海省黄南藏族自治州泽库县', '泽库县', ',3026,3047,', '3047');
INSERT INTO `area` VALUES ('3051', '2013-01-01 09:03:30', '2013-01-01 09:03:30', null, '青海省黄南藏族自治州河南蒙古族自治县', '河南蒙古族自治县', ',3026,3047,', '3047');
INSERT INTO `area` VALUES ('3052', '2013-01-01 09:03:30', '2013-01-01 09:03:30', null, '青海省海南藏族自治州', '海南藏族自治州', ',3026,', '3026');
INSERT INTO `area` VALUES ('3053', '2013-01-01 09:03:30', '2013-01-01 09:03:30', null, '青海省海南藏族自治州共和县', '共和县', ',3026,3052,', '3052');
INSERT INTO `area` VALUES ('3054', '2013-01-01 09:03:30', '2013-01-01 09:03:30', null, '青海省海南藏族自治州同德县', '同德县', ',3026,3052,', '3052');
INSERT INTO `area` VALUES ('3055', '2013-01-01 09:03:30', '2013-01-01 09:03:30', null, '青海省海南藏族自治州贵德县', '贵德县', ',3026,3052,', '3052');
INSERT INTO `area` VALUES ('3056', '2013-01-01 09:03:30', '2013-01-01 09:03:30', null, '青海省海南藏族自治州兴海县', '兴海县', ',3026,3052,', '3052');
INSERT INTO `area` VALUES ('3057', '2013-01-01 09:03:30', '2013-01-01 09:03:30', null, '青海省海南藏族自治州贵南县', '贵南县', ',3026,3052,', '3052');
INSERT INTO `area` VALUES ('3058', '2013-01-01 09:03:30', '2013-01-01 09:03:30', null, '青海省果洛藏族自治州', '果洛藏族自治州', ',3026,', '3026');
INSERT INTO `area` VALUES ('3059', '2013-01-01 09:03:30', '2013-01-01 09:03:30', null, '青海省果洛藏族自治州玛沁县', '玛沁县', ',3026,3058,', '3058');
INSERT INTO `area` VALUES ('3060', '2013-01-01 09:03:30', '2013-01-01 09:03:30', null, '青海省果洛藏族自治州班玛县', '班玛县', ',3026,3058,', '3058');
INSERT INTO `area` VALUES ('3061', '2013-01-01 09:03:30', '2013-01-01 09:03:30', null, '青海省果洛藏族自治州甘德县', '甘德县', ',3026,3058,', '3058');
INSERT INTO `area` VALUES ('3062', '2013-01-01 09:03:30', '2013-01-01 09:03:30', null, '青海省果洛藏族自治州达日县', '达日县', ',3026,3058,', '3058');
INSERT INTO `area` VALUES ('3063', '2013-01-01 09:03:30', '2013-01-01 09:03:30', null, '青海省果洛藏族自治州久治县', '久治县', ',3026,3058,', '3058');
INSERT INTO `area` VALUES ('3064', '2013-01-01 09:03:30', '2013-01-01 09:03:30', null, '青海省果洛藏族自治州玛多县', '玛多县', ',3026,3058,', '3058');
INSERT INTO `area` VALUES ('3065', '2013-01-01 09:03:31', '2013-01-01 09:03:31', null, '青海省玉树藏族自治州', '玉树藏族自治州', ',3026,', '3026');
INSERT INTO `area` VALUES ('3066', '2013-01-01 09:03:31', '2013-01-01 09:03:31', null, '青海省玉树藏族自治州玉树县', '玉树县', ',3026,3065,', '3065');
INSERT INTO `area` VALUES ('3067', '2013-01-01 09:03:31', '2013-01-01 09:03:31', null, '青海省玉树藏族自治州杂多县', '杂多县', ',3026,3065,', '3065');
INSERT INTO `area` VALUES ('3068', '2013-01-01 09:03:31', '2013-01-01 09:03:31', null, '青海省玉树藏族自治州称多县', '称多县', ',3026,3065,', '3065');
INSERT INTO `area` VALUES ('3069', '2013-01-01 09:03:31', '2013-01-01 09:03:31', null, '青海省玉树藏族自治州治多县', '治多县', ',3026,3065,', '3065');
INSERT INTO `area` VALUES ('3070', '2013-01-01 09:03:31', '2013-01-01 09:03:31', null, '青海省玉树藏族自治州囊谦县', '囊谦县', ',3026,3065,', '3065');
INSERT INTO `area` VALUES ('3071', '2013-01-01 09:03:31', '2013-01-01 09:03:31', null, '青海省玉树藏族自治州曲麻莱县', '曲麻莱县', ',3026,3065,', '3065');
INSERT INTO `area` VALUES ('3072', '2013-01-01 09:03:31', '2013-01-01 09:03:31', null, '青海省海西蒙古族藏族自治州', '海西蒙古族藏族自治州', ',3026,', '3026');
INSERT INTO `area` VALUES ('3073', '2013-01-01 09:03:31', '2013-01-01 09:03:31', null, '青海省海西蒙古族藏族自治州格尔木市', '格尔木市', ',3026,3072,', '3072');
INSERT INTO `area` VALUES ('3074', '2013-01-01 09:03:32', '2013-01-01 09:03:32', null, '青海省海西蒙古族藏族自治州德令哈市', '德令哈市', ',3026,3072,', '3072');
INSERT INTO `area` VALUES ('3075', '2013-01-01 09:03:32', '2013-01-01 09:03:32', null, '青海省海西蒙古族藏族自治州乌兰县', '乌兰县', ',3026,3072,', '3072');
INSERT INTO `area` VALUES ('3076', '2013-01-01 09:03:32', '2013-01-01 09:03:32', null, '青海省海西蒙古族藏族自治州都兰县', '都兰县', ',3026,3072,', '3072');
INSERT INTO `area` VALUES ('3077', '2013-01-01 09:03:32', '2013-01-01 09:03:32', null, '青海省海西蒙古族藏族自治州天峻县', '天峻县', ',3026,3072,', '3072');
INSERT INTO `area` VALUES ('3078', '2013-01-01 09:03:32', '2013-01-01 09:03:32', null, '宁夏回族自治区', '宁夏回族自治区', ',', null);
INSERT INTO `area` VALUES ('3079', '2013-01-01 09:03:32', '2013-01-01 09:03:32', null, '宁夏回族自治区银川市', '银川市', ',3078,', '3078');
INSERT INTO `area` VALUES ('3080', '2013-01-01 09:03:32', '2013-01-01 09:03:32', null, '宁夏回族自治区银川市兴庆区', '兴庆区', ',3078,3079,', '3079');
INSERT INTO `area` VALUES ('3081', '2013-01-01 09:03:32', '2013-01-01 09:03:32', null, '宁夏回族自治区银川市西夏区', '西夏区', ',3078,3079,', '3079');
INSERT INTO `area` VALUES ('3082', '2013-01-01 09:03:32', '2013-01-01 09:03:32', null, '宁夏回族自治区银川市金凤区', '金凤区', ',3078,3079,', '3079');
INSERT INTO `area` VALUES ('3083', '2013-01-01 09:03:32', '2013-01-01 09:03:32', null, '宁夏回族自治区银川市永宁县', '永宁县', ',3078,3079,', '3079');
INSERT INTO `area` VALUES ('3084', '2013-01-01 09:03:32', '2013-01-01 09:03:32', null, '宁夏回族自治区银川市贺兰县', '贺兰县', ',3078,3079,', '3079');
INSERT INTO `area` VALUES ('3085', '2013-01-01 09:03:32', '2013-01-01 09:03:32', null, '宁夏回族自治区银川市灵武市', '灵武市', ',3078,3079,', '3079');
INSERT INTO `area` VALUES ('3086', '2013-01-01 09:03:32', '2013-01-01 09:03:32', null, '宁夏回族自治区石嘴山市', '石嘴山市', ',3078,', '3078');
INSERT INTO `area` VALUES ('3087', '2013-01-01 09:03:32', '2013-01-01 09:03:32', null, '宁夏回族自治区石嘴山市大武口区', '大武口区', ',3078,3086,', '3086');
INSERT INTO `area` VALUES ('3088', '2013-01-01 09:03:32', '2013-01-01 09:03:32', null, '宁夏回族自治区石嘴山市惠农区', '惠农区', ',3078,3086,', '3086');
INSERT INTO `area` VALUES ('3089', '2013-01-01 09:03:32', '2013-01-01 09:03:32', null, '宁夏回族自治区石嘴山市平罗县', '平罗县', ',3078,3086,', '3086');
INSERT INTO `area` VALUES ('3090', '2013-01-01 09:03:32', '2013-01-01 09:03:32', null, '宁夏回族自治区吴忠市', '吴忠市', ',3078,', '3078');
INSERT INTO `area` VALUES ('3091', '2013-01-01 09:03:33', '2013-01-01 09:03:33', null, '宁夏回族自治区吴忠市利通区', '利通区', ',3078,3090,', '3090');
INSERT INTO `area` VALUES ('3092', '2013-01-01 09:03:33', '2013-01-01 09:03:33', null, '宁夏回族自治区吴忠市红寺堡区', '红寺堡区', ',3078,3090,', '3090');
INSERT INTO `area` VALUES ('3093', '2013-01-01 09:03:33', '2013-01-01 09:03:33', null, '宁夏回族自治区吴忠市盐池县', '盐池县', ',3078,3090,', '3090');
INSERT INTO `area` VALUES ('3094', '2013-01-01 09:03:33', '2013-01-01 09:03:33', null, '宁夏回族自治区吴忠市同心县', '同心县', ',3078,3090,', '3090');
INSERT INTO `area` VALUES ('3095', '2013-01-01 09:03:33', '2013-01-01 09:03:33', null, '宁夏回族自治区吴忠市青铜峡市', '青铜峡市', ',3078,3090,', '3090');
INSERT INTO `area` VALUES ('3096', '2013-01-01 09:03:33', '2013-01-01 09:03:33', null, '宁夏回族自治区固原市', '固原市', ',3078,', '3078');
INSERT INTO `area` VALUES ('3097', '2013-01-01 09:03:33', '2013-01-01 09:03:33', null, '宁夏回族自治区固原市原州区', '原州区', ',3078,3096,', '3096');
INSERT INTO `area` VALUES ('3098', '2013-01-01 09:03:33', '2013-01-01 09:03:33', null, '宁夏回族自治区固原市西吉县', '西吉县', ',3078,3096,', '3096');
INSERT INTO `area` VALUES ('3099', '2013-01-01 09:03:33', '2013-01-01 09:03:33', null, '宁夏回族自治区固原市隆德县', '隆德县', ',3078,3096,', '3096');
INSERT INTO `area` VALUES ('3100', '2013-01-01 09:03:33', '2013-01-01 09:03:33', null, '宁夏回族自治区固原市泾源县', '泾源县', ',3078,3096,', '3096');
INSERT INTO `area` VALUES ('3101', '2013-01-01 09:03:33', '2013-01-01 09:03:33', null, '宁夏回族自治区固原市彭阳县', '彭阳县', ',3078,3096,', '3096');
INSERT INTO `area` VALUES ('3102', '2013-01-01 09:03:33', '2013-01-01 09:03:33', null, '宁夏回族自治区中卫市', '中卫市', ',3078,', '3078');
INSERT INTO `area` VALUES ('3103', '2013-01-01 09:03:33', '2013-01-01 09:03:33', null, '宁夏回族自治区中卫市沙坡头区', '沙坡头区', ',3078,3102,', '3102');
INSERT INTO `area` VALUES ('3104', '2013-01-01 09:03:33', '2013-01-01 09:03:33', null, '宁夏回族自治区中卫市中宁县', '中宁县', ',3078,3102,', '3102');
INSERT INTO `area` VALUES ('3105', '2013-01-01 09:03:33', '2013-01-01 09:03:33', null, '宁夏回族自治区中卫市海原县', '海原县', ',3078,3102,', '3102');
INSERT INTO `area` VALUES ('3106', '2013-01-01 09:03:33', '2013-01-01 09:03:33', null, '新疆维吾尔自治区', '新疆维吾尔自治区', ',', null);
INSERT INTO `area` VALUES ('3107', '2013-01-01 09:03:33', '2013-01-01 09:03:33', null, '新疆维吾尔自治区乌鲁木齐市', '乌鲁木齐市', ',3106,', '3106');
INSERT INTO `area` VALUES ('3108', '2013-01-01 09:03:34', '2013-01-01 09:03:34', null, '新疆维吾尔自治区乌鲁木齐市天山区', '天山区', ',3106,3107,', '3107');
INSERT INTO `area` VALUES ('3109', '2013-01-01 09:03:34', '2013-01-01 09:03:34', null, '新疆维吾尔自治区乌鲁木齐市沙依巴克区', '沙依巴克区', ',3106,3107,', '3107');
INSERT INTO `area` VALUES ('3110', '2013-01-01 09:03:34', '2013-01-01 09:03:34', null, '新疆维吾尔自治区乌鲁木齐市新市区', '新市区', ',3106,3107,', '3107');
INSERT INTO `area` VALUES ('3111', '2013-01-01 09:03:34', '2013-01-01 09:03:34', null, '新疆维吾尔自治区乌鲁木齐市水磨沟区', '水磨沟区', ',3106,3107,', '3107');
INSERT INTO `area` VALUES ('3112', '2013-01-01 09:03:34', '2013-01-01 09:03:34', null, '新疆维吾尔自治区乌鲁木齐市头屯河区', '头屯河区', ',3106,3107,', '3107');
INSERT INTO `area` VALUES ('3113', '2013-01-01 09:03:34', '2013-01-01 09:03:34', null, '新疆维吾尔自治区乌鲁木齐市达坂城区', '达坂城区', ',3106,3107,', '3107');
INSERT INTO `area` VALUES ('3114', '2013-01-01 09:03:34', '2013-01-01 09:03:34', null, '新疆维吾尔自治区乌鲁木齐市米东区', '米东区', ',3106,3107,', '3107');
INSERT INTO `area` VALUES ('3115', '2013-01-01 09:03:34', '2013-01-01 09:03:34', null, '新疆维吾尔自治区乌鲁木齐市乌鲁木齐县', '乌鲁木齐县', ',3106,3107,', '3107');
INSERT INTO `area` VALUES ('3116', '2013-01-01 09:03:34', '2013-01-01 09:03:34', null, '新疆维吾尔自治区克拉玛依市', '克拉玛依市', ',3106,', '3106');
INSERT INTO `area` VALUES ('3117', '2013-01-01 09:03:34', '2013-01-01 09:03:34', null, '新疆维吾尔自治区克拉玛依市独山子区', '独山子区', ',3106,3116,', '3116');
INSERT INTO `area` VALUES ('3118', '2013-01-01 09:03:34', '2013-01-01 09:03:34', null, '新疆维吾尔自治区克拉玛依市克拉玛依区', '克拉玛依区', ',3106,3116,', '3116');
INSERT INTO `area` VALUES ('3119', '2013-01-01 09:03:34', '2013-01-01 09:03:34', null, '新疆维吾尔自治区克拉玛依市白碱滩区', '白碱滩区', ',3106,3116,', '3116');
INSERT INTO `area` VALUES ('3120', '2013-01-01 09:03:34', '2013-01-01 09:03:34', null, '新疆维吾尔自治区克拉玛依市乌尔禾区', '乌尔禾区', ',3106,3116,', '3116');
INSERT INTO `area` VALUES ('3121', '2013-01-01 09:03:34', '2013-01-01 09:03:34', null, '新疆维吾尔自治区吐鲁番地区', '吐鲁番地区', ',3106,', '3106');
INSERT INTO `area` VALUES ('3122', '2013-01-01 09:03:34', '2013-01-01 09:03:34', null, '新疆维吾尔自治区吐鲁番地区吐鲁番市', '吐鲁番市', ',3106,3121,', '3121');
INSERT INTO `area` VALUES ('3123', '2013-01-01 09:03:34', '2013-01-01 09:03:34', null, '新疆维吾尔自治区吐鲁番地区鄯善县', '鄯善县', ',3106,3121,', '3121');
INSERT INTO `area` VALUES ('3124', '2013-01-01 09:03:34', '2013-01-01 09:03:34', null, '新疆维吾尔自治区吐鲁番地区托克逊县', '托克逊县', ',3106,3121,', '3121');
INSERT INTO `area` VALUES ('3125', '2013-01-01 09:03:35', '2013-01-01 09:03:35', null, '新疆维吾尔自治区哈密地区', '哈密地区', ',3106,', '3106');
INSERT INTO `area` VALUES ('3126', '2013-01-01 09:03:35', '2013-01-01 09:03:35', null, '新疆维吾尔自治区哈密地区哈密市', '哈密市', ',3106,3125,', '3125');
INSERT INTO `area` VALUES ('3127', '2013-01-01 09:03:35', '2013-01-01 09:03:35', null, '新疆维吾尔自治区哈密地区巴里坤哈萨克自治县', '巴里坤哈萨克自治县', ',3106,3125,', '3125');
INSERT INTO `area` VALUES ('3128', '2013-01-01 09:03:35', '2013-01-01 09:03:35', null, '新疆维吾尔自治区哈密地区伊吾县', '伊吾县', ',3106,3125,', '3125');
INSERT INTO `area` VALUES ('3129', '2013-01-01 09:03:35', '2013-01-01 09:03:35', null, '新疆维吾尔自治区昌吉回族自治州', '昌吉回族自治州', ',3106,', '3106');
INSERT INTO `area` VALUES ('3130', '2013-01-01 09:03:35', '2013-01-01 09:03:35', null, '新疆维吾尔自治区昌吉回族自治州昌吉市', '昌吉市', ',3106,3129,', '3129');
INSERT INTO `area` VALUES ('3131', '2013-01-01 09:03:35', '2013-01-01 09:03:35', null, '新疆维吾尔自治区昌吉回族自治州阜康市', '阜康市', ',3106,3129,', '3129');
INSERT INTO `area` VALUES ('3132', '2013-01-01 09:03:35', '2013-01-01 09:03:35', null, '新疆维吾尔自治区昌吉回族自治州呼图壁县', '呼图壁县', ',3106,3129,', '3129');
INSERT INTO `area` VALUES ('3133', '2013-01-01 09:03:35', '2013-01-01 09:03:35', null, '新疆维吾尔自治区昌吉回族自治州玛纳斯县', '玛纳斯县', ',3106,3129,', '3129');
INSERT INTO `area` VALUES ('3134', '2013-01-01 09:03:35', '2013-01-01 09:03:35', null, '新疆维吾尔自治区昌吉回族自治州奇台县', '奇台县', ',3106,3129,', '3129');
INSERT INTO `area` VALUES ('3135', '2013-01-01 09:03:35', '2013-01-01 09:03:35', null, '新疆维吾尔自治区昌吉回族自治州吉木萨尔县', '吉木萨尔县', ',3106,3129,', '3129');
INSERT INTO `area` VALUES ('3136', '2013-01-01 09:03:35', '2013-01-01 09:03:35', null, '新疆维吾尔自治区昌吉回族自治州木垒哈萨克自治县', '木垒哈萨克自治县', ',3106,3129,', '3129');
INSERT INTO `area` VALUES ('3137', '2013-01-01 09:03:35', '2013-01-01 09:03:35', null, '新疆维吾尔自治区博尔塔拉蒙古自治州', '博尔塔拉蒙古自治州', ',3106,', '3106');
INSERT INTO `area` VALUES ('3138', '2013-01-01 09:03:35', '2013-01-01 09:03:35', null, '新疆维吾尔自治区博尔塔拉蒙古自治州博乐市', '博乐市', ',3106,3137,', '3137');
INSERT INTO `area` VALUES ('3139', '2013-01-01 09:03:35', '2013-01-01 09:03:35', null, '新疆维吾尔自治区博尔塔拉蒙古自治州精河县', '精河县', ',3106,3137,', '3137');
INSERT INTO `area` VALUES ('3140', '2013-01-01 09:03:35', '2013-01-01 09:03:35', null, '新疆维吾尔自治区博尔塔拉蒙古自治州温泉县', '温泉县', ',3106,3137,', '3137');
INSERT INTO `area` VALUES ('3141', '2013-01-01 09:03:35', '2013-01-01 09:03:35', null, '新疆维吾尔自治区巴音郭楞蒙古自治州', '巴音郭楞蒙古自治州', ',3106,', '3106');
INSERT INTO `area` VALUES ('3142', '2013-01-01 09:03:36', '2013-01-01 09:03:36', null, '新疆维吾尔自治区巴音郭楞蒙古自治州库尔勒市', '库尔勒市', ',3106,3141,', '3141');
INSERT INTO `area` VALUES ('3143', '2013-01-01 09:03:36', '2013-01-01 09:03:36', null, '新疆维吾尔自治区巴音郭楞蒙古自治州轮台县', '轮台县', ',3106,3141,', '3141');
INSERT INTO `area` VALUES ('3144', '2013-01-01 09:03:36', '2013-01-01 09:03:36', null, '新疆维吾尔自治区巴音郭楞蒙古自治州尉犁县', '尉犁县', ',3106,3141,', '3141');
INSERT INTO `area` VALUES ('3145', '2013-01-01 09:03:36', '2013-01-01 09:03:36', null, '新疆维吾尔自治区巴音郭楞蒙古自治州若羌县', '若羌县', ',3106,3141,', '3141');
INSERT INTO `area` VALUES ('3146', '2013-01-01 09:03:36', '2013-01-01 09:03:36', null, '新疆维吾尔自治区巴音郭楞蒙古自治州且末县', '且末县', ',3106,3141,', '3141');
INSERT INTO `area` VALUES ('3147', '2013-01-01 09:03:36', '2013-01-01 09:03:36', null, '新疆维吾尔自治区巴音郭楞蒙古自治州焉耆回族自治县', '焉耆回族自治县', ',3106,3141,', '3141');
INSERT INTO `area` VALUES ('3148', '2013-01-01 09:03:36', '2013-01-01 09:03:36', null, '新疆维吾尔自治区巴音郭楞蒙古自治州和静县', '和静县', ',3106,3141,', '3141');
INSERT INTO `area` VALUES ('3149', '2013-01-01 09:03:36', '2013-01-01 09:03:36', null, '新疆维吾尔自治区巴音郭楞蒙古自治州和硕县', '和硕县', ',3106,3141,', '3141');
INSERT INTO `area` VALUES ('3150', '2013-01-01 09:03:36', '2013-01-01 09:03:36', null, '新疆维吾尔自治区巴音郭楞蒙古自治州博湖县', '博湖县', ',3106,3141,', '3141');
INSERT INTO `area` VALUES ('3151', '2013-01-01 09:03:36', '2013-01-01 09:03:36', null, '新疆维吾尔自治区阿克苏地区', '阿克苏地区', ',3106,', '3106');
INSERT INTO `area` VALUES ('3152', '2013-01-01 09:03:36', '2013-01-01 09:03:36', null, '新疆维吾尔自治区阿克苏地区阿克苏市', '阿克苏市', ',3106,3151,', '3151');
INSERT INTO `area` VALUES ('3153', '2013-01-01 09:03:36', '2013-01-01 09:03:36', null, '新疆维吾尔自治区阿克苏地区温宿县', '温宿县', ',3106,3151,', '3151');
INSERT INTO `area` VALUES ('3154', '2013-01-01 09:03:36', '2013-01-01 09:03:36', null, '新疆维吾尔自治区阿克苏地区库车县', '库车县', ',3106,3151,', '3151');
INSERT INTO `area` VALUES ('3155', '2013-01-01 09:03:36', '2013-01-01 09:03:36', null, '新疆维吾尔自治区阿克苏地区沙雅县', '沙雅县', ',3106,3151,', '3151');
INSERT INTO `area` VALUES ('3156', '2013-01-01 09:03:36', '2013-01-01 09:03:36', null, '新疆维吾尔自治区阿克苏地区新和县', '新和县', ',3106,3151,', '3151');
INSERT INTO `area` VALUES ('3157', '2013-01-01 09:03:36', '2013-01-01 09:03:36', null, '新疆维吾尔自治区阿克苏地区拜城县', '拜城县', ',3106,3151,', '3151');
INSERT INTO `area` VALUES ('3158', '2013-01-01 09:03:37', '2013-01-01 09:03:37', null, '新疆维吾尔自治区阿克苏地区乌什县', '乌什县', ',3106,3151,', '3151');
INSERT INTO `area` VALUES ('3159', '2013-01-01 09:03:37', '2013-01-01 09:03:37', null, '新疆维吾尔自治区阿克苏地区阿瓦提县', '阿瓦提县', ',3106,3151,', '3151');
INSERT INTO `area` VALUES ('3160', '2013-01-01 09:03:37', '2013-01-01 09:03:37', null, '新疆维吾尔自治区阿克苏地区柯坪县', '柯坪县', ',3106,3151,', '3151');
INSERT INTO `area` VALUES ('3161', '2013-01-01 09:03:37', '2013-01-01 09:03:37', null, '新疆维吾尔自治区克孜勒苏柯尔克孜自治州', '克孜勒苏柯尔克孜自治州', ',3106,', '3106');
INSERT INTO `area` VALUES ('3162', '2013-01-01 09:03:37', '2013-01-01 09:03:37', null, '新疆维吾尔自治区克孜勒苏柯尔克孜自治州阿图什市', '阿图什市', ',3106,3161,', '3161');
INSERT INTO `area` VALUES ('3163', '2013-01-01 09:03:37', '2013-01-01 09:03:37', null, '新疆维吾尔自治区克孜勒苏柯尔克孜自治州阿克陶县', '阿克陶县', ',3106,3161,', '3161');
INSERT INTO `area` VALUES ('3164', '2013-01-01 09:03:37', '2013-01-01 09:03:37', null, '新疆维吾尔自治区克孜勒苏柯尔克孜自治州阿合奇县', '阿合奇县', ',3106,3161,', '3161');
INSERT INTO `area` VALUES ('3165', '2013-01-01 09:03:37', '2013-01-01 09:03:37', null, '新疆维吾尔自治区克孜勒苏柯尔克孜自治州乌恰县', '乌恰县', ',3106,3161,', '3161');
INSERT INTO `area` VALUES ('3166', '2013-01-01 09:03:37', '2013-01-01 09:03:37', null, '新疆维吾尔自治区喀什地区', '喀什地区', ',3106,', '3106');
INSERT INTO `area` VALUES ('3167', '2013-01-01 09:03:37', '2013-01-01 09:03:37', null, '新疆维吾尔自治区喀什地区喀什市', '喀什市', ',3106,3166,', '3166');
INSERT INTO `area` VALUES ('3168', '2013-01-01 09:03:37', '2013-01-01 09:03:37', null, '新疆维吾尔自治区喀什地区疏附县', '疏附县', ',3106,3166,', '3166');
INSERT INTO `area` VALUES ('3169', '2013-01-01 09:03:37', '2013-01-01 09:03:37', null, '新疆维吾尔自治区喀什地区疏勒县', '疏勒县', ',3106,3166,', '3166');
INSERT INTO `area` VALUES ('3170', '2013-01-01 09:03:37', '2013-01-01 09:03:37', null, '新疆维吾尔自治区喀什地区英吉沙县', '英吉沙县', ',3106,3166,', '3166');
INSERT INTO `area` VALUES ('3171', '2013-01-01 09:03:37', '2013-01-01 09:03:37', null, '新疆维吾尔自治区喀什地区泽普县', '泽普县', ',3106,3166,', '3166');
INSERT INTO `area` VALUES ('3172', '2013-01-01 09:03:37', '2013-01-01 09:03:37', null, '新疆维吾尔自治区喀什地区莎车县', '莎车县', ',3106,3166,', '3166');
INSERT INTO `area` VALUES ('3173', '2013-01-01 09:03:37', '2013-01-01 09:03:37', null, '新疆维吾尔自治区喀什地区叶城县', '叶城县', ',3106,3166,', '3166');
INSERT INTO `area` VALUES ('3174', '2013-01-01 09:03:37', '2013-01-01 09:03:37', null, '新疆维吾尔自治区喀什地区麦盖提县', '麦盖提县', ',3106,3166,', '3166');
INSERT INTO `area` VALUES ('3175', '2013-01-01 09:03:38', '2013-01-01 09:03:38', null, '新疆维吾尔自治区喀什地区岳普湖县', '岳普湖县', ',3106,3166,', '3166');
INSERT INTO `area` VALUES ('3176', '2013-01-01 09:03:38', '2013-01-01 09:03:38', null, '新疆维吾尔自治区喀什地区伽师县', '伽师县', ',3106,3166,', '3166');
INSERT INTO `area` VALUES ('3177', '2013-01-01 09:03:38', '2013-01-01 09:03:38', null, '新疆维吾尔自治区喀什地区巴楚县', '巴楚县', ',3106,3166,', '3166');
INSERT INTO `area` VALUES ('3178', '2013-01-01 09:03:38', '2013-01-01 09:03:38', null, '新疆维吾尔自治区喀什地区塔什库尔干塔吉克自治县', '塔什库尔干塔吉克自治县', ',3106,3166,', '3166');
INSERT INTO `area` VALUES ('3179', '2013-01-01 09:03:38', '2013-01-01 09:03:38', null, '新疆维吾尔自治区和田地区', '和田地区', ',3106,', '3106');
INSERT INTO `area` VALUES ('3180', '2013-01-01 09:03:38', '2013-01-01 09:03:38', null, '新疆维吾尔自治区和田地区和田市', '和田市', ',3106,3179,', '3179');
INSERT INTO `area` VALUES ('3181', '2013-01-01 09:03:38', '2013-01-01 09:03:38', null, '新疆维吾尔自治区和田地区和田县', '和田县', ',3106,3179,', '3179');
INSERT INTO `area` VALUES ('3182', '2013-01-01 09:03:38', '2013-01-01 09:03:38', null, '新疆维吾尔自治区和田地区墨玉县', '墨玉县', ',3106,3179,', '3179');
INSERT INTO `area` VALUES ('3183', '2013-01-01 09:03:38', '2013-01-01 09:03:38', null, '新疆维吾尔自治区和田地区皮山县', '皮山县', ',3106,3179,', '3179');
INSERT INTO `area` VALUES ('3184', '2013-01-01 09:03:38', '2013-01-01 09:03:38', null, '新疆维吾尔自治区和田地区洛浦县', '洛浦县', ',3106,3179,', '3179');
INSERT INTO `area` VALUES ('3185', '2013-01-01 09:03:38', '2013-01-01 09:03:38', null, '新疆维吾尔自治区和田地区策勒县', '策勒县', ',3106,3179,', '3179');
INSERT INTO `area` VALUES ('3186', '2013-01-01 09:03:38', '2013-01-01 09:03:38', null, '新疆维吾尔自治区和田地区于田县', '于田县', ',3106,3179,', '3179');
INSERT INTO `area` VALUES ('3187', '2013-01-01 09:03:38', '2013-01-01 09:03:38', null, '新疆维吾尔自治区和田地区民丰县', '民丰县', ',3106,3179,', '3179');
INSERT INTO `area` VALUES ('3188', '2013-01-01 09:03:38', '2013-01-01 09:03:38', null, '新疆维吾尔自治区伊犁哈萨克自治州', '伊犁哈萨克自治州', ',3106,', '3106');
INSERT INTO `area` VALUES ('3189', '2013-01-01 09:03:38', '2013-01-01 09:03:38', null, '新疆维吾尔自治区伊犁哈萨克自治州伊宁市', '伊宁市', ',3106,3188,', '3188');
INSERT INTO `area` VALUES ('3190', '2013-01-01 09:03:39', '2013-01-01 09:03:39', null, '新疆维吾尔自治区伊犁哈萨克自治州奎屯市', '奎屯市', ',3106,3188,', '3188');
INSERT INTO `area` VALUES ('3191', '2013-01-01 09:03:39', '2013-01-01 09:03:39', null, '新疆维吾尔自治区伊犁哈萨克自治州伊宁县', '伊宁县', ',3106,3188,', '3188');
INSERT INTO `area` VALUES ('3192', '2013-01-01 09:03:39', '2013-01-01 09:03:39', null, '新疆维吾尔自治区伊犁哈萨克自治州察布查尔锡伯自治县', '察布查尔锡伯自治县', ',3106,3188,', '3188');
INSERT INTO `area` VALUES ('3193', '2013-01-01 09:03:39', '2013-01-01 09:03:39', null, '新疆维吾尔自治区伊犁哈萨克自治州霍城县', '霍城县', ',3106,3188,', '3188');
INSERT INTO `area` VALUES ('3194', '2013-01-01 09:03:39', '2013-01-01 09:03:39', null, '新疆维吾尔自治区伊犁哈萨克自治州巩留县', '巩留县', ',3106,3188,', '3188');
INSERT INTO `area` VALUES ('3195', '2013-01-01 09:03:39', '2013-01-01 09:03:39', null, '新疆维吾尔自治区伊犁哈萨克自治州新源县', '新源县', ',3106,3188,', '3188');
INSERT INTO `area` VALUES ('3196', '2013-01-01 09:03:39', '2013-01-01 09:03:39', null, '新疆维吾尔自治区伊犁哈萨克自治州昭苏县', '昭苏县', ',3106,3188,', '3188');
INSERT INTO `area` VALUES ('3197', '2013-01-01 09:03:39', '2013-01-01 09:03:39', null, '新疆维吾尔自治区伊犁哈萨克自治州特克斯县', '特克斯县', ',3106,3188,', '3188');
INSERT INTO `area` VALUES ('3198', '2013-01-01 09:03:39', '2013-01-01 09:03:39', null, '新疆维吾尔自治区伊犁哈萨克自治州尼勒克县', '尼勒克县', ',3106,3188,', '3188');
INSERT INTO `area` VALUES ('3199', '2013-01-01 09:03:39', '2013-01-01 09:03:39', null, '新疆维吾尔自治区塔城地区', '塔城地区', ',3106,', '3106');
INSERT INTO `area` VALUES ('3200', '2013-01-01 09:03:39', '2013-01-01 09:03:39', null, '新疆维吾尔自治区塔城地区塔城市', '塔城市', ',3106,3199,', '3199');
INSERT INTO `area` VALUES ('3201', '2013-01-01 09:03:39', '2013-01-01 09:03:39', null, '新疆维吾尔自治区塔城地区乌苏市', '乌苏市', ',3106,3199,', '3199');
INSERT INTO `area` VALUES ('3202', '2013-01-01 09:03:39', '2013-01-01 09:03:39', null, '新疆维吾尔自治区塔城地区额敏县', '额敏县', ',3106,3199,', '3199');
INSERT INTO `area` VALUES ('3203', '2013-01-01 09:03:39', '2013-01-01 09:03:39', null, '新疆维吾尔自治区塔城地区沙湾县', '沙湾县', ',3106,3199,', '3199');
INSERT INTO `area` VALUES ('3204', '2013-01-01 09:03:40', '2013-01-01 09:03:40', null, '新疆维吾尔自治区塔城地区托里县', '托里县', ',3106,3199,', '3199');
INSERT INTO `area` VALUES ('3205', '2013-01-01 09:03:40', '2013-01-01 09:03:40', null, '新疆维吾尔自治区塔城地区裕民县', '裕民县', ',3106,3199,', '3199');
INSERT INTO `area` VALUES ('3206', '2013-01-01 09:03:40', '2013-01-01 09:03:40', null, '新疆维吾尔自治区塔城地区和布克赛尔蒙古自治县', '和布克赛尔蒙古自治县', ',3106,3199,', '3199');
INSERT INTO `area` VALUES ('3207', '2013-01-01 09:03:40', '2013-01-01 09:03:40', null, '新疆维吾尔自治区阿勒泰地区', '阿勒泰地区', ',3106,', '3106');
INSERT INTO `area` VALUES ('3208', '2013-01-01 09:03:40', '2013-01-01 09:03:40', null, '新疆维吾尔自治区阿勒泰地区阿勒泰市', '阿勒泰市', ',3106,3207,', '3207');
INSERT INTO `area` VALUES ('3209', '2013-01-01 09:03:40', '2013-01-01 09:03:40', null, '新疆维吾尔自治区阿勒泰地区布尔津县', '布尔津县', ',3106,3207,', '3207');
INSERT INTO `area` VALUES ('3210', '2013-01-01 09:03:40', '2013-01-01 09:03:40', null, '新疆维吾尔自治区阿勒泰地区富蕴县', '富蕴县', ',3106,3207,', '3207');
INSERT INTO `area` VALUES ('3211', '2013-01-01 09:03:40', '2013-01-01 09:03:40', null, '新疆维吾尔自治区阿勒泰地区福海县', '福海县', ',3106,3207,', '3207');
INSERT INTO `area` VALUES ('3212', '2013-01-01 09:03:40', '2013-01-01 09:03:40', null, '新疆维吾尔自治区阿勒泰地区哈巴河县', '哈巴河县', ',3106,3207,', '3207');
INSERT INTO `area` VALUES ('3213', '2013-01-01 09:03:40', '2013-01-01 09:03:40', null, '新疆维吾尔自治区阿勒泰地区青河县', '青河县', ',3106,3207,', '3207');
INSERT INTO `area` VALUES ('3214', '2013-01-01 09:03:40', '2013-01-01 09:03:40', null, '新疆维吾尔自治区阿勒泰地区吉木乃县', '吉木乃县', ',3106,3207,', '3207');
INSERT INTO `area` VALUES ('3215', '2013-01-01 09:03:40', '2013-01-01 09:03:40', null, '新疆维吾尔自治区石河子市', '石河子市', ',3106,', '3106');
INSERT INTO `area` VALUES ('3216', '2013-01-01 09:03:40', '2013-01-01 09:03:40', null, '新疆维吾尔自治区阿拉尔市', '阿拉尔市', ',3106,', '3106');
INSERT INTO `area` VALUES ('3217', '2013-01-01 09:03:40', '2013-01-01 09:03:40', null, '新疆维吾尔自治区图木舒克市', '图木舒克市', ',3106,', '3106');
INSERT INTO `area` VALUES ('3218', '2013-01-01 09:03:40', '2013-01-01 09:03:40', null, '新疆维吾尔自治区五家渠市', '五家渠市', ',3106,', '3106');
INSERT INTO `area` VALUES ('3219', '2013-01-01 13:12:54', '2013-01-01 13:12:54', null, '台湾省', '台湾省', ',', null);
INSERT INTO `area` VALUES ('3220', '2013-01-01 13:13:21', '2013-01-01 13:13:21', null, '台湾省台北市', '台北市', ',3219,', '3219');
INSERT INTO `area` VALUES ('3221', '2013-01-01 13:13:27', '2013-01-01 13:13:27', null, '台湾省高雄市', '高雄市', ',3219,', '3219');
INSERT INTO `area` VALUES ('3222', '2013-01-01 13:13:32', '2013-01-01 13:13:32', null, '台湾省台南市', '台南市', ',3219,', '3219');
INSERT INTO `area` VALUES ('3223', '2013-01-01 13:13:37', '2013-01-01 13:13:37', null, '台湾省台中市', '台中市', ',3219,', '3219');
INSERT INTO `area` VALUES ('3224', '2013-01-01 13:13:43', '2013-01-01 13:13:43', null, '台湾省金门县', '金门县', ',3219,', '3219');
INSERT INTO `area` VALUES ('3225', '2013-01-01 13:13:49', '2013-01-01 13:13:49', null, '台湾省南投县', '南投县', ',3219,', '3219');
INSERT INTO `area` VALUES ('3226', '2013-01-01 13:13:54', '2013-01-01 13:13:54', null, '台湾省基隆市', '基隆市', ',3219,', '3219');
INSERT INTO `area` VALUES ('3227', '2013-01-01 13:14:00', '2013-01-01 13:14:00', null, '台湾省新竹市', '新竹市', ',3219,', '3219');
INSERT INTO `area` VALUES ('3228', '2013-01-01 13:14:13', '2013-01-01 13:14:13', null, '台湾省嘉义市', '嘉义市', ',3219,', '3219');
INSERT INTO `area` VALUES ('3229', '2013-01-01 13:14:20', '2013-01-01 13:14:20', null, '台湾省新北市', '新北市', ',3219,', '3219');
INSERT INTO `area` VALUES ('3230', '2013-01-01 13:14:25', '2013-01-01 13:14:25', null, '台湾省宜兰县', '宜兰县', ',3219,', '3219');
INSERT INTO `area` VALUES ('3231', '2013-01-01 13:14:30', '2013-01-01 13:14:30', null, '台湾省新竹县', '新竹县', ',3219,', '3219');
INSERT INTO `area` VALUES ('3232', '2013-01-01 13:14:36', '2013-01-01 13:14:36', null, '台湾省桃园县', '桃园县', ',3219,', '3219');
INSERT INTO `area` VALUES ('3233', '2013-01-01 13:14:45', '2013-01-01 13:14:45', null, '台湾省苗栗县', '苗栗县', ',3219,', '3219');
INSERT INTO `area` VALUES ('3234', '2013-01-01 13:14:51', '2013-01-01 13:14:51', null, '台湾省彰化县', '彰化县', ',3219,', '3219');
INSERT INTO `area` VALUES ('3235', '2013-01-01 13:14:56', '2013-01-01 13:14:56', null, '台湾省嘉义县', '嘉义县', ',3219,', '3219');
INSERT INTO `area` VALUES ('3236', '2013-01-01 13:15:01', '2013-01-01 13:15:01', null, '台湾省云林县', '云林县', ',3219,', '3219');
INSERT INTO `area` VALUES ('3237', '2013-01-01 13:15:06', '2013-01-01 13:15:06', null, '台湾省屏东县', '屏东县', ',3219,', '3219');
INSERT INTO `area` VALUES ('3238', '2013-01-01 13:15:11', '2013-01-01 13:15:11', null, '台湾省台东县', '台东县', ',3219,', '3219');
INSERT INTO `area` VALUES ('3239', '2013-01-01 13:15:18', '2013-01-01 13:15:18', null, '台湾省花莲县', '花莲县', ',3219,', '3219');
INSERT INTO `area` VALUES ('3240', '2013-01-01 13:15:24', '2013-01-01 13:15:24', null, '台湾省澎湖县', '澎湖县', ',3219,', '3219');
INSERT INTO `area` VALUES ('3241', '2013-01-01 13:17:28', '2013-01-01 13:17:28', null, '台湾省台北市中正区', '中正区', ',3219,3220,', '3220');
INSERT INTO `area` VALUES ('3242', '2013-01-01 13:17:35', '2013-01-01 13:17:35', null, '台湾省台北市大同区', '大同区', ',3219,3220,', '3220');
INSERT INTO `area` VALUES ('3243', '2013-01-01 13:17:40', '2013-01-01 13:17:40', null, '台湾省台北市中山区', '中山区', ',3219,3220,', '3220');
INSERT INTO `area` VALUES ('3244', '2013-01-01 13:17:46', '2013-01-01 13:17:46', null, '台湾省台北市松山区', '松山区', ',3219,3220,', '3220');
INSERT INTO `area` VALUES ('3245', '2013-01-01 13:17:51', '2013-01-01 13:17:51', null, '台湾省台北市大安区', '大安区', ',3219,3220,', '3220');
INSERT INTO `area` VALUES ('3246', '2013-01-01 13:17:56', '2013-01-01 13:17:56', null, '台湾省台北市万华区', '万华区', ',3219,3220,', '3220');
INSERT INTO `area` VALUES ('3247', '2013-01-01 13:18:02', '2013-01-01 13:18:02', null, '台湾省台北市信义区', '信义区', ',3219,3220,', '3220');
INSERT INTO `area` VALUES ('3248', '2013-01-01 13:18:07', '2013-01-01 13:18:07', null, '台湾省台北市士林区', '士林区', ',3219,3220,', '3220');
INSERT INTO `area` VALUES ('3249', '2013-01-01 13:18:12', '2013-01-01 13:18:12', null, '台湾省台北市北投区', '北投区', ',3219,3220,', '3220');
INSERT INTO `area` VALUES ('3250', '2013-01-01 13:18:23', '2013-01-01 13:18:23', null, '台湾省台北市内湖区', '内湖区', ',3219,3220,', '3220');
INSERT INTO `area` VALUES ('3251', '2013-01-01 13:18:28', '2013-01-01 13:18:28', null, '台湾省台北市南港区', '南港区', ',3219,3220,', '3220');
INSERT INTO `area` VALUES ('3252', '2013-01-01 13:18:34', '2013-01-01 13:18:34', null, '台湾省台北市文山区', '文山区', ',3219,3220,', '3220');
INSERT INTO `area` VALUES ('3253', '2013-01-01 13:18:58', '2013-01-01 13:18:58', null, '台湾省嘉义县东区', '东区', ',3219,3235,', '3235');
INSERT INTO `area` VALUES ('3254', '2013-01-01 13:19:03', '2013-01-01 13:19:03', null, '台湾省嘉义县西区', '西区', ',3219,3235,', '3235');
INSERT INTO `area` VALUES ('3255', '2013-01-01 13:20:02', '2013-01-01 13:20:02', null, '台湾省高雄市新兴区', '新兴区', ',3219,3221,', '3221');
INSERT INTO `area` VALUES ('3256', '2013-01-01 13:20:08', '2013-01-01 13:20:08', null, '台湾省高雄市前金区', '前金区', ',3219,3221,', '3221');
INSERT INTO `area` VALUES ('3257', '2013-01-01 13:20:13', '2013-01-01 13:20:13', null, '台湾省高雄市芩雅区', '芩雅区', ',3219,3221,', '3221');
INSERT INTO `area` VALUES ('3258', '2013-01-01 13:20:18', '2013-01-01 13:20:18', null, '台湾省高雄市盐埕区', '盐埕区', ',3219,3221,', '3221');
INSERT INTO `area` VALUES ('3259', '2013-01-01 13:20:24', '2013-01-01 13:20:24', null, '台湾省高雄市鼓山区', '鼓山区', ',3219,3221,', '3221');
INSERT INTO `area` VALUES ('3260', '2013-01-01 13:20:31', '2013-01-01 13:20:31', null, '台湾省高雄市旗津区', '旗津区', ',3219,3221,', '3221');
INSERT INTO `area` VALUES ('3261', '2013-01-01 13:20:37', '2013-01-01 13:20:37', null, '台湾省高雄市前镇区', '前镇区', ',3219,3221,', '3221');
INSERT INTO `area` VALUES ('3262', '2013-01-01 13:20:42', '2013-01-01 13:20:42', null, '台湾省高雄市三民区', '三民区', ',3219,3221,', '3221');
INSERT INTO `area` VALUES ('3263', '2013-01-01 13:20:47', '2013-01-01 13:20:47', null, '台湾省高雄市左营区', '左营区', ',3219,3221,', '3221');
INSERT INTO `area` VALUES ('3264', '2013-01-01 13:20:55', '2013-01-01 13:20:55', null, '台湾省高雄市楠梓区', '楠梓区', ',3219,3221,', '3221');
INSERT INTO `area` VALUES ('3265', '2013-01-01 13:20:59', '2013-01-01 13:20:59', null, '台湾省高雄市小港区', '小港区', ',3219,3221,', '3221');
INSERT INTO `area` VALUES ('3266', '2013-01-01 13:21:19', '2013-01-01 13:21:19', null, '台湾省基隆市仁爱区', '仁爱区', ',3219,3226,', '3226');
INSERT INTO `area` VALUES ('3267', '2013-01-01 13:21:24', '2013-01-01 13:21:24', null, '台湾省基隆市信义区', '信义区', ',3219,3226,', '3226');
INSERT INTO `area` VALUES ('3268', '2013-01-01 13:21:31', '2013-01-01 13:21:31', null, '台湾省基隆市中正区', '中正区', ',3219,3226,', '3226');
INSERT INTO `area` VALUES ('3269', '2013-01-01 13:21:36', '2013-01-01 13:21:36', null, '台湾省基隆市中山区', '中山区', ',3219,3226,', '3226');
INSERT INTO `area` VALUES ('3270', '2013-01-01 13:21:42', '2013-01-01 13:21:42', null, '台湾省基隆市安乐区', '安乐区', ',3219,3226,', '3226');
INSERT INTO `area` VALUES ('3271', '2013-01-01 13:21:47', '2013-01-01 13:21:47', null, '台湾省基隆市暖暖区', '暖暖区', ',3219,3226,', '3226');
INSERT INTO `area` VALUES ('3272', '2013-01-01 13:21:53', '2013-01-01 13:21:53', null, '台湾省基隆市七堵区', '七堵区', ',3219,3226,', '3226');
INSERT INTO `area` VALUES ('3273', '2013-01-01 13:22:17', '2013-01-01 13:22:17', null, '台湾省台南市中西区', '中西区', ',3219,3222,', '3222');
INSERT INTO `area` VALUES ('3274', '2013-01-01 13:22:23', '2013-01-01 13:22:23', null, '台湾省台南市东区', '东区', ',3219,3222,', '3222');
INSERT INTO `area` VALUES ('3275', '2013-01-01 13:22:28', '2013-01-01 13:22:28', null, '台湾省台南市南区', '南区', ',3219,3222,', '3222');
INSERT INTO `area` VALUES ('3276', '2013-01-01 13:22:33', '2013-01-01 13:22:33', null, '台湾省台南市北区', '北区', ',3219,3222,', '3222');
INSERT INTO `area` VALUES ('3277', '2013-01-01 13:22:39', '2013-01-01 13:22:39', null, '台湾省台南市安平区', '安平区', ',3219,3222,', '3222');
INSERT INTO `area` VALUES ('3278', '2013-01-01 13:22:44', '2013-01-01 13:22:44', null, '台湾省台南市安南区', '安南区', ',3219,3222,', '3222');
INSERT INTO `area` VALUES ('3279', '2013-01-01 13:22:58', '2013-01-01 13:22:58', null, '台湾省新竹市东区', '东区', ',3219,3227,', '3227');
INSERT INTO `area` VALUES ('3280', '2013-01-01 13:23:03', '2013-01-01 13:23:03', null, '台湾省新竹市北区', '北区', ',3219,3227,', '3227');
INSERT INTO `area` VALUES ('3281', '2013-01-01 13:23:11', '2013-01-01 13:23:11', null, '台湾省新竹市香山区', '香山区', ',3219,3227,', '3227');
INSERT INTO `area` VALUES ('3282', '2013-01-01 13:23:24', '2013-01-01 13:38:40', null, '台湾省台中市中区', '中区', ',3219,3223,', '3223');
INSERT INTO `area` VALUES ('3283', '2013-01-01 13:23:39', '2013-01-01 13:23:39', null, '台湾省台中市东区', '东区', ',3219,3223,', '3223');
INSERT INTO `area` VALUES ('3284', '2013-01-01 13:23:47', '2013-01-01 13:23:47', null, '台湾省台中市南区', '南区', ',3219,3223,', '3223');
INSERT INTO `area` VALUES ('3285', '2013-01-01 13:23:53', '2013-01-01 13:23:53', null, '台湾省台中市西区', '西区', ',3219,3223,', '3223');
INSERT INTO `area` VALUES ('3286', '2013-01-01 13:23:59', '2013-01-01 13:23:59', null, '台湾省台中市北区', '北区', ',3219,3223,', '3223');
INSERT INTO `area` VALUES ('3287', '2013-01-01 13:24:15', '2013-01-01 13:24:15', null, '台湾省台中市北屯区', '北屯区', ',3219,3223,', '3223');
INSERT INTO `area` VALUES ('3288', '2013-01-01 13:24:20', '2013-01-01 13:24:20', null, '台湾省台中市西屯区', '西屯区', ',3219,3223,', '3223');
INSERT INTO `area` VALUES ('3289', '2013-01-01 13:24:26', '2013-01-01 13:24:26', null, '台湾省台中市南屯区', '南屯区', ',3219,3223,', '3223');
INSERT INTO `area` VALUES ('3290', '2013-01-01 13:24:38', '2013-01-01 13:24:38', null, '台湾省嘉义市东区', '东区', ',3219,3228,', '3228');
INSERT INTO `area` VALUES ('3291', '2013-01-01 13:24:44', '2013-01-01 13:24:44', null, '台湾省嘉义市西区', '西区', ',3219,3228,', '3228');
INSERT INTO `area` VALUES ('3292', '2013-01-01 13:29:18', '2013-01-01 13:29:18', null, '香港特别行政区', '香港特别行政区', ',', null);
INSERT INTO `area` VALUES ('3293', '2013-01-01 13:29:33', '2013-01-01 13:29:33', null, '香港特别行政区香港岛', '香港岛', ',3292,', '3292');
INSERT INTO `area` VALUES ('3294', '2013-01-01 13:29:38', '2013-01-01 13:29:38', null, '香港特别行政区九龙', '九龙', ',3292,', '3292');
INSERT INTO `area` VALUES ('3295', '2013-01-01 13:29:42', '2013-01-01 13:29:42', null, '香港特别行政区新界', '新界', ',3292,', '3292');
INSERT INTO `area` VALUES ('3296', '2013-01-01 13:30:05', '2013-01-01 13:30:05', null, '香港特别行政区九龙九龙城区', '九龙城区', ',3292,3294,', '3294');
INSERT INTO `area` VALUES ('3297', '2013-01-01 13:30:12', '2013-01-01 13:30:12', null, '香港特别行政区九龙油尖旺区', '油尖旺区', ',3292,3294,', '3294');
INSERT INTO `area` VALUES ('3298', '2013-01-01 13:30:18', '2013-01-01 13:30:18', null, '香港特别行政区九龙深水埗区', '深水埗区', ',3292,3294,', '3294');
INSERT INTO `area` VALUES ('3299', '2013-01-01 13:30:24', '2013-01-01 13:30:24', null, '香港特别行政区九龙黄大仙区', '黄大仙区', ',3292,3294,', '3294');
INSERT INTO `area` VALUES ('3300', '2013-01-01 13:30:33', '2013-01-01 13:30:33', null, '香港特别行政区九龙观塘区', '观塘区', ',3292,3294,', '3294');
INSERT INTO `area` VALUES ('3301', '2013-01-01 13:30:44', '2013-01-01 13:30:44', null, '香港特别行政区香港岛中西区', '中西区', ',3292,3293,', '3293');
INSERT INTO `area` VALUES ('3302', '2013-01-01 13:30:49', '2013-01-01 13:30:49', null, '香港特别行政区香港岛湾仔', '湾仔', ',3292,3293,', '3293');
INSERT INTO `area` VALUES ('3303', '2013-01-01 13:30:54', '2013-01-01 13:30:54', null, '香港特别行政区香港岛东区', '东区', ',3292,3293,', '3293');
INSERT INTO `area` VALUES ('3304', '2013-01-01 13:30:59', '2013-01-01 13:30:59', null, '香港特别行政区香港岛南区', '南区', ',3292,3293,', '3293');
INSERT INTO `area` VALUES ('3305', '2013-01-01 13:31:12', '2013-01-01 13:31:12', null, '香港特别行政区新界北区', '北区', ',3292,3295,', '3295');
INSERT INTO `area` VALUES ('3306', '2013-01-01 13:31:20', '2013-01-01 13:31:20', null, '香港特别行政区新界大埔区', '大埔区', ',3292,3295,', '3295');
INSERT INTO `area` VALUES ('3307', '2013-01-01 13:31:25', '2013-01-01 13:31:25', null, '香港特别行政区新界沙田区', '沙田区', ',3292,3295,', '3295');
INSERT INTO `area` VALUES ('3308', '2013-01-01 13:31:30', '2013-01-01 13:31:30', null, '香港特别行政区新界西贡区', '西贡区', ',3292,3295,', '3295');
INSERT INTO `area` VALUES ('3309', '2013-01-01 13:31:35', '2013-01-01 13:31:35', null, '香港特别行政区新界元朗区', '元朗区', ',3292,3295,', '3295');
INSERT INTO `area` VALUES ('3310', '2013-01-01 13:31:41', '2013-01-01 13:31:41', null, '香港特别行政区新界屯门区', '屯门区', ',3292,3295,', '3295');
INSERT INTO `area` VALUES ('3311', '2013-01-01 13:31:46', '2013-01-01 13:31:46', null, '香港特别行政区新界荃湾区', '荃湾区', ',3292,3295,', '3295');
INSERT INTO `area` VALUES ('3312', '2013-01-01 13:31:52', '2013-01-01 13:31:52', null, '香港特别行政区新界葵青区', '葵青区', ',3292,3295,', '3295');
INSERT INTO `area` VALUES ('3313', '2013-01-01 13:31:57', '2013-01-01 13:31:57', null, '香港特别行政区新界离岛区', '离岛区', ',3292,3295,', '3295');
INSERT INTO `area` VALUES ('3314', '2013-01-01 13:33:03', '2013-01-01 13:33:03', null, '澳门特别行政区', '澳门特别行政区', ',', null);
INSERT INTO `area` VALUES ('3315', '2013-01-01 13:33:23', '2013-01-01 13:33:23', null, '澳门特别行政区澳门半岛', '澳门半岛', ',3314,', '3314');
INSERT INTO `area` VALUES ('3316', '2013-01-01 13:33:28', '2013-01-01 13:33:28', null, '澳门特别行政区离岛', '离岛', ',3314,', '3314');
INSERT INTO `article` VALUES ('1', '2013-01-01 20:17:08', '2013-01-01 13:37:52', null, '<p>\r\n	用户购物流程如下：\r\n</p>\r\n<img src=\"http://storage.shopxx.net/demo-image/3.0/201301/8e486c07-1365-4fa7-bc62-a40340e0ba59.jpg\" />', '16', '', '', null, null, null, '购物流程', '3');
INSERT INTO `article` VALUES ('2', '2013-01-01 20:23:07', '2013-01-01 13:37:52', null, '会员等级共分为：注册会员、铜牌会员、银牌会员、金牌会员，会员等级晋升均由系统自动实现，无需申请。', '5', '', '', null, null, null, '会员等级', '3');
INSERT INTO `article` VALUES ('3', '2013-01-01 20:37:20', '2013-01-01 13:37:52', null, '进入网站首页，点击页面右上方的“注册”链接，将进入会员注册页面，输入您的用户名、密码等信息后点击“注册”按钮即可完成注册。注册成功后，您可以进入“会员中心 - 个人资料”进行个人信息的修改。', '4', '', '', null, null, null, '新用户注册', '3');
INSERT INTO `article` VALUES ('4', '2013-01-01 10:57:50', '2013-01-01 13:37:52', null, '预存款是商城为方便用户支付而设计开发的支付方式，方便、快捷无任何手续费。您可以先将货款充值到预存款帐户中，在订单支付的过程中可以用此方式来进行支付，同样，如果订单发生退换货产生退款时，也可以退到您的预存款帐户中，以便您下次支付时使用。', '4', '', '', null, null, null, '预存款支付', '3');
INSERT INTO `article` VALUES ('5', '2013-01-01 11:06:37', '2013-01-01 13:17:36', null, '退换货说明:<br />\r\n&nbsp;<br />\r\n一、 退换货总则：<br />\r\n商城所售商品都是正品行货。商城所有商家将严格按照国家三包政策，针对所售商品履行保修、换货和退货的义务。 <br />\r\n&nbsp;<br />\r\n1.符合以下情况，由您实际收到货物日期起7日内可退货；您实际收到货物日期起8日至第15日内可换货：<br />\r\n&nbsp;&nbsp;&nbsp;&nbsp; 1）国家三包所规定的功能性故障<br />\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 经由生产厂家指定或特约售后服务中心检测确认故障属实，并出据出检报告证实。<br />\r\n&nbsp;&nbsp;&nbsp;&nbsp; 2）到货物品坏损或缺件情况<br />\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 经售后人员核查情况属实（期间可能需要快递人员证明或要求您提供实物照片等，以便售后人员快速做出判断及时处理）。<br />\r\n&nbsp;<br />\r\n2.由您实际收到货物日期起15日以上，为了不耽误您使用，缩短故障商品的维修时间，建议您在商品出现故障时直接联系当地厂商维修网点处理。请访问厂商官方网站或拨打厂商服务热线，咨询维修网点信息，凭借发票可到网点维修。国家三包规定保修期内，无品牌厂商售后服务产品，商城提供免费维修服务。<br />\r\n&nbsp;<br />\r\n二、补充说明：<br />\r\n1.以下情况不在退货、换货、维修范围之内：<br />\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;1）任何非商城出售的商品；<br />\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2）对于过保商品（超过三包保修期的商品）；<br />\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;3）未经授权的维修、误用、碰撞、疏忽、滥用、进液、事故、改动、不正确的安装所造成的商品质量问题，或撕毁、涂改标贴、机器序号、防伪标记；<br />\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;4）商品的外包装、附件、赠品（券）、说明书不完整，（券）发票缺失或涂改；<br />\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;5）商品使用正常磨损；<br />\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;6）手机、数码、IT类商品通过软件升级可以排除的故障不属于三包范围内的故障，只要送至当地生产厂家指定或特约售后服务中心升级即可；<br />\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;7）高端品牌箱包及饰品QC标签已损坏的；<br />\r\n&nbsp;&nbsp;&nbsp;&nbsp; 8）出于安全和卫生考虑，贴身用品（内衣等）、食品、化妆品售出后不予退换，经权威部门检测商品存在内在质量问题者除外。<br />\r\n&nbsp;<br />\r\n2.判断实际收货日期规则：<br />\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;1）快递配送或者自提的订单：以客户实际签收日期为准；<br />\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2）非配送的订单，按照第三方物流平台显示的实际到货日期为准。如果第三方合作伙伴不能有效返回签收日期，则商城客服根据距离等因素和客户人工确认实际到货日期。<br />\r\n&nbsp;<br />\r\n商城按照国家相关法律法规及规章制度对商品退换原则进行解释。<br />', '5', '', '', null, null, null, '退换货政策', '3');
INSERT INTO `article` VALUES ('6', '2013-01-01 11:30:27', '2013-01-01 13:41:06', null, '<p>\r\n	发票注意事项：\r\n</p>\r\n<p>\r\n	1.为了保障消费者的合法权益，在商城购物时，均为您开具由税务局监制印制的正规机打销售发票（海外代购商品除外）; <br />\r\n2.发票是有效交易的重要凭据，可作为单位报销的凭证，也能保证您充分享受到我司提供的售后服务，请妥善保管; <br />\r\n3.我们将随订单为您开具发票，发票内容为您所购买的商品明细，发票金额为您购买商品实际的付款金额;\r\n</p>\r\n<p>\r\n	4.请在订单提交时确认好您所需开具的发票抬头，订单生成后发票抬头将无法再次修改。\r\n</p>\r\n<p>\r\n	&nbsp;\r\n</p>\r\n<p>\r\n	发票开具办法：\r\n</p>\r\n<p>\r\n	1.填写订单信息时请勾选发票，并在下订单时准确填写所需开具的发票抬头名称；\r\n</p>\r\n<p>\r\n	2.发票将随商品一同寄出，收货时请注意查收发票；\r\n</p>\r\n<p>\r\n	&nbsp;\r\n</p>\r\n<p>\r\n	如有相关发票开具以及换票问题，请与商城客服联系，客服人员将竭诚为您服务；\r\n</p>', '2', '', '', null, null, null, '发票制度', '3');
INSERT INTO `article` VALUES ('7', '2013-01-01 11:43:00', '2013-01-01 13:37:52', null, '<p>\r\n	货到付款：\r\n</p>\r\n<p>\r\n	配送人员将货物送达订单指定的收货地址后，由客户支付订单金额给配送人员的一种付款方式。\r\n</p>\r\n<p>\r\n	<br />\r\n在商城购物您可以选择货到付款的支付方式，目前货到付款支持现金支付、移动POS刷卡支付等。\r\n</p>\r\n<p>\r\n	您在使用货到付款支付方式时，请在购物车支付方式处选择货到付款，订单生成后，货到付款的支付形式不能更换成其他支付方式，如果您想换成其他支付方式时，请务必删除原货到付款订单，重新在网站下订单选择其他支付方式。\r\n</p>\r\n<p>\r\n	&nbsp;\r\n</p>\r\n<p>\r\n	温馨提示：\r\n</p>\r\n<p>\r\n	1.当您选择货到付款支付方式生成订单后，商城工作人员会根据您的订购要求，为您发货，货物到达您指定地点后，会有工作人员通过电话方式与您联系，在您确认后，根据您的要求将货物送达，请您做好支付准备，以提高收货效率；<br />\r\n2.签收时，请您仔细核对款项、务必做到货款两清，若事后发现款项错误，我们将无法再核实确认；\r\n</p>', '5', '', '', null, null, null, '货到付款', '3');
INSERT INTO `article` VALUES ('8', '2013-01-01 11:51:04', '2013-01-01 13:53:46', null, '承担商城各类产品的售后服务，致力于为广大消费者提供“亲切、快捷、周到”优质阳光服务。多年来我们一直秉承“至真至诚，服务第一；服务是我们的唯一产品，顾客满意是我们服务的终极目标、服务理念。我们提出“服务与责任”理念，把服务责任化，真正地把消费者的利益放在第一位。深层次地挖掘服务精髓，致力专心、专注、专业化服务。', '3', '', '', null, null, null, '服务理念', '3');
INSERT INTO `article` VALUES ('9', '2013-01-01 13:18:50', '2013-01-01 15:13:45', null, '<p>\r\n	登陆后，进入“会员中心”可查询到订单状态。&nbsp;<br />\r\n&nbsp;<br />\r\n1、等待付款：请您支付订单款项，若订单尚未获得确认，正常工作时间内，最迟2小时可以获得确认，如非正常工作时间，需要等到上班时间确认。<br />\r\n&nbsp;\r\n</p>\r\n<p>\r\n	3、已支付/等待发货：这时订单已在我们工作人员的处理流程中。<br />\r\n&nbsp;\r\n</p>\r\n<p>\r\n	4、已支付/已发货：您的货物已经发出，请您稍后注意查收，订单详细中可查到快递公司和快递单号。<br />\r\n&nbsp;<br />\r\n5、订单完成：订单已成功完成交易，请对我们的商品进行评论，如收到产品有质量问题，请直接与售后部门联系。\r\n</p>', '2', '', '', null, null, null, '订单查询', '3');
INSERT INTO `article` VALUES ('10', '2013-01-01 13:34:35', '2013-01-01 14:41:58', null, '<p>\r\n	配送范围：全国各地。<br />\r\n&nbsp;\r\n</p>\r\n<p>\r\n	配送方式：普通快递、自营快递、EMS。<br />\r\n&nbsp;<br />\r\n1. 商品购买时根据会员所选配送方式为您安排。<br />\r\n&nbsp;<br />\r\n2. 选择快递的配送方式，系统会默认为申通快递。<br />\r\n&nbsp;<br />\r\n收货时间：因所在地区不同而略有差异<br />\r\n&nbsp;<br />\r\n对于一些送货上门，货到付款的；如果您在签收前发现商品有运输损坏问题，可直接拒收并与我们取得联系，商城会重新安排为您配送。外地订单在您签收前，如果发现商品有运输损坏问题，您也可以拒收包裹，写明原因，通过邮局把货返回给我们，我们在收到您退回的包裹后，会征求您的意见决定是否重新安排邮寄。<br />\r\n&nbsp;<br />\r\n配货时限解释：<br />\r\n&nbsp;<br />\r\n1.订单一般在 1-2 天内可以确认完毕，若产品缺货将及时通知您。<br />\r\n&nbsp;<br />\r\n2.配送时限是从订单状态处理到正在送货次日开始计时。不同的配送方式会有不同的配送时限。<br />\r\n&nbsp;<br />\r\n3.如您提供的联系方式或送货地址不正确,将会影响我们配送的速度。为了加快配送速度，请您提供尽可能准确的送货地址信息和联系方式；对于需要送货上门服务的，请不要仅提供信箱号，否则无法为您进行配送。如果您留的送货地址为单位地址，请特别注明您可以收货的时间，如遇到国家法定假日，无特殊说明则送货期限顺延。\r\n</p>', '2', '', '', null, null, null, '配送方式', '3');
INSERT INTO `article` VALUES ('11', '2013-01-01 13:41:28', '2013-01-01 14:28:51', null, '<p>\r\n	会员级别分四级，具体为：普通会员、银牌会员、金牌会员、白金会员，会员级别晋升均由系统自动实现，无需申请。\r\n</p>\r\n<p>\r\n	普通会员：<br />\r\n条件：任何愿意到商城购物的用户都可以免费注册。<br />\r\n待遇：可以享受注册会员所能购买的产品及服务。\r\n</p>\r\n<p>\r\n	银牌会员：<br />\r\n条件：商城消费金额达到1000元的会员。<br />\r\n待遇：购买的产品可以享受相应优惠折扣。<br />\r\n&nbsp;<br />\r\n金牌会员：<br />\r\n条件：商城消费金额达到10000元的会员。<br />\r\n待遇：购买的产品可以享受相应优惠折扣。<br />\r\n&nbsp;<br />\r\n白金会员：<br />\r\n条件：商城消费金额达到10000元的会员。<br />\r\n待遇：购买的产品可以享受相应优惠折扣。<br />\r\n&nbsp;<br />\r\n注：针对各个级别会员特别声明：<br />\r\n会员账号禁止转借或转让他人使用，如因转借或转让他人使用所带来的一切后果，商城概不负责。\r\n</p>\r\n<p>\r\n	<br />\r\n&nbsp;\r\n</p>', '2', '', '', null, null, null, '会员级别', '3');
INSERT INTO `article` VALUES ('12', '2013-01-01 13:48:26', '2013-01-01 14:04:13', null, '<p>\r\n	客户在接受商品订购与送货的同时，有义务遵守以下交易条款。您在商城下订单之前或接受商城送货之前，请您仔细阅读以下条款：\r\n</p>\r\n<p>\r\n	<br />\r\n1.订购的商品价格以您下订单时价格为准。<br />\r\n&nbsp;<br />\r\n2.请清楚准确地填写您的真实姓名、送货地址及联系方式。因如下情况造成订单延迟或无法配送等，商城将不承担责任：<br />\r\na. 客户提供错误信息和不详细的地址; <br />\r\nb. 货物送达无人签收，由此造成的重复配送所产生的费用及相关的后果; <br />\r\nc. 不可抗力，例如：自然灾害、交通戒严、突发战争等。<br />\r\n&nbsp;<br />\r\n安全性：\r\n</p>\r\n<p>\r\n	无论您是通过哪种方式支付、购买，我们会保证交易信息的安全，并由商城授权的员工处理您的订单。<br />\r\n&nbsp;<br />\r\n隐私权：\r\n</p>\r\n<p>\r\n	我们尊重您的隐私权，在任何情况下，我们都不会将您的个人和订单信息出售或泄露给任何第三方（国家司法机关调取除外）。我们从网站上或电话中得到的所有客户信息仅用来处理您的相关订单。<br />\r\n&nbsp;<br />\r\n免责：\r\n</p>\r\n<p>\r\n	如因不可抗力或其它无法控制的原因使商城销售系统崩溃或无法正常使用导致网上交易无法完成或丢失有关的信息、记录等，我们会尽可能合理地协助处理善后事宜，并努力使客户免受经济损失。<br />\r\n&nbsp;<br />\r\n客户监督：\r\n</p>\r\n<p>\r\n	我们希望通过不懈努力，为客户提供最佳服务，商城在给客户提供服务的全过程中接受客户的监督。<br />\r\n&nbsp;<br />\r\n争议处理：\r\n</p>\r\n<p>\r\n	如果客户与我们之间发生任何争议，可依据当时双方所认定的协议及相关法律进行解决。<br />\r\n&nbsp;<br />\r\n我们承诺：<br />\r\n我们秉承质优价低、放心满意的销售理念为您服务。我们所出售的商品均为正品行货，与您亲临商场选购的商品一样享受相同的质量保证；含有质量保证书的商品按照保证书的承诺执行，其它商品按国家有关规定执行。<br />\r\n&nbsp;<br />\r\n特别提示：&nbsp;<br />\r\n我们保证出货时商品外包装的完好无缺。请您在收到货物时当场仔细检查发票及货品与送货单的商品是否一致，如果发现商品缺少或已破损等情况，请在配送人员还在现场时与我司客服部联系；如果发现邮寄包装破损，货物在运输途中破损等情况，请当场指出并拒收，拒收后请致电我司客服。如您已签收或他人代为签收，则视为商品外包装，商品数量及内容无误，我司将无法受理。\r\n</p>', '1', '', '', null, null, null, '交易条款', '3');
INSERT INTO `article` VALUES ('13', '2013-01-01 13:58:54', '2013-01-01 14:04:13', null, '&nbsp;长时间未收到订单可能出现的问题<br />\r\n&nbsp;<br />\r\n1.请您确保订单中的收货地址、邮编、电话、Email地址等信息的准确性，以便商品及时、准确地发出；<br />\r\n&nbsp;<br />\r\n2.快递送货上门的订单，配送过程中如果我们联络您的时间超过7天未得到回复，此订单将被默认为您已经放弃订购。如果订单的收货地址是固定某个时间段才可接收商品时, 请您在“订单备注”栏中详细注明；<br />\r\n&nbsp;<br />\r\n3.支付完成但是遇到收货地址不详、支付金额不足或库存不足的订单，将无法及时为您发出；<br />', '1', '', '', null, null, null, '帮助中心', '3');
INSERT INTO `article` VALUES ('14', '2013-01-01 14:08:47', '2013-01-01 21:06:09', null, '<p>\r\n	一、如何获得积分：<br />\r\n购买带有积分的商品，或者参加送积分的活动，您即可获得积分;<br />\r\n获得的积分数量：请参照商品详情页展示的积分，最终获得的积分数量以订单结算页显示为准;<br />\r\n积分可在“会员中心”内查询到;<br />\r\n如果您退货，则会在退货成功后扣减您此笔交易的积分;\r\n</p>\r\n<p>\r\n	&nbsp;\r\n</p>\r\n<p>\r\n	二、积分的计算规则：<br />\r\n获得积分的数量：<br />\r\n没有积分活动的商品，会获得实际支付金额的1:1比例的积分；<br />\r\n本商城可能会对促销商品、不同的会员级别在不同时间做积分的活动，比如直接送xxxx积分，或者金级n倍等奖励活动，具体的积分数量，以结算页最终显示为准。不同的活动，享受的积分数量或倍数不同。\r\n</p>\r\n<p>\r\n	&nbsp;\r\n</p>\r\n<p>\r\n	三、积分的使用：<br />\r\n本商城积分有如下使用途径：<br />\r\n登录会员中心—在交易信息里有“积分兑换”;<br />\r\n在积分兑换区里，可以兑换礼券、实物商品、赠品等，内容我们会陆续丰富;\r\n</p>', '4', '', '', null, null, null, '会员积分', '3');
INSERT INTO `article` VALUES ('15', '2013-01-01 14:18:16', '2013-01-01 14:46:17', null, '<p>\r\n	优惠券是本商城在线发放给用户用于抵扣产品金额的优惠券。\r\n</p>\r\n<p>\r\n	&nbsp;\r\n</p>\r\n<p>\r\n	如何获取商城优惠券<br />\r\n积分兑换：用积分兑换礼券，如每100积分可兑换1元现金券。具体积分可在“会员中心”——“我的积分”中查询；<br />\r\n现金购买：与在线客户联系，直接用现金购买；<br />\r\n会员专享：本商城会针对会员做惊喜礼券派赠；\r\n</p>\r\n<p>\r\n	&nbsp;\r\n</p>\r\n<p>\r\n	优惠券使用规则<br />\r\n1.每张优惠券都有一定的使用规则，请在使用前仔细阅读该券的使用说明；<br />\r\n2.每个订单只能使用一张优惠券，一张优惠券只能使用一次；<br />\r\n3.优惠券只能抵扣货款，不找零，不能抵扣配送费、包装费及其他费用；<br />\r\n4. 使用优惠券支付的订单，如发生完成订单后退货，优惠券不予兑现，将按照实际支付货款退还；<br />\r\n5.优惠券细则在法律许可范围内本商城拥有解释权。\r\n</p>', '2', '', '', null, null, null, '优惠券', '3');
INSERT INTO `article` VALUES ('16', '2013-01-01 14:22:19', '2013-01-01 14:04:13', null, '<p>\r\n	1 若订单交易未成功，麻烦申请订单金额的正常退款。退款金额返回到您的账户。\r\n</p>\r\n<p>\r\n	&nbsp;\r\n</p>\r\n<p>\r\n	2 若订单交易成功，通过实名认证的用户，退款金额会以即时到帐方式打入您的支付宝/财付通账号，若是非认证用户，请提供其它已认证的支付宝/财付通账号或银行账号进行退款，或直接退款到会员账户中。\r\n</p>\r\n<p>\r\n	&nbsp;\r\n</p>\r\n<p>\r\n	3 若通过其他方式支付的订单，请您提供接收退款的银行信息，包括完整开户行信息（如：xx省xx市分行xx支行）、银行账号、账户名（姓名），为更快的为您办理退款，请优先提供中国建设银行、中国农业银行或中国工商银行的银行账号。\r\n</p>\r\n<p>\r\n	&nbsp;\r\n</p>\r\n<p>\r\n	4 如果所支付的订单中含有非现金部分（如优惠券、积分等），在退款时，非现金部分不能折现。\r\n</p>', '2', '', '', null, null, null, '退款注意事项', '3');
INSERT INTO `article` VALUES ('17', '2013-01-01 14:24:00', '2013-01-01 14:17:04', null, '如果您对本商城有任何建议或不满，请与联系我们，我们将在3个工作日内给予回复，非常感谢对我们商城的督促和支持。 <br />', '2', '', '', null, null, null, '投诉与建议', '3');
INSERT INTO `article` VALUES ('18', '2013-01-01 14:30:23', '2013-01-01 14:17:04', null, '<p>\r\n	基于国内诈骗案件频发，有不法分子假借一些正规电子商务营运商（下简称电商）的名义推销、强卖假冒产品（如化妆品）或会员卡等，情节恶劣，防不胜防。本商城提醒您网购时留意以下几点，谨防上当。\r\n</p>\r\n<p>\r\n	&nbsp;\r\n</p>\r\n<p>\r\n	1. 收到货到付款订单，先验货，再付款<br />\r\n当快递员将商品送到您的手上时，请先进行验货，确认商品信息，并查看商品名称、数量、价格、商家名称与您订购的信息一致后，再签收付款；<br />\r\n如果您验货时，发现收到的商品包装箱、包装中的商品与自己订购的不相符，请您拒绝签收，或与我们取得联系；\r\n</p>\r\n<p>\r\n	代收说明：如您的商品需要家人或同事代收，请您务必告知以上情况，谨防上当。\r\n</p>\r\n<p>\r\n	&nbsp;\r\n</p>\r\n<p>\r\n	2. 收到关于投奖、中奖、的电话或短信时，请提高警惕<br />\r\n如果您收到陌生人的电话或短信，内容包含抽奖、中奖信息时，请与本商城客服取得联系并确认；\r\n</p>\r\n<p>\r\n	&nbsp;\r\n</p>\r\n<p>\r\n	3. 收到QQ、论坛站内信提示您进行汇款或中奖信息时，请务必与商城客服确认<br />\r\n商城促销活动、对外公告均可在本商城官网促销页面或网站公告中查看，如果陌生人通过QQ与您联系，提示您进行汇款，或者告诉您中奖的信息，请您联系商城在线客服进行核对，请勿轻信非官方获奖信息！&nbsp;\r\n</p>', '3', '', '', null, null, null, '防骗提示', '3');
INSERT INTO `article` VALUES ('19', '2013-01-01 12:37:36', '2013-01-01 13:37:52', null, '商城店庆&nbsp;&nbsp; 时间：（2013.4.27至2013.5.23），<br />\r\n<br />\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 跨品类满减优惠：满200减40（优惠码不限量），满400减100（优惠码不限量）。<br />\r\n<br />\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 通过与商城兑换，在结账时输入优惠码，系统将自动扣除满减金额。如果其他促销也需要输入促销优惠码，则不能与本促销共同使用。<br />', '2', '', '', '店庆活动', '店庆活动', '店庆活动', '店庆活动 有你更精彩', '2');
INSERT INTO `article` VALUES ('20', '2013-01-01 12:39:42', '2013-01-01 13:37:52', null, '<p class=\"MsoNormal\">\r\n	<span> </span> \r\n</p>\r\n低价一站到底<br />\r\n<br />\r\n4月27日商城开启低价一站到底，一天三场万人抢购，服饰全场满1999减200，满999减100，品牌服装冲锋底价，更有全场满返现金券，部分品类满100就返30元现金券，更多惊喜，尽在4月27日开启！<br />', '2', '', '', null, null, null, '低价一站到底', '2');
INSERT INTO `article` VALUES ('21', '2013-01-01 12:44:02', '2013-01-01 13:37:52', null, '<p>\r\n	各位亲爱的顾客：\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 品牌服饰周末耍大牌，为您打造专属于您的男性魅力！\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 倾情为您打造男士商务、休闲一站式采购的男装盛典，还为您准备以下惊喜：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;<br />\r\n<p>\r\n	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\r\n</p>\r\n<p>\r\n	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 惊喜1：众多春夏新品首发，尝鲜体验；&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 惊喜2：全场1-5折，所有产品赠精美礼盒包装，支持货到付款或快递发货；\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 惊喜3：全场满300元减20元，满400元减30元，满900元减100元\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 祝大家购物愉快！\r\n</p>', '3', '', '', null, null, null, '周末耍大牌', '2');
INSERT INTO `article` VALUES ('22', '2013-01-01 12:46:03', '2013-01-01 13:37:52', null, '时间：2013-4-27 &nbsp;<br />\r\n<br />\r\n&nbsp;&nbsp;&nbsp;&nbsp; 箱包百万优惠劵免费领啦！20元面额，当现金，无消费限额，即领即用！先领券，再下单直减钱！美旅拉杆箱、大牌ELLE女包、花花公子皮带、威戈电脑包、七匹狼男包。。。<br />\r\n<br />\r\n&nbsp;&nbsp;&nbsp;&nbsp; 下单都用券，直减钱！疯了疯了，还不快抢！<br />\r\n<br />\r\n&nbsp;&nbsp;&nbsp;&nbsp; 活动时间：4月27号 9:30---5月27号 9:30<br />\r\n<br />', '2', '', '', null, null, null, '箱包百万优惠券大派送', '2');
INSERT INTO `article` VALUES ('23', '2013-01-01 12:48:13', '2013-01-01 13:37:52', null, '<p class=\"MsoNormal\">\r\n	<span style=\"font-family:宋体;\">亲爱的商城顾客朋友</span><span>:</span>\r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<span><br />\r\n</span>\r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 4</span><span style=\"font-family:宋体;\">月</span><span>20</span><span style=\"font-family:宋体;\">日</span><span>8</span><span style=\"font-family:宋体;\">点</span><span>02</span><span style=\"font-family:宋体;\">分，四川雅安芦山县发生</span><span>7.0</span><span style=\"font-family:宋体;\">级地震，天灾再次降临。</span>\r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<span style=\"font-family:宋体;\"><br />\r\n</span>\r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<span style=\"font-family:宋体;\">&nbsp;&nbsp;&nbsp; 或许您不能亲临灾区现场，但一定和我们一样对同胞的苦难牵肠挂肚。为此，我们在第一时间捐赠了百万元的紧急救灾物资。</span>\r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<span style=\"font-family:宋体;\"><br />\r\n</span>\r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<span style=\"font-family:宋体;\">&nbsp;&nbsp;&nbsp; 四川雅安地震发生以来，全国人民纷纷表达为灾区人民奉献爱心的强烈愿望。因此，我们集合各方力量推出了爱心快通道活动，使得大家可以通过我们的努力为灾区奉献爱心，广大消费者可以结合自身的实 际情况，选择捐赠方式。</span>\r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<span style=\"font-family:宋体;\"><br />\r\n</span>\r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<span style=\"font-family:宋体;\">&nbsp;&nbsp;&nbsp; 您所选择的救灾物资将由我司物流免费运送到雅安爱心站，并接受政府统一调拨，把救灾品切实发到有需要的灾民手中。</span>\r\n</p>', '6', '', '', null, null, null, '为雅安开辟爱心快通道', '2');
INSERT INTO `article` VALUES ('24', '2013-01-01 12:50:09', '2013-01-01 13:34:47', null, '<p class=\"MsoNormal\">\r\n	<span><span></span></span><span style=\"font-family:宋体;\">尊敬的商城会员：</span>\r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<span style=\"font-family:宋体;\"><br />\r\n</span>\r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<span><span>&nbsp;&nbsp;&nbsp; </span></span><span style=\"font-family:宋体;\">喜迎五．一大促销活动开始啦！</span><span>10</span><span style=\"font-family:宋体;\">元礼品任你选满百即送！多买多得！</span>\r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<span><span>&nbsp;&nbsp;&nbsp; <br />\r\n</span></span>\r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<span><span></span></span><span style=\"font-family:宋体;\">活动规则：</span>\r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<span style=\"font-family:宋体;\"><br />\r\n</span>\r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<span><span>&nbsp;&nbsp;&nbsp; </span>1.</span><span style=\"font-family:宋体;\">此活动仅限玩具类产品（包括益智图书）。</span>\r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<span style=\"font-family:宋体;\"><br />\r\n</span>\r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<span><span>&nbsp;&nbsp;&nbsp; </span>2.</span><span style=\"font-family:宋体;\">单笔订单满</span><span>100</span><span style=\"font-family:宋体;\">元（不包括邮费），本商城儿童玩具</span><span>10</span><span style=\"font-family:宋体;\">以下产品任选</span><span>1</span><span style=\"font-family:宋体;\">件。</span>\r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<span style=\"font-family:宋体;\"><br />\r\n</span>\r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<span><span>&nbsp;&nbsp;&nbsp; </span>3.</span><span style=\"font-family:宋体;\">满</span><span>200</span><span style=\"font-family:宋体;\">可任选</span><span>20</span><span style=\"font-family:宋体;\">元以下产品</span><span>1</span><span style=\"font-family:宋体;\">件。满</span><span>300</span><span style=\"font-family:宋体;\">元可任选</span><span>30</span><span style=\"font-family:宋体;\">元以下产品</span><span>1</span><span style=\"font-family:宋体;\">件，以此类推</span>\r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<span style=\"font-family:宋体;\"><br />\r\n</span>\r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<span><span>&nbsp;&nbsp;&nbsp; </span>4.</span><span style=\"font-family:宋体;\">活动时间为</span><span>4</span><span style=\"font-family:宋体;\">月</span><span>26</span><span style=\"font-family:宋体;\">日</span><span>~6</span><span style=\"font-family:宋体;\">月</span><span>16</span><span style=\"font-family:宋体;\">日</span>\r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<span style=\"font-family:宋体;\"><br />\r\n</span>\r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<span><span>&nbsp;&nbsp;&nbsp; </span>5.</span><span style=\"font-family:宋体;\">最终解释权归本商城所有。</span>\r\n</p>', '0', '', '', null, '欢庆黄金周', '欢庆黄金周', '欢庆黄金周 10元礼品任你选满百即送！多买多得！', '2');
INSERT INTO `article` VALUES ('25', '2013-01-01 12:53:55', '2013-01-01 12:53:55', null, '<p class=\"MsoNormal\">\r\n	<span style=\"font-family:宋体;\">注册或购买就送</span><span>50</span><span style=\"font-family:宋体;\">积分</span><span><span> <br />\r\n</span></span>\r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<span><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span>\r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<span style=\"font-family:宋体;\">&nbsp;&nbsp;&nbsp; 活动时间：</span><span>2013</span><span style=\"font-family:宋体;\">年</span><span>4</span><span style=\"font-family:宋体;\">月</span><span>27</span><span style=\"font-family:宋体;\">日至</span><span>2013</span><span style=\"font-family:宋体;\">年</span><span>5</span><span style=\"font-family:宋体;\">月</span><span>27</span><span style=\"font-family:宋体;\">日。</span>\r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<span style=\"font-family:宋体;\"><br />\r\n</span>\r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<span style=\"font-family:宋体;\">&nbsp;&nbsp;&nbsp; 活动规则：</span>\r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<span style=\"font-family:宋体;\"><br />\r\n</span>\r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<span style=\"font-family:宋体;\">&nbsp;&nbsp;&nbsp; 活动期间</span><span>,</span><span style=\"font-family:宋体;\">新用户注册和注册用户在商城购物均可获得商城五十积分。（活动期间注册并购买商品的用户只能获得一次五十积分的机会）赠送积分会在活动结束后一周内发放到用户的个人中心</span><span>,</span><span style=\"font-family:宋体;\">请注意查收。如果退货</span><span>,</span><span style=\"font-family:宋体;\">积分会被收回。</span>\r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<span style=\"font-family:宋体;\"><br />\r\n</span>\r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<span style=\"font-family:宋体;\">&nbsp;&nbsp;&nbsp; 商城将不定期举办积分购购购活动</span><span>,</span><span style=\"font-family:宋体;\">会给新老会员发送消息</span><span>,</span><span style=\"font-family:宋体;\">敬请关注。</span>\r\n</p>', '0', '', '', null, '注册送积分', '注册送积分', '注册或购买就送50积分', '2');
INSERT INTO `article` VALUES ('26', '2013-01-01 12:55:22', '2013-01-01 13:27:42', null, '<p>\r\n	年中大团购 全场3.2折起\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 时间： 2013-01-01\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 商城推出“年中大团购 底价大决算”活动，一年一次的盛惠，抢到就是赚到！<br />\r\n<p>\r\n	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 活动期间，全场商品最低3.2折起！品牌服饰最高直降200元，箱包买一赠一，惊喜连连，底价大放送，抽奖抽到你手软！\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 活动时间：6月26-30日\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 祝大家购物愉快！', '4', '', '', null, null, null, '年中大团购 全场3.2折起', '2');
INSERT INTO `article` VALUES ('27', '2013-01-01 12:57:57', '2013-01-01 13:37:52', null, '<p>\r\n	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 爱美的你是否早已按捺不住？五一过后就是热辣的夏天，我们为女性朋友们带来涵盖多种品牌的缤纷大促销，从鞋包到服装一应俱全，全面满足你的购物欲。4月27日至4月30日三天内，光临女人节，就有三重特惠供你选择，满199元减60元、满299元减100元、满499元减180元。\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 据介绍，此次中国靓丽女人节力邀众多国际知名品牌，为女性朋友带来一道丰盛的美丽大餐。化妆品品牌雅诗兰黛（ESTEE LAUNDER）、兰寇（Lancôme）、资生堂（Shiseido）、玉兰油（OLAY）、欧珀莱（AUPRES）等携手服装品牌欧时力（Ochirly）、埃斯普利特（Esprit）等倾情力减，美颜护肤搭配精致时装，让你惊艳众人；而鞋包品牌比如玖熙（Nine West）、阿迪达斯（Adidas）、蔻驰（Coach）等，也竞相推出促销产品，相信总有一款适合你。\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 春天刚过，相信很多女性都在为节后体重增加而烦恼；同时，有很多白领女性年纪轻轻，就已经腰酸背痛。趁此女人节之际，我们特别推出多种运动及户外健身用品，比如阿瑞娜（Arena）、皮尔瑜伽（PierYoga）、狼爪（Jack Wolfskin）等，让女性朋友们走出办公室拥抱自然，远离亚健康，减掉身上赘肉。还等什么？赶快备好行装动起来！\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 秉承“天天低价，正品行货”的承诺，我们在这特殊的节日也为女性朋友们带来丰富、优惠的美丽套餐。精彩五月、缤纷夏日，我们和万千女性一起，共同打造真正靓丽时尚的“女人节”。\r\n</p>', '8', '', '', null, null, null, '五月靓丽女人节 呵护自己', '1');
INSERT INTO `article` VALUES ('28', '2013-01-01 13:01:11', '2013-01-01 13:37:52', null, '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2009年中，苹果公司市值超越谷歌；2010年5月，超越微软成为全球市值最高的科技公司；2012年8月12日，苹果市值超越石油巨头埃克森美孚，登顶全球市值榜首。一次次不断超越为我们展现的不仅是苹果公司活力与激情、动荡与辉煌相互交织的发展轨迹，更是新兴产业与传统产业之间的博弈，以互联网技术为基础的商业时代已经到来。<br />\r\n<br />\r\n<p>\r\n	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; “移动电子商务”、“社交网络”、“4G”、“SoLoMo”……全新的技术和概念串联起了数字化时代下的鲜明特征，也为未来商业发展提供了更多的可能与选择。时代的快速变化总是超出我们的想象。Google推出的Android操作系统及相应手机在全球迅速流行并普及；以Facebook、Twitter、新浪微博等为代表的社交型平台网络也体现出越来越明显的移动化特征；在日本，De NA、Gree等移动社交网站占据了市值排行榜的前列。显而易见，互联网市场的竞争态势已经从企业间竞争逐渐向全产业链竞争开始转移。近日，搜索巨头Google一手举着刚刚收购的摩托罗拉手机，另一只手则紧握社交终端。马云的态度更是异常坚决：“今年淘宝最重要的任务就是把淘宝SNS化。”百度CEO李彦宏也宣称：“百度要大规模的进入SNS领域。”\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 中国的互联网企业在看到社交网络未来发展机遇的同时，也将目光迅速转向到了对移动互联网产业的关注，具有混搭风格的SoLoMo模式则被看成是继PC互联网之后下一个十年的主流发展趋势。在“概念”横行的时代里，电商企业作为互联网生态圈中的又一重要分支，在面对移动互联网这块充满着巨大诱惑和极具挖掘潜力的“蛋糕”时，也纷纷推出了适用于Symbian、Android、iPhone等不同手机平台的移动客户端以完善自身产业链体系。\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 中国的移动电子商务目前尚处于起步阶段，有业内人士指出：“移动电子商务尤其是手机购物的发展，首先要依赖于智能手机的普及和网络对于应用的支撑，然后是用户习惯的培养，这些是基础。就目前来看，尽管如今智能手机市场发展迅速，但是普及度仍然不够，并且对于移动网络方面，也仍有待发展和完善。同时，与之相关的配套服务也应同比例提升，毕竟电子商务的实质在于‘商务’。\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 事实上，目前许多互联网企业应对移动互联网趋势的最稳妥做法就是将其内容和应用从PC向手机进行移植，但要真正要得到用户的青睐，完全取决于用户体验效果的成败。“决定电子商务企业成败的核心点只有四个字‘顾客体验’。电子商务作为新型的业态，尤其在中国还远不够成熟。企业需结合其核心能力与上游供应商端及物流端的资源整合，为顾客提供更好的购物体验和价值。模式的创新多半重‘电子’，竞争关键则在于强化每个‘商务’的细节。”<br />\r\n&nbsp;', '5', '', '', null, null, null, '电子商务未来是否需要“移动”', '1');
INSERT INTO `article` VALUES ('29', '2013-01-01 13:02:31', '2013-01-01 13:37:52', null, '尊敬的顾客，您好！<br />\r\n<br />\r\n&nbsp;&nbsp;&nbsp; 如果您的多个订单被合并发货， 并且您支付了多次运费的， 请在包裹签收7天后致电客服热线400-000-****， 或发邮件到官方邮箱进行登记，我们将在1个工作日内按实际发货情况将多收运费返还到您的商城个人账号。<br />\r\n<br />\r\n&nbsp;&nbsp;&nbsp; 特别说明： 收货后7天内因为可能发生退换货，不处理相关运费返还业务。<br />\r\n<br />\r\n&nbsp;&nbsp;&nbsp; 祝您工作顺利、生活愉快！<br />\r\n<br />\r\n2013年4月27日', '3', '', '', null, null, null, '合并运费返还方案公告', '1');
INSERT INTO `article` VALUES ('30', '2013-01-01 13:04:41', '2013-01-01 13:27:42', null, '<p>\r\n	&nbsp;&nbsp;&nbsp; 从今日起，国美在线将启动新一轮价格战。记者发现，当当网、1号店、乐蜂网、聚美优品等二线电商也将4月作为了大促时段。在京东商城、苏宁易购等电商试图盈利的发展转型期，二线电商纷纷造势抢占市场份额。\r\n</p>\r\n<p>\r\n	　　据悉，本次国美电商的“最强店庆月”的跨度长达一个月，并将在本月18日店庆当日达到高峰。据一位接近国美在线的人士透露，国美在线方面希望将“4•18”打造成与淘宝“双11”光棍节、京东商城“6•18”店庆促销一样震动行业的电商促销盛宴。\r\n</p>\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 不仅是国美在线，当当网、1号店、乐蜂网和聚美优品等电商企业也纷纷在4月掀起促销狂潮。当当网相关负责人表示，利用春夏这一时间点促销，避开淘宝网的秋冬大促，并打造自己的促销品牌。事实上在经历过去年的大促后，京东商城、苏宁易购等电商巨头不约而同开始弱化价格战，将发展重心回归到盈利能力提升以及对用户体验层面上。因为包括京东商城和苏宁易购在内的大型电商都将今年视做变革之年。<br />\r\n<br />\r\n四月电商价格战火重燃 服务为决胜之道<br />\r\n<br />\r\n<p>\r\n	　　进入4月，国美、苏宁电商高举促销让利的大旗，再燃价格战火。而2013一开年，在京东商城内部年会上，京东商城集团创始人兼CEO刘强东发表讲话，阐释京东2013年的“修养生息”战略，并首次指出了京东商城第二个十年的三大发展方向：自营电商、开放服务和数据金融。在2013年围绕美苏之间的首轮价格战来临之时，京东仍旧挂出“免战牌”。由于京东的缺席，原来的“三国杀”变为了“美苏争霸”。\r\n</p>\r\n<p>\r\n	　　有业内人士表示，京东缺席价格战是个好的选择，因为任何一家企业都有自己的问题，京东也不例外。经过六年高速发展的京东，确实需要好好的修养了。人员的扩张带来的问题、生态系统的建设等。刘强东在接受腾讯科技采访时称，京东出现了大公司病的苗头，在业界的声誉没有初创期那么好了。还有人员的扩张，带来了管理的难度。内部的这些问题，远远比价格战重要。把内部的问题梳理、解决好，才能为下一轮的增长打好基础。\r\n</p>\r\n<p>\r\n	　　不过，有分析认为，京东此举并不那么轻松。尽管京东在B2C市场份额占据领先优势，但是在电商混战的状态下，市场格局并没有稳定，未来市场份额排名难以预料。中国电子商务的发展大致可以分为四个阶段：首先是依赖低价格吸引用户的“价格竞争”阶段；其次是通过营销手法诱导用户购买的“营销竞争”阶段；再次是依靠口碑，用货真价实的商品吸引用户多次购买的“品质竞争”阶段；最后，则是更贴近消费者需求、品质更有保证、用户粘性强、品牌美誉度极高，拥有强大品牌吸引力的“品牌竞争”阶段。京东退出价格战，提高自己的服务正是决胜之道。\r\n</p>\r\n<p>\r\n	　　对于爆发的4月“美苏大战”，一定程度上反应了当前行业格局的微妙变化。实际上，去年所发生的京东、国美、苏宁三家电商龙头公司的价格战，将要转变为线上版的“美苏争霸”，无论结果如何，都将对京东现有地位形成一定的威胁。\r\n</p>\r\n<p>\r\n	　　久违的价格战让今年电商市场显得相对平静，“搅局者”腾讯旗下易迅网正欲打破这种局面。近日易迅网宣布从今日开始，针对京东商城、苏宁易购和国美在线三家的商品售价，启动名为“价格终结者”的保价行动，并持续一个月。\r\n</p>\r\n<p>\r\n	　　业内人士表示，历经前期的探索与积累，传统企业电商已经显示出了强大的实力与爆发力，国美苏宁此时趁主要竞争对手休养生息之际，自然不会放过进一步抢占市场份额的机会。目前，低价竞争仍是最有效的手段，因此国美苏宁势必掀起新一轮的价格大战。\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	　　那么，在国美苏宁继续发力挑战电商现有格局的2013年里，京东是否会重回价格战？\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	　　“在目前家电类电商利润稀薄的状况下，价格战等同于自杀式流血，不可持续。今年电商的主题是通过合理的成本控制，升级营销手段来保持经营利润，促进整个电商行业健康可持续发展。”对于京东“哑火”，新七天电器品牌总监田原认为，京东商城在独立B2C市场上的垄断性优势，已经让其不屑于打价格战。\r\n</p>\r\n　　有独立电商观察者对记者表示，包括京东和国美苏宁在内，电商整体还是会保持一个基本低价的态势，但真正的竞争还会是在售后体验上，而售后体验的经验积累和物流体系建设，也绝非一日之功，各大电商还需投入更多精力提升用户体验。<br />\r\n<br />\r\n<br />', '12', '', '', null, null, null, '电商变革 电商造节促销欲打翻身仗', '1');
INSERT INTO `article` VALUES ('31', '2013-01-01 13:05:57', '2013-01-01 13:37:52', null, '酷酷搭配逛街去 时尚美范赚足回头率<br />\r\n<br />\r\n　　如何装扮自己，才能赢得路人们的注意呢。对于许许多多的爱美的女性朋友们来说，学习时尚的服饰搭配技巧是非常重要的一个课题。接下来，就让小编来告诉你吧，一定要仔细学习哦，相信一定可以找到属于你自己的搭配风格的。<br />\r\n&nbsp;<br />\r\n　　民族风的披肩，喜欢旅游的女孩们，外出穿上这款yy，非常有感觉哦!独具特色的民族风花纹图案，穿上它超级显个性的。内搭最百搭的黑色打底毛衫，下身配搭黑色紧身牛仔裤+皮质过膝长靴，很时髦帅酷哦!', '2', '', '', null, null, null, '酷酷搭配逛街去 时尚美范赚足回头率', '1');
INSERT INTO `article` VALUES ('32', '2013-01-01 13:06:48', '2013-01-01 13:27:42', null, 'google快递<br />\r\n<br />\r\n　　今天，Google 宣布了其 Google 购物快递(Shopping Express) 服务正式上线，与其配套的当日送达服务只在美国部分地区试运营。截至目前，已有包括 Target/Walgreens 在内的数十家零售商合作伙伴。<br />\r\n<br />\r\n　　此前有媒体猜测，Google 可能会推出 64-69 美元 / 年的价格来同 Amazon 竞争，但就目前的情况看，Google 似乎仍未拿出一个合理定价方案，未来会根据零售商以及首批试用用户数据，制定合理的价格。首批试用者也可以免费享受六个月的当日送达服务。<br />\r\n<br />\r\nGoogle快递服务<br />\r\n<br />\r\n　　对于普通消费者来说，好处是购物时除了 Amazon，他们又多了一个选择；而商家也会因此带来一批新的用户。<br />\r\n<br />\r\n　　自此，Google 又多了一重“电商”的身份，其他在线零售商要小心了，尤其是电商巨头 Amazon。', '1', '', '', null, null, null, '谷歌正式进军电商行业 推购物快递服务', '1');
INSERT INTO `article` VALUES ('33', '2013-01-01 13:08:12', '2013-01-01 13:17:36', null, '<p>\r\n	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 越来越多的70后、80后发现，身边的父母长辈开始聊网购了，甚至有不少人已经能在网上购物。在这一现象的背后，网购已经成为人们主流的消费方式和拉动经济增长的新引擎，国内零售业也由此进入了新旧经济模式转型的关键节点。\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	　　在今年的全国两会上，还有不少50、60后代表饶有兴致地谈起网购经历。就连广大农村地区的居民也加入了电子商务大军，不少农民还扯条网线当上了“网商”，直接把家里的土特产卖到了全国各地。根据中国互联网络信息中心（CNNIC）发布的报告，截至2012年12月底，我国网络购物用户规模达到2.42亿。艾瑞咨询数据显示，2012年中国网络购物市场交易规模达1.3万亿元，在社会消费品总零售额的占比达到6.2%。\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	　　在网购规模逐年扩大的同时，百货商场沦落为“试衣间”的趋势也越来越明显。就连年销售额400多亿、拥有银泰百货等金字招牌的银泰集团董事长沈国军也公开表示：“电子商务发展势不可挡，传统零售业务不变革的话是死路一条。”而在传统零售商尝试转型之前，不少制造商早已加入了网销大军。\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	　　为此电商服务平台为创业者电商提供最好的服务，无论有无开网店的经验，电商服务平台的技术人员都会帮您实现，并将您培养成一名成功的创业者。省钱省力，上手迅速。一个完整的开网店过程：谋划网站功能--找电商服务平台签合同做网站，空间费，带宽费，域名费--网站开发费用--学习网店后台操作--开通支付功能--向网店上传商品--开始运作。\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n　　企业尤其是传统企业想要做好电子商务，想要进军电子商务市场，想要在电子商务市场竞争中逆流而上，必要的电子商务力量与支持绝对不能少。', '2', '', '', null, null, null, '创业者电商 促进中国经济生活转型', '1');
INSERT INTO `article` VALUES ('34', '2013-01-01 13:08:53', '2013-01-01 13:37:52', null, '　　刘女士是经常去马连道，因为她爱喝茶，但是从今年8月份后，她再也不去马连道了，原来是她从网上购茶了，之前刘女士是从来不相信网上购物的，那为什么后来就从网上购物了呢。<br />\r\n<br />\r\n　　事情的经过是这样的，今年八月中旬的一天，刘女士又到日子要去马连道买茶了，正准备出门，女儿说，现在网上购物又省心，又省力，何必跑那么远呢，网上有一个专门卖茶的网站叫国茶商城还不错，你可以上去看看，刘女士本来是不相信网上购物的，别看天天上网，也只是聊个天打个字，从来不在网上购物，可这次听女儿说的这么好，正好今天车又限号，她也不想大热天的挤公交，心想就试试吧，她打开国茶商城页面一看，好家伙，品种还很全，自己能见到的茶叶，这茶城里全有，价格也公道，正看着呢，结果瞧见一个茶叶竟然零元销售，刘女士心想估计又是一个不靠谱的网站，反正是零元，试一下吧。就点了购买，完了就关了页面了。之后又坐车去马连道。<br />\r\n<br />\r\n　　本来刘女士也不以为意，估计人家网站也不可能零元销售，估计又是骗子网站，可是下午回家后，竟然有人打电话问她是不是在国茶商城定过茶，刘女士有点觉得惊讶了，最让他惊讶的是下午两点竟然有人给他把价值二百多元的茶送过来了，刘女士没掏一分钱。<br />\r\n<br />\r\n<p>\r\n	　　事后刘女士通过问网站配送人员才知道，本来国茶商城在测试阶段，所以有些细节检查的并不仔细，并没有想到会有人去真正的购买，可是没有想到有人下单了，看到定单后，商城的销售人员立即打电话给了领导，领导当时就做出决定：赔钱也要做到诚售，既然标了零元就要做到。这样才有了下午的一幕，最后刘女士一分钱没花买到了价值二百多的六安瓜片。\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 事情传出后，国茶商城被众网友评为了最诚信电商。由此可见信誉、品牌在消费者看来是责任是义务，是商家对待消费者的态度。而对商家而言信誉、诚信则是消费者最好的评价与支持。诚信为本 千古不变。', '4', '', '', null, null, null, '看国茶商城被网友评为最诚信电商之一，言电商信誉、品牌塑造。', '1');
INSERT INTO `article` VALUES ('35', '2013-01-01 13:10:16', '2013-01-01 13:37:52', null, '<p>\r\n	　&nbsp; 受全球经济增长迟缓的影响，2012年中国电子商务市场整体增速有所回落，艾瑞咨询数据显示，2012年中国电子商务市场交易规模达8.1万亿元；从市场结构来看，网络购物突破万亿元大关，比较2011年有提升，在线旅游份额保持稳定，而B2B占比下降2个百分点。\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	　　市场规模：2012年中国电子商务市场交易规模8.1万亿元\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n　　艾瑞咨询统计数据显示，2012年中国电子商务市场整体交易规模为8.1万亿元，增长27.9%，与2011年32.8%的增速相比，下降了近5个百分点；其中2012Q4整体交易规模为2.4万亿元，环比增长16.2%，同比增长27.5%。<br />\r\n<p>\r\n	　　艾瑞咨询分析认为，电子商务市场规模增速有所回落，其原因主要是2012年国际贸易增速回落，欧洲债务危机不断加剧，美国经济复苏缓慢，全球经济收缩步伐加快；此外海关总署最新发布的数据也体现出这个态势，2012年全年中国进出口总额为38667.6亿美元，较2011年增长6.2%，而2011年同期的增速为22.5%，下降16个百分点。艾瑞咨询认为，当前经济环境对企业间电子商务行为产生较大影响，而B2B部分交易规模占电商整体八成以上，B2B市场规模在2012年增速放缓直接影响了整体规模增速。\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	　　市场格局：电商频繁促销活动驱动网购市场份额的增长\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n　　艾瑞咨询统计数据显示，2012年电子商务市场细分行业结构中，中小企业B2B电子商务占比53.3%，规模以上B2B占28.3%，企业间电子商务合计占81.6%；网络购物交易规模市场份额达到16.0%；在线旅游交易规模占比为2.1%。<br />\r\n　　艾瑞咨询分析认为，2012年中国网络购物市场份额有所提升，其因素是核心电商企业通过各种形式的促销，深入挖掘网购用户的消费潜力，从而带动了网购市场的快速增长。仅“双十一”仅淘宝就创造了191亿的交易业绩，远超美国2012年“网购星期一”15亿美元交易额水平。未来随着传统企业大规模进入电商行业、移动互联网的快速发展促使移动购物日益便捷，中国网络购物市场整体还将保持较快增长速度。<br />\r\n　　此外，在线旅游市场虽然占比较低，但近年来受机票、酒店、旅游度假等细分市场不同程度的驱动，一直保持30%以上的增长，逐渐成为电子商务市场重要的组成部分。<br />\r\n<br />', '12', '', '', null, null, null, '中国电商交易额8.1万亿 网购占比提升', '1');
INSERT INTO `article_category` VALUES ('1', '2013-01-01 10:57:06', '2013-01-01 11:03:40', '1', '0', '商城动态', null, null, null, ',', null);
INSERT INTO `article_category` VALUES ('2', '2013-01-01 10:57:46', '2013-01-01 11:04:13', '2', '0', '活动促销', null, null, null, ',', null);
INSERT INTO `article_category` VALUES ('3', '2013-01-01 10:57:55', '2013-01-01 11:04:21', '3', '0', '购物指南', null, null, null, ',', null);
INSERT INTO `article_category` VALUES ('4', '2013-01-01 10:58:10', '2013-01-01 11:03:48', '4', '0', '支付方式', null, null, null, ',', null);
INSERT INTO `article_category` VALUES ('5', '2013-01-01 10:58:16', '2013-01-01 11:03:51', '5', '0', '配送方式', null, null, null, ',', null);
INSERT INTO `article_category` VALUES ('6', '2013-01-01 10:58:23', '2013-01-01 11:03:53', '6', '0', '售后服务', null, null, null, ',', null);
INSERT INTO `article_category` VALUES ('7', '2013-01-01 11:03:35', '2013-01-01 11:03:55', '7', '0', '关于我们', null, null, null, ',', null);
INSERT INTO `attribute` VALUES ('1', '2013-01-01 10:50:37', '2013-01-01 14:32:37', '1', '材质', '0', '11');
INSERT INTO `attribute` VALUES ('2', '2013-01-01 10:51:10', '2013-01-01 14:33:17', '2', '裙长', '1', '11');
INSERT INTO `attribute` VALUES ('3', '2013-01-01 10:51:31', '2013-01-01 14:34:44', '3', '领型', '2', '11');
INSERT INTO `attribute` VALUES ('4', '2013-01-01 10:52:08', '2013-01-01 14:35:16', '4', '腰型', '3', '11');
INSERT INTO `attribute` VALUES ('5', '2013-01-01 10:55:05', '2013-01-01 14:38:16', '5', '袖型', '0', '12');
INSERT INTO `attribute` VALUES ('6', '2013-01-01 10:56:22', '2013-01-01 14:38:40', '6', '组合形式', '1', '12');
INSERT INTO `attribute` VALUES ('7', '2013-01-01 10:57:24', '2013-01-01 14:39:12', '7', '衣门襟', '2', '12');
INSERT INTO `attribute` VALUES ('8', '2013-01-01 10:58:18', '2013-01-01 14:39:52', '8', '厚薄', '3', '12');
INSERT INTO `attribute` VALUES ('9', '2013-01-01 14:41:05', '2013-01-01 14:41:12', '9', '袖长', '0', '13');
INSERT INTO `attribute` VALUES ('10', '2013-01-01 14:41:50', '2013-01-01 14:41:56', '10', '版型', '1', '13');
INSERT INTO `attribute` VALUES ('11', '2013-01-01 14:42:27', '2013-01-01 14:42:27', '11', '衣长', '2', '13');
INSERT INTO `attribute` VALUES ('12', '2013-01-01 14:42:59', '2013-01-01 14:43:05', '12', '厚薄', '3', '13');
INSERT INTO `attribute` VALUES ('13', '2013-01-01 14:43:45', '2013-01-01 14:43:49', '13', '衣长', '0', '14');
INSERT INTO `attribute` VALUES ('14', '2013-01-01 14:44:18', '2013-01-01 14:44:18', '14', '版型', '1', '14');
INSERT INTO `attribute` VALUES ('15', '2013-01-01 14:45:19', '2013-01-01 14:45:29', '15', '衣门襟', '2', '14');
INSERT INTO `attribute` VALUES ('16', '2013-01-01 14:46:16', '2013-01-01 14:47:25', '16', '款型', '0', '15');
INSERT INTO `attribute` VALUES ('17', '2013-01-01 14:46:53', '2013-01-01 14:46:58', '17', '裤长', '1', '15');
INSERT INTO `attribute` VALUES ('18', '2013-01-01 14:47:58', '2013-01-01 14:48:04', '18', '裤腰', '2', '15');
INSERT INTO `attribute` VALUES ('19', '2013-01-01 14:48:32', '2013-01-01 14:48:37', '19', '面料', '3', '15');
INSERT INTO `attribute` VALUES ('20', '2013-01-01 14:50:08', '2013-01-01 14:50:15', '20', '袖长', '0', '16');
INSERT INTO `attribute` VALUES ('21', '2013-01-01 14:51:31', '2013-01-01 14:51:36', '21', '主材质', '1', '16');
INSERT INTO `attribute` VALUES ('22', '2013-01-01 14:52:16', '2013-01-01 14:52:31', '22', '领型', '2', '16');
INSERT INTO `attribute` VALUES ('23', '2013-01-01 14:56:43', '2013-01-01 14:56:51', '23', '衣长', '3', '16');
INSERT INTO `attribute` VALUES ('24', '2013-01-01 14:59:05', '2013-01-01 14:59:43', '24', '板型', '0', '17');
INSERT INTO `attribute` VALUES ('25', '2013-01-01 14:59:37', '2013-01-01 14:59:49', '25', '主材质', '1', '17');
INSERT INTO `attribute` VALUES ('26', '2013-01-01 15:00:26', '2013-01-01 15:00:34', '26', '风格', '2', '17');
INSERT INTO `attribute` VALUES ('27', '2013-01-01 15:01:19', '2013-01-01 15:01:27', '27', '衣长', '3', '17');
INSERT INTO `attribute` VALUES ('28', '2013-01-01 15:02:53', '2013-01-01 15:03:34', '28', '衣长', '0', '18');
INSERT INTO `attribute` VALUES ('29', '2013-01-01 15:03:23', '2013-01-01 15:03:30', '29', '板型', '1', '18');
INSERT INTO `attribute` VALUES ('30', '2013-01-01 15:04:22', '2013-01-01 15:04:32', '30', '袖长', '2', '18');
INSERT INTO `attribute` VALUES ('31', '2013-01-01 15:05:04', '2013-01-01 15:05:12', '31', '风格', '3', '18');
INSERT INTO `attribute` VALUES ('32', '2013-01-01 15:07:09', '2013-01-01 15:07:52', '32', '款式', '0', '19');
INSERT INTO `attribute` VALUES ('33', '2013-01-01 15:07:43', '2013-01-01 15:07:48', '33', '袖长', '1', '19');
INSERT INTO `attribute` VALUES ('34', '2013-01-01 15:08:12', '2013-01-01 15:08:27', '34', '组合形式', '2', '19');
INSERT INTO `attribute` VALUES ('35', '2013-01-01 15:09:02', '2013-01-01 15:09:07', '35', '厚薄', '3', '19');
INSERT INTO `attribute` VALUES ('36', '2013-01-01 15:09:52', '2013-01-01 15:09:56', '36', '款型', '0', '20');
INSERT INTO `attribute` VALUES ('37', '2013-01-01 15:10:20', '2013-01-01 15:10:47', '37', '裤腰', '1', '20');
INSERT INTO `attribute` VALUES ('38', '2013-01-01 15:10:42', '2013-01-01 15:10:51', '38', '厚薄', '2', '20');
INSERT INTO `attribute` VALUES ('39', '2013-01-01 15:19:02', '2013-01-01 15:19:02', '39', '厚薄', '0', '21');
INSERT INTO `attribute` VALUES ('40', '2013-01-01 15:19:54', '2013-01-01 15:19:54', '40', '款式', '1', '21');
INSERT INTO `attribute` VALUES ('41', '2013-01-01 15:21:24', '2013-01-01 15:21:24', '41', '领型', '2', '21');
INSERT INTO `attribute` VALUES ('42', '2013-01-01 15:22:34', '2013-01-01 15:22:34', '42', '材质', '3', '21');
INSERT INTO `attribute` VALUES ('43', '2013-01-01 15:23:25', '2013-01-01 15:23:25', '43', '袖长', '0', '22');
INSERT INTO `attribute` VALUES ('44', '2013-01-01 15:24:58', '2013-01-01 15:24:58', '44', '风格', '1', '22');
INSERT INTO `attribute` VALUES ('45', '2013-01-01 15:28:17', '2013-01-01 15:28:17', '45', '风格', '0', '23');
INSERT INTO `attribute` VALUES ('46', '2013-01-01 15:29:18', '2013-01-01 15:29:18', '46', '款式', '1', '23');
INSERT INTO `attribute` VALUES ('47', '2013-01-01 15:29:54', '2013-01-01 15:29:54', '47', '裤长', '2', '23');
INSERT INTO `attribute` VALUES ('48', '2013-01-01 15:36:06', '2013-01-01 15:36:06', '48', '裤长', '0', '24');
INSERT INTO `attribute` VALUES ('49', '2013-01-01 15:37:01', '2013-01-01 15:37:01', '49', '裤型', '1', '24');
INSERT INTO `attribute` VALUES ('50', '2013-01-01 15:40:07', '2013-01-01 15:40:07', '50', '风格', '2', '24');
INSERT INTO `attribute` VALUES ('51', '2013-01-01 15:44:35', '2013-01-01 15:44:35', '51', '领型', '0', '25');
INSERT INTO `attribute` VALUES ('52', '2013-01-01 15:45:50', '2013-01-01 15:45:50', '52', '风格', '1', '25');
INSERT INTO `attribute` VALUES ('53', '2013-01-01 15:48:36', '2013-01-01 15:48:36', '53', '袖长', '2', '25');
INSERT INTO `attribute` VALUES ('54', '2013-01-01 15:52:53', '2013-01-01 15:52:53', '54', '袖长', '0', '26');
INSERT INTO `attribute` VALUES ('55', '2013-01-01 15:53:44', '2013-01-01 15:53:44', '55', '风格', '1', '26');
INSERT INTO `attribute` VALUES ('56', '2013-01-01 15:54:12', '2013-01-01 15:54:12', '56', '板型', '2', '26');
INSERT INTO `attribute` VALUES ('57', '2013-01-01 15:57:24', '2013-01-01 15:57:24', '57', '风格', '0', '27');
INSERT INTO `attribute` VALUES ('58', '2013-01-01 15:58:15', '2013-01-01 15:58:15', '58', '版型', '1', '27');
INSERT INTO `attribute` VALUES ('59', '2013-01-01 16:00:00', '2013-01-01 16:00:00', '59', '风格', '0', '28');
INSERT INTO `attribute` VALUES ('60', '2013-01-01 16:01:02', '2013-01-01 16:01:02', '60', '裤长', '1', '28');
INSERT INTO `attribute` VALUES ('61', '2013-01-01 16:10:29', '2013-01-01 16:10:29', '61', '衣长', '0', '29');
INSERT INTO `attribute` VALUES ('62', '2013-01-01 16:11:42', '2013-01-01 16:11:42', '62', '风格', '1', '29');
INSERT INTO `attribute` VALUES ('63', '2013-01-01 16:12:43', '2013-01-01 16:12:43', '63', '板型', '2', '29');
INSERT INTO `attribute` VALUES ('64', '2013-01-01 16:14:35', '2013-01-01 16:14:35', '64', '领型', '3', '29');
INSERT INTO `attribute` VALUES ('65', '2013-01-01 16:17:59', '2013-01-01 16:17:59', '65', '款式', '0', '30');
INSERT INTO `attribute` VALUES ('66', '2013-01-01 16:18:44', '2013-01-01 16:18:44', '66', '领型', '1', '30');
INSERT INTO `attribute` VALUES ('67', '2013-01-01 16:20:45', '2013-01-01 16:20:45', '67', '风格', '2', '30');
INSERT INTO `attribute_option` VALUES ('1', '雪纺');
INSERT INTO `attribute_option` VALUES ('1', '蕾丝');
INSERT INTO `attribute_option` VALUES ('1', '织锦');
INSERT INTO `attribute_option` VALUES ('1', '牛仔');
INSERT INTO `attribute_option` VALUES ('1', '绸缎');
INSERT INTO `attribute_option` VALUES ('1', '乔其纱');
INSERT INTO `attribute_option` VALUES ('1', '双绉');
INSERT INTO `attribute_option` VALUES ('1', '府绸');
INSERT INTO `attribute_option` VALUES ('1', '其他');
INSERT INTO `attribute_option` VALUES ('2', '超短裙');
INSERT INTO `attribute_option` VALUES ('2', '短裙');
INSERT INTO `attribute_option` VALUES ('2', '中裙');
INSERT INTO `attribute_option` VALUES ('2', '中长裙');
INSERT INTO `attribute_option` VALUES ('2', '长裙');
INSERT INTO `attribute_option` VALUES ('3', '圆领');
INSERT INTO `attribute_option` VALUES ('3', 'V领');
INSERT INTO `attribute_option` VALUES ('3', '一字领');
INSERT INTO `attribute_option` VALUES ('3', '翻领');
INSERT INTO `attribute_option` VALUES ('3', '荷叶领');
INSERT INTO `attribute_option` VALUES ('3', '双层领');
INSERT INTO `attribute_option` VALUES ('3', '立领');
INSERT INTO `attribute_option` VALUES ('3', '方领');
INSERT INTO `attribute_option` VALUES ('3', '堆堆领');
INSERT INTO `attribute_option` VALUES ('3', '连帽');
INSERT INTO `attribute_option` VALUES ('3', '娃娃领');
INSERT INTO `attribute_option` VALUES ('3', '西装领');
INSERT INTO `attribute_option` VALUES ('4', '中腰');
INSERT INTO `attribute_option` VALUES ('4', '高腰');
INSERT INTO `attribute_option` VALUES ('4', '宽松腰');
INSERT INTO `attribute_option` VALUES ('4', '松紧腰');
INSERT INTO `attribute_option` VALUES ('4', '低腰');
INSERT INTO `attribute_option` VALUES ('5', '常规袖');
INSERT INTO `attribute_option` VALUES ('5', '蝙蝠袖');
INSERT INTO `attribute_option` VALUES ('5', '泡泡袖');
INSERT INTO `attribute_option` VALUES ('5', '插肩袖');
INSERT INTO `attribute_option` VALUES ('5', '包袖');
INSERT INTO `attribute_option` VALUES ('5', '灯笼袖');
INSERT INTO `attribute_option` VALUES ('5', '荷叶袖');
INSERT INTO `attribute_option` VALUES ('5', '喇叭袖');
INSERT INTO `attribute_option` VALUES ('5', '公主袖');
INSERT INTO `attribute_option` VALUES ('5', '衬衫袖');
INSERT INTO `attribute_option` VALUES ('6', '单件套');
INSERT INTO `attribute_option` VALUES ('6', '假两件套');
INSERT INTO `attribute_option` VALUES ('6', '两件套');
INSERT INTO `attribute_option` VALUES ('7', '单排扣');
INSERT INTO `attribute_option` VALUES ('7', '一粒扣');
INSERT INTO `attribute_option` VALUES ('7', '拉链');
INSERT INTO `attribute_option` VALUES ('7', '双排扣');
INSERT INTO `attribute_option` VALUES ('8', '超薄');
INSERT INTO `attribute_option` VALUES ('8', '薄');
INSERT INTO `attribute_option` VALUES ('8', '适中');
INSERT INTO `attribute_option` VALUES ('8', '厚');
INSERT INTO `attribute_option` VALUES ('8', '加厚');
INSERT INTO `attribute_option` VALUES ('9', '短袖');
INSERT INTO `attribute_option` VALUES ('9', '五分袖');
INSERT INTO `attribute_option` VALUES ('9', '七分袖');
INSERT INTO `attribute_option` VALUES ('9', '九分袖');
INSERT INTO `attribute_option` VALUES ('9', '无袖');
INSERT INTO `attribute_option` VALUES ('10', '修身型');
INSERT INTO `attribute_option` VALUES ('10', '直筒型');
INSERT INTO `attribute_option` VALUES ('10', '高腰型');
INSERT INTO `attribute_option` VALUES ('10', '斗篷型');
INSERT INTO `attribute_option` VALUES ('10', '蝙蝠型');
INSERT INTO `attribute_option` VALUES ('10', '披肩型');
INSERT INTO `attribute_option` VALUES ('11', '超短款');
INSERT INTO `attribute_option` VALUES ('11', '短款');
INSERT INTO `attribute_option` VALUES ('11', '常规款');
INSERT INTO `attribute_option` VALUES ('11', '中长款');
INSERT INTO `attribute_option` VALUES ('12', '薄款');
INSERT INTO `attribute_option` VALUES ('12', '普通');
INSERT INTO `attribute_option` VALUES ('12', '加厚');
INSERT INTO `attribute_option` VALUES ('12', '抓绒');
INSERT INTO `attribute_option` VALUES ('13', '短款');
INSERT INTO `attribute_option` VALUES ('13', '常规款');
INSERT INTO `attribute_option` VALUES ('13', '中长款');
INSERT INTO `attribute_option` VALUES ('14', '修身型');
INSERT INTO `attribute_option` VALUES ('14', '直筒型');
INSERT INTO `attribute_option` VALUES ('14', '宽松型');
INSERT INTO `attribute_option` VALUES ('15', '一粒扣');
INSERT INTO `attribute_option` VALUES ('15', '单排扣');
INSERT INTO `attribute_option` VALUES ('15', '双排扣');
INSERT INTO `attribute_option` VALUES ('15', '暗扣');
INSERT INTO `attribute_option` VALUES ('15', '拉链');
INSERT INTO `attribute_option` VALUES ('15', '系带');
INSERT INTO `attribute_option` VALUES ('17', '长裤');
INSERT INTO `attribute_option` VALUES ('17', '中裤');
INSERT INTO `attribute_option` VALUES ('17', '七分裤');
INSERT INTO `attribute_option` VALUES ('17', '九分裤');
INSERT INTO `attribute_option` VALUES ('17', '短裤');
INSERT INTO `attribute_option` VALUES ('16', '直筒裤');
INSERT INTO `attribute_option` VALUES ('16', '微喇裤');
INSERT INTO `attribute_option` VALUES ('16', '垮裤');
INSERT INTO `attribute_option` VALUES ('16', '背带裤');
INSERT INTO `attribute_option` VALUES ('18', '低腰');
INSERT INTO `attribute_option` VALUES ('18', '中腰');
INSERT INTO `attribute_option` VALUES ('18', '高腰');
INSERT INTO `attribute_option` VALUES ('19', '全棉牛仔布');
INSERT INTO `attribute_option` VALUES ('19', '棉弹牛仔布');
INSERT INTO `attribute_option` VALUES ('19', '加厚牛仔布');
INSERT INTO `attribute_option` VALUES ('19', '薄牛仔布');
INSERT INTO `attribute_option` VALUES ('20', '短袖');
INSERT INTO `attribute_option` VALUES ('20', '长袖');
INSERT INTO `attribute_option` VALUES ('20', '无袖');
INSERT INTO `attribute_option` VALUES ('20', '中袖');
INSERT INTO `attribute_option` VALUES ('20', '五分袖');
INSERT INTO `attribute_option` VALUES ('20', '七分袖');
INSERT INTO `attribute_option` VALUES ('21', '棉');
INSERT INTO `attribute_option` VALUES ('21', '涤纶');
INSERT INTO `attribute_option` VALUES ('21', '聚酯纤维');
INSERT INTO `attribute_option` VALUES ('21', '粘胶');
INSERT INTO `attribute_option` VALUES ('21', '氨纶');
INSERT INTO `attribute_option` VALUES ('21', '锦纶');
INSERT INTO `attribute_option` VALUES ('21', '莫代尔');
INSERT INTO `attribute_option` VALUES ('21', '蚕丝');
INSERT INTO `attribute_option` VALUES ('21', '腈纶');
INSERT INTO `attribute_option` VALUES ('21', '麻');
INSERT INTO `attribute_option` VALUES ('22', '圆领');
INSERT INTO `attribute_option` VALUES ('22', 'V领');
INSERT INTO `attribute_option` VALUES ('22', '立领');
INSERT INTO `attribute_option` VALUES ('22', '方领');
INSERT INTO `attribute_option` VALUES ('22', '高领');
INSERT INTO `attribute_option` VALUES ('22', '翻领');
INSERT INTO `attribute_option` VALUES ('22', '一字领');
INSERT INTO `attribute_option` VALUES ('23', '短款');
INSERT INTO `attribute_option` VALUES ('23', '常规款');
INSERT INTO `attribute_option` VALUES ('23', '中长款');
INSERT INTO `attribute_option` VALUES ('24', '修身型');
INSERT INTO `attribute_option` VALUES ('24', '高腰型');
INSERT INTO `attribute_option` VALUES ('24', '直筒型');
INSERT INTO `attribute_option` VALUES ('25', '羊毛');
INSERT INTO `attribute_option` VALUES ('25', '涤纶');
INSERT INTO `attribute_option` VALUES ('25', '棉');
INSERT INTO `attribute_option` VALUES ('25', '麻');
INSERT INTO `attribute_option` VALUES ('25', '氨纶');
INSERT INTO `attribute_option` VALUES ('26', '原创');
INSERT INTO `attribute_option` VALUES ('26', '百搭');
INSERT INTO `attribute_option` VALUES ('26', '通勤');
INSERT INTO `attribute_option` VALUES ('26', '街头');
INSERT INTO `attribute_option` VALUES ('26', '甜美');
INSERT INTO `attribute_option` VALUES ('27', '短款');
INSERT INTO `attribute_option` VALUES ('27', '中长款');
INSERT INTO `attribute_option` VALUES ('27', '长款');
INSERT INTO `attribute_option` VALUES ('29', '修身型');
INSERT INTO `attribute_option` VALUES ('29', '高腰型');
INSERT INTO `attribute_option` VALUES ('29', '蝙蝠型');
INSERT INTO `attribute_option` VALUES ('29', '裙摆型');
INSERT INTO `attribute_option` VALUES ('29', '直筒型');
INSERT INTO `attribute_option` VALUES ('28', '中长款');
INSERT INTO `attribute_option` VALUES ('28', '长款');
INSERT INTO `attribute_option` VALUES ('28', '加长款');
INSERT INTO `attribute_option` VALUES ('30', '长袖');
INSERT INTO `attribute_option` VALUES ('30', '五分袖');
INSERT INTO `attribute_option` VALUES ('30', '七分袖');
INSERT INTO `attribute_option` VALUES ('30', '九分袖');
INSERT INTO `attribute_option` VALUES ('30', '短袖');
INSERT INTO `attribute_option` VALUES ('30', '无袖');
INSERT INTO `attribute_option` VALUES ('31', '通勤');
INSERT INTO `attribute_option` VALUES ('31', '街头');
INSERT INTO `attribute_option` VALUES ('31', '甜美');
INSERT INTO `attribute_option` VALUES ('33', '短袖');
INSERT INTO `attribute_option` VALUES ('33', '长袖');
INSERT INTO `attribute_option` VALUES ('33', '七分袖');
INSERT INTO `attribute_option` VALUES ('33', '九分袖');
INSERT INTO `attribute_option` VALUES ('33', '中袖');
INSERT INTO `attribute_option` VALUES ('33', '无袖');
INSERT INTO `attribute_option` VALUES ('32', '套头');
INSERT INTO `attribute_option` VALUES ('32', '开衫');
INSERT INTO `attribute_option` VALUES ('34', '单件套');
INSERT INTO `attribute_option` VALUES ('34', '上下套');
INSERT INTO `attribute_option` VALUES ('34', '假两件套');
INSERT INTO `attribute_option` VALUES ('35', '普通');
INSERT INTO `attribute_option` VALUES ('35', '薄款');
INSERT INTO `attribute_option` VALUES ('35', '抓绒');
INSERT INTO `attribute_option` VALUES ('35', '加厚');
INSERT INTO `attribute_option` VALUES ('35', '棉内胆');
INSERT INTO `attribute_option` VALUES ('35', '毛内胆');
INSERT INTO `attribute_option` VALUES ('36', '铅笔裤');
INSERT INTO `attribute_option` VALUES ('36', '直筒裤');
INSERT INTO `attribute_option` VALUES ('36', '微喇裤');
INSERT INTO `attribute_option` VALUES ('36', '阔腿裤');
INSERT INTO `attribute_option` VALUES ('36', '哈伦裤');
INSERT INTO `attribute_option` VALUES ('37', '低腰');
INSERT INTO `attribute_option` VALUES ('37', '中腰');
INSERT INTO `attribute_option` VALUES ('37', '高腰');
INSERT INTO `attribute_option` VALUES ('38', '超薄');
INSERT INTO `attribute_option` VALUES ('38', '薄款');
INSERT INTO `attribute_option` VALUES ('38', '普通');
INSERT INTO `attribute_option` VALUES ('38', '加厚');
INSERT INTO `attribute_option` VALUES ('39', '普通');
INSERT INTO `attribute_option` VALUES ('39', '薄款');
INSERT INTO `attribute_option` VALUES ('39', '加厚');
INSERT INTO `attribute_option` VALUES ('40', '套头');
INSERT INTO `attribute_option` VALUES ('40', '开衫');
INSERT INTO `attribute_option` VALUES ('41', 'V领');
INSERT INTO `attribute_option` VALUES ('41', '圆领');
INSERT INTO `attribute_option` VALUES ('41', '翻领');
INSERT INTO `attribute_option` VALUES ('41', '半高领');
INSERT INTO `attribute_option` VALUES ('41', '高翻领');
INSERT INTO `attribute_option` VALUES ('41', '连帽');
INSERT INTO `attribute_option` VALUES ('41', '门筒领');
INSERT INTO `attribute_option` VALUES ('41', '蹲领/堆堆领');
INSERT INTO `attribute_option` VALUES ('41', '不可翻高领');
INSERT INTO `attribute_option` VALUES ('42', '纯棉');
INSERT INTO `attribute_option` VALUES ('42', '棉质混纺');
INSERT INTO `attribute_option` VALUES ('42', '人造纤维');
INSERT INTO `attribute_option` VALUES ('42', '丝');
INSERT INTO `attribute_option` VALUES ('43', '短袖');
INSERT INTO `attribute_option` VALUES ('43', '长袖 ');
INSERT INTO `attribute_option` VALUES ('44', '商务休闲');
INSERT INTO `attribute_option` VALUES ('44', '嘻哈风格');
INSERT INTO `attribute_option` VALUES ('44', '英伦风格');
INSERT INTO `attribute_option` VALUES ('44', '运动风格');
INSERT INTO `attribute_option` VALUES ('45', '时尚休闲');
INSERT INTO `attribute_option` VALUES ('45', '商务休闲');
INSERT INTO `attribute_option` VALUES ('45', '青春休闲');
INSERT INTO `attribute_option` VALUES ('45', '日韩个性');
INSERT INTO `attribute_option` VALUES ('45', '英伦风格');
INSERT INTO `attribute_option` VALUES ('45', '运动风格');
INSERT INTO `attribute_option` VALUES ('45', '学院风格');
INSERT INTO `attribute_option` VALUES ('45', '嘻哈风格');
INSERT INTO `attribute_option` VALUES ('45', '欧美风格');
INSERT INTO `attribute_option` VALUES ('45', '原创设计');
INSERT INTO `attribute_option` VALUES ('46', '修身裤');
INSERT INTO `attribute_option` VALUES ('46', '直筒裤');
INSERT INTO `attribute_option` VALUES ('46', '宽松裤');
INSERT INTO `attribute_option` VALUES ('46', '工装裤');
INSERT INTO `attribute_option` VALUES ('46', '锥形裤 ');
INSERT INTO `attribute_option` VALUES ('46', '低裆跨裤');
INSERT INTO `attribute_option` VALUES ('46', '运动裤/卫裤 ');
INSERT INTO `attribute_option` VALUES ('46', '哈伦裤');
INSERT INTO `attribute_option` VALUES ('47', '长裤');
INSERT INTO `attribute_option` VALUES ('47', '九分裤');
INSERT INTO `attribute_option` VALUES ('47', '七分裤');
INSERT INTO `attribute_option` VALUES ('47', '短裤');
INSERT INTO `attribute_option` VALUES ('48', '长裤');
INSERT INTO `attribute_option` VALUES ('48', '九分裤');
INSERT INTO `attribute_option` VALUES ('49', '直筒型');
INSERT INTO `attribute_option` VALUES ('49', '修身型');
INSERT INTO `attribute_option` VALUES ('49', '宽松型 ');
INSERT INTO `attribute_option` VALUES ('49', '锥形裤');
INSERT INTO `attribute_option` VALUES ('49', '低裆跨裤');
INSERT INTO `attribute_option` VALUES ('49', '立体剪裁 ');
INSERT INTO `attribute_option` VALUES ('49', '哈伦裤');
INSERT INTO `attribute_option` VALUES ('50', '时尚休闲');
INSERT INTO `attribute_option` VALUES ('50', '商务休闲');
INSERT INTO `attribute_option` VALUES ('50', '青春休闲');
INSERT INTO `attribute_option` VALUES ('50', '日韩个性');
INSERT INTO `attribute_option` VALUES ('50', '英伦风格');
INSERT INTO `attribute_option` VALUES ('50', '街头潮流');
INSERT INTO `attribute_option` VALUES ('50', '欧美风格');
INSERT INTO `attribute_option` VALUES ('50', '运动风格 ');
INSERT INTO `attribute_option` VALUES ('50', '工装牛仔 ');
INSERT INTO `attribute_option` VALUES ('50', '学院风格 ');
INSERT INTO `attribute_option` VALUES ('50', '商务正装');
INSERT INTO `attribute_option` VALUES ('50', '嘻哈风格');
INSERT INTO `attribute_option` VALUES ('50', '原创设计');
INSERT INTO `attribute_option` VALUES ('50', '复古经典');
INSERT INTO `attribute_option` VALUES ('51', '圆领 ');
INSERT INTO `attribute_option` VALUES ('51', 'V领');
INSERT INTO `attribute_option` VALUES ('51', '连帽');
INSERT INTO `attribute_option` VALUES ('51', '翻领 ');
INSERT INTO `attribute_option` VALUES ('51', '衬衫领 ');
INSERT INTO `attribute_option` VALUES ('51', '门筒领');
INSERT INTO `attribute_option` VALUES ('51', '半高领');
INSERT INTO `attribute_option` VALUES ('51', '其它');
INSERT INTO `attribute_option` VALUES ('52', '时尚休闲');
INSERT INTO `attribute_option` VALUES ('52', '商务休闲 ');
INSERT INTO `attribute_option` VALUES ('52', '英伦风格');
INSERT INTO `attribute_option` VALUES ('52', '欧美风格');
INSERT INTO `attribute_option` VALUES ('52', '日韩个性 ');
INSERT INTO `attribute_option` VALUES ('52', '青春休闲 ');
INSERT INTO `attribute_option` VALUES ('52', '原创设计');
INSERT INTO `attribute_option` VALUES ('52', '运动风格');
INSERT INTO `attribute_option` VALUES ('52', '学院风格');
INSERT INTO `attribute_option` VALUES ('52', '商务正装 ');
INSERT INTO `attribute_option` VALUES ('53', '长袖');
INSERT INTO `attribute_option` VALUES ('53', '短袖');
INSERT INTO `attribute_option` VALUES ('53', '七分袖 ');
INSERT INTO `attribute_option` VALUES ('54', '长袖');
INSERT INTO `attribute_option` VALUES ('54', '短袖 ');
INSERT INTO `attribute_option` VALUES ('55', '时尚休闲');
INSERT INTO `attribute_option` VALUES ('55', '商务休闲');
INSERT INTO `attribute_option` VALUES ('55', '商务正装');
INSERT INTO `attribute_option` VALUES ('55', '英伦风格 ');
INSERT INTO `attribute_option` VALUES ('55', '日韩个性 ');
INSERT INTO `attribute_option` VALUES ('55', '欧美风格 ');
INSERT INTO `attribute_option` VALUES ('55', '原创设计 ');
INSERT INTO `attribute_option` VALUES ('56', '宽松型');
INSERT INTO `attribute_option` VALUES ('56', '修身型 ');
INSERT INTO `attribute_option` VALUES ('57', '时尚休闲');
INSERT INTO `attribute_option` VALUES ('57', '商务休闲');
INSERT INTO `attribute_option` VALUES ('57', '商务正装 ');
INSERT INTO `attribute_option` VALUES ('57', '英伦风格 ');
INSERT INTO `attribute_option` VALUES ('57', '日韩个性');
INSERT INTO `attribute_option` VALUES ('57', '原创设计 ');
INSERT INTO `attribute_option` VALUES ('57', '欧美风格 ');
INSERT INTO `attribute_option` VALUES ('57', '青春休闲 ');
INSERT INTO `attribute_option` VALUES ('58', '宽松型');
INSERT INTO `attribute_option` VALUES ('58', '修身型');
INSERT INTO `attribute_option` VALUES ('59', '商务休闲');
INSERT INTO `attribute_option` VALUES ('59', '商务正装 ');
INSERT INTO `attribute_option` VALUES ('60', '长裤');
INSERT INTO `attribute_option` VALUES ('60', '短裤 ');
INSERT INTO `attribute_option` VALUES ('61', '中长款 ');
INSERT INTO `attribute_option` VALUES ('61', '短款');
INSERT INTO `attribute_option` VALUES ('61', '长款');
INSERT INTO `attribute_option` VALUES ('62', '时尚休闲 ');
INSERT INTO `attribute_option` VALUES ('62', '商务休闲');
INSERT INTO `attribute_option` VALUES ('62', '英伦风格');
INSERT INTO `attribute_option` VALUES ('62', '日韩个性 ');
INSERT INTO `attribute_option` VALUES ('62', '商务正装');
INSERT INTO `attribute_option` VALUES ('62', '运动风格 ');
INSERT INTO `attribute_option` VALUES ('62', '欧美风格 ');
INSERT INTO `attribute_option` VALUES ('62', '青春休闲 ');
INSERT INTO `attribute_option` VALUES ('62', '原创设计 ');
INSERT INTO `attribute_option` VALUES ('63', '修身型');
INSERT INTO `attribute_option` VALUES ('63', '直筒型 ');
INSERT INTO `attribute_option` VALUES ('63', '宽松型');
INSERT INTO `attribute_option` VALUES ('64', '翻领 ');
INSERT INTO `attribute_option` VALUES ('64', '连帽 ');
INSERT INTO `attribute_option` VALUES ('64', '西装领 ');
INSERT INTO `attribute_option` VALUES ('64', '可脱卸帽 ');
INSERT INTO `attribute_option` VALUES ('64', '双层领');
INSERT INTO `attribute_option` VALUES ('64', '半高领 ');
INSERT INTO `attribute_option` VALUES ('64', '针织领 ');
INSERT INTO `attribute_option` VALUES ('64', '其它 ');
INSERT INTO `attribute_option` VALUES ('65', '套头');
INSERT INTO `attribute_option` VALUES ('65', '开衫 ');
INSERT INTO `attribute_option` VALUES ('66', '连帽 ');
INSERT INTO `attribute_option` VALUES ('66', '立领');
INSERT INTO `attribute_option` VALUES ('66', '圆领 ');
INSERT INTO `attribute_option` VALUES ('66', '翻领 ');
INSERT INTO `attribute_option` VALUES ('66', 'V领');
INSERT INTO `attribute_option` VALUES ('66', '其它 ');
INSERT INTO `attribute_option` VALUES ('66', '高圆领 ');
INSERT INTO `attribute_option` VALUES ('67', '商务休闲');
INSERT INTO `attribute_option` VALUES ('67', '时尚休闲');
INSERT INTO `attribute_option` VALUES ('67', '嘻哈风格 ');
INSERT INTO `attribute_option` VALUES ('67', '英伦风格');
INSERT INTO `attribute_option` VALUES ('67', '运动风格 ');
INSERT INTO `brand` VALUES ('1', '2013-01-01 11:29:32', '2013-01-01 12:57:18', '1', '<img src=\"http://storage.shopxx.net/demo-image/3.0/201301/32937deb-f9c7-4baf-87ec-9d7c140e6f56.jpg\" />', 'http://storage.shopxx.net/demo-image/3.0/brand/vimly.gif', '梵希蔓', '1', null);
INSERT INTO `brand` VALUES ('2', '2013-01-01 12:00:52', '2013-01-01 12:57:24', '2', '<img src=\"http://storage.shopxx.net/demo-image/3.0/201301/4a43f5da-bd99-4e73-8a45-c3cf97df5bc1.jpg\" />', 'http://storage.shopxx.net/demo-image/3.0/brand/eifini.gif', '伊芙丽', '1', 'http://www.eifini.com');
INSERT INTO `brand` VALUES ('3', '2013-01-01 12:30:29', '2013-01-01 12:57:28', '3', '<img src=\"http://storage.shopxx.net/demo-image/3.0/201301/393335cd-fa85-4697-9a35-be7920533923.jpg\" />', 'http://storage.shopxx.net/demo-image/3.0/brand/sentubila.gif', '尚都比拉', '1', 'http://www.shangdubila.net');
INSERT INTO `brand` VALUES ('4', '2013-01-01 14:51:49', '2013-01-01 16:47:22', '4', '森马，国内休闲服行业迅速崛起的领军品牌。森马集团有限公司以“创大众服饰名牌”为发展宗旨，积极推行特许经营发展模式，休闲装和童装品牌连锁网点遍布全国二十九个省、市、自治区、直辖市，形成了完整的市场网络格局。集团公司现有休闲装 “semir”及童装“balabala”等两个知名服装品牌。森马集团有限公司于1996年12月18日创立于浙江省温州市，是一家以虚拟经营模式为特色，以系列休闲服饰为主导产业的无区域集团。公司注册资本为人民币2.38亿元，总资产达10多亿元，是温州市大企业大集团之一。', 'http://storage.shopxx.net/demo-image/3.0/brand/semir.gif', '森马', '1', 'http://www.semir.com');
INSERT INTO `brand` VALUES ('5', '2013-01-01 15:01:58', '2013-01-01 12:49:05', '5', '<img src=\"http://storage.shopxx.net/demo-image/3.0/201301/84a3cc7a-c43b-4efc-8ed1-ba104cfb9a62.jpg\" />', 'http://storage.shopxx.net/demo-image/3.0/brand/yishion.gif', '以纯', '1', 'http://www.yishion.com.cn');
INSERT INTO `brand` VALUES ('6', '2013-01-01 15:09:52', '2013-01-01 16:48:31', '6', '李宁公司是中国家喻户晓的“体操王子”李宁先生在1990年创立的体育用品公司。经过二十多年的探索，李宁公司已逐步成为代表中国的、国际领先的运动品牌公司。从成立初期率先在全国建立特许专卖营销体系到持续多年赞助中国体育代表团参加国内外各种赛事；从成为国内第一家实施ERP的体育用品企业到不断进行品牌定位的调整，再到2004年6月在香港的上市，李宁公司经历了中国民族企业的发展与繁荣。<br />\r\n李宁公司拥有品牌营销、研发、设计、制造、经销及零售能力，产品主要包括自有李宁品牌生产的运动及休闲鞋类、服装、器材和配件产品。主要采用外包生产和特许分销商模式，在中国已经建立庞大的供应链管理体系以及分销和零售网络，截止2011年末，李宁品牌店铺在中国境内总数达到8255间，并且在东南亚、中亚、欧洲等地区开拓业务。<br />\r\n李宁公司还采取多品牌业务发展的策略，在聚焦自有核心李宁品牌的同时，还(i)与Aigle International S.A成立合资经营，并获授予专营权在中国生产、推广、分销及销售法国AIGLE（艾高）品牌户外运动用品；(ii)透过附属公司从事生产、研发、推广及销售红双喜品牌乒乓球及其它体育器材；(iii)获Lotto Sport Italia S.p.A旗下公司授予独家特许权，在中国开发、制造、推广、分销及销售意大利运动时尚Lotto（乐途）品牌特许产品；及(iv)从事Kason（凯胜）品牌羽毛球专业产品的研发、制造及销售。<br />\r\n创新是李宁品牌发展的根本。李宁公司自成立之初就非常重视原创设计。1998年建立了中国第一家服装与鞋产品设计开发中心，率先成为自主开发的中国体育用品公司。2004年8月，香港设计研发中心成立，集中负责设计李宁品牌服装产品。并且与国内外各大知名高校和研究机构保持密切合作。<br />', 'http://storage.shopxx.net/demo-image/3.0/brand/lining.gif', '李宁', '1', 'http://www.li-ning.com.cn');
INSERT INTO `brand` VALUES ('7', '2013-01-01 15:17:12', '2013-01-01 16:48:51', '7', '耐克是全球著名的体育用品制造商，总部位于美国俄勒冈州，生产的体育用品包罗万象：服装、鞋类、运动器材等。<br />\r\n耐克一直将激励全世界的每一位运动员并为其献上最好的产品视为光荣的任务。耐克的语言就是运动的语言。耐克公司投入了大量的人力、物力用于新产品的开发和研制。耐克首创的气垫技术给体育界带来了一场革命。运用这项技术制造出的运动鞋可以很好地保护运动员的脚踝，防止其在作剧烈运动时扭伤。<br />\r\n耐克 (Nike) 被誉为是“近20年世界新创建的最成功的消费品公司”。耐克 (Nike) 运动鞋除了强化高科技运动性能，如今更讲究时尚的外形设计，频频与各国各界潮流达人合作推出联名限量版。2009年初陈冠希的Clot品牌与耐克 (Nike) 的联名新款红色中国鞋 Clot×Nike AIR FORCE 1 在上海一上市，即成为疯抢对象。在美国，有高达七成的青少年的梦想是有一双耐克 (Nike) 鞋。<br />', 'http://storage.shopxx.net/demo-image/3.0/brand/nike.gif', '耐克', '1', 'http://www.nike.com');
INSERT INTO `brand` VALUES ('8', '2013-01-01 15:22:00', '2013-01-01 16:49:21', '8', '阿迪达斯的目标是协调与员工的私人和家庭需要的阿迪达斯集团的商业利益。提出工作与生活平衡方案：面向家庭的服务，灵活的工作时间和地点，人的发展和领导能力相关的工作与生活的平衡。<br />\r\n阿迪达斯目前分为三个系列，分别为：运动表现系列（三条纹LOGO）、运动传统系列（三叶草LOGO)、运动时尚系列(球状内含三条纹LOGO)。<br />\r\n运动表现系列专门致力于大众体育运动事业，其定位是大众化的运动风潮，采用阿迪三条纹LOGO，价格较易大众所接受。<br />\r\n运动传统系列是阿迪达斯的经典系列，其定位是复古经典风潮，较之运动表现系列更为时尚、高端一些。运动传统系列采用阿迪三叶草LOGO（也是阿迪较早之前的LOGO），因该系列推出的多为限量产品所以价格较易为中高收入人群所接受。<br />', 'http://storage.shopxx.net/demo-image/3.0/brand/adidas.gif', '阿迪达斯', '1', 'http://www.adidas.com');
INSERT INTO `brand` VALUES ('9', '2013-01-01 15:48:29', '2013-01-01 16:50:55', '9', 'Jack &amp; Jones是针对年龄在18岁到30岁之间的喜欢穿着随意、流行和时尚的男士们设计的。Jack &amp; Jones的设计迎合了国际大都市男士的生活品位，他们喜欢一种独特、轮廓鲜明而朴实的风格，同时采用高品质、时兴和新颖的面料制作的服装。<br />\r\nJack &amp; Jones品牌诞生于1975年，以其简洁纯粹的风格吸引全球追求时尚男性的目光，代表了欧洲时尚潮流的男装品牌，同时也是都市风格服装的典范品牌。<br />\r\nJack &amp; Jones是时尚男装里非常流行的品牌，与女装的ONLY、VERO MODA和男装SELECTED同属丹麦的BESTSELLER公司。他们经营各种男装，有休闲，正装等，还有各种配饰。<br />\r\n杰克琼斯(Jack &amp; Jones) 男装是设计给机敏，明智，受过良好教育，热衷社会活动的都市轻熟男。穿着杰克琼斯(Jack &amp; Jones) 的男人是对现代服装有着自己独特的感受，同时关注国际时装市场趋势的现代人。<br />', 'http://storage.shopxx.net/demo-image/3.0/brand/jackjones.gif', 'Jack Jones', '1', 'http://www.jackjones.com');
INSERT INTO `brand` VALUES ('10', '2013-01-01 16:09:39', '2013-01-01 16:51:08', '10', '七匹狼男装是中国男装行业开创性品牌，始终致力于为消费者提供满足现代多元化生活需求的高品质服装产品。“男人不只一面”，七匹狼以“品格男装”突显国际化品质和中西兼容的文化格调，以时尚传承经典，以中国面向世界。', 'http://storage.shopxx.net/demo-image/3.0/brand/septwolves.gif', '七匹狼', '1', 'http://www.septwolves.com');
INSERT INTO `brand` VALUES ('11', '2013-01-01 16:21:57', '2013-01-01 16:51:53', '11', '恒源祥，创立于1927年的中国上海，产品涵盖绒线、针织、服饰、家纺等大类，绒线、羊毛衫综合销量常年保持同行业第一。<br />\r\n恒源祥既是中国进入市场经济后最早实施品牌运营的企业（1991年），又是中国最早进行特许经营的企业（1999年）。目前拥有98家加盟工厂，400多家加盟销售商、分销商以及5000多个加盟销售网点。中国省级市场销售网点涵盖率为100%，地、市级市场网点覆盖率超过90%，县级市场网点覆盖率超过60%。<br />\r\n品牌经营20年以来，恒源祥品牌获得了巨大的发展，品牌的价值得到了显著的提升。1999年，恒源祥获得“中国驰名商标”称号；2006年，在中国最有价值的100个老字号中，恒源祥位居第二；同年，恒源祥荣膺行业首家全国质量奖；2007年，由世界品牌实验室发布的中国500最具价值品牌排行榜中，恒源祥位列64位，品牌价值94.58亿元；2008年，恒源祥进入“亚洲品牌500强”，位列336位；2010年恒源祥再次入选《亚洲品牌500强》，排名跃升为203位。恒源祥集团做了大量的社会责任工作，所有的活动都是围绕着我们是国家的一员、我们是社会的一员，为社会创造价值为基本出发点，是恒源祥集团勇于承担社会责任的具体表现。未来，我们还将坚定不移地践行使命、精神、价值观，勇于承担社会责任，向成为历史的一部分的目的而持续奋斗。<br />', 'http://storage.shopxx.net/demo-image/3.0/brand/hengyuanxiang.gif', '恒源祥', '1', 'http://www.g8888.com');
INSERT INTO `brand` VALUES ('12', '2013-01-01 16:26:20', '2013-01-01 16:52:07', '12', '圣得西（集团）有限公司始创于1989年，公司主要从事西服、西裤、休闲上衣、茄克、T恤、休闲裤、毛衫、衬衣、皮具等男士正装和商务休闲系列化产品的开发、生产和销售，目前拥有“圣得西”、“圣奥威斯”等品牌。公司先后在巴黎、上海建立研发设计中心，引进意大利、日本、德国等国家20余条顶级生产线，聚结世界前沿的服装技术，为中国男士量身打造优雅、舒展的圣得西。历年来，圣得西以其款式新颖、面料精美、工艺精湛而著称，是目前国内高级男士正装和休闲装的代表。', 'http://storage.shopxx.net/demo-image/3.0/brand/sundance.gif', '圣得西', '1', 'http://www.sundance.com.cn');
INSERT INTO `brand` VALUES ('13', '2013-01-01 16:37:34', '2013-01-01 16:52:18', '13', '品牌介绍：	猫人集团旗下成熟女性内衣品牌，其前身是以\"Maoren\"为英文名称的猫人品牌。\"猫人经典\"融合猫人品牌与产品十年历炼精髓，以成熟、品位、性感、经典传承为核心设计风格， 针对35-45岁女性人群身理特点，主力开发高端暖衣、调整型塑身内衣产品，致力于提升都市成熟女性的高品质生活。<br />\r\n品牌定位：	成熟、品位、经典、性感<br />\r\n目标人群：	35-45岁为主的都市成熟女性。成熟、自信，有较好的经济基础，追求高品质生活。在生命的成熟阶段，准备释放全部的魅力，捍卫自己的家庭、事业以及对青春的美好留念。<br />', 'http://storage.shopxx.net/demo-image/3.0/brand/maoren.gif', '猫人', '1', 'http://www.maoren.net');
INSERT INTO `brand` VALUES ('14', '2013-01-01 16:41:00', '2013-01-01 16:55:25', '14', '\"北极绒\"属上海赛洋集团旗下品牌，诞生于1998年，是中国最早的保暖内衣龙头品牌之一。产品一经问世，依靠先进的科技理念、优良的品质、大众化消费，以一骑绝尘之势迅速占领市场。赵本山代言广告语\"怕冷就穿北极绒，地球人都知道\"，更是迅速传遍全国各地、街头巷尾，成为人们茶余饭后的谈资。北极绒也借此迅速蹿升为中国保暖内衣行业的重要领导品牌之一。<br />\r\n\"千淘万漉虽辛苦，吹尽黄沙始到金\"。十四年，梦想引领北极绒一直向前，在前进的道路上，北极绒不断实施产品创新改革、营销模式改革。目前，其发展已经涵盖内衣、家纺、男装三大类共计几千个品类，销售渠道网络覆盖全国28个省、市、自治区6000多个终端，产品品质和声誉赢得了消费者的一致认可。十四年发展历程中，北极绒先后荣获\"中国驰名商标\"、\"国家免检产品\"、\"2007—2011年中国最具价值500强品牌\"、\"2001-2010年连续十年全国同类产品销量第一\"、\"中国内衣十大影响力品牌\"、\"中国保暖内衣十强品牌\"、\"生态纺织品认证\"、\"保暖内衣国家标准主要起草单位\"、\"中国针织工业协会标准保温率唯一认证\"等累累殊荣，以唯一持续十四年长青、十四年辉煌的业绩，成为内衣行业无可争议的领袖品牌。目前，北极绒的品牌价值被世界品牌实验室评估为47.35亿元人民币。北极绒公司拥有20多项专利和5000多家由各级代理商组成的庞大完善的销售网络，产品覆盖除港澳台外的全国所有省、市、自治区，截止目前，仅保暖内衣一个品类就创造了累计销售近4000万套的经营神话，被誉为中国保暖内衣的领袖企业。<br />\r\n2008年开始，公司秉承\"合作•分享•共赢\"的价值观，进行多方位资源整合，实施品牌联合大发展。\"百年梦圆，大国崛起\"，北极绒正以领袖风范，高扛民族大旗，引领中国纺织服装企业走向国际舞台，立于世界品牌之林！<br />', 'http://storage.shopxx.net/demo-image/3.0/brand/beijirong.gif', '北极绒', '1', 'http://www.beijirong.com.cn');
INSERT INTO `brand` VALUES ('15', '2013-01-01 14:21:21', '2013-01-01 12:57:01', '15', '美特斯邦威是周成建创立于温州的一家民营企业，1995年4月22日温州解放剧院第一家专卖店的开业标志着“美特斯邦威”品牌的正式面世。创牌以来，企业坚持走品牌连锁经营的可持续发展道路，在国内服装行业率先采取“虚拟经营”的业务模式，依靠品牌营销、设计、信息化和人才队伍建设在激烈的市场竞争中形成了自己的核心竞争力，获得了令世人瞩目的成就。2004 年，“美特斯邦威 ”全系统销售额突破了25亿元。截止2005年11月30日，集团在中国已拥有上海、温州、北京、杭州、重庆、成都、广州、沈阳、西安 、天津、济南十一家分公司，近1500家加盟和直营店铺（其中面积超过500平米的旗舰店有15家），公司直营体系员工达到了4000多人，全系统员工超过了数万人，成为中国休闲服饰行业的龙头企业之一。', 'http://storage.shopxx.net/demo-image/3.0/brand/metersbonwe.gif', '美特斯·邦威', '1', 'http://www.metersbonwe.com');
INSERT INTO `brand` VALUES ('16', '2013-01-01 14:37:26', '2013-01-01 12:57:05', '16', '1993年，真维斯进军中国内地市场，在上海开设了第一间JEANSWEST真维斯专卖店。多年来，真维斯以“名牌大众化”的经营理念，“物超所值”的市场策略，稳占休闲装市场的领袖地位。现今，真维斯已在国内20多个省市开设了2000多间专卖店，拥有现时中国最大的休闲服饰销售网络。&nbsp;<br />\r\n<br />\r\n真维斯的经营理念是“名牌大众化”——少数人拥有的物品，令大众都能拥有；市场策略是“物超所值”——高价值的物品，低价钱销售。<br />\r\n真维斯服装是为广大年轻人设计的，将每季最新的潮流元素融入服装当中，以易穿易搭配的款式来吸引顾客。多年来，真维斯以大众潮流的休闲风格，深受年轻人的喜爱，已经成为年轻一代的时尚必需品。<br />\r\n<br />\r\n真维斯为了维护和加强品牌的形象，从连锁店铺的购物环境、店内布置、商品陈列、耐心的微笑服务、全面到位的售后服务、营业员的招聘选拔和工作培训及指导等方面入手，提升服务水平。<br />\r\n<br />\r\n“穷则独善其身，达则兼善天下”是真维斯企业文化的体现。目前在国内贫困地区以真维斯命名的希望小学共有36间。2008年真维斯为“希望小学快乐运动会”捐助130多万元。同年，捐资220万修建55个贫困小学操场为贫困小学建设贡献力量。此外，真维斯还分别斥资2700万元和600万元，设立了“真维斯大学生助学基金”和“真维斯希望教师基金”，为教育事业出一份力。面对灾情时，真维斯向四川汶川和青海玉树共计捐出超过1000万元人民币的善款。并通过举办“大爱中华行——真维斯·真的更精彩”慈善歌会行动，将慈善与娱乐相结合，呼吁更多年轻人关注慈善、奉献爱心。同时真维斯还通过开展“中国真维斯杯休闲装设计大赛”这一活动，给年轻人提供一个展示潜能、相互交流的平台。以体现社会价值为核心的品牌理念已深深牵动每一位真维斯顾客。<br />\r\n<br />\r\n“真维斯”是一个年轻﹑健康﹑向上的服饰品牌。“真维斯”倡导一种真诚﹑乐观的生活态度。真维斯为渴望被关注﹑被认可的年轻人打造最真的生活态度。做回真我，穿回真我，分享真我。 “真的·更精彩” 真维斯！<br />', 'http://storage.shopxx.net/demo-image/3.0/brand/jeanswest.gif', '真维斯', '1', 'http://www.jeanswest.com');
INSERT INTO `brand` VALUES ('17', '2013-01-01 14:45:31', '2013-01-01 12:57:10', '17', '唐狮“TONLION”直属于宁波博洋服饰有限公司，成立于1994年，以经营男女大众休闲服饰为主。10多年来，“唐狮”服饰长期坚持不断改善产品品质和提供专业优质的服务造福大众。<br />\r\n唐狮坚持“我有我的方式”的品牌信念，为中国的年轻潮人度身打造专属于他们的服饰品牌。2005年以来，连续三年被世界品牌实验室评定为“中国500最具价值品牌”，品牌价值31.92亿元；之后，唐狮又接连尽揽“中国驰名商标”、“中国青年最喜爱的休闲服饰品牌”、“中国服饰品牌年度大奖”等多项傲人荣誉于一身。<br />\r\n2009年初，唐狮顺应潮流，快人一步加入电子商务市场，不仅为品牌成功打开“网销化”布局的第一步，更为热火朝天的网购服装市场添了一笔佳绩。09年底便成功挤入淘宝商城男装分类销量前三名，至今一直保持领先。<br />\r\n2011年，唐狮的目标是突玻2个亿，全方位的打造电子商务第一品牌。在原有淘宝平台的基础上，又积极将营销领域延伸到拍拍、京东、趣点等国内其它网销平台，力求多方面、多层次的发展。通过各平台不同的营销模式，不同的销售群体，在反复的对比中，唐狮积累到更多关于电子商务的宝贵经验，为今后平台的不断完善和壮大，莫定了坚实的基础。<br />\r\n从曾经的服饰品牌新人王，到今天的潮流品牌星势力。每一天，唐狮都在飞速成长，每一年，唐狮都在撰写全新的篇章。唐潮盛狮崛起，辉煌未完待续。<br />', 'http://storage.shopxx.net/demo-image/3.0/brand/tonlion.gif', '唐狮', '1', 'http://www.tonlion.com');
INSERT INTO `consultation` VALUES ('1', '2013-01-01 10:44:26', '2013-01-01 10:44:26', '这款衣服样式挺漂亮的,担心我穿会大了，有没有XS码呢？', '192.168.1.1', '', null, '1', '80');
INSERT INTO `consultation` VALUES ('2', '2013-01-01 10:50:25', '2013-01-01 10:50:25', '想请问该衣服M，L号具体的长度，胸围是多少？', '192.168.1.1', '', null, '1', '1');
INSERT INTO `consultation` VALUES ('3', '2013-01-01 10:50:53', '2013-01-01 10:50:53', '请问这个衣服清洗的时候会不会掉色呢？衣服有多长啊？', '192.168.1.1', '', null, '1', '3');
INSERT INTO `consultation` VALUES ('4', '2013-01-01 10:52:59', '2013-01-01 10:52:59', '这衣服显得好有气质噢……可惜卡其色没有小码，什么时候有小码呢？好期待快点买到哦。', '192.168.1.1', '', null, '1', '122');
INSERT INTO `consultation` VALUES ('5', '2013-01-01 11:00:58', '2013-01-01 11:00:58', '请问这款衣服支持货到付款吗？', '192.168.1.1', '', null, '1', '1');
INSERT INTO `consultation` VALUES ('6', '2013-01-01 11:33:46', '2013-01-01 11:33:46', '我身高172mm，体重60kg，应该选多大的合适？', '192.168.1.1', '', null, '1', '42');
INSERT INTO `consultation` VALUES ('7', '2013-01-01 11:34:29', '2013-01-01 11:34:29', '送货到上海快速要多久？', '192.168.1.1', '', null, '1', '42');
INSERT INTO `consultation` VALUES ('8', '2013-01-01 11:37:05', '2013-01-01 11:37:05', '如果穿着不合身，可以换货吗？', '192.168.1.1', '', null, '1', '58');
INSERT INTO `consultation` VALUES ('9', '2013-01-01 11:38:42', '2013-01-01 11:38:42', '请问一下，我身高182，体重82公斤，腰围2尺7左右，穿哪个尺码的呀？', '192.168.1.1', '', null, '1', '66');
INSERT INTO `consultation` VALUES ('10', '2013-01-01 11:39:23', '2013-01-01 11:39:23', 'M号的是适合多高的人穿的？还有L呢？', '192.168.1.1', '', null, '1', '98');
INSERT INTO `consultation` VALUES ('11', '2013-01-01 11:40:51', '2013-01-01 11:40:51', '我老公身高174CM，体重73公斤至75公斤，买多少码？', '192.168.1.1', '', null, '1', '109');
INSERT INTO `delivery_center` VALUES ('1', '2013-01-01 09:07:46', '2013-01-01 09:07:46', '新建安天坛东路888号', '北京市东城区', '李小明', '', null, '13888888888', '北京发货中心', '010-88888888', '100062', '2');
INSERT INTO `delivery_corp` VALUES ('1', '2013-01-01 13:30:34', '2013-01-01 13:31:08', '1', 'yuantong', '圆通速递', 'http://www.yto.net.cn');
INSERT INTO `delivery_corp` VALUES ('2', '2013-01-01 13:30:39', '2013-01-01 13:31:13', '2', 'shentong', '申通快递', 'http://www.sto.cn');
INSERT INTO `delivery_corp` VALUES ('3', '2013-01-01 13:30:47', '2013-01-01 13:31:16', '3', 'yunda', '韵达快运', 'http://www.yundaex.com');
INSERT INTO `delivery_corp` VALUES ('4', '2013-01-01 13:30:55', '2013-01-01 13:31:19', '4', 'shunfeng', '顺丰速递', 'http://www.sf-express.com');
INSERT INTO `delivery_template` VALUES ('1', '2013-01-01 09:02:36', '2013-01-01 09:11:18', 'http://storage.shopxx.net/demo-image/3.0/delivery_template/yto.png', '<DIV class=item style=\"Z-INDEX: 10; LEFT: 102px; TOP: 127px\"><PRE>${deliveryCenter.name}</PRE>\r\n<DIV class=resize></DIV></DIV>\r\n<DIV class=item style=\"Z-INDEX: 9; LEFT: 103px; TOP: 98px\"><PRE>${deliveryCenter.contact}</PRE>\r\n<DIV class=resize></DIV></DIV>\r\n<DIV class=item style=\"Z-INDEX: 11; LEFT: 102px; TOP: 164px\"><PRE>${deliveryCenter.areaName}</PRE>\r\n<DIV class=resize></DIV></DIV>\r\n<DIV class=item style=\"Z-INDEX: 3; LEFT: 116px; TOP: 227px\"><PRE>${deliveryCenter.mobile}</PRE>\r\n<DIV class=resize></DIV></DIV>\r\n<DIV class=item style=\"Z-INDEX: 5; LEFT: 278px; TOP: 227px\"><PRE>${deliveryCenter.phone}</PRE>\r\n<DIV class=resize></DIV></DIV>\r\n<DIV class=\"item selected\" style=\"Z-INDEX: 7; LEFT: 459px; TOP: 113px\"><PRE>${order.consignee}</PRE>\r\n<DIV class=resize></DIV></DIV>\r\n<DIV class=item style=\"Z-INDEX: 10; LEFT: 455px; TOP: 171px\"><PRE>${order.areaName}</PRE>\r\n<DIV class=resize></DIV></DIV>\r\n<DIV class=item style=\"Z-INDEX: 15; LEFT: 408px; TOP: 203px\"><PRE>${order.address}</PRE>\r\n<DIV class=resize></DIV></DIV>\r\n<DIV class=item style=\"Z-INDEX: 1; LEFT: 50px; TOP: 198px\"><PRE>${deliveryCenter.address}</PRE>\r\n<DIV class=resize></DIV></DIV>\r\n<DIV class=item style=\"Z-INDEX: 18; LEFT: 501px; TOP: 226px\"><PRE>${order.phone}</PRE>\r\n<DIV class=resize></DIV></DIV>', '483', '', null, '圆通快递', '0', '0', '800');
INSERT INTO `friend_link` VALUES ('1', '2013-01-01 11:09:50', '2013-01-01 12:01:27', '1', 'http://storage.shopxx.net/demo-image/3.0/friend_link/shopxx.gif', 'SHOP++官网', '1', 'http://www.shopxx.net');
INSERT INTO `friend_link` VALUES ('2', '2013-01-01 11:11:21', '2013-01-01 12:01:34', '2', 'http://storage.shopxx.net/demo-image/3.0/friend_link/shopxx.gif', 'SHOP++论坛', '1', 'http://bbs.shopxx.net');
INSERT INTO `friend_link` VALUES ('3', '2013-01-01 11:12:16', '2013-01-01 12:01:41', '3', 'http://storage.shopxx.net/demo-image/3.0/friend_link/alipay.gif', '支付宝', '1', 'http://www.alipay.com');
INSERT INTO `friend_link` VALUES ('4', '2013-01-01 11:14:01', '2013-01-01 12:03:36', '4', 'http://storage.shopxx.net/demo-image/3.0/friend_link/tenpay.gif', '财付通', '1', 'http://www.tenpay.com');
INSERT INTO `friend_link` VALUES ('5', '2013-01-01 11:16:35', '2013-01-01 12:41:13', '5', 'http://storage.shopxx.net/demo-image/3.0/friend_link/chinapay.gif', '银联在线', '1', 'http://www.chinapay.com');
INSERT INTO `friend_link` VALUES ('6', '2013-01-01 11:23:37', '2013-01-01 12:42:50', '6', 'http://storage.shopxx.net/demo-image/3.0/friend_link/99bill.gif', '快钱支付', '1', 'http://www.99bill.com');
INSERT INTO `friend_link` VALUES ('7', '2013-01-01 11:23:57', '2013-01-01 12:44:19', '7', 'http://storage.shopxx.net/demo-image/3.0/friend_link/admin5.gif', 'A5下载', '1', 'http://down.admin5.com');
INSERT INTO `friend_link` VALUES ('8', '2013-01-01 11:26:27', '2013-01-01 12:45:31', '8', 'http://storage.shopxx.net/demo-image/3.0/friend_link/kuaidi100.gif', '快递100', '1', 'http://www.kuaidi100.com');
INSERT INTO `friend_link` VALUES ('9', '2013-01-01 12:52:27', '2013-01-01 12:52:36', '9', 'http://storage.shopxx.net/demo-image/3.0/friend_link/cnzz.gif', '站长统计', '1', 'http://www.cnzz.com');
INSERT INTO `goods` VALUES ('1', '2013-01-01 16:39:04', '2013-01-01 16:39:04');
INSERT INTO `goods` VALUES ('2', '2013-01-01 16:41:26', '2013-01-01 16:41:26');
INSERT INTO `goods` VALUES ('3', '2013-01-01 16:43:42', '2013-01-01 16:43:42');
INSERT INTO `goods` VALUES ('4', '2013-01-01 13:28:34', '2013-01-01 13:28:34');
INSERT INTO `goods` VALUES ('5', '2013-01-01 13:43:35', '2013-01-01 13:43:35');
INSERT INTO `goods` VALUES ('6', '2013-01-01 13:43:56', '2013-01-01 13:43:56');
INSERT INTO `goods` VALUES ('7', '2013-01-01 13:48:14', '2013-01-01 13:48:14');
INSERT INTO `goods` VALUES ('8', '2013-01-01 13:48:27', '2013-01-01 13:48:27');
INSERT INTO `goods` VALUES ('9', '2013-01-01 13:53:14', '2013-01-01 13:53:14');
INSERT INTO `goods` VALUES ('10', '2013-01-01 13:54:19', '2013-01-01 13:54:19');
INSERT INTO `goods` VALUES ('11', '2013-01-01 13:58:15', '2013-01-01 13:58:15');
INSERT INTO `goods` VALUES ('12', '2013-01-01 13:59:32', '2013-01-01 13:59:32');
INSERT INTO `goods` VALUES ('13', '2013-01-01 14:04:07', '2013-01-01 14:04:07');
INSERT INTO `goods` VALUES ('14', '2013-01-01 14:04:57', '2013-01-01 14:04:57');
INSERT INTO `goods` VALUES ('15', '2013-01-01 14:07:46', '2013-01-01 14:07:46');
INSERT INTO `goods` VALUES ('16', '2013-01-01 14:07:49', '2013-01-01 14:07:49');
INSERT INTO `goods` VALUES ('17', '2013-01-01 14:10:21', '2013-01-01 14:10:21');
INSERT INTO `goods` VALUES ('18', '2013-01-01 14:11:08', '2013-01-01 14:11:08');
INSERT INTO `goods` VALUES ('19', '2013-01-01 14:14:36', '2013-01-01 14:14:36');
INSERT INTO `goods` VALUES ('20', '2013-01-01 14:15:46', '2013-01-01 14:15:46');
INSERT INTO `goods` VALUES ('21', '2013-01-01 14:18:49', '2013-01-01 14:18:49');
INSERT INTO `goods` VALUES ('22', '2013-01-01 14:23:06', '2013-01-01 14:23:06');
INSERT INTO `goods` VALUES ('23', '2013-01-01 14:25:47', '2013-01-01 14:25:47');
INSERT INTO `goods` VALUES ('24', '2013-01-01 14:27:25', '2013-01-01 14:27:25');
INSERT INTO `goods` VALUES ('25', '2013-01-01 14:29:11', '2013-01-01 14:29:11');
INSERT INTO `goods` VALUES ('26', '2013-01-01 14:31:57', '2013-01-01 14:31:57');
INSERT INTO `goods` VALUES ('27', '2013-01-01 14:32:24', '2013-01-01 14:32:24');
INSERT INTO `goods` VALUES ('28', '2013-01-01 14:35:49', '2013-01-01 14:35:49');
INSERT INTO `goods` VALUES ('29', '2013-01-01 14:37:59', '2013-01-01 14:37:59');
INSERT INTO `goods` VALUES ('30', '2013-01-01 14:41:05', '2013-01-01 14:41:05');
INSERT INTO `goods` VALUES ('31', '2013-01-01 14:44:18', '2013-01-01 14:44:18');
INSERT INTO `goods` VALUES ('32', '2013-01-01 14:48:30', '2013-01-01 14:48:30');
INSERT INTO `goods` VALUES ('33', '2013-01-01 14:51:47', '2013-01-01 14:51:47');
INSERT INTO `goods` VALUES ('34', '2013-01-01 14:59:08', '2013-01-01 14:59:08');
INSERT INTO `goods` VALUES ('35', '2013-01-01 15:03:30', '2013-01-01 15:03:30');
INSERT INTO `goods` VALUES ('36', '2013-01-01 15:04:31', '2013-01-01 15:04:31');
INSERT INTO `goods` VALUES ('37', '2013-01-01 15:07:50', '2013-01-01 15:07:50');
INSERT INTO `goods` VALUES ('38', '2013-01-01 15:08:45', '2013-01-01 15:08:45');
INSERT INTO `goods` VALUES ('39', '2013-01-01 15:10:43', '2013-01-01 15:10:43');
INSERT INTO `goods` VALUES ('40', '2013-01-01 15:13:02', '2013-01-01 15:13:02');
INSERT INTO `goods` VALUES ('41', '2013-01-01 15:14:28', '2013-01-01 15:14:28');
INSERT INTO `goods` VALUES ('42', '2013-01-01 15:15:09', '2013-01-01 15:15:09');
INSERT INTO `goods` VALUES ('43', '2013-01-01 15:16:14', '2013-01-01 15:16:14');
INSERT INTO `goods` VALUES ('44', '2013-01-01 15:17:30', '2013-01-01 15:17:30');
INSERT INTO `goods` VALUES ('45', '2013-01-01 15:19:07', '2013-01-01 15:19:07');
INSERT INTO `goods` VALUES ('46', '2013-01-01 15:19:21', '2013-01-01 15:19:21');
INSERT INTO `goods` VALUES ('47', '2013-01-01 15:20:11', '2013-01-01 15:20:11');
INSERT INTO `goods` VALUES ('48', '2013-01-01 15:21:01', '2013-01-01 15:21:01');
INSERT INTO `goods` VALUES ('49', '2013-01-01 15:23:20', '2013-01-01 15:23:20');
INSERT INTO `goods` VALUES ('50', '2013-01-01 15:33:13', '2013-01-01 15:33:13');
INSERT INTO `goods` VALUES ('51', '2013-01-01 15:49:07', '2013-01-01 15:49:07');
INSERT INTO `goods` VALUES ('52', '2013-01-01 15:54:55', '2013-01-01 15:54:55');
INSERT INTO `goods` VALUES ('53', '2013-01-01 16:11:19', '2013-01-01 16:11:19');
INSERT INTO `goods` VALUES ('54', '2013-01-01 16:56:59', '2013-01-01 16:56:59');
INSERT INTO `goods` VALUES ('55', '2013-01-01 20:19:27', '2013-01-01 20:19:27');
INSERT INTO `goods` VALUES ('56', '2013-01-01 20:23:26', '2013-01-01 20:23:26');
INSERT INTO `goods` VALUES ('57', '2013-01-01 20:27:07', '2013-01-01 20:27:07');
INSERT INTO `goods` VALUES ('58', '2013-01-01 20:30:19', '2013-01-01 20:30:19');
INSERT INTO `goods` VALUES ('59', '2013-01-01 20:33:10', '2013-01-01 20:33:10');
INSERT INTO `goods` VALUES ('60', '2013-01-01 20:35:57', '2013-01-01 20:35:57');
INSERT INTO `goods` VALUES ('61', '2013-01-01 20:38:40', '2013-01-01 20:38:40');
INSERT INTO `goods` VALUES ('62', '2013-01-01 20:41:17', '2013-01-01 20:41:17');
INSERT INTO `member` VALUES ('1', '2013-01-01 20:34:54', '2013-01-01 13:08:53', null, '0.000000000000', null, null, null, null, null, null, null, null, null, null, '0.000000000000', '2013-01-01 00:00:00', 'test@shopxx.net', '0', '', '', null, '2013-01-01 13:08:53', '0', '192.168.1.1', null, 'test', '098f6bcd4621d373cade4e832627b4f6', null, '0', '192.168.1.1', null, null, 'test', null, '13', '1');
INSERT INTO `member_attribute` VALUES ('1', '2013-01-01 12:44:57', '2013-01-01 11:50:50', '1', '', '', '姓名', null, '0');
INSERT INTO `member_attribute` VALUES ('2', '2013-01-01 12:45:19', '2013-01-01 11:50:53', '2', '', '', '性别', null, '1');
INSERT INTO `member_attribute` VALUES ('3', '2013-01-01 12:45:25', '2013-01-01 11:50:55', '3', '', '', '出生日期', null, '2');
INSERT INTO `member_attribute` VALUES ('4', '2013-01-01 12:45:40', '2013-01-01 11:50:58', '4', '', '', '地区', null, '3');
INSERT INTO `member_attribute` VALUES ('5', '2013-01-01 12:45:46', '2013-01-01 11:51:03', '5', '', '', '地址', null, '4');
INSERT INTO `member_attribute` VALUES ('6', '2013-01-01 12:45:51', '2013-01-01 16:02:36', '6', '', '', '邮编', null, '5');
INSERT INTO `member_attribute` VALUES ('7', '2013-01-01 12:45:57', '2013-01-01 16:02:38', '7', '', '', '电话', null, '6');
INSERT INTO `member_attribute` VALUES ('8', '2013-01-01 12:46:02', '2013-01-01 16:02:40', '8', '', '', '手机', null, '7');
INSERT INTO `member_rank` VALUES ('1', '2013-01-01 12:43:30', '2013-01-01 12:43:30', '0.000000', '', '', '普通会员', '1');
INSERT INTO `member_rank` VALUES ('2', '2013-01-01 12:43:53', '2013-01-01 12:43:53', '1000.000000', '', '', '银牌会员', '1');
INSERT INTO `member_rank` VALUES ('3', '2013-01-01 12:44:06', '2013-01-01 12:44:06', '10000.000000', '', '', '金牌会员', '1');
INSERT INTO `member_rank` VALUES ('4', '2013-01-01 12:44:26', '2013-01-01 12:44:26', '100000.000000', '', '', '白金会员', '0.99');
INSERT INTO `member_rank` VALUES ('5', '2013-01-01 23:19:51', '2013-01-01 23:19:51', null, '', '', '贵宾会员', '0.95');
INSERT INTO `navigation` VALUES ('1', '2013-01-01 20:38:34', '2013-01-01 20:38:48', '1', '', '会员中心', '0', '/member/index.jhtml', 'user');
INSERT INTO `navigation` VALUES ('2', '2013-01-01 11:02:34', '2013-01-01 11:02:34', '2', '', '购物指南', '0', '/article/list/3.jhtml', 'cart');
INSERT INTO `navigation` VALUES ('3', '2013-01-01 11:05:00', '2013-01-01 11:05:17', '3', '', '关于我们', '0', '/article/list/7.jhtml', null);
INSERT INTO `navigation` VALUES ('4', '2013-01-01 10:50:13', '2013-01-01 10:50:13', '4', '', '首页', '1', '/', 'home');
INSERT INTO `navigation` VALUES ('5', '2013-01-01 10:50:27', '2013-01-01 10:50:27', '5', '', '时尚女装', '1', '/product/list/1.jhtml', null);
INSERT INTO `navigation` VALUES ('6', '2013-01-01 10:50:38', '2013-01-01 10:50:43', '6', '', '精品男装', '1', '/product/list/2.jhtml', null);
INSERT INTO `navigation` VALUES ('7', '2013-01-01 10:50:59', '2013-01-01 10:50:59', '7', '', '精致内衣', '2', '/product/list/3.jhtml', null);
INSERT INTO `navigation` VALUES ('8', '2013-01-01 10:51:19', '2013-01-01 10:51:19', '8', '', '服饰配件', '1', '/product/list/4.jhtml', null);
INSERT INTO `navigation` VALUES ('9', '2013-01-01 10:51:38', '2013-01-01 10:51:38', '9', '', '时尚女鞋', '1', 'product/list/5.jhtml', null);
INSERT INTO `navigation` VALUES ('10', '2013-01-01 10:51:56', '2013-01-01 10:52:07', '10', '', '流行男鞋', '1', '/product/list/6.jhtml', null);
INSERT INTO `navigation` VALUES ('11', '2013-01-01 10:53:02', '2013-01-01 10:53:02', '11', '', '童装童鞋', '2', 'product/list/9.jhtml', null);
INSERT INTO `navigation` VALUES ('12', '2013-01-01 10:18:21', '2013-01-01 10:19:59', '12', '', '关于我们', '2', '#', null);
INSERT INTO `navigation` VALUES ('13', '2013-01-01 10:18:56', '2013-01-01 10:20:03', '13', '', '联系我们', '2', '#', null);
INSERT INTO `navigation` VALUES ('14', '2013-01-01 10:19:13', '2013-01-01 10:20:06', '14', '', '诚聘英才', '2', '#', null);
INSERT INTO `navigation` VALUES ('15', '2013-01-01 10:19:26', '2013-01-01 10:20:10', '15', '', '法律声明', '2', '#', null);
INSERT INTO `navigation` VALUES ('16', '2013-01-01 10:20:28', '2013-01-01 10:20:34', '16', '', '友情链接', '2', '/friend_link.jhtml', null);
INSERT INTO `navigation` VALUES ('17', '2013-01-01 10:21:26', '2013-01-01 10:21:41', '17', '', '支付方式', '2', '/article/list/4.jhtml', null);
INSERT INTO `navigation` VALUES ('18', '2013-01-01 10:21:55', '2013-01-01 10:22:00', '18', '', '配送方式', '2', '/article/list/5.jhtml', null);
INSERT INTO `navigation` VALUES ('19', '2013-01-01 10:34:07', '2013-01-01 10:34:07', '19', '', 'SAMLL官网', '2', 'http://www.small.net', null);
INSERT INTO `navigation` VALUES ('20', '2013-01-01 10:34:18', '2013-01-01 10:34:18', '20', '', 'SMALL论坛', '2', 'http://bbs.small.net', null);
INSERT INTO `parameter` VALUES ('1', '2013-01-01 17:02:36', '2013-01-01 10:42:18', '1', '风格', '1');
INSERT INTO `parameter` VALUES ('2', '2013-01-01 17:02:36', '2013-01-01 10:42:18', '2', '通勤', '1');
INSERT INTO `parameter` VALUES ('3', '2013-01-01 17:02:36', '2013-01-01 10:42:18', '3', '组合形式', '1');
INSERT INTO `parameter` VALUES ('4', '2013-01-01 17:02:36', '2013-01-01 10:42:18', '4', '裙长', '1');
INSERT INTO `parameter` VALUES ('5', '2013-01-01 17:02:36', '2013-01-01 10:42:18', '5', '款式', '1');
INSERT INTO `parameter` VALUES ('6', '2013-01-01 17:02:36', '2013-01-01 10:42:18', '6', '袖长', '1');
INSERT INTO `parameter` VALUES ('7', '2013-01-01 17:02:36', '2013-01-01 10:42:18', '7', '领型', '1');
INSERT INTO `parameter` VALUES ('8', '2013-01-01 17:02:37', '2013-01-01 10:42:18', '8', '袖型', '1');
INSERT INTO `parameter` VALUES ('9', '2013-01-01 17:02:37', '2013-01-01 10:42:18', '9', '腰型', '1');
INSERT INTO `parameter` VALUES ('10', '2013-01-01 17:02:37', '2013-01-01 10:42:18', '10', '衣门襟', '1');
INSERT INTO `parameter` VALUES ('11', '2013-01-01 17:02:37', '2013-01-01 10:42:18', '11', '裙型', '1');
INSERT INTO `parameter` VALUES ('12', '2013-01-01 17:02:37', '2013-01-01 10:42:18', '12', '图案', '1');
INSERT INTO `parameter` VALUES ('13', '2013-01-01 17:02:37', '2013-01-01 10:42:18', '13', '流行元素/工艺', '1');
INSERT INTO `parameter` VALUES ('14', '2013-01-01 17:02:37', '2013-01-01 10:42:18', '14', '材质', '1');
INSERT INTO `parameter` VALUES ('15', '2013-01-01 17:02:37', '2013-01-01 10:42:18', '15', '主成份含量', '1');
INSERT INTO `parameter` VALUES ('16', '2013-01-01 17:02:37', '2013-01-01 10:42:18', '16', '主材质', '1');
INSERT INTO `parameter` VALUES ('17', '2013-01-01 08:52:45', '2013-01-01 10:42:27', '1', '板型', '2');
INSERT INTO `parameter` VALUES ('18', '2013-01-01 08:52:45', '2013-01-01 10:42:27', '2', '厚薄', '2');
INSERT INTO `parameter` VALUES ('19', '2013-01-01 08:52:45', '2013-01-01 10:42:27', '3', '组合形式', '2');
INSERT INTO `parameter` VALUES ('20', '2013-01-01 08:52:45', '2013-01-01 10:42:27', '4', '风格', '2');
INSERT INTO `parameter` VALUES ('21', '2013-01-01 08:52:45', '2013-01-01 10:42:27', '5', '通勤', '2');
INSERT INTO `parameter` VALUES ('22', '2013-01-01 08:52:45', '2013-01-01 10:42:27', '6', '衣长', '2');
INSERT INTO `parameter` VALUES ('23', '2013-01-01 08:52:45', '2013-01-01 10:42:27', '7', '袖长', '2');
INSERT INTO `parameter` VALUES ('24', '2013-01-01 08:52:45', '2013-01-01 10:42:27', '8', '领子', '2');
INSERT INTO `parameter` VALUES ('25', '2013-01-01 08:52:45', '2013-01-01 10:42:27', '9', '袖型', '2');
INSERT INTO `parameter` VALUES ('26', '2013-01-01 08:52:45', '2013-01-01 10:42:27', '10', '衣门襟', '2');
INSERT INTO `parameter` VALUES ('27', '2013-01-01 08:52:45', '2013-01-01 10:42:27', '11', '图案', '2');
INSERT INTO `parameter` VALUES ('28', '2013-01-01 08:52:45', '2013-01-01 10:42:27', '12', '款式细节', '2');
INSERT INTO `parameter` VALUES ('29', '2013-01-01 08:52:45', '2013-01-01 10:42:27', '13', '面料分类', '2');
INSERT INTO `parameter` VALUES ('30', '2013-01-01 08:52:45', '2013-01-01 10:42:27', '14', '面料主成分含量', '2');
INSERT INTO `parameter` VALUES ('31', '2013-01-01 08:55:24', '2013-01-01 10:42:58', '1', '板型', '3');
INSERT INTO `parameter` VALUES ('32', '2013-01-01 08:55:24', '2013-01-01 10:42:58', '2', '风格', '3');
INSERT INTO `parameter` VALUES ('33', '2013-01-01 08:55:24', '2013-01-01 10:42:58', '3', '通勤', '3');
INSERT INTO `parameter` VALUES ('34', '2013-01-01 08:55:24', '2013-01-01 10:42:58', '4', '衣长', '3');
INSERT INTO `parameter` VALUES ('35', '2013-01-01 08:55:24', '2013-01-01 10:42:58', '5', '袖长', '3');
INSERT INTO `parameter` VALUES ('36', '2013-01-01 08:55:24', '2013-01-01 10:42:58', '6', '袖型', '3');
INSERT INTO `parameter` VALUES ('37', '2013-01-01 08:55:24', '2013-01-01 10:42:58', '7', '领型', '3');
INSERT INTO `parameter` VALUES ('38', '2013-01-01 08:55:24', '2013-01-01 10:42:58', '8', '衣门襟', '3');
INSERT INTO `parameter` VALUES ('39', '2013-01-01 08:55:24', '2013-01-01 10:42:58', '9', '图案', '3');
INSERT INTO `parameter` VALUES ('40', '2013-01-01 08:55:24', '2013-01-01 10:42:58', '10', '款式细节', '3');
INSERT INTO `parameter` VALUES ('41', '2013-01-01 08:55:24', '2013-01-01 10:42:58', '11', '材质主成份含量', '3');
INSERT INTO `parameter` VALUES ('42', '2013-01-01 08:55:24', '2013-01-01 10:42:58', '12', '质地', '3');
INSERT INTO `parameter` VALUES ('43', '2013-01-01 08:57:53', '2013-01-01 10:48:08', '1', '袖长', '4');
INSERT INTO `parameter` VALUES ('44', '2013-01-01 08:57:53', '2013-01-01 10:48:08', '2', '版型', '4');
INSERT INTO `parameter` VALUES ('45', '2013-01-01 08:57:53', '2013-01-01 10:48:08', '3', '领型', '4');
INSERT INTO `parameter` VALUES ('46', '2013-01-01 08:57:53', '2013-01-01 10:48:08', '4', '风格', '4');
INSERT INTO `parameter` VALUES ('47', '2013-01-01 08:57:53', '2013-01-01 10:48:08', '5', '面料分类', '4');
INSERT INTO `parameter` VALUES ('48', '2013-01-01 08:57:53', '2013-01-01 10:48:08', '6', '面料花型', '4');
INSERT INTO `parameter` VALUES ('49', '2013-01-01 08:57:53', '2013-01-01 10:48:08', '7', '面料主材质', '4');
INSERT INTO `parameter` VALUES ('50', '2013-01-01 08:57:53', '2013-01-01 10:48:08', '8', '棉含量', '4');
INSERT INTO `parameter` VALUES ('51', '2013-01-01 08:57:53', '2013-01-01 10:48:08', '9', '年份', '4');
INSERT INTO `parameter` VALUES ('52', '2013-01-01 08:57:53', '2013-01-01 10:48:08', '10', '适用季节', '4');
INSERT INTO `parameter` VALUES ('53', '2013-01-01 08:57:53', '2013-01-01 10:48:08', '11', '消费群体', '4');
INSERT INTO `parameter` VALUES ('54', '2013-01-01 09:37:33', '2013-01-01 10:48:08', '12', '场合', '4');
INSERT INTO `parameter` VALUES ('55', '2013-01-01 09:15:48', '2013-01-01 10:49:47', '1', '版型', '5');
INSERT INTO `parameter` VALUES ('56', '2013-01-01 09:15:48', '2013-01-01 10:49:47', '2', '领型', '5');
INSERT INTO `parameter` VALUES ('57', '2013-01-01 09:15:48', '2013-01-01 10:49:47', '3', '衣门襟', '5');
INSERT INTO `parameter` VALUES ('58', '2013-01-01 09:15:48', '2013-01-01 10:49:47', '4', '风格', '5');
INSERT INTO `parameter` VALUES ('59', '2013-01-01 09:15:48', '2013-01-01 10:49:47', '5', '面料分类', '5');
INSERT INTO `parameter` VALUES ('60', '2013-01-01 09:15:48', '2013-01-01 10:49:47', '6', '款式细节', '5');
INSERT INTO `parameter` VALUES ('61', '2013-01-01 09:15:48', '2013-01-01 10:49:47', '7', '袖长', '5');
INSERT INTO `parameter` VALUES ('62', '2013-01-01 09:15:48', '2013-01-01 10:49:47', '8', '面料主材质', '5');
INSERT INTO `parameter` VALUES ('63', '2013-01-01 09:15:48', '2013-01-01 10:49:47', '9', '羊毛含量', '5');
INSERT INTO `parameter` VALUES ('64', '2013-01-01 09:36:08', '2013-01-01 10:49:47', '10', '涤纶含量', '5');
INSERT INTO `parameter` VALUES ('65', '2013-01-01 09:15:48', '2013-01-01 10:49:47', '11', '适用季节', '5');
INSERT INTO `parameter` VALUES ('66', '2013-01-01 09:15:48', '2013-01-01 10:49:47', '12', '场合', '5');
INSERT INTO `parameter` VALUES ('67', '2013-01-01 09:15:48', '2013-01-01 10:49:47', '13', '消费群体', '5');
INSERT INTO `parameter` VALUES ('68', '2013-01-01 09:15:48', '2013-01-01 10:49:47', '14', '款式品名', '5');
INSERT INTO `parameter` VALUES ('69', '2013-01-01 09:15:48', '2013-01-01 10:49:47', '15', '下摆设计', '5');
INSERT INTO `parameter` VALUES ('70', '2013-01-01 09:15:48', '2013-01-01 10:49:47', '16', '男装厚薄', '5');
INSERT INTO `parameter` VALUES ('71', '2013-01-01 09:15:48', '2013-01-01 10:49:47', '17', '衣长', '5');
INSERT INTO `parameter` VALUES ('72', '2013-01-01 09:17:46', '2013-01-01 10:49:47', '18', '口袋设计', '5');
INSERT INTO `parameter` VALUES ('73', '2013-01-01 09:29:03', '2013-01-01 10:47:34', '1', '袖长', '6');
INSERT INTO `parameter` VALUES ('74', '2013-01-01 09:29:03', '2013-01-01 10:47:34', '2', '领型', '6');
INSERT INTO `parameter` VALUES ('75', '2013-01-01 09:29:03', '2013-01-01 10:47:34', '3', '面料分类', '6');
INSERT INTO `parameter` VALUES ('76', '2013-01-01 09:29:03', '2013-01-01 10:47:34', '4', '款式细节', '6');
INSERT INTO `parameter` VALUES ('77', '2013-01-01 09:29:03', '2013-01-01 10:47:34', '5', '工艺处理', '6');
INSERT INTO `parameter` VALUES ('78', '2013-01-01 09:29:03', '2013-01-01 10:47:34', '6', '风格', '6');
INSERT INTO `parameter` VALUES ('79', '2013-01-01 09:29:03', '2013-01-01 10:47:34', '7', '袖型', '6');
INSERT INTO `parameter` VALUES ('80', '2013-01-01 09:29:03', '2013-01-01 10:47:34', '8', '图案', '6');
INSERT INTO `parameter` VALUES ('81', '2013-01-01 09:29:03', '2013-01-01 10:47:34', '9', '版型', '6');
INSERT INTO `parameter` VALUES ('82', '2013-01-01 09:29:03', '2013-01-01 10:47:34', '10', '面料主材质', '6');
INSERT INTO `parameter` VALUES ('83', '2013-01-01 09:29:03', '2013-01-01 10:47:34', '11', '棉含量', '6');
INSERT INTO `parameter` VALUES ('84', '2013-01-01 09:29:03', '2013-01-01 10:47:34', '12', '适用季节', '6');
INSERT INTO `parameter` VALUES ('85', '2013-01-01 09:29:03', '2013-01-01 10:47:34', '13', '场合', '6');
INSERT INTO `parameter` VALUES ('86', '2013-01-01 09:29:03', '2013-01-01 10:47:34', '14', '消费群体', '6');
INSERT INTO `parameter` VALUES ('87', '2013-01-01 09:29:03', '2013-01-01 10:47:34', '15', '年份', '6');
INSERT INTO `parameter` VALUES ('88', '2013-01-01 10:17:02', '2013-01-01 13:01:10', '1', '领型', '7');
INSERT INTO `parameter` VALUES ('89', '2013-01-01 10:17:02', '2013-01-01 13:01:10', '2', '风格', '7');
INSERT INTO `parameter` VALUES ('90', '2013-01-01 10:17:02', '2013-01-01 13:01:10', '3', '面料分类', '7');
INSERT INTO `parameter` VALUES ('91', '2013-01-01 10:17:02', '2013-01-01 13:01:10', '4', '款式细节', '7');
INSERT INTO `parameter` VALUES ('92', '2013-01-01 10:17:02', '2013-01-01 13:01:10', '5', '季节', '7');
INSERT INTO `parameter` VALUES ('93', '2013-01-01 10:17:02', '2013-01-01 13:01:10', '6', '袖型', '7');
INSERT INTO `parameter` VALUES ('94', '2013-01-01 10:17:02', '2013-01-01 13:01:10', '7', '男装厚薄', '7');
INSERT INTO `parameter` VALUES ('95', '2013-01-01 10:17:02', '2013-01-01 13:01:10', '8', '版型', '7');
INSERT INTO `parameter` VALUES ('96', '2013-01-01 10:17:02', '2013-01-01 13:01:10', '9', '面料主材质', '7');
INSERT INTO `parameter` VALUES ('97', '2013-01-01 10:17:02', '2013-01-01 13:01:10', '10', '锦纶含量', '7');
INSERT INTO `parameter` VALUES ('98', '2013-01-01 10:17:02', '2013-01-01 13:01:10', '11', '涤纶含量', '7');
INSERT INTO `parameter` VALUES ('99', '2013-01-01 10:17:02', '2013-01-01 13:01:10', '12', '场合', '7');
INSERT INTO `parameter` VALUES ('100', '2013-01-01 10:17:02', '2013-01-01 13:01:10', '13', '消费群体', '7');
INSERT INTO `parameter` VALUES ('101', '2013-01-01 10:17:02', '2013-01-01 13:01:10', '14', '面料分类', '7');
INSERT INTO `parameter` VALUES ('102', '2013-01-01 10:17:02', '2013-01-01 13:01:10', '15', '下摆设计', '7');
INSERT INTO `parameter` VALUES ('103', '2013-01-01 10:17:02', '2013-01-01 13:01:10', '16', '口袋设计', '7');
INSERT INTO `parameter` VALUES ('104', '2013-01-01 10:17:02', '2013-01-01 13:01:10', '17', '衣门襟', '7');
INSERT INTO `parameter` VALUES ('105', '2013-01-01 10:17:02', '2013-01-01 13:01:10', '18', '衣长', '7');
INSERT INTO `parameter` VALUES ('106', '2013-01-01 10:17:02', '2013-01-01 13:01:10', '19', '花色', '7');
INSERT INTO `parameter` VALUES ('107', '2013-01-01 10:34:21', '2013-01-01 10:43:19', '1', '板型', '8');
INSERT INTO `parameter` VALUES ('108', '2013-01-01 10:34:21', '2013-01-01 10:43:19', '2', '厚薄', '8');
INSERT INTO `parameter` VALUES ('109', '2013-01-01 10:34:21', '2013-01-01 10:43:19', '3', '风格', '8');
INSERT INTO `parameter` VALUES ('110', '2013-01-01 10:34:21', '2013-01-01 10:43:19', '4', '通勤', '8');
INSERT INTO `parameter` VALUES ('111', '2013-01-01 10:34:21', '2013-01-01 10:43:19', '5', '衣长', '8');
INSERT INTO `parameter` VALUES ('112', '2013-01-01 10:34:21', '2013-01-01 10:43:19', '6', '袖长', '8');
INSERT INTO `parameter` VALUES ('113', '2013-01-01 10:34:21', '2013-01-01 10:43:19', '7', '领子', '8');
INSERT INTO `parameter` VALUES ('114', '2013-01-01 10:34:21', '2013-01-01 10:43:19', '8', '袖型', '8');
INSERT INTO `parameter` VALUES ('115', '2013-01-01 10:34:21', '2013-01-01 10:43:19', '9', '衣门襟', '8');
INSERT INTO `parameter` VALUES ('116', '2013-01-01 10:34:21', '2013-01-01 10:43:19', '10', '图案', '8');
INSERT INTO `parameter` VALUES ('117', '2013-01-01 10:34:21', '2013-01-01 10:43:19', '11', '流行元素/工艺', '8');
INSERT INTO `parameter` VALUES ('118', '2013-01-01 10:34:21', '2013-01-01 10:43:19', '12', '面料材质', '8');
INSERT INTO `parameter` VALUES ('119', '2013-01-01 10:34:21', '2013-01-01 10:43:19', '13', '面料主材质含量', '8');
INSERT INTO `parameter` VALUES ('120', '2013-01-01 10:34:21', '2013-01-01 10:43:19', '14', '里料分类', '8');
INSERT INTO `parameter` VALUES ('121', '2013-01-01 10:42:04', '2013-01-01 10:43:29', '1', '板型', '9');
INSERT INTO `parameter` VALUES ('122', '2013-01-01 10:42:04', '2013-01-01 10:43:29', '2', '风格', '9');
INSERT INTO `parameter` VALUES ('123', '2013-01-01 10:42:04', '2013-01-01 10:43:29', '3', '通勤', '9');
INSERT INTO `parameter` VALUES ('124', '2013-01-01 10:42:04', '2013-01-01 10:43:29', '4', '款式', '9');
INSERT INTO `parameter` VALUES ('125', '2013-01-01 10:42:04', '2013-01-01 10:43:29', '5', '袖长', '9');
INSERT INTO `parameter` VALUES ('126', '2013-01-01 10:42:04', '2013-01-01 10:43:29', '6', '领型', '9');
INSERT INTO `parameter` VALUES ('127', '2013-01-01 10:42:04', '2013-01-01 10:43:29', '7', '袖型', '9');
INSERT INTO `parameter` VALUES ('128', '2013-01-01 10:42:04', '2013-01-01 10:43:29', '8', '衣门襟', '9');
INSERT INTO `parameter` VALUES ('129', '2013-01-01 10:42:04', '2013-01-01 10:43:29', '9', '皮质', '9');
INSERT INTO `parameter` VALUES ('130', '2013-01-01 10:42:04', '2013-01-01 10:43:29', '10', '制作工艺', '9');
INSERT INTO `parameter` VALUES ('131', '2013-01-01 10:42:04', '2013-01-01 10:43:29', '11', '流行元素/工艺', '9');
INSERT INTO `parameter` VALUES ('132', '2013-01-01 10:51:00', '2013-01-01 10:51:09', '1', '板型', '10');
INSERT INTO `parameter` VALUES ('133', '2013-01-01 10:51:00', '2013-01-01 10:51:09', '2', '风格', '10');
INSERT INTO `parameter` VALUES ('134', '2013-01-01 10:51:00', '2013-01-01 10:51:09', '3', '通勤', '10');
INSERT INTO `parameter` VALUES ('135', '2013-01-01 10:51:00', '2013-01-01 10:51:09', '4', '穿着方式', '10');
INSERT INTO `parameter` VALUES ('136', '2013-01-01 10:51:00', '2013-01-01 10:51:09', '5', '组合形式', '10');
INSERT INTO `parameter` VALUES ('137', '2013-01-01 10:51:00', '2013-01-01 10:51:09', '6', '衣长', '10');
INSERT INTO `parameter` VALUES ('138', '2013-01-01 10:51:00', '2013-01-01 10:51:09', '7', '袖长', '10');
INSERT INTO `parameter` VALUES ('139', '2013-01-01 10:51:00', '2013-01-01 10:51:09', '8', '领型', '10');
INSERT INTO `parameter` VALUES ('140', '2013-01-01 10:51:00', '2013-01-01 10:51:09', '9', '袖型', '10');
INSERT INTO `parameter` VALUES ('141', '2013-01-01 10:51:00', '2013-01-01 10:51:09', '10', '图案', '10');
INSERT INTO `parameter` VALUES ('142', '2013-01-01 10:51:00', '2013-01-01 10:51:09', '11', '款式细节', '10');
INSERT INTO `parameter_group` VALUES ('1', '2013-01-01 17:02:36', '2013-01-01 10:42:18', '1', '基本参数', '11');
INSERT INTO `parameter_group` VALUES ('2', '2013-01-01 08:52:45', '2013-01-01 10:42:27', '2', '基本参数', '14');
INSERT INTO `parameter_group` VALUES ('3', '2013-01-01 08:55:24', '2013-01-01 10:42:58', '3', '基本参数', '17');
INSERT INTO `parameter_group` VALUES ('4', '2013-01-01 08:57:53', '2013-01-01 10:48:08', '4', '基本参数', '26');
INSERT INTO `parameter_group` VALUES ('5', '2013-01-01 09:15:48', '2013-01-01 10:49:47', '5', '基本参数', '27');
INSERT INTO `parameter_group` VALUES ('6', '2013-01-01 09:29:03', '2013-01-01 10:47:34', '6', '基本参数', '25');
INSERT INTO `parameter_group` VALUES ('7', '2013-01-01 10:17:02', '2013-01-01 13:01:10', '7', '基本参数', '29');
INSERT INTO `parameter_group` VALUES ('8', '2013-01-01 10:34:21', '2013-01-01 10:43:19', '8', '基本参数', '18');
INSERT INTO `parameter_group` VALUES ('9', '2013-01-01 10:42:04', '2013-01-01 10:43:29', '9', '基本参数', '13');
INSERT INTO `parameter_group` VALUES ('10', '2013-01-01 10:51:00', '2013-01-01 10:51:09', '10', '基本参数', '19');
INSERT INTO `payment_method` VALUES ('1', '2013-01-01 13:41:29', '2013-01-01 23:14:28', '1', null, '支持支付宝、财付通、以及大多数网上银行支付', 'http://storage.shopxx.net/demo-image/3.0/payment_method/online.gif', '网上支付', '1440', '0', '0');
INSERT INTO `payment_method` VALUES ('2', '2013-01-01 13:44:07', '2013-01-01 21:52:58', '2', '<img src=\"http://storage.shopxx.net/demo-image/3.0/201301/8417e751-a1d2-4727-82da-003075a44398.jpg\" />', '支持工行、建行、农行汇款支付，收款时间一般为汇款后的1-2个工作日', 'http://storage.shopxx.net/demo-image/3.0/payment_method/remittance.gif', '银行汇款', null, '1', '0');
INSERT INTO `payment_method` VALUES ('3', '2013-01-01 13:44:37', '2013-01-01 23:14:54', '3', null, '由快递公司送货上门，您签收后直接将货款交付给快递员', 'http://storage.shopxx.net/demo-image/3.0/payment_method/cash_on_delivery.gif', '货到付款', null, '1', '0');
INSERT INTO `payment_shipping_method` VALUES ('1', '1');
INSERT INTO `payment_shipping_method` VALUES ('2', '1');
INSERT INTO `payment_shipping_method` VALUES ('1', '2');
INSERT INTO `payment_shipping_method` VALUES ('2', '2');
INSERT INTO `payment_shipping_method` VALUES ('3', '2');
INSERT INTO `plugin_config` VALUES ('1', '2013-01-01 22:05:27', '2013-01-01 22:06:34', '100', '', 'filePlugin');
INSERT INTO `plugin_config` VALUES ('2', '2013-01-01 13:31:50', '2013-01-01 14:15:37', '1', '', 'alipayDirectPlugin');
INSERT INTO `plugin_config_attribute` VALUES ('2', '0', 'fee', '');
INSERT INTO `plugin_config_attribute` VALUES ('2', 'fixed', 'feeType', '');
INSERT INTO `plugin_config_attribute` VALUES ('2', 'abc', 'key', '');
INSERT INTO `plugin_config_attribute` VALUES ('2', 'http://storage.shopxx.net/demo-image/3.0/payment_plugin/alipay.gif', 'logo', '');
INSERT INTO `plugin_config_attribute` VALUES ('2', 'abc', 'partner', '');
INSERT INTO `plugin_config_attribute` VALUES ('2', '支付宝即时交易', 'paymentName', '');
INSERT INTO `product` VALUES ('1', '2013-01-01 16:39:04', '2013-01-01 09:23:09', '0', '蕾丝', '短裙', null, null, null, null, null, null, null, null, null, null, '圆领', '中腰', null, null, null, null, null, null, null, '尚都比拉2013春夏装新款女装 春款淑女两件套 蕾丝雪纺短袖连衣裙[混色 S]', '11', 'http://storage.shopxx.net/demo-image/3.0/201301/3dc28bfe-b4a7-4346-89a1-86b87d229faa-thumbnail.jpg', '<img alt=\"\" src=\"http://storage.shopxx.net/demo-image/3.0/201301/f129cfc9-a544-46df-ba6d-5f8089940690.jpg\" /> \r\n<p>\r\n	&nbsp;\r\n</p>', '', '', '', '', null, '465.600000', null, '1', '2013-01-01 09:23:09', '0', '2013-01-01 16:39:04', '尚都比拉2013春夏装新款女装 春款淑女两件套 蕾丝雪纺短袖连衣裙', '388', '388.000000', '0', '5', '5', null, null, null, '2013041', null, null, '25', '件', '1', '2013-01-01 09:23:09', '0', '2013-01-01 16:39:04', null, '3', '1', '11');
INSERT INTO `product` VALUES ('2', '2013-01-01 16:41:26', '2013-01-01 15:24:06', '0', '中长款', '修身型', null, null, null, null, null, null, null, null, null, null, '七分袖', '通勤', null, null, null, null, null, null, null, '维依恋春装2013新款七分袖中长款风衣韩版修身双排扣外套春款大衣[橙色 S]', '6', 'http://storage.shopxx.net/demo-image/3.0/201301/94aa25f9-f3ef-4f7f-8c7c-197cd04b68ea-thumbnail.jpg', '<img alt=\"\" src=\"http://storage.shopxx.net/demo-image/3.0/201301/0a2ae9d9-a90f-46be-9de6-c72654cfd10b.jpg\" /> \r\n<p>\r\n	&nbsp;\r\n</p>', '', '', '', '', null, '336.000000', null, '6', '2013-01-01 10:40:04', '0', '2013-01-01 16:41:26', '维依恋春装2013新款七分袖中长款风衣韩版修身双排扣外套春款大衣', '280', '280.000000', '0', '4', '1', null, null, null, '2013042', null, null, '4', '件', '6', '2013-01-01 10:40:04', '0', '2013-01-01 16:41:26', null, null, '2', '18');
INSERT INTO `product` VALUES ('3', '2013-01-01 16:43:42', '2013-01-01 09:23:09', '0', '雪纺', '长裙', null, null, null, null, null, null, null, null, null, null, 'V领', '中腰', null, null, null, null, null, null, null, '梵希蔓 2013夏装新款韩版连衣裙夏雪纺连衣裙短袖长款波西米亚[绿色 S]', '14', 'http://storage.shopxx.net/demo-image/3.0/201301/c0ce7a2f-1b1a-4fc6-b098-0dcb54400c9d-thumbnail.jpg', '<img alt=\"\" src=\"http://storage.shopxx.net/demo-image/3.0/201301/29510130-39fd-4188-9601-211758c35a43.jpg\" /> \r\n<p>\r\n	&nbsp;\r\n</p>', '', '', '', '', null, '312.000000', null, '1', '2013-01-01 09:23:09', '0', '2013-01-01 16:43:42', '梵希蔓 2013夏装新款韩版连衣裙夏雪纺连衣裙短袖长款波西米亚', '260', '260.000000', '0', '4', '1', null, null, null, '2013043', '0', null, '4', '件', '1', '2013-01-01 09:23:09', '0', '2013-01-01 16:43:42', null, '1', '3', '11');
INSERT INTO `product` VALUES ('4', '2013-01-01 13:28:34', '2013-01-01 09:06:21', '0', '长袖', '英伦风格 ', null, null, null, null, null, null, null, null, null, null, '修身型 ', null, null, null, null, null, null, null, null, 'Max Toney春装高端暗门襟修身长袖衬衫男 小方领休闲男士衬衣 678[黑色 M]', '5', 'http://storage.shopxx.net/demo-image/3.0/201301/a8db4410-05e5-4dfa-8217-eb885a104af3-thumbnail.jpg', '<img alt=\"\" src=\"http://storage.shopxx.net/demo-image/3.0/201301/85a81dc1-12c8-4f6f-a87f-d45c67cbca45.jpg\" />', '', '', '', '', null, '206.400000', null, '1', '2013-01-01 09:06:21', '0', '2013-01-01 13:28:34', 'Max Toney春装高端暗门襟修身长袖衬衫男 小方领休闲男士衬衣 678', '172', '172.000000', '0', '4.8', '5', null, null, null, '201304101', null, null, '24', '件', '1', '2013-01-01 09:06:21', '0', '2013-01-01 13:28:34', null, null, '4', '26');
INSERT INTO `product` VALUES ('5', '2013-01-01 13:34:55', '2013-01-01 13:48:18', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'Max Toney春装高端暗门襟修身长袖衬衫男 小方领休闲男士衬衣 678[白色 M]', '1', 'http://storage.shopxx.net/demo-image/3.0/201301/a8db4410-05e5-4dfa-8217-eb885a104af3-thumbnail.jpg', '<img alt=\"\" src=\"http://storage.shopxx.net/demo-image/3.0/201301/85a81dc1-12c8-4f6f-a87f-d45c67cbca45.jpg\" />', '', '', '', '', null, '206.400000', null, '1', '2013-01-01 13:48:18', '0', '2013-01-01 13:34:55', 'Max Toney春装高端暗门襟修身长袖衬衫男 小方领休闲男士衬衣 678', '172', '172.000000', '0', '0', '0', null, null, null, '201304102', null, null, '0', '件', '1', '2013-01-01 13:48:18', '0', '2013-01-01 13:34:55', null, null, '4', '26');
INSERT INTO `product` VALUES ('6', '2013-01-01 13:34:56', '2013-01-01 13:37:59', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'Max Toney春装高端暗门襟修身长袖衬衫男 小方领休闲男士衬衣 678[红色 M]', '1', 'http://storage.shopxx.net/demo-image/3.0/201301/a8db4410-05e5-4dfa-8217-eb885a104af3-thumbnail.jpg', '<img alt=\"\" src=\"http://storage.shopxx.net/demo-image/3.0/201301/85a81dc1-12c8-4f6f-a87f-d45c67cbca45.jpg\" />', '', '', '', '', null, '206.400000', null, '1', '2013-01-01 13:35:17', '0', '2013-01-01 13:34:55', 'Max Toney春装高端暗门襟修身长袖衬衫男 小方领休闲男士衬衣 678', '172', '172.000000', '0', '0', '0', null, null, null, '201304103', null, null, '0', '件', '1', '2013-01-01 13:35:17', '0', '2013-01-01 13:34:55', null, null, '4', '26');
INSERT INTO `product` VALUES ('7', '2013-01-01 13:34:56', '2013-01-01 13:37:59', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'Max Toney春装高端暗门襟修身长袖衬衫男 小方领休闲男士衬衣 678[蓝色 M]', '0', 'http://storage.shopxx.net/demo-image/3.0/201301/a8db4410-05e5-4dfa-8217-eb885a104af3-thumbnail.jpg', '<img alt=\"\" src=\"http://storage.shopxx.net/demo-image/3.0/201301/85a81dc1-12c8-4f6f-a87f-d45c67cbca45.jpg\" />', '', '', '', '', null, '206.400000', null, '0', '2013-01-01 13:34:55', '0', '2013-01-01 13:34:55', 'Max Toney春装高端暗门襟修身长袖衬衫男 小方领休闲男士衬衣 678', '172', '172.000000', '0', '0', '0', null, null, null, '201304104', null, null, '0', '件', '0', '2013-01-01 13:34:55', '0', '2013-01-01 13:34:55', null, null, '4', '26');
INSERT INTO `product` VALUES ('8', '2013-01-01 13:37:16', '2013-01-01 20:55:29', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '梵希蔓 2013夏装新款韩版连衣裙夏雪纺连衣裙短袖长款波西米亚[黄色 L]', '2', 'http://storage.shopxx.net/demo-image/3.0/201301/c0ce7a2f-1b1a-4fc6-b098-0dcb54400c9d-thumbnail.jpg', '<img alt=\"\" src=\"http://storage.shopxx.net/demo-image/3.0/201301/29510130-39fd-4188-9601-211758c35a43.jpg\" /> \r\n<p>\r\n	&nbsp;\r\n</p>', '', '', '', '', null, '312.000000', null, '2', '2013-01-01 20:55:29', '0', '2013-01-01 13:37:15', '梵希蔓 2013夏装新款韩版连衣裙夏雪纺连衣裙短袖长款波西米亚', '260', '260.000000', '0', '0', '0', null, null, null, '201304105', null, null, '0', '件', '2', '2013-01-01 20:55:29', '0', '2013-01-01 13:37:15', null, '1', '3', '11');
INSERT INTO `product` VALUES ('9', '2013-01-01 13:37:16', '2013-01-01 20:55:29', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '梵希蔓 2013夏装新款韩版连衣裙夏雪纺连衣裙短袖长款波西米亚[黄色 M]', '1', 'http://storage.shopxx.net/demo-image/3.0/201301/c0ce7a2f-1b1a-4fc6-b098-0dcb54400c9d-thumbnail.jpg', '<img alt=\"\" src=\"http://storage.shopxx.net/demo-image/3.0/201301/29510130-39fd-4188-9601-211758c35a43.jpg\" /> \r\n<p>\r\n	&nbsp;\r\n</p>', '', '', '', '', null, '312.000000', null, '1', '2013-01-01 20:55:29', '0', '2013-01-01 13:37:15', '梵希蔓 2013夏装新款韩版连衣裙夏雪纺连衣裙短袖长款波西米亚', '260', '260.000000', '0', '0', '0', null, null, null, '201304106', null, null, '0', '件', '1', '2013-01-01 20:55:29', '0', '2013-01-01 13:37:15', null, '1', '3', '11');
INSERT INTO `product` VALUES ('10', '2013-01-01 13:37:16', '2013-01-01 20:55:29', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '梵希蔓 2013夏装新款韩版连衣裙夏雪纺连衣裙短袖长款波西米亚[黄色 S]', '2', 'http://storage.shopxx.net/demo-image/3.0/201301/c0ce7a2f-1b1a-4fc6-b098-0dcb54400c9d-thumbnail.jpg', '<img alt=\"\" src=\"http://storage.shopxx.net/demo-image/3.0/201301/29510130-39fd-4188-9601-211758c35a43.jpg\" /> \r\n<p>\r\n	&nbsp;\r\n</p>', '', '', '', '', null, '312.000000', null, '2', '2013-01-01 20:55:29', '0', '2013-01-01 13:37:15', '梵希蔓 2013夏装新款韩版连衣裙夏雪纺连衣裙短袖长款波西米亚', '260', '260.000000', '0', '0', '0', null, null, null, '201304107', null, null, '0', '件', '2', '2013-01-01 20:55:29', '0', '2013-01-01 13:37:15', null, '1', '3', '11');
INSERT INTO `product` VALUES ('11', '2013-01-01 13:37:16', '2013-01-01 15:28:46', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '梵希蔓 2013夏装新款韩版连衣裙夏雪纺连衣裙短袖长款波西米亚[绿色 XL]', '0', 'http://storage.shopxx.net/demo-image/3.0/201301/c0ce7a2f-1b1a-4fc6-b098-0dcb54400c9d-thumbnail.jpg', '<img alt=\"\" src=\"http://storage.shopxx.net/demo-image/3.0/201301/29510130-39fd-4188-9601-211758c35a43.jpg\" /> \r\n<p>\r\n	&nbsp;\r\n</p>', '', '', '', '', null, '312.000000', null, '0', '2013-01-01 13:37:15', '0', '2013-01-01 13:37:15', '梵希蔓 2013夏装新款韩版连衣裙夏雪纺连衣裙短袖长款波西米亚', '260', '260.000000', '0', '0', '0', null, null, null, '201304108', null, null, '0', '件', '0', '2013-01-01 13:37:15', '0', '2013-01-01 13:37:15', null, '1', '3', '11');
INSERT INTO `product` VALUES ('12', '2013-01-01 13:37:16', '2013-01-01 15:28:50', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '梵希蔓 2013夏装新款韩版连衣裙夏雪纺连衣裙短袖长款波西米亚[绿色 L]', '0', 'http://storage.shopxx.net/demo-image/3.0/201301/c0ce7a2f-1b1a-4fc6-b098-0dcb54400c9d-thumbnail.jpg', '<img alt=\"\" src=\"http://storage.shopxx.net/demo-image/3.0/201301/29510130-39fd-4188-9601-211758c35a43.jpg\" /> \r\n<p>\r\n	&nbsp;\r\n</p>', '', '', '', '', null, '312.000000', null, '0', '2013-01-01 13:37:15', '0', '2013-01-01 13:37:15', '梵希蔓 2013夏装新款韩版连衣裙夏雪纺连衣裙短袖长款波西米亚', '260', '260.000000', '0', '0', '0', null, null, null, '201304109', null, null, '0', '件', '0', '2013-01-01 13:37:15', '0', '2013-01-01 13:37:15', null, '1', '3', '11');
INSERT INTO `product` VALUES ('13', '2013-01-01 13:37:16', '2013-01-01 15:29:01', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '梵希蔓 2013夏装新款韩版连衣裙夏雪纺连衣裙短袖长款波西米亚[绿色 M]', '0', 'http://storage.shopxx.net/demo-image/3.0/201301/c0ce7a2f-1b1a-4fc6-b098-0dcb54400c9d-thumbnail.jpg', '<img alt=\"\" src=\"http://storage.shopxx.net/demo-image/3.0/201301/29510130-39fd-4188-9601-211758c35a43.jpg\" /> \r\n<p>\r\n	&nbsp;\r\n</p>', '', '', '', '', null, '312.000000', null, '0', '2013-01-01 13:37:15', '0', '2013-01-01 13:37:15', '梵希蔓 2013夏装新款韩版连衣裙夏雪纺连衣裙短袖长款波西米亚', '260', '260.000000', '0', '0', '0', null, null, null, '201304110', null, null, '0', '件', '0', '2013-01-01 13:37:15', '0', '2013-01-01 13:37:15', null, '1', '3', '11');
INSERT INTO `product` VALUES ('14', '2013-01-01 13:37:59', '2013-01-01 16:55:12', '0', '长袖', '英伦风格 ', null, null, null, null, null, null, null, null, null, null, '修身型 ', null, null, null, null, null, null, null, null, 'Max Toney春装高端暗门襟修身长袖衬衫男 小方领休闲男士衬衣 678[白色 XXL]', '1', 'http://storage.shopxx.net/demo-image/3.0/201301/a8db4410-05e5-4dfa-8217-eb885a104af3-thumbnail.jpg', '<img alt=\"\" src=\"http://storage.shopxx.net/demo-image/3.0/201301/85a81dc1-12c8-4f6f-a87f-d45c67cbca45.jpg\" />', '', '', '', '', null, '206.400000', null, '1', '2013-01-01 13:48:18', '0', '2013-01-01 13:37:59', 'Max Toney春装高端暗门襟修身长袖衬衫男 小方领休闲男士衬衣 678', '172', '172.000000', '0', '0', '0', null, null, null, '201304111', null, null, '0', '件', '1', '2013-01-01 13:48:18', '0', '2013-01-01 13:37:59', null, null, '4', '26');
INSERT INTO `product` VALUES ('15', '2013-01-01 13:37:59', '2013-01-01 13:48:18', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'Max Toney春装高端暗门襟修身长袖衬衫男 小方领休闲男士衬衣 678[红色 XXL]', '1', 'http://storage.shopxx.net/demo-image/3.0/201301/a8db4410-05e5-4dfa-8217-eb885a104af3-thumbnail.jpg', '<img alt=\"\" src=\"http://storage.shopxx.net/demo-image/3.0/201301/85a81dc1-12c8-4f6f-a87f-d45c67cbca45.jpg\" />', '', '', '', '', null, '206.400000', null, '1', '2013-01-01 13:48:18', '0', '2013-01-01 13:37:59', 'Max Toney春装高端暗门襟修身长袖衬衫男 小方领休闲男士衬衣 678', '172', '172.000000', '0', '0', '0', null, null, null, '201304112', null, null, '0', '件', '1', '2013-01-01 13:48:18', '0', '2013-01-01 13:37:59', null, null, '4', '26');
INSERT INTO `product` VALUES ('16', '2013-01-01 13:37:59', '2013-01-01 13:48:18', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'Max Toney春装高端暗门襟修身长袖衬衫男 小方领休闲男士衬衣 678[黑色 L]', '1', 'http://storage.shopxx.net/demo-image/3.0/201301/a8db4410-05e5-4dfa-8217-eb885a104af3-thumbnail.jpg', '<img alt=\"\" src=\"http://storage.shopxx.net/demo-image/3.0/201301/85a81dc1-12c8-4f6f-a87f-d45c67cbca45.jpg\" />', '', '', '', '', null, '206.400000', null, '1', '2013-01-01 13:48:18', '0', '2013-01-01 13:37:59', 'Max Toney春装高端暗门襟修身长袖衬衫男 小方领休闲男士衬衣 678', '172', '172.000000', '0', '0', '0', null, null, null, '201304113', null, null, '0', '件', '1', '2013-01-01 13:48:18', '0', '2013-01-01 13:37:59', null, null, '4', '26');
INSERT INTO `product` VALUES ('17', '2013-01-01 13:37:59', '2013-01-01 13:48:18', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'Max Toney春装高端暗门襟修身长袖衬衫男 小方领休闲男士衬衣 678[蓝色 L]', '1', 'http://storage.shopxx.net/demo-image/3.0/201301/a8db4410-05e5-4dfa-8217-eb885a104af3-thumbnail.jpg', '<img alt=\"\" src=\"http://storage.shopxx.net/demo-image/3.0/201301/85a81dc1-12c8-4f6f-a87f-d45c67cbca45.jpg\" />', '', '', '', '', null, '206.400000', null, '1', '2013-01-01 13:48:18', '0', '2013-01-01 13:37:59', 'Max Toney春装高端暗门襟修身长袖衬衫男 小方领休闲男士衬衣 678', '172', '172.000000', '0', '0', '0', null, null, null, '201304114', null, null, '0', '件', '1', '2013-01-01 13:48:18', '0', '2013-01-01 13:37:59', null, null, '4', '26');
INSERT INTO `product` VALUES ('18', '2013-01-01 13:37:59', '2013-01-01 13:48:18', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'Max Toney春装高端暗门襟修身长袖衬衫男 小方领休闲男士衬衣 678[红色 L]', '1', 'http://storage.shopxx.net/demo-image/3.0/201301/a8db4410-05e5-4dfa-8217-eb885a104af3-thumbnail.jpg', '<img alt=\"\" src=\"http://storage.shopxx.net/demo-image/3.0/201301/85a81dc1-12c8-4f6f-a87f-d45c67cbca45.jpg\" />', '', '', '', '', null, '206.400000', null, '1', '2013-01-01 13:48:18', '0', '2013-01-01 13:37:59', 'Max Toney春装高端暗门襟修身长袖衬衫男 小方领休闲男士衬衣 678', '172', '172.000000', '0', '0', '0', null, null, null, '201304115', null, null, '0', '件', '1', '2013-01-01 13:48:18', '0', '2013-01-01 13:37:59', null, null, '4', '26');
INSERT INTO `product` VALUES ('19', '2013-01-01 13:37:59', '2013-01-01 13:48:18', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'Max Toney春装高端暗门襟修身长袖衬衫男 小方领休闲男士衬衣 678[白色 L]', '1', 'http://storage.shopxx.net/demo-image/3.0/201301/a8db4410-05e5-4dfa-8217-eb885a104af3-thumbnail.jpg', '<img alt=\"\" src=\"http://storage.shopxx.net/demo-image/3.0/201301/85a81dc1-12c8-4f6f-a87f-d45c67cbca45.jpg\" />', '', '', '', '', null, '206.400000', null, '1', '2013-01-01 13:48:18', '0', '2013-01-01 13:37:59', 'Max Toney春装高端暗门襟修身长袖衬衫男 小方领休闲男士衬衣 678', '172', '172.000000', '0', '0', '0', null, null, null, '201304116', null, null, '0', '件', '1', '2013-01-01 13:48:18', '0', '2013-01-01 13:37:59', null, null, '4', '26');
INSERT INTO `product` VALUES ('20', '2013-01-01 13:37:59', '2013-01-01 13:48:18', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'Max Toney春装高端暗门襟修身长袖衬衫男 小方领休闲男士衬衣 678[黑色 XL]', '1', 'http://storage.shopxx.net/demo-image/3.0/201301/a8db4410-05e5-4dfa-8217-eb885a104af3-thumbnail.jpg', '<img alt=\"\" src=\"http://storage.shopxx.net/demo-image/3.0/201301/85a81dc1-12c8-4f6f-a87f-d45c67cbca45.jpg\" />', '', '', '', '', null, '206.400000', null, '1', '2013-01-01 13:48:18', '0', '2013-01-01 13:37:59', 'Max Toney春装高端暗门襟修身长袖衬衫男 小方领休闲男士衬衣 678', '172', '172.000000', '0', '0', '0', null, null, null, '201304117', null, null, '0', '件', '1', '2013-01-01 13:48:18', '0', '2013-01-01 13:37:59', null, null, '4', '26');
INSERT INTO `product` VALUES ('21', '2013-01-01 13:37:59', '2013-01-01 13:48:18', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'Max Toney春装高端暗门襟修身长袖衬衫男 小方领休闲男士衬衣 678[红色 XL]', '1', 'http://storage.shopxx.net/demo-image/3.0/201301/a8db4410-05e5-4dfa-8217-eb885a104af3-thumbnail.jpg', '<img alt=\"\" src=\"http://storage.shopxx.net/demo-image/3.0/201301/85a81dc1-12c8-4f6f-a87f-d45c67cbca45.jpg\" />', '', '', '', '', null, '206.400000', null, '1', '2013-01-01 13:48:18', '0', '2013-01-01 13:37:59', 'Max Toney春装高端暗门襟修身长袖衬衫男 小方领休闲男士衬衣 678', '172', '172.000000', '0', '0', '0', null, null, null, '201304118', null, null, '0', '件', '1', '2013-01-01 13:48:18', '0', '2013-01-01 13:37:59', null, null, '4', '26');
INSERT INTO `product` VALUES ('22', '2013-01-01 13:37:59', '2013-01-01 13:48:18', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'Max Toney春装高端暗门襟修身长袖衬衫男 小方领休闲男士衬衣 678[白色 XL]', '1', 'http://storage.shopxx.net/demo-image/3.0/201301/a8db4410-05e5-4dfa-8217-eb885a104af3-thumbnail.jpg', '<img alt=\"\" src=\"http://storage.shopxx.net/demo-image/3.0/201301/85a81dc1-12c8-4f6f-a87f-d45c67cbca45.jpg\" />', '', '', '', '', null, '206.400000', null, '1', '2013-01-01 13:48:18', '0', '2013-01-01 13:37:59', 'Max Toney春装高端暗门襟修身长袖衬衫男 小方领休闲男士衬衣 678', '172', '172.000000', '0', '0', '0', null, null, null, '201304119', null, null, '0', '件', '1', '2013-01-01 13:48:18', '0', '2013-01-01 13:37:59', null, null, '4', '26');
INSERT INTO `product` VALUES ('23', '2013-01-01 13:37:59', '2013-01-01 13:37:59', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'Max Toney春装高端暗门襟修身长袖衬衫男 小方领休闲男士衬衣 678[黑色 XXL]', '0', 'http://storage.shopxx.net/demo-image/3.0/201301/a8db4410-05e5-4dfa-8217-eb885a104af3-thumbnail.jpg', '<img alt=\"\" src=\"http://storage.shopxx.net/demo-image/3.0/201301/85a81dc1-12c8-4f6f-a87f-d45c67cbca45.jpg\" />', '', '', '', '', null, '206.400000', null, '0', '2013-01-01 13:37:59', '0', '2013-01-01 13:37:59', 'Max Toney春装高端暗门襟修身长袖衬衫男 小方领休闲男士衬衣 678', '172', '172.000000', '0', '0', '0', null, null, null, '201304120', null, null, '0', '件', '0', '2013-01-01 13:37:59', '0', '2013-01-01 13:37:59', null, null, '4', '26');
INSERT INTO `product` VALUES ('24', '2013-01-01 13:37:59', '2013-01-01 13:37:59', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'Max Toney春装高端暗门襟修身长袖衬衫男 小方领休闲男士衬衣 678[蓝色 XXL]', '0', 'http://storage.shopxx.net/demo-image/3.0/201301/a8db4410-05e5-4dfa-8217-eb885a104af3-thumbnail.jpg', '<img alt=\"\" src=\"http://storage.shopxx.net/demo-image/3.0/201301/85a81dc1-12c8-4f6f-a87f-d45c67cbca45.jpg\" />', '', '', '', '', null, '206.400000', null, '0', '2013-01-01 13:37:59', '0', '2013-01-01 13:37:59', 'Max Toney春装高端暗门襟修身长袖衬衫男 小方领休闲男士衬衣 678', '172', '172.000000', '0', '0', '0', null, null, null, '201304121', null, null, '0', '件', '0', '2013-01-01 13:37:59', '0', '2013-01-01 13:37:59', null, null, '4', '26');
INSERT INTO `product` VALUES ('25', '2013-01-01 13:43:35', '2013-01-01 13:43:35', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '梵希蔓 2013夏装新款女装女裙子长款雪纺百褶连衣裙韩版修身裙子[米黄色 XL]', '0', 'http://storage.shopxx.net/demo-image/3.0/201301/3999515b-48ba-476e-b810-3ca57f4b9e29-thumbnail.jpg', '<img alt=\"\" src=\"http://storage.shopxx.net/demo-image/3.0/201301/aa70d597-c0fb-4427-955a-5d3705ddd023.jpg\" />', '', '', '', '', null, '369.600000', null, '0', '2013-01-01 13:43:35', '0', '2013-01-01 13:43:35', '梵希蔓 2013夏装新款女装女裙子长款雪纺百褶连衣裙韩版修身裙子', '308', '308.000000', '0', '0', '0', null, null, null, '201304122', null, null, '0', '件', '0', '2013-01-01 13:43:35', '0', '2013-01-01 13:43:35', null, '1', '5', '11');
INSERT INTO `product` VALUES ('26', '2013-01-01 13:43:35', '2013-01-01 13:43:35', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '梵希蔓 2013夏装新款女装女裙子长款雪纺百褶连衣裙韩版修身裙子[米黄色 L]', '0', 'http://storage.shopxx.net/demo-image/3.0/201301/3999515b-48ba-476e-b810-3ca57f4b9e29-thumbnail.jpg', '<img alt=\"\" src=\"http://storage.shopxx.net/demo-image/3.0/201301/aa70d597-c0fb-4427-955a-5d3705ddd023.jpg\" />', '', '', '', '', null, '369.600000', null, '0', '2013-01-01 13:43:35', '0', '2013-01-01 13:43:35', '梵希蔓 2013夏装新款女装女裙子长款雪纺百褶连衣裙韩版修身裙子', '308', '308.000000', '0', '0', '0', null, null, null, '201304123', null, null, '0', '件', '0', '2013-01-01 13:43:35', '0', '2013-01-01 13:43:35', null, '1', '5', '11');
INSERT INTO `product` VALUES ('27', '2013-01-01 13:43:35', '2013-01-01 13:43:35', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '梵希蔓 2013夏装新款女装女裙子长款雪纺百褶连衣裙韩版修身裙子[米黄色 M]', '0', 'http://storage.shopxx.net/demo-image/3.0/201301/3999515b-48ba-476e-b810-3ca57f4b9e29-thumbnail.jpg', '<img alt=\"\" src=\"http://storage.shopxx.net/demo-image/3.0/201301/aa70d597-c0fb-4427-955a-5d3705ddd023.jpg\" />', '', '', '', '', null, '369.600000', null, '0', '2013-01-01 13:43:35', '0', '2013-01-01 13:43:35', '梵希蔓 2013夏装新款女装女裙子长款雪纺百褶连衣裙韩版修身裙子', '308', '308.000000', '0', '0', '0', null, null, null, '201304124', null, null, '0', '件', '0', '2013-01-01 13:43:35', '0', '2013-01-01 13:43:35', null, '1', '5', '11');
INSERT INTO `product` VALUES ('28', '2013-01-01 13:43:35', '2013-01-01 13:43:35', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '梵希蔓 2013夏装新款女装女裙子长款雪纺百褶连衣裙韩版修身裙子[绿色 L]', '0', 'http://storage.shopxx.net/demo-image/3.0/201301/3999515b-48ba-476e-b810-3ca57f4b9e29-thumbnail.jpg', '<img alt=\"\" src=\"http://storage.shopxx.net/demo-image/3.0/201301/aa70d597-c0fb-4427-955a-5d3705ddd023.jpg\" />', '', '', '', '', null, '369.600000', null, '0', '2013-01-01 13:43:35', '0', '2013-01-01 13:43:35', '梵希蔓 2013夏装新款女装女裙子长款雪纺百褶连衣裙韩版修身裙子', '308', '308.000000', '0', '0', '0', null, null, null, '201304125', null, null, '0', '件', '0', '2013-01-01 13:43:35', '0', '2013-01-01 13:43:35', null, '1', '5', '11');
INSERT INTO `product` VALUES ('29', '2013-01-01 13:43:35', '2013-01-01 13:43:35', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '梵希蔓 2013夏装新款女装女裙子长款雪纺百褶连衣裙韩版修身裙子[绿色 M]', '0', 'http://storage.shopxx.net/demo-image/3.0/201301/3999515b-48ba-476e-b810-3ca57f4b9e29-thumbnail.jpg', '<img alt=\"\" src=\"http://storage.shopxx.net/demo-image/3.0/201301/aa70d597-c0fb-4427-955a-5d3705ddd023.jpg\" />', '', '', '', '', null, '369.600000', null, '0', '2013-01-01 13:43:35', '0', '2013-01-01 13:43:35', '梵希蔓 2013夏装新款女装女裙子长款雪纺百褶连衣裙韩版修身裙子', '308', '308.000000', '0', '0', '0', null, null, null, '201304126', null, null, '0', '件', '0', '2013-01-01 13:43:35', '0', '2013-01-01 13:43:35', null, '1', '5', '11');
INSERT INTO `product` VALUES ('30', '2013-01-01 13:43:35', '2013-01-01 09:23:09', '0', '雪纺', '长裙', null, null, null, null, null, null, null, null, null, null, '圆领', '中腰', null, null, null, null, null, null, null, '梵希蔓 2013夏装新款女装女裙子长款雪纺百褶连衣裙韩版修身裙子[绿色 S]', '2', 'http://storage.shopxx.net/demo-image/3.0/201301/3999515b-48ba-476e-b810-3ca57f4b9e29-thumbnail.jpg', '<img alt=\"\" src=\"http://storage.shopxx.net/demo-image/3.0/201301/aa70d597-c0fb-4427-955a-5d3705ddd023.jpg\" />', '', '', '', '', null, '369.600000', null, '1', '2013-01-01 09:23:09', '0', '2013-01-01 13:43:35', '梵希蔓 2013夏装新款女装女裙子长款雪纺百褶连衣裙韩版修身裙子', '308', '308.000000', '0', '5', '1', null, null, null, '201304127', '0', null, '5', '件', '1', '2013-01-01 09:23:09', '0', '2013-01-01 13:43:35', null, '1', '5', '11');
INSERT INTO `product` VALUES ('31', '2013-01-01 13:43:56', '2013-01-01 13:48:18', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'Max Toney 春装时尚休闲多层卷边领莱卡棉T恤 男 长袖T恤 599[灰色 XXL]', '5', 'http://storage.shopxx.net/demo-image/3.0/201301/b998f840-91fc-41b6-b73d-70587babf760-thumbnail.jpg', '<img alt=\"\" src=\"http://storage.shopxx.net/demo-image/3.0/201301/ace4788a-261a-491a-9f40-bb1b9aad6a97.jpg\" />', '', '', '', '', null, '88.800000', null, '5', '2013-01-01 13:48:18', '0', '2013-01-01 13:43:56', 'Max Toney 春装时尚休闲多层卷边领莱卡棉T恤 男 长袖T恤 599', '74', '74.000000', '0', '0', '0', null, null, null, '201304128', null, null, '0', null, '5', '2013-01-01 13:48:18', '0', '2013-01-01 13:43:56', null, null, '6', '25');
INSERT INTO `product` VALUES ('32', '2013-01-01 13:43:56', '2013-01-01 13:43:56', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'Max Toney 春装时尚休闲多层卷边领莱卡棉T恤 男 长袖T恤 599[灰色 XL]', '0', 'http://storage.shopxx.net/demo-image/3.0/201301/b998f840-91fc-41b6-b73d-70587babf760-thumbnail.jpg', '<img alt=\"\" src=\"http://storage.shopxx.net/demo-image/3.0/201301/ace4788a-261a-491a-9f40-bb1b9aad6a97.jpg\" />', '', '', '', '', null, '88.800000', null, '0', '2013-01-01 13:43:56', '0', '2013-01-01 13:43:56', 'Max Toney 春装时尚休闲多层卷边领莱卡棉T恤 男 长袖T恤 599', '74', '74.000000', '0', '0', '0', null, null, null, '201304129', null, null, '0', null, '0', '2013-01-01 13:43:56', '0', '2013-01-01 13:43:56', null, null, '6', '25');
INSERT INTO `product` VALUES ('33', '2013-01-01 13:43:56', '2013-01-01 13:43:56', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'Max Toney 春装时尚休闲多层卷边领莱卡棉T恤 男 长袖T恤 599[灰色 L]', '0', 'http://storage.shopxx.net/demo-image/3.0/201301/b998f840-91fc-41b6-b73d-70587babf760-thumbnail.jpg', '<img alt=\"\" src=\"http://storage.shopxx.net/demo-image/3.0/201301/ace4788a-261a-491a-9f40-bb1b9aad6a97.jpg\" />', '', '', '', '', null, '88.800000', null, '0', '2013-01-01 13:43:56', '0', '2013-01-01 13:43:56', 'Max Toney 春装时尚休闲多层卷边领莱卡棉T恤 男 长袖T恤 599', '74', '74.000000', '0', '0', '0', null, null, null, '201304130', null, null, '0', null, '0', '2013-01-01 13:43:56', '0', '2013-01-01 13:43:56', null, null, '6', '25');
INSERT INTO `product` VALUES ('34', '2013-01-01 13:43:56', '2013-01-01 13:43:56', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'Max Toney 春装时尚休闲多层卷边领莱卡棉T恤 男 长袖T恤 599[灰色 M]', '0', 'http://storage.shopxx.net/demo-image/3.0/201301/b998f840-91fc-41b6-b73d-70587babf760-thumbnail.jpg', '<img alt=\"\" src=\"http://storage.shopxx.net/demo-image/3.0/201301/ace4788a-261a-491a-9f40-bb1b9aad6a97.jpg\" />', '', '', '', '', null, '88.800000', null, '0', '2013-01-01 13:43:56', '0', '2013-01-01 13:43:56', 'Max Toney 春装时尚休闲多层卷边领莱卡棉T恤 男 长袖T恤 599', '74', '74.000000', '0', '0', '0', null, null, null, '201304131', null, null, '0', null, '0', '2013-01-01 13:43:56', '0', '2013-01-01 13:43:56', null, null, '6', '25');
INSERT INTO `product` VALUES ('35', '2013-01-01 13:43:56', '2013-01-01 13:43:56', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'Max Toney 春装时尚休闲多层卷边领莱卡棉T恤 男 长袖T恤 599[黑色 XXL]', '0', 'http://storage.shopxx.net/demo-image/3.0/201301/b998f840-91fc-41b6-b73d-70587babf760-thumbnail.jpg', '<img alt=\"\" src=\"http://storage.shopxx.net/demo-image/3.0/201301/ace4788a-261a-491a-9f40-bb1b9aad6a97.jpg\" />', '', '', '', '', null, '88.800000', null, '0', '2013-01-01 13:43:56', '0', '2013-01-01 13:43:56', 'Max Toney 春装时尚休闲多层卷边领莱卡棉T恤 男 长袖T恤 599', '74', '74.000000', '0', '0', '0', null, null, null, '201304132', null, null, '0', null, '0', '2013-01-01 13:43:56', '0', '2013-01-01 13:43:56', null, null, '6', '25');
INSERT INTO `product` VALUES ('36', '2013-01-01 13:43:56', '2013-01-01 13:43:56', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'Max Toney 春装时尚休闲多层卷边领莱卡棉T恤 男 长袖T恤 599[黑色 XL]', '0', 'http://storage.shopxx.net/demo-image/3.0/201301/b998f840-91fc-41b6-b73d-70587babf760-thumbnail.jpg', '<img alt=\"\" src=\"http://storage.shopxx.net/demo-image/3.0/201301/ace4788a-261a-491a-9f40-bb1b9aad6a97.jpg\" />', '', '', '', '', null, '88.800000', null, '0', '2013-01-01 13:43:56', '0', '2013-01-01 13:43:56', 'Max Toney 春装时尚休闲多层卷边领莱卡棉T恤 男 长袖T恤 599', '74', '74.000000', '0', '0', '0', null, null, null, '201304133', null, null, '0', null, '0', '2013-01-01 13:43:56', '0', '2013-01-01 13:43:56', null, null, '6', '25');
INSERT INTO `product` VALUES ('37', '2013-01-01 13:43:56', '2013-01-01 13:43:56', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'Max Toney 春装时尚休闲多层卷边领莱卡棉T恤 男 长袖T恤 599[黑色 L]', '0', 'http://storage.shopxx.net/demo-image/3.0/201301/b998f840-91fc-41b6-b73d-70587babf760-thumbnail.jpg', '<img alt=\"\" src=\"http://storage.shopxx.net/demo-image/3.0/201301/ace4788a-261a-491a-9f40-bb1b9aad6a97.jpg\" />', '', '', '', '', null, '88.800000', null, '0', '2013-01-01 13:43:56', '0', '2013-01-01 13:43:56', 'Max Toney 春装时尚休闲多层卷边领莱卡棉T恤 男 长袖T恤 599', '74', '74.000000', '0', '0', '0', null, null, null, '201304134', null, null, '0', null, '0', '2013-01-01 13:43:56', '0', '2013-01-01 13:43:56', null, null, '6', '25');
INSERT INTO `product` VALUES ('38', '2013-01-01 13:43:56', '2013-01-01 13:43:56', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'Max Toney 春装时尚休闲多层卷边领莱卡棉T恤 男 长袖T恤 599[黑色 M]', '0', 'http://storage.shopxx.net/demo-image/3.0/201301/b998f840-91fc-41b6-b73d-70587babf760-thumbnail.jpg', '<img alt=\"\" src=\"http://storage.shopxx.net/demo-image/3.0/201301/ace4788a-261a-491a-9f40-bb1b9aad6a97.jpg\" />', '', '', '', '', null, '88.800000', null, '0', '2013-01-01 13:43:56', '0', '2013-01-01 13:43:56', 'Max Toney 春装时尚休闲多层卷边领莱卡棉T恤 男 长袖T恤 599', '74', '74.000000', '0', '0', '0', null, null, null, '201304135', null, null, '0', null, '0', '2013-01-01 13:43:56', '0', '2013-01-01 13:43:56', null, null, '6', '25');
INSERT INTO `product` VALUES ('39', '2013-01-01 13:43:56', '2013-01-01 13:43:56', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'Max Toney 春装时尚休闲多层卷边领莱卡棉T恤 男 长袖T恤 599[白色 XXL]', '0', 'http://storage.shopxx.net/demo-image/3.0/201301/b998f840-91fc-41b6-b73d-70587babf760-thumbnail.jpg', '<img alt=\"\" src=\"http://storage.shopxx.net/demo-image/3.0/201301/ace4788a-261a-491a-9f40-bb1b9aad6a97.jpg\" />', '', '', '', '', null, '88.800000', null, '0', '2013-01-01 13:43:56', '0', '2013-01-01 13:43:56', 'Max Toney 春装时尚休闲多层卷边领莱卡棉T恤 男 长袖T恤 599', '74', '74.000000', '0', '0', '0', null, null, null, '201304136', null, null, '0', null, '0', '2013-01-01 13:43:56', '0', '2013-01-01 13:43:56', null, null, '6', '25');
INSERT INTO `product` VALUES ('40', '2013-01-01 13:43:56', '2013-01-01 13:43:56', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'Max Toney 春装时尚休闲多层卷边领莱卡棉T恤 男 长袖T恤 599[白色 XL]', '0', 'http://storage.shopxx.net/demo-image/3.0/201301/b998f840-91fc-41b6-b73d-70587babf760-thumbnail.jpg', '<img alt=\"\" src=\"http://storage.shopxx.net/demo-image/3.0/201301/ace4788a-261a-491a-9f40-bb1b9aad6a97.jpg\" />', '', '', '', '', null, '88.800000', null, '0', '2013-01-01 13:43:56', '0', '2013-01-01 13:43:56', 'Max Toney 春装时尚休闲多层卷边领莱卡棉T恤 男 长袖T恤 599', '74', '74.000000', '0', '0', '0', null, null, null, '201304137', null, null, '0', null, '0', '2013-01-01 13:43:56', '0', '2013-01-01 13:43:56', null, null, '6', '25');
INSERT INTO `product` VALUES ('41', '2013-01-01 13:43:56', '2013-01-01 13:43:56', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'Max Toney 春装时尚休闲多层卷边领莱卡棉T恤 男 长袖T恤 599[白色 L]', '0', 'http://storage.shopxx.net/demo-image/3.0/201301/b998f840-91fc-41b6-b73d-70587babf760-thumbnail.jpg', '<img alt=\"\" src=\"http://storage.shopxx.net/demo-image/3.0/201301/ace4788a-261a-491a-9f40-bb1b9aad6a97.jpg\" />', '', '', '', '', null, '88.800000', null, '0', '2013-01-01 13:43:56', '0', '2013-01-01 13:43:56', 'Max Toney 春装时尚休闲多层卷边领莱卡棉T恤 男 长袖T恤 599', '74', '74.000000', '0', '0', '0', null, null, null, '201304138', null, null, '0', null, '0', '2013-01-01 13:43:56', '0', '2013-01-01 13:43:56', null, null, '6', '25');
INSERT INTO `product` VALUES ('42', '2013-01-01 13:43:56', '2013-01-01 13:20:37', '0', '圆领 ', '时尚休闲', null, null, null, null, null, null, null, null, null, null, '长袖', null, null, null, null, null, null, null, null, 'Max Toney 春装时尚休闲多层卷边领莱卡棉T恤 男 长袖T恤 599[白色 M]', '4', 'http://storage.shopxx.net/demo-image/3.0/201301/b998f840-91fc-41b6-b73d-70587babf760-thumbnail.jpg', '<img alt=\"\" src=\"http://storage.shopxx.net/demo-image/3.0/201301/ace4788a-261a-491a-9f40-bb1b9aad6a97.jpg\" />', '', '', '', '', null, '88.800000', null, '4', '2013-01-01 13:20:37', '0', '2013-01-01 13:43:56', 'Max Toney 春装时尚休闲多层卷边领莱卡棉T恤 男 长袖T恤 599', '74', '74.000000', '0', '4.2', '5', null, null, null, '201304139', null, null, '21', null, '4', '2013-01-01 13:20:37', '0', '2013-01-01 13:43:56', null, null, '6', '25');
INSERT INTO `product` VALUES ('43', '2013-01-01 13:48:14', '2013-01-01 13:48:18', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'Max Toney奢华春装 单扣高档全羊毛休闲西装西服 男 219[黑色 XXL]', '1', 'http://storage.shopxx.net/demo-image/3.0/201301/3c79f82f-f136-48aa-9e81-7e10fbb3de2a-thumbnail.jpg', '<img alt=\"\" src=\"http://storage.shopxx.net/demo-image/3.0/201301/adcfd6fe-a0a6-43aa-af89-f77ede383aaa.jpg\" />', '', '', '', '', null, '504.000000', null, '1', '2013-01-01 13:48:18', '0', '2013-01-01 13:48:14', 'Max Toney奢华春装 单扣高档全羊毛休闲西装西服 男 219', '420', '420.000000', '0', '0', '0', null, null, null, '201304140', null, null, '0', null, '1', '2013-01-01 13:48:18', '0', '2013-01-01 13:48:14', null, null, '7', '27');
INSERT INTO `product` VALUES ('44', '2013-01-01 13:48:14', '2013-01-01 13:48:14', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'Max Toney奢华春装 单扣高档全羊毛休闲西装西服 男 219[黑色 XL]', '0', 'http://storage.shopxx.net/demo-image/3.0/201301/3c79f82f-f136-48aa-9e81-7e10fbb3de2a-thumbnail.jpg', '<img alt=\"\" src=\"http://storage.shopxx.net/demo-image/3.0/201301/adcfd6fe-a0a6-43aa-af89-f77ede383aaa.jpg\" />', '', '', '', '', null, '504.000000', null, '0', '2013-01-01 13:48:14', '0', '2013-01-01 13:48:14', 'Max Toney奢华春装 单扣高档全羊毛休闲西装西服 男 219', '420', '420.000000', '0', '0', '0', null, null, null, '201304141', null, null, '0', null, '0', '2013-01-01 13:48:14', '0', '2013-01-01 13:48:14', null, null, '7', '27');
INSERT INTO `product` VALUES ('45', '2013-01-01 13:48:14', '2013-01-01 13:48:14', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'Max Toney奢华春装 单扣高档全羊毛休闲西装西服 男 219[黑色 L]', '0', 'http://storage.shopxx.net/demo-image/3.0/201301/3c79f82f-f136-48aa-9e81-7e10fbb3de2a-thumbnail.jpg', '<img alt=\"\" src=\"http://storage.shopxx.net/demo-image/3.0/201301/adcfd6fe-a0a6-43aa-af89-f77ede383aaa.jpg\" />', '', '', '', '', null, '504.000000', null, '0', '2013-01-01 13:48:14', '0', '2013-01-01 13:48:14', 'Max Toney奢华春装 单扣高档全羊毛休闲西装西服 男 219', '420', '420.000000', '0', '0', '0', null, null, null, '201304142', null, null, '0', null, '0', '2013-01-01 13:48:14', '0', '2013-01-01 13:48:14', null, null, '7', '27');
INSERT INTO `product` VALUES ('46', '2013-01-01 13:48:14', '2013-01-01 11:31:37', '0', '时尚休闲', '修身型', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'Max Toney奢华春装 单扣高档全羊毛休闲西装西服 男 219[黑色 M]', '2', 'http://storage.shopxx.net/demo-image/3.0/201301/3c79f82f-f136-48aa-9e81-7e10fbb3de2a-thumbnail.jpg', '<img alt=\"\" src=\"http://storage.shopxx.net/demo-image/3.0/201301/adcfd6fe-a0a6-43aa-af89-f77ede383aaa.jpg\" />', '', '', '', '', null, '504.000000', null, '2', '2013-01-01 11:31:37', '0', '2013-01-01 13:48:14', 'Max Toney奢华春装 单扣高档全羊毛休闲西装西服 男 219', '420', '420.000000', '0', '4.6', '5', null, null, null, '201304143', null, null, '23', null, '2', '2013-01-01 11:31:37', '0', '2013-01-01 13:48:14', null, null, '7', '27');
INSERT INTO `product` VALUES ('47', '2013-01-01 13:48:27', '2013-01-01 13:48:27', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '梵希蔓 2013新款女装春装白色蕾丝连衣裙长袖大摆裙纱网连衣裙[黑色 XL]', '0', 'http://storage.shopxx.net/demo-image/3.0/201301/a86dec8b-1142-429f-8be4-2933e6f47b9d-thumbnail.jpg', '<img alt=\"\" src=\"http://storage.shopxx.net/demo-image/3.0/201301/d31ff53f-d32f-465d-82d0-0fb9b4604819.jpg\" />', '', '', '', '', null, '285.600000', null, '0', '2013-01-01 13:48:27', '0', '2013-01-01 13:48:27', '梵希蔓 2013新款女装春装白色蕾丝连衣裙长袖大摆裙纱网连衣裙', '238', '238.000000', '0', '0', '0', null, null, null, '201304144', null, null, '0', '件', '0', '2013-01-01 13:48:27', '0', '2013-01-01 13:48:27', null, '1', '8', '11');
INSERT INTO `product` VALUES ('48', '2013-01-01 13:48:27', '2013-01-01 13:48:27', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '梵希蔓 2013新款女装春装白色蕾丝连衣裙长袖大摆裙纱网连衣裙[黑色 L]', '0', 'http://storage.shopxx.net/demo-image/3.0/201301/a86dec8b-1142-429f-8be4-2933e6f47b9d-thumbnail.jpg', '<img alt=\"\" src=\"http://storage.shopxx.net/demo-image/3.0/201301/d31ff53f-d32f-465d-82d0-0fb9b4604819.jpg\" />', '', '', '', '', null, '285.600000', null, '0', '2013-01-01 13:48:27', '0', '2013-01-01 13:48:27', '梵希蔓 2013新款女装春装白色蕾丝连衣裙长袖大摆裙纱网连衣裙', '238', '238.000000', '0', '0', '0', null, null, null, '201304145', null, null, '0', '件', '0', '2013-01-01 13:48:27', '0', '2013-01-01 13:48:27', null, '1', '8', '11');
INSERT INTO `product` VALUES ('49', '2013-01-01 13:48:27', '2013-01-01 13:48:27', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '梵希蔓 2013新款女装春装白色蕾丝连衣裙长袖大摆裙纱网连衣裙[黑色 M]', '0', 'http://storage.shopxx.net/demo-image/3.0/201301/a86dec8b-1142-429f-8be4-2933e6f47b9d-thumbnail.jpg', '<img alt=\"\" src=\"http://storage.shopxx.net/demo-image/3.0/201301/d31ff53f-d32f-465d-82d0-0fb9b4604819.jpg\" />', '', '', '', '', null, '285.600000', null, '0', '2013-01-01 13:48:27', '0', '2013-01-01 13:48:27', '梵希蔓 2013新款女装春装白色蕾丝连衣裙长袖大摆裙纱网连衣裙', '238', '238.000000', '0', '0', '0', null, null, null, '201304146', null, null, '0', '件', '0', '2013-01-01 13:48:27', '0', '2013-01-01 13:48:27', null, '1', '8', '11');
INSERT INTO `product` VALUES ('50', '2013-01-01 13:48:27', '2013-01-01 15:18:59', '0', '蕾丝', '短裙', null, null, null, null, null, null, null, null, null, null, '翻领', '中腰', null, null, null, null, null, null, null, '梵希蔓 2013新款女装春装白色蕾丝连衣裙长袖大摆裙纱网连衣裙[米黄色 M]', '2', 'http://storage.shopxx.net/demo-image/3.0/201301/a86dec8b-1142-429f-8be4-2933e6f47b9d-thumbnail.jpg', '<img alt=\"\" src=\"http://storage.shopxx.net/demo-image/3.0/201301/d31ff53f-d32f-465d-82d0-0fb9b4604819.jpg\" />', '', '', '', '', null, '285.600000', null, '1', '2013-01-01 15:18:59', '0', '2013-01-01 13:48:27', '梵希蔓 2013新款女装春装白色蕾丝连衣裙长袖大摆裙纱网连衣裙', '238', '238.000000', '0', '5', '1', null, null, null, '201304147', null, null, '5', '件', '1', '2013-01-01 15:18:59', '0', '2013-01-01 13:48:27', null, '1', '8', '11');
INSERT INTO `product` VALUES ('51', '2013-01-01 13:53:14', '2013-01-01 13:53:14', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '梵希蔓2013夏装淑女连衣裙雪纺刺绣背心裙高腰荷叶边连衣裙高腰[米黄色 XL]', '0', 'http://storage.shopxx.net/demo-image/3.0/201301/92a7bf42-6294-44a7-b518-19a77186d380-thumbnail.jpg', '<img alt=\"\" src=\"http://storage.shopxx.net/demo-image/3.0/201301/d24042c7-74f7-4831-b38b-6531c15e0a03.jpg\" />', '', '', '', '', null, '345.600000', null, '0', '2013-01-01 13:53:14', '0', '2013-01-01 13:53:14', '梵希蔓2013夏装淑女连衣裙雪纺刺绣背心裙高腰荷叶边连衣裙高腰', '288', '288.000000', '0', '0', '0', null, null, null, '201304148', null, null, '0', '件', '0', '2013-01-01 13:53:14', '0', '2013-01-01 13:53:14', null, '1', '9', '11');
INSERT INTO `product` VALUES ('52', '2013-01-01 13:53:14', '2013-01-01 13:53:14', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '梵希蔓2013夏装淑女连衣裙雪纺刺绣背心裙高腰荷叶边连衣裙高腰[米黄色 L]', '0', 'http://storage.shopxx.net/demo-image/3.0/201301/92a7bf42-6294-44a7-b518-19a77186d380-thumbnail.jpg', '<img alt=\"\" src=\"http://storage.shopxx.net/demo-image/3.0/201301/d24042c7-74f7-4831-b38b-6531c15e0a03.jpg\" />', '', '', '', '', null, '345.600000', null, '0', '2013-01-01 13:53:14', '0', '2013-01-01 13:53:14', '梵希蔓2013夏装淑女连衣裙雪纺刺绣背心裙高腰荷叶边连衣裙高腰', '288', '288.000000', '0', '0', '0', null, null, null, '201304149', null, null, '0', '件', '0', '2013-01-01 13:53:14', '0', '2013-01-01 13:53:14', null, '1', '9', '11');
INSERT INTO `product` VALUES ('53', '2013-01-01 13:53:14', '2013-01-01 13:53:14', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '梵希蔓2013夏装淑女连衣裙雪纺刺绣背心裙高腰荷叶边连衣裙高腰[米黄色 M]', '0', 'http://storage.shopxx.net/demo-image/3.0/201301/92a7bf42-6294-44a7-b518-19a77186d380-thumbnail.jpg', '<img alt=\"\" src=\"http://storage.shopxx.net/demo-image/3.0/201301/d24042c7-74f7-4831-b38b-6531c15e0a03.jpg\" />', '', '', '', '', null, '345.600000', null, '0', '2013-01-01 13:53:14', '0', '2013-01-01 13:53:14', '梵希蔓2013夏装淑女连衣裙雪纺刺绣背心裙高腰荷叶边连衣裙高腰', '288', '288.000000', '0', '0', '0', null, null, null, '201304150', null, null, '0', '件', '0', '2013-01-01 13:53:14', '0', '2013-01-01 13:53:14', null, '1', '9', '11');
INSERT INTO `product` VALUES ('54', '2013-01-01 13:53:14', '2013-01-01 15:20:18', '0', '雪纺', '短裙', null, null, null, null, null, null, null, null, null, null, '圆领', '高腰', null, null, null, null, null, null, null, '梵希蔓2013夏装淑女连衣裙雪纺刺绣背心裙高腰荷叶边连衣裙高腰[米黄色 S]', '2', 'http://storage.shopxx.net/demo-image/3.0/201301/92a7bf42-6294-44a7-b518-19a77186d380-thumbnail.jpg', '<img alt=\"\" src=\"http://storage.shopxx.net/demo-image/3.0/201301/d24042c7-74f7-4831-b38b-6531c15e0a03.jpg\" />', '', '', '', '', null, '345.600000', null, '1', '2013-01-01 15:18:59', '0', '2013-01-01 13:53:14', '梵希蔓2013夏装淑女连衣裙雪纺刺绣背心裙高腰荷叶边连衣裙高腰', '288', '288.000000', '0', '5', '1', null, null, null, '201304151', null, null, '5', '件', '1', '2013-01-01 15:18:59', '0', '2013-01-01 13:53:14', null, '1', '9', '11');
INSERT INTO `product` VALUES ('55', '2013-01-01 13:54:19', '2013-01-01 13:33:31', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'Max Toney 春夏男士休闲西服西装 永不起褶休闲小西装外套 男627[黑色 XXL]', '1', 'http://storage.shopxx.net/demo-image/3.0/201301/40e34b2d-d240-446e-9874-89969edbe89f-thumbnail.jpg', '<img alt=\"\" src=\"http://storage.shopxx.net/demo-image/3.0/201301/f39dd4d6-cbd1-4b99-91b6-c9d7c739c612.jpg\" />', '', '', '', '', null, '506.400000', null, '1', '2013-01-01 13:33:31', '0', '2013-01-01 13:54:19', 'Max Toney 春夏男士休闲西服西装 永不起褶休闲小西装外套 男627', '422', '422.000000', '0', '0', '0', null, null, null, '201304152', null, null, '0', null, '1', '2013-01-01 13:33:31', '0', '2013-01-01 13:54:19', null, null, '10', '27');
INSERT INTO `product` VALUES ('56', '2013-01-01 13:54:19', '2013-01-01 13:33:31', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'Max Toney 春夏男士休闲西服西装 永不起褶休闲小西装外套 男627[黑色 XL]', '1', 'http://storage.shopxx.net/demo-image/3.0/201301/40e34b2d-d240-446e-9874-89969edbe89f-thumbnail.jpg', '<img alt=\"\" src=\"http://storage.shopxx.net/demo-image/3.0/201301/f39dd4d6-cbd1-4b99-91b6-c9d7c739c612.jpg\" />', '', '', '', '', null, '506.400000', null, '1', '2013-01-01 13:33:31', '0', '2013-01-01 13:54:19', 'Max Toney 春夏男士休闲西服西装 永不起褶休闲小西装外套 男627', '422', '422.000000', '0', '0', '0', null, null, null, '201304153', null, null, '0', null, '1', '2013-01-01 13:33:31', '0', '2013-01-01 13:54:19', null, null, '10', '27');
INSERT INTO `product` VALUES ('57', '2013-01-01 13:54:19', '2013-01-01 13:33:31', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'Max Toney 春夏男士休闲西服西装 永不起褶休闲小西装外套 男627[黑色 L]', '1', 'http://storage.shopxx.net/demo-image/3.0/201301/40e34b2d-d240-446e-9874-89969edbe89f-thumbnail.jpg', '<img alt=\"\" src=\"http://storage.shopxx.net/demo-image/3.0/201301/f39dd4d6-cbd1-4b99-91b6-c9d7c739c612.jpg\" />', '', '', '', '', null, '506.400000', null, '1', '2013-01-01 13:33:31', '0', '2013-01-01 13:54:19', 'Max Toney 春夏男士休闲西服西装 永不起褶休闲小西装外套 男627', '422', '422.000000', '0', '0', '0', null, null, null, '201304154', null, null, '0', null, '1', '2013-01-01 13:33:31', '0', '2013-01-01 13:54:19', null, null, '10', '27');
INSERT INTO `product` VALUES ('58', '2013-01-01 13:54:19', '2013-01-01 09:06:21', '0', '时尚休闲', '修身型', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'Max Toney 春夏男士休闲西服西装 永不起褶休闲小西装外套 男627[黑色 M]', '5', 'http://storage.shopxx.net/demo-image/3.0/201301/40e34b2d-d240-446e-9874-89969edbe89f-thumbnail.jpg', '<img alt=\"\" src=\"http://storage.shopxx.net/demo-image/3.0/201301/f39dd4d6-cbd1-4b99-91b6-c9d7c739c612.jpg\" />', '', '', '', '', null, '506.400000', null, '2', '2013-01-01 09:06:21', '0', '2013-01-01 13:54:19', 'Max Toney 春夏男士休闲西服西装 永不起褶休闲小西装外套 男627', '422', '422.000000', '0', '4', '1', null, null, null, '201304155', null, null, '4', null, '2', '2013-01-01 09:06:21', '0', '2013-01-01 13:54:19', null, null, '10', '27');
INSERT INTO `product` VALUES ('59', '2013-01-01 13:58:15', '2013-01-01 13:59:46', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'Max Toney 春装男士休闲西服便西装 时尚修身外套小西装 男 229[灰色 XXL]', '0', 'http://storage.shopxx.net/demo-image/3.0/201301/cae1bc6b-0159-4ce0-9a9c-4926df231b4f-thumbnail.jpg', '<img alt=\"\" src=\"http://storage.shopxx.net/demo-image/3.0/201301/8234c8a5-b1ce-4bd5-9f16-b9d13e4dc63d.jpg\" />', '', '', '', '', null, '543.600000', null, '0', '2013-01-01 13:58:15', '0', '2013-01-01 13:58:15', 'Max Toney 春装男士休闲西服便西装 时尚修身外套小西装 男 229', '453', '453.000000', '0', '0', '0', null, null, null, '201304156', null, null, '0', null, '0', '2013-01-01 13:58:15', '0', '2013-01-01 13:58:15', null, null, '11', '27');
INSERT INTO `product` VALUES ('60', '2013-01-01 13:58:15', '2013-01-01 13:59:57', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'Max Toney 春装男士休闲西服便西装 时尚修身外套小西装 男 229[灰色 XL]', '0', 'http://storage.shopxx.net/demo-image/3.0/201301/cae1bc6b-0159-4ce0-9a9c-4926df231b4f-thumbnail.jpg', '<img alt=\"\" src=\"http://storage.shopxx.net/demo-image/3.0/201301/8234c8a5-b1ce-4bd5-9f16-b9d13e4dc63d.jpg\" />', '', '', '', '', null, '543.600000', null, '0', '2013-01-01 13:58:15', '0', '2013-01-01 13:58:15', 'Max Toney 春装男士休闲西服便西装 时尚修身外套小西装 男 229', '453', '453.000000', '0', '0', '0', null, null, null, '201304157', null, null, '0', null, '0', '2013-01-01 13:58:15', '0', '2013-01-01 13:58:15', null, null, '11', '27');
INSERT INTO `product` VALUES ('61', '2013-01-01 13:58:15', '2013-01-01 14:00:06', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'Max Toney 春装男士休闲西服便西装 时尚修身外套小西装 男 229[灰色 L]', '0', 'http://storage.shopxx.net/demo-image/3.0/201301/cae1bc6b-0159-4ce0-9a9c-4926df231b4f-thumbnail.jpg', '<img alt=\"\" src=\"http://storage.shopxx.net/demo-image/3.0/201301/8234c8a5-b1ce-4bd5-9f16-b9d13e4dc63d.jpg\" />', '', '', '', '', null, '543.600000', null, '0', '2013-01-01 13:58:15', '0', '2013-01-01 13:58:15', 'Max Toney 春装男士休闲西服便西装 时尚修身外套小西装 男 229', '453', '453.000000', '0', '0', '0', null, null, null, '201304158', null, null, '0', null, '0', '2013-01-01 13:58:15', '0', '2013-01-01 13:58:15', null, null, '11', '27');
INSERT INTO `product` VALUES ('62', '2013-01-01 13:58:15', '2013-01-01 14:00:16', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'Max Toney 春装男士休闲西服便西装 时尚修身外套小西装 男 229[灰色 M]', '0', 'http://storage.shopxx.net/demo-image/3.0/201301/cae1bc6b-0159-4ce0-9a9c-4926df231b4f-thumbnail.jpg', '<img alt=\"\" src=\"http://storage.shopxx.net/demo-image/3.0/201301/8234c8a5-b1ce-4bd5-9f16-b9d13e4dc63d.jpg\" />', '', '', '', '', null, '543.600000', null, '0', '2013-01-01 13:58:15', '0', '2013-01-01 13:58:15', 'Max Toney 春装男士休闲西服便西装 时尚修身外套小西装 男 229', '453', '453.000000', '0', '0', '0', null, null, null, '201304159', null, null, '0', null, '0', '2013-01-01 13:58:15', '0', '2013-01-01 13:58:15', null, null, '11', '27');
INSERT INTO `product` VALUES ('63', '2013-01-01 13:58:15', '2013-01-01 14:00:34', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'Max Toney 春装男士休闲西服便西装 时尚修身外套小西装 男 229[黑色 XXL]', '0', 'http://storage.shopxx.net/demo-image/3.0/201301/cae1bc6b-0159-4ce0-9a9c-4926df231b4f-thumbnail.jpg', '<img alt=\"\" src=\"http://storage.shopxx.net/demo-image/3.0/201301/8234c8a5-b1ce-4bd5-9f16-b9d13e4dc63d.jpg\" />', '', '', '', '', null, '543.600000', null, '0', '2013-01-01 13:58:15', '0', '2013-01-01 13:58:15', 'Max Toney 春装男士休闲西服便西装 时尚修身外套小西装 男 229', '453', '453.000000', '0', '0', '0', null, null, null, '201304160', null, null, '0', null, '0', '2013-01-01 13:58:15', '0', '2013-01-01 13:58:15', null, null, '11', '27');
INSERT INTO `product` VALUES ('64', '2013-01-01 13:58:15', '2013-01-01 13:58:15', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'Max Toney 春装男士休闲西服便西装 时尚修身外套小西装 男 229[黑色 XL]', '0', 'http://storage.shopxx.net/demo-image/3.0/201301/cae1bc6b-0159-4ce0-9a9c-4926df231b4f-thumbnail.jpg', '<img alt=\"\" src=\"http://storage.shopxx.net/demo-image/3.0/201301/8234c8a5-b1ce-4bd5-9f16-b9d13e4dc63d.jpg\" />', '', '', '', '', null, '303.600000', null, '0', '2013-01-01 13:58:15', '0', '2013-01-01 13:58:15', 'Max Toney 春装男士休闲西服便西装 时尚修身外套小西装 男 229', '253', '253.000000', '0', '0', '0', null, null, null, '201304161', null, null, '0', null, '0', '2013-01-01 13:58:15', '0', '2013-01-01 13:58:15', null, null, '11', '27');
INSERT INTO `product` VALUES ('65', '2013-01-01 13:58:15', '2013-01-01 14:00:48', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'Max Toney 春装男士休闲西服便西装 时尚修身外套小西装 男 229[黑色 L]', '0', 'http://storage.shopxx.net/demo-image/3.0/201301/cae1bc6b-0159-4ce0-9a9c-4926df231b4f-thumbnail.jpg', '<img alt=\"\" src=\"http://storage.shopxx.net/demo-image/3.0/201301/8234c8a5-b1ce-4bd5-9f16-b9d13e4dc63d.jpg\" />', '', '', '', '', null, '543.600000', null, '0', '2013-01-01 13:58:15', '0', '2013-01-01 13:58:15', 'Max Toney 春装男士休闲西服便西装 时尚修身外套小西装 男 229', '453', '453.000000', '0', '0', '0', null, null, null, '201304162', null, null, '0', null, '0', '2013-01-01 13:58:15', '0', '2013-01-01 13:58:15', null, null, '11', '27');
INSERT INTO `product` VALUES ('66', '2013-01-01 13:58:15', '2013-01-01 09:06:21', '0', '时尚休闲', '修身型', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'Max Toney 春装男士休闲西服便西装 时尚修身外套小西装 男 229[黑色 M]', '3', 'http://storage.shopxx.net/demo-image/3.0/201301/cae1bc6b-0159-4ce0-9a9c-4926df231b4f-thumbnail.jpg', '<img alt=\"\" src=\"http://storage.shopxx.net/demo-image/3.0/201301/8234c8a5-b1ce-4bd5-9f16-b9d13e4dc63d.jpg\" />', '', '', '', '', null, '543.600000', null, '1', '2013-01-01 09:06:21', '0', '2013-01-01 13:58:15', 'Max Toney 春装男士休闲西服便西装 时尚修身外套小西装 男 229', '453', '453.000000', '0', '4', '1', null, null, null, '201304163', null, null, '4', null, '1', '2013-01-01 09:06:21', '0', '2013-01-01 13:58:15', null, null, '11', '27');
INSERT INTO `product` VALUES ('67', '2013-01-01 13:59:32', '2013-01-01 13:59:32', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '梵希蔓2013夏装新款大码品质女装蕾丝连衣裙夏季蛋糕裙短袖连衣裙[黄色 L]', '0', 'http://storage.shopxx.net/demo-image/3.0/201301/f90c486f-eb84-4105-81ef-473cf82eb500-thumbnail.jpg', '<img alt=\"\" src=\"http://storage.shopxx.net/demo-image/3.0/201301/c635f14c-14fe-47a2-8818-88f672d3424b.jpg\" />', '', '', '', '', null, '250.800000', null, '0', '2013-01-01 13:59:32', '0', '2013-01-01 13:59:32', '梵希蔓2013夏装新款大码品质女装蕾丝连衣裙夏季蛋糕裙短袖连衣裙', '209', '209.000000', '0', '0', '0', null, null, null, '201304164', null, null, '0', '件', '0', '2013-01-01 13:59:32', '0', '2013-01-01 13:59:32', null, '1', '12', '11');
INSERT INTO `product` VALUES ('68', '2013-01-01 13:59:32', '2013-01-01 13:59:32', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '梵希蔓2013夏装新款大码品质女装蕾丝连衣裙夏季蛋糕裙短袖连衣裙[黑色 M]', '0', 'http://storage.shopxx.net/demo-image/3.0/201301/f90c486f-eb84-4105-81ef-473cf82eb500-thumbnail.jpg', '<img alt=\"\" src=\"http://storage.shopxx.net/demo-image/3.0/201301/c635f14c-14fe-47a2-8818-88f672d3424b.jpg\" />', '', '', '', '', null, '250.800000', null, '0', '2013-01-01 13:59:32', '0', '2013-01-01 13:59:32', '梵希蔓2013夏装新款大码品质女装蕾丝连衣裙夏季蛋糕裙短袖连衣裙', '209', '209.000000', '0', '0', '0', null, null, null, '201304165', null, null, '0', '件', '0', '2013-01-01 13:59:32', '0', '2013-01-01 13:59:32', null, '1', '12', '11');
INSERT INTO `product` VALUES ('69', '2013-01-01 13:59:32', '2013-01-01 14:35:47', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '梵希蔓2013夏装新款大码品质女装蕾丝连衣裙夏季蛋糕裙短袖连衣裙[黑色 S]', '1', 'http://storage.shopxx.net/demo-image/3.0/201301/f90c486f-eb84-4105-81ef-473cf82eb500-thumbnail.jpg', '<img alt=\"\" src=\"http://storage.shopxx.net/demo-image/3.0/201301/c635f14c-14fe-47a2-8818-88f672d3424b.jpg\" />', '', '', '', '', null, '250.800000', null, '1', '2013-01-01 14:35:47', '0', '2013-01-01 13:59:32', '梵希蔓2013夏装新款大码品质女装蕾丝连衣裙夏季蛋糕裙短袖连衣裙', '209', '209.000000', '0', '0', '0', null, null, null, '201304166', null, null, '0', '件', '1', '2013-01-01 14:35:47', '0', '2013-01-01 13:59:32', null, '1', '12', '11');
INSERT INTO `product` VALUES ('70', '2013-01-01 13:59:32', '2013-01-01 14:35:47', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '梵希蔓2013夏装新款大码品质女装蕾丝连衣裙夏季蛋糕裙短袖连衣裙[米黄色 XL]', '1', 'http://storage.shopxx.net/demo-image/3.0/201301/f90c486f-eb84-4105-81ef-473cf82eb500-thumbnail.jpg', '<img alt=\"\" src=\"http://storage.shopxx.net/demo-image/3.0/201301/c635f14c-14fe-47a2-8818-88f672d3424b.jpg\" />', '', '', '', '', null, '250.800000', null, '1', '2013-01-01 14:35:47', '0', '2013-01-01 13:59:32', '梵希蔓2013夏装新款大码品质女装蕾丝连衣裙夏季蛋糕裙短袖连衣裙', '209', '209.000000', '0', '0', '0', null, null, null, '201304167', null, null, '0', '件', '1', '2013-01-01 14:35:47', '0', '2013-01-01 13:59:32', null, '1', '12', '11');
INSERT INTO `product` VALUES ('71', '2013-01-01 13:59:32', '2013-01-01 13:59:32', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '梵希蔓2013夏装新款大码品质女装蕾丝连衣裙夏季蛋糕裙短袖连衣裙[米黄色 L]', '0', 'http://storage.shopxx.net/demo-image/3.0/201301/f90c486f-eb84-4105-81ef-473cf82eb500-thumbnail.jpg', '<img alt=\"\" src=\"http://storage.shopxx.net/demo-image/3.0/201301/c635f14c-14fe-47a2-8818-88f672d3424b.jpg\" />', '', '', '', '', null, '250.800000', null, '0', '2013-01-01 13:59:32', '0', '2013-01-01 13:59:32', '梵希蔓2013夏装新款大码品质女装蕾丝连衣裙夏季蛋糕裙短袖连衣裙', '209', '209.000000', '0', '0', '0', null, null, null, '201304168', null, null, '0', '件', '0', '2013-01-01 13:59:32', '0', '2013-01-01 13:59:32', null, '1', '12', '11');
INSERT INTO `product` VALUES ('72', '2013-01-01 13:59:32', '2013-01-01 13:59:32', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '梵希蔓2013夏装新款大码品质女装蕾丝连衣裙夏季蛋糕裙短袖连衣裙[米黄色 M]', '0', 'http://storage.shopxx.net/demo-image/3.0/201301/f90c486f-eb84-4105-81ef-473cf82eb500-thumbnail.jpg', '<img alt=\"\" src=\"http://storage.shopxx.net/demo-image/3.0/201301/c635f14c-14fe-47a2-8818-88f672d3424b.jpg\" />', '', '', '', '', null, '250.800000', null, '0', '2013-01-01 13:59:32', '0', '2013-01-01 13:59:32', '梵希蔓2013夏装新款大码品质女装蕾丝连衣裙夏季蛋糕裙短袖连衣裙', '209', '209.000000', '0', '0', '0', null, null, null, '201304169', null, null, '0', '件', '0', '2013-01-01 13:59:32', '0', '2013-01-01 13:59:32', null, '1', '12', '11');
INSERT INTO `product` VALUES ('73', '2013-01-01 13:59:32', '2013-01-01 14:35:47', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '梵希蔓2013夏装新款大码品质女装蕾丝连衣裙夏季蛋糕裙短袖连衣裙[卡其色 XL]', '3', 'http://storage.shopxx.net/demo-image/3.0/201301/f90c486f-eb84-4105-81ef-473cf82eb500-thumbnail.jpg', '<img alt=\"\" src=\"http://storage.shopxx.net/demo-image/3.0/201301/c635f14c-14fe-47a2-8818-88f672d3424b.jpg\" />', '', '', '', '', null, '250.800000', null, '3', '2013-01-01 14:35:47', '0', '2013-01-01 13:59:32', '梵希蔓2013夏装新款大码品质女装蕾丝连衣裙夏季蛋糕裙短袖连衣裙', '209', '209.000000', '0', '0', '0', null, null, null, '201304170', null, null, '0', '件', '3', '2013-01-01 14:35:47', '0', '2013-01-01 13:59:32', null, '1', '12', '11');
INSERT INTO `product` VALUES ('74', '2013-01-01 13:59:32', '2013-01-01 14:35:47', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '梵希蔓2013夏装新款大码品质女装蕾丝连衣裙夏季蛋糕裙短袖连衣裙[卡其色 L]', '3', 'http://storage.shopxx.net/demo-image/3.0/201301/f90c486f-eb84-4105-81ef-473cf82eb500-thumbnail.jpg', '<img alt=\"\" src=\"http://storage.shopxx.net/demo-image/3.0/201301/c635f14c-14fe-47a2-8818-88f672d3424b.jpg\" />', '', '', '', '', null, '250.800000', null, '3', '2013-01-01 14:35:47', '0', '2013-01-01 13:59:32', '梵希蔓2013夏装新款大码品质女装蕾丝连衣裙夏季蛋糕裙短袖连衣裙', '209', '209.000000', '0', '0', '0', null, null, null, '201304171', null, null, '0', '件', '3', '2013-01-01 14:35:47', '0', '2013-01-01 13:59:32', null, '1', '12', '11');
INSERT INTO `product` VALUES ('75', '2013-01-01 13:59:32', '2013-01-01 14:35:47', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '梵希蔓2013夏装新款大码品质女装蕾丝连衣裙夏季蛋糕裙短袖连衣裙[卡其色 M]', '2', 'http://storage.shopxx.net/demo-image/3.0/201301/f90c486f-eb84-4105-81ef-473cf82eb500-thumbnail.jpg', '<img alt=\"\" src=\"http://storage.shopxx.net/demo-image/3.0/201301/c635f14c-14fe-47a2-8818-88f672d3424b.jpg\" />', '', '', '', '', null, '250.800000', null, '2', '2013-01-01 14:35:47', '0', '2013-01-01 13:59:32', '梵希蔓2013夏装新款大码品质女装蕾丝连衣裙夏季蛋糕裙短袖连衣裙', '209', '209.000000', '0', '0', '0', null, null, null, '201304172', null, null, '0', '件', '2', '2013-01-01 14:35:47', '0', '2013-01-01 13:59:32', null, '1', '12', '11');
INSERT INTO `product` VALUES ('76', '2013-01-01 13:59:32', '2013-01-01 15:22:27', '0', '蕾丝', '短裙', null, null, null, null, null, null, null, null, null, null, '圆领', '低腰', null, null, null, null, null, null, null, '梵希蔓2013夏装新款大码品质女装蕾丝连衣裙夏季蛋糕裙短袖连衣裙[卡其色 S]', '5', 'http://storage.shopxx.net/demo-image/3.0/201301/f90c486f-eb84-4105-81ef-473cf82eb500-thumbnail.jpg', '<img alt=\"\" src=\"http://storage.shopxx.net/demo-image/3.0/201301/c635f14c-14fe-47a2-8818-88f672d3424b.jpg\" />', '', '', '', '', null, '250.800000', null, '5', '2013-01-01 10:40:04', '0', '2013-01-01 13:59:32', '梵希蔓2013夏装新款大码品质女装蕾丝连衣裙夏季蛋糕裙短袖连衣裙', '209', '209.000000', '0', '4', '1', null, null, null, '201304173', null, null, '4', '件', '5', '2013-01-01 10:40:04', '0', '2013-01-01 13:59:32', null, '1', '12', '11');
INSERT INTO `product` VALUES ('77', '2013-01-01 14:04:07', '2013-01-01 14:04:07', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '梵希蔓2013夏装新款蕾丝连衣裙镂空假两件套连衣裙刺绣短袖连衣裙[白色 XL]', '0', 'http://storage.shopxx.net/demo-image/3.0/201301/9aafeb39-655a-43f9-97d5-248508deeeed-thumbnail.jpg', '<img alt=\"\" src=\"http://storage.shopxx.net/demo-image/3.0/201301/d44756aa-28ca-4d6a-8a95-1c25a298c2ff.jpg\" />', '', '', '', '', null, '357.600000', null, '0', '2013-01-01 14:04:07', '0', '2013-01-01 14:04:07', '梵希蔓2013夏装新款蕾丝连衣裙镂空假两件套连衣裙刺绣短袖连衣裙', '298', '298.000000', '0', '0', '0', null, null, null, '201304174', null, null, '0', '件', '0', '2013-01-01 14:04:07', '0', '2013-01-01 14:04:07', null, '1', '13', '11');
INSERT INTO `product` VALUES ('78', '2013-01-01 14:04:07', '2013-01-01 14:04:07', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '梵希蔓2013夏装新款蕾丝连衣裙镂空假两件套连衣裙刺绣短袖连衣裙[白色 L]', '0', 'http://storage.shopxx.net/demo-image/3.0/201301/9aafeb39-655a-43f9-97d5-248508deeeed-thumbnail.jpg', '<img alt=\"\" src=\"http://storage.shopxx.net/demo-image/3.0/201301/d44756aa-28ca-4d6a-8a95-1c25a298c2ff.jpg\" />', '', '', '', '', null, '357.600000', null, '0', '2013-01-01 14:04:07', '0', '2013-01-01 14:04:07', '梵希蔓2013夏装新款蕾丝连衣裙镂空假两件套连衣裙刺绣短袖连衣裙', '298', '298.000000', '0', '0', '0', null, null, null, '201304175', null, null, '0', '件', '0', '2013-01-01 14:04:07', '0', '2013-01-01 14:04:07', null, '1', '13', '11');
INSERT INTO `product` VALUES ('79', '2013-01-01 14:04:07', '2013-01-01 14:04:07', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '梵希蔓2013夏装新款蕾丝连衣裙镂空假两件套连衣裙刺绣短袖连衣裙[白色 M]', '0', 'http://storage.shopxx.net/demo-image/3.0/201301/9aafeb39-655a-43f9-97d5-248508deeeed-thumbnail.jpg', '<img alt=\"\" src=\"http://storage.shopxx.net/demo-image/3.0/201301/d44756aa-28ca-4d6a-8a95-1c25a298c2ff.jpg\" />', '', '', '', '', null, '357.600000', null, '0', '2013-01-01 14:04:07', '0', '2013-01-01 14:04:07', '梵希蔓2013夏装新款蕾丝连衣裙镂空假两件套连衣裙刺绣短袖连衣裙', '298', '298.000000', '0', '0', '0', null, null, null, '201304176', null, null, '0', '件', '0', '2013-01-01 14:04:07', '0', '2013-01-01 14:04:07', null, '1', '13', '11');
INSERT INTO `product` VALUES ('80', '2013-01-01 14:04:07', '2013-01-01 11:16:33', '0', '蕾丝', '短裙', null, null, null, null, null, null, null, null, null, null, '圆领', '中腰', null, null, null, null, null, null, null, '梵希蔓2013夏装新款蕾丝连衣裙镂空假两件套连衣裙刺绣短袖连衣裙[白色 S]', '4', 'http://storage.shopxx.net/demo-image/3.0/201301/9aafeb39-655a-43f9-97d5-248508deeeed-thumbnail.jpg', '<img alt=\"\" src=\"http://storage.shopxx.net/demo-image/3.0/201301/d44756aa-28ca-4d6a-8a95-1c25a298c2ff.jpg\" />', '', '', '', '', null, '357.600000', null, '4', '2013-01-01 11:16:33', '0', '2013-01-01 14:04:07', '梵希蔓2013夏装新款蕾丝连衣裙镂空假两件套连衣裙刺绣短袖连衣裙', '298', '298.000000', '0', '5', '1', null, null, null, '201304177', null, null, '5', '件', '4', '2013-01-01 11:16:33', '0', '2013-01-01 14:04:07', null, '1', '13', '11');
INSERT INTO `product` VALUES ('81', '2013-01-01 14:04:57', '2013-01-01 14:04:57', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '新款夏装159 与狼共舞短袖T恤 男装正品 2013条纹翻领体恤衫 6560[XXXL]', '0', 'http://storage.shopxx.net/demo-image/3.0/201301/a8f4a6a2-2a80-47a2-91b4-af47f46240a0-thumbnail.jpg', '<img alt=\"\" src=\"http://storage.shopxx.net/demo-image/3.0/201301/d6aa7797-b9ae-4b35-b4b0-78fb524be679.jpg\" />', '', '', '', '', null, '237.600000', null, '0', '2013-01-01 14:04:57', '0', '2013-01-01 14:04:57', '新款夏装159 与狼共舞短袖T恤 男装正品 2013条纹翻领体恤衫 6560', '198', '198.000000', '0', '0', '0', null, null, null, '201304178', null, null, '0', null, '0', '2013-01-01 14:04:57', '0', '2013-01-01 14:04:57', null, null, '14', '25');
INSERT INTO `product` VALUES ('82', '2013-01-01 14:04:57', '2013-01-01 14:04:57', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '新款夏装159 与狼共舞短袖T恤 男装正品 2013条纹翻领体恤衫 6560[XXL]', '0', 'http://storage.shopxx.net/demo-image/3.0/201301/a8f4a6a2-2a80-47a2-91b4-af47f46240a0-thumbnail.jpg', '<img alt=\"\" src=\"http://storage.shopxx.net/demo-image/3.0/201301/d6aa7797-b9ae-4b35-b4b0-78fb524be679.jpg\" />', '', '', '', '', null, '237.600000', null, '0', '2013-01-01 14:04:57', '0', '2013-01-01 14:04:57', '新款夏装159 与狼共舞短袖T恤 男装正品 2013条纹翻领体恤衫 6560', '198', '198.000000', '0', '0', '0', null, null, null, '201304179', null, null, '0', null, '0', '2013-01-01 14:04:57', '0', '2013-01-01 14:04:57', null, null, '14', '25');
INSERT INTO `product` VALUES ('83', '2013-01-01 14:04:57', '2013-01-01 14:04:57', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '新款夏装159 与狼共舞短袖T恤 男装正品 2013条纹翻领体恤衫 6560[XL]', '0', 'http://storage.shopxx.net/demo-image/3.0/201301/a8f4a6a2-2a80-47a2-91b4-af47f46240a0-thumbnail.jpg', '<img alt=\"\" src=\"http://storage.shopxx.net/demo-image/3.0/201301/d6aa7797-b9ae-4b35-b4b0-78fb524be679.jpg\" />', '', '', '', '', null, '237.600000', null, '0', '2013-01-01 14:04:57', '0', '2013-01-01 14:04:57', '新款夏装159 与狼共舞短袖T恤 男装正品 2013条纹翻领体恤衫 6560', '198', '198.000000', '0', '0', '0', null, null, null, '201304180', null, null, '0', null, '0', '2013-01-01 14:04:57', '0', '2013-01-01 14:04:57', null, null, '14', '25');
INSERT INTO `product` VALUES ('84', '2013-01-01 14:04:57', '2013-01-01 14:04:57', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '新款夏装159 与狼共舞短袖T恤 男装正品 2013条纹翻领体恤衫 6560[L]', '0', 'http://storage.shopxx.net/demo-image/3.0/201301/a8f4a6a2-2a80-47a2-91b4-af47f46240a0-thumbnail.jpg', '<img alt=\"\" src=\"http://storage.shopxx.net/demo-image/3.0/201301/d6aa7797-b9ae-4b35-b4b0-78fb524be679.jpg\" />', '', '', '', '', null, '237.600000', null, '0', '2013-01-01 14:04:57', '0', '2013-01-01 14:04:57', '新款夏装159 与狼共舞短袖T恤 男装正品 2013条纹翻领体恤衫 6560', '198', '198.000000', '0', '0', '0', null, null, null, '201304181', null, null, '0', null, '0', '2013-01-01 14:04:57', '0', '2013-01-01 14:04:57', null, null, '14', '25');
INSERT INTO `product` VALUES ('85', '2013-01-01 14:04:57', '2013-01-01 14:04:57', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '新款夏装159 与狼共舞短袖T恤 男装正品 2013条纹翻领体恤衫 6560[M]', '0', 'http://storage.shopxx.net/demo-image/3.0/201301/a8f4a6a2-2a80-47a2-91b4-af47f46240a0-thumbnail.jpg', '<img alt=\"\" src=\"http://storage.shopxx.net/demo-image/3.0/201301/d6aa7797-b9ae-4b35-b4b0-78fb524be679.jpg\" />', '', '', '', '', null, '237.600000', null, '0', '2013-01-01 14:04:57', '0', '2013-01-01 14:04:57', '新款夏装159 与狼共舞短袖T恤 男装正品 2013条纹翻领体恤衫 6560', '198', '198.000000', '0', '0', '0', null, null, null, '201304182', null, null, '0', null, '0', '2013-01-01 14:04:57', '0', '2013-01-01 14:04:57', null, null, '14', '25');
INSERT INTO `product` VALUES ('86', '2013-01-01 14:04:57', '2013-01-01 15:18:59', '0', '翻领 ', '时尚休闲', null, null, null, null, null, null, null, null, null, null, '短袖', null, null, null, null, null, null, null, null, '新款夏装159 与狼共舞短袖T恤 男装正品 2013条纹翻领体恤衫 6560[S]', '3', 'http://storage.shopxx.net/demo-image/3.0/201301/a8f4a6a2-2a80-47a2-91b4-af47f46240a0-thumbnail.jpg', '<img alt=\"\" src=\"http://storage.shopxx.net/demo-image/3.0/201301/d6aa7797-b9ae-4b35-b4b0-78fb524be679.jpg\" />', '', '', '', '', null, '237.600000', null, '1', '2013-01-01 15:18:59', '0', '2013-01-01 14:04:57', '新款夏装159 与狼共舞短袖T恤 男装正品 2013条纹翻领体恤衫 6560', '198', '198.000000', '0', '4', '1', null, null, null, '201304183', null, null, '4', null, '1', '2013-01-01 15:18:59', '0', '2013-01-01 14:04:57', null, null, '14', '25');
INSERT INTO `product` VALUES ('87', '2013-01-01 14:07:46', '2013-01-01 14:07:46', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '夏装新品179 与狼共舞短袖T恤 气质拼接 男装正品 翻领修身6614[XXXL]', '0', 'http://storage.shopxx.net/demo-image/3.0/201301/7b3c0647-1016-4d13-8b84-4d63818e1179-thumbnail.jpg', '<img alt=\"\" src=\"http://storage.shopxx.net/demo-image/3.0/201301/01f1cf55-75cf-4447-8513-75047ab24681.jpg\" />', '', '', '', '', null, '243.600000', null, '0', '2013-01-01 14:07:46', '0', '2013-01-01 14:07:46', '夏装新品179 与狼共舞短袖T恤 气质拼接 男装正品 翻领修身6614', '203', '203.000000', '0', '0', '0', null, null, null, '201304184', null, null, '0', null, '0', '2013-01-01 14:07:46', '0', '2013-01-01 14:07:46', null, null, '15', '25');
INSERT INTO `product` VALUES ('88', '2013-01-01 14:07:46', '2013-01-01 14:07:46', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '夏装新品179 与狼共舞短袖T恤 气质拼接 男装正品 翻领修身6614[XXL]', '0', 'http://storage.shopxx.net/demo-image/3.0/201301/7b3c0647-1016-4d13-8b84-4d63818e1179-thumbnail.jpg', '<img alt=\"\" src=\"http://storage.shopxx.net/demo-image/3.0/201301/01f1cf55-75cf-4447-8513-75047ab24681.jpg\" />', '', '', '', '', null, '243.600000', null, '0', '2013-01-01 14:07:46', '0', '2013-01-01 14:07:46', '夏装新品179 与狼共舞短袖T恤 气质拼接 男装正品 翻领修身6614', '203', '203.000000', '0', '0', '0', null, null, null, '201304185', null, null, '0', null, '0', '2013-01-01 14:07:46', '0', '2013-01-01 14:07:46', null, null, '15', '25');
INSERT INTO `product` VALUES ('89', '2013-01-01 14:07:46', '2013-01-01 14:07:46', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '夏装新品179 与狼共舞短袖T恤 气质拼接 男装正品 翻领修身6614[XL]', '0', 'http://storage.shopxx.net/demo-image/3.0/201301/7b3c0647-1016-4d13-8b84-4d63818e1179-thumbnail.jpg', '<img alt=\"\" src=\"http://storage.shopxx.net/demo-image/3.0/201301/01f1cf55-75cf-4447-8513-75047ab24681.jpg\" />', '', '', '', '', null, '243.600000', null, '0', '2013-01-01 14:07:46', '0', '2013-01-01 14:07:46', '夏装新品179 与狼共舞短袖T恤 气质拼接 男装正品 翻领修身6614', '203', '203.000000', '0', '0', '0', null, null, null, '201304186', null, null, '0', null, '0', '2013-01-01 14:07:46', '0', '2013-01-01 14:07:46', null, null, '15', '25');
INSERT INTO `product` VALUES ('90', '2013-01-01 14:07:46', '2013-01-01 14:07:46', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '夏装新品179 与狼共舞短袖T恤 气质拼接 男装正品 翻领修身6614[L]', '0', 'http://storage.shopxx.net/demo-image/3.0/201301/7b3c0647-1016-4d13-8b84-4d63818e1179-thumbnail.jpg', '<img alt=\"\" src=\"http://storage.shopxx.net/demo-image/3.0/201301/01f1cf55-75cf-4447-8513-75047ab24681.jpg\" />', '', '', '', '', null, '243.600000', null, '0', '2013-01-01 14:07:46', '0', '2013-01-01 14:07:46', '夏装新品179 与狼共舞短袖T恤 气质拼接 男装正品 翻领修身6614', '203', '203.000000', '0', '0', '0', null, null, null, '201304187', null, null, '0', null, '0', '2013-01-01 14:07:46', '0', '2013-01-01 14:07:46', null, null, '15', '25');
INSERT INTO `product` VALUES ('91', '2013-01-01 14:07:46', '2013-01-01 08:56:27', '0', '翻领 ', '时尚休闲', null, null, null, null, null, null, null, null, null, null, '短袖', null, null, null, null, null, null, null, null, '夏装新品179 与狼共舞短袖T恤 气质拼接 男装正品 翻领修身6614[M]', '3', 'http://storage.shopxx.net/demo-image/3.0/201301/7b3c0647-1016-4d13-8b84-4d63818e1179-thumbnail.jpg', '<img alt=\"\" src=\"http://storage.shopxx.net/demo-image/3.0/201301/01f1cf55-75cf-4447-8513-75047ab24681.jpg\" />', '', '', '', '', null, '243.600000', null, '1', '2013-01-01 08:55:09', '0', '2013-01-01 14:07:46', '夏装新品179 与狼共舞短袖T恤 气质拼接 男装正品 翻领修身6614', '203', '203.000000', '0', '4', '1', null, null, null, '201304188', null, null, '4', null, '1', '2013-01-01 08:55:09', '0', '2013-01-01 14:07:46', null, null, '15', '25');
INSERT INTO `product` VALUES ('92', '2013-01-01 14:07:49', '2013-01-01 14:07:49', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '梵希蔓2013新款夏装甜美女装连衣裙短袖雪纺蕾丝拼接公主裙百褶裙[咖啡色 XXL]', '0', 'http://storage.shopxx.net/demo-image/3.0/201301/94fd156b-cbdc-40d7-8231-8e26bae2ed9c-thumbnail.jpg', '<img alt=\"\" src=\"http://storage.shopxx.net/demo-image/3.0/201301/dbf1cf52-cced-4b8a-910d-e4fe0e009baa.jpg\" />', '', '', '', '', null, '321.600000', null, '0', '2013-01-01 14:07:49', '0', '2013-01-01 14:07:49', '梵希蔓2013新款夏装甜美女装连衣裙短袖雪纺蕾丝拼接公主裙百褶裙', '268', '268.000000', '0', '0', '0', null, null, null, '201304189', null, null, '0', '件', '0', '2013-01-01 14:07:49', '0', '2013-01-01 14:07:49', null, '1', '16', '11');
INSERT INTO `product` VALUES ('93', '2013-01-01 14:07:49', '2013-01-01 14:07:49', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '梵希蔓2013新款夏装甜美女装连衣裙短袖雪纺蕾丝拼接公主裙百褶裙[咖啡色 XL]', '0', 'http://storage.shopxx.net/demo-image/3.0/201301/94fd156b-cbdc-40d7-8231-8e26bae2ed9c-thumbnail.jpg', '<img alt=\"\" src=\"http://storage.shopxx.net/demo-image/3.0/201301/dbf1cf52-cced-4b8a-910d-e4fe0e009baa.jpg\" />', '', '', '', '', null, '321.600000', null, '0', '2013-01-01 14:07:49', '0', '2013-01-01 14:07:49', '梵希蔓2013新款夏装甜美女装连衣裙短袖雪纺蕾丝拼接公主裙百褶裙', '268', '268.000000', '0', '0', '0', null, null, null, '201304190', null, null, '0', '件', '0', '2013-01-01 14:07:49', '0', '2013-01-01 14:07:49', null, '1', '16', '11');
INSERT INTO `product` VALUES ('94', '2013-01-01 14:07:49', '2013-01-01 14:07:49', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '梵希蔓2013新款夏装甜美女装连衣裙短袖雪纺蕾丝拼接公主裙百褶裙[咖啡色 L]', '0', 'http://storage.shopxx.net/demo-image/3.0/201301/94fd156b-cbdc-40d7-8231-8e26bae2ed9c-thumbnail.jpg', '<img alt=\"\" src=\"http://storage.shopxx.net/demo-image/3.0/201301/dbf1cf52-cced-4b8a-910d-e4fe0e009baa.jpg\" />', '', '', '', '', null, '321.600000', null, '0', '2013-01-01 14:07:49', '0', '2013-01-01 14:07:49', '梵希蔓2013新款夏装甜美女装连衣裙短袖雪纺蕾丝拼接公主裙百褶裙', '268', '268.000000', '0', '0', '0', null, null, null, '201304191', null, null, '0', '件', '0', '2013-01-01 14:07:49', '0', '2013-01-01 14:07:49', null, '1', '16', '11');
INSERT INTO `product` VALUES ('95', '2013-01-01 14:07:49', '2013-01-01 14:07:49', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '梵希蔓2013新款夏装甜美女装连衣裙短袖雪纺蕾丝拼接公主裙百褶裙[咖啡色 M]', '0', 'http://storage.shopxx.net/demo-image/3.0/201301/94fd156b-cbdc-40d7-8231-8e26bae2ed9c-thumbnail.jpg', '<img alt=\"\" src=\"http://storage.shopxx.net/demo-image/3.0/201301/dbf1cf52-cced-4b8a-910d-e4fe0e009baa.jpg\" />', '', '', '', '', null, '321.600000', null, '0', '2013-01-01 14:07:49', '0', '2013-01-01 14:07:49', '梵希蔓2013新款夏装甜美女装连衣裙短袖雪纺蕾丝拼接公主裙百褶裙', '268', '268.000000', '0', '0', '0', null, null, null, '201304192', null, null, '0', '件', '0', '2013-01-01 14:07:49', '0', '2013-01-01 14:07:49', null, '1', '16', '11');
INSERT INTO `product` VALUES ('96', '2013-01-01 14:07:49', '2013-01-01 09:23:09', '0', '雪纺', '短裙', null, null, null, null, null, null, null, null, null, null, '圆领', '高腰', null, null, null, null, null, null, null, '梵希蔓2013新款夏装甜美女装连衣裙短袖雪纺蕾丝拼接公主裙百褶裙[咖啡色 S]', '3', 'http://storage.shopxx.net/demo-image/3.0/201301/94fd156b-cbdc-40d7-8231-8e26bae2ed9c-thumbnail.jpg', '<img alt=\"\" src=\"http://storage.shopxx.net/demo-image/3.0/201301/dbf1cf52-cced-4b8a-910d-e4fe0e009baa.jpg\" />', '', '', '', '', null, '321.600000', null, '1', '2013-01-01 09:23:09', '0', '2013-01-01 14:07:49', '梵希蔓2013新款夏装甜美女装连衣裙短袖雪纺蕾丝拼接公主裙百褶裙', '268', '268.000000', '0', '0', '0', null, null, null, '201304193', null, null, '0', '件', '1', '2013-01-01 09:23:09', '0', '2013-01-01 14:07:49', null, '1', '16', '11');
INSERT INTO `product` VALUES ('97', '2013-01-01 14:10:21', '2013-01-01 14:10:21', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '春装新款159 与狼共舞长袖T恤 男装正品 翻领纯棉条纹体恤衫6534[XXL]', '0', 'http://storage.shopxx.net/demo-image/3.0/201301/bb99deac-0b33-48f1-a3ad-e8310516be07-thumbnail.jpg', '<img alt=\"\" src=\"http://storage.shopxx.net/demo-image/3.0/201301/5f4d8a0a-ae99-45eb-92a8-d1cb8a47c2d3.jpg\" />', '', '', '', '', null, '243.600000', null, '0', '2013-01-01 14:10:21', '0', '2013-01-01 14:10:21', '春装新款159 与狼共舞长袖T恤 男装正品 翻领纯棉条纹体恤衫6534', '203', '203.000000', '0', '0', '0', null, null, null, '201304194', null, null, '0', null, '0', '2013-01-01 14:10:21', '0', '2013-01-01 14:10:21', null, null, '17', '25');
INSERT INTO `product` VALUES ('98', '2013-01-01 14:10:21', '2013-01-01 09:06:21', '0', '翻领 ', '时尚休闲', null, null, null, null, null, null, null, null, null, null, '长袖', null, null, null, null, null, null, null, null, '春装新款159 与狼共舞长袖T恤 男装正品 翻领纯棉条纹体恤衫6534[XL]', '3', 'http://storage.shopxx.net/demo-image/3.0/201301/bb99deac-0b33-48f1-a3ad-e8310516be07-thumbnail.jpg', '<img alt=\"\" src=\"http://storage.shopxx.net/demo-image/3.0/201301/5f4d8a0a-ae99-45eb-92a8-d1cb8a47c2d3.jpg\" />', '', '', '', '', null, '243.600000', null, '1', '2013-01-01 09:06:21', '0', '2013-01-01 14:10:21', '春装新款159 与狼共舞长袖T恤 男装正品 翻领纯棉条纹体恤衫6534', '203', '203.000000', '0', '5', '1', null, null, null, '201304195', null, null, '5', null, '1', '2013-01-01 09:06:21', '0', '2013-01-01 14:10:21', null, null, '17', '25');
INSERT INTO `product` VALUES ('99', '2013-01-01 14:11:09', '2013-01-01 14:35:47', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '梵希蔓新款2013春装蕾丝连衣裙长袖春款连衣裙雪纺蕾丝雪纺裙长裙[米黄色 XL]', '1', 'http://storage.shopxx.net/demo-image/3.0/201301/1984763e-a88d-4f6c-97d9-5ceea190eed9-thumbnail.jpg', '<img alt=\"\" src=\"http://storage.shopxx.net/demo-image/3.0/201301/e68e2c1a-47fe-41c7-acab-c9d09f13db70.jpg\" />', '', '', '', '', null, '346.420000', null, '1', '2013-01-01 14:35:47', '0', '2013-01-01 14:11:08', '梵希蔓新款2013春装蕾丝连衣裙长袖春款连衣裙雪纺蕾丝雪纺裙长裙', '288', '288.680000', '0', '0', '0', null, null, null, '201304196', null, null, '0', '件', '1', '2013-01-01 14:35:47', '0', '2013-01-01 14:11:08', null, '1', '18', '11');
INSERT INTO `product` VALUES ('100', '2013-01-01 14:11:09', '2013-01-01 14:35:47', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '梵希蔓新款2013春装蕾丝连衣裙长袖春款连衣裙雪纺蕾丝雪纺裙长裙[米黄色 M]', '1', 'http://storage.shopxx.net/demo-image/3.0/201301/1984763e-a88d-4f6c-97d9-5ceea190eed9-thumbnail.jpg', '<img alt=\"\" src=\"http://storage.shopxx.net/demo-image/3.0/201301/e68e2c1a-47fe-41c7-acab-c9d09f13db70.jpg\" />', '', '', '', '', null, '346.420000', null, '1', '2013-01-01 14:35:47', '0', '2013-01-01 14:11:08', '梵希蔓新款2013春装蕾丝连衣裙长袖春款连衣裙雪纺蕾丝雪纺裙长裙', '288', '288.680000', '0', '0', '0', null, null, null, '201304197', null, null, '0', '件', '1', '2013-01-01 14:35:47', '0', '2013-01-01 14:11:08', null, '1', '18', '11');
INSERT INTO `product` VALUES ('101', '2013-01-01 14:11:09', '2013-01-01 10:40:04', '0', '其他', '短裙', null, null, null, null, null, null, null, null, null, null, '圆领', '中腰', null, null, null, null, null, null, null, '梵希蔓新款2013春装蕾丝连衣裙长袖春款连衣裙雪纺蕾丝雪纺裙长裙[米黄色 S]', '2', 'http://storage.shopxx.net/demo-image/3.0/201301/1984763e-a88d-4f6c-97d9-5ceea190eed9-thumbnail.jpg', '<img alt=\"\" src=\"http://storage.shopxx.net/demo-image/3.0/201301/e68e2c1a-47fe-41c7-acab-c9d09f13db70.jpg\" />', '', '', '', '', null, '346.420000', null, '2', '2013-01-01 10:40:04', '0', '2013-01-01 14:11:08', '梵希蔓新款2013春装蕾丝连衣裙长袖春款连衣裙雪纺蕾丝雪纺裙长裙', '288', '288.680000', '0', '0', '0', null, null, null, '201304198', null, null, '0', '件', '2', '2013-01-01 10:40:04', '0', '2013-01-01 14:11:08', null, '1', '18', '11');
INSERT INTO `product` VALUES ('102', '2013-01-01 14:14:36', '2013-01-01 14:14:36', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '梵希蔓新款春款女装2013春装连衣裙春款蕾丝连衣裙长袖春秋打底裙[卡其色 L]', '0', 'http://storage.shopxx.net/demo-image/3.0/201301/e4f8d15b-2146-4fd4-8ec6-083aced6f08d-thumbnail.jpg', '<img alt=\"\" src=\"http://storage.shopxx.net/demo-image/3.0/201301/4dfdb495-b5f4-4487-a0db-d02ba99de554.jpg\" />', '', '', '', '', null, '321.600000', null, '0', '2013-01-01 14:14:36', '0', '2013-01-01 14:14:36', '梵希蔓新款春款女装2013春装连衣裙春款蕾丝连衣裙长袖春秋打底裙', '268', '268.000000', '0', '0', '0', null, null, null, '201304199', null, null, '0', '件', '0', '2013-01-01 14:14:36', '0', '2013-01-01 14:14:36', null, '1', '19', '11');
INSERT INTO `product` VALUES ('103', '2013-01-01 14:14:36', '2013-01-01 09:23:09', '0', '蕾丝', '短裙', null, null, null, null, null, null, null, null, null, null, '圆领', '中腰', null, null, null, null, null, null, null, '梵希蔓新款春款女装2013春装连衣裙春款蕾丝连衣裙长袖春秋打底裙[卡其色 S]', '4', 'http://storage.shopxx.net/demo-image/3.0/201301/e4f8d15b-2146-4fd4-8ec6-083aced6f08d-thumbnail.jpg', '<img alt=\"\" src=\"http://storage.shopxx.net/demo-image/3.0/201301/4dfdb495-b5f4-4487-a0db-d02ba99de554.jpg\" />', '', '', '', '', null, '321.600000', null, '1', '2013-01-01 09:23:09', '0', '2013-01-01 14:14:36', '梵希蔓新款春款女装2013春装连衣裙春款蕾丝连衣裙长袖春秋打底裙', '268', '268.000000', '0', '4', '1', null, null, null, '201304200', '0', null, '4', '件', '1', '2013-01-01 09:23:09', '0', '2013-01-01 14:14:36', null, '1', '19', '11');
INSERT INTO `product` VALUES ('104', '2013-01-01 14:15:46', '2013-01-01 14:15:46', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2013春夏柒牌男装官方正品男士商务印花短袖T恤衫802T504280[XXXL]', '0', 'http://storage.shopxx.net/demo-image/3.0/201301/1677d34a-0983-4b00-930a-7da65fe2475b-thumbnail.jpg', '<img alt=\"\" src=\"http://storage.shopxx.net/demo-image/3.0/201301/08da496b-a74a-4dc3-8df0-b340d539bfbd.jpg\" />', '', '', '', '', null, '586.800000', null, '0', '2013-01-01 14:15:46', '0', '2013-01-01 14:15:46', '2013春夏柒牌男装官方正品男士商务印花短袖T恤衫802T504280', '489', '489.000000', '0', '0', '0', null, null, null, '201304201', null, null, '0', null, '0', '2013-01-01 14:15:46', '0', '2013-01-01 14:15:46', null, null, '20', '25');
INSERT INTO `product` VALUES ('105', '2013-01-01 14:15:46', '2013-01-01 14:15:46', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2013春夏柒牌男装官方正品男士商务印花短袖T恤衫802T504280[XXL]', '0', 'http://storage.shopxx.net/demo-image/3.0/201301/1677d34a-0983-4b00-930a-7da65fe2475b-thumbnail.jpg', '<img alt=\"\" src=\"http://storage.shopxx.net/demo-image/3.0/201301/08da496b-a74a-4dc3-8df0-b340d539bfbd.jpg\" />', '', '', '', '', null, '586.800000', null, '0', '2013-01-01 14:15:46', '0', '2013-01-01 14:15:46', '2013春夏柒牌男装官方正品男士商务印花短袖T恤衫802T504280', '489', '489.000000', '0', '0', '0', null, null, null, '201304202', null, null, '0', null, '0', '2013-01-01 14:15:46', '0', '2013-01-01 14:15:46', null, null, '20', '25');
INSERT INTO `product` VALUES ('106', '2013-01-01 14:15:46', '2013-01-01 14:15:46', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2013春夏柒牌男装官方正品男士商务印花短袖T恤衫802T504280[XL]', '0', 'http://storage.shopxx.net/demo-image/3.0/201301/1677d34a-0983-4b00-930a-7da65fe2475b-thumbnail.jpg', '<img alt=\"\" src=\"http://storage.shopxx.net/demo-image/3.0/201301/08da496b-a74a-4dc3-8df0-b340d539bfbd.jpg\" />', '', '', '', '', null, '586.800000', null, '0', '2013-01-01 14:15:46', '0', '2013-01-01 14:15:46', '2013春夏柒牌男装官方正品男士商务印花短袖T恤衫802T504280', '489', '489.000000', '0', '0', '0', null, null, null, '201304203', null, null, '0', null, '0', '2013-01-01 14:15:46', '0', '2013-01-01 14:15:46', null, null, '20', '25');
INSERT INTO `product` VALUES ('107', '2013-01-01 14:15:46', '2013-01-01 14:15:46', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2013春夏柒牌男装官方正品男士商务印花短袖T恤衫802T504280[L]', '0', 'http://storage.shopxx.net/demo-image/3.0/201301/1677d34a-0983-4b00-930a-7da65fe2475b-thumbnail.jpg', '<img alt=\"\" src=\"http://storage.shopxx.net/demo-image/3.0/201301/08da496b-a74a-4dc3-8df0-b340d539bfbd.jpg\" />', '', '', '', '', null, '586.800000', null, '0', '2013-01-01 14:15:46', '0', '2013-01-01 14:15:46', '2013春夏柒牌男装官方正品男士商务印花短袖T恤衫802T504280', '489', '489.000000', '0', '0', '0', null, null, null, '201304204', null, null, '0', null, '0', '2013-01-01 14:15:46', '0', '2013-01-01 14:15:46', null, null, '20', '25');
INSERT INTO `product` VALUES ('108', '2013-01-01 14:15:46', '2013-01-01 09:06:21', '0', '翻领 ', '商务休闲 ', null, null, null, null, null, null, null, null, null, null, '短袖', null, null, null, null, null, null, null, null, '2013春夏柒牌男装官方正品男士商务印花短袖T恤衫802T504280[M]', '3', 'http://storage.shopxx.net/demo-image/3.0/201301/1677d34a-0983-4b00-930a-7da65fe2475b-thumbnail.jpg', '<img alt=\"\" src=\"http://storage.shopxx.net/demo-image/3.0/201301/08da496b-a74a-4dc3-8df0-b340d539bfbd.jpg\" />', '', '', '', '', null, '586.800000', null, '1', '2013-01-01 09:06:21', '0', '2013-01-01 14:15:46', '2013春夏柒牌男装官方正品男士商务印花短袖T恤衫802T504280', '489', '489.000000', '0', '5', '1', null, null, null, '201304205', null, null, '5', null, '1', '2013-01-01 09:06:21', '0', '2013-01-01 14:15:46', null, null, '20', '25');
INSERT INTO `product` VALUES ('109', '2013-01-01 14:18:49', '2013-01-01 09:06:21', '0', '商务休闲', '修身型', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2013春夏柒牌男装正品西服 男立领修身韩版 西服套装 902C141200', '4', 'http://storage.shopxx.net/demo-image/3.0/201301/5e5be432-fbee-4bdd-a7bd-a92e01f9bfc4-thumbnail.jpg', '<img alt=\"\" src=\"http://storage.shopxx.net/demo-image/3.0/201301/f309a5d3-6ef6-45e5-a1a7-fd5c3bfda8d2.jpg\" />', '', '', '', '', null, '1078.800000', null, '1', '2013-01-01 09:06:21', '0', '2013-01-01 14:18:49', '2013春夏柒牌男装正品西服 男立领修身韩版 西服套装 902C141200', '899', '899.000000', '0', '4', '1', null, null, null, '201304206', null, null, '4', null, '1', '2013-01-01 09:06:21', '0', '2013-01-01 14:18:49', null, null, '21', '27');
INSERT INTO `product` VALUES ('110', '2013-01-01 14:23:06', '2013-01-01 14:23:06', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2013春夏柒牌男装官方正品男士休闲印花短袖T恤衫702T506653[XXL]', '0', 'http://storage.shopxx.net/demo-image/3.0/201301/3d835c07-08c5-46d7-912d-adcd41f8c8e6-thumbnail.jpg', '<img alt=\"\" src=\"http://storage.shopxx.net/demo-image/3.0/201301/98172903-9690-4062-b58a-59f68877ec0c.jpg\" />', '', '', '', '', null, '886.800000', null, '0', '2013-01-01 14:23:06', '0', '2013-01-01 14:23:06', '2013春夏柒牌男装官方正品男士休闲印花短袖T恤衫702T506653', '739', '739.000000', '0', '0', '0', null, null, null, '201304207', null, null, '0', null, '0', '2013-01-01 14:23:06', '0', '2013-01-01 14:23:06', null, null, '22', '25');
INSERT INTO `product` VALUES ('111', '2013-01-01 14:23:06', '2013-01-01 14:23:06', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2013春夏柒牌男装官方正品男士休闲印花短袖T恤衫702T506653[XL]', '0', 'http://storage.shopxx.net/demo-image/3.0/201301/3d835c07-08c5-46d7-912d-adcd41f8c8e6-thumbnail.jpg', '<img alt=\"\" src=\"http://storage.shopxx.net/demo-image/3.0/201301/98172903-9690-4062-b58a-59f68877ec0c.jpg\" />', '', '', '', '', null, '886.800000', null, '0', '2013-01-01 14:23:06', '0', '2013-01-01 14:23:06', '2013春夏柒牌男装官方正品男士休闲印花短袖T恤衫702T506653', '739', '739.000000', '0', '0', '0', null, null, null, '201304208', null, null, '0', null, '0', '2013-01-01 14:23:06', '0', '2013-01-01 14:23:06', null, null, '22', '25');
INSERT INTO `product` VALUES ('112', '2013-01-01 14:23:06', '2013-01-01 14:23:06', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2013春夏柒牌男装官方正品男士休闲印花短袖T恤衫702T506653[L]', '0', 'http://storage.shopxx.net/demo-image/3.0/201301/3d835c07-08c5-46d7-912d-adcd41f8c8e6-thumbnail.jpg', '<img alt=\"\" src=\"http://storage.shopxx.net/demo-image/3.0/201301/98172903-9690-4062-b58a-59f68877ec0c.jpg\" />', '', '', '', '', null, '886.800000', null, '0', '2013-01-01 14:23:06', '0', '2013-01-01 14:23:06', '2013春夏柒牌男装官方正品男士休闲印花短袖T恤衫702T506653', '739', '739.000000', '0', '0', '0', null, null, null, '201304209', null, null, '0', null, '0', '2013-01-01 14:23:06', '0', '2013-01-01 14:23:06', null, null, '22', '25');
INSERT INTO `product` VALUES ('113', '2013-01-01 14:23:06', '2013-01-01 15:18:59', '0', '翻领 ', '商务休闲 ', null, null, null, null, null, null, null, null, null, null, '短袖', null, null, null, null, null, null, null, null, '2013春夏柒牌男装官方正品男士休闲印花短袖T恤衫702T506653[M]', '2', 'http://storage.shopxx.net/demo-image/3.0/201301/3d835c07-08c5-46d7-912d-adcd41f8c8e6-thumbnail.jpg', '<img alt=\"\" src=\"http://storage.shopxx.net/demo-image/3.0/201301/98172903-9690-4062-b58a-59f68877ec0c.jpg\" />', '', '', '', '', null, '886.800000', null, '1', '2013-01-01 15:18:59', '0', '2013-01-01 14:23:06', '2013春夏柒牌男装官方正品男士休闲印花短袖T恤衫702T506653', '739', '739.000000', '0', '5', '1', null, null, null, '201304210', null, null, '5', null, '1', '2013-01-01 15:18:59', '0', '2013-01-01 14:23:06', null, null, '22', '25');
INSERT INTO `product` VALUES ('114', '2013-01-01 14:25:47', '2013-01-01 09:57:53', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2013春夏柒牌男装官方正品男士条纹T恤衫702T563985[XXL]', '1', 'http://storage.shopxx.net/demo-image/3.0/201301/fbb80ec8-a1d3-49de-b83b-79eae4b1ff69-thumbnail.jpg', '<img alt=\"\" src=\"http://storage.shopxx.net/demo-image/3.0/201301/0d1f1107-fb41-4551-a940-ab539c469a0f.jpg\" />', '', '', '', '', null, '982.800000', null, '1', '2013-01-01 09:57:53', '0', '2013-01-01 14:25:47', '2013春夏柒牌男装官方正品男士条纹T恤衫702T563985', '819', '819.000000', '0', '0', '0', null, null, null, '201304211', null, null, '0', null, '1', '2013-01-01 09:57:53', '0', '2013-01-01 14:25:47', null, null, '23', '25');
INSERT INTO `product` VALUES ('115', '2013-01-01 14:25:47', '2013-01-01 09:57:53', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2013春夏柒牌男装官方正品男士条纹T恤衫702T563985[XL]', '1', 'http://storage.shopxx.net/demo-image/3.0/201301/fbb80ec8-a1d3-49de-b83b-79eae4b1ff69-thumbnail.jpg', '<img alt=\"\" src=\"http://storage.shopxx.net/demo-image/3.0/201301/0d1f1107-fb41-4551-a940-ab539c469a0f.jpg\" />', '', '', '', '', null, '982.800000', null, '1', '2013-01-01 09:57:53', '0', '2013-01-01 14:25:47', '2013春夏柒牌男装官方正品男士条纹T恤衫702T563985', '819', '819.000000', '0', '0', '0', null, null, null, '201304212', null, null, '0', null, '1', '2013-01-01 09:57:53', '0', '2013-01-01 14:25:47', null, null, '23', '25');
INSERT INTO `product` VALUES ('116', '2013-01-01 14:25:47', '2013-01-01 09:57:53', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2013春夏柒牌男装官方正品男士条纹T恤衫702T563985[L]', '1', 'http://storage.shopxx.net/demo-image/3.0/201301/fbb80ec8-a1d3-49de-b83b-79eae4b1ff69-thumbnail.jpg', '<img alt=\"\" src=\"http://storage.shopxx.net/demo-image/3.0/201301/0d1f1107-fb41-4551-a940-ab539c469a0f.jpg\" />', '', '', '', '', null, '982.800000', null, '1', '2013-01-01 09:57:53', '0', '2013-01-01 14:25:47', '2013春夏柒牌男装官方正品男士条纹T恤衫702T563985', '819', '819.000000', '0', '0', '0', null, null, null, '201304213', null, null, '0', null, '1', '2013-01-01 09:57:53', '0', '2013-01-01 14:25:47', null, null, '23', '25');
INSERT INTO `product` VALUES ('117', '2013-01-01 14:25:47', '2013-01-01 15:19:25', '0', '翻领 ', '商务休闲 ', null, null, null, null, null, null, null, null, null, null, '短袖', null, null, null, null, null, null, null, null, '2013春夏柒牌男装官方正品男士条纹T恤衫702T563985[M]', '3', 'http://storage.shopxx.net/demo-image/3.0/201301/fbb80ec8-a1d3-49de-b83b-79eae4b1ff69-thumbnail.jpg', '<img alt=\"\" src=\"http://storage.shopxx.net/demo-image/3.0/201301/0d1f1107-fb41-4551-a940-ab539c469a0f.jpg\" />', '', '', '', '', null, '982.800000', null, '1', '2013-01-01 15:18:59', '0', '2013-01-01 14:25:47', '2013春夏柒牌男装官方正品男士条纹T恤衫702T563985', '819', '819.000000', '0', '4', '1', null, null, null, '201304214', null, null, '4', null, '1', '2013-01-01 15:18:59', '0', '2013-01-01 14:25:47', null, null, '23', '25');
INSERT INTO `product` VALUES ('118', '2013-01-01 14:27:25', '2013-01-01 14:27:25', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'OSA春装外套女春秋韩版泡泡袖女士小西装短外套W13254[黑色 XL]', '0', 'http://storage.shopxx.net/demo-image/3.0/201301/a39fce79-fc04-4400-9e0f-47cee57accab-thumbnail.jpg', '<img alt=\"\" src=\"http://storage.shopxx.net/demo-image/3.0/201301/c1f80f1c-4c18-47d9-800d-7a10d0a42a5f.jpg\" />', '', '', '', '', null, '345.600000', null, '0', '2013-01-01 14:27:25', '0', '2013-01-01 14:27:25', 'OSA春装外套女春秋韩版泡泡袖女士小西装短外套W13254', '288', '288.000000', '0', '0', '0', null, null, null, '201304215', null, null, '0', '件', '0', '2013-01-01 14:27:25', '0', '2013-01-01 14:27:25', null, null, '24', '14');
INSERT INTO `product` VALUES ('119', '2013-01-01 14:27:25', '2013-01-01 14:27:25', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'OSA春装外套女春秋韩版泡泡袖女士小西装短外套W13254[黑色 L]', '0', 'http://storage.shopxx.net/demo-image/3.0/201301/a39fce79-fc04-4400-9e0f-47cee57accab-thumbnail.jpg', '<img alt=\"\" src=\"http://storage.shopxx.net/demo-image/3.0/201301/c1f80f1c-4c18-47d9-800d-7a10d0a42a5f.jpg\" />', '', '', '', '', null, '345.600000', null, '0', '2013-01-01 14:27:25', '0', '2013-01-01 14:27:25', 'OSA春装外套女春秋韩版泡泡袖女士小西装短外套W13254', '288', '288.000000', '0', '0', '0', null, null, null, '201304216', null, null, '0', '件', '0', '2013-01-01 14:27:25', '0', '2013-01-01 14:27:25', null, null, '24', '14');
INSERT INTO `product` VALUES ('120', '2013-01-01 14:27:25', '2013-01-01 14:27:25', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'OSA春装外套女春秋韩版泡泡袖女士小西装短外套W13254[黑色 S]', '0', 'http://storage.shopxx.net/demo-image/3.0/201301/a39fce79-fc04-4400-9e0f-47cee57accab-thumbnail.jpg', '<img alt=\"\" src=\"http://storage.shopxx.net/demo-image/3.0/201301/c1f80f1c-4c18-47d9-800d-7a10d0a42a5f.jpg\" />', '', '', '', '', null, '345.600000', null, '0', '2013-01-01 14:27:25', '0', '2013-01-01 14:27:25', 'OSA春装外套女春秋韩版泡泡袖女士小西装短外套W13254', '288', '288.000000', '0', '0', '0', null, null, null, '201304217', null, null, '0', '件', '0', '2013-01-01 14:27:25', '0', '2013-01-01 14:27:25', null, null, '24', '14');
INSERT INTO `product` VALUES ('121', '2013-01-01 14:27:25', '2013-01-01 14:27:25', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'OSA春装外套女春秋韩版泡泡袖女士小西装短外套W13254[卡其色 M]', '0', 'http://storage.shopxx.net/demo-image/3.0/201301/a39fce79-fc04-4400-9e0f-47cee57accab-thumbnail.jpg', '<img alt=\"\" src=\"http://storage.shopxx.net/demo-image/3.0/201301/c1f80f1c-4c18-47d9-800d-7a10d0a42a5f.jpg\" />', '', '', '', '', null, '345.600000', null, '0', '2013-01-01 14:27:25', '0', '2013-01-01 14:27:25', 'OSA春装外套女春秋韩版泡泡袖女士小西装短外套W13254', '288', '288.000000', '0', '0', '0', null, null, null, '201304218', null, null, '0', '件', '0', '2013-01-01 14:27:25', '0', '2013-01-01 14:27:25', null, null, '24', '14');
INSERT INTO `product` VALUES ('122', '2013-01-01 14:27:25', '2013-01-01 09:23:09', '0', '短款', '修身型', null, null, null, null, null, null, null, null, null, null, '双排扣', null, null, null, null, null, null, null, null, 'OSA春装外套女春秋韩版泡泡袖女士小西装短外套W13254[卡其色 XS]', '5', 'http://storage.shopxx.net/demo-image/3.0/201301/a39fce79-fc04-4400-9e0f-47cee57accab-thumbnail.jpg', '<img alt=\"\" src=\"http://storage.shopxx.net/demo-image/3.0/201301/c1f80f1c-4c18-47d9-800d-7a10d0a42a5f.jpg\" />', '', '', '', '', null, '345.600000', null, '1', '2013-01-01 09:23:09', '0', '2013-01-01 14:27:25', 'OSA春装外套女春秋韩版泡泡袖女士小西装短外套W13254', '288', '288.000000', '0', '4', '1', null, null, null, '201304219', null, null, '4', '件', '1', '2013-01-01 09:23:09', '0', '2013-01-01 14:27:25', null, null, '24', '14');
INSERT INTO `product` VALUES ('123', '2013-01-01 14:29:11', '2013-01-01 14:29:11', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'JackJones杰克琼斯男纯棉怀旧图案短袖T恤V212201016[XXL]', '0', 'http://storage.shopxx.net/demo-image/3.0/201301/a2ac0816-37e4-477a-b179-e64f71252cf5-thumbnail.jpg', '<img alt=\"\" src=\"http://storage.shopxx.net/demo-image/3.0/201301/9db71128-1c2c-408a-89bf-95ea7792ae96.jpg\" />', '', '', '', '', null, '165.600000', null, '0', '2013-01-01 14:29:11', '0', '2013-01-01 14:29:11', 'JackJones杰克琼斯男纯棉怀旧图案短袖T恤V212201016', '138', '138.000000', '0', '0', '0', null, null, null, '201304220', null, null, '0', null, '0', '2013-01-01 14:29:11', '0', '2013-01-01 14:29:11', null, '9', '25', '25');
INSERT INTO `product` VALUES ('124', '2013-01-01 14:29:11', '2013-01-01 14:29:11', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'JackJones杰克琼斯男纯棉怀旧图案短袖T恤V212201016[XL]', '0', 'http://storage.shopxx.net/demo-image/3.0/201301/a2ac0816-37e4-477a-b179-e64f71252cf5-thumbnail.jpg', '<img alt=\"\" src=\"http://storage.shopxx.net/demo-image/3.0/201301/9db71128-1c2c-408a-89bf-95ea7792ae96.jpg\" />', '', '', '', '', null, '165.600000', null, '0', '2013-01-01 14:29:11', '0', '2013-01-01 14:29:11', 'JackJones杰克琼斯男纯棉怀旧图案短袖T恤V212201016', '138', '138.000000', '0', '0', '0', null, null, null, '201304221', null, null, '0', null, '0', '2013-01-01 14:29:11', '0', '2013-01-01 14:29:11', null, '9', '25', '25');
INSERT INTO `product` VALUES ('125', '2013-01-01 14:29:11', '2013-01-01 15:21:28', '0', '圆领 ', '时尚休闲', null, null, null, null, null, null, null, null, null, null, '短袖', null, null, null, null, null, null, null, null, 'JackJones杰克琼斯男纯棉怀旧图案短袖T恤V212201016[XS]', '1', 'http://storage.shopxx.net/demo-image/3.0/201301/a2ac0816-37e4-477a-b179-e64f71252cf5-thumbnail.jpg', '<img alt=\"\" src=\"http://storage.shopxx.net/demo-image/3.0/201301/9db71128-1c2c-408a-89bf-95ea7792ae96.jpg\" />', '', '', '', '', null, '165.600000', null, '1', '2013-01-01 10:40:04', '0', '2013-01-01 14:29:11', 'JackJones杰克琼斯男纯棉怀旧图案短袖T恤V212201016', '138', '138.000000', '0', '5', '1', null, null, null, '201304222', null, null, '5', null, '1', '2013-01-01 10:40:04', '0', '2013-01-01 14:29:11', null, '9', '25', '25');
INSERT INTO `product` VALUES ('126', '2013-01-01 14:31:57', '2013-01-01 14:31:57', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'OSA女装雪纺衬衫 长袖韩版蕾丝休闲衬衣女C22432[橙色 XXL]', '0', 'http://storage.shopxx.net/demo-image/3.0/201301/1a53a089-fe86-4826-92a9-019c27463d90-thumbnail.jpg', '<img alt=\"\" src=\"http://storage.shopxx.net/demo-image/3.0/201301/71793c4e-cab8-4bca-a6bc-f87fb39f74e3.jpg\" />', '', '', '', '', null, '346.200000', null, '0', '2013-01-01 14:31:57', '0', '2013-01-01 14:31:57', 'OSA女装雪纺衬衫 长袖韩版蕾丝休闲衬衣女C22432', '288', '288.500000', '0', '0', '0', null, null, null, '201304223', null, null, '0', '件', '0', '2013-01-01 14:31:57', '0', '2013-01-01 14:31:57', null, null, '26', '17');
INSERT INTO `product` VALUES ('127', '2013-01-01 14:31:57', '2013-01-01 14:31:57', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'OSA女装雪纺衬衫 长袖韩版蕾丝休闲衬衣女C22432[橙色 L]', '0', 'http://storage.shopxx.net/demo-image/3.0/201301/1a53a089-fe86-4826-92a9-019c27463d90-thumbnail.jpg', '<img alt=\"\" src=\"http://storage.shopxx.net/demo-image/3.0/201301/71793c4e-cab8-4bca-a6bc-f87fb39f74e3.jpg\" />', '', '', '', '', null, '346.200000', null, '0', '2013-01-01 14:31:57', '0', '2013-01-01 14:31:57', 'OSA女装雪纺衬衫 长袖韩版蕾丝休闲衬衣女C22432', '288', '288.500000', '0', '0', '0', null, null, null, '201304224', null, null, '0', '件', '0', '2013-01-01 14:31:57', '0', '2013-01-01 14:31:57', null, null, '26', '17');
INSERT INTO `product` VALUES ('128', '2013-01-01 14:31:57', '2013-01-01 14:31:57', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'OSA女装雪纺衬衫 长袖韩版蕾丝休闲衬衣女C22432[橙色 S]', '0', 'http://storage.shopxx.net/demo-image/3.0/201301/1a53a089-fe86-4826-92a9-019c27463d90-thumbnail.jpg', '<img alt=\"\" src=\"http://storage.shopxx.net/demo-image/3.0/201301/71793c4e-cab8-4bca-a6bc-f87fb39f74e3.jpg\" />', '', '', '', '', null, '346.200000', null, '0', '2013-01-01 14:31:57', '0', '2013-01-01 14:31:57', 'OSA女装雪纺衬衫 长袖韩版蕾丝休闲衬衣女C22432', '288', '288.500000', '0', '0', '0', null, null, null, '201304225', null, null, '0', '件', '0', '2013-01-01 14:31:57', '0', '2013-01-01 14:31:57', null, null, '26', '17');
INSERT INTO `product` VALUES ('129', '2013-01-01 14:31:57', '2013-01-01 14:31:57', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'OSA女装雪纺衬衫 长袖韩版蕾丝休闲衬衣女C22432[黑色 L]', '0', 'http://storage.shopxx.net/demo-image/3.0/201301/1a53a089-fe86-4826-92a9-019c27463d90-thumbnail.jpg', '<img alt=\"\" src=\"http://storage.shopxx.net/demo-image/3.0/201301/71793c4e-cab8-4bca-a6bc-f87fb39f74e3.jpg\" />', '', '', '', '', null, '346.200000', null, '0', '2013-01-01 14:31:57', '0', '2013-01-01 14:31:57', 'OSA女装雪纺衬衫 长袖韩版蕾丝休闲衬衣女C22432', '288', '288.500000', '0', '0', '0', null, null, null, '201304226', null, null, '0', '件', '0', '2013-01-01 14:31:57', '0', '2013-01-01 14:31:57', null, null, '26', '17');
INSERT INTO `product` VALUES ('130', '2013-01-01 14:31:57', '2013-01-01 14:31:57', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'OSA女装雪纺衬衫 长袖韩版蕾丝休闲衬衣女C22432[黑色 M]', '0', 'http://storage.shopxx.net/demo-image/3.0/201301/1a53a089-fe86-4826-92a9-019c27463d90-thumbnail.jpg', '<img alt=\"\" src=\"http://storage.shopxx.net/demo-image/3.0/201301/71793c4e-cab8-4bca-a6bc-f87fb39f74e3.jpg\" />', '', '', '', '', null, '346.200000', null, '0', '2013-01-01 14:31:57', '0', '2013-01-01 14:31:57', 'OSA女装雪纺衬衫 长袖韩版蕾丝休闲衬衣女C22432', '288', '288.500000', '0', '0', '0', null, null, null, '201304227', null, null, '0', '件', '0', '2013-01-01 14:31:57', '0', '2013-01-01 14:31:57', null, null, '26', '17');
INSERT INTO `product` VALUES ('131', '2013-01-01 14:31:57', '2013-01-01 14:31:57', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'OSA女装雪纺衬衫 长袖韩版蕾丝休闲衬衣女C22432[黑色 XS]', '0', 'http://storage.shopxx.net/demo-image/3.0/201301/1a53a089-fe86-4826-92a9-019c27463d90-thumbnail.jpg', '<img alt=\"\" src=\"http://storage.shopxx.net/demo-image/3.0/201301/71793c4e-cab8-4bca-a6bc-f87fb39f74e3.jpg\" />', '', '', '', '', null, '346.200000', null, '0', '2013-01-01 14:31:57', '0', '2013-01-01 14:31:57', 'OSA女装雪纺衬衫 长袖韩版蕾丝休闲衬衣女C22432', '288', '288.500000', '0', '0', '0', null, null, null, '201304228', null, null, '0', '件', '0', '2013-01-01 14:31:57', '0', '2013-01-01 14:31:57', null, null, '26', '17');
INSERT INTO `product` VALUES ('132', '2013-01-01 14:31:57', '2013-01-01 14:31:57', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'OSA女装雪纺衬衫 长袖韩版蕾丝休闲衬衣女C22432[绿色 XL]', '0', 'http://storage.shopxx.net/demo-image/3.0/201301/1a53a089-fe86-4826-92a9-019c27463d90-thumbnail.jpg', '<img alt=\"\" src=\"http://storage.shopxx.net/demo-image/3.0/201301/71793c4e-cab8-4bca-a6bc-f87fb39f74e3.jpg\" />', '', '', '', '', null, '346.200000', null, '0', '2013-01-01 14:31:57', '0', '2013-01-01 14:31:57', 'OSA女装雪纺衬衫 长袖韩版蕾丝休闲衬衣女C22432', '288', '288.500000', '0', '0', '0', null, null, null, '201304229', null, null, '0', '件', '0', '2013-01-01 14:31:57', '0', '2013-01-01 14:31:57', null, null, '26', '17');
INSERT INTO `product` VALUES ('133', '2013-01-01 14:31:57', '2013-01-01 14:31:57', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'OSA女装雪纺衬衫 长袖韩版蕾丝休闲衬衣女C22432[绿色 M]', '0', 'http://storage.shopxx.net/demo-image/3.0/201301/1a53a089-fe86-4826-92a9-019c27463d90-thumbnail.jpg', '<img alt=\"\" src=\"http://storage.shopxx.net/demo-image/3.0/201301/71793c4e-cab8-4bca-a6bc-f87fb39f74e3.jpg\" />', '', '', '', '', null, '346.200000', null, '0', '2013-01-01 14:31:57', '0', '2013-01-01 14:31:57', 'OSA女装雪纺衬衫 长袖韩版蕾丝休闲衬衣女C22432', '288', '288.500000', '0', '0', '0', null, null, null, '201304230', null, null, '0', '件', '0', '2013-01-01 14:31:57', '0', '2013-01-01 14:31:57', null, null, '26', '17');
INSERT INTO `product` VALUES ('134', '2013-01-01 14:31:57', '2013-01-01 10:40:04', '0', '直筒型', '涤纶', null, null, null, null, null, null, null, null, null, null, '通勤', '短款', null, null, null, null, null, null, null, 'OSA女装雪纺衬衫 长袖韩版蕾丝休闲衬衣女C22432[绿色 S]', '1', 'http://storage.shopxx.net/demo-image/3.0/201301/1a53a089-fe86-4826-92a9-019c27463d90-thumbnail.jpg', '<img alt=\"\" src=\"http://storage.shopxx.net/demo-image/3.0/201301/71793c4e-cab8-4bca-a6bc-f87fb39f74e3.jpg\" />', '', '', '', '', null, '346.200000', null, '1', '2013-01-01 10:40:04', '0', '2013-01-01 14:31:57', 'OSA女装雪纺衬衫 长袖韩版蕾丝休闲衬衣女C22432', '288', '288.500000', '0', '0', '0', null, null, null, '201304231', null, null, '0', '件', '1', '2013-01-01 10:40:04', '0', '2013-01-01 14:31:57', null, null, '26', '17');
INSERT INTO `product` VALUES ('135', '2013-01-01 14:32:24', '2013-01-01 14:35:47', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'JackJones杰克琼斯男士纯棉格纹短袖衬衫C212204021[XXL]', '1', 'http://storage.shopxx.net/demo-image/3.0/201301/6f8ae4bf-cbd3-41c7-aa22-0fe81db6add4-thumbnail.jpg', '<img alt=\"\" src=\"http://storage.shopxx.net/demo-image/3.0/201301/7b1c70d7-a0ec-40da-86ed-500308832599.jpg\" />', '', '', '', '', null, '286.800000', null, '1', '2013-01-01 14:35:47', '0', '2013-01-01 14:32:24', 'JackJones杰克琼斯男士纯棉格纹短袖衬衫C212204021', '239', '239.000000', '0', '0', '0', null, null, null, '201304232', null, null, '0', null, '1', '2013-01-01 14:35:47', '0', '2013-01-01 14:32:24', null, '9', '27', '26');
INSERT INTO `product` VALUES ('136', '2013-01-01 14:32:24', '2013-01-01 14:32:24', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'JackJones杰克琼斯男士纯棉格纹短袖衬衫C212204021[XL]', '0', 'http://storage.shopxx.net/demo-image/3.0/201301/6f8ae4bf-cbd3-41c7-aa22-0fe81db6add4-thumbnail.jpg', '<img alt=\"\" src=\"http://storage.shopxx.net/demo-image/3.0/201301/7b1c70d7-a0ec-40da-86ed-500308832599.jpg\" />', '', '', '', '', null, '286.800000', null, '0', '2013-01-01 14:32:24', '0', '2013-01-01 14:32:24', 'JackJones杰克琼斯男士纯棉格纹短袖衬衫C212204021', '239', '239.000000', '0', '0', '0', null, null, null, '201304233', null, null, '0', null, '0', '2013-01-01 14:32:24', '0', '2013-01-01 14:32:24', null, '9', '27', '26');
INSERT INTO `product` VALUES ('137', '2013-01-01 14:32:24', '2013-01-01 15:25:15', '0', '短袖 ', '时尚休闲', null, null, null, null, null, null, null, null, null, null, '修身型 ', null, null, null, null, null, null, null, null, 'JackJones杰克琼斯男士纯棉格纹短袖衬衫C212204021[L]', '1', 'http://storage.shopxx.net/demo-image/3.0/201301/6f8ae4bf-cbd3-41c7-aa22-0fe81db6add4-thumbnail.jpg', '<img alt=\"\" src=\"http://storage.shopxx.net/demo-image/3.0/201301/7b1c70d7-a0ec-40da-86ed-500308832599.jpg\" />', '', '', '', '', null, '286.800000', null, '1', '2013-01-01 10:40:04', '0', '2013-01-01 14:32:24', 'JackJones杰克琼斯男士纯棉格纹短袖衬衫C212204021', '239', '239.000000', '0', '5', '1', null, null, null, '201304234', null, null, '5', null, '1', '2013-01-01 10:40:04', '0', '2013-01-01 14:32:24', null, '9', '27', '26');
INSERT INTO `product` VALUES ('138', '2013-01-01 14:35:49', '2013-01-01 14:35:49', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'JackJones杰克琼斯男胶印机械图案短袖T恤I212101034[黑色 XL]', '0', 'http://storage.shopxx.net/demo-image/3.0/201301/a197e9ea-0430-4846-9ac1-daaf4d1d6eb3-thumbnail.jpg', '<img alt=\"\" src=\"http://storage.shopxx.net/demo-image/3.0/201301/b4f89ff3-a58c-4923-85fa-2d5a31cb4fe4.jpg\" />\r\n<p>\r\n	&nbsp;\r\n</p>', '', '', '', '', null, '243.600000', null, '0', '2013-01-01 14:35:49', '0', '2013-01-01 14:35:49', 'JackJones杰克琼斯男胶印机械图案短袖T恤I212101034', '203', '203.000000', '0', '0', '0', null, null, null, '201304235', null, null, '0', null, '0', '2013-01-01 14:35:49', '0', '2013-01-01 14:35:49', null, '9', '28', '25');
INSERT INTO `product` VALUES ('139', '2013-01-01 14:35:49', '2013-01-01 14:35:49', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'JackJones杰克琼斯男胶印机械图案短袖T恤I212101034[黑色 L]', '0', 'http://storage.shopxx.net/demo-image/3.0/201301/a197e9ea-0430-4846-9ac1-daaf4d1d6eb3-thumbnail.jpg', '<img alt=\"\" src=\"http://storage.shopxx.net/demo-image/3.0/201301/b4f89ff3-a58c-4923-85fa-2d5a31cb4fe4.jpg\" />\r\n<p>\r\n	&nbsp;\r\n</p>', '', '', '', '', null, '243.600000', null, '0', '2013-01-01 14:35:49', '0', '2013-01-01 14:35:49', 'JackJones杰克琼斯男胶印机械图案短袖T恤I212101034', '203', '203.000000', '0', '0', '0', null, null, null, '201304236', null, null, '0', null, '0', '2013-01-01 14:35:49', '0', '2013-01-01 14:35:49', null, '9', '28', '25');
INSERT INTO `product` VALUES ('140', '2013-01-01 14:35:49', '2013-01-01 14:35:49', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'JackJones杰克琼斯男胶印机械图案短袖T恤I212101034[黑色 M]', '0', 'http://storage.shopxx.net/demo-image/3.0/201301/a197e9ea-0430-4846-9ac1-daaf4d1d6eb3-thumbnail.jpg', '<img alt=\"\" src=\"http://storage.shopxx.net/demo-image/3.0/201301/b4f89ff3-a58c-4923-85fa-2d5a31cb4fe4.jpg\" />\r\n<p>\r\n	&nbsp;\r\n</p>', '', '', '', '', null, '243.600000', null, '0', '2013-01-01 14:35:49', '0', '2013-01-01 14:35:49', 'JackJones杰克琼斯男胶印机械图案短袖T恤I212101034', '203', '203.000000', '0', '0', '0', null, null, null, '201304237', null, null, '0', null, '0', '2013-01-01 14:35:49', '0', '2013-01-01 14:35:49', null, '9', '28', '25');
INSERT INTO `product` VALUES ('141', '2013-01-01 14:35:49', '2013-01-01 14:35:49', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'JackJones杰克琼斯男胶印机械图案短袖T恤I212101034[黑色 S]', '0', 'http://storage.shopxx.net/demo-image/3.0/201301/a197e9ea-0430-4846-9ac1-daaf4d1d6eb3-thumbnail.jpg', '<img alt=\"\" src=\"http://storage.shopxx.net/demo-image/3.0/201301/b4f89ff3-a58c-4923-85fa-2d5a31cb4fe4.jpg\" />\r\n<p>\r\n	&nbsp;\r\n</p>', '', '', '', '', null, '243.600000', null, '0', '2013-01-01 14:35:49', '0', '2013-01-01 14:35:49', 'JackJones杰克琼斯男胶印机械图案短袖T恤I212101034', '203', '203.000000', '0', '0', '0', null, null, null, '201304238', null, null, '0', null, '0', '2013-01-01 14:35:49', '0', '2013-01-01 14:35:49', null, '9', '28', '25');
INSERT INTO `product` VALUES ('142', '2013-01-01 14:35:49', '2013-01-01 15:27:12', '0', '圆领 ', '时尚休闲', null, null, null, null, null, null, null, null, null, null, '短袖', null, null, null, null, null, null, null, null, 'JackJones杰克琼斯男胶印机械图案短袖T恤I212101034[黑色 XS]', '1', 'http://storage.shopxx.net/demo-image/3.0/201301/a197e9ea-0430-4846-9ac1-daaf4d1d6eb3-thumbnail.jpg', '<img alt=\"\" src=\"http://storage.shopxx.net/demo-image/3.0/201301/b4f89ff3-a58c-4923-85fa-2d5a31cb4fe4.jpg\" /> \r\n<p>\r\n	&nbsp;\r\n</p>', '', '', '', '', null, '243.600000', null, '1', '2013-01-01 10:40:04', '0', '2013-01-01 14:35:49', 'JackJones杰克琼斯男胶印机械图案短袖T恤I212101034', '203', '203.000000', '0', '5', '1', null, null, null, '201304239', null, null, '5', null, '1', '2013-01-01 10:40:04', '0', '2013-01-01 14:35:49', null, '9', '28', '25');
INSERT INTO `product` VALUES ('143', '2013-01-01 14:37:59', '2013-01-01 14:37:59', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'JackJones杰克琼斯男士纯棉人物图案短袖T恤V212101020[XXL]', '0', 'http://storage.shopxx.net/demo-image/3.0/201301/92c94d7d-653b-40b2-9540-8bcd86a6cc41-thumbnail.jpg', '<img alt=\"\" src=\"http://storage.shopxx.net/demo-image/3.0/201301/28a29a1f-07f0-4c54-bd78-89b73bb0640f.jpg\" />', '', '', '', '', null, '145.200000', null, '0', '2013-01-01 14:37:59', '0', '2013-01-01 14:37:59', 'JackJones杰克琼斯男士纯棉人物图案短袖T恤V212101020', '121', '121.000000', '0', '0', '0', null, null, null, '201304240', null, null, '0', null, '0', '2013-01-01 14:37:59', '0', '2013-01-01 14:37:59', null, '9', '29', '25');
INSERT INTO `product` VALUES ('144', '2013-01-01 14:37:59', '2013-01-01 14:37:59', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'JackJones杰克琼斯男士纯棉人物图案短袖T恤V212101020[XL]', '0', 'http://storage.shopxx.net/demo-image/3.0/201301/92c94d7d-653b-40b2-9540-8bcd86a6cc41-thumbnail.jpg', '<img alt=\"\" src=\"http://storage.shopxx.net/demo-image/3.0/201301/28a29a1f-07f0-4c54-bd78-89b73bb0640f.jpg\" />', '', '', '', '', null, '145.200000', null, '0', '2013-01-01 14:37:59', '0', '2013-01-01 14:37:59', 'JackJones杰克琼斯男士纯棉人物图案短袖T恤V212101020', '121', '121.000000', '0', '0', '0', null, null, null, '201304241', null, null, '0', null, '0', '2013-01-01 14:37:59', '0', '2013-01-01 14:37:59', null, '9', '29', '25');
INSERT INTO `product` VALUES ('145', '2013-01-01 14:37:59', '2013-01-01 14:37:59', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'JackJones杰克琼斯男士纯棉人物图案短袖T恤V212101020[L]', '0', 'http://storage.shopxx.net/demo-image/3.0/201301/92c94d7d-653b-40b2-9540-8bcd86a6cc41-thumbnail.jpg', '<img alt=\"\" src=\"http://storage.shopxx.net/demo-image/3.0/201301/28a29a1f-07f0-4c54-bd78-89b73bb0640f.jpg\" />', '', '', '', '', null, '145.200000', null, '0', '2013-01-01 14:37:59', '0', '2013-01-01 14:37:59', 'JackJones杰克琼斯男士纯棉人物图案短袖T恤V212101020', '121', '121.000000', '0', '0', '0', null, null, null, '201304242', null, null, '0', null, '0', '2013-01-01 14:37:59', '0', '2013-01-01 14:37:59', null, '9', '29', '25');
INSERT INTO `product` VALUES ('146', '2013-01-01 14:37:59', '2013-01-01 14:37:59', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'JackJones杰克琼斯男士纯棉人物图案短袖T恤V212101020[M]', '0', 'http://storage.shopxx.net/demo-image/3.0/201301/92c94d7d-653b-40b2-9540-8bcd86a6cc41-thumbnail.jpg', '<img alt=\"\" src=\"http://storage.shopxx.net/demo-image/3.0/201301/28a29a1f-07f0-4c54-bd78-89b73bb0640f.jpg\" />', '', '', '', '', null, '145.200000', null, '0', '2013-01-01 14:37:59', '0', '2013-01-01 14:37:59', 'JackJones杰克琼斯男士纯棉人物图案短袖T恤V212101020', '121', '121.000000', '0', '0', '0', null, null, null, '201304243', null, null, '0', null, '0', '2013-01-01 14:37:59', '0', '2013-01-01 14:37:59', null, '9', '29', '25');
INSERT INTO `product` VALUES ('147', '2013-01-01 14:37:59', '2013-01-01 14:37:59', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'JackJones杰克琼斯男士纯棉人物图案短袖T恤V212101020[S]', '0', 'http://storage.shopxx.net/demo-image/3.0/201301/92c94d7d-653b-40b2-9540-8bcd86a6cc41-thumbnail.jpg', '<img alt=\"\" src=\"http://storage.shopxx.net/demo-image/3.0/201301/28a29a1f-07f0-4c54-bd78-89b73bb0640f.jpg\" />', '', '', '', '', null, '145.200000', null, '0', '2013-01-01 14:37:59', '0', '2013-01-01 14:37:59', 'JackJones杰克琼斯男士纯棉人物图案短袖T恤V212101020', '121', '121.000000', '0', '0', '0', null, null, null, '201304244', null, null, '0', null, '0', '2013-01-01 14:37:59', '0', '2013-01-01 14:37:59', null, '9', '29', '25');
INSERT INTO `product` VALUES ('148', '2013-01-01 14:37:59', '2013-01-01 11:42:34', '0', '圆领 ', '时尚休闲', null, null, null, null, null, null, null, null, null, null, '短袖', null, null, null, null, null, null, null, null, 'JackJones杰克琼斯男士纯棉人物图案短袖T恤V212101020[XS]', '3', 'http://storage.shopxx.net/demo-image/3.0/201301/92c94d7d-653b-40b2-9540-8bcd86a6cc41-thumbnail.jpg', '<img alt=\"\" src=\"http://storage.shopxx.net/demo-image/3.0/201301/28a29a1f-07f0-4c54-bd78-89b73bb0640f.jpg\" />', '', '', '', '', null, '145.200000', null, '3', '2013-01-01 11:42:12', '0', '2013-01-01 14:37:59', 'JackJones杰克琼斯男士纯棉人物图案短袖T恤V212101020', '121', '121.000000', '0', '5', '1', null, null, null, '201304245', null, null, '5', null, '3', '2013-01-01 11:42:12', '0', '2013-01-01 14:37:59', null, '9', '29', '25');
INSERT INTO `product` VALUES ('149', '2013-01-01 14:41:05', '2013-01-01 20:55:29', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'JackJones杰克琼斯男士立领拉链机车夹克B212121038[黑色 XL]', '1', 'http://storage.shopxx.net/demo-image/3.0/201301/ca3043f5-dbb0-4a03-9bb6-8274f78b5d7e-thumbnail.jpg', '<img alt=\"\" src=\"http://storage.shopxx.net/demo-image/3.0/201301/b5f5ebde-31e2-446a-b273-bc9d1294ede6.jpg\" />', '', '', '', '', null, '390.000000', null, '1', '2013-01-01 20:55:29', '0', '2013-01-01 14:41:05', 'JackJones杰克琼斯男士立领拉链机车夹克B212121038', '325', '325.000000', '0', '0', '0', null, null, null, '201304246', null, null, '0', null, '1', '2013-01-01 20:55:29', '0', '2013-01-01 14:41:05', null, '9', '30', '29');
INSERT INTO `product` VALUES ('150', '2013-01-01 14:41:05', '2013-01-01 15:28:33', '0', '短款', '时尚休闲 ', null, null, null, null, null, null, null, null, null, null, '修身型', '其它 ', null, null, null, null, null, null, null, 'JackJones杰克琼斯男士立领拉链机车夹克B212121038[黑色 L]', '3', 'http://storage.shopxx.net/demo-image/3.0/201301/ca3043f5-dbb0-4a03-9bb6-8274f78b5d7e-thumbnail.jpg', '<img alt=\"\" src=\"http://storage.shopxx.net/demo-image/3.0/201301/b5f5ebde-31e2-446a-b273-bc9d1294ede6.jpg\" />', '', '', '', '', null, '390.000000', null, '3', '2013-01-01 10:40:04', '0', '2013-01-01 14:41:05', 'JackJones杰克琼斯男士立领拉链机车夹克B212121038', '325', '325.000000', '0', '5', '1', null, null, null, '201304247', null, null, '5', null, '3', '2013-01-01 10:40:04', '0', '2013-01-01 14:41:05', null, '9', '30', '29');
INSERT INTO `product` VALUES ('151', '2013-01-01 14:43:30', '2013-01-01 14:43:30', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '维依恋春装2013新款七分袖中长款风衣韩版修身双排扣外套春款大衣[黑色 XXL]', '0', 'http://storage.shopxx.net/demo-image/3.0/201301/94aa25f9-f3ef-4f7f-8c7c-197cd04b68ea-thumbnail.jpg', '<img alt=\"\" src=\"http://storage.shopxx.net/demo-image/3.0/201301/0a2ae9d9-a90f-46be-9de6-c72654cfd10b.jpg\" /> \r\n<p>\r\n	&nbsp;\r\n</p>', '', '', '', '', null, '336.000000', null, '0', '2013-01-01 14:43:29', '0', '2013-01-01 14:43:29', '维依恋春装2013新款七分袖中长款风衣韩版修身双排扣外套春款大衣', '280', '280.000000', '0', '0', '0', null, null, null, '201304248', null, null, '0', '件', '0', '2013-01-01 14:43:29', '0', '2013-01-01 14:43:29', null, null, '2', '18');
INSERT INTO `product` VALUES ('152', '2013-01-01 14:43:30', '2013-01-01 14:43:30', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '维依恋春装2013新款七分袖中长款风衣韩版修身双排扣外套春款大衣[黑色 L]', '0', 'http://storage.shopxx.net/demo-image/3.0/201301/94aa25f9-f3ef-4f7f-8c7c-197cd04b68ea-thumbnail.jpg', '<img alt=\"\" src=\"http://storage.shopxx.net/demo-image/3.0/201301/0a2ae9d9-a90f-46be-9de6-c72654cfd10b.jpg\" /> \r\n<p>\r\n	&nbsp;\r\n</p>', '', '', '', '', null, '336.000000', null, '0', '2013-01-01 14:43:29', '0', '2013-01-01 14:43:29', '维依恋春装2013新款七分袖中长款风衣韩版修身双排扣外套春款大衣', '280', '280.000000', '0', '0', '0', null, null, null, '201304249', null, null, '0', '件', '0', '2013-01-01 14:43:29', '0', '2013-01-01 14:43:29', null, null, '2', '18');
INSERT INTO `product` VALUES ('153', '2013-01-01 14:43:30', '2013-01-01 14:43:30', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '维依恋春装2013新款七分袖中长款风衣韩版修身双排扣外套春款大衣[黑色 M]', '0', 'http://storage.shopxx.net/demo-image/3.0/201301/94aa25f9-f3ef-4f7f-8c7c-197cd04b68ea-thumbnail.jpg', '<img alt=\"\" src=\"http://storage.shopxx.net/demo-image/3.0/201301/0a2ae9d9-a90f-46be-9de6-c72654cfd10b.jpg\" /> \r\n<p>\r\n	&nbsp;\r\n</p>', '', '', '', '', null, '336.000000', null, '0', '2013-01-01 14:43:29', '0', '2013-01-01 14:43:29', '维依恋春装2013新款七分袖中长款风衣韩版修身双排扣外套春款大衣', '280', '280.000000', '0', '0', '0', null, null, null, '201304250', null, null, '0', '件', '0', '2013-01-01 14:43:29', '0', '2013-01-01 14:43:29', null, null, '2', '18');
INSERT INTO `product` VALUES ('154', '2013-01-01 14:43:30', '2013-01-01 14:43:30', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '维依恋春装2013新款七分袖中长款风衣韩版修身双排扣外套春款大衣[灰色 XL]', '0', 'http://storage.shopxx.net/demo-image/3.0/201301/94aa25f9-f3ef-4f7f-8c7c-197cd04b68ea-thumbnail.jpg', '<img alt=\"\" src=\"http://storage.shopxx.net/demo-image/3.0/201301/0a2ae9d9-a90f-46be-9de6-c72654cfd10b.jpg\" /> \r\n<p>\r\n	&nbsp;\r\n</p>', '', '', '', '', null, '336.000000', null, '0', '2013-01-01 14:43:29', '0', '2013-01-01 14:43:29', '维依恋春装2013新款七分袖中长款风衣韩版修身双排扣外套春款大衣', '280', '280.000000', '0', '0', '0', null, null, null, '201304251', null, null, '0', '件', '0', '2013-01-01 14:43:29', '0', '2013-01-01 14:43:29', null, null, '2', '18');
INSERT INTO `product` VALUES ('155', '2013-01-01 14:43:30', '2013-01-01 10:50:07', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '维依恋春装2013新款七分袖中长款风衣韩版修身双排扣外套春款大衣[灰色 S]', '1', 'http://storage.shopxx.net/demo-image/3.0/201301/94aa25f9-f3ef-4f7f-8c7c-197cd04b68ea-thumbnail.jpg', '<img alt=\"\" src=\"http://storage.shopxx.net/demo-image/3.0/201301/0a2ae9d9-a90f-46be-9de6-c72654cfd10b.jpg\" /> \r\n<p>\r\n	&nbsp;\r\n</p>', '', '', '', '', null, '336.000000', null, '1', '2013-01-01 10:50:07', '0', '2013-01-01 14:43:29', '维依恋春装2013新款七分袖中长款风衣韩版修身双排扣外套春款大衣', '280', '280.000000', '0', '0', '0', null, null, null, '201304252', null, null, '0', '件', '1', '2013-01-01 10:50:07', '0', '2013-01-01 14:43:29', null, null, '2', '18');
INSERT INTO `product` VALUES ('156', '2013-01-01 14:43:30', '2013-01-01 14:43:30', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '维依恋春装2013新款七分袖中长款风衣韩版修身双排扣外套春款大衣[卡其色 M]', '0', 'http://storage.shopxx.net/demo-image/3.0/201301/94aa25f9-f3ef-4f7f-8c7c-197cd04b68ea-thumbnail.jpg', '<img alt=\"\" src=\"http://storage.shopxx.net/demo-image/3.0/201301/0a2ae9d9-a90f-46be-9de6-c72654cfd10b.jpg\" /> \r\n<p>\r\n	&nbsp;\r\n</p>', '', '', '', '', null, '336.000000', null, '0', '2013-01-01 14:43:29', '0', '2013-01-01 14:43:29', '维依恋春装2013新款七分袖中长款风衣韩版修身双排扣外套春款大衣', '280', '280.000000', '0', '0', '0', null, null, null, '201304253', null, null, '0', '件', '0', '2013-01-01 14:43:29', '0', '2013-01-01 14:43:29', null, null, '2', '18');
INSERT INTO `product` VALUES ('157', '2013-01-01 14:43:30', '2013-01-01 14:43:30', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '维依恋春装2013新款七分袖中长款风衣韩版修身双排扣外套春款大衣[卡其色 XS]', '0', 'http://storage.shopxx.net/demo-image/3.0/201301/94aa25f9-f3ef-4f7f-8c7c-197cd04b68ea-thumbnail.jpg', '<img alt=\"\" src=\"http://storage.shopxx.net/demo-image/3.0/201301/0a2ae9d9-a90f-46be-9de6-c72654cfd10b.jpg\" /> \r\n<p>\r\n	&nbsp;\r\n</p>', '', '', '', '', null, '336.000000', null, '0', '2013-01-01 14:43:29', '0', '2013-01-01 14:43:29', '维依恋春装2013新款七分袖中长款风衣韩版修身双排扣外套春款大衣', '280', '280.000000', '0', '0', '0', null, null, null, '201304254', null, null, '0', '件', '0', '2013-01-01 14:43:29', '0', '2013-01-01 14:43:29', null, null, '2', '18');
INSERT INTO `product` VALUES ('158', '2013-01-01 14:43:30', '2013-01-01 14:43:30', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '维依恋春装2013新款七分袖中长款风衣韩版修身双排扣外套春款大衣[橙色 L]', '0', 'http://storage.shopxx.net/demo-image/3.0/201301/94aa25f9-f3ef-4f7f-8c7c-197cd04b68ea-thumbnail.jpg', '<img alt=\"\" src=\"http://storage.shopxx.net/demo-image/3.0/201301/0a2ae9d9-a90f-46be-9de6-c72654cfd10b.jpg\" /> \r\n<p>\r\n	&nbsp;\r\n</p>', '', '', '', '', null, '336.000000', null, '0', '2013-01-01 14:43:29', '0', '2013-01-01 14:43:29', '维依恋春装2013新款七分袖中长款风衣韩版修身双排扣外套春款大衣', '280', '280.000000', '0', '0', '0', null, null, null, '201304255', null, null, '0', '件', '0', '2013-01-01 14:43:29', '0', '2013-01-01 14:43:29', null, null, '2', '18');
INSERT INTO `product` VALUES ('159', '2013-01-01 14:43:30', '2013-01-01 14:43:30', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '维依恋春装2013新款七分袖中长款风衣韩版修身双排扣外套春款大衣[橙色 M]', '0', 'http://storage.shopxx.net/demo-image/3.0/201301/94aa25f9-f3ef-4f7f-8c7c-197cd04b68ea-thumbnail.jpg', '<img alt=\"\" src=\"http://storage.shopxx.net/demo-image/3.0/201301/0a2ae9d9-a90f-46be-9de6-c72654cfd10b.jpg\" /> \r\n<p>\r\n	&nbsp;\r\n</p>', '', '', '', '', null, '336.000000', null, '0', '2013-01-01 14:43:29', '0', '2013-01-01 14:43:29', '维依恋春装2013新款七分袖中长款风衣韩版修身双排扣外套春款大衣', '280', '280.000000', '0', '0', '0', null, null, null, '201304256', null, null, '0', '件', '0', '2013-01-01 14:43:29', '0', '2013-01-01 14:43:29', null, null, '2', '18');
INSERT INTO `product` VALUES ('160', '2013-01-01 14:44:18', '2013-01-01 14:44:18', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'JackJones杰克琼斯男士立领拼接式夹克I212121041[黑色 XXXL]', '0', 'http://storage.shopxx.net/demo-image/3.0/201301/4107e1ce-5e7c-4941-bc0f-718f35ba14cd-thumbnail.jpg', '<img alt=\"\" src=\"http://storage.shopxx.net/demo-image/3.0/201301/4fc7fd6f-55ae-401d-aa8f-44ed7ae14e6b.jpg\" />', '', '', '', '', null, '322.800000', null, '0', '2013-01-01 14:44:18', '0', '2013-01-01 14:44:18', 'JackJones杰克琼斯男士立领拼接式夹克I212121041', '269', '269.000000', '0', '0', '0', null, null, null, '201304257', null, null, '0', null, '0', '2013-01-01 14:44:18', '0', '2013-01-01 14:44:18', null, '9', '31', '29');
INSERT INTO `product` VALUES ('161', '2013-01-01 14:44:18', '2013-01-01 14:44:18', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'JackJones杰克琼斯男士立领拼接式夹克I212121041[黑色 XXL]', '0', 'http://storage.shopxx.net/demo-image/3.0/201301/4107e1ce-5e7c-4941-bc0f-718f35ba14cd-thumbnail.jpg', '<img alt=\"\" src=\"http://storage.shopxx.net/demo-image/3.0/201301/4fc7fd6f-55ae-401d-aa8f-44ed7ae14e6b.jpg\" />', '', '', '', '', null, '322.800000', null, '0', '2013-01-01 14:44:18', '0', '2013-01-01 14:44:18', 'JackJones杰克琼斯男士立领拼接式夹克I212121041', '269', '269.000000', '0', '0', '0', null, null, null, '201304258', null, null, '0', null, '0', '2013-01-01 14:44:18', '0', '2013-01-01 14:44:18', null, '9', '31', '29');
INSERT INTO `product` VALUES ('162', '2013-01-01 14:44:18', '2013-01-01 14:44:18', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'JackJones杰克琼斯男士立领拼接式夹克I212121041[黑色 XL]', '0', 'http://storage.shopxx.net/demo-image/3.0/201301/4107e1ce-5e7c-4941-bc0f-718f35ba14cd-thumbnail.jpg', '<img alt=\"\" src=\"http://storage.shopxx.net/demo-image/3.0/201301/4fc7fd6f-55ae-401d-aa8f-44ed7ae14e6b.jpg\" />', '', '', '', '', null, '322.800000', null, '0', '2013-01-01 14:44:18', '0', '2013-01-01 14:44:18', 'JackJones杰克琼斯男士立领拼接式夹克I212121041', '269', '269.000000', '0', '0', '0', null, null, null, '201304259', null, null, '0', null, '0', '2013-01-01 14:44:18', '0', '2013-01-01 14:44:18', null, '9', '31', '29');
INSERT INTO `product` VALUES ('163', '2013-01-01 14:44:18', '2013-01-01 14:44:18', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'JackJones杰克琼斯男士立领拼接式夹克I212121041[黑色 L]', '0', 'http://storage.shopxx.net/demo-image/3.0/201301/4107e1ce-5e7c-4941-bc0f-718f35ba14cd-thumbnail.jpg', '<img alt=\"\" src=\"http://storage.shopxx.net/demo-image/3.0/201301/4fc7fd6f-55ae-401d-aa8f-44ed7ae14e6b.jpg\" />', '', '', '', '', null, '322.800000', null, '0', '2013-01-01 14:44:18', '0', '2013-01-01 14:44:18', 'JackJones杰克琼斯男士立领拼接式夹克I212121041', '269', '269.000000', '0', '0', '0', null, null, null, '201304260', null, null, '0', null, '0', '2013-01-01 14:44:18', '0', '2013-01-01 14:44:18', null, '9', '31', '29');
INSERT INTO `product` VALUES ('164', '2013-01-01 14:44:18', '2013-01-01 14:44:18', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'JackJones杰克琼斯男士立领拼接式夹克I212121041[黑色 M]', '0', 'http://storage.shopxx.net/demo-image/3.0/201301/4107e1ce-5e7c-4941-bc0f-718f35ba14cd-thumbnail.jpg', '<img alt=\"\" src=\"http://storage.shopxx.net/demo-image/3.0/201301/4fc7fd6f-55ae-401d-aa8f-44ed7ae14e6b.jpg\" />', '', '', '', '', null, '322.800000', null, '0', '2013-01-01 14:44:18', '0', '2013-01-01 14:44:18', 'JackJones杰克琼斯男士立领拼接式夹克I212121041', '269', '269.000000', '0', '0', '0', null, null, null, '201304261', null, null, '0', null, '0', '2013-01-01 14:44:18', '0', '2013-01-01 14:44:18', null, '9', '31', '29');
INSERT INTO `product` VALUES ('165', '2013-01-01 14:44:18', '2013-01-01 14:44:18', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'JackJones杰克琼斯男士立领拼接式夹克I212121041[黑色 S]', '0', 'http://storage.shopxx.net/demo-image/3.0/201301/4107e1ce-5e7c-4941-bc0f-718f35ba14cd-thumbnail.jpg', '<img alt=\"\" src=\"http://storage.shopxx.net/demo-image/3.0/201301/4fc7fd6f-55ae-401d-aa8f-44ed7ae14e6b.jpg\" />', '', '', '', '', null, '322.800000', null, '0', '2013-01-01 14:44:18', '0', '2013-01-01 14:44:18', 'JackJones杰克琼斯男士立领拼接式夹克I212121041', '269', '269.000000', '0', '0', '0', null, null, null, '201304262', null, null, '0', null, '0', '2013-01-01 14:44:18', '0', '2013-01-01 14:44:18', null, '9', '31', '29');
INSERT INTO `product` VALUES ('166', '2013-01-01 14:44:18', '2013-01-01 10:40:04', '0', '短款', '时尚休闲 ', null, null, null, null, null, null, null, null, null, null, '修身型', '其它 ', null, null, null, null, null, null, null, 'JackJones杰克琼斯男士立领拼接式夹克I212121041[黑色 XS]', '2', 'http://storage.shopxx.net/demo-image/3.0/201301/4107e1ce-5e7c-4941-bc0f-718f35ba14cd-thumbnail.jpg', '<img alt=\"\" src=\"http://storage.shopxx.net/demo-image/3.0/201301/4fc7fd6f-55ae-401d-aa8f-44ed7ae14e6b.jpg\" />', '', '', '', '', null, '322.800000', null, '2', '2013-01-01 10:40:04', '0', '2013-01-01 14:44:18', 'JackJones杰克琼斯男士立领拼接式夹克I212121041', '269', '269.000000', '0', '0', '0', null, null, null, '201304263', null, null, '0', null, '2', '2013-01-01 10:40:04', '0', '2013-01-01 14:44:18', null, '9', '31', '29');
INSERT INTO `product` VALUES ('167', '2013-01-01 14:48:30', '2013-01-01 14:48:30', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '圣得西 正品男装 浅蓝色细格休闲长袖衬衫 经典版[紫色 XL]', '0', 'http://storage.shopxx.net/demo-image/3.0/201301/b04a22f5-267d-4e33-ac58-dda941eeaf84-thumbnail.jpg', '<img alt=\"\" src=\"http://storage.shopxx.net/demo-image/3.0/201301/d5694508-2732-4704-b087-e124a25814f4.jpg\" />', '', '', '', '', null, '150.000000', null, '0', '2013-01-01 14:48:30', '0', '2013-01-01 14:48:30', '圣得西 正品男装 浅蓝色细格休闲长袖衬衫 经典版', '125', '125.000000', '0', '0', '0', null, null, null, '201304264', null, null, '0', null, '0', '2013-01-01 14:48:30', '0', '2013-01-01 14:48:30', null, '12', '32', '26');
INSERT INTO `product` VALUES ('168', '2013-01-01 14:48:30', '2013-01-01 14:48:30', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '圣得西 正品男装 浅蓝色细格休闲长袖衬衫 经典版[紫色 L]', '0', 'http://storage.shopxx.net/demo-image/3.0/201301/b04a22f5-267d-4e33-ac58-dda941eeaf84-thumbnail.jpg', '<img alt=\"\" src=\"http://storage.shopxx.net/demo-image/3.0/201301/d5694508-2732-4704-b087-e124a25814f4.jpg\" />', '', '', '', '', null, '150.000000', null, '0', '2013-01-01 14:48:30', '0', '2013-01-01 14:48:30', '圣得西 正品男装 浅蓝色细格休闲长袖衬衫 经典版', '125', '125.000000', '0', '0', '0', null, null, null, '201304265', null, null, '0', null, '0', '2013-01-01 14:48:30', '0', '2013-01-01 14:48:30', null, '12', '32', '26');
INSERT INTO `product` VALUES ('169', '2013-01-01 14:48:30', '2013-01-01 14:48:30', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '圣得西 正品男装 浅蓝色细格休闲长袖衬衫 经典版[紫色 M]', '0', 'http://storage.shopxx.net/demo-image/3.0/201301/b04a22f5-267d-4e33-ac58-dda941eeaf84-thumbnail.jpg', '<img alt=\"\" src=\"http://storage.shopxx.net/demo-image/3.0/201301/d5694508-2732-4704-b087-e124a25814f4.jpg\" />', '', '', '', '', null, '150.000000', null, '0', '2013-01-01 14:48:30', '0', '2013-01-01 14:48:30', '圣得西 正品男装 浅蓝色细格休闲长袖衬衫 经典版', '125', '125.000000', '0', '0', '0', null, null, null, '201304266', null, null, '0', null, '0', '2013-01-01 14:48:30', '0', '2013-01-01 14:48:30', null, '12', '32', '26');
INSERT INTO `product` VALUES ('170', '2013-01-01 14:48:30', '2013-01-01 14:48:30', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '圣得西 正品男装 浅蓝色细格休闲长袖衬衫 经典版[紫色 S]', '0', 'http://storage.shopxx.net/demo-image/3.0/201301/b04a22f5-267d-4e33-ac58-dda941eeaf84-thumbnail.jpg', '<img alt=\"\" src=\"http://storage.shopxx.net/demo-image/3.0/201301/d5694508-2732-4704-b087-e124a25814f4.jpg\" />', '', '', '', '', null, '150.000000', null, '0', '2013-01-01 14:48:30', '0', '2013-01-01 14:48:30', '圣得西 正品男装 浅蓝色细格休闲长袖衬衫 经典版', '125', '125.000000', '0', '0', '0', null, null, null, '201304267', null, null, '0', null, '0', '2013-01-01 14:48:30', '0', '2013-01-01 14:48:30', null, '12', '32', '26');
INSERT INTO `product` VALUES ('171', '2013-01-01 14:48:30', '2013-01-01 14:48:30', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '圣得西 正品男装 浅蓝色细格休闲长袖衬衫 经典版[浅蓝色 XL]', '0', 'http://storage.shopxx.net/demo-image/3.0/201301/b04a22f5-267d-4e33-ac58-dda941eeaf84-thumbnail.jpg', '<img alt=\"\" src=\"http://storage.shopxx.net/demo-image/3.0/201301/d5694508-2732-4704-b087-e124a25814f4.jpg\" />', '', '', '', '', null, '150.000000', null, '0', '2013-01-01 14:48:30', '0', '2013-01-01 14:48:30', '圣得西 正品男装 浅蓝色细格休闲长袖衬衫 经典版', '125', '125.000000', '0', '0', '0', null, null, null, '201304268', null, null, '0', null, '0', '2013-01-01 14:48:30', '0', '2013-01-01 14:48:30', null, '12', '32', '26');
INSERT INTO `product` VALUES ('172', '2013-01-01 14:48:30', '2013-01-01 14:48:30', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '圣得西 正品男装 浅蓝色细格休闲长袖衬衫 经典版[浅蓝色 L]', '0', 'http://storage.shopxx.net/demo-image/3.0/201301/b04a22f5-267d-4e33-ac58-dda941eeaf84-thumbnail.jpg', '<img alt=\"\" src=\"http://storage.shopxx.net/demo-image/3.0/201301/d5694508-2732-4704-b087-e124a25814f4.jpg\" />', '', '', '', '', null, '150.000000', null, '0', '2013-01-01 14:48:30', '0', '2013-01-01 14:48:30', '圣得西 正品男装 浅蓝色细格休闲长袖衬衫 经典版', '125', '125.000000', '0', '0', '0', null, null, null, '201304269', null, null, '0', null, '0', '2013-01-01 14:48:30', '0', '2013-01-01 14:48:30', null, '12', '32', '26');
INSERT INTO `product` VALUES ('173', '2013-01-01 14:48:30', '2013-01-01 14:48:30', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '圣得西 正品男装 浅蓝色细格休闲长袖衬衫 经典版[浅蓝色 M]', '0', 'http://storage.shopxx.net/demo-image/3.0/201301/b04a22f5-267d-4e33-ac58-dda941eeaf84-thumbnail.jpg', '<img alt=\"\" src=\"http://storage.shopxx.net/demo-image/3.0/201301/d5694508-2732-4704-b087-e124a25814f4.jpg\" />', '', '', '', '', null, '150.000000', null, '0', '2013-01-01 14:48:30', '0', '2013-01-01 14:48:30', '圣得西 正品男装 浅蓝色细格休闲长袖衬衫 经典版', '125', '125.000000', '0', '0', '0', null, null, null, '201304270', null, null, '0', null, '0', '2013-01-01 14:48:30', '0', '2013-01-01 14:48:30', null, '12', '32', '26');
INSERT INTO `product` VALUES ('174', '2013-01-01 14:48:30', '2013-01-01 10:40:04', '0', '长袖', '商务休闲', null, null, null, null, null, null, null, null, null, null, '宽松型', null, null, null, null, null, null, null, null, '圣得西 正品男装 浅蓝色细格休闲长袖衬衫 经典版[浅蓝色 S]', '2', 'http://storage.shopxx.net/demo-image/3.0/201301/b04a22f5-267d-4e33-ac58-dda941eeaf84-thumbnail.jpg', '<img alt=\"\" src=\"http://storage.shopxx.net/demo-image/3.0/201301/d5694508-2732-4704-b087-e124a25814f4.jpg\" />', '', '', '', '', null, '150.000000', null, '2', '2013-01-01 10:40:04', '0', '2013-01-01 14:48:30', '圣得西 正品男装 浅蓝色细格休闲长袖衬衫 经典版', '125', '125.000000', '0', '0', '0', null, null, null, '201304271', null, null, '0', null, '2', '2013-01-01 10:40:04', '0', '2013-01-01 14:48:30', null, '12', '32', '26');
INSERT INTO `product` VALUES ('175', '2013-01-01 14:48:52', '2013-01-01 21:11:37', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '尚都比拉2013春夏装新款女装 春款淑女两件套 蕾丝雪纺短袖连衣裙[混色 XL]', '2', 'http://storage.shopxx.net/demo-image/3.0/201301/3dc28bfe-b4a7-4346-89a1-86b87d229faa-thumbnail.jpg', '<img alt=\"\" src=\"http://storage.shopxx.net/demo-image/3.0/201301/f129cfc9-a544-46df-ba6d-5f8089940690.jpg\" /> \r\n<p>\r\n	&nbsp;\r\n</p>', '', '', '', '', null, '465.600000', null, '2', '2013-01-01 21:11:37', '0', '2013-01-01 14:48:52', '尚都比拉2013春夏装新款女装 春款淑女两件套 蕾丝雪纺短袖连衣裙', '388', '388.000000', '0', '0', '0', null, null, null, '201304272', null, null, '0', '件', '2', '2013-01-01 21:11:37', '0', '2013-01-01 14:48:52', null, '3', '1', '11');
INSERT INTO `product` VALUES ('176', '2013-01-01 14:48:52', '2013-01-01 21:11:37', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '尚都比拉2013春夏装新款女装 春款淑女两件套 蕾丝雪纺短袖连衣裙[混色 L]', '1', 'http://storage.shopxx.net/demo-image/3.0/201301/3dc28bfe-b4a7-4346-89a1-86b87d229faa-thumbnail.jpg', '<img alt=\"\" src=\"http://storage.shopxx.net/demo-image/3.0/201301/f129cfc9-a544-46df-ba6d-5f8089940690.jpg\" /> \r\n<p>\r\n	&nbsp;\r\n</p>', '', '', '', '', null, '465.600000', null, '1', '2013-01-01 21:11:37', '0', '2013-01-01 14:48:52', '尚都比拉2013春夏装新款女装 春款淑女两件套 蕾丝雪纺短袖连衣裙', '388', '388.000000', '0', '0', '0', null, null, null, '201304273', null, null, '0', '件', '1', '2013-01-01 21:11:37', '0', '2013-01-01 14:48:52', null, '3', '1', '11');
INSERT INTO `product` VALUES ('177', '2013-01-01 14:48:52', '2013-01-01 21:11:37', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '尚都比拉2013春夏装新款女装 春款淑女两件套 蕾丝雪纺短袖连衣裙[混色 M]', '1', 'http://storage.shopxx.net/demo-image/3.0/201301/3dc28bfe-b4a7-4346-89a1-86b87d229faa-thumbnail.jpg', '<img alt=\"\" src=\"http://storage.shopxx.net/demo-image/3.0/201301/f129cfc9-a544-46df-ba6d-5f8089940690.jpg\" /> \r\n<p>\r\n	&nbsp;\r\n</p>', '', '', '', '', null, '465.600000', null, '1', '2013-01-01 21:11:37', '0', '2013-01-01 14:48:52', '尚都比拉2013春夏装新款女装 春款淑女两件套 蕾丝雪纺短袖连衣裙', '388', '388.000000', '0', '0', '0', null, null, null, '201304274', null, null, '0', '件', '1', '2013-01-01 21:11:37', '0', '2013-01-01 14:48:52', null, '3', '1', '11');
INSERT INTO `product` VALUES ('178', '2013-01-01 14:51:48', '2013-01-01 20:55:29', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '圣得西 正品男装 经典版白蓝粉色 商务长袖正装衬衫[粉红色 XXXL]', '1', 'http://storage.shopxx.net/demo-image/3.0/201301/c5b1b396-181a-4805-9e68-9b400d71f91e-thumbnail.jpg', '<img alt=\"\" src=\"http://storage.shopxx.net/demo-image/3.0/201301/b8a0b8e6-eb16-4a6a-a0c5-558484abfb50.jpg\" />', '', '', '', '', null, '1906.800000', null, '1', '2013-01-01 20:55:29', '0', '2013-01-01 14:51:47', '圣得西 正品男装 经典版白蓝粉色 商务长袖正装衬衫', '1589', '1589.000000', '0', '0', '0', null, null, null, '201304275', null, null, '0', null, '1', '2013-01-01 20:55:29', '0', '2013-01-01 14:51:47', null, '12', '33', '26');
INSERT INTO `product` VALUES ('179', '2013-01-01 14:51:48', '2013-01-01 20:55:29', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '圣得西 正品男装 经典版白蓝粉色 商务长袖正装衬衫[粉红色 XXL]', '1', 'http://storage.shopxx.net/demo-image/3.0/201301/c5b1b396-181a-4805-9e68-9b400d71f91e-thumbnail.jpg', '<img alt=\"\" src=\"http://storage.shopxx.net/demo-image/3.0/201301/b8a0b8e6-eb16-4a6a-a0c5-558484abfb50.jpg\" />', '', '', '', '', null, '1906.800000', null, '1', '2013-01-01 20:55:29', '0', '2013-01-01 14:51:47', '圣得西 正品男装 经典版白蓝粉色 商务长袖正装衬衫', '1589', '1589.000000', '0', '0', '0', null, null, null, '201304276', null, null, '0', null, '1', '2013-01-01 20:55:29', '0', '2013-01-01 14:51:47', null, '12', '33', '26');
INSERT INTO `product` VALUES ('180', '2013-01-01 14:51:48', '2013-01-01 14:51:48', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '圣得西 正品男装 经典版白蓝粉色 商务长袖正装衬衫[粉红色 XL]', '0', 'http://storage.shopxx.net/demo-image/3.0/201301/c5b1b396-181a-4805-9e68-9b400d71f91e-thumbnail.jpg', '<img alt=\"\" src=\"http://storage.shopxx.net/demo-image/3.0/201301/b8a0b8e6-eb16-4a6a-a0c5-558484abfb50.jpg\" />', '', '', '', '', null, '1906.800000', null, '0', '2013-01-01 14:51:47', '0', '2013-01-01 14:51:47', '圣得西 正品男装 经典版白蓝粉色 商务长袖正装衬衫', '1589', '1589.000000', '0', '0', '0', null, null, null, '201304277', null, null, '0', null, '0', '2013-01-01 14:51:47', '0', '2013-01-01 14:51:47', null, '12', '33', '26');
INSERT INTO `product` VALUES ('181', '2013-01-01 14:51:48', '2013-01-01 14:51:48', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '圣得西 正品男装 经典版白蓝粉色 商务长袖正装衬衫[粉红色 L]', '0', 'http://storage.shopxx.net/demo-image/3.0/201301/c5b1b396-181a-4805-9e68-9b400d71f91e-thumbnail.jpg', '<img alt=\"\" src=\"http://storage.shopxx.net/demo-image/3.0/201301/b8a0b8e6-eb16-4a6a-a0c5-558484abfb50.jpg\" />', '', '', '', '', null, '1906.800000', null, '0', '2013-01-01 14:51:47', '0', '2013-01-01 14:51:47', '圣得西 正品男装 经典版白蓝粉色 商务长袖正装衬衫', '1589', '1589.000000', '0', '0', '0', null, null, null, '201304278', null, null, '0', null, '0', '2013-01-01 14:51:47', '0', '2013-01-01 14:51:47', null, '12', '33', '26');
INSERT INTO `product` VALUES ('182', '2013-01-01 14:51:48', '2013-01-01 14:51:48', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '圣得西 正品男装 经典版白蓝粉色 商务长袖正装衬衫[粉红色 M]', '0', 'http://storage.shopxx.net/demo-image/3.0/201301/c5b1b396-181a-4805-9e68-9b400d71f91e-thumbnail.jpg', '<img alt=\"\" src=\"http://storage.shopxx.net/demo-image/3.0/201301/b8a0b8e6-eb16-4a6a-a0c5-558484abfb50.jpg\" />', '', '', '', '', null, '1906.800000', null, '0', '2013-01-01 14:51:47', '0', '2013-01-01 14:51:47', '圣得西 正品男装 经典版白蓝粉色 商务长袖正装衬衫', '1589', '1589.000000', '0', '0', '0', null, null, null, '201304279', null, null, '0', null, '0', '2013-01-01 14:51:47', '0', '2013-01-01 14:51:47', null, '12', '33', '26');
INSERT INTO `product` VALUES ('183', '2013-01-01 14:51:48', '2013-01-01 14:51:48', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '圣得西 正品男装 经典版白蓝粉色 商务长袖正装衬衫[粉红色 S]', '0', 'http://storage.shopxx.net/demo-image/3.0/201301/c5b1b396-181a-4805-9e68-9b400d71f91e-thumbnail.jpg', '<img alt=\"\" src=\"http://storage.shopxx.net/demo-image/3.0/201301/b8a0b8e6-eb16-4a6a-a0c5-558484abfb50.jpg\" />', '', '', '', '', null, '1906.800000', null, '0', '2013-01-01 14:51:47', '0', '2013-01-01 14:51:47', '圣得西 正品男装 经典版白蓝粉色 商务长袖正装衬衫', '1589', '1589.000000', '0', '0', '0', null, null, null, '201304280', null, null, '0', null, '0', '2013-01-01 14:51:47', '0', '2013-01-01 14:51:47', null, '12', '33', '26');
INSERT INTO `product` VALUES ('184', '2013-01-01 14:51:48', '2013-01-01 14:51:48', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '圣得西 正品男装 经典版白蓝粉色 商务长袖正装衬衫[白色 XXXL]', '0', 'http://storage.shopxx.net/demo-image/3.0/201301/c5b1b396-181a-4805-9e68-9b400d71f91e-thumbnail.jpg', '<img alt=\"\" src=\"http://storage.shopxx.net/demo-image/3.0/201301/b8a0b8e6-eb16-4a6a-a0c5-558484abfb50.jpg\" />', '', '', '', '', null, '1906.800000', null, '0', '2013-01-01 14:51:47', '0', '2013-01-01 14:51:47', '圣得西 正品男装 经典版白蓝粉色 商务长袖正装衬衫', '1589', '1589.000000', '0', '0', '0', null, null, null, '201304281', null, null, '0', null, '0', '2013-01-01 14:51:47', '0', '2013-01-01 14:51:47', null, '12', '33', '26');
INSERT INTO `product` VALUES ('185', '2013-01-01 14:51:48', '2013-01-01 14:51:48', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '圣得西 正品男装 经典版白蓝粉色 商务长袖正装衬衫[白色 XXL]', '0', 'http://storage.shopxx.net/demo-image/3.0/201301/c5b1b396-181a-4805-9e68-9b400d71f91e-thumbnail.jpg', '<img alt=\"\" src=\"http://storage.shopxx.net/demo-image/3.0/201301/b8a0b8e6-eb16-4a6a-a0c5-558484abfb50.jpg\" />', '', '', '', '', null, '1906.800000', null, '0', '2013-01-01 14:51:47', '0', '2013-01-01 14:51:47', '圣得西 正品男装 经典版白蓝粉色 商务长袖正装衬衫', '1589', '1589.000000', '0', '0', '0', null, null, null, '201304282', null, null, '0', null, '0', '2013-01-01 14:51:47', '0', '2013-01-01 14:51:47', null, '12', '33', '26');
INSERT INTO `product` VALUES ('186', '2013-01-01 14:51:48', '2013-01-01 14:51:48', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '圣得西 正品男装 经典版白蓝粉色 商务长袖正装衬衫[白色 XL]', '0', 'http://storage.shopxx.net/demo-image/3.0/201301/c5b1b396-181a-4805-9e68-9b400d71f91e-thumbnail.jpg', '<img alt=\"\" src=\"http://storage.shopxx.net/demo-image/3.0/201301/b8a0b8e6-eb16-4a6a-a0c5-558484abfb50.jpg\" />', '', '', '', '', null, '1906.800000', null, '0', '2013-01-01 14:51:47', '0', '2013-01-01 14:51:47', '圣得西 正品男装 经典版白蓝粉色 商务长袖正装衬衫', '1589', '1589.000000', '0', '0', '0', null, null, null, '201304283', null, null, '0', null, '0', '2013-01-01 14:51:47', '0', '2013-01-01 14:51:47', null, '12', '33', '26');
INSERT INTO `product` VALUES ('187', '2013-01-01 14:51:48', '2013-01-01 14:51:48', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '圣得西 正品男装 经典版白蓝粉色 商务长袖正装衬衫[白色 L]', '0', 'http://storage.shopxx.net/demo-image/3.0/201301/c5b1b396-181a-4805-9e68-9b400d71f91e-thumbnail.jpg', '<img alt=\"\" src=\"http://storage.shopxx.net/demo-image/3.0/201301/b8a0b8e6-eb16-4a6a-a0c5-558484abfb50.jpg\" />', '', '', '', '', null, '1906.800000', null, '0', '2013-01-01 14:51:47', '0', '2013-01-01 14:51:47', '圣得西 正品男装 经典版白蓝粉色 商务长袖正装衬衫', '1589', '1589.000000', '0', '0', '0', null, null, null, '201304284', null, null, '0', null, '0', '2013-01-01 14:51:47', '0', '2013-01-01 14:51:47', null, '12', '33', '26');
INSERT INTO `product` VALUES ('188', '2013-01-01 14:51:48', '2013-01-01 14:51:48', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '圣得西 正品男装 经典版白蓝粉色 商务长袖正装衬衫[白色 M]', '0', 'http://storage.shopxx.net/demo-image/3.0/201301/c5b1b396-181a-4805-9e68-9b400d71f91e-thumbnail.jpg', '<img alt=\"\" src=\"http://storage.shopxx.net/demo-image/3.0/201301/b8a0b8e6-eb16-4a6a-a0c5-558484abfb50.jpg\" />', '', '', '', '', null, '1906.800000', null, '0', '2013-01-01 14:51:47', '0', '2013-01-01 14:51:47', '圣得西 正品男装 经典版白蓝粉色 商务长袖正装衬衫', '1589', '1589.000000', '0', '0', '0', null, null, null, '201304285', null, null, '0', null, '0', '2013-01-01 14:51:47', '0', '2013-01-01 14:51:47', null, '12', '33', '26');
INSERT INTO `product` VALUES ('189', '2013-01-01 14:51:48', '2013-01-01 09:06:21', '0', '长袖', '商务休闲', null, null, null, null, null, null, null, null, null, null, '宽松型', null, null, null, null, null, null, null, null, '圣得西 正品男装 经典版白蓝粉色 商务长袖正装衬衫[白色 S]', '3', 'http://storage.shopxx.net/demo-image/3.0/201301/c5b1b396-181a-4805-9e68-9b400d71f91e-thumbnail.jpg', '<img alt=\"\" src=\"http://storage.shopxx.net/demo-image/3.0/201301/b8a0b8e6-eb16-4a6a-a0c5-558484abfb50.jpg\" />', '', '', '', '', null, '1906.800000', null, '1', '2013-01-01 09:06:21', '0', '2013-01-01 14:51:47', '圣得西 正品男装 经典版白蓝粉色 商务长袖正装衬衫', '1589', '1589.000000', '0', '5', '1', null, null, null, '201304286', null, null, '5', null, '1', '2013-01-01 09:06:21', '0', '2013-01-01 14:51:47', null, '12', '33', '26');
INSERT INTO `product` VALUES ('190', '2013-01-01 14:59:08', '2013-01-01 14:59:08', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '伊芙丽 2013春装新款 女装OL通勤修身长袖小外套女小西装1211120[黑色 XL]', '0', 'http://storage.shopxx.net/demo-image/3.0/201301/69439b45-8626-451c-a31a-08f9df5d702b-thumbnail.jpg', '<img alt=\"\" src=\"http://storage.shopxx.net/demo-image/3.0/201301/04b58a76-a591-4b39-9322-c03f703cd440.jpg\" />', '', '', '', '', null, '681.600000', null, '0', '2013-01-01 14:59:08', '0', '2013-01-01 14:59:08', '伊芙丽 2013春装新款 女装OL通勤修身长袖小外套女小西装1211120', '568', '568.000000', '0', '0', '0', null, null, null, '201304287', null, null, '0', '件', '0', '2013-01-01 14:59:08', '0', '2013-01-01 14:59:08', null, '2', '34', '14');
INSERT INTO `product` VALUES ('191', '2013-01-01 14:59:08', '2013-01-01 14:59:08', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '伊芙丽 2013春装新款 女装OL通勤修身长袖小外套女小西装1211120[黑色 L]', '0', 'http://storage.shopxx.net/demo-image/3.0/201301/69439b45-8626-451c-a31a-08f9df5d702b-thumbnail.jpg', '<img alt=\"\" src=\"http://storage.shopxx.net/demo-image/3.0/201301/04b58a76-a591-4b39-9322-c03f703cd440.jpg\" />', '', '', '', '', null, '681.600000', null, '0', '2013-01-01 14:59:08', '0', '2013-01-01 14:59:08', '伊芙丽 2013春装新款 女装OL通勤修身长袖小外套女小西装1211120', '568', '568.000000', '0', '0', '0', null, null, null, '201304288', null, null, '0', '件', '0', '2013-01-01 14:59:08', '0', '2013-01-01 14:59:08', null, '2', '34', '14');
INSERT INTO `product` VALUES ('192', '2013-01-01 14:59:08', '2013-01-01 13:33:31', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '伊芙丽 2013春装新款 女装OL通勤修身长袖小外套女小西装1211120[黑色 S]', '1', 'http://storage.shopxx.net/demo-image/3.0/201301/69439b45-8626-451c-a31a-08f9df5d702b-thumbnail.jpg', '<img alt=\"\" src=\"http://storage.shopxx.net/demo-image/3.0/201301/04b58a76-a591-4b39-9322-c03f703cd440.jpg\" />', '', '', '', '', null, '681.600000', null, '1', '2013-01-01 13:33:31', '0', '2013-01-01 14:59:08', '伊芙丽 2013春装新款 女装OL通勤修身长袖小外套女小西装1211120', '568', '568.000000', '0', '0', '0', null, null, null, '201304289', null, null, '0', '件', '1', '2013-01-01 13:33:31', '0', '2013-01-01 14:59:08', null, '2', '34', '14');
INSERT INTO `product` VALUES ('193', '2013-01-01 14:59:08', '2013-01-01 14:59:08', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '伊芙丽 2013春装新款 女装OL通勤修身长袖小外套女小西装1211120[卡其色 M]', '0', 'http://storage.shopxx.net/demo-image/3.0/201301/69439b45-8626-451c-a31a-08f9df5d702b-thumbnail.jpg', '<img alt=\"\" src=\"http://storage.shopxx.net/demo-image/3.0/201301/04b58a76-a591-4b39-9322-c03f703cd440.jpg\" />', '', '', '', '', null, '681.600000', null, '0', '2013-01-01 14:59:08', '0', '2013-01-01 14:59:08', '伊芙丽 2013春装新款 女装OL通勤修身长袖小外套女小西装1211120', '568', '568.000000', '0', '0', '0', null, null, null, '201304290', null, null, '0', '件', '0', '2013-01-01 14:59:08', '0', '2013-01-01 14:59:08', null, '2', '34', '14');
INSERT INTO `product` VALUES ('194', '2013-01-01 14:59:08', '2013-01-01 09:23:09', '0', '短款', '修身型', null, null, null, null, null, null, null, null, null, null, '暗扣', null, null, null, null, null, null, null, null, '伊芙丽 2013春装新款 女装OL通勤修身长袖小外套女小西装1211120[卡其色 XS]', '6', 'http://storage.shopxx.net/demo-image/3.0/201301/69439b45-8626-451c-a31a-08f9df5d702b-thumbnail.jpg', '<img alt=\"\" src=\"http://storage.shopxx.net/demo-image/3.0/201301/04b58a76-a591-4b39-9322-c03f703cd440.jpg\" />', '', '', '', '', null, '681.600000', null, '4', '2013-01-01 09:23:09', '0', '2013-01-01 14:59:08', '伊芙丽 2013春装新款 女装OL通勤修身长袖小外套女小西装1211120', '568', '568.000000', '0', '4', '1', null, null, null, '201304291', null, null, '4', '件', '4', '2013-01-01 09:23:09', '0', '2013-01-01 14:59:08', null, '2', '34', '14');
INSERT INTO `product` VALUES ('195', '2013-01-01 15:03:30', '2013-01-01 15:03:30', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '伊芙丽 春款夏装新款 女装复古短袖镂空花案 蕾丝连衣裙6339774[黑色 XL]', '0', 'http://storage.shopxx.net/demo-image/3.0/201301/f4fc0bd7-71d1-4dff-950d-6ebb8221388c-thumbnail.jpg', '<img alt=\"\" src=\"http://storage.shopxx.net/demo-image/3.0/201301/87cef58d-b3df-430b-9a81-8c8850562800.jpg\" />', '', '', '', '', null, '563.860000', null, '0', '2013-01-01 15:03:30', '0', '2013-01-01 15:03:30', '伊芙丽 春款夏装新款 女装复古短袖镂空花案 蕾丝连衣裙6339774', '469', '469.880000', '0', '0', '0', null, null, null, '201304292', null, null, '0', '件', '0', '2013-01-01 15:03:30', '0', '2013-01-01 15:03:30', null, '2', '35', '11');
INSERT INTO `product` VALUES ('196', '2013-01-01 15:03:30', '2013-01-01 15:03:30', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '伊芙丽 春款夏装新款 女装复古短袖镂空花案 蕾丝连衣裙6339774[黑色 L]', '0', 'http://storage.shopxx.net/demo-image/3.0/201301/f4fc0bd7-71d1-4dff-950d-6ebb8221388c-thumbnail.jpg', '<img alt=\"\" src=\"http://storage.shopxx.net/demo-image/3.0/201301/87cef58d-b3df-430b-9a81-8c8850562800.jpg\" />', '', '', '', '', null, '563.860000', null, '0', '2013-01-01 15:03:30', '0', '2013-01-01 15:03:30', '伊芙丽 春款夏装新款 女装复古短袖镂空花案 蕾丝连衣裙6339774', '469', '469.880000', '0', '0', '0', null, null, null, '201304293', null, null, '0', '件', '0', '2013-01-01 15:03:30', '0', '2013-01-01 15:03:30', null, '2', '35', '11');
INSERT INTO `product` VALUES ('197', '2013-01-01 15:03:30', '2013-01-01 15:03:30', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '伊芙丽 春款夏装新款 女装复古短袖镂空花案 蕾丝连衣裙6339774[黑色 S]', '0', 'http://storage.shopxx.net/demo-image/3.0/201301/f4fc0bd7-71d1-4dff-950d-6ebb8221388c-thumbnail.jpg', '<img alt=\"\" src=\"http://storage.shopxx.net/demo-image/3.0/201301/87cef58d-b3df-430b-9a81-8c8850562800.jpg\" />', '', '', '', '', null, '563.860000', null, '0', '2013-01-01 15:03:30', '0', '2013-01-01 15:03:30', '伊芙丽 春款夏装新款 女装复古短袖镂空花案 蕾丝连衣裙6339774', '469', '469.880000', '0', '0', '0', null, null, null, '201304294', null, null, '0', '件', '0', '2013-01-01 15:03:30', '0', '2013-01-01 15:03:30', null, '2', '35', '11');
INSERT INTO `product` VALUES ('198', '2013-01-01 15:03:30', '2013-01-01 15:03:30', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '伊芙丽 春款夏装新款 女装复古短袖镂空花案 蕾丝连衣裙6339774[米黄色 M]', '0', 'http://storage.shopxx.net/demo-image/3.0/201301/f4fc0bd7-71d1-4dff-950d-6ebb8221388c-thumbnail.jpg', '<img alt=\"\" src=\"http://storage.shopxx.net/demo-image/3.0/201301/87cef58d-b3df-430b-9a81-8c8850562800.jpg\" />', '', '', '', '', null, '563.860000', null, '0', '2013-01-01 15:03:30', '0', '2013-01-01 15:03:30', '伊芙丽 春款夏装新款 女装复古短袖镂空花案 蕾丝连衣裙6339774', '469', '469.880000', '0', '0', '0', null, null, null, '201304295', null, null, '0', '件', '0', '2013-01-01 15:03:30', '0', '2013-01-01 15:03:30', null, '2', '35', '11');
INSERT INTO `product` VALUES ('199', '2013-01-01 15:03:30', '2013-01-01 10:40:04', '0', '其他', '短裙', null, null, null, null, null, null, null, null, null, null, '圆领', '中腰', null, null, null, null, null, null, null, '伊芙丽 春款夏装新款 女装复古短袖镂空花案 蕾丝连衣裙6339774[米黄色 S]', '1', 'http://storage.shopxx.net/demo-image/3.0/201301/f4fc0bd7-71d1-4dff-950d-6ebb8221388c-thumbnail.jpg', '<img alt=\"\" src=\"http://storage.shopxx.net/demo-image/3.0/201301/87cef58d-b3df-430b-9a81-8c8850562800.jpg\" />', '', '', '', '', null, '563.860000', null, '1', '2013-01-01 10:40:04', '0', '2013-01-01 15:03:30', '伊芙丽 春款夏装新款 女装复古短袖镂空花案 蕾丝连衣裙6339774', '469', '469.880000', '0', '0', '0', null, null, null, '201304296', null, null, '0', '件', '1', '2013-01-01 10:40:04', '0', '2013-01-01 15:03:30', null, '2', '35', '11');
INSERT INTO `product` VALUES ('200', '2013-01-01 15:04:31', '2013-01-01 13:33:31', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '卡绚 情侣家居服睡衣套装 夏季纯棉 时尚条纹男女士睡衣短', '2', 'http://storage.shopxx.net/demo-image/3.0/201301/2971c96e-9f11-4491-9faf-9ea7e1fec53c-thumbnail.jpg', '<img alt=\"\" src=\"http://storage.shopxx.net/demo-image/3.0/201301/629bfcc2-564e-45dd-87ec-2c7e3a2a3999.jpg\" />', '', '', '', '', null, '146.400000', null, '2', '2013-01-01 13:33:31', '0', '2013-01-01 15:04:31', '卡绚 情侣家居服睡衣套装 夏季纯棉 时尚条纹男女士睡衣短', '122', '122.000000', '0', '0', '0', null, null, null, '201304297', null, null, '0', null, '2', '2013-01-01 13:33:31', '0', '2013-01-01 15:04:31', null, null, '36', '38');
INSERT INTO `product` VALUES ('201', '2013-01-01 15:07:50', '2013-01-01 15:07:50', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '伊芙丽2013春款新款女士西装领一粒扣短款小西装外套女1161024-2[黑色 L]', '0', 'http://storage.shopxx.net/demo-image/3.0/201301/f5e39c37-94b2-462e-8e58-8bde3c5f1b8c-thumbnail.jpg', '<img alt=\"\" src=\"http://storage.shopxx.net/demo-image/3.0/201301/205f30f8-f42f-4f58-b603-c730b738a0b2.jpg\" />', '', '', '', '', null, '429.600000', null, '0', '2013-01-01 15:07:50', '0', '2013-01-01 15:07:50', '伊芙丽2013春款新款女士西装领一粒扣短款小西装外套女1161024-2', '358', '358.000000', '0', '0', '0', null, null, null, '201304298', null, null, '0', '件', '0', '2013-01-01 15:07:50', '0', '2013-01-01 15:07:50', null, '2', '37', '14');
INSERT INTO `product` VALUES ('202', '2013-01-01 15:07:50', '2013-01-01 15:07:50', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '伊芙丽2013春款新款女士西装领一粒扣短款小西装外套女1161024-2[黑色 M]', '0', 'http://storage.shopxx.net/demo-image/3.0/201301/f5e39c37-94b2-462e-8e58-8bde3c5f1b8c-thumbnail.jpg', '<img alt=\"\" src=\"http://storage.shopxx.net/demo-image/3.0/201301/205f30f8-f42f-4f58-b603-c730b738a0b2.jpg\" />', '', '', '', '', null, '429.600000', null, '0', '2013-01-01 15:07:50', '0', '2013-01-01 15:07:50', '伊芙丽2013春款新款女士西装领一粒扣短款小西装外套女1161024-2', '358', '358.000000', '0', '0', '0', null, null, null, '201304299', null, null, '0', '件', '0', '2013-01-01 15:07:50', '0', '2013-01-01 15:07:50', null, '2', '37', '14');
INSERT INTO `product` VALUES ('203', '2013-01-01 15:07:50', '2013-01-01 15:07:50', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '伊芙丽2013春款新款女士西装领一粒扣短款小西装外套女1161024-2[粉红色 XL]', '0', 'http://storage.shopxx.net/demo-image/3.0/201301/f5e39c37-94b2-462e-8e58-8bde3c5f1b8c-thumbnail.jpg', '<img alt=\"\" src=\"http://storage.shopxx.net/demo-image/3.0/201301/205f30f8-f42f-4f58-b603-c730b738a0b2.jpg\" />', '', '', '', '', null, '429.600000', null, '0', '2013-01-01 15:07:50', '0', '2013-01-01 15:07:50', '伊芙丽2013春款新款女士西装领一粒扣短款小西装外套女1161024-2', '358', '358.000000', '0', '0', '0', null, null, null, '201304300', null, null, '0', '件', '0', '2013-01-01 15:07:50', '0', '2013-01-01 15:07:50', null, '2', '37', '14');
INSERT INTO `product` VALUES ('204', '2013-01-01 15:07:50', '2013-01-01 15:07:50', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '伊芙丽2013春款新款女士西装领一粒扣短款小西装外套女1161024-2[粉红色 M]', '0', 'http://storage.shopxx.net/demo-image/3.0/201301/f5e39c37-94b2-462e-8e58-8bde3c5f1b8c-thumbnail.jpg', '<img alt=\"\" src=\"http://storage.shopxx.net/demo-image/3.0/201301/205f30f8-f42f-4f58-b603-c730b738a0b2.jpg\" />', '', '', '', '', null, '429.600000', null, '0', '2013-01-01 15:07:50', '0', '2013-01-01 15:07:50', '伊芙丽2013春款新款女士西装领一粒扣短款小西装外套女1161024-2', '358', '358.000000', '0', '0', '0', null, null, null, '201304301', null, null, '0', '件', '0', '2013-01-01 15:07:50', '0', '2013-01-01 15:07:50', null, '2', '37', '14');
INSERT INTO `product` VALUES ('205', '2013-01-01 15:07:50', '2013-01-01 09:23:09', '0', '短款', '修身型', null, null, null, null, null, null, null, null, null, null, '一粒扣', null, null, null, null, null, null, null, null, '伊芙丽2013春款新款女士西装领一粒扣短款小西装外套女1161024-2[粉红色 S]', '4', 'http://storage.shopxx.net/demo-image/3.0/201301/f5e39c37-94b2-462e-8e58-8bde3c5f1b8c-thumbnail.jpg', '<img alt=\"\" src=\"http://storage.shopxx.net/demo-image/3.0/201301/205f30f8-f42f-4f58-b603-c730b738a0b2.jpg\" />', '', '', '', '', null, '429.600000', null, '1', '2013-01-01 09:23:09', '0', '2013-01-01 15:07:50', '伊芙丽2013春款新款女士西装领一粒扣短款小西装外套女1161024-2', '358', '358.000000', '0', '5', '1', null, null, null, '201304302', '0', null, '5', '件', '1', '2013-01-01 09:23:09', '0', '2013-01-01 15:07:50', null, '2', '37', '14');
INSERT INTO `product` VALUES ('206', '2013-01-01 15:08:45', '2013-01-01 15:08:45', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '女士夏季短袖睡裙清纯棉质甜美可爱少女睡衣V领条纹连衣裙家居裙[浅蓝色 XL]', '0', 'http://storage.shopxx.net/demo-image/3.0/201301/f1174ca6-6bdf-4d0b-86e6-5455bc8e89ad-thumbnail.jpg', '<img alt=\"\" src=\"http://storage.shopxx.net/demo-image/3.0/201301/8176d644-0016-44ba-bda6-fb0bf571da21.jpg\" />', '', '', '', '', null, '118.800000', null, '0', '2013-01-01 15:08:45', '0', '2013-01-01 15:08:45', '女士夏季短袖睡裙清纯棉质甜美可爱少女睡衣V领条纹连衣裙家居裙', '99', '99.000000', '0', '0', '0', null, null, null, '201304303', null, null, '0', null, '0', '2013-01-01 15:08:45', '0', '2013-01-01 15:08:45', null, null, '38', '38');
INSERT INTO `product` VALUES ('207', '2013-01-01 15:08:45', '2013-01-01 15:11:51', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '女士夏季短袖睡裙清纯棉质甜美可爱少女睡衣V领条纹连衣裙家居裙[浅蓝色 L]', '1', 'http://storage.shopxx.net/demo-image/3.0/201301/f1174ca6-6bdf-4d0b-86e6-5455bc8e89ad-thumbnail.jpg', '<img alt=\"\" src=\"http://storage.shopxx.net/demo-image/3.0/201301/8176d644-0016-44ba-bda6-fb0bf571da21.jpg\" />', '', '', '', '', null, '118.800000', null, '1', '2013-01-01 15:11:51', '0', '2013-01-01 15:08:45', '女士夏季短袖睡裙清纯棉质甜美可爱少女睡衣V领条纹连衣裙家居裙', '99', '99.000000', '0', '0', '0', null, null, null, '201304304', null, null, '0', null, '1', '2013-01-01 15:11:51', '0', '2013-01-01 15:08:45', null, null, '38', '38');
INSERT INTO `product` VALUES ('208', '2013-01-01 15:08:45', '2013-01-01 15:08:45', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '女士夏季短袖睡裙清纯棉质甜美可爱少女睡衣V领条纹连衣裙家居裙[浅蓝色 M]', '0', 'http://storage.shopxx.net/demo-image/3.0/201301/f1174ca6-6bdf-4d0b-86e6-5455bc8e89ad-thumbnail.jpg', '<img alt=\"\" src=\"http://storage.shopxx.net/demo-image/3.0/201301/8176d644-0016-44ba-bda6-fb0bf571da21.jpg\" />', '', '', '', '', null, '118.800000', null, '0', '2013-01-01 15:08:45', '0', '2013-01-01 15:08:45', '女士夏季短袖睡裙清纯棉质甜美可爱少女睡衣V领条纹连衣裙家居裙', '99', '99.000000', '0', '0', '0', null, null, null, '201304305', null, null, '0', null, '0', '2013-01-01 15:08:45', '0', '2013-01-01 15:08:45', null, null, '38', '38');
INSERT INTO `product` VALUES ('209', '2013-01-01 15:08:45', '2013-01-01 15:08:45', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '女士夏季短袖睡裙清纯棉质甜美可爱少女睡衣V领条纹连衣裙家居裙[浅蓝色 S]', '0', 'http://storage.shopxx.net/demo-image/3.0/201301/f1174ca6-6bdf-4d0b-86e6-5455bc8e89ad-thumbnail.jpg', '<img alt=\"\" src=\"http://storage.shopxx.net/demo-image/3.0/201301/8176d644-0016-44ba-bda6-fb0bf571da21.jpg\" />', '', '', '', '', null, '118.800000', null, '0', '2013-01-01 15:08:45', '0', '2013-01-01 15:08:45', '女士夏季短袖睡裙清纯棉质甜美可爱少女睡衣V领条纹连衣裙家居裙', '99', '99.000000', '0', '0', '0', null, null, null, '201304306', null, null, '0', null, '0', '2013-01-01 15:08:45', '0', '2013-01-01 15:08:45', null, null, '38', '38');
INSERT INTO `product` VALUES ('210', '2013-01-01 15:08:45', '2013-01-01 15:08:45', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '女士夏季短袖睡裙清纯棉质甜美可爱少女睡衣V领条纹连衣裙家居裙[粉红色 XL]', '0', 'http://storage.shopxx.net/demo-image/3.0/201301/f1174ca6-6bdf-4d0b-86e6-5455bc8e89ad-thumbnail.jpg', '<img alt=\"\" src=\"http://storage.shopxx.net/demo-image/3.0/201301/8176d644-0016-44ba-bda6-fb0bf571da21.jpg\" />', '', '', '', '', null, '118.800000', null, '0', '2013-01-01 15:08:45', '0', '2013-01-01 15:08:45', '女士夏季短袖睡裙清纯棉质甜美可爱少女睡衣V领条纹连衣裙家居裙', '99', '99.000000', '0', '0', '0', null, null, null, '201304307', null, null, '0', null, '0', '2013-01-01 15:08:45', '0', '2013-01-01 15:08:45', null, null, '38', '38');
INSERT INTO `product` VALUES ('211', '2013-01-01 15:08:45', '2013-01-01 15:08:45', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '女士夏季短袖睡裙清纯棉质甜美可爱少女睡衣V领条纹连衣裙家居裙[粉红色 L]', '0', 'http://storage.shopxx.net/demo-image/3.0/201301/f1174ca6-6bdf-4d0b-86e6-5455bc8e89ad-thumbnail.jpg', '<img alt=\"\" src=\"http://storage.shopxx.net/demo-image/3.0/201301/8176d644-0016-44ba-bda6-fb0bf571da21.jpg\" />', '', '', '', '', null, '118.800000', null, '0', '2013-01-01 15:08:45', '0', '2013-01-01 15:08:45', '女士夏季短袖睡裙清纯棉质甜美可爱少女睡衣V领条纹连衣裙家居裙', '99', '99.000000', '0', '0', '0', null, null, null, '201304308', null, null, '0', null, '0', '2013-01-01 15:08:45', '0', '2013-01-01 15:08:45', null, null, '38', '38');
INSERT INTO `product` VALUES ('212', '2013-01-01 15:08:45', '2013-01-01 15:08:45', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '女士夏季短袖睡裙清纯棉质甜美可爱少女睡衣V领条纹连衣裙家居裙[粉红色 M]', '0', 'http://storage.shopxx.net/demo-image/3.0/201301/f1174ca6-6bdf-4d0b-86e6-5455bc8e89ad-thumbnail.jpg', '<img alt=\"\" src=\"http://storage.shopxx.net/demo-image/3.0/201301/8176d644-0016-44ba-bda6-fb0bf571da21.jpg\" />', '', '', '', '', null, '118.800000', null, '0', '2013-01-01 15:08:45', '0', '2013-01-01 15:08:45', '女士夏季短袖睡裙清纯棉质甜美可爱少女睡衣V领条纹连衣裙家居裙', '99', '99.000000', '0', '0', '0', null, null, null, '201304309', null, null, '0', null, '0', '2013-01-01 15:08:45', '0', '2013-01-01 15:08:45', null, null, '38', '38');
INSERT INTO `product` VALUES ('213', '2013-01-01 15:08:45', '2013-01-01 10:40:04', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '女士夏季短袖睡裙清纯棉质甜美可爱少女睡衣V领条纹连衣裙家居裙[粉红色 S]', '2', 'http://storage.shopxx.net/demo-image/3.0/201301/f1174ca6-6bdf-4d0b-86e6-5455bc8e89ad-thumbnail.jpg', '<img alt=\"\" src=\"http://storage.shopxx.net/demo-image/3.0/201301/8176d644-0016-44ba-bda6-fb0bf571da21.jpg\" />', '', '', '', '', null, '118.800000', null, '2', '2013-01-01 10:40:04', '0', '2013-01-01 15:08:45', '女士夏季短袖睡裙清纯棉质甜美可爱少女睡衣V领条纹连衣裙家居裙', '99', '99.000000', '0', '0', '0', null, null, null, '201304310', null, null, '0', null, '2', '2013-01-01 10:40:04', '0', '2013-01-01 15:08:45', null, null, '38', '38');
INSERT INTO `product` VALUES ('214', '2013-01-01 15:10:43', '2013-01-01 15:10:43', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2013新款夏季家居服女 大码全棉夏装家居睡衣 运动短袖短裤套装[浅蓝色 XL]', '0', 'http://storage.shopxx.net/demo-image/3.0/201301/1c81f492-a3d7-4c06-8658-bc2c76808cd3-thumbnail.jpg', '<img alt=\"\" src=\"http://storage.shopxx.net/demo-image/3.0/201301/eaec0c8a-3d17-485c-9866-581cd343d2cb.jpg\" />', '', '', '', '', null, '145.200000', null, '0', '2013-01-01 15:10:43', '0', '2013-01-01 15:10:43', '2013新款夏季家居服女 大码全棉夏装家居睡衣 运动短袖短裤套装', '121', '121.000000', '0', '0', '0', null, null, null, '201304311', null, null, '0', null, '0', '2013-01-01 15:10:43', '0', '2013-01-01 15:10:43', null, null, '39', '38');
INSERT INTO `product` VALUES ('215', '2013-01-01 15:10:43', '2013-01-01 15:10:43', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2013新款夏季家居服女 大码全棉夏装家居睡衣 运动短袖短裤套装[浅蓝色 L]', '0', 'http://storage.shopxx.net/demo-image/3.0/201301/1c81f492-a3d7-4c06-8658-bc2c76808cd3-thumbnail.jpg', '<img alt=\"\" src=\"http://storage.shopxx.net/demo-image/3.0/201301/eaec0c8a-3d17-485c-9866-581cd343d2cb.jpg\" />', '', '', '', '', null, '145.200000', null, '0', '2013-01-01 15:10:43', '0', '2013-01-01 15:10:43', '2013新款夏季家居服女 大码全棉夏装家居睡衣 运动短袖短裤套装', '121', '121.000000', '0', '0', '0', null, null, null, '201304312', null, null, '0', null, '0', '2013-01-01 15:10:43', '0', '2013-01-01 15:10:43', null, null, '39', '38');
INSERT INTO `product` VALUES ('216', '2013-01-01 15:10:43', '2013-01-01 15:10:43', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2013新款夏季家居服女 大码全棉夏装家居睡衣 运动短袖短裤套装[浅蓝色 M]', '0', 'http://storage.shopxx.net/demo-image/3.0/201301/1c81f492-a3d7-4c06-8658-bc2c76808cd3-thumbnail.jpg', '<img alt=\"\" src=\"http://storage.shopxx.net/demo-image/3.0/201301/eaec0c8a-3d17-485c-9866-581cd343d2cb.jpg\" />', '', '', '', '', null, '145.200000', null, '0', '2013-01-01 15:10:43', '0', '2013-01-01 15:10:43', '2013新款夏季家居服女 大码全棉夏装家居睡衣 运动短袖短裤套装', '121', '121.000000', '0', '0', '0', null, null, null, '201304313', null, null, '0', null, '0', '2013-01-01 15:10:43', '0', '2013-01-01 15:10:43', null, null, '39', '38');
INSERT INTO `product` VALUES ('217', '2013-01-01 15:10:43', '2013-01-01 15:10:43', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2013新款夏季家居服女 大码全棉夏装家居睡衣 运动短袖短裤套装[浅蓝色 S]', '0', 'http://storage.shopxx.net/demo-image/3.0/201301/1c81f492-a3d7-4c06-8658-bc2c76808cd3-thumbnail.jpg', '<img alt=\"\" src=\"http://storage.shopxx.net/demo-image/3.0/201301/eaec0c8a-3d17-485c-9866-581cd343d2cb.jpg\" />', '', '', '', '', null, '145.200000', null, '0', '2013-01-01 15:10:43', '0', '2013-01-01 15:10:43', '2013新款夏季家居服女 大码全棉夏装家居睡衣 运动短袖短裤套装', '121', '121.000000', '0', '0', '0', null, null, null, '201304314', null, null, '0', null, '0', '2013-01-01 15:10:43', '0', '2013-01-01 15:10:43', null, null, '39', '38');
INSERT INTO `product` VALUES ('218', '2013-01-01 15:10:43', '2013-01-01 15:10:43', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2013新款夏季家居服女 大码全棉夏装家居睡衣 运动短袖短裤套装[粉红色 XL]', '0', 'http://storage.shopxx.net/demo-image/3.0/201301/1c81f492-a3d7-4c06-8658-bc2c76808cd3-thumbnail.jpg', '<img alt=\"\" src=\"http://storage.shopxx.net/demo-image/3.0/201301/eaec0c8a-3d17-485c-9866-581cd343d2cb.jpg\" />', '', '', '', '', null, '145.200000', null, '0', '2013-01-01 15:10:43', '0', '2013-01-01 15:10:43', '2013新款夏季家居服女 大码全棉夏装家居睡衣 运动短袖短裤套装', '121', '121.000000', '0', '0', '0', null, null, null, '201304315', null, null, '0', null, '0', '2013-01-01 15:10:43', '0', '2013-01-01 15:10:43', null, null, '39', '38');
INSERT INTO `product` VALUES ('219', '2013-01-01 15:10:43', '2013-01-01 15:10:43', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2013新款夏季家居服女 大码全棉夏装家居睡衣 运动短袖短裤套装[粉红色 L]', '0', 'http://storage.shopxx.net/demo-image/3.0/201301/1c81f492-a3d7-4c06-8658-bc2c76808cd3-thumbnail.jpg', '<img alt=\"\" src=\"http://storage.shopxx.net/demo-image/3.0/201301/eaec0c8a-3d17-485c-9866-581cd343d2cb.jpg\" />', '', '', '', '', null, '145.200000', null, '0', '2013-01-01 15:10:43', '0', '2013-01-01 15:10:43', '2013新款夏季家居服女 大码全棉夏装家居睡衣 运动短袖短裤套装', '121', '121.000000', '0', '0', '0', null, null, null, '201304316', null, null, '0', null, '0', '2013-01-01 15:10:43', '0', '2013-01-01 15:10:43', null, null, '39', '38');
INSERT INTO `product` VALUES ('220', '2013-01-01 15:10:43', '2013-01-01 15:10:43', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2013新款夏季家居服女 大码全棉夏装家居睡衣 运动短袖短裤套装[粉红色 M]', '0', 'http://storage.shopxx.net/demo-image/3.0/201301/1c81f492-a3d7-4c06-8658-bc2c76808cd3-thumbnail.jpg', '<img alt=\"\" src=\"http://storage.shopxx.net/demo-image/3.0/201301/eaec0c8a-3d17-485c-9866-581cd343d2cb.jpg\" />', '', '', '', '', null, '145.200000', null, '0', '2013-01-01 15:10:43', '0', '2013-01-01 15:10:43', '2013新款夏季家居服女 大码全棉夏装家居睡衣 运动短袖短裤套装', '121', '121.000000', '0', '0', '0', null, null, null, '201304317', null, null, '0', null, '0', '2013-01-01 15:10:43', '0', '2013-01-01 15:10:43', null, null, '39', '38');
INSERT INTO `product` VALUES ('221', '2013-01-01 15:10:43', '2013-01-01 10:40:04', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2013新款夏季家居服女 大码全棉夏装家居睡衣 运动短袖短裤套装[粉红色 S]', '2', 'http://storage.shopxx.net/demo-image/3.0/201301/1c81f492-a3d7-4c06-8658-bc2c76808cd3-thumbnail.jpg', '<img alt=\"\" src=\"http://storage.shopxx.net/demo-image/3.0/201301/eaec0c8a-3d17-485c-9866-581cd343d2cb.jpg\" />', '', '', '', '', null, '145.200000', null, '2', '2013-01-01 10:40:04', '0', '2013-01-01 15:10:43', '2013新款夏季家居服女 大码全棉夏装家居睡衣 运动短袖短裤套装', '121', '121.000000', '0', '0', '0', null, null, null, '201304318', null, null, '0', null, '2', '2013-01-01 10:40:04', '0', '2013-01-01 15:10:43', null, null, '39', '38');
INSERT INTO `product` VALUES ('222', '2013-01-01 15:13:02', '2013-01-01 15:13:02', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '卡绚 男士睡衣春秋条纹纯棉长袖家居服套装大码圆领全棉质居家服[蓝色 XXL]', '0', 'http://storage.shopxx.net/demo-image/3.0/201301/dea31d42-fa3e-4b69-a631-51ca7c79f032-thumbnail.jpg', '<img alt=\"\" src=\"http://storage.shopxx.net/demo-image/3.0/201301/72d67b22-a628-4916-ab64-6b0c789825a0.jpg\" />', '', '', '', '', null, '166.800000', null, '0', '2013-01-01 15:13:02', '0', '2013-01-01 15:13:02', '卡绚 男士睡衣春秋条纹纯棉长袖家居服套装大码圆领全棉质居家服', '139', '139.000000', '0', '0', '0', null, null, null, '201304319', null, null, '0', null, '0', '2013-01-01 15:13:02', '0', '2013-01-01 15:13:02', null, null, '40', '38');
INSERT INTO `product` VALUES ('223', '2013-01-01 15:13:02', '2013-01-01 15:13:02', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '卡绚 男士睡衣春秋条纹纯棉长袖家居服套装大码圆领全棉质居家服[灰色 XXL]', '0', 'http://storage.shopxx.net/demo-image/3.0/201301/dea31d42-fa3e-4b69-a631-51ca7c79f032-thumbnail.jpg', '<img alt=\"\" src=\"http://storage.shopxx.net/demo-image/3.0/201301/72d67b22-a628-4916-ab64-6b0c789825a0.jpg\" />', '', '', '', '', null, '166.800000', null, '0', '2013-01-01 15:13:02', '0', '2013-01-01 15:13:02', '卡绚 男士睡衣春秋条纹纯棉长袖家居服套装大码圆领全棉质居家服', '139', '139.000000', '0', '0', '0', null, null, null, '201304320', null, null, '0', null, '0', '2013-01-01 15:13:02', '0', '2013-01-01 15:13:02', null, null, '40', '38');
INSERT INTO `product` VALUES ('224', '2013-01-01 15:13:02', '2013-01-01 15:13:02', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '卡绚 男士睡衣春秋条纹纯棉长袖家居服套装大码圆领全棉质居家服[灰色 XL]', '0', 'http://storage.shopxx.net/demo-image/3.0/201301/dea31d42-fa3e-4b69-a631-51ca7c79f032-thumbnail.jpg', '<img alt=\"\" src=\"http://storage.shopxx.net/demo-image/3.0/201301/72d67b22-a628-4916-ab64-6b0c789825a0.jpg\" />', '', '', '', '', null, '166.800000', null, '0', '2013-01-01 15:13:02', '0', '2013-01-01 15:13:02', '卡绚 男士睡衣春秋条纹纯棉长袖家居服套装大码圆领全棉质居家服', '139', '139.000000', '0', '0', '0', null, null, null, '201304321', null, null, '0', null, '0', '2013-01-01 15:13:02', '0', '2013-01-01 15:13:02', null, null, '40', '38');
INSERT INTO `product` VALUES ('225', '2013-01-01 15:13:02', '2013-01-01 15:13:02', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '卡绚 男士睡衣春秋条纹纯棉长袖家居服套装大码圆领全棉质居家服[灰色 L]', '0', 'http://storage.shopxx.net/demo-image/3.0/201301/dea31d42-fa3e-4b69-a631-51ca7c79f032-thumbnail.jpg', '<img alt=\"\" src=\"http://storage.shopxx.net/demo-image/3.0/201301/72d67b22-a628-4916-ab64-6b0c789825a0.jpg\" />', '', '', '', '', null, '166.800000', null, '0', '2013-01-01 15:13:02', '0', '2013-01-01 15:13:02', '卡绚 男士睡衣春秋条纹纯棉长袖家居服套装大码圆领全棉质居家服', '139', '139.000000', '0', '0', '0', null, null, null, '201304322', null, null, '0', null, '0', '2013-01-01 15:13:02', '0', '2013-01-01 15:13:02', null, null, '40', '38');
INSERT INTO `product` VALUES ('226', '2013-01-01 15:13:02', '2013-01-01 15:13:02', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '卡绚 男士睡衣春秋条纹纯棉长袖家居服套装大码圆领全棉质居家服[灰色 M]', '0', 'http://storage.shopxx.net/demo-image/3.0/201301/dea31d42-fa3e-4b69-a631-51ca7c79f032-thumbnail.jpg', '<img alt=\"\" src=\"http://storage.shopxx.net/demo-image/3.0/201301/72d67b22-a628-4916-ab64-6b0c789825a0.jpg\" />', '', '', '', '', null, '166.800000', null, '0', '2013-01-01 15:13:02', '0', '2013-01-01 15:13:02', '卡绚 男士睡衣春秋条纹纯棉长袖家居服套装大码圆领全棉质居家服', '139', '139.000000', '0', '0', '0', null, null, null, '201304323', null, null, '0', null, '0', '2013-01-01 15:13:02', '0', '2013-01-01 15:13:02', null, null, '40', '38');
INSERT INTO `product` VALUES ('227', '2013-01-01 15:13:02', '2013-01-01 15:13:02', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '卡绚 男士睡衣春秋条纹纯棉长袖家居服套装大码圆领全棉质居家服[蓝色 XL]', '0', 'http://storage.shopxx.net/demo-image/3.0/201301/dea31d42-fa3e-4b69-a631-51ca7c79f032-thumbnail.jpg', '<img alt=\"\" src=\"http://storage.shopxx.net/demo-image/3.0/201301/72d67b22-a628-4916-ab64-6b0c789825a0.jpg\" />', '', '', '', '', null, '166.800000', null, '0', '2013-01-01 15:13:02', '0', '2013-01-01 15:13:02', '卡绚 男士睡衣春秋条纹纯棉长袖家居服套装大码圆领全棉质居家服', '139', '139.000000', '0', '0', '0', null, null, null, '201304324', null, null, '0', null, '0', '2013-01-01 15:13:02', '0', '2013-01-01 15:13:02', null, null, '40', '38');
INSERT INTO `product` VALUES ('228', '2013-01-01 15:13:02', '2013-01-01 15:13:02', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '卡绚 男士睡衣春秋条纹纯棉长袖家居服套装大码圆领全棉质居家服[蓝色 L]', '0', 'http://storage.shopxx.net/demo-image/3.0/201301/dea31d42-fa3e-4b69-a631-51ca7c79f032-thumbnail.jpg', '<img alt=\"\" src=\"http://storage.shopxx.net/demo-image/3.0/201301/72d67b22-a628-4916-ab64-6b0c789825a0.jpg\" />', '', '', '', '', null, '166.800000', null, '0', '2013-01-01 15:13:02', '0', '2013-01-01 15:13:02', '卡绚 男士睡衣春秋条纹纯棉长袖家居服套装大码圆领全棉质居家服', '139', '139.000000', '0', '0', '0', null, null, null, '201304325', null, null, '0', null, '0', '2013-01-01 15:13:02', '0', '2013-01-01 15:13:02', null, null, '40', '38');
INSERT INTO `product` VALUES ('229', '2013-01-01 15:13:02', '2013-01-01 10:40:04', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '卡绚 男士睡衣春秋条纹纯棉长袖家居服套装大码圆领全棉质居家服[蓝色 M]', '2', 'http://storage.shopxx.net/demo-image/3.0/201301/dea31d42-fa3e-4b69-a631-51ca7c79f032-thumbnail.jpg', '<img alt=\"\" src=\"http://storage.shopxx.net/demo-image/3.0/201301/72d67b22-a628-4916-ab64-6b0c789825a0.jpg\" />', '', '', '', '', null, '166.800000', null, '2', '2013-01-01 10:40:04', '0', '2013-01-01 15:13:02', '卡绚 男士睡衣春秋条纹纯棉长袖家居服套装大码圆领全棉质居家服', '139', '139.000000', '0', '0', '0', null, null, null, '201304326', null, null, '0', null, '2', '2013-01-01 10:40:04', '0', '2013-01-01 15:13:02', null, null, '40', '38');
INSERT INTO `product` VALUES ('230', '2013-01-01 15:14:28', '2013-01-01 10:40:04', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '卡绚 情侣家居服套装 春秋纯棉男女睡衣长袖条纹居家服 时', '3', 'http://storage.shopxx.net/demo-image/3.0/201301/ea566af4-0cdb-4017-a8c7-27e407794204-thumbnail.jpg', '<img alt=\"\" src=\"http://storage.shopxx.net/demo-image/3.0/201301/baf8805e-0a2c-49b9-a3b6-56c1066bac4a.jpg\" />', '', '', '', '', null, '166.800000', null, '3', '2013-01-01 10:40:04', '0', '2013-01-01 15:14:28', '卡绚 情侣家居服套装 春秋纯棉男女睡衣长袖条纹居家服 时', '139', '139.000000', '0', '0', '0', null, null, null, '201304327', null, null, '0', null, '3', '2013-01-01 10:40:04', '0', '2013-01-01 15:14:28', null, null, '41', '38');
INSERT INTO `product` VALUES ('231', '2013-01-01 15:15:09', '2013-01-01 15:15:09', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '维依恋2013夏装新款韩版修身娃娃领女式短袖雪纺衫蕾丝拼接上衣[米黄色 XL]', '0', 'http://storage.shopxx.net/demo-image/3.0/201301/aec6d0ae-cad6-4cca-96bb-4bcd25e994cb-thumbnail.jpg', '<img alt=\"\" src=\"http://storage.shopxx.net/demo-image/3.0/201301/c3c5975a-dccf-4ccd-970a-21c5d1007543.jpg\" />', '', '', '', '', null, '201.600000', null, '0', '2013-01-01 15:15:09', '0', '2013-01-01 15:15:09', '维依恋2013夏装新款韩版修身娃娃领女式短袖雪纺衫蕾丝拼接上衣', '168', '168.000000', '0', '0', '0', null, null, null, '201304328', null, null, '0', '件', '0', '2013-01-01 15:15:09', '0', '2013-01-01 15:15:09', null, null, '42', '19');
INSERT INTO `product` VALUES ('232', '2013-01-01 15:15:09', '2013-01-01 15:15:09', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '维依恋2013夏装新款韩版修身娃娃领女式短袖雪纺衫蕾丝拼接上衣[米黄色 L]', '0', 'http://storage.shopxx.net/demo-image/3.0/201301/aec6d0ae-cad6-4cca-96bb-4bcd25e994cb-thumbnail.jpg', '<img alt=\"\" src=\"http://storage.shopxx.net/demo-image/3.0/201301/c3c5975a-dccf-4ccd-970a-21c5d1007543.jpg\" />', '', '', '', '', null, '201.600000', null, '0', '2013-01-01 15:15:09', '0', '2013-01-01 15:15:09', '维依恋2013夏装新款韩版修身娃娃领女式短袖雪纺衫蕾丝拼接上衣', '168', '168.000000', '0', '0', '0', null, null, null, '201304329', null, null, '0', '件', '0', '2013-01-01 15:15:09', '0', '2013-01-01 15:15:09', null, null, '42', '19');
INSERT INTO `product` VALUES ('233', '2013-01-01 15:15:09', '2013-01-01 15:15:09', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '维依恋2013夏装新款韩版修身娃娃领女式短袖雪纺衫蕾丝拼接上衣[米黄色 S]', '0', 'http://storage.shopxx.net/demo-image/3.0/201301/aec6d0ae-cad6-4cca-96bb-4bcd25e994cb-thumbnail.jpg', '<img alt=\"\" src=\"http://storage.shopxx.net/demo-image/3.0/201301/c3c5975a-dccf-4ccd-970a-21c5d1007543.jpg\" />', '', '', '', '', null, '201.600000', null, '0', '2013-01-01 15:15:09', '0', '2013-01-01 15:15:09', '维依恋2013夏装新款韩版修身娃娃领女式短袖雪纺衫蕾丝拼接上衣', '168', '168.000000', '0', '0', '0', null, null, null, '201304330', null, null, '0', '件', '0', '2013-01-01 15:15:09', '0', '2013-01-01 15:15:09', null, null, '42', '19');
INSERT INTO `product` VALUES ('234', '2013-01-01 15:15:09', '2013-01-01 15:15:09', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '维依恋2013夏装新款韩版修身娃娃领女式短袖雪纺衫蕾丝拼接上衣[浅蓝色 L]', '0', 'http://storage.shopxx.net/demo-image/3.0/201301/aec6d0ae-cad6-4cca-96bb-4bcd25e994cb-thumbnail.jpg', '<img alt=\"\" src=\"http://storage.shopxx.net/demo-image/3.0/201301/c3c5975a-dccf-4ccd-970a-21c5d1007543.jpg\" />', '', '', '', '', null, '201.600000', null, '0', '2013-01-01 15:15:09', '0', '2013-01-01 15:15:09', '维依恋2013夏装新款韩版修身娃娃领女式短袖雪纺衫蕾丝拼接上衣', '168', '168.000000', '0', '0', '0', null, null, null, '201304331', null, null, '0', '件', '0', '2013-01-01 15:15:09', '0', '2013-01-01 15:15:09', null, null, '42', '19');
INSERT INTO `product` VALUES ('235', '2013-01-01 15:15:09', '2013-01-01 15:15:09', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '维依恋2013夏装新款韩版修身娃娃领女式短袖雪纺衫蕾丝拼接上衣[浅蓝色 M]', '0', 'http://storage.shopxx.net/demo-image/3.0/201301/aec6d0ae-cad6-4cca-96bb-4bcd25e994cb-thumbnail.jpg', '<img alt=\"\" src=\"http://storage.shopxx.net/demo-image/3.0/201301/c3c5975a-dccf-4ccd-970a-21c5d1007543.jpg\" />', '', '', '', '', null, '201.600000', null, '0', '2013-01-01 15:15:09', '0', '2013-01-01 15:15:09', '维依恋2013夏装新款韩版修身娃娃领女式短袖雪纺衫蕾丝拼接上衣', '168', '168.000000', '0', '0', '0', null, null, null, '201304332', null, null, '0', '件', '0', '2013-01-01 15:15:09', '0', '2013-01-01 15:15:09', null, null, '42', '19');
INSERT INTO `product` VALUES ('236', '2013-01-01 15:15:09', '2013-01-01 15:15:09', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '维依恋2013夏装新款韩版修身娃娃领女式短袖雪纺衫蕾丝拼接上衣[浅蓝色 XS]', '0', 'http://storage.shopxx.net/demo-image/3.0/201301/aec6d0ae-cad6-4cca-96bb-4bcd25e994cb-thumbnail.jpg', '<img alt=\"\" src=\"http://storage.shopxx.net/demo-image/3.0/201301/c3c5975a-dccf-4ccd-970a-21c5d1007543.jpg\" />', '', '', '', '', null, '201.600000', null, '0', '2013-01-01 15:15:09', '0', '2013-01-01 15:15:09', '维依恋2013夏装新款韩版修身娃娃领女式短袖雪纺衫蕾丝拼接上衣', '168', '168.000000', '0', '0', '0', null, null, null, '201304333', null, null, '0', '件', '0', '2013-01-01 15:15:09', '0', '2013-01-01 15:15:09', null, null, '42', '19');
INSERT INTO `product` VALUES ('237', '2013-01-01 15:15:09', '2013-01-01 15:15:09', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '维依恋2013夏装新款韩版修身娃娃领女式短袖雪纺衫蕾丝拼接上衣[粉红色 L]', '0', 'http://storage.shopxx.net/demo-image/3.0/201301/aec6d0ae-cad6-4cca-96bb-4bcd25e994cb-thumbnail.jpg', '<img alt=\"\" src=\"http://storage.shopxx.net/demo-image/3.0/201301/c3c5975a-dccf-4ccd-970a-21c5d1007543.jpg\" />', '', '', '', '', null, '201.600000', null, '0', '2013-01-01 15:15:09', '0', '2013-01-01 15:15:09', '维依恋2013夏装新款韩版修身娃娃领女式短袖雪纺衫蕾丝拼接上衣', '168', '168.000000', '0', '0', '0', null, null, null, '201304334', null, null, '0', '件', '0', '2013-01-01 15:15:09', '0', '2013-01-01 15:15:09', null, null, '42', '19');
INSERT INTO `product` VALUES ('238', '2013-01-01 15:15:09', '2013-01-01 15:15:09', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '维依恋2013夏装新款韩版修身娃娃领女式短袖雪纺衫蕾丝拼接上衣[粉红色 M]', '0', 'http://storage.shopxx.net/demo-image/3.0/201301/aec6d0ae-cad6-4cca-96bb-4bcd25e994cb-thumbnail.jpg', '<img alt=\"\" src=\"http://storage.shopxx.net/demo-image/3.0/201301/c3c5975a-dccf-4ccd-970a-21c5d1007543.jpg\" />', '', '', '', '', null, '201.600000', null, '0', '2013-01-01 15:15:09', '0', '2013-01-01 15:15:09', '维依恋2013夏装新款韩版修身娃娃领女式短袖雪纺衫蕾丝拼接上衣', '168', '168.000000', '0', '0', '0', null, null, null, '201304335', null, null, '0', '件', '0', '2013-01-01 15:15:09', '0', '2013-01-01 15:15:09', null, null, '42', '19');
INSERT INTO `product` VALUES ('239', '2013-01-01 15:15:09', '2013-01-01 10:40:04', '0', '套头', '短袖', null, null, null, null, null, null, null, null, null, null, '单件套', '薄款', null, null, null, null, null, null, null, '维依恋2013夏装新款韩版修身娃娃领女式短袖雪纺衫蕾丝拼接上衣[粉红色 S]', '2', 'http://storage.shopxx.net/demo-image/3.0/201301/aec6d0ae-cad6-4cca-96bb-4bcd25e994cb-thumbnail.jpg', '<img alt=\"\" src=\"http://storage.shopxx.net/demo-image/3.0/201301/c3c5975a-dccf-4ccd-970a-21c5d1007543.jpg\" />', '', '', '', '', null, '201.600000', null, '2', '2013-01-01 10:40:04', '0', '2013-01-01 15:15:09', '维依恋2013夏装新款韩版修身娃娃领女式短袖雪纺衫蕾丝拼接上衣', '168', '168.000000', '0', '0', '0', null, null, null, '201304336', null, null, '0', '件', '2', '2013-01-01 10:40:04', '0', '2013-01-01 15:15:09', null, null, '42', '19');
INSERT INTO `product` VALUES ('240', '2013-01-01 15:16:14', '2013-01-01 09:47:04', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '婷美正品内衣塑身衣佳丽燃脂猫背夹超薄透气收腹瘦腰', '2', 'http://storage.shopxx.net/demo-image/3.0/201301/7acae4ac-5909-4142-8b20-19c5462859d6-thumbnail.jpg', '<img alt=\"\" src=\"http://storage.shopxx.net/demo-image/3.0/201301/ab579b8a-60af-4753-ba63-c2d8dfff5292.jpg\" />', '', '', '', '', null, '660.000000', null, '2', '2013-01-01 09:47:04', '0', '2013-01-01 15:16:14', '婷美正品内衣塑身衣佳丽燃脂猫背夹超薄透气收腹瘦腰', '550', '550.000000', '0', '0', '0', null, null, null, '201304337', null, null, '0', null, '2', '2013-01-01 09:47:04', '0', '2013-01-01 15:16:14', null, null, '43', '34');
INSERT INTO `product` VALUES ('241', '2013-01-01 15:17:30', '2013-01-01 10:40:04', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '婷美正品 四季款魔鬼瘦塑身衣套装瘦腰翘臀B罩杯', '2', 'http://storage.shopxx.net/demo-image/3.0/201301/1a3ad7de-7ee9-4530-b89a-46375219beb5-thumbnail.jpg', '<img alt=\"\" src=\"http://storage.shopxx.net/demo-image/3.0/201301/831a2bfc-fa04-4f6a-aa2f-d19ddc3b53a4.jpg\" />', '', '', '', '', null, '393.600000', null, '2', '2013-01-01 10:40:04', '0', '2013-01-01 15:17:30', '婷美正品 四季款魔鬼瘦塑身衣套装瘦腰翘臀B罩杯', '328', '328.000000', '0', '0', '0', null, null, null, '201304338', null, null, '0', null, '2', '2013-01-01 10:40:04', '0', '2013-01-01 15:17:30', null, null, '44', '34');
INSERT INTO `product` VALUES ('242', '2013-01-01 15:19:07', '2013-01-01 10:40:04', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '婷美正品秋冬保暖衣 轻压塑身衣美体衣保暖内衣 塑身内衣分体套装', '2', 'http://storage.shopxx.net/demo-image/3.0/201301/2af8be8a-75b9-41ae-b009-a7c54b685a4e-thumbnail.jpg', '<img alt=\"\" src=\"http://storage.shopxx.net/demo-image/3.0/201301/d7bf56d3-089a-4864-9cf0-74c08515b8e0.jpg\" />', '', '', '', '', null, '789.600000', null, '2', '2013-01-01 10:40:04', '0', '2013-01-01 15:19:06', '婷美正品秋冬保暖衣 轻压塑身衣美体衣保暖内衣 塑身内衣分体套装', '658', '658.000000', '0', '0', '0', null, null, null, '201304339', null, null, '0', null, '2', '2013-01-01 10:40:04', '0', '2013-01-01 15:19:06', null, null, '45', '33');
INSERT INTO `product` VALUES ('243', '2013-01-01 15:19:21', '2013-01-01 15:19:21', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '维依恋2013夏装新款波西米亚印花雪纺半身裙抹胸连衣裙两穿长裙子[混色 XL]', '0', 'http://storage.shopxx.net/demo-image/3.0/201301/698a395e-ac95-4f76-a3c9-aa4e5fbc9217-thumbnail.jpg', '<img alt=\"\" src=\"http://storage.shopxx.net/demo-image/3.0/201301/a8f9e986-cfba-4fb9-8f3f-f4f08c4f163b.jpg\" />', '', '', '', '', null, '238.800000', null, '0', '2013-01-01 15:19:21', '0', '2013-01-01 15:19:21', '维依恋2013夏装新款波西米亚印花雪纺半身裙抹胸连衣裙两穿长裙子', '199', '199.000000', '0', '0', '0', null, null, null, '201304340', null, null, '0', '件', '0', '2013-01-01 15:19:21', '0', '2013-01-01 15:19:21', null, null, '46', '11');
INSERT INTO `product` VALUES ('244', '2013-01-01 15:19:21', '2013-01-01 15:19:21', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '维依恋2013夏装新款波西米亚印花雪纺半身裙抹胸连衣裙两穿长裙子[混色 L]', '0', 'http://storage.shopxx.net/demo-image/3.0/201301/698a395e-ac95-4f76-a3c9-aa4e5fbc9217-thumbnail.jpg', '<img alt=\"\" src=\"http://storage.shopxx.net/demo-image/3.0/201301/a8f9e986-cfba-4fb9-8f3f-f4f08c4f163b.jpg\" />', '', '', '', '', null, '238.800000', null, '0', '2013-01-01 15:19:21', '0', '2013-01-01 15:19:21', '维依恋2013夏装新款波西米亚印花雪纺半身裙抹胸连衣裙两穿长裙子', '199', '199.000000', '0', '0', '0', null, null, null, '201304341', null, null, '0', '件', '0', '2013-01-01 15:19:21', '0', '2013-01-01 15:19:21', null, null, '46', '11');
INSERT INTO `product` VALUES ('245', '2013-01-01 15:19:21', '2013-01-01 15:19:21', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '维依恋2013夏装新款波西米亚印花雪纺半身裙抹胸连衣裙两穿长裙子[混色 M]', '0', 'http://storage.shopxx.net/demo-image/3.0/201301/698a395e-ac95-4f76-a3c9-aa4e5fbc9217-thumbnail.jpg', '<img alt=\"\" src=\"http://storage.shopxx.net/demo-image/3.0/201301/a8f9e986-cfba-4fb9-8f3f-f4f08c4f163b.jpg\" />', '', '', '', '', null, '238.800000', null, '0', '2013-01-01 15:19:21', '0', '2013-01-01 15:19:21', '维依恋2013夏装新款波西米亚印花雪纺半身裙抹胸连衣裙两穿长裙子', '199', '199.000000', '0', '0', '0', null, null, null, '201304342', null, null, '0', '件', '0', '2013-01-01 15:19:21', '0', '2013-01-01 15:19:21', null, null, '46', '11');
INSERT INTO `product` VALUES ('246', '2013-01-01 15:19:21', '2013-01-01 11:16:33', '0', '雪纺', '长裙', null, null, null, null, null, null, null, null, null, null, '圆领', '宽松腰', null, null, null, null, null, null, null, '维依恋2013夏装新款波西米亚印花雪纺半身裙抹胸连衣裙两穿长裙子[混色 S]', '6', 'http://storage.shopxx.net/demo-image/3.0/201301/698a395e-ac95-4f76-a3c9-aa4e5fbc9217-thumbnail.jpg', '<img alt=\"\" src=\"http://storage.shopxx.net/demo-image/3.0/201301/a8f9e986-cfba-4fb9-8f3f-f4f08c4f163b.jpg\" />', '', '', '', '', null, '238.800000', null, '6', '2013-01-01 11:16:33', '0', '2013-01-01 15:19:21', '维依恋2013夏装新款波西米亚印花雪纺半身裙抹胸连衣裙两穿长裙子', '199', '199.000000', '0', '5', '2', null, null, null, '201304343', null, null, '10', '件', '6', '2013-01-01 11:16:33', '0', '2013-01-01 15:19:21', null, null, '46', '11');
INSERT INTO `product` VALUES ('247', '2013-01-01 15:20:11', '2013-01-01 10:40:04', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '婷美正品塑身衣收腹 塑身背心 舒适托胸 蕾丝动能燃脂 瘦身美体', '3', 'http://storage.shopxx.net/demo-image/3.0/201301/9f164e13-bcaa-48a6-9b35-0ca96629f614-thumbnail.jpg', '<img alt=\"\" src=\"http://storage.shopxx.net/demo-image/3.0/201301/285047b7-a3c1-4122-a035-b9e06824d242.jpg\" />', '', '', '', '', null, '145.200000', null, '3', '2013-01-01 10:40:04', '0', '2013-01-01 15:20:11', '婷美正品塑身衣收腹 塑身背心 舒适托胸 蕾丝动能燃脂 瘦身美体', '121', '121.000000', '0', '0', '0', null, null, null, '201304344', null, null, '0', null, '3', '2013-01-01 10:40:04', '0', '2013-01-01 15:20:11', null, null, '47', '34');
INSERT INTO `product` VALUES ('248', '2013-01-01 15:21:01', '2013-01-01 10:40:04', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '婷美塑身内衣正品燃脂塑身衣套装tingmei收腹瘦身衣薄束身衣', '3', 'http://storage.shopxx.net/demo-image/3.0/201301/c41d0347-364c-42bb-baeb-25142c1ed167-thumbnail.jpg', '<img alt=\"\" src=\"http://storage.shopxx.net/demo-image/3.0/201301/2b0c5511-1e11-4c35-88c0-d515a27b6529.jpg\" />', '', '', '', '', null, '387.600000', null, '3', '2013-01-01 10:40:04', '0', '2013-01-01 15:21:01', '婷美塑身内衣正品燃脂塑身衣套装tingmei收腹瘦身衣薄束身衣', '323', '323.000000', '0', '0', '0', null, null, null, '201304345', null, null, '0', null, '3', '2013-01-01 10:40:04', '0', '2013-01-01 15:21:01', null, null, '48', '34');
INSERT INTO `product` VALUES ('249', '2013-01-01 15:23:20', '2013-01-01 15:23:20', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '维依恋2013春装新款韩版双排扣中长款女式风衣女装外套春款大衣[黑色 XL]', '0', 'http://localhost:8080http://storage.shopxx.net/demo-image/3.0/201301/b967015f-bc3b-47af-97d5-6446d7a590cb-thumbnail.jpg', '<img alt=\"\" src=\"http://storage.shopxx.net/demo-image/3.0/201301/4cf0fa26-6b8b-41a6-9690-eb7cd69fc93c.jpg\" />', '', '', '', '', null, '322.800000', null, '0', '2013-01-01 15:23:20', '0', '2013-01-01 15:23:20', '维依恋2013春装新款韩版双排扣中长款女式风衣女装外套春款大衣', '269', '269.000000', '0', '0', '0', null, null, null, '201304346', null, null, '0', '件', '0', '2013-01-01 15:23:20', '0', '2013-01-01 15:23:20', null, null, '49', '18');
INSERT INTO `product` VALUES ('250', '2013-01-01 15:23:20', '2013-01-01 15:23:20', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '维依恋2013春装新款韩版双排扣中长款女式风衣女装外套春款大衣[黑色 L]', '0', 'http://localhost:8080http://storage.shopxx.net/demo-image/3.0/201301/b967015f-bc3b-47af-97d5-6446d7a590cb-thumbnail.jpg', '<img alt=\"\" src=\"http://storage.shopxx.net/demo-image/3.0/201301/4cf0fa26-6b8b-41a6-9690-eb7cd69fc93c.jpg\" />', '', '', '', '', null, '322.800000', null, '0', '2013-01-01 15:23:20', '0', '2013-01-01 15:23:20', '维依恋2013春装新款韩版双排扣中长款女式风衣女装外套春款大衣', '269', '269.000000', '0', '0', '0', null, null, null, '201304347', null, null, '0', '件', '0', '2013-01-01 15:23:20', '0', '2013-01-01 15:23:20', null, null, '49', '18');
INSERT INTO `product` VALUES ('251', '2013-01-01 15:23:20', '2013-01-01 15:23:20', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '维依恋2013春装新款韩版双排扣中长款女式风衣女装外套春款大衣[橙色 L]', '0', 'http://localhost:8080http://storage.shopxx.net/demo-image/3.0/201301/b967015f-bc3b-47af-97d5-6446d7a590cb-thumbnail.jpg', '<img alt=\"\" src=\"http://storage.shopxx.net/demo-image/3.0/201301/4cf0fa26-6b8b-41a6-9690-eb7cd69fc93c.jpg\" />', '', '', '', '', null, '322.800000', null, '0', '2013-01-01 15:23:20', '0', '2013-01-01 15:23:20', '维依恋2013春装新款韩版双排扣中长款女式风衣女装外套春款大衣', '269', '269.000000', '0', '0', '0', null, null, null, '201304348', null, null, '0', '件', '0', '2013-01-01 15:23:20', '0', '2013-01-01 15:23:20', null, null, '49', '18');
INSERT INTO `product` VALUES ('252', '2013-01-01 15:23:20', '2013-01-01 15:23:20', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '维依恋2013春装新款韩版双排扣中长款女式风衣女装外套春款大衣[橙色 S]', '0', 'http://localhost:8080http://storage.shopxx.net/demo-image/3.0/201301/b967015f-bc3b-47af-97d5-6446d7a590cb-thumbnail.jpg', '<img alt=\"\" src=\"http://storage.shopxx.net/demo-image/3.0/201301/4cf0fa26-6b8b-41a6-9690-eb7cd69fc93c.jpg\" />', '', '', '', '', null, '322.800000', null, '0', '2013-01-01 15:23:20', '0', '2013-01-01 15:23:20', '维依恋2013春装新款韩版双排扣中长款女式风衣女装外套春款大衣', '269', '269.000000', '0', '0', '0', null, null, null, '201304349', null, null, '0', '件', '0', '2013-01-01 15:23:20', '0', '2013-01-01 15:23:20', null, null, '49', '18');
INSERT INTO `product` VALUES ('253', '2013-01-01 15:23:20', '2013-01-01 15:23:20', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '维依恋2013春装新款韩版双排扣中长款女式风衣女装外套春款大衣[卡其色 L]', '0', 'http://localhost:8080http://storage.shopxx.net/demo-image/3.0/201301/b967015f-bc3b-47af-97d5-6446d7a590cb-thumbnail.jpg', '<img alt=\"\" src=\"http://storage.shopxx.net/demo-image/3.0/201301/4cf0fa26-6b8b-41a6-9690-eb7cd69fc93c.jpg\" />', '', '', '', '', null, '322.800000', null, '0', '2013-01-01 15:23:20', '0', '2013-01-01 15:23:20', '维依恋2013春装新款韩版双排扣中长款女式风衣女装外套春款大衣', '269', '269.000000', '0', '0', '0', null, null, null, '201304350', null, null, '0', '件', '0', '2013-01-01 15:23:20', '0', '2013-01-01 15:23:20', null, null, '49', '18');
INSERT INTO `product` VALUES ('254', '2013-01-01 15:23:20', '2013-01-01 10:40:04', '0', '中长款', '修身型', null, null, null, null, null, null, null, null, null, null, '长袖', '通勤', null, null, null, null, null, null, null, '维依恋2013春装新款韩版双排扣中长款女式风衣女装外套春款大衣[卡其色 M]', '11', 'http://localhost:8080http://storage.shopxx.net/demo-image/3.0/201301/b967015f-bc3b-47af-97d5-6446d7a590cb-thumbnail.jpg', '<img alt=\"\" src=\"http://storage.shopxx.net/demo-image/3.0/201301/4cf0fa26-6b8b-41a6-9690-eb7cd69fc93c.jpg\" />', '', '', '', '', null, '322.800000', null, '11', '2013-01-01 10:40:04', '0', '2013-01-01 15:23:20', '维依恋2013春装新款韩版双排扣中长款女式风衣女装外套春款大衣', '269', '269.000000', '0', '0', '0', null, null, null, '201304351', null, null, '0', '件', '11', '2013-01-01 10:40:04', '0', '2013-01-01 15:23:20', null, null, '49', '18');
INSERT INTO `product` VALUES ('255', '2013-01-01 15:33:13', '2013-01-01 10:40:04', '0', '九分袖', '修身型', null, null, null, null, null, null, null, null, null, null, '短款', '普通', null, null, null, null, null, null, null, '维依恋 2013春秋装新款 韩版修身短款女士机车大码pu皮衣短外套[黑色 M]', '5', 'http://storage.shopxx.net/demo-image/3.0/201301/d1d15c1d-e5da-414e-ac53-745b56ccf369-thumbnail.jpg', '<img alt=\"\" src=\"http://storage.shopxx.net/demo-image/3.0/201301/6238c0a5-f9f2-475a-a8bc-9e9572169d4b.jpg\" /> \r\n<p>\r\n	&nbsp;\r\n</p>', '', '', '', '', null, '319.200000', null, '5', '2013-01-01 10:40:04', '0', '2013-01-01 15:33:13', '维依恋 2013春秋装新款 韩版修身短款女士机车大码pu皮衣短外套', '266', '266.000000', '0', '0', '0', null, null, null, '201304352', null, null, '0', '件', '5', '2013-01-01 10:40:04', '0', '2013-01-01 15:33:13', null, null, '50', '13');
INSERT INTO `product` VALUES ('256', '2013-01-01 15:42:59', '2013-01-01 15:45:01', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '维依恋 2013春秋装新款 韩版修身短款女士机车大码pu皮衣短外套[蓝色 L]', '1', 'http://storage.shopxx.net/demo-image/3.0/201301/d1d15c1d-e5da-414e-ac53-745b56ccf369-thumbnail.jpg', '<img alt=\"\" src=\"http://storage.shopxx.net/demo-image/3.0/201301/6238c0a5-f9f2-475a-a8bc-9e9572169d4b.jpg\" /> \r\n<p>\r\n	&nbsp;\r\n</p>', '', '', '', '', null, '319.200000', null, '1', '2013-01-01 15:45:01', '0', '2013-01-01 15:42:58', '维依恋 2013春秋装新款 韩版修身短款女士机车大码pu皮衣短外套', '266', '266.000000', '0', '0', '0', null, null, null, '201304404', null, null, '0', '件', '1', '2013-01-01 15:45:01', '0', '2013-01-01 15:42:58', null, null, '50', '13');
INSERT INTO `product` VALUES ('257', '2013-01-01 15:49:07', '2013-01-01 15:49:07', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '唯维欣怡2013春装新款韩版女装修身网纱长袖衬衣休闲女士白色衬衫[黑色 XL]', '0', 'http://storage.shopxx.net/demo-image/3.0/201301/4652d7ae-3d2c-4692-89ea-0ca81f50eac3-thumbnail.jpg', '<img alt=\"\" src=\"http://storage.shopxx.net/demo-image/3.0/201301/079fa1fd-cc63-4b41-803a-b27067ecac68.jpg\" />', '', '', '', '', null, '238.800000', null, '0', '2013-01-01 15:49:07', '0', '2013-01-01 15:49:07', '唯维欣怡2013春装新款韩版女装修身网纱长袖衬衣休闲女士白色衬衫', '199', '199.000000', '0', '0', '0', null, null, null, '201304405', null, null, '0', '件', '0', '2013-01-01 15:49:07', '0', '2013-01-01 15:49:07', null, null, '51', '17');
INSERT INTO `product` VALUES ('258', '2013-01-01 15:49:08', '2013-01-01 15:49:08', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '唯维欣怡2013春装新款韩版女装修身网纱长袖衬衣休闲女士白色衬衫[黑色 M]', '0', 'http://storage.shopxx.net/demo-image/3.0/201301/4652d7ae-3d2c-4692-89ea-0ca81f50eac3-thumbnail.jpg', '<img alt=\"\" src=\"http://storage.shopxx.net/demo-image/3.0/201301/079fa1fd-cc63-4b41-803a-b27067ecac68.jpg\" />', '', '', '', '', null, '238.800000', null, '0', '2013-01-01 15:49:07', '0', '2013-01-01 15:49:07', '唯维欣怡2013春装新款韩版女装修身网纱长袖衬衣休闲女士白色衬衫', '199', '199.000000', '0', '0', '0', null, null, null, '201304406', null, null, '0', '件', '0', '2013-01-01 15:49:07', '0', '2013-01-01 15:49:07', null, null, '51', '17');
INSERT INTO `product` VALUES ('259', '2013-01-01 15:49:08', '2013-01-01 15:49:08', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '唯维欣怡2013春装新款韩版女装修身网纱长袖衬衣休闲女士白色衬衫[白色 XL]', '0', 'http://storage.shopxx.net/demo-image/3.0/201301/4652d7ae-3d2c-4692-89ea-0ca81f50eac3-thumbnail.jpg', '<img alt=\"\" src=\"http://storage.shopxx.net/demo-image/3.0/201301/079fa1fd-cc63-4b41-803a-b27067ecac68.jpg\" />', '', '', '', '', null, '238.800000', null, '0', '2013-01-01 15:49:07', '0', '2013-01-01 15:49:07', '唯维欣怡2013春装新款韩版女装修身网纱长袖衬衣休闲女士白色衬衫', '199', '199.000000', '0', '0', '0', null, null, null, '201304407', null, null, '0', '件', '0', '2013-01-01 15:49:07', '0', '2013-01-01 15:49:07', null, null, '51', '17');
INSERT INTO `product` VALUES ('260', '2013-01-01 15:49:08', '2013-01-01 15:49:08', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '唯维欣怡2013春装新款韩版女装修身网纱长袖衬衣休闲女士白色衬衫[白色 L]', '0', 'http://storage.shopxx.net/demo-image/3.0/201301/4652d7ae-3d2c-4692-89ea-0ca81f50eac3-thumbnail.jpg', '<img alt=\"\" src=\"http://storage.shopxx.net/demo-image/3.0/201301/079fa1fd-cc63-4b41-803a-b27067ecac68.jpg\" />', '', '', '', '', null, '238.800000', null, '0', '2013-01-01 15:49:07', '0', '2013-01-01 15:49:07', '唯维欣怡2013春装新款韩版女装修身网纱长袖衬衣休闲女士白色衬衫', '199', '199.000000', '0', '0', '0', null, null, null, '201304408', null, null, '0', '件', '0', '2013-01-01 15:49:07', '0', '2013-01-01 15:49:07', null, null, '51', '17');
INSERT INTO `product` VALUES ('261', '2013-01-01 15:49:08', '2013-01-01 10:40:04', '0', '修身型', '棉', null, null, null, null, null, null, null, null, null, null, '通勤', '中长款', null, null, null, null, null, null, null, '唯维欣怡2013春装新款韩版女装修身网纱长袖衬衣休闲女士白色衬衫[白色 S]', '2', 'http://storage.shopxx.net/demo-image/3.0/201301/4652d7ae-3d2c-4692-89ea-0ca81f50eac3-thumbnail.jpg', '<img alt=\"\" src=\"http://storage.shopxx.net/demo-image/3.0/201301/079fa1fd-cc63-4b41-803a-b27067ecac68.jpg\" />', '', '', '', '', null, '238.800000', null, '2', '2013-01-01 10:40:04', '0', '2013-01-01 15:49:07', '唯维欣怡2013春装新款韩版女装修身网纱长袖衬衣休闲女士白色衬衫', '199', '199.000000', '0', '0', '0', null, null, null, '201304409', null, null, '0', '件', '2', '2013-01-01 10:40:04', '0', '2013-01-01 15:49:07', null, null, '51', '17');
INSERT INTO `product` VALUES ('262', '2013-01-01 15:54:55', '2013-01-01 15:54:55', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '唯维欣怡2013春夏季新款韩版大码宽松显瘦女装荷叶边雪纺连衣裙子[黄色 XL]', '0', 'http://storage.shopxx.net/demo-image/3.0/201301/b499fb5e-999f-431b-a375-172ee09e4a3e-thumbnail.jpg', '<img alt=\"\" src=\"http://storage.shopxx.net/demo-image/3.0/201301/a220f774-c393-44f4-9b90-2245b54df481.jpg\" />', '', '', '', '', null, '247.200000', null, '0', '2013-01-01 15:54:54', '0', '2013-01-01 15:54:54', '唯维欣怡2013春夏季新款韩版大码宽松显瘦女装荷叶边雪纺连衣裙子', '206', '206.000000', '0', '0', '0', null, null, null, '201304410', null, null, '0', '件', '0', '2013-01-01 15:54:54', '0', '2013-01-01 15:54:54', null, null, '52', '11');
INSERT INTO `product` VALUES ('263', '2013-01-01 15:54:55', '2013-01-01 15:54:55', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '唯维欣怡2013春夏季新款韩版大码宽松显瘦女装荷叶边雪纺连衣裙子[黄色 XS]', '0', 'http://storage.shopxx.net/demo-image/3.0/201301/b499fb5e-999f-431b-a375-172ee09e4a3e-thumbnail.jpg', '<img alt=\"\" src=\"http://storage.shopxx.net/demo-image/3.0/201301/a220f774-c393-44f4-9b90-2245b54df481.jpg\" />', '', '', '', '', null, '247.200000', null, '0', '2013-01-01 15:54:54', '0', '2013-01-01 15:54:54', '唯维欣怡2013春夏季新款韩版大码宽松显瘦女装荷叶边雪纺连衣裙子', '206', '206.000000', '0', '0', '0', null, null, null, '201304411', null, null, '0', '件', '0', '2013-01-01 15:54:54', '0', '2013-01-01 15:54:54', null, null, '52', '11');
INSERT INTO `product` VALUES ('264', '2013-01-01 15:54:55', '2013-01-01 15:54:55', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '唯维欣怡2013春夏季新款韩版大码宽松显瘦女装荷叶边雪纺连衣裙子[红色 L]', '0', 'http://storage.shopxx.net/demo-image/3.0/201301/b499fb5e-999f-431b-a375-172ee09e4a3e-thumbnail.jpg', '<img alt=\"\" src=\"http://storage.shopxx.net/demo-image/3.0/201301/a220f774-c393-44f4-9b90-2245b54df481.jpg\" />', '', '', '', '', null, '247.200000', null, '0', '2013-01-01 15:54:54', '0', '2013-01-01 15:54:54', '唯维欣怡2013春夏季新款韩版大码宽松显瘦女装荷叶边雪纺连衣裙子', '206', '206.000000', '0', '0', '0', null, null, null, '201304412', null, null, '0', '件', '0', '2013-01-01 15:54:54', '0', '2013-01-01 15:54:54', null, null, '52', '11');
INSERT INTO `product` VALUES ('265', '2013-01-01 15:54:55', '2013-01-01 15:54:55', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '唯维欣怡2013春夏季新款韩版大码宽松显瘦女装荷叶边雪纺连衣裙子[红色 M]', '0', 'http://storage.shopxx.net/demo-image/3.0/201301/b499fb5e-999f-431b-a375-172ee09e4a3e-thumbnail.jpg', '<img alt=\"\" src=\"http://storage.shopxx.net/demo-image/3.0/201301/a220f774-c393-44f4-9b90-2245b54df481.jpg\" />', '', '', '', '', null, '247.200000', null, '0', '2013-01-01 15:54:54', '0', '2013-01-01 15:54:54', '唯维欣怡2013春夏季新款韩版大码宽松显瘦女装荷叶边雪纺连衣裙子', '206', '206.000000', '0', '0', '0', null, null, null, '201304413', null, null, '0', '件', '0', '2013-01-01 15:54:54', '0', '2013-01-01 15:54:54', null, null, '52', '11');
INSERT INTO `product` VALUES ('266', '2013-01-01 15:54:55', '2013-01-01 15:54:55', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '唯维欣怡2013春夏季新款韩版大码宽松显瘦女装荷叶边雪纺连衣裙子[黑色 L]', '0', 'http://storage.shopxx.net/demo-image/3.0/201301/b499fb5e-999f-431b-a375-172ee09e4a3e-thumbnail.jpg', '<img alt=\"\" src=\"http://storage.shopxx.net/demo-image/3.0/201301/a220f774-c393-44f4-9b90-2245b54df481.jpg\" />', '', '', '', '', null, '247.200000', null, '0', '2013-01-01 15:54:54', '0', '2013-01-01 15:54:54', '唯维欣怡2013春夏季新款韩版大码宽松显瘦女装荷叶边雪纺连衣裙子', '206', '206.000000', '0', '0', '0', null, null, null, '201304414', null, null, '0', '件', '0', '2013-01-01 15:54:54', '0', '2013-01-01 15:54:54', null, null, '52', '11');
INSERT INTO `product` VALUES ('267', '2013-01-01 15:54:55', '2013-01-01 10:40:04', '0', '雪纺', '短裙', null, null, null, null, null, null, null, null, null, null, '圆领', '宽松腰', null, null, null, null, null, null, null, '唯维欣怡2013春夏季新款韩版大码宽松显瘦女装荷叶边雪纺连衣裙子[黑色 S]', '4', 'http://storage.shopxx.net/demo-image/3.0/201301/b499fb5e-999f-431b-a375-172ee09e4a3e-thumbnail.jpg', '<img alt=\"\" src=\"http://storage.shopxx.net/demo-image/3.0/201301/a220f774-c393-44f4-9b90-2245b54df481.jpg\" />', '', '', '', '', null, '247.200000', null, '4', '2013-01-01 10:40:04', '0', '2013-01-01 15:54:54', '唯维欣怡2013春夏季新款韩版大码宽松显瘦女装荷叶边雪纺连衣裙子', '206', '206.000000', '0', '0', '0', null, null, null, '201304415', null, null, '0', '件', '4', '2013-01-01 10:40:04', '0', '2013-01-01 15:54:54', null, null, '52', '11');
INSERT INTO `product` VALUES ('268', '2013-01-01 16:11:19', '2013-01-01 21:43:58', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '唯维欣怡2013春夏季新款波西米亚女装中长款百褶蕾丝雪纺连衣裙子[黑色 L]', '1', 'http://storage.shopxx.net/demo-image/3.0/201301/1726166a-5f3b-4483-ab25-cb187fde78dd-thumbnail.jpg', '<img alt=\"\" src=\"http://storage.shopxx.net/demo-image/3.0/201301/06f71c39-0998-4909-bac9-dd3e4dffc1f8.jpg\" />', '', '', '', '', null, '322.790000', null, '1', '2013-01-01 21:43:58', '0', '2013-01-01 16:11:19', '唯维欣怡2013春夏季新款波西米亚女装中长款百褶蕾丝雪纺连衣裙子', '268', '268.990000', '0', '0', '0', null, null, null, '201304416', null, null, '0', '件', '1', '2013-01-01 21:43:58', '0', '2013-01-01 16:11:19', null, null, '53', '11');
INSERT INTO `product` VALUES ('269', '2013-01-01 16:11:19', '2013-01-01 21:43:58', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '唯维欣怡2013春夏季新款波西米亚女装中长款百褶蕾丝雪纺连衣裙子[黑色 M]', '1', 'http://storage.shopxx.net/demo-image/3.0/201301/1726166a-5f3b-4483-ab25-cb187fde78dd-thumbnail.jpg', '<img alt=\"\" src=\"http://storage.shopxx.net/demo-image/3.0/201301/06f71c39-0998-4909-bac9-dd3e4dffc1f8.jpg\" />', '', '', '', '', null, '322.790000', null, '1', '2013-01-01 21:43:58', '0', '2013-01-01 16:11:19', '唯维欣怡2013春夏季新款波西米亚女装中长款百褶蕾丝雪纺连衣裙子', '268', '268.990000', '0', '0', '0', null, null, null, '201304417', null, null, '0', '件', '1', '2013-01-01 21:43:58', '0', '2013-01-01 16:11:19', null, null, '53', '11');
INSERT INTO `product` VALUES ('270', '2013-01-01 16:11:19', '2013-01-01 16:11:19', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '唯维欣怡2013春夏季新款波西米亚女装中长款百褶蕾丝雪纺连衣裙子[白色 M]', '0', 'http://storage.shopxx.net/demo-image/3.0/201301/1726166a-5f3b-4483-ab25-cb187fde78dd-thumbnail.jpg', '<img alt=\"\" src=\"http://storage.shopxx.net/demo-image/3.0/201301/06f71c39-0998-4909-bac9-dd3e4dffc1f8.jpg\" />', '', '', '', '', null, '322.790000', null, '0', '2013-01-01 16:11:19', '0', '2013-01-01 16:11:19', '唯维欣怡2013春夏季新款波西米亚女装中长款百褶蕾丝雪纺连衣裙子', '268', '268.990000', '0', '0', '0', null, null, null, '201304418', null, null, '0', '件', '0', '2013-01-01 16:11:19', '0', '2013-01-01 16:11:19', null, null, '53', '11');
INSERT INTO `product` VALUES ('271', '2013-01-01 16:11:19', '2013-01-01 15:18:59', '0', '雪纺', '中长裙', null, null, null, null, null, null, null, null, null, null, '圆领', '松紧腰', null, null, null, null, null, null, null, '唯维欣怡2013春夏季新款波西米亚女装中长款百褶蕾丝雪纺连衣裙子[白色 S]', '10', 'http://storage.shopxx.net/demo-image/3.0/201301/1726166a-5f3b-4483-ab25-cb187fde78dd-thumbnail.jpg', '<img alt=\"\" src=\"http://storage.shopxx.net/demo-image/3.0/201301/06f71c39-0998-4909-bac9-dd3e4dffc1f8.jpg\" />', '', '', '', '', null, '322.790000', null, '1', '2013-01-01 15:18:59', '0', '2013-01-01 16:11:19', '唯维欣怡2013春夏季新款波西米亚女装中长款百褶蕾丝雪纺连衣裙子', '268', '268.990000', '0', '5', '1', null, null, null, '201304419', null, null, '5', '件', '1', '2013-01-01 15:18:59', '0', '2013-01-01 16:11:19', null, null, '53', '11');
INSERT INTO `product` VALUES ('272', '2013-01-01 16:56:59', '2013-01-01 16:56:59', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '尚都比拉2013夏装新款女装 春款蕾丝上衣 甜美打底衫雪纺衫衬衫女[黄色 L]', '0', 'http://storage.shopxx.net/demo-image/3.0/201301/ed261f1a-72b4-47f6-b6bf-a3c70485b833-thumbnail.jpg', '<img alt=\"\" src=\"http://storage.shopxx.net/demo-image/3.0/201301/17697145-1fee-4ebd-a52f-3c3274a5c2cc.jpg\" />', '', '', '', '', null, '238.800000', null, '0', '2013-01-01 16:56:59', '0', '2013-01-01 16:56:59', '尚都比拉2013夏装新款女装 春款蕾丝上衣 甜美打底衫雪纺衫衬衫女', '199', '199.000000', '0', '0', '0', null, null, null, '201304420', null, null, '0', '件', '0', '2013-01-01 16:56:59', '0', '2013-01-01 16:56:59', null, '3', '54', '17');
INSERT INTO `product` VALUES ('273', '2013-01-01 16:56:59', '2013-01-01 16:56:59', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '尚都比拉2013夏装新款女装 春款蕾丝上衣 甜美打底衫雪纺衫衬衫女[黄色 S]', '0', 'http://storage.shopxx.net/demo-image/3.0/201301/ed261f1a-72b4-47f6-b6bf-a3c70485b833-thumbnail.jpg', '<img alt=\"\" src=\"http://storage.shopxx.net/demo-image/3.0/201301/17697145-1fee-4ebd-a52f-3c3274a5c2cc.jpg\" />', '', '', '', '', null, '238.800000', null, '0', '2013-01-01 16:56:59', '0', '2013-01-01 16:56:59', '尚都比拉2013夏装新款女装 春款蕾丝上衣 甜美打底衫雪纺衫衬衫女', '199', '199.000000', '0', '0', '0', null, null, null, '201304421', null, null, '0', '件', '0', '2013-01-01 16:56:59', '0', '2013-01-01 16:56:59', null, '3', '54', '17');
INSERT INTO `product` VALUES ('274', '2013-01-01 16:56:59', '2013-01-01 16:56:59', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '尚都比拉2013夏装新款女装 春款蕾丝上衣 甜美打底衫雪纺衫衬衫女[白色 L]', '0', 'http://storage.shopxx.net/demo-image/3.0/201301/ed261f1a-72b4-47f6-b6bf-a3c70485b833-thumbnail.jpg', '<img alt=\"\" src=\"http://storage.shopxx.net/demo-image/3.0/201301/17697145-1fee-4ebd-a52f-3c3274a5c2cc.jpg\" />', '', '', '', '', null, '238.800000', null, '0', '2013-01-01 16:56:59', '0', '2013-01-01 16:56:59', '尚都比拉2013夏装新款女装 春款蕾丝上衣 甜美打底衫雪纺衫衬衫女', '199', '199.000000', '0', '0', '0', null, null, null, '201304422', null, null, '0', '件', '0', '2013-01-01 16:56:59', '0', '2013-01-01 16:56:59', null, '3', '54', '17');
INSERT INTO `product` VALUES ('275', '2013-01-01 16:56:59', '2013-01-01 10:40:04', '0', '直筒型', '涤纶', null, null, null, null, null, null, null, null, null, null, '通勤', '短款', null, null, null, null, null, null, null, '尚都比拉2013夏装新款女装 春款蕾丝上衣 甜美打底衫雪纺衫衬衫女[白色 M]', '3', 'http://storage.shopxx.net/demo-image/3.0/201301/ed261f1a-72b4-47f6-b6bf-a3c70485b833-thumbnail.jpg', '<img alt=\"\" src=\"http://storage.shopxx.net/demo-image/3.0/201301/17697145-1fee-4ebd-a52f-3c3274a5c2cc.jpg\" />', '', '', '', '', null, '238.800000', null, '3', '2013-01-01 10:40:04', '0', '2013-01-01 16:56:59', '尚都比拉2013夏装新款女装 春款蕾丝上衣 甜美打底衫雪纺衫衬衫女', '199', '199.000000', '0', '0', '0', null, null, null, '201304423', null, null, '0', '件', '3', '2013-01-01 10:40:04', '0', '2013-01-01 16:56:59', null, '3', '54', '17');
INSERT INTO `product` VALUES ('276', '2013-01-01 20:19:27', '2013-01-01 20:19:27', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '尚都比拉2013春夏装新款女装 春款修身女裙 蕾丝雪纺短袖连衣裙子[粉红色 XL]', '0', 'http://storage.shopxx.net/demo-image/3.0/201301/2553e635-7aa4-416a-83f4-5288145684a1-thumbnail.jpg', '<img src=\"http://storage.shopxx.net/demo-image/3.0/201301/97050cb4-e5a2-451e-8b71-a9b357486683.jpg\" alt=\"\" />', '', '', '', '', null, '319.200000', null, '0', '2013-01-01 20:19:27', '0', '2013-01-01 20:19:27', '尚都比拉2013春夏装新款女装 春款修身女裙 蕾丝雪纺短袖连衣裙子', '266', '266.000000', '0', '0', '0', null, null, null, '201304505', null, null, '0', '件', '0', '2013-01-01 20:19:27', '0', '2013-01-01 20:19:27', null, '3', '55', '11');
INSERT INTO `product` VALUES ('277', '2013-01-01 20:19:27', '2013-01-01 20:19:27', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '尚都比拉2013春夏装新款女装 春款修身女裙 蕾丝雪纺短袖连衣裙子[粉红色 L]', '0', 'http://storage.shopxx.net/demo-image/3.0/201301/2553e635-7aa4-416a-83f4-5288145684a1-thumbnail.jpg', '<img src=\"http://storage.shopxx.net/demo-image/3.0/201301/97050cb4-e5a2-451e-8b71-a9b357486683.jpg\" alt=\"\" />', '', '', '', '', null, '319.200000', null, '0', '2013-01-01 20:19:27', '0', '2013-01-01 20:19:27', '尚都比拉2013春夏装新款女装 春款修身女裙 蕾丝雪纺短袖连衣裙子', '266', '266.000000', '0', '0', '0', null, null, null, '201304506', null, null, '0', '件', '0', '2013-01-01 20:19:27', '0', '2013-01-01 20:19:27', null, '3', '55', '11');
INSERT INTO `product` VALUES ('278', '2013-01-01 20:19:27', '2013-01-01 20:19:27', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '尚都比拉2013春夏装新款女装 春款修身女裙 蕾丝雪纺短袖连衣裙子[粉红色 M]', '0', 'http://storage.shopxx.net/demo-image/3.0/201301/2553e635-7aa4-416a-83f4-5288145684a1-thumbnail.jpg', '<img src=\"http://storage.shopxx.net/demo-image/3.0/201301/97050cb4-e5a2-451e-8b71-a9b357486683.jpg\" alt=\"\" />', '', '', '', '', null, '319.200000', null, '0', '2013-01-01 20:19:27', '0', '2013-01-01 20:19:27', '尚都比拉2013春夏装新款女装 春款修身女裙 蕾丝雪纺短袖连衣裙子', '266', '266.000000', '0', '0', '0', null, null, null, '201304507', null, null, '0', '件', '0', '2013-01-01 20:19:27', '0', '2013-01-01 20:19:27', null, '3', '55', '11');
INSERT INTO `product` VALUES ('279', '2013-01-01 20:19:27', '2013-01-01 09:23:09', '0', '雪纺', '短裙', null, null, null, null, null, null, null, null, null, null, '圆领', '中腰', null, null, null, null, null, null, null, '尚都比拉2013春夏装新款女装 春款修身女裙 蕾丝雪纺短袖连衣裙子[粉红色 S]', '4', 'http://storage.shopxx.net/demo-image/3.0/201301/2553e635-7aa4-416a-83f4-5288145684a1-thumbnail.jpg', '<img alt=\"\" src=\"http://storage.shopxx.net/demo-image/3.0/201301/97050cb4-e5a2-451e-8b71-a9b357486683.jpg\" />', '', '', '', '', null, '319.200000', null, '1', '2013-01-01 09:23:09', '0', '2013-01-01 20:19:27', '尚都比拉2013春夏装新款女装 春款修身女裙 蕾丝雪纺短袖连衣裙子', '266', '266.000000', '0', '4', '1', null, null, null, '201304508', null, null, '4', '件', '1', '2013-01-01 09:23:09', '0', '2013-01-01 20:19:27', null, '3', '55', '11');
INSERT INTO `product` VALUES ('280', '2013-01-01 20:23:26', '2013-01-01 11:46:55', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '尚都比拉2013夏装新款 春款甜美淑女装 荷叶袖修身蕾丝雪纺连衣裙[白色 XL]', '0', 'http://storage.shopxx.net/demo-image/3.0/201301/750a9ce8-8c19-444d-b8cc-f3e7e786ec5d-thumbnail.jpg', '<img alt=\"\" src=\"http://storage.shopxx.net/demo-image/3.0/201301/03e24853-e228-4c09-b1c0-6939da94abc2.jpg\" />', '', '', '', '', null, '322.800000', null, '0', '2013-01-01 20:23:26', '0', '2013-01-01 20:23:26', '尚都比拉2013夏装新款 春款甜美淑女装 荷叶袖修身蕾丝雪纺连衣裙', '269', '269.000000', '0', '0', '0', null, null, null, '201304509', null, null, '0', '件', '0', '2013-01-01 20:23:26', '0', '2013-01-01 20:23:26', null, '3', '56', '11');
INSERT INTO `product` VALUES ('281', '2013-01-01 20:23:26', '2013-01-01 20:23:26', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '尚都比拉2013夏装新款 春款甜美淑女装 荷叶袖修身蕾丝雪纺连衣裙[白色 L]', '0', 'http://storage.shopxx.net/demo-image/3.0/201301/750a9ce8-8c19-444d-b8cc-f3e7e786ec5d-thumbnail.jpg', '<img src=\"http://storage.shopxx.net/demo-image/3.0/201301/03e24853-e228-4c09-b1c0-6939da94abc2.jpg\" alt=\"\" />', '', '', '', '', null, '322.800000', null, '0', '2013-01-01 20:23:26', '0', '2013-01-01 20:23:26', '尚都比拉2013夏装新款 春款甜美淑女装 荷叶袖修身蕾丝雪纺连衣裙', '269', '269.000000', '0', '0', '0', null, null, null, '201304510', null, null, '0', '件', '0', '2013-01-01 20:23:26', '0', '2013-01-01 20:23:26', null, '3', '56', '11');
INSERT INTO `product` VALUES ('282', '2013-01-01 20:23:26', '2013-01-01 15:18:59', '0', '蕾丝', '短裙', null, null, null, null, null, null, null, null, null, null, '圆领', '高腰', null, null, null, null, null, null, null, '尚都比拉2013夏装新款 春款甜美淑女装 荷叶袖修身蕾丝雪纺连衣裙[白色 M]', '4', 'http://storage.shopxx.net/demo-image/3.0/201301/750a9ce8-8c19-444d-b8cc-f3e7e786ec5d-thumbnail.jpg', '<img alt=\"\" src=\"http://storage.shopxx.net/demo-image/3.0/201301/03e24853-e228-4c09-b1c0-6939da94abc2.jpg\" />', '', '', '', '', null, '322.800000', null, '1', '2013-01-01 15:18:59', '0', '2013-01-01 20:23:26', '尚都比拉2013夏装新款 春款甜美淑女装 荷叶袖修身蕾丝雪纺连衣裙', '269', '269.000000', '0', '5', '1', null, null, null, '201304511', null, null, '5', '件', '1', '2013-01-01 15:18:59', '0', '2013-01-01 20:23:26', null, '3', '56', '11');
INSERT INTO `product` VALUES ('283', '2013-01-01 20:27:07', '2013-01-01 20:27:07', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '尚都比拉2013夏装新款 春款修身淑女装 雪纺短袖假两件套连衣裙子[绿色 XL]', '0', 'http://storage.shopxx.net/demo-image/3.0/201301/4a51167a-89d5-4710-aca2-7c76edc355b8-thumbnail.jpg', '<img src=\"http://storage.shopxx.net/demo-image/3.0/201301/c2093350-737f-4dbd-b378-e361af05c501.jpg\" alt=\"\" />', '', '', '', '', null, '322.800000', null, '0', '2013-01-01 20:27:07', '0', '2013-01-01 20:27:07', '尚都比拉2013夏装新款 春款修身淑女装 雪纺短袖假两件套连衣裙子', '269', '269.000000', '0', '0', '0', null, null, null, '201304512', null, null, '0', '件', '0', '2013-01-01 20:27:07', '0', '2013-01-01 20:27:07', null, '3', '57', '11');
INSERT INTO `product` VALUES ('284', '2013-01-01 20:27:07', '2013-01-01 20:27:07', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '尚都比拉2013夏装新款 春款修身淑女装 雪纺短袖假两件套连衣裙子[绿色 M]', '0', 'http://storage.shopxx.net/demo-image/3.0/201301/4a51167a-89d5-4710-aca2-7c76edc355b8-thumbnail.jpg', '<img src=\"http://storage.shopxx.net/demo-image/3.0/201301/c2093350-737f-4dbd-b378-e361af05c501.jpg\" alt=\"\" />', '', '', '', '', null, '322.800000', null, '0', '2013-01-01 20:27:07', '0', '2013-01-01 20:27:07', '尚都比拉2013夏装新款 春款修身淑女装 雪纺短袖假两件套连衣裙子', '269', '269.000000', '0', '0', '0', null, null, null, '201304513', null, null, '0', '件', '0', '2013-01-01 20:27:07', '0', '2013-01-01 20:27:07', null, '3', '57', '11');
INSERT INTO `product` VALUES ('285', '2013-01-01 20:27:07', '2013-01-01 09:23:09', '0', '雪纺', '短裙', null, null, null, null, null, null, null, null, null, null, '翻领', '中腰', null, null, null, null, null, null, null, '尚都比拉2013夏装新款 春款修身淑女装 雪纺短袖假两件套连衣裙子[绿色 S]', '5', 'http://storage.shopxx.net/demo-image/3.0/201301/4a51167a-89d5-4710-aca2-7c76edc355b8-thumbnail.jpg', '<img alt=\"\" src=\"http://storage.shopxx.net/demo-image/3.0/201301/c2093350-737f-4dbd-b378-e361af05c501.jpg\" />', '', '', '', '', null, '322.800000', null, '1', '2013-01-01 09:23:09', '0', '2013-01-01 20:27:07', '尚都比拉2013夏装新款 春款修身淑女装 雪纺短袖假两件套连衣裙子', '269', '269.000000', '0', '5', '1', null, null, null, '201304514', null, null, '5', '件', '1', '2013-01-01 09:23:09', '0', '2013-01-01 20:27:07', null, '3', '57', '11');
INSERT INTO `product` VALUES ('286', '2013-01-01 20:30:19', '2013-01-01 20:30:19', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '尚都比拉2013夏装新款 韩版优雅淑女装 七分袖蕾丝雪纺连衣裙春款[白色 M]', '0', 'http://storage.shopxx.net/demo-image/3.0/201301/059b5245-e3c8-43bf-80fe-700f0e4e68b8-thumbnail.jpg', '<img src=\"http://storage.shopxx.net/demo-image/3.0/201301/a6e9c936-9539-4788-b780-fbe78e1a8328.jpg\" alt=\"\" />', '', '', '', '', null, '406.800000', null, '0', '2013-01-01 20:30:19', '0', '2013-01-01 20:30:19', '尚都比拉2013夏装新款 韩版优雅淑女装 七分袖蕾丝雪纺连衣裙春款', '339', '339.000000', '0', '0', '0', null, null, null, '201304515', null, null, '0', '件', '0', '2013-01-01 20:30:19', '0', '2013-01-01 20:30:19', null, '3', '58', '11');
INSERT INTO `product` VALUES ('287', '2013-01-01 20:30:19', '2013-01-01 11:50:02', '0', '蕾丝', '短裙', null, null, null, null, null, null, null, null, null, null, '圆领', '中腰', null, null, null, null, null, null, null, '尚都比拉2013夏装新款 韩版优雅淑女装 七分袖蕾丝雪纺连衣裙春款[白色 S]', '5', 'http://storage.shopxx.net/demo-image/3.0/201301/059b5245-e3c8-43bf-80fe-700f0e4e68b8-thumbnail.jpg', '<img alt=\"\" src=\"http://storage.shopxx.net/demo-image/3.0/201301/a6e9c936-9539-4788-b780-fbe78e1a8328.jpg\" />', '', '', '', '', null, '406.800000', null, '5', '2013-01-01 11:16:33', '0', '2013-01-01 20:30:19', '尚都比拉2013夏装新款 韩版优雅淑女装 七分袖蕾丝雪纺连衣裙春款', '339', '339.000000', '0', '5', '1', null, null, null, '201304516', null, null, '5', '件', '5', '2013-01-01 11:16:33', '0', '2013-01-01 20:30:19', null, '3', '58', '11');
INSERT INTO `product` VALUES ('288', '2013-01-01 20:33:10', '2013-01-01 20:33:10', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '尚都比拉2013夏装新款 韩版优雅甜美淑女装 春款蕾丝雪纺连衣裙子[绿色 XL]', '0', 'http://storage.shopxx.net/demo-image/3.0/201301/51afeef5-f6cb-4936-abea-315cfca0edc0-thumbnail.jpg', '<img src=\"http://storage.shopxx.net/demo-image/3.0/201301/3247296d-f02a-4a44-9d0d-f3343c7d7ddc.jpg\" alt=\"\" />', '', '', '', '', null, '358.800000', null, '0', '2013-01-01 20:33:10', '0', '2013-01-01 20:33:10', '尚都比拉2013夏装新款 韩版优雅甜美淑女装 春款蕾丝雪纺连衣裙子', '299', '299.000000', '0', '0', '0', null, null, null, '201304517', null, null, '0', '件', '0', '2013-01-01 20:33:10', '0', '2013-01-01 20:33:10', null, '3', '59', '11');
INSERT INTO `product` VALUES ('289', '2013-01-01 20:33:10', '2013-01-01 20:33:10', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '尚都比拉2013夏装新款 韩版优雅甜美淑女装 春款蕾丝雪纺连衣裙子[绿色 L]', '0', 'http://storage.shopxx.net/demo-image/3.0/201301/51afeef5-f6cb-4936-abea-315cfca0edc0-thumbnail.jpg', '<img src=\"http://storage.shopxx.net/demo-image/3.0/201301/3247296d-f02a-4a44-9d0d-f3343c7d7ddc.jpg\" alt=\"\" />', '', '', '', '', null, '358.800000', null, '0', '2013-01-01 20:33:10', '0', '2013-01-01 20:33:10', '尚都比拉2013夏装新款 韩版优雅甜美淑女装 春款蕾丝雪纺连衣裙子', '299', '299.000000', '0', '0', '0', null, null, null, '201304518', null, null, '0', '件', '0', '2013-01-01 20:33:10', '0', '2013-01-01 20:33:10', null, '3', '59', '11');
INSERT INTO `product` VALUES ('290', '2013-01-01 20:33:10', '2013-01-01 09:23:09', '0', '蕾丝', '短裙', null, null, null, null, null, null, null, null, null, null, '翻领', '中腰', null, null, null, null, null, null, null, '尚都比拉2013夏装新款 韩版优雅甜美淑女装 春款蕾丝雪纺连衣裙子[绿色 M]', '8', 'http://storage.shopxx.net/demo-image/3.0/201301/51afeef5-f6cb-4936-abea-315cfca0edc0-thumbnail.jpg', '<img alt=\"\" src=\"http://storage.shopxx.net/demo-image/3.0/201301/3247296d-f02a-4a44-9d0d-f3343c7d7ddc.jpg\" />', '', '', '', '', null, '358.800000', null, '3', '2013-01-01 09:23:09', '0', '2013-01-01 20:33:10', '尚都比拉2013夏装新款 韩版优雅甜美淑女装 春款蕾丝雪纺连衣裙子', '299', '299.000000', '0', '5', '1', null, null, null, '201304519', null, null, '5', '件', '3', '2013-01-01 09:23:09', '0', '2013-01-01 20:33:10', null, '3', '59', '11');
INSERT INTO `product` VALUES ('291', '2013-01-01 20:35:57', '2013-01-01 20:35:57', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '尚都比拉2013夏装新款女装 韩版淑女装 蕾丝雪纺连衣裙 春款短袖[白色 L]', '0', 'http://storage.shopxx.net/demo-image/3.0/201301/93b9e55f-cbae-4c3c-b2f7-2636c7369db7-thumbnail.jpg', '<img src=\"http://storage.shopxx.net/demo-image/3.0/201301/48df372f-cb8c-41f3-8429-e76a9bf9cbb1.jpg\" alt=\"\" />', '', '', '', '', null, '310.800000', null, '0', '2013-01-01 20:35:57', '0', '2013-01-01 20:35:57', '尚都比拉2013夏装新款女装 韩版淑女装 蕾丝雪纺连衣裙 春款短袖', '259', '259.000000', '0', '0', '0', null, null, null, '201304520', null, null, '0', '件', '0', '2013-01-01 20:35:57', '0', '2013-01-01 20:35:57', null, '3', '60', '11');
INSERT INTO `product` VALUES ('292', '2013-01-01 20:35:57', '2013-01-01 20:35:57', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '尚都比拉2013夏装新款女装 韩版淑女装 蕾丝雪纺连衣裙 春款短袖[白色 M]', '0', 'http://storage.shopxx.net/demo-image/3.0/201301/93b9e55f-cbae-4c3c-b2f7-2636c7369db7-thumbnail.jpg', '<img src=\"http://storage.shopxx.net/demo-image/3.0/201301/48df372f-cb8c-41f3-8429-e76a9bf9cbb1.jpg\" alt=\"\" />', '', '', '', '', null, '310.800000', null, '0', '2013-01-01 20:35:57', '0', '2013-01-01 20:35:57', '尚都比拉2013夏装新款女装 韩版淑女装 蕾丝雪纺连衣裙 春款短袖', '259', '259.000000', '0', '0', '0', null, null, null, '201304521', null, null, '0', '件', '0', '2013-01-01 20:35:57', '0', '2013-01-01 20:35:57', null, '3', '60', '11');
INSERT INTO `product` VALUES ('293', '2013-01-01 20:35:57', '2013-01-01 09:23:09', '0', '雪纺', '中裙', null, null, null, null, null, null, null, null, null, null, '圆领', '中腰', null, null, null, null, null, null, null, '尚都比拉2013夏装新款女装 韩版淑女装 蕾丝雪纺连衣裙 春款短袖[白色 S]', '5', 'http://storage.shopxx.net/demo-image/3.0/201301/93b9e55f-cbae-4c3c-b2f7-2636c7369db7-thumbnail.jpg', '<img alt=\"\" src=\"http://storage.shopxx.net/demo-image/3.0/201301/48df372f-cb8c-41f3-8429-e76a9bf9cbb1.jpg\" />', '', '', '', '', null, '310.800000', null, '1', '2013-01-01 09:23:09', '0', '2013-01-01 20:35:57', '尚都比拉2013夏装新款女装 韩版淑女装 蕾丝雪纺连衣裙 春款短袖', '259', '259.000000', '0', '5', '1', null, null, null, '201304522', '0', null, '5', '件', '1', '2013-01-01 09:23:09', '0', '2013-01-01 20:35:57', null, '3', '60', '11');
INSERT INTO `product` VALUES ('294', '2013-01-01 20:38:40', '2013-01-01 20:38:40', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '尚都比拉2013夏装新款淑女装 春款森女系 碎花修身短袖蕾丝连衣裙[白色 XL]', '0', 'http://storage.shopxx.net/demo-image/3.0/201301/f37ba36a-181b-4161-a88f-f74c9adb485d-thumbnail.jpg', '<img src=\"http://storage.shopxx.net/demo-image/3.0/201301/58228b3e-1350-4d3c-b634-b630ef844b2a.jpg\" alt=\"\" />', '', '', '', '', null, '346.800000', null, '0', '2013-01-01 20:38:40', '0', '2013-01-01 20:38:40', '尚都比拉2013夏装新款淑女装 春款森女系 碎花修身短袖蕾丝连衣裙', '289', '289.000000', '0', '0', '0', null, null, null, '201304523', null, null, '0', '件', '0', '2013-01-01 20:38:40', '0', '2013-01-01 20:38:40', null, '3', '61', '11');
INSERT INTO `product` VALUES ('295', '2013-01-01 20:38:40', '2013-01-01 20:38:40', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '尚都比拉2013夏装新款淑女装 春款森女系 碎花修身短袖蕾丝连衣裙[白色 M]', '0', 'http://storage.shopxx.net/demo-image/3.0/201301/f37ba36a-181b-4161-a88f-f74c9adb485d-thumbnail.jpg', '<img src=\"http://storage.shopxx.net/demo-image/3.0/201301/58228b3e-1350-4d3c-b634-b630ef844b2a.jpg\" alt=\"\" />', '', '', '', '', null, '346.800000', null, '0', '2013-01-01 20:38:40', '0', '2013-01-01 20:38:40', '尚都比拉2013夏装新款淑女装 春款森女系 碎花修身短袖蕾丝连衣裙', '289', '289.000000', '0', '0', '0', null, null, null, '201304524', null, null, '0', '件', '0', '2013-01-01 20:38:40', '0', '2013-01-01 20:38:40', null, '3', '61', '11');
INSERT INTO `product` VALUES ('296', '2013-01-01 20:38:40', '2013-01-01 20:38:40', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '尚都比拉2013夏装新款淑女装 春款森女系 碎花修身短袖蕾丝连衣裙[粉红色 L]', '0', 'http://storage.shopxx.net/demo-image/3.0/201301/f37ba36a-181b-4161-a88f-f74c9adb485d-thumbnail.jpg', '<img src=\"http://storage.shopxx.net/demo-image/3.0/201301/58228b3e-1350-4d3c-b634-b630ef844b2a.jpg\" alt=\"\" />', '', '', '', '', null, '346.800000', null, '0', '2013-01-01 20:38:40', '0', '2013-01-01 20:38:40', '尚都比拉2013夏装新款淑女装 春款森女系 碎花修身短袖蕾丝连衣裙', '289', '289.000000', '0', '0', '0', null, null, null, '201304525', null, null, '0', '件', '0', '2013-01-01 20:38:40', '0', '2013-01-01 20:38:40', null, '3', '61', '11');
INSERT INTO `product` VALUES ('297', '2013-01-01 20:38:40', '2013-01-01 20:38:40', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '尚都比拉2013夏装新款淑女装 春款森女系 碎花修身短袖蕾丝连衣裙[粉红色 M]', '0', 'http://storage.shopxx.net/demo-image/3.0/201301/f37ba36a-181b-4161-a88f-f74c9adb485d-thumbnail.jpg', '<img src=\"http://storage.shopxx.net/demo-image/3.0/201301/58228b3e-1350-4d3c-b634-b630ef844b2a.jpg\" alt=\"\" />', '', '', '', '', null, '346.800000', null, '0', '2013-01-01 20:38:40', '0', '2013-01-01 20:38:40', '尚都比拉2013夏装新款淑女装 春款森女系 碎花修身短袖蕾丝连衣裙', '289', '289.000000', '0', '0', '0', null, null, null, '201304526', null, null, '0', '件', '0', '2013-01-01 20:38:40', '0', '2013-01-01 20:38:40', null, '3', '61', '11');
INSERT INTO `product` VALUES ('298', '2013-01-01 20:38:40', '2013-01-01 15:18:59', '0', '蕾丝', '短裙', null, null, null, null, null, null, null, null, null, null, '圆领', '中腰', null, null, null, null, null, null, null, '尚都比拉2013夏装新款淑女装 春款森女系 碎花修身短袖蕾丝连衣裙[粉红色 S]', '5', 'http://storage.shopxx.net/demo-image/3.0/201301/f37ba36a-181b-4161-a88f-f74c9adb485d-thumbnail.jpg', '<img alt=\"\" src=\"http://storage.shopxx.net/demo-image/3.0/201301/58228b3e-1350-4d3c-b634-b630ef844b2a.jpg\" />', '', '', '', '', null, '346.800000', null, '2', '2013-01-01 15:18:59', '0', '2013-01-01 20:38:40', '尚都比拉2013夏装新款淑女装 春款森女系 碎花修身短袖蕾丝连衣裙', '289', '289.000000', '0', '4', '1', null, null, null, '201304527', null, null, '4', '件', '2', '2013-01-01 15:18:59', '0', '2013-01-01 20:38:40', null, '3', '61', '11');
INSERT INTO `product` VALUES ('299', '2013-01-01 20:41:17', '2013-01-01 12:00:02', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '尚都比拉女装2013夏装新款蕾丝连衣裙 韩版修身雪纺打底裙子 春款[白色 L]', '2', 'http://storage.shopxx.net/demo-image/3.0/201301/0ff130db-0a1b-4b8d-a918-ed9016317009-thumbnail.jpg', '<img alt=\"\" src=\"http://storage.shopxx.net/demo-image/3.0/201301/a8cbb713-9024-458f-861a-5f83db39a431.jpg\" />', '', '', '', '', null, '357.600000', null, '2', '2013-01-01 09:47:04', '0', '2013-01-01 20:41:17', '尚都比拉女装2013夏装新款蕾丝连衣裙 韩版修身雪纺打底裙子 春款', '298', '298.000000', '0', '0', '0', null, null, null, '201304528', null, null, '0', '件', '2', '2013-01-01 09:47:04', '0', '2013-01-01 20:41:17', null, '3', '62', '11');
INSERT INTO `product` VALUES ('300', '2013-01-01 20:41:17', '2013-01-01 09:23:09', '0', '蕾丝', '短裙', null, null, null, null, null, null, null, null, null, null, '娃娃领', '中腰', null, null, null, null, null, null, null, '尚都比拉女装2013夏装新款蕾丝连衣裙 韩版修身雪纺打底裙子 春款[白色 M]', '4', 'http://storage.shopxx.net/demo-image/3.0/201301/0ff130db-0a1b-4b8d-a918-ed9016317009-thumbnail.jpg', '<img alt=\"\" src=\"http://storage.shopxx.net/demo-image/3.0/201301/a8cbb713-9024-458f-861a-5f83db39a431.jpg\" />', '', '', '', '', null, '357.600000', null, '1', '2013-01-01 09:23:09', '0', '2013-01-01 20:41:16', '尚都比拉女装2013夏装新款蕾丝连衣裙 韩版修身雪纺打底裙子 春款', '298', '298.000000', '0', '0', '0', null, null, null, '201304529', null, null, '0', '件', '1', '2013-01-01 09:23:09', '0', '2013-01-01 20:41:16', null, '3', '62', '11');
INSERT INTO `product_category` VALUES ('1', '2013-01-01 09:34:45', '2013-01-01 09:34:45', '1', '0', '时尚女装', null, null, null, ',', null);
INSERT INTO `product_category` VALUES ('2', '2013-01-01 09:35:05', '2013-01-01 09:35:05', '2', '0', '精品男装', null, null, null, ',', null);
INSERT INTO `product_category` VALUES ('3', '2013-01-01 09:35:18', '2013-01-01 09:35:18', '3', '0', '精致内衣', null, null, null, ',', null);
INSERT INTO `product_category` VALUES ('4', '2013-01-01 09:35:35', '2013-01-01 09:35:35', '4', '0', '服饰配件', null, null, null, ',', null);
INSERT INTO `product_category` VALUES ('5', '2013-01-01 09:35:53', '2013-01-01 09:42:53', '5', '0', '时尚女鞋', null, null, null, ',', null);
INSERT INTO `product_category` VALUES ('6', '2013-01-01 09:36:06', '2013-01-01 09:42:58', '6', '0', '流行男鞋', null, null, null, ',', null);
INSERT INTO `product_category` VALUES ('7', '2013-01-01 09:36:14', '2013-01-01 09:43:02', '7', '0', '潮流女包', null, null, null, ',', null);
INSERT INTO `product_category` VALUES ('8', '2013-01-01 09:36:24', '2013-01-01 09:43:07', '8', '0', '精品男包', null, null, null, ',', null);
INSERT INTO `product_category` VALUES ('9', '2013-01-01 09:37:03', '2013-01-01 09:43:11', '9', '0', '童装童鞋', null, null, null, ',', null);
INSERT INTO `product_category` VALUES ('10', '2013-01-01 09:41:17', '2013-01-01 10:27:05', '10', '0', '时尚饰品', null, null, null, ',', null);
INSERT INTO `product_category` VALUES ('11', '2013-01-01 09:45:22', '2013-01-01 09:49:32', '1', '1', '连衣裙', null, null, null, ',1,', '1');
INSERT INTO `product_category` VALUES ('12', '2013-01-01 09:45:33', '2013-01-01 09:49:39', '2', '1', '针织衫', null, null, null, ',1,', '1');
INSERT INTO `product_category` VALUES ('13', '2013-01-01 09:45:41', '2013-01-01 09:51:19', '3', '1', '短外套', null, null, null, ',1,', '1');
INSERT INTO `product_category` VALUES ('14', '2013-01-01 09:49:47', '2013-01-01 09:49:47', '4', '1', '小西装', null, null, null, ',1,', '1');
INSERT INTO `product_category` VALUES ('15', '2013-01-01 09:49:57', '2013-01-01 09:49:57', '5', '1', '牛仔裤', null, null, null, ',1,', '1');
INSERT INTO `product_category` VALUES ('16', '2013-01-01 09:50:03', '2013-01-01 09:50:03', '6', '1', 'T恤', null, null, null, ',1,', '1');
INSERT INTO `product_category` VALUES ('17', '2013-01-01 09:50:13', '2013-01-01 09:50:13', '7', '1', '衬衫', null, null, null, ',1,', '1');
INSERT INTO `product_category` VALUES ('18', '2013-01-01 09:50:19', '2013-01-01 09:50:19', '8', '1', '风衣', null, null, null, ',1,', '1');
INSERT INTO `product_category` VALUES ('19', '2013-01-01 09:50:34', '2013-01-01 09:50:34', '9', '1', '卫衣', null, null, null, ',1,', '1');
INSERT INTO `product_category` VALUES ('20', '2013-01-01 09:54:33', '2013-01-01 09:54:39', '10', '1', '裤子', null, null, null, ',1,', '1');
INSERT INTO `product_category` VALUES ('21', '2013-01-01 09:56:15', '2013-01-01 09:56:15', '1', '1', '针织衫', null, null, null, ',2,', '2');
INSERT INTO `product_category` VALUES ('22', '2013-01-01 09:56:43', '2013-01-01 09:56:43', '2', '1', 'POLO衫', null, null, null, ',2,', '2');
INSERT INTO `product_category` VALUES ('23', '2013-01-01 09:57:09', '2013-01-01 09:57:09', '3', '1', '休闲裤', null, null, null, ',2,', '2');
INSERT INTO `product_category` VALUES ('24', '2013-01-01 09:57:19', '2013-01-01 09:57:19', '4', '1', '牛仔裤', null, null, null, ',2,', '2');
INSERT INTO `product_category` VALUES ('25', '2013-01-01 09:57:43', '2013-01-01 09:57:43', '5', '1', 'T恤', null, null, null, ',2,', '2');
INSERT INTO `product_category` VALUES ('26', '2013-01-01 09:57:49', '2013-01-01 09:57:53', '6', '1', '衬衫', null, null, null, ',2,', '2');
INSERT INTO `product_category` VALUES ('27', '2013-01-01 09:58:07', '2013-01-01 09:58:07', '7', '1', '西服', null, null, null, ',2,', '2');
INSERT INTO `product_category` VALUES ('28', '2013-01-01 09:58:14', '2013-01-01 09:58:14', '8', '1', '西裤', null, null, null, ',2,', '2');
INSERT INTO `product_category` VALUES ('29', '2013-01-01 09:58:30', '2013-01-01 09:58:30', '9', '1', '风衣', null, null, null, ',2,', '2');
INSERT INTO `product_category` VALUES ('30', '2013-01-01 09:58:36', '2013-01-01 09:58:36', '10', '1', '卫衣', null, null, null, ',2,', '2');
INSERT INTO `product_category` VALUES ('31', '2013-01-01 10:01:01', '2013-01-01 10:01:01', '1', '1', '女式内裤', null, null, null, ',3,', '3');
INSERT INTO `product_category` VALUES ('32', '2013-01-01 10:01:11', '2013-01-01 10:01:11', '2', '1', '男式内裤', null, null, null, ',3,', '3');
INSERT INTO `product_category` VALUES ('33', '2013-01-01 10:01:20', '2013-01-01 10:01:20', '3', '1', '保暖内衣', null, null, null, ',3,', '3');
INSERT INTO `product_category` VALUES ('34', '2013-01-01 10:01:36', '2013-01-01 10:01:36', '4', '1', '塑身衣', null, null, null, ',3,', '3');
INSERT INTO `product_category` VALUES ('35', '2013-01-01 10:01:55', '2013-01-01 10:01:55', '5', '1', '连裤袜', null, null, null, ',3,', '3');
INSERT INTO `product_category` VALUES ('36', '2013-01-01 10:03:48', '2013-01-01 10:03:48', '6', '1', '打底袜', null, null, null, ',3,', '3');
INSERT INTO `product_category` VALUES ('37', '2013-01-01 10:05:03', '2013-01-01 10:05:10', '7', '1', '文胸', null, null, null, ',3,', '3');
INSERT INTO `product_category` VALUES ('38', '2013-01-01 10:06:25', '2013-01-01 10:06:25', '8', '1', '睡衣', null, null, null, ',3,', '3');
INSERT INTO `product_category` VALUES ('39', '2013-01-01 10:06:53', '2013-01-01 10:06:53', '9', '1', '泳装', null, null, null, ',3,', '3');
INSERT INTO `product_category` VALUES ('40', '2013-01-01 10:07:55', '2013-01-01 10:08:21', '10', '1', '浴袍', null, null, null, ',3,', '3');
INSERT INTO `product_category` VALUES ('41', '2013-01-01 10:09:46', '2013-01-01 10:09:46', '1', '1', '女士腰带', null, null, null, ',4,', '4');
INSERT INTO `product_category` VALUES ('42', '2013-01-01 10:09:53', '2013-01-01 10:09:53', '2', '1', '男士皮带', null, null, null, ',4,', '4');
INSERT INTO `product_category` VALUES ('43', '2013-01-01 10:10:01', '2013-01-01 10:10:01', '3', '1', '女士围巾', null, null, null, ',4,', '4');
INSERT INTO `product_category` VALUES ('44', '2013-01-01 10:10:08', '2013-01-01 10:10:08', '4', '1', '男士围巾', null, null, null, ',4,', '4');
INSERT INTO `product_category` VALUES ('45', '2013-01-01 10:10:15', '2013-01-01 10:10:15', '5', '1', '帽子', null, null, null, ',4,', '4');
INSERT INTO `product_category` VALUES ('46', '2013-01-01 10:10:22', '2013-01-01 10:10:22', '6', '1', '手套', null, null, null, ',4,', '4');
INSERT INTO `product_category` VALUES ('47', '2013-01-01 10:10:31', '2013-01-01 10:10:31', '7', '1', '领带', null, null, null, ',4,', '4');
INSERT INTO `product_category` VALUES ('48', '2013-01-01 10:11:41', '2013-01-01 10:11:41', '8', '1', '领结', null, null, null, ',4,', '4');
INSERT INTO `product_category` VALUES ('49', '2013-01-01 10:41:07', '2013-01-01 10:41:07', '9', '1', '发饰', null, null, null, ',4,', '4');
INSERT INTO `product_category` VALUES ('50', '2013-01-01 10:41:17', '2013-01-01 10:41:17', '10', '1', '袖扣', null, null, null, ',4,', '4');
INSERT INTO `product_category` VALUES ('51', '2013-01-01 10:13:50', '2013-01-01 10:13:50', '1', '1', '高帮鞋', null, null, null, ',5,', '5');
INSERT INTO `product_category` VALUES ('52', '2013-01-01 10:14:00', '2013-01-01 10:14:00', '2', '1', '雪地靴', null, null, null, ',5,', '5');
INSERT INTO `product_category` VALUES ('53', '2013-01-01 10:14:22', '2013-01-01 10:14:22', '3', '1', '中筒靴', null, null, null, ',5,', '5');
INSERT INTO `product_category` VALUES ('54', '2013-01-01 10:14:50', '2013-01-01 10:14:50', '4', '1', '单鞋', null, null, null, ',5,', '5');
INSERT INTO `product_category` VALUES ('55', '2013-01-01 10:15:05', '2013-01-01 10:15:05', '5', '1', '凉鞋', null, null, null, ',5,', '5');
INSERT INTO `product_category` VALUES ('56', '2013-01-01 10:15:13', '2013-01-01 10:15:13', '6', '1', '靴子', null, null, null, ',5,', '5');
INSERT INTO `product_category` VALUES ('57', '2013-01-01 10:15:19', '2013-01-01 10:15:19', '7', '1', '短靴', null, null, null, ',5,', '5');
INSERT INTO `product_category` VALUES ('58', '2013-01-01 10:15:37', '2013-01-01 10:15:37', '8', '1', '雨靴', null, null, null, ',5,', '5');
INSERT INTO `product_category` VALUES ('59', '2013-01-01 10:17:37', '2013-01-01 10:17:37', '1', '1', '低帮鞋', null, null, null, ',6,', '6');
INSERT INTO `product_category` VALUES ('60', '2013-01-01 10:17:50', '2013-01-01 10:17:50', '2', '1', '高帮鞋', null, null, null, ',6,', '6');
INSERT INTO `product_category` VALUES ('61', '2013-01-01 10:18:28', '2013-01-01 10:18:28', '3', '1', '休闲鞋', null, null, null, ',6,', '6');
INSERT INTO `product_category` VALUES ('62', '2013-01-01 10:18:36', '2013-01-01 10:18:36', '4', '1', '正装鞋', null, null, null, ',6,', '6');
INSERT INTO `product_category` VALUES ('63', '2013-01-01 10:19:38', '2013-01-01 10:19:38', '1', '1', '单肩包', null, null, null, ',7,', '7');
INSERT INTO `product_category` VALUES ('64', '2013-01-01 10:19:50', '2013-01-01 10:19:50', '2', '1', '双肩包', null, null, null, ',7,', '7');
INSERT INTO `product_category` VALUES ('65', '2013-01-01 10:20:01', '2013-01-01 10:20:01', '3', '1', '手提包', null, null, null, ',7,', '7');
INSERT INTO `product_category` VALUES ('66', '2013-01-01 10:20:10', '2013-01-01 10:20:10', '4', '1', '手拿包', null, null, null, ',7,', '7');
INSERT INTO `product_category` VALUES ('67', '2013-01-01 10:21:39', '2013-01-01 10:21:39', '1', '1', '单肩男', null, null, null, ',8,', '8');
INSERT INTO `product_category` VALUES ('68', '2013-01-01 10:21:47', '2013-01-01 10:21:47', '2', '1', '双肩包', null, null, null, ',8,', '8');
INSERT INTO `product_category` VALUES ('69', '2013-01-01 10:21:59', '2013-01-01 10:21:59', '3', '1', '手提包', null, null, null, ',8,', '8');
INSERT INTO `product_category` VALUES ('70', '2013-01-01 10:22:15', '2013-01-01 10:22:15', '4', '1', '手拿包', null, null, null, ',8,', '8');
INSERT INTO `product_category` VALUES ('71', '2013-01-01 10:23:55', '2013-01-01 10:23:55', '1', '1', '运动鞋', null, null, null, ',9,', '9');
INSERT INTO `product_category` VALUES ('72', '2013-01-01 10:24:02', '2013-01-01 10:24:02', '2', '1', '牛仔裤', null, null, null, ',9,', '9');
INSERT INTO `product_category` VALUES ('73', '2013-01-01 10:24:11', '2013-01-01 10:24:11', '3', '1', '套装', null, null, null, ',9,', '9');
INSERT INTO `product_category` VALUES ('74', '2013-01-01 10:24:19', '2013-01-01 10:24:19', '4', '1', '裤子', null, null, null, ',9,', '9');
INSERT INTO `product_category` VALUES ('75', '2013-01-01 10:28:31', '2013-01-01 10:28:31', '1', '1', '项链', null, null, null, ',10,', '10');
INSERT INTO `product_category` VALUES ('76', '2013-01-01 10:28:37', '2013-01-01 10:28:37', '2', '1', '手链', null, null, null, ',10,', '10');
INSERT INTO `product_category` VALUES ('77', '2013-01-01 10:28:43', '2013-01-01 10:28:43', '3', '1', '戒指', null, null, null, ',10,', '10');
INSERT INTO `product_category` VALUES ('78', '2013-01-01 10:28:51', '2013-01-01 10:28:51', '4', '1', '耳饰', null, null, null, ',10,', '10');
INSERT INTO `product_parameter_value` VALUES ('1', '通勤', '1');
INSERT INTO `product_parameter_value` VALUES ('1', '两件套', '3');
INSERT INTO `product_parameter_value` VALUES ('1', '短裙(76-90厘米)', '4');
INSERT INTO `product_parameter_value` VALUES ('1', '其他款式', '5');
INSERT INTO `product_parameter_value` VALUES ('1', '短袖', '6');
INSERT INTO `product_parameter_value` VALUES ('1', '圆领', '7');
INSERT INTO `product_parameter_value` VALUES ('1', '常规袖', '8');
INSERT INTO `product_parameter_value` VALUES ('1', '中腰', '9');
INSERT INTO `product_parameter_value` VALUES ('1', '拉链', '10');
INSERT INTO `product_parameter_value` VALUES ('1', '花色', '12');
INSERT INTO `product_parameter_value` VALUES ('1', '蕾丝', '14');
INSERT INTO `product_parameter_value` VALUES ('1', '81%-90%', '15');
INSERT INTO `product_parameter_value` VALUES ('1', '聚酯纤维', '16');
INSERT INTO `product_parameter_value` VALUES ('2', '修身型', '107');
INSERT INTO `product_parameter_value` VALUES ('2', '薄款', '108');
INSERT INTO `product_parameter_value` VALUES ('2', '通勤', '109');
INSERT INTO `product_parameter_value` VALUES ('2', '通勤', '110');
INSERT INTO `product_parameter_value` VALUES ('2', '中长款(65cm<衣长≤80cm)', '111');
INSERT INTO `product_parameter_value` VALUES ('2', '七分袖', '112');
INSERT INTO `product_parameter_value` VALUES ('2', '翻领/POLO领', '113');
INSERT INTO `product_parameter_value` VALUES ('2', '泡泡袖', '114');
INSERT INTO `product_parameter_value` VALUES ('2', '双排扣', '115');
INSERT INTO `product_parameter_value` VALUES ('2', '纯色', '116');
INSERT INTO `product_parameter_value` VALUES ('2', '明线装饰 流苏 高温定', '117');
INSERT INTO `product_parameter_value` VALUES ('2', '棉', '118');
INSERT INTO `product_parameter_value` VALUES ('2', '81%-90%', '119');
INSERT INTO `product_parameter_value` VALUES ('2', '涤纶', '120');
INSERT INTO `product_parameter_value` VALUES ('3', '通勤', '1');
INSERT INTO `product_parameter_value` VALUES ('3', '韩版', '2');
INSERT INTO `product_parameter_value` VALUES ('3', '两件套', '3');
INSERT INTO `product_parameter_value` VALUES ('3', '长裙(大于126厘米)', '4');
INSERT INTO `product_parameter_value` VALUES ('3', '其他款式', '5');
INSERT INTO `product_parameter_value` VALUES ('3', '短袖', '6');
INSERT INTO `product_parameter_value` VALUES ('3', '半开领', '7');
INSERT INTO `product_parameter_value` VALUES ('3', '常规袖', '8');
INSERT INTO `product_parameter_value` VALUES ('3', '中腰', '9');
INSERT INTO `product_parameter_value` VALUES ('3', '套头', '10');
INSERT INTO `product_parameter_value` VALUES ('3', '百褶裙', '11');
INSERT INTO `product_parameter_value` VALUES ('3', '纯色', '12');
INSERT INTO `product_parameter_value` VALUES ('3', '褶皱 绑带', '13');
INSERT INTO `product_parameter_value` VALUES ('3', '雪纺', '14');
INSERT INTO `product_parameter_value` VALUES ('3', '95%以上', '15');
INSERT INTO `product_parameter_value` VALUES ('3', '聚酯纤维', '16');
INSERT INTO `product_parameter_value` VALUES ('4', '长袖（袖长>57cm）', '43');
INSERT INTO `product_parameter_value` VALUES ('4', '修身型', '44');
INSERT INTO `product_parameter_value` VALUES ('4', '方领', '45');
INSERT INTO `product_parameter_value` VALUES ('4', '英伦风格', '46');
INSERT INTO `product_parameter_value` VALUES ('4', '纯色布', '47');
INSERT INTO `product_parameter_value` VALUES ('4', '纯色', '48');
INSERT INTO `product_parameter_value` VALUES ('4', '棉质', '49');
INSERT INTO `product_parameter_value` VALUES ('4', '95%以上', '50');
INSERT INTO `product_parameter_value` VALUES ('4', '2013', '51');
INSERT INTO `product_parameter_value` VALUES ('4', '春', '52');
INSERT INTO `product_parameter_value` VALUES ('4', '青年', '53');
INSERT INTO `product_parameter_value` VALUES ('5', '长袖（袖长>57cm）', '43');
INSERT INTO `product_parameter_value` VALUES ('5', '修身型', '44');
INSERT INTO `product_parameter_value` VALUES ('5', '方领', '45');
INSERT INTO `product_parameter_value` VALUES ('5', '英伦风格', '46');
INSERT INTO `product_parameter_value` VALUES ('5', '纯色布', '47');
INSERT INTO `product_parameter_value` VALUES ('5', '纯色', '48');
INSERT INTO `product_parameter_value` VALUES ('5', '棉质', '49');
INSERT INTO `product_parameter_value` VALUES ('5', '95%以上', '50');
INSERT INTO `product_parameter_value` VALUES ('5', '2013', '51');
INSERT INTO `product_parameter_value` VALUES ('5', '春', '52');
INSERT INTO `product_parameter_value` VALUES ('5', '青年', '53');
INSERT INTO `product_parameter_value` VALUES ('6', '长袖（袖长>57cm）', '43');
INSERT INTO `product_parameter_value` VALUES ('6', '修身型', '44');
INSERT INTO `product_parameter_value` VALUES ('6', '方领', '45');
INSERT INTO `product_parameter_value` VALUES ('6', '英伦风格', '46');
INSERT INTO `product_parameter_value` VALUES ('6', '纯色布', '47');
INSERT INTO `product_parameter_value` VALUES ('6', '纯色', '48');
INSERT INTO `product_parameter_value` VALUES ('6', '棉质', '49');
INSERT INTO `product_parameter_value` VALUES ('6', '95%以上', '50');
INSERT INTO `product_parameter_value` VALUES ('6', '2013', '51');
INSERT INTO `product_parameter_value` VALUES ('6', '春', '52');
INSERT INTO `product_parameter_value` VALUES ('6', '青年', '53');
INSERT INTO `product_parameter_value` VALUES ('7', '长袖（袖长>57cm）', '43');
INSERT INTO `product_parameter_value` VALUES ('7', '修身型', '44');
INSERT INTO `product_parameter_value` VALUES ('7', '方领', '45');
INSERT INTO `product_parameter_value` VALUES ('7', '英伦风格', '46');
INSERT INTO `product_parameter_value` VALUES ('7', '纯色布', '47');
INSERT INTO `product_parameter_value` VALUES ('7', '纯色', '48');
INSERT INTO `product_parameter_value` VALUES ('7', '棉质', '49');
INSERT INTO `product_parameter_value` VALUES ('7', '95%以上', '50');
INSERT INTO `product_parameter_value` VALUES ('7', '2013', '51');
INSERT INTO `product_parameter_value` VALUES ('7', '春', '52');
INSERT INTO `product_parameter_value` VALUES ('7', '青年', '53');
INSERT INTO `product_parameter_value` VALUES ('8', '通勤', '1');
INSERT INTO `product_parameter_value` VALUES ('8', '韩版', '2');
INSERT INTO `product_parameter_value` VALUES ('8', '两件套', '3');
INSERT INTO `product_parameter_value` VALUES ('8', '长裙(大于126厘米)', '4');
INSERT INTO `product_parameter_value` VALUES ('8', '其他款式', '5');
INSERT INTO `product_parameter_value` VALUES ('8', '短袖', '6');
INSERT INTO `product_parameter_value` VALUES ('8', '半开领', '7');
INSERT INTO `product_parameter_value` VALUES ('8', '常规袖', '8');
INSERT INTO `product_parameter_value` VALUES ('8', '中腰', '9');
INSERT INTO `product_parameter_value` VALUES ('8', '套头', '10');
INSERT INTO `product_parameter_value` VALUES ('8', '百褶裙', '11');
INSERT INTO `product_parameter_value` VALUES ('8', '纯色', '12');
INSERT INTO `product_parameter_value` VALUES ('8', '褶皱 绑带', '13');
INSERT INTO `product_parameter_value` VALUES ('8', '雪纺', '14');
INSERT INTO `product_parameter_value` VALUES ('8', '95%以上', '15');
INSERT INTO `product_parameter_value` VALUES ('8', '聚酯纤维', '16');
INSERT INTO `product_parameter_value` VALUES ('9', '通勤', '1');
INSERT INTO `product_parameter_value` VALUES ('9', '韩版', '2');
INSERT INTO `product_parameter_value` VALUES ('9', '两件套', '3');
INSERT INTO `product_parameter_value` VALUES ('9', '长裙(大于126厘米)', '4');
INSERT INTO `product_parameter_value` VALUES ('9', '其他款式', '5');
INSERT INTO `product_parameter_value` VALUES ('9', '短袖', '6');
INSERT INTO `product_parameter_value` VALUES ('9', '半开领', '7');
INSERT INTO `product_parameter_value` VALUES ('9', '常规袖', '8');
INSERT INTO `product_parameter_value` VALUES ('9', '中腰', '9');
INSERT INTO `product_parameter_value` VALUES ('9', '套头', '10');
INSERT INTO `product_parameter_value` VALUES ('9', '百褶裙', '11');
INSERT INTO `product_parameter_value` VALUES ('9', '纯色', '12');
INSERT INTO `product_parameter_value` VALUES ('9', '褶皱 绑带', '13');
INSERT INTO `product_parameter_value` VALUES ('9', '雪纺', '14');
INSERT INTO `product_parameter_value` VALUES ('9', '95%以上', '15');
INSERT INTO `product_parameter_value` VALUES ('9', '聚酯纤维', '16');
INSERT INTO `product_parameter_value` VALUES ('10', '通勤', '1');
INSERT INTO `product_parameter_value` VALUES ('10', '韩版', '2');
INSERT INTO `product_parameter_value` VALUES ('10', '两件套', '3');
INSERT INTO `product_parameter_value` VALUES ('10', '长裙(大于126厘米)', '4');
INSERT INTO `product_parameter_value` VALUES ('10', '其他款式', '5');
INSERT INTO `product_parameter_value` VALUES ('10', '短袖', '6');
INSERT INTO `product_parameter_value` VALUES ('10', '半开领', '7');
INSERT INTO `product_parameter_value` VALUES ('10', '常规袖', '8');
INSERT INTO `product_parameter_value` VALUES ('10', '中腰', '9');
INSERT INTO `product_parameter_value` VALUES ('10', '套头', '10');
INSERT INTO `product_parameter_value` VALUES ('10', '百褶裙', '11');
INSERT INTO `product_parameter_value` VALUES ('10', '纯色', '12');
INSERT INTO `product_parameter_value` VALUES ('10', '褶皱 绑带', '13');
INSERT INTO `product_parameter_value` VALUES ('10', '雪纺', '14');
INSERT INTO `product_parameter_value` VALUES ('10', '95%以上', '15');
INSERT INTO `product_parameter_value` VALUES ('10', '聚酯纤维', '16');
INSERT INTO `product_parameter_value` VALUES ('11', '通勤', '1');
INSERT INTO `product_parameter_value` VALUES ('11', '韩版', '2');
INSERT INTO `product_parameter_value` VALUES ('11', '两件套', '3');
INSERT INTO `product_parameter_value` VALUES ('11', '长裙(大于126厘米)', '4');
INSERT INTO `product_parameter_value` VALUES ('11', '其他款式', '5');
INSERT INTO `product_parameter_value` VALUES ('11', '短袖', '6');
INSERT INTO `product_parameter_value` VALUES ('11', '半开领', '7');
INSERT INTO `product_parameter_value` VALUES ('11', '常规袖', '8');
INSERT INTO `product_parameter_value` VALUES ('11', '中腰', '9');
INSERT INTO `product_parameter_value` VALUES ('11', '套头', '10');
INSERT INTO `product_parameter_value` VALUES ('11', '百褶裙', '11');
INSERT INTO `product_parameter_value` VALUES ('11', '纯色', '12');
INSERT INTO `product_parameter_value` VALUES ('11', '褶皱 绑带', '13');
INSERT INTO `product_parameter_value` VALUES ('11', '雪纺', '14');
INSERT INTO `product_parameter_value` VALUES ('11', '95%以上', '15');
INSERT INTO `product_parameter_value` VALUES ('11', '聚酯纤维', '16');
INSERT INTO `product_parameter_value` VALUES ('12', '通勤', '1');
INSERT INTO `product_parameter_value` VALUES ('12', '韩版', '2');
INSERT INTO `product_parameter_value` VALUES ('12', '两件套', '3');
INSERT INTO `product_parameter_value` VALUES ('12', '长裙(大于126厘米)', '4');
INSERT INTO `product_parameter_value` VALUES ('12', '其他款式', '5');
INSERT INTO `product_parameter_value` VALUES ('12', '短袖', '6');
INSERT INTO `product_parameter_value` VALUES ('12', '半开领', '7');
INSERT INTO `product_parameter_value` VALUES ('12', '常规袖', '8');
INSERT INTO `product_parameter_value` VALUES ('12', '中腰', '9');
INSERT INTO `product_parameter_value` VALUES ('12', '套头', '10');
INSERT INTO `product_parameter_value` VALUES ('12', '百褶裙', '11');
INSERT INTO `product_parameter_value` VALUES ('12', '纯色', '12');
INSERT INTO `product_parameter_value` VALUES ('12', '褶皱 绑带', '13');
INSERT INTO `product_parameter_value` VALUES ('12', '雪纺', '14');
INSERT INTO `product_parameter_value` VALUES ('12', '95%以上', '15');
INSERT INTO `product_parameter_value` VALUES ('12', '聚酯纤维', '16');
INSERT INTO `product_parameter_value` VALUES ('13', '通勤', '1');
INSERT INTO `product_parameter_value` VALUES ('13', '韩版', '2');
INSERT INTO `product_parameter_value` VALUES ('13', '两件套', '3');
INSERT INTO `product_parameter_value` VALUES ('13', '长裙(大于126厘米)', '4');
INSERT INTO `product_parameter_value` VALUES ('13', '其他款式', '5');
INSERT INTO `product_parameter_value` VALUES ('13', '短袖', '6');
INSERT INTO `product_parameter_value` VALUES ('13', '半开领', '7');
INSERT INTO `product_parameter_value` VALUES ('13', '常规袖', '8');
INSERT INTO `product_parameter_value` VALUES ('13', '中腰', '9');
INSERT INTO `product_parameter_value` VALUES ('13', '套头', '10');
INSERT INTO `product_parameter_value` VALUES ('13', '百褶裙', '11');
INSERT INTO `product_parameter_value` VALUES ('13', '纯色', '12');
INSERT INTO `product_parameter_value` VALUES ('13', '褶皱 绑带', '13');
INSERT INTO `product_parameter_value` VALUES ('13', '雪纺', '14');
INSERT INTO `product_parameter_value` VALUES ('13', '95%以上', '15');
INSERT INTO `product_parameter_value` VALUES ('13', '聚酯纤维', '16');
INSERT INTO `product_parameter_value` VALUES ('14', '长袖（袖长>57cm）', '43');
INSERT INTO `product_parameter_value` VALUES ('14', '修身型', '44');
INSERT INTO `product_parameter_value` VALUES ('14', '方领', '45');
INSERT INTO `product_parameter_value` VALUES ('14', '英伦风格', '46');
INSERT INTO `product_parameter_value` VALUES ('14', '纯色布', '47');
INSERT INTO `product_parameter_value` VALUES ('14', '纯色', '48');
INSERT INTO `product_parameter_value` VALUES ('14', '棉质', '49');
INSERT INTO `product_parameter_value` VALUES ('14', '95%以上', '50');
INSERT INTO `product_parameter_value` VALUES ('14', '2013', '51');
INSERT INTO `product_parameter_value` VALUES ('14', '春', '52');
INSERT INTO `product_parameter_value` VALUES ('14', '青年', '53');
INSERT INTO `product_parameter_value` VALUES ('15', '长袖（袖长>57cm）', '43');
INSERT INTO `product_parameter_value` VALUES ('15', '修身型', '44');
INSERT INTO `product_parameter_value` VALUES ('15', '方领', '45');
INSERT INTO `product_parameter_value` VALUES ('15', '英伦风格', '46');
INSERT INTO `product_parameter_value` VALUES ('15', '纯色布', '47');
INSERT INTO `product_parameter_value` VALUES ('15', '纯色', '48');
INSERT INTO `product_parameter_value` VALUES ('15', '棉质', '49');
INSERT INTO `product_parameter_value` VALUES ('15', '95%以上', '50');
INSERT INTO `product_parameter_value` VALUES ('15', '2013', '51');
INSERT INTO `product_parameter_value` VALUES ('15', '春', '52');
INSERT INTO `product_parameter_value` VALUES ('15', '青年', '53');
INSERT INTO `product_parameter_value` VALUES ('16', '长袖（袖长>57cm）', '43');
INSERT INTO `product_parameter_value` VALUES ('16', '修身型', '44');
INSERT INTO `product_parameter_value` VALUES ('16', '方领', '45');
INSERT INTO `product_parameter_value` VALUES ('16', '英伦风格', '46');
INSERT INTO `product_parameter_value` VALUES ('16', '纯色布', '47');
INSERT INTO `product_parameter_value` VALUES ('16', '纯色', '48');
INSERT INTO `product_parameter_value` VALUES ('16', '棉质', '49');
INSERT INTO `product_parameter_value` VALUES ('16', '95%以上', '50');
INSERT INTO `product_parameter_value` VALUES ('16', '2013', '51');
INSERT INTO `product_parameter_value` VALUES ('16', '春', '52');
INSERT INTO `product_parameter_value` VALUES ('16', '青年', '53');
INSERT INTO `product_parameter_value` VALUES ('17', '长袖（袖长>57cm）', '43');
INSERT INTO `product_parameter_value` VALUES ('17', '修身型', '44');
INSERT INTO `product_parameter_value` VALUES ('17', '方领', '45');
INSERT INTO `product_parameter_value` VALUES ('17', '英伦风格', '46');
INSERT INTO `product_parameter_value` VALUES ('17', '纯色布', '47');
INSERT INTO `product_parameter_value` VALUES ('17', '纯色', '48');
INSERT INTO `product_parameter_value` VALUES ('17', '棉质', '49');
INSERT INTO `product_parameter_value` VALUES ('17', '95%以上', '50');
INSERT INTO `product_parameter_value` VALUES ('17', '2013', '51');
INSERT INTO `product_parameter_value` VALUES ('17', '春', '52');
INSERT INTO `product_parameter_value` VALUES ('17', '青年', '53');
INSERT INTO `product_parameter_value` VALUES ('18', '长袖（袖长>57cm）', '43');
INSERT INTO `product_parameter_value` VALUES ('18', '修身型', '44');
INSERT INTO `product_parameter_value` VALUES ('18', '方领', '45');
INSERT INTO `product_parameter_value` VALUES ('18', '英伦风格', '46');
INSERT INTO `product_parameter_value` VALUES ('18', '纯色布', '47');
INSERT INTO `product_parameter_value` VALUES ('18', '纯色', '48');
INSERT INTO `product_parameter_value` VALUES ('18', '棉质', '49');
INSERT INTO `product_parameter_value` VALUES ('18', '95%以上', '50');
INSERT INTO `product_parameter_value` VALUES ('18', '2013', '51');
INSERT INTO `product_parameter_value` VALUES ('18', '春', '52');
INSERT INTO `product_parameter_value` VALUES ('18', '青年', '53');
INSERT INTO `product_parameter_value` VALUES ('19', '长袖（袖长>57cm）', '43');
INSERT INTO `product_parameter_value` VALUES ('19', '修身型', '44');
INSERT INTO `product_parameter_value` VALUES ('19', '方领', '45');
INSERT INTO `product_parameter_value` VALUES ('19', '英伦风格', '46');
INSERT INTO `product_parameter_value` VALUES ('19', '纯色布', '47');
INSERT INTO `product_parameter_value` VALUES ('19', '纯色', '48');
INSERT INTO `product_parameter_value` VALUES ('19', '棉质', '49');
INSERT INTO `product_parameter_value` VALUES ('19', '95%以上', '50');
INSERT INTO `product_parameter_value` VALUES ('19', '2013', '51');
INSERT INTO `product_parameter_value` VALUES ('19', '春', '52');
INSERT INTO `product_parameter_value` VALUES ('19', '青年', '53');
INSERT INTO `product_parameter_value` VALUES ('20', '长袖（袖长>57cm）', '43');
INSERT INTO `product_parameter_value` VALUES ('20', '修身型', '44');
INSERT INTO `product_parameter_value` VALUES ('20', '方领', '45');
INSERT INTO `product_parameter_value` VALUES ('20', '英伦风格', '46');
INSERT INTO `product_parameter_value` VALUES ('20', '纯色布', '47');
INSERT INTO `product_parameter_value` VALUES ('20', '纯色', '48');
INSERT INTO `product_parameter_value` VALUES ('20', '棉质', '49');
INSERT INTO `product_parameter_value` VALUES ('20', '95%以上', '50');
INSERT INTO `product_parameter_value` VALUES ('20', '2013', '51');
INSERT INTO `product_parameter_value` VALUES ('20', '春', '52');
INSERT INTO `product_parameter_value` VALUES ('20', '青年', '53');
INSERT INTO `product_parameter_value` VALUES ('21', '长袖（袖长>57cm）', '43');
INSERT INTO `product_parameter_value` VALUES ('21', '修身型', '44');
INSERT INTO `product_parameter_value` VALUES ('21', '方领', '45');
INSERT INTO `product_parameter_value` VALUES ('21', '英伦风格', '46');
INSERT INTO `product_parameter_value` VALUES ('21', '纯色布', '47');
INSERT INTO `product_parameter_value` VALUES ('21', '纯色', '48');
INSERT INTO `product_parameter_value` VALUES ('21', '棉质', '49');
INSERT INTO `product_parameter_value` VALUES ('21', '95%以上', '50');
INSERT INTO `product_parameter_value` VALUES ('21', '2013', '51');
INSERT INTO `product_parameter_value` VALUES ('21', '春', '52');
INSERT INTO `product_parameter_value` VALUES ('21', '青年', '53');
INSERT INTO `product_parameter_value` VALUES ('22', '长袖（袖长>57cm）', '43');
INSERT INTO `product_parameter_value` VALUES ('22', '修身型', '44');
INSERT INTO `product_parameter_value` VALUES ('22', '方领', '45');
INSERT INTO `product_parameter_value` VALUES ('22', '英伦风格', '46');
INSERT INTO `product_parameter_value` VALUES ('22', '纯色布', '47');
INSERT INTO `product_parameter_value` VALUES ('22', '纯色', '48');
INSERT INTO `product_parameter_value` VALUES ('22', '棉质', '49');
INSERT INTO `product_parameter_value` VALUES ('22', '95%以上', '50');
INSERT INTO `product_parameter_value` VALUES ('22', '2013', '51');
INSERT INTO `product_parameter_value` VALUES ('22', '春', '52');
INSERT INTO `product_parameter_value` VALUES ('22', '青年', '53');
INSERT INTO `product_parameter_value` VALUES ('23', '长袖（袖长>57cm）', '43');
INSERT INTO `product_parameter_value` VALUES ('23', '修身型', '44');
INSERT INTO `product_parameter_value` VALUES ('23', '方领', '45');
INSERT INTO `product_parameter_value` VALUES ('23', '英伦风格', '46');
INSERT INTO `product_parameter_value` VALUES ('23', '纯色布', '47');
INSERT INTO `product_parameter_value` VALUES ('23', '纯色', '48');
INSERT INTO `product_parameter_value` VALUES ('23', '棉质', '49');
INSERT INTO `product_parameter_value` VALUES ('23', '95%以上', '50');
INSERT INTO `product_parameter_value` VALUES ('23', '2013', '51');
INSERT INTO `product_parameter_value` VALUES ('23', '春', '52');
INSERT INTO `product_parameter_value` VALUES ('23', '青年', '53');
INSERT INTO `product_parameter_value` VALUES ('24', '长袖（袖长>57cm）', '43');
INSERT INTO `product_parameter_value` VALUES ('24', '修身型', '44');
INSERT INTO `product_parameter_value` VALUES ('24', '方领', '45');
INSERT INTO `product_parameter_value` VALUES ('24', '英伦风格', '46');
INSERT INTO `product_parameter_value` VALUES ('24', '纯色布', '47');
INSERT INTO `product_parameter_value` VALUES ('24', '纯色', '48');
INSERT INTO `product_parameter_value` VALUES ('24', '棉质', '49');
INSERT INTO `product_parameter_value` VALUES ('24', '95%以上', '50');
INSERT INTO `product_parameter_value` VALUES ('24', '2013', '51');
INSERT INTO `product_parameter_value` VALUES ('24', '春', '52');
INSERT INTO `product_parameter_value` VALUES ('24', '青年', '53');
INSERT INTO `product_parameter_value` VALUES ('25', '甜美', '1');
INSERT INTO `product_parameter_value` VALUES ('25', '波西米亚', '2');
INSERT INTO `product_parameter_value` VALUES ('25', '单件', '3');
INSERT INTO `product_parameter_value` VALUES ('25', '长裙(大于126厘米)', '4');
INSERT INTO `product_parameter_value` VALUES ('25', '其他款式', '5');
INSERT INTO `product_parameter_value` VALUES ('25', '无袖/背心裙', '6');
INSERT INTO `product_parameter_value` VALUES ('25', '圆领', '7');
INSERT INTO `product_parameter_value` VALUES ('25', '其他袖型', '8');
INSERT INTO `product_parameter_value` VALUES ('25', '中腰', '9');
INSERT INTO `product_parameter_value` VALUES ('25', '套头', '10');
INSERT INTO `product_parameter_value` VALUES ('25', '百褶裙', '11');
INSERT INTO `product_parameter_value` VALUES ('25', '花色', '12');
INSERT INTO `product_parameter_value` VALUES ('25', '镂空 褶皱 勾花镂空 拼贴/拼接', '13');
INSERT INTO `product_parameter_value` VALUES ('25', '雪纺', '14');
INSERT INTO `product_parameter_value` VALUES ('25', '95%以上', '15');
INSERT INTO `product_parameter_value` VALUES ('25', '聚酯纤维', '16');
INSERT INTO `product_parameter_value` VALUES ('26', '甜美', '1');
INSERT INTO `product_parameter_value` VALUES ('26', '波西米亚', '2');
INSERT INTO `product_parameter_value` VALUES ('26', '单件', '3');
INSERT INTO `product_parameter_value` VALUES ('26', '长裙(大于126厘米)', '4');
INSERT INTO `product_parameter_value` VALUES ('26', '其他款式', '5');
INSERT INTO `product_parameter_value` VALUES ('26', '无袖/背心裙', '6');
INSERT INTO `product_parameter_value` VALUES ('26', '圆领', '7');
INSERT INTO `product_parameter_value` VALUES ('26', '其他袖型', '8');
INSERT INTO `product_parameter_value` VALUES ('26', '中腰', '9');
INSERT INTO `product_parameter_value` VALUES ('26', '套头', '10');
INSERT INTO `product_parameter_value` VALUES ('26', '百褶裙', '11');
INSERT INTO `product_parameter_value` VALUES ('26', '花色', '12');
INSERT INTO `product_parameter_value` VALUES ('26', '镂空 褶皱 勾花镂空 拼贴/拼接', '13');
INSERT INTO `product_parameter_value` VALUES ('26', '雪纺', '14');
INSERT INTO `product_parameter_value` VALUES ('26', '95%以上', '15');
INSERT INTO `product_parameter_value` VALUES ('26', '聚酯纤维', '16');
INSERT INTO `product_parameter_value` VALUES ('27', '甜美', '1');
INSERT INTO `product_parameter_value` VALUES ('27', '波西米亚', '2');
INSERT INTO `product_parameter_value` VALUES ('27', '单件', '3');
INSERT INTO `product_parameter_value` VALUES ('27', '长裙(大于126厘米)', '4');
INSERT INTO `product_parameter_value` VALUES ('27', '其他款式', '5');
INSERT INTO `product_parameter_value` VALUES ('27', '无袖/背心裙', '6');
INSERT INTO `product_parameter_value` VALUES ('27', '圆领', '7');
INSERT INTO `product_parameter_value` VALUES ('27', '其他袖型', '8');
INSERT INTO `product_parameter_value` VALUES ('27', '中腰', '9');
INSERT INTO `product_parameter_value` VALUES ('27', '套头', '10');
INSERT INTO `product_parameter_value` VALUES ('27', '百褶裙', '11');
INSERT INTO `product_parameter_value` VALUES ('27', '花色', '12');
INSERT INTO `product_parameter_value` VALUES ('27', '镂空 褶皱 勾花镂空 拼贴/拼接', '13');
INSERT INTO `product_parameter_value` VALUES ('27', '雪纺', '14');
INSERT INTO `product_parameter_value` VALUES ('27', '95%以上', '15');
INSERT INTO `product_parameter_value` VALUES ('27', '聚酯纤维', '16');
INSERT INTO `product_parameter_value` VALUES ('28', '甜美', '1');
INSERT INTO `product_parameter_value` VALUES ('28', '波西米亚', '2');
INSERT INTO `product_parameter_value` VALUES ('28', '单件', '3');
INSERT INTO `product_parameter_value` VALUES ('28', '长裙(大于126厘米)', '4');
INSERT INTO `product_parameter_value` VALUES ('28', '其他款式', '5');
INSERT INTO `product_parameter_value` VALUES ('28', '无袖/背心裙', '6');
INSERT INTO `product_parameter_value` VALUES ('28', '圆领', '7');
INSERT INTO `product_parameter_value` VALUES ('28', '其他袖型', '8');
INSERT INTO `product_parameter_value` VALUES ('28', '中腰', '9');
INSERT INTO `product_parameter_value` VALUES ('28', '套头', '10');
INSERT INTO `product_parameter_value` VALUES ('28', '百褶裙', '11');
INSERT INTO `product_parameter_value` VALUES ('28', '花色', '12');
INSERT INTO `product_parameter_value` VALUES ('28', '镂空 褶皱 勾花镂空 拼贴/拼接', '13');
INSERT INTO `product_parameter_value` VALUES ('28', '雪纺', '14');
INSERT INTO `product_parameter_value` VALUES ('28', '95%以上', '15');
INSERT INTO `product_parameter_value` VALUES ('28', '聚酯纤维', '16');
INSERT INTO `product_parameter_value` VALUES ('29', '甜美', '1');
INSERT INTO `product_parameter_value` VALUES ('29', '波西米亚', '2');
INSERT INTO `product_parameter_value` VALUES ('29', '单件', '3');
INSERT INTO `product_parameter_value` VALUES ('29', '长裙(大于126厘米)', '4');
INSERT INTO `product_parameter_value` VALUES ('29', '其他款式', '5');
INSERT INTO `product_parameter_value` VALUES ('29', '无袖/背心裙', '6');
INSERT INTO `product_parameter_value` VALUES ('29', '圆领', '7');
INSERT INTO `product_parameter_value` VALUES ('29', '其他袖型', '8');
INSERT INTO `product_parameter_value` VALUES ('29', '中腰', '9');
INSERT INTO `product_parameter_value` VALUES ('29', '套头', '10');
INSERT INTO `product_parameter_value` VALUES ('29', '百褶裙', '11');
INSERT INTO `product_parameter_value` VALUES ('29', '花色', '12');
INSERT INTO `product_parameter_value` VALUES ('29', '镂空 褶皱 勾花镂空 拼贴/拼接', '13');
INSERT INTO `product_parameter_value` VALUES ('29', '雪纺', '14');
INSERT INTO `product_parameter_value` VALUES ('29', '95%以上', '15');
INSERT INTO `product_parameter_value` VALUES ('29', '聚酯纤维', '16');
INSERT INTO `product_parameter_value` VALUES ('30', '甜美', '1');
INSERT INTO `product_parameter_value` VALUES ('30', '波西米亚', '2');
INSERT INTO `product_parameter_value` VALUES ('30', '单件', '3');
INSERT INTO `product_parameter_value` VALUES ('30', '长裙(大于126厘米)', '4');
INSERT INTO `product_parameter_value` VALUES ('30', '其他款式', '5');
INSERT INTO `product_parameter_value` VALUES ('30', '无袖/背心裙', '6');
INSERT INTO `product_parameter_value` VALUES ('30', '圆领', '7');
INSERT INTO `product_parameter_value` VALUES ('30', '其他袖型', '8');
INSERT INTO `product_parameter_value` VALUES ('30', '中腰', '9');
INSERT INTO `product_parameter_value` VALUES ('30', '套头', '10');
INSERT INTO `product_parameter_value` VALUES ('30', '百褶裙', '11');
INSERT INTO `product_parameter_value` VALUES ('30', '花色', '12');
INSERT INTO `product_parameter_value` VALUES ('30', '镂空 褶皱 勾花镂空 拼贴/拼接', '13');
INSERT INTO `product_parameter_value` VALUES ('30', '雪纺', '14');
INSERT INTO `product_parameter_value` VALUES ('30', '95%以上', '15');
INSERT INTO `product_parameter_value` VALUES ('30', '聚酯纤维', '16');
INSERT INTO `product_parameter_value` VALUES ('31', '长袖（袖长>57cm）', '73');
INSERT INTO `product_parameter_value` VALUES ('31', '圆领', '74');
INSERT INTO `product_parameter_value` VALUES ('31', '纯色布', '75');
INSERT INTO `product_parameter_value` VALUES ('31', '镶边装饰', '76');
INSERT INTO `product_parameter_value` VALUES ('31', '卷边领', '77');
INSERT INTO `product_parameter_value` VALUES ('31', '时尚休闲', '78');
INSERT INTO `product_parameter_value` VALUES ('31', '常规袖', '79');
INSERT INTO `product_parameter_value` VALUES ('31', '纯色', '80');
INSERT INTO `product_parameter_value` VALUES ('31', '修身型', '81');
INSERT INTO `product_parameter_value` VALUES ('31', '棉质', '82');
INSERT INTO `product_parameter_value` VALUES ('31', '90%-95%', '83');
INSERT INTO `product_parameter_value` VALUES ('31', '春', '84');
INSERT INTO `product_parameter_value` VALUES ('31', '休闲', '85');
INSERT INTO `product_parameter_value` VALUES ('31', '青年', '86');
INSERT INTO `product_parameter_value` VALUES ('32', '长袖（袖长>57cm）', '73');
INSERT INTO `product_parameter_value` VALUES ('32', '圆领', '74');
INSERT INTO `product_parameter_value` VALUES ('32', '纯色布', '75');
INSERT INTO `product_parameter_value` VALUES ('32', '镶边装饰', '76');
INSERT INTO `product_parameter_value` VALUES ('32', '卷边领', '77');
INSERT INTO `product_parameter_value` VALUES ('32', '时尚休闲', '78');
INSERT INTO `product_parameter_value` VALUES ('32', '常规袖', '79');
INSERT INTO `product_parameter_value` VALUES ('32', '纯色', '80');
INSERT INTO `product_parameter_value` VALUES ('32', '修身型', '81');
INSERT INTO `product_parameter_value` VALUES ('32', '棉质', '82');
INSERT INTO `product_parameter_value` VALUES ('32', '90%-95%', '83');
INSERT INTO `product_parameter_value` VALUES ('32', '春', '84');
INSERT INTO `product_parameter_value` VALUES ('32', '休闲', '85');
INSERT INTO `product_parameter_value` VALUES ('32', '青年', '86');
INSERT INTO `product_parameter_value` VALUES ('33', '长袖（袖长>57cm）', '73');
INSERT INTO `product_parameter_value` VALUES ('33', '圆领', '74');
INSERT INTO `product_parameter_value` VALUES ('33', '纯色布', '75');
INSERT INTO `product_parameter_value` VALUES ('33', '镶边装饰', '76');
INSERT INTO `product_parameter_value` VALUES ('33', '卷边领', '77');
INSERT INTO `product_parameter_value` VALUES ('33', '时尚休闲', '78');
INSERT INTO `product_parameter_value` VALUES ('33', '常规袖', '79');
INSERT INTO `product_parameter_value` VALUES ('33', '纯色', '80');
INSERT INTO `product_parameter_value` VALUES ('33', '修身型', '81');
INSERT INTO `product_parameter_value` VALUES ('33', '棉质', '82');
INSERT INTO `product_parameter_value` VALUES ('33', '90%-95%', '83');
INSERT INTO `product_parameter_value` VALUES ('33', '春', '84');
INSERT INTO `product_parameter_value` VALUES ('33', '休闲', '85');
INSERT INTO `product_parameter_value` VALUES ('33', '青年', '86');
INSERT INTO `product_parameter_value` VALUES ('34', '长袖（袖长>57cm）', '73');
INSERT INTO `product_parameter_value` VALUES ('34', '圆领', '74');
INSERT INTO `product_parameter_value` VALUES ('34', '纯色布', '75');
INSERT INTO `product_parameter_value` VALUES ('34', '镶边装饰', '76');
INSERT INTO `product_parameter_value` VALUES ('34', '卷边领', '77');
INSERT INTO `product_parameter_value` VALUES ('34', '时尚休闲', '78');
INSERT INTO `product_parameter_value` VALUES ('34', '常规袖', '79');
INSERT INTO `product_parameter_value` VALUES ('34', '纯色', '80');
INSERT INTO `product_parameter_value` VALUES ('34', '修身型', '81');
INSERT INTO `product_parameter_value` VALUES ('34', '棉质', '82');
INSERT INTO `product_parameter_value` VALUES ('34', '90%-95%', '83');
INSERT INTO `product_parameter_value` VALUES ('34', '春', '84');
INSERT INTO `product_parameter_value` VALUES ('34', '休闲', '85');
INSERT INTO `product_parameter_value` VALUES ('34', '青年', '86');
INSERT INTO `product_parameter_value` VALUES ('35', '长袖（袖长>57cm）', '73');
INSERT INTO `product_parameter_value` VALUES ('35', '圆领', '74');
INSERT INTO `product_parameter_value` VALUES ('35', '纯色布', '75');
INSERT INTO `product_parameter_value` VALUES ('35', '镶边装饰', '76');
INSERT INTO `product_parameter_value` VALUES ('35', '卷边领', '77');
INSERT INTO `product_parameter_value` VALUES ('35', '时尚休闲', '78');
INSERT INTO `product_parameter_value` VALUES ('35', '常规袖', '79');
INSERT INTO `product_parameter_value` VALUES ('35', '纯色', '80');
INSERT INTO `product_parameter_value` VALUES ('35', '修身型', '81');
INSERT INTO `product_parameter_value` VALUES ('35', '棉质', '82');
INSERT INTO `product_parameter_value` VALUES ('35', '90%-95%', '83');
INSERT INTO `product_parameter_value` VALUES ('35', '春', '84');
INSERT INTO `product_parameter_value` VALUES ('35', '休闲', '85');
INSERT INTO `product_parameter_value` VALUES ('35', '青年', '86');
INSERT INTO `product_parameter_value` VALUES ('36', '长袖（袖长>57cm）', '73');
INSERT INTO `product_parameter_value` VALUES ('36', '圆领', '74');
INSERT INTO `product_parameter_value` VALUES ('36', '纯色布', '75');
INSERT INTO `product_parameter_value` VALUES ('36', '镶边装饰', '76');
INSERT INTO `product_parameter_value` VALUES ('36', '卷边领', '77');
INSERT INTO `product_parameter_value` VALUES ('36', '时尚休闲', '78');
INSERT INTO `product_parameter_value` VALUES ('36', '常规袖', '79');
INSERT INTO `product_parameter_value` VALUES ('36', '纯色', '80');
INSERT INTO `product_parameter_value` VALUES ('36', '修身型', '81');
INSERT INTO `product_parameter_value` VALUES ('36', '棉质', '82');
INSERT INTO `product_parameter_value` VALUES ('36', '90%-95%', '83');
INSERT INTO `product_parameter_value` VALUES ('36', '春', '84');
INSERT INTO `product_parameter_value` VALUES ('36', '休闲', '85');
INSERT INTO `product_parameter_value` VALUES ('36', '青年', '86');
INSERT INTO `product_parameter_value` VALUES ('37', '长袖（袖长>57cm）', '73');
INSERT INTO `product_parameter_value` VALUES ('37', '圆领', '74');
INSERT INTO `product_parameter_value` VALUES ('37', '纯色布', '75');
INSERT INTO `product_parameter_value` VALUES ('37', '镶边装饰', '76');
INSERT INTO `product_parameter_value` VALUES ('37', '卷边领', '77');
INSERT INTO `product_parameter_value` VALUES ('37', '时尚休闲', '78');
INSERT INTO `product_parameter_value` VALUES ('37', '常规袖', '79');
INSERT INTO `product_parameter_value` VALUES ('37', '纯色', '80');
INSERT INTO `product_parameter_value` VALUES ('37', '修身型', '81');
INSERT INTO `product_parameter_value` VALUES ('37', '棉质', '82');
INSERT INTO `product_parameter_value` VALUES ('37', '90%-95%', '83');
INSERT INTO `product_parameter_value` VALUES ('37', '春', '84');
INSERT INTO `product_parameter_value` VALUES ('37', '休闲', '85');
INSERT INTO `product_parameter_value` VALUES ('37', '青年', '86');
INSERT INTO `product_parameter_value` VALUES ('38', '长袖（袖长>57cm）', '73');
INSERT INTO `product_parameter_value` VALUES ('38', '圆领', '74');
INSERT INTO `product_parameter_value` VALUES ('38', '纯色布', '75');
INSERT INTO `product_parameter_value` VALUES ('38', '镶边装饰', '76');
INSERT INTO `product_parameter_value` VALUES ('38', '卷边领', '77');
INSERT INTO `product_parameter_value` VALUES ('38', '时尚休闲', '78');
INSERT INTO `product_parameter_value` VALUES ('38', '常规袖', '79');
INSERT INTO `product_parameter_value` VALUES ('38', '纯色', '80');
INSERT INTO `product_parameter_value` VALUES ('38', '修身型', '81');
INSERT INTO `product_parameter_value` VALUES ('38', '棉质', '82');
INSERT INTO `product_parameter_value` VALUES ('38', '90%-95%', '83');
INSERT INTO `product_parameter_value` VALUES ('38', '春', '84');
INSERT INTO `product_parameter_value` VALUES ('38', '休闲', '85');
INSERT INTO `product_parameter_value` VALUES ('38', '青年', '86');
INSERT INTO `product_parameter_value` VALUES ('39', '长袖（袖长>57cm）', '73');
INSERT INTO `product_parameter_value` VALUES ('39', '圆领', '74');
INSERT INTO `product_parameter_value` VALUES ('39', '纯色布', '75');
INSERT INTO `product_parameter_value` VALUES ('39', '镶边装饰', '76');
INSERT INTO `product_parameter_value` VALUES ('39', '卷边领', '77');
INSERT INTO `product_parameter_value` VALUES ('39', '时尚休闲', '78');
INSERT INTO `product_parameter_value` VALUES ('39', '常规袖', '79');
INSERT INTO `product_parameter_value` VALUES ('39', '纯色', '80');
INSERT INTO `product_parameter_value` VALUES ('39', '修身型', '81');
INSERT INTO `product_parameter_value` VALUES ('39', '棉质', '82');
INSERT INTO `product_parameter_value` VALUES ('39', '90%-95%', '83');
INSERT INTO `product_parameter_value` VALUES ('39', '春', '84');
INSERT INTO `product_parameter_value` VALUES ('39', '休闲', '85');
INSERT INTO `product_parameter_value` VALUES ('39', '青年', '86');
INSERT INTO `product_parameter_value` VALUES ('40', '长袖（袖长>57cm）', '73');
INSERT INTO `product_parameter_value` VALUES ('40', '圆领', '74');
INSERT INTO `product_parameter_value` VALUES ('40', '纯色布', '75');
INSERT INTO `product_parameter_value` VALUES ('40', '镶边装饰', '76');
INSERT INTO `product_parameter_value` VALUES ('40', '卷边领', '77');
INSERT INTO `product_parameter_value` VALUES ('40', '时尚休闲', '78');
INSERT INTO `product_parameter_value` VALUES ('40', '常规袖', '79');
INSERT INTO `product_parameter_value` VALUES ('40', '纯色', '80');
INSERT INTO `product_parameter_value` VALUES ('40', '修身型', '81');
INSERT INTO `product_parameter_value` VALUES ('40', '棉质', '82');
INSERT INTO `product_parameter_value` VALUES ('40', '90%-95%', '83');
INSERT INTO `product_parameter_value` VALUES ('40', '春', '84');
INSERT INTO `product_parameter_value` VALUES ('40', '休闲', '85');
INSERT INTO `product_parameter_value` VALUES ('40', '青年', '86');
INSERT INTO `product_parameter_value` VALUES ('41', '长袖（袖长>57cm）', '73');
INSERT INTO `product_parameter_value` VALUES ('41', '圆领', '74');
INSERT INTO `product_parameter_value` VALUES ('41', '纯色布', '75');
INSERT INTO `product_parameter_value` VALUES ('41', '镶边装饰', '76');
INSERT INTO `product_parameter_value` VALUES ('41', '卷边领', '77');
INSERT INTO `product_parameter_value` VALUES ('41', '时尚休闲', '78');
INSERT INTO `product_parameter_value` VALUES ('41', '常规袖', '79');
INSERT INTO `product_parameter_value` VALUES ('41', '纯色', '80');
INSERT INTO `product_parameter_value` VALUES ('41', '修身型', '81');
INSERT INTO `product_parameter_value` VALUES ('41', '棉质', '82');
INSERT INTO `product_parameter_value` VALUES ('41', '90%-95%', '83');
INSERT INTO `product_parameter_value` VALUES ('41', '春', '84');
INSERT INTO `product_parameter_value` VALUES ('41', '休闲', '85');
INSERT INTO `product_parameter_value` VALUES ('41', '青年', '86');
INSERT INTO `product_parameter_value` VALUES ('42', '长袖（袖长>57cm）', '73');
INSERT INTO `product_parameter_value` VALUES ('42', '圆领', '74');
INSERT INTO `product_parameter_value` VALUES ('42', '纯色布', '75');
INSERT INTO `product_parameter_value` VALUES ('42', '镶边装饰', '76');
INSERT INTO `product_parameter_value` VALUES ('42', '卷边领', '77');
INSERT INTO `product_parameter_value` VALUES ('42', '时尚休闲', '78');
INSERT INTO `product_parameter_value` VALUES ('42', '常规袖', '79');
INSERT INTO `product_parameter_value` VALUES ('42', '纯色', '80');
INSERT INTO `product_parameter_value` VALUES ('42', '修身型', '81');
INSERT INTO `product_parameter_value` VALUES ('42', '棉质', '82');
INSERT INTO `product_parameter_value` VALUES ('42', '90%-95%', '83');
INSERT INTO `product_parameter_value` VALUES ('42', '春', '84');
INSERT INTO `product_parameter_value` VALUES ('42', '休闲', '85');
INSERT INTO `product_parameter_value` VALUES ('42', '青年', '86');
INSERT INTO `product_parameter_value` VALUES ('43', '修身型', '55');
INSERT INTO `product_parameter_value` VALUES ('43', '窄领型（7cm以下）', '56');
INSERT INTO `product_parameter_value` VALUES ('43', '一粒单排扣', '57');
INSERT INTO `product_parameter_value` VALUES ('43', '时尚休闲', '58');
INSERT INTO `product_parameter_value` VALUES ('43', '纯色布', '59');
INSERT INTO `product_parameter_value` VALUES ('43', '后中开衩', '60');
INSERT INTO `product_parameter_value` VALUES ('43', '长袖', '61');
INSERT INTO `product_parameter_value` VALUES ('43', '羊毛', '62');
INSERT INTO `product_parameter_value` VALUES ('43', '95%以上', '63');
INSERT INTO `product_parameter_value` VALUES ('43', '春', '65');
INSERT INTO `product_parameter_value` VALUES ('43', '休闲', '66');
INSERT INTO `product_parameter_value` VALUES ('43', '青年', '67');
INSERT INTO `product_parameter_value` VALUES ('43', '便服单西', '68');
INSERT INTO `product_parameter_value` VALUES ('43', '普通', '70');
INSERT INTO `product_parameter_value` VALUES ('44', '修身型', '55');
INSERT INTO `product_parameter_value` VALUES ('44', '窄领型（7cm以下）', '56');
INSERT INTO `product_parameter_value` VALUES ('44', '一粒单排扣', '57');
INSERT INTO `product_parameter_value` VALUES ('44', '时尚休闲', '58');
INSERT INTO `product_parameter_value` VALUES ('44', '纯色布', '59');
INSERT INTO `product_parameter_value` VALUES ('44', '后中开衩', '60');
INSERT INTO `product_parameter_value` VALUES ('44', '长袖', '61');
INSERT INTO `product_parameter_value` VALUES ('44', '羊毛', '62');
INSERT INTO `product_parameter_value` VALUES ('44', '95%以上', '63');
INSERT INTO `product_parameter_value` VALUES ('44', '春', '65');
INSERT INTO `product_parameter_value` VALUES ('44', '休闲', '66');
INSERT INTO `product_parameter_value` VALUES ('44', '青年', '67');
INSERT INTO `product_parameter_value` VALUES ('44', '便服单西', '68');
INSERT INTO `product_parameter_value` VALUES ('44', '普通', '70');
INSERT INTO `product_parameter_value` VALUES ('45', '修身型', '55');
INSERT INTO `product_parameter_value` VALUES ('45', '窄领型（7cm以下）', '56');
INSERT INTO `product_parameter_value` VALUES ('45', '一粒单排扣', '57');
INSERT INTO `product_parameter_value` VALUES ('45', '时尚休闲', '58');
INSERT INTO `product_parameter_value` VALUES ('45', '纯色布', '59');
INSERT INTO `product_parameter_value` VALUES ('45', '后中开衩', '60');
INSERT INTO `product_parameter_value` VALUES ('45', '长袖', '61');
INSERT INTO `product_parameter_value` VALUES ('45', '羊毛', '62');
INSERT INTO `product_parameter_value` VALUES ('45', '95%以上', '63');
INSERT INTO `product_parameter_value` VALUES ('45', '春', '65');
INSERT INTO `product_parameter_value` VALUES ('45', '休闲', '66');
INSERT INTO `product_parameter_value` VALUES ('45', '青年', '67');
INSERT INTO `product_parameter_value` VALUES ('45', '便服单西', '68');
INSERT INTO `product_parameter_value` VALUES ('45', '普通', '70');
INSERT INTO `product_parameter_value` VALUES ('46', '修身型', '55');
INSERT INTO `product_parameter_value` VALUES ('46', '窄领型（7cm以下）', '56');
INSERT INTO `product_parameter_value` VALUES ('46', '一粒单排扣', '57');
INSERT INTO `product_parameter_value` VALUES ('46', '时尚休闲', '58');
INSERT INTO `product_parameter_value` VALUES ('46', '纯色布', '59');
INSERT INTO `product_parameter_value` VALUES ('46', '后中开衩', '60');
INSERT INTO `product_parameter_value` VALUES ('46', '长袖', '61');
INSERT INTO `product_parameter_value` VALUES ('46', '羊毛', '62');
INSERT INTO `product_parameter_value` VALUES ('46', '95%以上', '63');
INSERT INTO `product_parameter_value` VALUES ('46', '春', '65');
INSERT INTO `product_parameter_value` VALUES ('46', '休闲', '66');
INSERT INTO `product_parameter_value` VALUES ('46', '青年', '67');
INSERT INTO `product_parameter_value` VALUES ('46', '便服单西', '68');
INSERT INTO `product_parameter_value` VALUES ('46', '普通', '70');
INSERT INTO `product_parameter_value` VALUES ('47', '甜美', '1');
INSERT INTO `product_parameter_value` VALUES ('47', '公主', '2');
INSERT INTO `product_parameter_value` VALUES ('47', '单件', '3');
INSERT INTO `product_parameter_value` VALUES ('47', '短裙(76-90厘米)', '4');
INSERT INTO `product_parameter_value` VALUES ('47', '其他款式', '5');
INSERT INTO `product_parameter_value` VALUES ('47', '长袖', '6');
INSERT INTO `product_parameter_value` VALUES ('47', '翻领/POLO领', '7');
INSERT INTO `product_parameter_value` VALUES ('47', '常规袖', '8');
INSERT INTO `product_parameter_value` VALUES ('47', '中腰', '9');
INSERT INTO `product_parameter_value` VALUES ('47', '套头', '10');
INSERT INTO `product_parameter_value` VALUES ('47', '大摆型', '11');
INSERT INTO `product_parameter_value` VALUES ('47', '纯色', '12');
INSERT INTO `product_parameter_value` VALUES ('47', '镶钻 贴布 褶皱 拼贴/拼接 ', '13');
INSERT INTO `product_parameter_value` VALUES ('47', '蕾丝', '14');
INSERT INTO `product_parameter_value` VALUES ('47', '31%-50%', '15');
INSERT INTO `product_parameter_value` VALUES ('47', '锦纶', '16');
INSERT INTO `product_parameter_value` VALUES ('48', '甜美', '1');
INSERT INTO `product_parameter_value` VALUES ('48', '公主', '2');
INSERT INTO `product_parameter_value` VALUES ('48', '单件', '3');
INSERT INTO `product_parameter_value` VALUES ('48', '短裙(76-90厘米)', '4');
INSERT INTO `product_parameter_value` VALUES ('48', '其他款式', '5');
INSERT INTO `product_parameter_value` VALUES ('48', '长袖', '6');
INSERT INTO `product_parameter_value` VALUES ('48', '翻领/POLO领', '7');
INSERT INTO `product_parameter_value` VALUES ('48', '常规袖', '8');
INSERT INTO `product_parameter_value` VALUES ('48', '中腰', '9');
INSERT INTO `product_parameter_value` VALUES ('48', '套头', '10');
INSERT INTO `product_parameter_value` VALUES ('48', '大摆型', '11');
INSERT INTO `product_parameter_value` VALUES ('48', '纯色', '12');
INSERT INTO `product_parameter_value` VALUES ('48', '镶钻 贴布 褶皱 拼贴/拼接 ', '13');
INSERT INTO `product_parameter_value` VALUES ('48', '蕾丝', '14');
INSERT INTO `product_parameter_value` VALUES ('48', '31%-50%', '15');
INSERT INTO `product_parameter_value` VALUES ('48', '锦纶', '16');
INSERT INTO `product_parameter_value` VALUES ('49', '甜美', '1');
INSERT INTO `product_parameter_value` VALUES ('49', '公主', '2');
INSERT INTO `product_parameter_value` VALUES ('49', '单件', '3');
INSERT INTO `product_parameter_value` VALUES ('49', '短裙(76-90厘米)', '4');
INSERT INTO `product_parameter_value` VALUES ('49', '其他款式', '5');
INSERT INTO `product_parameter_value` VALUES ('49', '长袖', '6');
INSERT INTO `product_parameter_value` VALUES ('49', '翻领/POLO领', '7');
INSERT INTO `product_parameter_value` VALUES ('49', '常规袖', '8');
INSERT INTO `product_parameter_value` VALUES ('49', '中腰', '9');
INSERT INTO `product_parameter_value` VALUES ('49', '套头', '10');
INSERT INTO `product_parameter_value` VALUES ('49', '大摆型', '11');
INSERT INTO `product_parameter_value` VALUES ('49', '纯色', '12');
INSERT INTO `product_parameter_value` VALUES ('49', '镶钻 贴布 褶皱 拼贴/拼接 ', '13');
INSERT INTO `product_parameter_value` VALUES ('49', '蕾丝', '14');
INSERT INTO `product_parameter_value` VALUES ('49', '31%-50%', '15');
INSERT INTO `product_parameter_value` VALUES ('49', '锦纶', '16');
INSERT INTO `product_parameter_value` VALUES ('50', '甜美', '1');
INSERT INTO `product_parameter_value` VALUES ('50', '公主', '2');
INSERT INTO `product_parameter_value` VALUES ('50', '单件', '3');
INSERT INTO `product_parameter_value` VALUES ('50', '短裙(76-90厘米)', '4');
INSERT INTO `product_parameter_value` VALUES ('50', '其他款式', '5');
INSERT INTO `product_parameter_value` VALUES ('50', '长袖', '6');
INSERT INTO `product_parameter_value` VALUES ('50', '翻领/POLO领', '7');
INSERT INTO `product_parameter_value` VALUES ('50', '常规袖', '8');
INSERT INTO `product_parameter_value` VALUES ('50', '中腰', '9');
INSERT INTO `product_parameter_value` VALUES ('50', '套头', '10');
INSERT INTO `product_parameter_value` VALUES ('50', '大摆型', '11');
INSERT INTO `product_parameter_value` VALUES ('50', '纯色', '12');
INSERT INTO `product_parameter_value` VALUES ('50', '镶钻 贴布 褶皱 拼贴/拼接 ', '13');
INSERT INTO `product_parameter_value` VALUES ('50', '蕾丝', '14');
INSERT INTO `product_parameter_value` VALUES ('50', '31%-50%', '15');
INSERT INTO `product_parameter_value` VALUES ('50', '锦纶', '16');
INSERT INTO `product_parameter_value` VALUES ('51', '通勤', '1');
INSERT INTO `product_parameter_value` VALUES ('51', '淑女', '2');
INSERT INTO `product_parameter_value` VALUES ('51', '单件', '3');
INSERT INTO `product_parameter_value` VALUES ('51', '短裙(76-90厘米)', '4');
INSERT INTO `product_parameter_value` VALUES ('51', '其他款式', '5');
INSERT INTO `product_parameter_value` VALUES ('51', '无袖/背心裙', '6');
INSERT INTO `product_parameter_value` VALUES ('51', '圆领', '7');
INSERT INTO `product_parameter_value` VALUES ('51', '高腰', '9');
INSERT INTO `product_parameter_value` VALUES ('51', '套头', '10');
INSERT INTO `product_parameter_value` VALUES ('51', '荷叶边裙', '11');
INSERT INTO `product_parameter_value` VALUES ('51', '其它图案', '12');
INSERT INTO `product_parameter_value` VALUES ('51', '荷叶边 刺绣/绣花 拼贴', '13');
INSERT INTO `product_parameter_value` VALUES ('51', '雪纺', '14');
INSERT INTO `product_parameter_value` VALUES ('51', '95%以上', '15');
INSERT INTO `product_parameter_value` VALUES ('51', '聚酯纤维', '16');
INSERT INTO `product_parameter_value` VALUES ('52', '通勤', '1');
INSERT INTO `product_parameter_value` VALUES ('52', '淑女', '2');
INSERT INTO `product_parameter_value` VALUES ('52', '单件', '3');
INSERT INTO `product_parameter_value` VALUES ('52', '短裙(76-90厘米)', '4');
INSERT INTO `product_parameter_value` VALUES ('52', '其他款式', '5');
INSERT INTO `product_parameter_value` VALUES ('52', '无袖/背心裙', '6');
INSERT INTO `product_parameter_value` VALUES ('52', '圆领', '7');
INSERT INTO `product_parameter_value` VALUES ('52', '高腰', '9');
INSERT INTO `product_parameter_value` VALUES ('52', '套头', '10');
INSERT INTO `product_parameter_value` VALUES ('52', '荷叶边裙', '11');
INSERT INTO `product_parameter_value` VALUES ('52', '其它图案', '12');
INSERT INTO `product_parameter_value` VALUES ('52', '荷叶边 刺绣/绣花 拼贴', '13');
INSERT INTO `product_parameter_value` VALUES ('52', '雪纺', '14');
INSERT INTO `product_parameter_value` VALUES ('52', '95%以上', '15');
INSERT INTO `product_parameter_value` VALUES ('52', '聚酯纤维', '16');
INSERT INTO `product_parameter_value` VALUES ('53', '通勤', '1');
INSERT INTO `product_parameter_value` VALUES ('53', '淑女', '2');
INSERT INTO `product_parameter_value` VALUES ('53', '单件', '3');
INSERT INTO `product_parameter_value` VALUES ('53', '短裙(76-90厘米)', '4');
INSERT INTO `product_parameter_value` VALUES ('53', '其他款式', '5');
INSERT INTO `product_parameter_value` VALUES ('53', '无袖/背心裙', '6');
INSERT INTO `product_parameter_value` VALUES ('53', '圆领', '7');
INSERT INTO `product_parameter_value` VALUES ('53', '高腰', '9');
INSERT INTO `product_parameter_value` VALUES ('53', '套头', '10');
INSERT INTO `product_parameter_value` VALUES ('53', '荷叶边裙', '11');
INSERT INTO `product_parameter_value` VALUES ('53', '其它图案', '12');
INSERT INTO `product_parameter_value` VALUES ('53', '荷叶边 刺绣/绣花 拼贴', '13');
INSERT INTO `product_parameter_value` VALUES ('53', '雪纺', '14');
INSERT INTO `product_parameter_value` VALUES ('53', '95%以上', '15');
INSERT INTO `product_parameter_value` VALUES ('53', '聚酯纤维', '16');
INSERT INTO `product_parameter_value` VALUES ('54', '通勤', '1');
INSERT INTO `product_parameter_value` VALUES ('54', '淑女', '2');
INSERT INTO `product_parameter_value` VALUES ('54', '单件', '3');
INSERT INTO `product_parameter_value` VALUES ('54', '短裙(76-90厘米)', '4');
INSERT INTO `product_parameter_value` VALUES ('54', '其他款式', '5');
INSERT INTO `product_parameter_value` VALUES ('54', '无袖/背心裙', '6');
INSERT INTO `product_parameter_value` VALUES ('54', '圆领', '7');
INSERT INTO `product_parameter_value` VALUES ('54', '高腰', '9');
INSERT INTO `product_parameter_value` VALUES ('54', '套头', '10');
INSERT INTO `product_parameter_value` VALUES ('54', '荷叶边裙', '11');
INSERT INTO `product_parameter_value` VALUES ('54', '其它图案', '12');
INSERT INTO `product_parameter_value` VALUES ('54', '荷叶边 刺绣/绣花 拼贴', '13');
INSERT INTO `product_parameter_value` VALUES ('54', '雪纺', '14');
INSERT INTO `product_parameter_value` VALUES ('54', '95%以上', '15');
INSERT INTO `product_parameter_value` VALUES ('54', '聚酯纤维', '16');
INSERT INTO `product_parameter_value` VALUES ('55', '修身型', '55');
INSERT INTO `product_parameter_value` VALUES ('55', '窄领型（7cm以下）', '56');
INSERT INTO `product_parameter_value` VALUES ('55', '一粒单排扣', '57');
INSERT INTO `product_parameter_value` VALUES ('55', '时尚休闲', '58');
INSERT INTO `product_parameter_value` VALUES ('55', '针织布', '59');
INSERT INTO `product_parameter_value` VALUES ('55', '后中开衩', '60');
INSERT INTO `product_parameter_value` VALUES ('55', '长袖', '61');
INSERT INTO `product_parameter_value` VALUES ('55', '春', '65');
INSERT INTO `product_parameter_value` VALUES ('55', '休闲', '66');
INSERT INTO `product_parameter_value` VALUES ('55', '青年', '67');
INSERT INTO `product_parameter_value` VALUES ('55', '便服单西', '68');
INSERT INTO `product_parameter_value` VALUES ('55', '圆下摆', '69');
INSERT INTO `product_parameter_value` VALUES ('55', '普通', '70');
INSERT INTO `product_parameter_value` VALUES ('55', '常规（衣长到臀围上下）', '71');
INSERT INTO `product_parameter_value` VALUES ('55', '嵌线挖袋', '72');
INSERT INTO `product_parameter_value` VALUES ('56', '修身型', '55');
INSERT INTO `product_parameter_value` VALUES ('56', '窄领型（7cm以下）', '56');
INSERT INTO `product_parameter_value` VALUES ('56', '一粒单排扣', '57');
INSERT INTO `product_parameter_value` VALUES ('56', '时尚休闲', '58');
INSERT INTO `product_parameter_value` VALUES ('56', '针织布', '59');
INSERT INTO `product_parameter_value` VALUES ('56', '后中开衩', '60');
INSERT INTO `product_parameter_value` VALUES ('56', '长袖', '61');
INSERT INTO `product_parameter_value` VALUES ('56', '春', '65');
INSERT INTO `product_parameter_value` VALUES ('56', '休闲', '66');
INSERT INTO `product_parameter_value` VALUES ('56', '青年', '67');
INSERT INTO `product_parameter_value` VALUES ('56', '便服单西', '68');
INSERT INTO `product_parameter_value` VALUES ('56', '圆下摆', '69');
INSERT INTO `product_parameter_value` VALUES ('56', '普通', '70');
INSERT INTO `product_parameter_value` VALUES ('56', '常规（衣长到臀围上下）', '71');
INSERT INTO `product_parameter_value` VALUES ('56', '嵌线挖袋', '72');
INSERT INTO `product_parameter_value` VALUES ('57', '修身型', '55');
INSERT INTO `product_parameter_value` VALUES ('57', '窄领型（7cm以下）', '56');
INSERT INTO `product_parameter_value` VALUES ('57', '一粒单排扣', '57');
INSERT INTO `product_parameter_value` VALUES ('57', '时尚休闲', '58');
INSERT INTO `product_parameter_value` VALUES ('57', '针织布', '59');
INSERT INTO `product_parameter_value` VALUES ('57', '后中开衩', '60');
INSERT INTO `product_parameter_value` VALUES ('57', '长袖', '61');
INSERT INTO `product_parameter_value` VALUES ('57', '春', '65');
INSERT INTO `product_parameter_value` VALUES ('57', '休闲', '66');
INSERT INTO `product_parameter_value` VALUES ('57', '青年', '67');
INSERT INTO `product_parameter_value` VALUES ('57', '便服单西', '68');
INSERT INTO `product_parameter_value` VALUES ('57', '圆下摆', '69');
INSERT INTO `product_parameter_value` VALUES ('57', '普通', '70');
INSERT INTO `product_parameter_value` VALUES ('57', '常规（衣长到臀围上下）', '71');
INSERT INTO `product_parameter_value` VALUES ('57', '嵌线挖袋', '72');
INSERT INTO `product_parameter_value` VALUES ('58', '修身型', '55');
INSERT INTO `product_parameter_value` VALUES ('58', '窄领型（7cm以下）', '56');
INSERT INTO `product_parameter_value` VALUES ('58', '一粒单排扣', '57');
INSERT INTO `product_parameter_value` VALUES ('58', '时尚休闲', '58');
INSERT INTO `product_parameter_value` VALUES ('58', '针织布', '59');
INSERT INTO `product_parameter_value` VALUES ('58', '后中开衩', '60');
INSERT INTO `product_parameter_value` VALUES ('58', '长袖', '61');
INSERT INTO `product_parameter_value` VALUES ('58', '春', '65');
INSERT INTO `product_parameter_value` VALUES ('58', '休闲', '66');
INSERT INTO `product_parameter_value` VALUES ('58', '青年', '67');
INSERT INTO `product_parameter_value` VALUES ('58', '便服单西', '68');
INSERT INTO `product_parameter_value` VALUES ('58', '圆下摆', '69');
INSERT INTO `product_parameter_value` VALUES ('58', '普通', '70');
INSERT INTO `product_parameter_value` VALUES ('58', '常规（衣长到臀围上下）', '71');
INSERT INTO `product_parameter_value` VALUES ('58', '嵌线挖袋', '72');
INSERT INTO `product_parameter_value` VALUES ('59', '修身型', '55');
INSERT INTO `product_parameter_value` VALUES ('59', '窄领型（7cm以下）', '56');
INSERT INTO `product_parameter_value` VALUES ('59', '一粒单排扣', '57');
INSERT INTO `product_parameter_value` VALUES ('59', '时尚休闲', '58');
INSERT INTO `product_parameter_value` VALUES ('59', '毛呢布', '59');
INSERT INTO `product_parameter_value` VALUES ('59', '后中开衩', '60');
INSERT INTO `product_parameter_value` VALUES ('59', '长袖', '61');
INSERT INTO `product_parameter_value` VALUES ('59', '羊毛', '62');
INSERT INTO `product_parameter_value` VALUES ('59', '50%-69%', '63');
INSERT INTO `product_parameter_value` VALUES ('59', ' 春', '65');
INSERT INTO `product_parameter_value` VALUES ('59', '休闲', '66');
INSERT INTO `product_parameter_value` VALUES ('59', '青年', '67');
INSERT INTO `product_parameter_value` VALUES ('59', '便服单西', '68');
INSERT INTO `product_parameter_value` VALUES ('59', '直下摆', '69');
INSERT INTO `product_parameter_value` VALUES ('59', '普通', '70');
INSERT INTO `product_parameter_value` VALUES ('59', '常规（衣长到臀围上下）', '71');
INSERT INTO `product_parameter_value` VALUES ('60', '修身型', '55');
INSERT INTO `product_parameter_value` VALUES ('60', '窄领型（7cm以下）', '56');
INSERT INTO `product_parameter_value` VALUES ('60', '一粒单排扣', '57');
INSERT INTO `product_parameter_value` VALUES ('60', '时尚休闲', '58');
INSERT INTO `product_parameter_value` VALUES ('60', '毛呢布', '59');
INSERT INTO `product_parameter_value` VALUES ('60', '后中开衩', '60');
INSERT INTO `product_parameter_value` VALUES ('60', '长袖', '61');
INSERT INTO `product_parameter_value` VALUES ('60', '羊毛', '62');
INSERT INTO `product_parameter_value` VALUES ('60', '50%-69%', '63');
INSERT INTO `product_parameter_value` VALUES ('60', ' 春', '65');
INSERT INTO `product_parameter_value` VALUES ('60', '休闲', '66');
INSERT INTO `product_parameter_value` VALUES ('60', '青年', '67');
INSERT INTO `product_parameter_value` VALUES ('60', '便服单西', '68');
INSERT INTO `product_parameter_value` VALUES ('60', '直下摆', '69');
INSERT INTO `product_parameter_value` VALUES ('60', '普通', '70');
INSERT INTO `product_parameter_value` VALUES ('60', '常规（衣长到臀围上下）', '71');
INSERT INTO `product_parameter_value` VALUES ('61', '修身型', '55');
INSERT INTO `product_parameter_value` VALUES ('61', '窄领型（7cm以下）', '56');
INSERT INTO `product_parameter_value` VALUES ('61', '一粒单排扣', '57');
INSERT INTO `product_parameter_value` VALUES ('61', '时尚休闲', '58');
INSERT INTO `product_parameter_value` VALUES ('61', '毛呢布', '59');
INSERT INTO `product_parameter_value` VALUES ('61', '后中开衩', '60');
INSERT INTO `product_parameter_value` VALUES ('61', '长袖', '61');
INSERT INTO `product_parameter_value` VALUES ('61', '羊毛', '62');
INSERT INTO `product_parameter_value` VALUES ('61', '50%-69%', '63');
INSERT INTO `product_parameter_value` VALUES ('61', ' 春', '65');
INSERT INTO `product_parameter_value` VALUES ('61', '休闲', '66');
INSERT INTO `product_parameter_value` VALUES ('61', '青年', '67');
INSERT INTO `product_parameter_value` VALUES ('61', '便服单西', '68');
INSERT INTO `product_parameter_value` VALUES ('61', '直下摆', '69');
INSERT INTO `product_parameter_value` VALUES ('61', '普通', '70');
INSERT INTO `product_parameter_value` VALUES ('61', '常规（衣长到臀围上下）', '71');
INSERT INTO `product_parameter_value` VALUES ('62', '修身型', '55');
INSERT INTO `product_parameter_value` VALUES ('62', '窄领型（7cm以下）', '56');
INSERT INTO `product_parameter_value` VALUES ('62', '一粒单排扣', '57');
INSERT INTO `product_parameter_value` VALUES ('62', '时尚休闲', '58');
INSERT INTO `product_parameter_value` VALUES ('62', '毛呢布', '59');
INSERT INTO `product_parameter_value` VALUES ('62', '后中开衩', '60');
INSERT INTO `product_parameter_value` VALUES ('62', '长袖', '61');
INSERT INTO `product_parameter_value` VALUES ('62', '羊毛', '62');
INSERT INTO `product_parameter_value` VALUES ('62', '50%-69%', '63');
INSERT INTO `product_parameter_value` VALUES ('62', ' 春', '65');
INSERT INTO `product_parameter_value` VALUES ('62', '休闲', '66');
INSERT INTO `product_parameter_value` VALUES ('62', '青年', '67');
INSERT INTO `product_parameter_value` VALUES ('62', '便服单西', '68');
INSERT INTO `product_parameter_value` VALUES ('62', '直下摆', '69');
INSERT INTO `product_parameter_value` VALUES ('62', '普通', '70');
INSERT INTO `product_parameter_value` VALUES ('62', '常规（衣长到臀围上下）', '71');
INSERT INTO `product_parameter_value` VALUES ('63', '修身型', '55');
INSERT INTO `product_parameter_value` VALUES ('63', '窄领型（7cm以下）', '56');
INSERT INTO `product_parameter_value` VALUES ('63', '一粒单排扣', '57');
INSERT INTO `product_parameter_value` VALUES ('63', '时尚休闲', '58');
INSERT INTO `product_parameter_value` VALUES ('63', '毛呢布', '59');
INSERT INTO `product_parameter_value` VALUES ('63', '后中开衩', '60');
INSERT INTO `product_parameter_value` VALUES ('63', '长袖', '61');
INSERT INTO `product_parameter_value` VALUES ('63', '羊毛', '62');
INSERT INTO `product_parameter_value` VALUES ('63', '50%-69%', '63');
INSERT INTO `product_parameter_value` VALUES ('63', ' 春', '65');
INSERT INTO `product_parameter_value` VALUES ('63', '休闲', '66');
INSERT INTO `product_parameter_value` VALUES ('63', '青年', '67');
INSERT INTO `product_parameter_value` VALUES ('63', '便服单西', '68');
INSERT INTO `product_parameter_value` VALUES ('63', '直下摆', '69');
INSERT INTO `product_parameter_value` VALUES ('63', '普通', '70');
INSERT INTO `product_parameter_value` VALUES ('63', '常规（衣长到臀围上下）', '71');
INSERT INTO `product_parameter_value` VALUES ('64', '修身型', '55');
INSERT INTO `product_parameter_value` VALUES ('64', '窄领型（7cm以下）', '56');
INSERT INTO `product_parameter_value` VALUES ('64', '一粒单排扣', '57');
INSERT INTO `product_parameter_value` VALUES ('64', '时尚休闲', '58');
INSERT INTO `product_parameter_value` VALUES ('64', '毛呢布', '59');
INSERT INTO `product_parameter_value` VALUES ('64', '后中开衩', '60');
INSERT INTO `product_parameter_value` VALUES ('64', '长袖', '61');
INSERT INTO `product_parameter_value` VALUES ('64', '羊毛', '62');
INSERT INTO `product_parameter_value` VALUES ('64', '50%-69%', '63');
INSERT INTO `product_parameter_value` VALUES ('64', ' 春', '65');
INSERT INTO `product_parameter_value` VALUES ('64', '休闲', '66');
INSERT INTO `product_parameter_value` VALUES ('64', '青年', '67');
INSERT INTO `product_parameter_value` VALUES ('64', '便服单西', '68');
INSERT INTO `product_parameter_value` VALUES ('64', '直下摆', '69');
INSERT INTO `product_parameter_value` VALUES ('64', '普通', '70');
INSERT INTO `product_parameter_value` VALUES ('64', '常规（衣长到臀围上下）', '71');
INSERT INTO `product_parameter_value` VALUES ('65', '修身型', '55');
INSERT INTO `product_parameter_value` VALUES ('65', '窄领型（7cm以下）', '56');
INSERT INTO `product_parameter_value` VALUES ('65', '一粒单排扣', '57');
INSERT INTO `product_parameter_value` VALUES ('65', '时尚休闲', '58');
INSERT INTO `product_parameter_value` VALUES ('65', '毛呢布', '59');
INSERT INTO `product_parameter_value` VALUES ('65', '后中开衩', '60');
INSERT INTO `product_parameter_value` VALUES ('65', '长袖', '61');
INSERT INTO `product_parameter_value` VALUES ('65', '羊毛', '62');
INSERT INTO `product_parameter_value` VALUES ('65', '50%-69%', '63');
INSERT INTO `product_parameter_value` VALUES ('65', ' 春', '65');
INSERT INTO `product_parameter_value` VALUES ('65', '休闲', '66');
INSERT INTO `product_parameter_value` VALUES ('65', '青年', '67');
INSERT INTO `product_parameter_value` VALUES ('65', '便服单西', '68');
INSERT INTO `product_parameter_value` VALUES ('65', '直下摆', '69');
INSERT INTO `product_parameter_value` VALUES ('65', '普通', '70');
INSERT INTO `product_parameter_value` VALUES ('65', '常规（衣长到臀围上下）', '71');
INSERT INTO `product_parameter_value` VALUES ('66', '修身型', '55');
INSERT INTO `product_parameter_value` VALUES ('66', '窄领型（7cm以下）', '56');
INSERT INTO `product_parameter_value` VALUES ('66', '一粒单排扣', '57');
INSERT INTO `product_parameter_value` VALUES ('66', '时尚休闲', '58');
INSERT INTO `product_parameter_value` VALUES ('66', '毛呢布', '59');
INSERT INTO `product_parameter_value` VALUES ('66', '后中开衩', '60');
INSERT INTO `product_parameter_value` VALUES ('66', '长袖', '61');
INSERT INTO `product_parameter_value` VALUES ('66', '羊毛', '62');
INSERT INTO `product_parameter_value` VALUES ('66', '50%-69%', '63');
INSERT INTO `product_parameter_value` VALUES ('66', ' 春', '65');
INSERT INTO `product_parameter_value` VALUES ('66', '休闲', '66');
INSERT INTO `product_parameter_value` VALUES ('66', '青年', '67');
INSERT INTO `product_parameter_value` VALUES ('66', '便服单西', '68');
INSERT INTO `product_parameter_value` VALUES ('66', '直下摆', '69');
INSERT INTO `product_parameter_value` VALUES ('66', '普通', '70');
INSERT INTO `product_parameter_value` VALUES ('66', '常规（衣长到臀围上下）', '71');
INSERT INTO `product_parameter_value` VALUES ('67', '甜美', '1');
INSERT INTO `product_parameter_value` VALUES ('67', '公主', '2');
INSERT INTO `product_parameter_value` VALUES ('67', '单件', '3');
INSERT INTO `product_parameter_value` VALUES ('67', '短裙(76-90厘米)', '4');
INSERT INTO `product_parameter_value` VALUES ('67', '其他款式', '5');
INSERT INTO `product_parameter_value` VALUES ('67', '短袖', '6');
INSERT INTO `product_parameter_value` VALUES ('67', '圆领', '7');
INSERT INTO `product_parameter_value` VALUES ('67', '常规袖', '8');
INSERT INTO `product_parameter_value` VALUES ('67', '低腰', '9');
INSERT INTO `product_parameter_value` VALUES ('67', '套头', '10');
INSERT INTO `product_parameter_value` VALUES ('67', '蛋糕裙', '11');
INSERT INTO `product_parameter_value` VALUES ('67', '圆点', '12');
INSERT INTO `product_parameter_value` VALUES ('67', '荷叶边 镂空 勾花镂空', '13');
INSERT INTO `product_parameter_value` VALUES ('67', '蕾丝', '14');
INSERT INTO `product_parameter_value` VALUES ('67', '95%以上', '15');
INSERT INTO `product_parameter_value` VALUES ('67', '聚酯纤维', '16');
INSERT INTO `product_parameter_value` VALUES ('68', '甜美', '1');
INSERT INTO `product_parameter_value` VALUES ('68', '公主', '2');
INSERT INTO `product_parameter_value` VALUES ('68', '单件', '3');
INSERT INTO `product_parameter_value` VALUES ('68', '短裙(76-90厘米)', '4');
INSERT INTO `product_parameter_value` VALUES ('68', '其他款式', '5');
INSERT INTO `product_parameter_value` VALUES ('68', '短袖', '6');
INSERT INTO `product_parameter_value` VALUES ('68', '圆领', '7');
INSERT INTO `product_parameter_value` VALUES ('68', '常规袖', '8');
INSERT INTO `product_parameter_value` VALUES ('68', '低腰', '9');
INSERT INTO `product_parameter_value` VALUES ('68', '套头', '10');
INSERT INTO `product_parameter_value` VALUES ('68', '蛋糕裙', '11');
INSERT INTO `product_parameter_value` VALUES ('68', '圆点', '12');
INSERT INTO `product_parameter_value` VALUES ('68', '荷叶边 镂空 勾花镂空', '13');
INSERT INTO `product_parameter_value` VALUES ('68', '蕾丝', '14');
INSERT INTO `product_parameter_value` VALUES ('68', '95%以上', '15');
INSERT INTO `product_parameter_value` VALUES ('68', '聚酯纤维', '16');
INSERT INTO `product_parameter_value` VALUES ('69', '甜美', '1');
INSERT INTO `product_parameter_value` VALUES ('69', '公主', '2');
INSERT INTO `product_parameter_value` VALUES ('69', '单件', '3');
INSERT INTO `product_parameter_value` VALUES ('69', '短裙(76-90厘米)', '4');
INSERT INTO `product_parameter_value` VALUES ('69', '其他款式', '5');
INSERT INTO `product_parameter_value` VALUES ('69', '短袖', '6');
INSERT INTO `product_parameter_value` VALUES ('69', '圆领', '7');
INSERT INTO `product_parameter_value` VALUES ('69', '常规袖', '8');
INSERT INTO `product_parameter_value` VALUES ('69', '低腰', '9');
INSERT INTO `product_parameter_value` VALUES ('69', '套头', '10');
INSERT INTO `product_parameter_value` VALUES ('69', '蛋糕裙', '11');
INSERT INTO `product_parameter_value` VALUES ('69', '圆点', '12');
INSERT INTO `product_parameter_value` VALUES ('69', '荷叶边 镂空 勾花镂空', '13');
INSERT INTO `product_parameter_value` VALUES ('69', '蕾丝', '14');
INSERT INTO `product_parameter_value` VALUES ('69', '95%以上', '15');
INSERT INTO `product_parameter_value` VALUES ('69', '聚酯纤维', '16');
INSERT INTO `product_parameter_value` VALUES ('70', '甜美', '1');
INSERT INTO `product_parameter_value` VALUES ('70', '公主', '2');
INSERT INTO `product_parameter_value` VALUES ('70', '单件', '3');
INSERT INTO `product_parameter_value` VALUES ('70', '短裙(76-90厘米)', '4');
INSERT INTO `product_parameter_value` VALUES ('70', '其他款式', '5');
INSERT INTO `product_parameter_value` VALUES ('70', '短袖', '6');
INSERT INTO `product_parameter_value` VALUES ('70', '圆领', '7');
INSERT INTO `product_parameter_value` VALUES ('70', '常规袖', '8');
INSERT INTO `product_parameter_value` VALUES ('70', '低腰', '9');
INSERT INTO `product_parameter_value` VALUES ('70', '套头', '10');
INSERT INTO `product_parameter_value` VALUES ('70', '蛋糕裙', '11');
INSERT INTO `product_parameter_value` VALUES ('70', '圆点', '12');
INSERT INTO `product_parameter_value` VALUES ('70', '荷叶边 镂空 勾花镂空', '13');
INSERT INTO `product_parameter_value` VALUES ('70', '蕾丝', '14');
INSERT INTO `product_parameter_value` VALUES ('70', '95%以上', '15');
INSERT INTO `product_parameter_value` VALUES ('70', '聚酯纤维', '16');
INSERT INTO `product_parameter_value` VALUES ('71', '甜美', '1');
INSERT INTO `product_parameter_value` VALUES ('71', '公主', '2');
INSERT INTO `product_parameter_value` VALUES ('71', '单件', '3');
INSERT INTO `product_parameter_value` VALUES ('71', '短裙(76-90厘米)', '4');
INSERT INTO `product_parameter_value` VALUES ('71', '其他款式', '5');
INSERT INTO `product_parameter_value` VALUES ('71', '短袖', '6');
INSERT INTO `product_parameter_value` VALUES ('71', '圆领', '7');
INSERT INTO `product_parameter_value` VALUES ('71', '常规袖', '8');
INSERT INTO `product_parameter_value` VALUES ('71', '低腰', '9');
INSERT INTO `product_parameter_value` VALUES ('71', '套头', '10');
INSERT INTO `product_parameter_value` VALUES ('71', '蛋糕裙', '11');
INSERT INTO `product_parameter_value` VALUES ('71', '圆点', '12');
INSERT INTO `product_parameter_value` VALUES ('71', '荷叶边 镂空 勾花镂空', '13');
INSERT INTO `product_parameter_value` VALUES ('71', '蕾丝', '14');
INSERT INTO `product_parameter_value` VALUES ('71', '95%以上', '15');
INSERT INTO `product_parameter_value` VALUES ('71', '聚酯纤维', '16');
INSERT INTO `product_parameter_value` VALUES ('72', '甜美', '1');
INSERT INTO `product_parameter_value` VALUES ('72', '公主', '2');
INSERT INTO `product_parameter_value` VALUES ('72', '单件', '3');
INSERT INTO `product_parameter_value` VALUES ('72', '短裙(76-90厘米)', '4');
INSERT INTO `product_parameter_value` VALUES ('72', '其他款式', '5');
INSERT INTO `product_parameter_value` VALUES ('72', '短袖', '6');
INSERT INTO `product_parameter_value` VALUES ('72', '圆领', '7');
INSERT INTO `product_parameter_value` VALUES ('72', '常规袖', '8');
INSERT INTO `product_parameter_value` VALUES ('72', '低腰', '9');
INSERT INTO `product_parameter_value` VALUES ('72', '套头', '10');
INSERT INTO `product_parameter_value` VALUES ('72', '蛋糕裙', '11');
INSERT INTO `product_parameter_value` VALUES ('72', '圆点', '12');
INSERT INTO `product_parameter_value` VALUES ('72', '荷叶边 镂空 勾花镂空', '13');
INSERT INTO `product_parameter_value` VALUES ('72', '蕾丝', '14');
INSERT INTO `product_parameter_value` VALUES ('72', '95%以上', '15');
INSERT INTO `product_parameter_value` VALUES ('72', '聚酯纤维', '16');
INSERT INTO `product_parameter_value` VALUES ('73', '甜美', '1');
INSERT INTO `product_parameter_value` VALUES ('73', '公主', '2');
INSERT INTO `product_parameter_value` VALUES ('73', '单件', '3');
INSERT INTO `product_parameter_value` VALUES ('73', '短裙(76-90厘米)', '4');
INSERT INTO `product_parameter_value` VALUES ('73', '其他款式', '5');
INSERT INTO `product_parameter_value` VALUES ('73', '短袖', '6');
INSERT INTO `product_parameter_value` VALUES ('73', '圆领', '7');
INSERT INTO `product_parameter_value` VALUES ('73', '常规袖', '8');
INSERT INTO `product_parameter_value` VALUES ('73', '低腰', '9');
INSERT INTO `product_parameter_value` VALUES ('73', '套头', '10');
INSERT INTO `product_parameter_value` VALUES ('73', '蛋糕裙', '11');
INSERT INTO `product_parameter_value` VALUES ('73', '圆点', '12');
INSERT INTO `product_parameter_value` VALUES ('73', '荷叶边 镂空 勾花镂空', '13');
INSERT INTO `product_parameter_value` VALUES ('73', '蕾丝', '14');
INSERT INTO `product_parameter_value` VALUES ('73', '95%以上', '15');
INSERT INTO `product_parameter_value` VALUES ('73', '聚酯纤维', '16');
INSERT INTO `product_parameter_value` VALUES ('74', '甜美', '1');
INSERT INTO `product_parameter_value` VALUES ('74', '公主', '2');
INSERT INTO `product_parameter_value` VALUES ('74', '单件', '3');
INSERT INTO `product_parameter_value` VALUES ('74', '短裙(76-90厘米)', '4');
INSERT INTO `product_parameter_value` VALUES ('74', '其他款式', '5');
INSERT INTO `product_parameter_value` VALUES ('74', '短袖', '6');
INSERT INTO `product_parameter_value` VALUES ('74', '圆领', '7');
INSERT INTO `product_parameter_value` VALUES ('74', '常规袖', '8');
INSERT INTO `product_parameter_value` VALUES ('74', '低腰', '9');
INSERT INTO `product_parameter_value` VALUES ('74', '套头', '10');
INSERT INTO `product_parameter_value` VALUES ('74', '蛋糕裙', '11');
INSERT INTO `product_parameter_value` VALUES ('74', '圆点', '12');
INSERT INTO `product_parameter_value` VALUES ('74', '荷叶边 镂空 勾花镂空', '13');
INSERT INTO `product_parameter_value` VALUES ('74', '蕾丝', '14');
INSERT INTO `product_parameter_value` VALUES ('74', '95%以上', '15');
INSERT INTO `product_parameter_value` VALUES ('74', '聚酯纤维', '16');
INSERT INTO `product_parameter_value` VALUES ('75', '甜美', '1');
INSERT INTO `product_parameter_value` VALUES ('75', '公主', '2');
INSERT INTO `product_parameter_value` VALUES ('75', '单件', '3');
INSERT INTO `product_parameter_value` VALUES ('75', '短裙(76-90厘米)', '4');
INSERT INTO `product_parameter_value` VALUES ('75', '其他款式', '5');
INSERT INTO `product_parameter_value` VALUES ('75', '短袖', '6');
INSERT INTO `product_parameter_value` VALUES ('75', '圆领', '7');
INSERT INTO `product_parameter_value` VALUES ('75', '常规袖', '8');
INSERT INTO `product_parameter_value` VALUES ('75', '低腰', '9');
INSERT INTO `product_parameter_value` VALUES ('75', '套头', '10');
INSERT INTO `product_parameter_value` VALUES ('75', '蛋糕裙', '11');
INSERT INTO `product_parameter_value` VALUES ('75', '圆点', '12');
INSERT INTO `product_parameter_value` VALUES ('75', '荷叶边 镂空 勾花镂空', '13');
INSERT INTO `product_parameter_value` VALUES ('75', '蕾丝', '14');
INSERT INTO `product_parameter_value` VALUES ('75', '95%以上', '15');
INSERT INTO `product_parameter_value` VALUES ('75', '聚酯纤维', '16');
INSERT INTO `product_parameter_value` VALUES ('76', '甜美', '1');
INSERT INTO `product_parameter_value` VALUES ('76', '公主', '2');
INSERT INTO `product_parameter_value` VALUES ('76', '单件', '3');
INSERT INTO `product_parameter_value` VALUES ('76', '短裙(76-90厘米)', '4');
INSERT INTO `product_parameter_value` VALUES ('76', '其他款式', '5');
INSERT INTO `product_parameter_value` VALUES ('76', '短袖', '6');
INSERT INTO `product_parameter_value` VALUES ('76', '圆领', '7');
INSERT INTO `product_parameter_value` VALUES ('76', '常规袖', '8');
INSERT INTO `product_parameter_value` VALUES ('76', '低腰', '9');
INSERT INTO `product_parameter_value` VALUES ('76', '套头', '10');
INSERT INTO `product_parameter_value` VALUES ('76', '蛋糕裙', '11');
INSERT INTO `product_parameter_value` VALUES ('76', '圆点', '12');
INSERT INTO `product_parameter_value` VALUES ('76', '荷叶边 镂空 勾花镂空', '13');
INSERT INTO `product_parameter_value` VALUES ('76', '蕾丝', '14');
INSERT INTO `product_parameter_value` VALUES ('76', '95%以上', '15');
INSERT INTO `product_parameter_value` VALUES ('76', '聚酯纤维', '16');
INSERT INTO `product_parameter_value` VALUES ('77', '通勤', '1');
INSERT INTO `product_parameter_value` VALUES ('77', '淑女', '2');
INSERT INTO `product_parameter_value` VALUES ('77', '假两件', '3');
INSERT INTO `product_parameter_value` VALUES ('77', '短裙(76-90厘米)', '4');
INSERT INTO `product_parameter_value` VALUES ('77', '其他款式', '5');
INSERT INTO `product_parameter_value` VALUES ('77', '短袖', '6');
INSERT INTO `product_parameter_value` VALUES ('77', '圆领', '7');
INSERT INTO `product_parameter_value` VALUES ('77', '常规袖', '8');
INSERT INTO `product_parameter_value` VALUES ('77', '中腰', '9');
INSERT INTO `product_parameter_value` VALUES ('77', '套头', '10');
INSERT INTO `product_parameter_value` VALUES ('77', '其他裙摆样式', '11');
INSERT INTO `product_parameter_value` VALUES ('77', '其它图案', '12');
INSERT INTO `product_parameter_value` VALUES ('77', '荷叶边 镂空 刺绣/绣花', '13');
INSERT INTO `product_parameter_value` VALUES ('77', '蕾丝', '14');
INSERT INTO `product_parameter_value` VALUES ('77', '95%以上', '15');
INSERT INTO `product_parameter_value` VALUES ('77', '聚酯纤维', '16');
INSERT INTO `product_parameter_value` VALUES ('78', '通勤', '1');
INSERT INTO `product_parameter_value` VALUES ('78', '淑女', '2');
INSERT INTO `product_parameter_value` VALUES ('78', '假两件', '3');
INSERT INTO `product_parameter_value` VALUES ('78', '短裙(76-90厘米)', '4');
INSERT INTO `product_parameter_value` VALUES ('78', '其他款式', '5');
INSERT INTO `product_parameter_value` VALUES ('78', '短袖', '6');
INSERT INTO `product_parameter_value` VALUES ('78', '圆领', '7');
INSERT INTO `product_parameter_value` VALUES ('78', '常规袖', '8');
INSERT INTO `product_parameter_value` VALUES ('78', '中腰', '9');
INSERT INTO `product_parameter_value` VALUES ('78', '套头', '10');
INSERT INTO `product_parameter_value` VALUES ('78', '其他裙摆样式', '11');
INSERT INTO `product_parameter_value` VALUES ('78', '其它图案', '12');
INSERT INTO `product_parameter_value` VALUES ('78', '荷叶边 镂空 刺绣/绣花', '13');
INSERT INTO `product_parameter_value` VALUES ('78', '蕾丝', '14');
INSERT INTO `product_parameter_value` VALUES ('78', '95%以上', '15');
INSERT INTO `product_parameter_value` VALUES ('78', '聚酯纤维', '16');
INSERT INTO `product_parameter_value` VALUES ('79', '通勤', '1');
INSERT INTO `product_parameter_value` VALUES ('79', '淑女', '2');
INSERT INTO `product_parameter_value` VALUES ('79', '假两件', '3');
INSERT INTO `product_parameter_value` VALUES ('79', '短裙(76-90厘米)', '4');
INSERT INTO `product_parameter_value` VALUES ('79', '其他款式', '5');
INSERT INTO `product_parameter_value` VALUES ('79', '短袖', '6');
INSERT INTO `product_parameter_value` VALUES ('79', '圆领', '7');
INSERT INTO `product_parameter_value` VALUES ('79', '常规袖', '8');
INSERT INTO `product_parameter_value` VALUES ('79', '中腰', '9');
INSERT INTO `product_parameter_value` VALUES ('79', '套头', '10');
INSERT INTO `product_parameter_value` VALUES ('79', '其他裙摆样式', '11');
INSERT INTO `product_parameter_value` VALUES ('79', '其它图案', '12');
INSERT INTO `product_parameter_value` VALUES ('79', '荷叶边 镂空 刺绣/绣花', '13');
INSERT INTO `product_parameter_value` VALUES ('79', '蕾丝', '14');
INSERT INTO `product_parameter_value` VALUES ('79', '95%以上', '15');
INSERT INTO `product_parameter_value` VALUES ('79', '聚酯纤维', '16');
INSERT INTO `product_parameter_value` VALUES ('80', '通勤', '1');
INSERT INTO `product_parameter_value` VALUES ('80', '淑女', '2');
INSERT INTO `product_parameter_value` VALUES ('80', '假两件', '3');
INSERT INTO `product_parameter_value` VALUES ('80', '短裙(76-90厘米)', '4');
INSERT INTO `product_parameter_value` VALUES ('80', '其他款式', '5');
INSERT INTO `product_parameter_value` VALUES ('80', '短袖', '6');
INSERT INTO `product_parameter_value` VALUES ('80', '圆领', '7');
INSERT INTO `product_parameter_value` VALUES ('80', '常规袖', '8');
INSERT INTO `product_parameter_value` VALUES ('80', '中腰', '9');
INSERT INTO `product_parameter_value` VALUES ('80', '套头', '10');
INSERT INTO `product_parameter_value` VALUES ('80', '其他裙摆样式', '11');
INSERT INTO `product_parameter_value` VALUES ('80', '其它图案', '12');
INSERT INTO `product_parameter_value` VALUES ('80', '荷叶边 镂空 刺绣/绣花', '13');
INSERT INTO `product_parameter_value` VALUES ('80', '蕾丝', '14');
INSERT INTO `product_parameter_value` VALUES ('80', '95%以上', '15');
INSERT INTO `product_parameter_value` VALUES ('80', '聚酯纤维', '16');
INSERT INTO `product_parameter_value` VALUES ('81', '短袖（袖长<35cm）', '73');
INSERT INTO `product_parameter_value` VALUES ('81', '翻领', '74');
INSERT INTO `product_parameter_value` VALUES ('81', '珠地布', '75');
INSERT INTO `product_parameter_value` VALUES ('81', '绣标', '76');
INSERT INTO `product_parameter_value` VALUES ('81', '吊染', '77');
INSERT INTO `product_parameter_value` VALUES ('81', '时尚休闲', '78');
INSERT INTO `product_parameter_value` VALUES ('81', '常规袖', '79');
INSERT INTO `product_parameter_value` VALUES ('81', '条纹', '80');
INSERT INTO `product_parameter_value` VALUES ('81', '直筒型', '81');
INSERT INTO `product_parameter_value` VALUES ('81', '棉质', '82');
INSERT INTO `product_parameter_value` VALUES ('81', '95%以上', '83');
INSERT INTO `product_parameter_value` VALUES ('81', '夏', '84');
INSERT INTO `product_parameter_value` VALUES ('81', '休闲', '85');
INSERT INTO `product_parameter_value` VALUES ('81', '青年', '86');
INSERT INTO `product_parameter_value` VALUES ('81', '2013', '87');
INSERT INTO `product_parameter_value` VALUES ('82', '短袖（袖长<35cm）', '73');
INSERT INTO `product_parameter_value` VALUES ('82', '翻领', '74');
INSERT INTO `product_parameter_value` VALUES ('82', '珠地布', '75');
INSERT INTO `product_parameter_value` VALUES ('82', '绣标', '76');
INSERT INTO `product_parameter_value` VALUES ('82', '吊染', '77');
INSERT INTO `product_parameter_value` VALUES ('82', '时尚休闲', '78');
INSERT INTO `product_parameter_value` VALUES ('82', '常规袖', '79');
INSERT INTO `product_parameter_value` VALUES ('82', '条纹', '80');
INSERT INTO `product_parameter_value` VALUES ('82', '直筒型', '81');
INSERT INTO `product_parameter_value` VALUES ('82', '棉质', '82');
INSERT INTO `product_parameter_value` VALUES ('82', '95%以上', '83');
INSERT INTO `product_parameter_value` VALUES ('82', '夏', '84');
INSERT INTO `product_parameter_value` VALUES ('82', '休闲', '85');
INSERT INTO `product_parameter_value` VALUES ('82', '青年', '86');
INSERT INTO `product_parameter_value` VALUES ('82', '2013', '87');
INSERT INTO `product_parameter_value` VALUES ('83', '短袖（袖长<35cm）', '73');
INSERT INTO `product_parameter_value` VALUES ('83', '翻领', '74');
INSERT INTO `product_parameter_value` VALUES ('83', '珠地布', '75');
INSERT INTO `product_parameter_value` VALUES ('83', '绣标', '76');
INSERT INTO `product_parameter_value` VALUES ('83', '吊染', '77');
INSERT INTO `product_parameter_value` VALUES ('83', '时尚休闲', '78');
INSERT INTO `product_parameter_value` VALUES ('83', '常规袖', '79');
INSERT INTO `product_parameter_value` VALUES ('83', '条纹', '80');
INSERT INTO `product_parameter_value` VALUES ('83', '直筒型', '81');
INSERT INTO `product_parameter_value` VALUES ('83', '棉质', '82');
INSERT INTO `product_parameter_value` VALUES ('83', '95%以上', '83');
INSERT INTO `product_parameter_value` VALUES ('83', '夏', '84');
INSERT INTO `product_parameter_value` VALUES ('83', '休闲', '85');
INSERT INTO `product_parameter_value` VALUES ('83', '青年', '86');
INSERT INTO `product_parameter_value` VALUES ('83', '2013', '87');
INSERT INTO `product_parameter_value` VALUES ('84', '短袖（袖长<35cm）', '73');
INSERT INTO `product_parameter_value` VALUES ('84', '翻领', '74');
INSERT INTO `product_parameter_value` VALUES ('84', '珠地布', '75');
INSERT INTO `product_parameter_value` VALUES ('84', '绣标', '76');
INSERT INTO `product_parameter_value` VALUES ('84', '吊染', '77');
INSERT INTO `product_parameter_value` VALUES ('84', '时尚休闲', '78');
INSERT INTO `product_parameter_value` VALUES ('84', '常规袖', '79');
INSERT INTO `product_parameter_value` VALUES ('84', '条纹', '80');
INSERT INTO `product_parameter_value` VALUES ('84', '直筒型', '81');
INSERT INTO `product_parameter_value` VALUES ('84', '棉质', '82');
INSERT INTO `product_parameter_value` VALUES ('84', '95%以上', '83');
INSERT INTO `product_parameter_value` VALUES ('84', '夏', '84');
INSERT INTO `product_parameter_value` VALUES ('84', '休闲', '85');
INSERT INTO `product_parameter_value` VALUES ('84', '青年', '86');
INSERT INTO `product_parameter_value` VALUES ('84', '2013', '87');
INSERT INTO `product_parameter_value` VALUES ('85', '短袖（袖长<35cm）', '73');
INSERT INTO `product_parameter_value` VALUES ('85', '翻领', '74');
INSERT INTO `product_parameter_value` VALUES ('85', '珠地布', '75');
INSERT INTO `product_parameter_value` VALUES ('85', '绣标', '76');
INSERT INTO `product_parameter_value` VALUES ('85', '吊染', '77');
INSERT INTO `product_parameter_value` VALUES ('85', '时尚休闲', '78');
INSERT INTO `product_parameter_value` VALUES ('85', '常规袖', '79');
INSERT INTO `product_parameter_value` VALUES ('85', '条纹', '80');
INSERT INTO `product_parameter_value` VALUES ('85', '直筒型', '81');
INSERT INTO `product_parameter_value` VALUES ('85', '棉质', '82');
INSERT INTO `product_parameter_value` VALUES ('85', '95%以上', '83');
INSERT INTO `product_parameter_value` VALUES ('85', '夏', '84');
INSERT INTO `product_parameter_value` VALUES ('85', '休闲', '85');
INSERT INTO `product_parameter_value` VALUES ('85', '青年', '86');
INSERT INTO `product_parameter_value` VALUES ('85', '2013', '87');
INSERT INTO `product_parameter_value` VALUES ('86', '短袖（袖长<35cm）', '73');
INSERT INTO `product_parameter_value` VALUES ('86', '翻领', '74');
INSERT INTO `product_parameter_value` VALUES ('86', '珠地布', '75');
INSERT INTO `product_parameter_value` VALUES ('86', '绣标', '76');
INSERT INTO `product_parameter_value` VALUES ('86', '吊染', '77');
INSERT INTO `product_parameter_value` VALUES ('86', '时尚休闲', '78');
INSERT INTO `product_parameter_value` VALUES ('86', '常规袖', '79');
INSERT INTO `product_parameter_value` VALUES ('86', '条纹', '80');
INSERT INTO `product_parameter_value` VALUES ('86', '直筒型', '81');
INSERT INTO `product_parameter_value` VALUES ('86', '棉质', '82');
INSERT INTO `product_parameter_value` VALUES ('86', '95%以上', '83');
INSERT INTO `product_parameter_value` VALUES ('86', '夏', '84');
INSERT INTO `product_parameter_value` VALUES ('86', '休闲', '85');
INSERT INTO `product_parameter_value` VALUES ('86', '青年', '86');
INSERT INTO `product_parameter_value` VALUES ('86', '2013', '87');
INSERT INTO `product_parameter_value` VALUES ('87', '短袖（袖长<35cm）', '73');
INSERT INTO `product_parameter_value` VALUES ('87', '翻领', '74');
INSERT INTO `product_parameter_value` VALUES ('87', '其它', '75');
INSERT INTO `product_parameter_value` VALUES ('87', '拼色', '76');
INSERT INTO `product_parameter_value` VALUES ('87', '时尚休闲', '78');
INSERT INTO `product_parameter_value` VALUES ('87', '常规袖', '79');
INSERT INTO `product_parameter_value` VALUES ('87', '格子', '80');
INSERT INTO `product_parameter_value` VALUES ('87', '修身型', '81');
INSERT INTO `product_parameter_value` VALUES ('87', '棉质', '82');
INSERT INTO `product_parameter_value` VALUES ('87', '70%-79%', '83');
INSERT INTO `product_parameter_value` VALUES ('87', '夏', '84');
INSERT INTO `product_parameter_value` VALUES ('87', '日常', '85');
INSERT INTO `product_parameter_value` VALUES ('87', '青年', '86');
INSERT INTO `product_parameter_value` VALUES ('87', '2013', '87');
INSERT INTO `product_parameter_value` VALUES ('88', '短袖（袖长<35cm）', '73');
INSERT INTO `product_parameter_value` VALUES ('88', '翻领', '74');
INSERT INTO `product_parameter_value` VALUES ('88', '其它', '75');
INSERT INTO `product_parameter_value` VALUES ('88', '拼色', '76');
INSERT INTO `product_parameter_value` VALUES ('88', '时尚休闲', '78');
INSERT INTO `product_parameter_value` VALUES ('88', '常规袖', '79');
INSERT INTO `product_parameter_value` VALUES ('88', '格子', '80');
INSERT INTO `product_parameter_value` VALUES ('88', '修身型', '81');
INSERT INTO `product_parameter_value` VALUES ('88', '棉质', '82');
INSERT INTO `product_parameter_value` VALUES ('88', '70%-79%', '83');
INSERT INTO `product_parameter_value` VALUES ('88', '夏', '84');
INSERT INTO `product_parameter_value` VALUES ('88', '日常', '85');
INSERT INTO `product_parameter_value` VALUES ('88', '青年', '86');
INSERT INTO `product_parameter_value` VALUES ('88', '2013', '87');
INSERT INTO `product_parameter_value` VALUES ('89', '短袖（袖长<35cm）', '73');
INSERT INTO `product_parameter_value` VALUES ('89', '翻领', '74');
INSERT INTO `product_parameter_value` VALUES ('89', '其它', '75');
INSERT INTO `product_parameter_value` VALUES ('89', '拼色', '76');
INSERT INTO `product_parameter_value` VALUES ('89', '时尚休闲', '78');
INSERT INTO `product_parameter_value` VALUES ('89', '常规袖', '79');
INSERT INTO `product_parameter_value` VALUES ('89', '格子', '80');
INSERT INTO `product_parameter_value` VALUES ('89', '修身型', '81');
INSERT INTO `product_parameter_value` VALUES ('89', '棉质', '82');
INSERT INTO `product_parameter_value` VALUES ('89', '70%-79%', '83');
INSERT INTO `product_parameter_value` VALUES ('89', '夏', '84');
INSERT INTO `product_parameter_value` VALUES ('89', '日常', '85');
INSERT INTO `product_parameter_value` VALUES ('89', '青年', '86');
INSERT INTO `product_parameter_value` VALUES ('89', '2013', '87');
INSERT INTO `product_parameter_value` VALUES ('90', '短袖（袖长<35cm）', '73');
INSERT INTO `product_parameter_value` VALUES ('90', '翻领', '74');
INSERT INTO `product_parameter_value` VALUES ('90', '其它', '75');
INSERT INTO `product_parameter_value` VALUES ('90', '拼色', '76');
INSERT INTO `product_parameter_value` VALUES ('90', '时尚休闲', '78');
INSERT INTO `product_parameter_value` VALUES ('90', '常规袖', '79');
INSERT INTO `product_parameter_value` VALUES ('90', '格子', '80');
INSERT INTO `product_parameter_value` VALUES ('90', '修身型', '81');
INSERT INTO `product_parameter_value` VALUES ('90', '棉质', '82');
INSERT INTO `product_parameter_value` VALUES ('90', '70%-79%', '83');
INSERT INTO `product_parameter_value` VALUES ('90', '夏', '84');
INSERT INTO `product_parameter_value` VALUES ('90', '日常', '85');
INSERT INTO `product_parameter_value` VALUES ('90', '青年', '86');
INSERT INTO `product_parameter_value` VALUES ('90', '2013', '87');
INSERT INTO `product_parameter_value` VALUES ('91', '短袖（袖长<35cm）', '73');
INSERT INTO `product_parameter_value` VALUES ('91', '翻领', '74');
INSERT INTO `product_parameter_value` VALUES ('91', '其它', '75');
INSERT INTO `product_parameter_value` VALUES ('91', '拼色', '76');
INSERT INTO `product_parameter_value` VALUES ('91', '时尚休闲', '78');
INSERT INTO `product_parameter_value` VALUES ('91', '常规袖', '79');
INSERT INTO `product_parameter_value` VALUES ('91', '格子', '80');
INSERT INTO `product_parameter_value` VALUES ('91', '修身型', '81');
INSERT INTO `product_parameter_value` VALUES ('91', '棉质', '82');
INSERT INTO `product_parameter_value` VALUES ('91', '70%-79%', '83');
INSERT INTO `product_parameter_value` VALUES ('91', '夏', '84');
INSERT INTO `product_parameter_value` VALUES ('91', '日常', '85');
INSERT INTO `product_parameter_value` VALUES ('91', '青年', '86');
INSERT INTO `product_parameter_value` VALUES ('91', '2013', '87');
INSERT INTO `product_parameter_value` VALUES ('92', '甜美', '1');
INSERT INTO `product_parameter_value` VALUES ('92', '公主', '2');
INSERT INTO `product_parameter_value` VALUES ('92', '单件', '3');
INSERT INTO `product_parameter_value` VALUES ('92', '短裙(76-90厘米)', '4');
INSERT INTO `product_parameter_value` VALUES ('92', '其他款式', '5');
INSERT INTO `product_parameter_value` VALUES ('92', '短袖', '6');
INSERT INTO `product_parameter_value` VALUES ('92', '圆领', '7');
INSERT INTO `product_parameter_value` VALUES ('92', '包袖', '8');
INSERT INTO `product_parameter_value` VALUES ('92', '高腰', '9');
INSERT INTO `product_parameter_value` VALUES ('92', '套头', '10');
INSERT INTO `product_parameter_value` VALUES ('92', '百褶裙', '11');
INSERT INTO `product_parameter_value` VALUES ('92', '花色', '12');
INSERT INTO `product_parameter_value` VALUES ('92', '镶钻 刺绣/绣花 褶皱', '13');
INSERT INTO `product_parameter_value` VALUES ('92', '雪纺', '14');
INSERT INTO `product_parameter_value` VALUES ('92', '95%以上', '15');
INSERT INTO `product_parameter_value` VALUES ('92', '聚酯纤维', '16');
INSERT INTO `product_parameter_value` VALUES ('93', '甜美', '1');
INSERT INTO `product_parameter_value` VALUES ('93', '公主', '2');
INSERT INTO `product_parameter_value` VALUES ('93', '单件', '3');
INSERT INTO `product_parameter_value` VALUES ('93', '短裙(76-90厘米)', '4');
INSERT INTO `product_parameter_value` VALUES ('93', '其他款式', '5');
INSERT INTO `product_parameter_value` VALUES ('93', '短袖', '6');
INSERT INTO `product_parameter_value` VALUES ('93', '圆领', '7');
INSERT INTO `product_parameter_value` VALUES ('93', '包袖', '8');
INSERT INTO `product_parameter_value` VALUES ('93', '高腰', '9');
INSERT INTO `product_parameter_value` VALUES ('93', '套头', '10');
INSERT INTO `product_parameter_value` VALUES ('93', '百褶裙', '11');
INSERT INTO `product_parameter_value` VALUES ('93', '花色', '12');
INSERT INTO `product_parameter_value` VALUES ('93', '镶钻 刺绣/绣花 褶皱', '13');
INSERT INTO `product_parameter_value` VALUES ('93', '雪纺', '14');
INSERT INTO `product_parameter_value` VALUES ('93', '95%以上', '15');
INSERT INTO `product_parameter_value` VALUES ('93', '聚酯纤维', '16');
INSERT INTO `product_parameter_value` VALUES ('94', '甜美', '1');
INSERT INTO `product_parameter_value` VALUES ('94', '公主', '2');
INSERT INTO `product_parameter_value` VALUES ('94', '单件', '3');
INSERT INTO `product_parameter_value` VALUES ('94', '短裙(76-90厘米)', '4');
INSERT INTO `product_parameter_value` VALUES ('94', '其他款式', '5');
INSERT INTO `product_parameter_value` VALUES ('94', '短袖', '6');
INSERT INTO `product_parameter_value` VALUES ('94', '圆领', '7');
INSERT INTO `product_parameter_value` VALUES ('94', '包袖', '8');
INSERT INTO `product_parameter_value` VALUES ('94', '高腰', '9');
INSERT INTO `product_parameter_value` VALUES ('94', '套头', '10');
INSERT INTO `product_parameter_value` VALUES ('94', '百褶裙', '11');
INSERT INTO `product_parameter_value` VALUES ('94', '花色', '12');
INSERT INTO `product_parameter_value` VALUES ('94', '镶钻 刺绣/绣花 褶皱', '13');
INSERT INTO `product_parameter_value` VALUES ('94', '雪纺', '14');
INSERT INTO `product_parameter_value` VALUES ('94', '95%以上', '15');
INSERT INTO `product_parameter_value` VALUES ('94', '聚酯纤维', '16');
INSERT INTO `product_parameter_value` VALUES ('95', '甜美', '1');
INSERT INTO `product_parameter_value` VALUES ('95', '公主', '2');
INSERT INTO `product_parameter_value` VALUES ('95', '单件', '3');
INSERT INTO `product_parameter_value` VALUES ('95', '短裙(76-90厘米)', '4');
INSERT INTO `product_parameter_value` VALUES ('95', '其他款式', '5');
INSERT INTO `product_parameter_value` VALUES ('95', '短袖', '6');
INSERT INTO `product_parameter_value` VALUES ('95', '圆领', '7');
INSERT INTO `product_parameter_value` VALUES ('95', '包袖', '8');
INSERT INTO `product_parameter_value` VALUES ('95', '高腰', '9');
INSERT INTO `product_parameter_value` VALUES ('95', '套头', '10');
INSERT INTO `product_parameter_value` VALUES ('95', '百褶裙', '11');
INSERT INTO `product_parameter_value` VALUES ('95', '花色', '12');
INSERT INTO `product_parameter_value` VALUES ('95', '镶钻 刺绣/绣花 褶皱', '13');
INSERT INTO `product_parameter_value` VALUES ('95', '雪纺', '14');
INSERT INTO `product_parameter_value` VALUES ('95', '95%以上', '15');
INSERT INTO `product_parameter_value` VALUES ('95', '聚酯纤维', '16');
INSERT INTO `product_parameter_value` VALUES ('96', '甜美', '1');
INSERT INTO `product_parameter_value` VALUES ('96', '公主', '2');
INSERT INTO `product_parameter_value` VALUES ('96', '单件', '3');
INSERT INTO `product_parameter_value` VALUES ('96', '短裙(76-90厘米)', '4');
INSERT INTO `product_parameter_value` VALUES ('96', '其他款式', '5');
INSERT INTO `product_parameter_value` VALUES ('96', '短袖', '6');
INSERT INTO `product_parameter_value` VALUES ('96', '圆领', '7');
INSERT INTO `product_parameter_value` VALUES ('96', '包袖', '8');
INSERT INTO `product_parameter_value` VALUES ('96', '高腰', '9');
INSERT INTO `product_parameter_value` VALUES ('96', '套头', '10');
INSERT INTO `product_parameter_value` VALUES ('96', '百褶裙', '11');
INSERT INTO `product_parameter_value` VALUES ('96', '花色', '12');
INSERT INTO `product_parameter_value` VALUES ('96', '镶钻 刺绣/绣花 褶皱', '13');
INSERT INTO `product_parameter_value` VALUES ('96', '雪纺', '14');
INSERT INTO `product_parameter_value` VALUES ('96', '95%以上', '15');
INSERT INTO `product_parameter_value` VALUES ('96', '聚酯纤维', '16');
INSERT INTO `product_parameter_value` VALUES ('97', '长袖（袖长>57cm）', '73');
INSERT INTO `product_parameter_value` VALUES ('97', '翻领', '74');
INSERT INTO `product_parameter_value` VALUES ('97', '针织布', '75');
INSERT INTO `product_parameter_value` VALUES ('97', '绣标', '76');
INSERT INTO `product_parameter_value` VALUES ('97', '其它', '77');
INSERT INTO `product_parameter_value` VALUES ('97', '时尚休闲', '78');
INSERT INTO `product_parameter_value` VALUES ('97', '常规袖', '79');
INSERT INTO `product_parameter_value` VALUES ('97', '条纹', '80');
INSERT INTO `product_parameter_value` VALUES ('97', '直筒型', '81');
INSERT INTO `product_parameter_value` VALUES ('97', '棉质', '82');
INSERT INTO `product_parameter_value` VALUES ('97', '95%以上', '83');
INSERT INTO `product_parameter_value` VALUES ('97', '春', '84');
INSERT INTO `product_parameter_value` VALUES ('97', '休闲', '85');
INSERT INTO `product_parameter_value` VALUES ('97', '青年', '86');
INSERT INTO `product_parameter_value` VALUES ('97', '2013', '87');
INSERT INTO `product_parameter_value` VALUES ('98', '长袖（袖长>57cm）', '73');
INSERT INTO `product_parameter_value` VALUES ('98', '翻领', '74');
INSERT INTO `product_parameter_value` VALUES ('98', '针织布', '75');
INSERT INTO `product_parameter_value` VALUES ('98', '绣标', '76');
INSERT INTO `product_parameter_value` VALUES ('98', '其它', '77');
INSERT INTO `product_parameter_value` VALUES ('98', '时尚休闲', '78');
INSERT INTO `product_parameter_value` VALUES ('98', '常规袖', '79');
INSERT INTO `product_parameter_value` VALUES ('98', '条纹', '80');
INSERT INTO `product_parameter_value` VALUES ('98', '直筒型', '81');
INSERT INTO `product_parameter_value` VALUES ('98', '棉质', '82');
INSERT INTO `product_parameter_value` VALUES ('98', '95%以上', '83');
INSERT INTO `product_parameter_value` VALUES ('98', '春', '84');
INSERT INTO `product_parameter_value` VALUES ('98', '休闲', '85');
INSERT INTO `product_parameter_value` VALUES ('98', '青年', '86');
INSERT INTO `product_parameter_value` VALUES ('98', '2013', '87');
INSERT INTO `product_parameter_value` VALUES ('99', '通勤', '1');
INSERT INTO `product_parameter_value` VALUES ('99', '韩版', '2');
INSERT INTO `product_parameter_value` VALUES ('99', '单件', '3');
INSERT INTO `product_parameter_value` VALUES ('99', '短裙(76-90厘米)', '4');
INSERT INTO `product_parameter_value` VALUES ('99', '其他款式', '5');
INSERT INTO `product_parameter_value` VALUES ('99', '长袖', '6');
INSERT INTO `product_parameter_value` VALUES ('99', '圆领', '7');
INSERT INTO `product_parameter_value` VALUES ('99', '公主袖', '8');
INSERT INTO `product_parameter_value` VALUES ('99', '中腰', '9');
INSERT INTO `product_parameter_value` VALUES ('99', '拉链', '10');
INSERT INTO `product_parameter_value` VALUES ('99', '百褶裙', '11');
INSERT INTO `product_parameter_value` VALUES ('99', '抽象', '12');
INSERT INTO `product_parameter_value` VALUES ('99', '镂空 亮丝 高温定型 ', '13');
INSERT INTO `product_parameter_value` VALUES ('99', '其他', '14');
INSERT INTO `product_parameter_value` VALUES ('99', '31%-50%', '15');
INSERT INTO `product_parameter_value` VALUES ('99', '其他合成纤维', '16');
INSERT INTO `product_parameter_value` VALUES ('100', '通勤', '1');
INSERT INTO `product_parameter_value` VALUES ('100', '韩版', '2');
INSERT INTO `product_parameter_value` VALUES ('100', '单件', '3');
INSERT INTO `product_parameter_value` VALUES ('100', '短裙(76-90厘米)', '4');
INSERT INTO `product_parameter_value` VALUES ('100', '其他款式', '5');
INSERT INTO `product_parameter_value` VALUES ('100', '长袖', '6');
INSERT INTO `product_parameter_value` VALUES ('100', '圆领', '7');
INSERT INTO `product_parameter_value` VALUES ('100', '公主袖', '8');
INSERT INTO `product_parameter_value` VALUES ('100', '中腰', '9');
INSERT INTO `product_parameter_value` VALUES ('100', '拉链', '10');
INSERT INTO `product_parameter_value` VALUES ('100', '百褶裙', '11');
INSERT INTO `product_parameter_value` VALUES ('100', '抽象', '12');
INSERT INTO `product_parameter_value` VALUES ('100', '镂空 亮丝 高温定型 ', '13');
INSERT INTO `product_parameter_value` VALUES ('100', '其他', '14');
INSERT INTO `product_parameter_value` VALUES ('100', '31%-50%', '15');
INSERT INTO `product_parameter_value` VALUES ('100', '其他合成纤维', '16');
INSERT INTO `product_parameter_value` VALUES ('101', '通勤', '1');
INSERT INTO `product_parameter_value` VALUES ('101', '韩版', '2');
INSERT INTO `product_parameter_value` VALUES ('101', '单件', '3');
INSERT INTO `product_parameter_value` VALUES ('101', '短裙(76-90厘米)', '4');
INSERT INTO `product_parameter_value` VALUES ('101', '其他款式', '5');
INSERT INTO `product_parameter_value` VALUES ('101', '长袖', '6');
INSERT INTO `product_parameter_value` VALUES ('101', '圆领', '7');
INSERT INTO `product_parameter_value` VALUES ('101', '公主袖', '8');
INSERT INTO `product_parameter_value` VALUES ('101', '中腰', '9');
INSERT INTO `product_parameter_value` VALUES ('101', '拉链', '10');
INSERT INTO `product_parameter_value` VALUES ('101', '百褶裙', '11');
INSERT INTO `product_parameter_value` VALUES ('101', '抽象', '12');
INSERT INTO `product_parameter_value` VALUES ('101', '镂空 亮丝 高温定型 ', '13');
INSERT INTO `product_parameter_value` VALUES ('101', '其他', '14');
INSERT INTO `product_parameter_value` VALUES ('101', '31%-50%', '15');
INSERT INTO `product_parameter_value` VALUES ('101', '其他合成纤维', '16');
INSERT INTO `product_parameter_value` VALUES ('102', '通勤', '1');
INSERT INTO `product_parameter_value` VALUES ('102', '淑女', '2');
INSERT INTO `product_parameter_value` VALUES ('102', '单件', '3');
INSERT INTO `product_parameter_value` VALUES ('102', '短裙(76-90厘米)', '4');
INSERT INTO `product_parameter_value` VALUES ('102', '其他款式', '5');
INSERT INTO `product_parameter_value` VALUES ('102', '长袖', '6');
INSERT INTO `product_parameter_value` VALUES ('102', '圆领', '7');
INSERT INTO `product_parameter_value` VALUES ('102', '常规袖', '8');
INSERT INTO `product_parameter_value` VALUES ('102', '中腰', '9');
INSERT INTO `product_parameter_value` VALUES ('102', '套头', '10');
INSERT INTO `product_parameter_value` VALUES ('102', '大摆型', '11');
INSERT INTO `product_parameter_value` VALUES ('102', '花色', '12');
INSERT INTO `product_parameter_value` VALUES ('102', '镂空 抽褶 褶皱 系带', '13');
INSERT INTO `product_parameter_value` VALUES ('102', '蕾丝', '14');
INSERT INTO `product_parameter_value` VALUES ('102', '31%-50%', '15');
INSERT INTO `product_parameter_value` VALUES ('102', '锦纶', '16');
INSERT INTO `product_parameter_value` VALUES ('103', '通勤', '1');
INSERT INTO `product_parameter_value` VALUES ('103', '淑女', '2');
INSERT INTO `product_parameter_value` VALUES ('103', '单件', '3');
INSERT INTO `product_parameter_value` VALUES ('103', '短裙(76-90厘米)', '4');
INSERT INTO `product_parameter_value` VALUES ('103', '其他款式', '5');
INSERT INTO `product_parameter_value` VALUES ('103', '长袖', '6');
INSERT INTO `product_parameter_value` VALUES ('103', '圆领', '7');
INSERT INTO `product_parameter_value` VALUES ('103', '常规袖', '8');
INSERT INTO `product_parameter_value` VALUES ('103', '中腰', '9');
INSERT INTO `product_parameter_value` VALUES ('103', '套头', '10');
INSERT INTO `product_parameter_value` VALUES ('103', '大摆型', '11');
INSERT INTO `product_parameter_value` VALUES ('103', '花色', '12');
INSERT INTO `product_parameter_value` VALUES ('103', '镂空 抽褶 褶皱 系带', '13');
INSERT INTO `product_parameter_value` VALUES ('103', '蕾丝', '14');
INSERT INTO `product_parameter_value` VALUES ('103', '31%-50%', '15');
INSERT INTO `product_parameter_value` VALUES ('103', '锦纶', '16');
INSERT INTO `product_parameter_value` VALUES ('104', '短袖（袖长<35cm）', '73');
INSERT INTO `product_parameter_value` VALUES ('104', '翻领', '74');
INSERT INTO `product_parameter_value` VALUES ('104', '其它', '75');
INSERT INTO `product_parameter_value` VALUES ('104', '其它', '76');
INSERT INTO `product_parameter_value` VALUES ('104', '印花', '77');
INSERT INTO `product_parameter_value` VALUES ('104', '商务休闲', '78');
INSERT INTO `product_parameter_value` VALUES ('104', '常规袖', '79');
INSERT INTO `product_parameter_value` VALUES ('104', '其它', '80');
INSERT INTO `product_parameter_value` VALUES ('104', '直筒型', '81');
INSERT INTO `product_parameter_value` VALUES ('104', '棉质', '82');
INSERT INTO `product_parameter_value` VALUES ('104', '50%-69%', '83');
INSERT INTO `product_parameter_value` VALUES ('104', '夏', '84');
INSERT INTO `product_parameter_value` VALUES ('104', '日常', '85');
INSERT INTO `product_parameter_value` VALUES ('104', '中年', '86');
INSERT INTO `product_parameter_value` VALUES ('104', '2013', '87');
INSERT INTO `product_parameter_value` VALUES ('105', '短袖（袖长<35cm）', '73');
INSERT INTO `product_parameter_value` VALUES ('105', '翻领', '74');
INSERT INTO `product_parameter_value` VALUES ('105', '其它', '75');
INSERT INTO `product_parameter_value` VALUES ('105', '其它', '76');
INSERT INTO `product_parameter_value` VALUES ('105', '印花', '77');
INSERT INTO `product_parameter_value` VALUES ('105', '商务休闲', '78');
INSERT INTO `product_parameter_value` VALUES ('105', '常规袖', '79');
INSERT INTO `product_parameter_value` VALUES ('105', '其它', '80');
INSERT INTO `product_parameter_value` VALUES ('105', '直筒型', '81');
INSERT INTO `product_parameter_value` VALUES ('105', '棉质', '82');
INSERT INTO `product_parameter_value` VALUES ('105', '50%-69%', '83');
INSERT INTO `product_parameter_value` VALUES ('105', '夏', '84');
INSERT INTO `product_parameter_value` VALUES ('105', '日常', '85');
INSERT INTO `product_parameter_value` VALUES ('105', '中年', '86');
INSERT INTO `product_parameter_value` VALUES ('105', '2013', '87');
INSERT INTO `product_parameter_value` VALUES ('106', '短袖（袖长<35cm）', '73');
INSERT INTO `product_parameter_value` VALUES ('106', '翻领', '74');
INSERT INTO `product_parameter_value` VALUES ('106', '其它', '75');
INSERT INTO `product_parameter_value` VALUES ('106', '其它', '76');
INSERT INTO `product_parameter_value` VALUES ('106', '印花', '77');
INSERT INTO `product_parameter_value` VALUES ('106', '商务休闲', '78');
INSERT INTO `product_parameter_value` VALUES ('106', '常规袖', '79');
INSERT INTO `product_parameter_value` VALUES ('106', '其它', '80');
INSERT INTO `product_parameter_value` VALUES ('106', '直筒型', '81');
INSERT INTO `product_parameter_value` VALUES ('106', '棉质', '82');
INSERT INTO `product_parameter_value` VALUES ('106', '50%-69%', '83');
INSERT INTO `product_parameter_value` VALUES ('106', '夏', '84');
INSERT INTO `product_parameter_value` VALUES ('106', '日常', '85');
INSERT INTO `product_parameter_value` VALUES ('106', '中年', '86');
INSERT INTO `product_parameter_value` VALUES ('106', '2013', '87');
INSERT INTO `product_parameter_value` VALUES ('107', '短袖（袖长<35cm）', '73');
INSERT INTO `product_parameter_value` VALUES ('107', '翻领', '74');
INSERT INTO `product_parameter_value` VALUES ('107', '其它', '75');
INSERT INTO `product_parameter_value` VALUES ('107', '其它', '76');
INSERT INTO `product_parameter_value` VALUES ('107', '印花', '77');
INSERT INTO `product_parameter_value` VALUES ('107', '商务休闲', '78');
INSERT INTO `product_parameter_value` VALUES ('107', '常规袖', '79');
INSERT INTO `product_parameter_value` VALUES ('107', '其它', '80');
INSERT INTO `product_parameter_value` VALUES ('107', '直筒型', '81');
INSERT INTO `product_parameter_value` VALUES ('107', '棉质', '82');
INSERT INTO `product_parameter_value` VALUES ('107', '50%-69%', '83');
INSERT INTO `product_parameter_value` VALUES ('107', '夏', '84');
INSERT INTO `product_parameter_value` VALUES ('107', '日常', '85');
INSERT INTO `product_parameter_value` VALUES ('107', '中年', '86');
INSERT INTO `product_parameter_value` VALUES ('107', '2013', '87');
INSERT INTO `product_parameter_value` VALUES ('108', '短袖（袖长<35cm）', '73');
INSERT INTO `product_parameter_value` VALUES ('108', '翻领', '74');
INSERT INTO `product_parameter_value` VALUES ('108', '其它', '75');
INSERT INTO `product_parameter_value` VALUES ('108', '其它', '76');
INSERT INTO `product_parameter_value` VALUES ('108', '印花', '77');
INSERT INTO `product_parameter_value` VALUES ('108', '商务休闲', '78');
INSERT INTO `product_parameter_value` VALUES ('108', '常规袖', '79');
INSERT INTO `product_parameter_value` VALUES ('108', '其它', '80');
INSERT INTO `product_parameter_value` VALUES ('108', '直筒型', '81');
INSERT INTO `product_parameter_value` VALUES ('108', '棉质', '82');
INSERT INTO `product_parameter_value` VALUES ('108', '50%-69%', '83');
INSERT INTO `product_parameter_value` VALUES ('108', '夏', '84');
INSERT INTO `product_parameter_value` VALUES ('108', '日常', '85');
INSERT INTO `product_parameter_value` VALUES ('108', '中年', '86');
INSERT INTO `product_parameter_value` VALUES ('108', '2013', '87');
INSERT INTO `product_parameter_value` VALUES ('109', '修身型', '55');
INSERT INTO `product_parameter_value` VALUES ('109', '规则领型（领宽7-9cm）', '56');
INSERT INTO `product_parameter_value` VALUES ('109', '两粒单排扣', '57');
INSERT INTO `product_parameter_value` VALUES ('109', '商务休闲', '58');
INSERT INTO `product_parameter_value` VALUES ('109', '纯色布', '59');
INSERT INTO `product_parameter_value` VALUES ('109', '无开衩', '60');
INSERT INTO `product_parameter_value` VALUES ('109', '涤纶', '62');
INSERT INTO `product_parameter_value` VALUES ('109', '80%-89%', '64');
INSERT INTO `product_parameter_value` VALUES ('109', '春', '65');
INSERT INTO `product_parameter_value` VALUES ('109', '上班', '66');
INSERT INTO `product_parameter_value` VALUES ('109', '中年', '67');
INSERT INTO `product_parameter_value` VALUES ('110', '短袖（袖长<35cm）', '73');
INSERT INTO `product_parameter_value` VALUES ('110', '翻领', '74');
INSERT INTO `product_parameter_value` VALUES ('110', '其它', '76');
INSERT INTO `product_parameter_value` VALUES ('110', '印花', '77');
INSERT INTO `product_parameter_value` VALUES ('110', '商务休闲', '78');
INSERT INTO `product_parameter_value` VALUES ('110', '常规袖', '79');
INSERT INTO `product_parameter_value` VALUES ('110', '印花', '80');
INSERT INTO `product_parameter_value` VALUES ('110', '直筒型', '81');
INSERT INTO `product_parameter_value` VALUES ('110', '棉质', '82');
INSERT INTO `product_parameter_value` VALUES ('110', '95%以上', '83');
INSERT INTO `product_parameter_value` VALUES ('110', '夏', '84');
INSERT INTO `product_parameter_value` VALUES ('110', '日常', '85');
INSERT INTO `product_parameter_value` VALUES ('110', '中年', '86');
INSERT INTO `product_parameter_value` VALUES ('110', '2013', '87');
INSERT INTO `product_parameter_value` VALUES ('111', '短袖（袖长<35cm）', '73');
INSERT INTO `product_parameter_value` VALUES ('111', '翻领', '74');
INSERT INTO `product_parameter_value` VALUES ('111', '其它', '76');
INSERT INTO `product_parameter_value` VALUES ('111', '印花', '77');
INSERT INTO `product_parameter_value` VALUES ('111', '商务休闲', '78');
INSERT INTO `product_parameter_value` VALUES ('111', '常规袖', '79');
INSERT INTO `product_parameter_value` VALUES ('111', '印花', '80');
INSERT INTO `product_parameter_value` VALUES ('111', '直筒型', '81');
INSERT INTO `product_parameter_value` VALUES ('111', '棉质', '82');
INSERT INTO `product_parameter_value` VALUES ('111', '95%以上', '83');
INSERT INTO `product_parameter_value` VALUES ('111', '夏', '84');
INSERT INTO `product_parameter_value` VALUES ('111', '日常', '85');
INSERT INTO `product_parameter_value` VALUES ('111', '中年', '86');
INSERT INTO `product_parameter_value` VALUES ('111', '2013', '87');
INSERT INTO `product_parameter_value` VALUES ('112', '短袖（袖长<35cm）', '73');
INSERT INTO `product_parameter_value` VALUES ('112', '翻领', '74');
INSERT INTO `product_parameter_value` VALUES ('112', '其它', '76');
INSERT INTO `product_parameter_value` VALUES ('112', '印花', '77');
INSERT INTO `product_parameter_value` VALUES ('112', '商务休闲', '78');
INSERT INTO `product_parameter_value` VALUES ('112', '常规袖', '79');
INSERT INTO `product_parameter_value` VALUES ('112', '印花', '80');
INSERT INTO `product_parameter_value` VALUES ('112', '直筒型', '81');
INSERT INTO `product_parameter_value` VALUES ('112', '棉质', '82');
INSERT INTO `product_parameter_value` VALUES ('112', '95%以上', '83');
INSERT INTO `product_parameter_value` VALUES ('112', '夏', '84');
INSERT INTO `product_parameter_value` VALUES ('112', '日常', '85');
INSERT INTO `product_parameter_value` VALUES ('112', '中年', '86');
INSERT INTO `product_parameter_value` VALUES ('112', '2013', '87');
INSERT INTO `product_parameter_value` VALUES ('113', '短袖（袖长<35cm）', '73');
INSERT INTO `product_parameter_value` VALUES ('113', '翻领', '74');
INSERT INTO `product_parameter_value` VALUES ('113', '其它', '76');
INSERT INTO `product_parameter_value` VALUES ('113', '印花', '77');
INSERT INTO `product_parameter_value` VALUES ('113', '商务休闲', '78');
INSERT INTO `product_parameter_value` VALUES ('113', '常规袖', '79');
INSERT INTO `product_parameter_value` VALUES ('113', '印花', '80');
INSERT INTO `product_parameter_value` VALUES ('113', '直筒型', '81');
INSERT INTO `product_parameter_value` VALUES ('113', '棉质', '82');
INSERT INTO `product_parameter_value` VALUES ('113', '95%以上', '83');
INSERT INTO `product_parameter_value` VALUES ('113', '夏', '84');
INSERT INTO `product_parameter_value` VALUES ('113', '日常', '85');
INSERT INTO `product_parameter_value` VALUES ('113', '中年', '86');
INSERT INTO `product_parameter_value` VALUES ('113', '2013', '87');
INSERT INTO `product_parameter_value` VALUES ('114', '短袖（袖长<35cm）', '73');
INSERT INTO `product_parameter_value` VALUES ('114', '翻领', '74');
INSERT INTO `product_parameter_value` VALUES ('114', '珠地布', '75');
INSERT INTO `product_parameter_value` VALUES ('114', '其它', '76');
INSERT INTO `product_parameter_value` VALUES ('114', '印花', '77');
INSERT INTO `product_parameter_value` VALUES ('114', '商务休闲', '78');
INSERT INTO `product_parameter_value` VALUES ('114', '常规袖', '79');
INSERT INTO `product_parameter_value` VALUES ('114', '条纹', '80');
INSERT INTO `product_parameter_value` VALUES ('114', '直筒型', '81');
INSERT INTO `product_parameter_value` VALUES ('114', '其它天然纤维', '82');
INSERT INTO `product_parameter_value` VALUES ('114', '夏', '84');
INSERT INTO `product_parameter_value` VALUES ('114', '商务', '85');
INSERT INTO `product_parameter_value` VALUES ('114', '中年', '86');
INSERT INTO `product_parameter_value` VALUES ('114', '2013', '87');
INSERT INTO `product_parameter_value` VALUES ('115', '短袖（袖长<35cm）', '73');
INSERT INTO `product_parameter_value` VALUES ('115', '翻领', '74');
INSERT INTO `product_parameter_value` VALUES ('115', '珠地布', '75');
INSERT INTO `product_parameter_value` VALUES ('115', '其它', '76');
INSERT INTO `product_parameter_value` VALUES ('115', '印花', '77');
INSERT INTO `product_parameter_value` VALUES ('115', '商务休闲', '78');
INSERT INTO `product_parameter_value` VALUES ('115', '常规袖', '79');
INSERT INTO `product_parameter_value` VALUES ('115', '条纹', '80');
INSERT INTO `product_parameter_value` VALUES ('115', '直筒型', '81');
INSERT INTO `product_parameter_value` VALUES ('115', '其它天然纤维', '82');
INSERT INTO `product_parameter_value` VALUES ('115', '夏', '84');
INSERT INTO `product_parameter_value` VALUES ('115', '商务', '85');
INSERT INTO `product_parameter_value` VALUES ('115', '中年', '86');
INSERT INTO `product_parameter_value` VALUES ('115', '2013', '87');
INSERT INTO `product_parameter_value` VALUES ('116', '短袖（袖长<35cm）', '73');
INSERT INTO `product_parameter_value` VALUES ('116', '翻领', '74');
INSERT INTO `product_parameter_value` VALUES ('116', '珠地布', '75');
INSERT INTO `product_parameter_value` VALUES ('116', '其它', '76');
INSERT INTO `product_parameter_value` VALUES ('116', '印花', '77');
INSERT INTO `product_parameter_value` VALUES ('116', '商务休闲', '78');
INSERT INTO `product_parameter_value` VALUES ('116', '常规袖', '79');
INSERT INTO `product_parameter_value` VALUES ('116', '条纹', '80');
INSERT INTO `product_parameter_value` VALUES ('116', '直筒型', '81');
INSERT INTO `product_parameter_value` VALUES ('116', '其它天然纤维', '82');
INSERT INTO `product_parameter_value` VALUES ('116', '夏', '84');
INSERT INTO `product_parameter_value` VALUES ('116', '商务', '85');
INSERT INTO `product_parameter_value` VALUES ('116', '中年', '86');
INSERT INTO `product_parameter_value` VALUES ('116', '2013', '87');
INSERT INTO `product_parameter_value` VALUES ('117', '短袖（袖长<35cm）', '73');
INSERT INTO `product_parameter_value` VALUES ('117', '翻领', '74');
INSERT INTO `product_parameter_value` VALUES ('117', '珠地布', '75');
INSERT INTO `product_parameter_value` VALUES ('117', '其它', '76');
INSERT INTO `product_parameter_value` VALUES ('117', '印花', '77');
INSERT INTO `product_parameter_value` VALUES ('117', '商务休闲', '78');
INSERT INTO `product_parameter_value` VALUES ('117', '常规袖', '79');
INSERT INTO `product_parameter_value` VALUES ('117', '条纹', '80');
INSERT INTO `product_parameter_value` VALUES ('117', '直筒型', '81');
INSERT INTO `product_parameter_value` VALUES ('117', '其它天然纤维', '82');
INSERT INTO `product_parameter_value` VALUES ('117', '夏', '84');
INSERT INTO `product_parameter_value` VALUES ('117', '商务', '85');
INSERT INTO `product_parameter_value` VALUES ('117', '中年', '86');
INSERT INTO `product_parameter_value` VALUES ('117', '2013', '87');
INSERT INTO `product_parameter_value` VALUES ('118', '修身型 ', '17');
INSERT INTO `product_parameter_value` VALUES ('118', '常规 ', '18');
INSERT INTO `product_parameter_value` VALUES ('118', '单件 ', '19');
INSERT INTO `product_parameter_value` VALUES ('118', '单件 ', '20');
INSERT INTO `product_parameter_value` VALUES ('118', '韩版 ', '21');
INSERT INTO `product_parameter_value` VALUES ('118', '短款(40cm<衣长≤50cm) ', '22');
INSERT INTO `product_parameter_value` VALUES ('118', '长袖 ', '23');
INSERT INTO `product_parameter_value` VALUES ('118', '圆领 ', '24');
INSERT INTO `product_parameter_value` VALUES ('118', '常规袖 ', '25');
INSERT INTO `product_parameter_value` VALUES ('118', '双排扣 ', '26');
INSERT INTO `product_parameter_value` VALUES ('118', '纯色 ', '27');
INSERT INTO `product_parameter_value` VALUES ('118', '荷叶边 ', '28');
INSERT INTO `product_parameter_value` VALUES ('118', '涤纶 ', '29');
INSERT INTO `product_parameter_value` VALUES ('118', '涤纶 ', '30');
INSERT INTO `product_parameter_value` VALUES ('119', '修身型 ', '17');
INSERT INTO `product_parameter_value` VALUES ('119', '常规 ', '18');
INSERT INTO `product_parameter_value` VALUES ('119', '单件 ', '19');
INSERT INTO `product_parameter_value` VALUES ('119', '单件 ', '20');
INSERT INTO `product_parameter_value` VALUES ('119', '韩版 ', '21');
INSERT INTO `product_parameter_value` VALUES ('119', '短款(40cm<衣长≤50cm) ', '22');
INSERT INTO `product_parameter_value` VALUES ('119', '长袖 ', '23');
INSERT INTO `product_parameter_value` VALUES ('119', '圆领 ', '24');
INSERT INTO `product_parameter_value` VALUES ('119', '常规袖 ', '25');
INSERT INTO `product_parameter_value` VALUES ('119', '双排扣 ', '26');
INSERT INTO `product_parameter_value` VALUES ('119', '纯色 ', '27');
INSERT INTO `product_parameter_value` VALUES ('119', '荷叶边 ', '28');
INSERT INTO `product_parameter_value` VALUES ('119', '涤纶 ', '29');
INSERT INTO `product_parameter_value` VALUES ('119', '涤纶 ', '30');
INSERT INTO `product_parameter_value` VALUES ('120', '修身型 ', '17');
INSERT INTO `product_parameter_value` VALUES ('120', '常规 ', '18');
INSERT INTO `product_parameter_value` VALUES ('120', '单件 ', '19');
INSERT INTO `product_parameter_value` VALUES ('120', '单件 ', '20');
INSERT INTO `product_parameter_value` VALUES ('120', '韩版 ', '21');
INSERT INTO `product_parameter_value` VALUES ('120', '短款(40cm<衣长≤50cm) ', '22');
INSERT INTO `product_parameter_value` VALUES ('120', '长袖 ', '23');
INSERT INTO `product_parameter_value` VALUES ('120', '圆领 ', '24');
INSERT INTO `product_parameter_value` VALUES ('120', '常规袖 ', '25');
INSERT INTO `product_parameter_value` VALUES ('120', '双排扣 ', '26');
INSERT INTO `product_parameter_value` VALUES ('120', '纯色 ', '27');
INSERT INTO `product_parameter_value` VALUES ('120', '荷叶边 ', '28');
INSERT INTO `product_parameter_value` VALUES ('120', '涤纶 ', '29');
INSERT INTO `product_parameter_value` VALUES ('120', '涤纶 ', '30');
INSERT INTO `product_parameter_value` VALUES ('121', '修身型 ', '17');
INSERT INTO `product_parameter_value` VALUES ('121', '常规 ', '18');
INSERT INTO `product_parameter_value` VALUES ('121', '单件 ', '19');
INSERT INTO `product_parameter_value` VALUES ('121', '单件 ', '20');
INSERT INTO `product_parameter_value` VALUES ('121', '韩版 ', '21');
INSERT INTO `product_parameter_value` VALUES ('121', '短款(40cm<衣长≤50cm) ', '22');
INSERT INTO `product_parameter_value` VALUES ('121', '长袖 ', '23');
INSERT INTO `product_parameter_value` VALUES ('121', '圆领 ', '24');
INSERT INTO `product_parameter_value` VALUES ('121', '常规袖 ', '25');
INSERT INTO `product_parameter_value` VALUES ('121', '双排扣 ', '26');
INSERT INTO `product_parameter_value` VALUES ('121', '纯色 ', '27');
INSERT INTO `product_parameter_value` VALUES ('121', '荷叶边 ', '28');
INSERT INTO `product_parameter_value` VALUES ('121', '涤纶 ', '29');
INSERT INTO `product_parameter_value` VALUES ('121', '涤纶 ', '30');
INSERT INTO `product_parameter_value` VALUES ('122', '修身型 ', '17');
INSERT INTO `product_parameter_value` VALUES ('122', '常规 ', '18');
INSERT INTO `product_parameter_value` VALUES ('122', '单件 ', '19');
INSERT INTO `product_parameter_value` VALUES ('122', '单件 ', '20');
INSERT INTO `product_parameter_value` VALUES ('122', '韩版 ', '21');
INSERT INTO `product_parameter_value` VALUES ('122', '短款(40cm<衣长≤50cm) ', '22');
INSERT INTO `product_parameter_value` VALUES ('122', '长袖 ', '23');
INSERT INTO `product_parameter_value` VALUES ('122', '圆领 ', '24');
INSERT INTO `product_parameter_value` VALUES ('122', '常规袖 ', '25');
INSERT INTO `product_parameter_value` VALUES ('122', '双排扣 ', '26');
INSERT INTO `product_parameter_value` VALUES ('122', '纯色 ', '27');
INSERT INTO `product_parameter_value` VALUES ('122', '荷叶边 ', '28');
INSERT INTO `product_parameter_value` VALUES ('122', '涤纶 ', '29');
INSERT INTO `product_parameter_value` VALUES ('122', '涤纶 ', '30');
INSERT INTO `product_parameter_value` VALUES ('123', '短袖（袖长<35cm）', '73');
INSERT INTO `product_parameter_value` VALUES ('123', '圆领', '74');
INSERT INTO `product_parameter_value` VALUES ('123', '印花', '77');
INSERT INTO `product_parameter_value` VALUES ('123', '时尚休闲', '78');
INSERT INTO `product_parameter_value` VALUES ('123', '常规袖', '79');
INSERT INTO `product_parameter_value` VALUES ('123', '摇滚的电吉他图案', '80');
INSERT INTO `product_parameter_value` VALUES ('123', '棉质', '82');
INSERT INTO `product_parameter_value` VALUES ('123', '95%以上', '83');
INSERT INTO `product_parameter_value` VALUES ('123', '夏', '84');
INSERT INTO `product_parameter_value` VALUES ('123', '青年', '86');
INSERT INTO `product_parameter_value` VALUES ('123', '2012', '87');
INSERT INTO `product_parameter_value` VALUES ('124', '短袖（袖长<35cm）', '73');
INSERT INTO `product_parameter_value` VALUES ('124', '圆领', '74');
INSERT INTO `product_parameter_value` VALUES ('124', '印花', '77');
INSERT INTO `product_parameter_value` VALUES ('124', '时尚休闲', '78');
INSERT INTO `product_parameter_value` VALUES ('124', '常规袖', '79');
INSERT INTO `product_parameter_value` VALUES ('124', '摇滚的电吉他图案', '80');
INSERT INTO `product_parameter_value` VALUES ('124', '棉质', '82');
INSERT INTO `product_parameter_value` VALUES ('124', '95%以上', '83');
INSERT INTO `product_parameter_value` VALUES ('124', '夏', '84');
INSERT INTO `product_parameter_value` VALUES ('124', '青年', '86');
INSERT INTO `product_parameter_value` VALUES ('124', '2012', '87');
INSERT INTO `product_parameter_value` VALUES ('125', '短袖（袖长<35cm）', '73');
INSERT INTO `product_parameter_value` VALUES ('125', '圆领', '74');
INSERT INTO `product_parameter_value` VALUES ('125', '印花', '77');
INSERT INTO `product_parameter_value` VALUES ('125', '时尚休闲', '78');
INSERT INTO `product_parameter_value` VALUES ('125', '常规袖', '79');
INSERT INTO `product_parameter_value` VALUES ('125', '摇滚的电吉他图案', '80');
INSERT INTO `product_parameter_value` VALUES ('125', '棉质', '82');
INSERT INTO `product_parameter_value` VALUES ('125', '95%以上', '83');
INSERT INTO `product_parameter_value` VALUES ('125', '夏', '84');
INSERT INTO `product_parameter_value` VALUES ('125', '青年', '86');
INSERT INTO `product_parameter_value` VALUES ('125', '2012', '87');
INSERT INTO `product_parameter_value` VALUES ('126', '直筒型', '31');
INSERT INTO `product_parameter_value` VALUES ('126', '通勤', '32');
INSERT INTO `product_parameter_value` VALUES ('126', '韩版', '33');
INSERT INTO `product_parameter_value` VALUES ('126', '常规款(50cm<衣长≤65cm)', '34');
INSERT INTO `product_parameter_value` VALUES ('126', '长袖', '35');
INSERT INTO `product_parameter_value` VALUES ('126', '常规袖', '36');
INSERT INTO `product_parameter_value` VALUES ('126', '圆领', '37');
INSERT INTO `product_parameter_value` VALUES ('126', '套头', '38');
INSERT INTO `product_parameter_value` VALUES ('126', '纯色', '39');
INSERT INTO `product_parameter_value` VALUES ('126', '镂空 拼贴/拼接 蕾丝 褶皱', '40');
INSERT INTO `product_parameter_value` VALUES ('126', '96%及以上', '41');
INSERT INTO `product_parameter_value` VALUES ('126', '其他合成纤维', '42');
INSERT INTO `product_parameter_value` VALUES ('127', '直筒型', '31');
INSERT INTO `product_parameter_value` VALUES ('127', '通勤', '32');
INSERT INTO `product_parameter_value` VALUES ('127', '韩版', '33');
INSERT INTO `product_parameter_value` VALUES ('127', '常规款(50cm<衣长≤65cm)', '34');
INSERT INTO `product_parameter_value` VALUES ('127', '长袖', '35');
INSERT INTO `product_parameter_value` VALUES ('127', '常规袖', '36');
INSERT INTO `product_parameter_value` VALUES ('127', '圆领', '37');
INSERT INTO `product_parameter_value` VALUES ('127', '套头', '38');
INSERT INTO `product_parameter_value` VALUES ('127', '纯色', '39');
INSERT INTO `product_parameter_value` VALUES ('127', '镂空 拼贴/拼接 蕾丝 褶皱', '40');
INSERT INTO `product_parameter_value` VALUES ('127', '96%及以上', '41');
INSERT INTO `product_parameter_value` VALUES ('127', '其他合成纤维', '42');
INSERT INTO `product_parameter_value` VALUES ('128', '直筒型', '31');
INSERT INTO `product_parameter_value` VALUES ('128', '通勤', '32');
INSERT INTO `product_parameter_value` VALUES ('128', '韩版', '33');
INSERT INTO `product_parameter_value` VALUES ('128', '常规款(50cm<衣长≤65cm)', '34');
INSERT INTO `product_parameter_value` VALUES ('128', '长袖', '35');
INSERT INTO `product_parameter_value` VALUES ('128', '常规袖', '36');
INSERT INTO `product_parameter_value` VALUES ('128', '圆领', '37');
INSERT INTO `product_parameter_value` VALUES ('128', '套头', '38');
INSERT INTO `product_parameter_value` VALUES ('128', '纯色', '39');
INSERT INTO `product_parameter_value` VALUES ('128', '镂空 拼贴/拼接 蕾丝 褶皱', '40');
INSERT INTO `product_parameter_value` VALUES ('128', '96%及以上', '41');
INSERT INTO `product_parameter_value` VALUES ('128', '其他合成纤维', '42');
INSERT INTO `product_parameter_value` VALUES ('129', '直筒型', '31');
INSERT INTO `product_parameter_value` VALUES ('129', '通勤', '32');
INSERT INTO `product_parameter_value` VALUES ('129', '韩版', '33');
INSERT INTO `product_parameter_value` VALUES ('129', '常规款(50cm<衣长≤65cm)', '34');
INSERT INTO `product_parameter_value` VALUES ('129', '长袖', '35');
INSERT INTO `product_parameter_value` VALUES ('129', '常规袖', '36');
INSERT INTO `product_parameter_value` VALUES ('129', '圆领', '37');
INSERT INTO `product_parameter_value` VALUES ('129', '套头', '38');
INSERT INTO `product_parameter_value` VALUES ('129', '纯色', '39');
INSERT INTO `product_parameter_value` VALUES ('129', '镂空 拼贴/拼接 蕾丝 褶皱', '40');
INSERT INTO `product_parameter_value` VALUES ('129', '96%及以上', '41');
INSERT INTO `product_parameter_value` VALUES ('129', '其他合成纤维', '42');
INSERT INTO `product_parameter_value` VALUES ('130', '直筒型', '31');
INSERT INTO `product_parameter_value` VALUES ('130', '通勤', '32');
INSERT INTO `product_parameter_value` VALUES ('130', '韩版', '33');
INSERT INTO `product_parameter_value` VALUES ('130', '常规款(50cm<衣长≤65cm)', '34');
INSERT INTO `product_parameter_value` VALUES ('130', '长袖', '35');
INSERT INTO `product_parameter_value` VALUES ('130', '常规袖', '36');
INSERT INTO `product_parameter_value` VALUES ('130', '圆领', '37');
INSERT INTO `product_parameter_value` VALUES ('130', '套头', '38');
INSERT INTO `product_parameter_value` VALUES ('130', '纯色', '39');
INSERT INTO `product_parameter_value` VALUES ('130', '镂空 拼贴/拼接 蕾丝 褶皱', '40');
INSERT INTO `product_parameter_value` VALUES ('130', '96%及以上', '41');
INSERT INTO `product_parameter_value` VALUES ('130', '其他合成纤维', '42');
INSERT INTO `product_parameter_value` VALUES ('131', '直筒型', '31');
INSERT INTO `product_parameter_value` VALUES ('131', '通勤', '32');
INSERT INTO `product_parameter_value` VALUES ('131', '韩版', '33');
INSERT INTO `product_parameter_value` VALUES ('131', '常规款(50cm<衣长≤65cm)', '34');
INSERT INTO `product_parameter_value` VALUES ('131', '长袖', '35');
INSERT INTO `product_parameter_value` VALUES ('131', '常规袖', '36');
INSERT INTO `product_parameter_value` VALUES ('131', '圆领', '37');
INSERT INTO `product_parameter_value` VALUES ('131', '套头', '38');
INSERT INTO `product_parameter_value` VALUES ('131', '纯色', '39');
INSERT INTO `product_parameter_value` VALUES ('131', '镂空 拼贴/拼接 蕾丝 褶皱', '40');
INSERT INTO `product_parameter_value` VALUES ('131', '96%及以上', '41');
INSERT INTO `product_parameter_value` VALUES ('131', '其他合成纤维', '42');
INSERT INTO `product_parameter_value` VALUES ('132', '直筒型', '31');
INSERT INTO `product_parameter_value` VALUES ('132', '通勤', '32');
INSERT INTO `product_parameter_value` VALUES ('132', '韩版', '33');
INSERT INTO `product_parameter_value` VALUES ('132', '常规款(50cm<衣长≤65cm)', '34');
INSERT INTO `product_parameter_value` VALUES ('132', '长袖', '35');
INSERT INTO `product_parameter_value` VALUES ('132', '常规袖', '36');
INSERT INTO `product_parameter_value` VALUES ('132', '圆领', '37');
INSERT INTO `product_parameter_value` VALUES ('132', '套头', '38');
INSERT INTO `product_parameter_value` VALUES ('132', '纯色', '39');
INSERT INTO `product_parameter_value` VALUES ('132', '镂空 拼贴/拼接 蕾丝 褶皱', '40');
INSERT INTO `product_parameter_value` VALUES ('132', '96%及以上', '41');
INSERT INTO `product_parameter_value` VALUES ('132', '其他合成纤维', '42');
INSERT INTO `product_parameter_value` VALUES ('133', '直筒型', '31');
INSERT INTO `product_parameter_value` VALUES ('133', '通勤', '32');
INSERT INTO `product_parameter_value` VALUES ('133', '韩版', '33');
INSERT INTO `product_parameter_value` VALUES ('133', '常规款(50cm<衣长≤65cm)', '34');
INSERT INTO `product_parameter_value` VALUES ('133', '长袖', '35');
INSERT INTO `product_parameter_value` VALUES ('133', '常规袖', '36');
INSERT INTO `product_parameter_value` VALUES ('133', '圆领', '37');
INSERT INTO `product_parameter_value` VALUES ('133', '套头', '38');
INSERT INTO `product_parameter_value` VALUES ('133', '纯色', '39');
INSERT INTO `product_parameter_value` VALUES ('133', '镂空 拼贴/拼接 蕾丝 褶皱', '40');
INSERT INTO `product_parameter_value` VALUES ('133', '96%及以上', '41');
INSERT INTO `product_parameter_value` VALUES ('133', '其他合成纤维', '42');
INSERT INTO `product_parameter_value` VALUES ('134', '直筒型', '31');
INSERT INTO `product_parameter_value` VALUES ('134', '通勤', '32');
INSERT INTO `product_parameter_value` VALUES ('134', '韩版', '33');
INSERT INTO `product_parameter_value` VALUES ('134', '常规款(50cm<衣长≤65cm)', '34');
INSERT INTO `product_parameter_value` VALUES ('134', '长袖', '35');
INSERT INTO `product_parameter_value` VALUES ('134', '常规袖', '36');
INSERT INTO `product_parameter_value` VALUES ('134', '圆领', '37');
INSERT INTO `product_parameter_value` VALUES ('134', '套头', '38');
INSERT INTO `product_parameter_value` VALUES ('134', '纯色', '39');
INSERT INTO `product_parameter_value` VALUES ('134', '镂空 拼贴/拼接 蕾丝 褶皱', '40');
INSERT INTO `product_parameter_value` VALUES ('134', '96%及以上', '41');
INSERT INTO `product_parameter_value` VALUES ('134', '其他合成纤维', '42');
INSERT INTO `product_parameter_value` VALUES ('135', '短袖（袖长<35cm）', '43');
INSERT INTO `product_parameter_value` VALUES ('135', '直筒型', '44');
INSERT INTO `product_parameter_value` VALUES ('135', '尖领', '45');
INSERT INTO `product_parameter_value` VALUES ('135', '时尚休闲', '46');
INSERT INTO `product_parameter_value` VALUES ('135', '格子布', '47');
INSERT INTO `product_parameter_value` VALUES ('135', '格子', '48');
INSERT INTO `product_parameter_value` VALUES ('135', '棉质', '49');
INSERT INTO `product_parameter_value` VALUES ('135', '95%以上', '50');
INSERT INTO `product_parameter_value` VALUES ('135', '2012', '51');
INSERT INTO `product_parameter_value` VALUES ('135', '夏', '52');
INSERT INTO `product_parameter_value` VALUES ('135', '青年', '53');
INSERT INTO `product_parameter_value` VALUES ('135', '休闲', '54');
INSERT INTO `product_parameter_value` VALUES ('136', '短袖（袖长<35cm）', '43');
INSERT INTO `product_parameter_value` VALUES ('136', '直筒型', '44');
INSERT INTO `product_parameter_value` VALUES ('136', '尖领', '45');
INSERT INTO `product_parameter_value` VALUES ('136', '时尚休闲', '46');
INSERT INTO `product_parameter_value` VALUES ('136', '格子布', '47');
INSERT INTO `product_parameter_value` VALUES ('136', '格子', '48');
INSERT INTO `product_parameter_value` VALUES ('136', '棉质', '49');
INSERT INTO `product_parameter_value` VALUES ('136', '95%以上', '50');
INSERT INTO `product_parameter_value` VALUES ('136', '2012', '51');
INSERT INTO `product_parameter_value` VALUES ('136', '夏', '52');
INSERT INTO `product_parameter_value` VALUES ('136', '青年', '53');
INSERT INTO `product_parameter_value` VALUES ('136', '休闲', '54');
INSERT INTO `product_parameter_value` VALUES ('137', '短袖（袖长<35cm）', '43');
INSERT INTO `product_parameter_value` VALUES ('137', '直筒型', '44');
INSERT INTO `product_parameter_value` VALUES ('137', '尖领', '45');
INSERT INTO `product_parameter_value` VALUES ('137', '时尚休闲', '46');
INSERT INTO `product_parameter_value` VALUES ('137', '格子布', '47');
INSERT INTO `product_parameter_value` VALUES ('137', '格子', '48');
INSERT INTO `product_parameter_value` VALUES ('137', '棉质', '49');
INSERT INTO `product_parameter_value` VALUES ('137', '95%以上', '50');
INSERT INTO `product_parameter_value` VALUES ('137', '2012', '51');
INSERT INTO `product_parameter_value` VALUES ('137', '夏', '52');
INSERT INTO `product_parameter_value` VALUES ('137', '青年', '53');
INSERT INTO `product_parameter_value` VALUES ('137', '休闲', '54');
INSERT INTO `product_parameter_value` VALUES ('138', '短袖（袖长<35cm）', '73');
INSERT INTO `product_parameter_value` VALUES ('138', '圆领', '74');
INSERT INTO `product_parameter_value` VALUES ('138', '印花', '77');
INSERT INTO `product_parameter_value` VALUES ('138', '商务休闲', '78');
INSERT INTO `product_parameter_value` VALUES ('138', '常规袖', '79');
INSERT INTO `product_parameter_value` VALUES ('138', '几何', '80');
INSERT INTO `product_parameter_value` VALUES ('138', '修身型', '81');
INSERT INTO `product_parameter_value` VALUES ('138', '棉质', '82');
INSERT INTO `product_parameter_value` VALUES ('138', '95%以上', '83');
INSERT INTO `product_parameter_value` VALUES ('138', '夏', '84');
INSERT INTO `product_parameter_value` VALUES ('138', '日常', '85');
INSERT INTO `product_parameter_value` VALUES ('138', '青年', '86');
INSERT INTO `product_parameter_value` VALUES ('138', '2012', '87');
INSERT INTO `product_parameter_value` VALUES ('139', '短袖（袖长<35cm）', '73');
INSERT INTO `product_parameter_value` VALUES ('139', '圆领', '74');
INSERT INTO `product_parameter_value` VALUES ('139', '印花', '77');
INSERT INTO `product_parameter_value` VALUES ('139', '商务休闲', '78');
INSERT INTO `product_parameter_value` VALUES ('139', '常规袖', '79');
INSERT INTO `product_parameter_value` VALUES ('139', '几何', '80');
INSERT INTO `product_parameter_value` VALUES ('139', '修身型', '81');
INSERT INTO `product_parameter_value` VALUES ('139', '棉质', '82');
INSERT INTO `product_parameter_value` VALUES ('139', '95%以上', '83');
INSERT INTO `product_parameter_value` VALUES ('139', '夏', '84');
INSERT INTO `product_parameter_value` VALUES ('139', '日常', '85');
INSERT INTO `product_parameter_value` VALUES ('139', '青年', '86');
INSERT INTO `product_parameter_value` VALUES ('139', '2012', '87');
INSERT INTO `product_parameter_value` VALUES ('140', '短袖（袖长<35cm）', '73');
INSERT INTO `product_parameter_value` VALUES ('140', '圆领', '74');
INSERT INTO `product_parameter_value` VALUES ('140', '印花', '77');
INSERT INTO `product_parameter_value` VALUES ('140', '商务休闲', '78');
INSERT INTO `product_parameter_value` VALUES ('140', '常规袖', '79');
INSERT INTO `product_parameter_value` VALUES ('140', '几何', '80');
INSERT INTO `product_parameter_value` VALUES ('140', '修身型', '81');
INSERT INTO `product_parameter_value` VALUES ('140', '棉质', '82');
INSERT INTO `product_parameter_value` VALUES ('140', '95%以上', '83');
INSERT INTO `product_parameter_value` VALUES ('140', '夏', '84');
INSERT INTO `product_parameter_value` VALUES ('140', '日常', '85');
INSERT INTO `product_parameter_value` VALUES ('140', '青年', '86');
INSERT INTO `product_parameter_value` VALUES ('140', '2012', '87');
INSERT INTO `product_parameter_value` VALUES ('141', '短袖（袖长<35cm）', '73');
INSERT INTO `product_parameter_value` VALUES ('141', '圆领', '74');
INSERT INTO `product_parameter_value` VALUES ('141', '印花', '77');
INSERT INTO `product_parameter_value` VALUES ('141', '商务休闲', '78');
INSERT INTO `product_parameter_value` VALUES ('141', '常规袖', '79');
INSERT INTO `product_parameter_value` VALUES ('141', '几何', '80');
INSERT INTO `product_parameter_value` VALUES ('141', '修身型', '81');
INSERT INTO `product_parameter_value` VALUES ('141', '棉质', '82');
INSERT INTO `product_parameter_value` VALUES ('141', '95%以上', '83');
INSERT INTO `product_parameter_value` VALUES ('141', '夏', '84');
INSERT INTO `product_parameter_value` VALUES ('141', '日常', '85');
INSERT INTO `product_parameter_value` VALUES ('141', '青年', '86');
INSERT INTO `product_parameter_value` VALUES ('141', '2012', '87');
INSERT INTO `product_parameter_value` VALUES ('142', '短袖（袖长<35cm）', '73');
INSERT INTO `product_parameter_value` VALUES ('142', '圆领', '74');
INSERT INTO `product_parameter_value` VALUES ('142', '印花', '77');
INSERT INTO `product_parameter_value` VALUES ('142', '商务休闲', '78');
INSERT INTO `product_parameter_value` VALUES ('142', '常规袖', '79');
INSERT INTO `product_parameter_value` VALUES ('142', '几何', '80');
INSERT INTO `product_parameter_value` VALUES ('142', '修身型', '81');
INSERT INTO `product_parameter_value` VALUES ('142', '棉质', '82');
INSERT INTO `product_parameter_value` VALUES ('142', '95%以上', '83');
INSERT INTO `product_parameter_value` VALUES ('142', '夏', '84');
INSERT INTO `product_parameter_value` VALUES ('142', '日常', '85');
INSERT INTO `product_parameter_value` VALUES ('142', '青年', '86');
INSERT INTO `product_parameter_value` VALUES ('142', '2012', '87');
INSERT INTO `product_parameter_value` VALUES ('143', '短袖（袖长<35cm）', '73');
INSERT INTO `product_parameter_value` VALUES ('143', '圆领', '74');
INSERT INTO `product_parameter_value` VALUES ('144', '短袖（袖长<35cm）', '73');
INSERT INTO `product_parameter_value` VALUES ('144', '圆领', '74');
INSERT INTO `product_parameter_value` VALUES ('145', '短袖（袖长<35cm）', '73');
INSERT INTO `product_parameter_value` VALUES ('145', '圆领', '74');
INSERT INTO `product_parameter_value` VALUES ('146', '短袖（袖长<35cm）', '73');
INSERT INTO `product_parameter_value` VALUES ('146', '圆领', '74');
INSERT INTO `product_parameter_value` VALUES ('147', '短袖（袖长<35cm）', '73');
INSERT INTO `product_parameter_value` VALUES ('147', '圆领', '74');
INSERT INTO `product_parameter_value` VALUES ('148', '短袖（袖长<35cm）', '73');
INSERT INTO `product_parameter_value` VALUES ('148', '圆领', '74');
INSERT INTO `product_parameter_value` VALUES ('149', '立领', '88');
INSERT INTO `product_parameter_value` VALUES ('149', '时尚休闲', '89');
INSERT INTO `product_parameter_value` VALUES ('149', '罗纹布', '90');
INSERT INTO `product_parameter_value` VALUES ('149', '拉链装饰', '91');
INSERT INTO `product_parameter_value` VALUES ('149', '春', '92');
INSERT INTO `product_parameter_value` VALUES ('149', '常规袖', '93');
INSERT INTO `product_parameter_value` VALUES ('149', '普通', '94');
INSERT INTO `product_parameter_value` VALUES ('149', '直筒型（腰围=胸围）', '95');
INSERT INTO `product_parameter_value` VALUES ('149', '锦纶', '96');
INSERT INTO `product_parameter_value` VALUES ('149', '95%以上', '97');
INSERT INTO `product_parameter_value` VALUES ('149', '休闲', '99');
INSERT INTO `product_parameter_value` VALUES ('149', '青年', '100');
INSERT INTO `product_parameter_value` VALUES ('149', '梭织分类', '101');
INSERT INTO `product_parameter_value` VALUES ('149', '本布下摆（针对拉链门襟）', '102');
INSERT INTO `product_parameter_value` VALUES ('149', '拉链挖袋', '103');
INSERT INTO `product_parameter_value` VALUES ('149', '拉链门襟', '104');
INSERT INTO `product_parameter_value` VALUES ('149', '超短（穿起衣长到胯骨及以上）', '105');
INSERT INTO `product_parameter_value` VALUES ('149', '纯色', '106');
INSERT INTO `product_parameter_value` VALUES ('150', '立领', '88');
INSERT INTO `product_parameter_value` VALUES ('150', '时尚休闲', '89');
INSERT INTO `product_parameter_value` VALUES ('150', '罗纹布', '90');
INSERT INTO `product_parameter_value` VALUES ('150', '拉链装饰', '91');
INSERT INTO `product_parameter_value` VALUES ('150', '春', '92');
INSERT INTO `product_parameter_value` VALUES ('150', '常规袖', '93');
INSERT INTO `product_parameter_value` VALUES ('150', '普通', '94');
INSERT INTO `product_parameter_value` VALUES ('150', '直筒型（腰围=胸围）', '95');
INSERT INTO `product_parameter_value` VALUES ('150', '锦纶', '96');
INSERT INTO `product_parameter_value` VALUES ('150', '95%以上', '97');
INSERT INTO `product_parameter_value` VALUES ('150', '休闲', '99');
INSERT INTO `product_parameter_value` VALUES ('150', '青年', '100');
INSERT INTO `product_parameter_value` VALUES ('150', '梭织分类', '101');
INSERT INTO `product_parameter_value` VALUES ('150', '本布下摆（针对拉链门襟）', '102');
INSERT INTO `product_parameter_value` VALUES ('150', '拉链挖袋', '103');
INSERT INTO `product_parameter_value` VALUES ('150', '拉链门襟', '104');
INSERT INTO `product_parameter_value` VALUES ('150', '超短（穿起衣长到胯骨及以上）', '105');
INSERT INTO `product_parameter_value` VALUES ('150', '纯色', '106');
INSERT INTO `product_parameter_value` VALUES ('151', '修身型', '107');
INSERT INTO `product_parameter_value` VALUES ('151', '薄款', '108');
INSERT INTO `product_parameter_value` VALUES ('151', '通勤', '109');
INSERT INTO `product_parameter_value` VALUES ('151', '通勤', '110');
INSERT INTO `product_parameter_value` VALUES ('151', '中长款(65cm<衣长≤80cm)', '111');
INSERT INTO `product_parameter_value` VALUES ('151', '七分袖', '112');
INSERT INTO `product_parameter_value` VALUES ('151', '翻领/POLO领', '113');
INSERT INTO `product_parameter_value` VALUES ('151', '泡泡袖', '114');
INSERT INTO `product_parameter_value` VALUES ('151', '双排扣', '115');
INSERT INTO `product_parameter_value` VALUES ('151', '纯色', '116');
INSERT INTO `product_parameter_value` VALUES ('151', '明线装饰 流苏 高温定', '117');
INSERT INTO `product_parameter_value` VALUES ('151', '棉', '118');
INSERT INTO `product_parameter_value` VALUES ('151', '81%-90%', '119');
INSERT INTO `product_parameter_value` VALUES ('151', '涤纶', '120');
INSERT INTO `product_parameter_value` VALUES ('152', '修身型', '107');
INSERT INTO `product_parameter_value` VALUES ('152', '薄款', '108');
INSERT INTO `product_parameter_value` VALUES ('152', '通勤', '109');
INSERT INTO `product_parameter_value` VALUES ('152', '通勤', '110');
INSERT INTO `product_parameter_value` VALUES ('152', '中长款(65cm<衣长≤80cm)', '111');
INSERT INTO `product_parameter_value` VALUES ('152', '七分袖', '112');
INSERT INTO `product_parameter_value` VALUES ('152', '翻领/POLO领', '113');
INSERT INTO `product_parameter_value` VALUES ('152', '泡泡袖', '114');
INSERT INTO `product_parameter_value` VALUES ('152', '双排扣', '115');
INSERT INTO `product_parameter_value` VALUES ('152', '纯色', '116');
INSERT INTO `product_parameter_value` VALUES ('152', '明线装饰 流苏 高温定', '117');
INSERT INTO `product_parameter_value` VALUES ('152', '棉', '118');
INSERT INTO `product_parameter_value` VALUES ('152', '81%-90%', '119');
INSERT INTO `product_parameter_value` VALUES ('152', '涤纶', '120');
INSERT INTO `product_parameter_value` VALUES ('153', '修身型', '107');
INSERT INTO `product_parameter_value` VALUES ('153', '薄款', '108');
INSERT INTO `product_parameter_value` VALUES ('153', '通勤', '109');
INSERT INTO `product_parameter_value` VALUES ('153', '通勤', '110');
INSERT INTO `product_parameter_value` VALUES ('153', '中长款(65cm<衣长≤80cm)', '111');
INSERT INTO `product_parameter_value` VALUES ('153', '七分袖', '112');
INSERT INTO `product_parameter_value` VALUES ('153', '翻领/POLO领', '113');
INSERT INTO `product_parameter_value` VALUES ('153', '泡泡袖', '114');
INSERT INTO `product_parameter_value` VALUES ('153', '双排扣', '115');
INSERT INTO `product_parameter_value` VALUES ('153', '纯色', '116');
INSERT INTO `product_parameter_value` VALUES ('153', '明线装饰 流苏 高温定', '117');
INSERT INTO `product_parameter_value` VALUES ('153', '棉', '118');
INSERT INTO `product_parameter_value` VALUES ('153', '81%-90%', '119');
INSERT INTO `product_parameter_value` VALUES ('153', '涤纶', '120');
INSERT INTO `product_parameter_value` VALUES ('154', '修身型', '107');
INSERT INTO `product_parameter_value` VALUES ('154', '薄款', '108');
INSERT INTO `product_parameter_value` VALUES ('154', '通勤', '109');
INSERT INTO `product_parameter_value` VALUES ('154', '通勤', '110');
INSERT INTO `product_parameter_value` VALUES ('154', '中长款(65cm<衣长≤80cm)', '111');
INSERT INTO `product_parameter_value` VALUES ('154', '七分袖', '112');
INSERT INTO `product_parameter_value` VALUES ('154', '翻领/POLO领', '113');
INSERT INTO `product_parameter_value` VALUES ('154', '泡泡袖', '114');
INSERT INTO `product_parameter_value` VALUES ('154', '双排扣', '115');
INSERT INTO `product_parameter_value` VALUES ('154', '纯色', '116');
INSERT INTO `product_parameter_value` VALUES ('154', '明线装饰 流苏 高温定', '117');
INSERT INTO `product_parameter_value` VALUES ('154', '棉', '118');
INSERT INTO `product_parameter_value` VALUES ('154', '81%-90%', '119');
INSERT INTO `product_parameter_value` VALUES ('154', '涤纶', '120');
INSERT INTO `product_parameter_value` VALUES ('155', '修身型', '107');
INSERT INTO `product_parameter_value` VALUES ('155', '薄款', '108');
INSERT INTO `product_parameter_value` VALUES ('155', '通勤', '109');
INSERT INTO `product_parameter_value` VALUES ('155', '通勤', '110');
INSERT INTO `product_parameter_value` VALUES ('155', '中长款(65cm<衣长≤80cm)', '111');
INSERT INTO `product_parameter_value` VALUES ('155', '七分袖', '112');
INSERT INTO `product_parameter_value` VALUES ('155', '翻领/POLO领', '113');
INSERT INTO `product_parameter_value` VALUES ('155', '泡泡袖', '114');
INSERT INTO `product_parameter_value` VALUES ('155', '双排扣', '115');
INSERT INTO `product_parameter_value` VALUES ('155', '纯色', '116');
INSERT INTO `product_parameter_value` VALUES ('155', '明线装饰 流苏 高温定', '117');
INSERT INTO `product_parameter_value` VALUES ('155', '棉', '118');
INSERT INTO `product_parameter_value` VALUES ('155', '81%-90%', '119');
INSERT INTO `product_parameter_value` VALUES ('155', '涤纶', '120');
INSERT INTO `product_parameter_value` VALUES ('156', '修身型', '107');
INSERT INTO `product_parameter_value` VALUES ('156', '薄款', '108');
INSERT INTO `product_parameter_value` VALUES ('156', '通勤', '109');
INSERT INTO `product_parameter_value` VALUES ('156', '通勤', '110');
INSERT INTO `product_parameter_value` VALUES ('156', '中长款(65cm<衣长≤80cm)', '111');
INSERT INTO `product_parameter_value` VALUES ('156', '七分袖', '112');
INSERT INTO `product_parameter_value` VALUES ('156', '翻领/POLO领', '113');
INSERT INTO `product_parameter_value` VALUES ('156', '泡泡袖', '114');
INSERT INTO `product_parameter_value` VALUES ('156', '双排扣', '115');
INSERT INTO `product_parameter_value` VALUES ('156', '纯色', '116');
INSERT INTO `product_parameter_value` VALUES ('156', '明线装饰 流苏 高温定', '117');
INSERT INTO `product_parameter_value` VALUES ('156', '棉', '118');
INSERT INTO `product_parameter_value` VALUES ('156', '81%-90%', '119');
INSERT INTO `product_parameter_value` VALUES ('156', '涤纶', '120');
INSERT INTO `product_parameter_value` VALUES ('157', '修身型', '107');
INSERT INTO `product_parameter_value` VALUES ('157', '薄款', '108');
INSERT INTO `product_parameter_value` VALUES ('157', '通勤', '109');
INSERT INTO `product_parameter_value` VALUES ('157', '通勤', '110');
INSERT INTO `product_parameter_value` VALUES ('157', '中长款(65cm<衣长≤80cm)', '111');
INSERT INTO `product_parameter_value` VALUES ('157', '七分袖', '112');
INSERT INTO `product_parameter_value` VALUES ('157', '翻领/POLO领', '113');
INSERT INTO `product_parameter_value` VALUES ('157', '泡泡袖', '114');
INSERT INTO `product_parameter_value` VALUES ('157', '双排扣', '115');
INSERT INTO `product_parameter_value` VALUES ('157', '纯色', '116');
INSERT INTO `product_parameter_value` VALUES ('157', '明线装饰 流苏 高温定', '117');
INSERT INTO `product_parameter_value` VALUES ('157', '棉', '118');
INSERT INTO `product_parameter_value` VALUES ('157', '81%-90%', '119');
INSERT INTO `product_parameter_value` VALUES ('157', '涤纶', '120');
INSERT INTO `product_parameter_value` VALUES ('158', '修身型', '107');
INSERT INTO `product_parameter_value` VALUES ('158', '薄款', '108');
INSERT INTO `product_parameter_value` VALUES ('158', '通勤', '109');
INSERT INTO `product_parameter_value` VALUES ('158', '通勤', '110');
INSERT INTO `product_parameter_value` VALUES ('158', '中长款(65cm<衣长≤80cm)', '111');
INSERT INTO `product_parameter_value` VALUES ('158', '七分袖', '112');
INSERT INTO `product_parameter_value` VALUES ('158', '翻领/POLO领', '113');
INSERT INTO `product_parameter_value` VALUES ('158', '泡泡袖', '114');
INSERT INTO `product_parameter_value` VALUES ('158', '双排扣', '115');
INSERT INTO `product_parameter_value` VALUES ('158', '纯色', '116');
INSERT INTO `product_parameter_value` VALUES ('158', '明线装饰 流苏 高温定', '117');
INSERT INTO `product_parameter_value` VALUES ('158', '棉', '118');
INSERT INTO `product_parameter_value` VALUES ('158', '81%-90%', '119');
INSERT INTO `product_parameter_value` VALUES ('158', '涤纶', '120');
INSERT INTO `product_parameter_value` VALUES ('159', '修身型', '107');
INSERT INTO `product_parameter_value` VALUES ('159', '薄款', '108');
INSERT INTO `product_parameter_value` VALUES ('159', '通勤', '109');
INSERT INTO `product_parameter_value` VALUES ('159', '通勤', '110');
INSERT INTO `product_parameter_value` VALUES ('159', '中长款(65cm<衣长≤80cm)', '111');
INSERT INTO `product_parameter_value` VALUES ('159', '七分袖', '112');
INSERT INTO `product_parameter_value` VALUES ('159', '翻领/POLO领', '113');
INSERT INTO `product_parameter_value` VALUES ('159', '泡泡袖', '114');
INSERT INTO `product_parameter_value` VALUES ('159', '双排扣', '115');
INSERT INTO `product_parameter_value` VALUES ('159', '纯色', '116');
INSERT INTO `product_parameter_value` VALUES ('159', '明线装饰 流苏 高温定', '117');
INSERT INTO `product_parameter_value` VALUES ('159', '棉', '118');
INSERT INTO `product_parameter_value` VALUES ('159', '81%-90%', '119');
INSERT INTO `product_parameter_value` VALUES ('159', '涤纶', '120');
INSERT INTO `product_parameter_value` VALUES ('160', '立领', '88');
INSERT INTO `product_parameter_value` VALUES ('160', '时尚休闲', '89');
INSERT INTO `product_parameter_value` VALUES ('160', '罗纹布', '90');
INSERT INTO `product_parameter_value` VALUES ('160', '拉链装饰', '91');
INSERT INTO `product_parameter_value` VALUES ('160', '春', '92');
INSERT INTO `product_parameter_value` VALUES ('160', '常规袖', '93');
INSERT INTO `product_parameter_value` VALUES ('160', '普通', '94');
INSERT INTO `product_parameter_value` VALUES ('160', '直筒型（腰围=胸围）', '95');
INSERT INTO `product_parameter_value` VALUES ('160', '涤纶', '96');
INSERT INTO `product_parameter_value` VALUES ('160', '95%以上', '98');
INSERT INTO `product_parameter_value` VALUES ('160', '休闲', '99');
INSERT INTO `product_parameter_value` VALUES ('160', '青年', '100');
INSERT INTO `product_parameter_value` VALUES ('160', '梭织分类', '101');
INSERT INTO `product_parameter_value` VALUES ('160', '罗纹下摆（针对拉链门襟）', '102');
INSERT INTO `product_parameter_value` VALUES ('160', '袋盖挖袋', '103');
INSERT INTO `product_parameter_value` VALUES ('160', '拉链门襟', '104');
INSERT INTO `product_parameter_value` VALUES ('160', '超短（穿起衣长到胯骨及以上）', '105');
INSERT INTO `product_parameter_value` VALUES ('160', '亮面', '106');
INSERT INTO `product_parameter_value` VALUES ('161', '立领', '88');
INSERT INTO `product_parameter_value` VALUES ('161', '时尚休闲', '89');
INSERT INTO `product_parameter_value` VALUES ('161', '罗纹布', '90');
INSERT INTO `product_parameter_value` VALUES ('161', '拉链装饰', '91');
INSERT INTO `product_parameter_value` VALUES ('161', '春', '92');
INSERT INTO `product_parameter_value` VALUES ('161', '常规袖', '93');
INSERT INTO `product_parameter_value` VALUES ('161', '普通', '94');
INSERT INTO `product_parameter_value` VALUES ('161', '直筒型（腰围=胸围）', '95');
INSERT INTO `product_parameter_value` VALUES ('161', '涤纶', '96');
INSERT INTO `product_parameter_value` VALUES ('161', '95%以上', '98');
INSERT INTO `product_parameter_value` VALUES ('161', '休闲', '99');
INSERT INTO `product_parameter_value` VALUES ('161', '青年', '100');
INSERT INTO `product_parameter_value` VALUES ('161', '梭织分类', '101');
INSERT INTO `product_parameter_value` VALUES ('161', '罗纹下摆（针对拉链门襟）', '102');
INSERT INTO `product_parameter_value` VALUES ('161', '袋盖挖袋', '103');
INSERT INTO `product_parameter_value` VALUES ('161', '拉链门襟', '104');
INSERT INTO `product_parameter_value` VALUES ('161', '超短（穿起衣长到胯骨及以上）', '105');
INSERT INTO `product_parameter_value` VALUES ('161', '亮面', '106');
INSERT INTO `product_parameter_value` VALUES ('162', '立领', '88');
INSERT INTO `product_parameter_value` VALUES ('162', '时尚休闲', '89');
INSERT INTO `product_parameter_value` VALUES ('162', '罗纹布', '90');
INSERT INTO `product_parameter_value` VALUES ('162', '拉链装饰', '91');
INSERT INTO `product_parameter_value` VALUES ('162', '春', '92');
INSERT INTO `product_parameter_value` VALUES ('162', '常规袖', '93');
INSERT INTO `product_parameter_value` VALUES ('162', '普通', '94');
INSERT INTO `product_parameter_value` VALUES ('162', '直筒型（腰围=胸围）', '95');
INSERT INTO `product_parameter_value` VALUES ('162', '涤纶', '96');
INSERT INTO `product_parameter_value` VALUES ('162', '95%以上', '98');
INSERT INTO `product_parameter_value` VALUES ('162', '休闲', '99');
INSERT INTO `product_parameter_value` VALUES ('162', '青年', '100');
INSERT INTO `product_parameter_value` VALUES ('162', '梭织分类', '101');
INSERT INTO `product_parameter_value` VALUES ('162', '罗纹下摆（针对拉链门襟）', '102');
INSERT INTO `product_parameter_value` VALUES ('162', '袋盖挖袋', '103');
INSERT INTO `product_parameter_value` VALUES ('162', '拉链门襟', '104');
INSERT INTO `product_parameter_value` VALUES ('162', '超短（穿起衣长到胯骨及以上）', '105');
INSERT INTO `product_parameter_value` VALUES ('162', '亮面', '106');
INSERT INTO `product_parameter_value` VALUES ('163', '立领', '88');
INSERT INTO `product_parameter_value` VALUES ('163', '时尚休闲', '89');
INSERT INTO `product_parameter_value` VALUES ('163', '罗纹布', '90');
INSERT INTO `product_parameter_value` VALUES ('163', '拉链装饰', '91');
INSERT INTO `product_parameter_value` VALUES ('163', '春', '92');
INSERT INTO `product_parameter_value` VALUES ('163', '常规袖', '93');
INSERT INTO `product_parameter_value` VALUES ('163', '普通', '94');
INSERT INTO `product_parameter_value` VALUES ('163', '直筒型（腰围=胸围）', '95');
INSERT INTO `product_parameter_value` VALUES ('163', '涤纶', '96');
INSERT INTO `product_parameter_value` VALUES ('163', '95%以上', '98');
INSERT INTO `product_parameter_value` VALUES ('163', '休闲', '99');
INSERT INTO `product_parameter_value` VALUES ('163', '青年', '100');
INSERT INTO `product_parameter_value` VALUES ('163', '梭织分类', '101');
INSERT INTO `product_parameter_value` VALUES ('163', '罗纹下摆（针对拉链门襟）', '102');
INSERT INTO `product_parameter_value` VALUES ('163', '袋盖挖袋', '103');
INSERT INTO `product_parameter_value` VALUES ('163', '拉链门襟', '104');
INSERT INTO `product_parameter_value` VALUES ('163', '超短（穿起衣长到胯骨及以上）', '105');
INSERT INTO `product_parameter_value` VALUES ('163', '亮面', '106');
INSERT INTO `product_parameter_value` VALUES ('164', '立领', '88');
INSERT INTO `product_parameter_value` VALUES ('164', '时尚休闲', '89');
INSERT INTO `product_parameter_value` VALUES ('164', '罗纹布', '90');
INSERT INTO `product_parameter_value` VALUES ('164', '拉链装饰', '91');
INSERT INTO `product_parameter_value` VALUES ('164', '春', '92');
INSERT INTO `product_parameter_value` VALUES ('164', '常规袖', '93');
INSERT INTO `product_parameter_value` VALUES ('164', '普通', '94');
INSERT INTO `product_parameter_value` VALUES ('164', '直筒型（腰围=胸围）', '95');
INSERT INTO `product_parameter_value` VALUES ('164', '涤纶', '96');
INSERT INTO `product_parameter_value` VALUES ('164', '95%以上', '98');
INSERT INTO `product_parameter_value` VALUES ('164', '休闲', '99');
INSERT INTO `product_parameter_value` VALUES ('164', '青年', '100');
INSERT INTO `product_parameter_value` VALUES ('164', '梭织分类', '101');
INSERT INTO `product_parameter_value` VALUES ('164', '罗纹下摆（针对拉链门襟）', '102');
INSERT INTO `product_parameter_value` VALUES ('164', '袋盖挖袋', '103');
INSERT INTO `product_parameter_value` VALUES ('164', '拉链门襟', '104');
INSERT INTO `product_parameter_value` VALUES ('164', '超短（穿起衣长到胯骨及以上）', '105');
INSERT INTO `product_parameter_value` VALUES ('164', '亮面', '106');
INSERT INTO `product_parameter_value` VALUES ('165', '立领', '88');
INSERT INTO `product_parameter_value` VALUES ('165', '时尚休闲', '89');
INSERT INTO `product_parameter_value` VALUES ('165', '罗纹布', '90');
INSERT INTO `product_parameter_value` VALUES ('165', '拉链装饰', '91');
INSERT INTO `product_parameter_value` VALUES ('165', '春', '92');
INSERT INTO `product_parameter_value` VALUES ('165', '常规袖', '93');
INSERT INTO `product_parameter_value` VALUES ('165', '普通', '94');
INSERT INTO `product_parameter_value` VALUES ('165', '直筒型（腰围=胸围）', '95');
INSERT INTO `product_parameter_value` VALUES ('165', '涤纶', '96');
INSERT INTO `product_parameter_value` VALUES ('165', '95%以上', '98');
INSERT INTO `product_parameter_value` VALUES ('165', '休闲', '99');
INSERT INTO `product_parameter_value` VALUES ('165', '青年', '100');
INSERT INTO `product_parameter_value` VALUES ('165', '梭织分类', '101');
INSERT INTO `product_parameter_value` VALUES ('165', '罗纹下摆（针对拉链门襟）', '102');
INSERT INTO `product_parameter_value` VALUES ('165', '袋盖挖袋', '103');
INSERT INTO `product_parameter_value` VALUES ('165', '拉链门襟', '104');
INSERT INTO `product_parameter_value` VALUES ('165', '超短（穿起衣长到胯骨及以上）', '105');
INSERT INTO `product_parameter_value` VALUES ('165', '亮面', '106');
INSERT INTO `product_parameter_value` VALUES ('166', '立领', '88');
INSERT INTO `product_parameter_value` VALUES ('166', '时尚休闲', '89');
INSERT INTO `product_parameter_value` VALUES ('166', '罗纹布', '90');
INSERT INTO `product_parameter_value` VALUES ('166', '拉链装饰', '91');
INSERT INTO `product_parameter_value` VALUES ('166', '春', '92');
INSERT INTO `product_parameter_value` VALUES ('166', '常规袖', '93');
INSERT INTO `product_parameter_value` VALUES ('166', '普通', '94');
INSERT INTO `product_parameter_value` VALUES ('166', '直筒型（腰围=胸围）', '95');
INSERT INTO `product_parameter_value` VALUES ('166', '涤纶', '96');
INSERT INTO `product_parameter_value` VALUES ('166', '95%以上', '98');
INSERT INTO `product_parameter_value` VALUES ('166', '休闲', '99');
INSERT INTO `product_parameter_value` VALUES ('166', '青年', '100');
INSERT INTO `product_parameter_value` VALUES ('166', '梭织分类', '101');
INSERT INTO `product_parameter_value` VALUES ('166', '罗纹下摆（针对拉链门襟）', '102');
INSERT INTO `product_parameter_value` VALUES ('166', '袋盖挖袋', '103');
INSERT INTO `product_parameter_value` VALUES ('166', '拉链门襟', '104');
INSERT INTO `product_parameter_value` VALUES ('166', '超短（穿起衣长到胯骨及以上）', '105');
INSERT INTO `product_parameter_value` VALUES ('166', '亮面', '106');
INSERT INTO `product_parameter_value` VALUES ('167', '长袖（袖长>57cm）', '43');
INSERT INTO `product_parameter_value` VALUES ('167', '宽松型（腰围>胸围）', '44');
INSERT INTO `product_parameter_value` VALUES ('167', '尖领', '45');
INSERT INTO `product_parameter_value` VALUES ('167', '商务正装', '46');
INSERT INTO `product_parameter_value` VALUES ('167', '纯色布', '47');
INSERT INTO `product_parameter_value` VALUES ('167', '纯色', '48');
INSERT INTO `product_parameter_value` VALUES ('167', '棉质', '49');
INSERT INTO `product_parameter_value` VALUES ('167', '2012', '51');
INSERT INTO `product_parameter_value` VALUES ('167', '秋', '52');
INSERT INTO `product_parameter_value` VALUES ('167', '青年', '53');
INSERT INTO `product_parameter_value` VALUES ('167', '上班', '54');
INSERT INTO `product_parameter_value` VALUES ('168', '长袖（袖长>57cm）', '43');
INSERT INTO `product_parameter_value` VALUES ('168', '宽松型（腰围>胸围）', '44');
INSERT INTO `product_parameter_value` VALUES ('168', '尖领', '45');
INSERT INTO `product_parameter_value` VALUES ('168', '商务正装', '46');
INSERT INTO `product_parameter_value` VALUES ('168', '纯色布', '47');
INSERT INTO `product_parameter_value` VALUES ('168', '纯色', '48');
INSERT INTO `product_parameter_value` VALUES ('168', '棉质', '49');
INSERT INTO `product_parameter_value` VALUES ('168', '2012', '51');
INSERT INTO `product_parameter_value` VALUES ('168', '秋', '52');
INSERT INTO `product_parameter_value` VALUES ('168', '青年', '53');
INSERT INTO `product_parameter_value` VALUES ('168', '上班', '54');
INSERT INTO `product_parameter_value` VALUES ('169', '长袖（袖长>57cm）', '43');
INSERT INTO `product_parameter_value` VALUES ('169', '宽松型（腰围>胸围）', '44');
INSERT INTO `product_parameter_value` VALUES ('169', '尖领', '45');
INSERT INTO `product_parameter_value` VALUES ('169', '商务正装', '46');
INSERT INTO `product_parameter_value` VALUES ('169', '纯色布', '47');
INSERT INTO `product_parameter_value` VALUES ('169', '纯色', '48');
INSERT INTO `product_parameter_value` VALUES ('169', '棉质', '49');
INSERT INTO `product_parameter_value` VALUES ('169', '2012', '51');
INSERT INTO `product_parameter_value` VALUES ('169', '秋', '52');
INSERT INTO `product_parameter_value` VALUES ('169', '青年', '53');
INSERT INTO `product_parameter_value` VALUES ('169', '上班', '54');
INSERT INTO `product_parameter_value` VALUES ('170', '长袖（袖长>57cm）', '43');
INSERT INTO `product_parameter_value` VALUES ('170', '宽松型（腰围>胸围）', '44');
INSERT INTO `product_parameter_value` VALUES ('170', '尖领', '45');
INSERT INTO `product_parameter_value` VALUES ('170', '商务正装', '46');
INSERT INTO `product_parameter_value` VALUES ('170', '纯色布', '47');
INSERT INTO `product_parameter_value` VALUES ('170', '纯色', '48');
INSERT INTO `product_parameter_value` VALUES ('170', '棉质', '49');
INSERT INTO `product_parameter_value` VALUES ('170', '2012', '51');
INSERT INTO `product_parameter_value` VALUES ('170', '秋', '52');
INSERT INTO `product_parameter_value` VALUES ('170', '青年', '53');
INSERT INTO `product_parameter_value` VALUES ('170', '上班', '54');
INSERT INTO `product_parameter_value` VALUES ('171', '长袖（袖长>57cm）', '43');
INSERT INTO `product_parameter_value` VALUES ('171', '宽松型（腰围>胸围）', '44');
INSERT INTO `product_parameter_value` VALUES ('171', '尖领', '45');
INSERT INTO `product_parameter_value` VALUES ('171', '商务正装', '46');
INSERT INTO `product_parameter_value` VALUES ('171', '纯色布', '47');
INSERT INTO `product_parameter_value` VALUES ('171', '纯色', '48');
INSERT INTO `product_parameter_value` VALUES ('171', '棉质', '49');
INSERT INTO `product_parameter_value` VALUES ('171', '2012', '51');
INSERT INTO `product_parameter_value` VALUES ('171', '秋', '52');
INSERT INTO `product_parameter_value` VALUES ('171', '青年', '53');
INSERT INTO `product_parameter_value` VALUES ('171', '上班', '54');
INSERT INTO `product_parameter_value` VALUES ('172', '长袖（袖长>57cm）', '43');
INSERT INTO `product_parameter_value` VALUES ('172', '宽松型（腰围>胸围）', '44');
INSERT INTO `product_parameter_value` VALUES ('172', '尖领', '45');
INSERT INTO `product_parameter_value` VALUES ('172', '商务正装', '46');
INSERT INTO `product_parameter_value` VALUES ('172', '纯色布', '47');
INSERT INTO `product_parameter_value` VALUES ('172', '纯色', '48');
INSERT INTO `product_parameter_value` VALUES ('172', '棉质', '49');
INSERT INTO `product_parameter_value` VALUES ('172', '2012', '51');
INSERT INTO `product_parameter_value` VALUES ('172', '秋', '52');
INSERT INTO `product_parameter_value` VALUES ('172', '青年', '53');
INSERT INTO `product_parameter_value` VALUES ('172', '上班', '54');
INSERT INTO `product_parameter_value` VALUES ('173', '长袖（袖长>57cm）', '43');
INSERT INTO `product_parameter_value` VALUES ('173', '宽松型（腰围>胸围）', '44');
INSERT INTO `product_parameter_value` VALUES ('173', '尖领', '45');
INSERT INTO `product_parameter_value` VALUES ('173', '商务正装', '46');
INSERT INTO `product_parameter_value` VALUES ('173', '纯色布', '47');
INSERT INTO `product_parameter_value` VALUES ('173', '纯色', '48');
INSERT INTO `product_parameter_value` VALUES ('173', '棉质', '49');
INSERT INTO `product_parameter_value` VALUES ('173', '2012', '51');
INSERT INTO `product_parameter_value` VALUES ('173', '秋', '52');
INSERT INTO `product_parameter_value` VALUES ('173', '青年', '53');
INSERT INTO `product_parameter_value` VALUES ('173', '上班', '54');
INSERT INTO `product_parameter_value` VALUES ('174', '长袖（袖长>57cm）', '43');
INSERT INTO `product_parameter_value` VALUES ('174', '宽松型（腰围>胸围）', '44');
INSERT INTO `product_parameter_value` VALUES ('174', '尖领', '45');
INSERT INTO `product_parameter_value` VALUES ('174', '商务正装', '46');
INSERT INTO `product_parameter_value` VALUES ('174', '纯色布', '47');
INSERT INTO `product_parameter_value` VALUES ('174', '纯色', '48');
INSERT INTO `product_parameter_value` VALUES ('174', '棉质', '49');
INSERT INTO `product_parameter_value` VALUES ('174', '2012', '51');
INSERT INTO `product_parameter_value` VALUES ('174', '秋', '52');
INSERT INTO `product_parameter_value` VALUES ('174', '青年', '53');
INSERT INTO `product_parameter_value` VALUES ('174', '上班', '54');
INSERT INTO `product_parameter_value` VALUES ('175', '通勤', '1');
INSERT INTO `product_parameter_value` VALUES ('175', '两件套', '3');
INSERT INTO `product_parameter_value` VALUES ('175', '短裙(76-90厘米)', '4');
INSERT INTO `product_parameter_value` VALUES ('175', '其他款式', '5');
INSERT INTO `product_parameter_value` VALUES ('175', '短袖', '6');
INSERT INTO `product_parameter_value` VALUES ('175', '圆领', '7');
INSERT INTO `product_parameter_value` VALUES ('175', '常规袖', '8');
INSERT INTO `product_parameter_value` VALUES ('175', '中腰', '9');
INSERT INTO `product_parameter_value` VALUES ('175', '拉链', '10');
INSERT INTO `product_parameter_value` VALUES ('175', '花色', '12');
INSERT INTO `product_parameter_value` VALUES ('175', '蕾丝', '14');
INSERT INTO `product_parameter_value` VALUES ('175', '81%-90%', '15');
INSERT INTO `product_parameter_value` VALUES ('175', '聚酯纤维', '16');
INSERT INTO `product_parameter_value` VALUES ('176', '通勤', '1');
INSERT INTO `product_parameter_value` VALUES ('176', '两件套', '3');
INSERT INTO `product_parameter_value` VALUES ('176', '短裙(76-90厘米)', '4');
INSERT INTO `product_parameter_value` VALUES ('176', '其他款式', '5');
INSERT INTO `product_parameter_value` VALUES ('176', '短袖', '6');
INSERT INTO `product_parameter_value` VALUES ('176', '圆领', '7');
INSERT INTO `product_parameter_value` VALUES ('176', '常规袖', '8');
INSERT INTO `product_parameter_value` VALUES ('176', '中腰', '9');
INSERT INTO `product_parameter_value` VALUES ('176', '拉链', '10');
INSERT INTO `product_parameter_value` VALUES ('176', '花色', '12');
INSERT INTO `product_parameter_value` VALUES ('176', '蕾丝', '14');
INSERT INTO `product_parameter_value` VALUES ('176', '81%-90%', '15');
INSERT INTO `product_parameter_value` VALUES ('176', '聚酯纤维', '16');
INSERT INTO `product_parameter_value` VALUES ('177', '通勤', '1');
INSERT INTO `product_parameter_value` VALUES ('177', '两件套', '3');
INSERT INTO `product_parameter_value` VALUES ('177', '短裙(76-90厘米)', '4');
INSERT INTO `product_parameter_value` VALUES ('177', '其他款式', '5');
INSERT INTO `product_parameter_value` VALUES ('177', '短袖', '6');
INSERT INTO `product_parameter_value` VALUES ('177', '圆领', '7');
INSERT INTO `product_parameter_value` VALUES ('177', '常规袖', '8');
INSERT INTO `product_parameter_value` VALUES ('177', '中腰', '9');
INSERT INTO `product_parameter_value` VALUES ('177', '拉链', '10');
INSERT INTO `product_parameter_value` VALUES ('177', '花色', '12');
INSERT INTO `product_parameter_value` VALUES ('177', '蕾丝', '14');
INSERT INTO `product_parameter_value` VALUES ('177', '81%-90%', '15');
INSERT INTO `product_parameter_value` VALUES ('177', '聚酯纤维', '16');
INSERT INTO `product_parameter_value` VALUES ('178', '长袖（袖长>57cm）', '43');
INSERT INTO `product_parameter_value` VALUES ('178', '宽松型（腰围>胸围）', '44');
INSERT INTO `product_parameter_value` VALUES ('178', '尖领', '45');
INSERT INTO `product_parameter_value` VALUES ('178', '商务休闲', '46');
INSERT INTO `product_parameter_value` VALUES ('178', '纯色布', '47');
INSERT INTO `product_parameter_value` VALUES ('178', '纯色', '48');
INSERT INTO `product_parameter_value` VALUES ('178', '其它合成纤维', '49');
INSERT INTO `product_parameter_value` VALUES ('178', '2012', '51');
INSERT INTO `product_parameter_value` VALUES ('178', '秋', '52');
INSERT INTO `product_parameter_value` VALUES ('178', '青年', '53');
INSERT INTO `product_parameter_value` VALUES ('178', '上班', '54');
INSERT INTO `product_parameter_value` VALUES ('179', '长袖（袖长>57cm）', '43');
INSERT INTO `product_parameter_value` VALUES ('179', '宽松型（腰围>胸围）', '44');
INSERT INTO `product_parameter_value` VALUES ('179', '尖领', '45');
INSERT INTO `product_parameter_value` VALUES ('179', '商务休闲', '46');
INSERT INTO `product_parameter_value` VALUES ('179', '纯色布', '47');
INSERT INTO `product_parameter_value` VALUES ('179', '纯色', '48');
INSERT INTO `product_parameter_value` VALUES ('179', '其它合成纤维', '49');
INSERT INTO `product_parameter_value` VALUES ('179', '2012', '51');
INSERT INTO `product_parameter_value` VALUES ('179', '秋', '52');
INSERT INTO `product_parameter_value` VALUES ('179', '青年', '53');
INSERT INTO `product_parameter_value` VALUES ('179', '上班', '54');
INSERT INTO `product_parameter_value` VALUES ('180', '长袖（袖长>57cm）', '43');
INSERT INTO `product_parameter_value` VALUES ('180', '宽松型（腰围>胸围）', '44');
INSERT INTO `product_parameter_value` VALUES ('180', '尖领', '45');
INSERT INTO `product_parameter_value` VALUES ('180', '商务休闲', '46');
INSERT INTO `product_parameter_value` VALUES ('180', '纯色布', '47');
INSERT INTO `product_parameter_value` VALUES ('180', '纯色', '48');
INSERT INTO `product_parameter_value` VALUES ('180', '其它合成纤维', '49');
INSERT INTO `product_parameter_value` VALUES ('180', '2012', '51');
INSERT INTO `product_parameter_value` VALUES ('180', '秋', '52');
INSERT INTO `product_parameter_value` VALUES ('180', '青年', '53');
INSERT INTO `product_parameter_value` VALUES ('180', '上班', '54');
INSERT INTO `product_parameter_value` VALUES ('181', '长袖（袖长>57cm）', '43');
INSERT INTO `product_parameter_value` VALUES ('181', '宽松型（腰围>胸围）', '44');
INSERT INTO `product_parameter_value` VALUES ('181', '尖领', '45');
INSERT INTO `product_parameter_value` VALUES ('181', '商务休闲', '46');
INSERT INTO `product_parameter_value` VALUES ('181', '纯色布', '47');
INSERT INTO `product_parameter_value` VALUES ('181', '纯色', '48');
INSERT INTO `product_parameter_value` VALUES ('181', '其它合成纤维', '49');
INSERT INTO `product_parameter_value` VALUES ('181', '2012', '51');
INSERT INTO `product_parameter_value` VALUES ('181', '秋', '52');
INSERT INTO `product_parameter_value` VALUES ('181', '青年', '53');
INSERT INTO `product_parameter_value` VALUES ('181', '上班', '54');
INSERT INTO `product_parameter_value` VALUES ('182', '长袖（袖长>57cm）', '43');
INSERT INTO `product_parameter_value` VALUES ('182', '宽松型（腰围>胸围）', '44');
INSERT INTO `product_parameter_value` VALUES ('182', '尖领', '45');
INSERT INTO `product_parameter_value` VALUES ('182', '商务休闲', '46');
INSERT INTO `product_parameter_value` VALUES ('182', '纯色布', '47');
INSERT INTO `product_parameter_value` VALUES ('182', '纯色', '48');
INSERT INTO `product_parameter_value` VALUES ('182', '其它合成纤维', '49');
INSERT INTO `product_parameter_value` VALUES ('182', '2012', '51');
INSERT INTO `product_parameter_value` VALUES ('182', '秋', '52');
INSERT INTO `product_parameter_value` VALUES ('182', '青年', '53');
INSERT INTO `product_parameter_value` VALUES ('182', '上班', '54');
INSERT INTO `product_parameter_value` VALUES ('183', '长袖（袖长>57cm）', '43');
INSERT INTO `product_parameter_value` VALUES ('183', '宽松型（腰围>胸围）', '44');
INSERT INTO `product_parameter_value` VALUES ('183', '尖领', '45');
INSERT INTO `product_parameter_value` VALUES ('183', '商务休闲', '46');
INSERT INTO `product_parameter_value` VALUES ('183', '纯色布', '47');
INSERT INTO `product_parameter_value` VALUES ('183', '纯色', '48');
INSERT INTO `product_parameter_value` VALUES ('183', '其它合成纤维', '49');
INSERT INTO `product_parameter_value` VALUES ('183', '2012', '51');
INSERT INTO `product_parameter_value` VALUES ('183', '秋', '52');
INSERT INTO `product_parameter_value` VALUES ('183', '青年', '53');
INSERT INTO `product_parameter_value` VALUES ('183', '上班', '54');
INSERT INTO `product_parameter_value` VALUES ('184', '长袖（袖长>57cm）', '43');
INSERT INTO `product_parameter_value` VALUES ('184', '宽松型（腰围>胸围）', '44');
INSERT INTO `product_parameter_value` VALUES ('184', '尖领', '45');
INSERT INTO `product_parameter_value` VALUES ('184', '商务休闲', '46');
INSERT INTO `product_parameter_value` VALUES ('184', '纯色布', '47');
INSERT INTO `product_parameter_value` VALUES ('184', '纯色', '48');
INSERT INTO `product_parameter_value` VALUES ('184', '其它合成纤维', '49');
INSERT INTO `product_parameter_value` VALUES ('184', '2012', '51');
INSERT INTO `product_parameter_value` VALUES ('184', '秋', '52');
INSERT INTO `product_parameter_value` VALUES ('184', '青年', '53');
INSERT INTO `product_parameter_value` VALUES ('184', '上班', '54');
INSERT INTO `product_parameter_value` VALUES ('185', '长袖（袖长>57cm）', '43');
INSERT INTO `product_parameter_value` VALUES ('185', '宽松型（腰围>胸围）', '44');
INSERT INTO `product_parameter_value` VALUES ('185', '尖领', '45');
INSERT INTO `product_parameter_value` VALUES ('185', '商务休闲', '46');
INSERT INTO `product_parameter_value` VALUES ('185', '纯色布', '47');
INSERT INTO `product_parameter_value` VALUES ('185', '纯色', '48');
INSERT INTO `product_parameter_value` VALUES ('185', '其它合成纤维', '49');
INSERT INTO `product_parameter_value` VALUES ('185', '2012', '51');
INSERT INTO `product_parameter_value` VALUES ('185', '秋', '52');
INSERT INTO `product_parameter_value` VALUES ('185', '青年', '53');
INSERT INTO `product_parameter_value` VALUES ('185', '上班', '54');
INSERT INTO `product_parameter_value` VALUES ('186', '长袖（袖长>57cm）', '43');
INSERT INTO `product_parameter_value` VALUES ('186', '宽松型（腰围>胸围）', '44');
INSERT INTO `product_parameter_value` VALUES ('186', '尖领', '45');
INSERT INTO `product_parameter_value` VALUES ('186', '商务休闲', '46');
INSERT INTO `product_parameter_value` VALUES ('186', '纯色布', '47');
INSERT INTO `product_parameter_value` VALUES ('186', '纯色', '48');
INSERT INTO `product_parameter_value` VALUES ('186', '其它合成纤维', '49');
INSERT INTO `product_parameter_value` VALUES ('186', '2012', '51');
INSERT INTO `product_parameter_value` VALUES ('186', '秋', '52');
INSERT INTO `product_parameter_value` VALUES ('186', '青年', '53');
INSERT INTO `product_parameter_value` VALUES ('186', '上班', '54');
INSERT INTO `product_parameter_value` VALUES ('187', '长袖（袖长>57cm）', '43');
INSERT INTO `product_parameter_value` VALUES ('187', '宽松型（腰围>胸围）', '44');
INSERT INTO `product_parameter_value` VALUES ('187', '尖领', '45');
INSERT INTO `product_parameter_value` VALUES ('187', '商务休闲', '46');
INSERT INTO `product_parameter_value` VALUES ('187', '纯色布', '47');
INSERT INTO `product_parameter_value` VALUES ('187', '纯色', '48');
INSERT INTO `product_parameter_value` VALUES ('187', '其它合成纤维', '49');
INSERT INTO `product_parameter_value` VALUES ('187', '2012', '51');
INSERT INTO `product_parameter_value` VALUES ('187', '秋', '52');
INSERT INTO `product_parameter_value` VALUES ('187', '青年', '53');
INSERT INTO `product_parameter_value` VALUES ('187', '上班', '54');
INSERT INTO `product_parameter_value` VALUES ('188', '长袖（袖长>57cm）', '43');
INSERT INTO `product_parameter_value` VALUES ('188', '宽松型（腰围>胸围）', '44');
INSERT INTO `product_parameter_value` VALUES ('188', '尖领', '45');
INSERT INTO `product_parameter_value` VALUES ('188', '商务休闲', '46');
INSERT INTO `product_parameter_value` VALUES ('188', '纯色布', '47');
INSERT INTO `product_parameter_value` VALUES ('188', '纯色', '48');
INSERT INTO `product_parameter_value` VALUES ('188', '其它合成纤维', '49');
INSERT INTO `product_parameter_value` VALUES ('188', '2012', '51');
INSERT INTO `product_parameter_value` VALUES ('188', '秋', '52');
INSERT INTO `product_parameter_value` VALUES ('188', '青年', '53');
INSERT INTO `product_parameter_value` VALUES ('188', '上班', '54');
INSERT INTO `product_parameter_value` VALUES ('189', '长袖（袖长>57cm）', '43');
INSERT INTO `product_parameter_value` VALUES ('189', '宽松型（腰围>胸围）', '44');
INSERT INTO `product_parameter_value` VALUES ('189', '尖领', '45');
INSERT INTO `product_parameter_value` VALUES ('189', '商务休闲', '46');
INSERT INTO `product_parameter_value` VALUES ('189', '纯色布', '47');
INSERT INTO `product_parameter_value` VALUES ('189', '纯色', '48');
INSERT INTO `product_parameter_value` VALUES ('189', '其它合成纤维', '49');
INSERT INTO `product_parameter_value` VALUES ('189', '2012', '51');
INSERT INTO `product_parameter_value` VALUES ('189', '秋', '52');
INSERT INTO `product_parameter_value` VALUES ('189', '青年', '53');
INSERT INTO `product_parameter_value` VALUES ('189', '上班', '54');
INSERT INTO `product_parameter_value` VALUES ('190', '修身型', '17');
INSERT INTO `product_parameter_value` VALUES ('190', '薄款', '18');
INSERT INTO `product_parameter_value` VALUES ('190', '单件', '19');
INSERT INTO `product_parameter_value` VALUES ('190', '通勤', '20');
INSERT INTO `product_parameter_value` VALUES ('190', 'OL', '21');
INSERT INTO `product_parameter_value` VALUES ('190', '常规款(50cm<衣长≤65cm)', '22');
INSERT INTO `product_parameter_value` VALUES ('190', '长袖', '23');
INSERT INTO `product_parameter_value` VALUES ('190', '常规袖', '25');
INSERT INTO `product_parameter_value` VALUES ('190', '纯色', '27');
INSERT INTO `product_parameter_value` VALUES ('190', '纽扣', '28');
INSERT INTO `product_parameter_value` VALUES ('190', '其他人造纤维', '29');
INSERT INTO `product_parameter_value` VALUES ('190', '96%及以上', '30');
INSERT INTO `product_parameter_value` VALUES ('191', '修身型', '17');
INSERT INTO `product_parameter_value` VALUES ('191', '薄款', '18');
INSERT INTO `product_parameter_value` VALUES ('191', '单件', '19');
INSERT INTO `product_parameter_value` VALUES ('191', '通勤', '20');
INSERT INTO `product_parameter_value` VALUES ('191', 'OL', '21');
INSERT INTO `product_parameter_value` VALUES ('191', '常规款(50cm<衣长≤65cm)', '22');
INSERT INTO `product_parameter_value` VALUES ('191', '长袖', '23');
INSERT INTO `product_parameter_value` VALUES ('191', '常规袖', '25');
INSERT INTO `product_parameter_value` VALUES ('191', '纯色', '27');
INSERT INTO `product_parameter_value` VALUES ('191', '纽扣', '28');
INSERT INTO `product_parameter_value` VALUES ('191', '其他人造纤维', '29');
INSERT INTO `product_parameter_value` VALUES ('191', '96%及以上', '30');
INSERT INTO `product_parameter_value` VALUES ('192', '修身型', '17');
INSERT INTO `product_parameter_value` VALUES ('192', '薄款', '18');
INSERT INTO `product_parameter_value` VALUES ('192', '单件', '19');
INSERT INTO `product_parameter_value` VALUES ('192', '通勤', '20');
INSERT INTO `product_parameter_value` VALUES ('192', 'OL', '21');
INSERT INTO `product_parameter_value` VALUES ('192', '常规款(50cm<衣长≤65cm)', '22');
INSERT INTO `product_parameter_value` VALUES ('192', '长袖', '23');
INSERT INTO `product_parameter_value` VALUES ('192', '常规袖', '25');
INSERT INTO `product_parameter_value` VALUES ('192', '纯色', '27');
INSERT INTO `product_parameter_value` VALUES ('192', '纽扣', '28');
INSERT INTO `product_parameter_value` VALUES ('192', '其他人造纤维', '29');
INSERT INTO `product_parameter_value` VALUES ('192', '96%及以上', '30');
INSERT INTO `product_parameter_value` VALUES ('193', '修身型', '17');
INSERT INTO `product_parameter_value` VALUES ('193', '薄款', '18');
INSERT INTO `product_parameter_value` VALUES ('193', '单件', '19');
INSERT INTO `product_parameter_value` VALUES ('193', '通勤', '20');
INSERT INTO `product_parameter_value` VALUES ('193', 'OL', '21');
INSERT INTO `product_parameter_value` VALUES ('193', '常规款(50cm<衣长≤65cm)', '22');
INSERT INTO `product_parameter_value` VALUES ('193', '长袖', '23');
INSERT INTO `product_parameter_value` VALUES ('193', '常规袖', '25');
INSERT INTO `product_parameter_value` VALUES ('193', '纯色', '27');
INSERT INTO `product_parameter_value` VALUES ('193', '纽扣', '28');
INSERT INTO `product_parameter_value` VALUES ('193', '其他人造纤维', '29');
INSERT INTO `product_parameter_value` VALUES ('193', '96%及以上', '30');
INSERT INTO `product_parameter_value` VALUES ('194', '修身型', '17');
INSERT INTO `product_parameter_value` VALUES ('194', '薄款', '18');
INSERT INTO `product_parameter_value` VALUES ('194', '单件', '19');
INSERT INTO `product_parameter_value` VALUES ('194', '通勤', '20');
INSERT INTO `product_parameter_value` VALUES ('194', 'OL', '21');
INSERT INTO `product_parameter_value` VALUES ('194', '常规款(50cm<衣长≤65cm)', '22');
INSERT INTO `product_parameter_value` VALUES ('194', '长袖', '23');
INSERT INTO `product_parameter_value` VALUES ('194', '常规袖', '25');
INSERT INTO `product_parameter_value` VALUES ('194', '纯色', '27');
INSERT INTO `product_parameter_value` VALUES ('194', '纽扣', '28');
INSERT INTO `product_parameter_value` VALUES ('194', '其他人造纤维', '29');
INSERT INTO `product_parameter_value` VALUES ('194', '96%及以上', '30');
INSERT INTO `product_parameter_value` VALUES ('195', '通勤', '1');
INSERT INTO `product_parameter_value` VALUES ('195', 'OL', '2');
INSERT INTO `product_parameter_value` VALUES ('195', '单件', '3');
INSERT INTO `product_parameter_value` VALUES ('195', '短裙(76-90厘米)', '4');
INSERT INTO `product_parameter_value` VALUES ('195', '其他款式', '5');
INSERT INTO `product_parameter_value` VALUES ('195', '短袖', '6');
INSERT INTO `product_parameter_value` VALUES ('195', '圆领', '7');
INSERT INTO `product_parameter_value` VALUES ('195', '常规袖', '8');
INSERT INTO `product_parameter_value` VALUES ('195', '中腰', '9');
INSERT INTO `product_parameter_value` VALUES ('195', '套头', '10');
INSERT INTO `product_parameter_value` VALUES ('195', '公主裙', '11');
INSERT INTO `product_parameter_value` VALUES ('195', '纯色', '12');
INSERT INTO `product_parameter_value` VALUES ('195', '钉珠 蕾丝', '13');
INSERT INTO `product_parameter_value` VALUES ('195', '其他', '14');
INSERT INTO `product_parameter_value` VALUES ('195', '51%-70%', '15');
INSERT INTO `product_parameter_value` VALUES ('195', '其他人造纤维', '16');
INSERT INTO `product_parameter_value` VALUES ('196', '通勤', '1');
INSERT INTO `product_parameter_value` VALUES ('196', 'OL', '2');
INSERT INTO `product_parameter_value` VALUES ('196', '单件', '3');
INSERT INTO `product_parameter_value` VALUES ('196', '短裙(76-90厘米)', '4');
INSERT INTO `product_parameter_value` VALUES ('196', '其他款式', '5');
INSERT INTO `product_parameter_value` VALUES ('196', '短袖', '6');
INSERT INTO `product_parameter_value` VALUES ('196', '圆领', '7');
INSERT INTO `product_parameter_value` VALUES ('196', '常规袖', '8');
INSERT INTO `product_parameter_value` VALUES ('196', '中腰', '9');
INSERT INTO `product_parameter_value` VALUES ('196', '套头', '10');
INSERT INTO `product_parameter_value` VALUES ('196', '公主裙', '11');
INSERT INTO `product_parameter_value` VALUES ('196', '纯色', '12');
INSERT INTO `product_parameter_value` VALUES ('196', '钉珠 蕾丝', '13');
INSERT INTO `product_parameter_value` VALUES ('196', '其他', '14');
INSERT INTO `product_parameter_value` VALUES ('196', '51%-70%', '15');
INSERT INTO `product_parameter_value` VALUES ('196', '其他人造纤维', '16');
INSERT INTO `product_parameter_value` VALUES ('197', '通勤', '1');
INSERT INTO `product_parameter_value` VALUES ('197', 'OL', '2');
INSERT INTO `product_parameter_value` VALUES ('197', '单件', '3');
INSERT INTO `product_parameter_value` VALUES ('197', '短裙(76-90厘米)', '4');
INSERT INTO `product_parameter_value` VALUES ('197', '其他款式', '5');
INSERT INTO `product_parameter_value` VALUES ('197', '短袖', '6');
INSERT INTO `product_parameter_value` VALUES ('197', '圆领', '7');
INSERT INTO `product_parameter_value` VALUES ('197', '常规袖', '8');
INSERT INTO `product_parameter_value` VALUES ('197', '中腰', '9');
INSERT INTO `product_parameter_value` VALUES ('197', '套头', '10');
INSERT INTO `product_parameter_value` VALUES ('197', '公主裙', '11');
INSERT INTO `product_parameter_value` VALUES ('197', '纯色', '12');
INSERT INTO `product_parameter_value` VALUES ('197', '钉珠 蕾丝', '13');
INSERT INTO `product_parameter_value` VALUES ('197', '其他', '14');
INSERT INTO `product_parameter_value` VALUES ('197', '51%-70%', '15');
INSERT INTO `product_parameter_value` VALUES ('197', '其他人造纤维', '16');
INSERT INTO `product_parameter_value` VALUES ('198', '通勤', '1');
INSERT INTO `product_parameter_value` VALUES ('198', 'OL', '2');
INSERT INTO `product_parameter_value` VALUES ('198', '单件', '3');
INSERT INTO `product_parameter_value` VALUES ('198', '短裙(76-90厘米)', '4');
INSERT INTO `product_parameter_value` VALUES ('198', '其他款式', '5');
INSERT INTO `product_parameter_value` VALUES ('198', '短袖', '6');
INSERT INTO `product_parameter_value` VALUES ('198', '圆领', '7');
INSERT INTO `product_parameter_value` VALUES ('198', '常规袖', '8');
INSERT INTO `product_parameter_value` VALUES ('198', '中腰', '9');
INSERT INTO `product_parameter_value` VALUES ('198', '套头', '10');
INSERT INTO `product_parameter_value` VALUES ('198', '公主裙', '11');
INSERT INTO `product_parameter_value` VALUES ('198', '纯色', '12');
INSERT INTO `product_parameter_value` VALUES ('198', '钉珠 蕾丝', '13');
INSERT INTO `product_parameter_value` VALUES ('198', '其他', '14');
INSERT INTO `product_parameter_value` VALUES ('198', '51%-70%', '15');
INSERT INTO `product_parameter_value` VALUES ('198', '其他人造纤维', '16');
INSERT INTO `product_parameter_value` VALUES ('199', '通勤', '1');
INSERT INTO `product_parameter_value` VALUES ('199', 'OL', '2');
INSERT INTO `product_parameter_value` VALUES ('199', '单件', '3');
INSERT INTO `product_parameter_value` VALUES ('199', '短裙(76-90厘米)', '4');
INSERT INTO `product_parameter_value` VALUES ('199', '其他款式', '5');
INSERT INTO `product_parameter_value` VALUES ('199', '短袖', '6');
INSERT INTO `product_parameter_value` VALUES ('199', '圆领', '7');
INSERT INTO `product_parameter_value` VALUES ('199', '常规袖', '8');
INSERT INTO `product_parameter_value` VALUES ('199', '中腰', '9');
INSERT INTO `product_parameter_value` VALUES ('199', '套头', '10');
INSERT INTO `product_parameter_value` VALUES ('199', '公主裙', '11');
INSERT INTO `product_parameter_value` VALUES ('199', '纯色', '12');
INSERT INTO `product_parameter_value` VALUES ('199', '钉珠 蕾丝', '13');
INSERT INTO `product_parameter_value` VALUES ('199', '其他', '14');
INSERT INTO `product_parameter_value` VALUES ('199', '51%-70%', '15');
INSERT INTO `product_parameter_value` VALUES ('199', '其他人造纤维', '16');
INSERT INTO `product_parameter_value` VALUES ('201', '修身型', '17');
INSERT INTO `product_parameter_value` VALUES ('201', '单件', '19');
INSERT INTO `product_parameter_value` VALUES ('201', '通勤', '20');
INSERT INTO `product_parameter_value` VALUES ('201', '常规款(50cm<衣长≤65cm)', '22');
INSERT INTO `product_parameter_value` VALUES ('201', '长袖', '23');
INSERT INTO `product_parameter_value` VALUES ('201', '西装领', '24');
INSERT INTO `product_parameter_value` VALUES ('201', '公主袖', '25');
INSERT INTO `product_parameter_value` VALUES ('201', '一粒扣', '26');
INSERT INTO `product_parameter_value` VALUES ('201', '纯色', '27');
INSERT INTO `product_parameter_value` VALUES ('201', '纽扣 纱网', '28');
INSERT INTO `product_parameter_value` VALUES ('201', '涤纶', '29');
INSERT INTO `product_parameter_value` VALUES ('201', '81%-90%', '30');
INSERT INTO `product_parameter_value` VALUES ('202', '修身型', '17');
INSERT INTO `product_parameter_value` VALUES ('202', '单件', '19');
INSERT INTO `product_parameter_value` VALUES ('202', '通勤', '20');
INSERT INTO `product_parameter_value` VALUES ('202', '常规款(50cm<衣长≤65cm)', '22');
INSERT INTO `product_parameter_value` VALUES ('202', '长袖', '23');
INSERT INTO `product_parameter_value` VALUES ('202', '西装领', '24');
INSERT INTO `product_parameter_value` VALUES ('202', '公主袖', '25');
INSERT INTO `product_parameter_value` VALUES ('202', '一粒扣', '26');
INSERT INTO `product_parameter_value` VALUES ('202', '纯色', '27');
INSERT INTO `product_parameter_value` VALUES ('202', '纽扣 纱网', '28');
INSERT INTO `product_parameter_value` VALUES ('202', '涤纶', '29');
INSERT INTO `product_parameter_value` VALUES ('202', '81%-90%', '30');
INSERT INTO `product_parameter_value` VALUES ('203', '修身型', '17');
INSERT INTO `product_parameter_value` VALUES ('203', '单件', '19');
INSERT INTO `product_parameter_value` VALUES ('203', '通勤', '20');
INSERT INTO `product_parameter_value` VALUES ('203', '常规款(50cm<衣长≤65cm)', '22');
INSERT INTO `product_parameter_value` VALUES ('203', '长袖', '23');
INSERT INTO `product_parameter_value` VALUES ('203', '西装领', '24');
INSERT INTO `product_parameter_value` VALUES ('203', '公主袖', '25');
INSERT INTO `product_parameter_value` VALUES ('203', '一粒扣', '26');
INSERT INTO `product_parameter_value` VALUES ('203', '纯色', '27');
INSERT INTO `product_parameter_value` VALUES ('203', '纽扣 纱网', '28');
INSERT INTO `product_parameter_value` VALUES ('203', '涤纶', '29');
INSERT INTO `product_parameter_value` VALUES ('203', '81%-90%', '30');
INSERT INTO `product_parameter_value` VALUES ('204', '修身型', '17');
INSERT INTO `product_parameter_value` VALUES ('204', '单件', '19');
INSERT INTO `product_parameter_value` VALUES ('204', '通勤', '20');
INSERT INTO `product_parameter_value` VALUES ('204', '常规款(50cm<衣长≤65cm)', '22');
INSERT INTO `product_parameter_value` VALUES ('204', '长袖', '23');
INSERT INTO `product_parameter_value` VALUES ('204', '西装领', '24');
INSERT INTO `product_parameter_value` VALUES ('204', '公主袖', '25');
INSERT INTO `product_parameter_value` VALUES ('204', '一粒扣', '26');
INSERT INTO `product_parameter_value` VALUES ('204', '纯色', '27');
INSERT INTO `product_parameter_value` VALUES ('204', '纽扣 纱网', '28');
INSERT INTO `product_parameter_value` VALUES ('204', '涤纶', '29');
INSERT INTO `product_parameter_value` VALUES ('204', '81%-90%', '30');
INSERT INTO `product_parameter_value` VALUES ('205', '修身型', '17');
INSERT INTO `product_parameter_value` VALUES ('205', '单件', '19');
INSERT INTO `product_parameter_value` VALUES ('205', '通勤', '20');
INSERT INTO `product_parameter_value` VALUES ('205', '常规款(50cm<衣长≤65cm)', '22');
INSERT INTO `product_parameter_value` VALUES ('205', '长袖', '23');
INSERT INTO `product_parameter_value` VALUES ('205', '西装领', '24');
INSERT INTO `product_parameter_value` VALUES ('205', '公主袖', '25');
INSERT INTO `product_parameter_value` VALUES ('205', '一粒扣', '26');
INSERT INTO `product_parameter_value` VALUES ('205', '纯色', '27');
INSERT INTO `product_parameter_value` VALUES ('205', '纽扣 纱网', '28');
INSERT INTO `product_parameter_value` VALUES ('205', '涤纶', '29');
INSERT INTO `product_parameter_value` VALUES ('205', '81%-90%', '30');
INSERT INTO `product_parameter_value` VALUES ('231', '修身', '132');
INSERT INTO `product_parameter_value` VALUES ('231', '通勤', '133');
INSERT INTO `product_parameter_value` VALUES ('231', '韩版', '134');
INSERT INTO `product_parameter_value` VALUES ('231', '连身', '135');
INSERT INTO `product_parameter_value` VALUES ('231', '单件', '136');
INSERT INTO `product_parameter_value` VALUES ('231', '常规款(55-65CM)', '137');
INSERT INTO `product_parameter_value` VALUES ('231', '短袖', '138');
INSERT INTO `product_parameter_value` VALUES ('231', '圆领', '139');
INSERT INTO `product_parameter_value` VALUES ('231', '常规袖', '140');
INSERT INTO `product_parameter_value` VALUES ('231', '纯色', '141');
INSERT INTO `product_parameter_value` VALUES ('231', '荷叶边 高温定型 贴布 ', '142');
INSERT INTO `product_parameter_value` VALUES ('232', '修身', '132');
INSERT INTO `product_parameter_value` VALUES ('232', '通勤', '133');
INSERT INTO `product_parameter_value` VALUES ('232', '韩版', '134');
INSERT INTO `product_parameter_value` VALUES ('232', '连身', '135');
INSERT INTO `product_parameter_value` VALUES ('232', '单件', '136');
INSERT INTO `product_parameter_value` VALUES ('232', '常规款(55-65CM)', '137');
INSERT INTO `product_parameter_value` VALUES ('232', '短袖', '138');
INSERT INTO `product_parameter_value` VALUES ('232', '圆领', '139');
INSERT INTO `product_parameter_value` VALUES ('232', '常规袖', '140');
INSERT INTO `product_parameter_value` VALUES ('232', '纯色', '141');
INSERT INTO `product_parameter_value` VALUES ('232', '荷叶边 高温定型 贴布 ', '142');
INSERT INTO `product_parameter_value` VALUES ('233', '修身', '132');
INSERT INTO `product_parameter_value` VALUES ('233', '通勤', '133');
INSERT INTO `product_parameter_value` VALUES ('233', '韩版', '134');
INSERT INTO `product_parameter_value` VALUES ('233', '连身', '135');
INSERT INTO `product_parameter_value` VALUES ('233', '单件', '136');
INSERT INTO `product_parameter_value` VALUES ('233', '常规款(55-65CM)', '137');
INSERT INTO `product_parameter_value` VALUES ('233', '短袖', '138');
INSERT INTO `product_parameter_value` VALUES ('233', '圆领', '139');
INSERT INTO `product_parameter_value` VALUES ('233', '常规袖', '140');
INSERT INTO `product_parameter_value` VALUES ('233', '纯色', '141');
INSERT INTO `product_parameter_value` VALUES ('233', '荷叶边 高温定型 贴布 ', '142');
INSERT INTO `product_parameter_value` VALUES ('234', '修身', '132');
INSERT INTO `product_parameter_value` VALUES ('234', '通勤', '133');
INSERT INTO `product_parameter_value` VALUES ('234', '韩版', '134');
INSERT INTO `product_parameter_value` VALUES ('234', '连身', '135');
INSERT INTO `product_parameter_value` VALUES ('234', '单件', '136');
INSERT INTO `product_parameter_value` VALUES ('234', '常规款(55-65CM)', '137');
INSERT INTO `product_parameter_value` VALUES ('234', '短袖', '138');
INSERT INTO `product_parameter_value` VALUES ('234', '圆领', '139');
INSERT INTO `product_parameter_value` VALUES ('234', '常规袖', '140');
INSERT INTO `product_parameter_value` VALUES ('234', '纯色', '141');
INSERT INTO `product_parameter_value` VALUES ('234', '荷叶边 高温定型 贴布 ', '142');
INSERT INTO `product_parameter_value` VALUES ('235', '修身', '132');
INSERT INTO `product_parameter_value` VALUES ('235', '通勤', '133');
INSERT INTO `product_parameter_value` VALUES ('235', '韩版', '134');
INSERT INTO `product_parameter_value` VALUES ('235', '连身', '135');
INSERT INTO `product_parameter_value` VALUES ('235', '单件', '136');
INSERT INTO `product_parameter_value` VALUES ('235', '常规款(55-65CM)', '137');
INSERT INTO `product_parameter_value` VALUES ('235', '短袖', '138');
INSERT INTO `product_parameter_value` VALUES ('235', '圆领', '139');
INSERT INTO `product_parameter_value` VALUES ('235', '常规袖', '140');
INSERT INTO `product_parameter_value` VALUES ('235', '纯色', '141');
INSERT INTO `product_parameter_value` VALUES ('235', '荷叶边 高温定型 贴布 ', '142');
INSERT INTO `product_parameter_value` VALUES ('236', '修身', '132');
INSERT INTO `product_parameter_value` VALUES ('236', '通勤', '133');
INSERT INTO `product_parameter_value` VALUES ('236', '韩版', '134');
INSERT INTO `product_parameter_value` VALUES ('236', '连身', '135');
INSERT INTO `product_parameter_value` VALUES ('236', '单件', '136');
INSERT INTO `product_parameter_value` VALUES ('236', '常规款(55-65CM)', '137');
INSERT INTO `product_parameter_value` VALUES ('236', '短袖', '138');
INSERT INTO `product_parameter_value` VALUES ('236', '圆领', '139');
INSERT INTO `product_parameter_value` VALUES ('236', '常规袖', '140');
INSERT INTO `product_parameter_value` VALUES ('236', '纯色', '141');
INSERT INTO `product_parameter_value` VALUES ('236', '荷叶边 高温定型 贴布 ', '142');
INSERT INTO `product_parameter_value` VALUES ('237', '修身', '132');
INSERT INTO `product_parameter_value` VALUES ('237', '通勤', '133');
INSERT INTO `product_parameter_value` VALUES ('237', '韩版', '134');
INSERT INTO `product_parameter_value` VALUES ('237', '连身', '135');
INSERT INTO `product_parameter_value` VALUES ('237', '单件', '136');
INSERT INTO `product_parameter_value` VALUES ('237', '常规款(55-65CM)', '137');
INSERT INTO `product_parameter_value` VALUES ('237', '短袖', '138');
INSERT INTO `product_parameter_value` VALUES ('237', '圆领', '139');
INSERT INTO `product_parameter_value` VALUES ('237', '常规袖', '140');
INSERT INTO `product_parameter_value` VALUES ('237', '纯色', '141');
INSERT INTO `product_parameter_value` VALUES ('237', '荷叶边 高温定型 贴布 ', '142');
INSERT INTO `product_parameter_value` VALUES ('238', '修身', '132');
INSERT INTO `product_parameter_value` VALUES ('238', '通勤', '133');
INSERT INTO `product_parameter_value` VALUES ('238', '韩版', '134');
INSERT INTO `product_parameter_value` VALUES ('238', '连身', '135');
INSERT INTO `product_parameter_value` VALUES ('238', '单件', '136');
INSERT INTO `product_parameter_value` VALUES ('238', '常规款(55-65CM)', '137');
INSERT INTO `product_parameter_value` VALUES ('238', '短袖', '138');
INSERT INTO `product_parameter_value` VALUES ('238', '圆领', '139');
INSERT INTO `product_parameter_value` VALUES ('238', '常规袖', '140');
INSERT INTO `product_parameter_value` VALUES ('238', '纯色', '141');
INSERT INTO `product_parameter_value` VALUES ('238', '荷叶边 高温定型 贴布 ', '142');
INSERT INTO `product_parameter_value` VALUES ('239', '修身', '132');
INSERT INTO `product_parameter_value` VALUES ('239', '通勤', '133');
INSERT INTO `product_parameter_value` VALUES ('239', '韩版', '134');
INSERT INTO `product_parameter_value` VALUES ('239', '连身', '135');
INSERT INTO `product_parameter_value` VALUES ('239', '单件', '136');
INSERT INTO `product_parameter_value` VALUES ('239', '常规款(55-65CM)', '137');
INSERT INTO `product_parameter_value` VALUES ('239', '短袖', '138');
INSERT INTO `product_parameter_value` VALUES ('239', '圆领', '139');
INSERT INTO `product_parameter_value` VALUES ('239', '常规袖', '140');
INSERT INTO `product_parameter_value` VALUES ('239', '纯色', '141');
INSERT INTO `product_parameter_value` VALUES ('239', '荷叶边 高温定型 贴布 ', '142');
INSERT INTO `product_parameter_value` VALUES ('243', '通勤', '1');
INSERT INTO `product_parameter_value` VALUES ('243', '韩版', '2');
INSERT INTO `product_parameter_value` VALUES ('243', '长裙', '4');
INSERT INTO `product_parameter_value` VALUES ('243', '长款', '5');
INSERT INTO `product_parameter_value` VALUES ('243', '无袖', '6');
INSERT INTO `product_parameter_value` VALUES ('243', '百褶裙', '11');
INSERT INTO `product_parameter_value` VALUES ('243', '花色', '12');
INSERT INTO `product_parameter_value` VALUES ('243', '流苏 荷叶边 褶皱', '13');
INSERT INTO `product_parameter_value` VALUES ('243', '雪纺', '14');
INSERT INTO `product_parameter_value` VALUES ('243', '81%-90%', '15');
INSERT INTO `product_parameter_value` VALUES ('243', '聚酯纤维', '16');
INSERT INTO `product_parameter_value` VALUES ('244', '通勤', '1');
INSERT INTO `product_parameter_value` VALUES ('244', '韩版', '2');
INSERT INTO `product_parameter_value` VALUES ('244', '长裙', '4');
INSERT INTO `product_parameter_value` VALUES ('244', '长款', '5');
INSERT INTO `product_parameter_value` VALUES ('244', '无袖', '6');
INSERT INTO `product_parameter_value` VALUES ('244', '百褶裙', '11');
INSERT INTO `product_parameter_value` VALUES ('244', '花色', '12');
INSERT INTO `product_parameter_value` VALUES ('244', '流苏 荷叶边 褶皱', '13');
INSERT INTO `product_parameter_value` VALUES ('244', '雪纺', '14');
INSERT INTO `product_parameter_value` VALUES ('244', '81%-90%', '15');
INSERT INTO `product_parameter_value` VALUES ('244', '聚酯纤维', '16');
INSERT INTO `product_parameter_value` VALUES ('245', '通勤', '1');
INSERT INTO `product_parameter_value` VALUES ('245', '韩版', '2');
INSERT INTO `product_parameter_value` VALUES ('245', '长裙', '4');
INSERT INTO `product_parameter_value` VALUES ('245', '长款', '5');
INSERT INTO `product_parameter_value` VALUES ('245', '无袖', '6');
INSERT INTO `product_parameter_value` VALUES ('245', '百褶裙', '11');
INSERT INTO `product_parameter_value` VALUES ('245', '花色', '12');
INSERT INTO `product_parameter_value` VALUES ('245', '流苏 荷叶边 褶皱', '13');
INSERT INTO `product_parameter_value` VALUES ('245', '雪纺', '14');
INSERT INTO `product_parameter_value` VALUES ('245', '81%-90%', '15');
INSERT INTO `product_parameter_value` VALUES ('245', '聚酯纤维', '16');
INSERT INTO `product_parameter_value` VALUES ('246', '通勤', '1');
INSERT INTO `product_parameter_value` VALUES ('246', '韩版', '2');
INSERT INTO `product_parameter_value` VALUES ('246', '长裙', '4');
INSERT INTO `product_parameter_value` VALUES ('246', '长款', '5');
INSERT INTO `product_parameter_value` VALUES ('246', '无袖', '6');
INSERT INTO `product_parameter_value` VALUES ('246', '百褶裙', '11');
INSERT INTO `product_parameter_value` VALUES ('246', '花色', '12');
INSERT INTO `product_parameter_value` VALUES ('246', '流苏 荷叶边 褶皱', '13');
INSERT INTO `product_parameter_value` VALUES ('246', '雪纺', '14');
INSERT INTO `promotion` VALUES ('1', '2013-01-01 17:00:45', '2013-01-01 23:18:09', '1', '2013-01-01 00:00:00', '2015-01-01 00:00:00', null, '<p>\r\n	活动内容：订单商品金额满300元立减10元\r\n</p>\r\n<p>\r\n	参与商品分类：连衣裙、针织衫\r\n</p>\r\n<p>\r\n	说明：参与该活动商品不允许使用优惠券\r\n</p>\r\n<span style=\"display:none;\" id=\"__kindeditor_bookmark_start_0__\"></span>', '', '', '限时抢购', '0', null, '1', '10.000000', '300.000000', '限时抢购', null, null, null, null, null, null);
INSERT INTO `promotion` VALUES ('2', '2013-01-01 17:02:41', '2013-01-01 23:17:17', '2', null, null, null, '<p>\r\n	<span style=\"white-space:normal;\">活动内容：</span>订单商品价格满200元赠送双倍<span style=\"white-space:normal;\">积分</span> \r\n</p>\r\n<p>\r\n	<span style=\"white-space:normal;\">参与商品分类：服饰配件、小西装</span> \r\n</p>', '', '', '双倍积分', '2', '2.00', '0', null, '100.000000', '双倍积分', null, null, null, null, null, null);
INSERT INTO `promotion_member_rank` VALUES ('1', '1');
INSERT INTO `promotion_member_rank` VALUES ('2', '1');
INSERT INTO `promotion_member_rank` VALUES ('1', '2');
INSERT INTO `promotion_member_rank` VALUES ('2', '2');
INSERT INTO `promotion_member_rank` VALUES ('1', '3');
INSERT INTO `promotion_member_rank` VALUES ('2', '3');
INSERT INTO `promotion_member_rank` VALUES ('1', '4');
INSERT INTO `promotion_member_rank` VALUES ('2', '4');
INSERT INTO `promotion_product_category` VALUES ('2', '4');
INSERT INTO `promotion_product_category` VALUES ('1', '11');
INSERT INTO `promotion_product_category` VALUES ('2', '14');
INSERT INTO `promotion_product_category` VALUES ('1', '21');
INSERT INTO `role` VALUES ('1', '2013-01-01 10:49:19', '2013-01-01 10:49:23', '拥有管理后台最高权限', '', '超级管理员');
INSERT INTO `role_authority` VALUES ('1', 'admin:product');
INSERT INTO `role_authority` VALUES ('1', 'admin:productCategory');
INSERT INTO `role_authority` VALUES ('1', 'admin:parameterGroup');
INSERT INTO `role_authority` VALUES ('1', 'admin:attribute');
INSERT INTO `role_authority` VALUES ('1', 'admin:specification');
INSERT INTO `role_authority` VALUES ('1', 'admin:brand');
INSERT INTO `role_authority` VALUES ('1', 'admin:productNotify');
INSERT INTO `role_authority` VALUES ('1', 'admin:order');
INSERT INTO `role_authority` VALUES ('1', 'admin:print');
INSERT INTO `role_authority` VALUES ('1', 'admin:payment');
INSERT INTO `role_authority` VALUES ('1', 'admin:refunds');
INSERT INTO `role_authority` VALUES ('1', 'admin:shipping');
INSERT INTO `role_authority` VALUES ('1', 'admin:returns');
INSERT INTO `role_authority` VALUES ('1', 'admin:deliveryCenter');
INSERT INTO `role_authority` VALUES ('1', 'admin:deliveryTemplate');
INSERT INTO `role_authority` VALUES ('1', 'admin:member');
INSERT INTO `role_authority` VALUES ('1', 'admin:memberRank');
INSERT INTO `role_authority` VALUES ('1', 'admin:memberAttribute');
INSERT INTO `role_authority` VALUES ('1', 'admin:review');
INSERT INTO `role_authority` VALUES ('1', 'admin:consultation');
INSERT INTO `role_authority` VALUES ('1', 'admin:navigation');
INSERT INTO `role_authority` VALUES ('1', 'admin:article');
INSERT INTO `role_authority` VALUES ('1', 'admin:articleCategory');
INSERT INTO `role_authority` VALUES ('1', 'admin:tag');
INSERT INTO `role_authority` VALUES ('1', 'admin:friendLink');
INSERT INTO `role_authority` VALUES ('1', 'admin:adPosition');
INSERT INTO `role_authority` VALUES ('1', 'admin:ad');
INSERT INTO `role_authority` VALUES ('1', 'admin:template');
INSERT INTO `role_authority` VALUES ('1', 'admin:cache');
INSERT INTO `role_authority` VALUES ('1', 'admin:static');
INSERT INTO `role_authority` VALUES ('1', 'admin:index');
INSERT INTO `role_authority` VALUES ('1', 'admin:promotion');
INSERT INTO `role_authority` VALUES ('1', 'admin:coupon');
INSERT INTO `role_authority` VALUES ('1', 'admin:seo');
INSERT INTO `role_authority` VALUES ('1', 'admin:sitemap');
INSERT INTO `role_authority` VALUES ('1', 'admin:statistics');
INSERT INTO `role_authority` VALUES ('1', 'admin:sales');
INSERT INTO `role_authority` VALUES ('1', 'admin:salesRanking');
INSERT INTO `role_authority` VALUES ('1', 'admin:purchaseRanking');
INSERT INTO `role_authority` VALUES ('1', 'admin:deposit');
INSERT INTO `role_authority` VALUES ('1', 'admin:setting');
INSERT INTO `role_authority` VALUES ('1', 'admin:area');
INSERT INTO `role_authority` VALUES ('1', 'admin:paymentMethod');
INSERT INTO `role_authority` VALUES ('1', 'admin:shippingMethod');
INSERT INTO `role_authority` VALUES ('1', 'admin:deliveryCorp');
INSERT INTO `role_authority` VALUES ('1', 'admin:paymentPlugin');
INSERT INTO `role_authority` VALUES ('1', 'admin:storagePlugin');
INSERT INTO `role_authority` VALUES ('1', 'admin:admin');
INSERT INTO `role_authority` VALUES ('1', 'admin:role');
INSERT INTO `role_authority` VALUES ('1', 'admin:message');
INSERT INTO `role_authority` VALUES ('1', 'admin:log');
INSERT INTO `seo` VALUES ('1', '2013-01-01 13:58:44', '2013-01-01 14:02:04', '${setting.siteName}', '${setting.siteName}', '${setting.siteName}', '0');
INSERT INTO `seo` VALUES ('2', '2013-01-01 13:59:33', '2013-01-01 14:02:11', '${productCategory.name}', '${productCategory.name}', '${productCategory.name}', '1');
INSERT INTO `seo` VALUES ('3', '2013-01-01 13:59:42', '2013-01-01 14:02:25', '${productKeyword}', '${productKeyword}', '${productKeyword}', '2');
INSERT INTO `seo` VALUES ('4', '2013-01-01 14:00:15', '2013-01-01 14:02:45', '${product.name}', '${product.name}', '${product.name}', '3');
INSERT INTO `seo` VALUES ('5', '2013-01-01 14:00:36', '2013-01-01 14:02:52', '${articleCategory.name}', '${articleCategory.name}', '${articleCategory.name}', '4');
INSERT INTO `seo` VALUES ('6', '2013-01-01 14:00:47', '2013-01-01 14:02:59', '${articleKeyword}', '${articleKeyword}', '${articleKeyword}', '5');
INSERT INTO `seo` VALUES ('7', '2013-01-01 14:00:57', '2013-01-01 14:03:05', '${article.title}', '${article.title}', '${article.title}', '6');
INSERT INTO `seo` VALUES ('8', '2013-01-01 14:01:08', '2013-01-01 14:03:11', '${setting.siteName}', '${setting.siteName}', '${setting.siteName}', '7');
INSERT INTO `seo` VALUES ('9', '2013-01-01 14:01:18', '2013-01-01 14:03:17', '${brand.name}', '${brand.name}', '${brand.name}', '8');
INSERT INTO `shipping_method` VALUES ('1', '2013-01-01 13:32:35', '2013-01-01 22:03:57', '1', '0.000000', '1000', '系统将根据您的收货地址自动匹配快递公司进行配送，享受免运费服务', '0.000000', '1000', 'http://storage.shopxx.net/demo-image/3.0/shipping_method/normal.gif', '普通快递', '2');
INSERT INTO `shipping_method` VALUES ('2', '2013-01-01 13:33:10', '2013-01-01 22:06:13', '2', '0.000000', '1000', '需支付10元配送费用，不享受免运费服务', '10.000000', '1000', 'http://storage.shopxx.net/demo-image/3.0/shipping_method/shunfeng.gif', '顺丰速递', '4');
INSERT INTO `sn` VALUES ('1', '2013-01-01 10:14:13', '2013-01-01 20:19:27', '6', '0');
INSERT INTO `sn` VALUES ('2', '2013-01-01 10:14:31', '2013-01-01 09:03:17', '2', '1');
INSERT INTO `sn` VALUES ('3', '2013-01-01 10:14:44', '2013-01-01 13:09:39', '1', '2');
INSERT INTO `sn` VALUES ('4', '2013-01-01 12:25:31', '2013-01-01 09:59:52', '0', '3');
INSERT INTO `sn` VALUES ('5', '2013-01-01 12:26:10', '2013-01-01 10:01:27', '0', '4');
INSERT INTO `sn` VALUES ('6', '2013-01-01 12:26:55', '2013-01-01 09:34:55', '0', '5');
INSERT INTO `specification` VALUES ('1', '2013-01-01 10:18:38', '2013-01-01 10:45:59', '1', '女装', '颜色', '1');
INSERT INTO `specification` VALUES ('2', '2013-01-01 10:23:39', '2013-01-01 10:46:03', '2', '男装', '颜色', '1');
INSERT INTO `specification` VALUES ('3', '2013-01-01 10:39:31', '2013-01-01 10:46:52', '3', '女装', '尺码', '0');
INSERT INTO `specification` VALUES ('4', '2013-01-01 10:41:08', '2013-01-01 10:46:56', '4', '男装', '尺码', '0');
INSERT INTO `specification` VALUES ('5', '2013-01-01 10:42:59', '2013-01-01 10:47:00', '5', '女鞋', '尺码', '0');
INSERT INTO `specification` VALUES ('6', '2013-01-01 10:45:42', '2013-01-01 10:47:04', '6', '男鞋', '尺码', '0');
INSERT INTO `specification_value` VALUES ('1', '2013-01-01 10:18:38', '2013-01-01 10:45:59', '1', 'http://storage.shopxx.net/demo-image/3.0/specification/1.gif', '无', '1');
INSERT INTO `specification_value` VALUES ('2', '2013-01-01 10:18:38', '2013-01-01 10:45:59', '2', 'http://storage.shopxx.net/demo-image/3.0/specification/2.gif', '黄色', '1');
INSERT INTO `specification_value` VALUES ('3', '2013-01-01 10:18:38', '2013-01-01 10:45:59', '3', 'http://storage.shopxx.net/demo-image/3.0/specification/3.gif', '酒红色', '1');
INSERT INTO `specification_value` VALUES ('4', '2013-01-01 10:18:38', '2013-01-01 10:45:59', '4', 'http://storage.shopxx.net/demo-image/3.0/specification/4.gif', '金色', '1');
INSERT INTO `specification_value` VALUES ('5', '2013-01-01 10:18:38', '2013-01-01 10:45:59', '5', 'http://storage.shopxx.net/demo-image/3.0/specification/5.gif', '橙色', '1');
INSERT INTO `specification_value` VALUES ('6', '2013-01-01 10:18:38', '2013-01-01 10:45:59', '6', 'http://storage.shopxx.net/demo-image/3.0/specification/6.gif', '灰色', '1');
INSERT INTO `specification_value` VALUES ('7', '2013-01-01 10:18:38', '2013-01-01 10:45:59', '7', 'http://storage.shopxx.net/demo-image/3.0/specification/7.gif', '蓝色', '1');
INSERT INTO `specification_value` VALUES ('8', '2013-01-01 10:18:38', '2013-01-01 10:45:59', '8', 'http://storage.shopxx.net/demo-image/3.0/specification/8.gif', '黑色', '1');
INSERT INTO `specification_value` VALUES ('9', '2013-01-01 10:18:38', '2013-01-01 10:45:59', '9', 'http://storage.shopxx.net/demo-image/3.0/specification/9.gif', '卡其色', '1');
INSERT INTO `specification_value` VALUES ('10', '2013-01-01 10:18:38', '2013-01-01 10:45:59', '10', 'http://storage.shopxx.net/demo-image/3.0/specification/10.gif', '混色', '1');
INSERT INTO `specification_value` VALUES ('11', '2013-01-01 10:18:38', '2013-01-01 10:45:59', '11', 'http://storage.shopxx.net/demo-image/3.0/specification/11.gif', '紫色', '1');
INSERT INTO `specification_value` VALUES ('12', '2013-01-01 10:18:38', '2013-01-01 10:45:59', '12', 'http://storage.shopxx.net/demo-image/3.0/specification/12.gif', '粉红色', '1');
INSERT INTO `specification_value` VALUES ('13', '2013-01-01 10:18:38', '2013-01-01 10:45:59', '13', 'http://storage.shopxx.net/demo-image/3.0/specification/13.gif', '银色', '1');
INSERT INTO `specification_value` VALUES ('14', '2013-01-01 10:18:38', '2013-01-01 10:45:59', '14', 'http://storage.shopxx.net/demo-image/3.0/specification/14.gif', '红色', '1');
INSERT INTO `specification_value` VALUES ('15', '2013-01-01 10:18:38', '2013-01-01 10:45:59', '15', 'http://storage.shopxx.net/demo-image/3.0/specification/15.gif', '白色', '1');
INSERT INTO `specification_value` VALUES ('16', '2013-01-01 10:18:38', '2013-01-01 10:45:59', '16', 'http://storage.shopxx.net/demo-image/3.0/specification/16.gif', '浅蓝色', '1');
INSERT INTO `specification_value` VALUES ('17', '2013-01-01 10:18:38', '2013-01-01 10:45:59', '17', 'http://storage.shopxx.net/demo-image/3.0/specification/17.gif', '深蓝色', '1');
INSERT INTO `specification_value` VALUES ('18', '2013-01-01 10:18:38', '2013-01-01 10:45:59', '18', 'http://storage.shopxx.net/demo-image/3.0/specification/18.gif', '绿色', '1');
INSERT INTO `specification_value` VALUES ('19', '2013-01-01 10:18:38', '2013-01-01 10:45:59', '19', 'http://storage.shopxx.net/demo-image/3.0/specification/19.gif', '米黄色', '1');
INSERT INTO `specification_value` VALUES ('20', '2013-01-01 10:18:38', '2013-01-01 10:45:59', '20', 'http://storage.shopxx.net/demo-image/3.0/specification/20.gif', '咖啡色', '1');
INSERT INTO `specification_value` VALUES ('21', '2013-01-01 10:23:39', '2013-01-01 10:46:03', '1', 'http://storage.shopxx.net/demo-image/3.0/specification/1.gif', '无', '2');
INSERT INTO `specification_value` VALUES ('22', '2013-01-01 10:26:53', '2013-01-01 10:46:03', '2', 'http://storage.shopxx.net/demo-image/3.0/specification/2.gif', '黄色', '2');
INSERT INTO `specification_value` VALUES ('23', '2013-01-01 10:26:53', '2013-01-01 10:46:03', '3', 'http://storage.shopxx.net/demo-image/3.0/specification/3.gif', '酒红色', '2');
INSERT INTO `specification_value` VALUES ('24', '2013-01-01 10:26:53', '2013-01-01 10:46:03', '4', 'http://storage.shopxx.net/demo-image/3.0/specification/4.gif', '金色', '2');
INSERT INTO `specification_value` VALUES ('25', '2013-01-01 10:26:53', '2013-01-01 10:46:03', '5', 'http://storage.shopxx.net/demo-image/3.0/specification/5.gif', '橙色', '2');
INSERT INTO `specification_value` VALUES ('26', '2013-01-01 10:26:53', '2013-01-01 10:46:03', '6', 'http://storage.shopxx.net/demo-image/3.0/specification/6.gif', '灰色', '2');
INSERT INTO `specification_value` VALUES ('27', '2013-01-01 10:26:53', '2013-01-01 10:46:03', '7', 'http://storage.shopxx.net/demo-image/3.0/specification/7.gif', '蓝色', '2');
INSERT INTO `specification_value` VALUES ('28', '2013-01-01 10:26:53', '2013-01-01 10:46:03', '8', 'http://storage.shopxx.net/demo-image/3.0/specification/8.gif', '黑色', '2');
INSERT INTO `specification_value` VALUES ('29', '2013-01-01 10:26:53', '2013-01-01 10:46:03', '9', 'http://storage.shopxx.net/demo-image/3.0/specification/9.gif', '卡其色', '2');
INSERT INTO `specification_value` VALUES ('30', '2013-01-01 10:26:53', '2013-01-01 10:46:03', '10', 'http://storage.shopxx.net/demo-image/3.0/specification/10.gif', '混色', '2');
INSERT INTO `specification_value` VALUES ('31', '2013-01-01 10:26:53', '2013-01-01 10:46:03', '11', 'http://storage.shopxx.net/demo-image/3.0/specification/11.gif', '紫色', '2');
INSERT INTO `specification_value` VALUES ('32', '2013-01-01 10:26:53', '2013-01-01 10:46:03', '12', 'http://storage.shopxx.net/demo-image/3.0/specification/12.gif', '粉红色', '2');
INSERT INTO `specification_value` VALUES ('33', '2013-01-01 10:26:53', '2013-01-01 10:46:03', '13', 'http://storage.shopxx.net/demo-image/3.0/specification/13.gif', '银色', '2');
INSERT INTO `specification_value` VALUES ('34', '2013-01-01 10:26:53', '2013-01-01 10:46:03', '14', 'http://storage.shopxx.net/demo-image/3.0/specification/14.gif', '红色', '2');
INSERT INTO `specification_value` VALUES ('35', '2013-01-01 10:26:53', '2013-01-01 10:46:03', '15', 'http://storage.shopxx.net/demo-image/3.0/specification/15.gif', '白色', '2');
INSERT INTO `specification_value` VALUES ('36', '2013-01-01 10:26:53', '2013-01-01 10:46:03', '16', 'http://storage.shopxx.net/demo-image/3.0/specification/16.gif', '浅蓝色', '2');
INSERT INTO `specification_value` VALUES ('37', '2013-01-01 10:26:53', '2013-01-01 10:46:03', '17', 'http://storage.shopxx.net/demo-image/3.0/specification/17.gif', '深蓝色', '2');
INSERT INTO `specification_value` VALUES ('38', '2013-01-01 10:26:53', '2013-01-01 10:46:03', '18', 'http://storage.shopxx.net/demo-image/3.0/specification/18.gif', '绿色', '2');
INSERT INTO `specification_value` VALUES ('39', '2013-01-01 10:26:53', '2013-01-01 10:46:03', '19', 'http://storage.shopxx.net/demo-image/3.0/specification/19.gif', '米黄色', '2');
INSERT INTO `specification_value` VALUES ('40', '2013-01-01 10:26:53', '2013-01-01 10:46:03', '20', 'http://storage.shopxx.net/demo-image/3.0/specification/20.gif', '咖啡色', '2');
INSERT INTO `specification_value` VALUES ('41', '2013-01-01 10:39:31', '2013-01-01 10:46:52', '1', null, '均码', '3');
INSERT INTO `specification_value` VALUES ('42', '2013-01-01 10:39:31', '2013-01-01 10:46:52', '2', null, 'XXS', '3');
INSERT INTO `specification_value` VALUES ('43', '2013-01-01 10:39:31', '2013-01-01 10:46:52', '3', null, 'XS', '3');
INSERT INTO `specification_value` VALUES ('44', '2013-01-01 10:39:31', '2013-01-01 10:46:52', '4', null, 'S', '3');
INSERT INTO `specification_value` VALUES ('45', '2013-01-01 10:39:31', '2013-01-01 10:46:52', '5', null, 'M', '3');
INSERT INTO `specification_value` VALUES ('46', '2013-01-01 10:39:31', '2013-01-01 10:46:52', '6', null, 'L', '3');
INSERT INTO `specification_value` VALUES ('47', '2013-01-01 10:39:31', '2013-01-01 10:46:52', '7', null, 'XL', '3');
INSERT INTO `specification_value` VALUES ('48', '2013-01-01 10:39:31', '2013-01-01 10:46:52', '8', null, 'XXL', '3');
INSERT INTO `specification_value` VALUES ('49', '2013-01-01 10:39:31', '2013-01-01 10:46:52', '9', null, 'XXXL', '3');
INSERT INTO `specification_value` VALUES ('50', '2013-01-01 10:41:08', '2013-01-01 10:46:56', '1', null, '均码', '4');
INSERT INTO `specification_value` VALUES ('51', '2013-01-01 10:41:08', '2013-01-01 10:46:56', '2', null, 'XXS', '4');
INSERT INTO `specification_value` VALUES ('52', '2013-01-01 10:41:08', '2013-01-01 10:46:56', '3', null, 'XS', '4');
INSERT INTO `specification_value` VALUES ('53', '2013-01-01 10:41:08', '2013-01-01 10:46:56', '4', null, 'S', '4');
INSERT INTO `specification_value` VALUES ('54', '2013-01-01 10:41:08', '2013-01-01 10:46:56', '5', null, 'M', '4');
INSERT INTO `specification_value` VALUES ('55', '2013-01-01 10:41:08', '2013-01-01 10:46:56', '6', null, 'L', '4');
INSERT INTO `specification_value` VALUES ('56', '2013-01-01 10:41:08', '2013-01-01 10:46:56', '7', null, 'XL', '4');
INSERT INTO `specification_value` VALUES ('57', '2013-01-01 10:41:08', '2013-01-01 10:46:56', '8', null, 'XXL', '4');
INSERT INTO `specification_value` VALUES ('58', '2013-01-01 10:41:08', '2013-01-01 10:46:56', '9', null, 'XXXL', '4');
INSERT INTO `specification_value` VALUES ('59', '2013-01-01 10:42:59', '2013-01-01 10:47:00', '1', null, '34', '5');
INSERT INTO `specification_value` VALUES ('60', '2013-01-01 10:42:59', '2013-01-01 10:47:00', '2', null, '35', '5');
INSERT INTO `specification_value` VALUES ('61', '2013-01-01 10:42:59', '2013-01-01 10:47:00', '3', null, '36', '5');
INSERT INTO `specification_value` VALUES ('62', '2013-01-01 10:42:59', '2013-01-01 10:47:00', '4', null, '37', '5');
INSERT INTO `specification_value` VALUES ('63', '2013-01-01 10:42:59', '2013-01-01 10:47:00', '5', null, '38', '5');
INSERT INTO `specification_value` VALUES ('64', '2013-01-01 10:42:59', '2013-01-01 10:47:00', '6', null, '39', '5');
INSERT INTO `specification_value` VALUES ('65', '2013-01-01 10:42:59', '2013-01-01 10:47:00', '7', null, '40', '5');
INSERT INTO `specification_value` VALUES ('66', '2013-01-01 10:42:59', '2013-01-01 10:47:00', '8', null, '41', '5');
INSERT INTO `specification_value` VALUES ('67', '2013-01-01 10:45:42', '2013-01-01 10:47:04', '1', null, '36', '6');
INSERT INTO `specification_value` VALUES ('68', '2013-01-01 10:45:42', '2013-01-01 10:47:04', '2', null, '37', '6');
INSERT INTO `specification_value` VALUES ('69', '2013-01-01 10:45:42', '2013-01-01 10:47:04', '3', null, '38', '6');
INSERT INTO `specification_value` VALUES ('70', '2013-01-01 10:45:42', '2013-01-01 10:47:04', '4', null, '39', '6');
INSERT INTO `specification_value` VALUES ('71', '2013-01-01 10:45:42', '2013-01-01 10:47:04', '5', null, '40', '6');
INSERT INTO `specification_value` VALUES ('72', '2013-01-01 10:45:42', '2013-01-01 10:47:04', '6', null, '41', '6');
INSERT INTO `specification_value` VALUES ('73', '2013-01-01 10:45:42', '2013-01-01 10:47:04', '7', null, '42', '6');
INSERT INTO `specification_value` VALUES ('74', '2013-01-01 10:45:42', '2013-01-01 10:47:04', '8', null, '43', '6');
INSERT INTO `specification_value` VALUES ('75', '2013-01-01 10:45:42', '2013-01-01 10:47:04', '9', null, '44', '6');
INSERT INTO `specification_value` VALUES ('76', '2013-01-01 10:45:42', '2013-01-01 10:47:04', '10', null, '45', '6');