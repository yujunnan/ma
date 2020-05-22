/*
 Navicat Premium Data Transfer

 Source Server         : docker
 Source Server Type    : MySQL
 Source Server Version : 50729
 Source Host           : 127.0.0.1:3306
 Source Schema         : mojito

 Target Server Type    : MySQL
 Target Server Version : 50729
 File Encoding         : 65001

 Date: 22/04/2020 14:31:36
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admin_users
-- ----------------------------
DROP TABLE IF EXISTS `admin_users`;
CREATE TABLE `admin_users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `admin_users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of admin_users
-- ----------------------------
BEGIN;
INSERT INTO `admin_users` VALUES (1, 'admin', 'admin@gmail.com', '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', NULL, '2020-01-01 03:11:52', '2020-01-01 03:11:52');
INSERT INTO `admin_users` VALUES (2, '网站编辑', '1804905923@qq.com', '$2y$10$aWtRbops7UeCbd1LbkEdGe6xMdz41iEE/oQXHQtFW1YoLhP.t9v5y', NULL, '2020-01-01 03:26:48', '2020-01-01 03:26:48');
COMMIT;

-- ----------------------------
-- Table structure for article_categories
-- ----------------------------
DROP TABLE IF EXISTS `article_categories`;
CREATE TABLE `article_categories` (
  `id` int(3) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL COMMENT '姓名',
  `parent_id` int(11) DEFAULT '0' COMMENT '父节点',
  `sequence` int(3) DEFAULT NULL COMMENT '排序',
  `created_at` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of article_categories
-- ----------------------------
BEGIN;
INSERT INTO `article_categories` VALUES (3, 'Laravel中文文档', 0, 1, '2020-01-18 12:19:47', '2020-01-18 12:19:47');
INSERT INTO `article_categories` VALUES (4, 'Laravel从入门到精通', 3, 1, '2020-01-18 12:29:55', '2020-02-23 09:56:36');
COMMIT;

-- ----------------------------
-- Table structure for articles
-- ----------------------------
DROP TABLE IF EXISTS `articles`;
CREATE TABLE `articles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL COMMENT '名称',
  `article_category_id` int(11) DEFAULT NULL COMMENT '新闻分类',
  `sequence` int(10) DEFAULT NULL COMMENT '排序',
  `created_at` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT '修改时间',
  `body` text COMMENT '内容',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of articles
-- ----------------------------
BEGIN;
INSERT INTO `articles` VALUES (5, '你好', 3, 1, '2020-03-21 08:05:01', '2020-03-21 08:15:23', '![截屏20200321上午9.46.35.png](/storage/article_bodys/20200321/4a2f818ef9e031aa76965aeae32567a1.png)\n111\nwwww');
COMMIT;

-- ----------------------------
-- Table structure for failed_jobs
-- ----------------------------
DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for members
-- ----------------------------
DROP TABLE IF EXISTS `members`;
CREATE TABLE `members` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `admin_users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of members
-- ----------------------------
BEGIN;
INSERT INTO `members` VALUES (2, 'member', 'member@gmail.com', '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', NULL, NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for menus
-- ----------------------------
DROP TABLE IF EXISTS `menus`;
CREATE TABLE `menus` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `icon` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `uri` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_link` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0-no;1-yes',
  `permission_name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sequence` smallint(6) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of menus
-- ----------------------------
BEGIN;
INSERT INTO `menus` VALUES (1, 0, NULL, '/admin/dashboard', 0, NULL, '仪表盘', 'admin', 0, NULL, '2020-01-18 05:22:47');
INSERT INTO `menus` VALUES (2, 0, NULL, '/admin/admin', 0, NULL, '管理员', 'admin', 0, NULL, '2020-01-18 05:23:32');
INSERT INTO `menus` VALUES (3, 2, '', '/admin/admin-user', 0, NULL, '管理员用户', 'admin', 0, NULL, NULL);
INSERT INTO `menus` VALUES (4, 2, '', '/admin/role', 0, NULL, '角色', 'admin', 0, NULL, NULL);
INSERT INTO `menus` VALUES (5, 2, '', '/admin/permission', 0, NULL, '权限', 'admin', 0, NULL, NULL);
INSERT INTO `menus` VALUES (6, 2, '', '/admin/permission-group', 0, NULL, '权限组', 'admin', 0, NULL, NULL);
INSERT INTO `menus` VALUES (7, 2, NULL, '/admin/menu', 0, NULL, '菜单', 'admin', 0, NULL, '2020-01-18 01:17:54');
INSERT INTO `menus` VALUES (8, 0, NULL, '#', 0, NULL, '新闻管理', 'admin', 0, '2020-01-18 01:10:22', '2020-03-20 08:39:59');
INSERT INTO `menus` VALUES (9, 8, NULL, '/admin/article-category', 0, NULL, '新闻类别', 'admin', 0, '2020-01-18 04:02:36', '2020-01-18 07:58:26');
INSERT INTO `menus` VALUES (10, 8, NULL, '/admin/article', 0, NULL, '新闻列表', 'admin', 0, '2020-03-20 00:37:17', '2020-03-20 07:47:19');
COMMIT;

-- ----------------------------
-- Table structure for migrations
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of migrations
-- ----------------------------
BEGIN;
INSERT INTO `migrations` VALUES (1, '2014_10_12_000000_create_users_table', 1);
INSERT INTO `migrations` VALUES (2, '2014_10_12_100000_create_password_resets_table', 1);
INSERT INTO `migrations` VALUES (3, '2016_06_01_000001_create_oauth_auth_codes_table', 1);
INSERT INTO `migrations` VALUES (4, '2016_06_01_000002_create_oauth_access_tokens_table', 1);
INSERT INTO `migrations` VALUES (5, '2016_06_01_000003_create_oauth_refresh_tokens_table', 1);
INSERT INTO `migrations` VALUES (6, '2016_06_01_000004_create_oauth_clients_table', 1);
INSERT INTO `migrations` VALUES (7, '2016_06_01_000005_create_oauth_personal_access_clients_table', 1);
INSERT INTO `migrations` VALUES (8, '2017_10_08_000001_create_oauth_access_token_providers_table', 1);
INSERT INTO `migrations` VALUES (9, '2019_08_19_000000_create_failed_jobs_table', 1);
INSERT INTO `migrations` VALUES (10, '2020_01_01_030821_create_permission_tables', 1);
INSERT INTO `migrations` VALUES (11, '2020_01_01_030822_create_admin_table', 1);
INSERT INTO `migrations` VALUES (12, '2020_01_01_030823_add_custom_field_permission_tables', 1);
INSERT INTO `migrations` VALUES (13, '2020_01_01_030824_create_menu_table', 1);
INSERT INTO `migrations` VALUES (14, '2020_01_01_030825_create_permission_group_table', 1);
INSERT INTO `migrations` VALUES (15, '2020_01_06_014748_alter_users_table', 2);
COMMIT;

-- ----------------------------
-- Table structure for model_has_permissions
-- ----------------------------
DROP TABLE IF EXISTS `model_has_permissions`;
CREATE TABLE `model_has_permissions` (
  `permission_id` bigint(20) unsigned NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`),
  CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for model_has_roles
-- ----------------------------
DROP TABLE IF EXISTS `model_has_roles`;
CREATE TABLE `model_has_roles` (
  `role_id` bigint(20) unsigned NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`),
  CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of model_has_roles
-- ----------------------------
BEGIN;
INSERT INTO `model_has_roles` VALUES (1, 'Moell\\Mojito\\Models\\AdminUser', 1);
INSERT INTO `model_has_roles` VALUES (4, 'App\\Member', 2);
COMMIT;

-- ----------------------------
-- Table structure for oauth_access_token_providers
-- ----------------------------
DROP TABLE IF EXISTS `oauth_access_token_providers`;
CREATE TABLE `oauth_access_token_providers` (
  `oauth_access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `provider` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`oauth_access_token_id`),
  CONSTRAINT `oauth_access_token_providers_oauth_access_token_id_foreign` FOREIGN KEY (`oauth_access_token_id`) REFERENCES `oauth_access_tokens` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of oauth_access_token_providers
-- ----------------------------
BEGIN;
INSERT INTO `oauth_access_token_providers` VALUES ('0220cb37694b7c339ded2d13aa9ac06eba49f46e08557e5563ab1edb8e651f60c15479062f4db3ab', 'users', '2020-03-22 05:41:41', '2020-03-22 05:41:41');
INSERT INTO `oauth_access_token_providers` VALUES ('031cfb6a0058af12cf1536113cb09b00dafe301ff591672f944f0efbd0947c1af9e5095f26d59bed', 'users', '2020-03-22 07:09:16', '2020-03-22 07:09:16');
INSERT INTO `oauth_access_token_providers` VALUES ('05c01d764f8ab512fc9c4c45fcbb669c4b2b887d9d3607cf7547ccf16da12d0c872fc33d7f03df86', 'users', '2020-02-25 02:49:21', '2020-02-25 02:49:21');
INSERT INTO `oauth_access_token_providers` VALUES ('06c477746ce65471f38e80bb45508534592d0242c6eed1e90dc8bb5ffa7ae40c19828c2bbddc8bf2', 'users', '2020-02-25 03:07:45', '2020-02-25 03:07:45');
INSERT INTO `oauth_access_token_providers` VALUES ('073df7032a75e000d8e318108a777071e9fbcc536c96b32a69145cee90f74b0a909962744b6894ff', 'users', '2020-03-22 05:42:50', '2020-03-22 05:42:50');
INSERT INTO `oauth_access_token_providers` VALUES ('07a7b1f1c663e8f5fcf24e616a28c14d3c3b83a766c3e48c1d226da690dddb9e008154b1d1ec762c', 'users', '2020-02-24 13:10:39', '2020-02-24 13:10:39');
INSERT INTO `oauth_access_token_providers` VALUES ('08ca6c43e50ee5350c5cb5feb6cafffd1e3bf3942e864c7db995009aa37fa1dc23fe96b0793b0a56', 'user', '2020-01-11 09:42:12', '2020-01-11 09:42:12');
INSERT INTO `oauth_access_token_providers` VALUES ('0907c98e8bffd096233684e37ddf6d9910a4d82a54217aff4e142b1d26a07488acaaa4f79ad97b53', 'users', '2020-01-11 14:21:17', '2020-01-11 14:21:17');
INSERT INTO `oauth_access_token_providers` VALUES ('096a337b117d1374dff0e5836c939d0827f9858545f02dfbb45fb0cbab609a4f11673f79640a0814', 'users', '2020-02-29 03:28:20', '2020-02-29 03:28:20');
INSERT INTO `oauth_access_token_providers` VALUES ('0a523043049a15f4beb9e9c7269ef563107e9b74be4592cb16bdb18920af862dbc88b9d231b60e17', 'users', '2020-01-15 01:21:17', '2020-01-15 01:21:17');
INSERT INTO `oauth_access_token_providers` VALUES ('0d2a0871c5bba9fa816467ebc4525dc3a1ae55a1a27f445a5faa7a7241c8deb6a19f9469c4069976', 'users', '2020-02-25 06:24:32', '2020-02-25 06:24:32');
INSERT INTO `oauth_access_token_providers` VALUES ('0e14519163c7358859be0c74c438e44012b1a866eb83fbb2e0d6b02575eda3357045f2afaab0cd3d', 'admin', '2020-02-24 03:06:40', '2020-02-24 03:06:40');
INSERT INTO `oauth_access_token_providers` VALUES ('0f9e5b1c8f33b9ea8f095a89f54798086a1357d4e3774659dd355be84565584bea5c3af63c14cb0b', 'users', '2020-02-24 13:35:15', '2020-02-24 13:35:15');
INSERT INTO `oauth_access_token_providers` VALUES ('0fdc3582c23fa16723cdaf1fa0194a696ab9ed1247774879212a1a4d252f86cf9101bb322dfc008f', 'users', '2020-01-11 09:57:47', '2020-01-11 09:57:47');
INSERT INTO `oauth_access_token_providers` VALUES ('1223efd5ad4c8b97f90277e34a0a85ec7c88985eba1f2b0df448cdcdfb29f280a113c7e47f3ab8db', 'users', '2020-02-24 11:03:43', '2020-02-24 11:03:43');
INSERT INTO `oauth_access_token_providers` VALUES ('12a2d14bffd5aae929cdb992da6f554be74f138eb00649122a25292518787ff8f6e93c69b5c767c6', 'admin', '2020-01-18 07:19:21', '2020-01-18 07:19:21');
INSERT INTO `oauth_access_token_providers` VALUES ('13d3358040771bb54576725053f13c921bea1ce4d7bb95fa3bc340c83d64018fea87aa49ab980278', 'admin', '2020-02-23 02:59:39', '2020-02-23 02:59:39');
INSERT INTO `oauth_access_token_providers` VALUES ('16d9b3ef1ea9f18a2fb0d4a9f86efe6b39810dbdd5996f8f8bad85dd508ab90df661c24555eb4fd0', 'users', '2020-02-25 04:41:32', '2020-02-25 04:41:32');
INSERT INTO `oauth_access_token_providers` VALUES ('17cd3781be6432b8c30176bc49901a4ba2be3e9e6723c7891846cba83bebc1feded3e97f293df38e', 'users', '2020-01-12 02:38:16', '2020-01-12 02:38:16');
INSERT INTO `oauth_access_token_providers` VALUES ('18c9e53af191cde6cdf895026c018400827a29987caa3d69f7b556b04d2e7ab50313093834a00695', 'admin', '2020-03-11 22:44:13', '2020-03-11 22:44:13');
INSERT INTO `oauth_access_token_providers` VALUES ('1920d7daa110f3066e10457016dd5a3c91946a3dc9a7027094701002f2f5f57cd2d2f4e6c848d2f3', 'users', '2020-02-24 06:58:38', '2020-02-24 06:58:38');
INSERT INTO `oauth_access_token_providers` VALUES ('19221d813b058f0c78142da93daa6d04dc5446fc91183abb2de9a25dbefcf72dd697f9ece526070a', 'users', '2020-02-24 11:19:56', '2020-02-24 11:19:56');
INSERT INTO `oauth_access_token_providers` VALUES ('1cb007ba70b87b815e4b293ef084856bdc634047877d0ac3ff73627bb912c97b4be52da83925d9a1', 'users', '2020-03-27 03:04:11', '2020-03-27 03:04:11');
INSERT INTO `oauth_access_token_providers` VALUES ('1cca9607d8c63f833292d4da21e176a2ffb3d383d600aa82380ef7feb1d4ce15ccc81fe7b634e0ee', 'users', '2020-02-24 12:23:07', '2020-02-24 12:23:07');
INSERT INTO `oauth_access_token_providers` VALUES ('1ddec0afc1e9a8e82e6114eb9b2f7a5e4153899178cbd1bd58e1a85fc6e932aeda67ebdc21ff3701', 'users', '2020-03-27 03:03:43', '2020-03-27 03:03:43');
INSERT INTO `oauth_access_token_providers` VALUES ('2019376e51e3adba543f0cc211b91dff82db18e160688715cbedf8d0e701343669def482dac18032', 'users', '2020-03-22 12:42:17', '2020-03-22 12:42:17');
INSERT INTO `oauth_access_token_providers` VALUES ('21029406932c7d39ae045b2414e5ee7ff9c9e60363c014778d10e610ff05941aca0424309d7bed72', 'admin', '2020-03-20 08:28:53', '2020-03-20 08:28:53');
INSERT INTO `oauth_access_token_providers` VALUES ('21b12471f8e13fce652605618387487580dae6bb830805c2b39540e40a16445d017f0e10ddb4052d', 'users', '2020-02-25 06:24:23', '2020-02-25 06:24:23');
INSERT INTO `oauth_access_token_providers` VALUES ('228041e912554a7ed90c109cca203d7b34495bf330172bcf3e227565ec19c045ea592b6e5287bc0e', 'users', '2020-03-22 05:41:51', '2020-03-22 05:41:51');
INSERT INTO `oauth_access_token_providers` VALUES ('242df3aec507c9dd8a1b2b89ad02f6d78b0346c8811edcb6d5d29248685d08a4c8a7cc9bf9646f37', 'admin', '2020-03-20 08:29:16', '2020-03-20 08:29:16');
INSERT INTO `oauth_access_token_providers` VALUES ('24404252a7fa3f9022873ba054c1f00b7593c5543b3ff87379341b716c2bcc5e7287472e0d01af2e', 'users', '2020-04-14 08:21:41', '2020-04-14 08:21:41');
INSERT INTO `oauth_access_token_providers` VALUES ('25f430125418fdd567e2f1060cbe70ae6b0b315c0c630ad495426c1275cf0ac47a5abe46f97e91b4', 'users', '2020-02-24 06:25:10', '2020-02-24 06:25:10');
INSERT INTO `oauth_access_token_providers` VALUES ('26f57888310d74d89cfd00e67f411aeacd7d9859b47c763f84c4b804b9b84b818646d6317a8063e7', 'admin', '2020-01-11 07:58:10', '2020-01-11 07:58:10');
INSERT INTO `oauth_access_token_providers` VALUES ('2781d45d761a3b16420d3e1024a5c3abd065265a85e81e2a09ace5b4ce2e784ee76fe44eda37fa06', 'users', '2020-02-24 09:10:53', '2020-02-24 09:10:53');
INSERT INTO `oauth_access_token_providers` VALUES ('278a2d280c6b2c60dc9035cd9b55ee0d73adeddacd140ec61321b6de30dabf7615745bde73b2bfda', 'users', '2020-01-11 05:15:52', '2020-01-11 05:15:52');
INSERT INTO `oauth_access_token_providers` VALUES ('27c289ac68eaf305ade5be437146ef857a2836cf905cfccdc9e38a0a81bb49b29dcf34828c255bbc', 'users', '2020-01-15 15:39:40', '2020-01-15 15:39:40');
INSERT INTO `oauth_access_token_providers` VALUES ('284257d7ad873d30f23da8ac537c056a097361dfd0cfe19b8634d9ab64ed2042d8e080dcee310d9b', 'users', '2020-01-11 10:00:23', '2020-01-11 10:00:23');
INSERT INTO `oauth_access_token_providers` VALUES ('29699c35f034dc82d0f411d1eb5e2891ea860b07d69fde88dd40302cbcdbfdb68e0b948996888963', 'admin', '2020-01-27 07:41:19', '2020-01-27 07:41:19');
INSERT INTO `oauth_access_token_providers` VALUES ('299cf2dddca09a5b5bb68c2b2c191f297a2b511d6a9551acb0161adda0e4cb0a5264972af8c05b15', 'users', '2020-02-24 11:01:41', '2020-02-24 11:01:41');
INSERT INTO `oauth_access_token_providers` VALUES ('2a4fcc181da774a921fac027d4229f26ee79b8da928e734f57b0900aab6d04417ef6dd0397e6debb', 'users', '2020-01-11 07:49:38', '2020-01-11 07:49:38');
INSERT INTO `oauth_access_token_providers` VALUES ('2b4298466a9836da3e71741b3ee7b61dc0a0cd4c97f08304d443439df4cf9178ece5ced527d22c2d', 'users', '2020-02-24 13:09:37', '2020-02-24 13:09:37');
INSERT INTO `oauth_access_token_providers` VALUES ('2bae3556ad52ccd0c6427b30a6cfc606494d1c430ad65cdac33a52d5311ab9eec7cfc31e15723ac9', 'users', '2020-02-24 11:15:52', '2020-02-24 11:15:52');
INSERT INTO `oauth_access_token_providers` VALUES ('2c0d2d36f3dd97da9f36a1406e4bb5ea4f329be461c27af3c0ea6f5a3d8f92971989fe5b56b67cfa', 'admin', '2020-02-24 11:13:18', '2020-02-24 11:13:18');
INSERT INTO `oauth_access_token_providers` VALUES ('2c19c8ddd12e7bcf3d4bb80e968c0173866f1ce8f5a550488c6aba1e4dfdc36a280ac8e50789e696', 'users', '2020-03-22 05:40:42', '2020-03-22 05:40:42');
INSERT INTO `oauth_access_token_providers` VALUES ('2cbd5d91797d004637e90eaf1e8d570480eb9d8537b4df6f075b6afe2c1adaaec0527dacd2197c58', 'users', '2020-03-22 07:03:00', '2020-03-22 07:03:00');
INSERT INTO `oauth_access_token_providers` VALUES ('2cccaabccad73f0cdae0989b178c06e1ed6e016c6183d400e4ebb0e41320a3faf4eaf41126cdc08b', 'users', '2020-02-24 11:18:41', '2020-02-24 11:18:41');
INSERT INTO `oauth_access_token_providers` VALUES ('2cd3f07652693ee650041d7ffa62d4a2b8057d9fd945fc310ac93888a369cd4b9110a2a7dd77328e', 'users', '2020-01-11 05:17:10', '2020-01-11 05:17:10');
INSERT INTO `oauth_access_token_providers` VALUES ('2e57fceaa328dbb4c6f00ab77efdc47d1d4d43bda1db6f20945911f766c85e178b4bec52883ad308', 'admin', '2020-01-11 11:23:37', '2020-01-11 11:23:37');
INSERT INTO `oauth_access_token_providers` VALUES ('2ed1c402818f81af6a5d376eb680cc0441a7cde8f79c6cf7cebe26d2e0c638b0297af5ff2345749a', 'users', '2020-01-11 05:36:57', '2020-01-11 05:36:57');
INSERT INTO `oauth_access_token_providers` VALUES ('30136028d468d6704fe81035c7dc5fa36d243395975dfeac830247638639bb74f3eb7ea7dbc7610f', 'admin', '2020-03-20 08:24:37', '2020-03-20 08:24:37');
INSERT INTO `oauth_access_token_providers` VALUES ('302575183d5573b3d81fdc7a543dda3fdc817788de592f03d68ad80846d3a8d5d6ea4b1e341815d2', 'users', '2020-01-11 05:21:21', '2020-01-11 05:21:21');
INSERT INTO `oauth_access_token_providers` VALUES ('3193ee1f50a857fdefb65c88cacd55007ed42a6616992cafdfef3285763efd8df7116ce8c53891e4', 'admin', '2020-03-20 08:23:05', '2020-03-20 08:23:05');
INSERT INTO `oauth_access_token_providers` VALUES ('3310018dbba4099351647204d59ac50e595d12294fa97b2d8252ba1969a0f73889cafeabb0326991', 'users', '2020-03-22 10:46:08', '2020-03-22 10:46:08');
INSERT INTO `oauth_access_token_providers` VALUES ('335f4a1dcc4f988ee23537ad5f44252a46d5b1c8dc1f849640e5ca9d360782005a57143e6ae14cb4', 'users', '2020-02-25 07:22:26', '2020-02-25 07:22:26');
INSERT INTO `oauth_access_token_providers` VALUES ('344c2a99ad07c096c83642e9a0002ff21d34bfe78791149f9011c8b7fd87043303ef4294a71fee08', 'users', '2020-02-24 11:19:05', '2020-02-24 11:19:05');
INSERT INTO `oauth_access_token_providers` VALUES ('354a6b3152fc37515bbf60f31f62a0bb646db57deac48816c9df9ac48afd55729acc7fc84bb15bdd', 'admin', '2020-02-25 06:10:28', '2020-02-25 06:10:28');
INSERT INTO `oauth_access_token_providers` VALUES ('36c2d0dcd4e291d49932a89cc2d6abdb342f1d9c50195563682c4304d52f809d5522b4d87b7c4d5d', 'admin', '2020-01-27 07:30:26', '2020-01-27 07:30:26');
INSERT INTO `oauth_access_token_providers` VALUES ('38335838f8e43f9bcd8acd519612cbe92b8287cd542cde6b6dfac305eaac40d6478ad14abc2f9447', 'admin', '2020-03-20 08:19:56', '2020-03-20 08:19:56');
INSERT INTO `oauth_access_token_providers` VALUES ('39109150a9a4cb4915ec8d9f28ec98011698784bc8e2b22f26404fb4241df446cac6d10cb78fb4df', 'member', '2020-01-14 09:05:31', '2020-01-14 09:05:31');
INSERT INTO `oauth_access_token_providers` VALUES ('3987b1a6e1c9e68031026779b8ed54a0a5a3ac89bfd0713ce66682e90042d8ac11675a9b247bd332', 'users', '2020-02-25 06:11:04', '2020-02-25 06:11:04');
INSERT INTO `oauth_access_token_providers` VALUES ('3c619cad67b05f0f0be7366010a95f711e73e36fe7b358901c8acf41fa8eebcfaca0955aa90334f6', 'users', '2020-03-15 00:46:48', '2020-03-15 00:46:48');
INSERT INTO `oauth_access_token_providers` VALUES ('3d9d8f0b4578a3301ece3d56062eb98c19ff1a7d889719560abe49eea9d3bc3b574da3e83f0122ea', 'users', '2020-02-24 00:35:40', '2020-02-24 00:35:40');
INSERT INTO `oauth_access_token_providers` VALUES ('3e27b7ec1508b2071f7eb71ff71ee325e30c31221255b2a25712c8a3ee2eef7fcf268ce79fe75f61', 'users', '2020-03-14 08:57:42', '2020-03-14 08:57:42');
INSERT INTO `oauth_access_token_providers` VALUES ('3f13f45f5200a64061ab69d84aa4ab668ba76aeba705a40d55d9d69c0017a036a32146257da3e785', 'users', '2020-02-25 04:41:43', '2020-02-25 04:41:43');
INSERT INTO `oauth_access_token_providers` VALUES ('3fd0c0ebda540ab98ee2a14471e37e3e2fa5d97684bf814a2c7bf80f3a6d29fcad8263fffc593f86', 'users', '2020-02-29 03:28:56', '2020-02-29 03:28:56');
INSERT INTO `oauth_access_token_providers` VALUES ('4056ad1c07a23565959dda653c146b2a9b76b7e8d6fae4275906a65e5536a688b62d2f8f8a00bb5f', 'member', '2020-01-13 09:39:09', '2020-01-13 09:39:09');
INSERT INTO `oauth_access_token_providers` VALUES ('40d5fe4d99dc174e57fe594bfbb95f61d2d5f12b4be837d56bfca892b1fa50ffdc1ee55d253ae8d0', 'admin', '2020-03-24 04:38:10', '2020-03-24 04:38:10');
INSERT INTO `oauth_access_token_providers` VALUES ('41b8cac82faa4438a5add18a699173740072376de53c79cf25b32e1e32ea3fa4cd860733ebbc92d3', 'users', '2020-02-25 02:30:05', '2020-02-25 02:30:05');
INSERT INTO `oauth_access_token_providers` VALUES ('43569de8ed2c6d63ca03c366184e5b549b40d02def3a4d250b5eb348fe94779eebdec8997d05a52c', 'users', '2020-01-11 05:40:55', '2020-01-11 05:40:55');
INSERT INTO `oauth_access_token_providers` VALUES ('44d195dc6a27376e3b0a16f3b9ae5fe74517f5c7baa39d134f248c54022b323b5c76acf7d10f1990', 'users', '2020-02-24 02:00:27', '2020-02-24 02:00:27');
INSERT INTO `oauth_access_token_providers` VALUES ('458359b34a126ed4a23b5b1fdc9204b7fbfb5e9d9a5626dab7583841f8de66769ae5da3fcd83f93a', 'users', '2020-04-14 10:42:24', '2020-04-14 10:42:24');
INSERT INTO `oauth_access_token_providers` VALUES ('46b1618026339a48b0dc24e7ebd0c34f23e9113fc0ec83b114f1ff657a435c2505a8f41216354723', 'admin', '2020-03-20 08:29:30', '2020-03-20 08:29:30');
INSERT INTO `oauth_access_token_providers` VALUES ('4749ae6b2c82a3cc54d50e890fbecc11c32b220a0943abdaac6420db9431a457f6fa18ff22a26c2e', 'users', '2020-01-12 23:37:51', '2020-01-12 23:37:51');
INSERT INTO `oauth_access_token_providers` VALUES ('48cec6db0ac949a30f4b173c6585d78f2df844a0b756006847385f447ef341bd06590e37c97756f3', 'users', '2020-03-22 05:39:21', '2020-03-22 05:39:21');
INSERT INTO `oauth_access_token_providers` VALUES ('49252973d922b71a77078ccb4da6ab28934262a4d17f9dd7664b53ebda33fb75cd637ec8bccaaa81', 'users', '2020-02-24 09:32:22', '2020-02-24 09:32:22');
INSERT INTO `oauth_access_token_providers` VALUES ('4a6fd9101d4b20641c6e4ad7f6beb7eb09ac836cc1f696dbab973a34e264174bd46b3a46b3defd72', 'users', '2020-03-11 12:24:22', '2020-03-11 12:24:22');
INSERT INTO `oauth_access_token_providers` VALUES ('4b420bbb16d36fb7447f798af169ab011cdc28cad71cf7148b716ecf6012532fcfa69bd265f4a402', 'users', '2020-02-25 03:02:42', '2020-02-25 03:02:42');
INSERT INTO `oauth_access_token_providers` VALUES ('4cabaeaa3b55685e663d96f719d1f7a8edf4393ed8bcddac6cfa392e21913de2c307c2dd6ce424e1', 'users', '2020-02-25 07:23:21', '2020-02-25 07:23:21');
INSERT INTO `oauth_access_token_providers` VALUES ('4ddbe74fd497160d964f94e61ed23a65ac7d91e7a102a3dfbfec420cfd32e5a70fea48807dd0d594', 'admin', '2020-03-20 07:20:55', '2020-03-20 07:20:55');
INSERT INTO `oauth_access_token_providers` VALUES ('504cf33e80662ebcaeff095b0f79a2a49b9657ddb866ab5da5945d7affaeffd461f2fec749b0a7cf', 'admin', '2020-03-20 08:37:25', '2020-03-20 08:37:25');
INSERT INTO `oauth_access_token_providers` VALUES ('505bf96074f7bcde7565d2a3d38deb7ec7dd8bd0ce39d709a77c6988a08ebfc0a9ea897d44cc954d', 'users', '2020-01-11 10:08:09', '2020-01-11 10:08:09');
INSERT INTO `oauth_access_token_providers` VALUES ('50a5b67a2629a55e8e9a680efe75c9b1e6b88e6fff2f5e93adc1a80e56331c93d2edb157259a27be', 'users', '2020-02-24 09:16:17', '2020-02-24 09:16:17');
INSERT INTO `oauth_access_token_providers` VALUES ('50c74a5914b607c35a2cd90d58ffbd2dc167d48f00886791198491fb24c6f9f2f88a522b61afccb3', 'admin', '2020-03-20 08:48:55', '2020-03-20 08:48:55');
INSERT INTO `oauth_access_token_providers` VALUES ('5130ac926603853116facfb7ea29ddf478766e138b2c40ceea0567d98e735402e9a56d518dfcc649', 'users', '2020-02-25 02:58:52', '2020-02-25 02:58:52');
INSERT INTO `oauth_access_token_providers` VALUES ('5155330cc4b33312a04c47938d5a3fc30051cfb5f970da320596aeea0b93711d2a8c269157504186', 'admin', '2020-03-20 08:36:14', '2020-03-20 08:36:14');
INSERT INTO `oauth_access_token_providers` VALUES ('51d4cc181b25e212822ae7555b5ade6e1734d36894a01e1ce70c03b41808b2f70b554c4d85e80d58', 'admin', '2020-03-20 07:32:04', '2020-03-20 07:32:04');
INSERT INTO `oauth_access_token_providers` VALUES ('51fdf369970f7659c4fa648dcffb2f819d98d2913b3039a20f1cf349d673fed73363af7b9fb9c068', 'users', '2020-03-22 05:41:03', '2020-03-22 05:41:03');
INSERT INTO `oauth_access_token_providers` VALUES ('5441634d0b85bf8df0c9c86740715a3f7eb097565618844cc21092be8d6a78dedbb4a3da5f6fde08', 'users', '2020-02-25 02:06:18', '2020-02-25 02:06:18');
INSERT INTO `oauth_access_token_providers` VALUES ('572dcf4478be272fe4f750341ca632ecc1c26fed0ac5482e50ef4c7bee1b9bd9b3a2383fc009edd9', 'users', '2020-02-25 02:47:19', '2020-02-25 02:47:19');
INSERT INTO `oauth_access_token_providers` VALUES ('5781ab8f0e6289adeee77917636c3b22899b7177d23d63c0003f22a9f78fdace1512ebaf34feb7ae', 'users', '2020-02-25 04:02:07', '2020-02-25 04:02:07');
INSERT INTO `oauth_access_token_providers` VALUES ('59589c16da7c0a1154af0ef435d98d70c7a710d77dcd55c7a391124f9df31f33653d5220fb07cc19', 'user', '2020-01-11 09:54:15', '2020-01-11 09:54:15');
INSERT INTO `oauth_access_token_providers` VALUES ('59df9938d50ff8e5a71be984d2f7cbfbc26cd24760d6e4da534d101f92f795002772f03c449cee31', 'users', '2020-01-11 12:16:41', '2020-01-11 12:16:41');
INSERT INTO `oauth_access_token_providers` VALUES ('5b4cb2d64b5eb95230390662fd37ffffae53553c97492fb48d76a1c73306c76083bccb5df5d52836', 'admin', '2020-03-11 22:45:07', '2020-03-11 22:45:07');
INSERT INTO `oauth_access_token_providers` VALUES ('5b9c566adf859dc8d9e574ed19a10b2408ce8f78af2a4b65d024735ea124bc4b09e6b8ce3e309616', 'users', '2020-02-25 01:58:49', '2020-02-25 01:58:49');
INSERT INTO `oauth_access_token_providers` VALUES ('5c849d782400edb5b983d44755ed6434b016aae29992aaf3115321b06b74656df9586a97bc320d44', 'users', '2020-01-11 05:42:50', '2020-01-11 05:42:50');
INSERT INTO `oauth_access_token_providers` VALUES ('5dab7c96f2eb12c7b17ec325befa55d8210408cb40a6ec24f96f065869d07a11105222bffdccae55', 'users', '2020-02-24 06:55:44', '2020-02-24 06:55:44');
INSERT INTO `oauth_access_token_providers` VALUES ('5dcf3d92ec0881b097dd17d03acaeaac6f3ba69e7b3845f70e4cd126efcc96ce0dcc53cf30943d57', 'member', '2020-02-24 00:07:45', '2020-02-24 00:07:45');
INSERT INTO `oauth_access_token_providers` VALUES ('5e8ae9ba16593c72444fe3c3ec55951c982f296a59409c04df9ceff787a583e1d71749bdae303f0e', 'member', '2020-01-11 10:01:16', '2020-01-11 10:01:16');
INSERT INTO `oauth_access_token_providers` VALUES ('5ff20be6ea04932080841d2de08cbfe6ce6c1373ad35c4423c24219b8889b85ddd2d466e9d00cab7', 'users', '2020-01-11 10:13:46', '2020-01-11 10:13:46');
INSERT INTO `oauth_access_token_providers` VALUES ('607846a4bd48c34056e5192212877fe2b70ed4f24e7b9c947588d5812bb4bc5f8240b139e973ae0a', 'users', '2020-02-24 11:21:32', '2020-02-24 11:21:32');
INSERT INTO `oauth_access_token_providers` VALUES ('62b1b5e0a76d43d404f9d3e9086a583c309dca887cb319a593700be6e3eb2ca9ecc00faaf8e837b0', 'users', '2020-02-25 02:29:15', '2020-02-25 02:29:15');
INSERT INTO `oauth_access_token_providers` VALUES ('63115c0c2d9041556e12329e51fbe164c8c804fcbaa1fadf6efdc376a0f72c9b6c54091de7628c38', 'user', '2020-01-11 10:11:38', '2020-01-11 10:11:38');
INSERT INTO `oauth_access_token_providers` VALUES ('651836d9bb1b7db7ea13e441aa808d4cb94966b87829178e4789c592052d85755bc22493489c9823', 'users', '2020-03-22 05:39:13', '2020-03-22 05:39:13');
INSERT INTO `oauth_access_token_providers` VALUES ('652c0f57071b71c42cfea8bfe2c006cc7c0eeb1991b52b102322991a90f9a6e2f339da179ffb2f69', 'users', '2020-02-25 02:40:28', '2020-02-25 02:40:28');
INSERT INTO `oauth_access_token_providers` VALUES ('655c17f8fbbc9d5e005fbcf9a86072a521eeedac2c6ad73f4dec0f8c91e3900a162bdcedb1247a31', 'user', '2020-01-11 07:59:13', '2020-01-11 07:59:13');
INSERT INTO `oauth_access_token_providers` VALUES ('65b5fc72f39c6a4f1e11c36d616e007b323419da14ca0cc7e35ba532acc15cb222464b956295ec09', 'admin', '2020-03-21 08:50:13', '2020-03-21 08:50:13');
INSERT INTO `oauth_access_token_providers` VALUES ('66d0bd9f73e16d32a85dd2d5ad1a87bc0fc85f227deec47caf69b4e690a049a9ba51e98575e333d6', 'admin', '2020-03-20 12:54:08', '2020-03-20 12:54:08');
INSERT INTO `oauth_access_token_providers` VALUES ('67451ddafa61141b763e8047d9aff07a6de011fb1773f09520e24f1ded43f3e16726098b8b444cb2', 'users', '2020-02-25 02:51:25', '2020-02-25 02:51:25');
INSERT INTO `oauth_access_token_providers` VALUES ('67cfd6d576aa730d44ca6710cab14e62722991a977d872f779b0840ea4598f5bd1dada24dfdc236c', 'admin', '2020-03-20 08:29:10', '2020-03-20 08:29:10');
INSERT INTO `oauth_access_token_providers` VALUES ('680565d69bd7267839ddd7c6018593d5d38e72bd13a73847d1068f93f8f4cddcac325ed0d544158f', 'users', '2020-02-25 00:43:50', '2020-02-25 00:43:50');
INSERT INTO `oauth_access_token_providers` VALUES ('68cc6d18152c35bc4960c6c93319dfc2501638c598bbbf1cfca35e9a4e4e603cbb8eece9e821de26', 'users', '2020-02-24 12:14:33', '2020-02-24 12:14:33');
INSERT INTO `oauth_access_token_providers` VALUES ('68cced90df2b2822f54736821acf7f62e47f8f01341170974c4f314a917551805ebef42f23a654b2', 'users', '2020-02-24 09:30:59', '2020-02-24 09:30:59');
INSERT INTO `oauth_access_token_providers` VALUES ('696493eb4cda2930d3e6982c4a6d18b982309b0e54f784d78441a16e147ca76cd683392f24e48597', 'users', '2020-02-24 13:08:32', '2020-02-24 13:08:32');
INSERT INTO `oauth_access_token_providers` VALUES ('69f6a944e130995c949f75ab3f64e07d1f17accc0f7bedb7f048f871b713119c0a96f6259ef26cc7', 'users', '2020-02-24 09:37:15', '2020-02-24 09:37:15');
INSERT INTO `oauth_access_token_providers` VALUES ('6fe1a8964b0f423abd394c6bb718a4b52543c8c70ad5ce93f9d0ca106296fa04b53c5c20d144e90b', 'users', '2020-03-22 05:41:38', '2020-03-22 05:41:38');
INSERT INTO `oauth_access_token_providers` VALUES ('700ce484938321c119b782fcdfefa8a557bbb30cd7efbc8b5204f542eafb96958671c6de9a8b7eef', 'admin', '2020-01-19 14:45:33', '2020-01-19 14:45:33');
INSERT INTO `oauth_access_token_providers` VALUES ('71009c7a88e2c5a01296d16748a9173226577c7ce0e379c451a78a677fefefe4de0245816ce36164', 'users', '2020-02-25 02:47:25', '2020-02-25 02:47:25');
INSERT INTO `oauth_access_token_providers` VALUES ('71d452045fc24c4a127532de102eaa0f025273f78367be90530b4bf2e6f9ccdcdeedae19ca0e53cb', 'users', '2020-02-25 03:03:41', '2020-02-25 03:03:41');
INSERT INTO `oauth_access_token_providers` VALUES ('72727a6d6a5f3c9d66349bbd1d1815990836734bc60792b5fea194fde2cfa655fde9bf6db8c3f94a', 'users', '2020-02-29 03:18:42', '2020-02-29 03:18:42');
INSERT INTO `oauth_access_token_providers` VALUES ('73199e77ca38956c21ae9f6aac8f40d75476f531f1e390f285cd1e4458624a6ca9ca012a1a0b6bc8', 'users', '2020-03-22 05:40:50', '2020-03-22 05:40:50');
INSERT INTO `oauth_access_token_providers` VALUES ('7576e30a0995f24340f59204f5ac60bdc47f10b11ba6b304ed5eb442c9761d747e6376d69074d28c', 'users', '2020-02-25 03:00:44', '2020-02-25 03:00:44');
INSERT INTO `oauth_access_token_providers` VALUES ('768ac003fe6aebcfe766aa20c96bc9021f6dd843cb70de76d4405661478883f8475f3564db72dcae', 'users', '2020-02-24 11:01:19', '2020-02-24 11:01:19');
INSERT INTO `oauth_access_token_providers` VALUES ('7707ab9f6f6dbb9d8862053cd0597b3520b108206013360d4f53f7071dba4e6b9f669d8c3d41ae28', 'users', '2020-02-24 08:00:00', '2020-02-24 08:00:00');
INSERT INTO `oauth_access_token_providers` VALUES ('77c0e16401e2dc4ad619801632e1cb4816d3b50586b538a142967a105105c748f8d0cf210fca74f1', 'users', '2020-02-24 09:35:35', '2020-02-24 09:35:35');
INSERT INTO `oauth_access_token_providers` VALUES ('78a2e5205f713a95c4ddb36c18968b5efadabef194e8b936c4fe28223f3b97ff2ea8473236dfe614', 'users', '2020-02-29 03:33:34', '2020-02-29 03:33:34');
INSERT INTO `oauth_access_token_providers` VALUES ('7a100ee0980eacdefbfec76dbed71deb9208b50827ad166cf8a2a05ef2821b2f3818394f99026d5e', 'users', '2020-02-24 11:20:46', '2020-02-24 11:20:46');
INSERT INTO `oauth_access_token_providers` VALUES ('7ad82473311df6862895ef291fc67e723718126cc530c3c95df78df334e1a6eaf46fce552cd9276e', 'member', '2020-01-11 09:26:17', '2020-01-11 09:26:17');
INSERT INTO `oauth_access_token_providers` VALUES ('7b09ec6c258acfc00e7fd9c82854efa1eeed43a6c36f9400255076d29484a069c127a8c5265d6079', 'users', '2020-02-24 02:04:10', '2020-02-24 02:04:10');
INSERT INTO `oauth_access_token_providers` VALUES ('7b1ca927ef649068eacb2bc47f4d6e9e28679c983a36390b53f5d461ef088486c7673792e14fa6fe', 'users', '2020-02-25 02:31:47', '2020-02-25 02:31:47');
INSERT INTO `oauth_access_token_providers` VALUES ('7c9681d94dfec59b1943a10439bd051931ce176c9ef8623cb60c2a7f59dc4616320c284bb912386f', 'admin', '2020-03-20 08:28:15', '2020-03-20 08:28:15');
INSERT INTO `oauth_access_token_providers` VALUES ('7e9acb19f2e1fda5b2b9f84ba1d277ae7821d68c1f88f468f989b78eb5f0a20e2c3be1ac1378798b', 'admin', '2020-03-20 07:17:46', '2020-03-20 07:17:46');
INSERT INTO `oauth_access_token_providers` VALUES ('8086933cdbf07b016ed9520598f868328193e654d64161adc751a75171e3da591d127434bdc69b1e', 'users', '2020-02-24 12:14:25', '2020-02-24 12:14:25');
INSERT INTO `oauth_access_token_providers` VALUES ('80e3013b49589933b48fcea6be6685ed8bb403301c461bbc7e37d9150e7c4485fb5712eb4bc59e44', 'member', '2020-01-13 08:11:22', '2020-01-13 08:11:22');
INSERT INTO `oauth_access_token_providers` VALUES ('812a7c2843bb0f316a3f9f47174c11d8d31789af008237ead251d5050bfd752d32a1532c66bc5e1d', 'users', '2020-01-11 05:13:52', '2020-01-11 05:13:52');
INSERT INTO `oauth_access_token_providers` VALUES ('819692de50ac2a6d0d6a51c0791783a873487300b5f4fbd137ac91abd351b8d4e5568b2327a05c41', 'users', '2020-02-25 02:08:35', '2020-02-25 02:08:35');
INSERT INTO `oauth_access_token_providers` VALUES ('823cc10b9c4c1200888724eeeced336c09629f024361545d7696b4c9b3df39e8fca10bfc82a48d52', 'admin', '2020-03-20 08:38:42', '2020-03-20 08:38:42');
INSERT INTO `oauth_access_token_providers` VALUES ('8338cc8cb4043bce5212f44d0be0310ecd2e559bdc4aeac944ec02bbb60e8dbb9dd915b471602e3e', 'users', '2020-03-15 00:59:38', '2020-03-15 00:59:38');
INSERT INTO `oauth_access_token_providers` VALUES ('83c1db6c8e5be48951d65562faccffb069c5a95dbb0928c84ef728a2e046fb7b7b6e30543ff637e1', 'users', '2020-02-24 11:15:29', '2020-02-24 11:15:29');
INSERT INTO `oauth_access_token_providers` VALUES ('842dab36cc5c2646f57dacf2402d10155a4cbf632f425c35bd9ecf1e36c9003f2d3fe4d30366684b', 'admin', '2020-03-20 08:47:02', '2020-03-20 08:47:02');
INSERT INTO `oauth_access_token_providers` VALUES ('8573c8f53e58ae88851bfe88c321fcc2aede1e86a2e3c2d2b8ea0bde086384289a4cc6ca02d505c6', 'admin', '2020-03-20 08:46:49', '2020-03-20 08:46:49');
INSERT INTO `oauth_access_token_providers` VALUES ('86785ed54f97ebf8277da71a3c728eafc85866f6b37415f3409a5940d52a4b9ef51d1a0f7c55ec80', 'admin', '2020-01-11 07:58:23', '2020-01-11 07:58:23');
INSERT INTO `oauth_access_token_providers` VALUES ('878f3cb6cee12dc21dc442aebb214fbeab85b978b425e21d1d27a09b818d79a3f06b246558f15211', 'users', '2020-04-14 08:28:48', '2020-04-14 08:28:48');
INSERT INTO `oauth_access_token_providers` VALUES ('892eeec8a99994a5f0092005c3fca4ff0c4bdc987a3db2a6ccd2c89a5c6111c10c3a65b8b69a5f17', 'admin', '2020-03-20 08:28:49', '2020-03-20 08:28:49');
INSERT INTO `oauth_access_token_providers` VALUES ('8bef60330bc3626486acdc1a6b3f45ea91f7e315d65b2099f8f484e674d57a8f330711b4b620cdf3', 'users', '2020-02-24 13:28:59', '2020-02-24 13:28:59');
INSERT INTO `oauth_access_token_providers` VALUES ('8d1a96ff0068ecf16950ad33ce06bd5d723a4945c8fff0fa6f4e6a6d5eb7fa4a0f4209f5ba98b1a9', 'admin', '2020-03-20 07:31:54', '2020-03-20 07:31:54');
INSERT INTO `oauth_access_token_providers` VALUES ('8eb70486a53cafd1f86e57f3cc49024b6ac6e6c12a5f1b9b6e4aa139df3a7ad588eb0bcac31a21e0', 'users', '2020-01-11 05:24:50', '2020-01-11 05:24:50');
INSERT INTO `oauth_access_token_providers` VALUES ('8f90a387ad76a59be9777edd0401aa5b57ce9c0d436d2e2fbf8077ba1a2e76d0c4108ddeb0ef559e', 'admin', '2020-03-20 08:04:19', '2020-03-20 08:04:19');
INSERT INTO `oauth_access_token_providers` VALUES ('902ab026ce56efcec1a4e7020dc0a05ca8c2ca2eda2ac09289821ba0a90a1f2d26c993643c8d0c20', 'admin', '2020-03-20 08:37:12', '2020-03-20 08:37:12');
INSERT INTO `oauth_access_token_providers` VALUES ('91bc08c1cf7bae09fb3d1b29d6999cd4a370a8c228ff0edf43ccbcf76d9a861a4da8792386403f11', 'users', '2020-04-14 08:26:57', '2020-04-14 08:26:57');
INSERT INTO `oauth_access_token_providers` VALUES ('91fba6ca938d6152a1945f7092fbd7167210f5c5fa37077870c242d4430e7de2afb581a43190da74', 'users', '2020-02-25 02:07:48', '2020-02-25 02:07:48');
INSERT INTO `oauth_access_token_providers` VALUES ('92c5b8e9b9b80ec499262f298b49a02f4504120faab85f9750a6e97403fed4d0f27b8cb9326dfc59', 'user', '2020-01-11 09:59:41', '2020-01-11 09:59:41');
INSERT INTO `oauth_access_token_providers` VALUES ('92d632a00c4dca014f2b398d4dcc9e75591bd68be54e584e6cf4cb7b6a0d9afa357538c570027d4f', 'member', '2020-01-11 07:58:46', '2020-01-11 07:58:46');
INSERT INTO `oauth_access_token_providers` VALUES ('92fbfb60c53194723cf9576ed150f41296ed73f6d7dd7585d2efdbbf9f7bee75f3faea436b595984', 'users', '2020-01-15 08:17:38', '2020-01-15 08:17:38');
INSERT INTO `oauth_access_token_providers` VALUES ('93aa434893797ff77697c4a083ae433059de507410e08e16446dcd24b40d2c667df474970406c9c0', 'users', '2020-03-14 06:47:01', '2020-03-14 06:47:01');
INSERT INTO `oauth_access_token_providers` VALUES ('93d25c6e696298f99841545dc157b19699a9815604accb90b5c65ee5ed312a9a41b4315070214dc7', 'admin', '2020-03-20 08:18:26', '2020-03-20 08:18:26');
INSERT INTO `oauth_access_token_providers` VALUES ('94aa1a28d7db56de37e705f04ccfd025e97557e2a29f08c46424b635f7735f9fefb2f1f0504c5351', 'users', '2020-02-24 12:18:12', '2020-02-24 12:18:12');
INSERT INTO `oauth_access_token_providers` VALUES ('969f74b5e3e36bb95423fc44d6c71f9329c3ccd954f3f0de8c5299cfe07b9762f90f1de82c2aee56', 'users', '2020-03-22 12:38:41', '2020-03-22 12:38:41');
INSERT INTO `oauth_access_token_providers` VALUES ('97114a6118cf9f79db6d4c2af3e37c6d9558d3fd2f227cb8cfc6d2817404be89c252a0dc7b4c4a6f', 'users', '2020-01-11 10:30:45', '2020-01-11 10:30:45');
INSERT INTO `oauth_access_token_providers` VALUES ('97b61fac85750fd392a3f7d0bb577c07bc9c7963ceb2b82acd7de77380d423ecc00196b44da704a3', 'users', '2020-02-24 11:49:49', '2020-02-24 11:49:49');
INSERT INTO `oauth_access_token_providers` VALUES ('984be18331e7f9c06d2f1d510f58262a495c1e4940d9c5e35c09c95ab0313bbd80ed0b0d96549ce2', 'users', '2020-02-24 13:31:35', '2020-02-24 13:31:35');
INSERT INTO `oauth_access_token_providers` VALUES ('98f131ef468a991a556ec0527e277f425ea9524801864550aec3cc1907fc4be2173582733ec6198f', 'users', '2020-02-24 00:10:59', '2020-02-24 00:10:59');
INSERT INTO `oauth_access_token_providers` VALUES ('99ad09409f03064bcab8645e2720592262d5112eea5ebf78b75de0984df7297806a582258c459fcb', 'member', '2020-01-11 08:15:17', '2020-01-11 08:15:17');
INSERT INTO `oauth_access_token_providers` VALUES ('9ab35721fabf428cad02ac4eda56dd89848e10575974372f29c19f4775db8aedaf0b03dd47d7d534', 'users', '2020-02-25 02:07:05', '2020-02-25 02:07:05');
INSERT INTO `oauth_access_token_providers` VALUES ('9b4391048064d7f0bec5272687dcdf77158ced9c574f17efd60f8d2b68474cb052cf6defd6b920f0', 'users', '2020-03-22 12:52:19', '2020-03-22 12:52:19');
INSERT INTO `oauth_access_token_providers` VALUES ('9be1568bcbc27c0409032eedb4f5a6b95f4e28a9b237fef6aa44321b4ca4ae2937e54f03827b057b', 'users', '2020-02-24 13:34:30', '2020-02-24 13:34:30');
INSERT INTO `oauth_access_token_providers` VALUES ('9c38da79bff4ce623f8c9196717ff011ffbe5a50a1ef55b6bc64a78582388f1d9cc24469db2a95fc', 'users', '2020-02-24 13:30:10', '2020-02-24 13:30:10');
INSERT INTO `oauth_access_token_providers` VALUES ('9ca16d2789ccdd65e349a3a602fbb629278ecb4d26f36f25beb5cbb38decef169959a74dbfa5dc4f', 'admin', '2020-03-20 07:39:31', '2020-03-20 07:39:31');
INSERT INTO `oauth_access_token_providers` VALUES ('9cb5db382aed00e2e74f270f1addec57b9d3aa7c98c58f2980654806de29fe5fa9ea458fa7eb1d23', 'users', '2020-03-15 07:36:01', '2020-03-15 07:36:01');
INSERT INTO `oauth_access_token_providers` VALUES ('9cdc60176e46a99c1298658270b1c7afc1015907ce1b12c84a0a6c1234466c8931015d50af702813', 'admin', '2020-03-20 07:15:05', '2020-03-20 07:15:05');
INSERT INTO `oauth_access_token_providers` VALUES ('9ec9053caeb3805b2f2107763c39c541ac333de45ab6b092bd6b553b317a7bb77aa76ec137001847', 'users', '2020-03-11 12:24:10', '2020-03-11 12:24:10');
INSERT INTO `oauth_access_token_providers` VALUES ('a086cee4869eeaeb7346dc7cca244048ab1afb460278889f034a9d422fe36ca4ee7cbf080bf16eaf', 'users', '2020-02-25 01:08:14', '2020-02-25 01:08:14');
INSERT INTO `oauth_access_token_providers` VALUES ('a23465262173186be60b01eecba7fdfe1aaf80da6ae251689e073348c814971d4d28b470b2ea474f', 'users', '2020-01-11 05:14:02', '2020-01-11 05:14:02');
INSERT INTO `oauth_access_token_providers` VALUES ('a2b557117d37f0a8d7cf9cee073bbc20581255b60e1b9656de972cdd155e3797c3e2e3160e57221b', 'admin', '2020-03-31 09:27:32', '2020-03-31 09:27:32');
INSERT INTO `oauth_access_token_providers` VALUES ('a492592757091a06fcac7cfc7378c17c23520a5af90dbd2546b7eda920313f7b61bc33cfdd5f7649', 'admin', '2020-01-18 14:29:35', '2020-01-18 14:29:35');
INSERT INTO `oauth_access_token_providers` VALUES ('a64749cf2e10da7edaca7f9271cf9ae37d28677486fb7c3042964b71310df5e58e73d58f17c0c7d0', 'users', '2020-02-24 11:20:03', '2020-02-24 11:20:03');
INSERT INTO `oauth_access_token_providers` VALUES ('a70e8d0acfb2c388aafebe490a850d705fc8df9ea90f51a6338d2354c2ec4594a3ee5ee32c82231b', 'users', '2020-01-11 10:21:04', '2020-01-11 10:21:04');
INSERT INTO `oauth_access_token_providers` VALUES ('a87446a48d124e4af483d33d0ac550aaf6e85e22115e85e14f6a979d9fde327ce575dbf92646ab16', 'member', '2020-01-13 08:11:44', '2020-01-13 08:11:44');
INSERT INTO `oauth_access_token_providers` VALUES ('a893b0e1d073643b19f89b2363602a7cc812b82e3177cdecc22b9adf417251720b6510d0c7a28eca', 'users', '2020-02-24 12:26:18', '2020-02-24 12:26:18');
INSERT INTO `oauth_access_token_providers` VALUES ('ad3cfd2437e2e13b585bd769b043f33af5690dda783afa8d335d32d7cbf358ee9793bcdf558da8f2', 'users', '2020-02-25 06:10:10', '2020-02-25 06:10:10');
INSERT INTO `oauth_access_token_providers` VALUES ('ae1e06631f69d6fdc7374dfecdadc0a0b08eaf85282af3b0f2b49190dbdf0b379292fc4dbc371f4b', 'users', '2020-02-24 00:08:36', '2020-02-24 00:08:36');
INSERT INTO `oauth_access_token_providers` VALUES ('ae7edcfd8684d34411639eeb444967040a9c62977c7dafdcf53d1cb7860ab648a1f907e1f3a28dd0', 'users', '2020-02-25 02:50:15', '2020-02-25 02:50:15');
INSERT INTO `oauth_access_token_providers` VALUES ('ae82e12e6a935da7ee165432171b38788e0008a068d7b31b29fd48c5136cab3b14193ab259615e85', 'users', '2020-02-24 07:40:36', '2020-02-24 07:40:36');
INSERT INTO `oauth_access_token_providers` VALUES ('b0f629c9f474e5cabe5d4d28ae3b5208ca92d8752dd9a07c2b8cdfac4e7c2467efbfc350bfa0e65f', 'users', '2020-03-22 09:54:17', '2020-03-22 09:54:17');
INSERT INTO `oauth_access_token_providers` VALUES ('b197189d0d4164370f2574184978267d8c165528a2559588ec6b59451066aa646c317a020aa93335', 'users', '2020-03-22 05:41:11', '2020-03-22 05:41:11');
INSERT INTO `oauth_access_token_providers` VALUES ('b1f7e591cb9be67dffe7716bc5abf2db6a2fe15c88692b152e03ed4e34dcc6521a124badc5a1f903', 'users', '2020-03-27 03:03:07', '2020-03-27 03:03:07');
INSERT INTO `oauth_access_token_providers` VALUES ('b3c75efddb252126a3c2acc56d0c2aa07ea761b672457319bf62ed61a1ebf9668de81c8e8d42fa13', 'admin', '2020-01-18 01:07:57', '2020-01-18 01:07:57');
INSERT INTO `oauth_access_token_providers` VALUES ('b40a4bfa593e847ca35dec404d962a467a88ca5ce1c69cc9b0b6e3e39d9930b93977756b9df12d4a', 'admin', '2020-03-20 08:14:28', '2020-03-20 08:14:28');
INSERT INTO `oauth_access_token_providers` VALUES ('b4950f92f033a17d84ca5a0d8a60d5e241572691db7dff885045f01125fe1c963affa31d7846d805', 'admin', '2020-03-11 22:44:28', '2020-03-11 22:44:28');
INSERT INTO `oauth_access_token_providers` VALUES ('b4da2f86ab326d40e316e6e4259b1f33f2d42df7df7dcf2027bcbc3003b3898deed259ffa0c6fb46', 'admin', '2020-03-19 23:38:06', '2020-03-19 23:38:06');
INSERT INTO `oauth_access_token_providers` VALUES ('b685fc29369ce5aee2cdf0b7cd2513e8a6790311a5614667b269246e5f03d41507cf912ce732f803', 'users', '2020-02-25 03:30:44', '2020-02-25 03:30:44');
INSERT INTO `oauth_access_token_providers` VALUES ('b7146b70d128fcf43e3d12bf95eedb72d4b63bdf045305b17e1553391476abc701173a4eeeed6ccb', 'users', '2020-02-25 03:00:08', '2020-02-25 03:00:08');
INSERT INTO `oauth_access_token_providers` VALUES ('b864114d91f816d9a441db25dd21c0bfbf9198d600a45cf13775dc4323b9024d906e9a47a28a786e', 'admin', '2020-03-20 08:31:27', '2020-03-20 08:31:27');
INSERT INTO `oauth_access_token_providers` VALUES ('b8bbe9313ddc39a99495aae8f7f8dbc1c90bf645ffe2aa5ddb8d67f72a8c89ee5237fc4d2a3654ae', 'users', '2020-03-27 02:58:37', '2020-03-27 02:58:37');
INSERT INTO `oauth_access_token_providers` VALUES ('ba40f786a79e178b46002d302b24afd542ad2e55bfad7481d09f3069278f70448bfe841245e55315', 'admin', '2020-03-20 08:09:38', '2020-03-20 08:09:38');
INSERT INTO `oauth_access_token_providers` VALUES ('babdb98d86faa7792c89f7ad17747cddc578a948eefbe25a7d0b552564a17b454a5658dc390fceb1', 'users', '2020-02-24 11:20:39', '2020-02-24 11:20:39');
INSERT INTO `oauth_access_token_providers` VALUES ('bbbb4c3852651d1bb56b50e842c60471a6d9769de62d3ef33349c8370e3b7cbf28da7464bc200e16', 'admin', '2020-01-18 05:30:11', '2020-01-18 05:30:11');
INSERT INTO `oauth_access_token_providers` VALUES ('bbcf307d15396791e979c05288f24fcf8026b49463fc0a1be371d6e9e40d855fb1ffcb9629acab29', 'users', '2020-02-24 09:08:16', '2020-02-24 09:08:16');
INSERT INTO `oauth_access_token_providers` VALUES ('bcbfba26ff64a7787153b994bb5ddccb300b9d7f1a4aec447b0ee8efcecdb090b28c392c642347a3', 'users', '2020-02-24 10:59:47', '2020-02-24 10:59:47');
INSERT INTO `oauth_access_token_providers` VALUES ('bf92714b5d48ce86ccaf18b30ec9a26e07877ecd6cc90cbb95f59ced3f7e1f79a61492a4220c17ab', 'member', '2020-01-13 08:11:53', '2020-01-13 08:11:53');
INSERT INTO `oauth_access_token_providers` VALUES ('c0488cea9a500ccf6c76a10b09174c3a771a839045df03d7eeb368ffb9fe3c7ac48ddea9454a70e1', 'admin', '2020-03-20 08:43:45', '2020-03-20 08:43:45');
INSERT INTO `oauth_access_token_providers` VALUES ('c07d84e18a6eea76532c18ad7431f3705fa7e1daf078d0df9b80e2816b931039036cf82d9ff85f51', 'users', '2020-02-24 13:26:16', '2020-02-24 13:26:16');
INSERT INTO `oauth_access_token_providers` VALUES ('c228a3c6c4cfb480e18ac45784f5614a501cfb0a4243e552f076c6f45246d48c085983eff822dcb8', 'admin', '2020-03-20 13:01:07', '2020-03-20 13:01:07');
INSERT INTO `oauth_access_token_providers` VALUES ('c2703b60190db517b224f09d9e84c9019111cd48e39f1144e35082e8f9963edfb533bdc1a515b765', 'users', '2020-02-25 02:13:26', '2020-02-25 02:13:26');
INSERT INTO `oauth_access_token_providers` VALUES ('c287482aff9270a7e13a4d8a01dfa28c6b060e96f10b7d892d07b48c5eafaa1d7a13aa38c0124a9d', 'users', '2020-03-22 12:56:35', '2020-03-22 12:56:35');
INSERT INTO `oauth_access_token_providers` VALUES ('c47c8041b50e78d5321203d87a909110d7578783c5e9462f3148640e285d17b67e0a82efdae4fc7d', 'users', '2020-02-24 12:26:27', '2020-02-24 12:26:27');
INSERT INTO `oauth_access_token_providers` VALUES ('c644c7ddb67f34f9d6888243dcbbe9f813bbfa31f8d00a681b59ac28cf971894ed71bab2066253d4', 'users', '2020-03-22 05:41:46', '2020-03-22 05:41:46');
INSERT INTO `oauth_access_token_providers` VALUES ('c67e589781dfe06f206760a2d3b392b46eee817fa7fbbcb81e16def2665a19e321f7f60be41f3c50', 'member', '2020-01-13 09:25:12', '2020-01-13 09:25:12');
INSERT INTO `oauth_access_token_providers` VALUES ('c6ce0afd7b4161d52d2113bd6d75fad8ed181444e37aac424cb76c14510ffaf75a62379c69ba231a', 'users', '2020-01-11 06:01:08', '2020-01-11 06:01:08');
INSERT INTO `oauth_access_token_providers` VALUES ('c89b07e244fa3a31fc859a47ee05073e6c43833dff0e0fc87c43d5fbebe87638715509b4f866ed6e', 'users', '2020-01-11 06:43:38', '2020-01-11 06:43:38');
INSERT INTO `oauth_access_token_providers` VALUES ('c8affebb0900e0cd8ab1145fc417f603c616f1c2dd5c9f6ae86345453f6bb4b5254de6eb4cfa87e1', 'users', '2020-02-24 10:57:04', '2020-02-24 10:57:04');
INSERT INTO `oauth_access_token_providers` VALUES ('ca254d18f6078ec0b45aa1ba8ae5ea3647c14a59df7f453431a3e81555a4ad996ecc79321ed7452e', 'admin', '2020-03-20 08:31:16', '2020-03-20 08:31:16');
INSERT INTO `oauth_access_token_providers` VALUES ('cb1a58124316e6f1f9638e28d64524cd6560731c93cda23a387be73d9fe6a38a95b0cc8a39519d19', 'users', '2020-02-25 01:18:57', '2020-02-25 01:18:57');
INSERT INTO `oauth_access_token_providers` VALUES ('cb2294a3bea2645699f78b01f577592cd1e4236774feb59528fcc6d42eebb51287b5000703769868', 'users', '2020-02-25 02:19:16', '2020-02-25 02:19:16');
INSERT INTO `oauth_access_token_providers` VALUES ('cc26e8748b7f152596db85c67c9ab505e042f25d2fd5bc074c28ce92d37fec7de0a0ffc8ba8af62b', 'users', '2020-02-25 06:10:19', '2020-02-25 06:10:19');
INSERT INTO `oauth_access_token_providers` VALUES ('cd69d22719d299cbabe6fa69e7fa6b3667faea98ce14605b3e012e6d597fe85acdee3c8c1d09f418', 'users', '2020-02-24 07:40:29', '2020-02-24 07:40:29');
INSERT INTO `oauth_access_token_providers` VALUES ('cdd86c76e2981d90dfe6eddc4ac621b81958a804621496c3baa62acfcfbaed93324f14c740528c22', 'admin', '2020-03-20 07:52:31', '2020-03-20 07:52:31');
INSERT INTO `oauth_access_token_providers` VALUES ('cdea293b73a466ca3d52cf874131b23b32744d67d4f753599fc509febcb23ca0cebe294ecbb37b7d', 'users', '2020-02-27 11:58:28', '2020-02-27 11:58:28');
INSERT INTO `oauth_access_token_providers` VALUES ('ce11b06eeab7a5fa31fbefc34b9bab374eb77284e79d37e1c20ef86096ccb241ec81329daac15a7a', 'users', '2020-02-25 02:05:52', '2020-02-25 02:05:52');
INSERT INTO `oauth_access_token_providers` VALUES ('d1d9d1cb75bf6ef9e17463c65c18e0e2837f29b3b1d0b4ded86661f0d3fb8e29b0cda5884f937ac8', 'user', '2020-01-11 08:31:44', '2020-01-11 08:31:44');
INSERT INTO `oauth_access_token_providers` VALUES ('d25603ed30a59435b21f318771fe8239aee764eebf66ff964b627591ea7281093a009114b2ce8699', 'users', '2020-01-11 05:15:58', '2020-01-11 05:15:58');
INSERT INTO `oauth_access_token_providers` VALUES ('d407277c03b728a7c57e584bcfb3c665685c6074b1e5c3a81e38be1e2c3188325f2afb57d3a810a7', 'user', '2020-01-11 09:26:40', '2020-01-11 09:26:40');
INSERT INTO `oauth_access_token_providers` VALUES ('d530cf01f755cbc5f03005a3d4f2d4141a4880468e6c9ed72cbc3f726d89ad1c92ea8487e21d9c50', 'users', '2020-02-25 00:48:21', '2020-02-25 00:48:21');
INSERT INTO `oauth_access_token_providers` VALUES ('d58e364078da055452be93ca35b6f4a6ee0dfc8326934401cf823d145ec6d98b6eb7ee4ca3a1cb1a', 'users', '2020-02-25 02:41:11', '2020-02-25 02:41:11');
INSERT INTO `oauth_access_token_providers` VALUES ('d6550695ae0772aa1238f2eae59cb54b360881d365015185bc074bf56d8f13eda4dde3af6b3e983e', 'users', '2020-01-13 02:52:19', '2020-01-13 02:52:19');
INSERT INTO `oauth_access_token_providers` VALUES ('d67e7012d4d672f16735d3c85ca7735b3702d9784a566697909e6dcc72c5e60e9bc19212e699a3bc', 'users', '2020-03-22 05:42:58', '2020-03-22 05:42:58');
INSERT INTO `oauth_access_token_providers` VALUES ('d77309572732f73c41cd66692c7f5c95a674562175ace7edccfbef63a32a80ee5c2e0d77db27b468', 'users', '2020-02-25 02:29:25', '2020-02-25 02:29:25');
INSERT INTO `oauth_access_token_providers` VALUES ('d87a4eacbc0ad8bca0a095cee2dd8fbe348227547b03f69e7df469faa2c0da626c19f4e9ba81882c', 'admin', '2020-03-20 08:15:16', '2020-03-20 08:15:16');
INSERT INTO `oauth_access_token_providers` VALUES ('d99874f07ff233e3162d07676cc81dfa89eb4d9457337392cb2a78f62a1c50b7079044cdb667f86d', 'users', '2020-02-24 11:15:58', '2020-02-24 11:15:58');
INSERT INTO `oauth_access_token_providers` VALUES ('db5341ea8f9f2bd50bce5caccd6a3c28dbe251096e53e64bd74a141197bdb747b02217019a50d28d', 'users', '2020-02-25 02:39:04', '2020-02-25 02:39:04');
INSERT INTO `oauth_access_token_providers` VALUES ('dc1ce7fca3da3f2dad2f11a2949a1f0b81e9eec6155993b3ee421e3b452f442be42598dbafc895d4', 'member', '2020-01-13 09:40:32', '2020-01-13 09:40:32');
INSERT INTO `oauth_access_token_providers` VALUES ('dda4636a648b479dce69683a32f271346d409fb278235b15cec929cc7e091fb412b79e63f170e3ca', 'users', '2020-01-14 03:48:59', '2020-01-14 03:48:59');
INSERT INTO `oauth_access_token_providers` VALUES ('df3a742f88308a6a2aa0fb66e87bb9daad5d111f0f3b9563677d0dad954982e5d5837b53c50a55d3', 'users', '2020-03-14 08:57:30', '2020-03-14 08:57:30');
INSERT INTO `oauth_access_token_providers` VALUES ('e1d778e67171b7efcf84e3977436a2a8c4415746822305970fe749a34ea71c95723c19a2f7973cbb', 'users', '2020-03-14 08:57:39', '2020-03-14 08:57:39');
INSERT INTO `oauth_access_token_providers` VALUES ('e3f633c2823f68ed6ecb645176c946deecbd4c2bd7694d249ee7400dfa0640916f96b809fd2dadf1', 'users', '2020-02-25 07:22:09', '2020-02-25 07:22:09');
INSERT INTO `oauth_access_token_providers` VALUES ('e58e48729e95ceaa9f86ef7df4ff02a8752b3f62c19930ca92d68a036da5d81a7faed8b9880a7c97', 'users', '2020-02-24 09:35:05', '2020-02-24 09:35:05');
INSERT INTO `oauth_access_token_providers` VALUES ('e61e8d1750e5f011d21e2e564a674a2e5412e7abb5f09af92ef54f2e6a20041210e926079fde6fc4', 'users', '2020-01-11 05:15:58', '2020-01-11 05:15:58');
INSERT INTO `oauth_access_token_providers` VALUES ('e655ebd8923376a109eb1d8963b200577f2f9167cac9c8a24f3a832ff51dd4d614ac363e3931fe36', 'users', '2020-04-14 08:17:35', '2020-04-14 08:17:35');
INSERT INTO `oauth_access_token_providers` VALUES ('e6884c4f89c5d720b6ed6ca9a2e253e1a365ed10db3d1f62068f945f96b9bad60a82223600116eab', 'users', '2020-02-24 11:08:42', '2020-02-24 11:08:42');
INSERT INTO `oauth_access_token_providers` VALUES ('e883087cf60a8944d2ba927699b73b3b1d8079aecaf2b4cfa0d74c9441eafb94dacdfd2361b60cb5', 'users', '2020-02-24 07:05:44', '2020-02-24 07:05:44');
INSERT INTO `oauth_access_token_providers` VALUES ('e8ab1bd95b410e50457958dd753d4baedf806c8a636cf72995e916c2bdcacdcfb8f203eb15d2e26a', 'users', '2020-02-25 02:00:07', '2020-02-25 02:00:07');
INSERT INTO `oauth_access_token_providers` VALUES ('e9d18d6741dd684ff8a7b477f7c5e1d911b346bf252985b7200a81ff72ac50080ff83b8b0c82f1a2', 'admin', '2020-03-20 08:29:23', '2020-03-20 08:29:23');
INSERT INTO `oauth_access_token_providers` VALUES ('eb2e1e068921104dc30c8a24b0cf6070c9419ef812f8dc9ddb1b15d5177854bf7b037e1eb75e8ad7', 'admin', '2020-03-20 08:21:13', '2020-03-20 08:21:13');
INSERT INTO `oauth_access_token_providers` VALUES ('ec7fec1215a8da54d24e7aa3e322d746dd5402838417d2595331876d08ce50d059b241d5f3e20039', 'users', '2020-02-25 01:23:43', '2020-02-25 01:23:43');
INSERT INTO `oauth_access_token_providers` VALUES ('ed0b34071db8ec0b4c94d5ee864c19e0a88405fb95079d62e4f2bb4e5bcbb82bd3906e40d744c97b', 'admin', '2020-03-22 04:45:59', '2020-03-22 04:45:59');
INSERT INTO `oauth_access_token_providers` VALUES ('edc6201357c062b88558f492cfd39f03379cb6c5f3cc61845bd0b702fd33bc1ae55b40c1847a0fcd', 'users', '2020-03-22 09:54:22', '2020-03-22 09:54:22');
INSERT INTO `oauth_access_token_providers` VALUES ('ee347455722cfebd7ac31ae302c0710b66e99f038d6fc4b670079516532816c43ad918dba611125e', 'users', '2020-02-29 06:03:06', '2020-02-29 06:03:06');
INSERT INTO `oauth_access_token_providers` VALUES ('eea1e00b8dfeaa145477d3af80647ceca6dd7a341b7e6e62d70f7891a9ab4c1e1b914bab34f4a9cd', 'users', '2020-02-25 01:20:05', '2020-02-25 01:20:05');
INSERT INTO `oauth_access_token_providers` VALUES ('ef271cea4f3c979942d86feb03a716eac775f4e28f299e225bb369d64722426de790215278f58a72', 'users', '2020-03-22 10:45:11', '2020-03-22 10:45:11');
INSERT INTO `oauth_access_token_providers` VALUES ('efe1995028e17dd1f0e59212a0f82c1e0c43d163ed17f47d2390a9faea9caaf7ba439ce902a649ee', 'admin', '2020-03-20 08:41:34', '2020-03-20 08:41:34');
INSERT INTO `oauth_access_token_providers` VALUES ('f04492273d2b0d53e80a6aa064cb5f5c643da92a231423e7c6edb332ba4250bf79460cb8726ba5b7', 'users', '2020-02-25 07:14:22', '2020-02-25 07:14:22');
INSERT INTO `oauth_access_token_providers` VALUES ('f14da1b85e6111f2c645781d6ba4ce40c2cdace40e4e03e4688fd38489b211fcae51a1869f261eb0', 'users', '2020-01-11 10:03:51', '2020-01-11 10:03:51');
INSERT INTO `oauth_access_token_providers` VALUES ('f40262e2c5cf73d0b73b672f344788be3fbbb2b64363ace285b443d3d1a995f16b342005b87e47a6', 'users', '2020-03-27 03:03:35', '2020-03-27 03:03:35');
INSERT INTO `oauth_access_token_providers` VALUES ('f46a15b38c14c8975876f9c1a7e913ddd79c35e99b536ba173f77d84aae38e2345b3816a5ab470f0', 'member', '2020-01-11 10:01:10', '2020-01-11 10:01:10');
INSERT INTO `oauth_access_token_providers` VALUES ('f4feb460067b6475dd841106088c668db928104b601b72f5cec967cf05eb83d6ef47f2e593549094', 'users', '2020-02-25 01:20:52', '2020-02-25 01:20:52');
INSERT INTO `oauth_access_token_providers` VALUES ('f51c36caabb5d023bd914789f0685b6accc853dd6c7df91b5565c151d820062f46042d2c65363108', 'admin', '2020-03-20 08:19:24', '2020-03-20 08:19:24');
INSERT INTO `oauth_access_token_providers` VALUES ('f61d8f3c5a4e7cf8f129cc5ec142d13e4c0567e093a0e206e50cebd80c8b500f833f030c777d7e3e', 'users', '2020-01-11 10:30:51', '2020-01-11 10:30:51');
INSERT INTO `oauth_access_token_providers` VALUES ('f830400a5e0aaf5cf50ec4be17f4697175555841c18f184e327f65237707805e2277bb4349b62b32', 'users', '2020-03-22 05:46:02', '2020-03-22 05:46:02');
INSERT INTO `oauth_access_token_providers` VALUES ('f883a44b0024fc336a40efa72e62ae3beb7760abb691344370fef5351e23c9c37f32c21e289e4219', 'admin', '2020-03-20 08:26:23', '2020-03-20 08:26:23');
INSERT INTO `oauth_access_token_providers` VALUES ('f8a7a005ee47a1bdbbdaaa5377bbaaff412ecb61eded421f904d5d03502088327abd5d9b6b8b929d', 'member', '2020-01-13 08:25:33', '2020-01-13 08:25:33');
INSERT INTO `oauth_access_token_providers` VALUES ('f9148384c93be08e15e9bdae39ba546b07cc9bac190c7e0829039c1c8c34fdc4232e6e7802271163', 'admin', '2020-03-20 08:46:35', '2020-03-20 08:46:35');
INSERT INTO `oauth_access_token_providers` VALUES ('f9a7688ad30f29efbc78b2a6d7a8350591f6c884bccf2412e7aad0ff43f5b336f4d0eeb55ae96086', 'users', '2020-02-24 09:36:18', '2020-02-24 09:36:18');
INSERT INTO `oauth_access_token_providers` VALUES ('fac71aee09435ba77bb86e86eaca6b10dc4270b4fe89e3b228f4b07abe751a2ec2269f555f3fc02a', 'users', '2020-02-24 11:34:51', '2020-02-24 11:34:51');
INSERT INTO `oauth_access_token_providers` VALUES ('fad604455051249b4c9914ede06fc9e850b9570da90fea2f238c70898b10f416639aee90226e00f3', 'users', '2020-02-24 09:31:07', '2020-02-24 09:31:07');
INSERT INTO `oauth_access_token_providers` VALUES ('fc1a85497a14f3124b0cf4efc323c614312970d88fac14fa0544e3f9027a2ab7d52276754b2044c0', 'users', '2020-02-25 02:48:39', '2020-02-25 02:48:39');
INSERT INTO `oauth_access_token_providers` VALUES ('fc3d0f69d57df59e5f891e58f6c634e4e3c89028270309d5608911472a402137eb5b168b66ec1075', 'users', '2020-02-25 07:14:27', '2020-02-25 07:14:27');
INSERT INTO `oauth_access_token_providers` VALUES ('fd79b049ea36718f0f1fb0e31fa632ff0d6c05d53fcdb940cbf51047cc2e0ee481d43bffc9aa3359', 'users', '2020-02-25 02:36:04', '2020-02-25 02:36:04');
INSERT INTO `oauth_access_token_providers` VALUES ('fe3f66e9515292d759d1159cf2c6833ce48f897491bcc552f2ccde1d5f25b667aa17786f8b0ab8ee', 'users', '2020-01-11 10:06:56', '2020-01-11 10:06:56');
INSERT INTO `oauth_access_token_providers` VALUES ('febe3f462a4403891e494e20ee5915885235f3113cbc484344805bfa35b0bf4ee8d6d72ae316b30e', 'users', '2020-02-24 13:33:56', '2020-02-24 13:33:56');
INSERT INTO `oauth_access_token_providers` VALUES ('ffd54653ced97ae9457c108b479324054134e5b1a422fecb504322f25c495aa8ffff64a9c618081b', 'users', '2020-02-24 13:35:57', '2020-02-24 13:35:57');
COMMIT;

-- ----------------------------
-- Table structure for oauth_access_tokens
-- ----------------------------
DROP TABLE IF EXISTS `oauth_access_tokens`;
CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `client_id` int(10) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_access_tokens_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of oauth_access_tokens
-- ----------------------------
BEGIN;
INSERT INTO `oauth_access_tokens` VALUES ('0220cb37694b7c339ded2d13aa9ac06eba49f46e08557e5563ab1edb8e651f60c15479062f4db3ab', 1, 14, NULL, '[]', 0, '2020-03-22 05:41:41', '2020-03-22 05:41:41', '2020-03-23 05:41:35');
INSERT INTO `oauth_access_tokens` VALUES ('031cfb6a0058af12cf1536113cb09b00dafe301ff591672f944f0efbd0947c1af9e5095f26d59bed', 1, 14, NULL, '[]', 0, '2020-03-22 07:09:16', '2020-03-22 07:09:16', '2020-03-23 07:04:45');
INSERT INTO `oauth_access_tokens` VALUES ('05c01d764f8ab512fc9c4c45fcbb669c4b2b887d9d3607cf7547ccf16da12d0c872fc33d7f03df86', 1, 14, NULL, '[]', 0, '2020-02-25 02:49:21', '2020-02-25 02:49:21', '2020-02-26 02:49:21');
INSERT INTO `oauth_access_tokens` VALUES ('06c477746ce65471f38e80bb45508534592d0242c6eed1e90dc8bb5ffa7ae40c19828c2bbddc8bf2', 1, 14, NULL, '[]', 0, '2020-02-25 03:07:45', '2020-02-25 03:07:45', '2020-02-26 03:07:45');
INSERT INTO `oauth_access_tokens` VALUES ('073df7032a75e000d8e318108a777071e9fbcc536c96b32a69145cee90f74b0a909962744b6894ff', 1, 14, NULL, '[]', 0, '2020-03-22 05:42:50', '2020-03-22 05:42:50', '2020-03-23 05:42:44');
INSERT INTO `oauth_access_tokens` VALUES ('07a7b1f1c663e8f5fcf24e616a28c14d3c3b83a766c3e48c1d226da690dddb9e008154b1d1ec762c', 1, 14, NULL, '[]', 0, '2020-02-24 13:10:39', '2020-02-24 13:10:39', '2020-02-25 13:10:39');
INSERT INTO `oauth_access_tokens` VALUES ('08ca6c43e50ee5350c5cb5feb6cafffd1e3bf3942e864c7db995009aa37fa1dc23fe96b0793b0a56', 1, 14, NULL, '[]', 0, '2020-01-11 09:42:12', '2020-01-11 09:42:12', '2020-01-12 09:42:12');
INSERT INTO `oauth_access_tokens` VALUES ('0907c98e8bffd096233684e37ddf6d9910a4d82a54217aff4e142b1d26a07488acaaa4f79ad97b53', 1, 14, NULL, '[]', 0, '2020-01-11 14:21:17', '2020-01-11 14:21:17', '2020-01-12 14:21:17');
INSERT INTO `oauth_access_tokens` VALUES ('096a337b117d1374dff0e5836c939d0827f9858545f02dfbb45fb0cbab609a4f11673f79640a0814', 22, 14, NULL, '[]', 0, '2020-02-29 03:28:20', '2020-02-29 03:28:20', '2020-03-01 03:28:20');
INSERT INTO `oauth_access_tokens` VALUES ('0a523043049a15f4beb9e9c7269ef563107e9b74be4592cb16bdb18920af862dbc88b9d231b60e17', 1, 14, NULL, '[]', 0, '2020-01-15 01:21:17', '2020-01-15 01:21:17', '2020-01-16 01:21:17');
INSERT INTO `oauth_access_tokens` VALUES ('0d2a0871c5bba9fa816467ebc4525dc3a1ae55a1a27f445a5faa7a7241c8deb6a19f9469c4069976', 1, 14, NULL, '[]', 0, '2020-02-25 06:24:32', '2020-02-25 06:24:32', '2020-02-26 06:24:32');
INSERT INTO `oauth_access_tokens` VALUES ('0e14519163c7358859be0c74c438e44012b1a866eb83fbb2e0d6b02575eda3357045f2afaab0cd3d', 1, 15, NULL, '[]', 0, '2020-02-24 03:06:40', '2020-02-24 03:06:40', '2020-02-25 03:06:40');
INSERT INTO `oauth_access_tokens` VALUES ('0f9e5b1c8f33b9ea8f095a89f54798086a1357d4e3774659dd355be84565584bea5c3af63c14cb0b', 1, 14, NULL, '[]', 0, '2020-02-24 13:35:15', '2020-02-24 13:35:15', '2020-02-25 13:35:15');
INSERT INTO `oauth_access_tokens` VALUES ('0fdc3582c23fa16723cdaf1fa0194a696ab9ed1247774879212a1a4d252f86cf9101bb322dfc008f', 1, 14, NULL, '[]', 0, '2020-01-11 09:57:47', '2020-01-11 09:57:47', '2020-01-12 09:57:47');
INSERT INTO `oauth_access_tokens` VALUES ('1223efd5ad4c8b97f90277e34a0a85ec7c88985eba1f2b0df448cdcdfb29f280a113c7e47f3ab8db', 1, 14, NULL, '[]', 0, '2020-02-24 11:03:43', '2020-02-24 11:03:43', '2020-02-25 11:03:43');
INSERT INTO `oauth_access_tokens` VALUES ('12a2d14bffd5aae929cdb992da6f554be74f138eb00649122a25292518787ff8f6e93c69b5c767c6', 1, 15, NULL, '[]', 0, '2020-01-18 07:19:21', '2020-01-18 07:19:21', '2020-01-19 07:19:21');
INSERT INTO `oauth_access_tokens` VALUES ('13d3358040771bb54576725053f13c921bea1ce4d7bb95fa3bc340c83d64018fea87aa49ab980278', 1, 15, NULL, '[]', 0, '2020-02-23 02:59:39', '2020-02-23 02:59:39', '2020-02-24 02:59:39');
INSERT INTO `oauth_access_tokens` VALUES ('16d9b3ef1ea9f18a2fb0d4a9f86efe6b39810dbdd5996f8f8bad85dd508ab90df661c24555eb4fd0', 1, 14, NULL, '[]', 0, '2020-02-25 04:41:32', '2020-02-25 04:41:32', '2020-02-26 04:41:32');
INSERT INTO `oauth_access_tokens` VALUES ('17cd3781be6432b8c30176bc49901a4ba2be3e9e6723c7891846cba83bebc1feded3e97f293df38e', 1, 14, NULL, '[]', 0, '2020-01-12 02:38:16', '2020-01-12 02:38:16', '2020-01-13 02:38:16');
INSERT INTO `oauth_access_tokens` VALUES ('18c9e53af191cde6cdf895026c018400827a29987caa3d69f7b556b04d2e7ab50313093834a00695', 1, 15, NULL, '[]', 0, '2020-03-11 22:44:13', '2020-03-11 22:44:13', '2020-03-12 12:24:03');
INSERT INTO `oauth_access_tokens` VALUES ('1920d7daa110f3066e10457016dd5a3c91946a3dc9a7027094701002f2f5f57cd2d2f4e6c848d2f3', 1, 14, NULL, '[]', 0, '2020-02-24 06:58:38', '2020-02-24 06:58:38', '2020-02-25 06:58:38');
INSERT INTO `oauth_access_tokens` VALUES ('19221d813b058f0c78142da93daa6d04dc5446fc91183abb2de9a25dbefcf72dd697f9ece526070a', 1, 14, NULL, '[]', 0, '2020-02-24 11:19:56', '2020-02-24 11:19:56', '2020-02-25 11:19:56');
INSERT INTO `oauth_access_tokens` VALUES ('1cb007ba70b87b815e4b293ef084856bdc634047877d0ac3ff73627bb912c97b4be52da83925d9a1', 1, 14, NULL, '[]', 0, '2020-03-27 03:04:11', '2020-03-27 03:04:11', '2020-03-28 03:03:24');
INSERT INTO `oauth_access_tokens` VALUES ('1cca9607d8c63f833292d4da21e176a2ffb3d383d600aa82380ef7feb1d4ce15ccc81fe7b634e0ee', 1, 14, NULL, '[]', 0, '2020-02-24 12:23:07', '2020-02-24 12:23:07', '2020-02-25 12:23:07');
INSERT INTO `oauth_access_tokens` VALUES ('1ddec0afc1e9a8e82e6114eb9b2f7a5e4153899178cbd1bd58e1a85fc6e932aeda67ebdc21ff3701', 1, 14, NULL, '[]', 0, '2020-03-27 03:03:43', '2020-03-27 03:03:43', '2020-03-28 03:02:56');
INSERT INTO `oauth_access_tokens` VALUES ('2019376e51e3adba543f0cc211b91dff82db18e160688715cbedf8d0e701343669def482dac18032', 1, 14, NULL, '[]', 0, '2020-03-22 12:42:17', '2020-03-22 12:42:17', '2020-03-23 12:40:50');
INSERT INTO `oauth_access_tokens` VALUES ('21029406932c7d39ae045b2414e5ee7ff9c9e60363c014778d10e610ff05941aca0424309d7bed72', 1, 15, NULL, '[]', 0, '2020-03-20 08:28:53', '2020-03-20 08:28:53', '2020-03-21 04:50:13');
INSERT INTO `oauth_access_tokens` VALUES ('21b12471f8e13fce652605618387487580dae6bb830805c2b39540e40a16445d017f0e10ddb4052d', 1, 14, NULL, '[]', 0, '2020-02-25 06:24:23', '2020-02-25 06:24:23', '2020-02-26 06:24:23');
INSERT INTO `oauth_access_tokens` VALUES ('228041e912554a7ed90c109cca203d7b34495bf330172bcf3e227565ec19c045ea592b6e5287bc0e', 1, 14, NULL, '[]', 0, '2020-03-22 05:41:51', '2020-03-22 05:41:51', '2020-03-23 05:41:45');
INSERT INTO `oauth_access_tokens` VALUES ('242df3aec507c9dd8a1b2b89ad02f6d78b0346c8811edcb6d5d29248685d08a4c8a7cc9bf9646f37', 1, 15, NULL, '[]', 0, '2020-03-20 08:29:16', '2020-03-20 08:29:16', '2020-03-21 04:50:35');
INSERT INTO `oauth_access_tokens` VALUES ('24404252a7fa3f9022873ba054c1f00b7593c5543b3ff87379341b716c2bcc5e7287472e0d01af2e', 1, 14, NULL, '[]', 0, '2020-04-14 08:21:41', '2020-04-14 08:21:41', '2020-04-15 08:21:41');
INSERT INTO `oauth_access_tokens` VALUES ('25f430125418fdd567e2f1060cbe70ae6b0b315c0c630ad495426c1275cf0ac47a5abe46f97e91b4', 1, 14, NULL, '[]', 0, '2020-02-24 06:25:10', '2020-02-24 06:25:10', '2020-02-25 06:25:10');
INSERT INTO `oauth_access_tokens` VALUES ('26f57888310d74d89cfd00e67f411aeacd7d9859b47c763f84c4b804b9b84b818646d6317a8063e7', 1, 15, NULL, '[]', 0, '2020-01-11 07:58:10', '2020-01-11 07:58:10', '2020-01-12 07:58:10');
INSERT INTO `oauth_access_tokens` VALUES ('2781d45d761a3b16420d3e1024a5c3abd065265a85e81e2a09ace5b4ce2e784ee76fe44eda37fa06', 1, 14, NULL, '[]', 0, '2020-02-24 09:10:53', '2020-02-24 09:10:53', '2020-02-25 09:10:53');
INSERT INTO `oauth_access_tokens` VALUES ('278a2d280c6b2c60dc9035cd9b55ee0d73adeddacd140ec61321b6de30dabf7615745bde73b2bfda', 1, 15, NULL, '[]', 0, '2020-01-11 05:15:52', '2020-01-11 05:15:52', '2020-01-12 05:15:52');
INSERT INTO `oauth_access_tokens` VALUES ('27c289ac68eaf305ade5be437146ef857a2836cf905cfccdc9e38a0a81bb49b29dcf34828c255bbc', 1, 14, NULL, '[]', 0, '2020-01-15 15:39:40', '2020-01-15 15:39:40', '2020-01-16 15:39:40');
INSERT INTO `oauth_access_tokens` VALUES ('284257d7ad873d30f23da8ac537c056a097361dfd0cfe19b8634d9ab64ed2042d8e080dcee310d9b', 1, 14, NULL, '[]', 0, '2020-01-11 10:00:23', '2020-01-11 10:00:23', '2020-01-12 10:00:23');
INSERT INTO `oauth_access_tokens` VALUES ('29699c35f034dc82d0f411d1eb5e2891ea860b07d69fde88dd40302cbcdbfdb68e0b948996888963', 1, 15, NULL, '[]', 0, '2020-01-27 07:41:19', '2020-01-27 07:41:19', '2020-01-28 07:41:19');
INSERT INTO `oauth_access_tokens` VALUES ('299cf2dddca09a5b5bb68c2b2c191f297a2b511d6a9551acb0161adda0e4cb0a5264972af8c05b15', 1, 14, NULL, '[]', 0, '2020-02-24 11:01:41', '2020-02-24 11:01:41', '2020-02-25 11:01:41');
INSERT INTO `oauth_access_tokens` VALUES ('2a4fcc181da774a921fac027d4229f26ee79b8da928e734f57b0900aab6d04417ef6dd0397e6debb', 1, 2, NULL, '[]', 0, '2020-01-11 07:49:38', '2020-01-11 07:49:38', '2020-01-12 07:49:38');
INSERT INTO `oauth_access_tokens` VALUES ('2b4298466a9836da3e71741b3ee7b61dc0a0cd4c97f08304d443439df4cf9178ece5ced527d22c2d', 1, 14, NULL, '[]', 0, '2020-02-24 13:09:37', '2020-02-24 13:09:37', '2020-02-25 13:09:37');
INSERT INTO `oauth_access_tokens` VALUES ('2bae3556ad52ccd0c6427b30a6cfc606494d1c430ad65cdac33a52d5311ab9eec7cfc31e15723ac9', 1, 14, NULL, '[]', 0, '2020-02-24 11:15:52', '2020-02-24 11:15:52', '2020-02-25 11:15:51');
INSERT INTO `oauth_access_tokens` VALUES ('2c0d2d36f3dd97da9f36a1406e4bb5ea4f329be461c27af3c0ea6f5a3d8f92971989fe5b56b67cfa', 1, 15, NULL, '[]', 0, '2020-02-24 11:13:18', '2020-02-24 11:13:18', '2020-02-25 11:13:18');
INSERT INTO `oauth_access_tokens` VALUES ('2c19c8ddd12e7bcf3d4bb80e968c0173866f1ce8f5a550488c6aba1e4dfdc36a280ac8e50789e696', 1, 14, NULL, '[]', 0, '2020-03-22 05:40:42', '2020-03-22 05:40:42', '2020-03-23 05:39:22');
INSERT INTO `oauth_access_tokens` VALUES ('2cbd5d91797d004637e90eaf1e8d570480eb9d8537b4df6f075b6afe2c1adaaec0527dacd2197c58', 1, 14, NULL, '[]', 0, '2020-03-22 07:03:00', '2020-03-22 07:03:00', '2020-03-23 07:01:34');
INSERT INTO `oauth_access_tokens` VALUES ('2cccaabccad73f0cdae0989b178c06e1ed6e016c6183d400e4ebb0e41320a3faf4eaf41126cdc08b', 1, 14, NULL, '[]', 0, '2020-02-24 11:18:41', '2020-02-24 11:18:41', '2020-02-25 11:18:41');
INSERT INTO `oauth_access_tokens` VALUES ('2cd3f07652693ee650041d7ffa62d4a2b8057d9fd945fc310ac93888a369cd4b9110a2a7dd77328e', 1, 14, NULL, '[]', 0, '2020-01-11 05:17:10', '2020-01-11 05:17:10', '2020-01-12 05:17:10');
INSERT INTO `oauth_access_tokens` VALUES ('2e57fceaa328dbb4c6f00ab77efdc47d1d4d43bda1db6f20945911f766c85e178b4bec52883ad308', 1, 15, NULL, '[]', 0, '2020-01-11 11:23:37', '2020-01-11 11:23:37', '2020-01-12 11:23:37');
INSERT INTO `oauth_access_tokens` VALUES ('2ed1c402818f81af6a5d376eb680cc0441a7cde8f79c6cf7cebe26d2e0c638b0297af5ff2345749a', 1, 14, NULL, '[]', 0, '2020-01-11 05:36:57', '2020-01-11 05:36:57', '2020-01-12 05:36:57');
INSERT INTO `oauth_access_tokens` VALUES ('30136028d468d6704fe81035c7dc5fa36d243395975dfeac830247638639bb74f3eb7ea7dbc7610f', 1, 15, NULL, '[]', 0, '2020-03-20 08:24:37', '2020-03-20 08:24:37', '2020-03-21 04:03:22');
INSERT INTO `oauth_access_tokens` VALUES ('302575183d5573b3d81fdc7a543dda3fdc817788de592f03d68ad80846d3a8d5d6ea4b1e341815d2', 1, 15, NULL, '[]', 0, '2020-01-11 05:21:21', '2020-01-11 05:21:21', '2020-01-12 05:21:21');
INSERT INTO `oauth_access_tokens` VALUES ('3193ee1f50a857fdefb65c88cacd55007ed42a6616992cafdfef3285763efd8df7116ce8c53891e4', 1, 15, NULL, '[]', 0, '2020-03-20 08:23:05', '2020-03-20 08:23:05', '2020-03-21 04:01:50');
INSERT INTO `oauth_access_tokens` VALUES ('3310018dbba4099351647204d59ac50e595d12294fa97b2d8252ba1969a0f73889cafeabb0326991', 1, 14, NULL, '[]', 0, '2020-03-22 10:46:08', '2020-03-22 10:46:08', '2020-03-23 10:44:41');
INSERT INTO `oauth_access_tokens` VALUES ('335f4a1dcc4f988ee23537ad5f44252a46d5b1c8dc1f849640e5ca9d360782005a57143e6ae14cb4', 1, 14, NULL, '[]', 0, '2020-02-25 07:22:26', '2020-02-25 07:22:26', '2020-02-26 07:22:26');
INSERT INTO `oauth_access_tokens` VALUES ('344c2a99ad07c096c83642e9a0002ff21d34bfe78791149f9011c8b7fd87043303ef4294a71fee08', 1, 14, NULL, '[]', 0, '2020-02-24 11:19:05', '2020-02-24 11:19:05', '2020-02-25 11:19:05');
INSERT INTO `oauth_access_tokens` VALUES ('354a6b3152fc37515bbf60f31f62a0bb646db57deac48816c9df9ac48afd55729acc7fc84bb15bdd', 1, 15, NULL, '[]', 0, '2020-02-25 06:10:28', '2020-02-25 06:10:28', '2020-02-26 06:10:28');
INSERT INTO `oauth_access_tokens` VALUES ('36c2d0dcd4e291d49932a89cc2d6abdb342f1d9c50195563682c4304d52f809d5522b4d87b7c4d5d', 1, 15, NULL, '[]', 0, '2020-01-27 07:30:26', '2020-01-27 07:30:26', '2020-01-28 07:30:26');
INSERT INTO `oauth_access_tokens` VALUES ('38335838f8e43f9bcd8acd519612cbe92b8287cd542cde6b6dfac305eaac40d6478ad14abc2f9447', 1, 15, NULL, '[]', 0, '2020-03-20 08:19:56', '2020-03-20 08:19:56', '2020-03-21 03:58:41');
INSERT INTO `oauth_access_tokens` VALUES ('39109150a9a4cb4915ec8d9f28ec98011698784bc8e2b22f26404fb4241df446cac6d10cb78fb4df', 2, 2, NULL, '[]', 0, '2020-01-14 09:05:31', '2020-01-14 09:05:31', '2020-01-15 09:05:31');
INSERT INTO `oauth_access_tokens` VALUES ('3987b1a6e1c9e68031026779b8ed54a0a5a3ac89bfd0713ce66682e90042d8ac11675a9b247bd332', 1, 14, NULL, '[]', 0, '2020-02-25 06:11:04', '2020-02-25 06:11:04', '2020-02-26 06:11:04');
INSERT INTO `oauth_access_tokens` VALUES ('3c619cad67b05f0f0be7366010a95f711e73e36fe7b358901c8acf41fa8eebcfaca0955aa90334f6', 1, 14, NULL, '[]', 0, '2020-03-15 00:46:48', '2020-03-15 00:46:48', '2020-03-16 00:46:36');
INSERT INTO `oauth_access_tokens` VALUES ('3d9d8f0b4578a3301ece3d56062eb98c19ff1a7d889719560abe49eea9d3bc3b574da3e83f0122ea', 1, 14, NULL, '[]', 0, '2020-02-24 00:35:40', '2020-02-24 00:35:40', '2020-02-25 00:35:40');
INSERT INTO `oauth_access_tokens` VALUES ('3e27b7ec1508b2071f7eb71ff71ee325e30c31221255b2a25712c8a3ee2eef7fcf268ce79fe75f61', 1, 14, NULL, '[]', 0, '2020-03-14 08:57:42', '2020-03-14 08:57:42', '2020-03-15 06:46:56');
INSERT INTO `oauth_access_tokens` VALUES ('3f13f45f5200a64061ab69d84aa4ab668ba76aeba705a40d55d9d69c0017a036a32146257da3e785', 1, 14, NULL, '[]', 0, '2020-02-25 04:41:43', '2020-02-25 04:41:43', '2020-02-26 04:41:43');
INSERT INTO `oauth_access_tokens` VALUES ('3fd0c0ebda540ab98ee2a14471e37e3e2fa5d97684bf814a2c7bf80f3a6d29fcad8263fffc593f86', 23, 14, NULL, '[]', 0, '2020-02-29 03:28:56', '2020-02-29 03:28:56', '2020-03-01 03:28:56');
INSERT INTO `oauth_access_tokens` VALUES ('4056ad1c07a23565959dda653c146b2a9b76b7e8d6fae4275906a65e5536a688b62d2f8f8a00bb5f', 2, 2, NULL, '[]', 0, '2020-01-13 09:39:09', '2020-01-13 09:39:09', '2020-01-14 09:39:08');
INSERT INTO `oauth_access_tokens` VALUES ('40d5fe4d99dc174e57fe594bfbb95f61d2d5f12b4be837d56bfca892b1fa50ffdc1ee55d253ae8d0', 1, 15, NULL, '[]', 0, '2020-03-24 04:38:10', '2020-03-24 04:38:10', '2020-03-25 04:38:04');
INSERT INTO `oauth_access_tokens` VALUES ('41b8cac82faa4438a5add18a699173740072376de53c79cf25b32e1e32ea3fa4cd860733ebbc92d3', 1, 14, NULL, '[]', 0, '2020-02-25 02:30:05', '2020-02-25 02:30:05', '2020-02-26 02:30:05');
INSERT INTO `oauth_access_tokens` VALUES ('43569de8ed2c6d63ca03c366184e5b549b40d02def3a4d250b5eb348fe94779eebdec8997d05a52c', 1, 2, NULL, '[]', 0, '2020-01-11 05:40:55', '2020-01-11 05:40:55', '2020-01-12 05:40:55');
INSERT INTO `oauth_access_tokens` VALUES ('44d195dc6a27376e3b0a16f3b9ae5fe74517f5c7baa39d134f248c54022b323b5c76acf7d10f1990', 1, 14, NULL, '[]', 0, '2020-02-24 02:00:26', '2020-02-24 02:00:26', '2020-02-25 02:00:26');
INSERT INTO `oauth_access_tokens` VALUES ('458359b34a126ed4a23b5b1fdc9204b7fbfb5e9d9a5626dab7583841f8de66769ae5da3fcd83f93a', 1, 14, NULL, '[]', 0, '2020-04-14 10:42:24', '2020-04-14 10:42:24', '2020-04-15 10:42:24');
INSERT INTO `oauth_access_tokens` VALUES ('46b1618026339a48b0dc24e7ebd0c34f23e9113fc0ec83b114f1ff657a435c2505a8f41216354723', 1, 15, NULL, '[]', 0, '2020-03-20 08:29:29', '2020-03-20 08:29:29', '2020-03-21 04:50:49');
INSERT INTO `oauth_access_tokens` VALUES ('4749ae6b2c82a3cc54d50e890fbecc11c32b220a0943abdaac6420db9431a457f6fa18ff22a26c2e', 1, 14, NULL, '[]', 0, '2020-01-12 23:37:51', '2020-01-12 23:37:51', '2020-01-13 23:37:51');
INSERT INTO `oauth_access_tokens` VALUES ('48cec6db0ac949a30f4b173c6585d78f2df844a0b756006847385f447ef341bd06590e37c97756f3', 1, 14, NULL, '[]', 0, '2020-03-22 05:39:21', '2020-03-22 05:39:21', '2020-03-23 05:39:12');
INSERT INTO `oauth_access_tokens` VALUES ('49252973d922b71a77078ccb4da6ab28934262a4d17f9dd7664b53ebda33fb75cd637ec8bccaaa81', 1, 14, NULL, '[]', 0, '2020-02-24 09:32:22', '2020-02-24 09:32:22', '2020-02-25 09:32:22');
INSERT INTO `oauth_access_tokens` VALUES ('4a6fd9101d4b20641c6e4ad7f6beb7eb09ac836cc1f696dbab973a34e264174bd46b3a46b3defd72', 1, 14, NULL, '[]', 0, '2020-03-11 12:24:22', '2020-03-11 12:24:22', '2020-03-12 12:24:14');
INSERT INTO `oauth_access_tokens` VALUES ('4b420bbb16d36fb7447f798af169ab011cdc28cad71cf7148b716ecf6012532fcfa69bd265f4a402', 1, 14, NULL, '[]', 0, '2020-02-25 03:02:42', '2020-02-25 03:02:42', '2020-02-26 03:02:42');
INSERT INTO `oauth_access_tokens` VALUES ('4cabaeaa3b55685e663d96f719d1f7a8edf4393ed8bcddac6cfa392e21913de2c307c2dd6ce424e1', 1, 14, NULL, '[]', 0, '2020-02-25 07:23:21', '2020-02-25 07:23:21', '2020-02-26 07:23:21');
INSERT INTO `oauth_access_tokens` VALUES ('4ddbe74fd497160d964f94e61ed23a65ac7d91e7a102a3dfbfec420cfd32e5a70fea48807dd0d594', 1, 15, NULL, '[]', 0, '2020-03-20 07:20:55', '2020-03-20 07:20:55', '2020-03-21 03:59:03');
INSERT INTO `oauth_access_tokens` VALUES ('504cf33e80662ebcaeff095b0f79a2a49b9657ddb866ab5da5945d7affaeffd461f2fec749b0a7cf', 1, 15, NULL, '[]', 0, '2020-03-20 08:37:25', '2020-03-20 08:37:25', '2020-03-21 05:12:51');
INSERT INTO `oauth_access_tokens` VALUES ('505bf96074f7bcde7565d2a3d38deb7ec7dd8bd0ce39d709a77c6988a08ebfc0a9ea897d44cc954d', 1, 14, NULL, '[]', 0, '2020-01-11 10:08:09', '2020-01-11 10:08:09', '2020-01-12 10:08:09');
INSERT INTO `oauth_access_tokens` VALUES ('50a5b67a2629a55e8e9a680efe75c9b1e6b88e6fff2f5e93adc1a80e56331c93d2edb157259a27be', 1, 14, NULL, '[]', 0, '2020-02-24 09:16:17', '2020-02-24 09:16:17', '2020-02-25 09:16:17');
INSERT INTO `oauth_access_tokens` VALUES ('50c74a5914b607c35a2cd90d58ffbd2dc167d48f00886791198491fb24c6f9f2f88a522b61afccb3', 1, 15, NULL, '[]', 0, '2020-03-20 08:48:55', '2020-03-20 08:48:55', '2020-03-21 05:24:21');
INSERT INTO `oauth_access_tokens` VALUES ('5130ac926603853116facfb7ea29ddf478766e138b2c40ceea0567d98e735402e9a56d518dfcc649', 1, 14, NULL, '[]', 0, '2020-02-25 02:58:52', '2020-02-25 02:58:52', '2020-02-26 02:58:52');
INSERT INTO `oauth_access_tokens` VALUES ('5155330cc4b33312a04c47938d5a3fc30051cfb5f970da320596aeea0b93711d2a8c269157504186', 1, 15, NULL, '[]', 0, '2020-03-20 08:36:14', '2020-03-20 08:36:14', '2020-03-21 03:53:13');
INSERT INTO `oauth_access_tokens` VALUES ('51d4cc181b25e212822ae7555b5ade6e1734d36894a01e1ce70c03b41808b2f70b554c4d85e80d58', 1, 15, NULL, '[]', 0, '2020-03-20 07:32:04', '2020-03-20 07:32:04', '2020-03-21 03:53:23');
INSERT INTO `oauth_access_tokens` VALUES ('51fdf369970f7659c4fa648dcffb2f819d98d2913b3039a20f1cf349d673fed73363af7b9fb9c068', 1, 14, NULL, '[]', 0, '2020-03-22 05:41:03', '2020-03-22 05:41:03', '2020-03-23 04:45:51');
INSERT INTO `oauth_access_tokens` VALUES ('5441634d0b85bf8df0c9c86740715a3f7eb097565618844cc21092be8d6a78dedbb4a3da5f6fde08', 1, 14, NULL, '[]', 0, '2020-02-25 02:06:18', '2020-02-25 02:06:18', '2020-02-26 02:06:18');
INSERT INTO `oauth_access_tokens` VALUES ('572dcf4478be272fe4f750341ca632ecc1c26fed0ac5482e50ef4c7bee1b9bd9b3a2383fc009edd9', 1, 14, NULL, '[]', 0, '2020-02-25 02:47:19', '2020-02-25 02:47:19', '2020-02-26 02:47:19');
INSERT INTO `oauth_access_tokens` VALUES ('5781ab8f0e6289adeee77917636c3b22899b7177d23d63c0003f22a9f78fdace1512ebaf34feb7ae', 1, 14, NULL, '[]', 0, '2020-02-25 04:02:07', '2020-02-25 04:02:07', '2020-02-26 04:02:07');
INSERT INTO `oauth_access_tokens` VALUES ('59589c16da7c0a1154af0ef435d98d70c7a710d77dcd55c7a391124f9df31f33653d5220fb07cc19', 1, 14, NULL, '[]', 0, '2020-01-11 09:54:15', '2020-01-11 09:54:15', '2020-01-12 09:54:15');
INSERT INTO `oauth_access_tokens` VALUES ('59df9938d50ff8e5a71be984d2f7cbfbc26cd24760d6e4da534d101f92f795002772f03c449cee31', 1, 14, NULL, '[]', 0, '2020-01-11 12:16:41', '2020-01-11 12:16:41', '2020-01-12 12:16:41');
INSERT INTO `oauth_access_tokens` VALUES ('5b4cb2d64b5eb95230390662fd37ffffae53553c97492fb48d76a1c73306c76083bccb5df5d52836', 1, 15, NULL, '[]', 0, '2020-03-11 22:45:07', '2020-03-11 22:45:07', '2020-03-12 22:44:29');
INSERT INTO `oauth_access_tokens` VALUES ('5b9c566adf859dc8d9e574ed19a10b2408ce8f78af2a4b65d024735ea124bc4b09e6b8ce3e309616', 1, 14, NULL, '[]', 0, '2020-02-25 01:58:49', '2020-02-25 01:58:49', '2020-02-26 01:58:49');
INSERT INTO `oauth_access_tokens` VALUES ('5c849d782400edb5b983d44755ed6434b016aae29992aaf3115321b06b74656df9586a97bc320d44', 1, 14, NULL, '[]', 0, '2020-01-11 05:42:50', '2020-01-11 05:42:50', '2020-01-12 05:42:50');
INSERT INTO `oauth_access_tokens` VALUES ('5dab7c96f2eb12c7b17ec325befa55d8210408cb40a6ec24f96f065869d07a11105222bffdccae55', 1, 14, NULL, '[]', 0, '2020-02-24 06:55:44', '2020-02-24 06:55:44', '2020-02-25 06:55:44');
INSERT INTO `oauth_access_tokens` VALUES ('5dcf3d92ec0881b097dd17d03acaeaac6f3ba69e7b3845f70e4cd126efcc96ce0dcc53cf30943d57', 2, 2, NULL, '[]', 0, '2020-02-24 00:07:45', '2020-02-24 00:07:45', '2020-02-25 00:07:45');
INSERT INTO `oauth_access_tokens` VALUES ('5e8ae9ba16593c72444fe3c3ec55951c982f296a59409c04df9ceff787a583e1d71749bdae303f0e', 2, 2, NULL, '[]', 0, '2020-01-11 10:01:16', '2020-01-11 10:01:16', '2020-01-12 10:01:16');
INSERT INTO `oauth_access_tokens` VALUES ('5ff20be6ea04932080841d2de08cbfe6ce6c1373ad35c4423c24219b8889b85ddd2d466e9d00cab7', 1, 14, NULL, '[]', 0, '2020-01-11 10:13:46', '2020-01-11 10:13:46', '2020-01-12 10:13:46');
INSERT INTO `oauth_access_tokens` VALUES ('607846a4bd48c34056e5192212877fe2b70ed4f24e7b9c947588d5812bb4bc5f8240b139e973ae0a', 1, 14, NULL, '[]', 0, '2020-02-24 11:21:32', '2020-02-24 11:21:32', '2020-02-25 11:21:32');
INSERT INTO `oauth_access_tokens` VALUES ('62b1b5e0a76d43d404f9d3e9086a583c309dca887cb319a593700be6e3eb2ca9ecc00faaf8e837b0', 1, 14, NULL, '[]', 0, '2020-02-25 02:29:15', '2020-02-25 02:29:15', '2020-02-26 02:29:15');
INSERT INTO `oauth_access_tokens` VALUES ('63115c0c2d9041556e12329e51fbe164c8c804fcbaa1fadf6efdc376a0f72c9b6c54091de7628c38', 1, 14, NULL, '[]', 0, '2020-01-11 10:11:38', '2020-01-11 10:11:38', '2020-01-12 10:11:38');
INSERT INTO `oauth_access_tokens` VALUES ('651836d9bb1b7db7ea13e441aa808d4cb94966b87829178e4789c592052d85755bc22493489c9823', 1, 14, NULL, '[]', 0, '2020-03-22 05:39:13', '2020-03-22 05:39:13', '2020-03-23 05:39:05');
INSERT INTO `oauth_access_tokens` VALUES ('652c0f57071b71c42cfea8bfe2c006cc7c0eeb1991b52b102322991a90f9a6e2f339da179ffb2f69', 1, 14, NULL, '[]', 0, '2020-02-25 02:40:28', '2020-02-25 02:40:28', '2020-02-26 02:40:28');
INSERT INTO `oauth_access_tokens` VALUES ('655c17f8fbbc9d5e005fbcf9a86072a521eeedac2c6ad73f4dec0f8c91e3900a162bdcedb1247a31', 1, 14, NULL, '[]', 0, '2020-01-11 07:59:13', '2020-01-11 07:59:13', '2020-01-12 07:59:13');
INSERT INTO `oauth_access_tokens` VALUES ('65b5fc72f39c6a4f1e11c36d616e007b323419da14ca0cc7e35ba532acc15cb222464b956295ec09', 1, 15, NULL, '[]', 0, '2020-03-21 08:50:13', '2020-03-21 08:50:13', '2020-03-22 08:15:13');
INSERT INTO `oauth_access_tokens` VALUES ('66d0bd9f73e16d32a85dd2d5ad1a87bc0fc85f227deec47caf69b4e690a049a9ba51e98575e333d6', 1, 15, NULL, '[]', 0, '2020-03-20 12:54:08', '2020-03-20 12:54:08', '2020-03-21 12:53:36');
INSERT INTO `oauth_access_tokens` VALUES ('67451ddafa61141b763e8047d9aff07a6de011fb1773f09520e24f1ded43f3e16726098b8b444cb2', 1, 14, NULL, '[]', 0, '2020-02-25 02:51:25', '2020-02-25 02:51:25', '2020-02-26 02:51:25');
INSERT INTO `oauth_access_tokens` VALUES ('67cfd6d576aa730d44ca6710cab14e62722991a977d872f779b0840ea4598f5bd1dada24dfdc236c', 1, 15, NULL, '[]', 0, '2020-03-20 08:29:10', '2020-03-20 08:29:10', '2020-03-21 04:50:30');
INSERT INTO `oauth_access_tokens` VALUES ('680565d69bd7267839ddd7c6018593d5d38e72bd13a73847d1068f93f8f4cddcac325ed0d544158f', 1, 14, NULL, '[]', 0, '2020-02-25 00:43:50', '2020-02-25 00:43:50', '2020-02-26 00:43:50');
INSERT INTO `oauth_access_tokens` VALUES ('68cc6d18152c35bc4960c6c93319dfc2501638c598bbbf1cfca35e9a4e4e603cbb8eece9e821de26', 1, 14, NULL, '[]', 0, '2020-02-24 12:14:33', '2020-02-24 12:14:33', '2020-02-25 12:14:33');
INSERT INTO `oauth_access_tokens` VALUES ('68cced90df2b2822f54736821acf7f62e47f8f01341170974c4f314a917551805ebef42f23a654b2', 1, 14, NULL, '[]', 0, '2020-02-24 09:30:59', '2020-02-24 09:30:59', '2020-02-25 09:30:59');
INSERT INTO `oauth_access_tokens` VALUES ('696493eb4cda2930d3e6982c4a6d18b982309b0e54f784d78441a16e147ca76cd683392f24e48597', 1, 14, NULL, '[]', 0, '2020-02-24 13:08:32', '2020-02-24 13:08:32', '2020-02-25 13:08:32');
INSERT INTO `oauth_access_tokens` VALUES ('69f6a944e130995c949f75ab3f64e07d1f17accc0f7bedb7f048f871b713119c0a96f6259ef26cc7', 1, 14, NULL, '[]', 0, '2020-02-24 09:37:15', '2020-02-24 09:37:15', '2020-02-25 09:37:15');
INSERT INTO `oauth_access_tokens` VALUES ('6fe1a8964b0f423abd394c6bb718a4b52543c8c70ad5ce93f9d0ca106296fa04b53c5c20d144e90b', 1, 14, NULL, '[]', 0, '2020-03-22 05:41:38', '2020-03-22 05:41:38', '2020-03-23 05:41:32');
INSERT INTO `oauth_access_tokens` VALUES ('700ce484938321c119b782fcdfefa8a557bbb30cd7efbc8b5204f542eafb96958671c6de9a8b7eef', 1, 15, NULL, '[]', 0, '2020-01-19 14:45:33', '2020-01-19 14:45:33', '2020-01-20 14:45:33');
INSERT INTO `oauth_access_tokens` VALUES ('71009c7a88e2c5a01296d16748a9173226577c7ce0e379c451a78a677fefefe4de0245816ce36164', 1, 14, NULL, '[]', 0, '2020-02-25 02:47:25', '2020-02-25 02:47:25', '2020-02-26 02:47:25');
INSERT INTO `oauth_access_tokens` VALUES ('71d452045fc24c4a127532de102eaa0f025273f78367be90530b4bf2e6f9ccdcdeedae19ca0e53cb', 1, 14, NULL, '[]', 0, '2020-02-25 03:03:40', '2020-02-25 03:03:40', '2020-02-26 03:03:40');
INSERT INTO `oauth_access_tokens` VALUES ('72727a6d6a5f3c9d66349bbd1d1815990836734bc60792b5fea194fde2cfa655fde9bf6db8c3f94a', 1, 14, NULL, '[]', 0, '2020-02-29 03:18:42', '2020-02-29 03:18:42', '2020-03-01 03:18:42');
INSERT INTO `oauth_access_tokens` VALUES ('73199e77ca38956c21ae9f6aac8f40d75476f531f1e390f285cd1e4458624a6ca9ca012a1a0b6bc8', 1, 14, NULL, '[]', 0, '2020-03-22 05:40:50', '2020-03-22 05:40:50', '2020-03-23 05:39:30');
INSERT INTO `oauth_access_tokens` VALUES ('7576e30a0995f24340f59204f5ac60bdc47f10b11ba6b304ed5eb442c9761d747e6376d69074d28c', 1, 14, NULL, '[]', 0, '2020-02-25 03:00:43', '2020-02-25 03:00:43', '2020-02-26 03:00:43');
INSERT INTO `oauth_access_tokens` VALUES ('768ac003fe6aebcfe766aa20c96bc9021f6dd843cb70de76d4405661478883f8475f3564db72dcae', 1, 14, NULL, '[]', 0, '2020-02-24 11:01:19', '2020-02-24 11:01:19', '2020-02-25 11:01:19');
INSERT INTO `oauth_access_tokens` VALUES ('7707ab9f6f6dbb9d8862053cd0597b3520b108206013360d4f53f7071dba4e6b9f669d8c3d41ae28', 1, 14, NULL, '[]', 0, '2020-02-24 08:00:00', '2020-02-24 08:00:00', '2020-02-25 08:00:00');
INSERT INTO `oauth_access_tokens` VALUES ('77c0e16401e2dc4ad619801632e1cb4816d3b50586b538a142967a105105c748f8d0cf210fca74f1', 1, 14, NULL, '[]', 0, '2020-02-24 09:35:35', '2020-02-24 09:35:35', '2020-02-25 09:35:35');
INSERT INTO `oauth_access_tokens` VALUES ('78a2e5205f713a95c4ddb36c18968b5efadabef194e8b936c4fe28223f3b97ff2ea8473236dfe614', 24, 14, NULL, '[]', 0, '2020-02-29 03:33:34', '2020-02-29 03:33:34', '2020-03-01 03:33:34');
INSERT INTO `oauth_access_tokens` VALUES ('7a100ee0980eacdefbfec76dbed71deb9208b50827ad166cf8a2a05ef2821b2f3818394f99026d5e', 1, 14, NULL, '[]', 0, '2020-02-24 11:20:46', '2020-02-24 11:20:46', '2020-02-25 11:20:46');
INSERT INTO `oauth_access_tokens` VALUES ('7ad82473311df6862895ef291fc67e723718126cc530c3c95df78df334e1a6eaf46fce552cd9276e', 2, 2, NULL, '[]', 0, '2020-01-11 09:26:17', '2020-01-11 09:26:17', '2020-01-12 09:26:17');
INSERT INTO `oauth_access_tokens` VALUES ('7b09ec6c258acfc00e7fd9c82854efa1eeed43a6c36f9400255076d29484a069c127a8c5265d6079', 1, 14, NULL, '[]', 0, '2020-02-24 02:04:10', '2020-02-24 02:04:10', '2020-02-25 02:04:10');
INSERT INTO `oauth_access_tokens` VALUES ('7b1ca927ef649068eacb2bc47f4d6e9e28679c983a36390b53f5d461ef088486c7673792e14fa6fe', 1, 14, NULL, '[]', 0, '2020-02-25 02:31:47', '2020-02-25 02:31:47', '2020-02-26 02:31:47');
INSERT INTO `oauth_access_tokens` VALUES ('7c9681d94dfec59b1943a10439bd051931ce176c9ef8623cb60c2a7f59dc4616320c284bb912386f', 1, 15, NULL, '[]', 0, '2020-03-20 08:28:15', '2020-03-20 08:28:15', '2020-03-21 04:49:34');
INSERT INTO `oauth_access_tokens` VALUES ('7e9acb19f2e1fda5b2b9f84ba1d277ae7821d68c1f88f468f989b78eb5f0a20e2c3be1ac1378798b', 1, 15, NULL, '[]', 0, '2020-03-20 07:17:46', '2020-03-20 07:17:46', '2020-03-21 03:53:13');
INSERT INTO `oauth_access_tokens` VALUES ('8086933cdbf07b016ed9520598f868328193e654d64161adc751a75171e3da591d127434bdc69b1e', 1, 14, NULL, '[]', 0, '2020-02-24 12:14:25', '2020-02-24 12:14:25', '2020-02-25 12:14:25');
INSERT INTO `oauth_access_tokens` VALUES ('80e3013b49589933b48fcea6be6685ed8bb403301c461bbc7e37d9150e7c4485fb5712eb4bc59e44', 2, 2, NULL, '[]', 0, '2020-01-13 08:11:22', '2020-01-13 08:11:22', '2020-01-14 08:11:22');
INSERT INTO `oauth_access_tokens` VALUES ('812a7c2843bb0f316a3f9f47174c11d8d31789af008237ead251d5050bfd752d32a1532c66bc5e1d', 1, 14, NULL, '[]', 0, '2020-01-11 05:13:52', '2020-01-11 05:13:52', '2020-01-12 05:13:52');
INSERT INTO `oauth_access_tokens` VALUES ('819692de50ac2a6d0d6a51c0791783a873487300b5f4fbd137ac91abd351b8d4e5568b2327a05c41', 1, 14, NULL, '[]', 0, '2020-02-25 02:08:35', '2020-02-25 02:08:35', '2020-02-26 02:08:35');
INSERT INTO `oauth_access_tokens` VALUES ('823cc10b9c4c1200888724eeeced336c09629f024361545d7696b4c9b3df39e8fca10bfc82a48d52', 1, 15, NULL, '[]', 0, '2020-03-20 08:38:42', '2020-03-20 08:38:42', '2020-03-21 04:17:27');
INSERT INTO `oauth_access_tokens` VALUES ('8338cc8cb4043bce5212f44d0be0310ecd2e559bdc4aeac944ec02bbb60e8dbb9dd915b471602e3e', 1, 14, NULL, '[]', 0, '2020-03-15 00:59:38', '2020-03-15 00:59:38', '2020-03-16 00:59:26');
INSERT INTO `oauth_access_tokens` VALUES ('83c1db6c8e5be48951d65562faccffb069c5a95dbb0928c84ef728a2e046fb7b7b6e30543ff637e1', 1, 14, NULL, '[]', 0, '2020-02-24 11:15:29', '2020-02-24 11:15:29', '2020-02-25 11:15:29');
INSERT INTO `oauth_access_tokens` VALUES ('842dab36cc5c2646f57dacf2402d10155a4cbf632f425c35bd9ecf1e36c9003f2d3fe4d30366684b', 1, 15, NULL, '[]', 0, '2020-03-20 08:47:02', '2020-03-20 08:47:02', '2020-03-21 05:25:10');
INSERT INTO `oauth_access_tokens` VALUES ('8573c8f53e58ae88851bfe88c321fcc2aede1e86a2e3c2d2b8ea0bde086384289a4cc6ca02d505c6', 1, 15, NULL, '[]', 0, '2020-03-20 08:46:49', '2020-03-20 08:46:49', '2020-03-21 05:24:58');
INSERT INTO `oauth_access_tokens` VALUES ('86785ed54f97ebf8277da71a3c728eafc85866f6b37415f3409a5940d52a4b9ef51d1a0f7c55ec80', 1, 15, NULL, '[]', 0, '2020-01-11 07:58:23', '2020-01-11 07:58:23', '2020-01-12 07:58:23');
INSERT INTO `oauth_access_tokens` VALUES ('878f3cb6cee12dc21dc442aebb214fbeab85b978b425e21d1d27a09b818d79a3f06b246558f15211', 1, 14, NULL, '[]', 0, '2020-04-14 08:28:48', '2020-04-14 08:28:48', '2020-04-15 08:28:48');
INSERT INTO `oauth_access_tokens` VALUES ('892eeec8a99994a5f0092005c3fca4ff0c4bdc987a3db2a6ccd2c89a5c6111c10c3a65b8b69a5f17', 1, 15, NULL, '[]', 0, '2020-03-20 08:28:49', '2020-03-20 08:28:49', '2020-03-21 04:50:08');
INSERT INTO `oauth_access_tokens` VALUES ('8bef60330bc3626486acdc1a6b3f45ea91f7e315d65b2099f8f484e674d57a8f330711b4b620cdf3', 1, 14, NULL, '[]', 0, '2020-02-24 13:28:59', '2020-02-24 13:28:59', '2020-02-25 13:28:59');
INSERT INTO `oauth_access_tokens` VALUES ('8d1a96ff0068ecf16950ad33ce06bd5d723a4945c8fff0fa6f4e6a6d5eb7fa4a0f4209f5ba98b1a9', 1, 15, NULL, '[]', 0, '2020-03-20 07:31:54', '2020-03-20 07:31:54', '2020-03-21 03:53:13');
INSERT INTO `oauth_access_tokens` VALUES ('8eb70486a53cafd1f86e57f3cc49024b6ac6e6c12a5f1b9b6e4aa139df3a7ad588eb0bcac31a21e0', 1, 14, NULL, '[]', 0, '2020-01-11 05:24:50', '2020-01-11 05:24:50', '2020-01-12 05:24:50');
INSERT INTO `oauth_access_tokens` VALUES ('8f90a387ad76a59be9777edd0401aa5b57ce9c0d436d2e2fbf8077ba1a2e76d0c4108ddeb0ef559e', 1, 15, NULL, '[]', 0, '2020-03-20 08:04:19', '2020-03-20 08:04:19', '2020-03-21 04:25:38');
INSERT INTO `oauth_access_tokens` VALUES ('902ab026ce56efcec1a4e7020dc0a05ca8c2ca2eda2ac09289821ba0a90a1f2d26c993643c8d0c20', 1, 15, NULL, '[]', 0, '2020-03-20 08:37:12', '2020-03-20 08:37:12', '2020-03-21 04:15:57');
INSERT INTO `oauth_access_tokens` VALUES ('91bc08c1cf7bae09fb3d1b29d6999cd4a370a8c228ff0edf43ccbcf76d9a861a4da8792386403f11', 1, 14, NULL, '[]', 0, '2020-04-14 08:26:57', '2020-04-14 08:26:57', '2020-04-15 08:26:57');
INSERT INTO `oauth_access_tokens` VALUES ('91fba6ca938d6152a1945f7092fbd7167210f5c5fa37077870c242d4430e7de2afb581a43190da74', 1, 14, NULL, '[]', 0, '2020-02-25 02:07:48', '2020-02-25 02:07:48', '2020-02-26 02:07:48');
INSERT INTO `oauth_access_tokens` VALUES ('92c5b8e9b9b80ec499262f298b49a02f4504120faab85f9750a6e97403fed4d0f27b8cb9326dfc59', 1, 14, NULL, '[]', 0, '2020-01-11 09:59:41', '2020-01-11 09:59:41', '2020-01-12 09:59:41');
INSERT INTO `oauth_access_tokens` VALUES ('92d632a00c4dca014f2b398d4dcc9e75591bd68be54e584e6cf4cb7b6a0d9afa357538c570027d4f', 2, 2, NULL, '[]', 0, '2020-01-11 07:58:46', '2020-01-11 07:58:46', '2020-01-12 07:58:46');
INSERT INTO `oauth_access_tokens` VALUES ('92fbfb60c53194723cf9576ed150f41296ed73f6d7dd7585d2efdbbf9f7bee75f3faea436b595984', 1, 14, NULL, '[]', 0, '2020-01-15 08:17:38', '2020-01-15 08:17:38', '2020-01-16 08:17:37');
INSERT INTO `oauth_access_tokens` VALUES ('93aa434893797ff77697c4a083ae433059de507410e08e16446dcd24b40d2c667df474970406c9c0', 1, 14, NULL, '[]', 0, '2020-03-14 06:47:01', '2020-03-14 06:47:01', '2020-03-15 06:46:53');
INSERT INTO `oauth_access_tokens` VALUES ('93d25c6e696298f99841545dc157b19699a9815604accb90b5c65ee5ed312a9a41b4315070214dc7', 1, 15, NULL, '[]', 0, '2020-03-20 08:18:26', '2020-03-20 08:18:26', '2020-03-21 04:39:45');
INSERT INTO `oauth_access_tokens` VALUES ('94aa1a28d7db56de37e705f04ccfd025e97557e2a29f08c46424b635f7735f9fefb2f1f0504c5351', 1, 14, NULL, '[]', 0, '2020-02-24 12:18:12', '2020-02-24 12:18:12', '2020-02-25 12:18:12');
INSERT INTO `oauth_access_tokens` VALUES ('969f74b5e3e36bb95423fc44d6c71f9329c3ccd954f3f0de8c5299cfe07b9762f90f1de82c2aee56', 1, 14, NULL, '[]', 0, '2020-03-22 12:38:41', '2020-03-22 12:38:41', '2020-03-23 12:37:14');
INSERT INTO `oauth_access_tokens` VALUES ('97114a6118cf9f79db6d4c2af3e37c6d9558d3fd2f227cb8cfc6d2817404be89c252a0dc7b4c4a6f', 1, 14, NULL, '[]', 0, '2020-01-11 10:30:45', '2020-01-11 10:30:45', '2020-01-12 10:30:45');
INSERT INTO `oauth_access_tokens` VALUES ('97b61fac85750fd392a3f7d0bb577c07bc9c7963ceb2b82acd7de77380d423ecc00196b44da704a3', 1, 14, NULL, '[]', 0, '2020-02-24 11:49:49', '2020-02-24 11:49:49', '2020-02-25 11:49:49');
INSERT INTO `oauth_access_tokens` VALUES ('984be18331e7f9c06d2f1d510f58262a495c1e4940d9c5e35c09c95ab0313bbd80ed0b0d96549ce2', 1, 14, NULL, '[]', 0, '2020-02-24 13:31:35', '2020-02-24 13:31:35', '2020-02-25 13:31:35');
INSERT INTO `oauth_access_tokens` VALUES ('98f131ef468a991a556ec0527e277f425ea9524801864550aec3cc1907fc4be2173582733ec6198f', 1, 14, NULL, '[]', 0, '2020-02-24 00:10:59', '2020-02-24 00:10:59', '2020-02-25 00:10:59');
INSERT INTO `oauth_access_tokens` VALUES ('99ad09409f03064bcab8645e2720592262d5112eea5ebf78b75de0984df7297806a582258c459fcb', 2, 2, NULL, '[]', 0, '2020-01-11 08:15:17', '2020-01-11 08:15:17', '2020-01-12 08:15:17');
INSERT INTO `oauth_access_tokens` VALUES ('9ab35721fabf428cad02ac4eda56dd89848e10575974372f29c19f4775db8aedaf0b03dd47d7d534', 1, 14, NULL, '[]', 0, '2020-02-25 02:07:05', '2020-02-25 02:07:05', '2020-02-26 02:07:05');
INSERT INTO `oauth_access_tokens` VALUES ('9b4391048064d7f0bec5272687dcdf77158ced9c574f17efd60f8d2b68474cb052cf6defd6b920f0', 1, 14, NULL, '[]', 0, '2020-03-22 12:52:19', '2020-03-22 12:52:19', '2020-03-23 12:50:53');
INSERT INTO `oauth_access_tokens` VALUES ('9be1568bcbc27c0409032eedb4f5a6b95f4e28a9b237fef6aa44321b4ca4ae2937e54f03827b057b', 1, 14, NULL, '[]', 0, '2020-02-24 13:34:30', '2020-02-24 13:34:30', '2020-02-25 13:34:30');
INSERT INTO `oauth_access_tokens` VALUES ('9c38da79bff4ce623f8c9196717ff011ffbe5a50a1ef55b6bc64a78582388f1d9cc24469db2a95fc', 1, 14, NULL, '[]', 0, '2020-02-24 13:30:10', '2020-02-24 13:30:10', '2020-02-25 13:30:10');
INSERT INTO `oauth_access_tokens` VALUES ('9ca16d2789ccdd65e349a3a602fbb629278ecb4d26f36f25beb5cbb38decef169959a74dbfa5dc4f', 1, 15, NULL, '[]', 0, '2020-03-20 07:39:31', '2020-03-20 07:39:31', '2020-03-21 04:17:39');
INSERT INTO `oauth_access_tokens` VALUES ('9cb5db382aed00e2e74f270f1addec57b9d3aa7c98c58f2980654806de29fe5fa9ea458fa7eb1d23', 1, 14, NULL, '[]', 0, '2020-03-15 07:36:01', '2020-03-15 07:36:01', '2020-03-16 07:35:50');
INSERT INTO `oauth_access_tokens` VALUES ('9cdc60176e46a99c1298658270b1c7afc1015907ce1b12c84a0a6c1234466c8931015d50af702813', 1, 15, NULL, '[]', 0, '2020-03-20 07:15:05', '2020-03-20 07:15:05', '2020-03-21 03:53:13');
INSERT INTO `oauth_access_tokens` VALUES ('9ec9053caeb3805b2f2107763c39c541ac333de45ab6b092bd6b553b317a7bb77aa76ec137001847', 1, 14, NULL, '[]', 0, '2020-03-11 12:24:10', '2020-03-11 12:24:10', '2020-03-12 12:24:02');
INSERT INTO `oauth_access_tokens` VALUES ('a086cee4869eeaeb7346dc7cca244048ab1afb460278889f034a9d422fe36ca4ee7cbf080bf16eaf', 1, 14, NULL, '[]', 0, '2020-02-25 01:08:14', '2020-02-25 01:08:14', '2020-02-26 01:08:14');
INSERT INTO `oauth_access_tokens` VALUES ('a23465262173186be60b01eecba7fdfe1aaf80da6ae251689e073348c814971d4d28b470b2ea474f', 1, 14, NULL, '[]', 0, '2020-01-11 05:14:02', '2020-01-11 05:14:02', '2020-01-12 05:14:02');
INSERT INTO `oauth_access_tokens` VALUES ('a2b557117d37f0a8d7cf9cee073bbc20581255b60e1b9656de972cdd155e3797c3e2e3160e57221b', 1, 15, NULL, '[]', 0, '2020-03-31 09:27:32', '2020-03-31 09:27:32', '2020-04-01 09:27:32');
INSERT INTO `oauth_access_tokens` VALUES ('a492592757091a06fcac7cfc7378c17c23520a5af90dbd2546b7eda920313f7b61bc33cfdd5f7649', 1, 15, NULL, '[]', 0, '2020-01-18 14:29:35', '2020-01-18 14:29:35', '2020-01-19 14:29:35');
INSERT INTO `oauth_access_tokens` VALUES ('a64749cf2e10da7edaca7f9271cf9ae37d28677486fb7c3042964b71310df5e58e73d58f17c0c7d0', 1, 14, NULL, '[]', 0, '2020-02-24 11:20:03', '2020-02-24 11:20:03', '2020-02-25 11:20:03');
INSERT INTO `oauth_access_tokens` VALUES ('a70e8d0acfb2c388aafebe490a850d705fc8df9ea90f51a6338d2354c2ec4594a3ee5ee32c82231b', 1, 14, NULL, '[]', 0, '2020-01-11 10:21:04', '2020-01-11 10:21:04', '2020-01-12 10:21:04');
INSERT INTO `oauth_access_tokens` VALUES ('a87446a48d124e4af483d33d0ac550aaf6e85e22115e85e14f6a979d9fde327ce575dbf92646ab16', 2, 2, NULL, '[]', 0, '2020-01-13 08:11:44', '2020-01-13 08:11:44', '2020-01-14 08:11:44');
INSERT INTO `oauth_access_tokens` VALUES ('a893b0e1d073643b19f89b2363602a7cc812b82e3177cdecc22b9adf417251720b6510d0c7a28eca', 1, 14, NULL, '[]', 0, '2020-02-24 12:26:18', '2020-02-24 12:26:18', '2020-02-25 12:26:18');
INSERT INTO `oauth_access_tokens` VALUES ('ad3cfd2437e2e13b585bd769b043f33af5690dda783afa8d335d32d7cbf358ee9793bcdf558da8f2', 1, 14, NULL, '[]', 0, '2020-02-25 06:10:10', '2020-02-25 06:10:10', '2020-02-26 06:10:10');
INSERT INTO `oauth_access_tokens` VALUES ('ae1e06631f69d6fdc7374dfecdadc0a0b08eaf85282af3b0f2b49190dbdf0b379292fc4dbc371f4b', 1, 14, NULL, '[]', 0, '2020-02-24 00:08:36', '2020-02-24 00:08:36', '2020-02-25 00:08:36');
INSERT INTO `oauth_access_tokens` VALUES ('ae7edcfd8684d34411639eeb444967040a9c62977c7dafdcf53d1cb7860ab648a1f907e1f3a28dd0', 1, 14, NULL, '[]', 0, '2020-02-25 02:50:15', '2020-02-25 02:50:15', '2020-02-26 02:50:15');
INSERT INTO `oauth_access_tokens` VALUES ('ae82e12e6a935da7ee165432171b38788e0008a068d7b31b29fd48c5136cab3b14193ab259615e85', 1, 14, NULL, '[]', 0, '2020-02-24 07:40:36', '2020-02-24 07:40:36', '2020-02-25 07:40:36');
INSERT INTO `oauth_access_tokens` VALUES ('b0f629c9f474e5cabe5d4d28ae3b5208ca92d8752dd9a07c2b8cdfac4e7c2467efbfc350bfa0e65f', 1, 14, NULL, '[]', 0, '2020-03-22 09:54:17', '2020-03-22 09:54:17', '2020-03-23 09:49:46');
INSERT INTO `oauth_access_tokens` VALUES ('b197189d0d4164370f2574184978267d8c165528a2559588ec6b59451066aa646c317a020aa93335', 1, 14, NULL, '[]', 0, '2020-03-22 05:41:11', '2020-03-22 05:41:11', '2020-03-23 04:45:59');
INSERT INTO `oauth_access_tokens` VALUES ('b1f7e591cb9be67dffe7716bc5abf2db6a2fe15c88692b152e03ed4e34dcc6521a124badc5a1f903', 1, 14, NULL, '[]', 0, '2020-03-27 03:03:07', '2020-03-27 03:03:07', '2020-03-28 03:02:48');
INSERT INTO `oauth_access_tokens` VALUES ('b3c75efddb252126a3c2acc56d0c2aa07ea761b672457319bf62ed61a1ebf9668de81c8e8d42fa13', 1, 15, NULL, '[]', 0, '2020-01-18 01:07:57', '2020-01-18 01:07:57', '2020-01-19 01:07:57');
INSERT INTO `oauth_access_tokens` VALUES ('b40a4bfa593e847ca35dec404d962a467a88ca5ce1c69cc9b0b6e3e39d9930b93977756b9df12d4a', 1, 15, NULL, '[]', 0, '2020-03-20 08:14:28', '2020-03-20 08:14:28', '2020-03-21 03:53:13');
INSERT INTO `oauth_access_tokens` VALUES ('b4950f92f033a17d84ca5a0d8a60d5e241572691db7dff885045f01125fe1c963affa31d7846d805', 1, 15, NULL, '[]', 0, '2020-03-11 22:44:28', '2020-03-11 22:44:28', '2020-03-12 12:24:02');
INSERT INTO `oauth_access_tokens` VALUES ('b4da2f86ab326d40e316e6e4259b1f33f2d42df7df7dcf2027bcbc3003b3898deed259ffa0c6fb46', 1, 15, NULL, '[]', 0, '2020-03-19 23:38:06', '2020-03-19 23:38:06', '2020-03-20 23:32:03');
INSERT INTO `oauth_access_tokens` VALUES ('b685fc29369ce5aee2cdf0b7cd2513e8a6790311a5614667b269246e5f03d41507cf912ce732f803', 1, 14, NULL, '[]', 0, '2020-02-25 03:30:44', '2020-02-25 03:30:44', '2020-02-26 03:30:44');
INSERT INTO `oauth_access_tokens` VALUES ('b7146b70d128fcf43e3d12bf95eedb72d4b63bdf045305b17e1553391476abc701173a4eeeed6ccb', 1, 14, NULL, '[]', 0, '2020-02-25 03:00:08', '2020-02-25 03:00:08', '2020-02-26 03:00:08');
INSERT INTO `oauth_access_tokens` VALUES ('b864114d91f816d9a441db25dd21c0bfbf9198d600a45cf13775dc4323b9024d906e9a47a28a786e', 1, 15, NULL, '[]', 0, '2020-03-20 08:31:27', '2020-03-20 08:31:27', '2020-03-21 05:09:35');
INSERT INTO `oauth_access_tokens` VALUES ('b8bbe9313ddc39a99495aae8f7f8dbc1c90bf645ffe2aa5ddb8d67f72a8c89ee5237fc4d2a3654ae', 1, 14, NULL, '[]', 0, '2020-03-27 02:58:36', '2020-03-27 02:58:36', '2020-03-28 02:58:36');
INSERT INTO `oauth_access_tokens` VALUES ('ba40f786a79e178b46002d302b24afd542ad2e55bfad7481d09f3069278f70448bfe841245e55315', 1, 15, NULL, '[]', 0, '2020-03-20 08:09:38', '2020-03-20 08:09:38', '2020-03-21 04:30:58');
INSERT INTO `oauth_access_tokens` VALUES ('babdb98d86faa7792c89f7ad17747cddc578a948eefbe25a7d0b552564a17b454a5658dc390fceb1', 1, 14, NULL, '[]', 0, '2020-02-24 11:20:39', '2020-02-24 11:20:39', '2020-02-25 11:20:39');
INSERT INTO `oauth_access_tokens` VALUES ('bbbb4c3852651d1bb56b50e842c60471a6d9769de62d3ef33349c8370e3b7cbf28da7464bc200e16', 1, 15, NULL, '[]', 0, '2020-01-18 05:30:11', '2020-01-18 05:30:11', '2020-01-19 05:30:11');
INSERT INTO `oauth_access_tokens` VALUES ('bbcf307d15396791e979c05288f24fcf8026b49463fc0a1be371d6e9e40d855fb1ffcb9629acab29', 1, 14, NULL, '[]', 0, '2020-02-24 09:08:16', '2020-02-24 09:08:16', '2020-02-25 09:08:16');
INSERT INTO `oauth_access_tokens` VALUES ('bcbfba26ff64a7787153b994bb5ddccb300b9d7f1a4aec447b0ee8efcecdb090b28c392c642347a3', 1, 14, NULL, '[]', 0, '2020-02-24 10:59:47', '2020-02-24 10:59:47', '2020-02-25 10:59:47');
INSERT INTO `oauth_access_tokens` VALUES ('bf92714b5d48ce86ccaf18b30ec9a26e07877ecd6cc90cbb95f59ced3f7e1f79a61492a4220c17ab', 2, 2, NULL, '[]', 0, '2020-01-13 08:11:53', '2020-01-13 08:11:53', '2020-01-14 08:11:53');
INSERT INTO `oauth_access_tokens` VALUES ('c0488cea9a500ccf6c76a10b09174c3a771a839045df03d7eeb368ffb9fe3c7ac48ddea9454a70e1', 1, 15, NULL, '[]', 0, '2020-03-20 08:43:45', '2020-03-20 08:43:45', '2020-03-21 05:19:11');
INSERT INTO `oauth_access_tokens` VALUES ('c07d84e18a6eea76532c18ad7431f3705fa7e1daf078d0df9b80e2816b931039036cf82d9ff85f51', 1, 14, NULL, '[]', 0, '2020-02-24 13:26:16', '2020-02-24 13:26:16', '2020-02-25 13:26:16');
INSERT INTO `oauth_access_tokens` VALUES ('c228a3c6c4cfb480e18ac45784f5614a501cfb0a4243e552f076c6f45246d48c085983eff822dcb8', 1, 15, NULL, '[]', 0, '2020-03-20 13:01:07', '2020-03-20 13:01:07', '2020-03-21 12:53:36');
INSERT INTO `oauth_access_tokens` VALUES ('c2703b60190db517b224f09d9e84c9019111cd48e39f1144e35082e8f9963edfb533bdc1a515b765', 1, 14, NULL, '[]', 0, '2020-02-25 02:13:26', '2020-02-25 02:13:26', '2020-02-26 02:13:26');
INSERT INTO `oauth_access_tokens` VALUES ('c287482aff9270a7e13a4d8a01dfa28c6b060e96f10b7d892d07b48c5eafaa1d7a13aa38c0124a9d', 1, 14, NULL, '[]', 0, '2020-03-22 12:56:35', '2020-03-22 12:56:35', '2020-03-23 12:55:09');
INSERT INTO `oauth_access_tokens` VALUES ('c47c8041b50e78d5321203d87a909110d7578783c5e9462f3148640e285d17b67e0a82efdae4fc7d', 1, 14, NULL, '[]', 0, '2020-02-24 12:26:27', '2020-02-24 12:26:27', '2020-02-25 12:26:27');
INSERT INTO `oauth_access_tokens` VALUES ('c644c7ddb67f34f9d6888243dcbbe9f813bbfa31f8d00a681b59ac28cf971894ed71bab2066253d4', 1, 14, NULL, '[]', 0, '2020-03-22 05:41:46', '2020-03-22 05:41:46', '2020-03-23 05:41:40');
INSERT INTO `oauth_access_tokens` VALUES ('c67e589781dfe06f206760a2d3b392b46eee817fa7fbbcb81e16def2665a19e321f7f60be41f3c50', 2, 2, NULL, '[]', 0, '2020-01-13 09:25:12', '2020-01-13 09:25:12', '2020-01-14 09:25:12');
INSERT INTO `oauth_access_tokens` VALUES ('c6ce0afd7b4161d52d2113bd6d75fad8ed181444e37aac424cb76c14510ffaf75a62379c69ba231a', 1, 2, NULL, '[]', 0, '2020-01-11 06:01:08', '2020-01-11 06:01:08', '2020-01-12 06:01:08');
INSERT INTO `oauth_access_tokens` VALUES ('c89b07e244fa3a31fc859a47ee05073e6c43833dff0e0fc87c43d5fbebe87638715509b4f866ed6e', 1, 14, NULL, '[]', 0, '2020-01-11 06:43:38', '2020-01-11 06:43:38', '2020-01-12 06:43:38');
INSERT INTO `oauth_access_tokens` VALUES ('c8affebb0900e0cd8ab1145fc417f603c616f1c2dd5c9f6ae86345453f6bb4b5254de6eb4cfa87e1', 1, 14, NULL, '[]', 0, '2020-02-24 10:57:04', '2020-02-24 10:57:04', '2020-02-25 10:57:04');
INSERT INTO `oauth_access_tokens` VALUES ('ca254d18f6078ec0b45aa1ba8ae5ea3647c14a59df7f453431a3e81555a4ad996ecc79321ed7452e', 1, 15, NULL, '[]', 0, '2020-03-20 08:31:16', '2020-03-20 08:31:16', '2020-03-21 04:52:35');
INSERT INTO `oauth_access_tokens` VALUES ('cb1a58124316e6f1f9638e28d64524cd6560731c93cda23a387be73d9fe6a38a95b0cc8a39519d19', 1, 14, NULL, '[]', 0, '2020-02-25 01:18:57', '2020-02-25 01:18:57', '2020-02-26 01:18:57');
INSERT INTO `oauth_access_tokens` VALUES ('cb2294a3bea2645699f78b01f577592cd1e4236774feb59528fcc6d42eebb51287b5000703769868', 1, 14, NULL, '[]', 0, '2020-02-25 02:19:16', '2020-02-25 02:19:16', '2020-02-26 02:19:16');
INSERT INTO `oauth_access_tokens` VALUES ('cc26e8748b7f152596db85c67c9ab505e042f25d2fd5bc074c28ce92d37fec7de0a0ffc8ba8af62b', 1, 14, NULL, '[]', 0, '2020-02-25 06:10:19', '2020-02-25 06:10:19', '2020-02-26 06:10:19');
INSERT INTO `oauth_access_tokens` VALUES ('cd69d22719d299cbabe6fa69e7fa6b3667faea98ce14605b3e012e6d597fe85acdee3c8c1d09f418', 1, 14, NULL, '[]', 0, '2020-02-24 07:40:29', '2020-02-24 07:40:29', '2020-02-25 07:40:29');
INSERT INTO `oauth_access_tokens` VALUES ('cdd86c76e2981d90dfe6eddc4ac621b81958a804621496c3baa62acfcfbaed93324f14c740528c22', 1, 15, NULL, '[]', 0, '2020-03-20 07:52:31', '2020-03-20 07:52:31', '2020-03-21 04:13:50');
INSERT INTO `oauth_access_tokens` VALUES ('cdea293b73a466ca3d52cf874131b23b32744d67d4f753599fc509febcb23ca0cebe294ecbb37b7d', 1, 14, NULL, '[]', 0, '2020-02-27 11:58:28', '2020-02-27 11:58:28', '2020-02-28 11:58:28');
INSERT INTO `oauth_access_tokens` VALUES ('ce11b06eeab7a5fa31fbefc34b9bab374eb77284e79d37e1c20ef86096ccb241ec81329daac15a7a', 1, 14, NULL, '[]', 0, '2020-02-25 02:05:52', '2020-02-25 02:05:52', '2020-02-26 02:05:52');
INSERT INTO `oauth_access_tokens` VALUES ('d1d9d1cb75bf6ef9e17463c65c18e0e2837f29b3b1d0b4ded86661f0d3fb8e29b0cda5884f937ac8', 1, 14, NULL, '[]', 0, '2020-01-11 08:31:44', '2020-01-11 08:31:44', '2020-01-12 08:31:44');
INSERT INTO `oauth_access_tokens` VALUES ('d25603ed30a59435b21f318771fe8239aee764eebf66ff964b627591ea7281093a009114b2ce8699', 1, 15, NULL, '[]', 0, '2020-01-11 05:15:58', '2020-01-11 05:15:58', '2020-01-12 05:15:58');
INSERT INTO `oauth_access_tokens` VALUES ('d407277c03b728a7c57e584bcfb3c665685c6074b1e5c3a81e38be1e2c3188325f2afb57d3a810a7', 1, 14, NULL, '[]', 0, '2020-01-11 09:26:40', '2020-01-11 09:26:40', '2020-01-12 09:26:40');
INSERT INTO `oauth_access_tokens` VALUES ('d530cf01f755cbc5f03005a3d4f2d4141a4880468e6c9ed72cbc3f726d89ad1c92ea8487e21d9c50', 1, 14, NULL, '[]', 0, '2020-02-25 00:48:21', '2020-02-25 00:48:21', '2020-02-26 00:48:21');
INSERT INTO `oauth_access_tokens` VALUES ('d58e364078da055452be93ca35b6f4a6ee0dfc8326934401cf823d145ec6d98b6eb7ee4ca3a1cb1a', 1, 14, NULL, '[]', 0, '2020-02-25 02:41:11', '2020-02-25 02:41:11', '2020-02-26 02:41:11');
INSERT INTO `oauth_access_tokens` VALUES ('d6550695ae0772aa1238f2eae59cb54b360881d365015185bc074bf56d8f13eda4dde3af6b3e983e', 1, 14, NULL, '[]', 0, '2020-01-13 02:52:19', '2020-01-13 02:52:19', '2020-01-14 02:52:19');
INSERT INTO `oauth_access_tokens` VALUES ('d67e7012d4d672f16735d3c85ca7735b3702d9784a566697909e6dcc72c5e60e9bc19212e699a3bc', 1, 14, NULL, '[]', 0, '2020-03-22 05:42:58', '2020-03-22 05:42:58', '2020-03-23 05:41:32');
INSERT INTO `oauth_access_tokens` VALUES ('d77309572732f73c41cd66692c7f5c95a674562175ace7edccfbef63a32a80ee5c2e0d77db27b468', 1, 14, NULL, '[]', 0, '2020-02-25 02:29:25', '2020-02-25 02:29:25', '2020-02-26 02:29:25');
INSERT INTO `oauth_access_tokens` VALUES ('d87a4eacbc0ad8bca0a095cee2dd8fbe348227547b03f69e7df469faa2c0da626c19f4e9ba81882c', 1, 15, NULL, '[]', 0, '2020-03-20 08:15:16', '2020-03-20 08:15:16', '2020-03-21 04:50:42');
INSERT INTO `oauth_access_tokens` VALUES ('d99874f07ff233e3162d07676cc81dfa89eb4d9457337392cb2a78f62a1c50b7079044cdb667f86d', 1, 14, NULL, '[]', 0, '2020-02-24 11:15:58', '2020-02-24 11:15:58', '2020-02-25 11:15:58');
INSERT INTO `oauth_access_tokens` VALUES ('db5341ea8f9f2bd50bce5caccd6a3c28dbe251096e53e64bd74a141197bdb747b02217019a50d28d', 1, 14, NULL, '[]', 0, '2020-02-25 02:39:04', '2020-02-25 02:39:04', '2020-02-26 02:39:04');
INSERT INTO `oauth_access_tokens` VALUES ('dc1ce7fca3da3f2dad2f11a2949a1f0b81e9eec6155993b3ee421e3b452f442be42598dbafc895d4', 2, 2, NULL, '[]', 0, '2020-01-13 09:40:32', '2020-01-13 09:40:32', '2020-01-14 09:40:32');
INSERT INTO `oauth_access_tokens` VALUES ('dda4636a648b479dce69683a32f271346d409fb278235b15cec929cc7e091fb412b79e63f170e3ca', 1, 14, NULL, '[]', 0, '2020-01-14 03:48:59', '2020-01-14 03:48:59', '2020-01-15 03:48:59');
INSERT INTO `oauth_access_tokens` VALUES ('df3a742f88308a6a2aa0fb66e87bb9daad5d111f0f3b9563677d0dad954982e5d5837b53c50a55d3', 1, 14, NULL, '[]', 0, '2020-03-14 08:57:30', '2020-03-14 08:57:30', '2020-03-15 08:57:22');
INSERT INTO `oauth_access_tokens` VALUES ('e1d778e67171b7efcf84e3977436a2a8c4415746822305970fe749a34ea71c95723c19a2f7973cbb', 1, 14, NULL, '[]', 0, '2020-03-14 08:57:39', '2020-03-14 08:57:39', '2020-03-15 06:46:53');
INSERT INTO `oauth_access_tokens` VALUES ('e3f633c2823f68ed6ecb645176c946deecbd4c2bd7694d249ee7400dfa0640916f96b809fd2dadf1', 1, 14, NULL, '[]', 0, '2020-02-25 07:22:09', '2020-02-25 07:22:09', '2020-02-26 07:22:09');
INSERT INTO `oauth_access_tokens` VALUES ('e58e48729e95ceaa9f86ef7df4ff02a8752b3f62c19930ca92d68a036da5d81a7faed8b9880a7c97', 1, 14, NULL, '[]', 0, '2020-02-24 09:35:05', '2020-02-24 09:35:05', '2020-02-25 09:35:05');
INSERT INTO `oauth_access_tokens` VALUES ('e61e8d1750e5f011d21e2e564a674a2e5412e7abb5f09af92ef54f2e6a20041210e926079fde6fc4', 1, 15, NULL, '[]', 0, '2020-01-11 05:15:58', '2020-01-11 05:15:58', '2020-01-12 05:15:58');
INSERT INTO `oauth_access_tokens` VALUES ('e655ebd8923376a109eb1d8963b200577f2f9167cac9c8a24f3a832ff51dd4d614ac363e3931fe36', 1, 14, NULL, '[]', 0, '2020-04-14 08:17:35', '2020-04-14 08:17:35', '2020-04-15 08:17:35');
INSERT INTO `oauth_access_tokens` VALUES ('e6884c4f89c5d720b6ed6ca9a2e253e1a365ed10db3d1f62068f945f96b9bad60a82223600116eab', 1, 14, NULL, '[]', 0, '2020-02-24 11:08:42', '2020-02-24 11:08:42', '2020-02-25 11:08:42');
INSERT INTO `oauth_access_tokens` VALUES ('e883087cf60a8944d2ba927699b73b3b1d8079aecaf2b4cfa0d74c9441eafb94dacdfd2361b60cb5', 1, 14, NULL, '[]', 0, '2020-02-24 07:05:44', '2020-02-24 07:05:44', '2020-02-25 07:05:44');
INSERT INTO `oauth_access_tokens` VALUES ('e8ab1bd95b410e50457958dd753d4baedf806c8a636cf72995e916c2bdcacdcfb8f203eb15d2e26a', 1, 14, NULL, '[]', 0, '2020-02-25 02:00:07', '2020-02-25 02:00:07', '2020-02-26 02:00:07');
INSERT INTO `oauth_access_tokens` VALUES ('e9d18d6741dd684ff8a7b477f7c5e1d911b346bf252985b7200a81ff72ac50080ff83b8b0c82f1a2', 1, 15, NULL, '[]', 0, '2020-03-20 08:29:23', '2020-03-20 08:29:23', '2020-03-21 04:50:42');
INSERT INTO `oauth_access_tokens` VALUES ('eb2e1e068921104dc30c8a24b0cf6070c9419ef812f8dc9ddb1b15d5177854bf7b037e1eb75e8ad7', 1, 15, NULL, '[]', 0, '2020-03-20 08:21:13', '2020-03-20 08:21:13', '2020-03-21 04:59:21');
INSERT INTO `oauth_access_tokens` VALUES ('ec7fec1215a8da54d24e7aa3e322d746dd5402838417d2595331876d08ce50d059b241d5f3e20039', 1, 14, NULL, '[]', 0, '2020-02-25 01:23:43', '2020-02-25 01:23:43', '2020-02-26 01:23:43');
INSERT INTO `oauth_access_tokens` VALUES ('ed0b34071db8ec0b4c94d5ee864c19e0a88405fb95079d62e4f2bb4e5bcbb82bd3906e40d744c97b', 1, 15, NULL, '[]', 0, '2020-03-22 04:45:59', '2020-03-22 04:45:59', '2020-03-23 04:45:51');
INSERT INTO `oauth_access_tokens` VALUES ('edc6201357c062b88558f492cfd39f03379cb6c5f3cc61845bd0b702fd33bc1ae55b40c1847a0fcd', 1, 14, NULL, '[]', 0, '2020-03-22 09:54:22', '2020-03-22 09:54:22', '2020-03-23 09:49:51');
INSERT INTO `oauth_access_tokens` VALUES ('ee347455722cfebd7ac31ae302c0710b66e99f038d6fc4b670079516532816c43ad918dba611125e', 1, 14, NULL, '[]', 0, '2020-02-29 06:03:06', '2020-02-29 06:03:06', '2020-03-01 06:03:06');
INSERT INTO `oauth_access_tokens` VALUES ('eea1e00b8dfeaa145477d3af80647ceca6dd7a341b7e6e62d70f7891a9ab4c1e1b914bab34f4a9cd', 1, 14, NULL, '[]', 0, '2020-02-25 01:20:05', '2020-02-25 01:20:05', '2020-02-26 01:20:05');
INSERT INTO `oauth_access_tokens` VALUES ('ef271cea4f3c979942d86feb03a716eac775f4e28f299e225bb369d64722426de790215278f58a72', 1, 14, NULL, '[]', 0, '2020-03-22 10:45:11', '2020-03-22 10:45:11', '2020-03-23 10:43:44');
INSERT INTO `oauth_access_tokens` VALUES ('efe1995028e17dd1f0e59212a0f82c1e0c43d163ed17f47d2390a9faea9caaf7ba439ce902a649ee', 1, 15, NULL, '[]', 0, '2020-03-20 08:41:34', '2020-03-20 08:41:34', '2020-03-21 05:02:53');
INSERT INTO `oauth_access_tokens` VALUES ('f04492273d2b0d53e80a6aa064cb5f5c643da92a231423e7c6edb332ba4250bf79460cb8726ba5b7', 1, 14, NULL, '[]', 0, '2020-02-25 07:14:22', '2020-02-25 07:14:22', '2020-02-26 07:14:22');
INSERT INTO `oauth_access_tokens` VALUES ('f14da1b85e6111f2c645781d6ba4ce40c2cdace40e4e03e4688fd38489b211fcae51a1869f261eb0', 1, 14, NULL, '[]', 0, '2020-01-11 10:03:51', '2020-01-11 10:03:51', '2020-01-12 10:03:51');
INSERT INTO `oauth_access_tokens` VALUES ('f40262e2c5cf73d0b73b672f344788be3fbbb2b64363ace285b443d3d1a995f16b342005b87e47a6', 1, 14, NULL, '[]', 0, '2020-03-27 03:03:35', '2020-03-27 03:03:35', '2020-03-28 03:02:48');
INSERT INTO `oauth_access_tokens` VALUES ('f46a15b38c14c8975876f9c1a7e913ddd79c35e99b536ba173f77d84aae38e2345b3816a5ab470f0', 2, 2, NULL, '[]', 0, '2020-01-11 10:01:10', '2020-01-11 10:01:10', '2020-01-12 10:01:10');
INSERT INTO `oauth_access_tokens` VALUES ('f4feb460067b6475dd841106088c668db928104b601b72f5cec967cf05eb83d6ef47f2e593549094', 1, 14, NULL, '[]', 0, '2020-02-25 01:20:52', '2020-02-25 01:20:52', '2020-02-26 01:20:52');
INSERT INTO `oauth_access_tokens` VALUES ('f51c36caabb5d023bd914789f0685b6accc853dd6c7df91b5565c151d820062f46042d2c65363108', 1, 15, NULL, '[]', 0, '2020-03-20 08:19:24', '2020-03-20 08:19:24', '2020-03-21 04:40:43');
INSERT INTO `oauth_access_tokens` VALUES ('f61d8f3c5a4e7cf8f129cc5ec142d13e4c0567e093a0e206e50cebd80c8b500f833f030c777d7e3e', 1, 14, NULL, '[]', 0, '2020-01-11 10:30:51', '2020-01-11 10:30:51', '2020-01-12 10:30:51');
INSERT INTO `oauth_access_tokens` VALUES ('f830400a5e0aaf5cf50ec4be17f4697175555841c18f184e327f65237707805e2277bb4349b62b32', 1, 14, NULL, '[]', 0, '2020-03-22 05:46:02', '2020-03-22 05:46:02', '2020-03-23 05:41:32');
INSERT INTO `oauth_access_tokens` VALUES ('f883a44b0024fc336a40efa72e62ae3beb7760abb691344370fef5351e23c9c37f32c21e289e4219', 1, 15, NULL, '[]', 0, '2020-03-20 08:26:23', '2020-03-20 08:26:23', '2020-03-21 05:01:50');
INSERT INTO `oauth_access_tokens` VALUES ('f8a7a005ee47a1bdbbdaaa5377bbaaff412ecb61eded421f904d5d03502088327abd5d9b6b8b929d', 2, 2, NULL, '[]', 0, '2020-01-13 08:25:33', '2020-01-13 08:25:33', '2020-01-14 08:25:33');
INSERT INTO `oauth_access_tokens` VALUES ('f9148384c93be08e15e9bdae39ba546b07cc9bac190c7e0829039c1c8c34fdc4232e6e7802271163', 1, 15, NULL, '[]', 0, '2020-03-20 08:46:35', '2020-03-20 08:46:35', '2020-03-21 05:07:54');
INSERT INTO `oauth_access_tokens` VALUES ('f9a7688ad30f29efbc78b2a6d7a8350591f6c884bccf2412e7aad0ff43f5b336f4d0eeb55ae96086', 1, 14, NULL, '[]', 0, '2020-02-24 09:36:18', '2020-02-24 09:36:18', '2020-02-25 09:36:18');
INSERT INTO `oauth_access_tokens` VALUES ('fac71aee09435ba77bb86e86eaca6b10dc4270b4fe89e3b228f4b07abe751a2ec2269f555f3fc02a', 1, 14, NULL, '[]', 0, '2020-02-24 11:34:51', '2020-02-24 11:34:51', '2020-02-25 11:34:51');
INSERT INTO `oauth_access_tokens` VALUES ('fad604455051249b4c9914ede06fc9e850b9570da90fea2f238c70898b10f416639aee90226e00f3', 1, 14, NULL, '[]', 0, '2020-02-24 09:31:07', '2020-02-24 09:31:07', '2020-02-25 09:31:07');
INSERT INTO `oauth_access_tokens` VALUES ('fc1a85497a14f3124b0cf4efc323c614312970d88fac14fa0544e3f9027a2ab7d52276754b2044c0', 1, 14, NULL, '[]', 0, '2020-02-25 02:48:39', '2020-02-25 02:48:39', '2020-02-26 02:48:39');
INSERT INTO `oauth_access_tokens` VALUES ('fc3d0f69d57df59e5f891e58f6c634e4e3c89028270309d5608911472a402137eb5b168b66ec1075', 1, 14, NULL, '[]', 0, '2020-02-25 07:14:27', '2020-02-25 07:14:27', '2020-02-26 07:14:27');
INSERT INTO `oauth_access_tokens` VALUES ('fd79b049ea36718f0f1fb0e31fa632ff0d6c05d53fcdb940cbf51047cc2e0ee481d43bffc9aa3359', 1, 14, NULL, '[]', 0, '2020-02-25 02:36:04', '2020-02-25 02:36:04', '2020-02-26 02:36:04');
INSERT INTO `oauth_access_tokens` VALUES ('fe3f66e9515292d759d1159cf2c6833ce48f897491bcc552f2ccde1d5f25b667aa17786f8b0ab8ee', 1, 14, NULL, '[]', 0, '2020-01-11 10:06:56', '2020-01-11 10:06:56', '2020-01-12 10:06:56');
INSERT INTO `oauth_access_tokens` VALUES ('febe3f462a4403891e494e20ee5915885235f3113cbc484344805bfa35b0bf4ee8d6d72ae316b30e', 1, 14, NULL, '[]', 0, '2020-02-24 13:33:56', '2020-02-24 13:33:56', '2020-02-25 13:33:56');
INSERT INTO `oauth_access_tokens` VALUES ('ffd54653ced97ae9457c108b479324054134e5b1a422fecb504322f25c495aa8ffff64a9c618081b', 1, 14, NULL, '[]', 0, '2020-02-24 13:35:57', '2020-02-24 13:35:57', '2020-02-25 13:35:57');
COMMIT;

-- ----------------------------
-- Table structure for oauth_auth_codes
-- ----------------------------
DROP TABLE IF EXISTS `oauth_auth_codes`;
CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `client_id` int(10) unsigned NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for oauth_clients
-- ----------------------------
DROP TABLE IF EXISTS `oauth_clients`;
CREATE TABLE `oauth_clients` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_clients_user_id_index` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of oauth_clients
-- ----------------------------
BEGIN;
INSERT INTO `oauth_clients` VALUES (1, NULL, 'Laravel Personal Access Client', 'DBXDLw7Np6pTY6mO4LANx1BC51dhgBnkJuN4Heyq', 'http://mojito.skt/', 1, 0, 0, '2020-01-01 03:12:03', '2020-01-01 03:12:03');
INSERT INTO `oauth_clients` VALUES (2, NULL, 'Laravel Password Grant Client', '9tBGaDo6M0IFVFXU62HH6pYlov4rO8tGN2I4x86y', 'http://mojito.skt/member/callback', 0, 1, 0, '2020-01-01 03:12:03', '2020-01-01 03:12:03');
INSERT INTO `oauth_clients` VALUES (3, NULL, '用户登陆', 'Yce5mkJGkyVklSW2QvwqTfwG6GYv5Aui20fv9sUD', 'http://mojito.skt/', 0, 0, 0, '2020-01-06 04:09:10', '2020-01-06 04:09:10');
INSERT INTO `oauth_clients` VALUES (12, 1, '于鋆南', 'wxWyUDGoMiW1rmMqqbCMqIHhP1alBddjb54bMM8s', 'http://mojito.skt/', 0, 0, 1, '2020-01-07 04:44:48', '2020-01-07 04:56:56');
INSERT INTO `oauth_clients` VALUES (13, NULL, 'Laravel Personal Access Client', 'WWoyCzzS3Wv08Dznzccjmn9EliJFaGV4ExygcYK3', 'http://localhost', 1, 0, 0, '2020-01-09 16:18:50', '2020-01-09 16:18:50');
INSERT INTO `oauth_clients` VALUES (14, NULL, 'Laravel Password Grant Client', '7uQlrq48eftxY62iHkQYI0VMAsXBz0gRSr3awXao', 'http://localhost', 0, 1, 0, '2020-01-09 16:18:50', '2020-01-09 16:18:50');
INSERT INTO `oauth_clients` VALUES (15, 2, '会员登录', 'KpUmmiC0lFDQmGNmOpmZuXf04Lifi1HjFvh1tUh7', 'http://localhost', 0, 1, 0, '2020-01-11 03:37:05', '2020-01-11 03:37:05');
COMMIT;

-- ----------------------------
-- Table structure for oauth_personal_access_clients
-- ----------------------------
DROP TABLE IF EXISTS `oauth_personal_access_clients`;
CREATE TABLE `oauth_personal_access_clients` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `client_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_personal_access_clients_client_id_index` (`client_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for oauth_refresh_tokens
-- ----------------------------
DROP TABLE IF EXISTS `oauth_refresh_tokens`;
CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of oauth_refresh_tokens
-- ----------------------------
BEGIN;
INSERT INTO `oauth_refresh_tokens` VALUES ('013898d27bc8906238037fc5b7c0eb9148e03f3867fb18b259a67a824a69a9994b0077943a2dc3a2', 'c07d84e18a6eea76532c18ad7431f3705fa7e1daf078d0df9b80e2816b931039036cf82d9ff85f51', 0, '2020-03-02 13:26:16');
INSERT INTO `oauth_refresh_tokens` VALUES ('03cddae6dd5bea3eb7af9bd08425a0021773487bba72e3e6ae99c9e6c0369328fbd419f4641947cb', '30136028d468d6704fe81035c7dc5fa36d243395975dfeac830247638639bb74f3eb7ea7dbc7610f', 0, '2020-03-27 04:03:22');
INSERT INTO `oauth_refresh_tokens` VALUES ('053fd7ce4207a2d3db60c33e493d972530b65bc447e4ca9a06c59407e1543f3a0148f3a657a80d86', '93aa434893797ff77697c4a083ae433059de507410e08e16446dcd24b40d2c667df474970406c9c0', 0, '2020-03-21 06:46:53');
INSERT INTO `oauth_refresh_tokens` VALUES ('05931dcf9975af9d1ab8c8d9148b29e7ff81bde4be8463bdd78cc8bc3cf8b88e192a47cf583160e3', '26f57888310d74d89cfd00e67f411aeacd7d9859b47c763f84c4b804b9b84b818646d6317a8063e7', 0, '2020-01-18 07:58:10');
INSERT INTO `oauth_refresh_tokens` VALUES ('06c33e0aca322362fa85dd839521e4e2888ef0a605e2069863d45777e39439e02e8d34d424570641', '655c17f8fbbc9d5e005fbcf9a86072a521eeedac2c6ad73f4dec0f8c91e3900a162bdcedb1247a31', 0, '2020-01-18 07:59:13');
INSERT INTO `oauth_refresh_tokens` VALUES ('070aa3fb3c812b89a8ef7ee78f93cae0ae8e2ccc3bd1953d5824998febfa6484a77133bea1910b9f', 'b4da2f86ab326d40e316e6e4259b1f33f2d42df7df7dcf2027bcbc3003b3898deed259ffa0c6fb46', 0, '2020-03-26 23:32:03');
INSERT INTO `oauth_refresh_tokens` VALUES ('0791ea345db14306eddf1dc6f7196c68506991bb98ff55f27724708ff9ceda89ab926b3cd6f7d897', '4cabaeaa3b55685e663d96f719d1f7a8edf4393ed8bcddac6cfa392e21913de2c307c2dd6ce424e1', 0, '2020-03-03 07:23:21');
INSERT INTO `oauth_refresh_tokens` VALUES ('0799e692aff85c08e539c27e79f7c481e35902b4bdaea81a3f54f7333f364c145d6b1a8492f90e36', '41b8cac82faa4438a5add18a699173740072376de53c79cf25b32e1e32ea3fa4cd860733ebbc92d3', 0, '2020-03-03 02:30:05');
INSERT INTO `oauth_refresh_tokens` VALUES ('07fee5f5fa8570a9e4c31342b8fe18598d589bba054db60c57650cf4daa6416ac0c0e43ad095db3e', '08ca6c43e50ee5350c5cb5feb6cafffd1e3bf3942e864c7db995009aa37fa1dc23fe96b0793b0a56', 0, '2020-01-18 09:42:12');
INSERT INTO `oauth_refresh_tokens` VALUES ('0879ddb41340d136f67d0b7ec9e22ab077ba35bc74c7d658c522ede659609f2cc4edd4a233839200', 'dda4636a648b479dce69683a32f271346d409fb278235b15cec929cc7e091fb412b79e63f170e3ca', 0, '2020-01-21 03:48:59');
INSERT INTO `oauth_refresh_tokens` VALUES ('091ddfc92aa143bfc7ed61c8200aec6399c75149bd6de07f9455fe907d50c2a60505c9e80a2b7df2', '98f131ef468a991a556ec0527e277f425ea9524801864550aec3cc1907fc4be2173582733ec6198f', 0, '2020-03-02 00:10:59');
INSERT INTO `oauth_refresh_tokens` VALUES ('0a2016cedf6eecdc75fbc7f8f8d1a9004d5cad1b16a0a77eac367331a3889de4466788c14f6564f9', 'cb1a58124316e6f1f9638e28d64524cd6560731c93cda23a387be73d9fe6a38a95b0cc8a39519d19', 0, '2020-03-03 01:18:57');
INSERT INTO `oauth_refresh_tokens` VALUES ('0d31a34720f4fa7c8e5ee547fa1bf3bd80979630c8103301771f9ac9241392c80727b1f4ce1ee87a', 'f04492273d2b0d53e80a6aa064cb5f5c643da92a231423e7c6edb332ba4250bf79460cb8726ba5b7', 0, '2020-03-03 07:14:22');
INSERT INTO `oauth_refresh_tokens` VALUES ('0e4a81c3cd7cc12e62f2ebe66448b13d2a80525001fad2e2fdc27d3f5b18bae09f4bc762a1322a96', '72727a6d6a5f3c9d66349bbd1d1815990836734bc60792b5fea194fde2cfa655fde9bf6db8c3f94a', 0, '2020-03-07 03:18:42');
INSERT INTO `oauth_refresh_tokens` VALUES ('0fd06e8285d6e23b54e55ac4faf6e0340073cef7b61453605d64c4cffe5100cb0b8701fdec8d31a5', '71d452045fc24c4a127532de102eaa0f025273f78367be90530b4bf2e6f9ccdcdeedae19ca0e53cb', 0, '2020-03-03 03:03:40');
INSERT INTO `oauth_refresh_tokens` VALUES ('0fe1c353746afa85a46fea976cf29c89519dcd0d9394b81feb787cdfce8b40a6754f0bfb414601d4', '278a2d280c6b2c60dc9035cd9b55ee0d73adeddacd140ec61321b6de30dabf7615745bde73b2bfda', 0, '2020-01-18 05:15:52');
INSERT INTO `oauth_refresh_tokens` VALUES ('1031f0106bbf7ae415b932226ee61ec247aaff377c65d95a66a2ac7ec3aa219d098d7a1dac43cfb3', 'b0f629c9f474e5cabe5d4d28ae3b5208ca92d8752dd9a07c2b8cdfac4e7c2467efbfc350bfa0e65f', 0, '2020-03-29 09:49:46');
INSERT INTO `oauth_refresh_tokens` VALUES ('10e9af2500c81b9ba237b8765e2d3490411297f10da95aa61f24610b04afe379b1ef2e5d7e3b9194', '83c1db6c8e5be48951d65562faccffb069c5a95dbb0928c84ef728a2e046fb7b7b6e30543ff637e1', 0, '2020-03-02 11:15:29');
INSERT INTO `oauth_refresh_tokens` VALUES ('12dff5c7c276f25166a4bf0e103fb237ed2e76a50a5044f683ab556a7b690ef6c580a689955d082b', 'eb2e1e068921104dc30c8a24b0cf6070c9419ef812f8dc9ddb1b15d5177854bf7b037e1eb75e8ad7', 0, '2020-03-27 04:59:21');
INSERT INTO `oauth_refresh_tokens` VALUES ('14da704c0a292f918b907601e41bb90e0ce37161a500c077a6d14427926e98dd7506990ded3c4ee3', '48cec6db0ac949a30f4b173c6585d78f2df844a0b756006847385f447ef341bd06590e37c97756f3', 0, '2020-03-29 05:39:12');
INSERT INTO `oauth_refresh_tokens` VALUES ('152d9ba5dc9f2c821045cba1ba162d384e7b8bf3d43f824f1b70ccce3c98e48a82cda3f083d5f6a9', '3d9d8f0b4578a3301ece3d56062eb98c19ff1a7d889719560abe49eea9d3bc3b574da3e83f0122ea', 0, '2020-03-02 00:35:40');
INSERT INTO `oauth_refresh_tokens` VALUES ('154750bd5533f73ce095c18b9fd8cec0cfeae83d712e88b85182bef70ee336d1caff0e58f59e3fb7', 'ce11b06eeab7a5fa31fbefc34b9bab374eb77284e79d37e1c20ef86096ccb241ec81329daac15a7a', 0, '2020-03-03 02:05:52');
INSERT INTO `oauth_refresh_tokens` VALUES ('164804e544ca52882c63688e6bde92ea5ed2ebc9e6f504af3e048061c9a6fb81ae72d93111b2829f', '2cd3f07652693ee650041d7ffa62d4a2b8057d9fd945fc310ac93888a369cd4b9110a2a7dd77328e', 0, '2020-01-18 05:17:10');
INSERT INTO `oauth_refresh_tokens` VALUES ('180566a274c3cbda2cae32c20c39a70e788fae915e548d421a43cd7d3b4f022de31238be71dd8a5a', 'ad3cfd2437e2e13b585bd769b043f33af5690dda783afa8d335d32d7cbf358ee9793bcdf558da8f2', 0, '2020-03-03 06:10:10');
INSERT INTO `oauth_refresh_tokens` VALUES ('180c9007067fab1d4b8fb79d1f3d0a1e5315bdea5925b0fa844e05aaac7fdcd294808ec2768ea9a4', 'bf92714b5d48ce86ccaf18b30ec9a26e07877ecd6cc90cbb95f59ced3f7e1f79a61492a4220c17ab', 0, '2020-01-20 08:11:53');
INSERT INTO `oauth_refresh_tokens` VALUES ('18f5d07fd355599f5aa2efc3028c5a3dddbe1875e198f7d8155a570f701c8d14389c03ea3f54f14b', 'd407277c03b728a7c57e584bcfb3c665685c6074b1e5c3a81e38be1e2c3188325f2afb57d3a810a7', 0, '2020-01-18 09:26:40');
INSERT INTO `oauth_refresh_tokens` VALUES ('19bc6c9157b5b10769b67fdba0225c750d05607eec79c66226e7bb643faa70c3967ac2796ff2fc56', '38335838f8e43f9bcd8acd519612cbe92b8287cd542cde6b6dfac305eaac40d6478ad14abc2f9447', 0, '2020-03-27 03:58:41');
INSERT INTO `oauth_refresh_tokens` VALUES ('1b7f8561100a5a8e2d0ab23c1242df593dbc9bb0c261e6bd6e23312a56c37266e55e8cc1af47f897', '9c38da79bff4ce623f8c9196717ff011ffbe5a50a1ef55b6bc64a78582388f1d9cc24469db2a95fc', 0, '2020-03-02 13:30:10');
INSERT INTO `oauth_refresh_tokens` VALUES ('1c24f2653c5daab35c775cd7acb9157a211343ef737f058d23280761ec0cd00d6b2d20631bf0f946', '572dcf4478be272fe4f750341ca632ecc1c26fed0ac5482e50ef4c7bee1b9bd9b3a2383fc009edd9', 0, '2020-03-03 02:47:19');
INSERT INTO `oauth_refresh_tokens` VALUES ('1c56794e87c1586295cd15d19d768163fb10a44ac5e17591032e3f5f623701b1c1334dc6ff4600e3', 'a64749cf2e10da7edaca7f9271cf9ae37d28677486fb7c3042964b71310df5e58e73d58f17c0c7d0', 0, '2020-03-02 11:20:03');
INSERT INTO `oauth_refresh_tokens` VALUES ('1ca4ab7941adc0116c27f0435bc6af13f382ac873428faf4d317de2884b46c8fb4ba8b10a8ad0f73', '67451ddafa61141b763e8047d9aff07a6de011fb1773f09520e24f1ded43f3e16726098b8b444cb2', 0, '2020-03-03 02:51:25');
INSERT INTO `oauth_refresh_tokens` VALUES ('1ce6a85d8ed77df0de7cb0beaf2aa783bafba484886ee17c69d215a5f6ddaeea6103edc1956bbd63', 'b4950f92f033a17d84ca5a0d8a60d5e241572691db7dff885045f01125fe1c963affa31d7846d805', 0, '2020-03-18 12:24:02');
INSERT INTO `oauth_refresh_tokens` VALUES ('1f76f9f1a1bbdf3fa36072a19c0d1657206356c37aa1cf7316c54e23a3e945396a13453dd397eaa0', '06c477746ce65471f38e80bb45508534592d0242c6eed1e90dc8bb5ffa7ae40c19828c2bbddc8bf2', 0, '2020-03-03 03:07:45');
INSERT INTO `oauth_refresh_tokens` VALUES ('20f529229cc192b6f1e89f79d2e7aab3d983b0d7dd4bec2147a1f46a416578a85fe9d6582a62967b', 'f9a7688ad30f29efbc78b2a6d7a8350591f6c884bccf2412e7aad0ff43f5b336f4d0eeb55ae96086', 0, '2020-03-02 09:36:18');
INSERT INTO `oauth_refresh_tokens` VALUES ('2130847b22dec339645ac5826046af75099b4c66bd1ea826531b49c0ba2c5ae3f57bac767cc1095e', 'cdd86c76e2981d90dfe6eddc4ac621b81958a804621496c3baa62acfcfbaed93324f14c740528c22', 0, '2020-03-27 04:13:50');
INSERT INTO `oauth_refresh_tokens` VALUES ('21443db1b47e9b2fdfd75c91d3d1fd64ef0cdb01f37601e3ff5db044b0718f0002100d3394bc5010', '5b9c566adf859dc8d9e574ed19a10b2408ce8f78af2a4b65d024735ea124bc4b09e6b8ce3e309616', 0, '2020-03-03 01:58:49');
INSERT INTO `oauth_refresh_tokens` VALUES ('21a98045de5faf3d776a706379ae19c922c1f97998b0e6f34a5e2e030f82c12ac0d3f12470dec811', '92c5b8e9b9b80ec499262f298b49a02f4504120faab85f9750a6e97403fed4d0f27b8cb9326dfc59', 0, '2020-01-18 09:59:41');
INSERT INTO `oauth_refresh_tokens` VALUES ('244d704ff3b386d44a8859bfad99b92835b0b749e6afb98465d6fccf7658cbbb0f9cbe7e01a8fcf6', 'c47c8041b50e78d5321203d87a909110d7578783c5e9462f3148640e285d17b67e0a82efdae4fc7d', 0, '2020-03-02 12:26:27');
INSERT INTO `oauth_refresh_tokens` VALUES ('2494d106195baedebdc610877cdf2508aff9b8987ac5c07c2c25f3a4ec28db41f7cad0e1b3c646b2', '4056ad1c07a23565959dda653c146b2a9b76b7e8d6fae4275906a65e5536a688b62d2f8f8a00bb5f', 0, '2020-01-20 09:39:08');
INSERT INTO `oauth_refresh_tokens` VALUES ('25766c6be46bc8d9c94dcf929d0d13abb2570755bc8320ecd823c8aa7617b2be6dfe1906fd35522e', '607846a4bd48c34056e5192212877fe2b70ed4f24e7b9c947588d5812bb4bc5f8240b139e973ae0a', 0, '2020-03-02 11:21:32');
INSERT INTO `oauth_refresh_tokens` VALUES ('27d96c3ebd01344530d487aa04119737dd52ace5b513d7d040c61768e2c67f082617ccc56bec8431', '50a5b67a2629a55e8e9a680efe75c9b1e6b88e6fff2f5e93adc1a80e56331c93d2edb157259a27be', 0, '2020-03-02 09:16:17');
INSERT INTO `oauth_refresh_tokens` VALUES ('27e6b7f8f5a310d5f88e9696406a334ad3b5319d0e8d04d3b7aa728d48ac850f8f9f783026bc2b7a', '92d632a00c4dca014f2b398d4dcc9e75591bd68be54e584e6cf4cb7b6a0d9afa357538c570027d4f', 0, '2020-01-18 07:58:46');
INSERT INTO `oauth_refresh_tokens` VALUES ('2885799a8f00a8392b274badfb6585d719353fe8f1ba0e835486b78af5f58d6d397670aafa77beeb', 'babdb98d86faa7792c89f7ad17747cddc578a948eefbe25a7d0b552564a17b454a5658dc390fceb1', 0, '2020-03-02 11:20:39');
INSERT INTO `oauth_refresh_tokens` VALUES ('2887f935ea8c9a31e67e852ee9d68760444b9800ad1d0d9d28529e04711d6016b7de8b0be7982817', '92fbfb60c53194723cf9576ed150f41296ed73f6d7dd7585d2efdbbf9f7bee75f3faea436b595984', 0, '2020-01-22 08:17:37');
INSERT INTO `oauth_refresh_tokens` VALUES ('28a0039305a4c9a74c510259f11ed355ca6cb51b7c9dd00cb56876f1c62bea76c187bf25fe0498dc', 'f40262e2c5cf73d0b73b672f344788be3fbbb2b64363ace285b443d3d1a995f16b342005b87e47a6', 0, '2020-04-03 03:02:48');
INSERT INTO `oauth_refresh_tokens` VALUES ('29134fcaa4ab2bf495736d4028a6f717b2d9c380ad93d3423d945344fbd08293877ab18612d5e270', 'd1d9d1cb75bf6ef9e17463c65c18e0e2837f29b3b1d0b4ded86661f0d3fb8e29b0cda5884f937ac8', 0, '2020-01-18 08:31:44');
INSERT INTO `oauth_refresh_tokens` VALUES ('297dfc44d318825f74630242f03c4722ee5dfc673e26da351749a072041071c029855b40ae653424', 'ee347455722cfebd7ac31ae302c0710b66e99f038d6fc4b670079516532816c43ad918dba611125e', 0, '2020-03-07 06:03:06');
INSERT INTO `oauth_refresh_tokens` VALUES ('299ab3a0d00854ec8d47a060a056b716f566294eb130ceab263a2913fc3ed439e3fe1d9a240c7044', '5dab7c96f2eb12c7b17ec325befa55d8210408cb40a6ec24f96f065869d07a11105222bffdccae55', 0, '2020-03-02 06:55:44');
INSERT INTO `oauth_refresh_tokens` VALUES ('2ac2f6bc67429662255502f0c64bec65bb0f7bcec0c52d7f75ae60c2f9312ac90bc49d9fc85ae2a9', 'fac71aee09435ba77bb86e86eaca6b10dc4270b4fe89e3b228f4b07abe751a2ec2269f555f3fc02a', 0, '2020-03-02 11:34:51');
INSERT INTO `oauth_refresh_tokens` VALUES ('2b7b5c5978c910e8943b9f055d34bb67a4280a70665c9a008349867b2c7fd5b4318119fca9ae95c8', 'c8affebb0900e0cd8ab1145fc417f603c616f1c2dd5c9f6ae86345453f6bb4b5254de6eb4cfa87e1', 0, '2020-03-02 10:57:04');
INSERT INTO `oauth_refresh_tokens` VALUES ('2c113a1fcdb1b425fb5d92c83950704f4ebe1d0e45d0345ecd97712384be900a7363295685284a46', 'edc6201357c062b88558f492cfd39f03379cb6c5f3cc61845bd0b702fd33bc1ae55b40c1847a0fcd', 0, '2020-03-29 09:49:51');
INSERT INTO `oauth_refresh_tokens` VALUES ('2d2411fb3b1aed20cbb804f07c82830b139beb0ff39fcdf5692f8be606dbbdc6dcd07c3897bc7fcd', '7b09ec6c258acfc00e7fd9c82854efa1eeed43a6c36f9400255076d29484a069c127a8c5265d6079', 0, '2020-03-02 02:04:10');
INSERT INTO `oauth_refresh_tokens` VALUES ('2f8b1c8347bd57808c5428fff6e0adc0033045a0adca99155fe3498527ec66a04088465fb7ae3665', '16d9b3ef1ea9f18a2fb0d4a9f86efe6b39810dbdd5996f8f8bad85dd508ab90df661c24555eb4fd0', 0, '2020-03-03 04:41:32');
INSERT INTO `oauth_refresh_tokens` VALUES ('30358aac7cff0a8b5275546aec18d4fd4fe1347c4d9f0b169acd445a59b5a3ea97fcfd1a3aa4247b', '46b1618026339a48b0dc24e7ebd0c34f23e9113fc0ec83b114f1ff657a435c2505a8f41216354723', 0, '2020-03-27 04:50:49');
INSERT INTO `oauth_refresh_tokens` VALUES ('3186d0ad9b6d44dbb94266fb52c53f31f835396af95bfe37247f8027c04064c5b72896b1beda4538', '50c74a5914b607c35a2cd90d58ffbd2dc167d48f00886791198491fb24c6f9f2f88a522b61afccb3', 0, '2020-03-27 05:24:21');
INSERT INTO `oauth_refresh_tokens` VALUES ('3190879a135fc172a6ed985ae199ac9eb93e813e8d8e7b0dad7dde8495cda1d554e419594d6700fc', 'cd69d22719d299cbabe6fa69e7fa6b3667faea98ce14605b3e012e6d597fe85acdee3c8c1d09f418', 0, '2020-03-02 07:40:29');
INSERT INTO `oauth_refresh_tokens` VALUES ('31e790e7444ad9e6c4abd71d83199b690c81bbbb214676533c0b7e29c3930effdaee300a8049f70a', 'b197189d0d4164370f2574184978267d8c165528a2559588ec6b59451066aa646c317a020aa93335', 0, '2020-03-29 04:45:59');
INSERT INTO `oauth_refresh_tokens` VALUES ('32355182d0e11f49830b5bae3eabc112f507fa3177df5d0bb5b6f3af76e9d389f41773fa2d7b5055', '2cbd5d91797d004637e90eaf1e8d570480eb9d8537b4df6f075b6afe2c1adaaec0527dacd2197c58', 0, '2020-03-29 07:01:34');
INSERT INTO `oauth_refresh_tokens` VALUES ('32a70bd92226f8f127efabc256acc55bd0678ad4b8179d3eac8f47b66f5c693f55a6726f65133d3c', '67cfd6d576aa730d44ca6710cab14e62722991a977d872f779b0840ea4598f5bd1dada24dfdc236c', 0, '2020-03-27 04:50:30');
INSERT INTO `oauth_refresh_tokens` VALUES ('362d7f064bbaaa15efd20f9c3a72970871271f85658a3cc36642b0bd35e8e8c1cd0f2d177bf2dc64', '819692de50ac2a6d0d6a51c0791783a873487300b5f4fbd137ac91abd351b8d4e5568b2327a05c41', 0, '2020-03-03 02:08:35');
INSERT INTO `oauth_refresh_tokens` VALUES ('36db040c07717dca7de29cb8c1d426c5e6c5ea7e1fc2802d5b21d96228909a21b23c751409240185', '4a6fd9101d4b20641c6e4ad7f6beb7eb09ac836cc1f696dbab973a34e264174bd46b3a46b3defd72', 0, '2020-03-18 12:24:14');
INSERT INTO `oauth_refresh_tokens` VALUES ('379eaa88d1616445523544c0caefa28d4961905f82224b883d8ee76e155871de54af827479c0e8f0', '3f13f45f5200a64061ab69d84aa4ab668ba76aeba705a40d55d9d69c0017a036a32146257da3e785', 0, '2020-03-03 04:41:43');
INSERT INTO `oauth_refresh_tokens` VALUES ('3908962da4f094ad28d045525aa71adea8d3874f0b23439dc8b6ebc7385b3c8049fcf486df317e9b', 'a70e8d0acfb2c388aafebe490a850d705fc8df9ea90f51a6338d2354c2ec4594a3ee5ee32c82231b', 0, '2020-01-18 10:21:04');
INSERT INTO `oauth_refresh_tokens` VALUES ('394e83a40db00e6e12db74f1224a279c86e451bedacd799f481356e134d9ef4b0966a519f3bcf165', 'd530cf01f755cbc5f03005a3d4f2d4141a4880468e6c9ed72cbc3f726d89ad1c92ea8487e21d9c50', 0, '2020-03-03 00:48:21');
INSERT INTO `oauth_refresh_tokens` VALUES ('3aaa4155852b97037270f0c3dc2ce1032317cd617d2eca81c17b66ba223e667bf7641f4cc2ee322e', 'db5341ea8f9f2bd50bce5caccd6a3c28dbe251096e53e64bd74a141197bdb747b02217019a50d28d', 0, '2020-03-03 02:39:04');
INSERT INTO `oauth_refresh_tokens` VALUES ('3b89e27f664a76ff27b1d429dcc374e644832e576695de2e793b3745790ce95b8dab64670409a514', 'cb2294a3bea2645699f78b01f577592cd1e4236774feb59528fcc6d42eebb51287b5000703769868', 0, '2020-03-03 02:19:16');
INSERT INTO `oauth_refresh_tokens` VALUES ('3bb2813adb59bb9bddd81cb719b6b61f2f6575d72b4a5e4a976fd541afd41cb7675185d00cf8dff4', '5155330cc4b33312a04c47938d5a3fc30051cfb5f970da320596aeea0b93711d2a8c269157504186', 0, '2020-03-27 03:53:13');
INSERT INTO `oauth_refresh_tokens` VALUES ('3bf14338367222e02b2afd943e8cdc24834726880b2f3f39baeb07292e2808e0117df3c1ed8ffa8e', 'c228a3c6c4cfb480e18ac45784f5614a501cfb0a4243e552f076c6f45246d48c085983eff822dcb8', 0, '2020-03-27 12:53:36');
INSERT INTO `oauth_refresh_tokens` VALUES ('3c7ea4b2cb595390cf6afee46f1886329068bd0e46b921c0aa9f2499dfdbfb171a02a83fe6ec1b77', 'e883087cf60a8944d2ba927699b73b3b1d8079aecaf2b4cfa0d74c9441eafb94dacdfd2361b60cb5', 0, '2020-03-02 07:05:44');
INSERT INTO `oauth_refresh_tokens` VALUES ('402af13f59876fa2ff4105985a93dc92944646d9eab4d64a3c7d5f18f97b487bd178e21496c3e1a7', '2c19c8ddd12e7bcf3d4bb80e968c0173866f1ce8f5a550488c6aba1e4dfdc36a280ac8e50789e696', 0, '2020-03-29 05:39:22');
INSERT INTO `oauth_refresh_tokens` VALUES ('4085f37b948cea408608879f0f3bc8c1787cc2204ed4c8cfdda8162b89f48fcfb931b83d6f5e888b', '8eb70486a53cafd1f86e57f3cc49024b6ac6e6c12a5f1b9b6e4aa139df3a7ad588eb0bcac31a21e0', 0, '2020-01-18 05:24:50');
INSERT INTO `oauth_refresh_tokens` VALUES ('40e9b64bb2bed2e1b849add32afec2191b78d7803b59f5f00e9525e6afd642fd707ae04cb9c6cb87', '65b5fc72f39c6a4f1e11c36d616e007b323419da14ca0cc7e35ba532acc15cb222464b956295ec09', 0, '2020-03-28 08:15:13');
INSERT INTO `oauth_refresh_tokens` VALUES ('41c0476d7ff098b7ce1bc30220ac98578858a81e6b9f55c51eec6bce892c7b614c41499654f20096', '97114a6118cf9f79db6d4c2af3e37c6d9558d3fd2f227cb8cfc6d2817404be89c252a0dc7b4c4a6f', 0, '2020-01-18 10:30:45');
INSERT INTO `oauth_refresh_tokens` VALUES ('41f2e46c154c24cc0f201f9376b2306fee6483385313030739477e9cda3574fd5f4ecd968772e8a4', '69f6a944e130995c949f75ab3f64e07d1f17accc0f7bedb7f048f871b713119c0a96f6259ef26cc7', 0, '2020-03-02 09:37:15');
INSERT INTO `oauth_refresh_tokens` VALUES ('42de8c65dfcbd83c2c405a74e428c16181eb56a5c4add8326b26310efe4aa2b6a016a96f930c085e', '031cfb6a0058af12cf1536113cb09b00dafe301ff591672f944f0efbd0947c1af9e5095f26d59bed', 0, '2020-03-29 07:04:45');
INSERT INTO `oauth_refresh_tokens` VALUES ('45b17b20ddadb36eead02bd2ad8e5038ca328b49ec2bb5d54aa230f8883817803ec971b98a762efe', '51d4cc181b25e212822ae7555b5ade6e1734d36894a01e1ce70c03b41808b2f70b554c4d85e80d58', 0, '2020-03-27 03:53:23');
INSERT INTO `oauth_refresh_tokens` VALUES ('46c41d851ddfd82636811fcdd374f9058ba0154512646c5281c7e287ef0646e7b086057bab83982f', '302575183d5573b3d81fdc7a543dda3fdc817788de592f03d68ad80846d3a8d5d6ea4b1e341815d2', 0, '2020-01-18 05:21:21');
INSERT INTO `oauth_refresh_tokens` VALUES ('482c5211473345d073e4aeadfda25d6976c50b59018574e541a9744bccd4c7f7025078baf2236e69', '39109150a9a4cb4915ec8d9f28ec98011698784bc8e2b22f26404fb4241df446cac6d10cb78fb4df', 0, '2020-01-21 09:05:31');
INSERT INTO `oauth_refresh_tokens` VALUES ('4ac59c0c39613669d03c5f991e31155445ae72cc38c7a28763f402832acdab9da178175f4e2d22d7', '2b4298466a9836da3e71741b3ee7b61dc0a0cd4c97f08304d443439df4cf9178ece5ced527d22c2d', 0, '2020-03-02 13:09:37');
INSERT INTO `oauth_refresh_tokens` VALUES ('4b9d93395bbb1228ed9ccf4189ca636ab7580c2a1fc767827679844f8801d3392f67ece3da9ea267', '0f9e5b1c8f33b9ea8f095a89f54798086a1357d4e3774659dd355be84565584bea5c3af63c14cb0b', 0, '2020-03-02 13:35:15');
INSERT INTO `oauth_refresh_tokens` VALUES ('4c4931397c0dde13aae5f02c7f38885221814aaf6a5df58490654cc4938c278d93682234148379e9', 'b7146b70d128fcf43e3d12bf95eedb72d4b63bdf045305b17e1553391476abc701173a4eeeed6ccb', 0, '2020-03-03 03:00:08');
INSERT INTO `oauth_refresh_tokens` VALUES ('4d2261179c201819cd1c21db69899714ee8384f6126163c1a7b7cbf0899685bf2404adbf47b3edb7', '9ca16d2789ccdd65e349a3a602fbb629278ecb4d26f36f25beb5cbb38decef169959a74dbfa5dc4f', 0, '2020-03-27 04:17:39');
INSERT INTO `oauth_refresh_tokens` VALUES ('4d46b2884f181016186a1060a597e1ee1753d5b0dfdf8c44c4e16c404137ce0ed896a3c3261a91f7', '5b4cb2d64b5eb95230390662fd37ffffae53553c97492fb48d76a1c73306c76083bccb5df5d52836', 0, '2020-03-18 22:44:29');
INSERT INTO `oauth_refresh_tokens` VALUES ('4d77ae30007777a93ecb15b4b29588f5660855d34cfaececd8700e4b6ba33a0783f849820c25433b', '9ab35721fabf428cad02ac4eda56dd89848e10575974372f29c19f4775db8aedaf0b03dd47d7d534', 0, '2020-03-03 02:07:05');
INSERT INTO `oauth_refresh_tokens` VALUES ('4d9997b9846d0eecb7424651a8d72d571c785506a04f8da29322ca5da23af8fc54054d7cde1370c7', '228041e912554a7ed90c109cca203d7b34495bf330172bcf3e227565ec19c045ea592b6e5287bc0e', 0, '2020-03-29 05:41:45');
INSERT INTO `oauth_refresh_tokens` VALUES ('4da86c2aab92adff2a6004ad85084a80eb44ef3258169a33ce7fff6e526b03ade8903ad88e9045d5', 'd6550695ae0772aa1238f2eae59cb54b360881d365015185bc074bf56d8f13eda4dde3af6b3e983e', 0, '2020-01-20 02:52:19');
INSERT INTO `oauth_refresh_tokens` VALUES ('4dc0a0242744106c48f52157481d12539c49f9e8a5c25b560008b5cf55cd9ae74a6b0fdb9e084baa', 'c0488cea9a500ccf6c76a10b09174c3a771a839045df03d7eeb368ffb9fe3c7ac48ddea9454a70e1', 0, '2020-03-27 05:19:11');
INSERT INTO `oauth_refresh_tokens` VALUES ('4f78026fb2c5608807a675715471b3c93451ad3700c60e8988e59e94bf911e6e5ba1f0271683ae94', 'e655ebd8923376a109eb1d8963b200577f2f9167cac9c8a24f3a832ff51dd4d614ac363e3931fe36', 0, '2020-04-21 08:17:35');
INSERT INTO `oauth_refresh_tokens` VALUES ('50b3dfeb5873c92362e47ed81b8070c63fd6c91558e96e2ea0c133b63e1fd6b1242655f02961eb64', '40d5fe4d99dc174e57fe594bfbb95f61d2d5f12b4be837d56bfca892b1fa50ffdc1ee55d253ae8d0', 0, '2020-03-31 04:38:04');
INSERT INTO `oauth_refresh_tokens` VALUES ('51998485fd269afd5fe0b181550ae6b7ae517494715fdcc2047b98b514fc1abbbec6405c6661513d', '5e8ae9ba16593c72444fe3c3ec55951c982f296a59409c04df9ceff787a583e1d71749bdae303f0e', 0, '2020-01-18 10:01:16');
INSERT INTO `oauth_refresh_tokens` VALUES ('52256de6d8ab2da4d70e5de1d61e03be41970c5f35cc080090a201f83f08122297bfbc970a53b475', 'a23465262173186be60b01eecba7fdfe1aaf80da6ae251689e073348c814971d4d28b470b2ea474f', 0, '2020-01-18 05:14:02');
INSERT INTO `oauth_refresh_tokens` VALUES ('5539c44eeb6b7a8551126597fc25fb413f3ab6d9855f77d6fa25a4965f90fefdfbe38ecdda67645a', '504cf33e80662ebcaeff095b0f79a2a49b9657ddb866ab5da5945d7affaeffd461f2fec749b0a7cf', 0, '2020-03-27 05:12:51');
INSERT INTO `oauth_refresh_tokens` VALUES ('5650331904aaa592e9913dd09d867ed7388cb2e64aae5f114d3bc8cc864e23b053c1b2d6d7822821', '91fba6ca938d6152a1945f7092fbd7167210f5c5fa37077870c242d4430e7de2afb581a43190da74', 0, '2020-03-03 02:07:48');
INSERT INTO `oauth_refresh_tokens` VALUES ('57c1aeb9d30e09a1be57914cef4abd0bfd6c57071e7ea122929143f939032972bc2cc8999594502a', '62b1b5e0a76d43d404f9d3e9086a583c309dca887cb319a593700be6e3eb2ca9ecc00faaf8e837b0', 0, '2020-03-03 02:29:15');
INSERT INTO `oauth_refresh_tokens` VALUES ('5901486a860716fe25954b7b82c43fbf782548605978fcbba3c6f239af5823a273f37826fce8d4f4', 'df3a742f88308a6a2aa0fb66e87bb9daad5d111f0f3b9563677d0dad954982e5d5837b53c50a55d3', 0, '2020-03-21 08:57:22');
INSERT INTO `oauth_refresh_tokens` VALUES ('59a25c0f80b977e378d05be0c244e3c5a75adc1a6c57079e2d533371c1c1bac714f76824ae1b0c55', '1223efd5ad4c8b97f90277e34a0a85ec7c88985eba1f2b0df448cdcdfb29f280a113c7e47f3ab8db', 0, '2020-03-02 11:03:43');
INSERT INTO `oauth_refresh_tokens` VALUES ('5a9d5331e383694c9fa89ad70356cc89c06de4a59adba33db5b5e8ab42fd166cb0f3cb0dc3e9a847', '71009c7a88e2c5a01296d16748a9173226577c7ce0e379c451a78a677fefefe4de0245816ce36164', 0, '2020-03-03 02:47:25');
INSERT INTO `oauth_refresh_tokens` VALUES ('5aa2fb3e28d4d0a6e031eb5e242178d3989a1d978b3fffa289108facf99d3754840734d10d97336f', 'bbcf307d15396791e979c05288f24fcf8026b49463fc0a1be371d6e9e40d855fb1ffcb9629acab29', 0, '2020-03-02 09:08:16');
INSERT INTO `oauth_refresh_tokens` VALUES ('5cb3621fa88add171ea525abbd168cff95b4e0de6098c0e7f976174d06a5d2814ab59bfd7dcab72c', 'febe3f462a4403891e494e20ee5915885235f3113cbc484344805bfa35b0bf4ee8d6d72ae316b30e', 0, '2020-03-02 13:33:56');
INSERT INTO `oauth_refresh_tokens` VALUES ('5eaee6362b279565f39baa78e17f23d142fc014f53d8db20dfb9af4cbef43f0b2b60678766664a29', '68cced90df2b2822f54736821acf7f62e47f8f01341170974c4f314a917551805ebef42f23a654b2', 0, '2020-03-02 09:30:59');
INSERT INTO `oauth_refresh_tokens` VALUES ('5f024e777d6aebb451ca219e441421470d70f71f7565afe9bfc7fea89b732900b73c277a70e971ed', '2c0d2d36f3dd97da9f36a1406e4bb5ea4f329be461c27af3c0ea6f5a3d8f92971989fe5b56b67cfa', 0, '2020-03-02 11:13:18');
INSERT INTO `oauth_refresh_tokens` VALUES ('5f7add28fa2812b44c8c055359671183605e636037793e7bb732ac1d143ffae2458572faa8eed2e6', 'c287482aff9270a7e13a4d8a01dfa28c6b060e96f10b7d892d07b48c5eafaa1d7a13aa38c0124a9d', 0, '2020-03-29 12:55:09');
INSERT INTO `oauth_refresh_tokens` VALUES ('6264b1a7ca66bf22c8c94753ba8b0865313f708216f03602a6090891669b44c31f0da0721ddb45b9', '8086933cdbf07b016ed9520598f868328193e654d64161adc751a75171e3da591d127434bdc69b1e', 0, '2020-03-02 12:14:25');
INSERT INTO `oauth_refresh_tokens` VALUES ('640a93716ee6383bfaf5f935565a2873b0efb398f6204b07a0beba13a989b3d678061488764bb201', 'ca254d18f6078ec0b45aa1ba8ae5ea3647c14a59df7f453431a3e81555a4ad996ecc79321ed7452e', 0, '2020-03-27 04:52:35');
INSERT INTO `oauth_refresh_tokens` VALUES ('65e4da7a122c9ab9cb60b9de1009e617170a5d2d46c3e9a194b733cc8f6847bfdfb463d39ea3d886', '4b420bbb16d36fb7447f798af169ab011cdc28cad71cf7148b716ecf6012532fcfa69bd265f4a402', 0, '2020-03-03 03:02:42');
INSERT INTO `oauth_refresh_tokens` VALUES ('664b37319dbf4d4d7d38601933d799a28af3828fcc536f5e7a69dbfcfce1de8d2eca4c0f6cb18ec6', '0a523043049a15f4beb9e9c7269ef563107e9b74be4592cb16bdb18920af862dbc88b9d231b60e17', 0, '2020-01-22 01:21:17');
INSERT INTO `oauth_refresh_tokens` VALUES ('684d5ee4b71eeb2b0e1c4161352494c9db2fa99c0ba7db9feff8746835620ff0f87c5622887d9f5d', 'd99874f07ff233e3162d07676cc81dfa89eb4d9457337392cb2a78f62a1c50b7079044cdb667f86d', 0, '2020-03-02 11:15:58');
INSERT INTO `oauth_refresh_tokens` VALUES ('68971690a59414845cb1e22a9969c7ffca2f8dd140a420d98354711ea22d5b542bbef5f9611ae399', '07a7b1f1c663e8f5fcf24e616a28c14d3c3b83a766c3e48c1d226da690dddb9e008154b1d1ec762c', 0, '2020-03-02 13:10:39');
INSERT INTO `oauth_refresh_tokens` VALUES ('69ade4127fc185eb2ef740e8d5d2ae844bbc8c6dc639751d9bfa5b03087a9ffe06014e452b790a49', '984be18331e7f9c06d2f1d510f58262a495c1e4940d9c5e35c09c95ab0313bbd80ed0b0d96549ce2', 0, '2020-03-02 13:31:35');
INSERT INTO `oauth_refresh_tokens` VALUES ('6b1f171f7802e1a716982da383bdec55e53311ffdd965290a328e41ca4266accdc2fc29418368bcc', '44d195dc6a27376e3b0a16f3b9ae5fe74517f5c7baa39d134f248c54022b323b5c76acf7d10f1990', 0, '2020-03-02 02:00:26');
INSERT INTO `oauth_refresh_tokens` VALUES ('6b2711ce4947c41012574883840311e193094a1981f1ee1279cb561e37678ca3da57eba091bcee86', 'cc26e8748b7f152596db85c67c9ab505e042f25d2fd5bc074c28ce92d37fec7de0a0ffc8ba8af62b', 0, '2020-03-03 06:10:19');
INSERT INTO `oauth_refresh_tokens` VALUES ('6bdc9741543f88646b34989abd2f9672b33463ff03a855ec803ef471dd01061aa261ba57c847da37', '3310018dbba4099351647204d59ac50e595d12294fa97b2d8252ba1969a0f73889cafeabb0326991', 0, '2020-03-29 10:44:41');
INSERT INTO `oauth_refresh_tokens` VALUES ('6bef8c439f2fa21e2fba7cfec0a3715ab5e4bc061fc461a6abdb50de00d62a3dd5beb9fbd7bff96a', 'ef271cea4f3c979942d86feb03a716eac775f4e28f299e225bb369d64722426de790215278f58a72', 0, '2020-03-29 10:43:44');
INSERT INTO `oauth_refresh_tokens` VALUES ('6cab56a050f35325af8828794296d21603eb4a935a877567e896777bee342ee88f89523ea4326403', 'd77309572732f73c41cd66692c7f5c95a674562175ace7edccfbef63a32a80ee5c2e0d77db27b468', 0, '2020-03-03 02:29:25');
INSERT INTO `oauth_refresh_tokens` VALUES ('70162181d3aca60a689b5ccf237ee8cbbfbe054fc8df3670ade50600e01f9d9d8f13a09b74dd5832', '2bae3556ad52ccd0c6427b30a6cfc606494d1c430ad65cdac33a52d5311ab9eec7cfc31e15723ac9', 0, '2020-03-02 11:15:52');
INSERT INTO `oauth_refresh_tokens` VALUES ('7028870df4cc0c2909c85ef5d1807c390ce640ecf87be861a594ae7e3296cc2de6a7e25153535dbe', '5ff20be6ea04932080841d2de08cbfe6ce6c1373ad35c4423c24219b8889b85ddd2d466e9d00cab7', 0, '2020-01-18 10:13:46');
INSERT INTO `oauth_refresh_tokens` VALUES ('7174d149bf101c328d5a4816e3d877c86112052d2f8961d17c21167a5455f2788fefcc7c3239982a', 'b3c75efddb252126a3c2acc56d0c2aa07ea761b672457319bf62ed61a1ebf9668de81c8e8d42fa13', 0, '2020-01-25 01:07:57');
INSERT INTO `oauth_refresh_tokens` VALUES ('72369d6beeb35fcf62ce06a856f0d293847bd4f650f23fd3108e77e7bb7a09b6fd9b731648f53b38', '0d2a0871c5bba9fa816467ebc4525dc3a1ae55a1a27f445a5faa7a7241c8deb6a19f9469c4069976', 0, '2020-03-03 06:24:32');
INSERT INTO `oauth_refresh_tokens` VALUES ('72ce4b747b3163487d18dfce9076888aad0fbb03c8df69917763a32f82c8920eed7aa236236527e5', '9be1568bcbc27c0409032eedb4f5a6b95f4e28a9b237fef6aa44321b4ca4ae2937e54f03827b057b', 0, '2020-03-02 13:34:30');
INSERT INTO `oauth_refresh_tokens` VALUES ('72fbc21dfc6429692bbe0de6260fbc5ead1ccc3da8d86cccbdd4025de8203bb51240c8df199e11ab', '93d25c6e696298f99841545dc157b19699a9815604accb90b5c65ee5ed312a9a41b4315070214dc7', 0, '2020-03-27 04:39:45');
INSERT INTO `oauth_refresh_tokens` VALUES ('76bc0a5ce23200c1df517c9fdb99ea82bdddae4db4d4e028afdd19a4fd61e1caabc3a001bd505181', '458359b34a126ed4a23b5b1fdc9204b7fbfb5e9d9a5626dab7583841f8de66769ae5da3fcd83f93a', 0, '2020-04-21 10:42:24');
INSERT INTO `oauth_refresh_tokens` VALUES ('784f2a2832d2b8761c275177b50739010306e78a4f363a5ac4f81a42d548c86b4509455e15fc49af', '7e9acb19f2e1fda5b2b9f84ba1d277ae7821d68c1f88f468f989b78eb5f0a20e2c3be1ac1378798b', 0, '2020-03-27 03:53:13');
INSERT INTO `oauth_refresh_tokens` VALUES ('78e0a375d15886b7bc7e06f7fa79ad8597d328a139e8d71ad9c42261f2a3a6aa81bc9d02648e5b3a', '7576e30a0995f24340f59204f5ac60bdc47f10b11ba6b304ed5eb442c9761d747e6376d69074d28c', 0, '2020-03-03 03:00:43');
INSERT INTO `oauth_refresh_tokens` VALUES ('7d885f61724d4747de7bd34437d550c2276dea4080cf9af8aaa77408985fe6c9d9aa87e1627fb97f', 'b8bbe9313ddc39a99495aae8f7f8dbc1c90bf645ffe2aa5ddb8d67f72a8c89ee5237fc4d2a3654ae', 0, '2020-04-03 02:58:36');
INSERT INTO `oauth_refresh_tokens` VALUES ('7ebb4cb33aec54358409c11695c1cc66142b4e0f928317f63eb9f6d1939a0b4f52247e25baa4cfbe', '86785ed54f97ebf8277da71a3c728eafc85866f6b37415f3409a5940d52a4b9ef51d1a0f7c55ec80', 0, '2020-01-18 07:58:23');
INSERT INTO `oauth_refresh_tokens` VALUES ('7eea7997dcf122fa2b4e8de6943db7c9efb17154c1c2b132b02c3d0ef2ff6ced4514580826b8e8c9', '8f90a387ad76a59be9777edd0401aa5b57ce9c0d436d2e2fbf8077ba1a2e76d0c4108ddeb0ef559e', 0, '2020-03-27 04:25:38');
INSERT INTO `oauth_refresh_tokens` VALUES ('807e367eff1539fd74f37cbbcd67f64f034e8c02e4b5cbc7cd04a0968a9d8a885f0e3ff052e9f14b', 'b864114d91f816d9a441db25dd21c0bfbf9198d600a45cf13775dc4323b9024d906e9a47a28a786e', 0, '2020-03-27 05:09:35');
INSERT INTO `oauth_refresh_tokens` VALUES ('82b399704f5a8899c6657dc730000bce0502c049776c519ad34c77fe59c67fb9f38a6cf431849c08', '3fd0c0ebda540ab98ee2a14471e37e3e2fa5d97684bf814a2c7bf80f3a6d29fcad8263fffc593f86', 0, '2020-03-07 03:28:56');
INSERT INTO `oauth_refresh_tokens` VALUES ('83217c76c30b4225963cd6286ca4b205efd26a55b772805f58283d8db48a091e4b2faf2356faf389', 'f51c36caabb5d023bd914789f0685b6accc853dd6c7df91b5565c151d820062f46042d2c65363108', 0, '2020-03-27 04:40:43');
INSERT INTO `oauth_refresh_tokens` VALUES ('8400c66e5e4aed037adb7335a7384d9d9b1aea4e4840e9e43dbd646a2629dbaeed20618a694e4838', 'b1f7e591cb9be67dffe7716bc5abf2db6a2fe15c88692b152e03ed4e34dcc6521a124badc5a1f903', 0, '2020-04-03 03:02:48');
INSERT INTO `oauth_refresh_tokens` VALUES ('85f6da8e471dc77705c075546500bd4f5c6d097201536d563cb987616dc5e11a566810e2ff11ad75', '91bc08c1cf7bae09fb3d1b29d6999cd4a370a8c228ff0edf43ccbcf76d9a861a4da8792386403f11', 0, '2020-04-21 08:26:57');
INSERT INTO `oauth_refresh_tokens` VALUES ('87816a450c47e551ddbd658f18af0e0657ad3a73968a2327be987b657e8464ca101e5fe7459ff90d', 'ae82e12e6a935da7ee165432171b38788e0008a068d7b31b29fd48c5136cab3b14193ab259615e85', 0, '2020-03-02 07:40:36');
INSERT INTO `oauth_refresh_tokens` VALUES ('88309d40e9bcca7886d9180af1dab722ebe4247244d6a242b3a9d8de01fdf38b0bfba0c0724c5411', 'bcbfba26ff64a7787153b994bb5ddccb300b9d7f1a4aec447b0ee8efcecdb090b28c392c642347a3', 0, '2020-03-02 10:59:47');
INSERT INTO `oauth_refresh_tokens` VALUES ('885446b14eaff25d62f588da2b044a19b272e3fd8652a5dad1049e57cc26112c705008f44597ab87', '842dab36cc5c2646f57dacf2402d10155a4cbf632f425c35bd9ecf1e36c9003f2d3fe4d30366684b', 0, '2020-03-27 05:25:10');
INSERT INTO `oauth_refresh_tokens` VALUES ('8b294837e459f3530d0739b7116289057116a1325ae62e5b53b91d8cf84a5ee457e69e29ad56ea61', '2e57fceaa328dbb4c6f00ab77efdc47d1d4d43bda1db6f20945911f766c85e178b4bec52883ad308', 0, '2020-01-18 11:23:37');
INSERT INTO `oauth_refresh_tokens` VALUES ('8c5d0a4ad5cafda42895c9bed28c5e536b241adb7dc87cafd313e44c6377e4c172f47a316c184f5a', '2019376e51e3adba543f0cc211b91dff82db18e160688715cbedf8d0e701343669def482dac18032', 0, '2020-03-29 12:40:50');
INSERT INTO `oauth_refresh_tokens` VALUES ('8dd9845f423cd9d3201631dc3d917132ca78ca8ed165e7bb190f148be51d5d1ecd8b4698eca09c2e', '19221d813b058f0c78142da93daa6d04dc5446fc91183abb2de9a25dbefcf72dd697f9ece526070a', 0, '2020-03-02 11:19:56');
INSERT INTO `oauth_refresh_tokens` VALUES ('8eb224a8e915753c92f62e7b36b380ea870bfa357f7d11c1ea3cb6cc1f18ab8c56384437d2709dbe', 'c89b07e244fa3a31fc859a47ee05073e6c43833dff0e0fc87c43d5fbebe87638715509b4f866ed6e', 0, '2020-01-18 06:43:38');
INSERT INTO `oauth_refresh_tokens` VALUES ('8f55e8f6917ed4fe56f2bde93694e4ddbd5c88b4db3c4e7d077734621830f1db39d76a819586d385', 'e58e48729e95ceaa9f86ef7df4ff02a8752b3f62c19930ca92d68a036da5d81a7faed8b9880a7c97', 0, '2020-03-02 09:35:05');
INSERT INTO `oauth_refresh_tokens` VALUES ('8f6983a64828cdc0bccbe5703e11bb643131bbcf083bf62a9981c28fb16a375c115cd0fbab4b23db', 'ec7fec1215a8da54d24e7aa3e322d746dd5402838417d2595331876d08ce50d059b241d5f3e20039', 0, '2020-03-03 01:23:43');
INSERT INTO `oauth_refresh_tokens` VALUES ('8fba523d0612f7be760f76d72b1c5c8bdbf3b0806b6d5eafafba6933032359704dfb42b677f927c9', 'a87446a48d124e4af483d33d0ac550aaf6e85e22115e85e14f6a979d9fde327ce575dbf92646ab16', 0, '2020-01-20 08:11:44');
INSERT INTO `oauth_refresh_tokens` VALUES ('8fd73f53cf735fe2e734c01a3191abb33d7f915a566e99dcb2f6401d1758ab0d89f08007a53dff06', '812a7c2843bb0f316a3f9f47174c11d8d31789af008237ead251d5050bfd752d32a1532c66bc5e1d', 0, '2020-01-18 05:13:52');
INSERT INTO `oauth_refresh_tokens` VALUES ('9291264056ccd5f6566031ea20fd4231bd0a5f564a76dda135c83ba3926a0cb4e493a2245c449de1', 'd25603ed30a59435b21f318771fe8239aee764eebf66ff964b627591ea7281093a009114b2ce8699', 0, '2020-01-18 05:15:58');
INSERT INTO `oauth_refresh_tokens` VALUES ('9306e3d79b5c7933677bfa3d81b89ae41abebd41efe9e62a06649f2105a80cb1a00b83ac50a1aca0', '6fe1a8964b0f423abd394c6bb718a4b52543c8c70ad5ce93f9d0ca106296fa04b53c5c20d144e90b', 0, '2020-03-29 05:41:32');
INSERT INTO `oauth_refresh_tokens` VALUES ('964824d7d2cfb89f675524b830f4ff0a20633300bd599ef0c2543a7afbb3fb60bc1866f482e5dc98', '13d3358040771bb54576725053f13c921bea1ce4d7bb95fa3bc340c83d64018fea87aa49ab980278', 0, '2020-03-01 02:59:39');
INSERT INTO `oauth_refresh_tokens` VALUES ('96cc2204d110eb7d048f1b00a3d1a0bca8efe82fb430e28f8b69d7919bd76be8c50d8f8f2e02caf0', 'a086cee4869eeaeb7346dc7cca244048ab1afb460278889f034a9d422fe36ca4ee7cbf080bf16eaf', 0, '2020-03-03 01:08:14');
INSERT INTO `oauth_refresh_tokens` VALUES ('96d3b87daaf788a0c7892316464cd9ad301e227f7caa4418875f93f0f3ec99d60804614b9f234316', '73199e77ca38956c21ae9f6aac8f40d75476f531f1e390f285cd1e4458624a6ca9ca012a1a0b6bc8', 0, '2020-03-29 05:39:30');
INSERT INTO `oauth_refresh_tokens` VALUES ('979f921f73f310bede5daffc16f2cf948d99e0ac737574c573ea706c4a82f63def7a23700c5c4694', 'a2b557117d37f0a8d7cf9cee073bbc20581255b60e1b9656de972cdd155e3797c3e2e3160e57221b', 0, '2020-04-07 09:27:32');
INSERT INTO `oauth_refresh_tokens` VALUES ('97e42a65f4ea342d6252e6e740bd3e26f9de513f1092dd91ff5d5d127275b4cf432cb643a69a2264', '24404252a7fa3f9022873ba054c1f00b7593c5543b3ff87379341b716c2bcc5e7287472e0d01af2e', 0, '2020-04-21 08:21:41');
INSERT INTO `oauth_refresh_tokens` VALUES ('97e5276b07fa87c3d567fce8025d9d6c9c2b1d96e103da78b6a5c1922e2b2c339314c628c99d9622', '7c9681d94dfec59b1943a10439bd051931ce176c9ef8623cb60c2a7f59dc4616320c284bb912386f', 0, '2020-03-27 04:49:34');
INSERT INTO `oauth_refresh_tokens` VALUES ('98a2d1186f322937eebb1c709d6e45185a192974659d08c2d4350bbf9d66794fefbf259d18fbd203', 'fd79b049ea36718f0f1fb0e31fa632ff0d6c05d53fcdb940cbf51047cc2e0ee481d43bffc9aa3359', 0, '2020-03-03 02:36:04');
INSERT INTO `oauth_refresh_tokens` VALUES ('992ce38fddf3257b4d665095a2e30132fb7e15a3b24d8add526bc3e7a2bca64aa278af65a3bf46d6', '4ddbe74fd497160d964f94e61ed23a65ac7d91e7a102a3dfbfec420cfd32e5a70fea48807dd0d594', 0, '2020-03-27 03:59:03');
INSERT INTO `oauth_refresh_tokens` VALUES ('99e73260be7217f5c30567951784491e203218e5a4f37f5a072f8c8943500cbb651357cf3346b44a', 'b685fc29369ce5aee2cdf0b7cd2513e8a6790311a5614667b269246e5f03d41507cf912ce732f803', 0, '2020-03-03 03:30:44');
INSERT INTO `oauth_refresh_tokens` VALUES ('9d2c792045b2fb76d9080296d3afc0375cb9ee5ff9ef76c9fb902224ac282412af0008dcbfb4279d', '63115c0c2d9041556e12329e51fbe164c8c804fcbaa1fadf6efdc376a0f72c9b6c54091de7628c38', 0, '2020-01-18 10:11:38');
INSERT INTO `oauth_refresh_tokens` VALUES ('9db1f3a502e413a43a3538f2db563bb92176d776eda4e2b81a2f90eab8e9777ddb7bb5c1f49638cc', '99ad09409f03064bcab8645e2720592262d5112eea5ebf78b75de0984df7297806a582258c459fcb', 0, '2020-01-18 08:15:17');
INSERT INTO `oauth_refresh_tokens` VALUES ('a081ca8828cb29ef3f75048ecce6c9852c8f46260935581f487fc42ddb647915c9b320c1722c9e6e', '878f3cb6cee12dc21dc442aebb214fbeab85b978b425e21d1d27a09b818d79a3f06b246558f15211', 0, '2020-04-21 08:28:48');
INSERT INTO `oauth_refresh_tokens` VALUES ('a1947fee4166be3a2d5540569c79a60da5b848ef7e86a831f8edbedb65b07a8efbd18a0e2b58ac8c', '0e14519163c7358859be0c74c438e44012b1a866eb83fbb2e0d6b02575eda3357045f2afaab0cd3d', 0, '2020-03-02 03:06:40');
INSERT INTO `oauth_refresh_tokens` VALUES ('a19caeef9aca64c30470b76fdcd30360c951ee68c2eb3650092b62936a0490b90459e519a7523d2b', 'a893b0e1d073643b19f89b2363602a7cc812b82e3177cdecc22b9adf417251720b6510d0c7a28eca', 0, '2020-03-02 12:26:18');
INSERT INTO `oauth_refresh_tokens` VALUES ('a29002c8a2e97979b45abdfa0246883cffb92b35fe85ba1193b09d6f9fc86f520caea630dd2bf0d7', '51fdf369970f7659c4fa648dcffb2f819d98d2913b3039a20f1cf349d673fed73363af7b9fb9c068', 0, '2020-03-29 04:45:51');
INSERT INTO `oauth_refresh_tokens` VALUES ('a36dff6104d65c214162347484ce3a57872b272abb46d4712a515e8b9281150187d53841200943b3', 'c644c7ddb67f34f9d6888243dcbbe9f813bbfa31f8d00a681b59ac28cf971894ed71bab2066253d4', 0, '2020-03-29 05:41:40');
INSERT INTO `oauth_refresh_tokens` VALUES ('a3ae36251d066b1837f8a7fe3bd2acdeb1d77161114610ef264d3e67bf9ccf191f301231a0f7f5e2', '0907c98e8bffd096233684e37ddf6d9910a4d82a54217aff4e142b1d26a07488acaaa4f79ad97b53', 0, '2020-01-18 14:21:17');
INSERT INTO `oauth_refresh_tokens` VALUES ('a4739bc4b4f73dc475ab306d71b8f8e834c5cb43b2b1d2236852ab16c7ff818134b29da674c5a54c', 'fc3d0f69d57df59e5f891e58f6c634e4e3c89028270309d5608911472a402137eb5b168b66ec1075', 0, '2020-03-03 07:14:27');
INSERT INTO `oauth_refresh_tokens` VALUES ('a49ce69708ff5793d75aefaa83c0bd89068585310934a6a931344617b801389050169a59b9049b1d', '0fdc3582c23fa16723cdaf1fa0194a696ab9ed1247774879212a1a4d252f86cf9101bb322dfc008f', 0, '2020-01-18 09:57:47');
INSERT INTO `oauth_refresh_tokens` VALUES ('a564780856a30ea966ba5d7afd673498b97df112d8c0225e9fb77d93f174004fa8f434b73f56e548', 'f830400a5e0aaf5cf50ec4be17f4697175555841c18f184e327f65237707805e2277bb4349b62b32', 0, '2020-03-29 05:41:32');
INSERT INTO `oauth_refresh_tokens` VALUES ('a68f917d6f2cd8096f636743521059030e06ff65b34dbc0b928980972177289b69d5e735a9d95487', 'e61e8d1750e5f011d21e2e564a674a2e5412e7abb5f09af92ef54f2e6a20041210e926079fde6fc4', 0, '2020-01-18 05:15:58');
INSERT INTO `oauth_refresh_tokens` VALUES ('a69db2c14728540f9785024e2f12560a737f3139873c2795c0e162bd53dfdd9face13153257fd6cb', '7a100ee0980eacdefbfec76dbed71deb9208b50827ad166cf8a2a05ef2821b2f3818394f99026d5e', 0, '2020-03-02 11:20:46');
INSERT INTO `oauth_refresh_tokens` VALUES ('a6e7c8fc69a7414e7c5fa8c3f6b6d1e06d1f04cd51e9338c38724cda14872590ae080e0b37c4ffa2', 'c2703b60190db517b224f09d9e84c9019111cd48e39f1144e35082e8f9963edfb533bdc1a515b765', 0, '2020-03-03 02:13:26');
INSERT INTO `oauth_refresh_tokens` VALUES ('a8acd8f878de1eb5ca3a471e522327b254ccbfc72995cb1422d1bc8bed3eca737cd52bb69d0f899d', '5130ac926603853116facfb7ea29ddf478766e138b2c40ceea0567d98e735402e9a56d518dfcc649', 0, '2020-03-03 02:58:52');
INSERT INTO `oauth_refresh_tokens` VALUES ('a8bec43046d7b960b2ac5c9585ddff7f88eb52300e6e642ce04f23cecfb8269f429f3327fe592027', '652c0f57071b71c42cfea8bfe2c006cc7c0eeb1991b52b102322991a90f9a6e2f339da179ffb2f69', 0, '2020-03-03 02:40:28');
INSERT INTO `oauth_refresh_tokens` VALUES ('aa15420a34ffb9f05cc61940e1c1e0a6120507ba74d088f407980570eaade35b88025cbefb90ae96', 'f14da1b85e6111f2c645781d6ba4ce40c2cdace40e4e03e4688fd38489b211fcae51a1869f261eb0', 0, '2020-01-18 10:03:51');
INSERT INTO `oauth_refresh_tokens` VALUES ('aa50ef25c9b786007d80f78a7fce8fa6d227e458daf0b2666ee1ade6410c41aff8bfb717a615e428', '969f74b5e3e36bb95423fc44d6c71f9329c3ccd954f3f0de8c5299cfe07b9762f90f1de82c2aee56', 0, '2020-03-29 12:37:14');
INSERT INTO `oauth_refresh_tokens` VALUES ('aa58f79678856f279cec6018bc09893833e7b68a21fc833c57a03d84fc0721671ea903470a615713', '2ed1c402818f81af6a5d376eb680cc0441a7cde8f79c6cf7cebe26d2e0c638b0297af5ff2345749a', 0, '2020-01-18 05:36:57');
INSERT INTO `oauth_refresh_tokens` VALUES ('ac5e48fcb257ee152f51700fe27f70db2c788cb2e2979cd0d41d9554bc81444cfc96b771338959ef', '073df7032a75e000d8e318108a777071e9fbcc536c96b32a69145cee90f74b0a909962744b6894ff', 0, '2020-03-29 05:42:44');
INSERT INTO `oauth_refresh_tokens` VALUES ('acc284992231eb18b607469685cbbaf0f8cf07091ffd89cb3eee3eeac5d83f4b5270d7a91728ff80', '651836d9bb1b7db7ea13e441aa808d4cb94966b87829178e4789c592052d85755bc22493489c9823', 0, '2020-03-29 05:39:05');
INSERT INTO `oauth_refresh_tokens` VALUES ('acc6805c336e40a271b6943729065329d7bd2f4af5c06b67ea986608381f49023d25268f5ac24bdc', '36c2d0dcd4e291d49932a89cc2d6abdb342f1d9c50195563682c4304d52f809d5522b4d87b7c4d5d', 0, '2020-02-03 07:30:26');
INSERT INTO `oauth_refresh_tokens` VALUES ('ad5c89306994b357440c8da0e37e82ecbc5d6d703368dbe340d98e8d5c61a6212d6b99d4b3c9def6', 'eea1e00b8dfeaa145477d3af80647ceca6dd7a341b7e6e62d70f7891a9ab4c1e1b914bab34f4a9cd', 0, '2020-03-03 01:20:05');
INSERT INTO `oauth_refresh_tokens` VALUES ('adbc7a2672a9c26e8b427930b362b10fe06acc346a9404a7db4abcac57806b0c6b650ccf2c9a610d', '97b61fac85750fd392a3f7d0bb577c07bc9c7963ceb2b82acd7de77380d423ecc00196b44da704a3', 0, '2020-03-02 11:49:49');
INSERT INTO `oauth_refresh_tokens` VALUES ('aec406d3f37ef245efccc3420ed5c8f7e083b7f3a77dc00e3f848cbf2223558c21f97ee99a0943fc', '823cc10b9c4c1200888724eeeced336c09629f024361545d7696b4c9b3df39e8fca10bfc82a48d52', 0, '2020-03-27 04:17:27');
INSERT INTO `oauth_refresh_tokens` VALUES ('aed91b2f247cb8944c83e763bd58042571a726efd21c86fb332a7fd4eb23add2eb7357dae65e4452', '8d1a96ff0068ecf16950ad33ce06bd5d723a4945c8fff0fa6f4e6a6d5eb7fa4a0f4209f5ba98b1a9', 0, '2020-03-27 03:53:13');
INSERT INTO `oauth_refresh_tokens` VALUES ('b1727714daa5abf68f74fb50a0790e94c61df35a5b39076a7b61aced018310f53df4dbadd8c584d7', 'ffd54653ced97ae9457c108b479324054134e5b1a422fecb504322f25c495aa8ffff64a9c618081b', 0, '2020-03-02 13:35:57');
INSERT INTO `oauth_refresh_tokens` VALUES ('b2d132c2f19bce95f92752be1d918b0b85d807bea726cbe3e49b2150f0d275a8c19456f3f8ef93a1', '5441634d0b85bf8df0c9c86740715a3f7eb097565618844cc21092be8d6a78dedbb4a3da5f6fde08', 0, '2020-03-03 02:06:18');
INSERT INTO `oauth_refresh_tokens` VALUES ('b3be6339dd85b9c32758457f8a882207bd57e5de5faeccb1617370e932b43af4ffe60adb16f8e15e', '2cccaabccad73f0cdae0989b178c06e1ed6e016c6183d400e4ebb0e41320a3faf4eaf41126cdc08b', 0, '2020-03-02 11:18:41');
INSERT INTO `oauth_refresh_tokens` VALUES ('b5100787026d0497e1e377f44f7bd0f7c23512994909be2a833b8b306db683218de62adaf8fab7ee', '9cb5db382aed00e2e74f270f1addec57b9d3aa7c98c58f2980654806de29fe5fa9ea458fa7eb1d23', 0, '2020-03-22 07:35:50');
INSERT INTO `oauth_refresh_tokens` VALUES ('b60797b75dd7d6c9f6d0f59913c9929e9fd71a558a26d378eda1ce36817ce57b1d9a2ff18c821ff8', 'e6884c4f89c5d720b6ed6ca9a2e253e1a365ed10db3d1f62068f945f96b9bad60a82223600116eab', 0, '2020-03-02 11:08:42');
INSERT INTO `oauth_refresh_tokens` VALUES ('b7778780c7967cf7cd71caba3e2bca72a63b823674836c94b426a1ea31ff0b9bc67aa344d5b0a73c', '12a2d14bffd5aae929cdb992da6f554be74f138eb00649122a25292518787ff8f6e93c69b5c767c6', 0, '2020-01-25 07:19:21');
INSERT INTO `oauth_refresh_tokens` VALUES ('b7b16f09190a634b386a1f432a1f408ceac08e658a1a93b41ecff48eefba6271aafcbe0135e1fd97', '29699c35f034dc82d0f411d1eb5e2891ea860b07d69fde88dd40302cbcdbfdb68e0b948996888963', 0, '2020-02-03 07:41:19');
INSERT INTO `oauth_refresh_tokens` VALUES ('b86a6fc28e156128dfeee443c3a2d631493deb0edfa0b75363fd0ac4c61c42c6522ba90e9f47ef0a', 'f9148384c93be08e15e9bdae39ba546b07cc9bac190c7e0829039c1c8c34fdc4232e6e7802271163', 0, '2020-03-27 05:07:54');
INSERT INTO `oauth_refresh_tokens` VALUES ('b86e3b7de42f86d1257bf270e0bed41c7ebb7be453071358e37539fcfc22639aa267baf268ff3e66', '66d0bd9f73e16d32a85dd2d5ad1a87bc0fc85f227deec47caf69b4e690a049a9ba51e98575e333d6', 0, '2020-03-27 12:53:36');
INSERT INTO `oauth_refresh_tokens` VALUES ('b875d2b868f567e7064919ccd51aede9e10be4651073deed9243e47560062ca91d07bf347fdfb792', '9b4391048064d7f0bec5272687dcdf77158ced9c574f17efd60f8d2b68474cb052cf6defd6b920f0', 0, '2020-03-29 12:50:53');
INSERT INTO `oauth_refresh_tokens` VALUES ('badebab095f7366e14236befcaacd779b123aee2327ad28bcb5f67953fe9b6d3c407b49d760b400e', '8573c8f53e58ae88851bfe88c321fcc2aede1e86a2e3c2d2b8ea0bde086384289a4cc6ca02d505c6', 0, '2020-03-27 05:24:58');
INSERT INTO `oauth_refresh_tokens` VALUES ('bbd8214624111e6e728f5e64af254967d93ae1f4bca613406e4415b125e5b4edee3abf0ca683d2b3', '2781d45d761a3b16420d3e1024a5c3abd065265a85e81e2a09ace5b4ce2e784ee76fe44eda37fa06', 0, '2020-03-02 09:10:53');
INSERT INTO `oauth_refresh_tokens` VALUES ('bbffa752ad798ef23b16ec7a09ef9b2a7e22e001d79a5748a48547479afe568b979446f387b06f12', '7707ab9f6f6dbb9d8862053cd0597b3520b108206013360d4f53f7071dba4e6b9f669d8c3d41ae28', 0, '2020-03-02 08:00:00');
INSERT INTO `oauth_refresh_tokens` VALUES ('be0eab82b6bfb2aa9835c3a121ddb23ec9e134108b75aa5592de6f2ed1a8b736717de90bd974c9ac', '59589c16da7c0a1154af0ef435d98d70c7a710d77dcd55c7a391124f9df31f33653d5220fb07cc19', 0, '2020-01-18 09:54:15');
INSERT INTO `oauth_refresh_tokens` VALUES ('c014a05b3b1305a3384782ecdb76b5f82a6f140b1ee542d00de30a0df4306f67ae69ed524b5f293f', '768ac003fe6aebcfe766aa20c96bc9021f6dd843cb70de76d4405661478883f8475f3564db72dcae', 0, '2020-03-02 11:01:19');
INSERT INTO `oauth_refresh_tokens` VALUES ('c01fa622e10518ccc904397bcfe0128a731cce46e0f277a82036bdbaf4babba3d9d23a5aa2ac81d2', '4749ae6b2c82a3cc54d50e890fbecc11c32b220a0943abdaac6420db9431a457f6fa18ff22a26c2e', 0, '2020-01-19 23:37:51');
INSERT INTO `oauth_refresh_tokens` VALUES ('c091303eb00790b3ac41815cd24d4a248e2216d5ecaba899dd7077689efbde76a6299ee123847af2', '27c289ac68eaf305ade5be437146ef857a2836cf905cfccdc9e38a0a81bb49b29dcf34828c255bbc', 0, '2020-01-22 15:39:40');
INSERT INTO `oauth_refresh_tokens` VALUES ('c127774652f7af862583d0d89f9682c01f2425acd061eca88d82c3a7e50f9e95e51872754715297a', '284257d7ad873d30f23da8ac537c056a097361dfd0cfe19b8634d9ab64ed2042d8e080dcee310d9b', 0, '2020-01-18 10:00:23');
INSERT INTO `oauth_refresh_tokens` VALUES ('c25af606936111387eb4c5f724149eba0919a8bf8d55f94298b1f695bbaa24076fbd1e383c1da027', 'fe3f66e9515292d759d1159cf2c6833ce48f897491bcc552f2ccde1d5f25b667aa17786f8b0ab8ee', 0, '2020-01-18 10:06:56');
INSERT INTO `oauth_refresh_tokens` VALUES ('c35d3813f9d2bd48f7947f323ecb39936e3ad2885a0313b55efa9489b6542535c3f56b8c4fc2fc04', '7b1ca927ef649068eacb2bc47f4d6e9e28679c983a36390b53f5d461ef088486c7673792e14fa6fe', 0, '2020-03-03 02:31:47');
INSERT INTO `oauth_refresh_tokens` VALUES ('c7fe9d05b140c6fa3aa1602d467ddb41ea10a445c99d0e8c8a3ff9c60c23421ee26d5c99d93a6c90', '5dcf3d92ec0881b097dd17d03acaeaac6f3ba69e7b3845f70e4cd126efcc96ce0dcc53cf30943d57', 0, '2020-03-02 00:07:45');
INSERT INTO `oauth_refresh_tokens` VALUES ('c866f8a548f5142d2f3d62f2f15b7b7547d6f4d69a7e593dfa424c07dd34a400f2e628b685b71bd7', '3987b1a6e1c9e68031026779b8ed54a0a5a3ac89bfd0713ce66682e90042d8ac11675a9b247bd332', 0, '2020-03-03 06:11:04');
INSERT INTO `oauth_refresh_tokens` VALUES ('c98a8c4fe683cd32b82abf3f0d301a7f9b4b6fbfe6db8f307baed55d59db5f1ecc66ee93583d5c86', 'fad604455051249b4c9914ede06fc9e850b9570da90fea2f238c70898b10f416639aee90226e00f3', 0, '2020-03-02 09:31:07');
INSERT INTO `oauth_refresh_tokens` VALUES ('ca0f7eea9d13db8fe56eb275ab2d0dc9fc56ad8b8f0453d8cab1c3f36a776c1f0eb6f4eff1740002', '3c619cad67b05f0f0be7366010a95f711e73e36fe7b358901c8acf41fa8eebcfaca0955aa90334f6', 0, '2020-03-22 00:46:36');
INSERT INTO `oauth_refresh_tokens` VALUES ('ca215099ae4de239f7e93b395a01c36c565068b1ebbba626cce84f5b2f3f6fe3ddbbee94830e91fd', '17cd3781be6432b8c30176bc49901a4ba2be3e9e6723c7891846cba83bebc1feded3e97f293df38e', 0, '2020-01-19 02:38:16');
INSERT INTO `oauth_refresh_tokens` VALUES ('cd02a907c415f2fc6283e2818ccb1fa0a1678371009ab81033388632ba83d20f8727efa9ba2377db', '5781ab8f0e6289adeee77917636c3b22899b7177d23d63c0003f22a9f78fdace1512ebaf34feb7ae', 0, '2020-03-03 04:02:07');
INSERT INTO `oauth_refresh_tokens` VALUES ('cdbd48b0269bdad20328fa846da3592107dd9bb7fedd1ca65f0913e2b0d6e43fec946e877a5d9043', 'efe1995028e17dd1f0e59212a0f82c1e0c43d163ed17f47d2390a9faea9caaf7ba439ce902a649ee', 0, '2020-03-27 05:02:53');
INSERT INTO `oauth_refresh_tokens` VALUES ('ce0e73bb40559f5d4ca4d8c7979e692643551ceb0e9d1911b103811d6fbbf0c9246056520001b2b7', 'f8a7a005ee47a1bdbbdaaa5377bbaaff412ecb61eded421f904d5d03502088327abd5d9b6b8b929d', 0, '2020-01-20 08:25:33');
INSERT INTO `oauth_refresh_tokens` VALUES ('ce475c4d2b347ed5d9582ac02606eaee466ba995cdad0333a645d3e0509eb8532044f9504656275f', '096a337b117d1374dff0e5836c939d0827f9858545f02dfbb45fb0cbab609a4f11673f79640a0814', 0, '2020-03-07 03:28:20');
INSERT INTO `oauth_refresh_tokens` VALUES ('ceab15f5dd25831b264ef7f2aeb97cd2ccc781244fa9a95377960e158d33314428742c1b9ce8fd21', '25f430125418fdd567e2f1060cbe70ae6b0b315c0c630ad495426c1275cf0ac47a5abe46f97e91b4', 0, '2020-03-02 06:25:10');
INSERT INTO `oauth_refresh_tokens` VALUES ('cf1469b0096b261bb852be8154f15fc22756c9e307ab222c75775281c53d9d12fb8169814314ae6e', 'd58e364078da055452be93ca35b6f4a6ee0dfc8326934401cf823d145ec6d98b6eb7ee4ca3a1cb1a', 0, '2020-03-03 02:41:11');
INSERT INTO `oauth_refresh_tokens` VALUES ('cfc78ebe497f8922381ff128ae729cf31674474f370285d9d328fedf721c9da3a0ccba4a1b09f3f0', 'b40a4bfa593e847ca35dec404d962a467a88ca5ce1c69cc9b0b6e3e39d9930b93977756b9df12d4a', 0, '2020-03-27 03:53:13');
INSERT INTO `oauth_refresh_tokens` VALUES ('d0b81bece9039f919bb67f1f62760ee8d841b8af79cd9d24491f2c7f2968ae0b6dfff23a7c5b47e7', '78a2e5205f713a95c4ddb36c18968b5efadabef194e8b936c4fe28223f3b97ff2ea8473236dfe614', 0, '2020-03-07 03:33:34');
INSERT INTO `oauth_refresh_tokens` VALUES ('d1693980b17fd2aa6d30b4188a8eefa8da0ee61b861edc17f7ca44db5978a4bc943cec3b7de1ae37', '77c0e16401e2dc4ad619801632e1cb4816d3b50586b538a142967a105105c748f8d0cf210fca74f1', 0, '2020-03-02 09:35:35');
INSERT INTO `oauth_refresh_tokens` VALUES ('d30f7fd2168a959125481e65f5bb42bf098fab9cdf99f649697ef83ee2145fa2ab19329d873472d5', 'c67e589781dfe06f206760a2d3b392b46eee817fa7fbbcb81e16def2665a19e321f7f60be41f3c50', 0, '2020-01-20 09:25:12');
INSERT INTO `oauth_refresh_tokens` VALUES ('d406da88d657d7f12b30ee6492951c4c2e7131c22829259ee451247ed220fdb3d4fd06eaca673696', 'f4feb460067b6475dd841106088c668db928104b601b72f5cec967cf05eb83d6ef47f2e593549094', 0, '2020-03-03 01:20:52');
INSERT INTO `oauth_refresh_tokens` VALUES ('d421a6fa03d7f8cb423737a32a10d4f623ab9fcae2615e81f764f33d542448507832e6df0b3ac44a', 'cdea293b73a466ca3d52cf874131b23b32744d67d4f753599fc509febcb23ca0cebe294ecbb37b7d', 0, '2020-03-05 11:58:28');
INSERT INTO `oauth_refresh_tokens` VALUES ('d424ec3feb7b1787b8672f93d54a80a08b1f21898ab0a9daa3fc505ffe3ccd561c1d6ede52877022', '8338cc8cb4043bce5212f44d0be0310ecd2e559bdc4aeac944ec02bbb60e8dbb9dd915b471602e3e', 0, '2020-03-22 00:59:26');
INSERT INTO `oauth_refresh_tokens` VALUES ('d50c6e501fa17a9394f1594dc31da7cca462d11ec277678cecfc13593c44c525974f8f44b872492d', 'e9d18d6741dd684ff8a7b477f7c5e1d911b346bf252985b7200a81ff72ac50080ff83b8b0c82f1a2', 0, '2020-03-27 04:50:42');
INSERT INTO `oauth_refresh_tokens` VALUES ('d52303137c96048a8f8ea3594e14c8bb80ad56e9034883ed2cc2cc46499aa2e66a1c03ab56609629', '1ddec0afc1e9a8e82e6114eb9b2f7a5e4153899178cbd1bd58e1a85fc6e932aeda67ebdc21ff3701', 0, '2020-04-03 03:02:56');
INSERT INTO `oauth_refresh_tokens` VALUES ('d604f1fc4cf6cdfa5fa5cdb161b81a589780b8e4ce04b6f979a1cfc4035500c6022121218709610e', '9cdc60176e46a99c1298658270b1c7afc1015907ce1b12c84a0a6c1234466c8931015d50af702813', 0, '2020-03-27 03:53:13');
INSERT INTO `oauth_refresh_tokens` VALUES ('d672343e573713f2dbe92cdad68d68d33b3dcd10f7130700e8461b418a2df243546bdd03235b2efc', 'ba40f786a79e178b46002d302b24afd542ad2e55bfad7481d09f3069278f70448bfe841245e55315', 0, '2020-03-27 04:30:58');
INSERT INTO `oauth_refresh_tokens` VALUES ('d779edf024490db90208b126f7dc33016493a1a03da40b82e64d9ae6aec28cc754f8498382040bf1', 'e8ab1bd95b410e50457958dd753d4baedf806c8a636cf72995e916c2bdcacdcfb8f203eb15d2e26a', 0, '2020-03-03 02:00:07');
INSERT INTO `oauth_refresh_tokens` VALUES ('dace45a994b0552530b71f6954af6882893f23a4e5e2a5d84b9bfe696ea2669d9bbd885373feedd1', 'ae1e06631f69d6fdc7374dfecdadc0a0b08eaf85282af3b0f2b49190dbdf0b379292fc4dbc371f4b', 0, '2020-03-02 00:08:36');
INSERT INTO `oauth_refresh_tokens` VALUES ('dae48bcc42a2a859cff7c28e0fa8f558ef7274e2384cd05c237dc3de95fbae2c6eda670faa28f1ab', '7ad82473311df6862895ef291fc67e723718126cc530c3c95df78df334e1a6eaf46fce552cd9276e', 0, '2020-01-18 09:26:17');
INSERT INTO `oauth_refresh_tokens` VALUES ('db299569770577e0882bb35f765a0359a09ff789c946a05661b5394669e2ce1196ac67f4ba728df6', '344c2a99ad07c096c83642e9a0002ff21d34bfe78791149f9011c8b7fd87043303ef4294a71fee08', 0, '2020-03-02 11:19:05');
INSERT INTO `oauth_refresh_tokens` VALUES ('db3f1fa64e57e24acb2bf77b3c2be489ccb473c0b6fc7acc3f9c5fd9bfb09645562ed658c41e5287', 'd67e7012d4d672f16735d3c85ca7735b3702d9784a566697909e6dcc72c5e60e9bc19212e699a3bc', 0, '2020-03-29 05:41:32');
INSERT INTO `oauth_refresh_tokens` VALUES ('dba2398da3c092ab98a60b39e61819ea32f950c249f1cfc5e148d69eb76d447b9f10dbf359e314d6', '242df3aec507c9dd8a1b2b89ad02f6d78b0346c8811edcb6d5d29248685d08a4c8a7cc9bf9646f37', 0, '2020-03-27 04:50:35');
INSERT INTO `oauth_refresh_tokens` VALUES ('dd2a1cbbc1feb6fe0a8eaa1bc74b27791a6d61fb7af78e1e68dcebb9a31ac73576dd895c260adacb', '299cf2dddca09a5b5bb68c2b2c191f297a2b511d6a9551acb0161adda0e4cb0a5264972af8c05b15', 0, '2020-03-02 11:01:41');
INSERT INTO `oauth_refresh_tokens` VALUES ('de37cab74dd134ac3943620a434fbd042cba9d8d1e9eba05fb8d37bfb4dbb6ff1d8c6746409ca8e4', '505bf96074f7bcde7565d2a3d38deb7ec7dd8bd0ce39d709a77c6988a08ebfc0a9ea897d44cc954d', 0, '2020-01-18 10:08:09');
INSERT INTO `oauth_refresh_tokens` VALUES ('df241dee5bcc9d9f2e28660c7520e6d3b1d9f22cd0c8de40a4f2068f1503e859f71b0ef03710c611', '354a6b3152fc37515bbf60f31f62a0bb646db57deac48816c9df9ac48afd55729acc7fc84bb15bdd', 0, '2020-03-03 06:10:28');
INSERT INTO `oauth_refresh_tokens` VALUES ('df2530a38b74f291b49c8320de46095e2c0bea92c0c89cc75065a747ac11aee517e564788b049fcf', '8bef60330bc3626486acdc1a6b3f45ea91f7e315d65b2099f8f484e674d57a8f330711b4b620cdf3', 0, '2020-03-02 13:28:59');
INSERT INTO `oauth_refresh_tokens` VALUES ('e03a40e77264c12b26444c4f2d80e92226e03db3425e433eae81ad9a96a20d93c41cc7fadbea2d42', '21029406932c7d39ae045b2414e5ee7ff9c9e60363c014778d10e610ff05941aca0424309d7bed72', 0, '2020-03-27 04:50:13');
INSERT INTO `oauth_refresh_tokens` VALUES ('e0e7767f7153575ee4539785fe03045439e90c6ee5e9ed54423291073fceb4f7c2da895c40a3509e', '696493eb4cda2930d3e6982c4a6d18b982309b0e54f784d78441a16e147ca76cd683392f24e48597', 0, '2020-03-02 13:08:32');
INSERT INTO `oauth_refresh_tokens` VALUES ('e42dd8ee620e2efc3d6e81d656d70491c0a7b02b8133807b15adf309fbf03b684b3da3127e5dfdda', '43569de8ed2c6d63ca03c366184e5b549b40d02def3a4d250b5eb348fe94779eebdec8997d05a52c', 0, '2020-01-18 05:40:55');
INSERT INTO `oauth_refresh_tokens` VALUES ('e4611dd2fe9b1481e3ceeb3a5d54009c1a36fc32bf47decac0f8223e2fa3dfb7d6d52e39d0a8ee4f', '1cca9607d8c63f833292d4da21e176a2ffb3d383d600aa82380ef7feb1d4ce15ccc81fe7b634e0ee', 0, '2020-03-02 12:23:07');
INSERT INTO `oauth_refresh_tokens` VALUES ('e68ce57e6e04f4cbfa64f51e7d257d5a3f76ac3c60774050e2a2d72bb1b217a05106b27e6a0ae22d', '700ce484938321c119b782fcdfefa8a557bbb30cd7efbc8b5204f542eafb96958671c6de9a8b7eef', 0, '2020-01-26 14:45:33');
INSERT INTO `oauth_refresh_tokens` VALUES ('e73956194a1256fb5059eedd8effdd29906033e08d8cde15ef287b1bda8d1afc69684983574fc905', 'fc1a85497a14f3124b0cf4efc323c614312970d88fac14fa0544e3f9027a2ab7d52276754b2044c0', 0, '2020-03-03 02:48:39');
INSERT INTO `oauth_refresh_tokens` VALUES ('e74037dae9d43fbce75fbcfdb8de7ee382f9ea847ebad5128bf5c58cd0d5ce75aae36093cf81ec4e', '1cb007ba70b87b815e4b293ef084856bdc634047877d0ac3ff73627bb912c97b4be52da83925d9a1', 0, '2020-04-03 03:03:24');
INSERT INTO `oauth_refresh_tokens` VALUES ('e7a4d4875f33272246ecd1489aeac3c11a5e2f33858a926177b2e1d7ef26412e092cb3d5ccd59ca0', 'f883a44b0024fc336a40efa72e62ae3beb7760abb691344370fef5351e23c9c37f32c21e289e4219', 0, '2020-03-27 05:01:50');
INSERT INTO `oauth_refresh_tokens` VALUES ('e862384c59b10382b0819a329497d38b443600e086af3b879d4207e9f3a77749edd8b9907e1f348b', '68cc6d18152c35bc4960c6c93319dfc2501638c598bbbf1cfca35e9a4e4e603cbb8eece9e821de26', 0, '2020-03-02 12:14:33');
INSERT INTO `oauth_refresh_tokens` VALUES ('e8b5a522983b8db4a00e2d06f77d8b684649056f977cb76eb4e1ea9694bd523d6cd80799c3dc8951', '18c9e53af191cde6cdf895026c018400827a29987caa3d69f7b556b04d2e7ab50313093834a00695', 0, '2020-03-18 12:24:03');
INSERT INTO `oauth_refresh_tokens` VALUES ('e9ae35a7b20177e2cda072b74bb89736a45aecea69268b6e4d0c53be4b9a0354bde4560b44d5ee7e', '59df9938d50ff8e5a71be984d2f7cbfbc26cd24760d6e4da534d101f92f795002772f03c449cee31', 0, '2020-01-18 12:16:41');
INSERT INTO `oauth_refresh_tokens` VALUES ('e9b132ba4a1ec0562cce6c48f0374cf078d04890a9d16504d388a935fdca0eae93b967237edb3598', 'e3f633c2823f68ed6ecb645176c946deecbd4c2bd7694d249ee7400dfa0640916f96b809fd2dadf1', 0, '2020-03-03 07:22:09');
INSERT INTO `oauth_refresh_tokens` VALUES ('e9e9996fd9edbdcd632e39b1e2f771bdb4ab90417dea95900fbcf02d6011a27368009532280eae15', 'c6ce0afd7b4161d52d2113bd6d75fad8ed181444e37aac424cb76c14510ffaf75a62379c69ba231a', 0, '2020-01-18 06:01:08');
INSERT INTO `oauth_refresh_tokens` VALUES ('ea81918d2fb08c135ff58689be50ad5ccb588bf58f9a8b68f37a2d2f93ac1f42cd63e05ab1059439', 'bbbb4c3852651d1bb56b50e842c60471a6d9769de62d3ef33349c8370e3b7cbf28da7464bc200e16', 0, '2020-01-25 05:30:11');
INSERT INTO `oauth_refresh_tokens` VALUES ('eadb99de9b799f654c54aa38c5b2d2484c2a3e67e113ceed07a9d362363e1f4d7b91e907cce9da61', 'ae7edcfd8684d34411639eeb444967040a9c62977c7dafdcf53d1cb7860ab648a1f907e1f3a28dd0', 0, '2020-03-03 02:50:15');
INSERT INTO `oauth_refresh_tokens` VALUES ('eae304db5c289a060af4148c34f737f57005dbe500d9b31eff558b588d91d07e0ee99e46fb0583fc', '49252973d922b71a77078ccb4da6ab28934262a4d17f9dd7664b53ebda33fb75cd637ec8bccaaa81', 0, '2020-03-02 09:32:22');
INSERT INTO `oauth_refresh_tokens` VALUES ('eb522336d39c953bbbc7afdf9ca4938cb704ae128037de8edc36985a771cb2b0c0f08c44a4563dfa', 'e1d778e67171b7efcf84e3977436a2a8c4415746822305970fe749a34ea71c95723c19a2f7973cbb', 0, '2020-03-21 06:46:53');
INSERT INTO `oauth_refresh_tokens` VALUES ('ec2eae7ab6982a0e3231f56289b795d53fbc865bf27c20a24f91504b59eca012d18beaa564ef68be', 'ed0b34071db8ec0b4c94d5ee864c19e0a88405fb95079d62e4f2bb4e5bcbb82bd3906e40d744c97b', 0, '2020-03-29 04:45:51');
INSERT INTO `oauth_refresh_tokens` VALUES ('eea3a92d898a50b33101d90ba6b3ad27319592d94a412ebf7c18720a7f8299f7804cbf45d3508bf0', '3193ee1f50a857fdefb65c88cacd55007ed42a6616992cafdfef3285763efd8df7116ce8c53891e4', 0, '2020-03-27 04:01:50');
INSERT INTO `oauth_refresh_tokens` VALUES ('f0bc40df926455ccf32ba4a8375c60de6170ea97363738e3a6a0004176c3b17e45801ca9d05281de', '892eeec8a99994a5f0092005c3fca4ff0c4bdc987a3db2a6ccd2c89a5c6111c10c3a65b8b69a5f17', 0, '2020-03-27 04:50:08');
INSERT INTO `oauth_refresh_tokens` VALUES ('f0eb72209395dff2286b8c59bf70377f7fee908d5f9cf43e883249701a7ca66a8cb3171c34f8f958', '3e27b7ec1508b2071f7eb71ff71ee325e30c31221255b2a25712c8a3ee2eef7fcf268ce79fe75f61', 0, '2020-03-21 06:46:56');
INSERT INTO `oauth_refresh_tokens` VALUES ('f306ceb52f601f01f251f5db063389e3734e0885f0f2306df9c9ebe1221b2fa664f85e99cb2af982', '21b12471f8e13fce652605618387487580dae6bb830805c2b39540e40a16445d017f0e10ddb4052d', 0, '2020-03-03 06:24:23');
INSERT INTO `oauth_refresh_tokens` VALUES ('f6bad11c08e74a954040b6e0e9fc2f302db432d9975f8247e1eab80a92bc12358678af6b957d976e', 'd87a4eacbc0ad8bca0a095cee2dd8fbe348227547b03f69e7df469faa2c0da626c19f4e9ba81882c', 0, '2020-03-27 04:50:42');
INSERT INTO `oauth_refresh_tokens` VALUES ('f728cf493ddbdab59e77f6a115c863881a5de2868abe70ca144dd072f57f9d7b4821d373193f30da', '5c849d782400edb5b983d44755ed6434b016aae29992aaf3115321b06b74656df9586a97bc320d44', 0, '2020-01-18 05:42:50');
INSERT INTO `oauth_refresh_tokens` VALUES ('f78658f56c54abc162830c851d4a5da161601eb311bc89d8c3ada2c75735279094796dd0cbe61f8e', 'dc1ce7fca3da3f2dad2f11a2949a1f0b81e9eec6155993b3ee421e3b452f442be42598dbafc895d4', 0, '2020-01-20 09:40:32');
INSERT INTO `oauth_refresh_tokens` VALUES ('f7b7e85be8b6b902933d8ed5a52abd1f4b4309eef9190d2c3d12ee439506743e619052043d9d4d7c', '902ab026ce56efcec1a4e7020dc0a05ca8c2ca2eda2ac09289821ba0a90a1f2d26c993643c8d0c20', 0, '2020-03-27 04:15:57');
INSERT INTO `oauth_refresh_tokens` VALUES ('f8c2dda513ccab51522e13d1d21d3b88b21ef6c1950d5a3dacbdc5efd4cbc23a75440a91be587066', '05c01d764f8ab512fc9c4c45fcbb669c4b2b887d9d3607cf7547ccf16da12d0c872fc33d7f03df86', 0, '2020-03-03 02:49:21');
INSERT INTO `oauth_refresh_tokens` VALUES ('f900627f68ec8458c51fbfbe7df8df4463d7664c60fa62196e97fdc4b0acbd83f2aafbe3f0d4b0c2', 'f46a15b38c14c8975876f9c1a7e913ddd79c35e99b536ba173f77d84aae38e2345b3816a5ab470f0', 0, '2020-01-18 10:01:10');
INSERT INTO `oauth_refresh_tokens` VALUES ('f93b37cbb261b46603b8edd709150ff7985e33bcaf56c12334219aec5b695616d7f2fe1a103c8cf1', '2a4fcc181da774a921fac027d4229f26ee79b8da928e734f57b0900aab6d04417ef6dd0397e6debb', 0, '2020-01-18 07:49:38');
INSERT INTO `oauth_refresh_tokens` VALUES ('fab3e365b03ae0bffe38d42dad2109922f6e31a53ee18638641ec903de167bf22a31971c28fc2fd2', 'f61d8f3c5a4e7cf8f129cc5ec142d13e4c0567e093a0e206e50cebd80c8b500f833f030c777d7e3e', 0, '2020-01-18 10:30:51');
INSERT INTO `oauth_refresh_tokens` VALUES ('fb2f0a4fe19c44a212502099da04f3283c8c874ec1f29c082fe8f351e97a9b7bf9df915801e2de49', '9ec9053caeb3805b2f2107763c39c541ac333de45ab6b092bd6b553b317a7bb77aa76ec137001847', 0, '2020-03-18 12:24:02');
INSERT INTO `oauth_refresh_tokens` VALUES ('fb3a2bf3c5dc541dcc6e5bc65f0c24247f20c1047fd2506ae3c48641d9f773e21cf90f4e5ebc612e', '0220cb37694b7c339ded2d13aa9ac06eba49f46e08557e5563ab1edb8e651f60c15479062f4db3ab', 0, '2020-03-29 05:41:35');
INSERT INTO `oauth_refresh_tokens` VALUES ('fccecdac3fd05adfe1c174ad5ce1edda6be9626c8e757a322b9c7cecd44a5bff498ff86ff552c451', '94aa1a28d7db56de37e705f04ccfd025e97557e2a29f08c46424b635f7735f9fefb2f1f0504c5351', 0, '2020-03-02 12:18:12');
INSERT INTO `oauth_refresh_tokens` VALUES ('fceb3e14910714c1a27449dfa2871cf18ed40f0915d42ecd8be466cc6608f5093b9544c916809d46', '80e3013b49589933b48fcea6be6685ed8bb403301c461bbc7e37d9150e7c4485fb5712eb4bc59e44', 0, '2020-01-20 08:11:22');
INSERT INTO `oauth_refresh_tokens` VALUES ('fdcd0e27cdd7faf34075ef84641ac4339a9c4b4114001753b0d3bee94539c89c7280f9e82568ea96', 'a492592757091a06fcac7cfc7378c17c23520a5af90dbd2546b7eda920313f7b61bc33cfdd5f7649', 0, '2020-01-25 14:29:35');
INSERT INTO `oauth_refresh_tokens` VALUES ('fdcd998cf5c610fc120f732990a0e360abe7df01bf60cea3a6e5ddf4c6695a8e07e359306f60426f', '1920d7daa110f3066e10457016dd5a3c91946a3dc9a7027094701002f2f5f57cd2d2f4e6c848d2f3', 0, '2020-03-02 06:58:38');
INSERT INTO `oauth_refresh_tokens` VALUES ('fdce87bf4f92c3a04b83d22dc425a4fa8fb8b44100b1326e5c1dd975562e7c8a8af63e5aff90e2d9', '335f4a1dcc4f988ee23537ad5f44252a46d5b1c8dc1f849640e5ca9d360782005a57143e6ae14cb4', 0, '2020-03-03 07:22:26');
INSERT INTO `oauth_refresh_tokens` VALUES ('fee8f751a373e4abf60f889947350b4b037cdf65f7e21e4cc6401b2da101888957874f29b91b32c1', '680565d69bd7267839ddd7c6018593d5d38e72bd13a73847d1068f93f8f4cddcac325ed0d544158f', 0, '2020-03-03 00:43:50');
COMMIT;

-- ----------------------------
-- Table structure for password_resets
-- ----------------------------
DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for permission_groups
-- ----------------------------
DROP TABLE IF EXISTS `permission_groups`;
CREATE TABLE `permission_groups` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of permission_groups
-- ----------------------------
BEGIN;
INSERT INTO `permission_groups` VALUES (1, 'Admin users', NULL, NULL);
INSERT INTO `permission_groups` VALUES (2, 'Role', NULL, NULL);
INSERT INTO `permission_groups` VALUES (3, 'Permission', NULL, NULL);
INSERT INTO `permission_groups` VALUES (4, 'Menu', NULL, NULL);
INSERT INTO `permission_groups` VALUES (5, 'Permission groups', NULL, NULL);
INSERT INTO `permission_groups` VALUES (6, 'Article', '2020-01-18 07:00:37', '2020-01-18 07:00:37');
COMMIT;

-- ----------------------------
-- Table structure for permissions
-- ----------------------------
DROP TABLE IF EXISTS `permissions`;
CREATE TABLE `permissions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `pg_id` int(11) NOT NULL DEFAULT '0',
  `display_name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `icon` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sequence` smallint(6) DEFAULT NULL,
  `created_name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updated_name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of permissions
-- ----------------------------
BEGIN;
INSERT INTO `permissions` VALUES (1, 'admin-user.index', 'admin', '2020-01-01 03:11:52', '2020-01-01 03:11:52', 1, 'index', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `permissions` VALUES (2, 'admin-user.show', 'admin', '2020-01-01 03:11:52', '2020-01-01 03:11:52', 1, 'show', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `permissions` VALUES (3, 'admin-user.store', 'admin', '2020-01-01 03:11:52', '2020-01-01 03:11:52', 1, 'store', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `permissions` VALUES (4, 'admin-user.update', 'admin', '2020-01-01 03:11:52', '2020-01-01 03:11:52', 1, 'update', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `permissions` VALUES (5, 'admin-user.destroy', 'admin', '2020-01-01 03:11:52', '2020-01-01 03:11:52', 1, 'destroy', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `permissions` VALUES (6, 'admin-user.roles', 'admin', '2020-01-01 03:11:52', '2020-01-01 03:11:52', 1, 'role list', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `permissions` VALUES (7, 'admin-user.assign-roles', 'admin', '2020-01-01 03:11:52', '2020-01-01 03:11:52', 1, 'assign role', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `permissions` VALUES (8, 'role.index', 'admin', '2020-01-01 03:11:52', '2020-01-01 03:11:52', 2, 'index', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `permissions` VALUES (9, 'role.show', 'admin', '2020-01-01 03:11:52', '2020-01-01 03:11:52', 2, 'show', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `permissions` VALUES (10, 'role.store', 'admin', '2020-01-01 03:11:52', '2020-01-01 03:11:52', 2, 'store', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `permissions` VALUES (11, 'role.update', 'admin', '2020-01-01 03:11:52', '2020-01-01 03:11:52', 2, 'update', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `permissions` VALUES (12, 'role.destroy', 'admin', '2020-01-01 03:11:53', '2020-01-01 03:11:53', 2, 'destroy', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `permissions` VALUES (13, 'role.permissions', 'admin', '2020-01-01 03:11:53', '2020-01-01 03:11:53', 2, 'role permissions', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `permissions` VALUES (14, 'role.assign-permissions', 'admin', '2020-01-01 03:11:53', '2020-01-01 03:11:53', 2, 'role assignment authority', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `permissions` VALUES (15, 'role.guard-name-roles', 'admin', '2020-01-01 03:11:53', '2020-01-01 03:11:53', 2, 'Specify the role of guard name', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `permissions` VALUES (16, 'permission.index', 'admin', '2020-01-01 03:11:53', '2020-01-01 03:11:53', 3, 'index', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `permissions` VALUES (17, 'permission.show', 'admin', '2020-01-01 03:11:53', '2020-01-01 03:11:53', 3, 'show', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `permissions` VALUES (18, 'permission.store', 'admin', '2020-01-01 03:11:53', '2020-01-01 03:11:53', 3, 'store', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `permissions` VALUES (19, 'permission.update', 'admin', '2020-01-01 03:11:53', '2020-01-01 03:11:53', 3, 'update', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `permissions` VALUES (20, 'permission.destroy', 'admin', '2020-01-01 03:11:53', '2020-01-01 03:11:53', 3, 'destroy', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `permissions` VALUES (21, 'permission.all-user-permission', 'admin', '2020-01-01 03:11:53', '2020-01-01 03:11:53', 3, 'All permissions of the user', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `permissions` VALUES (22, 'menu.index', 'admin', '2020-01-01 03:11:53', '2020-01-01 03:11:53', 4, 'index', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `permissions` VALUES (23, 'menu.my', 'admin', '2020-01-01 03:11:53', '2020-01-01 03:11:53', 4, 'My menu', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `permissions` VALUES (24, 'menu.show', 'admin', '2020-01-01 03:11:53', '2020-01-01 03:11:53', 4, 'show', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `permissions` VALUES (25, 'menu.store', 'admin', '2020-01-01 03:11:53', '2020-01-01 03:11:53', 4, 'store', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `permissions` VALUES (26, 'menu.update', 'admin', '2020-01-01 03:11:53', '2020-01-01 03:11:53', 4, 'update', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `permissions` VALUES (27, 'menu.destroy', 'admin', '2020-01-01 03:11:53', '2020-01-01 03:11:53', 4, 'destroy', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `permissions` VALUES (28, 'permission-group.index', 'admin', '2020-01-01 03:11:53', '2020-01-01 03:11:53', 5, 'index', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `permissions` VALUES (29, 'permission-group.show', 'admin', '2020-01-01 03:11:53', '2020-01-01 03:11:53', 5, 'show', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `permissions` VALUES (30, 'permission-group.store', 'admin', '2020-01-01 03:11:53', '2020-01-01 03:11:53', 5, 'store', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `permissions` VALUES (31, 'permission-group.update', 'admin', '2020-01-01 03:11:53', '2020-01-01 03:11:53', 5, 'update', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `permissions` VALUES (32, 'permission-group.destroy', 'admin', '2020-01-01 03:11:53', '2020-01-01 03:11:53', 5, 'destroy', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `permissions` VALUES (33, 'permission-group.guard-name-for-permission', 'admin', '2020-01-01 03:11:53', '2020-01-01 03:11:53', 5, 'Guard name for permissions', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `permissions` VALUES (34, 'permission-group.all', 'admin', '2020-01-01 03:11:53', '2020-01-01 03:11:53', 5, 'All permission groups', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `permissions` VALUES (35, 'permission.all-user-permission', 'member', '2020-01-01 04:21:54', '2020-01-01 04:25:51', 5, '会员权限', 'list', 1, 'admin', 'admin', '所有会员权限');
INSERT INTO `permissions` VALUES (36, 'menu.my', 'member', '2020-01-01 04:29:15', '2020-01-01 04:29:15', 4, '我的列表', NULL, 0, 'admin', NULL, '我的菜单');
INSERT INTO `permissions` VALUES (37, 'article-category.index', 'admin', '2020-01-18 06:59:34', '2020-01-27 07:32:12', 6, '文章类别', NULL, 0, 'admin', 'admin', NULL);
INSERT INTO `permissions` VALUES (38, 'article-category.update', 'admin', '2020-01-18 10:09:16', '2020-01-27 07:31:29', 6, '修改文章类别', NULL, 0, 'admin', 'admin', NULL);
INSERT INTO `permissions` VALUES (39, 'article-category.store', 'admin', '2020-01-18 10:10:45', '2020-01-27 07:31:09', 6, '增加文章类别', NULL, 0, 'admin', 'admin', NULL);
INSERT INTO `permissions` VALUES (40, 'article-category.destroy', 'admin', '2020-01-18 10:22:32', '2020-01-19 11:04:20', 6, '删除文章类别', NULL, 0, 'admin', 'admin', NULL);
INSERT INTO `permissions` VALUES (43, 'article.index', 'admin', '2020-03-20 08:52:03', '2020-03-20 08:52:03', 6, '文章列表', NULL, 0, 'admin', NULL, NULL);
INSERT INTO `permissions` VALUES (44, 'article.store', 'admin', '2020-03-20 11:59:06', '2020-03-20 11:59:06', 6, '添加一篇文章', NULL, 0, 'admin', NULL, NULL);
INSERT INTO `permissions` VALUES (45, 'article.update', 'admin', '2020-03-20 12:02:36', '2020-03-20 12:02:36', 6, '修改文章', NULL, 0, 'admin', NULL, NULL);
INSERT INTO `permissions` VALUES (46, 'article.destroy', 'admin', '2020-03-20 12:25:23', '2020-03-20 12:25:23', 6, '删除文章', NULL, 0, 'admin', NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for role_has_permissions
-- ----------------------------
DROP TABLE IF EXISTS `role_has_permissions`;
CREATE TABLE `role_has_permissions` (
  `permission_id` bigint(20) unsigned NOT NULL,
  `role_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `role_has_permissions_role_id_foreign` (`role_id`),
  CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of role_has_permissions
-- ----------------------------
BEGIN;
INSERT INTO `role_has_permissions` VALUES (1, 1);
INSERT INTO `role_has_permissions` VALUES (2, 1);
INSERT INTO `role_has_permissions` VALUES (3, 1);
INSERT INTO `role_has_permissions` VALUES (4, 1);
INSERT INTO `role_has_permissions` VALUES (5, 1);
INSERT INTO `role_has_permissions` VALUES (6, 1);
INSERT INTO `role_has_permissions` VALUES (7, 1);
INSERT INTO `role_has_permissions` VALUES (8, 1);
INSERT INTO `role_has_permissions` VALUES (9, 1);
INSERT INTO `role_has_permissions` VALUES (10, 1);
INSERT INTO `role_has_permissions` VALUES (11, 1);
INSERT INTO `role_has_permissions` VALUES (12, 1);
INSERT INTO `role_has_permissions` VALUES (13, 1);
INSERT INTO `role_has_permissions` VALUES (14, 1);
INSERT INTO `role_has_permissions` VALUES (15, 1);
INSERT INTO `role_has_permissions` VALUES (16, 1);
INSERT INTO `role_has_permissions` VALUES (17, 1);
INSERT INTO `role_has_permissions` VALUES (18, 1);
INSERT INTO `role_has_permissions` VALUES (19, 1);
INSERT INTO `role_has_permissions` VALUES (20, 1);
INSERT INTO `role_has_permissions` VALUES (21, 1);
INSERT INTO `role_has_permissions` VALUES (22, 1);
INSERT INTO `role_has_permissions` VALUES (23, 1);
INSERT INTO `role_has_permissions` VALUES (24, 1);
INSERT INTO `role_has_permissions` VALUES (25, 1);
INSERT INTO `role_has_permissions` VALUES (26, 1);
INSERT INTO `role_has_permissions` VALUES (27, 1);
INSERT INTO `role_has_permissions` VALUES (28, 1);
INSERT INTO `role_has_permissions` VALUES (29, 1);
INSERT INTO `role_has_permissions` VALUES (30, 1);
INSERT INTO `role_has_permissions` VALUES (31, 1);
INSERT INTO `role_has_permissions` VALUES (32, 1);
INSERT INTO `role_has_permissions` VALUES (33, 1);
INSERT INTO `role_has_permissions` VALUES (34, 1);
INSERT INTO `role_has_permissions` VALUES (37, 1);
INSERT INTO `role_has_permissions` VALUES (38, 1);
INSERT INTO `role_has_permissions` VALUES (39, 1);
INSERT INTO `role_has_permissions` VALUES (40, 1);
INSERT INTO `role_has_permissions` VALUES (43, 1);
INSERT INTO `role_has_permissions` VALUES (44, 1);
INSERT INTO `role_has_permissions` VALUES (45, 1);
INSERT INTO `role_has_permissions` VALUES (46, 1);
INSERT INTO `role_has_permissions` VALUES (35, 4);
INSERT INTO `role_has_permissions` VALUES (36, 4);
COMMIT;

-- ----------------------------
-- Table structure for roles
-- ----------------------------
DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of roles
-- ----------------------------
BEGIN;
INSERT INTO `roles` VALUES (1, 'admin', 'admin', '2020-01-01 03:11:52', '2020-01-01 03:11:52', NULL);
INSERT INTO `roles` VALUES (4, 'member', 'member', '2020-01-01 04:31:05', '2020-01-01 04:31:05', NULL);
COMMIT;

-- ----------------------------
-- Table structure for tests
-- ----------------------------
DROP TABLE IF EXISTS `tests`;
CREATE TABLE `tests` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT '姓名',
  `created_at` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT '修改时间',
  `number` int(11) DEFAULT NULL COMMENT '学号',
  `class_id` varchar(50) DEFAULT NULL COMMENT '班级id',
  `body` text COMMENT '内容',
  PRIMARY KEY (`id`),
  UNIQUE KEY `number` (`number`) USING BTREE,
  KEY `name` (`name`) USING HASH,
  KEY `class_id` (`class_id`) USING HASH
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `api_token` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  UNIQUE KEY `users_api_token_unique` (`api_token`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of users
-- ----------------------------
BEGIN;
INSERT INTO `users` VALUES (1, '于鋆南', '1804905923@qq.com', NULL, '$2y$10$WIGGI1Qr86eWWwAwESDpDOUa7j7JlM.2RPAiwUueXe4UxPg8d9Cw6', NULL, NULL, '2020-01-07 00:53:35', '2020-01-07 00:53:35');
INSERT INTO `users` VALUES (24, '于鋆南', '1804905925@qq.com', NULL, '$2y$10$lqllVanCbfJ0LEPwfJ9jb.paLwyio7Y7LPyBa8M6iopuxVDEiDGFC', NULL, NULL, '2020-02-29 03:33:34', '2020-02-29 03:33:34');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
