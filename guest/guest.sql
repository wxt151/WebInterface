/*
Navicat MySQL Data Transfer

Source Server         : guest
Source Server Version : 50727
Source Host           : localhost:3306
Source Database       : guest

Target Server Type    : MYSQL
Target Server Version : 50727
File Encoding         : 65001

Date: 2019-12-07 19:22:53
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for auth_group
-- ----------------------------
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_group
-- ----------------------------

-- ----------------------------
-- Table structure for auth_group_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_group_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for auth_permission
-- ----------------------------
DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_permission
-- ----------------------------
INSERT INTO `auth_permission` VALUES ('1', 'Can add log entry', '1', 'add_logentry');
INSERT INTO `auth_permission` VALUES ('2', 'Can change log entry', '1', 'change_logentry');
INSERT INTO `auth_permission` VALUES ('3', 'Can delete log entry', '1', 'delete_logentry');
INSERT INTO `auth_permission` VALUES ('4', 'Can view log entry', '1', 'view_logentry');
INSERT INTO `auth_permission` VALUES ('5', 'Can add permission', '2', 'add_permission');
INSERT INTO `auth_permission` VALUES ('6', 'Can change permission', '2', 'change_permission');
INSERT INTO `auth_permission` VALUES ('7', 'Can delete permission', '2', 'delete_permission');
INSERT INTO `auth_permission` VALUES ('8', 'Can view permission', '2', 'view_permission');
INSERT INTO `auth_permission` VALUES ('9', 'Can add group', '3', 'add_group');
INSERT INTO `auth_permission` VALUES ('10', 'Can change group', '3', 'change_group');
INSERT INTO `auth_permission` VALUES ('11', 'Can delete group', '3', 'delete_group');
INSERT INTO `auth_permission` VALUES ('12', 'Can view group', '3', 'view_group');
INSERT INTO `auth_permission` VALUES ('13', 'Can add user', '4', 'add_user');
INSERT INTO `auth_permission` VALUES ('14', 'Can change user', '4', 'change_user');
INSERT INTO `auth_permission` VALUES ('15', 'Can delete user', '4', 'delete_user');
INSERT INTO `auth_permission` VALUES ('16', 'Can view user', '4', 'view_user');
INSERT INTO `auth_permission` VALUES ('17', 'Can add content type', '5', 'add_contenttype');
INSERT INTO `auth_permission` VALUES ('18', 'Can change content type', '5', 'change_contenttype');
INSERT INTO `auth_permission` VALUES ('19', 'Can delete content type', '5', 'delete_contenttype');
INSERT INTO `auth_permission` VALUES ('20', 'Can view content type', '5', 'view_contenttype');
INSERT INTO `auth_permission` VALUES ('21', 'Can add session', '6', 'add_session');
INSERT INTO `auth_permission` VALUES ('22', 'Can change session', '6', 'change_session');
INSERT INTO `auth_permission` VALUES ('23', 'Can delete session', '6', 'delete_session');
INSERT INTO `auth_permission` VALUES ('24', 'Can view session', '6', 'view_session');
INSERT INTO `auth_permission` VALUES ('25', 'Can add event', '7', 'add_event');
INSERT INTO `auth_permission` VALUES ('26', 'Can change event', '7', 'change_event');
INSERT INTO `auth_permission` VALUES ('27', 'Can delete event', '7', 'delete_event');
INSERT INTO `auth_permission` VALUES ('28', 'Can view event', '7', 'view_event');
INSERT INTO `auth_permission` VALUES ('29', 'Can add guest', '8', 'add_guest');
INSERT INTO `auth_permission` VALUES ('30', 'Can change guest', '8', 'change_guest');
INSERT INTO `auth_permission` VALUES ('31', 'Can delete guest', '8', 'delete_guest');
INSERT INTO `auth_permission` VALUES ('32', 'Can view guest', '8', 'view_guest');

-- ----------------------------
-- Table structure for auth_user
-- ----------------------------
DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_user
-- ----------------------------
INSERT INTO `auth_user` VALUES ('1', 'pbkdf2_sha256$150000$J0yIp1OdWXfC$lS3yHtA5Z656WAK5q/turRZR6lhW2eyWS0m2G4AawlU=', '2019-11-27 17:38:19.007401', '1', 'admin', '', '', 'admin@mail.com', '1', '1', '2019-11-27 11:50:11.670401');
INSERT INTO `auth_user` VALUES ('2', 'pbkdf2_sha256$150000$MBM0NroLMgqr$dzsgRM84xPgvQfhSkxwLw3WdyJVNVn8wr1mbyayo9W0=', '2019-11-29 11:34:05.612701', '1', 'weixt', '仙桃', '韦', 'weixt@mail.com', '1', '1', '2019-11-27 11:59:00.000000');

-- ----------------------------
-- Table structure for auth_user_groups
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_groups`;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_user_groups
-- ----------------------------

-- ----------------------------
-- Table structure for auth_user_user_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_user_permissions`;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_user_user_permissions
-- ----------------------------
INSERT INTO `auth_user_user_permissions` VALUES ('1', '2', '1');
INSERT INTO `auth_user_user_permissions` VALUES ('2', '2', '2');
INSERT INTO `auth_user_user_permissions` VALUES ('3', '2', '3');
INSERT INTO `auth_user_user_permissions` VALUES ('4', '2', '4');
INSERT INTO `auth_user_user_permissions` VALUES ('5', '2', '5');
INSERT INTO `auth_user_user_permissions` VALUES ('6', '2', '6');
INSERT INTO `auth_user_user_permissions` VALUES ('7', '2', '7');
INSERT INTO `auth_user_user_permissions` VALUES ('8', '2', '8');
INSERT INTO `auth_user_user_permissions` VALUES ('9', '2', '9');
INSERT INTO `auth_user_user_permissions` VALUES ('10', '2', '10');
INSERT INTO `auth_user_user_permissions` VALUES ('11', '2', '11');
INSERT INTO `auth_user_user_permissions` VALUES ('12', '2', '12');
INSERT INTO `auth_user_user_permissions` VALUES ('13', '2', '13');
INSERT INTO `auth_user_user_permissions` VALUES ('14', '2', '14');
INSERT INTO `auth_user_user_permissions` VALUES ('15', '2', '15');
INSERT INTO `auth_user_user_permissions` VALUES ('16', '2', '16');
INSERT INTO `auth_user_user_permissions` VALUES ('17', '2', '17');
INSERT INTO `auth_user_user_permissions` VALUES ('18', '2', '18');
INSERT INTO `auth_user_user_permissions` VALUES ('19', '2', '19');
INSERT INTO `auth_user_user_permissions` VALUES ('20', '2', '20');
INSERT INTO `auth_user_user_permissions` VALUES ('21', '2', '21');
INSERT INTO `auth_user_user_permissions` VALUES ('22', '2', '22');
INSERT INTO `auth_user_user_permissions` VALUES ('23', '2', '23');
INSERT INTO `auth_user_user_permissions` VALUES ('24', '2', '24');
INSERT INTO `auth_user_user_permissions` VALUES ('25', '2', '25');
INSERT INTO `auth_user_user_permissions` VALUES ('26', '2', '26');
INSERT INTO `auth_user_user_permissions` VALUES ('27', '2', '27');
INSERT INTO `auth_user_user_permissions` VALUES ('28', '2', '28');
INSERT INTO `auth_user_user_permissions` VALUES ('29', '2', '29');
INSERT INTO `auth_user_user_permissions` VALUES ('30', '2', '30');
INSERT INTO `auth_user_user_permissions` VALUES ('31', '2', '31');
INSERT INTO `auth_user_user_permissions` VALUES ('32', '2', '32');

-- ----------------------------
-- Table structure for django_admin_log
-- ----------------------------
DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_admin_log
-- ----------------------------
INSERT INTO `django_admin_log` VALUES ('1', '2019-11-27 11:59:22.225401', '2', 'weixt', '1', '[{\"added\": {}}]', '4', '1');
INSERT INTO `django_admin_log` VALUES ('2', '2019-11-27 12:00:24.037401', '2', 'weixt', '2', '[{\"changed\": {\"fields\": [\"first_name\", \"last_name\", \"email\", \"is_staff\", \"is_superuser\", \"user_permissions\"]}}]', '4', '1');
INSERT INTO `django_admin_log` VALUES ('3', '2019-11-27 17:39:49.772401', '1', '小米5发布会', '1', '[{\"added\": {}}]', '7', '1');
INSERT INTO `django_admin_log` VALUES ('4', '2019-11-27 17:42:22.562401', '2', '红米Pro发布会', '1', '[{\"added\": {}}]', '7', '1');
INSERT INTO `django_admin_log` VALUES ('5', '2019-11-27 17:43:28.519401', '3', '红米MAX发布会', '1', '[{\"added\": {}}]', '7', '1');
INSERT INTO `django_admin_log` VALUES ('6', '2019-11-27 18:56:25.074401', '1', 'jack', '1', '[{\"added\": {}}]', '8', '2');
INSERT INTO `django_admin_log` VALUES ('7', '2019-11-27 18:57:01.802401', '2', 'andy', '1', '[{\"added\": {}}]', '8', '2');
INSERT INTO `django_admin_log` VALUES ('8', '2019-11-27 18:57:38.571401', '3', 'tom', '1', '[{\"added\": {}}]', '8', '2');
INSERT INTO `django_admin_log` VALUES ('9', '2019-11-27 18:57:58.293401', '4', 'una', '1', '[{\"added\": {}}]', '8', '2');
INSERT INTO `django_admin_log` VALUES ('10', '2019-11-27 18:58:19.419401', '5', 'tony', '1', '[{\"added\": {}}]', '8', '2');

-- ----------------------------
-- Table structure for django_content_type
-- ----------------------------
DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_content_type
-- ----------------------------
INSERT INTO `django_content_type` VALUES ('1', 'admin', 'logentry');
INSERT INTO `django_content_type` VALUES ('3', 'auth', 'group');
INSERT INTO `django_content_type` VALUES ('2', 'auth', 'permission');
INSERT INTO `django_content_type` VALUES ('4', 'auth', 'user');
INSERT INTO `django_content_type` VALUES ('5', 'contenttypes', 'contenttype');
INSERT INTO `django_content_type` VALUES ('6', 'sessions', 'session');
INSERT INTO `django_content_type` VALUES ('7', 'sign', 'event');
INSERT INTO `django_content_type` VALUES ('8', 'sign', 'guest');

-- ----------------------------
-- Table structure for django_migrations
-- ----------------------------
DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_migrations
-- ----------------------------
INSERT INTO `django_migrations` VALUES ('1', 'contenttypes', '0001_initial', '2019-11-27 11:40:00.351401');
INSERT INTO `django_migrations` VALUES ('2', 'auth', '0001_initial', '2019-11-27 11:40:00.642401');
INSERT INTO `django_migrations` VALUES ('3', 'admin', '0001_initial', '2019-11-27 11:40:02.513401');
INSERT INTO `django_migrations` VALUES ('4', 'admin', '0002_logentry_remove_auto_add', '2019-11-27 11:40:02.858401');
INSERT INTO `django_migrations` VALUES ('5', 'admin', '0003_logentry_add_action_flag_choices', '2019-11-27 11:40:02.877401');
INSERT INTO `django_migrations` VALUES ('6', 'contenttypes', '0002_remove_content_type_name', '2019-11-27 11:40:03.072401');
INSERT INTO `django_migrations` VALUES ('7', 'auth', '0002_alter_permission_name_max_length', '2019-11-27 11:40:03.213401');
INSERT INTO `django_migrations` VALUES ('8', 'auth', '0003_alter_user_email_max_length', '2019-11-27 11:40:03.656401');
INSERT INTO `django_migrations` VALUES ('9', 'auth', '0004_alter_user_username_opts', '2019-11-27 11:40:03.671401');
INSERT INTO `django_migrations` VALUES ('10', 'auth', '0005_alter_user_last_login_null', '2019-11-27 11:40:03.761401');
INSERT INTO `django_migrations` VALUES ('11', 'auth', '0006_require_contenttypes_0002', '2019-11-27 11:40:03.768401');
INSERT INTO `django_migrations` VALUES ('12', 'auth', '0007_alter_validators_add_error_messages', '2019-11-27 11:40:03.781401');
INSERT INTO `django_migrations` VALUES ('13', 'auth', '0008_alter_user_username_max_length', '2019-11-27 11:40:03.914401');
INSERT INTO `django_migrations` VALUES ('14', 'auth', '0009_alter_user_last_name_max_length', '2019-11-27 11:40:04.055401');
INSERT INTO `django_migrations` VALUES ('15', 'auth', '0010_alter_group_name_max_length', '2019-11-27 11:40:04.197401');
INSERT INTO `django_migrations` VALUES ('16', 'auth', '0011_update_proxy_permissions', '2019-11-27 11:40:04.213401');
INSERT INTO `django_migrations` VALUES ('17', 'sessions', '0001_initial', '2019-11-27 11:40:04.551401');
INSERT INTO `django_migrations` VALUES ('18', 'sign', '0001_initial', '2019-11-27 11:40:04.741401');

-- ----------------------------
-- Table structure for django_session
-- ----------------------------
DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_session
-- ----------------------------
INSERT INTO `django_session` VALUES ('in8lmpcdly6lucqtd2o2x6rmlpr822nf', 'OGI5MTUxNGZkMWFmYTU5OWM5NTgxZGIyOGUxZDQ2MzA0YjVjM2YxYjp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJkYzMxMTUwMGQ4MzU3ZmEwYTY1ZmI3YmIzNTQ4NjhlMmNkMzIyYTI5IiwidXNlciI6IndlaXh0In0=', '2019-12-13 11:34:05.619701');

-- ----------------------------
-- Table structure for sign_event
-- ----------------------------
DROP TABLE IF EXISTS `sign_event`;
CREATE TABLE `sign_event` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `limit` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `address` varchar(200) NOT NULL,
  `start_time` datetime(6) NOT NULL,
  `create_time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sign_event
-- ----------------------------
INSERT INTO `sign_event` VALUES ('1', '小米5发布会', '300', '1', '北京国家会议中心', '2019-11-27 17:39:17.000000', '2019-11-27 17:39:49.769401');
INSERT INTO `sign_event` VALUES ('2', '红米Pro发布会', '2000', '1', '北京水立方', '2019-11-27 17:42:00.000000', '2019-11-27 17:42:22.559401');
INSERT INTO `sign_event` VALUES ('3', '红米MAX发布会', '2000', '1', '北京会展中心', '2019-11-27 17:43:00.000000', '2019-11-27 17:43:28.517401');
INSERT INTO `sign_event` VALUES ('4', '华为Mate30发布会', '2000', '1', '北京环保园展览馆', '2019-08-20 10:21:36.000000', '2019-12-03 18:44:20.278000');

-- ----------------------------
-- Table structure for sign_guest
-- ----------------------------
DROP TABLE IF EXISTS `sign_guest`;
CREATE TABLE `sign_guest` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `realname` varchar(64) NOT NULL,
  `phone` varchar(16) NOT NULL,
  `email` varchar(254) NOT NULL,
  `sign` tinyint(1) NOT NULL,
  `create_time` datetime(6) NOT NULL,
  `event_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `sign_guest_event_id_phone_96bd84df_uniq` (`event_id`,`phone`),
  CONSTRAINT `sign_guest_event_id_fa7638b3_fk_sign_event_id` FOREIGN KEY (`event_id`) REFERENCES `sign_event` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sign_guest
-- ----------------------------
INSERT INTO `sign_guest` VALUES ('1', 'jack', '13800110011', 'jack@mail.com', '1', '2019-11-27 18:56:25.073401', '1');
INSERT INTO `sign_guest` VALUES ('2', 'andy', '13611001101', 'andy@mail.com', '0', '2019-11-27 18:57:01.801401', '3');
INSERT INTO `sign_guest` VALUES ('3', 'tom', '13611001102', 'tom@mail.com', '0', '2019-11-27 18:57:38.570401', '3');
INSERT INTO `sign_guest` VALUES ('4', 'una', '13611001103', 'una@mail.com', '0', '2019-11-27 18:57:58.292401', '3');
INSERT INTO `sign_guest` VALUES ('5', 'tony', '13611001104', 'tony@mail.com', '0', '2019-11-27 18:58:19.417401', '3');
