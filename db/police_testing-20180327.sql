/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50534
Source Host           : localhost:3306
Source Database       : police_testing

Target Server Type    : MYSQL
Target Server Version : 50534
File Encoding         : 65001

Date: 2018-03-27 23:22:32
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for role_menu
-- ----------------------------
DROP TABLE IF EXISTS `role_menu`;
CREATE TABLE `role_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) DEFAULT NULL COMMENT '角色ID',
  `menu_id` int(11) NOT NULL COMMENT '菜单ID',
  `menu_name` varchar(200) DEFAULT NULL,
  `role_name` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `role_id` (`role_id`),
  KEY `menu_id` (`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role_menu
-- ----------------------------

-- ----------------------------
-- Table structure for role_permission
-- ----------------------------
DROP TABLE IF EXISTS `role_permission`;
CREATE TABLE `role_permission` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(100) DEFAULT NULL,
  `permission` varchar(100) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  `menu_id` int(11) DEFAULT NULL,
  `menu_name` varchar(100) DEFAULT NULL,
  `available` int(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role_permission
-- ----------------------------

-- ----------------------------
-- Table structure for sys_department
-- ----------------------------
DROP TABLE IF EXISTS `sys_department`;
CREATE TABLE `sys_department` (
  `auto_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `organization_id` varchar(50) DEFAULT NULL COMMENT '机构编码',
  `organization_name` varchar(50) DEFAULT NULL COMMENT '机构名称',
  `department_id` varchar(50) DEFAULT NULL COMMENT '部门编码',
  `department_name` varchar(50) DEFAULT NULL COMMENT '用户所属部门',
  `status` varchar(10) DEFAULT NULL COMMENT '是否为部门管理员，1为是，0为否',
  PRIMARY KEY (`auto_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_department
-- ----------------------------

-- ----------------------------
-- Table structure for sys_login_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_login_log`;
CREATE TABLE `sys_login_log` (
  `auto_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_mail` varchar(100) DEFAULT NULL,
  `user_name` varchar(100) DEFAULT NULL,
  `department_name` varchar(200) DEFAULT NULL,
  `department_id` varchar(200) DEFAULT NULL,
  `organization_id` varchar(50) DEFAULT NULL COMMENT '机构编码',
  `organization_name` varchar(50) DEFAULT NULL COMMENT '机构名称',
  `login_time` datetime DEFAULT NULL,
  `user_status` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`auto_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_login_log
-- ----------------------------

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(20) NOT NULL DEFAULT '' COMMENT '菜单名称',
  `parentid` int(11) NOT NULL DEFAULT '0' COMMENT '父级菜单ID 0表示根节点',
  `sequence` int(6) NOT NULL DEFAULT '0' COMMENT '菜单顺序',
  `iconCls` varchar(20) NOT NULL DEFAULT '' COMMENT '菜单图标样式',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '菜单链接地址 总是以‘/’开头，相对于项目根路径',
  `enable` int(1) NOT NULL DEFAULT '1' COMMENT '是否可用 1:正常，0：禁用',
  PRIMARY KEY (`id`),
  KEY `parentId` (`parentid`),
  KEY `sequence` (`sequence`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------

-- ----------------------------
-- Table structure for sys_organization
-- ----------------------------
DROP TABLE IF EXISTS `sys_organization`;
CREATE TABLE `sys_organization` (
  `auto_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `organization_id` varchar(50) DEFAULT NULL COMMENT '机构编码',
  `organization_name` varchar(50) DEFAULT NULL COMMENT '机构名称',
  `organization_address` varchar(200) DEFAULT NULL COMMENT '机构地址',
  `status` varchar(10) DEFAULT NULL COMMENT '机构状态',
  PRIMARY KEY (`auto_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_organization
-- ----------------------------

-- ----------------------------
-- Table structure for sys_permission
-- ----------------------------
DROP TABLE IF EXISTS `sys_permission`;
CREATE TABLE `sys_permission` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `permission` varchar(100) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  `menu_id` varchar(100) DEFAULT NULL,
  `menu_name` varchar(100) DEFAULT NULL,
  `available` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_permission
-- ----------------------------

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `role_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `role_name` varchar(50) NOT NULL COMMENT '角色名称',
  `role_status` varchar(10) DEFAULT NULL COMMENT '角色状态',
  `role_descp` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`role_id`,`role_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_role
-- ----------------------------

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `auto_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `user_id` varchar(50) DEFAULT NULL COMMENT '用户邮箱',
  `user_name` varchar(50) DEFAULT NULL COMMENT '用户名称',
  `user_status` varchar(10) DEFAULT NULL COMMENT '用户状态',
  `organization_id` varchar(50) DEFAULT NULL COMMENT '机构编码',
  `organization_name` varchar(50) DEFAULT NULL COMMENT '机构名称',
  `department_name` varchar(50) DEFAULT NULL COMMENT '用户所属部门',
  `department_id` varchar(50) DEFAULT NULL COMMENT '部门编码',
  `login_name` varchar(50) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`auto_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_user
-- ----------------------------

-- ----------------------------
-- Table structure for test_paper
-- ----------------------------
DROP TABLE IF EXISTS `test_paper`;
CREATE TABLE `test_paper` (
  `test_paper_id` varchar(200) NOT NULL,
  `test_paper_name` varchar(200) DEFAULT NULL COMMENT '试卷名称',
  `creator_id` varchar(200) DEFAULT NULL COMMENT '创建人id',
  `creator_name` varchar(200) DEFAULT NULL COMMENT '创建人姓名',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `enable` varchar(50) DEFAULT '1' COMMENT '是否可用，1为发布，0为停用',
  PRIMARY KEY (`test_paper_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of test_paper
-- ----------------------------

-- ----------------------------
-- Table structure for test_paper_question
-- ----------------------------
DROP TABLE IF EXISTS `test_paper_question`;
CREATE TABLE `test_paper_question` (
  `auto_id` int(11) NOT NULL AUTO_INCREMENT,
  `test_paper_id` varchar(200) NOT NULL,
  `test_paper_name` varchar(200) DEFAULT NULL COMMENT '试卷名称',
  `test_questions_id` int(11) NOT NULL COMMENT '题目id',
  `test_questions_number` int(11) DEFAULT NULL COMMENT '题号',
  `answer_count` int(11) DEFAULT NULL COMMENT '答题次数',
  `correct_answer_count` int(11) DEFAULT NULL COMMENT '答对次数',
  PRIMARY KEY (`auto_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of test_paper_question
-- ----------------------------

-- ----------------------------
-- Table structure for test_question
-- ----------------------------
DROP TABLE IF EXISTS `test_question`;
CREATE TABLE `test_question` (
  `test_questions_id` int(11) NOT NULL AUTO_INCREMENT,
  `test_questions_name` text NOT NULL COMMENT '题干',
  `test_question_selects` text COMMENT '选项',
  `correct_answer` varchar(100) NOT NULL COMMENT '正确答案',
  `test_question_type` varchar(100) DEFAULT NULL COMMENT '试题类型',
  `creator_id` varchar(200) DEFAULT NULL COMMENT '创建人id',
  `creator_name` varchar(200) DEFAULT NULL COMMENT '创建人姓名',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `enable` varchar(50) DEFAULT '1' COMMENT '是否可用，1为发布，0为停用',
  PRIMARY KEY (`test_questions_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of test_question
-- ----------------------------

-- ----------------------------
-- Table structure for user_role
-- ----------------------------
DROP TABLE IF EXISTS `user_role`;
CREATE TABLE `user_role` (
  `role_id` varchar(50) DEFAULT '' COMMENT '角色编码',
  `user_id` varchar(50) NOT NULL DEFAULT '' COMMENT '用户编码',
  `role_name` varchar(100) NOT NULL,
  PRIMARY KEY (`user_id`,`role_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_role
-- ----------------------------
