/*
 Navicat Premium Data Transfer

 Source Server         : localhost mysql
 Source Server Type    : MySQL
 Source Server Version : 80030 (8.0.30)
 Source Host           : localhost:3306
 Source Schema         : tahfidz

 Target Server Type    : MySQL
 Target Server Version : 80030 (8.0.30)
 File Encoding         : 65001

 Date: 25/08/2024 23:23:25
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for migrations
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of migrations
-- ----------------------------
INSERT INTO `migrations` VALUES (1, '2024_06_03_041142_create_user_table', 1);
INSERT INTO `migrations` VALUES (2, '2024_06_03_042750_create_class_table', 1);
INSERT INTO `migrations` VALUES (3, '2024_06_03_042949_create_surah_table', 1);
INSERT INTO `migrations` VALUES (4, '2024_06_03_043613_create_user_token_table', 1);
INSERT INTO `migrations` VALUES (6, '2024_06_03_044924_create_sytem_log_table', 1);
INSERT INTO `migrations` VALUES (7, '2024_06_03_045155_create_siswa_table', 1);
INSERT INTO `migrations` VALUES (8, '2024_06_03_050203_create_siswa_has_surah_table', 1);
INSERT INTO `migrations` VALUES (10, '2024_06_03_074506_create_report_print_log_table', 1);
INSERT INTO `migrations` VALUES (11, '2024_06_03_074842_create_global_setting_table', 1);
INSERT INTO `migrations` VALUES (12, '2024_07_12_083949_create_permission_tables', 1);
INSERT INTO `migrations` VALUES (13, '2024_07_19_003209_create_siswa_has_parent', 1);
INSERT INTO `migrations` VALUES (14, '2024_07_22_002116_create_assessment_log', 1);
INSERT INTO `migrations` VALUES (15, '2024_07_25_011908_create_action_log', 1);
INSERT INTO `migrations` VALUES (16, '2024_07_29_213915_create_notification', 1);
INSERT INTO `migrations` VALUES (17, '2024_08_02_005836_create_user_notification', 1);
INSERT INTO `migrations` VALUES (18, '2024_08_02_005837_create_password_resets_table', 1);
INSERT INTO `migrations` VALUES (19, '2024_08_13_130004_create_user_login_history', 1);

-- ----------------------------
-- Table structure for model_has_permissions
-- ----------------------------
DROP TABLE IF EXISTS `model_has_permissions`;
CREATE TABLE `model_has_permissions`  (
  `permission_id` int UNSIGNED NOT NULL,
  `model_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint UNSIGNED NOT NULL,
  PRIMARY KEY (`permission_id`, `model_id`, `model_type`) USING BTREE,
  INDEX `model_has_permissions_model_id_model_type_index`(`model_id` ASC, `model_type` ASC) USING BTREE,
  CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of model_has_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for model_has_roles
-- ----------------------------
DROP TABLE IF EXISTS `model_has_roles`;
CREATE TABLE `model_has_roles`  (
  `role_id` int UNSIGNED NOT NULL,
  `model_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint UNSIGNED NOT NULL,
  PRIMARY KEY (`role_id`, `model_id`, `model_type`) USING BTREE,
  INDEX `model_has_roles_model_id_model_type_index`(`model_id` ASC, `model_type` ASC) USING BTREE,
  CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of model_has_roles
-- ----------------------------
INSERT INTO `model_has_roles` VALUES (2, 'App\\Model\\User\\User', 1);
INSERT INTO `model_has_roles` VALUES (1, 'App\\Model\\User\\User', 2);
INSERT INTO `model_has_roles` VALUES (3, 'App\\Model\\User\\User', 3);

-- ----------------------------
-- Table structure for password_resets
-- ----------------------------
DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE `password_resets`  (
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  INDEX `password_resets_email_index`(`email` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of password_resets
-- ----------------------------
INSERT INTO `password_resets` VALUES ('admin@admin.com', '$2y$10$bl2JXmdOYPBb7ThGvt0Exez2QDm2uB00aJ8MBbWI5yjQJ2ZlHtfXy', '2024-08-12 00:19:47');

-- ----------------------------
-- Table structure for permissions
-- ----------------------------
DROP TABLE IF EXISTS `permissions`;
CREATE TABLE `permissions`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 41 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of permissions
-- ----------------------------
INSERT INTO `permissions` VALUES (1, 'index home', 'web', '2024-08-11 23:24:03', '2024-08-11 23:24:03');
INSERT INTO `permissions` VALUES (2, 'index surah', 'web', '2024-08-11 23:24:03', '2024-08-11 23:24:03');
INSERT INTO `permissions` VALUES (3, 'view surah', 'web', '2024-08-11 23:24:03', '2024-08-11 23:24:03');
INSERT INTO `permissions` VALUES (4, 'create surah', 'web', '2024-08-11 23:24:03', '2024-08-11 23:24:03');
INSERT INTO `permissions` VALUES (5, 'update surah', 'web', '2024-08-11 23:24:03', '2024-08-11 23:24:03');
INSERT INTO `permissions` VALUES (6, 'delete surah', 'web', '2024-08-11 23:24:03', '2024-08-11 23:24:03');
INSERT INTO `permissions` VALUES (7, 'index user', 'web', '2024-08-11 23:24:03', '2024-08-11 23:24:03');
INSERT INTO `permissions` VALUES (8, 'view user', 'web', '2024-08-11 23:24:03', '2024-08-11 23:24:03');
INSERT INTO `permissions` VALUES (9, 'create user', 'web', '2024-08-11 23:24:03', '2024-08-11 23:24:03');
INSERT INTO `permissions` VALUES (10, 'update user', 'web', '2024-08-11 23:24:03', '2024-08-11 23:24:03');
INSERT INTO `permissions` VALUES (11, 'delete user', 'web', '2024-08-11 23:24:03', '2024-08-11 23:24:03');
INSERT INTO `permissions` VALUES (12, 'index class', 'web', '2024-08-11 23:24:03', '2024-08-11 23:24:03');
INSERT INTO `permissions` VALUES (13, 'view class', 'web', '2024-08-11 23:24:03', '2024-08-11 23:24:03');
INSERT INTO `permissions` VALUES (14, 'create class', 'web', '2024-08-11 23:24:03', '2024-08-11 23:24:03');
INSERT INTO `permissions` VALUES (15, 'update class', 'web', '2024-08-11 23:24:03', '2024-08-11 23:24:03');
INSERT INTO `permissions` VALUES (16, 'delete class', 'web', '2024-08-11 23:24:03', '2024-08-11 23:24:03');
INSERT INTO `permissions` VALUES (22, 'index siswa', 'web', '2024-08-11 23:24:03', '2024-08-11 23:24:03');
INSERT INTO `permissions` VALUES (23, 'view siswa', 'web', '2024-08-11 23:24:03', '2024-08-11 23:24:03');
INSERT INTO `permissions` VALUES (24, 'create siswa', 'web', '2024-08-11 23:24:03', '2024-08-11 23:24:03');
INSERT INTO `permissions` VALUES (25, 'update siswa', 'web', '2024-08-11 23:24:03', '2024-08-11 23:24:03');
INSERT INTO `permissions` VALUES (26, 'delete siswa', 'web', '2024-08-11 23:24:03', '2024-08-11 23:24:03');
INSERT INTO `permissions` VALUES (27, 'index parent', 'web', '2024-08-11 23:24:03', '2024-08-11 23:24:03');
INSERT INTO `permissions` VALUES (28, 'change password', 'web', '2024-08-11 23:24:03', '2024-08-11 23:24:03');
INSERT INTO `permissions` VALUES (29, 'create parent', 'web', '2024-08-11 23:24:03', '2024-08-11 23:24:03');
INSERT INTO `permissions` VALUES (30, 'update parent', 'web', '2024-08-11 23:24:03', '2024-08-11 23:24:03');
INSERT INTO `permissions` VALUES (31, 'delete parent', 'web', '2024-08-11 23:24:03', '2024-08-11 23:24:03');
INSERT INTO `permissions` VALUES (32, 'index assessment', 'web', '2024-08-11 23:24:03', '2024-08-11 23:24:03');
INSERT INTO `permissions` VALUES (33, 'create assessment', 'web', '2024-08-11 23:24:03', '2024-08-11 23:24:03');
INSERT INTO `permissions` VALUES (34, 'index role', 'web', '2024-08-11 23:24:03', '2024-08-11 23:24:03');
INSERT INTO `permissions` VALUES (35, 'update role', 'web', '2024-08-11 23:24:03', '2024-08-11 23:24:03');
INSERT INTO `permissions` VALUES (36, 'all report', 'web', '2024-08-11 23:24:03', '2024-08-11 23:24:03');
INSERT INTO `permissions` VALUES (37, 'index profile', 'web', '2024-08-11 23:24:03', '2024-08-11 23:24:03');
INSERT INTO `permissions` VALUES (38, 'update profile', 'web', '2024-08-11 23:24:03', '2024-08-11 23:24:03');
INSERT INTO `permissions` VALUES (39, 'index notification', 'web', '2024-08-11 23:24:03', '2024-08-11 23:24:03');
INSERT INTO `permissions` VALUES (40, 'create notification', 'web', '2024-08-11 23:24:03', '2024-08-11 23:24:03');

-- ----------------------------
-- Table structure for role_has_permissions
-- ----------------------------
DROP TABLE IF EXISTS `role_has_permissions`;
CREATE TABLE `role_has_permissions`  (
  `permission_id` int UNSIGNED NOT NULL,
  `role_id` int UNSIGNED NOT NULL,
  PRIMARY KEY (`permission_id`, `role_id`) USING BTREE,
  INDEX `role_has_permissions_role_id_foreign`(`role_id` ASC) USING BTREE,
  CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of role_has_permissions
-- ----------------------------
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
INSERT INTO `role_has_permissions` VALUES (22, 1);
INSERT INTO `role_has_permissions` VALUES (23, 1);
INSERT INTO `role_has_permissions` VALUES (24, 1);
INSERT INTO `role_has_permissions` VALUES (25, 1);
INSERT INTO `role_has_permissions` VALUES (26, 1);
INSERT INTO `role_has_permissions` VALUES (27, 1);
INSERT INTO `role_has_permissions` VALUES (28, 1);
INSERT INTO `role_has_permissions` VALUES (30, 1);
INSERT INTO `role_has_permissions` VALUES (31, 1);
INSERT INTO `role_has_permissions` VALUES (32, 1);
INSERT INTO `role_has_permissions` VALUES (33, 1);
INSERT INTO `role_has_permissions` VALUES (34, 1);
INSERT INTO `role_has_permissions` VALUES (35, 1);
INSERT INTO `role_has_permissions` VALUES (36, 1);
INSERT INTO `role_has_permissions` VALUES (37, 1);
INSERT INTO `role_has_permissions` VALUES (38, 1);
INSERT INTO `role_has_permissions` VALUES (39, 1);
INSERT INTO `role_has_permissions` VALUES (40, 1);
INSERT INTO `role_has_permissions` VALUES (1, 2);
INSERT INTO `role_has_permissions` VALUES (2, 2);
INSERT INTO `role_has_permissions` VALUES (3, 2);
INSERT INTO `role_has_permissions` VALUES (4, 2);
INSERT INTO `role_has_permissions` VALUES (5, 2);
INSERT INTO `role_has_permissions` VALUES (6, 2);
INSERT INTO `role_has_permissions` VALUES (7, 2);
INSERT INTO `role_has_permissions` VALUES (8, 2);
INSERT INTO `role_has_permissions` VALUES (9, 2);
INSERT INTO `role_has_permissions` VALUES (10, 2);
INSERT INTO `role_has_permissions` VALUES (11, 2);
INSERT INTO `role_has_permissions` VALUES (12, 2);
INSERT INTO `role_has_permissions` VALUES (13, 2);
INSERT INTO `role_has_permissions` VALUES (14, 2);
INSERT INTO `role_has_permissions` VALUES (15, 2);
INSERT INTO `role_has_permissions` VALUES (16, 2);
INSERT INTO `role_has_permissions` VALUES (22, 2);
INSERT INTO `role_has_permissions` VALUES (23, 2);
INSERT INTO `role_has_permissions` VALUES (24, 2);
INSERT INTO `role_has_permissions` VALUES (25, 2);
INSERT INTO `role_has_permissions` VALUES (26, 2);
INSERT INTO `role_has_permissions` VALUES (27, 2);
INSERT INTO `role_has_permissions` VALUES (28, 2);
INSERT INTO `role_has_permissions` VALUES (29, 2);
INSERT INTO `role_has_permissions` VALUES (30, 2);
INSERT INTO `role_has_permissions` VALUES (31, 2);
INSERT INTO `role_has_permissions` VALUES (32, 2);
INSERT INTO `role_has_permissions` VALUES (33, 2);
INSERT INTO `role_has_permissions` VALUES (34, 2);
INSERT INTO `role_has_permissions` VALUES (35, 2);
INSERT INTO `role_has_permissions` VALUES (36, 2);
INSERT INTO `role_has_permissions` VALUES (37, 2);
INSERT INTO `role_has_permissions` VALUES (38, 2);
INSERT INTO `role_has_permissions` VALUES (39, 2);
INSERT INTO `role_has_permissions` VALUES (40, 2);
INSERT INTO `role_has_permissions` VALUES (1, 3);
INSERT INTO `role_has_permissions` VALUES (28, 3);
INSERT INTO `role_has_permissions` VALUES (32, 3);
INSERT INTO `role_has_permissions` VALUES (33, 3);
INSERT INTO `role_has_permissions` VALUES (36, 3);
INSERT INTO `role_has_permissions` VALUES (37, 3);
INSERT INTO `role_has_permissions` VALUES (38, 3);

-- ----------------------------
-- Table structure for roles
-- ----------------------------
DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of roles
-- ----------------------------
INSERT INTO `roles` VALUES (1, 'Admin', 'web', '2024-08-11 23:24:10', '2024-08-11 23:24:10');
INSERT INTO `roles` VALUES (2, 'Creator', 'web', '2024-08-11 23:24:11', '2024-08-11 23:24:11');
INSERT INTO `roles` VALUES (3, 'Guru', 'web', '2024-08-11 23:24:11', '2024-08-11 23:24:11');

-- ----------------------------
-- Table structure for tbl_action_log
-- ----------------------------
DROP TABLE IF EXISTS `tbl_action_log`;
CREATE TABLE `tbl_action_log`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint UNSIGNED NULL DEFAULT NULL,
  `action_type` int NOT NULL,
  `is_error` int NOT NULL,
  `action_message` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` datetime NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `tbl_action_log_user_id_foreign`(`user_id` ASC) USING BTREE,
  CONSTRAINT `tbl_action_log_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `tbl_user` (`id`) ON DELETE SET NULL ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 461 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tbl_action_log
-- ----------------------------
INSERT INTO `tbl_action_log` VALUES (451, 3, 10, 0, 'Mengakses Halaman Assessment', '2024-08-25 23:04:39', '2024-08-25 23:04:39', '2024-08-25 23:04:39');
INSERT INTO `tbl_action_log` VALUES (452, 3, 10, 0, 'Mengakses Halaman Assessment', '2024-08-25 23:04:41', '2024-08-25 23:04:41', '2024-08-25 23:04:41');
INSERT INTO `tbl_action_log` VALUES (453, 3, 10, 0, 'Mengakses Halaman Home', '2024-08-25 23:04:43', '2024-08-25 23:04:43', '2024-08-25 23:04:43');
INSERT INTO `tbl_action_log` VALUES (454, 3, 10, 0, 'Mengakses Halaman Assessment', '2024-08-25 23:04:44', '2024-08-25 23:04:44', '2024-08-25 23:04:44');
INSERT INTO `tbl_action_log` VALUES (455, 2, 10, 0, 'Mengakses Halaman Home', '2024-08-25 23:04:55', '2024-08-25 23:04:55', '2024-08-25 23:04:55');
INSERT INTO `tbl_action_log` VALUES (456, 2, 10, 0, 'Mengakses halaman manajemen user', '2024-08-25 23:04:58', '2024-08-25 23:04:58', '2024-08-25 23:04:58');
INSERT INTO `tbl_action_log` VALUES (457, 2, 10, 0, 'Mengakses Halaman Orangtua', '2024-08-25 23:05:03', '2024-08-25 23:05:03', '2024-08-25 23:05:03');
INSERT INTO `tbl_action_log` VALUES (458, 2, 10, 0, 'Mengakses Halaman Orangtua', '2024-08-25 23:05:06', '2024-08-25 23:05:06', '2024-08-25 23:05:06');
INSERT INTO `tbl_action_log` VALUES (459, 2, 10, 0, 'Mengupdate Orangtua', '2024-08-25 23:05:32', '2024-08-25 23:05:32', '2024-08-25 23:05:32');
INSERT INTO `tbl_action_log` VALUES (460, 2, 10, 0, 'Mengakses Halaman Home', '2024-08-25 23:05:45', '2024-08-25 23:05:45', '2024-08-25 23:05:45');

-- ----------------------------
-- Table structure for tbl_assessment_log
-- ----------------------------
DROP TABLE IF EXISTS `tbl_assessment_log`;
CREATE TABLE `tbl_assessment_log`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `siswa_id` bigint UNSIGNED NULL DEFAULT NULL,
  `assessment` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `range` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `note` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` datetime NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `tbl_assessment_log_siswa_id_foreign`(`siswa_id` ASC) USING BTREE,
  CONSTRAINT `tbl_assessment_log_siswa_id_foreign` FOREIGN KEY (`siswa_id`) REFERENCES `tbl_siswa` (`id`) ON DELETE SET NULL ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tbl_assessment_log
-- ----------------------------
INSERT INTO `tbl_assessment_log` VALUES (2, NULL, 'Surat An-Naas', '1-2', 'bagus', '2024-08-16 19:14:48', '2024-08-16 19:14:48', '2024-08-16 19:14:48');
INSERT INTO `tbl_assessment_log` VALUES (3, 1, 'Surat Al-Fatihah', '1-1', '1', '2024-08-22 20:24:49', '2024-08-22 20:24:49', '2024-08-22 20:24:49');
INSERT INTO `tbl_assessment_log` VALUES (4, NULL, 'Surat Al-Fatihah', '1-1', '1', '2024-08-25 22:39:19', '2024-08-25 22:39:19', '2024-08-25 22:39:19');
INSERT INTO `tbl_assessment_log` VALUES (5, 1, 'Surat Al-Baqaraa', '1-1', '1', '2024-08-25 22:39:37', '2024-08-25 22:39:37', '2024-08-25 22:39:37');

-- ----------------------------
-- Table structure for tbl_class
-- ----------------------------
DROP TABLE IF EXISTS `tbl_class`;
CREATE TABLE `tbl_class`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `angkatan` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `class_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `note` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `teacher_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `tbl_class_teacher_id_foreign`(`teacher_id` ASC) USING BTREE,
  CONSTRAINT `tbl_class_teacher_id_foreign` FOREIGN KEY (`teacher_id`) REFERENCES `tbl_user` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tbl_class
-- ----------------------------
INSERT INTO `tbl_class` VALUES (1, '2024', 'VII-A', 'Kelas Tahfidz', 3, '2024-08-11 23:37:03', '2024-08-25 23:22:35');

-- ----------------------------
-- Table structure for tbl_global_setting
-- ----------------------------
DROP TABLE IF EXISTS `tbl_global_setting`;
CREATE TABLE `tbl_global_setting`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `use_log_setting` tinyint NOT NULL DEFAULT 10,
  `use_log_print` tinyint NOT NULL DEFAULT 10,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tbl_global_setting
-- ----------------------------

-- ----------------------------
-- Table structure for tbl_notification
-- ----------------------------
DROP TABLE IF EXISTS `tbl_notification`;
CREATE TABLE `tbl_notification`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `notification_type` int NOT NULL,
  `notification_title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `notification_message` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` datetime NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tbl_notification
-- ----------------------------

-- ----------------------------
-- Table structure for tbl_report_print_log
-- ----------------------------
DROP TABLE IF EXISTS `tbl_report_print_log`;
CREATE TABLE `tbl_report_print_log`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `print_by` bigint UNSIGNED NOT NULL,
  `date` datetime NOT NULL,
  `note` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `tbl_report_print_log_print_by_foreign`(`print_by` ASC) USING BTREE,
  CONSTRAINT `tbl_report_print_log_print_by_foreign` FOREIGN KEY (`print_by`) REFERENCES `tbl_user` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tbl_report_print_log
-- ----------------------------

-- ----------------------------
-- Table structure for tbl_siswa
-- ----------------------------
DROP TABLE IF EXISTS `tbl_siswa`;
CREATE TABLE `tbl_siswa`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `siswa_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `memorization_type` int NOT NULL,
  `class_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `tbl_siswa_class_id_foreign`(`class_id` ASC) USING BTREE,
  CONSTRAINT `tbl_siswa_class_id_foreign` FOREIGN KEY (`class_id`) REFERENCES `tbl_class` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 75 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tbl_siswa
-- ----------------------------
INSERT INTO `tbl_siswa` VALUES (1, 'ADITYA PRATAMA', 10, 1, '2024-08-11 23:39:10', '2024-08-11 23:39:10');
INSERT INTO `tbl_siswa` VALUES (5, 'ANISA NURAULIA', 20, 1, '2024-08-11 23:40:11', '2024-08-11 23:40:11');

-- ----------------------------
-- Table structure for tbl_siswa_has_parent
-- ----------------------------
DROP TABLE IF EXISTS `tbl_siswa_has_parent`;
CREATE TABLE `tbl_siswa_has_parent`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `parent_id` bigint UNSIGNED NOT NULL,
  `siswa_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `tbl_siswa_has_parent_parent_id_foreign`(`parent_id` ASC) USING BTREE,
  INDEX `tbl_siswa_has_parent_siswa_id_foreign`(`siswa_id` ASC) USING BTREE,
  CONSTRAINT `tbl_siswa_has_parent_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `tbl_user` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `tbl_siswa_has_parent_siswa_id_foreign` FOREIGN KEY (`siswa_id`) REFERENCES `tbl_siswa` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tbl_siswa_has_parent
-- ----------------------------
INSERT INTO `tbl_siswa_has_parent` VALUES (3, 4, 5, '2024-08-25 23:05:32', '2024-08-25 23:05:32');

-- ----------------------------
-- Table structure for tbl_siswa_has_surah
-- ----------------------------
DROP TABLE IF EXISTS `tbl_siswa_has_surah`;
CREATE TABLE `tbl_siswa_has_surah`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `siswa_id` bigint UNSIGNED NULL DEFAULT NULL,
  `surah_id` bigint UNSIGNED NULL DEFAULT NULL,
  `ayat` int NOT NULL,
  `date` datetime NOT NULL,
  `note` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `group_ayat` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `tbl_siswa_has_surah_siswa_id_foreign`(`siswa_id` ASC) USING BTREE,
  INDEX `tbl_siswa_has_surah_surah_id_foreign`(`surah_id` ASC) USING BTREE,
  CONSTRAINT `tbl_siswa_has_surah_siswa_id_foreign` FOREIGN KEY (`siswa_id`) REFERENCES `tbl_siswa` (`id`) ON DELETE SET NULL ON UPDATE RESTRICT,
  CONSTRAINT `tbl_siswa_has_surah_surah_id_foreign` FOREIGN KEY (`surah_id`) REFERENCES `tbl_surah` (`id`) ON DELETE SET NULL ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tbl_siswa_has_surah
-- ----------------------------
INSERT INTO `tbl_siswa_has_surah` VALUES (1, NULL, 114, 1, '2024-08-16 19:14:48', 'bagus', '1-2', '2024-08-16 19:14:48', '2024-08-16 19:14:48');
INSERT INTO `tbl_siswa_has_surah` VALUES (2, NULL, 114, 2, '2024-08-16 19:14:48', 'bagus', '1-2', '2024-08-16 19:14:48', '2024-08-16 19:14:48');
INSERT INTO `tbl_siswa_has_surah` VALUES (3, 1, 1, 1, '2024-08-22 20:24:49', '1', '1-1', '2024-08-22 20:24:49', '2024-08-22 20:24:49');
INSERT INTO `tbl_siswa_has_surah` VALUES (4, NULL, 1, 1, '2024-08-25 22:39:19', '1', '1-1', '2024-08-25 22:39:19', '2024-08-25 22:39:19');
INSERT INTO `tbl_siswa_has_surah` VALUES (5, 1, 2, 1, '2024-08-25 22:39:37', '1', '1-1', '2024-08-25 22:39:37', '2024-08-25 22:39:37');

-- ----------------------------
-- Table structure for tbl_surah
-- ----------------------------
DROP TABLE IF EXISTS `tbl_surah`;
CREATE TABLE `tbl_surah`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `surah_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_ayat` int NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 115 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tbl_surah
-- ----------------------------
INSERT INTO `tbl_surah` VALUES (1, 'Al-Fatihah', 7, '2024-08-12 00:00:53', '2024-08-12 00:00:53');
INSERT INTO `tbl_surah` VALUES (2, 'Al-Baqaraa', 286, '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `tbl_surah` VALUES (3, 'Aali Imraan', 200, '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `tbl_surah` VALUES (4, 'An-Nisaa', 176, '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `tbl_surah` VALUES (5, 'Al-Maaida', 120, '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `tbl_surah` VALUES (6, 'Al-An\'aam', 165, '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `tbl_surah` VALUES (7, 'Al-A\'raaf', 206, '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `tbl_surah` VALUES (8, 'Al-Anfaal', 75, '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `tbl_surah` VALUES (9, 'At-Tawba', 129, '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `tbl_surah` VALUES (10, 'Yunus', 109, '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `tbl_surah` VALUES (11, 'Hud', 123, '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `tbl_surah` VALUES (12, 'Yusuf', 111, '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `tbl_surah` VALUES (13, 'Ar-Ra\'d', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `tbl_surah` VALUES (14, 'Ibrahim', 52, '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `tbl_surah` VALUES (15, 'Al-Hijr', 99, '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `tbl_surah` VALUES (16, 'An-Nahl', 128, '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `tbl_surah` VALUES (17, 'Al-Israa', 111, '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `tbl_surah` VALUES (18, 'Al-Kahf', 110, '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `tbl_surah` VALUES (19, 'Maryam', 98, '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `tbl_surah` VALUES (20, 'Taa-Haa', 135, '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `tbl_surah` VALUES (21, 'Al-Anbiyaa', 112, '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `tbl_surah` VALUES (22, 'Al-Hajj', 78, '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `tbl_surah` VALUES (23, 'Al-Muminoon', 118, '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `tbl_surah` VALUES (24, 'An-Noor', 64, '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `tbl_surah` VALUES (25, 'Al-Furqaan', 77, '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `tbl_surah` VALUES (26, 'Ash-Shu\'araa', 227, '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `tbl_surah` VALUES (27, 'An-Naml', 93, '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `tbl_surah` VALUES (28, 'Al-Qasas', 88, '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `tbl_surah` VALUES (29, 'Al-Ankaboot', 69, '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `tbl_surah` VALUES (30, 'Ar-Room', 60, '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `tbl_surah` VALUES (31, 'Luqman', 34, '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `tbl_surah` VALUES (32, 'As-Sajda', 30, '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `tbl_surah` VALUES (33, 'Al-Ahzaab', 73, '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `tbl_surah` VALUES (34, 'Saba', 54, '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `tbl_surah` VALUES (35, 'Faatir', 45, '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `tbl_surah` VALUES (36, 'Yaseen', 83, '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `tbl_surah` VALUES (37, 'As-Saaffaat', 182, '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `tbl_surah` VALUES (38, 'Saad', 88, '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `tbl_surah` VALUES (39, 'Az-Zumar', 75, '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `tbl_surah` VALUES (40, 'Ghaafir', 85, '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `tbl_surah` VALUES (41, 'Fussilat', 54, '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `tbl_surah` VALUES (42, 'Ash-Shura', 53, '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `tbl_surah` VALUES (43, 'Az-Zukhruf', 89, '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `tbl_surah` VALUES (44, 'Ad-Dukhaan', 59, '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `tbl_surah` VALUES (45, 'Al-Jaathiya', 37, '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `tbl_surah` VALUES (46, 'Al-Ahqaf', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `tbl_surah` VALUES (47, 'Muhammad', 38, '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `tbl_surah` VALUES (48, 'Al-Fath', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `tbl_surah` VALUES (49, 'Al-Hujuraat', 18, '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `tbl_surah` VALUES (50, 'Qaaf', 45, '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `tbl_surah` VALUES (51, 'Adh-Dhaariyat', 60, '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `tbl_surah` VALUES (52, 'At-Tur', 49, '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `tbl_surah` VALUES (53, 'An-Najm', 62, '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `tbl_surah` VALUES (54, 'Al-Qamar', 55, '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `tbl_surah` VALUES (55, 'Ar-Rahmaan', 78, '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `tbl_surah` VALUES (56, 'Al-Waaqia', 96, '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `tbl_surah` VALUES (57, 'Al-Hadid', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `tbl_surah` VALUES (58, 'Al-Mujaadila', 22, '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `tbl_surah` VALUES (59, 'Al-Hashr', 24, '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `tbl_surah` VALUES (60, 'Al-Mumtahana', 13, '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `tbl_surah` VALUES (61, 'As-Saff', 14, '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `tbl_surah` VALUES (62, 'Al-Jumu\'a', 11, '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `tbl_surah` VALUES (63, 'Al-Munaafiqoon', 11, '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `tbl_surah` VALUES (64, 'At-Taghaabun', 18, '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `tbl_surah` VALUES (65, 'At-Talaaq', 12, '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `tbl_surah` VALUES (66, 'At-Tahrim', 12, '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `tbl_surah` VALUES (67, 'Al-Mulk', 30, '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `tbl_surah` VALUES (68, 'Al-Qalam', 52, '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `tbl_surah` VALUES (69, 'Al-Haaqqa', 52, '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `tbl_surah` VALUES (70, 'Al-Ma\'aarij', 44, '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `tbl_surah` VALUES (71, 'Nooh', 28, '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `tbl_surah` VALUES (72, 'Al-Jinn', 28, '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `tbl_surah` VALUES (73, 'Al-Muzzammil', 20, '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `tbl_surah` VALUES (74, 'Al-Muddaththir', 56, '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `tbl_surah` VALUES (75, 'Al-Qiyaama', 40, '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `tbl_surah` VALUES (76, 'Al-Insaan', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `tbl_surah` VALUES (77, 'Al-Mursalaat', 50, '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `tbl_surah` VALUES (78, 'An-Naba', 40, '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `tbl_surah` VALUES (79, 'An-Naazi\'aat', 46, '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `tbl_surah` VALUES (80, 'Abasa', 42, '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `tbl_surah` VALUES (81, 'At-Takwir', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `tbl_surah` VALUES (82, 'Al-Infitaar', 19, '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `tbl_surah` VALUES (83, 'Al-Mutaffifin', 36, '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `tbl_surah` VALUES (84, 'Al-Inshiqaaq', 25, '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `tbl_surah` VALUES (85, 'Al-Burooj', 22, '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `tbl_surah` VALUES (86, 'At-Taariq', 17, '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `tbl_surah` VALUES (87, 'Al-A\'laa', 19, '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `tbl_surah` VALUES (88, 'Al-Ghaashiya', 26, '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `tbl_surah` VALUES (89, 'Al-Fajr', 30, '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `tbl_surah` VALUES (90, 'Al-Balad', 20, '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `tbl_surah` VALUES (91, 'Ash-Shams', 15, '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `tbl_surah` VALUES (92, 'Al-Lail', 21, '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `tbl_surah` VALUES (93, 'Ad-Dhuhaa', 11, '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `tbl_surah` VALUES (94, 'Ash-Sharh', 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `tbl_surah` VALUES (95, 'At-Tin', 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `tbl_surah` VALUES (96, 'Al-Alaq', 19, '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `tbl_surah` VALUES (97, 'Al-Qadr', 5, '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `tbl_surah` VALUES (98, 'Al-Bayyina', 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `tbl_surah` VALUES (99, 'Az-Zalzala', 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `tbl_surah` VALUES (100, 'Al-Aadiyaat', 11, '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `tbl_surah` VALUES (101, 'Al-Qaari\'a', 11, '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `tbl_surah` VALUES (102, 'At-Takaathur', 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `tbl_surah` VALUES (103, 'Al-Asr', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `tbl_surah` VALUES (104, 'Al-Humaza', 9, '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `tbl_surah` VALUES (105, 'Al-Fil', 5, '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `tbl_surah` VALUES (106, 'Quraish', 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `tbl_surah` VALUES (107, 'Al-Maa\'un', 7, '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `tbl_surah` VALUES (108, 'Al-Kawthar', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `tbl_surah` VALUES (109, 'Al-Kaafiroon', 6, '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `tbl_surah` VALUES (110, 'An-Nasr', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `tbl_surah` VALUES (111, 'Al-Masad', 5, '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `tbl_surah` VALUES (112, 'Al-Ikhlaas', 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `tbl_surah` VALUES (113, 'Al-Falaq', 5, '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `tbl_surah` VALUES (114, 'An-Naas', 6, '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- ----------------------------
-- Table structure for tbl_system_log
-- ----------------------------
DROP TABLE IF EXISTS `tbl_system_log`;
CREATE TABLE `tbl_system_log`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `action` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` datetime NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `tbl_system_log_user_id_unique`(`user_id` ASC) USING BTREE,
  CONSTRAINT `tbl_system_log_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `tbl_user` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tbl_system_log
-- ----------------------------

-- ----------------------------
-- Table structure for tbl_user
-- ----------------------------
DROP TABLE IF EXISTS `tbl_user`;
CREATE TABLE `tbl_user`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `username` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `full_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `profile_picture` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `account_type` tinyint NOT NULL DEFAULT 10,
  `password` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int NOT NULL,
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `last_login_at` datetime NULL DEFAULT NULL,
  `last_login_ip` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `tbl_user_email_unique`(`email` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tbl_user
-- ----------------------------
INSERT INTO `tbl_user` VALUES (1, 'superadmin', NULL, 'Super Admin', '1691771219.jpg', 10, '$2y$10$i5uzbY6sO.lLFKLPk3uon.PM7pjeJWTC8IPqFANNO1hi3gse8i.B6', 10, 'admin@gmail.com', NULL, NULL, NULL, NULL, '2024-08-11 23:15:48', '2024-08-25 22:48:40');
INSERT INTO `tbl_user` VALUES (2, 'admin', NULL, 'Admin', NULL, 20, '$2y$10$Rhma2R71VjRboSSo6psZYORAi.zLuSFujJZURxEuNde1zLYXYPGJO', 10, 'test@gmail.com', NULL, NULL, NULL, NULL, '2024-08-11 23:32:37', '2024-08-25 22:48:42');
INSERT INTO `tbl_user` VALUES (3, 'guru', NULL, 'syahrl', NULL, 40, '$2y$10$5WdiPR3BbEXbVBX5qzG44eyn6w.1oQ2OJGEAttq1URuVXeolOR97a', 10, 'guru@guru.com', NULL, NULL, NULL, NULL, '2024-08-11 23:33:18', '2024-08-25 22:48:45');
INSERT INTO `tbl_user` VALUES (4, 'hafa', 'bogor', 'geri', NULL, 30, '$2y$10$xC21cXMWW3sG7mx9.2JH0O.ExGtDFTCHPP4MKyPG64I5UuqMj1LuW', 10, 'garry@gmail.com', NULL, NULL, NULL, NULL, '2024-08-11 23:42:17', '2024-08-25 23:05:32');

-- ----------------------------
-- Table structure for tbl_user_login_history
-- ----------------------------
DROP TABLE IF EXISTS `tbl_user_login_history`;
CREATE TABLE `tbl_user_login_history`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint UNSIGNED NOT NULL,
  `last_login_ip` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `date` datetime NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `tbl_user_login_history_user_id_foreign`(`user_id` ASC) USING BTREE,
  CONSTRAINT `tbl_user_login_history_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `tbl_user` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 50 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tbl_user_login_history
-- ----------------------------
INSERT INTO `tbl_user_login_history` VALUES (49, 2, '127.0.0.1', '2024-08-25 23:04:55', '2024-08-25 23:04:55', '2024-08-25 23:04:55');

-- ----------------------------
-- Table structure for tbl_user_notification
-- ----------------------------
DROP TABLE IF EXISTS `tbl_user_notification`;
CREATE TABLE `tbl_user_notification`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint UNSIGNED NULL DEFAULT NULL,
  `notification_id` bigint UNSIGNED NULL DEFAULT NULL,
  `status` int NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `tbl_user_notification_user_id_foreign`(`user_id` ASC) USING BTREE,
  INDEX `tbl_user_notification_notification_id_foreign`(`notification_id` ASC) USING BTREE,
  CONSTRAINT `tbl_user_notification_notification_id_foreign` FOREIGN KEY (`notification_id`) REFERENCES `tbl_notification` (`id`) ON DELETE SET NULL ON UPDATE RESTRICT,
  CONSTRAINT `tbl_user_notification_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `tbl_user` (`id`) ON DELETE SET NULL ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tbl_user_notification
-- ----------------------------

-- ----------------------------
-- Table structure for tbl_user_token
-- ----------------------------
DROP TABLE IF EXISTS `tbl_user_token`;
CREATE TABLE `tbl_user_token`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint UNSIGNED NOT NULL,
  `token` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_expired` int NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `tbl_user_token_user_id_foreign`(`user_id` ASC) USING BTREE,
  CONSTRAINT `tbl_user_token_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `tbl_user` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tbl_user_token
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;
