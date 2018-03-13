/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50534
Source Host           : localhost:3306
Source Database       : police_testing

Target Server Type    : MYSQL
Target Server Version : 50534
File Encoding         : 65001

Date: 2018-03-13 22:51:58
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for js_gen_table
-- ----------------------------
DROP TABLE IF EXISTS `js_gen_table`;
CREATE TABLE `js_gen_table` (
  `table_name` varchar(64) NOT NULL COMMENT '表名',
  `class_name` varchar(100) NOT NULL COMMENT '实体类名称',
  `comments` varchar(500) NOT NULL COMMENT '表说明',
  `parent_table_name` varchar(64) DEFAULT NULL COMMENT '关联父表的表名',
  `parent_table_fk_name` varchar(64) DEFAULT NULL COMMENT '本表关联父表的外键名',
  `tpl_category` varchar(200) DEFAULT NULL COMMENT '使用的模板',
  `package_name` varchar(500) DEFAULT NULL COMMENT '生成包路径',
  `module_name` varchar(30) DEFAULT NULL COMMENT '生成模块名',
  `sub_module_name` varchar(30) DEFAULT NULL COMMENT '生成子模块名',
  `function_name` varchar(200) DEFAULT NULL COMMENT '生成功能名',
  `function_name_simple` varchar(50) DEFAULT NULL COMMENT '生成功能名（简写）',
  `function_author` varchar(50) DEFAULT NULL COMMENT '生成功能作者',
  `gen_base_dir` varchar(2000) DEFAULT NULL COMMENT '生成基础路径',
  `options` varchar(2000) DEFAULT NULL COMMENT '其它生成选项',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `remarks` varchar(500) DEFAULT NULL COMMENT '备注信息',
  PRIMARY KEY (`table_name`),
  KEY `idx_gen_table_ptn` (`parent_table_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='代码生成表';

-- ----------------------------
-- Records of js_gen_table
-- ----------------------------
INSERT INTO `js_gen_table` VALUES ('test_data', 'TestData', '测试数据', null, null, 'crud', 'com.jeesite.modules', 'test', '', '测试数据', '数据', 'ThinkGem', null, '{\"isHaveDelete\":\"1\",\"isFileUpload\":\"1\",\"isHaveDisableEnable\":\"1\",\"isImageUpload\":\"1\"}', 'system', '2018-03-11 16:00:37', 'system', '2018-03-11 16:00:37', null);
INSERT INTO `js_gen_table` VALUES ('test_data_child', 'TestDataChild', '测试数据子表', 'test_data', 'test_data_id', 'crud', 'com.jeesite.modules', 'test', '', '测试子表', '数据', 'ThinkGem', null, null, 'system', '2018-03-11 16:00:37', 'system', '2018-03-11 16:00:37', null);
INSERT INTO `js_gen_table` VALUES ('test_tree', 'TestTree', '测试树表', null, null, 'treeGrid', 'com.jeesite.modules', 'test', '', '测试树表', '数据', 'ThinkGem', null, '{\"treeViewName\":\"tree_name\",\"isHaveDelete\":\"1\",\"treeViewCode\":\"tree_code\",\"isFileUpload\":\"1\",\"isHaveDisableEnable\":\"1\",\"isImageUpload\":\"1\"}', 'system', '2018-03-11 16:00:37', 'system', '2018-03-11 16:00:37', null);

-- ----------------------------
-- Table structure for js_gen_table_column
-- ----------------------------
DROP TABLE IF EXISTS `js_gen_table_column`;
CREATE TABLE `js_gen_table_column` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `table_name` varchar(64) NOT NULL COMMENT '表名',
  `column_name` varchar(64) NOT NULL COMMENT '列名',
  `column_sort` decimal(10,0) DEFAULT NULL COMMENT '列排序（升序）',
  `column_type` varchar(100) NOT NULL COMMENT '类型',
  `column_label` varchar(50) DEFAULT NULL COMMENT '列标签名',
  `comments` varchar(500) NOT NULL COMMENT '列备注说明',
  `attr_name` varchar(200) NOT NULL COMMENT '类的属性名',
  `attr_type` varchar(200) NOT NULL COMMENT '类的属性类型',
  `is_pk` char(1) DEFAULT NULL COMMENT '是否主键',
  `is_null` char(1) DEFAULT NULL COMMENT '是否可为空',
  `is_insert` char(1) DEFAULT NULL COMMENT '是否插入字段',
  `is_update` char(1) DEFAULT NULL COMMENT '是否更新字段',
  `is_list` char(1) DEFAULT NULL COMMENT '是否列表字段',
  `is_query` char(1) DEFAULT NULL COMMENT '是否查询字段',
  `query_type` varchar(200) DEFAULT NULL COMMENT '查询方式',
  `is_edit` char(1) DEFAULT NULL COMMENT '是否编辑字段',
  `show_type` varchar(200) DEFAULT NULL COMMENT '表单类型',
  `options` varchar(2000) DEFAULT NULL COMMENT '其它生成选项',
  PRIMARY KEY (`id`),
  KEY `idx_gen_table_column_tn` (`table_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='代码生成表列';

-- ----------------------------
-- Records of js_gen_table_column
-- ----------------------------
INSERT INTO `js_gen_table_column` VALUES ('972744086275551232', 'test_data', 'id', '10', 'varchar(64)', '编号', '编号', 'id', 'String', '1', '0', '1', null, null, null, null, '1', 'hidden', '{\"fieldValid\":\"abc\"}');
INSERT INTO `js_gen_table_column` VALUES ('972744086292328448', 'test_data', 'test_input', '20', 'varchar(200)', '单行文本', '单行文本', 'testInput', 'String', null, '1', '1', '1', '1', '1', 'LIKE', '1', 'input', null);
INSERT INTO `js_gen_table_column` VALUES ('972744086325882880', 'test_data', 'test_textarea', '30', 'varchar(200)', '多行文本', '多行文本', 'testTextarea', 'String', null, '1', '1', '1', '1', '1', 'LIKE', '1', 'textarea', '{\"isNewLine\":\"1\",\"gridRowCol\":\"12/2/10\"}');
INSERT INTO `js_gen_table_column` VALUES ('972744086342660096', 'test_data', 'test_select', '40', 'varchar(10)', '下拉框', '下拉框', 'testSelect', 'String', null, '1', '1', '1', '1', '1', null, '1', 'select', '{\"dictName\":\"sys_menu_type\",\"dictType\":\"sys_menu_type\"}');
INSERT INTO `js_gen_table_column` VALUES ('972744086363631616', 'test_data', 'test_select_multiple', '50', 'varchar(200)', '下拉多选', '下拉多选', 'testSelectMultiple', 'String', null, '1', '1', '1', '1', '1', null, '1', 'select_multiple', '{\"dictName\":\"sys_menu_type\",\"dictType\":\"sys_menu_type\"}');
INSERT INTO `js_gen_table_column` VALUES ('972744086397186048', 'test_data', 'test_radio', '60', 'varchar(10)', '单选框', '单选框', 'testRadio', 'String', null, '1', '1', '1', '1', '1', null, '1', 'radio', '{\"dictName\":\"sys_menu_type\",\"dictType\":\"sys_menu_type\"}');
INSERT INTO `js_gen_table_column` VALUES ('972744086418157568', 'test_data', 'test_checkbox', '70', 'varchar(200)', '复选框', '复选框', 'testCheckbox', 'String', null, '1', '1', '1', '1', '1', null, '1', 'checkbox', '{\"dictName\":\"sys_menu_type\",\"dictType\":\"sys_menu_type\"}');
INSERT INTO `js_gen_table_column` VALUES ('972744086434934784', 'test_data', 'test_date', '80', 'timestamp', '日期选择', '日期选择', 'testDate', 'java.util.Date', null, '0', '1', '1', '1', '1', 'BETWEEN', '1', 'date', null);
INSERT INTO `js_gen_table_column` VALUES ('972744086481072128', 'test_data', 'test_datetime', '90', 'timestamp', '日期时间', '日期时间', 'testDatetime', 'java.util.Date', null, '0', '1', '1', '1', '1', 'BETWEEN', '1', 'datetime', null);
INSERT INTO `js_gen_table_column` VALUES ('972744086502043648', 'test_data', 'test_user_code', '100', 'varchar(64)', '用户选择', '用户选择', 'testUser', 'com.jeesite.modules.sys.entity.User', null, '1', '1', '1', '1', '1', null, '1', 'userselect', null);
INSERT INTO `js_gen_table_column` VALUES ('972744086531403776', 'test_data', 'test_office_code', '110', 'varchar(64)', '部门选择', '部门选择', 'testOffice', 'com.jeesite.modules.sys.entity.Office', null, '1', '1', '1', '1', '1', null, '1', 'officeselect', null);
INSERT INTO `js_gen_table_column` VALUES ('972744086556569600', 'test_data', 'test_area_code', '120', 'varchar(64)', '区域选择', '区域选择', 'testAreaCode|testAreaName', 'String', null, '1', '1', '1', '1', '1', null, '1', 'areaselect', null);
INSERT INTO `js_gen_table_column` VALUES ('972744086569152512', 'test_data', 'test_area_name', '130', 'varchar(100)', '区域名称', '区域名称', 'testAreaName', 'String', null, '1', '1', '1', '1', '0', 'LIKE', '0', 'input', null);
INSERT INTO `js_gen_table_column` VALUES ('972744086598512640', 'test_data', 'status', '140', 'char(1)', '状态', '状态（0正常 1删除 2停用）', 'status', 'String', null, '0', '1', null, '1', '1', null, null, 'select', '{\"dictName\":\"sys_search_status\",\"dictType\":\"sys_search_status\"}');
INSERT INTO `js_gen_table_column` VALUES ('972744086615289856', 'test_data', 'create_by', '150', 'varchar(64)', '创建者', '创建者', 'createBy', 'String', null, '0', '1', null, null, null, null, null, 'input', null);
INSERT INTO `js_gen_table_column` VALUES ('972744086632067072', 'test_data', 'create_date', '160', 'timestamp', '创建时间', '创建时间', 'createDate', 'java.util.Date', null, '0', '1', null, '1', null, null, null, 'dateselect', null);
INSERT INTO `js_gen_table_column` VALUES ('972744086648844288', 'test_data', 'update_by', '170', 'varchar(64)', '更新者', '更新者', 'updateBy', 'String', null, '0', '1', '1', null, null, null, null, 'input', null);
INSERT INTO `js_gen_table_column` VALUES ('972744086674010112', 'test_data', 'update_date', '180', 'timestamp', '更新时间', '更新时间', 'updateDate', 'java.util.Date', null, '0', '1', '1', null, null, null, null, 'dateselect', null);
INSERT INTO `js_gen_table_column` VALUES ('972744086694981632', 'test_data', 'remarks', '190', 'varchar(500)', '备注信息', '备注信息', 'remarks', 'String', null, '1', '1', '1', '1', '1', null, '1', 'textarea', '{\"isNewLine\":\"1\",\"gridRowCol\":\"12/2/10\"}');
INSERT INTO `js_gen_table_column` VALUES ('972744087194103808', 'test_data_child', 'id', '10', 'varchar(64)', '编号', '编号', 'id', 'String', '1', '0', '1', null, null, null, null, '1', 'hidden', '{\"fieldValid\":\"abc\"}');
INSERT INTO `js_gen_table_column` VALUES ('972744087227658240', 'test_data_child', 'test_sort', '20', 'int(11)', '排序号', '排序号', 'testSort', 'Long', null, '1', '1', '1', '1', '1', null, '1', 'input', '{\"fieldValid\":\"digits\"}');
INSERT INTO `js_gen_table_column` VALUES ('972744087261212672', 'test_data_child', 'test_data_id', '30', 'varchar(64)', '父表主键', '父表主键', 'testData', 'String', null, '1', '1', '1', '1', '1', null, '1', 'input', null);
INSERT INTO `js_gen_table_column` VALUES ('972744087273795584', 'test_data_child', 'test_input', '40', 'varchar(200)', '单行文本', '单行文本', 'testInput', 'String', null, '1', '1', '1', '1', '1', 'LIKE', '1', 'input', null);
INSERT INTO `js_gen_table_column` VALUES ('972744087294767104', 'test_data_child', 'test_textarea', '50', 'varchar(200)', '多行文本', '多行文本', 'testTextarea', 'String', null, '1', '1', '1', '1', '1', 'LIKE', '1', 'textarea', '{\"isNewLine\":\"1\",\"gridRowCol\":\"12/2/10\"}');
INSERT INTO `js_gen_table_column` VALUES ('972744087315738624', 'test_data_child', 'test_select', '60', 'varchar(10)', '下拉框', '下拉框', 'testSelect', 'String', null, '1', '1', '1', '1', '1', null, '1', 'select', '{\"dictName\":\"sys_menu_type\",\"dictType\":\"sys_menu_type\"}');
INSERT INTO `js_gen_table_column` VALUES ('972744087340904448', 'test_data_child', 'test_select_multiple', '70', 'varchar(200)', '下拉多选', '下拉多选', 'testSelectMultiple', 'String', null, '1', '1', '1', '1', '1', null, '1', 'select_multiple', '{\"dictName\":\"sys_menu_type\",\"dictType\":\"sys_menu_type\"}');
INSERT INTO `js_gen_table_column` VALUES ('972744087353487360', 'test_data_child', 'test_radio', '80', 'varchar(10)', '单选框', '单选框', 'testRadio', 'String', null, '1', '1', '1', '1', '1', null, '1', 'radio', '{\"dictName\":\"sys_menu_type\",\"dictType\":\"sys_menu_type\"}');
INSERT INTO `js_gen_table_column` VALUES ('972744087387041792', 'test_data_child', 'test_checkbox', '90', 'varchar(200)', '复选框', '复选框', 'testCheckbox', 'String', null, '1', '1', '1', '1', '1', null, '1', 'checkbox', '{\"dictName\":\"sys_menu_type\",\"dictType\":\"sys_menu_type\"}');
INSERT INTO `js_gen_table_column` VALUES ('972744087403819008', 'test_data_child', 'test_date', '100', 'timestamp', '日期选择', '日期选择', 'testDate', 'java.util.Date', null, '0', '1', '1', '1', '1', 'BETWEEN', '1', 'date', null);
INSERT INTO `js_gen_table_column` VALUES ('972744087416401920', 'test_data_child', 'test_datetime', '110', 'timestamp', '日期时间', '日期时间', 'testDatetime', 'java.util.Date', null, '0', '1', '1', '1', '1', 'BETWEEN', '1', 'datetime', null);
INSERT INTO `js_gen_table_column` VALUES ('972744087454150656', 'test_data_child', 'test_user_code', '120', 'varchar(64)', '用户选择', '用户选择', 'testUser', 'com.jeesite.modules.sys.entity.User', null, '1', '1', '1', '1', '1', null, '1', 'userselect', null);
INSERT INTO `js_gen_table_column` VALUES ('972744087466733568', 'test_data_child', 'test_office_code', '130', 'varchar(64)', '部门选择', '部门选择', 'testOffice', 'com.jeesite.modules.sys.entity.Office', null, '1', '1', '1', '1', '1', null, '1', 'officeselect', null);
INSERT INTO `js_gen_table_column` VALUES ('972744087479316480', 'test_data_child', 'test_area_code', '140', 'varchar(64)', '区域选择', '区域选择', 'testAreaCode|testAreaName', 'String', null, '1', '1', '1', '1', '1', null, '1', 'areaselect', null);
INSERT INTO `js_gen_table_column` VALUES ('972744087508676608', 'test_data_child', 'test_area_name', '150', 'varchar(100)', '区域名称', '区域名称', 'testAreaName', 'String', null, '1', '1', '1', '1', '0', 'LIKE', '0', 'input', null);
INSERT INTO `js_gen_table_column` VALUES ('972744087995215872', 'test_tree', 'tree_code', '10', 'varchar(64)', '节点编码', '节点编码', 'treeCode', 'String', '1', '0', '1', null, null, null, null, '1', 'input', '{\"fieldValid\":\"abc\"}');
INSERT INTO `js_gen_table_column` VALUES ('972744088028770304', 'test_tree', 'parent_code', '20', 'varchar(64)', '父级编号', '父级编号', 'parentCode|parentName', 'This', null, '0', '1', '1', '1', '1', null, '1', 'treeselect', null);
INSERT INTO `js_gen_table_column` VALUES ('972744088045547520', 'test_tree', 'parent_codes', '30', 'varchar(2000)', '所有父级编号', '所有父级编号', 'parentCodes', 'String', null, '0', '1', '1', '1', '1', 'LIKE', '0', 'input', null);
INSERT INTO `js_gen_table_column` VALUES ('972744088083296256', 'test_tree', 'tree_sort', '40', 'decimal(10,0)', '本级排序号', '本级排序号（升序）', 'treeSort', 'Integer', null, '0', '1', '1', '1', '1', null, '1', 'input', '{\"fieldValid\":\"digits\"}');
INSERT INTO `js_gen_table_column` VALUES ('972744088100073472', 'test_tree', 'tree_sorts', '50', 'varchar(1200)', '所有级别排序号', '所有级别排序号', 'treeSorts', 'String', null, '0', '1', '1', '0', '1', null, '0', 'input', null);
INSERT INTO `js_gen_table_column` VALUES ('972744088133627904', 'test_tree', 'tree_leaf', '60', 'char(1)', '是否最末级', '是否最末级', 'treeLeaf', 'String', null, '0', '1', '1', null, null, null, null, 'input', null);
INSERT INTO `js_gen_table_column` VALUES ('972744088150405120', 'test_tree', 'tree_level', '70', 'decimal(4,0)', '层次级别', '层次级别', 'treeLevel', 'Integer', null, '0', '1', '1', null, null, null, null, 'input', '{\"fieldValid\":\"digits\"}');
INSERT INTO `js_gen_table_column` VALUES ('972744088171376640', 'test_tree', 'tree_names', '80', 'varchar(2000)', '全节点名', '全节点名', 'treeNames', 'String', null, '0', '1', '1', '1', '1', 'LIKE', '1', 'input', null);
INSERT INTO `js_gen_table_column` VALUES ('972744088204931072', 'test_tree', 'tree_name', '90', 'varchar(200)', '节点名称', '节点名称', 'treeName', 'String', null, '0', '1', '1', '1', '1', 'LIKE', '1', 'input', null);
INSERT INTO `js_gen_table_column` VALUES ('972744088225902592', 'test_tree', 'status', '100', 'char(1)', '状态', '状态（0正常 1删除 2停用）', 'status', 'String', null, '0', '1', null, '1', '1', null, null, 'select', '{\"dictName\":\"sys_search_status\",\"dictType\":\"sys_search_status\"}');
INSERT INTO `js_gen_table_column` VALUES ('972744088246874112', 'test_tree', 'create_by', '110', 'varchar(64)', '创建者', '创建者', 'createBy', 'String', null, '0', '1', null, null, null, null, null, 'input', null);
INSERT INTO `js_gen_table_column` VALUES ('972744088276234240', 'test_tree', 'create_date', '120', 'timestamp', '创建时间', '创建时间', 'createDate', 'java.util.Date', null, '0', '1', null, '1', null, null, null, 'dateselect', null);
INSERT INTO `js_gen_table_column` VALUES ('972744088293011456', 'test_tree', 'update_by', '130', 'varchar(64)', '更新者', '更新者', 'updateBy', 'String', null, '0', '1', '1', null, null, null, null, 'input', null);
INSERT INTO `js_gen_table_column` VALUES ('972744088309788672', 'test_tree', 'update_date', '140', 'timestamp', '更新时间', '更新时间', 'updateDate', 'java.util.Date', null, '0', '1', '1', null, null, null, null, 'dateselect', null);
INSERT INTO `js_gen_table_column` VALUES ('972744088334954496', 'test_tree', 'remarks', '150', 'varchar(500)', '备注信息', '备注信息', 'remarks', 'String', null, '1', '1', '1', '1', '1', null, '1', 'textarea', '{\"isNewLine\":\"1\",\"gridRowCol\":\"12/2/10\"}');

-- ----------------------------
-- Table structure for js_job_blob_triggers
-- ----------------------------
DROP TABLE IF EXISTS `js_job_blob_triggers`;
CREATE TABLE `js_job_blob_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `BLOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `SCHED_NAME` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `js_job_blob_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `js_job_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of js_job_blob_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for js_job_calendars
-- ----------------------------
DROP TABLE IF EXISTS `js_job_calendars`;
CREATE TABLE `js_job_calendars` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `CALENDAR_NAME` varchar(200) NOT NULL,
  `CALENDAR` blob NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`CALENDAR_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of js_job_calendars
-- ----------------------------

-- ----------------------------
-- Table structure for js_job_cron_triggers
-- ----------------------------
DROP TABLE IF EXISTS `js_job_cron_triggers`;
CREATE TABLE `js_job_cron_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `CRON_EXPRESSION` varchar(120) NOT NULL,
  `TIME_ZONE_ID` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `js_job_cron_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `js_job_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of js_job_cron_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for js_job_fired_triggers
-- ----------------------------
DROP TABLE IF EXISTS `js_job_fired_triggers`;
CREATE TABLE `js_job_fired_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `ENTRY_ID` varchar(95) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `INSTANCE_NAME` varchar(200) NOT NULL,
  `FIRED_TIME` bigint(13) NOT NULL,
  `SCHED_TIME` bigint(13) NOT NULL,
  `PRIORITY` int(11) NOT NULL,
  `STATE` varchar(16) NOT NULL,
  `JOB_NAME` varchar(200) DEFAULT NULL,
  `JOB_GROUP` varchar(200) DEFAULT NULL,
  `IS_NONCONCURRENT` varchar(1) DEFAULT NULL,
  `REQUESTS_RECOVERY` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`ENTRY_ID`),
  KEY `IDX_QRTZ_FT_TRIG_INST_NAME` (`SCHED_NAME`,`INSTANCE_NAME`),
  KEY `IDX_QRTZ_FT_INST_JOB_REQ_RCVRY` (`SCHED_NAME`,`INSTANCE_NAME`,`REQUESTS_RECOVERY`),
  KEY `IDX_QRTZ_FT_J_G` (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_FT_JG` (`SCHED_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_FT_T_G` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `IDX_QRTZ_FT_TG` (`SCHED_NAME`,`TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of js_job_fired_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for js_job_job_details
-- ----------------------------
DROP TABLE IF EXISTS `js_job_job_details`;
CREATE TABLE `js_job_job_details` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `JOB_NAME` varchar(200) NOT NULL,
  `JOB_GROUP` varchar(200) NOT NULL,
  `DESCRIPTION` varchar(250) DEFAULT NULL,
  `JOB_CLASS_NAME` varchar(250) NOT NULL,
  `IS_DURABLE` varchar(1) NOT NULL,
  `IS_NONCONCURRENT` varchar(1) NOT NULL,
  `IS_UPDATE_DATA` varchar(1) NOT NULL,
  `REQUESTS_RECOVERY` varchar(1) NOT NULL,
  `JOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_J_REQ_RECOVERY` (`SCHED_NAME`,`REQUESTS_RECOVERY`),
  KEY `IDX_QRTZ_J_GRP` (`SCHED_NAME`,`JOB_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of js_job_job_details
-- ----------------------------

-- ----------------------------
-- Table structure for js_job_locks
-- ----------------------------
DROP TABLE IF EXISTS `js_job_locks`;
CREATE TABLE `js_job_locks` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `LOCK_NAME` varchar(40) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`LOCK_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of js_job_locks
-- ----------------------------
INSERT INTO `js_job_locks` VALUES ('JeeSiteScheduler', 'STATE_ACCESS');
INSERT INTO `js_job_locks` VALUES ('JeeSiteScheduler', 'TRIGGER_ACCESS');

-- ----------------------------
-- Table structure for js_job_paused_trigger_grps
-- ----------------------------
DROP TABLE IF EXISTS `js_job_paused_trigger_grps`;
CREATE TABLE `js_job_paused_trigger_grps` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of js_job_paused_trigger_grps
-- ----------------------------

-- ----------------------------
-- Table structure for js_job_scheduler_state
-- ----------------------------
DROP TABLE IF EXISTS `js_job_scheduler_state`;
CREATE TABLE `js_job_scheduler_state` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `INSTANCE_NAME` varchar(200) NOT NULL,
  `LAST_CHECKIN_TIME` bigint(13) NOT NULL,
  `CHECKIN_INTERVAL` bigint(13) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`INSTANCE_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of js_job_scheduler_state
-- ----------------------------
INSERT INTO `js_job_scheduler_state` VALUES ('JeeSiteScheduler', 'DESKTOP-P01DI921520757729251', '1520769160685', '1000');

-- ----------------------------
-- Table structure for js_job_simple_triggers
-- ----------------------------
DROP TABLE IF EXISTS `js_job_simple_triggers`;
CREATE TABLE `js_job_simple_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `REPEAT_COUNT` bigint(7) NOT NULL,
  `REPEAT_INTERVAL` bigint(12) NOT NULL,
  `TIMES_TRIGGERED` bigint(10) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `js_job_simple_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `js_job_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of js_job_simple_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for js_job_simprop_triggers
-- ----------------------------
DROP TABLE IF EXISTS `js_job_simprop_triggers`;
CREATE TABLE `js_job_simprop_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `STR_PROP_1` varchar(512) DEFAULT NULL,
  `STR_PROP_2` varchar(512) DEFAULT NULL,
  `STR_PROP_3` varchar(512) DEFAULT NULL,
  `INT_PROP_1` int(11) DEFAULT NULL,
  `INT_PROP_2` int(11) DEFAULT NULL,
  `LONG_PROP_1` bigint(20) DEFAULT NULL,
  `LONG_PROP_2` bigint(20) DEFAULT NULL,
  `DEC_PROP_1` decimal(13,4) DEFAULT NULL,
  `DEC_PROP_2` decimal(13,4) DEFAULT NULL,
  `BOOL_PROP_1` varchar(1) DEFAULT NULL,
  `BOOL_PROP_2` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `js_job_simprop_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `js_job_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of js_job_simprop_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for js_job_triggers
-- ----------------------------
DROP TABLE IF EXISTS `js_job_triggers`;
CREATE TABLE `js_job_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `JOB_NAME` varchar(200) NOT NULL,
  `JOB_GROUP` varchar(200) NOT NULL,
  `DESCRIPTION` varchar(250) DEFAULT NULL,
  `NEXT_FIRE_TIME` bigint(13) DEFAULT NULL,
  `PREV_FIRE_TIME` bigint(13) DEFAULT NULL,
  `PRIORITY` int(11) DEFAULT NULL,
  `TRIGGER_STATE` varchar(16) NOT NULL,
  `TRIGGER_TYPE` varchar(8) NOT NULL,
  `START_TIME` bigint(13) NOT NULL,
  `END_TIME` bigint(13) DEFAULT NULL,
  `CALENDAR_NAME` varchar(200) DEFAULT NULL,
  `MISFIRE_INSTR` smallint(2) DEFAULT NULL,
  `JOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `IDX_QRTZ_T_J` (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_T_JG` (`SCHED_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_T_C` (`SCHED_NAME`,`CALENDAR_NAME`),
  KEY `IDX_QRTZ_T_G` (`SCHED_NAME`,`TRIGGER_GROUP`),
  KEY `IDX_QRTZ_T_STATE` (`SCHED_NAME`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_N_STATE` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_N_G_STATE` (`SCHED_NAME`,`TRIGGER_GROUP`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_NEXT_FIRE_TIME` (`SCHED_NAME`,`NEXT_FIRE_TIME`),
  KEY `IDX_QRTZ_T_NFT_ST` (`SCHED_NAME`,`TRIGGER_STATE`,`NEXT_FIRE_TIME`),
  KEY `IDX_QRTZ_T_NFT_MISFIRE` (`SCHED_NAME`,`MISFIRE_INSTR`,`NEXT_FIRE_TIME`),
  KEY `IDX_QRTZ_T_NFT_ST_MISFIRE` (`SCHED_NAME`,`MISFIRE_INSTR`,`NEXT_FIRE_TIME`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_NFT_ST_MISFIRE_GRP` (`SCHED_NAME`,`MISFIRE_INSTR`,`NEXT_FIRE_TIME`,`TRIGGER_GROUP`,`TRIGGER_STATE`),
  CONSTRAINT `js_job_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) REFERENCES `js_job_job_details` (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of js_job_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for js_sys_area
-- ----------------------------
DROP TABLE IF EXISTS `js_sys_area`;
CREATE TABLE `js_sys_area` (
  `area_code` varchar(100) NOT NULL COMMENT '区域编码',
  `parent_code` varchar(64) NOT NULL COMMENT '父级编号',
  `parent_codes` varchar(2000) NOT NULL COMMENT '所有父级编号',
  `tree_sort` decimal(10,0) NOT NULL COMMENT '本级排序号（升序）',
  `tree_sorts` varchar(1200) NOT NULL COMMENT '所有级别排序号',
  `tree_leaf` char(1) NOT NULL COMMENT '是否最末级',
  `tree_level` decimal(4,0) NOT NULL COMMENT '层次级别',
  `tree_names` varchar(2000) NOT NULL COMMENT '全节点名',
  `area_name` varchar(100) NOT NULL COMMENT '区域名称',
  `area_type` char(1) DEFAULT NULL COMMENT '区域类型',
  `status` char(1) NOT NULL DEFAULT '0' COMMENT '状态（0正常 1删除 2停用）',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `remarks` varchar(500) DEFAULT NULL COMMENT '备注信息',
  PRIMARY KEY (`area_code`),
  KEY `idx_sys_area_pc` (`parent_code`),
  KEY `idx_sys_area_ts` (`tree_sort`),
  KEY `idx_sys_area_status` (`status`),
  KEY `idx_sys_area_pcs` (`parent_codes`(255)),
  KEY `idx_sys_area_tss` (`tree_sorts`(255))
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='行政区划';

-- ----------------------------
-- Records of js_sys_area
-- ----------------------------
INSERT INTO `js_sys_area` VALUES ('110000', '0', '0,', '10', '0000000010,', '0', '0', '北京市', '北京市', '1', '0', 'system', '2018-03-11 15:59:19', 'system', '2018-03-11 15:59:19', null);
INSERT INTO `js_sys_area` VALUES ('110100', '110000', '0,110000,', '10', '0000000010,0000000010,', '0', '1', '北京市/市辖区', '市辖区', '2', '0', 'system', '2018-03-11 15:59:19', 'system', '2018-03-11 15:59:19', null);
INSERT INTO `js_sys_area` VALUES ('110101', '110100', '0,110000,110100,', '10', '0000000010,0000000010,0000000010,', '1', '2', '北京市/市辖区/东城区', '东城区', '3', '0', 'system', '2018-03-11 15:59:19', 'system', '2018-03-11 15:59:19', null);
INSERT INTO `js_sys_area` VALUES ('110102', '110100', '0,110000,110100,', '20', '0000000010,0000000010,0000000020,', '1', '2', '北京市/市辖区/西城区', '西城区', '3', '0', 'system', '2018-03-11 15:59:19', 'system', '2018-03-11 15:59:19', null);
INSERT INTO `js_sys_area` VALUES ('110103', '110100', '0,110000,110100,', '30', '0000000010,0000000010,0000000030,', '1', '2', '北京市/市辖区/崇文区', '崇文区', '3', '0', 'system', '2018-03-11 15:59:20', 'system', '2018-03-11 15:59:20', null);
INSERT INTO `js_sys_area` VALUES ('110104', '110100', '0,110000,110100,', '40', '0000000010,0000000010,0000000040,', '1', '2', '北京市/市辖区/宣武区', '宣武区', '3', '0', 'system', '2018-03-11 15:59:20', 'system', '2018-03-11 15:59:20', null);
INSERT INTO `js_sys_area` VALUES ('110105', '110100', '0,110000,110100,', '50', '0000000010,0000000010,0000000050,', '1', '2', '北京市/市辖区/朝阳区', '朝阳区', '3', '0', 'system', '2018-03-11 15:59:20', 'system', '2018-03-11 15:59:20', null);
INSERT INTO `js_sys_area` VALUES ('110106', '110100', '0,110000,110100,', '60', '0000000010,0000000010,0000000060,', '1', '2', '北京市/市辖区/丰台区', '丰台区', '3', '0', 'system', '2018-03-11 15:59:20', 'system', '2018-03-11 15:59:20', null);
INSERT INTO `js_sys_area` VALUES ('110107', '110100', '0,110000,110100,', '70', '0000000010,0000000010,0000000070,', '1', '2', '北京市/市辖区/石景山区', '石景山区', '3', '0', 'system', '2018-03-11 15:59:20', 'system', '2018-03-11 15:59:20', null);
INSERT INTO `js_sys_area` VALUES ('110108', '110100', '0,110000,110100,', '80', '0000000010,0000000010,0000000080,', '1', '2', '北京市/市辖区/海淀区', '海淀区', '3', '0', 'system', '2018-03-11 15:59:20', 'system', '2018-03-11 15:59:20', null);
INSERT INTO `js_sys_area` VALUES ('110109', '110100', '0,110000,110100,', '90', '0000000010,0000000010,0000000090,', '1', '2', '北京市/市辖区/门头沟区', '门头沟区', '3', '0', 'system', '2018-03-11 15:59:20', 'system', '2018-03-11 15:59:20', null);
INSERT INTO `js_sys_area` VALUES ('110111', '110100', '0,110000,110100,', '100', '0000000010,0000000010,0000000100,', '1', '2', '北京市/市辖区/房山区', '房山区', '3', '0', 'system', '2018-03-11 15:59:20', 'system', '2018-03-11 15:59:20', null);
INSERT INTO `js_sys_area` VALUES ('110112', '110100', '0,110000,110100,', '110', '0000000010,0000000010,0000000110,', '1', '2', '北京市/市辖区/通州区', '通州区', '3', '0', 'system', '2018-03-11 15:59:20', 'system', '2018-03-11 15:59:20', null);
INSERT INTO `js_sys_area` VALUES ('110113', '110100', '0,110000,110100,', '120', '0000000010,0000000010,0000000120,', '1', '2', '北京市/市辖区/顺义区', '顺义区', '3', '0', 'system', '2018-03-11 15:59:20', 'system', '2018-03-11 15:59:20', null);
INSERT INTO `js_sys_area` VALUES ('110114', '110100', '0,110000,110100,', '130', '0000000010,0000000010,0000000130,', '1', '2', '北京市/市辖区/昌平区', '昌平区', '3', '0', 'system', '2018-03-11 15:59:20', 'system', '2018-03-11 15:59:20', null);
INSERT INTO `js_sys_area` VALUES ('110115', '110100', '0,110000,110100,', '140', '0000000010,0000000010,0000000140,', '1', '2', '北京市/市辖区/大兴区', '大兴区', '3', '0', 'system', '2018-03-11 15:59:20', 'system', '2018-03-11 15:59:20', null);
INSERT INTO `js_sys_area` VALUES ('110116', '110100', '0,110000,110100,', '150', '0000000010,0000000010,0000000150,', '1', '2', '北京市/市辖区/怀柔区', '怀柔区', '3', '0', 'system', '2018-03-11 15:59:20', 'system', '2018-03-11 15:59:20', null);
INSERT INTO `js_sys_area` VALUES ('110117', '110100', '0,110000,110100,', '160', '0000000010,0000000010,0000000160,', '1', '2', '北京市/市辖区/平谷区', '平谷区', '3', '0', 'system', '2018-03-11 15:59:20', 'system', '2018-03-11 15:59:20', null);
INSERT INTO `js_sys_area` VALUES ('110200', '110000', '0,110000,', '20', '0000000010,0000000020,', '0', '1', '北京市/县', '县', '2', '0', 'system', '2018-03-11 15:59:20', 'system', '2018-03-11 15:59:20', null);
INSERT INTO `js_sys_area` VALUES ('110228', '110200', '0,110000,110200,', '170', '0000000010,0000000020,0000000170,', '1', '2', '北京市/县/密云县', '密云县', '3', '0', 'system', '2018-03-11 15:59:20', 'system', '2018-03-11 15:59:20', null);
INSERT INTO `js_sys_area` VALUES ('110229', '110200', '0,110000,110200,', '180', '0000000010,0000000020,0000000180,', '1', '2', '北京市/县/延庆县', '延庆县', '3', '0', 'system', '2018-03-11 15:59:20', 'system', '2018-03-11 15:59:20', null);
INSERT INTO `js_sys_area` VALUES ('120000', '0', '0,', '20', '0000000020,', '0', '0', '天津市', '天津市', '1', '0', 'system', '2018-03-11 15:59:20', 'system', '2018-03-11 15:59:20', null);
INSERT INTO `js_sys_area` VALUES ('120100', '120000', '0,120000,', '30', '0000000020,0000000030,', '0', '1', '天津市/市辖区', '市辖区', '2', '0', 'system', '2018-03-11 15:59:20', 'system', '2018-03-11 15:59:20', null);
INSERT INTO `js_sys_area` VALUES ('120101', '120100', '0,120000,120100,', '190', '0000000020,0000000030,0000000190,', '1', '2', '天津市/市辖区/和平区', '和平区', '3', '0', 'system', '2018-03-11 15:59:20', 'system', '2018-03-11 15:59:20', null);
INSERT INTO `js_sys_area` VALUES ('120102', '120100', '0,120000,120100,', '200', '0000000020,0000000030,0000000200,', '1', '2', '天津市/市辖区/河东区', '河东区', '3', '0', 'system', '2018-03-11 15:59:20', 'system', '2018-03-11 15:59:20', null);
INSERT INTO `js_sys_area` VALUES ('120103', '120100', '0,120000,120100,', '210', '0000000020,0000000030,0000000210,', '1', '2', '天津市/市辖区/河西区', '河西区', '3', '0', 'system', '2018-03-11 15:59:20', 'system', '2018-03-11 15:59:20', null);
INSERT INTO `js_sys_area` VALUES ('120104', '120100', '0,120000,120100,', '220', '0000000020,0000000030,0000000220,', '1', '2', '天津市/市辖区/南开区', '南开区', '3', '0', 'system', '2018-03-11 15:59:20', 'system', '2018-03-11 15:59:20', null);
INSERT INTO `js_sys_area` VALUES ('120105', '120100', '0,120000,120100,', '230', '0000000020,0000000030,0000000230,', '1', '2', '天津市/市辖区/河北区', '河北区', '3', '0', 'system', '2018-03-11 15:59:20', 'system', '2018-03-11 15:59:20', null);
INSERT INTO `js_sys_area` VALUES ('120106', '120100', '0,120000,120100,', '240', '0000000020,0000000030,0000000240,', '1', '2', '天津市/市辖区/红桥区', '红桥区', '3', '0', 'system', '2018-03-11 15:59:20', 'system', '2018-03-11 15:59:20', null);
INSERT INTO `js_sys_area` VALUES ('120107', '120100', '0,120000,120100,', '250', '0000000020,0000000030,0000000250,', '1', '2', '天津市/市辖区/塘沽区', '塘沽区', '3', '0', 'system', '2018-03-11 15:59:20', 'system', '2018-03-11 15:59:20', null);
INSERT INTO `js_sys_area` VALUES ('120108', '120100', '0,120000,120100,', '260', '0000000020,0000000030,0000000260,', '1', '2', '天津市/市辖区/汉沽区', '汉沽区', '3', '0', 'system', '2018-03-11 15:59:20', 'system', '2018-03-11 15:59:20', null);
INSERT INTO `js_sys_area` VALUES ('120109', '120100', '0,120000,120100,', '270', '0000000020,0000000030,0000000270,', '1', '2', '天津市/市辖区/大港区', '大港区', '3', '0', 'system', '2018-03-11 15:59:21', 'system', '2018-03-11 15:59:21', null);
INSERT INTO `js_sys_area` VALUES ('120110', '120100', '0,120000,120100,', '280', '0000000020,0000000030,0000000280,', '1', '2', '天津市/市辖区/东丽区', '东丽区', '3', '0', 'system', '2018-03-11 15:59:21', 'system', '2018-03-11 15:59:21', null);
INSERT INTO `js_sys_area` VALUES ('120111', '120100', '0,120000,120100,', '290', '0000000020,0000000030,0000000290,', '1', '2', '天津市/市辖区/西青区', '西青区', '3', '0', 'system', '2018-03-11 15:59:21', 'system', '2018-03-11 15:59:21', null);
INSERT INTO `js_sys_area` VALUES ('120112', '120100', '0,120000,120100,', '300', '0000000020,0000000030,0000000300,', '1', '2', '天津市/市辖区/津南区', '津南区', '3', '0', 'system', '2018-03-11 15:59:21', 'system', '2018-03-11 15:59:21', null);
INSERT INTO `js_sys_area` VALUES ('120113', '120100', '0,120000,120100,', '310', '0000000020,0000000030,0000000310,', '1', '2', '天津市/市辖区/北辰区', '北辰区', '3', '0', 'system', '2018-03-11 15:59:21', 'system', '2018-03-11 15:59:21', null);
INSERT INTO `js_sys_area` VALUES ('120114', '120100', '0,120000,120100,', '320', '0000000020,0000000030,0000000320,', '1', '2', '天津市/市辖区/武清区', '武清区', '3', '0', 'system', '2018-03-11 15:59:21', 'system', '2018-03-11 15:59:21', null);
INSERT INTO `js_sys_area` VALUES ('120115', '120100', '0,120000,120100,', '330', '0000000020,0000000030,0000000330,', '1', '2', '天津市/市辖区/宝坻区', '宝坻区', '3', '0', 'system', '2018-03-11 15:59:21', 'system', '2018-03-11 15:59:21', null);
INSERT INTO `js_sys_area` VALUES ('120200', '120000', '0,120000,', '40', '0000000020,0000000040,', '0', '1', '天津市/县', '县', '2', '0', 'system', '2018-03-11 15:59:21', 'system', '2018-03-11 15:59:21', null);
INSERT INTO `js_sys_area` VALUES ('120221', '120200', '0,120000,120200,', '340', '0000000020,0000000040,0000000340,', '1', '2', '天津市/县/宁河县', '宁河县', '3', '0', 'system', '2018-03-11 15:59:21', 'system', '2018-03-11 15:59:21', null);
INSERT INTO `js_sys_area` VALUES ('120223', '120200', '0,120000,120200,', '350', '0000000020,0000000040,0000000350,', '1', '2', '天津市/县/静海县', '静海县', '3', '0', 'system', '2018-03-11 15:59:21', 'system', '2018-03-11 15:59:21', null);
INSERT INTO `js_sys_area` VALUES ('120225', '120200', '0,120000,120200,', '360', '0000000020,0000000040,0000000360,', '1', '2', '天津市/县/蓟　县', '蓟　县', '3', '0', 'system', '2018-03-11 15:59:21', 'system', '2018-03-11 15:59:21', null);
INSERT INTO `js_sys_area` VALUES ('130000', '0', '0,', '30', '0000000030,', '0', '0', '河北省', '河北省', '1', '0', 'system', '2018-03-11 15:59:21', 'system', '2018-03-11 15:59:21', null);
INSERT INTO `js_sys_area` VALUES ('130100', '130000', '0,130000,', '50', '0000000030,0000000050,', '0', '1', '河北省/石家庄市', '石家庄市', '2', '0', 'system', '2018-03-11 15:59:21', 'system', '2018-03-11 15:59:21', null);
INSERT INTO `js_sys_area` VALUES ('130101', '130100', '0,130000,130100,', '370', '0000000030,0000000050,0000000370,', '1', '2', '河北省/石家庄市/市辖区', '市辖区', '3', '0', 'system', '2018-03-11 15:59:21', 'system', '2018-03-11 15:59:21', null);
INSERT INTO `js_sys_area` VALUES ('130102', '130100', '0,130000,130100,', '380', '0000000030,0000000050,0000000380,', '1', '2', '河北省/石家庄市/长安区', '长安区', '3', '0', 'system', '2018-03-11 15:59:21', 'system', '2018-03-11 15:59:21', null);
INSERT INTO `js_sys_area` VALUES ('130103', '130100', '0,130000,130100,', '390', '0000000030,0000000050,0000000390,', '1', '2', '河北省/石家庄市/桥东区', '桥东区', '3', '0', 'system', '2018-03-11 15:59:21', 'system', '2018-03-11 15:59:21', null);
INSERT INTO `js_sys_area` VALUES ('130104', '130100', '0,130000,130100,', '400', '0000000030,0000000050,0000000400,', '1', '2', '河北省/石家庄市/桥西区', '桥西区', '3', '0', 'system', '2018-03-11 15:59:22', 'system', '2018-03-11 15:59:22', null);
INSERT INTO `js_sys_area` VALUES ('130105', '130100', '0,130000,130100,', '410', '0000000030,0000000050,0000000410,', '1', '2', '河北省/石家庄市/新华区', '新华区', '3', '0', 'system', '2018-03-11 15:59:22', 'system', '2018-03-11 15:59:22', null);
INSERT INTO `js_sys_area` VALUES ('130107', '130100', '0,130000,130100,', '420', '0000000030,0000000050,0000000420,', '1', '2', '河北省/石家庄市/井陉矿区', '井陉矿区', '3', '0', 'system', '2018-03-11 15:59:22', 'system', '2018-03-11 15:59:22', null);
INSERT INTO `js_sys_area` VALUES ('130108', '130100', '0,130000,130100,', '430', '0000000030,0000000050,0000000430,', '1', '2', '河北省/石家庄市/裕华区', '裕华区', '3', '0', 'system', '2018-03-11 15:59:22', 'system', '2018-03-11 15:59:22', null);
INSERT INTO `js_sys_area` VALUES ('130121', '130100', '0,130000,130100,', '440', '0000000030,0000000050,0000000440,', '1', '2', '河北省/石家庄市/井陉县', '井陉县', '3', '0', 'system', '2018-03-11 15:59:22', 'system', '2018-03-11 15:59:22', null);
INSERT INTO `js_sys_area` VALUES ('130123', '130100', '0,130000,130100,', '450', '0000000030,0000000050,0000000450,', '1', '2', '河北省/石家庄市/正定县', '正定县', '3', '0', 'system', '2018-03-11 15:59:22', 'system', '2018-03-11 15:59:22', null);
INSERT INTO `js_sys_area` VALUES ('130124', '130100', '0,130000,130100,', '460', '0000000030,0000000050,0000000460,', '1', '2', '河北省/石家庄市/栾城县', '栾城县', '3', '0', 'system', '2018-03-11 15:59:22', 'system', '2018-03-11 15:59:22', null);
INSERT INTO `js_sys_area` VALUES ('130125', '130100', '0,130000,130100,', '470', '0000000030,0000000050,0000000470,', '1', '2', '河北省/石家庄市/行唐县', '行唐县', '3', '0', 'system', '2018-03-11 15:59:22', 'system', '2018-03-11 15:59:22', null);
INSERT INTO `js_sys_area` VALUES ('130126', '130100', '0,130000,130100,', '480', '0000000030,0000000050,0000000480,', '1', '2', '河北省/石家庄市/灵寿县', '灵寿县', '3', '0', 'system', '2018-03-11 15:59:22', 'system', '2018-03-11 15:59:22', null);
INSERT INTO `js_sys_area` VALUES ('130127', '130100', '0,130000,130100,', '490', '0000000030,0000000050,0000000490,', '1', '2', '河北省/石家庄市/高邑县', '高邑县', '3', '0', 'system', '2018-03-11 15:59:22', 'system', '2018-03-11 15:59:22', null);
INSERT INTO `js_sys_area` VALUES ('130128', '130100', '0,130000,130100,', '500', '0000000030,0000000050,0000000500,', '1', '2', '河北省/石家庄市/深泽县', '深泽县', '3', '0', 'system', '2018-03-11 15:59:22', 'system', '2018-03-11 15:59:22', null);
INSERT INTO `js_sys_area` VALUES ('130129', '130100', '0,130000,130100,', '510', '0000000030,0000000050,0000000510,', '1', '2', '河北省/石家庄市/赞皇县', '赞皇县', '3', '0', 'system', '2018-03-11 15:59:22', 'system', '2018-03-11 15:59:22', null);
INSERT INTO `js_sys_area` VALUES ('130130', '130100', '0,130000,130100,', '520', '0000000030,0000000050,0000000520,', '1', '2', '河北省/石家庄市/无极县', '无极县', '3', '0', 'system', '2018-03-11 15:59:22', 'system', '2018-03-11 15:59:22', null);
INSERT INTO `js_sys_area` VALUES ('130131', '130100', '0,130000,130100,', '530', '0000000030,0000000050,0000000530,', '1', '2', '河北省/石家庄市/平山县', '平山县', '3', '0', 'system', '2018-03-11 15:59:22', 'system', '2018-03-11 15:59:22', null);
INSERT INTO `js_sys_area` VALUES ('130132', '130100', '0,130000,130100,', '540', '0000000030,0000000050,0000000540,', '1', '2', '河北省/石家庄市/元氏县', '元氏县', '3', '0', 'system', '2018-03-11 15:59:22', 'system', '2018-03-11 15:59:22', null);
INSERT INTO `js_sys_area` VALUES ('130133', '130100', '0,130000,130100,', '550', '0000000030,0000000050,0000000550,', '1', '2', '河北省/石家庄市/赵　县', '赵　县', '3', '0', 'system', '2018-03-11 15:59:22', 'system', '2018-03-11 15:59:22', null);
INSERT INTO `js_sys_area` VALUES ('130181', '130100', '0,130000,130100,', '560', '0000000030,0000000050,0000000560,', '1', '2', '河北省/石家庄市/辛集市', '辛集市', '3', '0', 'system', '2018-03-11 15:59:22', 'system', '2018-03-11 15:59:22', null);
INSERT INTO `js_sys_area` VALUES ('130182', '130100', '0,130000,130100,', '570', '0000000030,0000000050,0000000570,', '1', '2', '河北省/石家庄市/藁城市', '藁城市', '3', '0', 'system', '2018-03-11 15:59:22', 'system', '2018-03-11 15:59:22', null);
INSERT INTO `js_sys_area` VALUES ('130183', '130100', '0,130000,130100,', '580', '0000000030,0000000050,0000000580,', '1', '2', '河北省/石家庄市/晋州市', '晋州市', '3', '0', 'system', '2018-03-11 15:59:22', 'system', '2018-03-11 15:59:22', null);
INSERT INTO `js_sys_area` VALUES ('130184', '130100', '0,130000,130100,', '590', '0000000030,0000000050,0000000590,', '1', '2', '河北省/石家庄市/新乐市', '新乐市', '3', '0', 'system', '2018-03-11 15:59:22', 'system', '2018-03-11 15:59:22', null);
INSERT INTO `js_sys_area` VALUES ('130185', '130100', '0,130000,130100,', '600', '0000000030,0000000050,0000000600,', '1', '2', '河北省/石家庄市/鹿泉市', '鹿泉市', '3', '0', 'system', '2018-03-11 15:59:22', 'system', '2018-03-11 15:59:22', null);
INSERT INTO `js_sys_area` VALUES ('130200', '130000', '0,130000,', '60', '0000000030,0000000060,', '0', '1', '河北省/唐山市', '唐山市', '2', '0', 'system', '2018-03-11 15:59:22', 'system', '2018-03-11 15:59:22', null);
INSERT INTO `js_sys_area` VALUES ('130201', '130200', '0,130000,130200,', '610', '0000000030,0000000060,0000000610,', '1', '2', '河北省/唐山市/市辖区', '市辖区', '3', '0', 'system', '2018-03-11 15:59:22', 'system', '2018-03-11 15:59:22', null);
INSERT INTO `js_sys_area` VALUES ('130202', '130200', '0,130000,130200,', '620', '0000000030,0000000060,0000000620,', '1', '2', '河北省/唐山市/路南区', '路南区', '3', '0', 'system', '2018-03-11 15:59:22', 'system', '2018-03-11 15:59:22', null);
INSERT INTO `js_sys_area` VALUES ('130203', '130200', '0,130000,130200,', '630', '0000000030,0000000060,0000000630,', '1', '2', '河北省/唐山市/路北区', '路北区', '3', '0', 'system', '2018-03-11 15:59:22', 'system', '2018-03-11 15:59:22', null);
INSERT INTO `js_sys_area` VALUES ('130204', '130200', '0,130000,130200,', '640', '0000000030,0000000060,0000000640,', '1', '2', '河北省/唐山市/古冶区', '古冶区', '3', '0', 'system', '2018-03-11 15:59:22', 'system', '2018-03-11 15:59:22', null);
INSERT INTO `js_sys_area` VALUES ('130205', '130200', '0,130000,130200,', '650', '0000000030,0000000060,0000000650,', '1', '2', '河北省/唐山市/开平区', '开平区', '3', '0', 'system', '2018-03-11 15:59:22', 'system', '2018-03-11 15:59:22', null);
INSERT INTO `js_sys_area` VALUES ('130207', '130200', '0,130000,130200,', '660', '0000000030,0000000060,0000000660,', '1', '2', '河北省/唐山市/丰南区', '丰南区', '3', '0', 'system', '2018-03-11 15:59:22', 'system', '2018-03-11 15:59:22', null);
INSERT INTO `js_sys_area` VALUES ('130208', '130200', '0,130000,130200,', '670', '0000000030,0000000060,0000000670,', '1', '2', '河北省/唐山市/丰润区', '丰润区', '3', '0', 'system', '2018-03-11 15:59:22', 'system', '2018-03-11 15:59:22', null);
INSERT INTO `js_sys_area` VALUES ('130223', '130200', '0,130000,130200,', '680', '0000000030,0000000060,0000000680,', '1', '2', '河北省/唐山市/滦　县', '滦　县', '3', '0', 'system', '2018-03-11 15:59:22', 'system', '2018-03-11 15:59:22', null);
INSERT INTO `js_sys_area` VALUES ('130224', '130200', '0,130000,130200,', '690', '0000000030,0000000060,0000000690,', '1', '2', '河北省/唐山市/滦南县', '滦南县', '3', '0', 'system', '2018-03-11 15:59:23', 'system', '2018-03-11 15:59:23', null);
INSERT INTO `js_sys_area` VALUES ('130225', '130200', '0,130000,130200,', '700', '0000000030,0000000060,0000000700,', '1', '2', '河北省/唐山市/乐亭县', '乐亭县', '3', '0', 'system', '2018-03-11 15:59:23', 'system', '2018-03-11 15:59:23', null);
INSERT INTO `js_sys_area` VALUES ('130227', '130200', '0,130000,130200,', '710', '0000000030,0000000060,0000000710,', '1', '2', '河北省/唐山市/迁西县', '迁西县', '3', '0', 'system', '2018-03-11 15:59:23', 'system', '2018-03-11 15:59:23', null);
INSERT INTO `js_sys_area` VALUES ('130229', '130200', '0,130000,130200,', '720', '0000000030,0000000060,0000000720,', '1', '2', '河北省/唐山市/玉田县', '玉田县', '3', '0', 'system', '2018-03-11 15:59:23', 'system', '2018-03-11 15:59:23', null);
INSERT INTO `js_sys_area` VALUES ('130230', '130200', '0,130000,130200,', '730', '0000000030,0000000060,0000000730,', '1', '2', '河北省/唐山市/唐海县', '唐海县', '3', '0', 'system', '2018-03-11 15:59:23', 'system', '2018-03-11 15:59:23', null);
INSERT INTO `js_sys_area` VALUES ('130281', '130200', '0,130000,130200,', '740', '0000000030,0000000060,0000000740,', '1', '2', '河北省/唐山市/遵化市', '遵化市', '3', '0', 'system', '2018-03-11 15:59:23', 'system', '2018-03-11 15:59:23', null);
INSERT INTO `js_sys_area` VALUES ('130283', '130200', '0,130000,130200,', '750', '0000000030,0000000060,0000000750,', '1', '2', '河北省/唐山市/迁安市', '迁安市', '3', '0', 'system', '2018-03-11 15:59:23', 'system', '2018-03-11 15:59:23', null);
INSERT INTO `js_sys_area` VALUES ('130300', '130000', '0,130000,', '70', '0000000030,0000000070,', '0', '1', '河北省/秦皇岛市', '秦皇岛市', '2', '0', 'system', '2018-03-11 15:59:23', 'system', '2018-03-11 15:59:23', null);
INSERT INTO `js_sys_area` VALUES ('130301', '130300', '0,130000,130300,', '760', '0000000030,0000000070,0000000760,', '1', '2', '河北省/秦皇岛市/市辖区', '市辖区', '3', '0', 'system', '2018-03-11 15:59:23', 'system', '2018-03-11 15:59:23', null);
INSERT INTO `js_sys_area` VALUES ('130302', '130300', '0,130000,130300,', '770', '0000000030,0000000070,0000000770,', '1', '2', '河北省/秦皇岛市/海港区', '海港区', '3', '0', 'system', '2018-03-11 15:59:23', 'system', '2018-03-11 15:59:23', null);
INSERT INTO `js_sys_area` VALUES ('130303', '130300', '0,130000,130300,', '780', '0000000030,0000000070,0000000780,', '1', '2', '河北省/秦皇岛市/山海关区', '山海关区', '3', '0', 'system', '2018-03-11 15:59:23', 'system', '2018-03-11 15:59:23', null);
INSERT INTO `js_sys_area` VALUES ('130304', '130300', '0,130000,130300,', '790', '0000000030,0000000070,0000000790,', '1', '2', '河北省/秦皇岛市/北戴河区', '北戴河区', '3', '0', 'system', '2018-03-11 15:59:23', 'system', '2018-03-11 15:59:23', null);
INSERT INTO `js_sys_area` VALUES ('130321', '130300', '0,130000,130300,', '800', '0000000030,0000000070,0000000800,', '1', '2', '河北省/秦皇岛市/青龙满族自治县', '青龙满族自治县', '3', '0', 'system', '2018-03-11 15:59:23', 'system', '2018-03-11 15:59:23', null);
INSERT INTO `js_sys_area` VALUES ('130322', '130300', '0,130000,130300,', '810', '0000000030,0000000070,0000000810,', '1', '2', '河北省/秦皇岛市/昌黎县', '昌黎县', '3', '0', 'system', '2018-03-11 15:59:23', 'system', '2018-03-11 15:59:23', null);
INSERT INTO `js_sys_area` VALUES ('130323', '130300', '0,130000,130300,', '820', '0000000030,0000000070,0000000820,', '1', '2', '河北省/秦皇岛市/抚宁县', '抚宁县', '3', '0', 'system', '2018-03-11 15:59:23', 'system', '2018-03-11 15:59:23', null);
INSERT INTO `js_sys_area` VALUES ('130324', '130300', '0,130000,130300,', '830', '0000000030,0000000070,0000000830,', '1', '2', '河北省/秦皇岛市/卢龙县', '卢龙县', '3', '0', 'system', '2018-03-11 15:59:23', 'system', '2018-03-11 15:59:23', null);
INSERT INTO `js_sys_area` VALUES ('130400', '130000', '0,130000,', '80', '0000000030,0000000080,', '0', '1', '河北省/邯郸市', '邯郸市', '2', '0', 'system', '2018-03-11 15:59:23', 'system', '2018-03-11 15:59:23', null);
INSERT INTO `js_sys_area` VALUES ('130401', '130400', '0,130000,130400,', '840', '0000000030,0000000080,0000000840,', '1', '2', '河北省/邯郸市/市辖区', '市辖区', '3', '0', 'system', '2018-03-11 15:59:23', 'system', '2018-03-11 15:59:23', null);
INSERT INTO `js_sys_area` VALUES ('130402', '130400', '0,130000,130400,', '850', '0000000030,0000000080,0000000850,', '1', '2', '河北省/邯郸市/邯山区', '邯山区', '3', '0', 'system', '2018-03-11 15:59:23', 'system', '2018-03-11 15:59:23', null);
INSERT INTO `js_sys_area` VALUES ('130403', '130400', '0,130000,130400,', '860', '0000000030,0000000080,0000000860,', '1', '2', '河北省/邯郸市/丛台区', '丛台区', '3', '0', 'system', '2018-03-11 15:59:23', 'system', '2018-03-11 15:59:23', null);
INSERT INTO `js_sys_area` VALUES ('130404', '130400', '0,130000,130400,', '870', '0000000030,0000000080,0000000870,', '1', '2', '河北省/邯郸市/复兴区', '复兴区', '3', '0', 'system', '2018-03-11 15:59:23', 'system', '2018-03-11 15:59:23', null);
INSERT INTO `js_sys_area` VALUES ('130406', '130400', '0,130000,130400,', '880', '0000000030,0000000080,0000000880,', '1', '2', '河北省/邯郸市/峰峰矿区', '峰峰矿区', '3', '0', 'system', '2018-03-11 15:59:23', 'system', '2018-03-11 15:59:23', null);
INSERT INTO `js_sys_area` VALUES ('130421', '130400', '0,130000,130400,', '890', '0000000030,0000000080,0000000890,', '1', '2', '河北省/邯郸市/邯郸县', '邯郸县', '3', '0', 'system', '2018-03-11 15:59:23', 'system', '2018-03-11 15:59:23', null);
INSERT INTO `js_sys_area` VALUES ('130423', '130400', '0,130000,130400,', '900', '0000000030,0000000080,0000000900,', '1', '2', '河北省/邯郸市/临漳县', '临漳县', '3', '0', 'system', '2018-03-11 15:59:23', 'system', '2018-03-11 15:59:23', null);
INSERT INTO `js_sys_area` VALUES ('130424', '130400', '0,130000,130400,', '910', '0000000030,0000000080,0000000910,', '1', '2', '河北省/邯郸市/成安县', '成安县', '3', '0', 'system', '2018-03-11 15:59:23', 'system', '2018-03-11 15:59:23', null);
INSERT INTO `js_sys_area` VALUES ('130425', '130400', '0,130000,130400,', '920', '0000000030,0000000080,0000000920,', '1', '2', '河北省/邯郸市/大名县', '大名县', '3', '0', 'system', '2018-03-11 15:59:23', 'system', '2018-03-11 15:59:23', null);
INSERT INTO `js_sys_area` VALUES ('130426', '130400', '0,130000,130400,', '930', '0000000030,0000000080,0000000930,', '1', '2', '河北省/邯郸市/涉　县', '涉　县', '3', '0', 'system', '2018-03-11 15:59:23', 'system', '2018-03-11 15:59:23', null);
INSERT INTO `js_sys_area` VALUES ('130427', '130400', '0,130000,130400,', '940', '0000000030,0000000080,0000000940,', '1', '2', '河北省/邯郸市/磁　县', '磁　县', '3', '0', 'system', '2018-03-11 15:59:23', 'system', '2018-03-11 15:59:23', null);
INSERT INTO `js_sys_area` VALUES ('130428', '130400', '0,130000,130400,', '950', '0000000030,0000000080,0000000950,', '1', '2', '河北省/邯郸市/肥乡县', '肥乡县', '3', '0', 'system', '2018-03-11 15:59:24', 'system', '2018-03-11 15:59:24', null);
INSERT INTO `js_sys_area` VALUES ('130429', '130400', '0,130000,130400,', '960', '0000000030,0000000080,0000000960,', '1', '2', '河北省/邯郸市/永年县', '永年县', '3', '0', 'system', '2018-03-11 15:59:24', 'system', '2018-03-11 15:59:24', null);
INSERT INTO `js_sys_area` VALUES ('130430', '130400', '0,130000,130400,', '970', '0000000030,0000000080,0000000970,', '1', '2', '河北省/邯郸市/邱　县', '邱　县', '3', '0', 'system', '2018-03-11 15:59:24', 'system', '2018-03-11 15:59:24', null);
INSERT INTO `js_sys_area` VALUES ('130431', '130400', '0,130000,130400,', '980', '0000000030,0000000080,0000000980,', '1', '2', '河北省/邯郸市/鸡泽县', '鸡泽县', '3', '0', 'system', '2018-03-11 15:59:24', 'system', '2018-03-11 15:59:24', null);
INSERT INTO `js_sys_area` VALUES ('130432', '130400', '0,130000,130400,', '990', '0000000030,0000000080,0000000990,', '1', '2', '河北省/邯郸市/广平县', '广平县', '3', '0', 'system', '2018-03-11 15:59:24', 'system', '2018-03-11 15:59:24', null);
INSERT INTO `js_sys_area` VALUES ('130433', '130400', '0,130000,130400,', '1000', '0000000030,0000000080,0000001000,', '1', '2', '河北省/邯郸市/馆陶县', '馆陶县', '3', '0', 'system', '2018-03-11 15:59:24', 'system', '2018-03-11 15:59:24', null);
INSERT INTO `js_sys_area` VALUES ('130434', '130400', '0,130000,130400,', '1010', '0000000030,0000000080,0000001010,', '1', '2', '河北省/邯郸市/魏　县', '魏　县', '3', '0', 'system', '2018-03-11 15:59:24', 'system', '2018-03-11 15:59:24', null);
INSERT INTO `js_sys_area` VALUES ('130435', '130400', '0,130000,130400,', '1020', '0000000030,0000000080,0000001020,', '1', '2', '河北省/邯郸市/曲周县', '曲周县', '3', '0', 'system', '2018-03-11 15:59:24', 'system', '2018-03-11 15:59:24', null);
INSERT INTO `js_sys_area` VALUES ('130481', '130400', '0,130000,130400,', '1030', '0000000030,0000000080,0000001030,', '1', '2', '河北省/邯郸市/武安市', '武安市', '3', '0', 'system', '2018-03-11 15:59:24', 'system', '2018-03-11 15:59:24', null);
INSERT INTO `js_sys_area` VALUES ('130500', '130000', '0,130000,', '90', '0000000030,0000000090,', '0', '1', '河北省/邢台市', '邢台市', '2', '0', 'system', '2018-03-11 15:59:24', 'system', '2018-03-11 15:59:24', null);
INSERT INTO `js_sys_area` VALUES ('130501', '130500', '0,130000,130500,', '1040', '0000000030,0000000090,0000001040,', '1', '2', '河北省/邢台市/市辖区', '市辖区', '3', '0', 'system', '2018-03-11 15:59:24', 'system', '2018-03-11 15:59:24', null);
INSERT INTO `js_sys_area` VALUES ('130502', '130500', '0,130000,130500,', '1050', '0000000030,0000000090,0000001050,', '1', '2', '河北省/邢台市/桥东区', '桥东区', '3', '0', 'system', '2018-03-11 15:59:24', 'system', '2018-03-11 15:59:24', null);
INSERT INTO `js_sys_area` VALUES ('130503', '130500', '0,130000,130500,', '1060', '0000000030,0000000090,0000001060,', '1', '2', '河北省/邢台市/桥西区', '桥西区', '3', '0', 'system', '2018-03-11 15:59:24', 'system', '2018-03-11 15:59:24', null);
INSERT INTO `js_sys_area` VALUES ('130521', '130500', '0,130000,130500,', '1070', '0000000030,0000000090,0000001070,', '1', '2', '河北省/邢台市/邢台县', '邢台县', '3', '0', 'system', '2018-03-11 15:59:24', 'system', '2018-03-11 15:59:24', null);
INSERT INTO `js_sys_area` VALUES ('130522', '130500', '0,130000,130500,', '1080', '0000000030,0000000090,0000001080,', '1', '2', '河北省/邢台市/临城县', '临城县', '3', '0', 'system', '2018-03-11 15:59:24', 'system', '2018-03-11 15:59:24', null);
INSERT INTO `js_sys_area` VALUES ('130523', '130500', '0,130000,130500,', '1090', '0000000030,0000000090,0000001090,', '1', '2', '河北省/邢台市/内丘县', '内丘县', '3', '0', 'system', '2018-03-11 15:59:24', 'system', '2018-03-11 15:59:24', null);
INSERT INTO `js_sys_area` VALUES ('130524', '130500', '0,130000,130500,', '1100', '0000000030,0000000090,0000001100,', '1', '2', '河北省/邢台市/柏乡县', '柏乡县', '3', '0', 'system', '2018-03-11 15:59:24', 'system', '2018-03-11 15:59:24', null);
INSERT INTO `js_sys_area` VALUES ('130525', '130500', '0,130000,130500,', '1110', '0000000030,0000000090,0000001110,', '1', '2', '河北省/邢台市/隆尧县', '隆尧县', '3', '0', 'system', '2018-03-11 15:59:24', 'system', '2018-03-11 15:59:24', null);
INSERT INTO `js_sys_area` VALUES ('130526', '130500', '0,130000,130500,', '1120', '0000000030,0000000090,0000001120,', '1', '2', '河北省/邢台市/任　县', '任　县', '3', '0', 'system', '2018-03-11 15:59:24', 'system', '2018-03-11 15:59:24', null);
INSERT INTO `js_sys_area` VALUES ('130527', '130500', '0,130000,130500,', '1130', '0000000030,0000000090,0000001130,', '1', '2', '河北省/邢台市/南和县', '南和县', '3', '0', 'system', '2018-03-11 15:59:24', 'system', '2018-03-11 15:59:24', null);
INSERT INTO `js_sys_area` VALUES ('130528', '130500', '0,130000,130500,', '1140', '0000000030,0000000090,0000001140,', '1', '2', '河北省/邢台市/宁晋县', '宁晋县', '3', '0', 'system', '2018-03-11 15:59:24', 'system', '2018-03-11 15:59:24', null);
INSERT INTO `js_sys_area` VALUES ('130529', '130500', '0,130000,130500,', '1150', '0000000030,0000000090,0000001150,', '1', '2', '河北省/邢台市/巨鹿县', '巨鹿县', '3', '0', 'system', '2018-03-11 15:59:24', 'system', '2018-03-11 15:59:24', null);
INSERT INTO `js_sys_area` VALUES ('130530', '130500', '0,130000,130500,', '1160', '0000000030,0000000090,0000001160,', '1', '2', '河北省/邢台市/新河县', '新河县', '3', '0', 'system', '2018-03-11 15:59:24', 'system', '2018-03-11 15:59:24', null);
INSERT INTO `js_sys_area` VALUES ('130531', '130500', '0,130000,130500,', '1170', '0000000030,0000000090,0000001170,', '1', '2', '河北省/邢台市/广宗县', '广宗县', '3', '0', 'system', '2018-03-11 15:59:24', 'system', '2018-03-11 15:59:24', null);
INSERT INTO `js_sys_area` VALUES ('130532', '130500', '0,130000,130500,', '1180', '0000000030,0000000090,0000001180,', '1', '2', '河北省/邢台市/平乡县', '平乡县', '3', '0', 'system', '2018-03-11 15:59:24', 'system', '2018-03-11 15:59:24', null);
INSERT INTO `js_sys_area` VALUES ('130533', '130500', '0,130000,130500,', '1190', '0000000030,0000000090,0000001190,', '1', '2', '河北省/邢台市/威　县', '威　县', '3', '0', 'system', '2018-03-11 15:59:24', 'system', '2018-03-11 15:59:24', null);
INSERT INTO `js_sys_area` VALUES ('130534', '130500', '0,130000,130500,', '1200', '0000000030,0000000090,0000001200,', '1', '2', '河北省/邢台市/清河县', '清河县', '3', '0', 'system', '2018-03-11 15:59:25', 'system', '2018-03-11 15:59:25', null);
INSERT INTO `js_sys_area` VALUES ('130535', '130500', '0,130000,130500,', '1210', '0000000030,0000000090,0000001210,', '1', '2', '河北省/邢台市/临西县', '临西县', '3', '0', 'system', '2018-03-11 15:59:25', 'system', '2018-03-11 15:59:25', null);
INSERT INTO `js_sys_area` VALUES ('130581', '130500', '0,130000,130500,', '1220', '0000000030,0000000090,0000001220,', '1', '2', '河北省/邢台市/南宫市', '南宫市', '3', '0', 'system', '2018-03-11 15:59:25', 'system', '2018-03-11 15:59:25', null);
INSERT INTO `js_sys_area` VALUES ('130582', '130500', '0,130000,130500,', '1230', '0000000030,0000000090,0000001230,', '1', '2', '河北省/邢台市/沙河市', '沙河市', '3', '0', 'system', '2018-03-11 15:59:25', 'system', '2018-03-11 15:59:25', null);
INSERT INTO `js_sys_area` VALUES ('130600', '130000', '0,130000,', '100', '0000000030,0000000100,', '0', '1', '河北省/保定市', '保定市', '2', '0', 'system', '2018-03-11 15:59:25', 'system', '2018-03-11 15:59:25', null);
INSERT INTO `js_sys_area` VALUES ('130601', '130600', '0,130000,130600,', '1240', '0000000030,0000000100,0000001240,', '1', '2', '河北省/保定市/市辖区', '市辖区', '3', '0', 'system', '2018-03-11 15:59:25', 'system', '2018-03-11 15:59:25', null);
INSERT INTO `js_sys_area` VALUES ('130602', '130600', '0,130000,130600,', '1250', '0000000030,0000000100,0000001250,', '1', '2', '河北省/保定市/新市区', '新市区', '3', '0', 'system', '2018-03-11 15:59:25', 'system', '2018-03-11 15:59:25', null);
INSERT INTO `js_sys_area` VALUES ('130603', '130600', '0,130000,130600,', '1260', '0000000030,0000000100,0000001260,', '1', '2', '河北省/保定市/北市区', '北市区', '3', '0', 'system', '2018-03-11 15:59:25', 'system', '2018-03-11 15:59:25', null);
INSERT INTO `js_sys_area` VALUES ('130604', '130600', '0,130000,130600,', '1270', '0000000030,0000000100,0000001270,', '1', '2', '河北省/保定市/南市区', '南市区', '3', '0', 'system', '2018-03-11 15:59:25', 'system', '2018-03-11 15:59:25', null);
INSERT INTO `js_sys_area` VALUES ('130621', '130600', '0,130000,130600,', '1280', '0000000030,0000000100,0000001280,', '1', '2', '河北省/保定市/满城县', '满城县', '3', '0', 'system', '2018-03-11 15:59:25', 'system', '2018-03-11 15:59:25', null);
INSERT INTO `js_sys_area` VALUES ('130622', '130600', '0,130000,130600,', '1290', '0000000030,0000000100,0000001290,', '1', '2', '河北省/保定市/清苑县', '清苑县', '3', '0', 'system', '2018-03-11 15:59:25', 'system', '2018-03-11 15:59:25', null);
INSERT INTO `js_sys_area` VALUES ('130623', '130600', '0,130000,130600,', '1300', '0000000030,0000000100,0000001300,', '1', '2', '河北省/保定市/涞水县', '涞水县', '3', '0', 'system', '2018-03-11 15:59:25', 'system', '2018-03-11 15:59:25', null);
INSERT INTO `js_sys_area` VALUES ('130624', '130600', '0,130000,130600,', '1310', '0000000030,0000000100,0000001310,', '1', '2', '河北省/保定市/阜平县', '阜平县', '3', '0', 'system', '2018-03-11 15:59:25', 'system', '2018-03-11 15:59:25', null);
INSERT INTO `js_sys_area` VALUES ('130625', '130600', '0,130000,130600,', '1320', '0000000030,0000000100,0000001320,', '1', '2', '河北省/保定市/徐水县', '徐水县', '3', '0', 'system', '2018-03-11 15:59:25', 'system', '2018-03-11 15:59:25', null);
INSERT INTO `js_sys_area` VALUES ('130626', '130600', '0,130000,130600,', '1330', '0000000030,0000000100,0000001330,', '1', '2', '河北省/保定市/定兴县', '定兴县', '3', '0', 'system', '2018-03-11 15:59:25', 'system', '2018-03-11 15:59:25', null);
INSERT INTO `js_sys_area` VALUES ('130627', '130600', '0,130000,130600,', '1340', '0000000030,0000000100,0000001340,', '1', '2', '河北省/保定市/唐　县', '唐　县', '3', '0', 'system', '2018-03-11 15:59:25', 'system', '2018-03-11 15:59:25', null);
INSERT INTO `js_sys_area` VALUES ('130628', '130600', '0,130000,130600,', '1350', '0000000030,0000000100,0000001350,', '1', '2', '河北省/保定市/高阳县', '高阳县', '3', '0', 'system', '2018-03-11 15:59:25', 'system', '2018-03-11 15:59:25', null);
INSERT INTO `js_sys_area` VALUES ('130629', '130600', '0,130000,130600,', '1360', '0000000030,0000000100,0000001360,', '1', '2', '河北省/保定市/容城县', '容城县', '3', '0', 'system', '2018-03-11 15:59:25', 'system', '2018-03-11 15:59:25', null);
INSERT INTO `js_sys_area` VALUES ('130630', '130600', '0,130000,130600,', '1370', '0000000030,0000000100,0000001370,', '1', '2', '河北省/保定市/涞源县', '涞源县', '3', '0', 'system', '2018-03-11 15:59:25', 'system', '2018-03-11 15:59:25', null);
INSERT INTO `js_sys_area` VALUES ('130631', '130600', '0,130000,130600,', '1380', '0000000030,0000000100,0000001380,', '1', '2', '河北省/保定市/望都县', '望都县', '3', '0', 'system', '2018-03-11 15:59:25', 'system', '2018-03-11 15:59:25', null);
INSERT INTO `js_sys_area` VALUES ('130632', '130600', '0,130000,130600,', '1390', '0000000030,0000000100,0000001390,', '1', '2', '河北省/保定市/安新县', '安新县', '3', '0', 'system', '2018-03-11 15:59:25', 'system', '2018-03-11 15:59:25', null);
INSERT INTO `js_sys_area` VALUES ('130633', '130600', '0,130000,130600,', '1400', '0000000030,0000000100,0000001400,', '1', '2', '河北省/保定市/易　县', '易　县', '3', '0', 'system', '2018-03-11 15:59:25', 'system', '2018-03-11 15:59:25', null);
INSERT INTO `js_sys_area` VALUES ('130634', '130600', '0,130000,130600,', '1410', '0000000030,0000000100,0000001410,', '1', '2', '河北省/保定市/曲阳县', '曲阳县', '3', '0', 'system', '2018-03-11 15:59:25', 'system', '2018-03-11 15:59:25', null);
INSERT INTO `js_sys_area` VALUES ('130635', '130600', '0,130000,130600,', '1420', '0000000030,0000000100,0000001420,', '1', '2', '河北省/保定市/蠡　县', '蠡　县', '3', '0', 'system', '2018-03-11 15:59:25', 'system', '2018-03-11 15:59:25', null);
INSERT INTO `js_sys_area` VALUES ('130636', '130600', '0,130000,130600,', '1430', '0000000030,0000000100,0000001430,', '1', '2', '河北省/保定市/顺平县', '顺平县', '3', '0', 'system', '2018-03-11 15:59:25', 'system', '2018-03-11 15:59:25', null);
INSERT INTO `js_sys_area` VALUES ('130637', '130600', '0,130000,130600,', '1440', '0000000030,0000000100,0000001440,', '1', '2', '河北省/保定市/博野县', '博野县', '3', '0', 'system', '2018-03-11 15:59:25', 'system', '2018-03-11 15:59:25', null);
INSERT INTO `js_sys_area` VALUES ('130638', '130600', '0,130000,130600,', '1450', '0000000030,0000000100,0000001450,', '1', '2', '河北省/保定市/雄　县', '雄　县', '3', '0', 'system', '2018-03-11 15:59:25', 'system', '2018-03-11 15:59:25', null);
INSERT INTO `js_sys_area` VALUES ('130681', '130600', '0,130000,130600,', '1460', '0000000030,0000000100,0000001460,', '1', '2', '河北省/保定市/涿州市', '涿州市', '3', '0', 'system', '2018-03-11 15:59:26', 'system', '2018-03-11 15:59:26', null);
INSERT INTO `js_sys_area` VALUES ('130682', '130600', '0,130000,130600,', '1470', '0000000030,0000000100,0000001470,', '1', '2', '河北省/保定市/定州市', '定州市', '3', '0', 'system', '2018-03-11 15:59:26', 'system', '2018-03-11 15:59:26', null);
INSERT INTO `js_sys_area` VALUES ('130683', '130600', '0,130000,130600,', '1480', '0000000030,0000000100,0000001480,', '1', '2', '河北省/保定市/安国市', '安国市', '3', '0', 'system', '2018-03-11 15:59:26', 'system', '2018-03-11 15:59:26', null);
INSERT INTO `js_sys_area` VALUES ('130684', '130600', '0,130000,130600,', '1490', '0000000030,0000000100,0000001490,', '1', '2', '河北省/保定市/高碑店市', '高碑店市', '3', '0', 'system', '2018-03-11 15:59:26', 'system', '2018-03-11 15:59:26', null);
INSERT INTO `js_sys_area` VALUES ('130700', '130000', '0,130000,', '110', '0000000030,0000000110,', '0', '1', '河北省/张家口市', '张家口市', '2', '0', 'system', '2018-03-11 15:59:26', 'system', '2018-03-11 15:59:26', null);
INSERT INTO `js_sys_area` VALUES ('130701', '130700', '0,130000,130700,', '1500', '0000000030,0000000110,0000001500,', '1', '2', '河北省/张家口市/市辖区', '市辖区', '3', '0', 'system', '2018-03-11 15:59:26', 'system', '2018-03-11 15:59:26', null);
INSERT INTO `js_sys_area` VALUES ('130702', '130700', '0,130000,130700,', '1510', '0000000030,0000000110,0000001510,', '1', '2', '河北省/张家口市/桥东区', '桥东区', '3', '0', 'system', '2018-03-11 15:59:26', 'system', '2018-03-11 15:59:26', null);
INSERT INTO `js_sys_area` VALUES ('130703', '130700', '0,130000,130700,', '1520', '0000000030,0000000110,0000001520,', '1', '2', '河北省/张家口市/桥西区', '桥西区', '3', '0', 'system', '2018-03-11 15:59:26', 'system', '2018-03-11 15:59:26', null);
INSERT INTO `js_sys_area` VALUES ('130705', '130700', '0,130000,130700,', '1530', '0000000030,0000000110,0000001530,', '1', '2', '河北省/张家口市/宣化区', '宣化区', '3', '0', 'system', '2018-03-11 15:59:26', 'system', '2018-03-11 15:59:26', null);
INSERT INTO `js_sys_area` VALUES ('130706', '130700', '0,130000,130700,', '1540', '0000000030,0000000110,0000001540,', '1', '2', '河北省/张家口市/下花园区', '下花园区', '3', '0', 'system', '2018-03-11 15:59:26', 'system', '2018-03-11 15:59:26', null);
INSERT INTO `js_sys_area` VALUES ('130721', '130700', '0,130000,130700,', '1550', '0000000030,0000000110,0000001550,', '1', '2', '河北省/张家口市/宣化县', '宣化县', '3', '0', 'system', '2018-03-11 15:59:26', 'system', '2018-03-11 15:59:26', null);
INSERT INTO `js_sys_area` VALUES ('130722', '130700', '0,130000,130700,', '1560', '0000000030,0000000110,0000001560,', '1', '2', '河北省/张家口市/张北县', '张北县', '3', '0', 'system', '2018-03-11 15:59:26', 'system', '2018-03-11 15:59:26', null);
INSERT INTO `js_sys_area` VALUES ('130723', '130700', '0,130000,130700,', '1570', '0000000030,0000000110,0000001570,', '1', '2', '河北省/张家口市/康保县', '康保县', '3', '0', 'system', '2018-03-11 15:59:26', 'system', '2018-03-11 15:59:26', null);
INSERT INTO `js_sys_area` VALUES ('130724', '130700', '0,130000,130700,', '1580', '0000000030,0000000110,0000001580,', '1', '2', '河北省/张家口市/沽源县', '沽源县', '3', '0', 'system', '2018-03-11 15:59:26', 'system', '2018-03-11 15:59:26', null);
INSERT INTO `js_sys_area` VALUES ('130725', '130700', '0,130000,130700,', '1590', '0000000030,0000000110,0000001590,', '1', '2', '河北省/张家口市/尚义县', '尚义县', '3', '0', 'system', '2018-03-11 15:59:26', 'system', '2018-03-11 15:59:26', null);
INSERT INTO `js_sys_area` VALUES ('130726', '130700', '0,130000,130700,', '1600', '0000000030,0000000110,0000001600,', '1', '2', '河北省/张家口市/蔚　县', '蔚　县', '3', '0', 'system', '2018-03-11 15:59:26', 'system', '2018-03-11 15:59:26', null);
INSERT INTO `js_sys_area` VALUES ('130727', '130700', '0,130000,130700,', '1610', '0000000030,0000000110,0000001610,', '1', '2', '河北省/张家口市/阳原县', '阳原县', '3', '0', 'system', '2018-03-11 15:59:26', 'system', '2018-03-11 15:59:26', null);
INSERT INTO `js_sys_area` VALUES ('130728', '130700', '0,130000,130700,', '1620', '0000000030,0000000110,0000001620,', '1', '2', '河北省/张家口市/怀安县', '怀安县', '3', '0', 'system', '2018-03-11 15:59:26', 'system', '2018-03-11 15:59:26', null);
INSERT INTO `js_sys_area` VALUES ('130729', '130700', '0,130000,130700,', '1630', '0000000030,0000000110,0000001630,', '1', '2', '河北省/张家口市/万全县', '万全县', '3', '0', 'system', '2018-03-11 15:59:26', 'system', '2018-03-11 15:59:26', null);
INSERT INTO `js_sys_area` VALUES ('130730', '130700', '0,130000,130700,', '1640', '0000000030,0000000110,0000001640,', '1', '2', '河北省/张家口市/怀来县', '怀来县', '3', '0', 'system', '2018-03-11 15:59:26', 'system', '2018-03-11 15:59:26', null);
INSERT INTO `js_sys_area` VALUES ('130731', '130700', '0,130000,130700,', '1650', '0000000030,0000000110,0000001650,', '1', '2', '河北省/张家口市/涿鹿县', '涿鹿县', '3', '0', 'system', '2018-03-11 15:59:26', 'system', '2018-03-11 15:59:26', null);
INSERT INTO `js_sys_area` VALUES ('130732', '130700', '0,130000,130700,', '1660', '0000000030,0000000110,0000001660,', '1', '2', '河北省/张家口市/赤城县', '赤城县', '3', '0', 'system', '2018-03-11 15:59:26', 'system', '2018-03-11 15:59:26', null);
INSERT INTO `js_sys_area` VALUES ('130733', '130700', '0,130000,130700,', '1670', '0000000030,0000000110,0000001670,', '1', '2', '河北省/张家口市/崇礼县', '崇礼县', '3', '0', 'system', '2018-03-11 15:59:26', 'system', '2018-03-11 15:59:26', null);
INSERT INTO `js_sys_area` VALUES ('130800', '130000', '0,130000,', '120', '0000000030,0000000120,', '0', '1', '河北省/承德市', '承德市', '2', '0', 'system', '2018-03-11 15:59:26', 'system', '2018-03-11 15:59:26', null);
INSERT INTO `js_sys_area` VALUES ('130801', '130800', '0,130000,130800,', '1680', '0000000030,0000000120,0000001680,', '1', '2', '河北省/承德市/市辖区', '市辖区', '3', '0', 'system', '2018-03-11 15:59:26', 'system', '2018-03-11 15:59:26', null);
INSERT INTO `js_sys_area` VALUES ('130802', '130800', '0,130000,130800,', '1690', '0000000030,0000000120,0000001690,', '1', '2', '河北省/承德市/双桥区', '双桥区', '3', '0', 'system', '2018-03-11 15:59:26', 'system', '2018-03-11 15:59:26', null);
INSERT INTO `js_sys_area` VALUES ('130803', '130800', '0,130000,130800,', '1700', '0000000030,0000000120,0000001700,', '1', '2', '河北省/承德市/双滦区', '双滦区', '3', '0', 'system', '2018-03-11 15:59:26', 'system', '2018-03-11 15:59:26', null);
INSERT INTO `js_sys_area` VALUES ('130804', '130800', '0,130000,130800,', '1710', '0000000030,0000000120,0000001710,', '1', '2', '河北省/承德市/鹰手营子矿区', '鹰手营子矿区', '3', '0', 'system', '2018-03-11 15:59:26', 'system', '2018-03-11 15:59:26', null);
INSERT INTO `js_sys_area` VALUES ('130821', '130800', '0,130000,130800,', '1720', '0000000030,0000000120,0000001720,', '1', '2', '河北省/承德市/承德县', '承德县', '3', '0', 'system', '2018-03-11 15:59:27', 'system', '2018-03-11 15:59:27', null);
INSERT INTO `js_sys_area` VALUES ('130822', '130800', '0,130000,130800,', '1730', '0000000030,0000000120,0000001730,', '1', '2', '河北省/承德市/兴隆县', '兴隆县', '3', '0', 'system', '2018-03-11 15:59:27', 'system', '2018-03-11 15:59:27', null);
INSERT INTO `js_sys_area` VALUES ('130823', '130800', '0,130000,130800,', '1740', '0000000030,0000000120,0000001740,', '1', '2', '河北省/承德市/平泉县', '平泉县', '3', '0', 'system', '2018-03-11 15:59:27', 'system', '2018-03-11 15:59:27', null);
INSERT INTO `js_sys_area` VALUES ('130824', '130800', '0,130000,130800,', '1750', '0000000030,0000000120,0000001750,', '1', '2', '河北省/承德市/滦平县', '滦平县', '3', '0', 'system', '2018-03-11 15:59:27', 'system', '2018-03-11 15:59:27', null);
INSERT INTO `js_sys_area` VALUES ('130825', '130800', '0,130000,130800,', '1760', '0000000030,0000000120,0000001760,', '1', '2', '河北省/承德市/隆化县', '隆化县', '3', '0', 'system', '2018-03-11 15:59:27', 'system', '2018-03-11 15:59:27', null);
INSERT INTO `js_sys_area` VALUES ('130826', '130800', '0,130000,130800,', '1770', '0000000030,0000000120,0000001770,', '1', '2', '河北省/承德市/丰宁满族自治县', '丰宁满族自治县', '3', '0', 'system', '2018-03-11 15:59:27', 'system', '2018-03-11 15:59:27', null);
INSERT INTO `js_sys_area` VALUES ('130827', '130800', '0,130000,130800,', '1780', '0000000030,0000000120,0000001780,', '1', '2', '河北省/承德市/宽城满族自治县', '宽城满族自治县', '3', '0', 'system', '2018-03-11 15:59:27', 'system', '2018-03-11 15:59:27', null);
INSERT INTO `js_sys_area` VALUES ('130828', '130800', '0,130000,130800,', '1790', '0000000030,0000000120,0000001790,', '1', '2', '河北省/承德市/围场满族蒙古族自治县', '围场满族蒙古族自治县', '3', '0', 'system', '2018-03-11 15:59:27', 'system', '2018-03-11 15:59:27', null);
INSERT INTO `js_sys_area` VALUES ('130900', '130000', '0,130000,', '130', '0000000030,0000000130,', '0', '1', '河北省/沧州市', '沧州市', '2', '0', 'system', '2018-03-11 15:59:27', 'system', '2018-03-11 15:59:27', null);
INSERT INTO `js_sys_area` VALUES ('130901', '130900', '0,130000,130900,', '1800', '0000000030,0000000130,0000001800,', '1', '2', '河北省/沧州市/市辖区', '市辖区', '3', '0', 'system', '2018-03-11 15:59:27', 'system', '2018-03-11 15:59:27', null);
INSERT INTO `js_sys_area` VALUES ('130902', '130900', '0,130000,130900,', '1810', '0000000030,0000000130,0000001810,', '1', '2', '河北省/沧州市/新华区', '新华区', '3', '0', 'system', '2018-03-11 15:59:27', 'system', '2018-03-11 15:59:27', null);
INSERT INTO `js_sys_area` VALUES ('130903', '130900', '0,130000,130900,', '1820', '0000000030,0000000130,0000001820,', '1', '2', '河北省/沧州市/运河区', '运河区', '3', '0', 'system', '2018-03-11 15:59:27', 'system', '2018-03-11 15:59:27', null);
INSERT INTO `js_sys_area` VALUES ('130921', '130900', '0,130000,130900,', '1830', '0000000030,0000000130,0000001830,', '1', '2', '河北省/沧州市/沧　县', '沧　县', '3', '0', 'system', '2018-03-11 15:59:27', 'system', '2018-03-11 15:59:27', null);
INSERT INTO `js_sys_area` VALUES ('130922', '130900', '0,130000,130900,', '1840', '0000000030,0000000130,0000001840,', '1', '2', '河北省/沧州市/青　县', '青　县', '3', '0', 'system', '2018-03-11 15:59:27', 'system', '2018-03-11 15:59:27', null);
INSERT INTO `js_sys_area` VALUES ('130923', '130900', '0,130000,130900,', '1850', '0000000030,0000000130,0000001850,', '1', '2', '河北省/沧州市/东光县', '东光县', '3', '0', 'system', '2018-03-11 15:59:27', 'system', '2018-03-11 15:59:27', null);
INSERT INTO `js_sys_area` VALUES ('130924', '130900', '0,130000,130900,', '1860', '0000000030,0000000130,0000001860,', '1', '2', '河北省/沧州市/海兴县', '海兴县', '3', '0', 'system', '2018-03-11 15:59:27', 'system', '2018-03-11 15:59:27', null);
INSERT INTO `js_sys_area` VALUES ('130925', '130900', '0,130000,130900,', '1870', '0000000030,0000000130,0000001870,', '1', '2', '河北省/沧州市/盐山县', '盐山县', '3', '0', 'system', '2018-03-11 15:59:27', 'system', '2018-03-11 15:59:27', null);
INSERT INTO `js_sys_area` VALUES ('130926', '130900', '0,130000,130900,', '1880', '0000000030,0000000130,0000001880,', '1', '2', '河北省/沧州市/肃宁县', '肃宁县', '3', '0', 'system', '2018-03-11 15:59:27', 'system', '2018-03-11 15:59:27', null);
INSERT INTO `js_sys_area` VALUES ('130927', '130900', '0,130000,130900,', '1890', '0000000030,0000000130,0000001890,', '1', '2', '河北省/沧州市/南皮县', '南皮县', '3', '0', 'system', '2018-03-11 15:59:27', 'system', '2018-03-11 15:59:27', null);
INSERT INTO `js_sys_area` VALUES ('130928', '130900', '0,130000,130900,', '1900', '0000000030,0000000130,0000001900,', '1', '2', '河北省/沧州市/吴桥县', '吴桥县', '3', '0', 'system', '2018-03-11 15:59:27', 'system', '2018-03-11 15:59:27', null);
INSERT INTO `js_sys_area` VALUES ('130929', '130900', '0,130000,130900,', '1910', '0000000030,0000000130,0000001910,', '1', '2', '河北省/沧州市/献　县', '献　县', '3', '0', 'system', '2018-03-11 15:59:27', 'system', '2018-03-11 15:59:27', null);
INSERT INTO `js_sys_area` VALUES ('130930', '130900', '0,130000,130900,', '1920', '0000000030,0000000130,0000001920,', '1', '2', '河北省/沧州市/孟村回族自治县', '孟村回族自治县', '3', '0', 'system', '2018-03-11 15:59:27', 'system', '2018-03-11 15:59:27', null);
INSERT INTO `js_sys_area` VALUES ('130981', '130900', '0,130000,130900,', '1930', '0000000030,0000000130,0000001930,', '1', '2', '河北省/沧州市/泊头市', '泊头市', '3', '0', 'system', '2018-03-11 15:59:27', 'system', '2018-03-11 15:59:27', null);
INSERT INTO `js_sys_area` VALUES ('130982', '130900', '0,130000,130900,', '1940', '0000000030,0000000130,0000001940,', '1', '2', '河北省/沧州市/任丘市', '任丘市', '3', '0', 'system', '2018-03-11 15:59:27', 'system', '2018-03-11 15:59:27', null);
INSERT INTO `js_sys_area` VALUES ('130983', '130900', '0,130000,130900,', '1950', '0000000030,0000000130,0000001950,', '1', '2', '河北省/沧州市/黄骅市', '黄骅市', '3', '0', 'system', '2018-03-11 15:59:27', 'system', '2018-03-11 15:59:27', null);
INSERT INTO `js_sys_area` VALUES ('130984', '130900', '0,130000,130900,', '1960', '0000000030,0000000130,0000001960,', '1', '2', '河北省/沧州市/河间市', '河间市', '3', '0', 'system', '2018-03-11 15:59:27', 'system', '2018-03-11 15:59:27', null);
INSERT INTO `js_sys_area` VALUES ('131000', '130000', '0,130000,', '140', '0000000030,0000000140,', '0', '1', '河北省/廊坊市', '廊坊市', '2', '0', 'system', '2018-03-11 15:59:27', 'system', '2018-03-11 15:59:27', null);
INSERT INTO `js_sys_area` VALUES ('131001', '131000', '0,130000,131000,', '1970', '0000000030,0000000140,0000001970,', '1', '2', '河北省/廊坊市/市辖区', '市辖区', '3', '0', 'system', '2018-03-11 15:59:27', 'system', '2018-03-11 15:59:27', null);
INSERT INTO `js_sys_area` VALUES ('131002', '131000', '0,130000,131000,', '1980', '0000000030,0000000140,0000001980,', '1', '2', '河北省/廊坊市/安次区', '安次区', '3', '0', 'system', '2018-03-11 15:59:27', 'system', '2018-03-11 15:59:27', null);
INSERT INTO `js_sys_area` VALUES ('131003', '131000', '0,130000,131000,', '1990', '0000000030,0000000140,0000001990,', '1', '2', '河北省/廊坊市/广阳区', '广阳区', '3', '0', 'system', '2018-03-11 15:59:27', 'system', '2018-03-11 15:59:27', null);
INSERT INTO `js_sys_area` VALUES ('131022', '131000', '0,130000,131000,', '2000', '0000000030,0000000140,0000002000,', '1', '2', '河北省/廊坊市/固安县', '固安县', '3', '0', 'system', '2018-03-11 15:59:28', 'system', '2018-03-11 15:59:28', null);
INSERT INTO `js_sys_area` VALUES ('131023', '131000', '0,130000,131000,', '2010', '0000000030,0000000140,0000002010,', '1', '2', '河北省/廊坊市/永清县', '永清县', '3', '0', 'system', '2018-03-11 15:59:28', 'system', '2018-03-11 15:59:28', null);
INSERT INTO `js_sys_area` VALUES ('131024', '131000', '0,130000,131000,', '2020', '0000000030,0000000140,0000002020,', '1', '2', '河北省/廊坊市/香河县', '香河县', '3', '0', 'system', '2018-03-11 15:59:28', 'system', '2018-03-11 15:59:28', null);
INSERT INTO `js_sys_area` VALUES ('131025', '131000', '0,130000,131000,', '2030', '0000000030,0000000140,0000002030,', '1', '2', '河北省/廊坊市/大城县', '大城县', '3', '0', 'system', '2018-03-11 15:59:28', 'system', '2018-03-11 15:59:28', null);
INSERT INTO `js_sys_area` VALUES ('131026', '131000', '0,130000,131000,', '2040', '0000000030,0000000140,0000002040,', '1', '2', '河北省/廊坊市/文安县', '文安县', '3', '0', 'system', '2018-03-11 15:59:28', 'system', '2018-03-11 15:59:28', null);
INSERT INTO `js_sys_area` VALUES ('131028', '131000', '0,130000,131000,', '2050', '0000000030,0000000140,0000002050,', '1', '2', '河北省/廊坊市/大厂回族自治县', '大厂回族自治县', '3', '0', 'system', '2018-03-11 15:59:28', 'system', '2018-03-11 15:59:28', null);
INSERT INTO `js_sys_area` VALUES ('131081', '131000', '0,130000,131000,', '2060', '0000000030,0000000140,0000002060,', '1', '2', '河北省/廊坊市/霸州市', '霸州市', '3', '0', 'system', '2018-03-11 15:59:28', 'system', '2018-03-11 15:59:28', null);
INSERT INTO `js_sys_area` VALUES ('131082', '131000', '0,130000,131000,', '2070', '0000000030,0000000140,0000002070,', '1', '2', '河北省/廊坊市/三河市', '三河市', '3', '0', 'system', '2018-03-11 15:59:28', 'system', '2018-03-11 15:59:28', null);
INSERT INTO `js_sys_area` VALUES ('131100', '130000', '0,130000,', '150', '0000000030,0000000150,', '0', '1', '河北省/衡水市', '衡水市', '2', '0', 'system', '2018-03-11 15:59:28', 'system', '2018-03-11 15:59:28', null);
INSERT INTO `js_sys_area` VALUES ('131101', '131100', '0,130000,131100,', '2080', '0000000030,0000000150,0000002080,', '1', '2', '河北省/衡水市/市辖区', '市辖区', '3', '0', 'system', '2018-03-11 15:59:28', 'system', '2018-03-11 15:59:28', null);
INSERT INTO `js_sys_area` VALUES ('131102', '131100', '0,130000,131100,', '2090', '0000000030,0000000150,0000002090,', '1', '2', '河北省/衡水市/桃城区', '桃城区', '3', '0', 'system', '2018-03-11 15:59:28', 'system', '2018-03-11 15:59:28', null);
INSERT INTO `js_sys_area` VALUES ('131121', '131100', '0,130000,131100,', '2100', '0000000030,0000000150,0000002100,', '1', '2', '河北省/衡水市/枣强县', '枣强县', '3', '0', 'system', '2018-03-11 15:59:28', 'system', '2018-03-11 15:59:28', null);
INSERT INTO `js_sys_area` VALUES ('131122', '131100', '0,130000,131100,', '2110', '0000000030,0000000150,0000002110,', '1', '2', '河北省/衡水市/武邑县', '武邑县', '3', '0', 'system', '2018-03-11 15:59:28', 'system', '2018-03-11 15:59:28', null);
INSERT INTO `js_sys_area` VALUES ('131123', '131100', '0,130000,131100,', '2120', '0000000030,0000000150,0000002120,', '1', '2', '河北省/衡水市/武强县', '武强县', '3', '0', 'system', '2018-03-11 15:59:28', 'system', '2018-03-11 15:59:28', null);
INSERT INTO `js_sys_area` VALUES ('131124', '131100', '0,130000,131100,', '2130', '0000000030,0000000150,0000002130,', '1', '2', '河北省/衡水市/饶阳县', '饶阳县', '3', '0', 'system', '2018-03-11 15:59:28', 'system', '2018-03-11 15:59:28', null);
INSERT INTO `js_sys_area` VALUES ('131125', '131100', '0,130000,131100,', '2140', '0000000030,0000000150,0000002140,', '1', '2', '河北省/衡水市/安平县', '安平县', '3', '0', 'system', '2018-03-11 15:59:28', 'system', '2018-03-11 15:59:28', null);
INSERT INTO `js_sys_area` VALUES ('131126', '131100', '0,130000,131100,', '2150', '0000000030,0000000150,0000002150,', '1', '2', '河北省/衡水市/故城县', '故城县', '3', '0', 'system', '2018-03-11 15:59:28', 'system', '2018-03-11 15:59:28', null);
INSERT INTO `js_sys_area` VALUES ('131127', '131100', '0,130000,131100,', '2160', '0000000030,0000000150,0000002160,', '1', '2', '河北省/衡水市/景　县', '景　县', '3', '0', 'system', '2018-03-11 15:59:28', 'system', '2018-03-11 15:59:28', null);
INSERT INTO `js_sys_area` VALUES ('131128', '131100', '0,130000,131100,', '2170', '0000000030,0000000150,0000002170,', '1', '2', '河北省/衡水市/阜城县', '阜城县', '3', '0', 'system', '2018-03-11 15:59:28', 'system', '2018-03-11 15:59:28', null);
INSERT INTO `js_sys_area` VALUES ('131181', '131100', '0,130000,131100,', '2180', '0000000030,0000000150,0000002180,', '1', '2', '河北省/衡水市/冀州市', '冀州市', '3', '0', 'system', '2018-03-11 15:59:28', 'system', '2018-03-11 15:59:28', null);
INSERT INTO `js_sys_area` VALUES ('131182', '131100', '0,130000,131100,', '2190', '0000000030,0000000150,0000002190,', '1', '2', '河北省/衡水市/深州市', '深州市', '3', '0', 'system', '2018-03-11 15:59:28', 'system', '2018-03-11 15:59:28', null);
INSERT INTO `js_sys_area` VALUES ('140000', '0', '0,', '40', '0000000040,', '0', '0', '山西省', '山西省', '1', '0', 'system', '2018-03-11 15:59:28', 'system', '2018-03-11 15:59:28', null);
INSERT INTO `js_sys_area` VALUES ('140100', '140000', '0,140000,', '160', '0000000040,0000000160,', '0', '1', '山西省/太原市', '太原市', '2', '0', 'system', '2018-03-11 15:59:28', 'system', '2018-03-11 15:59:28', null);
INSERT INTO `js_sys_area` VALUES ('140101', '140100', '0,140000,140100,', '2200', '0000000040,0000000160,0000002200,', '1', '2', '山西省/太原市/市辖区', '市辖区', '3', '0', 'system', '2018-03-11 15:59:28', 'system', '2018-03-11 15:59:28', null);
INSERT INTO `js_sys_area` VALUES ('140105', '140100', '0,140000,140100,', '2210', '0000000040,0000000160,0000002210,', '1', '2', '山西省/太原市/小店区', '小店区', '3', '0', 'system', '2018-03-11 15:59:28', 'system', '2018-03-11 15:59:28', null);
INSERT INTO `js_sys_area` VALUES ('140106', '140100', '0,140000,140100,', '2220', '0000000040,0000000160,0000002220,', '1', '2', '山西省/太原市/迎泽区', '迎泽区', '3', '0', 'system', '2018-03-11 15:59:28', 'system', '2018-03-11 15:59:28', null);
INSERT INTO `js_sys_area` VALUES ('140107', '140100', '0,140000,140100,', '2230', '0000000040,0000000160,0000002230,', '1', '2', '山西省/太原市/杏花岭区', '杏花岭区', '3', '0', 'system', '2018-03-11 15:59:28', 'system', '2018-03-11 15:59:28', null);
INSERT INTO `js_sys_area` VALUES ('140108', '140100', '0,140000,140100,', '2240', '0000000040,0000000160,0000002240,', '1', '2', '山西省/太原市/尖草坪区', '尖草坪区', '3', '0', 'system', '2018-03-11 15:59:28', 'system', '2018-03-11 15:59:28', null);
INSERT INTO `js_sys_area` VALUES ('140109', '140100', '0,140000,140100,', '2250', '0000000040,0000000160,0000002250,', '1', '2', '山西省/太原市/万柏林区', '万柏林区', '3', '0', 'system', '2018-03-11 15:59:28', 'system', '2018-03-11 15:59:28', null);
INSERT INTO `js_sys_area` VALUES ('140110', '140100', '0,140000,140100,', '2260', '0000000040,0000000160,0000002260,', '1', '2', '山西省/太原市/晋源区', '晋源区', '3', '0', 'system', '2018-03-11 15:59:28', 'system', '2018-03-11 15:59:28', null);
INSERT INTO `js_sys_area` VALUES ('140121', '140100', '0,140000,140100,', '2270', '0000000040,0000000160,0000002270,', '1', '2', '山西省/太原市/清徐县', '清徐县', '3', '0', 'system', '2018-03-11 15:59:28', 'system', '2018-03-11 15:59:28', null);
INSERT INTO `js_sys_area` VALUES ('140122', '140100', '0,140000,140100,', '2280', '0000000040,0000000160,0000002280,', '1', '2', '山西省/太原市/阳曲县', '阳曲县', '3', '0', 'system', '2018-03-11 15:59:28', 'system', '2018-03-11 15:59:28', null);
INSERT INTO `js_sys_area` VALUES ('140123', '140100', '0,140000,140100,', '2290', '0000000040,0000000160,0000002290,', '1', '2', '山西省/太原市/娄烦县', '娄烦县', '3', '0', 'system', '2018-03-11 15:59:28', 'system', '2018-03-11 15:59:28', null);
INSERT INTO `js_sys_area` VALUES ('140181', '140100', '0,140000,140100,', '2300', '0000000040,0000000160,0000002300,', '1', '2', '山西省/太原市/古交市', '古交市', '3', '0', 'system', '2018-03-11 15:59:28', 'system', '2018-03-11 15:59:28', null);
INSERT INTO `js_sys_area` VALUES ('140200', '140000', '0,140000,', '170', '0000000040,0000000170,', '0', '1', '山西省/大同市', '大同市', '2', '0', 'system', '2018-03-11 15:59:29', 'system', '2018-03-11 15:59:28', null);
INSERT INTO `js_sys_area` VALUES ('140201', '140200', '0,140000,140200,', '2310', '0000000040,0000000170,0000002310,', '1', '2', '山西省/大同市/市辖区', '市辖区', '3', '0', 'system', '2018-03-11 15:59:29', 'system', '2018-03-11 15:59:29', null);
INSERT INTO `js_sys_area` VALUES ('140202', '140200', '0,140000,140200,', '2320', '0000000040,0000000170,0000002320,', '1', '2', '山西省/大同市/城　区', '城　区', '3', '0', 'system', '2018-03-11 15:59:29', 'system', '2018-03-11 15:59:29', null);
INSERT INTO `js_sys_area` VALUES ('140203', '140200', '0,140000,140200,', '2330', '0000000040,0000000170,0000002330,', '1', '2', '山西省/大同市/矿　区', '矿　区', '3', '0', 'system', '2018-03-11 15:59:29', 'system', '2018-03-11 15:59:29', null);
INSERT INTO `js_sys_area` VALUES ('140211', '140200', '0,140000,140200,', '2340', '0000000040,0000000170,0000002340,', '1', '2', '山西省/大同市/南郊区', '南郊区', '3', '0', 'system', '2018-03-11 15:59:29', 'system', '2018-03-11 15:59:29', null);
INSERT INTO `js_sys_area` VALUES ('140212', '140200', '0,140000,140200,', '2350', '0000000040,0000000170,0000002350,', '1', '2', '山西省/大同市/新荣区', '新荣区', '3', '0', 'system', '2018-03-11 15:59:29', 'system', '2018-03-11 15:59:29', null);
INSERT INTO `js_sys_area` VALUES ('140221', '140200', '0,140000,140200,', '2360', '0000000040,0000000170,0000002360,', '1', '2', '山西省/大同市/阳高县', '阳高县', '3', '0', 'system', '2018-03-11 15:59:29', 'system', '2018-03-11 15:59:29', null);
INSERT INTO `js_sys_area` VALUES ('140222', '140200', '0,140000,140200,', '2370', '0000000040,0000000170,0000002370,', '1', '2', '山西省/大同市/天镇县', '天镇县', '3', '0', 'system', '2018-03-11 15:59:29', 'system', '2018-03-11 15:59:29', null);
INSERT INTO `js_sys_area` VALUES ('140223', '140200', '0,140000,140200,', '2380', '0000000040,0000000170,0000002380,', '1', '2', '山西省/大同市/广灵县', '广灵县', '3', '0', 'system', '2018-03-11 15:59:29', 'system', '2018-03-11 15:59:29', null);
INSERT INTO `js_sys_area` VALUES ('140224', '140200', '0,140000,140200,', '2390', '0000000040,0000000170,0000002390,', '1', '2', '山西省/大同市/灵丘县', '灵丘县', '3', '0', 'system', '2018-03-11 15:59:29', 'system', '2018-03-11 15:59:29', null);
INSERT INTO `js_sys_area` VALUES ('140225', '140200', '0,140000,140200,', '2400', '0000000040,0000000170,0000002400,', '1', '2', '山西省/大同市/浑源县', '浑源县', '3', '0', 'system', '2018-03-11 15:59:29', 'system', '2018-03-11 15:59:29', null);
INSERT INTO `js_sys_area` VALUES ('140226', '140200', '0,140000,140200,', '2410', '0000000040,0000000170,0000002410,', '1', '2', '山西省/大同市/左云县', '左云县', '3', '0', 'system', '2018-03-11 15:59:29', 'system', '2018-03-11 15:59:29', null);
INSERT INTO `js_sys_area` VALUES ('140227', '140200', '0,140000,140200,', '2420', '0000000040,0000000170,0000002420,', '1', '2', '山西省/大同市/大同县', '大同县', '3', '0', 'system', '2018-03-11 15:59:29', 'system', '2018-03-11 15:59:29', null);
INSERT INTO `js_sys_area` VALUES ('140300', '140000', '0,140000,', '180', '0000000040,0000000180,', '0', '1', '山西省/阳泉市', '阳泉市', '2', '0', 'system', '2018-03-11 15:59:29', 'system', '2018-03-11 15:59:29', null);
INSERT INTO `js_sys_area` VALUES ('140301', '140300', '0,140000,140300,', '2430', '0000000040,0000000180,0000002430,', '1', '2', '山西省/阳泉市/市辖区', '市辖区', '3', '0', 'system', '2018-03-11 15:59:29', 'system', '2018-03-11 15:59:29', null);
INSERT INTO `js_sys_area` VALUES ('140302', '140300', '0,140000,140300,', '2440', '0000000040,0000000180,0000002440,', '1', '2', '山西省/阳泉市/城　区', '城　区', '3', '0', 'system', '2018-03-11 15:59:29', 'system', '2018-03-11 15:59:29', null);
INSERT INTO `js_sys_area` VALUES ('140303', '140300', '0,140000,140300,', '2450', '0000000040,0000000180,0000002450,', '1', '2', '山西省/阳泉市/矿　区', '矿　区', '3', '0', 'system', '2018-03-11 15:59:29', 'system', '2018-03-11 15:59:29', null);
INSERT INTO `js_sys_area` VALUES ('140311', '140300', '0,140000,140300,', '2460', '0000000040,0000000180,0000002460,', '1', '2', '山西省/阳泉市/郊　区', '郊　区', '3', '0', 'system', '2018-03-11 15:59:29', 'system', '2018-03-11 15:59:29', null);
INSERT INTO `js_sys_area` VALUES ('140321', '140300', '0,140000,140300,', '2470', '0000000040,0000000180,0000002470,', '1', '2', '山西省/阳泉市/平定县', '平定县', '3', '0', 'system', '2018-03-11 15:59:29', 'system', '2018-03-11 15:59:29', null);
INSERT INTO `js_sys_area` VALUES ('140322', '140300', '0,140000,140300,', '2480', '0000000040,0000000180,0000002480,', '1', '2', '山西省/阳泉市/盂　县', '盂　县', '3', '0', 'system', '2018-03-11 15:59:29', 'system', '2018-03-11 15:59:29', null);
INSERT INTO `js_sys_area` VALUES ('140400', '140000', '0,140000,', '190', '0000000040,0000000190,', '0', '1', '山西省/长治市', '长治市', '2', '0', 'system', '2018-03-11 15:59:29', 'system', '2018-03-11 15:59:29', null);
INSERT INTO `js_sys_area` VALUES ('140401', '140400', '0,140000,140400,', '2490', '0000000040,0000000190,0000002490,', '1', '2', '山西省/长治市/市辖区', '市辖区', '3', '0', 'system', '2018-03-11 15:59:29', 'system', '2018-03-11 15:59:29', null);
INSERT INTO `js_sys_area` VALUES ('140402', '140400', '0,140000,140400,', '2500', '0000000040,0000000190,0000002500,', '1', '2', '山西省/长治市/城　区', '城　区', '3', '0', 'system', '2018-03-11 15:59:29', 'system', '2018-03-11 15:59:29', null);
INSERT INTO `js_sys_area` VALUES ('140411', '140400', '0,140000,140400,', '2510', '0000000040,0000000190,0000002510,', '1', '2', '山西省/长治市/郊　区', '郊　区', '3', '0', 'system', '2018-03-11 15:59:29', 'system', '2018-03-11 15:59:29', null);
INSERT INTO `js_sys_area` VALUES ('140421', '140400', '0,140000,140400,', '2520', '0000000040,0000000190,0000002520,', '1', '2', '山西省/长治市/长治县', '长治县', '3', '0', 'system', '2018-03-11 15:59:29', 'system', '2018-03-11 15:59:29', null);
INSERT INTO `js_sys_area` VALUES ('140423', '140400', '0,140000,140400,', '2530', '0000000040,0000000190,0000002530,', '1', '2', '山西省/长治市/襄垣县', '襄垣县', '3', '0', 'system', '2018-03-11 15:59:29', 'system', '2018-03-11 15:59:29', null);
INSERT INTO `js_sys_area` VALUES ('140424', '140400', '0,140000,140400,', '2540', '0000000040,0000000190,0000002540,', '1', '2', '山西省/长治市/屯留县', '屯留县', '3', '0', 'system', '2018-03-11 15:59:29', 'system', '2018-03-11 15:59:29', null);
INSERT INTO `js_sys_area` VALUES ('140425', '140400', '0,140000,140400,', '2550', '0000000040,0000000190,0000002550,', '1', '2', '山西省/长治市/平顺县', '平顺县', '3', '0', 'system', '2018-03-11 15:59:29', 'system', '2018-03-11 15:59:29', null);
INSERT INTO `js_sys_area` VALUES ('140426', '140400', '0,140000,140400,', '2560', '0000000040,0000000190,0000002560,', '1', '2', '山西省/长治市/黎城县', '黎城县', '3', '0', 'system', '2018-03-11 15:59:29', 'system', '2018-03-11 15:59:29', null);
INSERT INTO `js_sys_area` VALUES ('140427', '140400', '0,140000,140400,', '2570', '0000000040,0000000190,0000002570,', '1', '2', '山西省/长治市/壶关县', '壶关县', '3', '0', 'system', '2018-03-11 15:59:29', 'system', '2018-03-11 15:59:29', null);
INSERT INTO `js_sys_area` VALUES ('140428', '140400', '0,140000,140400,', '2580', '0000000040,0000000190,0000002580,', '1', '2', '山西省/长治市/长子县', '长子县', '3', '0', 'system', '2018-03-11 15:59:29', 'system', '2018-03-11 15:59:29', null);
INSERT INTO `js_sys_area` VALUES ('140429', '140400', '0,140000,140400,', '2590', '0000000040,0000000190,0000002590,', '1', '2', '山西省/长治市/武乡县', '武乡县', '3', '0', 'system', '2018-03-11 15:59:29', 'system', '2018-03-11 15:59:29', null);
INSERT INTO `js_sys_area` VALUES ('140430', '140400', '0,140000,140400,', '2600', '0000000040,0000000190,0000002600,', '1', '2', '山西省/长治市/沁　县', '沁　县', '3', '0', 'system', '2018-03-11 15:59:29', 'system', '2018-03-11 15:59:29', null);
INSERT INTO `js_sys_area` VALUES ('140431', '140400', '0,140000,140400,', '2610', '0000000040,0000000190,0000002610,', '1', '2', '山西省/长治市/沁源县', '沁源县', '3', '0', 'system', '2018-03-11 15:59:29', 'system', '2018-03-11 15:59:29', null);
INSERT INTO `js_sys_area` VALUES ('140481', '140400', '0,140000,140400,', '2620', '0000000040,0000000190,0000002620,', '1', '2', '山西省/长治市/潞城市', '潞城市', '3', '0', 'system', '2018-03-11 15:59:29', 'system', '2018-03-11 15:59:29', null);
INSERT INTO `js_sys_area` VALUES ('140500', '140000', '0,140000,', '200', '0000000040,0000000200,', '0', '1', '山西省/晋城市', '晋城市', '2', '0', 'system', '2018-03-11 15:59:30', 'system', '2018-03-11 15:59:29', null);
INSERT INTO `js_sys_area` VALUES ('140501', '140500', '0,140000,140500,', '2630', '0000000040,0000000200,0000002630,', '1', '2', '山西省/晋城市/市辖区', '市辖区', '3', '0', 'system', '2018-03-11 15:59:29', 'system', '2018-03-11 15:59:30', null);
INSERT INTO `js_sys_area` VALUES ('140502', '140500', '0,140000,140500,', '2640', '0000000040,0000000200,0000002640,', '1', '2', '山西省/晋城市/城　区', '城　区', '3', '0', 'system', '2018-03-11 15:59:30', 'system', '2018-03-11 15:59:30', null);
INSERT INTO `js_sys_area` VALUES ('140521', '140500', '0,140000,140500,', '2650', '0000000040,0000000200,0000002650,', '1', '2', '山西省/晋城市/沁水县', '沁水县', '3', '0', 'system', '2018-03-11 15:59:30', 'system', '2018-03-11 15:59:30', null);
INSERT INTO `js_sys_area` VALUES ('140522', '140500', '0,140000,140500,', '2660', '0000000040,0000000200,0000002660,', '1', '2', '山西省/晋城市/阳城县', '阳城县', '3', '0', 'system', '2018-03-11 15:59:30', 'system', '2018-03-11 15:59:30', null);
INSERT INTO `js_sys_area` VALUES ('140524', '140500', '0,140000,140500,', '2670', '0000000040,0000000200,0000002670,', '1', '2', '山西省/晋城市/陵川县', '陵川县', '3', '0', 'system', '2018-03-11 15:59:30', 'system', '2018-03-11 15:59:30', null);
INSERT INTO `js_sys_area` VALUES ('140525', '140500', '0,140000,140500,', '2680', '0000000040,0000000200,0000002680,', '1', '2', '山西省/晋城市/泽州县', '泽州县', '3', '0', 'system', '2018-03-11 15:59:30', 'system', '2018-03-11 15:59:30', null);
INSERT INTO `js_sys_area` VALUES ('140581', '140500', '0,140000,140500,', '2690', '0000000040,0000000200,0000002690,', '1', '2', '山西省/晋城市/高平市', '高平市', '3', '0', 'system', '2018-03-11 15:59:30', 'system', '2018-03-11 15:59:30', null);
INSERT INTO `js_sys_area` VALUES ('140600', '140000', '0,140000,', '210', '0000000040,0000000210,', '0', '1', '山西省/朔州市', '朔州市', '2', '0', 'system', '2018-03-11 15:59:30', 'system', '2018-03-11 15:59:30', null);
INSERT INTO `js_sys_area` VALUES ('140601', '140600', '0,140000,140600,', '2700', '0000000040,0000000210,0000002700,', '1', '2', '山西省/朔州市/市辖区', '市辖区', '3', '0', 'system', '2018-03-11 15:59:30', 'system', '2018-03-11 15:59:30', null);
INSERT INTO `js_sys_area` VALUES ('140602', '140600', '0,140000,140600,', '2710', '0000000040,0000000210,0000002710,', '1', '2', '山西省/朔州市/朔城区', '朔城区', '3', '0', 'system', '2018-03-11 15:59:30', 'system', '2018-03-11 15:59:30', null);
INSERT INTO `js_sys_area` VALUES ('140603', '140600', '0,140000,140600,', '2720', '0000000040,0000000210,0000002720,', '1', '2', '山西省/朔州市/平鲁区', '平鲁区', '3', '0', 'system', '2018-03-11 15:59:30', 'system', '2018-03-11 15:59:30', null);
INSERT INTO `js_sys_area` VALUES ('140621', '140600', '0,140000,140600,', '2730', '0000000040,0000000210,0000002730,', '1', '2', '山西省/朔州市/山阴县', '山阴县', '3', '0', 'system', '2018-03-11 15:59:30', 'system', '2018-03-11 15:59:30', null);
INSERT INTO `js_sys_area` VALUES ('140622', '140600', '0,140000,140600,', '2740', '0000000040,0000000210,0000002740,', '1', '2', '山西省/朔州市/应　县', '应　县', '3', '0', 'system', '2018-03-11 15:59:30', 'system', '2018-03-11 15:59:30', null);
INSERT INTO `js_sys_area` VALUES ('140623', '140600', '0,140000,140600,', '2750', '0000000040,0000000210,0000002750,', '1', '2', '山西省/朔州市/右玉县', '右玉县', '3', '0', 'system', '2018-03-11 15:59:30', 'system', '2018-03-11 15:59:30', null);
INSERT INTO `js_sys_area` VALUES ('140624', '140600', '0,140000,140600,', '2760', '0000000040,0000000210,0000002760,', '1', '2', '山西省/朔州市/怀仁县', '怀仁县', '3', '0', 'system', '2018-03-11 15:59:30', 'system', '2018-03-11 15:59:30', null);
INSERT INTO `js_sys_area` VALUES ('140700', '140000', '0,140000,', '220', '0000000040,0000000220,', '0', '1', '山西省/晋中市', '晋中市', '2', '0', 'system', '2018-03-11 15:59:30', 'system', '2018-03-11 15:59:30', null);
INSERT INTO `js_sys_area` VALUES ('140701', '140700', '0,140000,140700,', '2770', '0000000040,0000000220,0000002770,', '1', '2', '山西省/晋中市/市辖区', '市辖区', '3', '0', 'system', '2018-03-11 15:59:30', 'system', '2018-03-11 15:59:30', null);
INSERT INTO `js_sys_area` VALUES ('140702', '140700', '0,140000,140700,', '2780', '0000000040,0000000220,0000002780,', '1', '2', '山西省/晋中市/榆次区', '榆次区', '3', '0', 'system', '2018-03-11 15:59:30', 'system', '2018-03-11 15:59:30', null);
INSERT INTO `js_sys_area` VALUES ('140721', '140700', '0,140000,140700,', '2790', '0000000040,0000000220,0000002790,', '1', '2', '山西省/晋中市/榆社县', '榆社县', '3', '0', 'system', '2018-03-11 15:59:30', 'system', '2018-03-11 15:59:30', null);
INSERT INTO `js_sys_area` VALUES ('140722', '140700', '0,140000,140700,', '2800', '0000000040,0000000220,0000002800,', '1', '2', '山西省/晋中市/左权县', '左权县', '3', '0', 'system', '2018-03-11 15:59:30', 'system', '2018-03-11 15:59:30', null);
INSERT INTO `js_sys_area` VALUES ('140723', '140700', '0,140000,140700,', '2810', '0000000040,0000000220,0000002810,', '1', '2', '山西省/晋中市/和顺县', '和顺县', '3', '0', 'system', '2018-03-11 15:59:30', 'system', '2018-03-11 15:59:30', null);
INSERT INTO `js_sys_area` VALUES ('140724', '140700', '0,140000,140700,', '2820', '0000000040,0000000220,0000002820,', '1', '2', '山西省/晋中市/昔阳县', '昔阳县', '3', '0', 'system', '2018-03-11 15:59:30', 'system', '2018-03-11 15:59:30', null);
INSERT INTO `js_sys_area` VALUES ('140725', '140700', '0,140000,140700,', '2830', '0000000040,0000000220,0000002830,', '1', '2', '山西省/晋中市/寿阳县', '寿阳县', '3', '0', 'system', '2018-03-11 15:59:30', 'system', '2018-03-11 15:59:30', null);
INSERT INTO `js_sys_area` VALUES ('140726', '140700', '0,140000,140700,', '2840', '0000000040,0000000220,0000002840,', '1', '2', '山西省/晋中市/太谷县', '太谷县', '3', '0', 'system', '2018-03-11 15:59:30', 'system', '2018-03-11 15:59:30', null);
INSERT INTO `js_sys_area` VALUES ('140727', '140700', '0,140000,140700,', '2850', '0000000040,0000000220,0000002850,', '1', '2', '山西省/晋中市/祁　县', '祁　县', '3', '0', 'system', '2018-03-11 15:59:30', 'system', '2018-03-11 15:59:30', null);
INSERT INTO `js_sys_area` VALUES ('140728', '140700', '0,140000,140700,', '2860', '0000000040,0000000220,0000002860,', '1', '2', '山西省/晋中市/平遥县', '平遥县', '3', '0', 'system', '2018-03-11 15:59:30', 'system', '2018-03-11 15:59:30', null);
INSERT INTO `js_sys_area` VALUES ('140729', '140700', '0,140000,140700,', '2870', '0000000040,0000000220,0000002870,', '1', '2', '山西省/晋中市/灵石县', '灵石县', '3', '0', 'system', '2018-03-11 15:59:30', 'system', '2018-03-11 15:59:30', null);
INSERT INTO `js_sys_area` VALUES ('140781', '140700', '0,140000,140700,', '2880', '0000000040,0000000220,0000002880,', '1', '2', '山西省/晋中市/介休市', '介休市', '3', '0', 'system', '2018-03-11 15:59:30', 'system', '2018-03-11 15:59:30', null);
INSERT INTO `js_sys_area` VALUES ('140800', '140000', '0,140000,', '230', '0000000040,0000000230,', '0', '1', '山西省/运城市', '运城市', '2', '0', 'system', '2018-03-11 15:59:30', 'system', '2018-03-11 15:59:30', null);
INSERT INTO `js_sys_area` VALUES ('140801', '140800', '0,140000,140800,', '2890', '0000000040,0000000230,0000002890,', '1', '2', '山西省/运城市/市辖区', '市辖区', '3', '0', 'system', '2018-03-11 15:59:30', 'system', '2018-03-11 15:59:30', null);
INSERT INTO `js_sys_area` VALUES ('140802', '140800', '0,140000,140800,', '2900', '0000000040,0000000230,0000002900,', '1', '2', '山西省/运城市/盐湖区', '盐湖区', '3', '0', 'system', '2018-03-11 15:59:30', 'system', '2018-03-11 15:59:30', null);
INSERT INTO `js_sys_area` VALUES ('140821', '140800', '0,140000,140800,', '2910', '0000000040,0000000230,0000002910,', '1', '2', '山西省/运城市/临猗县', '临猗县', '3', '0', 'system', '2018-03-11 15:59:30', 'system', '2018-03-11 15:59:30', null);
INSERT INTO `js_sys_area` VALUES ('140822', '140800', '0,140000,140800,', '2920', '0000000040,0000000230,0000002920,', '1', '2', '山西省/运城市/万荣县', '万荣县', '3', '0', 'system', '2018-03-11 15:59:30', 'system', '2018-03-11 15:59:30', null);
INSERT INTO `js_sys_area` VALUES ('140823', '140800', '0,140000,140800,', '2930', '0000000040,0000000230,0000002930,', '1', '2', '山西省/运城市/闻喜县', '闻喜县', '3', '0', 'system', '2018-03-11 15:59:30', 'system', '2018-03-11 15:59:30', null);
INSERT INTO `js_sys_area` VALUES ('140824', '140800', '0,140000,140800,', '2940', '0000000040,0000000230,0000002940,', '1', '2', '山西省/运城市/稷山县', '稷山县', '3', '0', 'system', '2018-03-11 15:59:30', 'system', '2018-03-11 15:59:30', null);
INSERT INTO `js_sys_area` VALUES ('140825', '140800', '0,140000,140800,', '2950', '0000000040,0000000230,0000002950,', '1', '2', '山西省/运城市/新绛县', '新绛县', '3', '0', 'system', '2018-03-11 15:59:30', 'system', '2018-03-11 15:59:30', null);
INSERT INTO `js_sys_area` VALUES ('140826', '140800', '0,140000,140800,', '2960', '0000000040,0000000230,0000002960,', '1', '2', '山西省/运城市/绛　县', '绛　县', '3', '0', 'system', '2018-03-11 15:59:30', 'system', '2018-03-11 15:59:30', null);
INSERT INTO `js_sys_area` VALUES ('140827', '140800', '0,140000,140800,', '2970', '0000000040,0000000230,0000002970,', '1', '2', '山西省/运城市/垣曲县', '垣曲县', '3', '0', 'system', '2018-03-11 15:59:30', 'system', '2018-03-11 15:59:30', null);
INSERT INTO `js_sys_area` VALUES ('140828', '140800', '0,140000,140800,', '2980', '0000000040,0000000230,0000002980,', '1', '2', '山西省/运城市/夏　县', '夏　县', '3', '0', 'system', '2018-03-11 15:59:30', 'system', '2018-03-11 15:59:30', null);
INSERT INTO `js_sys_area` VALUES ('140829', '140800', '0,140000,140800,', '2990', '0000000040,0000000230,0000002990,', '1', '2', '山西省/运城市/平陆县', '平陆县', '3', '0', 'system', '2018-03-11 15:59:30', 'system', '2018-03-11 15:59:30', null);
INSERT INTO `js_sys_area` VALUES ('140830', '140800', '0,140000,140800,', '3000', '0000000040,0000000230,0000003000,', '1', '2', '山西省/运城市/芮城县', '芮城县', '3', '0', 'system', '2018-03-11 15:59:30', 'system', '2018-03-11 15:59:30', null);
INSERT INTO `js_sys_area` VALUES ('140881', '140800', '0,140000,140800,', '3010', '0000000040,0000000230,0000003010,', '1', '2', '山西省/运城市/永济市', '永济市', '3', '0', 'system', '2018-03-11 15:59:31', 'system', '2018-03-11 15:59:31', null);
INSERT INTO `js_sys_area` VALUES ('140882', '140800', '0,140000,140800,', '3020', '0000000040,0000000230,0000003020,', '1', '2', '山西省/运城市/河津市', '河津市', '3', '0', 'system', '2018-03-11 15:59:31', 'system', '2018-03-11 15:59:31', null);
INSERT INTO `js_sys_area` VALUES ('140900', '140000', '0,140000,', '240', '0000000040,0000000240,', '0', '1', '山西省/忻州市', '忻州市', '2', '0', 'system', '2018-03-11 15:59:31', 'system', '2018-03-11 15:59:31', null);
INSERT INTO `js_sys_area` VALUES ('140901', '140900', '0,140000,140900,', '3030', '0000000040,0000000240,0000003030,', '1', '2', '山西省/忻州市/市辖区', '市辖区', '3', '0', 'system', '2018-03-11 15:59:31', 'system', '2018-03-11 15:59:31', null);
INSERT INTO `js_sys_area` VALUES ('140902', '140900', '0,140000,140900,', '3040', '0000000040,0000000240,0000003040,', '1', '2', '山西省/忻州市/忻府区', '忻府区', '3', '0', 'system', '2018-03-11 15:59:31', 'system', '2018-03-11 15:59:31', null);
INSERT INTO `js_sys_area` VALUES ('140921', '140900', '0,140000,140900,', '3050', '0000000040,0000000240,0000003050,', '1', '2', '山西省/忻州市/定襄县', '定襄县', '3', '0', 'system', '2018-03-11 15:59:31', 'system', '2018-03-11 15:59:31', null);
INSERT INTO `js_sys_area` VALUES ('140922', '140900', '0,140000,140900,', '3060', '0000000040,0000000240,0000003060,', '1', '2', '山西省/忻州市/五台县', '五台县', '3', '0', 'system', '2018-03-11 15:59:31', 'system', '2018-03-11 15:59:31', null);
INSERT INTO `js_sys_area` VALUES ('140923', '140900', '0,140000,140900,', '3070', '0000000040,0000000240,0000003070,', '1', '2', '山西省/忻州市/代　县', '代　县', '3', '0', 'system', '2018-03-11 15:59:31', 'system', '2018-03-11 15:59:31', null);
INSERT INTO `js_sys_area` VALUES ('140924', '140900', '0,140000,140900,', '3080', '0000000040,0000000240,0000003080,', '1', '2', '山西省/忻州市/繁峙县', '繁峙县', '3', '0', 'system', '2018-03-11 15:59:31', 'system', '2018-03-11 15:59:31', null);
INSERT INTO `js_sys_area` VALUES ('140925', '140900', '0,140000,140900,', '3090', '0000000040,0000000240,0000003090,', '1', '2', '山西省/忻州市/宁武县', '宁武县', '3', '0', 'system', '2018-03-11 15:59:31', 'system', '2018-03-11 15:59:31', null);
INSERT INTO `js_sys_area` VALUES ('140926', '140900', '0,140000,140900,', '3100', '0000000040,0000000240,0000003100,', '1', '2', '山西省/忻州市/静乐县', '静乐县', '3', '0', 'system', '2018-03-11 15:59:31', 'system', '2018-03-11 15:59:31', null);
INSERT INTO `js_sys_area` VALUES ('140927', '140900', '0,140000,140900,', '3110', '0000000040,0000000240,0000003110,', '1', '2', '山西省/忻州市/神池县', '神池县', '3', '0', 'system', '2018-03-11 15:59:31', 'system', '2018-03-11 15:59:31', null);
INSERT INTO `js_sys_area` VALUES ('140928', '140900', '0,140000,140900,', '3120', '0000000040,0000000240,0000003120,', '1', '2', '山西省/忻州市/五寨县', '五寨县', '3', '0', 'system', '2018-03-11 15:59:31', 'system', '2018-03-11 15:59:31', null);
INSERT INTO `js_sys_area` VALUES ('140929', '140900', '0,140000,140900,', '3130', '0000000040,0000000240,0000003130,', '1', '2', '山西省/忻州市/岢岚县', '岢岚县', '3', '0', 'system', '2018-03-11 15:59:31', 'system', '2018-03-11 15:59:31', null);
INSERT INTO `js_sys_area` VALUES ('140930', '140900', '0,140000,140900,', '3140', '0000000040,0000000240,0000003140,', '1', '2', '山西省/忻州市/河曲县', '河曲县', '3', '0', 'system', '2018-03-11 15:59:31', 'system', '2018-03-11 15:59:31', null);
INSERT INTO `js_sys_area` VALUES ('140931', '140900', '0,140000,140900,', '3150', '0000000040,0000000240,0000003150,', '1', '2', '山西省/忻州市/保德县', '保德县', '3', '0', 'system', '2018-03-11 15:59:31', 'system', '2018-03-11 15:59:31', null);
INSERT INTO `js_sys_area` VALUES ('140932', '140900', '0,140000,140900,', '3160', '0000000040,0000000240,0000003160,', '1', '2', '山西省/忻州市/偏关县', '偏关县', '3', '0', 'system', '2018-03-11 15:59:31', 'system', '2018-03-11 15:59:31', null);
INSERT INTO `js_sys_area` VALUES ('140981', '140900', '0,140000,140900,', '3170', '0000000040,0000000240,0000003170,', '1', '2', '山西省/忻州市/原平市', '原平市', '3', '0', 'system', '2018-03-11 15:59:31', 'system', '2018-03-11 15:59:31', null);
INSERT INTO `js_sys_area` VALUES ('141000', '140000', '0,140000,', '250', '0000000040,0000000250,', '0', '1', '山西省/临汾市', '临汾市', '2', '0', 'system', '2018-03-11 15:59:31', 'system', '2018-03-11 15:59:31', null);
INSERT INTO `js_sys_area` VALUES ('141001', '141000', '0,140000,141000,', '3180', '0000000040,0000000250,0000003180,', '1', '2', '山西省/临汾市/市辖区', '市辖区', '3', '0', 'system', '2018-03-11 15:59:31', 'system', '2018-03-11 15:59:31', null);
INSERT INTO `js_sys_area` VALUES ('141002', '141000', '0,140000,141000,', '3190', '0000000040,0000000250,0000003190,', '1', '2', '山西省/临汾市/尧都区', '尧都区', '3', '0', 'system', '2018-03-11 15:59:31', 'system', '2018-03-11 15:59:31', null);
INSERT INTO `js_sys_area` VALUES ('141021', '141000', '0,140000,141000,', '3200', '0000000040,0000000250,0000003200,', '1', '2', '山西省/临汾市/曲沃县', '曲沃县', '3', '0', 'system', '2018-03-11 15:59:31', 'system', '2018-03-11 15:59:31', null);
INSERT INTO `js_sys_area` VALUES ('141022', '141000', '0,140000,141000,', '3210', '0000000040,0000000250,0000003210,', '1', '2', '山西省/临汾市/翼城县', '翼城县', '3', '0', 'system', '2018-03-11 15:59:31', 'system', '2018-03-11 15:59:31', null);
INSERT INTO `js_sys_area` VALUES ('141023', '141000', '0,140000,141000,', '3220', '0000000040,0000000250,0000003220,', '1', '2', '山西省/临汾市/襄汾县', '襄汾县', '3', '0', 'system', '2018-03-11 15:59:31', 'system', '2018-03-11 15:59:31', null);
INSERT INTO `js_sys_area` VALUES ('141024', '141000', '0,140000,141000,', '3230', '0000000040,0000000250,0000003230,', '1', '2', '山西省/临汾市/洪洞县', '洪洞县', '3', '0', 'system', '2018-03-11 15:59:31', 'system', '2018-03-11 15:59:31', null);
INSERT INTO `js_sys_area` VALUES ('141025', '141000', '0,140000,141000,', '3240', '0000000040,0000000250,0000003240,', '1', '2', '山西省/临汾市/古　县', '古　县', '3', '0', 'system', '2018-03-11 15:59:31', 'system', '2018-03-11 15:59:31', null);
INSERT INTO `js_sys_area` VALUES ('141026', '141000', '0,140000,141000,', '3250', '0000000040,0000000250,0000003250,', '1', '2', '山西省/临汾市/安泽县', '安泽县', '3', '0', 'system', '2018-03-11 15:59:31', 'system', '2018-03-11 15:59:31', null);
INSERT INTO `js_sys_area` VALUES ('141027', '141000', '0,140000,141000,', '3260', '0000000040,0000000250,0000003260,', '1', '2', '山西省/临汾市/浮山县', '浮山县', '3', '0', 'system', '2018-03-11 15:59:31', 'system', '2018-03-11 15:59:31', null);
INSERT INTO `js_sys_area` VALUES ('141028', '141000', '0,140000,141000,', '3270', '0000000040,0000000250,0000003270,', '1', '2', '山西省/临汾市/吉　县', '吉　县', '3', '0', 'system', '2018-03-11 15:59:31', 'system', '2018-03-11 15:59:31', null);
INSERT INTO `js_sys_area` VALUES ('141029', '141000', '0,140000,141000,', '3280', '0000000040,0000000250,0000003280,', '1', '2', '山西省/临汾市/乡宁县', '乡宁县', '3', '0', 'system', '2018-03-11 15:59:31', 'system', '2018-03-11 15:59:31', null);
INSERT INTO `js_sys_area` VALUES ('141030', '141000', '0,140000,141000,', '3290', '0000000040,0000000250,0000003290,', '1', '2', '山西省/临汾市/大宁县', '大宁县', '3', '0', 'system', '2018-03-11 15:59:31', 'system', '2018-03-11 15:59:31', null);
INSERT INTO `js_sys_area` VALUES ('141031', '141000', '0,140000,141000,', '3300', '0000000040,0000000250,0000003300,', '1', '2', '山西省/临汾市/隰　县', '隰　县', '3', '0', 'system', '2018-03-11 15:59:31', 'system', '2018-03-11 15:59:31', null);
INSERT INTO `js_sys_area` VALUES ('141032', '141000', '0,140000,141000,', '3310', '0000000040,0000000250,0000003310,', '1', '2', '山西省/临汾市/永和县', '永和县', '3', '0', 'system', '2018-03-11 15:59:31', 'system', '2018-03-11 15:59:31', null);
INSERT INTO `js_sys_area` VALUES ('141033', '141000', '0,140000,141000,', '3320', '0000000040,0000000250,0000003320,', '1', '2', '山西省/临汾市/蒲　县', '蒲　县', '3', '0', 'system', '2018-03-11 15:59:31', 'system', '2018-03-11 15:59:31', null);
INSERT INTO `js_sys_area` VALUES ('141034', '141000', '0,140000,141000,', '3330', '0000000040,0000000250,0000003330,', '1', '2', '山西省/临汾市/汾西县', '汾西县', '3', '0', 'system', '2018-03-11 15:59:31', 'system', '2018-03-11 15:59:31', null);
INSERT INTO `js_sys_area` VALUES ('141081', '141000', '0,140000,141000,', '3340', '0000000040,0000000250,0000003340,', '1', '2', '山西省/临汾市/侯马市', '侯马市', '3', '0', 'system', '2018-03-11 15:59:31', 'system', '2018-03-11 15:59:31', null);
INSERT INTO `js_sys_area` VALUES ('141082', '141000', '0,140000,141000,', '3350', '0000000040,0000000250,0000003350,', '1', '2', '山西省/临汾市/霍州市', '霍州市', '3', '0', 'system', '2018-03-11 15:59:32', 'system', '2018-03-11 15:59:32', null);
INSERT INTO `js_sys_area` VALUES ('141100', '140000', '0,140000,', '260', '0000000040,0000000260,', '0', '1', '山西省/吕梁市', '吕梁市', '2', '0', 'system', '2018-03-11 15:59:32', 'system', '2018-03-11 15:59:32', null);
INSERT INTO `js_sys_area` VALUES ('141101', '141100', '0,140000,141100,', '3360', '0000000040,0000000260,0000003360,', '1', '2', '山西省/吕梁市/市辖区', '市辖区', '3', '0', 'system', '2018-03-11 15:59:32', 'system', '2018-03-11 15:59:32', null);
INSERT INTO `js_sys_area` VALUES ('141102', '141100', '0,140000,141100,', '3370', '0000000040,0000000260,0000003370,', '1', '2', '山西省/吕梁市/离石区', '离石区', '3', '0', 'system', '2018-03-11 15:59:32', 'system', '2018-03-11 15:59:32', null);
INSERT INTO `js_sys_area` VALUES ('141121', '141100', '0,140000,141100,', '3380', '0000000040,0000000260,0000003380,', '1', '2', '山西省/吕梁市/文水县', '文水县', '3', '0', 'system', '2018-03-11 15:59:32', 'system', '2018-03-11 15:59:32', null);
INSERT INTO `js_sys_area` VALUES ('141122', '141100', '0,140000,141100,', '3390', '0000000040,0000000260,0000003390,', '1', '2', '山西省/吕梁市/交城县', '交城县', '3', '0', 'system', '2018-03-11 15:59:32', 'system', '2018-03-11 15:59:32', null);
INSERT INTO `js_sys_area` VALUES ('141123', '141100', '0,140000,141100,', '3400', '0000000040,0000000260,0000003400,', '1', '2', '山西省/吕梁市/兴　县', '兴　县', '3', '0', 'system', '2018-03-11 15:59:32', 'system', '2018-03-11 15:59:32', null);
INSERT INTO `js_sys_area` VALUES ('141124', '141100', '0,140000,141100,', '3410', '0000000040,0000000260,0000003410,', '1', '2', '山西省/吕梁市/临　县', '临　县', '3', '0', 'system', '2018-03-11 15:59:32', 'system', '2018-03-11 15:59:32', null);
INSERT INTO `js_sys_area` VALUES ('141125', '141100', '0,140000,141100,', '3420', '0000000040,0000000260,0000003420,', '1', '2', '山西省/吕梁市/柳林县', '柳林县', '3', '0', 'system', '2018-03-11 15:59:32', 'system', '2018-03-11 15:59:32', null);
INSERT INTO `js_sys_area` VALUES ('141126', '141100', '0,140000,141100,', '3430', '0000000040,0000000260,0000003430,', '1', '2', '山西省/吕梁市/石楼县', '石楼县', '3', '0', 'system', '2018-03-11 15:59:32', 'system', '2018-03-11 15:59:32', null);
INSERT INTO `js_sys_area` VALUES ('141127', '141100', '0,140000,141100,', '3440', '0000000040,0000000260,0000003440,', '1', '2', '山西省/吕梁市/岚　县', '岚　县', '3', '0', 'system', '2018-03-11 15:59:32', 'system', '2018-03-11 15:59:32', null);
INSERT INTO `js_sys_area` VALUES ('141128', '141100', '0,140000,141100,', '3450', '0000000040,0000000260,0000003450,', '1', '2', '山西省/吕梁市/方山县', '方山县', '3', '0', 'system', '2018-03-11 15:59:32', 'system', '2018-03-11 15:59:32', null);
INSERT INTO `js_sys_area` VALUES ('141129', '141100', '0,140000,141100,', '3460', '0000000040,0000000260,0000003460,', '1', '2', '山西省/吕梁市/中阳县', '中阳县', '3', '0', 'system', '2018-03-11 15:59:32', 'system', '2018-03-11 15:59:32', null);
INSERT INTO `js_sys_area` VALUES ('141130', '141100', '0,140000,141100,', '3470', '0000000040,0000000260,0000003470,', '1', '2', '山西省/吕梁市/交口县', '交口县', '3', '0', 'system', '2018-03-11 15:59:32', 'system', '2018-03-11 15:59:32', null);
INSERT INTO `js_sys_area` VALUES ('141181', '141100', '0,140000,141100,', '3480', '0000000040,0000000260,0000003480,', '1', '2', '山西省/吕梁市/孝义市', '孝义市', '3', '0', 'system', '2018-03-11 15:59:32', 'system', '2018-03-11 15:59:32', null);
INSERT INTO `js_sys_area` VALUES ('141182', '141100', '0,140000,141100,', '3490', '0000000040,0000000260,0000003490,', '1', '2', '山西省/吕梁市/汾阳市', '汾阳市', '3', '0', 'system', '2018-03-11 15:59:32', 'system', '2018-03-11 15:59:32', null);
INSERT INTO `js_sys_area` VALUES ('150000', '0', '0,', '50', '0000000050,', '0', '0', '内蒙古自治区', '内蒙古自治区', '1', '0', 'system', '2018-03-11 15:59:32', 'system', '2018-03-11 15:59:32', null);
INSERT INTO `js_sys_area` VALUES ('150100', '150000', '0,150000,', '270', '0000000050,0000000270,', '0', '1', '内蒙古自治区/呼和浩特市', '呼和浩特市', '2', '0', 'system', '2018-03-11 15:59:32', 'system', '2018-03-11 15:59:32', null);
INSERT INTO `js_sys_area` VALUES ('150101', '150100', '0,150000,150100,', '3500', '0000000050,0000000270,0000003500,', '1', '2', '内蒙古自治区/呼和浩特市/市辖区', '市辖区', '3', '0', 'system', '2018-03-11 15:59:32', 'system', '2018-03-11 15:59:32', null);
INSERT INTO `js_sys_area` VALUES ('150102', '150100', '0,150000,150100,', '3510', '0000000050,0000000270,0000003510,', '1', '2', '内蒙古自治区/呼和浩特市/新城区', '新城区', '3', '0', 'system', '2018-03-11 15:59:32', 'system', '2018-03-11 15:59:32', null);
INSERT INTO `js_sys_area` VALUES ('150103', '150100', '0,150000,150100,', '3520', '0000000050,0000000270,0000003520,', '1', '2', '内蒙古自治区/呼和浩特市/回民区', '回民区', '3', '0', 'system', '2018-03-11 15:59:32', 'system', '2018-03-11 15:59:32', null);
INSERT INTO `js_sys_area` VALUES ('150104', '150100', '0,150000,150100,', '3530', '0000000050,0000000270,0000003530,', '1', '2', '内蒙古自治区/呼和浩特市/玉泉区', '玉泉区', '3', '0', 'system', '2018-03-11 15:59:32', 'system', '2018-03-11 15:59:32', null);
INSERT INTO `js_sys_area` VALUES ('150105', '150100', '0,150000,150100,', '3540', '0000000050,0000000270,0000003540,', '1', '2', '内蒙古自治区/呼和浩特市/赛罕区', '赛罕区', '3', '0', 'system', '2018-03-11 15:59:32', 'system', '2018-03-11 15:59:32', null);
INSERT INTO `js_sys_area` VALUES ('150121', '150100', '0,150000,150100,', '3550', '0000000050,0000000270,0000003550,', '1', '2', '内蒙古自治区/呼和浩特市/土默特左旗', '土默特左旗', '3', '0', 'system', '2018-03-11 15:59:32', 'system', '2018-03-11 15:59:32', null);
INSERT INTO `js_sys_area` VALUES ('150122', '150100', '0,150000,150100,', '3560', '0000000050,0000000270,0000003560,', '1', '2', '内蒙古自治区/呼和浩特市/托克托县', '托克托县', '3', '0', 'system', '2018-03-11 15:59:32', 'system', '2018-03-11 15:59:32', null);
INSERT INTO `js_sys_area` VALUES ('150123', '150100', '0,150000,150100,', '3570', '0000000050,0000000270,0000003570,', '1', '2', '内蒙古自治区/呼和浩特市/和林格尔县', '和林格尔县', '3', '0', 'system', '2018-03-11 15:59:32', 'system', '2018-03-11 15:59:32', null);
INSERT INTO `js_sys_area` VALUES ('150124', '150100', '0,150000,150100,', '3580', '0000000050,0000000270,0000003580,', '1', '2', '内蒙古自治区/呼和浩特市/清水河县', '清水河县', '3', '0', 'system', '2018-03-11 15:59:32', 'system', '2018-03-11 15:59:32', null);
INSERT INTO `js_sys_area` VALUES ('150125', '150100', '0,150000,150100,', '3590', '0000000050,0000000270,0000003590,', '1', '2', '内蒙古自治区/呼和浩特市/武川县', '武川县', '3', '0', 'system', '2018-03-11 15:59:32', 'system', '2018-03-11 15:59:32', null);
INSERT INTO `js_sys_area` VALUES ('150200', '150000', '0,150000,', '280', '0000000050,0000000280,', '0', '1', '内蒙古自治区/包头市', '包头市', '2', '0', 'system', '2018-03-11 15:59:32', 'system', '2018-03-11 15:59:32', null);
INSERT INTO `js_sys_area` VALUES ('150201', '150200', '0,150000,150200,', '3600', '0000000050,0000000280,0000003600,', '1', '2', '内蒙古自治区/包头市/市辖区', '市辖区', '3', '0', 'system', '2018-03-11 15:59:32', 'system', '2018-03-11 15:59:32', null);
INSERT INTO `js_sys_area` VALUES ('150202', '150200', '0,150000,150200,', '3610', '0000000050,0000000280,0000003610,', '1', '2', '内蒙古自治区/包头市/东河区', '东河区', '3', '0', 'system', '2018-03-11 15:59:32', 'system', '2018-03-11 15:59:32', null);
INSERT INTO `js_sys_area` VALUES ('150203', '150200', '0,150000,150200,', '3620', '0000000050,0000000280,0000003620,', '1', '2', '内蒙古自治区/包头市/昆都仑区', '昆都仑区', '3', '0', 'system', '2018-03-11 15:59:32', 'system', '2018-03-11 15:59:32', null);
INSERT INTO `js_sys_area` VALUES ('150204', '150200', '0,150000,150200,', '3630', '0000000050,0000000280,0000003630,', '1', '2', '内蒙古自治区/包头市/青山区', '青山区', '3', '0', 'system', '2018-03-11 15:59:32', 'system', '2018-03-11 15:59:32', null);
INSERT INTO `js_sys_area` VALUES ('150205', '150200', '0,150000,150200,', '3640', '0000000050,0000000280,0000003640,', '1', '2', '内蒙古自治区/包头市/石拐区', '石拐区', '3', '0', 'system', '2018-03-11 15:59:32', 'system', '2018-03-11 15:59:32', null);
INSERT INTO `js_sys_area` VALUES ('150206', '150200', '0,150000,150200,', '3650', '0000000050,0000000280,0000003650,', '1', '2', '内蒙古自治区/包头市/白云矿区', '白云矿区', '3', '0', 'system', '2018-03-11 15:59:32', 'system', '2018-03-11 15:59:32', null);
INSERT INTO `js_sys_area` VALUES ('150207', '150200', '0,150000,150200,', '3660', '0000000050,0000000280,0000003660,', '1', '2', '内蒙古自治区/包头市/九原区', '九原区', '3', '0', 'system', '2018-03-11 15:59:32', 'system', '2018-03-11 15:59:32', null);
INSERT INTO `js_sys_area` VALUES ('150221', '150200', '0,150000,150200,', '3670', '0000000050,0000000280,0000003670,', '1', '2', '内蒙古自治区/包头市/土默特右旗', '土默特右旗', '3', '0', 'system', '2018-03-11 15:59:32', 'system', '2018-03-11 15:59:32', null);
INSERT INTO `js_sys_area` VALUES ('150222', '150200', '0,150000,150200,', '3680', '0000000050,0000000280,0000003680,', '1', '2', '内蒙古自治区/包头市/固阳县', '固阳县', '3', '0', 'system', '2018-03-11 15:59:32', 'system', '2018-03-11 15:59:32', null);
INSERT INTO `js_sys_area` VALUES ('150223', '150200', '0,150000,150200,', '3690', '0000000050,0000000280,0000003690,', '1', '2', '内蒙古自治区/包头市/达尔罕茂明安联合旗', '达尔罕茂明安联合旗', '3', '0', 'system', '2018-03-11 15:59:32', 'system', '2018-03-11 15:59:32', null);
INSERT INTO `js_sys_area` VALUES ('150300', '150000', '0,150000,', '290', '0000000050,0000000290,', '0', '1', '内蒙古自治区/乌海市', '乌海市', '2', '0', 'system', '2018-03-11 15:59:33', 'system', '2018-03-11 15:59:32', null);
INSERT INTO `js_sys_area` VALUES ('150301', '150300', '0,150000,150300,', '3700', '0000000050,0000000290,0000003700,', '1', '2', '内蒙古自治区/乌海市/市辖区', '市辖区', '3', '0', 'system', '2018-03-11 15:59:33', 'system', '2018-03-11 15:59:33', null);
INSERT INTO `js_sys_area` VALUES ('150302', '150300', '0,150000,150300,', '3710', '0000000050,0000000290,0000003710,', '1', '2', '内蒙古自治区/乌海市/海勃湾区', '海勃湾区', '3', '0', 'system', '2018-03-11 15:59:33', 'system', '2018-03-11 15:59:33', null);
INSERT INTO `js_sys_area` VALUES ('150303', '150300', '0,150000,150300,', '3720', '0000000050,0000000290,0000003720,', '1', '2', '内蒙古自治区/乌海市/海南区', '海南区', '3', '0', 'system', '2018-03-11 15:59:33', 'system', '2018-03-11 15:59:33', null);
INSERT INTO `js_sys_area` VALUES ('150304', '150300', '0,150000,150300,', '3730', '0000000050,0000000290,0000003730,', '1', '2', '内蒙古自治区/乌海市/乌达区', '乌达区', '3', '0', 'system', '2018-03-11 15:59:33', 'system', '2018-03-11 15:59:33', null);
INSERT INTO `js_sys_area` VALUES ('150400', '150000', '0,150000,', '300', '0000000050,0000000300,', '0', '1', '内蒙古自治区/赤峰市', '赤峰市', '2', '0', 'system', '2018-03-11 15:59:33', 'system', '2018-03-11 15:59:33', null);
INSERT INTO `js_sys_area` VALUES ('150401', '150400', '0,150000,150400,', '3740', '0000000050,0000000300,0000003740,', '1', '2', '内蒙古自治区/赤峰市/市辖区', '市辖区', '3', '0', 'system', '2018-03-11 15:59:33', 'system', '2018-03-11 15:59:33', null);
INSERT INTO `js_sys_area` VALUES ('150402', '150400', '0,150000,150400,', '3750', '0000000050,0000000300,0000003750,', '1', '2', '内蒙古自治区/赤峰市/红山区', '红山区', '3', '0', 'system', '2018-03-11 15:59:33', 'system', '2018-03-11 15:59:33', null);
INSERT INTO `js_sys_area` VALUES ('150403', '150400', '0,150000,150400,', '3760', '0000000050,0000000300,0000003760,', '1', '2', '内蒙古自治区/赤峰市/元宝山区', '元宝山区', '3', '0', 'system', '2018-03-11 15:59:33', 'system', '2018-03-11 15:59:33', null);
INSERT INTO `js_sys_area` VALUES ('150404', '150400', '0,150000,150400,', '3770', '0000000050,0000000300,0000003770,', '1', '2', '内蒙古自治区/赤峰市/松山区', '松山区', '3', '0', 'system', '2018-03-11 15:59:33', 'system', '2018-03-11 15:59:33', null);
INSERT INTO `js_sys_area` VALUES ('150421', '150400', '0,150000,150400,', '3780', '0000000050,0000000300,0000003780,', '1', '2', '内蒙古自治区/赤峰市/阿鲁科尔沁旗', '阿鲁科尔沁旗', '3', '0', 'system', '2018-03-11 15:59:33', 'system', '2018-03-11 15:59:33', null);
INSERT INTO `js_sys_area` VALUES ('150422', '150400', '0,150000,150400,', '3790', '0000000050,0000000300,0000003790,', '1', '2', '内蒙古自治区/赤峰市/巴林左旗', '巴林左旗', '3', '0', 'system', '2018-03-11 15:59:33', 'system', '2018-03-11 15:59:33', null);
INSERT INTO `js_sys_area` VALUES ('150423', '150400', '0,150000,150400,', '3800', '0000000050,0000000300,0000003800,', '1', '2', '内蒙古自治区/赤峰市/巴林右旗', '巴林右旗', '3', '0', 'system', '2018-03-11 15:59:33', 'system', '2018-03-11 15:59:33', null);
INSERT INTO `js_sys_area` VALUES ('150424', '150400', '0,150000,150400,', '3810', '0000000050,0000000300,0000003810,', '1', '2', '内蒙古自治区/赤峰市/林西县', '林西县', '3', '0', 'system', '2018-03-11 15:59:33', 'system', '2018-03-11 15:59:33', null);
INSERT INTO `js_sys_area` VALUES ('150425', '150400', '0,150000,150400,', '3820', '0000000050,0000000300,0000003820,', '1', '2', '内蒙古自治区/赤峰市/克什克腾旗', '克什克腾旗', '3', '0', 'system', '2018-03-11 15:59:33', 'system', '2018-03-11 15:59:33', null);
INSERT INTO `js_sys_area` VALUES ('150426', '150400', '0,150000,150400,', '3830', '0000000050,0000000300,0000003830,', '1', '2', '内蒙古自治区/赤峰市/翁牛特旗', '翁牛特旗', '3', '0', 'system', '2018-03-11 15:59:33', 'system', '2018-03-11 15:59:33', null);
INSERT INTO `js_sys_area` VALUES ('150428', '150400', '0,150000,150400,', '3840', '0000000050,0000000300,0000003840,', '1', '2', '内蒙古自治区/赤峰市/喀喇沁旗', '喀喇沁旗', '3', '0', 'system', '2018-03-11 15:59:33', 'system', '2018-03-11 15:59:33', null);
INSERT INTO `js_sys_area` VALUES ('150429', '150400', '0,150000,150400,', '3850', '0000000050,0000000300,0000003850,', '1', '2', '内蒙古自治区/赤峰市/宁城县', '宁城县', '3', '0', 'system', '2018-03-11 15:59:33', 'system', '2018-03-11 15:59:33', null);
INSERT INTO `js_sys_area` VALUES ('150430', '150400', '0,150000,150400,', '3860', '0000000050,0000000300,0000003860,', '1', '2', '内蒙古自治区/赤峰市/敖汉旗', '敖汉旗', '3', '0', 'system', '2018-03-11 15:59:33', 'system', '2018-03-11 15:59:33', null);
INSERT INTO `js_sys_area` VALUES ('150500', '150000', '0,150000,', '310', '0000000050,0000000310,', '0', '1', '内蒙古自治区/通辽市', '通辽市', '2', '0', 'system', '2018-03-11 15:59:33', 'system', '2018-03-11 15:59:33', null);
INSERT INTO `js_sys_area` VALUES ('150501', '150500', '0,150000,150500,', '3870', '0000000050,0000000310,0000003870,', '1', '2', '内蒙古自治区/通辽市/市辖区', '市辖区', '3', '0', 'system', '2018-03-11 15:59:33', 'system', '2018-03-11 15:59:33', null);
INSERT INTO `js_sys_area` VALUES ('150502', '150500', '0,150000,150500,', '3880', '0000000050,0000000310,0000003880,', '1', '2', '内蒙古自治区/通辽市/科尔沁区', '科尔沁区', '3', '0', 'system', '2018-03-11 15:59:33', 'system', '2018-03-11 15:59:33', null);
INSERT INTO `js_sys_area` VALUES ('150521', '150500', '0,150000,150500,', '3890', '0000000050,0000000310,0000003890,', '1', '2', '内蒙古自治区/通辽市/科尔沁左翼中旗', '科尔沁左翼中旗', '3', '0', 'system', '2018-03-11 15:59:33', 'system', '2018-03-11 15:59:33', null);
INSERT INTO `js_sys_area` VALUES ('150522', '150500', '0,150000,150500,', '3900', '0000000050,0000000310,0000003900,', '1', '2', '内蒙古自治区/通辽市/科尔沁左翼后旗', '科尔沁左翼后旗', '3', '0', 'system', '2018-03-11 15:59:33', 'system', '2018-03-11 15:59:33', null);
INSERT INTO `js_sys_area` VALUES ('150523', '150500', '0,150000,150500,', '3910', '0000000050,0000000310,0000003910,', '1', '2', '内蒙古自治区/通辽市/开鲁县', '开鲁县', '3', '0', 'system', '2018-03-11 15:59:33', 'system', '2018-03-11 15:59:33', null);
INSERT INTO `js_sys_area` VALUES ('150524', '150500', '0,150000,150500,', '3920', '0000000050,0000000310,0000003920,', '1', '2', '内蒙古自治区/通辽市/库伦旗', '库伦旗', '3', '0', 'system', '2018-03-11 15:59:33', 'system', '2018-03-11 15:59:33', null);
INSERT INTO `js_sys_area` VALUES ('150525', '150500', '0,150000,150500,', '3930', '0000000050,0000000310,0000003930,', '1', '2', '内蒙古自治区/通辽市/奈曼旗', '奈曼旗', '3', '0', 'system', '2018-03-11 15:59:33', 'system', '2018-03-11 15:59:33', null);
INSERT INTO `js_sys_area` VALUES ('150526', '150500', '0,150000,150500,', '3940', '0000000050,0000000310,0000003940,', '1', '2', '内蒙古自治区/通辽市/扎鲁特旗', '扎鲁特旗', '3', '0', 'system', '2018-03-11 15:59:33', 'system', '2018-03-11 15:59:33', null);
INSERT INTO `js_sys_area` VALUES ('150581', '150500', '0,150000,150500,', '3950', '0000000050,0000000310,0000003950,', '1', '2', '内蒙古自治区/通辽市/霍林郭勒市', '霍林郭勒市', '3', '0', 'system', '2018-03-11 15:59:33', 'system', '2018-03-11 15:59:33', null);
INSERT INTO `js_sys_area` VALUES ('150600', '150000', '0,150000,', '320', '0000000050,0000000320,', '0', '1', '内蒙古自治区/鄂尔多斯市', '鄂尔多斯市', '2', '0', 'system', '2018-03-11 15:59:33', 'system', '2018-03-11 15:59:33', null);
INSERT INTO `js_sys_area` VALUES ('150602', '150600', '0,150000,150600,', '3960', '0000000050,0000000320,0000003960,', '1', '2', '内蒙古自治区/鄂尔多斯市/东胜区', '东胜区', '3', '0', 'system', '2018-03-11 15:59:33', 'system', '2018-03-11 15:59:33', null);
INSERT INTO `js_sys_area` VALUES ('150621', '150600', '0,150000,150600,', '3970', '0000000050,0000000320,0000003970,', '1', '2', '内蒙古自治区/鄂尔多斯市/达拉特旗', '达拉特旗', '3', '0', 'system', '2018-03-11 15:59:33', 'system', '2018-03-11 15:59:33', null);
INSERT INTO `js_sys_area` VALUES ('150622', '150600', '0,150000,150600,', '3980', '0000000050,0000000320,0000003980,', '1', '2', '内蒙古自治区/鄂尔多斯市/准格尔旗', '准格尔旗', '3', '0', 'system', '2018-03-11 15:59:33', 'system', '2018-03-11 15:59:33', null);
INSERT INTO `js_sys_area` VALUES ('150623', '150600', '0,150000,150600,', '3990', '0000000050,0000000320,0000003990,', '1', '2', '内蒙古自治区/鄂尔多斯市/鄂托克前旗', '鄂托克前旗', '3', '0', 'system', '2018-03-11 15:59:33', 'system', '2018-03-11 15:59:33', null);
INSERT INTO `js_sys_area` VALUES ('150624', '150600', '0,150000,150600,', '4000', '0000000050,0000000320,0000004000,', '1', '2', '内蒙古自治区/鄂尔多斯市/鄂托克旗', '鄂托克旗', '3', '0', 'system', '2018-03-11 15:59:33', 'system', '2018-03-11 15:59:33', null);
INSERT INTO `js_sys_area` VALUES ('150625', '150600', '0,150000,150600,', '4010', '0000000050,0000000320,0000004010,', '1', '2', '内蒙古自治区/鄂尔多斯市/杭锦旗', '杭锦旗', '3', '0', 'system', '2018-03-11 15:59:33', 'system', '2018-03-11 15:59:33', null);
INSERT INTO `js_sys_area` VALUES ('150626', '150600', '0,150000,150600,', '4020', '0000000050,0000000320,0000004020,', '1', '2', '内蒙古自治区/鄂尔多斯市/乌审旗', '乌审旗', '3', '0', 'system', '2018-03-11 15:59:33', 'system', '2018-03-11 15:59:33', null);
INSERT INTO `js_sys_area` VALUES ('150627', '150600', '0,150000,150600,', '4030', '0000000050,0000000320,0000004030,', '1', '2', '内蒙古自治区/鄂尔多斯市/伊金霍洛旗', '伊金霍洛旗', '3', '0', 'system', '2018-03-11 15:59:33', 'system', '2018-03-11 15:59:33', null);
INSERT INTO `js_sys_area` VALUES ('150700', '150000', '0,150000,', '330', '0000000050,0000000330,', '0', '1', '内蒙古自治区/呼伦贝尔市', '呼伦贝尔市', '2', '0', 'system', '2018-03-11 15:59:33', 'system', '2018-03-11 15:59:33', null);
INSERT INTO `js_sys_area` VALUES ('150701', '150700', '0,150000,150700,', '4040', '0000000050,0000000330,0000004040,', '1', '2', '内蒙古自治区/呼伦贝尔市/市辖区', '市辖区', '3', '0', 'system', '2018-03-11 15:59:33', 'system', '2018-03-11 15:59:33', null);
INSERT INTO `js_sys_area` VALUES ('150702', '150700', '0,150000,150700,', '4050', '0000000050,0000000330,0000004050,', '1', '2', '内蒙古自治区/呼伦贝尔市/海拉尔区', '海拉尔区', '3', '0', 'system', '2018-03-11 15:59:33', 'system', '2018-03-11 15:59:33', null);
INSERT INTO `js_sys_area` VALUES ('150721', '150700', '0,150000,150700,', '4060', '0000000050,0000000330,0000004060,', '1', '2', '内蒙古自治区/呼伦贝尔市/阿荣旗', '阿荣旗', '3', '0', 'system', '2018-03-11 15:59:33', 'system', '2018-03-11 15:59:33', null);
INSERT INTO `js_sys_area` VALUES ('150723', '150700', '0,150000,150700,', '4080', '0000000050,0000000330,0000004080,', '1', '2', '内蒙古自治区/呼伦贝尔市/鄂伦春自治旗', '鄂伦春自治旗', '3', '0', 'system', '2018-03-11 15:59:33', 'system', '2018-03-11 15:59:33', null);
INSERT INTO `js_sys_area` VALUES ('150724', '150700', '0,150000,150700,', '4090', '0000000050,0000000330,0000004090,', '1', '2', '内蒙古自治区/呼伦贝尔市/鄂温克族自治旗', '鄂温克族自治旗', '3', '0', 'system', '2018-03-11 15:59:33', 'system', '2018-03-11 15:59:33', null);
INSERT INTO `js_sys_area` VALUES ('150725', '150700', '0,150000,150700,', '4100', '0000000050,0000000330,0000004100,', '1', '2', '内蒙古自治区/呼伦贝尔市/陈巴尔虎旗', '陈巴尔虎旗', '3', '0', 'system', '2018-03-11 15:59:33', 'system', '2018-03-11 15:59:33', null);
INSERT INTO `js_sys_area` VALUES ('150726', '150700', '0,150000,150700,', '4110', '0000000050,0000000330,0000004110,', '1', '2', '内蒙古自治区/呼伦贝尔市/新巴尔虎左旗', '新巴尔虎左旗', '3', '0', 'system', '2018-03-11 15:59:33', 'system', '2018-03-11 15:59:33', null);
INSERT INTO `js_sys_area` VALUES ('150727', '150700', '0,150000,150700,', '4120', '0000000050,0000000330,0000004120,', '1', '2', '内蒙古自治区/呼伦贝尔市/新巴尔虎右旗', '新巴尔虎右旗', '3', '0', 'system', '2018-03-11 15:59:33', 'system', '2018-03-11 15:59:33', null);
INSERT INTO `js_sys_area` VALUES ('150781', '150700', '0,150000,150700,', '4130', '0000000050,0000000330,0000004130,', '1', '2', '内蒙古自治区/呼伦贝尔市/满洲里市', '满洲里市', '3', '0', 'system', '2018-03-11 15:59:34', 'system', '2018-03-11 15:59:34', null);
INSERT INTO `js_sys_area` VALUES ('150782', '150700', '0,150000,150700,', '4140', '0000000050,0000000330,0000004140,', '1', '2', '内蒙古自治区/呼伦贝尔市/牙克石市', '牙克石市', '3', '0', 'system', '2018-03-11 15:59:34', 'system', '2018-03-11 15:59:34', null);
INSERT INTO `js_sys_area` VALUES ('150783', '150700', '0,150000,150700,', '4150', '0000000050,0000000330,0000004150,', '1', '2', '内蒙古自治区/呼伦贝尔市/扎兰屯市', '扎兰屯市', '3', '0', 'system', '2018-03-11 15:59:34', 'system', '2018-03-11 15:59:34', null);
INSERT INTO `js_sys_area` VALUES ('150784', '150700', '0,150000,150700,', '4160', '0000000050,0000000330,0000004160,', '1', '2', '内蒙古自治区/呼伦贝尔市/额尔古纳市', '额尔古纳市', '3', '0', 'system', '2018-03-11 15:59:34', 'system', '2018-03-11 15:59:34', null);
INSERT INTO `js_sys_area` VALUES ('150785', '150700', '0,150000,150700,', '4170', '0000000050,0000000330,0000004170,', '1', '2', '内蒙古自治区/呼伦贝尔市/根河市', '根河市', '3', '0', 'system', '2018-03-11 15:59:34', 'system', '2018-03-11 15:59:34', null);
INSERT INTO `js_sys_area` VALUES ('150800', '150000', '0,150000,', '340', '0000000050,0000000340,', '0', '1', '内蒙古自治区/巴彦淖尔市', '巴彦淖尔市', '2', '0', 'system', '2018-03-11 15:59:34', 'system', '2018-03-11 15:59:34', null);
INSERT INTO `js_sys_area` VALUES ('150801', '150800', '0,150000,150800,', '4180', '0000000050,0000000340,0000004180,', '1', '2', '内蒙古自治区/巴彦淖尔市/市辖区', '市辖区', '3', '0', 'system', '2018-03-11 15:59:34', 'system', '2018-03-11 15:59:34', null);
INSERT INTO `js_sys_area` VALUES ('150802', '150800', '0,150000,150800,', '4190', '0000000050,0000000340,0000004190,', '1', '2', '内蒙古自治区/巴彦淖尔市/临河区', '临河区', '3', '0', 'system', '2018-03-11 15:59:34', 'system', '2018-03-11 15:59:34', null);
INSERT INTO `js_sys_area` VALUES ('150821', '150800', '0,150000,150800,', '4200', '0000000050,0000000340,0000004200,', '1', '2', '内蒙古自治区/巴彦淖尔市/五原县', '五原县', '3', '0', 'system', '2018-03-11 15:59:34', 'system', '2018-03-11 15:59:34', null);
INSERT INTO `js_sys_area` VALUES ('150822', '150800', '0,150000,150800,', '4210', '0000000050,0000000340,0000004210,', '1', '2', '内蒙古自治区/巴彦淖尔市/磴口县', '磴口县', '3', '0', 'system', '2018-03-11 15:59:34', 'system', '2018-03-11 15:59:34', null);
INSERT INTO `js_sys_area` VALUES ('150823', '150800', '0,150000,150800,', '4220', '0000000050,0000000340,0000004220,', '1', '2', '内蒙古自治区/巴彦淖尔市/乌拉特前旗', '乌拉特前旗', '3', '0', 'system', '2018-03-11 15:59:34', 'system', '2018-03-11 15:59:34', null);
INSERT INTO `js_sys_area` VALUES ('150824', '150800', '0,150000,150800,', '4230', '0000000050,0000000340,0000004230,', '1', '2', '内蒙古自治区/巴彦淖尔市/乌拉特中旗', '乌拉特中旗', '3', '0', 'system', '2018-03-11 15:59:34', 'system', '2018-03-11 15:59:34', null);
INSERT INTO `js_sys_area` VALUES ('150825', '150800', '0,150000,150800,', '4240', '0000000050,0000000340,0000004240,', '1', '2', '内蒙古自治区/巴彦淖尔市/乌拉特后旗', '乌拉特后旗', '3', '0', 'system', '2018-03-11 15:59:34', 'system', '2018-03-11 15:59:34', null);
INSERT INTO `js_sys_area` VALUES ('150826', '150800', '0,150000,150800,', '4250', '0000000050,0000000340,0000004250,', '1', '2', '内蒙古自治区/巴彦淖尔市/杭锦后旗', '杭锦后旗', '3', '0', 'system', '2018-03-11 15:59:34', 'system', '2018-03-11 15:59:34', null);
INSERT INTO `js_sys_area` VALUES ('150900', '150000', '0,150000,', '350', '0000000050,0000000350,', '0', '1', '内蒙古自治区/乌兰察布市', '乌兰察布市', '2', '0', 'system', '2018-03-11 15:59:34', 'system', '2018-03-11 15:59:34', null);
INSERT INTO `js_sys_area` VALUES ('150901', '150900', '0,150000,150900,', '4260', '0000000050,0000000350,0000004260,', '1', '2', '内蒙古自治区/乌兰察布市/市辖区', '市辖区', '3', '0', 'system', '2018-03-11 15:59:34', 'system', '2018-03-11 15:59:34', null);
INSERT INTO `js_sys_area` VALUES ('150902', '150900', '0,150000,150900,', '4270', '0000000050,0000000350,0000004270,', '1', '2', '内蒙古自治区/乌兰察布市/集宁区', '集宁区', '3', '0', 'system', '2018-03-11 15:59:34', 'system', '2018-03-11 15:59:34', null);
INSERT INTO `js_sys_area` VALUES ('150921', '150900', '0,150000,150900,', '4280', '0000000050,0000000350,0000004280,', '1', '2', '内蒙古自治区/乌兰察布市/卓资县', '卓资县', '3', '0', 'system', '2018-03-11 15:59:34', 'system', '2018-03-11 15:59:34', null);
INSERT INTO `js_sys_area` VALUES ('150922', '150900', '0,150000,150900,', '4290', '0000000050,0000000350,0000004290,', '1', '2', '内蒙古自治区/乌兰察布市/化德县', '化德县', '3', '0', 'system', '2018-03-11 15:59:34', 'system', '2018-03-11 15:59:34', null);
INSERT INTO `js_sys_area` VALUES ('150923', '150900', '0,150000,150900,', '4300', '0000000050,0000000350,0000004300,', '1', '2', '内蒙古自治区/乌兰察布市/商都县', '商都县', '3', '0', 'system', '2018-03-11 15:59:34', 'system', '2018-03-11 15:59:34', null);
INSERT INTO `js_sys_area` VALUES ('150924', '150900', '0,150000,150900,', '4310', '0000000050,0000000350,0000004310,', '1', '2', '内蒙古自治区/乌兰察布市/兴和县', '兴和县', '3', '0', 'system', '2018-03-11 15:59:34', 'system', '2018-03-11 15:59:34', null);
INSERT INTO `js_sys_area` VALUES ('150925', '150900', '0,150000,150900,', '4320', '0000000050,0000000350,0000004320,', '1', '2', '内蒙古自治区/乌兰察布市/凉城县', '凉城县', '3', '0', 'system', '2018-03-11 15:59:34', 'system', '2018-03-11 15:59:34', null);
INSERT INTO `js_sys_area` VALUES ('150926', '150900', '0,150000,150900,', '4330', '0000000050,0000000350,0000004330,', '1', '2', '内蒙古自治区/乌兰察布市/察哈尔右翼前旗', '察哈尔右翼前旗', '3', '0', 'system', '2018-03-11 15:59:34', 'system', '2018-03-11 15:59:34', null);
INSERT INTO `js_sys_area` VALUES ('150927', '150900', '0,150000,150900,', '4340', '0000000050,0000000350,0000004340,', '1', '2', '内蒙古自治区/乌兰察布市/察哈尔右翼中旗', '察哈尔右翼中旗', '3', '0', 'system', '2018-03-11 15:59:34', 'system', '2018-03-11 15:59:34', null);
INSERT INTO `js_sys_area` VALUES ('150928', '150900', '0,150000,150900,', '4350', '0000000050,0000000350,0000004350,', '1', '2', '内蒙古自治区/乌兰察布市/察哈尔右翼后旗', '察哈尔右翼后旗', '3', '0', 'system', '2018-03-11 15:59:34', 'system', '2018-03-11 15:59:34', null);
INSERT INTO `js_sys_area` VALUES ('150929', '150900', '0,150000,150900,', '4360', '0000000050,0000000350,0000004360,', '1', '2', '内蒙古自治区/乌兰察布市/四子王旗', '四子王旗', '3', '0', 'system', '2018-03-11 15:59:34', 'system', '2018-03-11 15:59:34', null);
INSERT INTO `js_sys_area` VALUES ('150981', '150900', '0,150000,150900,', '4370', '0000000050,0000000350,0000004370,', '1', '2', '内蒙古自治区/乌兰察布市/丰镇市', '丰镇市', '3', '0', 'system', '2018-03-11 15:59:34', 'system', '2018-03-11 15:59:34', null);
INSERT INTO `js_sys_area` VALUES ('152200', '150000', '0,150000,', '360', '0000000050,0000000360,', '0', '1', '内蒙古自治区/兴安盟', '兴安盟', '2', '0', 'system', '2018-03-11 15:59:34', 'system', '2018-03-11 15:59:34', null);
INSERT INTO `js_sys_area` VALUES ('152201', '152200', '0,150000,152200,', '4380', '0000000050,0000000360,0000004380,', '1', '2', '内蒙古自治区/兴安盟/乌兰浩特市', '乌兰浩特市', '3', '0', 'system', '2018-03-11 15:59:34', 'system', '2018-03-11 15:59:34', null);
INSERT INTO `js_sys_area` VALUES ('152202', '152200', '0,150000,152200,', '4390', '0000000050,0000000360,0000004390,', '1', '2', '内蒙古自治区/兴安盟/阿尔山市', '阿尔山市', '3', '0', 'system', '2018-03-11 15:59:34', 'system', '2018-03-11 15:59:34', null);
INSERT INTO `js_sys_area` VALUES ('152221', '152200', '0,150000,152200,', '4400', '0000000050,0000000360,0000004400,', '1', '2', '内蒙古自治区/兴安盟/科尔沁右翼前旗', '科尔沁右翼前旗', '3', '0', 'system', '2018-03-11 15:59:34', 'system', '2018-03-11 15:59:34', null);
INSERT INTO `js_sys_area` VALUES ('152222', '152200', '0,150000,152200,', '4410', '0000000050,0000000360,0000004410,', '1', '2', '内蒙古自治区/兴安盟/科尔沁右翼中旗', '科尔沁右翼中旗', '3', '0', 'system', '2018-03-11 15:59:34', 'system', '2018-03-11 15:59:34', null);
INSERT INTO `js_sys_area` VALUES ('152223', '152200', '0,150000,152200,', '4420', '0000000050,0000000360,0000004420,', '1', '2', '内蒙古自治区/兴安盟/扎赉特旗', '扎赉特旗', '3', '0', 'system', '2018-03-11 15:59:34', 'system', '2018-03-11 15:59:34', null);
INSERT INTO `js_sys_area` VALUES ('152224', '152200', '0,150000,152200,', '4430', '0000000050,0000000360,0000004430,', '1', '2', '内蒙古自治区/兴安盟/突泉县', '突泉县', '3', '0', 'system', '2018-03-11 15:59:34', 'system', '2018-03-11 15:59:34', null);
INSERT INTO `js_sys_area` VALUES ('152500', '150000', '0,150000,', '370', '0000000050,0000000370,', '0', '1', '内蒙古自治区/锡林郭勒盟', '锡林郭勒盟', '2', '0', 'system', '2018-03-11 15:59:34', 'system', '2018-03-11 15:59:34', null);
INSERT INTO `js_sys_area` VALUES ('152501', '152500', '0,150000,152500,', '4440', '0000000050,0000000370,0000004440,', '1', '2', '内蒙古自治区/锡林郭勒盟/二连浩特市', '二连浩特市', '3', '0', 'system', '2018-03-11 15:59:34', 'system', '2018-03-11 15:59:34', null);
INSERT INTO `js_sys_area` VALUES ('152502', '152500', '0,150000,152500,', '4450', '0000000050,0000000370,0000004450,', '1', '2', '内蒙古自治区/锡林郭勒盟/锡林浩特市', '锡林浩特市', '3', '0', 'system', '2018-03-11 15:59:34', 'system', '2018-03-11 15:59:34', null);
INSERT INTO `js_sys_area` VALUES ('152522', '152500', '0,150000,152500,', '4460', '0000000050,0000000370,0000004460,', '1', '2', '内蒙古自治区/锡林郭勒盟/阿巴嘎旗', '阿巴嘎旗', '3', '0', 'system', '2018-03-11 15:59:34', 'system', '2018-03-11 15:59:34', null);
INSERT INTO `js_sys_area` VALUES ('152523', '152500', '0,150000,152500,', '4470', '0000000050,0000000370,0000004470,', '1', '2', '内蒙古自治区/锡林郭勒盟/苏尼特左旗', '苏尼特左旗', '3', '0', 'system', '2018-03-11 15:59:35', 'system', '2018-03-11 15:59:35', null);
INSERT INTO `js_sys_area` VALUES ('152524', '152500', '0,150000,152500,', '4480', '0000000050,0000000370,0000004480,', '1', '2', '内蒙古自治区/锡林郭勒盟/苏尼特右旗', '苏尼特右旗', '3', '0', 'system', '2018-03-11 15:59:35', 'system', '2018-03-11 15:59:35', null);
INSERT INTO `js_sys_area` VALUES ('152525', '152500', '0,150000,152500,', '4490', '0000000050,0000000370,0000004490,', '1', '2', '内蒙古自治区/锡林郭勒盟/东乌珠穆沁旗', '东乌珠穆沁旗', '3', '0', 'system', '2018-03-11 15:59:35', 'system', '2018-03-11 15:59:35', null);
INSERT INTO `js_sys_area` VALUES ('152526', '152500', '0,150000,152500,', '4500', '0000000050,0000000370,0000004500,', '1', '2', '内蒙古自治区/锡林郭勒盟/西乌珠穆沁旗', '西乌珠穆沁旗', '3', '0', 'system', '2018-03-11 15:59:35', 'system', '2018-03-11 15:59:35', null);
INSERT INTO `js_sys_area` VALUES ('152527', '152500', '0,150000,152500,', '4510', '0000000050,0000000370,0000004510,', '1', '2', '内蒙古自治区/锡林郭勒盟/太仆寺旗', '太仆寺旗', '3', '0', 'system', '2018-03-11 15:59:35', 'system', '2018-03-11 15:59:35', null);
INSERT INTO `js_sys_area` VALUES ('152528', '152500', '0,150000,152500,', '4520', '0000000050,0000000370,0000004520,', '1', '2', '内蒙古自治区/锡林郭勒盟/镶黄旗', '镶黄旗', '3', '0', 'system', '2018-03-11 15:59:35', 'system', '2018-03-11 15:59:35', null);
INSERT INTO `js_sys_area` VALUES ('152529', '152500', '0,150000,152500,', '4530', '0000000050,0000000370,0000004530,', '1', '2', '内蒙古自治区/锡林郭勒盟/正镶白旗', '正镶白旗', '3', '0', 'system', '2018-03-11 15:59:35', 'system', '2018-03-11 15:59:35', null);
INSERT INTO `js_sys_area` VALUES ('152530', '152500', '0,150000,152500,', '4540', '0000000050,0000000370,0000004540,', '1', '2', '内蒙古自治区/锡林郭勒盟/正蓝旗', '正蓝旗', '3', '0', 'system', '2018-03-11 15:59:35', 'system', '2018-03-11 15:59:35', null);
INSERT INTO `js_sys_area` VALUES ('152531', '152500', '0,150000,152500,', '4550', '0000000050,0000000370,0000004550,', '1', '2', '内蒙古自治区/锡林郭勒盟/多伦县', '多伦县', '3', '0', 'system', '2018-03-11 15:59:35', 'system', '2018-03-11 15:59:35', null);
INSERT INTO `js_sys_area` VALUES ('152900', '150000', '0,150000,', '380', '0000000050,0000000380,', '0', '1', '内蒙古自治区/阿拉善盟', '阿拉善盟', '2', '0', 'system', '2018-03-11 15:59:35', 'system', '2018-03-11 15:59:35', null);
INSERT INTO `js_sys_area` VALUES ('152921', '152900', '0,150000,152900,', '4560', '0000000050,0000000380,0000004560,', '1', '2', '内蒙古自治区/阿拉善盟/阿拉善左旗', '阿拉善左旗', '3', '0', 'system', '2018-03-11 15:59:35', 'system', '2018-03-11 15:59:35', null);
INSERT INTO `js_sys_area` VALUES ('152922', '152900', '0,150000,152900,', '4570', '0000000050,0000000380,0000004570,', '1', '2', '内蒙古自治区/阿拉善盟/阿拉善右旗', '阿拉善右旗', '3', '0', 'system', '2018-03-11 15:59:35', 'system', '2018-03-11 15:59:35', null);
INSERT INTO `js_sys_area` VALUES ('152923', '152900', '0,150000,152900,', '4580', '0000000050,0000000380,0000004580,', '1', '2', '内蒙古自治区/阿拉善盟/额济纳旗', '额济纳旗', '3', '0', 'system', '2018-03-11 15:59:35', 'system', '2018-03-11 15:59:35', null);
INSERT INTO `js_sys_area` VALUES ('210000', '0', '0,', '60', '0000000060,', '0', '0', '辽宁省', '辽宁省', '1', '0', 'system', '2018-03-11 15:59:35', 'system', '2018-03-11 15:59:35', null);
INSERT INTO `js_sys_area` VALUES ('210100', '210000', '0,210000,', '390', '0000000060,0000000390,', '0', '1', '辽宁省/沈阳市', '沈阳市', '2', '0', 'system', '2018-03-11 15:59:35', 'system', '2018-03-11 15:59:35', null);
INSERT INTO `js_sys_area` VALUES ('210101', '210100', '0,210000,210100,', '4590', '0000000060,0000000390,0000004590,', '1', '2', '辽宁省/沈阳市/市辖区', '市辖区', '3', '0', 'system', '2018-03-11 15:59:35', 'system', '2018-03-11 15:59:35', null);
INSERT INTO `js_sys_area` VALUES ('210102', '210100', '0,210000,210100,', '4600', '0000000060,0000000390,0000004600,', '1', '2', '辽宁省/沈阳市/和平区', '和平区', '3', '0', 'system', '2018-03-11 15:59:35', 'system', '2018-03-11 15:59:35', null);
INSERT INTO `js_sys_area` VALUES ('210103', '210100', '0,210000,210100,', '4610', '0000000060,0000000390,0000004610,', '1', '2', '辽宁省/沈阳市/沈河区', '沈河区', '3', '0', 'system', '2018-03-11 15:59:35', 'system', '2018-03-11 15:59:35', null);
INSERT INTO `js_sys_area` VALUES ('210104', '210100', '0,210000,210100,', '4620', '0000000060,0000000390,0000004620,', '1', '2', '辽宁省/沈阳市/大东区', '大东区', '3', '0', 'system', '2018-03-11 15:59:35', 'system', '2018-03-11 15:59:35', null);
INSERT INTO `js_sys_area` VALUES ('210105', '210100', '0,210000,210100,', '4630', '0000000060,0000000390,0000004630,', '1', '2', '辽宁省/沈阳市/皇姑区', '皇姑区', '3', '0', 'system', '2018-03-11 15:59:35', 'system', '2018-03-11 15:59:35', null);
INSERT INTO `js_sys_area` VALUES ('210106', '210100', '0,210000,210100,', '4640', '0000000060,0000000390,0000004640,', '1', '2', '辽宁省/沈阳市/铁西区', '铁西区', '3', '0', 'system', '2018-03-11 15:59:35', 'system', '2018-03-11 15:59:35', null);
INSERT INTO `js_sys_area` VALUES ('210111', '210100', '0,210000,210100,', '4650', '0000000060,0000000390,0000004650,', '1', '2', '辽宁省/沈阳市/苏家屯区', '苏家屯区', '3', '0', 'system', '2018-03-11 15:59:35', 'system', '2018-03-11 15:59:35', null);
INSERT INTO `js_sys_area` VALUES ('210112', '210100', '0,210000,210100,', '4660', '0000000060,0000000390,0000004660,', '1', '2', '辽宁省/沈阳市/东陵区', '东陵区', '3', '0', 'system', '2018-03-11 15:59:35', 'system', '2018-03-11 15:59:35', null);
INSERT INTO `js_sys_area` VALUES ('210113', '210100', '0,210000,210100,', '4670', '0000000060,0000000390,0000004670,', '1', '2', '辽宁省/沈阳市/新城子区', '新城子区', '3', '0', 'system', '2018-03-11 15:59:35', 'system', '2018-03-11 15:59:35', null);
INSERT INTO `js_sys_area` VALUES ('210114', '210100', '0,210000,210100,', '4680', '0000000060,0000000390,0000004680,', '1', '2', '辽宁省/沈阳市/于洪区', '于洪区', '3', '0', 'system', '2018-03-11 15:59:35', 'system', '2018-03-11 15:59:35', null);
INSERT INTO `js_sys_area` VALUES ('210122', '210100', '0,210000,210100,', '4690', '0000000060,0000000390,0000004690,', '1', '2', '辽宁省/沈阳市/辽中县', '辽中县', '3', '0', 'system', '2018-03-11 15:59:35', 'system', '2018-03-11 15:59:35', null);
INSERT INTO `js_sys_area` VALUES ('210123', '210100', '0,210000,210100,', '4700', '0000000060,0000000390,0000004700,', '1', '2', '辽宁省/沈阳市/康平县', '康平县', '3', '0', 'system', '2018-03-11 15:59:35', 'system', '2018-03-11 15:59:35', null);
INSERT INTO `js_sys_area` VALUES ('210124', '210100', '0,210000,210100,', '4710', '0000000060,0000000390,0000004710,', '1', '2', '辽宁省/沈阳市/法库县', '法库县', '3', '0', 'system', '2018-03-11 15:59:35', 'system', '2018-03-11 15:59:35', null);
INSERT INTO `js_sys_area` VALUES ('210181', '210100', '0,210000,210100,', '4720', '0000000060,0000000390,0000004720,', '1', '2', '辽宁省/沈阳市/新民市', '新民市', '3', '0', 'system', '2018-03-11 15:59:35', 'system', '2018-03-11 15:59:35', null);
INSERT INTO `js_sys_area` VALUES ('210200', '210000', '0,210000,', '400', '0000000060,0000000400,', '0', '1', '辽宁省/大连市', '大连市', '2', '0', 'system', '2018-03-11 15:59:35', 'system', '2018-03-11 15:59:35', null);
INSERT INTO `js_sys_area` VALUES ('210201', '210200', '0,210000,210200,', '4730', '0000000060,0000000400,0000004730,', '1', '2', '辽宁省/大连市/市辖区', '市辖区', '3', '0', 'system', '2018-03-11 15:59:35', 'system', '2018-03-11 15:59:35', null);
INSERT INTO `js_sys_area` VALUES ('210202', '210200', '0,210000,210200,', '4740', '0000000060,0000000400,0000004740,', '1', '2', '辽宁省/大连市/中山区', '中山区', '3', '0', 'system', '2018-03-11 15:59:35', 'system', '2018-03-11 15:59:35', null);
INSERT INTO `js_sys_area` VALUES ('210203', '210200', '0,210000,210200,', '4750', '0000000060,0000000400,0000004750,', '1', '2', '辽宁省/大连市/西岗区', '西岗区', '3', '0', 'system', '2018-03-11 15:59:35', 'system', '2018-03-11 15:59:35', null);
INSERT INTO `js_sys_area` VALUES ('210204', '210200', '0,210000,210200,', '4760', '0000000060,0000000400,0000004760,', '1', '2', '辽宁省/大连市/沙河口区', '沙河口区', '3', '0', 'system', '2018-03-11 15:59:35', 'system', '2018-03-11 15:59:35', null);
INSERT INTO `js_sys_area` VALUES ('210211', '210200', '0,210000,210200,', '4770', '0000000060,0000000400,0000004770,', '1', '2', '辽宁省/大连市/甘井子区', '甘井子区', '3', '0', 'system', '2018-03-11 15:59:35', 'system', '2018-03-11 15:59:35', null);
INSERT INTO `js_sys_area` VALUES ('210212', '210200', '0,210000,210200,', '4780', '0000000060,0000000400,0000004780,', '1', '2', '辽宁省/大连市/旅顺口区', '旅顺口区', '3', '0', 'system', '2018-03-11 15:59:35', 'system', '2018-03-11 15:59:35', null);
INSERT INTO `js_sys_area` VALUES ('210213', '210200', '0,210000,210200,', '4790', '0000000060,0000000400,0000004790,', '1', '2', '辽宁省/大连市/金州区', '金州区', '3', '0', 'system', '2018-03-11 15:59:35', 'system', '2018-03-11 15:59:35', null);
INSERT INTO `js_sys_area` VALUES ('210224', '210200', '0,210000,210200,', '4800', '0000000060,0000000400,0000004800,', '1', '2', '辽宁省/大连市/长海县', '长海县', '3', '0', 'system', '2018-03-11 15:59:35', 'system', '2018-03-11 15:59:35', null);
INSERT INTO `js_sys_area` VALUES ('210281', '210200', '0,210000,210200,', '4810', '0000000060,0000000400,0000004810,', '1', '2', '辽宁省/大连市/瓦房店市', '瓦房店市', '3', '0', 'system', '2018-03-11 15:59:35', 'system', '2018-03-11 15:59:35', null);
INSERT INTO `js_sys_area` VALUES ('210282', '210200', '0,210000,210200,', '4820', '0000000060,0000000400,0000004820,', '1', '2', '辽宁省/大连市/普兰店市', '普兰店市', '3', '0', 'system', '2018-03-11 15:59:35', 'system', '2018-03-11 15:59:35', null);
INSERT INTO `js_sys_area` VALUES ('210283', '210200', '0,210000,210200,', '4830', '0000000060,0000000400,0000004830,', '1', '2', '辽宁省/大连市/庄河市', '庄河市', '3', '0', 'system', '2018-03-11 15:59:35', 'system', '2018-03-11 15:59:35', null);
INSERT INTO `js_sys_area` VALUES ('210300', '210000', '0,210000,', '410', '0000000060,0000000410,', '0', '1', '辽宁省/鞍山市', '鞍山市', '2', '0', 'system', '2018-03-11 15:59:35', 'system', '2018-03-11 15:59:35', null);
INSERT INTO `js_sys_area` VALUES ('210301', '210300', '0,210000,210300,', '4840', '0000000060,0000000410,0000004840,', '1', '2', '辽宁省/鞍山市/市辖区', '市辖区', '3', '0', 'system', '2018-03-11 15:59:35', 'system', '2018-03-11 15:59:35', null);
INSERT INTO `js_sys_area` VALUES ('210302', '210300', '0,210000,210300,', '4850', '0000000060,0000000410,0000004850,', '1', '2', '辽宁省/鞍山市/铁东区', '铁东区', '3', '0', 'system', '2018-03-11 15:59:35', 'system', '2018-03-11 15:59:35', null);
INSERT INTO `js_sys_area` VALUES ('210303', '210300', '0,210000,210300,', '4860', '0000000060,0000000410,0000004860,', '1', '2', '辽宁省/鞍山市/铁西区', '铁西区', '3', '0', 'system', '2018-03-11 15:59:35', 'system', '2018-03-11 15:59:35', null);
INSERT INTO `js_sys_area` VALUES ('210304', '210300', '0,210000,210300,', '4870', '0000000060,0000000410,0000004870,', '1', '2', '辽宁省/鞍山市/立山区', '立山区', '3', '0', 'system', '2018-03-11 15:59:35', 'system', '2018-03-11 15:59:35', null);
INSERT INTO `js_sys_area` VALUES ('210311', '210300', '0,210000,210300,', '4880', '0000000060,0000000410,0000004880,', '1', '2', '辽宁省/鞍山市/千山区', '千山区', '3', '0', 'system', '2018-03-11 15:59:35', 'system', '2018-03-11 15:59:35', null);
INSERT INTO `js_sys_area` VALUES ('210321', '210300', '0,210000,210300,', '4890', '0000000060,0000000410,0000004890,', '1', '2', '辽宁省/鞍山市/台安县', '台安县', '3', '0', 'system', '2018-03-11 15:59:35', 'system', '2018-03-11 15:59:35', null);
INSERT INTO `js_sys_area` VALUES ('210323', '210300', '0,210000,210300,', '4900', '0000000060,0000000410,0000004900,', '1', '2', '辽宁省/鞍山市/岫岩满族自治县', '岫岩满族自治县', '3', '0', 'system', '2018-03-11 15:59:35', 'system', '2018-03-11 15:59:35', null);
INSERT INTO `js_sys_area` VALUES ('210381', '210300', '0,210000,210300,', '4910', '0000000060,0000000410,0000004910,', '1', '2', '辽宁省/鞍山市/海城市', '海城市', '3', '0', 'system', '2018-03-11 15:59:36', 'system', '2018-03-11 15:59:36', null);
INSERT INTO `js_sys_area` VALUES ('210400', '210000', '0,210000,', '420', '0000000060,0000000420,', '0', '1', '辽宁省/抚顺市', '抚顺市', '2', '0', 'system', '2018-03-11 15:59:36', 'system', '2018-03-11 15:59:36', null);
INSERT INTO `js_sys_area` VALUES ('210401', '210400', '0,210000,210400,', '4920', '0000000060,0000000420,0000004920,', '1', '2', '辽宁省/抚顺市/市辖区', '市辖区', '3', '0', 'system', '2018-03-11 15:59:36', 'system', '2018-03-11 15:59:36', null);
INSERT INTO `js_sys_area` VALUES ('210402', '210400', '0,210000,210400,', '4930', '0000000060,0000000420,0000004930,', '1', '2', '辽宁省/抚顺市/新抚区', '新抚区', '3', '0', 'system', '2018-03-11 15:59:36', 'system', '2018-03-11 15:59:36', null);
INSERT INTO `js_sys_area` VALUES ('210403', '210400', '0,210000,210400,', '4940', '0000000060,0000000420,0000004940,', '1', '2', '辽宁省/抚顺市/东洲区', '东洲区', '3', '0', 'system', '2018-03-11 15:59:36', 'system', '2018-03-11 15:59:36', null);
INSERT INTO `js_sys_area` VALUES ('210404', '210400', '0,210000,210400,', '4950', '0000000060,0000000420,0000004950,', '1', '2', '辽宁省/抚顺市/望花区', '望花区', '3', '0', 'system', '2018-03-11 15:59:36', 'system', '2018-03-11 15:59:36', null);
INSERT INTO `js_sys_area` VALUES ('210411', '210400', '0,210000,210400,', '4960', '0000000060,0000000420,0000004960,', '1', '2', '辽宁省/抚顺市/顺城区', '顺城区', '3', '0', 'system', '2018-03-11 15:59:36', 'system', '2018-03-11 15:59:36', null);
INSERT INTO `js_sys_area` VALUES ('210421', '210400', '0,210000,210400,', '4970', '0000000060,0000000420,0000004970,', '1', '2', '辽宁省/抚顺市/抚顺县', '抚顺县', '3', '0', 'system', '2018-03-11 15:59:36', 'system', '2018-03-11 15:59:36', null);
INSERT INTO `js_sys_area` VALUES ('210422', '210400', '0,210000,210400,', '4980', '0000000060,0000000420,0000004980,', '1', '2', '辽宁省/抚顺市/新宾满族自治县', '新宾满族自治县', '3', '0', 'system', '2018-03-11 15:59:36', 'system', '2018-03-11 15:59:36', null);
INSERT INTO `js_sys_area` VALUES ('210423', '210400', '0,210000,210400,', '4990', '0000000060,0000000420,0000004990,', '1', '2', '辽宁省/抚顺市/清原满族自治县', '清原满族自治县', '3', '0', 'system', '2018-03-11 15:59:36', 'system', '2018-03-11 15:59:36', null);
INSERT INTO `js_sys_area` VALUES ('210500', '210000', '0,210000,', '430', '0000000060,0000000430,', '0', '1', '辽宁省/本溪市', '本溪市', '2', '0', 'system', '2018-03-11 15:59:36', 'system', '2018-03-11 15:59:36', null);
INSERT INTO `js_sys_area` VALUES ('210501', '210500', '0,210000,210500,', '5000', '0000000060,0000000430,0000005000,', '1', '2', '辽宁省/本溪市/市辖区', '市辖区', '3', '0', 'system', '2018-03-11 15:59:36', 'system', '2018-03-11 15:59:36', null);
INSERT INTO `js_sys_area` VALUES ('210502', '210500', '0,210000,210500,', '5010', '0000000060,0000000430,0000005010,', '1', '2', '辽宁省/本溪市/平山区', '平山区', '3', '0', 'system', '2018-03-11 15:59:36', 'system', '2018-03-11 15:59:36', null);
INSERT INTO `js_sys_area` VALUES ('210503', '210500', '0,210000,210500,', '5020', '0000000060,0000000430,0000005020,', '1', '2', '辽宁省/本溪市/溪湖区', '溪湖区', '3', '0', 'system', '2018-03-11 15:59:36', 'system', '2018-03-11 15:59:36', null);
INSERT INTO `js_sys_area` VALUES ('210504', '210500', '0,210000,210500,', '5030', '0000000060,0000000430,0000005030,', '1', '2', '辽宁省/本溪市/明山区', '明山区', '3', '0', 'system', '2018-03-11 15:59:36', 'system', '2018-03-11 15:59:36', null);
INSERT INTO `js_sys_area` VALUES ('210505', '210500', '0,210000,210500,', '5040', '0000000060,0000000430,0000005040,', '1', '2', '辽宁省/本溪市/南芬区', '南芬区', '3', '0', 'system', '2018-03-11 15:59:36', 'system', '2018-03-11 15:59:36', null);
INSERT INTO `js_sys_area` VALUES ('210521', '210500', '0,210000,210500,', '5050', '0000000060,0000000430,0000005050,', '1', '2', '辽宁省/本溪市/本溪满族自治县', '本溪满族自治县', '3', '0', 'system', '2018-03-11 15:59:36', 'system', '2018-03-11 15:59:36', null);
INSERT INTO `js_sys_area` VALUES ('210522', '210500', '0,210000,210500,', '5060', '0000000060,0000000430,0000005060,', '1', '2', '辽宁省/本溪市/桓仁满族自治县', '桓仁满族自治县', '3', '0', 'system', '2018-03-11 15:59:36', 'system', '2018-03-11 15:59:36', null);
INSERT INTO `js_sys_area` VALUES ('210600', '210000', '0,210000,', '440', '0000000060,0000000440,', '0', '1', '辽宁省/丹东市', '丹东市', '2', '0', 'system', '2018-03-11 15:59:36', 'system', '2018-03-11 15:59:36', null);
INSERT INTO `js_sys_area` VALUES ('210601', '210600', '0,210000,210600,', '5070', '0000000060,0000000440,0000005070,', '1', '2', '辽宁省/丹东市/市辖区', '市辖区', '3', '0', 'system', '2018-03-11 15:59:36', 'system', '2018-03-11 15:59:36', null);
INSERT INTO `js_sys_area` VALUES ('210602', '210600', '0,210000,210600,', '5080', '0000000060,0000000440,0000005080,', '1', '2', '辽宁省/丹东市/元宝区', '元宝区', '3', '0', 'system', '2018-03-11 15:59:36', 'system', '2018-03-11 15:59:36', null);
INSERT INTO `js_sys_area` VALUES ('210603', '210600', '0,210000,210600,', '5090', '0000000060,0000000440,0000005090,', '1', '2', '辽宁省/丹东市/振兴区', '振兴区', '3', '0', 'system', '2018-03-11 15:59:36', 'system', '2018-03-11 15:59:36', null);
INSERT INTO `js_sys_area` VALUES ('210604', '210600', '0,210000,210600,', '5100', '0000000060,0000000440,0000005100,', '1', '2', '辽宁省/丹东市/振安区', '振安区', '3', '0', 'system', '2018-03-11 15:59:36', 'system', '2018-03-11 15:59:36', null);
INSERT INTO `js_sys_area` VALUES ('210624', '210600', '0,210000,210600,', '5110', '0000000060,0000000440,0000005110,', '1', '2', '辽宁省/丹东市/宽甸满族自治县', '宽甸满族自治县', '3', '0', 'system', '2018-03-11 15:59:36', 'system', '2018-03-11 15:59:36', null);
INSERT INTO `js_sys_area` VALUES ('210681', '210600', '0,210000,210600,', '5120', '0000000060,0000000440,0000005120,', '1', '2', '辽宁省/丹东市/东港市', '东港市', '3', '0', 'system', '2018-03-11 15:59:36', 'system', '2018-03-11 15:59:36', null);
INSERT INTO `js_sys_area` VALUES ('210682', '210600', '0,210000,210600,', '5130', '0000000060,0000000440,0000005130,', '1', '2', '辽宁省/丹东市/凤城市', '凤城市', '3', '0', 'system', '2018-03-11 15:59:36', 'system', '2018-03-11 15:59:36', null);
INSERT INTO `js_sys_area` VALUES ('210700', '210000', '0,210000,', '450', '0000000060,0000000450,', '0', '1', '辽宁省/锦州市', '锦州市', '2', '0', 'system', '2018-03-11 15:59:36', 'system', '2018-03-11 15:59:36', null);
INSERT INTO `js_sys_area` VALUES ('210701', '210700', '0,210000,210700,', '5140', '0000000060,0000000450,0000005140,', '1', '2', '辽宁省/锦州市/市辖区', '市辖区', '3', '0', 'system', '2018-03-11 15:59:36', 'system', '2018-03-11 15:59:36', null);
INSERT INTO `js_sys_area` VALUES ('210702', '210700', '0,210000,210700,', '5150', '0000000060,0000000450,0000005150,', '1', '2', '辽宁省/锦州市/古塔区', '古塔区', '3', '0', 'system', '2018-03-11 15:59:36', 'system', '2018-03-11 15:59:36', null);
INSERT INTO `js_sys_area` VALUES ('210703', '210700', '0,210000,210700,', '5160', '0000000060,0000000450,0000005160,', '1', '2', '辽宁省/锦州市/凌河区', '凌河区', '3', '0', 'system', '2018-03-11 15:59:36', 'system', '2018-03-11 15:59:36', null);
INSERT INTO `js_sys_area` VALUES ('210711', '210700', '0,210000,210700,', '5170', '0000000060,0000000450,0000005170,', '1', '2', '辽宁省/锦州市/太和区', '太和区', '3', '0', 'system', '2018-03-11 15:59:36', 'system', '2018-03-11 15:59:36', null);
INSERT INTO `js_sys_area` VALUES ('210726', '210700', '0,210000,210700,', '5180', '0000000060,0000000450,0000005180,', '1', '2', '辽宁省/锦州市/黑山县', '黑山县', '3', '0', 'system', '2018-03-11 15:59:36', 'system', '2018-03-11 15:59:36', null);
INSERT INTO `js_sys_area` VALUES ('210727', '210700', '0,210000,210700,', '5190', '0000000060,0000000450,0000005190,', '1', '2', '辽宁省/锦州市/义　县', '义　县', '3', '0', 'system', '2018-03-11 15:59:36', 'system', '2018-03-11 15:59:36', null);
INSERT INTO `js_sys_area` VALUES ('210781', '210700', '0,210000,210700,', '5200', '0000000060,0000000450,0000005200,', '1', '2', '辽宁省/锦州市/凌海市', '凌海市', '3', '0', 'system', '2018-03-11 15:59:36', 'system', '2018-03-11 15:59:36', null);
INSERT INTO `js_sys_area` VALUES ('210782', '210700', '0,210000,210700,', '5210', '0000000060,0000000450,0000005210,', '1', '2', '辽宁省/锦州市/北宁市', '北宁市', '3', '0', 'system', '2018-03-11 15:59:36', 'system', '2018-03-11 15:59:36', null);
INSERT INTO `js_sys_area` VALUES ('210800', '210000', '0,210000,', '460', '0000000060,0000000460,', '0', '1', '辽宁省/营口市', '营口市', '2', '0', 'system', '2018-03-11 15:59:36', 'system', '2018-03-11 15:59:36', null);
INSERT INTO `js_sys_area` VALUES ('210801', '210800', '0,210000,210800,', '5220', '0000000060,0000000460,0000005220,', '1', '2', '辽宁省/营口市/市辖区', '市辖区', '3', '0', 'system', '2018-03-11 15:59:36', 'system', '2018-03-11 15:59:36', null);
INSERT INTO `js_sys_area` VALUES ('210802', '210800', '0,210000,210800,', '5230', '0000000060,0000000460,0000005230,', '1', '2', '辽宁省/营口市/站前区', '站前区', '3', '0', 'system', '2018-03-11 15:59:36', 'system', '2018-03-11 15:59:36', null);
INSERT INTO `js_sys_area` VALUES ('210803', '210800', '0,210000,210800,', '5240', '0000000060,0000000460,0000005240,', '1', '2', '辽宁省/营口市/西市区', '西市区', '3', '0', 'system', '2018-03-11 15:59:36', 'system', '2018-03-11 15:59:36', null);
INSERT INTO `js_sys_area` VALUES ('210804', '210800', '0,210000,210800,', '5250', '0000000060,0000000460,0000005250,', '1', '2', '辽宁省/营口市/鲅鱼圈区', '鲅鱼圈区', '3', '0', 'system', '2018-03-11 15:59:36', 'system', '2018-03-11 15:59:36', null);
INSERT INTO `js_sys_area` VALUES ('210811', '210800', '0,210000,210800,', '5260', '0000000060,0000000460,0000005260,', '1', '2', '辽宁省/营口市/老边区', '老边区', '3', '0', 'system', '2018-03-11 15:59:36', 'system', '2018-03-11 15:59:36', null);
INSERT INTO `js_sys_area` VALUES ('210881', '210800', '0,210000,210800,', '5270', '0000000060,0000000460,0000005270,', '1', '2', '辽宁省/营口市/盖州市', '盖州市', '3', '0', 'system', '2018-03-11 15:59:36', 'system', '2018-03-11 15:59:36', null);
INSERT INTO `js_sys_area` VALUES ('210882', '210800', '0,210000,210800,', '5280', '0000000060,0000000460,0000005280,', '1', '2', '辽宁省/营口市/大石桥市', '大石桥市', '3', '0', 'system', '2018-03-11 15:59:36', 'system', '2018-03-11 15:59:36', null);
INSERT INTO `js_sys_area` VALUES ('210900', '210000', '0,210000,', '470', '0000000060,0000000470,', '0', '1', '辽宁省/阜新市', '阜新市', '2', '0', 'system', '2018-03-11 15:59:37', 'system', '2018-03-11 15:59:36', null);
INSERT INTO `js_sys_area` VALUES ('210901', '210900', '0,210000,210900,', '5290', '0000000060,0000000470,0000005290,', '1', '2', '辽宁省/阜新市/市辖区', '市辖区', '3', '0', 'system', '2018-03-11 15:59:36', 'system', '2018-03-11 15:59:36', null);
INSERT INTO `js_sys_area` VALUES ('210902', '210900', '0,210000,210900,', '5300', '0000000060,0000000470,0000005300,', '1', '2', '辽宁省/阜新市/海州区', '海州区', '3', '0', 'system', '2018-03-11 15:59:37', 'system', '2018-03-11 15:59:37', null);
INSERT INTO `js_sys_area` VALUES ('210903', '210900', '0,210000,210900,', '5310', '0000000060,0000000470,0000005310,', '1', '2', '辽宁省/阜新市/新邱区', '新邱区', '3', '0', 'system', '2018-03-11 15:59:37', 'system', '2018-03-11 15:59:37', null);
INSERT INTO `js_sys_area` VALUES ('210904', '210900', '0,210000,210900,', '5320', '0000000060,0000000470,0000005320,', '1', '2', '辽宁省/阜新市/太平区', '太平区', '3', '0', 'system', '2018-03-11 15:59:37', 'system', '2018-03-11 15:59:37', null);
INSERT INTO `js_sys_area` VALUES ('210905', '210900', '0,210000,210900,', '5330', '0000000060,0000000470,0000005330,', '1', '2', '辽宁省/阜新市/清河门区', '清河门区', '3', '0', 'system', '2018-03-11 15:59:37', 'system', '2018-03-11 15:59:37', null);
INSERT INTO `js_sys_area` VALUES ('210911', '210900', '0,210000,210900,', '5340', '0000000060,0000000470,0000005340,', '1', '2', '辽宁省/阜新市/细河区', '细河区', '3', '0', 'system', '2018-03-11 15:59:37', 'system', '2018-03-11 15:59:37', null);
INSERT INTO `js_sys_area` VALUES ('210921', '210900', '0,210000,210900,', '5350', '0000000060,0000000470,0000005350,', '1', '2', '辽宁省/阜新市/阜新蒙古族自治县', '阜新蒙古族自治县', '3', '0', 'system', '2018-03-11 15:59:37', 'system', '2018-03-11 15:59:37', null);
INSERT INTO `js_sys_area` VALUES ('210922', '210900', '0,210000,210900,', '5360', '0000000060,0000000470,0000005360,', '1', '2', '辽宁省/阜新市/彰武县', '彰武县', '3', '0', 'system', '2018-03-11 15:59:37', 'system', '2018-03-11 15:59:37', null);
INSERT INTO `js_sys_area` VALUES ('211000', '210000', '0,210000,', '480', '0000000060,0000000480,', '0', '1', '辽宁省/辽阳市', '辽阳市', '2', '0', 'system', '2018-03-11 15:59:37', 'system', '2018-03-11 15:59:37', null);
INSERT INTO `js_sys_area` VALUES ('211001', '211000', '0,210000,211000,', '5370', '0000000060,0000000480,0000005370,', '1', '2', '辽宁省/辽阳市/市辖区', '市辖区', '3', '0', 'system', '2018-03-11 15:59:37', 'system', '2018-03-11 15:59:37', null);
INSERT INTO `js_sys_area` VALUES ('211002', '211000', '0,210000,211000,', '5380', '0000000060,0000000480,0000005380,', '1', '2', '辽宁省/辽阳市/白塔区', '白塔区', '3', '0', 'system', '2018-03-11 15:59:37', 'system', '2018-03-11 15:59:37', null);
INSERT INTO `js_sys_area` VALUES ('211003', '211000', '0,210000,211000,', '5390', '0000000060,0000000480,0000005390,', '1', '2', '辽宁省/辽阳市/文圣区', '文圣区', '3', '0', 'system', '2018-03-11 15:59:37', 'system', '2018-03-11 15:59:37', null);
INSERT INTO `js_sys_area` VALUES ('211004', '211000', '0,210000,211000,', '5400', '0000000060,0000000480,0000005400,', '1', '2', '辽宁省/辽阳市/宏伟区', '宏伟区', '3', '0', 'system', '2018-03-11 15:59:37', 'system', '2018-03-11 15:59:37', null);
INSERT INTO `js_sys_area` VALUES ('211005', '211000', '0,210000,211000,', '5410', '0000000060,0000000480,0000005410,', '1', '2', '辽宁省/辽阳市/弓长岭区', '弓长岭区', '3', '0', 'system', '2018-03-11 15:59:37', 'system', '2018-03-11 15:59:37', null);
INSERT INTO `js_sys_area` VALUES ('211011', '211000', '0,210000,211000,', '5420', '0000000060,0000000480,0000005420,', '1', '2', '辽宁省/辽阳市/太子河区', '太子河区', '3', '0', 'system', '2018-03-11 15:59:37', 'system', '2018-03-11 15:59:37', null);
INSERT INTO `js_sys_area` VALUES ('211021', '211000', '0,210000,211000,', '5430', '0000000060,0000000480,0000005430,', '1', '2', '辽宁省/辽阳市/辽阳县', '辽阳县', '3', '0', 'system', '2018-03-11 15:59:37', 'system', '2018-03-11 15:59:37', null);
INSERT INTO `js_sys_area` VALUES ('211081', '211000', '0,210000,211000,', '5440', '0000000060,0000000480,0000005440,', '1', '2', '辽宁省/辽阳市/灯塔市', '灯塔市', '3', '0', 'system', '2018-03-11 15:59:37', 'system', '2018-03-11 15:59:37', null);
INSERT INTO `js_sys_area` VALUES ('211100', '210000', '0,210000,', '490', '0000000060,0000000490,', '0', '1', '辽宁省/盘锦市', '盘锦市', '2', '0', 'system', '2018-03-11 15:59:37', 'system', '2018-03-11 15:59:37', null);
INSERT INTO `js_sys_area` VALUES ('211101', '211100', '0,210000,211100,', '5450', '0000000060,0000000490,0000005450,', '1', '2', '辽宁省/盘锦市/市辖区', '市辖区', '3', '0', 'system', '2018-03-11 15:59:37', 'system', '2018-03-11 15:59:37', null);
INSERT INTO `js_sys_area` VALUES ('211102', '211100', '0,210000,211100,', '5460', '0000000060,0000000490,0000005460,', '1', '2', '辽宁省/盘锦市/双台子区', '双台子区', '3', '0', 'system', '2018-03-11 15:59:37', 'system', '2018-03-11 15:59:37', null);
INSERT INTO `js_sys_area` VALUES ('211103', '211100', '0,210000,211100,', '5470', '0000000060,0000000490,0000005470,', '1', '2', '辽宁省/盘锦市/兴隆台区', '兴隆台区', '3', '0', 'system', '2018-03-11 15:59:37', 'system', '2018-03-11 15:59:37', null);
INSERT INTO `js_sys_area` VALUES ('211121', '211100', '0,210000,211100,', '5480', '0000000060,0000000490,0000005480,', '1', '2', '辽宁省/盘锦市/大洼县', '大洼县', '3', '0', 'system', '2018-03-11 15:59:37', 'system', '2018-03-11 15:59:37', null);
INSERT INTO `js_sys_area` VALUES ('211122', '211100', '0,210000,211100,', '5490', '0000000060,0000000490,0000005490,', '1', '2', '辽宁省/盘锦市/盘山县', '盘山县', '3', '0', 'system', '2018-03-11 15:59:37', 'system', '2018-03-11 15:59:37', null);
INSERT INTO `js_sys_area` VALUES ('211200', '210000', '0,210000,', '500', '0000000060,0000000500,', '0', '1', '辽宁省/铁岭市', '铁岭市', '2', '0', 'system', '2018-03-11 15:59:37', 'system', '2018-03-11 15:59:37', null);
INSERT INTO `js_sys_area` VALUES ('211201', '211200', '0,210000,211200,', '5500', '0000000060,0000000500,0000005500,', '1', '2', '辽宁省/铁岭市/市辖区', '市辖区', '3', '0', 'system', '2018-03-11 15:59:37', 'system', '2018-03-11 15:59:37', null);
INSERT INTO `js_sys_area` VALUES ('211202', '211200', '0,210000,211200,', '5510', '0000000060,0000000500,0000005510,', '1', '2', '辽宁省/铁岭市/银州区', '银州区', '3', '0', 'system', '2018-03-11 15:59:37', 'system', '2018-03-11 15:59:37', null);
INSERT INTO `js_sys_area` VALUES ('211204', '211200', '0,210000,211200,', '5520', '0000000060,0000000500,0000005520,', '1', '2', '辽宁省/铁岭市/清河区', '清河区', '3', '0', 'system', '2018-03-11 15:59:37', 'system', '2018-03-11 15:59:37', null);
INSERT INTO `js_sys_area` VALUES ('211221', '211200', '0,210000,211200,', '5530', '0000000060,0000000500,0000005530,', '1', '2', '辽宁省/铁岭市/铁岭县', '铁岭县', '3', '0', 'system', '2018-03-11 15:59:37', 'system', '2018-03-11 15:59:37', null);
INSERT INTO `js_sys_area` VALUES ('211223', '211200', '0,210000,211200,', '5540', '0000000060,0000000500,0000005540,', '1', '2', '辽宁省/铁岭市/西丰县', '西丰县', '3', '0', 'system', '2018-03-11 15:59:37', 'system', '2018-03-11 15:59:37', null);
INSERT INTO `js_sys_area` VALUES ('211224', '211200', '0,210000,211200,', '5550', '0000000060,0000000500,0000005550,', '1', '2', '辽宁省/铁岭市/昌图县', '昌图县', '3', '0', 'system', '2018-03-11 15:59:37', 'system', '2018-03-11 15:59:37', null);
INSERT INTO `js_sys_area` VALUES ('211281', '211200', '0,210000,211200,', '5560', '0000000060,0000000500,0000005560,', '1', '2', '辽宁省/铁岭市/调兵山市', '调兵山市', '3', '0', 'system', '2018-03-11 15:59:37', 'system', '2018-03-11 15:59:37', null);
INSERT INTO `js_sys_area` VALUES ('211282', '211200', '0,210000,211200,', '5570', '0000000060,0000000500,0000005570,', '1', '2', '辽宁省/铁岭市/开原市', '开原市', '3', '0', 'system', '2018-03-11 15:59:37', 'system', '2018-03-11 15:59:37', null);
INSERT INTO `js_sys_area` VALUES ('211300', '210000', '0,210000,', '510', '0000000060,0000000510,', '0', '1', '辽宁省/朝阳市', '朝阳市', '2', '0', 'system', '2018-03-11 15:59:37', 'system', '2018-03-11 15:59:37', null);
INSERT INTO `js_sys_area` VALUES ('211301', '211300', '0,210000,211300,', '5580', '0000000060,0000000510,0000005580,', '1', '2', '辽宁省/朝阳市/市辖区', '市辖区', '3', '0', 'system', '2018-03-11 15:59:37', 'system', '2018-03-11 15:59:37', null);
INSERT INTO `js_sys_area` VALUES ('211302', '211300', '0,210000,211300,', '5590', '0000000060,0000000510,0000005590,', '1', '2', '辽宁省/朝阳市/双塔区', '双塔区', '3', '0', 'system', '2018-03-11 15:59:37', 'system', '2018-03-11 15:59:37', null);
INSERT INTO `js_sys_area` VALUES ('211303', '211300', '0,210000,211300,', '5600', '0000000060,0000000510,0000005600,', '1', '2', '辽宁省/朝阳市/龙城区', '龙城区', '3', '0', 'system', '2018-03-11 15:59:37', 'system', '2018-03-11 15:59:37', null);
INSERT INTO `js_sys_area` VALUES ('211321', '211300', '0,210000,211300,', '5610', '0000000060,0000000510,0000005610,', '1', '2', '辽宁省/朝阳市/朝阳县', '朝阳县', '3', '0', 'system', '2018-03-11 15:59:38', 'system', '2018-03-11 15:59:38', null);
INSERT INTO `js_sys_area` VALUES ('211322', '211300', '0,210000,211300,', '5620', '0000000060,0000000510,0000005620,', '1', '2', '辽宁省/朝阳市/建平县', '建平县', '3', '0', 'system', '2018-03-11 15:59:38', 'system', '2018-03-11 15:59:38', null);
INSERT INTO `js_sys_area` VALUES ('211381', '211300', '0,210000,211300,', '5640', '0000000060,0000000510,0000005640,', '1', '2', '辽宁省/朝阳市/北票市', '北票市', '3', '0', 'system', '2018-03-11 15:59:38', 'system', '2018-03-11 15:59:38', null);
INSERT INTO `js_sys_area` VALUES ('211382', '211300', '0,210000,211300,', '5650', '0000000060,0000000510,0000005650,', '1', '2', '辽宁省/朝阳市/凌源市', '凌源市', '3', '0', 'system', '2018-03-11 15:59:38', 'system', '2018-03-11 15:59:38', null);
INSERT INTO `js_sys_area` VALUES ('211400', '210000', '0,210000,', '520', '0000000060,0000000520,', '0', '1', '辽宁省/葫芦岛市', '葫芦岛市', '2', '0', 'system', '2018-03-11 15:59:38', 'system', '2018-03-11 15:59:38', null);
INSERT INTO `js_sys_area` VALUES ('211401', '211400', '0,210000,211400,', '5660', '0000000060,0000000520,0000005660,', '1', '2', '辽宁省/葫芦岛市/市辖区', '市辖区', '3', '0', 'system', '2018-03-11 15:59:38', 'system', '2018-03-11 15:59:38', null);
INSERT INTO `js_sys_area` VALUES ('211402', '211400', '0,210000,211400,', '5670', '0000000060,0000000520,0000005670,', '1', '2', '辽宁省/葫芦岛市/连山区', '连山区', '3', '0', 'system', '2018-03-11 15:59:38', 'system', '2018-03-11 15:59:38', null);
INSERT INTO `js_sys_area` VALUES ('211403', '211400', '0,210000,211400,', '5680', '0000000060,0000000520,0000005680,', '1', '2', '辽宁省/葫芦岛市/龙港区', '龙港区', '3', '0', 'system', '2018-03-11 15:59:38', 'system', '2018-03-11 15:59:38', null);
INSERT INTO `js_sys_area` VALUES ('211404', '211400', '0,210000,211400,', '5690', '0000000060,0000000520,0000005690,', '1', '2', '辽宁省/葫芦岛市/南票区', '南票区', '3', '0', 'system', '2018-03-11 15:59:38', 'system', '2018-03-11 15:59:38', null);
INSERT INTO `js_sys_area` VALUES ('211421', '211400', '0,210000,211400,', '5700', '0000000060,0000000520,0000005700,', '1', '2', '辽宁省/葫芦岛市/绥中县', '绥中县', '3', '0', 'system', '2018-03-11 15:59:38', 'system', '2018-03-11 15:59:38', null);
INSERT INTO `js_sys_area` VALUES ('211422', '211400', '0,210000,211400,', '5710', '0000000060,0000000520,0000005710,', '1', '2', '辽宁省/葫芦岛市/建昌县', '建昌县', '3', '0', 'system', '2018-03-11 15:59:38', 'system', '2018-03-11 15:59:38', null);
INSERT INTO `js_sys_area` VALUES ('211481', '211400', '0,210000,211400,', '5720', '0000000060,0000000520,0000005720,', '1', '2', '辽宁省/葫芦岛市/兴城市', '兴城市', '3', '0', 'system', '2018-03-11 15:59:38', 'system', '2018-03-11 15:59:38', null);
INSERT INTO `js_sys_area` VALUES ('220000', '0', '0,', '70', '0000000070,', '0', '0', '吉林省', '吉林省', '1', '0', 'system', '2018-03-11 15:59:38', 'system', '2018-03-11 15:59:38', null);
INSERT INTO `js_sys_area` VALUES ('220100', '220000', '0,220000,', '530', '0000000070,0000000530,', '0', '1', '吉林省/长春市', '长春市', '2', '0', 'system', '2018-03-11 15:59:38', 'system', '2018-03-11 15:59:38', null);
INSERT INTO `js_sys_area` VALUES ('220101', '220100', '0,220000,220100,', '5730', '0000000070,0000000530,0000005730,', '1', '2', '吉林省/长春市/市辖区', '市辖区', '3', '0', 'system', '2018-03-11 15:59:38', 'system', '2018-03-11 15:59:38', null);
INSERT INTO `js_sys_area` VALUES ('220102', '220100', '0,220000,220100,', '5740', '0000000070,0000000530,0000005740,', '1', '2', '吉林省/长春市/南关区', '南关区', '3', '0', 'system', '2018-03-11 15:59:38', 'system', '2018-03-11 15:59:38', null);
INSERT INTO `js_sys_area` VALUES ('220103', '220100', '0,220000,220100,', '5750', '0000000070,0000000530,0000005750,', '1', '2', '吉林省/长春市/宽城区', '宽城区', '3', '0', 'system', '2018-03-11 15:59:38', 'system', '2018-03-11 15:59:38', null);
INSERT INTO `js_sys_area` VALUES ('220104', '220100', '0,220000,220100,', '5760', '0000000070,0000000530,0000005760,', '1', '2', '吉林省/长春市/朝阳区', '朝阳区', '3', '0', 'system', '2018-03-11 15:59:38', 'system', '2018-03-11 15:59:38', null);
INSERT INTO `js_sys_area` VALUES ('220105', '220100', '0,220000,220100,', '5770', '0000000070,0000000530,0000005770,', '1', '2', '吉林省/长春市/二道区', '二道区', '3', '0', 'system', '2018-03-11 15:59:38', 'system', '2018-03-11 15:59:38', null);
INSERT INTO `js_sys_area` VALUES ('220106', '220100', '0,220000,220100,', '5780', '0000000070,0000000530,0000005780,', '1', '2', '吉林省/长春市/绿园区', '绿园区', '3', '0', 'system', '2018-03-11 15:59:38', 'system', '2018-03-11 15:59:38', null);
INSERT INTO `js_sys_area` VALUES ('220112', '220100', '0,220000,220100,', '5790', '0000000070,0000000530,0000005790,', '1', '2', '吉林省/长春市/双阳区', '双阳区', '3', '0', 'system', '2018-03-11 15:59:38', 'system', '2018-03-11 15:59:38', null);
INSERT INTO `js_sys_area` VALUES ('220122', '220100', '0,220000,220100,', '5800', '0000000070,0000000530,0000005800,', '1', '2', '吉林省/长春市/农安县', '农安县', '3', '0', 'system', '2018-03-11 15:59:38', 'system', '2018-03-11 15:59:38', null);
INSERT INTO `js_sys_area` VALUES ('220181', '220100', '0,220000,220100,', '5810', '0000000070,0000000530,0000005810,', '1', '2', '吉林省/长春市/九台市', '九台市', '3', '0', 'system', '2018-03-11 15:59:38', 'system', '2018-03-11 15:59:38', null);
INSERT INTO `js_sys_area` VALUES ('220182', '220100', '0,220000,220100,', '5820', '0000000070,0000000530,0000005820,', '1', '2', '吉林省/长春市/榆树市', '榆树市', '3', '0', 'system', '2018-03-11 15:59:38', 'system', '2018-03-11 15:59:38', null);
INSERT INTO `js_sys_area` VALUES ('220183', '220100', '0,220000,220100,', '5830', '0000000070,0000000530,0000005830,', '1', '2', '吉林省/长春市/德惠市', '德惠市', '3', '0', 'system', '2018-03-11 15:59:38', 'system', '2018-03-11 15:59:38', null);
INSERT INTO `js_sys_area` VALUES ('220200', '220000', '0,220000,', '540', '0000000070,0000000540,', '0', '1', '吉林省/吉林市', '吉林市', '2', '0', 'system', '2018-03-11 15:59:38', 'system', '2018-03-11 15:59:38', null);
INSERT INTO `js_sys_area` VALUES ('220201', '220200', '0,220000,220200,', '5840', '0000000070,0000000540,0000005840,', '1', '2', '吉林省/吉林市/市辖区', '市辖区', '3', '0', 'system', '2018-03-11 15:59:38', 'system', '2018-03-11 15:59:38', null);
INSERT INTO `js_sys_area` VALUES ('220202', '220200', '0,220000,220200,', '5850', '0000000070,0000000540,0000005850,', '1', '2', '吉林省/吉林市/昌邑区', '昌邑区', '3', '0', 'system', '2018-03-11 15:59:38', 'system', '2018-03-11 15:59:38', null);
INSERT INTO `js_sys_area` VALUES ('220203', '220200', '0,220000,220200,', '5860', '0000000070,0000000540,0000005860,', '1', '2', '吉林省/吉林市/龙潭区', '龙潭区', '3', '0', 'system', '2018-03-11 15:59:38', 'system', '2018-03-11 15:59:38', null);
INSERT INTO `js_sys_area` VALUES ('220204', '220200', '0,220000,220200,', '5870', '0000000070,0000000540,0000005870,', '1', '2', '吉林省/吉林市/船营区', '船营区', '3', '0', 'system', '2018-03-11 15:59:38', 'system', '2018-03-11 15:59:38', null);
INSERT INTO `js_sys_area` VALUES ('220211', '220200', '0,220000,220200,', '5880', '0000000070,0000000540,0000005880,', '1', '2', '吉林省/吉林市/丰满区', '丰满区', '3', '0', 'system', '2018-03-11 15:59:38', 'system', '2018-03-11 15:59:38', null);
INSERT INTO `js_sys_area` VALUES ('220221', '220200', '0,220000,220200,', '5890', '0000000070,0000000540,0000005890,', '1', '2', '吉林省/吉林市/永吉县', '永吉县', '3', '0', 'system', '2018-03-11 15:59:38', 'system', '2018-03-11 15:59:38', null);
INSERT INTO `js_sys_area` VALUES ('220281', '220200', '0,220000,220200,', '5900', '0000000070,0000000540,0000005900,', '1', '2', '吉林省/吉林市/蛟河市', '蛟河市', '3', '0', 'system', '2018-03-11 15:59:38', 'system', '2018-03-11 15:59:38', null);
INSERT INTO `js_sys_area` VALUES ('220282', '220200', '0,220000,220200,', '5910', '0000000070,0000000540,0000005910,', '1', '2', '吉林省/吉林市/桦甸市', '桦甸市', '3', '0', 'system', '2018-03-11 15:59:38', 'system', '2018-03-11 15:59:38', null);
INSERT INTO `js_sys_area` VALUES ('220283', '220200', '0,220000,220200,', '5920', '0000000070,0000000540,0000005920,', '1', '2', '吉林省/吉林市/舒兰市', '舒兰市', '3', '0', 'system', '2018-03-11 15:59:38', 'system', '2018-03-11 15:59:38', null);
INSERT INTO `js_sys_area` VALUES ('220284', '220200', '0,220000,220200,', '5930', '0000000070,0000000540,0000005930,', '1', '2', '吉林省/吉林市/磐石市', '磐石市', '3', '0', 'system', '2018-03-11 15:59:38', 'system', '2018-03-11 15:59:38', null);
INSERT INTO `js_sys_area` VALUES ('220300', '220000', '0,220000,', '550', '0000000070,0000000550,', '0', '1', '吉林省/四平市', '四平市', '2', '0', 'system', '2018-03-11 15:59:38', 'system', '2018-03-11 15:59:38', null);
INSERT INTO `js_sys_area` VALUES ('220301', '220300', '0,220000,220300,', '5940', '0000000070,0000000550,0000005940,', '1', '2', '吉林省/四平市/市辖区', '市辖区', '3', '0', 'system', '2018-03-11 15:59:38', 'system', '2018-03-11 15:59:38', null);
INSERT INTO `js_sys_area` VALUES ('220302', '220300', '0,220000,220300,', '5950', '0000000070,0000000550,0000005950,', '1', '2', '吉林省/四平市/铁西区', '铁西区', '3', '0', 'system', '2018-03-11 15:59:39', 'system', '2018-03-11 15:59:39', null);
INSERT INTO `js_sys_area` VALUES ('220303', '220300', '0,220000,220300,', '5960', '0000000070,0000000550,0000005960,', '1', '2', '吉林省/四平市/铁东区', '铁东区', '3', '0', 'system', '2018-03-11 15:59:39', 'system', '2018-03-11 15:59:39', null);
INSERT INTO `js_sys_area` VALUES ('220322', '220300', '0,220000,220300,', '5970', '0000000070,0000000550,0000005970,', '1', '2', '吉林省/四平市/梨树县', '梨树县', '3', '0', 'system', '2018-03-11 15:59:39', 'system', '2018-03-11 15:59:39', null);
INSERT INTO `js_sys_area` VALUES ('220323', '220300', '0,220000,220300,', '5980', '0000000070,0000000550,0000005980,', '1', '2', '吉林省/四平市/伊通满族自治县', '伊通满族自治县', '3', '0', 'system', '2018-03-11 15:59:39', 'system', '2018-03-11 15:59:39', null);
INSERT INTO `js_sys_area` VALUES ('220381', '220300', '0,220000,220300,', '5990', '0000000070,0000000550,0000005990,', '1', '2', '吉林省/四平市/公主岭市', '公主岭市', '3', '0', 'system', '2018-03-11 15:59:39', 'system', '2018-03-11 15:59:39', null);
INSERT INTO `js_sys_area` VALUES ('220382', '220300', '0,220000,220300,', '6000', '0000000070,0000000550,0000006000,', '1', '2', '吉林省/四平市/双辽市', '双辽市', '3', '0', 'system', '2018-03-11 15:59:39', 'system', '2018-03-11 15:59:39', null);
INSERT INTO `js_sys_area` VALUES ('220400', '220000', '0,220000,', '560', '0000000070,0000000560,', '0', '1', '吉林省/辽源市', '辽源市', '2', '0', 'system', '2018-03-11 15:59:39', 'system', '2018-03-11 15:59:39', null);
INSERT INTO `js_sys_area` VALUES ('220401', '220400', '0,220000,220400,', '6010', '0000000070,0000000560,0000006010,', '1', '2', '吉林省/辽源市/市辖区', '市辖区', '3', '0', 'system', '2018-03-11 15:59:39', 'system', '2018-03-11 15:59:39', null);
INSERT INTO `js_sys_area` VALUES ('220402', '220400', '0,220000,220400,', '6020', '0000000070,0000000560,0000006020,', '1', '2', '吉林省/辽源市/龙山区', '龙山区', '3', '0', 'system', '2018-03-11 15:59:39', 'system', '2018-03-11 15:59:39', null);
INSERT INTO `js_sys_area` VALUES ('220403', '220400', '0,220000,220400,', '6030', '0000000070,0000000560,0000006030,', '1', '2', '吉林省/辽源市/西安区', '西安区', '3', '0', 'system', '2018-03-11 15:59:39', 'system', '2018-03-11 15:59:39', null);
INSERT INTO `js_sys_area` VALUES ('220421', '220400', '0,220000,220400,', '6040', '0000000070,0000000560,0000006040,', '1', '2', '吉林省/辽源市/东丰县', '东丰县', '3', '0', 'system', '2018-03-11 15:59:39', 'system', '2018-03-11 15:59:39', null);
INSERT INTO `js_sys_area` VALUES ('220422', '220400', '0,220000,220400,', '6050', '0000000070,0000000560,0000006050,', '1', '2', '吉林省/辽源市/东辽县', '东辽县', '3', '0', 'system', '2018-03-11 15:59:39', 'system', '2018-03-11 15:59:39', null);
INSERT INTO `js_sys_area` VALUES ('220500', '220000', '0,220000,', '570', '0000000070,0000000570,', '0', '1', '吉林省/通化市', '通化市', '2', '0', 'system', '2018-03-11 15:59:39', 'system', '2018-03-11 15:59:39', null);
INSERT INTO `js_sys_area` VALUES ('220501', '220500', '0,220000,220500,', '6060', '0000000070,0000000570,0000006060,', '1', '2', '吉林省/通化市/市辖区', '市辖区', '3', '0', 'system', '2018-03-11 15:59:39', 'system', '2018-03-11 15:59:39', null);
INSERT INTO `js_sys_area` VALUES ('220502', '220500', '0,220000,220500,', '6070', '0000000070,0000000570,0000006070,', '1', '2', '吉林省/通化市/东昌区', '东昌区', '3', '0', 'system', '2018-03-11 15:59:39', 'system', '2018-03-11 15:59:39', null);
INSERT INTO `js_sys_area` VALUES ('220503', '220500', '0,220000,220500,', '6080', '0000000070,0000000570,0000006080,', '1', '2', '吉林省/通化市/二道江区', '二道江区', '3', '0', 'system', '2018-03-11 15:59:39', 'system', '2018-03-11 15:59:39', null);
INSERT INTO `js_sys_area` VALUES ('220521', '220500', '0,220000,220500,', '6090', '0000000070,0000000570,0000006090,', '1', '2', '吉林省/通化市/通化县', '通化县', '3', '0', 'system', '2018-03-11 15:59:39', 'system', '2018-03-11 15:59:39', null);
INSERT INTO `js_sys_area` VALUES ('220523', '220500', '0,220000,220500,', '6100', '0000000070,0000000570,0000006100,', '1', '2', '吉林省/通化市/辉南县', '辉南县', '3', '0', 'system', '2018-03-11 15:59:39', 'system', '2018-03-11 15:59:39', null);
INSERT INTO `js_sys_area` VALUES ('220524', '220500', '0,220000,220500,', '6110', '0000000070,0000000570,0000006110,', '1', '2', '吉林省/通化市/柳河县', '柳河县', '3', '0', 'system', '2018-03-11 15:59:39', 'system', '2018-03-11 15:59:39', null);
INSERT INTO `js_sys_area` VALUES ('220581', '220500', '0,220000,220500,', '6120', '0000000070,0000000570,0000006120,', '1', '2', '吉林省/通化市/梅河口市', '梅河口市', '3', '0', 'system', '2018-03-11 15:59:39', 'system', '2018-03-11 15:59:39', null);
INSERT INTO `js_sys_area` VALUES ('220582', '220500', '0,220000,220500,', '6130', '0000000070,0000000570,0000006130,', '1', '2', '吉林省/通化市/集安市', '集安市', '3', '0', 'system', '2018-03-11 15:59:39', 'system', '2018-03-11 15:59:39', null);
INSERT INTO `js_sys_area` VALUES ('220600', '220000', '0,220000,', '580', '0000000070,0000000580,', '0', '1', '吉林省/白山市', '白山市', '2', '0', 'system', '2018-03-11 15:59:39', 'system', '2018-03-11 15:59:39', null);
INSERT INTO `js_sys_area` VALUES ('220601', '220600', '0,220000,220600,', '6140', '0000000070,0000000580,0000006140,', '1', '2', '吉林省/白山市/市辖区', '市辖区', '3', '0', 'system', '2018-03-11 15:59:39', 'system', '2018-03-11 15:59:39', null);
INSERT INTO `js_sys_area` VALUES ('220602', '220600', '0,220000,220600,', '6150', '0000000070,0000000580,0000006150,', '1', '2', '吉林省/白山市/八道江区', '八道江区', '3', '0', 'system', '2018-03-11 15:59:39', 'system', '2018-03-11 15:59:39', null);
INSERT INTO `js_sys_area` VALUES ('220621', '220600', '0,220000,220600,', '6160', '0000000070,0000000580,0000006160,', '1', '2', '吉林省/白山市/抚松县', '抚松县', '3', '0', 'system', '2018-03-11 15:59:39', 'system', '2018-03-11 15:59:39', null);
INSERT INTO `js_sys_area` VALUES ('220622', '220600', '0,220000,220600,', '6170', '0000000070,0000000580,0000006170,', '1', '2', '吉林省/白山市/靖宇县', '靖宇县', '3', '0', 'system', '2018-03-11 15:59:39', 'system', '2018-03-11 15:59:39', null);
INSERT INTO `js_sys_area` VALUES ('220623', '220600', '0,220000,220600,', '6180', '0000000070,0000000580,0000006180,', '1', '2', '吉林省/白山市/长白朝鲜族自治县', '长白朝鲜族自治县', '3', '0', 'system', '2018-03-11 15:59:39', 'system', '2018-03-11 15:59:39', null);
INSERT INTO `js_sys_area` VALUES ('220625', '220600', '0,220000,220600,', '6190', '0000000070,0000000580,0000006190,', '1', '2', '吉林省/白山市/江源县', '江源县', '3', '0', 'system', '2018-03-11 15:59:39', 'system', '2018-03-11 15:59:39', null);
INSERT INTO `js_sys_area` VALUES ('220681', '220600', '0,220000,220600,', '6200', '0000000070,0000000580,0000006200,', '1', '2', '吉林省/白山市/临江市', '临江市', '3', '0', 'system', '2018-03-11 15:59:39', 'system', '2018-03-11 15:59:39', null);
INSERT INTO `js_sys_area` VALUES ('220700', '220000', '0,220000,', '590', '0000000070,0000000590,', '0', '1', '吉林省/松原市', '松原市', '2', '0', 'system', '2018-03-11 15:59:39', 'system', '2018-03-11 15:59:39', null);
INSERT INTO `js_sys_area` VALUES ('220701', '220700', '0,220000,220700,', '6210', '0000000070,0000000590,0000006210,', '1', '2', '吉林省/松原市/市辖区', '市辖区', '3', '0', 'system', '2018-03-11 15:59:39', 'system', '2018-03-11 15:59:39', null);
INSERT INTO `js_sys_area` VALUES ('220702', '220700', '0,220000,220700,', '6220', '0000000070,0000000590,0000006220,', '1', '2', '吉林省/松原市/宁江区', '宁江区', '3', '0', 'system', '2018-03-11 15:59:39', 'system', '2018-03-11 15:59:39', null);
INSERT INTO `js_sys_area` VALUES ('220722', '220700', '0,220000,220700,', '6240', '0000000070,0000000590,0000006240,', '1', '2', '吉林省/松原市/长岭县', '长岭县', '3', '0', 'system', '2018-03-11 15:59:39', 'system', '2018-03-11 15:59:39', null);
INSERT INTO `js_sys_area` VALUES ('220723', '220700', '0,220000,220700,', '6250', '0000000070,0000000590,0000006250,', '1', '2', '吉林省/松原市/乾安县', '乾安县', '3', '0', 'system', '2018-03-11 15:59:39', 'system', '2018-03-11 15:59:39', null);
INSERT INTO `js_sys_area` VALUES ('220724', '220700', '0,220000,220700,', '6260', '0000000070,0000000590,0000006260,', '1', '2', '吉林省/松原市/扶余县', '扶余县', '3', '0', 'system', '2018-03-11 15:59:39', 'system', '2018-03-11 15:59:39', null);
INSERT INTO `js_sys_area` VALUES ('220800', '220000', '0,220000,', '600', '0000000070,0000000600,', '0', '1', '吉林省/白城市', '白城市', '2', '0', 'system', '2018-03-11 15:59:39', 'system', '2018-03-11 15:59:39', null);
INSERT INTO `js_sys_area` VALUES ('220801', '220800', '0,220000,220800,', '6270', '0000000070,0000000600,0000006270,', '1', '2', '吉林省/白城市/市辖区', '市辖区', '3', '0', 'system', '2018-03-11 15:59:39', 'system', '2018-03-11 15:59:39', null);
INSERT INTO `js_sys_area` VALUES ('220802', '220800', '0,220000,220800,', '6280', '0000000070,0000000600,0000006280,', '1', '2', '吉林省/白城市/洮北区', '洮北区', '3', '0', 'system', '2018-03-11 15:59:39', 'system', '2018-03-11 15:59:39', null);
INSERT INTO `js_sys_area` VALUES ('220821', '220800', '0,220000,220800,', '6290', '0000000070,0000000600,0000006290,', '1', '2', '吉林省/白城市/镇赉县', '镇赉县', '3', '0', 'system', '2018-03-11 15:59:39', 'system', '2018-03-11 15:59:39', null);
INSERT INTO `js_sys_area` VALUES ('220822', '220800', '0,220000,220800,', '6300', '0000000070,0000000600,0000006300,', '1', '2', '吉林省/白城市/通榆县', '通榆县', '3', '0', 'system', '2018-03-11 15:59:39', 'system', '2018-03-11 15:59:39', null);
INSERT INTO `js_sys_area` VALUES ('220881', '220800', '0,220000,220800,', '6310', '0000000070,0000000600,0000006310,', '1', '2', '吉林省/白城市/洮南市', '洮南市', '3', '0', 'system', '2018-03-11 15:59:39', 'system', '2018-03-11 15:59:39', null);
INSERT INTO `js_sys_area` VALUES ('220882', '220800', '0,220000,220800,', '6320', '0000000070,0000000600,0000006320,', '1', '2', '吉林省/白城市/大安市', '大安市', '3', '0', 'system', '2018-03-11 15:59:40', 'system', '2018-03-11 15:59:40', null);
INSERT INTO `js_sys_area` VALUES ('222400', '220000', '0,220000,', '610', '0000000070,0000000610,', '0', '1', '吉林省/延边朝鲜族自治州', '延边朝鲜族自治州', '2', '0', 'system', '2018-03-11 15:59:40', 'system', '2018-03-11 15:59:40', null);
INSERT INTO `js_sys_area` VALUES ('222401', '222400', '0,220000,222400,', '6330', '0000000070,0000000610,0000006330,', '1', '2', '吉林省/延边朝鲜族自治州/延吉市', '延吉市', '3', '0', 'system', '2018-03-11 15:59:40', 'system', '2018-03-11 15:59:40', null);
INSERT INTO `js_sys_area` VALUES ('222402', '222400', '0,220000,222400,', '6340', '0000000070,0000000610,0000006340,', '1', '2', '吉林省/延边朝鲜族自治州/图们市', '图们市', '3', '0', 'system', '2018-03-11 15:59:40', 'system', '2018-03-11 15:59:40', null);
INSERT INTO `js_sys_area` VALUES ('222403', '222400', '0,220000,222400,', '6350', '0000000070,0000000610,0000006350,', '1', '2', '吉林省/延边朝鲜族自治州/敦化市', '敦化市', '3', '0', 'system', '2018-03-11 15:59:40', 'system', '2018-03-11 15:59:40', null);
INSERT INTO `js_sys_area` VALUES ('222404', '222400', '0,220000,222400,', '6360', '0000000070,0000000610,0000006360,', '1', '2', '吉林省/延边朝鲜族自治州/珲春市', '珲春市', '3', '0', 'system', '2018-03-11 15:59:40', 'system', '2018-03-11 15:59:40', null);
INSERT INTO `js_sys_area` VALUES ('222405', '222400', '0,220000,222400,', '6370', '0000000070,0000000610,0000006370,', '1', '2', '吉林省/延边朝鲜族自治州/龙井市', '龙井市', '3', '0', 'system', '2018-03-11 15:59:40', 'system', '2018-03-11 15:59:40', null);
INSERT INTO `js_sys_area` VALUES ('222406', '222400', '0,220000,222400,', '6380', '0000000070,0000000610,0000006380,', '1', '2', '吉林省/延边朝鲜族自治州/和龙市', '和龙市', '3', '0', 'system', '2018-03-11 15:59:40', 'system', '2018-03-11 15:59:40', null);
INSERT INTO `js_sys_area` VALUES ('222424', '222400', '0,220000,222400,', '6390', '0000000070,0000000610,0000006390,', '1', '2', '吉林省/延边朝鲜族自治州/汪清县', '汪清县', '3', '0', 'system', '2018-03-11 15:59:40', 'system', '2018-03-11 15:59:40', null);
INSERT INTO `js_sys_area` VALUES ('222426', '222400', '0,220000,222400,', '6400', '0000000070,0000000610,0000006400,', '1', '2', '吉林省/延边朝鲜族自治州/安图县', '安图县', '3', '0', 'system', '2018-03-11 15:59:40', 'system', '2018-03-11 15:59:40', null);
INSERT INTO `js_sys_area` VALUES ('230000', '0', '0,', '80', '0000000080,', '0', '0', '黑龙江省', '黑龙江省', '1', '0', 'system', '2018-03-11 15:59:40', 'system', '2018-03-11 15:59:40', null);
INSERT INTO `js_sys_area` VALUES ('230100', '230000', '0,230000,', '620', '0000000080,0000000620,', '0', '1', '黑龙江省/哈尔滨市', '哈尔滨市', '2', '0', 'system', '2018-03-11 15:59:40', 'system', '2018-03-11 15:59:40', null);
INSERT INTO `js_sys_area` VALUES ('230101', '230100', '0,230000,230100,', '6410', '0000000080,0000000620,0000006410,', '1', '2', '黑龙江省/哈尔滨市/市辖区', '市辖区', '3', '0', 'system', '2018-03-11 15:59:40', 'system', '2018-03-11 15:59:40', null);
INSERT INTO `js_sys_area` VALUES ('230102', '230100', '0,230000,230100,', '6420', '0000000080,0000000620,0000006420,', '1', '2', '黑龙江省/哈尔滨市/道里区', '道里区', '3', '0', 'system', '2018-03-11 15:59:40', 'system', '2018-03-11 15:59:40', null);
INSERT INTO `js_sys_area` VALUES ('230103', '230100', '0,230000,230100,', '6430', '0000000080,0000000620,0000006430,', '1', '2', '黑龙江省/哈尔滨市/南岗区', '南岗区', '3', '0', 'system', '2018-03-11 15:59:40', 'system', '2018-03-11 15:59:40', null);
INSERT INTO `js_sys_area` VALUES ('230104', '230100', '0,230000,230100,', '6440', '0000000080,0000000620,0000006440,', '1', '2', '黑龙江省/哈尔滨市/道外区', '道外区', '3', '0', 'system', '2018-03-11 15:59:40', 'system', '2018-03-11 15:59:40', null);
INSERT INTO `js_sys_area` VALUES ('230106', '230100', '0,230000,230100,', '6450', '0000000080,0000000620,0000006450,', '1', '2', '黑龙江省/哈尔滨市/香坊区', '香坊区', '3', '0', 'system', '2018-03-11 15:59:40', 'system', '2018-03-11 15:59:40', null);
INSERT INTO `js_sys_area` VALUES ('230107', '230100', '0,230000,230100,', '6460', '0000000080,0000000620,0000006460,', '1', '2', '黑龙江省/哈尔滨市/动力区', '动力区', '3', '0', 'system', '2018-03-11 15:59:40', 'system', '2018-03-11 15:59:40', null);
INSERT INTO `js_sys_area` VALUES ('230108', '230100', '0,230000,230100,', '6470', '0000000080,0000000620,0000006470,', '1', '2', '黑龙江省/哈尔滨市/平房区', '平房区', '3', '0', 'system', '2018-03-11 15:59:40', 'system', '2018-03-11 15:59:40', null);
INSERT INTO `js_sys_area` VALUES ('230109', '230100', '0,230000,230100,', '6480', '0000000080,0000000620,0000006480,', '1', '2', '黑龙江省/哈尔滨市/松北区', '松北区', '3', '0', 'system', '2018-03-11 15:59:40', 'system', '2018-03-11 15:59:40', null);
INSERT INTO `js_sys_area` VALUES ('230111', '230100', '0,230000,230100,', '6490', '0000000080,0000000620,0000006490,', '1', '2', '黑龙江省/哈尔滨市/呼兰区', '呼兰区', '3', '0', 'system', '2018-03-11 15:59:40', 'system', '2018-03-11 15:59:40', null);
INSERT INTO `js_sys_area` VALUES ('230123', '230100', '0,230000,230100,', '6500', '0000000080,0000000620,0000006500,', '1', '2', '黑龙江省/哈尔滨市/依兰县', '依兰县', '3', '0', 'system', '2018-03-11 15:59:40', 'system', '2018-03-11 15:59:40', null);
INSERT INTO `js_sys_area` VALUES ('230124', '230100', '0,230000,230100,', '6510', '0000000080,0000000620,0000006510,', '1', '2', '黑龙江省/哈尔滨市/方正县', '方正县', '3', '0', 'system', '2018-03-11 15:59:40', 'system', '2018-03-11 15:59:40', null);
INSERT INTO `js_sys_area` VALUES ('230125', '230100', '0,230000,230100,', '6520', '0000000080,0000000620,0000006520,', '1', '2', '黑龙江省/哈尔滨市/宾　县', '宾　县', '3', '0', 'system', '2018-03-11 15:59:40', 'system', '2018-03-11 15:59:40', null);
INSERT INTO `js_sys_area` VALUES ('230126', '230100', '0,230000,230100,', '6530', '0000000080,0000000620,0000006530,', '1', '2', '黑龙江省/哈尔滨市/巴彦县', '巴彦县', '3', '0', 'system', '2018-03-11 15:59:40', 'system', '2018-03-11 15:59:40', null);
INSERT INTO `js_sys_area` VALUES ('230127', '230100', '0,230000,230100,', '6540', '0000000080,0000000620,0000006540,', '1', '2', '黑龙江省/哈尔滨市/木兰县', '木兰县', '3', '0', 'system', '2018-03-11 15:59:40', 'system', '2018-03-11 15:59:40', null);
INSERT INTO `js_sys_area` VALUES ('230128', '230100', '0,230000,230100,', '6550', '0000000080,0000000620,0000006550,', '1', '2', '黑龙江省/哈尔滨市/通河县', '通河县', '3', '0', 'system', '2018-03-11 15:59:40', 'system', '2018-03-11 15:59:40', null);
INSERT INTO `js_sys_area` VALUES ('230129', '230100', '0,230000,230100,', '6560', '0000000080,0000000620,0000006560,', '1', '2', '黑龙江省/哈尔滨市/延寿县', '延寿县', '3', '0', 'system', '2018-03-11 15:59:40', 'system', '2018-03-11 15:59:40', null);
INSERT INTO `js_sys_area` VALUES ('230181', '230100', '0,230000,230100,', '6570', '0000000080,0000000620,0000006570,', '1', '2', '黑龙江省/哈尔滨市/阿城市', '阿城市', '3', '0', 'system', '2018-03-11 15:59:40', 'system', '2018-03-11 15:59:40', null);
INSERT INTO `js_sys_area` VALUES ('230182', '230100', '0,230000,230100,', '6580', '0000000080,0000000620,0000006580,', '1', '2', '黑龙江省/哈尔滨市/双城市', '双城市', '3', '0', 'system', '2018-03-11 15:59:40', 'system', '2018-03-11 15:59:40', null);
INSERT INTO `js_sys_area` VALUES ('230183', '230100', '0,230000,230100,', '6590', '0000000080,0000000620,0000006590,', '1', '2', '黑龙江省/哈尔滨市/尚志市', '尚志市', '3', '0', 'system', '2018-03-11 15:59:40', 'system', '2018-03-11 15:59:40', null);
INSERT INTO `js_sys_area` VALUES ('230184', '230100', '0,230000,230100,', '6600', '0000000080,0000000620,0000006600,', '1', '2', '黑龙江省/哈尔滨市/五常市', '五常市', '3', '0', 'system', '2018-03-11 15:59:40', 'system', '2018-03-11 15:59:40', null);
INSERT INTO `js_sys_area` VALUES ('230200', '230000', '0,230000,', '630', '0000000080,0000000630,', '0', '1', '黑龙江省/齐齐哈尔市', '齐齐哈尔市', '2', '0', 'system', '2018-03-11 15:59:40', 'system', '2018-03-11 15:59:40', null);
INSERT INTO `js_sys_area` VALUES ('230201', '230200', '0,230000,230200,', '6610', '0000000080,0000000630,0000006610,', '1', '2', '黑龙江省/齐齐哈尔市/市辖区', '市辖区', '3', '0', 'system', '2018-03-11 15:59:40', 'system', '2018-03-11 15:59:40', null);
INSERT INTO `js_sys_area` VALUES ('230202', '230200', '0,230000,230200,', '6620', '0000000080,0000000630,0000006620,', '1', '2', '黑龙江省/齐齐哈尔市/龙沙区', '龙沙区', '3', '0', 'system', '2018-03-11 15:59:40', 'system', '2018-03-11 15:59:40', null);
INSERT INTO `js_sys_area` VALUES ('230203', '230200', '0,230000,230200,', '6630', '0000000080,0000000630,0000006630,', '1', '2', '黑龙江省/齐齐哈尔市/建华区', '建华区', '3', '0', 'system', '2018-03-11 15:59:40', 'system', '2018-03-11 15:59:40', null);
INSERT INTO `js_sys_area` VALUES ('230204', '230200', '0,230000,230200,', '6640', '0000000080,0000000630,0000006640,', '1', '2', '黑龙江省/齐齐哈尔市/铁锋区', '铁锋区', '3', '0', 'system', '2018-03-11 15:59:40', 'system', '2018-03-11 15:59:40', null);
INSERT INTO `js_sys_area` VALUES ('230205', '230200', '0,230000,230200,', '6650', '0000000080,0000000630,0000006650,', '1', '2', '黑龙江省/齐齐哈尔市/昂昂溪区', '昂昂溪区', '3', '0', 'system', '2018-03-11 15:59:40', 'system', '2018-03-11 15:59:40', null);
INSERT INTO `js_sys_area` VALUES ('230206', '230200', '0,230000,230200,', '6660', '0000000080,0000000630,0000006660,', '1', '2', '黑龙江省/齐齐哈尔市/富拉尔基区', '富拉尔基区', '3', '0', 'system', '2018-03-11 15:59:40', 'system', '2018-03-11 15:59:40', null);
INSERT INTO `js_sys_area` VALUES ('230207', '230200', '0,230000,230200,', '6670', '0000000080,0000000630,0000006670,', '1', '2', '黑龙江省/齐齐哈尔市/碾子山区', '碾子山区', '3', '0', 'system', '2018-03-11 15:59:40', 'system', '2018-03-11 15:59:40', null);
INSERT INTO `js_sys_area` VALUES ('230208', '230200', '0,230000,230200,', '6680', '0000000080,0000000630,0000006680,', '1', '2', '黑龙江省/齐齐哈尔市/梅里斯达斡尔族区', '梅里斯达斡尔族区', '3', '0', 'system', '2018-03-11 15:59:41', 'system', '2018-03-11 15:59:41', null);
INSERT INTO `js_sys_area` VALUES ('230221', '230200', '0,230000,230200,', '6690', '0000000080,0000000630,0000006690,', '1', '2', '黑龙江省/齐齐哈尔市/龙江县', '龙江县', '3', '0', 'system', '2018-03-11 15:59:41', 'system', '2018-03-11 15:59:41', null);
INSERT INTO `js_sys_area` VALUES ('230223', '230200', '0,230000,230200,', '6700', '0000000080,0000000630,0000006700,', '1', '2', '黑龙江省/齐齐哈尔市/依安县', '依安县', '3', '0', 'system', '2018-03-11 15:59:41', 'system', '2018-03-11 15:59:41', null);
INSERT INTO `js_sys_area` VALUES ('230224', '230200', '0,230000,230200,', '6710', '0000000080,0000000630,0000006710,', '1', '2', '黑龙江省/齐齐哈尔市/泰来县', '泰来县', '3', '0', 'system', '2018-03-11 15:59:41', 'system', '2018-03-11 15:59:41', null);
INSERT INTO `js_sys_area` VALUES ('230225', '230200', '0,230000,230200,', '6720', '0000000080,0000000630,0000006720,', '1', '2', '黑龙江省/齐齐哈尔市/甘南县', '甘南县', '3', '0', 'system', '2018-03-11 15:59:41', 'system', '2018-03-11 15:59:41', null);
INSERT INTO `js_sys_area` VALUES ('230227', '230200', '0,230000,230200,', '6730', '0000000080,0000000630,0000006730,', '1', '2', '黑龙江省/齐齐哈尔市/富裕县', '富裕县', '3', '0', 'system', '2018-03-11 15:59:41', 'system', '2018-03-11 15:59:41', null);
INSERT INTO `js_sys_area` VALUES ('230229', '230200', '0,230000,230200,', '6740', '0000000080,0000000630,0000006740,', '1', '2', '黑龙江省/齐齐哈尔市/克山县', '克山县', '3', '0', 'system', '2018-03-11 15:59:41', 'system', '2018-03-11 15:59:41', null);
INSERT INTO `js_sys_area` VALUES ('230230', '230200', '0,230000,230200,', '6750', '0000000080,0000000630,0000006750,', '1', '2', '黑龙江省/齐齐哈尔市/克东县', '克东县', '3', '0', 'system', '2018-03-11 15:59:41', 'system', '2018-03-11 15:59:41', null);
INSERT INTO `js_sys_area` VALUES ('230231', '230200', '0,230000,230200,', '6760', '0000000080,0000000630,0000006760,', '1', '2', '黑龙江省/齐齐哈尔市/拜泉县', '拜泉县', '3', '0', 'system', '2018-03-11 15:59:41', 'system', '2018-03-11 15:59:41', null);
INSERT INTO `js_sys_area` VALUES ('230281', '230200', '0,230000,230200,', '6770', '0000000080,0000000630,0000006770,', '1', '2', '黑龙江省/齐齐哈尔市/讷河市', '讷河市', '3', '0', 'system', '2018-03-11 15:59:41', 'system', '2018-03-11 15:59:41', null);
INSERT INTO `js_sys_area` VALUES ('230300', '230000', '0,230000,', '640', '0000000080,0000000640,', '0', '1', '黑龙江省/鸡西市', '鸡西市', '2', '0', 'system', '2018-03-11 15:59:41', 'system', '2018-03-11 15:59:41', null);
INSERT INTO `js_sys_area` VALUES ('230301', '230300', '0,230000,230300,', '6780', '0000000080,0000000640,0000006780,', '1', '2', '黑龙江省/鸡西市/市辖区', '市辖区', '3', '0', 'system', '2018-03-11 15:59:41', 'system', '2018-03-11 15:59:41', null);
INSERT INTO `js_sys_area` VALUES ('230302', '230300', '0,230000,230300,', '6790', '0000000080,0000000640,0000006790,', '1', '2', '黑龙江省/鸡西市/鸡冠区', '鸡冠区', '3', '0', 'system', '2018-03-11 15:59:41', 'system', '2018-03-11 15:59:41', null);
INSERT INTO `js_sys_area` VALUES ('230303', '230300', '0,230000,230300,', '6800', '0000000080,0000000640,0000006800,', '1', '2', '黑龙江省/鸡西市/恒山区', '恒山区', '3', '0', 'system', '2018-03-11 15:59:41', 'system', '2018-03-11 15:59:41', null);
INSERT INTO `js_sys_area` VALUES ('230304', '230300', '0,230000,230300,', '6810', '0000000080,0000000640,0000006810,', '1', '2', '黑龙江省/鸡西市/滴道区', '滴道区', '3', '0', 'system', '2018-03-11 15:59:41', 'system', '2018-03-11 15:59:41', null);
INSERT INTO `js_sys_area` VALUES ('230305', '230300', '0,230000,230300,', '6820', '0000000080,0000000640,0000006820,', '1', '2', '黑龙江省/鸡西市/梨树区', '梨树区', '3', '0', 'system', '2018-03-11 15:59:41', 'system', '2018-03-11 15:59:41', null);
INSERT INTO `js_sys_area` VALUES ('230306', '230300', '0,230000,230300,', '6830', '0000000080,0000000640,0000006830,', '1', '2', '黑龙江省/鸡西市/城子河区', '城子河区', '3', '0', 'system', '2018-03-11 15:59:41', 'system', '2018-03-11 15:59:41', null);
INSERT INTO `js_sys_area` VALUES ('230307', '230300', '0,230000,230300,', '6840', '0000000080,0000000640,0000006840,', '1', '2', '黑龙江省/鸡西市/麻山区', '麻山区', '3', '0', 'system', '2018-03-11 15:59:41', 'system', '2018-03-11 15:59:41', null);
INSERT INTO `js_sys_area` VALUES ('230321', '230300', '0,230000,230300,', '6850', '0000000080,0000000640,0000006850,', '1', '2', '黑龙江省/鸡西市/鸡东县', '鸡东县', '3', '0', 'system', '2018-03-11 15:59:41', 'system', '2018-03-11 15:59:41', null);
INSERT INTO `js_sys_area` VALUES ('230381', '230300', '0,230000,230300,', '6860', '0000000080,0000000640,0000006860,', '1', '2', '黑龙江省/鸡西市/虎林市', '虎林市', '3', '0', 'system', '2018-03-11 15:59:41', 'system', '2018-03-11 15:59:41', null);
INSERT INTO `js_sys_area` VALUES ('230382', '230300', '0,230000,230300,', '6870', '0000000080,0000000640,0000006870,', '1', '2', '黑龙江省/鸡西市/密山市', '密山市', '3', '0', 'system', '2018-03-11 15:59:41', 'system', '2018-03-11 15:59:41', null);
INSERT INTO `js_sys_area` VALUES ('230400', '230000', '0,230000,', '650', '0000000080,0000000650,', '0', '1', '黑龙江省/鹤岗市', '鹤岗市', '2', '0', 'system', '2018-03-11 15:59:41', 'system', '2018-03-11 15:59:41', null);
INSERT INTO `js_sys_area` VALUES ('230401', '230400', '0,230000,230400,', '6880', '0000000080,0000000650,0000006880,', '1', '2', '黑龙江省/鹤岗市/市辖区', '市辖区', '3', '0', 'system', '2018-03-11 15:59:41', 'system', '2018-03-11 15:59:41', null);
INSERT INTO `js_sys_area` VALUES ('230402', '230400', '0,230000,230400,', '6890', '0000000080,0000000650,0000006890,', '1', '2', '黑龙江省/鹤岗市/向阳区', '向阳区', '3', '0', 'system', '2018-03-11 15:59:41', 'system', '2018-03-11 15:59:41', null);
INSERT INTO `js_sys_area` VALUES ('230403', '230400', '0,230000,230400,', '6900', '0000000080,0000000650,0000006900,', '1', '2', '黑龙江省/鹤岗市/工农区', '工农区', '3', '0', 'system', '2018-03-11 15:59:41', 'system', '2018-03-11 15:59:41', null);
INSERT INTO `js_sys_area` VALUES ('230404', '230400', '0,230000,230400,', '6910', '0000000080,0000000650,0000006910,', '1', '2', '黑龙江省/鹤岗市/南山区', '南山区', '3', '0', 'system', '2018-03-11 15:59:41', 'system', '2018-03-11 15:59:41', null);
INSERT INTO `js_sys_area` VALUES ('230405', '230400', '0,230000,230400,', '6920', '0000000080,0000000650,0000006920,', '1', '2', '黑龙江省/鹤岗市/兴安区', '兴安区', '3', '0', 'system', '2018-03-11 15:59:41', 'system', '2018-03-11 15:59:41', null);
INSERT INTO `js_sys_area` VALUES ('230406', '230400', '0,230000,230400,', '6930', '0000000080,0000000650,0000006930,', '1', '2', '黑龙江省/鹤岗市/东山区', '东山区', '3', '0', 'system', '2018-03-11 15:59:41', 'system', '2018-03-11 15:59:41', null);
INSERT INTO `js_sys_area` VALUES ('230407', '230400', '0,230000,230400,', '6940', '0000000080,0000000650,0000006940,', '1', '2', '黑龙江省/鹤岗市/兴山区', '兴山区', '3', '0', 'system', '2018-03-11 15:59:41', 'system', '2018-03-11 15:59:41', null);
INSERT INTO `js_sys_area` VALUES ('230421', '230400', '0,230000,230400,', '6950', '0000000080,0000000650,0000006950,', '1', '2', '黑龙江省/鹤岗市/萝北县', '萝北县', '3', '0', 'system', '2018-03-11 15:59:41', 'system', '2018-03-11 15:59:41', null);
INSERT INTO `js_sys_area` VALUES ('230422', '230400', '0,230000,230400,', '6960', '0000000080,0000000650,0000006960,', '1', '2', '黑龙江省/鹤岗市/绥滨县', '绥滨县', '3', '0', 'system', '2018-03-11 15:59:41', 'system', '2018-03-11 15:59:41', null);
INSERT INTO `js_sys_area` VALUES ('230500', '230000', '0,230000,', '660', '0000000080,0000000660,', '0', '1', '黑龙江省/双鸭山市', '双鸭山市', '2', '0', 'system', '2018-03-11 15:59:41', 'system', '2018-03-11 15:59:41', null);
INSERT INTO `js_sys_area` VALUES ('230501', '230500', '0,230000,230500,', '6970', '0000000080,0000000660,0000006970,', '1', '2', '黑龙江省/双鸭山市/市辖区', '市辖区', '3', '0', 'system', '2018-03-11 15:59:41', 'system', '2018-03-11 15:59:41', null);
INSERT INTO `js_sys_area` VALUES ('230502', '230500', '0,230000,230500,', '6980', '0000000080,0000000660,0000006980,', '1', '2', '黑龙江省/双鸭山市/尖山区', '尖山区', '3', '0', 'system', '2018-03-11 15:59:41', 'system', '2018-03-11 15:59:41', null);
INSERT INTO `js_sys_area` VALUES ('230503', '230500', '0,230000,230500,', '6990', '0000000080,0000000660,0000006990,', '1', '2', '黑龙江省/双鸭山市/岭东区', '岭东区', '3', '0', 'system', '2018-03-11 15:59:41', 'system', '2018-03-11 15:59:41', null);
INSERT INTO `js_sys_area` VALUES ('230505', '230500', '0,230000,230500,', '7000', '0000000080,0000000660,0000007000,', '1', '2', '黑龙江省/双鸭山市/四方台区', '四方台区', '3', '0', 'system', '2018-03-11 15:59:42', 'system', '2018-03-11 15:59:42', null);
INSERT INTO `js_sys_area` VALUES ('230506', '230500', '0,230000,230500,', '7010', '0000000080,0000000660,0000007010,', '1', '2', '黑龙江省/双鸭山市/宝山区', '宝山区', '3', '0', 'system', '2018-03-11 15:59:42', 'system', '2018-03-11 15:59:42', null);
INSERT INTO `js_sys_area` VALUES ('230521', '230500', '0,230000,230500,', '7020', '0000000080,0000000660,0000007020,', '1', '2', '黑龙江省/双鸭山市/集贤县', '集贤县', '3', '0', 'system', '2018-03-11 15:59:42', 'system', '2018-03-11 15:59:42', null);
INSERT INTO `js_sys_area` VALUES ('230522', '230500', '0,230000,230500,', '7030', '0000000080,0000000660,0000007030,', '1', '2', '黑龙江省/双鸭山市/友谊县', '友谊县', '3', '0', 'system', '2018-03-11 15:59:42', 'system', '2018-03-11 15:59:42', null);
INSERT INTO `js_sys_area` VALUES ('230523', '230500', '0,230000,230500,', '7040', '0000000080,0000000660,0000007040,', '1', '2', '黑龙江省/双鸭山市/宝清县', '宝清县', '3', '0', 'system', '2018-03-11 15:59:42', 'system', '2018-03-11 15:59:42', null);
INSERT INTO `js_sys_area` VALUES ('230524', '230500', '0,230000,230500,', '7050', '0000000080,0000000660,0000007050,', '1', '2', '黑龙江省/双鸭山市/饶河县', '饶河县', '3', '0', 'system', '2018-03-11 15:59:42', 'system', '2018-03-11 15:59:42', null);
INSERT INTO `js_sys_area` VALUES ('230600', '230000', '0,230000,', '670', '0000000080,0000000670,', '0', '1', '黑龙江省/大庆市', '大庆市', '2', '0', 'system', '2018-03-11 15:59:42', 'system', '2018-03-11 15:59:42', null);
INSERT INTO `js_sys_area` VALUES ('230601', '230600', '0,230000,230600,', '7060', '0000000080,0000000670,0000007060,', '1', '2', '黑龙江省/大庆市/市辖区', '市辖区', '3', '0', 'system', '2018-03-11 15:59:42', 'system', '2018-03-11 15:59:42', null);
INSERT INTO `js_sys_area` VALUES ('230602', '230600', '0,230000,230600,', '7070', '0000000080,0000000670,0000007070,', '1', '2', '黑龙江省/大庆市/萨尔图区', '萨尔图区', '3', '0', 'system', '2018-03-11 15:59:42', 'system', '2018-03-11 15:59:42', null);
INSERT INTO `js_sys_area` VALUES ('230603', '230600', '0,230000,230600,', '7080', '0000000080,0000000670,0000007080,', '1', '2', '黑龙江省/大庆市/龙凤区', '龙凤区', '3', '0', 'system', '2018-03-11 15:59:42', 'system', '2018-03-11 15:59:42', null);
INSERT INTO `js_sys_area` VALUES ('230604', '230600', '0,230000,230600,', '7090', '0000000080,0000000670,0000007090,', '1', '2', '黑龙江省/大庆市/让胡路区', '让胡路区', '3', '0', 'system', '2018-03-11 15:59:42', 'system', '2018-03-11 15:59:42', null);
INSERT INTO `js_sys_area` VALUES ('230605', '230600', '0,230000,230600,', '7100', '0000000080,0000000670,0000007100,', '1', '2', '黑龙江省/大庆市/红岗区', '红岗区', '3', '0', 'system', '2018-03-11 15:59:42', 'system', '2018-03-11 15:59:42', null);
INSERT INTO `js_sys_area` VALUES ('230606', '230600', '0,230000,230600,', '7110', '0000000080,0000000670,0000007110,', '1', '2', '黑龙江省/大庆市/大同区', '大同区', '3', '0', 'system', '2018-03-11 15:59:43', 'system', '2018-03-11 15:59:43', null);
INSERT INTO `js_sys_area` VALUES ('230621', '230600', '0,230000,230600,', '7120', '0000000080,0000000670,0000007120,', '1', '2', '黑龙江省/大庆市/肇州县', '肇州县', '3', '0', 'system', '2018-03-11 15:59:43', 'system', '2018-03-11 15:59:43', null);
INSERT INTO `js_sys_area` VALUES ('230622', '230600', '0,230000,230600,', '7130', '0000000080,0000000670,0000007130,', '1', '2', '黑龙江省/大庆市/肇源县', '肇源县', '3', '0', 'system', '2018-03-11 15:59:43', 'system', '2018-03-11 15:59:43', null);
INSERT INTO `js_sys_area` VALUES ('230623', '230600', '0,230000,230600,', '7140', '0000000080,0000000670,0000007140,', '1', '2', '黑龙江省/大庆市/林甸县', '林甸县', '3', '0', 'system', '2018-03-11 15:59:43', 'system', '2018-03-11 15:59:43', null);
INSERT INTO `js_sys_area` VALUES ('230624', '230600', '0,230000,230600,', '7150', '0000000080,0000000670,0000007150,', '1', '2', '黑龙江省/大庆市/杜尔伯特蒙古族自治县', '杜尔伯特蒙古族自治县', '3', '0', 'system', '2018-03-11 15:59:43', 'system', '2018-03-11 15:59:43', null);
INSERT INTO `js_sys_area` VALUES ('230700', '230000', '0,230000,', '680', '0000000080,0000000680,', '0', '1', '黑龙江省/伊春市', '伊春市', '2', '0', 'system', '2018-03-11 15:59:43', 'system', '2018-03-11 15:59:43', null);
INSERT INTO `js_sys_area` VALUES ('230701', '230700', '0,230000,230700,', '7160', '0000000080,0000000680,0000007160,', '1', '2', '黑龙江省/伊春市/市辖区', '市辖区', '3', '0', 'system', '2018-03-11 15:59:43', 'system', '2018-03-11 15:59:43', null);
INSERT INTO `js_sys_area` VALUES ('230702', '230700', '0,230000,230700,', '7170', '0000000080,0000000680,0000007170,', '1', '2', '黑龙江省/伊春市/伊春区', '伊春区', '3', '0', 'system', '2018-03-11 15:59:43', 'system', '2018-03-11 15:59:43', null);
INSERT INTO `js_sys_area` VALUES ('230703', '230700', '0,230000,230700,', '7180', '0000000080,0000000680,0000007180,', '1', '2', '黑龙江省/伊春市/南岔区', '南岔区', '3', '0', 'system', '2018-03-11 15:59:43', 'system', '2018-03-11 15:59:43', null);
INSERT INTO `js_sys_area` VALUES ('230704', '230700', '0,230000,230700,', '7190', '0000000080,0000000680,0000007190,', '1', '2', '黑龙江省/伊春市/友好区', '友好区', '3', '0', 'system', '2018-03-11 15:59:43', 'system', '2018-03-11 15:59:43', null);
INSERT INTO `js_sys_area` VALUES ('230705', '230700', '0,230000,230700,', '7200', '0000000080,0000000680,0000007200,', '1', '2', '黑龙江省/伊春市/西林区', '西林区', '3', '0', 'system', '2018-03-11 15:59:43', 'system', '2018-03-11 15:59:43', null);
INSERT INTO `js_sys_area` VALUES ('230706', '230700', '0,230000,230700,', '7210', '0000000080,0000000680,0000007210,', '1', '2', '黑龙江省/伊春市/翠峦区', '翠峦区', '3', '0', 'system', '2018-03-11 15:59:43', 'system', '2018-03-11 15:59:43', null);
INSERT INTO `js_sys_area` VALUES ('230707', '230700', '0,230000,230700,', '7220', '0000000080,0000000680,0000007220,', '1', '2', '黑龙江省/伊春市/新青区', '新青区', '3', '0', 'system', '2018-03-11 15:59:44', 'system', '2018-03-11 15:59:44', null);
INSERT INTO `js_sys_area` VALUES ('230708', '230700', '0,230000,230700,', '7230', '0000000080,0000000680,0000007230,', '1', '2', '黑龙江省/伊春市/美溪区', '美溪区', '3', '0', 'system', '2018-03-11 15:59:44', 'system', '2018-03-11 15:59:44', null);
INSERT INTO `js_sys_area` VALUES ('230709', '230700', '0,230000,230700,', '7240', '0000000080,0000000680,0000007240,', '1', '2', '黑龙江省/伊春市/金山屯区', '金山屯区', '3', '0', 'system', '2018-03-11 15:59:44', 'system', '2018-03-11 15:59:44', null);
INSERT INTO `js_sys_area` VALUES ('230710', '230700', '0,230000,230700,', '7250', '0000000080,0000000680,0000007250,', '1', '2', '黑龙江省/伊春市/五营区', '五营区', '3', '0', 'system', '2018-03-11 15:59:44', 'system', '2018-03-11 15:59:44', null);
INSERT INTO `js_sys_area` VALUES ('230711', '230700', '0,230000,230700,', '7260', '0000000080,0000000680,0000007260,', '1', '2', '黑龙江省/伊春市/乌马河区', '乌马河区', '3', '0', 'system', '2018-03-11 15:59:44', 'system', '2018-03-11 15:59:44', null);
INSERT INTO `js_sys_area` VALUES ('230712', '230700', '0,230000,230700,', '7270', '0000000080,0000000680,0000007270,', '1', '2', '黑龙江省/伊春市/汤旺河区', '汤旺河区', '3', '0', 'system', '2018-03-11 15:59:44', 'system', '2018-03-11 15:59:44', null);
INSERT INTO `js_sys_area` VALUES ('230713', '230700', '0,230000,230700,', '7280', '0000000080,0000000680,0000007280,', '1', '2', '黑龙江省/伊春市/带岭区', '带岭区', '3', '0', 'system', '2018-03-11 15:59:44', 'system', '2018-03-11 15:59:44', null);
INSERT INTO `js_sys_area` VALUES ('230714', '230700', '0,230000,230700,', '7290', '0000000080,0000000680,0000007290,', '1', '2', '黑龙江省/伊春市/乌伊岭区', '乌伊岭区', '3', '0', 'system', '2018-03-11 15:59:44', 'system', '2018-03-11 15:59:44', null);
INSERT INTO `js_sys_area` VALUES ('230715', '230700', '0,230000,230700,', '7300', '0000000080,0000000680,0000007300,', '1', '2', '黑龙江省/伊春市/红星区', '红星区', '3', '0', 'system', '2018-03-11 15:59:44', 'system', '2018-03-11 15:59:44', null);
INSERT INTO `js_sys_area` VALUES ('230716', '230700', '0,230000,230700,', '7310', '0000000080,0000000680,0000007310,', '1', '2', '黑龙江省/伊春市/上甘岭区', '上甘岭区', '3', '0', 'system', '2018-03-11 15:59:44', 'system', '2018-03-11 15:59:44', null);
INSERT INTO `js_sys_area` VALUES ('230722', '230700', '0,230000,230700,', '7320', '0000000080,0000000680,0000007320,', '1', '2', '黑龙江省/伊春市/嘉荫县', '嘉荫县', '3', '0', 'system', '2018-03-11 15:59:44', 'system', '2018-03-11 15:59:44', null);
INSERT INTO `js_sys_area` VALUES ('230781', '230700', '0,230000,230700,', '7330', '0000000080,0000000680,0000007330,', '1', '2', '黑龙江省/伊春市/铁力市', '铁力市', '3', '0', 'system', '2018-03-11 15:59:44', 'system', '2018-03-11 15:59:44', null);
INSERT INTO `js_sys_area` VALUES ('230800', '230000', '0,230000,', '690', '0000000080,0000000690,', '0', '1', '黑龙江省/佳木斯市', '佳木斯市', '2', '0', 'system', '2018-03-11 15:59:44', 'system', '2018-03-11 15:59:44', null);
INSERT INTO `js_sys_area` VALUES ('230801', '230800', '0,230000,230800,', '7340', '0000000080,0000000690,0000007340,', '1', '2', '黑龙江省/佳木斯市/市辖区', '市辖区', '3', '0', 'system', '2018-03-11 15:59:44', 'system', '2018-03-11 15:59:44', null);
INSERT INTO `js_sys_area` VALUES ('230802', '230800', '0,230000,230800,', '7350', '0000000080,0000000690,0000007350,', '1', '2', '黑龙江省/佳木斯市/永红区', '永红区', '3', '0', 'system', '2018-03-11 15:59:44', 'system', '2018-03-11 15:59:44', null);
INSERT INTO `js_sys_area` VALUES ('230803', '230800', '0,230000,230800,', '7360', '0000000080,0000000690,0000007360,', '1', '2', '黑龙江省/佳木斯市/向阳区', '向阳区', '3', '0', 'system', '2018-03-11 15:59:44', 'system', '2018-03-11 15:59:44', null);
INSERT INTO `js_sys_area` VALUES ('230804', '230800', '0,230000,230800,', '7370', '0000000080,0000000690,0000007370,', '1', '2', '黑龙江省/佳木斯市/前进区', '前进区', '3', '0', 'system', '2018-03-11 15:59:44', 'system', '2018-03-11 15:59:44', null);
INSERT INTO `js_sys_area` VALUES ('230805', '230800', '0,230000,230800,', '7380', '0000000080,0000000690,0000007380,', '1', '2', '黑龙江省/佳木斯市/东风区', '东风区', '3', '0', 'system', '2018-03-11 15:59:44', 'system', '2018-03-11 15:59:44', null);
INSERT INTO `js_sys_area` VALUES ('230811', '230800', '0,230000,230800,', '7390', '0000000080,0000000690,0000007390,', '1', '2', '黑龙江省/佳木斯市/郊　区', '郊　区', '3', '0', 'system', '2018-03-11 15:59:44', 'system', '2018-03-11 15:59:44', null);
INSERT INTO `js_sys_area` VALUES ('230822', '230800', '0,230000,230800,', '7400', '0000000080,0000000690,0000007400,', '1', '2', '黑龙江省/佳木斯市/桦南县', '桦南县', '3', '0', 'system', '2018-03-11 15:59:44', 'system', '2018-03-11 15:59:44', null);
INSERT INTO `js_sys_area` VALUES ('230826', '230800', '0,230000,230800,', '7410', '0000000080,0000000690,0000007410,', '1', '2', '黑龙江省/佳木斯市/桦川县', '桦川县', '3', '0', 'system', '2018-03-11 15:59:44', 'system', '2018-03-11 15:59:44', null);
INSERT INTO `js_sys_area` VALUES ('230828', '230800', '0,230000,230800,', '7420', '0000000080,0000000690,0000007420,', '1', '2', '黑龙江省/佳木斯市/汤原县', '汤原县', '3', '0', 'system', '2018-03-11 15:59:44', 'system', '2018-03-11 15:59:44', null);
INSERT INTO `js_sys_area` VALUES ('230833', '230800', '0,230000,230800,', '7430', '0000000080,0000000690,0000007430,', '1', '2', '黑龙江省/佳木斯市/抚远县', '抚远县', '3', '0', 'system', '2018-03-11 15:59:44', 'system', '2018-03-11 15:59:44', null);
INSERT INTO `js_sys_area` VALUES ('230881', '230800', '0,230000,230800,', '7440', '0000000080,0000000690,0000007440,', '1', '2', '黑龙江省/佳木斯市/同江市', '同江市', '3', '0', 'system', '2018-03-11 15:59:44', 'system', '2018-03-11 15:59:44', null);
INSERT INTO `js_sys_area` VALUES ('230882', '230800', '0,230000,230800,', '7450', '0000000080,0000000690,0000007450,', '1', '2', '黑龙江省/佳木斯市/富锦市', '富锦市', '3', '0', 'system', '2018-03-11 15:59:44', 'system', '2018-03-11 15:59:44', null);
INSERT INTO `js_sys_area` VALUES ('230900', '230000', '0,230000,', '700', '0000000080,0000000700,', '0', '1', '黑龙江省/七台河市', '七台河市', '2', '0', 'system', '2018-03-11 15:59:44', 'system', '2018-03-11 15:59:44', null);
INSERT INTO `js_sys_area` VALUES ('230901', '230900', '0,230000,230900,', '7460', '0000000080,0000000700,0000007460,', '1', '2', '黑龙江省/七台河市/市辖区', '市辖区', '3', '0', 'system', '2018-03-11 15:59:44', 'system', '2018-03-11 15:59:44', null);
INSERT INTO `js_sys_area` VALUES ('230902', '230900', '0,230000,230900,', '7470', '0000000080,0000000700,0000007470,', '1', '2', '黑龙江省/七台河市/新兴区', '新兴区', '3', '0', 'system', '2018-03-11 15:59:44', 'system', '2018-03-11 15:59:44', null);
INSERT INTO `js_sys_area` VALUES ('230903', '230900', '0,230000,230900,', '7480', '0000000080,0000000700,0000007480,', '1', '2', '黑龙江省/七台河市/桃山区', '桃山区', '3', '0', 'system', '2018-03-11 15:59:44', 'system', '2018-03-11 15:59:44', null);
INSERT INTO `js_sys_area` VALUES ('230904', '230900', '0,230000,230900,', '7490', '0000000080,0000000700,0000007490,', '1', '2', '黑龙江省/七台河市/茄子河区', '茄子河区', '3', '0', 'system', '2018-03-11 15:59:44', 'system', '2018-03-11 15:59:44', null);
INSERT INTO `js_sys_area` VALUES ('230921', '230900', '0,230000,230900,', '7500', '0000000080,0000000700,0000007500,', '1', '2', '黑龙江省/七台河市/勃利县', '勃利县', '3', '0', 'system', '2018-03-11 15:59:44', 'system', '2018-03-11 15:59:44', null);
INSERT INTO `js_sys_area` VALUES ('231000', '230000', '0,230000,', '710', '0000000080,0000000710,', '0', '1', '黑龙江省/牡丹江市', '牡丹江市', '2', '0', 'system', '2018-03-11 15:59:44', 'system', '2018-03-11 15:59:44', null);
INSERT INTO `js_sys_area` VALUES ('231001', '231000', '0,230000,231000,', '7510', '0000000080,0000000710,0000007510,', '1', '2', '黑龙江省/牡丹江市/市辖区', '市辖区', '3', '0', 'system', '2018-03-11 15:59:44', 'system', '2018-03-11 15:59:44', null);
INSERT INTO `js_sys_area` VALUES ('231002', '231000', '0,230000,231000,', '7520', '0000000080,0000000710,0000007520,', '1', '2', '黑龙江省/牡丹江市/东安区', '东安区', '3', '0', 'system', '2018-03-11 15:59:44', 'system', '2018-03-11 15:59:44', null);
INSERT INTO `js_sys_area` VALUES ('231003', '231000', '0,230000,231000,', '7530', '0000000080,0000000710,0000007530,', '1', '2', '黑龙江省/牡丹江市/阳明区', '阳明区', '3', '0', 'system', '2018-03-11 15:59:44', 'system', '2018-03-11 15:59:44', null);
INSERT INTO `js_sys_area` VALUES ('231004', '231000', '0,230000,231000,', '7540', '0000000080,0000000710,0000007540,', '1', '2', '黑龙江省/牡丹江市/爱民区', '爱民区', '3', '0', 'system', '2018-03-11 15:59:44', 'system', '2018-03-11 15:59:44', null);
INSERT INTO `js_sys_area` VALUES ('231005', '231000', '0,230000,231000,', '7550', '0000000080,0000000710,0000007550,', '1', '2', '黑龙江省/牡丹江市/西安区', '西安区', '3', '0', 'system', '2018-03-11 15:59:44', 'system', '2018-03-11 15:59:44', null);
INSERT INTO `js_sys_area` VALUES ('231024', '231000', '0,230000,231000,', '7560', '0000000080,0000000710,0000007560,', '1', '2', '黑龙江省/牡丹江市/东宁县', '东宁县', '3', '0', 'system', '2018-03-11 15:59:44', 'system', '2018-03-11 15:59:44', null);
INSERT INTO `js_sys_area` VALUES ('231025', '231000', '0,230000,231000,', '7570', '0000000080,0000000710,0000007570,', '1', '2', '黑龙江省/牡丹江市/林口县', '林口县', '3', '0', 'system', '2018-03-11 15:59:44', 'system', '2018-03-11 15:59:44', null);
INSERT INTO `js_sys_area` VALUES ('231081', '231000', '0,230000,231000,', '7580', '0000000080,0000000710,0000007580,', '1', '2', '黑龙江省/牡丹江市/绥芬河市', '绥芬河市', '3', '0', 'system', '2018-03-11 15:59:44', 'system', '2018-03-11 15:59:44', null);
INSERT INTO `js_sys_area` VALUES ('231083', '231000', '0,230000,231000,', '7590', '0000000080,0000000710,0000007590,', '1', '2', '黑龙江省/牡丹江市/海林市', '海林市', '3', '0', 'system', '2018-03-11 15:59:44', 'system', '2018-03-11 15:59:44', null);
INSERT INTO `js_sys_area` VALUES ('231084', '231000', '0,230000,231000,', '7600', '0000000080,0000000710,0000007600,', '1', '2', '黑龙江省/牡丹江市/宁安市', '宁安市', '3', '0', 'system', '2018-03-11 15:59:44', 'system', '2018-03-11 15:59:44', null);
INSERT INTO `js_sys_area` VALUES ('231085', '231000', '0,230000,231000,', '7610', '0000000080,0000000710,0000007610,', '1', '2', '黑龙江省/牡丹江市/穆棱市', '穆棱市', '3', '0', 'system', '2018-03-11 15:59:44', 'system', '2018-03-11 15:59:44', null);
INSERT INTO `js_sys_area` VALUES ('231100', '230000', '0,230000,', '720', '0000000080,0000000720,', '0', '1', '黑龙江省/黑河市', '黑河市', '2', '0', 'system', '2018-03-11 15:59:44', 'system', '2018-03-11 15:59:44', null);
INSERT INTO `js_sys_area` VALUES ('231101', '231100', '0,230000,231100,', '7620', '0000000080,0000000720,0000007620,', '1', '2', '黑龙江省/黑河市/市辖区', '市辖区', '3', '0', 'system', '2018-03-11 15:59:44', 'system', '2018-03-11 15:59:44', null);
INSERT INTO `js_sys_area` VALUES ('231102', '231100', '0,230000,231100,', '7630', '0000000080,0000000720,0000007630,', '1', '2', '黑龙江省/黑河市/爱辉区', '爱辉区', '3', '0', 'system', '2018-03-11 15:59:44', 'system', '2018-03-11 15:59:44', null);
INSERT INTO `js_sys_area` VALUES ('231121', '231100', '0,230000,231100,', '7640', '0000000080,0000000720,0000007640,', '1', '2', '黑龙江省/黑河市/嫩江县', '嫩江县', '3', '0', 'system', '2018-03-11 15:59:44', 'system', '2018-03-11 15:59:44', null);
INSERT INTO `js_sys_area` VALUES ('231123', '231100', '0,230000,231100,', '7650', '0000000080,0000000720,0000007650,', '1', '2', '黑龙江省/黑河市/逊克县', '逊克县', '3', '0', 'system', '2018-03-11 15:59:44', 'system', '2018-03-11 15:59:44', null);
INSERT INTO `js_sys_area` VALUES ('231124', '231100', '0,230000,231100,', '7660', '0000000080,0000000720,0000007660,', '1', '2', '黑龙江省/黑河市/孙吴县', '孙吴县', '3', '0', 'system', '2018-03-11 15:59:44', 'system', '2018-03-11 15:59:44', null);
INSERT INTO `js_sys_area` VALUES ('231181', '231100', '0,230000,231100,', '7670', '0000000080,0000000720,0000007670,', '1', '2', '黑龙江省/黑河市/北安市', '北安市', '3', '0', 'system', '2018-03-11 15:59:44', 'system', '2018-03-11 15:59:44', null);
INSERT INTO `js_sys_area` VALUES ('231182', '231100', '0,230000,231100,', '7680', '0000000080,0000000720,0000007680,', '1', '2', '黑龙江省/黑河市/五大连池市', '五大连池市', '3', '0', 'system', '2018-03-11 15:59:44', 'system', '2018-03-11 15:59:44', null);
INSERT INTO `js_sys_area` VALUES ('231200', '230000', '0,230000,', '730', '0000000080,0000000730,', '0', '1', '黑龙江省/绥化市', '绥化市', '2', '0', 'system', '2018-03-11 15:59:44', 'system', '2018-03-11 15:59:44', null);
INSERT INTO `js_sys_area` VALUES ('231201', '231200', '0,230000,231200,', '7690', '0000000080,0000000730,0000007690,', '1', '2', '黑龙江省/绥化市/市辖区', '市辖区', '3', '0', 'system', '2018-03-11 15:59:44', 'system', '2018-03-11 15:59:44', null);
INSERT INTO `js_sys_area` VALUES ('231202', '231200', '0,230000,231200,', '7700', '0000000080,0000000730,0000007700,', '1', '2', '黑龙江省/绥化市/北林区', '北林区', '3', '0', 'system', '2018-03-11 15:59:44', 'system', '2018-03-11 15:59:44', null);
INSERT INTO `js_sys_area` VALUES ('231221', '231200', '0,230000,231200,', '7710', '0000000080,0000000730,0000007710,', '1', '2', '黑龙江省/绥化市/望奎县', '望奎县', '3', '0', 'system', '2018-03-11 15:59:44', 'system', '2018-03-11 15:59:44', null);
INSERT INTO `js_sys_area` VALUES ('231222', '231200', '0,230000,231200,', '7720', '0000000080,0000000730,0000007720,', '1', '2', '黑龙江省/绥化市/兰西县', '兰西县', '3', '0', 'system', '2018-03-11 15:59:44', 'system', '2018-03-11 15:59:44', null);
INSERT INTO `js_sys_area` VALUES ('231223', '231200', '0,230000,231200,', '7730', '0000000080,0000000730,0000007730,', '1', '2', '黑龙江省/绥化市/青冈县', '青冈县', '3', '0', 'system', '2018-03-11 15:59:45', 'system', '2018-03-11 15:59:45', null);
INSERT INTO `js_sys_area` VALUES ('231224', '231200', '0,230000,231200,', '7740', '0000000080,0000000730,0000007740,', '1', '2', '黑龙江省/绥化市/庆安县', '庆安县', '3', '0', 'system', '2018-03-11 15:59:45', 'system', '2018-03-11 15:59:45', null);
INSERT INTO `js_sys_area` VALUES ('231225', '231200', '0,230000,231200,', '7750', '0000000080,0000000730,0000007750,', '1', '2', '黑龙江省/绥化市/明水县', '明水县', '3', '0', 'system', '2018-03-11 15:59:45', 'system', '2018-03-11 15:59:45', null);
INSERT INTO `js_sys_area` VALUES ('231226', '231200', '0,230000,231200,', '7760', '0000000080,0000000730,0000007760,', '1', '2', '黑龙江省/绥化市/绥棱县', '绥棱县', '3', '0', 'system', '2018-03-11 15:59:45', 'system', '2018-03-11 15:59:45', null);
INSERT INTO `js_sys_area` VALUES ('231281', '231200', '0,230000,231200,', '7770', '0000000080,0000000730,0000007770,', '1', '2', '黑龙江省/绥化市/安达市', '安达市', '3', '0', 'system', '2018-03-11 15:59:45', 'system', '2018-03-11 15:59:45', null);
INSERT INTO `js_sys_area` VALUES ('231282', '231200', '0,230000,231200,', '7780', '0000000080,0000000730,0000007780,', '1', '2', '黑龙江省/绥化市/肇东市', '肇东市', '3', '0', 'system', '2018-03-11 15:59:45', 'system', '2018-03-11 15:59:45', null);
INSERT INTO `js_sys_area` VALUES ('231283', '231200', '0,230000,231200,', '7790', '0000000080,0000000730,0000007790,', '1', '2', '黑龙江省/绥化市/海伦市', '海伦市', '3', '0', 'system', '2018-03-11 15:59:45', 'system', '2018-03-11 15:59:45', null);
INSERT INTO `js_sys_area` VALUES ('232700', '230000', '0,230000,', '740', '0000000080,0000000740,', '0', '1', '黑龙江省/大兴安岭地区', '大兴安岭地区', '2', '0', 'system', '2018-03-11 15:59:45', 'system', '2018-03-11 15:59:45', null);
INSERT INTO `js_sys_area` VALUES ('232721', '232700', '0,230000,232700,', '7800', '0000000080,0000000740,0000007800,', '1', '2', '黑龙江省/大兴安岭地区/呼玛县', '呼玛县', '3', '0', 'system', '2018-03-11 15:59:45', 'system', '2018-03-11 15:59:45', null);
INSERT INTO `js_sys_area` VALUES ('232722', '232700', '0,230000,232700,', '7810', '0000000080,0000000740,0000007810,', '1', '2', '黑龙江省/大兴安岭地区/塔河县', '塔河县', '3', '0', 'system', '2018-03-11 15:59:45', 'system', '2018-03-11 15:59:45', null);
INSERT INTO `js_sys_area` VALUES ('232723', '232700', '0,230000,232700,', '7820', '0000000080,0000000740,0000007820,', '1', '2', '黑龙江省/大兴安岭地区/漠河县', '漠河县', '3', '0', 'system', '2018-03-11 15:59:45', 'system', '2018-03-11 15:59:45', null);
INSERT INTO `js_sys_area` VALUES ('310000', '0', '0,', '90', '0000000090,', '0', '0', '上海市', '上海市', '1', '0', 'system', '2018-03-11 15:59:45', 'system', '2018-03-11 15:59:45', null);
INSERT INTO `js_sys_area` VALUES ('310100', '310000', '0,310000,', '750', '0000000090,0000000750,', '0', '1', '上海市/市辖区', '市辖区', '2', '0', 'system', '2018-03-11 15:59:45', 'system', '2018-03-11 15:59:45', null);
INSERT INTO `js_sys_area` VALUES ('310101', '310100', '0,310000,310100,', '7830', '0000000090,0000000750,0000007830,', '1', '2', '上海市/市辖区/黄浦区', '黄浦区', '3', '0', 'system', '2018-03-11 15:59:45', 'system', '2018-03-11 15:59:45', null);
INSERT INTO `js_sys_area` VALUES ('310103', '310100', '0,310000,310100,', '7840', '0000000090,0000000750,0000007840,', '1', '2', '上海市/市辖区/卢湾区', '卢湾区', '3', '0', 'system', '2018-03-11 15:59:45', 'system', '2018-03-11 15:59:45', null);
INSERT INTO `js_sys_area` VALUES ('310104', '310100', '0,310000,310100,', '7850', '0000000090,0000000750,0000007850,', '1', '2', '上海市/市辖区/徐汇区', '徐汇区', '3', '0', 'system', '2018-03-11 15:59:45', 'system', '2018-03-11 15:59:45', null);
INSERT INTO `js_sys_area` VALUES ('310105', '310100', '0,310000,310100,', '7860', '0000000090,0000000750,0000007860,', '1', '2', '上海市/市辖区/长宁区', '长宁区', '3', '0', 'system', '2018-03-11 15:59:45', 'system', '2018-03-11 15:59:45', null);
INSERT INTO `js_sys_area` VALUES ('310106', '310100', '0,310000,310100,', '7870', '0000000090,0000000750,0000007870,', '1', '2', '上海市/市辖区/静安区', '静安区', '3', '0', 'system', '2018-03-11 15:59:45', 'system', '2018-03-11 15:59:45', null);
INSERT INTO `js_sys_area` VALUES ('310107', '310100', '0,310000,310100,', '7880', '0000000090,0000000750,0000007880,', '1', '2', '上海市/市辖区/普陀区', '普陀区', '3', '0', 'system', '2018-03-11 15:59:45', 'system', '2018-03-11 15:59:45', null);
INSERT INTO `js_sys_area` VALUES ('310108', '310100', '0,310000,310100,', '7890', '0000000090,0000000750,0000007890,', '1', '2', '上海市/市辖区/闸北区', '闸北区', '3', '0', 'system', '2018-03-11 15:59:45', 'system', '2018-03-11 15:59:45', null);
INSERT INTO `js_sys_area` VALUES ('310109', '310100', '0,310000,310100,', '7900', '0000000090,0000000750,0000007900,', '1', '2', '上海市/市辖区/虹口区', '虹口区', '3', '0', 'system', '2018-03-11 15:59:45', 'system', '2018-03-11 15:59:45', null);
INSERT INTO `js_sys_area` VALUES ('310110', '310100', '0,310000,310100,', '7910', '0000000090,0000000750,0000007910,', '1', '2', '上海市/市辖区/杨浦区', '杨浦区', '3', '0', 'system', '2018-03-11 15:59:45', 'system', '2018-03-11 15:59:45', null);
INSERT INTO `js_sys_area` VALUES ('310112', '310100', '0,310000,310100,', '7920', '0000000090,0000000750,0000007920,', '1', '2', '上海市/市辖区/闵行区', '闵行区', '3', '0', 'system', '2018-03-11 15:59:45', 'system', '2018-03-11 15:59:45', null);
INSERT INTO `js_sys_area` VALUES ('310113', '310100', '0,310000,310100,', '7930', '0000000090,0000000750,0000007930,', '1', '2', '上海市/市辖区/宝山区', '宝山区', '3', '0', 'system', '2018-03-11 15:59:45', 'system', '2018-03-11 15:59:45', null);
INSERT INTO `js_sys_area` VALUES ('310114', '310100', '0,310000,310100,', '7940', '0000000090,0000000750,0000007940,', '1', '2', '上海市/市辖区/嘉定区', '嘉定区', '3', '0', 'system', '2018-03-11 15:59:45', 'system', '2018-03-11 15:59:45', null);
INSERT INTO `js_sys_area` VALUES ('310115', '310100', '0,310000,310100,', '7950', '0000000090,0000000750,0000007950,', '1', '2', '上海市/市辖区/浦东新区', '浦东新区', '3', '0', 'system', '2018-03-11 15:59:45', 'system', '2018-03-11 15:59:45', null);
INSERT INTO `js_sys_area` VALUES ('310116', '310100', '0,310000,310100,', '7960', '0000000090,0000000750,0000007960,', '1', '2', '上海市/市辖区/金山区', '金山区', '3', '0', 'system', '2018-03-11 15:59:45', 'system', '2018-03-11 15:59:45', null);
INSERT INTO `js_sys_area` VALUES ('310117', '310100', '0,310000,310100,', '7970', '0000000090,0000000750,0000007970,', '1', '2', '上海市/市辖区/松江区', '松江区', '3', '0', 'system', '2018-03-11 15:59:45', 'system', '2018-03-11 15:59:45', null);
INSERT INTO `js_sys_area` VALUES ('310118', '310100', '0,310000,310100,', '7980', '0000000090,0000000750,0000007980,', '1', '2', '上海市/市辖区/青浦区', '青浦区', '3', '0', 'system', '2018-03-11 15:59:45', 'system', '2018-03-11 15:59:45', null);
INSERT INTO `js_sys_area` VALUES ('310119', '310100', '0,310000,310100,', '7990', '0000000090,0000000750,0000007990,', '1', '2', '上海市/市辖区/南汇区', '南汇区', '3', '0', 'system', '2018-03-11 15:59:45', 'system', '2018-03-11 15:59:45', null);
INSERT INTO `js_sys_area` VALUES ('310120', '310100', '0,310000,310100,', '8000', '0000000090,0000000750,0000008000,', '1', '2', '上海市/市辖区/奉贤区', '奉贤区', '3', '0', 'system', '2018-03-11 15:59:45', 'system', '2018-03-11 15:59:45', null);
INSERT INTO `js_sys_area` VALUES ('310200', '310000', '0,310000,', '760', '0000000090,0000000760,', '0', '1', '上海市/县', '县', '2', '0', 'system', '2018-03-11 15:59:45', 'system', '2018-03-11 15:59:45', null);
INSERT INTO `js_sys_area` VALUES ('310230', '310200', '0,310000,310200,', '8010', '0000000090,0000000760,0000008010,', '1', '2', '上海市/县/崇明县', '崇明县', '3', '0', 'system', '2018-03-11 15:59:45', 'system', '2018-03-11 15:59:45', null);
INSERT INTO `js_sys_area` VALUES ('320000', '0', '0,', '100', '0000000100,', '0', '0', '江苏省', '江苏省', '1', '0', 'system', '2018-03-11 15:59:45', 'system', '2018-03-11 15:59:45', null);
INSERT INTO `js_sys_area` VALUES ('320100', '320000', '0,320000,', '770', '0000000100,0000000770,', '0', '1', '江苏省/南京市', '南京市', '2', '0', 'system', '2018-03-11 15:59:45', 'system', '2018-03-11 15:59:45', null);
INSERT INTO `js_sys_area` VALUES ('320101', '320100', '0,320000,320100,', '8020', '0000000100,0000000770,0000008020,', '1', '2', '江苏省/南京市/市辖区', '市辖区', '3', '0', 'system', '2018-03-11 15:59:45', 'system', '2018-03-11 15:59:45', null);
INSERT INTO `js_sys_area` VALUES ('320102', '320100', '0,320000,320100,', '8030', '0000000100,0000000770,0000008030,', '1', '2', '江苏省/南京市/玄武区', '玄武区', '3', '0', 'system', '2018-03-11 15:59:45', 'system', '2018-03-11 15:59:45', null);
INSERT INTO `js_sys_area` VALUES ('320103', '320100', '0,320000,320100,', '8040', '0000000100,0000000770,0000008040,', '1', '2', '江苏省/南京市/白下区', '白下区', '3', '0', 'system', '2018-03-11 15:59:45', 'system', '2018-03-11 15:59:45', null);
INSERT INTO `js_sys_area` VALUES ('320104', '320100', '0,320000,320100,', '8050', '0000000100,0000000770,0000008050,', '1', '2', '江苏省/南京市/秦淮区', '秦淮区', '3', '0', 'system', '2018-03-11 15:59:45', 'system', '2018-03-11 15:59:45', null);
INSERT INTO `js_sys_area` VALUES ('320105', '320100', '0,320000,320100,', '8060', '0000000100,0000000770,0000008060,', '1', '2', '江苏省/南京市/建邺区', '建邺区', '3', '0', 'system', '2018-03-11 15:59:45', 'system', '2018-03-11 15:59:45', null);
INSERT INTO `js_sys_area` VALUES ('320106', '320100', '0,320000,320100,', '8070', '0000000100,0000000770,0000008070,', '1', '2', '江苏省/南京市/鼓楼区', '鼓楼区', '3', '0', 'system', '2018-03-11 15:59:45', 'system', '2018-03-11 15:59:45', null);
INSERT INTO `js_sys_area` VALUES ('320107', '320100', '0,320000,320100,', '8080', '0000000100,0000000770,0000008080,', '1', '2', '江苏省/南京市/下关区', '下关区', '3', '0', 'system', '2018-03-11 15:59:45', 'system', '2018-03-11 15:59:45', null);
INSERT INTO `js_sys_area` VALUES ('320111', '320100', '0,320000,320100,', '8090', '0000000100,0000000770,0000008090,', '1', '2', '江苏省/南京市/浦口区', '浦口区', '3', '0', 'system', '2018-03-11 15:59:45', 'system', '2018-03-11 15:59:45', null);
INSERT INTO `js_sys_area` VALUES ('320113', '320100', '0,320000,320100,', '8100', '0000000100,0000000770,0000008100,', '1', '2', '江苏省/南京市/栖霞区', '栖霞区', '3', '0', 'system', '2018-03-11 15:59:45', 'system', '2018-03-11 15:59:45', null);
INSERT INTO `js_sys_area` VALUES ('320114', '320100', '0,320000,320100,', '8110', '0000000100,0000000770,0000008110,', '1', '2', '江苏省/南京市/雨花台区', '雨花台区', '3', '0', 'system', '2018-03-11 15:59:45', 'system', '2018-03-11 15:59:45', null);
INSERT INTO `js_sys_area` VALUES ('320115', '320100', '0,320000,320100,', '8120', '0000000100,0000000770,0000008120,', '1', '2', '江苏省/南京市/江宁区', '江宁区', '3', '0', 'system', '2018-03-11 15:59:45', 'system', '2018-03-11 15:59:45', null);
INSERT INTO `js_sys_area` VALUES ('320116', '320100', '0,320000,320100,', '8130', '0000000100,0000000770,0000008130,', '1', '2', '江苏省/南京市/六合区', '六合区', '3', '0', 'system', '2018-03-11 15:59:45', 'system', '2018-03-11 15:59:45', null);
INSERT INTO `js_sys_area` VALUES ('320124', '320100', '0,320000,320100,', '8140', '0000000100,0000000770,0000008140,', '1', '2', '江苏省/南京市/溧水县', '溧水县', '3', '0', 'system', '2018-03-11 15:59:45', 'system', '2018-03-11 15:59:45', null);
INSERT INTO `js_sys_area` VALUES ('320125', '320100', '0,320000,320100,', '8150', '0000000100,0000000770,0000008150,', '1', '2', '江苏省/南京市/高淳县', '高淳县', '3', '0', 'system', '2018-03-11 15:59:45', 'system', '2018-03-11 15:59:45', null);
INSERT INTO `js_sys_area` VALUES ('320200', '320000', '0,320000,', '780', '0000000100,0000000780,', '0', '1', '江苏省/无锡市', '无锡市', '2', '0', 'system', '2018-03-11 15:59:45', 'system', '2018-03-11 15:59:45', null);
INSERT INTO `js_sys_area` VALUES ('320201', '320200', '0,320000,320200,', '8160', '0000000100,0000000780,0000008160,', '1', '2', '江苏省/无锡市/市辖区', '市辖区', '3', '0', 'system', '2018-03-11 15:59:45', 'system', '2018-03-11 15:59:45', null);
INSERT INTO `js_sys_area` VALUES ('320202', '320200', '0,320000,320200,', '8170', '0000000100,0000000780,0000008170,', '1', '2', '江苏省/无锡市/崇安区', '崇安区', '3', '0', 'system', '2018-03-11 15:59:45', 'system', '2018-03-11 15:59:45', null);
INSERT INTO `js_sys_area` VALUES ('320203', '320200', '0,320000,320200,', '8180', '0000000100,0000000780,0000008180,', '1', '2', '江苏省/无锡市/南长区', '南长区', '3', '0', 'system', '2018-03-11 15:59:45', 'system', '2018-03-11 15:59:45', null);
INSERT INTO `js_sys_area` VALUES ('320204', '320200', '0,320000,320200,', '8190', '0000000100,0000000780,0000008190,', '1', '2', '江苏省/无锡市/北塘区', '北塘区', '3', '0', 'system', '2018-03-11 15:59:45', 'system', '2018-03-11 15:59:45', null);
INSERT INTO `js_sys_area` VALUES ('320205', '320200', '0,320000,320200,', '8200', '0000000100,0000000780,0000008200,', '1', '2', '江苏省/无锡市/锡山区', '锡山区', '3', '0', 'system', '2018-03-11 15:59:45', 'system', '2018-03-11 15:59:45', null);
INSERT INTO `js_sys_area` VALUES ('320206', '320200', '0,320000,320200,', '8210', '0000000100,0000000780,0000008210,', '1', '2', '江苏省/无锡市/惠山区', '惠山区', '3', '0', 'system', '2018-03-11 15:59:45', 'system', '2018-03-11 15:59:45', null);
INSERT INTO `js_sys_area` VALUES ('320211', '320200', '0,320000,320200,', '8220', '0000000100,0000000780,0000008220,', '1', '2', '江苏省/无锡市/滨湖区', '滨湖区', '3', '0', 'system', '2018-03-11 15:59:45', 'system', '2018-03-11 15:59:45', null);
INSERT INTO `js_sys_area` VALUES ('320281', '320200', '0,320000,320200,', '8230', '0000000100,0000000780,0000008230,', '1', '2', '江苏省/无锡市/江阴市', '江阴市', '3', '0', 'system', '2018-03-11 15:59:45', 'system', '2018-03-11 15:59:45', null);
INSERT INTO `js_sys_area` VALUES ('320282', '320200', '0,320000,320200,', '8240', '0000000100,0000000780,0000008240,', '1', '2', '江苏省/无锡市/宜兴市', '宜兴市', '3', '0', 'system', '2018-03-11 15:59:45', 'system', '2018-03-11 15:59:45', null);
INSERT INTO `js_sys_area` VALUES ('320300', '320000', '0,320000,', '790', '0000000100,0000000790,', '0', '1', '江苏省/徐州市', '徐州市', '2', '0', 'system', '2018-03-11 15:59:46', 'system', '2018-03-11 15:59:45', null);
INSERT INTO `js_sys_area` VALUES ('320301', '320300', '0,320000,320300,', '8250', '0000000100,0000000790,0000008250,', '1', '2', '江苏省/徐州市/市辖区', '市辖区', '3', '0', 'system', '2018-03-11 15:59:45', 'system', '2018-03-11 15:59:45', null);
INSERT INTO `js_sys_area` VALUES ('320302', '320300', '0,320000,320300,', '8260', '0000000100,0000000790,0000008260,', '1', '2', '江苏省/徐州市/鼓楼区', '鼓楼区', '3', '0', 'system', '2018-03-11 15:59:46', 'system', '2018-03-11 15:59:46', null);
INSERT INTO `js_sys_area` VALUES ('320303', '320300', '0,320000,320300,', '8270', '0000000100,0000000790,0000008270,', '1', '2', '江苏省/徐州市/云龙区', '云龙区', '3', '0', 'system', '2018-03-11 15:59:46', 'system', '2018-03-11 15:59:46', null);
INSERT INTO `js_sys_area` VALUES ('320304', '320300', '0,320000,320300,', '8280', '0000000100,0000000790,0000008280,', '1', '2', '江苏省/徐州市/九里区', '九里区', '3', '0', 'system', '2018-03-11 15:59:46', 'system', '2018-03-11 15:59:46', null);
INSERT INTO `js_sys_area` VALUES ('320305', '320300', '0,320000,320300,', '8290', '0000000100,0000000790,0000008290,', '1', '2', '江苏省/徐州市/贾汪区', '贾汪区', '3', '0', 'system', '2018-03-11 15:59:46', 'system', '2018-03-11 15:59:46', null);
INSERT INTO `js_sys_area` VALUES ('320311', '320300', '0,320000,320300,', '8300', '0000000100,0000000790,0000008300,', '1', '2', '江苏省/徐州市/泉山区', '泉山区', '3', '0', 'system', '2018-03-11 15:59:46', 'system', '2018-03-11 15:59:46', null);
INSERT INTO `js_sys_area` VALUES ('320321', '320300', '0,320000,320300,', '8310', '0000000100,0000000790,0000008310,', '1', '2', '江苏省/徐州市/丰　县', '丰　县', '3', '0', 'system', '2018-03-11 15:59:46', 'system', '2018-03-11 15:59:46', null);
INSERT INTO `js_sys_area` VALUES ('320322', '320300', '0,320000,320300,', '8320', '0000000100,0000000790,0000008320,', '1', '2', '江苏省/徐州市/沛　县', '沛　县', '3', '0', 'system', '2018-03-11 15:59:46', 'system', '2018-03-11 15:59:46', null);
INSERT INTO `js_sys_area` VALUES ('320323', '320300', '0,320000,320300,', '8330', '0000000100,0000000790,0000008330,', '1', '2', '江苏省/徐州市/铜山县', '铜山县', '3', '0', 'system', '2018-03-11 15:59:46', 'system', '2018-03-11 15:59:46', null);
INSERT INTO `js_sys_area` VALUES ('320324', '320300', '0,320000,320300,', '8340', '0000000100,0000000790,0000008340,', '1', '2', '江苏省/徐州市/睢宁县', '睢宁县', '3', '0', 'system', '2018-03-11 15:59:46', 'system', '2018-03-11 15:59:46', null);
INSERT INTO `js_sys_area` VALUES ('320381', '320300', '0,320000,320300,', '8350', '0000000100,0000000790,0000008350,', '1', '2', '江苏省/徐州市/新沂市', '新沂市', '3', '0', 'system', '2018-03-11 15:59:46', 'system', '2018-03-11 15:59:46', null);
INSERT INTO `js_sys_area` VALUES ('320382', '320300', '0,320000,320300,', '8360', '0000000100,0000000790,0000008360,', '1', '2', '江苏省/徐州市/邳州市', '邳州市', '3', '0', 'system', '2018-03-11 15:59:46', 'system', '2018-03-11 15:59:46', null);
INSERT INTO `js_sys_area` VALUES ('320400', '320000', '0,320000,', '800', '0000000100,0000000800,', '0', '1', '江苏省/常州市', '常州市', '2', '0', 'system', '2018-03-11 15:59:46', 'system', '2018-03-11 15:59:46', null);
INSERT INTO `js_sys_area` VALUES ('320401', '320400', '0,320000,320400,', '8370', '0000000100,0000000800,0000008370,', '1', '2', '江苏省/常州市/市辖区', '市辖区', '3', '0', 'system', '2018-03-11 15:59:46', 'system', '2018-03-11 15:59:46', null);
INSERT INTO `js_sys_area` VALUES ('320402', '320400', '0,320000,320400,', '8380', '0000000100,0000000800,0000008380,', '1', '2', '江苏省/常州市/天宁区', '天宁区', '3', '0', 'system', '2018-03-11 15:59:46', 'system', '2018-03-11 15:59:46', null);
INSERT INTO `js_sys_area` VALUES ('320404', '320400', '0,320000,320400,', '8390', '0000000100,0000000800,0000008390,', '1', '2', '江苏省/常州市/钟楼区', '钟楼区', '3', '0', 'system', '2018-03-11 15:59:46', 'system', '2018-03-11 15:59:46', null);
INSERT INTO `js_sys_area` VALUES ('320405', '320400', '0,320000,320400,', '8400', '0000000100,0000000800,0000008400,', '1', '2', '江苏省/常州市/戚墅堰区', '戚墅堰区', '3', '0', 'system', '2018-03-11 15:59:46', 'system', '2018-03-11 15:59:46', null);
INSERT INTO `js_sys_area` VALUES ('320411', '320400', '0,320000,320400,', '8410', '0000000100,0000000800,0000008410,', '1', '2', '江苏省/常州市/新北区', '新北区', '3', '0', 'system', '2018-03-11 15:59:46', 'system', '2018-03-11 15:59:46', null);
INSERT INTO `js_sys_area` VALUES ('320412', '320400', '0,320000,320400,', '8420', '0000000100,0000000800,0000008420,', '1', '2', '江苏省/常州市/武进区', '武进区', '3', '0', 'system', '2018-03-11 15:59:46', 'system', '2018-03-11 15:59:46', null);
INSERT INTO `js_sys_area` VALUES ('320481', '320400', '0,320000,320400,', '8430', '0000000100,0000000800,0000008430,', '1', '2', '江苏省/常州市/溧阳市', '溧阳市', '3', '0', 'system', '2018-03-11 15:59:46', 'system', '2018-03-11 15:59:46', null);
INSERT INTO `js_sys_area` VALUES ('320482', '320400', '0,320000,320400,', '8440', '0000000100,0000000800,0000008440,', '1', '2', '江苏省/常州市/金坛市', '金坛市', '3', '0', 'system', '2018-03-11 15:59:46', 'system', '2018-03-11 15:59:46', null);
INSERT INTO `js_sys_area` VALUES ('320500', '320000', '0,320000,', '810', '0000000100,0000000810,', '0', '1', '江苏省/苏州市', '苏州市', '2', '0', 'system', '2018-03-11 15:59:46', 'system', '2018-03-11 15:59:46', null);
INSERT INTO `js_sys_area` VALUES ('320501', '320500', '0,320000,320500,', '8450', '0000000100,0000000810,0000008450,', '1', '2', '江苏省/苏州市/市辖区', '市辖区', '3', '0', 'system', '2018-03-11 15:59:46', 'system', '2018-03-11 15:59:46', null);
INSERT INTO `js_sys_area` VALUES ('320502', '320500', '0,320000,320500,', '8460', '0000000100,0000000810,0000008460,', '1', '2', '江苏省/苏州市/沧浪区', '沧浪区', '3', '0', 'system', '2018-03-11 15:59:46', 'system', '2018-03-11 15:59:46', null);
INSERT INTO `js_sys_area` VALUES ('320503', '320500', '0,320000,320500,', '8470', '0000000100,0000000810,0000008470,', '1', '2', '江苏省/苏州市/平江区', '平江区', '3', '0', 'system', '2018-03-11 15:59:46', 'system', '2018-03-11 15:59:46', null);
INSERT INTO `js_sys_area` VALUES ('320504', '320500', '0,320000,320500,', '8480', '0000000100,0000000810,0000008480,', '1', '2', '江苏省/苏州市/金阊区', '金阊区', '3', '0', 'system', '2018-03-11 15:59:46', 'system', '2018-03-11 15:59:46', null);
INSERT INTO `js_sys_area` VALUES ('320505', '320500', '0,320000,320500,', '8490', '0000000100,0000000810,0000008490,', '1', '2', '江苏省/苏州市/虎丘区', '虎丘区', '3', '0', 'system', '2018-03-11 15:59:46', 'system', '2018-03-11 15:59:46', null);
INSERT INTO `js_sys_area` VALUES ('320506', '320500', '0,320000,320500,', '8500', '0000000100,0000000810,0000008500,', '1', '2', '江苏省/苏州市/吴中区', '吴中区', '3', '0', 'system', '2018-03-11 15:59:46', 'system', '2018-03-11 15:59:46', null);
INSERT INTO `js_sys_area` VALUES ('320507', '320500', '0,320000,320500,', '8510', '0000000100,0000000810,0000008510,', '1', '2', '江苏省/苏州市/相城区', '相城区', '3', '0', 'system', '2018-03-11 15:59:46', 'system', '2018-03-11 15:59:46', null);
INSERT INTO `js_sys_area` VALUES ('320581', '320500', '0,320000,320500,', '8520', '0000000100,0000000810,0000008520,', '1', '2', '江苏省/苏州市/常熟市', '常熟市', '3', '0', 'system', '2018-03-11 15:59:46', 'system', '2018-03-11 15:59:46', null);
INSERT INTO `js_sys_area` VALUES ('320582', '320500', '0,320000,320500,', '8530', '0000000100,0000000810,0000008530,', '1', '2', '江苏省/苏州市/张家港市', '张家港市', '3', '0', 'system', '2018-03-11 15:59:46', 'system', '2018-03-11 15:59:46', null);
INSERT INTO `js_sys_area` VALUES ('320583', '320500', '0,320000,320500,', '8540', '0000000100,0000000810,0000008540,', '1', '2', '江苏省/苏州市/昆山市', '昆山市', '3', '0', 'system', '2018-03-11 15:59:46', 'system', '2018-03-11 15:59:46', null);
INSERT INTO `js_sys_area` VALUES ('320584', '320500', '0,320000,320500,', '8550', '0000000100,0000000810,0000008550,', '1', '2', '江苏省/苏州市/吴江市', '吴江市', '3', '0', 'system', '2018-03-11 15:59:46', 'system', '2018-03-11 15:59:46', null);
INSERT INTO `js_sys_area` VALUES ('320585', '320500', '0,320000,320500,', '8560', '0000000100,0000000810,0000008560,', '1', '2', '江苏省/苏州市/太仓市', '太仓市', '3', '0', 'system', '2018-03-11 15:59:46', 'system', '2018-03-11 15:59:46', null);
INSERT INTO `js_sys_area` VALUES ('320600', '320000', '0,320000,', '820', '0000000100,0000000820,', '0', '1', '江苏省/南通市', '南通市', '2', '0', 'system', '2018-03-11 15:59:46', 'system', '2018-03-11 15:59:46', null);
INSERT INTO `js_sys_area` VALUES ('320601', '320600', '0,320000,320600,', '8570', '0000000100,0000000820,0000008570,', '1', '2', '江苏省/南通市/市辖区', '市辖区', '3', '0', 'system', '2018-03-11 15:59:46', 'system', '2018-03-11 15:59:46', null);
INSERT INTO `js_sys_area` VALUES ('320602', '320600', '0,320000,320600,', '8580', '0000000100,0000000820,0000008580,', '1', '2', '江苏省/南通市/崇川区', '崇川区', '3', '0', 'system', '2018-03-11 15:59:46', 'system', '2018-03-11 15:59:46', null);
INSERT INTO `js_sys_area` VALUES ('320611', '320600', '0,320000,320600,', '8590', '0000000100,0000000820,0000008590,', '1', '2', '江苏省/南通市/港闸区', '港闸区', '3', '0', 'system', '2018-03-11 15:59:46', 'system', '2018-03-11 15:59:46', null);
INSERT INTO `js_sys_area` VALUES ('320621', '320600', '0,320000,320600,', '8600', '0000000100,0000000820,0000008600,', '1', '2', '江苏省/南通市/海安县', '海安县', '3', '0', 'system', '2018-03-11 15:59:46', 'system', '2018-03-11 15:59:46', null);
INSERT INTO `js_sys_area` VALUES ('320623', '320600', '0,320000,320600,', '8610', '0000000100,0000000820,0000008610,', '1', '2', '江苏省/南通市/如东县', '如东县', '3', '0', 'system', '2018-03-11 15:59:46', 'system', '2018-03-11 15:59:46', null);
INSERT INTO `js_sys_area` VALUES ('320681', '320600', '0,320000,320600,', '8620', '0000000100,0000000820,0000008620,', '1', '2', '江苏省/南通市/启东市', '启东市', '3', '0', 'system', '2018-03-11 15:59:46', 'system', '2018-03-11 15:59:46', null);
INSERT INTO `js_sys_area` VALUES ('320682', '320600', '0,320000,320600,', '8630', '0000000100,0000000820,0000008630,', '1', '2', '江苏省/南通市/如皋市', '如皋市', '3', '0', 'system', '2018-03-11 15:59:46', 'system', '2018-03-11 15:59:46', null);
INSERT INTO `js_sys_area` VALUES ('320683', '320600', '0,320000,320600,', '8640', '0000000100,0000000820,0000008640,', '1', '2', '江苏省/南通市/通州市', '通州市', '3', '0', 'system', '2018-03-11 15:59:46', 'system', '2018-03-11 15:59:46', null);
INSERT INTO `js_sys_area` VALUES ('320684', '320600', '0,320000,320600,', '8650', '0000000100,0000000820,0000008650,', '1', '2', '江苏省/南通市/海门市', '海门市', '3', '0', 'system', '2018-03-11 15:59:46', 'system', '2018-03-11 15:59:46', null);
INSERT INTO `js_sys_area` VALUES ('320700', '320000', '0,320000,', '830', '0000000100,0000000830,', '0', '1', '江苏省/连云港市', '连云港市', '2', '0', 'system', '2018-03-11 15:59:46', 'system', '2018-03-11 15:59:46', null);
INSERT INTO `js_sys_area` VALUES ('320701', '320700', '0,320000,320700,', '8660', '0000000100,0000000830,0000008660,', '1', '2', '江苏省/连云港市/市辖区', '市辖区', '3', '0', 'system', '2018-03-11 15:59:46', 'system', '2018-03-11 15:59:46', null);
INSERT INTO `js_sys_area` VALUES ('320703', '320700', '0,320000,320700,', '8670', '0000000100,0000000830,0000008670,', '1', '2', '江苏省/连云港市/连云区', '连云区', '3', '0', 'system', '2018-03-11 15:59:46', 'system', '2018-03-11 15:59:46', null);
INSERT INTO `js_sys_area` VALUES ('320705', '320700', '0,320000,320700,', '8680', '0000000100,0000000830,0000008680,', '1', '2', '江苏省/连云港市/新浦区', '新浦区', '3', '0', 'system', '2018-03-11 15:59:46', 'system', '2018-03-11 15:59:46', null);
INSERT INTO `js_sys_area` VALUES ('320706', '320700', '0,320000,320700,', '8690', '0000000100,0000000830,0000008690,', '1', '2', '江苏省/连云港市/海州区', '海州区', '3', '0', 'system', '2018-03-11 15:59:46', 'system', '2018-03-11 15:59:46', null);
INSERT INTO `js_sys_area` VALUES ('320721', '320700', '0,320000,320700,', '8700', '0000000100,0000000830,0000008700,', '1', '2', '江苏省/连云港市/赣榆县', '赣榆县', '3', '0', 'system', '2018-03-11 15:59:46', 'system', '2018-03-11 15:59:46', null);
INSERT INTO `js_sys_area` VALUES ('320722', '320700', '0,320000,320700,', '8710', '0000000100,0000000830,0000008710,', '1', '2', '江苏省/连云港市/东海县', '东海县', '3', '0', 'system', '2018-03-11 15:59:46', 'system', '2018-03-11 15:59:46', null);
INSERT INTO `js_sys_area` VALUES ('320723', '320700', '0,320000,320700,', '8720', '0000000100,0000000830,0000008720,', '1', '2', '江苏省/连云港市/灌云县', '灌云县', '3', '0', 'system', '2018-03-11 15:59:46', 'system', '2018-03-11 15:59:46', null);
INSERT INTO `js_sys_area` VALUES ('320724', '320700', '0,320000,320700,', '8730', '0000000100,0000000830,0000008730,', '1', '2', '江苏省/连云港市/灌南县', '灌南县', '3', '0', 'system', '2018-03-11 15:59:46', 'system', '2018-03-11 15:59:46', null);
INSERT INTO `js_sys_area` VALUES ('320800', '320000', '0,320000,', '840', '0000000100,0000000840,', '0', '1', '江苏省/淮安市', '淮安市', '2', '0', 'system', '2018-03-11 15:59:46', 'system', '2018-03-11 15:59:46', null);
INSERT INTO `js_sys_area` VALUES ('320801', '320800', '0,320000,320800,', '8740', '0000000100,0000000840,0000008740,', '1', '2', '江苏省/淮安市/市辖区', '市辖区', '3', '0', 'system', '2018-03-11 15:59:46', 'system', '2018-03-11 15:59:46', null);
INSERT INTO `js_sys_area` VALUES ('320802', '320800', '0,320000,320800,', '8750', '0000000100,0000000840,0000008750,', '1', '2', '江苏省/淮安市/清河区', '清河区', '3', '0', 'system', '2018-03-11 15:59:46', 'system', '2018-03-11 15:59:46', null);
INSERT INTO `js_sys_area` VALUES ('320803', '320800', '0,320000,320800,', '8760', '0000000100,0000000840,0000008760,', '1', '2', '江苏省/淮安市/楚州区', '楚州区', '3', '0', 'system', '2018-03-11 15:59:46', 'system', '2018-03-11 15:59:46', null);
INSERT INTO `js_sys_area` VALUES ('320804', '320800', '0,320000,320800,', '8770', '0000000100,0000000840,0000008770,', '1', '2', '江苏省/淮安市/淮阴区', '淮阴区', '3', '0', 'system', '2018-03-11 15:59:46', 'system', '2018-03-11 15:59:46', null);
INSERT INTO `js_sys_area` VALUES ('320811', '320800', '0,320000,320800,', '8780', '0000000100,0000000840,0000008780,', '1', '2', '江苏省/淮安市/清浦区', '清浦区', '3', '0', 'system', '2018-03-11 15:59:46', 'system', '2018-03-11 15:59:46', null);
INSERT INTO `js_sys_area` VALUES ('320826', '320800', '0,320000,320800,', '8790', '0000000100,0000000840,0000008790,', '1', '2', '江苏省/淮安市/涟水县', '涟水县', '3', '0', 'system', '2018-03-11 15:59:46', 'system', '2018-03-11 15:59:46', null);
INSERT INTO `js_sys_area` VALUES ('320829', '320800', '0,320000,320800,', '8800', '0000000100,0000000840,0000008800,', '1', '2', '江苏省/淮安市/洪泽县', '洪泽县', '3', '0', 'system', '2018-03-11 15:59:46', 'system', '2018-03-11 15:59:46', null);
INSERT INTO `js_sys_area` VALUES ('320830', '320800', '0,320000,320800,', '8810', '0000000100,0000000840,0000008810,', '1', '2', '江苏省/淮安市/盱眙县', '盱眙县', '3', '0', 'system', '2018-03-11 15:59:47', 'system', '2018-03-11 15:59:47', null);
INSERT INTO `js_sys_area` VALUES ('320831', '320800', '0,320000,320800,', '8820', '0000000100,0000000840,0000008820,', '1', '2', '江苏省/淮安市/金湖县', '金湖县', '3', '0', 'system', '2018-03-11 15:59:47', 'system', '2018-03-11 15:59:47', null);
INSERT INTO `js_sys_area` VALUES ('320900', '320000', '0,320000,', '850', '0000000100,0000000850,', '0', '1', '江苏省/盐城市', '盐城市', '2', '0', 'system', '2018-03-11 15:59:47', 'system', '2018-03-11 15:59:47', null);
INSERT INTO `js_sys_area` VALUES ('320901', '320900', '0,320000,320900,', '8830', '0000000100,0000000850,0000008830,', '1', '2', '江苏省/盐城市/市辖区', '市辖区', '3', '0', 'system', '2018-03-11 15:59:47', 'system', '2018-03-11 15:59:47', null);
INSERT INTO `js_sys_area` VALUES ('320902', '320900', '0,320000,320900,', '8840', '0000000100,0000000850,0000008840,', '1', '2', '江苏省/盐城市/亭湖区', '亭湖区', '3', '0', 'system', '2018-03-11 15:59:47', 'system', '2018-03-11 15:59:47', null);
INSERT INTO `js_sys_area` VALUES ('320903', '320900', '0,320000,320900,', '8850', '0000000100,0000000850,0000008850,', '1', '2', '江苏省/盐城市/盐都区', '盐都区', '3', '0', 'system', '2018-03-11 15:59:47', 'system', '2018-03-11 15:59:47', null);
INSERT INTO `js_sys_area` VALUES ('320921', '320900', '0,320000,320900,', '8860', '0000000100,0000000850,0000008860,', '1', '2', '江苏省/盐城市/响水县', '响水县', '3', '0', 'system', '2018-03-11 15:59:47', 'system', '2018-03-11 15:59:47', null);
INSERT INTO `js_sys_area` VALUES ('320922', '320900', '0,320000,320900,', '8870', '0000000100,0000000850,0000008870,', '1', '2', '江苏省/盐城市/滨海县', '滨海县', '3', '0', 'system', '2018-03-11 15:59:47', 'system', '2018-03-11 15:59:47', null);
INSERT INTO `js_sys_area` VALUES ('320923', '320900', '0,320000,320900,', '8880', '0000000100,0000000850,0000008880,', '1', '2', '江苏省/盐城市/阜宁县', '阜宁县', '3', '0', 'system', '2018-03-11 15:59:47', 'system', '2018-03-11 15:59:47', null);
INSERT INTO `js_sys_area` VALUES ('320924', '320900', '0,320000,320900,', '8890', '0000000100,0000000850,0000008890,', '1', '2', '江苏省/盐城市/射阳县', '射阳县', '3', '0', 'system', '2018-03-11 15:59:47', 'system', '2018-03-11 15:59:47', null);
INSERT INTO `js_sys_area` VALUES ('320925', '320900', '0,320000,320900,', '8900', '0000000100,0000000850,0000008900,', '1', '2', '江苏省/盐城市/建湖县', '建湖县', '3', '0', 'system', '2018-03-11 15:59:47', 'system', '2018-03-11 15:59:47', null);
INSERT INTO `js_sys_area` VALUES ('320981', '320900', '0,320000,320900,', '8910', '0000000100,0000000850,0000008910,', '1', '2', '江苏省/盐城市/东台市', '东台市', '3', '0', 'system', '2018-03-11 15:59:47', 'system', '2018-03-11 15:59:47', null);
INSERT INTO `js_sys_area` VALUES ('320982', '320900', '0,320000,320900,', '8920', '0000000100,0000000850,0000008920,', '1', '2', '江苏省/盐城市/大丰市', '大丰市', '3', '0', 'system', '2018-03-11 15:59:47', 'system', '2018-03-11 15:59:47', null);
INSERT INTO `js_sys_area` VALUES ('321000', '320000', '0,320000,', '860', '0000000100,0000000860,', '0', '1', '江苏省/扬州市', '扬州市', '2', '0', 'system', '2018-03-11 15:59:47', 'system', '2018-03-11 15:59:47', null);
INSERT INTO `js_sys_area` VALUES ('321001', '321000', '0,320000,321000,', '8930', '0000000100,0000000860,0000008930,', '1', '2', '江苏省/扬州市/市辖区', '市辖区', '3', '0', 'system', '2018-03-11 15:59:47', 'system', '2018-03-11 15:59:47', null);
INSERT INTO `js_sys_area` VALUES ('321002', '321000', '0,320000,321000,', '8940', '0000000100,0000000860,0000008940,', '1', '2', '江苏省/扬州市/广陵区', '广陵区', '3', '0', 'system', '2018-03-11 15:59:47', 'system', '2018-03-11 15:59:47', null);
INSERT INTO `js_sys_area` VALUES ('321003', '321000', '0,320000,321000,', '8950', '0000000100,0000000860,0000008950,', '1', '2', '江苏省/扬州市/邗江区', '邗江区', '3', '0', 'system', '2018-03-11 15:59:47', 'system', '2018-03-11 15:59:47', null);
INSERT INTO `js_sys_area` VALUES ('321011', '321000', '0,320000,321000,', '8960', '0000000100,0000000860,0000008960,', '1', '2', '江苏省/扬州市/郊　区', '郊　区', '3', '0', 'system', '2018-03-11 15:59:47', 'system', '2018-03-11 15:59:47', null);
INSERT INTO `js_sys_area` VALUES ('321023', '321000', '0,320000,321000,', '8970', '0000000100,0000000860,0000008970,', '1', '2', '江苏省/扬州市/宝应县', '宝应县', '3', '0', 'system', '2018-03-11 15:59:47', 'system', '2018-03-11 15:59:47', null);
INSERT INTO `js_sys_area` VALUES ('321081', '321000', '0,320000,321000,', '8980', '0000000100,0000000860,0000008980,', '1', '2', '江苏省/扬州市/仪征市', '仪征市', '3', '0', 'system', '2018-03-11 15:59:47', 'system', '2018-03-11 15:59:47', null);
INSERT INTO `js_sys_area` VALUES ('321084', '321000', '0,320000,321000,', '8990', '0000000100,0000000860,0000008990,', '1', '2', '江苏省/扬州市/高邮市', '高邮市', '3', '0', 'system', '2018-03-11 15:59:47', 'system', '2018-03-11 15:59:47', null);
INSERT INTO `js_sys_area` VALUES ('321088', '321000', '0,320000,321000,', '9000', '0000000100,0000000860,0000009000,', '1', '2', '江苏省/扬州市/江都市', '江都市', '3', '0', 'system', '2018-03-11 15:59:47', 'system', '2018-03-11 15:59:47', null);
INSERT INTO `js_sys_area` VALUES ('321100', '320000', '0,320000,', '870', '0000000100,0000000870,', '0', '1', '江苏省/镇江市', '镇江市', '2', '0', 'system', '2018-03-11 15:59:47', 'system', '2018-03-11 15:59:47', null);
INSERT INTO `js_sys_area` VALUES ('321101', '321100', '0,320000,321100,', '9010', '0000000100,0000000870,0000009010,', '1', '2', '江苏省/镇江市/市辖区', '市辖区', '3', '0', 'system', '2018-03-11 15:59:47', 'system', '2018-03-11 15:59:47', null);
INSERT INTO `js_sys_area` VALUES ('321102', '321100', '0,320000,321100,', '9020', '0000000100,0000000870,0000009020,', '1', '2', '江苏省/镇江市/京口区', '京口区', '3', '0', 'system', '2018-03-11 15:59:47', 'system', '2018-03-11 15:59:47', null);
INSERT INTO `js_sys_area` VALUES ('321111', '321100', '0,320000,321100,', '9030', '0000000100,0000000870,0000009030,', '1', '2', '江苏省/镇江市/润州区', '润州区', '3', '0', 'system', '2018-03-11 15:59:47', 'system', '2018-03-11 15:59:47', null);
INSERT INTO `js_sys_area` VALUES ('321112', '321100', '0,320000,321100,', '9040', '0000000100,0000000870,0000009040,', '1', '2', '江苏省/镇江市/丹徒区', '丹徒区', '3', '0', 'system', '2018-03-11 15:59:47', 'system', '2018-03-11 15:59:47', null);
INSERT INTO `js_sys_area` VALUES ('321181', '321100', '0,320000,321100,', '9050', '0000000100,0000000870,0000009050,', '1', '2', '江苏省/镇江市/丹阳市', '丹阳市', '3', '0', 'system', '2018-03-11 15:59:47', 'system', '2018-03-11 15:59:47', null);
INSERT INTO `js_sys_area` VALUES ('321182', '321100', '0,320000,321100,', '9060', '0000000100,0000000870,0000009060,', '1', '2', '江苏省/镇江市/扬中市', '扬中市', '3', '0', 'system', '2018-03-11 15:59:47', 'system', '2018-03-11 15:59:47', null);
INSERT INTO `js_sys_area` VALUES ('321183', '321100', '0,320000,321100,', '9070', '0000000100,0000000870,0000009070,', '1', '2', '江苏省/镇江市/句容市', '句容市', '3', '0', 'system', '2018-03-11 15:59:47', 'system', '2018-03-11 15:59:47', null);
INSERT INTO `js_sys_area` VALUES ('321200', '320000', '0,320000,', '880', '0000000100,0000000880,', '0', '1', '江苏省/泰州市', '泰州市', '2', '0', 'system', '2018-03-11 15:59:47', 'system', '2018-03-11 15:59:47', null);
INSERT INTO `js_sys_area` VALUES ('321201', '321200', '0,320000,321200,', '9080', '0000000100,0000000880,0000009080,', '1', '2', '江苏省/泰州市/市辖区', '市辖区', '3', '0', 'system', '2018-03-11 15:59:47', 'system', '2018-03-11 15:59:47', null);
INSERT INTO `js_sys_area` VALUES ('321202', '321200', '0,320000,321200,', '9090', '0000000100,0000000880,0000009090,', '1', '2', '江苏省/泰州市/海陵区', '海陵区', '3', '0', 'system', '2018-03-11 15:59:47', 'system', '2018-03-11 15:59:47', null);
INSERT INTO `js_sys_area` VALUES ('321203', '321200', '0,320000,321200,', '9100', '0000000100,0000000880,0000009100,', '1', '2', '江苏省/泰州市/高港区', '高港区', '3', '0', 'system', '2018-03-11 15:59:47', 'system', '2018-03-11 15:59:47', null);
INSERT INTO `js_sys_area` VALUES ('321281', '321200', '0,320000,321200,', '9110', '0000000100,0000000880,0000009110,', '1', '2', '江苏省/泰州市/兴化市', '兴化市', '3', '0', 'system', '2018-03-11 15:59:47', 'system', '2018-03-11 15:59:47', null);
INSERT INTO `js_sys_area` VALUES ('321282', '321200', '0,320000,321200,', '9120', '0000000100,0000000880,0000009120,', '1', '2', '江苏省/泰州市/靖江市', '靖江市', '3', '0', 'system', '2018-03-11 15:59:47', 'system', '2018-03-11 15:59:47', null);
INSERT INTO `js_sys_area` VALUES ('321283', '321200', '0,320000,321200,', '9130', '0000000100,0000000880,0000009130,', '1', '2', '江苏省/泰州市/泰兴市', '泰兴市', '3', '0', 'system', '2018-03-11 15:59:47', 'system', '2018-03-11 15:59:47', null);
INSERT INTO `js_sys_area` VALUES ('321284', '321200', '0,320000,321200,', '9140', '0000000100,0000000880,0000009140,', '1', '2', '江苏省/泰州市/姜堰市', '姜堰市', '3', '0', 'system', '2018-03-11 15:59:47', 'system', '2018-03-11 15:59:47', null);
INSERT INTO `js_sys_area` VALUES ('321300', '320000', '0,320000,', '890', '0000000100,0000000890,', '0', '1', '江苏省/宿迁市', '宿迁市', '2', '0', 'system', '2018-03-11 15:59:47', 'system', '2018-03-11 15:59:47', null);
INSERT INTO `js_sys_area` VALUES ('321301', '321300', '0,320000,321300,', '9150', '0000000100,0000000890,0000009150,', '1', '2', '江苏省/宿迁市/市辖区', '市辖区', '3', '0', 'system', '2018-03-11 15:59:47', 'system', '2018-03-11 15:59:47', null);
INSERT INTO `js_sys_area` VALUES ('321302', '321300', '0,320000,321300,', '9160', '0000000100,0000000890,0000009160,', '1', '2', '江苏省/宿迁市/宿城区', '宿城区', '3', '0', 'system', '2018-03-11 15:59:47', 'system', '2018-03-11 15:59:47', null);
INSERT INTO `js_sys_area` VALUES ('321311', '321300', '0,320000,321300,', '9170', '0000000100,0000000890,0000009170,', '1', '2', '江苏省/宿迁市/宿豫区', '宿豫区', '3', '0', 'system', '2018-03-11 15:59:47', 'system', '2018-03-11 15:59:47', null);
INSERT INTO `js_sys_area` VALUES ('321322', '321300', '0,320000,321300,', '9180', '0000000100,0000000890,0000009180,', '1', '2', '江苏省/宿迁市/沭阳县', '沭阳县', '3', '0', 'system', '2018-03-11 15:59:47', 'system', '2018-03-11 15:59:47', null);
INSERT INTO `js_sys_area` VALUES ('321323', '321300', '0,320000,321300,', '9190', '0000000100,0000000890,0000009190,', '1', '2', '江苏省/宿迁市/泗阳县', '泗阳县', '3', '0', 'system', '2018-03-11 15:59:47', 'system', '2018-03-11 15:59:47', null);
INSERT INTO `js_sys_area` VALUES ('321324', '321300', '0,320000,321300,', '9200', '0000000100,0000000890,0000009200,', '1', '2', '江苏省/宿迁市/泗洪县', '泗洪县', '3', '0', 'system', '2018-03-11 15:59:47', 'system', '2018-03-11 15:59:47', null);
INSERT INTO `js_sys_area` VALUES ('330000', '0', '0,', '110', '0000000110,', '0', '0', '浙江省', '浙江省', '1', '0', 'system', '2018-03-11 15:59:47', 'system', '2018-03-11 15:59:47', null);
INSERT INTO `js_sys_area` VALUES ('330100', '330000', '0,330000,', '900', '0000000110,0000000900,', '0', '1', '浙江省/杭州市', '杭州市', '2', '0', 'system', '2018-03-11 15:59:47', 'system', '2018-03-11 15:59:47', null);
INSERT INTO `js_sys_area` VALUES ('330101', '330100', '0,330000,330100,', '9210', '0000000110,0000000900,0000009210,', '1', '2', '浙江省/杭州市/市辖区', '市辖区', '3', '0', 'system', '2018-03-11 15:59:47', 'system', '2018-03-11 15:59:47', null);
INSERT INTO `js_sys_area` VALUES ('330102', '330100', '0,330000,330100,', '9220', '0000000110,0000000900,0000009220,', '1', '2', '浙江省/杭州市/上城区', '上城区', '3', '0', 'system', '2018-03-11 15:59:47', 'system', '2018-03-11 15:59:47', null);
INSERT INTO `js_sys_area` VALUES ('330103', '330100', '0,330000,330100,', '9230', '0000000110,0000000900,0000009230,', '1', '2', '浙江省/杭州市/下城区', '下城区', '3', '0', 'system', '2018-03-11 15:59:47', 'system', '2018-03-11 15:59:47', null);
INSERT INTO `js_sys_area` VALUES ('330104', '330100', '0,330000,330100,', '9240', '0000000110,0000000900,0000009240,', '1', '2', '浙江省/杭州市/江干区', '江干区', '3', '0', 'system', '2018-03-11 15:59:47', 'system', '2018-03-11 15:59:47', null);
INSERT INTO `js_sys_area` VALUES ('330105', '330100', '0,330000,330100,', '9250', '0000000110,0000000900,0000009250,', '1', '2', '浙江省/杭州市/拱墅区', '拱墅区', '3', '0', 'system', '2018-03-11 15:59:47', 'system', '2018-03-11 15:59:47', null);
INSERT INTO `js_sys_area` VALUES ('330106', '330100', '0,330000,330100,', '9260', '0000000110,0000000900,0000009260,', '1', '2', '浙江省/杭州市/西湖区', '西湖区', '3', '0', 'system', '2018-03-11 15:59:47', 'system', '2018-03-11 15:59:47', null);
INSERT INTO `js_sys_area` VALUES ('330108', '330100', '0,330000,330100,', '9270', '0000000110,0000000900,0000009270,', '1', '2', '浙江省/杭州市/滨江区', '滨江区', '3', '0', 'system', '2018-03-11 15:59:47', 'system', '2018-03-11 15:59:47', null);
INSERT INTO `js_sys_area` VALUES ('330109', '330100', '0,330000,330100,', '9280', '0000000110,0000000900,0000009280,', '1', '2', '浙江省/杭州市/萧山区', '萧山区', '3', '0', 'system', '2018-03-11 15:59:47', 'system', '2018-03-11 15:59:47', null);
INSERT INTO `js_sys_area` VALUES ('330110', '330100', '0,330000,330100,', '9290', '0000000110,0000000900,0000009290,', '1', '2', '浙江省/杭州市/余杭区', '余杭区', '3', '0', 'system', '2018-03-11 15:59:47', 'system', '2018-03-11 15:59:47', null);
INSERT INTO `js_sys_area` VALUES ('330122', '330100', '0,330000,330100,', '9300', '0000000110,0000000900,0000009300,', '1', '2', '浙江省/杭州市/桐庐县', '桐庐县', '3', '0', 'system', '2018-03-11 15:59:47', 'system', '2018-03-11 15:59:47', null);
INSERT INTO `js_sys_area` VALUES ('330127', '330100', '0,330000,330100,', '9310', '0000000110,0000000900,0000009310,', '1', '2', '浙江省/杭州市/淳安县', '淳安县', '3', '0', 'system', '2018-03-11 15:59:47', 'system', '2018-03-11 15:59:47', null);
INSERT INTO `js_sys_area` VALUES ('330182', '330100', '0,330000,330100,', '9320', '0000000110,0000000900,0000009320,', '1', '2', '浙江省/杭州市/建德市', '建德市', '3', '0', 'system', '2018-03-11 15:59:47', 'system', '2018-03-11 15:59:47', null);
INSERT INTO `js_sys_area` VALUES ('330183', '330100', '0,330000,330100,', '9330', '0000000110,0000000900,0000009330,', '1', '2', '浙江省/杭州市/富阳市', '富阳市', '3', '0', 'system', '2018-03-11 15:59:47', 'system', '2018-03-11 15:59:47', null);
INSERT INTO `js_sys_area` VALUES ('330185', '330100', '0,330000,330100,', '9340', '0000000110,0000000900,0000009340,', '1', '2', '浙江省/杭州市/临安市', '临安市', '3', '0', 'system', '2018-03-11 15:59:47', 'system', '2018-03-11 15:59:47', null);
INSERT INTO `js_sys_area` VALUES ('330200', '330000', '0,330000,', '910', '0000000110,0000000910,', '0', '1', '浙江省/宁波市', '宁波市', '2', '0', 'system', '2018-03-11 15:59:47', 'system', '2018-03-11 15:59:47', null);
INSERT INTO `js_sys_area` VALUES ('330201', '330200', '0,330000,330200,', '9350', '0000000110,0000000910,0000009350,', '1', '2', '浙江省/宁波市/市辖区', '市辖区', '3', '0', 'system', '2018-03-11 15:59:47', 'system', '2018-03-11 15:59:47', null);
INSERT INTO `js_sys_area` VALUES ('330203', '330200', '0,330000,330200,', '9360', '0000000110,0000000910,0000009360,', '1', '2', '浙江省/宁波市/海曙区', '海曙区', '3', '0', 'system', '2018-03-11 15:59:47', 'system', '2018-03-11 15:59:47', null);
INSERT INTO `js_sys_area` VALUES ('330204', '330200', '0,330000,330200,', '9370', '0000000110,0000000910,0000009370,', '1', '2', '浙江省/宁波市/江东区', '江东区', '3', '0', 'system', '2018-03-11 15:59:47', 'system', '2018-03-11 15:59:47', null);
INSERT INTO `js_sys_area` VALUES ('330205', '330200', '0,330000,330200,', '9380', '0000000110,0000000910,0000009380,', '1', '2', '浙江省/宁波市/江北区', '江北区', '3', '0', 'system', '2018-03-11 15:59:47', 'system', '2018-03-11 15:59:47', null);
INSERT INTO `js_sys_area` VALUES ('330206', '330200', '0,330000,330200,', '9390', '0000000110,0000000910,0000009390,', '1', '2', '浙江省/宁波市/北仑区', '北仑区', '3', '0', 'system', '2018-03-11 15:59:47', 'system', '2018-03-11 15:59:47', null);
INSERT INTO `js_sys_area` VALUES ('330211', '330200', '0,330000,330200,', '9400', '0000000110,0000000910,0000009400,', '1', '2', '浙江省/宁波市/镇海区', '镇海区', '3', '0', 'system', '2018-03-11 15:59:47', 'system', '2018-03-11 15:59:47', null);
INSERT INTO `js_sys_area` VALUES ('330212', '330200', '0,330000,330200,', '9410', '0000000110,0000000910,0000009410,', '1', '2', '浙江省/宁波市/鄞州区', '鄞州区', '3', '0', 'system', '2018-03-11 15:59:47', 'system', '2018-03-11 15:59:47', null);
INSERT INTO `js_sys_area` VALUES ('330225', '330200', '0,330000,330200,', '9420', '0000000110,0000000910,0000009420,', '1', '2', '浙江省/宁波市/象山县', '象山县', '3', '0', 'system', '2018-03-11 15:59:47', 'system', '2018-03-11 15:59:47', null);
INSERT INTO `js_sys_area` VALUES ('330226', '330200', '0,330000,330200,', '9430', '0000000110,0000000910,0000009430,', '1', '2', '浙江省/宁波市/宁海县', '宁海县', '3', '0', 'system', '2018-03-11 15:59:47', 'system', '2018-03-11 15:59:47', null);
INSERT INTO `js_sys_area` VALUES ('330281', '330200', '0,330000,330200,', '9440', '0000000110,0000000910,0000009440,', '1', '2', '浙江省/宁波市/余姚市', '余姚市', '3', '0', 'system', '2018-03-11 15:59:47', 'system', '2018-03-11 15:59:47', null);
INSERT INTO `js_sys_area` VALUES ('330282', '330200', '0,330000,330200,', '9450', '0000000110,0000000910,0000009450,', '1', '2', '浙江省/宁波市/慈溪市', '慈溪市', '3', '0', 'system', '2018-03-11 15:59:48', 'system', '2018-03-11 15:59:48', null);
INSERT INTO `js_sys_area` VALUES ('330283', '330200', '0,330000,330200,', '9460', '0000000110,0000000910,0000009460,', '1', '2', '浙江省/宁波市/奉化市', '奉化市', '3', '0', 'system', '2018-03-11 15:59:48', 'system', '2018-03-11 15:59:48', null);
INSERT INTO `js_sys_area` VALUES ('330300', '330000', '0,330000,', '920', '0000000110,0000000920,', '0', '1', '浙江省/温州市', '温州市', '2', '0', 'system', '2018-03-11 15:59:48', 'system', '2018-03-11 15:59:48', null);
INSERT INTO `js_sys_area` VALUES ('330301', '330300', '0,330000,330300,', '9470', '0000000110,0000000920,0000009470,', '1', '2', '浙江省/温州市/市辖区', '市辖区', '3', '0', 'system', '2018-03-11 15:59:48', 'system', '2018-03-11 15:59:48', null);
INSERT INTO `js_sys_area` VALUES ('330302', '330300', '0,330000,330300,', '9480', '0000000110,0000000920,0000009480,', '1', '2', '浙江省/温州市/鹿城区', '鹿城区', '3', '0', 'system', '2018-03-11 15:59:48', 'system', '2018-03-11 15:59:48', null);
INSERT INTO `js_sys_area` VALUES ('330303', '330300', '0,330000,330300,', '9490', '0000000110,0000000920,0000009490,', '1', '2', '浙江省/温州市/龙湾区', '龙湾区', '3', '0', 'system', '2018-03-11 15:59:48', 'system', '2018-03-11 15:59:48', null);
INSERT INTO `js_sys_area` VALUES ('330304', '330300', '0,330000,330300,', '9500', '0000000110,0000000920,0000009500,', '1', '2', '浙江省/温州市/瓯海区', '瓯海区', '3', '0', 'system', '2018-03-11 15:59:48', 'system', '2018-03-11 15:59:48', null);
INSERT INTO `js_sys_area` VALUES ('330322', '330300', '0,330000,330300,', '9510', '0000000110,0000000920,0000009510,', '1', '2', '浙江省/温州市/洞头县', '洞头县', '3', '0', 'system', '2018-03-11 15:59:48', 'system', '2018-03-11 15:59:48', null);
INSERT INTO `js_sys_area` VALUES ('330324', '330300', '0,330000,330300,', '9520', '0000000110,0000000920,0000009520,', '1', '2', '浙江省/温州市/永嘉县', '永嘉县', '3', '0', 'system', '2018-03-11 15:59:48', 'system', '2018-03-11 15:59:48', null);
INSERT INTO `js_sys_area` VALUES ('330326', '330300', '0,330000,330300,', '9530', '0000000110,0000000920,0000009530,', '1', '2', '浙江省/温州市/平阳县', '平阳县', '3', '0', 'system', '2018-03-11 15:59:48', 'system', '2018-03-11 15:59:48', null);
INSERT INTO `js_sys_area` VALUES ('330327', '330300', '0,330000,330300,', '9540', '0000000110,0000000920,0000009540,', '1', '2', '浙江省/温州市/苍南县', '苍南县', '3', '0', 'system', '2018-03-11 15:59:48', 'system', '2018-03-11 15:59:48', null);
INSERT INTO `js_sys_area` VALUES ('330328', '330300', '0,330000,330300,', '9550', '0000000110,0000000920,0000009550,', '1', '2', '浙江省/温州市/文成县', '文成县', '3', '0', 'system', '2018-03-11 15:59:48', 'system', '2018-03-11 15:59:48', null);
INSERT INTO `js_sys_area` VALUES ('330329', '330300', '0,330000,330300,', '9560', '0000000110,0000000920,0000009560,', '1', '2', '浙江省/温州市/泰顺县', '泰顺县', '3', '0', 'system', '2018-03-11 15:59:48', 'system', '2018-03-11 15:59:48', null);
INSERT INTO `js_sys_area` VALUES ('330381', '330300', '0,330000,330300,', '9570', '0000000110,0000000920,0000009570,', '1', '2', '浙江省/温州市/瑞安市', '瑞安市', '3', '0', 'system', '2018-03-11 15:59:48', 'system', '2018-03-11 15:59:48', null);
INSERT INTO `js_sys_area` VALUES ('330382', '330300', '0,330000,330300,', '9580', '0000000110,0000000920,0000009580,', '1', '2', '浙江省/温州市/乐清市', '乐清市', '3', '0', 'system', '2018-03-11 15:59:48', 'system', '2018-03-11 15:59:48', null);
INSERT INTO `js_sys_area` VALUES ('330400', '330000', '0,330000,', '930', '0000000110,0000000930,', '0', '1', '浙江省/嘉兴市', '嘉兴市', '2', '0', 'system', '2018-03-11 15:59:48', 'system', '2018-03-11 15:59:48', null);
INSERT INTO `js_sys_area` VALUES ('330401', '330400', '0,330000,330400,', '9590', '0000000110,0000000930,0000009590,', '1', '2', '浙江省/嘉兴市/市辖区', '市辖区', '3', '0', 'system', '2018-03-11 15:59:48', 'system', '2018-03-11 15:59:48', null);
INSERT INTO `js_sys_area` VALUES ('330402', '330400', '0,330000,330400,', '9600', '0000000110,0000000930,0000009600,', '1', '2', '浙江省/嘉兴市/秀城区', '秀城区', '3', '0', 'system', '2018-03-11 15:59:48', 'system', '2018-03-11 15:59:48', null);
INSERT INTO `js_sys_area` VALUES ('330411', '330400', '0,330000,330400,', '9610', '0000000110,0000000930,0000009610,', '1', '2', '浙江省/嘉兴市/秀洲区', '秀洲区', '3', '0', 'system', '2018-03-11 15:59:48', 'system', '2018-03-11 15:59:48', null);
INSERT INTO `js_sys_area` VALUES ('330421', '330400', '0,330000,330400,', '9620', '0000000110,0000000930,0000009620,', '1', '2', '浙江省/嘉兴市/嘉善县', '嘉善县', '3', '0', 'system', '2018-03-11 15:59:48', 'system', '2018-03-11 15:59:48', null);
INSERT INTO `js_sys_area` VALUES ('330424', '330400', '0,330000,330400,', '9630', '0000000110,0000000930,0000009630,', '1', '2', '浙江省/嘉兴市/海盐县', '海盐县', '3', '0', 'system', '2018-03-11 15:59:48', 'system', '2018-03-11 15:59:48', null);
INSERT INTO `js_sys_area` VALUES ('330481', '330400', '0,330000,330400,', '9640', '0000000110,0000000930,0000009640,', '1', '2', '浙江省/嘉兴市/海宁市', '海宁市', '3', '0', 'system', '2018-03-11 15:59:48', 'system', '2018-03-11 15:59:48', null);
INSERT INTO `js_sys_area` VALUES ('330482', '330400', '0,330000,330400,', '9650', '0000000110,0000000930,0000009650,', '1', '2', '浙江省/嘉兴市/平湖市', '平湖市', '3', '0', 'system', '2018-03-11 15:59:48', 'system', '2018-03-11 15:59:48', null);
INSERT INTO `js_sys_area` VALUES ('330483', '330400', '0,330000,330400,', '9660', '0000000110,0000000930,0000009660,', '1', '2', '浙江省/嘉兴市/桐乡市', '桐乡市', '3', '0', 'system', '2018-03-11 15:59:48', 'system', '2018-03-11 15:59:48', null);
INSERT INTO `js_sys_area` VALUES ('330500', '330000', '0,330000,', '940', '0000000110,0000000940,', '0', '1', '浙江省/湖州市', '湖州市', '2', '0', 'system', '2018-03-11 15:59:48', 'system', '2018-03-11 15:59:48', null);
INSERT INTO `js_sys_area` VALUES ('330501', '330500', '0,330000,330500,', '9670', '0000000110,0000000940,0000009670,', '1', '2', '浙江省/湖州市/市辖区', '市辖区', '3', '0', 'system', '2018-03-11 15:59:48', 'system', '2018-03-11 15:59:48', null);
INSERT INTO `js_sys_area` VALUES ('330502', '330500', '0,330000,330500,', '9680', '0000000110,0000000940,0000009680,', '1', '2', '浙江省/湖州市/吴兴区', '吴兴区', '3', '0', 'system', '2018-03-11 15:59:48', 'system', '2018-03-11 15:59:48', null);
INSERT INTO `js_sys_area` VALUES ('330503', '330500', '0,330000,330500,', '9690', '0000000110,0000000940,0000009690,', '1', '2', '浙江省/湖州市/南浔区', '南浔区', '3', '0', 'system', '2018-03-11 15:59:48', 'system', '2018-03-11 15:59:48', null);
INSERT INTO `js_sys_area` VALUES ('330521', '330500', '0,330000,330500,', '9700', '0000000110,0000000940,0000009700,', '1', '2', '浙江省/湖州市/德清县', '德清县', '3', '0', 'system', '2018-03-11 15:59:48', 'system', '2018-03-11 15:59:48', null);
INSERT INTO `js_sys_area` VALUES ('330522', '330500', '0,330000,330500,', '9710', '0000000110,0000000940,0000009710,', '1', '2', '浙江省/湖州市/长兴县', '长兴县', '3', '0', 'system', '2018-03-11 15:59:48', 'system', '2018-03-11 15:59:48', null);
INSERT INTO `js_sys_area` VALUES ('330523', '330500', '0,330000,330500,', '9720', '0000000110,0000000940,0000009720,', '1', '2', '浙江省/湖州市/安吉县', '安吉县', '3', '0', 'system', '2018-03-11 15:59:48', 'system', '2018-03-11 15:59:48', null);
INSERT INTO `js_sys_area` VALUES ('330600', '330000', '0,330000,', '950', '0000000110,0000000950,', '0', '1', '浙江省/绍兴市', '绍兴市', '2', '0', 'system', '2018-03-11 15:59:48', 'system', '2018-03-11 15:59:48', null);
INSERT INTO `js_sys_area` VALUES ('330601', '330600', '0,330000,330600,', '9730', '0000000110,0000000950,0000009730,', '1', '2', '浙江省/绍兴市/市辖区', '市辖区', '3', '0', 'system', '2018-03-11 15:59:48', 'system', '2018-03-11 15:59:48', null);
INSERT INTO `js_sys_area` VALUES ('330602', '330600', '0,330000,330600,', '9740', '0000000110,0000000950,0000009740,', '1', '2', '浙江省/绍兴市/越城区', '越城区', '3', '0', 'system', '2018-03-11 15:59:48', 'system', '2018-03-11 15:59:48', null);
INSERT INTO `js_sys_area` VALUES ('330621', '330600', '0,330000,330600,', '9750', '0000000110,0000000950,0000009750,', '1', '2', '浙江省/绍兴市/绍兴县', '绍兴县', '3', '0', 'system', '2018-03-11 15:59:48', 'system', '2018-03-11 15:59:48', null);
INSERT INTO `js_sys_area` VALUES ('330624', '330600', '0,330000,330600,', '9760', '0000000110,0000000950,0000009760,', '1', '2', '浙江省/绍兴市/新昌县', '新昌县', '3', '0', 'system', '2018-03-11 15:59:48', 'system', '2018-03-11 15:59:48', null);
INSERT INTO `js_sys_area` VALUES ('330681', '330600', '0,330000,330600,', '9770', '0000000110,0000000950,0000009770,', '1', '2', '浙江省/绍兴市/诸暨市', '诸暨市', '3', '0', 'system', '2018-03-11 15:59:48', 'system', '2018-03-11 15:59:48', null);
INSERT INTO `js_sys_area` VALUES ('330682', '330600', '0,330000,330600,', '9780', '0000000110,0000000950,0000009780,', '1', '2', '浙江省/绍兴市/上虞市', '上虞市', '3', '0', 'system', '2018-03-11 15:59:48', 'system', '2018-03-11 15:59:48', null);
INSERT INTO `js_sys_area` VALUES ('330683', '330600', '0,330000,330600,', '9790', '0000000110,0000000950,0000009790,', '1', '2', '浙江省/绍兴市/嵊州市', '嵊州市', '3', '0', 'system', '2018-03-11 15:59:48', 'system', '2018-03-11 15:59:48', null);
INSERT INTO `js_sys_area` VALUES ('330700', '330000', '0,330000,', '960', '0000000110,0000000960,', '0', '1', '浙江省/金华市', '金华市', '2', '0', 'system', '2018-03-11 15:59:48', 'system', '2018-03-11 15:59:48', null);
INSERT INTO `js_sys_area` VALUES ('330701', '330700', '0,330000,330700,', '9800', '0000000110,0000000960,0000009800,', '1', '2', '浙江省/金华市/市辖区', '市辖区', '3', '0', 'system', '2018-03-11 15:59:48', 'system', '2018-03-11 15:59:48', null);
INSERT INTO `js_sys_area` VALUES ('330702', '330700', '0,330000,330700,', '9810', '0000000110,0000000960,0000009810,', '1', '2', '浙江省/金华市/婺城区', '婺城区', '3', '0', 'system', '2018-03-11 15:59:48', 'system', '2018-03-11 15:59:48', null);
INSERT INTO `js_sys_area` VALUES ('330703', '330700', '0,330000,330700,', '9820', '0000000110,0000000960,0000009820,', '1', '2', '浙江省/金华市/金东区', '金东区', '3', '0', 'system', '2018-03-11 15:59:48', 'system', '2018-03-11 15:59:48', null);
INSERT INTO `js_sys_area` VALUES ('330723', '330700', '0,330000,330700,', '9830', '0000000110,0000000960,0000009830,', '1', '2', '浙江省/金华市/武义县', '武义县', '3', '0', 'system', '2018-03-11 15:59:48', 'system', '2018-03-11 15:59:48', null);
INSERT INTO `js_sys_area` VALUES ('330726', '330700', '0,330000,330700,', '9840', '0000000110,0000000960,0000009840,', '1', '2', '浙江省/金华市/浦江县', '浦江县', '3', '0', 'system', '2018-03-11 15:59:48', 'system', '2018-03-11 15:59:48', null);
INSERT INTO `js_sys_area` VALUES ('330727', '330700', '0,330000,330700,', '9850', '0000000110,0000000960,0000009850,', '1', '2', '浙江省/金华市/磐安县', '磐安县', '3', '0', 'system', '2018-03-11 15:59:48', 'system', '2018-03-11 15:59:48', null);
INSERT INTO `js_sys_area` VALUES ('330781', '330700', '0,330000,330700,', '9860', '0000000110,0000000960,0000009860,', '1', '2', '浙江省/金华市/兰溪市', '兰溪市', '3', '0', 'system', '2018-03-11 15:59:48', 'system', '2018-03-11 15:59:48', null);
INSERT INTO `js_sys_area` VALUES ('330782', '330700', '0,330000,330700,', '9870', '0000000110,0000000960,0000009870,', '1', '2', '浙江省/金华市/义乌市', '义乌市', '3', '0', 'system', '2018-03-11 15:59:48', 'system', '2018-03-11 15:59:48', null);
INSERT INTO `js_sys_area` VALUES ('330783', '330700', '0,330000,330700,', '9880', '0000000110,0000000960,0000009880,', '1', '2', '浙江省/金华市/东阳市', '东阳市', '3', '0', 'system', '2018-03-11 15:59:48', 'system', '2018-03-11 15:59:48', null);
INSERT INTO `js_sys_area` VALUES ('330784', '330700', '0,330000,330700,', '9890', '0000000110,0000000960,0000009890,', '1', '2', '浙江省/金华市/永康市', '永康市', '3', '0', 'system', '2018-03-11 15:59:48', 'system', '2018-03-11 15:59:48', null);
INSERT INTO `js_sys_area` VALUES ('330800', '330000', '0,330000,', '970', '0000000110,0000000970,', '0', '1', '浙江省/衢州市', '衢州市', '2', '0', 'system', '2018-03-11 15:59:48', 'system', '2018-03-11 15:59:48', null);
INSERT INTO `js_sys_area` VALUES ('330801', '330800', '0,330000,330800,', '9900', '0000000110,0000000970,0000009900,', '1', '2', '浙江省/衢州市/市辖区', '市辖区', '3', '0', 'system', '2018-03-11 15:59:48', 'system', '2018-03-11 15:59:48', null);
INSERT INTO `js_sys_area` VALUES ('330802', '330800', '0,330000,330800,', '9910', '0000000110,0000000970,0000009910,', '1', '2', '浙江省/衢州市/柯城区', '柯城区', '3', '0', 'system', '2018-03-11 15:59:48', 'system', '2018-03-11 15:59:48', null);
INSERT INTO `js_sys_area` VALUES ('330803', '330800', '0,330000,330800,', '9920', '0000000110,0000000970,0000009920,', '1', '2', '浙江省/衢州市/衢江区', '衢江区', '3', '0', 'system', '2018-03-11 15:59:48', 'system', '2018-03-11 15:59:48', null);
INSERT INTO `js_sys_area` VALUES ('330822', '330800', '0,330000,330800,', '9930', '0000000110,0000000970,0000009930,', '1', '2', '浙江省/衢州市/常山县', '常山县', '3', '0', 'system', '2018-03-11 15:59:48', 'system', '2018-03-11 15:59:48', null);
INSERT INTO `js_sys_area` VALUES ('330824', '330800', '0,330000,330800,', '9940', '0000000110,0000000970,0000009940,', '1', '2', '浙江省/衢州市/开化县', '开化县', '3', '0', 'system', '2018-03-11 15:59:48', 'system', '2018-03-11 15:59:48', null);
INSERT INTO `js_sys_area` VALUES ('330825', '330800', '0,330000,330800,', '9950', '0000000110,0000000970,0000009950,', '1', '2', '浙江省/衢州市/龙游县', '龙游县', '3', '0', 'system', '2018-03-11 15:59:48', 'system', '2018-03-11 15:59:48', null);
INSERT INTO `js_sys_area` VALUES ('330881', '330800', '0,330000,330800,', '9960', '0000000110,0000000970,0000009960,', '1', '2', '浙江省/衢州市/江山市', '江山市', '3', '0', 'system', '2018-03-11 15:59:49', 'system', '2018-03-11 15:59:49', null);
INSERT INTO `js_sys_area` VALUES ('330900', '330000', '0,330000,', '980', '0000000110,0000000980,', '0', '1', '浙江省/舟山市', '舟山市', '2', '0', 'system', '2018-03-11 15:59:49', 'system', '2018-03-11 15:59:49', null);
INSERT INTO `js_sys_area` VALUES ('330901', '330900', '0,330000,330900,', '9970', '0000000110,0000000980,0000009970,', '1', '2', '浙江省/舟山市/市辖区', '市辖区', '3', '0', 'system', '2018-03-11 15:59:49', 'system', '2018-03-11 15:59:49', null);
INSERT INTO `js_sys_area` VALUES ('330902', '330900', '0,330000,330900,', '9980', '0000000110,0000000980,0000009980,', '1', '2', '浙江省/舟山市/定海区', '定海区', '3', '0', 'system', '2018-03-11 15:59:49', 'system', '2018-03-11 15:59:49', null);
INSERT INTO `js_sys_area` VALUES ('330903', '330900', '0,330000,330900,', '9990', '0000000110,0000000980,0000009990,', '1', '2', '浙江省/舟山市/普陀区', '普陀区', '3', '0', 'system', '2018-03-11 15:59:49', 'system', '2018-03-11 15:59:49', null);
INSERT INTO `js_sys_area` VALUES ('330921', '330900', '0,330000,330900,', '10000', '0000000110,0000000980,0000010000,', '1', '2', '浙江省/舟山市/岱山县', '岱山县', '3', '0', 'system', '2018-03-11 15:59:49', 'system', '2018-03-11 15:59:49', null);
INSERT INTO `js_sys_area` VALUES ('330922', '330900', '0,330000,330900,', '10010', '0000000110,0000000980,0000010010,', '1', '2', '浙江省/舟山市/嵊泗县', '嵊泗县', '3', '0', 'system', '2018-03-11 15:59:49', 'system', '2018-03-11 15:59:49', null);
INSERT INTO `js_sys_area` VALUES ('331000', '330000', '0,330000,', '990', '0000000110,0000000990,', '0', '1', '浙江省/台州市', '台州市', '2', '0', 'system', '2018-03-11 15:59:49', 'system', '2018-03-11 15:59:49', null);
INSERT INTO `js_sys_area` VALUES ('331001', '331000', '0,330000,331000,', '10020', '0000000110,0000000990,0000010020,', '1', '2', '浙江省/台州市/市辖区', '市辖区', '3', '0', 'system', '2018-03-11 15:59:49', 'system', '2018-03-11 15:59:49', null);
INSERT INTO `js_sys_area` VALUES ('331002', '331000', '0,330000,331000,', '10030', '0000000110,0000000990,0000010030,', '1', '2', '浙江省/台州市/椒江区', '椒江区', '3', '0', 'system', '2018-03-11 15:59:49', 'system', '2018-03-11 15:59:49', null);
INSERT INTO `js_sys_area` VALUES ('331003', '331000', '0,330000,331000,', '10040', '0000000110,0000000990,0000010040,', '1', '2', '浙江省/台州市/黄岩区', '黄岩区', '3', '0', 'system', '2018-03-11 15:59:49', 'system', '2018-03-11 15:59:49', null);
INSERT INTO `js_sys_area` VALUES ('331004', '331000', '0,330000,331000,', '10050', '0000000110,0000000990,0000010050,', '1', '2', '浙江省/台州市/路桥区', '路桥区', '3', '0', 'system', '2018-03-11 15:59:49', 'system', '2018-03-11 15:59:49', null);
INSERT INTO `js_sys_area` VALUES ('331021', '331000', '0,330000,331000,', '10060', '0000000110,0000000990,0000010060,', '1', '2', '浙江省/台州市/玉环县', '玉环县', '3', '0', 'system', '2018-03-11 15:59:49', 'system', '2018-03-11 15:59:49', null);
INSERT INTO `js_sys_area` VALUES ('331022', '331000', '0,330000,331000,', '10070', '0000000110,0000000990,0000010070,', '1', '2', '浙江省/台州市/三门县', '三门县', '3', '0', 'system', '2018-03-11 15:59:49', 'system', '2018-03-11 15:59:49', null);
INSERT INTO `js_sys_area` VALUES ('331023', '331000', '0,330000,331000,', '10080', '0000000110,0000000990,0000010080,', '1', '2', '浙江省/台州市/天台县', '天台县', '3', '0', 'system', '2018-03-11 15:59:49', 'system', '2018-03-11 15:59:49', null);
INSERT INTO `js_sys_area` VALUES ('331024', '331000', '0,330000,331000,', '10090', '0000000110,0000000990,0000010090,', '1', '2', '浙江省/台州市/仙居县', '仙居县', '3', '0', 'system', '2018-03-11 15:59:49', 'system', '2018-03-11 15:59:49', null);
INSERT INTO `js_sys_area` VALUES ('331081', '331000', '0,330000,331000,', '10100', '0000000110,0000000990,0000010100,', '1', '2', '浙江省/台州市/温岭市', '温岭市', '3', '0', 'system', '2018-03-11 15:59:49', 'system', '2018-03-11 15:59:49', null);
INSERT INTO `js_sys_area` VALUES ('331082', '331000', '0,330000,331000,', '10110', '0000000110,0000000990,0000010110,', '1', '2', '浙江省/台州市/临海市', '临海市', '3', '0', 'system', '2018-03-11 15:59:49', 'system', '2018-03-11 15:59:49', null);
INSERT INTO `js_sys_area` VALUES ('331100', '330000', '0,330000,', '1000', '0000000110,0000001000,', '0', '1', '浙江省/丽水市', '丽水市', '2', '0', 'system', '2018-03-11 15:59:49', 'system', '2018-03-11 15:59:49', null);
INSERT INTO `js_sys_area` VALUES ('331101', '331100', '0,330000,331100,', '10120', '0000000110,0000001000,0000010120,', '1', '2', '浙江省/丽水市/市辖区', '市辖区', '3', '0', 'system', '2018-03-11 15:59:49', 'system', '2018-03-11 15:59:49', null);
INSERT INTO `js_sys_area` VALUES ('331102', '331100', '0,330000,331100,', '10130', '0000000110,0000001000,0000010130,', '1', '2', '浙江省/丽水市/莲都区', '莲都区', '3', '0', 'system', '2018-03-11 15:59:49', 'system', '2018-03-11 15:59:49', null);
INSERT INTO `js_sys_area` VALUES ('331121', '331100', '0,330000,331100,', '10140', '0000000110,0000001000,0000010140,', '1', '2', '浙江省/丽水市/青田县', '青田县', '3', '0', 'system', '2018-03-11 15:59:49', 'system', '2018-03-11 15:59:49', null);
INSERT INTO `js_sys_area` VALUES ('331122', '331100', '0,330000,331100,', '10150', '0000000110,0000001000,0000010150,', '1', '2', '浙江省/丽水市/缙云县', '缙云县', '3', '0', 'system', '2018-03-11 15:59:49', 'system', '2018-03-11 15:59:49', null);
INSERT INTO `js_sys_area` VALUES ('331123', '331100', '0,330000,331100,', '10160', '0000000110,0000001000,0000010160,', '1', '2', '浙江省/丽水市/遂昌县', '遂昌县', '3', '0', 'system', '2018-03-11 15:59:49', 'system', '2018-03-11 15:59:49', null);
INSERT INTO `js_sys_area` VALUES ('331124', '331100', '0,330000,331100,', '10170', '0000000110,0000001000,0000010170,', '1', '2', '浙江省/丽水市/松阳县', '松阳县', '3', '0', 'system', '2018-03-11 15:59:49', 'system', '2018-03-11 15:59:49', null);
INSERT INTO `js_sys_area` VALUES ('331125', '331100', '0,330000,331100,', '10180', '0000000110,0000001000,0000010180,', '1', '2', '浙江省/丽水市/云和县', '云和县', '3', '0', 'system', '2018-03-11 15:59:49', 'system', '2018-03-11 15:59:49', null);
INSERT INTO `js_sys_area` VALUES ('331126', '331100', '0,330000,331100,', '10190', '0000000110,0000001000,0000010190,', '1', '2', '浙江省/丽水市/庆元县', '庆元县', '3', '0', 'system', '2018-03-11 15:59:49', 'system', '2018-03-11 15:59:49', null);
INSERT INTO `js_sys_area` VALUES ('331127', '331100', '0,330000,331100,', '10200', '0000000110,0000001000,0000010200,', '1', '2', '浙江省/丽水市/景宁畲族自治县', '景宁畲族自治县', '3', '0', 'system', '2018-03-11 15:59:49', 'system', '2018-03-11 15:59:49', null);
INSERT INTO `js_sys_area` VALUES ('331181', '331100', '0,330000,331100,', '10210', '0000000110,0000001000,0000010210,', '1', '2', '浙江省/丽水市/龙泉市', '龙泉市', '3', '0', 'system', '2018-03-11 15:59:49', 'system', '2018-03-11 15:59:49', null);
INSERT INTO `js_sys_area` VALUES ('340000', '0', '0,', '120', '0000000120,', '0', '0', '安徽省', '安徽省', '1', '0', 'system', '2018-03-11 15:59:49', 'system', '2018-03-11 15:59:49', null);
INSERT INTO `js_sys_area` VALUES ('340100', '340000', '0,340000,', '1010', '0000000120,0000001010,', '0', '1', '安徽省/合肥市', '合肥市', '2', '0', 'system', '2018-03-11 15:59:49', 'system', '2018-03-11 15:59:49', null);
INSERT INTO `js_sys_area` VALUES ('340101', '340100', '0,340000,340100,', '10220', '0000000120,0000001010,0000010220,', '1', '2', '安徽省/合肥市/市辖区', '市辖区', '3', '0', 'system', '2018-03-11 15:59:49', 'system', '2018-03-11 15:59:49', null);
INSERT INTO `js_sys_area` VALUES ('340102', '340100', '0,340000,340100,', '10230', '0000000120,0000001010,0000010230,', '1', '2', '安徽省/合肥市/瑶海区', '瑶海区', '3', '0', 'system', '2018-03-11 15:59:49', 'system', '2018-03-11 15:59:49', null);
INSERT INTO `js_sys_area` VALUES ('340103', '340100', '0,340000,340100,', '10240', '0000000120,0000001010,0000010240,', '1', '2', '安徽省/合肥市/庐阳区', '庐阳区', '3', '0', 'system', '2018-03-11 15:59:49', 'system', '2018-03-11 15:59:49', null);
INSERT INTO `js_sys_area` VALUES ('340104', '340100', '0,340000,340100,', '10250', '0000000120,0000001010,0000010250,', '1', '2', '安徽省/合肥市/蜀山区', '蜀山区', '3', '0', 'system', '2018-03-11 15:59:49', 'system', '2018-03-11 15:59:49', null);
INSERT INTO `js_sys_area` VALUES ('340111', '340100', '0,340000,340100,', '10260', '0000000120,0000001010,0000010260,', '1', '2', '安徽省/合肥市/包河区', '包河区', '3', '0', 'system', '2018-03-11 15:59:49', 'system', '2018-03-11 15:59:49', null);
INSERT INTO `js_sys_area` VALUES ('340121', '340100', '0,340000,340100,', '10270', '0000000120,0000001010,0000010270,', '1', '2', '安徽省/合肥市/长丰县', '长丰县', '3', '0', 'system', '2018-03-11 15:59:49', 'system', '2018-03-11 15:59:49', null);
INSERT INTO `js_sys_area` VALUES ('340122', '340100', '0,340000,340100,', '10280', '0000000120,0000001010,0000010280,', '1', '2', '安徽省/合肥市/肥东县', '肥东县', '3', '0', 'system', '2018-03-11 15:59:49', 'system', '2018-03-11 15:59:49', null);
INSERT INTO `js_sys_area` VALUES ('340123', '340100', '0,340000,340100,', '10290', '0000000120,0000001010,0000010290,', '1', '2', '安徽省/合肥市/肥西县', '肥西县', '3', '0', 'system', '2018-03-11 15:59:49', 'system', '2018-03-11 15:59:49', null);
INSERT INTO `js_sys_area` VALUES ('340200', '340000', '0,340000,', '1020', '0000000120,0000001020,', '0', '1', '安徽省/芜湖市', '芜湖市', '2', '0', 'system', '2018-03-11 15:59:49', 'system', '2018-03-11 15:59:49', null);
INSERT INTO `js_sys_area` VALUES ('340201', '340200', '0,340000,340200,', '10300', '0000000120,0000001020,0000010300,', '1', '2', '安徽省/芜湖市/市辖区', '市辖区', '3', '0', 'system', '2018-03-11 15:59:49', 'system', '2018-03-11 15:59:49', null);
INSERT INTO `js_sys_area` VALUES ('340202', '340200', '0,340000,340200,', '10310', '0000000120,0000001020,0000010310,', '1', '2', '安徽省/芜湖市/镜湖区', '镜湖区', '3', '0', 'system', '2018-03-11 15:59:49', 'system', '2018-03-11 15:59:49', null);
INSERT INTO `js_sys_area` VALUES ('340203', '340200', '0,340000,340200,', '10320', '0000000120,0000001020,0000010320,', '1', '2', '安徽省/芜湖市/马塘区', '马塘区', '3', '0', 'system', '2018-03-11 15:59:49', 'system', '2018-03-11 15:59:49', null);
INSERT INTO `js_sys_area` VALUES ('340204', '340200', '0,340000,340200,', '10330', '0000000120,0000001020,0000010330,', '1', '2', '安徽省/芜湖市/新芜区', '新芜区', '3', '0', 'system', '2018-03-11 15:59:49', 'system', '2018-03-11 15:59:49', null);
INSERT INTO `js_sys_area` VALUES ('340207', '340200', '0,340000,340200,', '10340', '0000000120,0000001020,0000010340,', '1', '2', '安徽省/芜湖市/鸠江区', '鸠江区', '3', '0', 'system', '2018-03-11 15:59:49', 'system', '2018-03-11 15:59:49', null);
INSERT INTO `js_sys_area` VALUES ('340221', '340200', '0,340000,340200,', '10350', '0000000120,0000001020,0000010350,', '1', '2', '安徽省/芜湖市/芜湖县', '芜湖县', '3', '0', 'system', '2018-03-11 15:59:49', 'system', '2018-03-11 15:59:49', null);
INSERT INTO `js_sys_area` VALUES ('340222', '340200', '0,340000,340200,', '10360', '0000000120,0000001020,0000010360,', '1', '2', '安徽省/芜湖市/繁昌县', '繁昌县', '3', '0', 'system', '2018-03-11 15:59:49', 'system', '2018-03-11 15:59:49', null);
INSERT INTO `js_sys_area` VALUES ('340223', '340200', '0,340000,340200,', '10370', '0000000120,0000001020,0000010370,', '1', '2', '安徽省/芜湖市/南陵县', '南陵县', '3', '0', 'system', '2018-03-11 15:59:49', 'system', '2018-03-11 15:59:49', null);
INSERT INTO `js_sys_area` VALUES ('340300', '340000', '0,340000,', '1030', '0000000120,0000001030,', '0', '1', '安徽省/蚌埠市', '蚌埠市', '2', '0', 'system', '2018-03-11 15:59:49', 'system', '2018-03-11 15:59:49', null);
INSERT INTO `js_sys_area` VALUES ('340301', '340300', '0,340000,340300,', '10380', '0000000120,0000001030,0000010380,', '1', '2', '安徽省/蚌埠市/市辖区', '市辖区', '3', '0', 'system', '2018-03-11 15:59:49', 'system', '2018-03-11 15:59:49', null);
INSERT INTO `js_sys_area` VALUES ('340302', '340300', '0,340000,340300,', '10390', '0000000120,0000001030,0000010390,', '1', '2', '安徽省/蚌埠市/龙子湖区', '龙子湖区', '3', '0', 'system', '2018-03-11 15:59:49', 'system', '2018-03-11 15:59:49', null);
INSERT INTO `js_sys_area` VALUES ('340303', '340300', '0,340000,340300,', '10400', '0000000120,0000001030,0000010400,', '1', '2', '安徽省/蚌埠市/蚌山区', '蚌山区', '3', '0', 'system', '2018-03-11 15:59:49', 'system', '2018-03-11 15:59:49', null);
INSERT INTO `js_sys_area` VALUES ('340304', '340300', '0,340000,340300,', '10410', '0000000120,0000001030,0000010410,', '1', '2', '安徽省/蚌埠市/禹会区', '禹会区', '3', '0', 'system', '2018-03-11 15:59:49', 'system', '2018-03-11 15:59:49', null);
INSERT INTO `js_sys_area` VALUES ('340311', '340300', '0,340000,340300,', '10420', '0000000120,0000001030,0000010420,', '1', '2', '安徽省/蚌埠市/淮上区', '淮上区', '3', '0', 'system', '2018-03-11 15:59:49', 'system', '2018-03-11 15:59:49', null);
INSERT INTO `js_sys_area` VALUES ('340321', '340300', '0,340000,340300,', '10430', '0000000120,0000001030,0000010430,', '1', '2', '安徽省/蚌埠市/怀远县', '怀远县', '3', '0', 'system', '2018-03-11 15:59:49', 'system', '2018-03-11 15:59:49', null);
INSERT INTO `js_sys_area` VALUES ('340322', '340300', '0,340000,340300,', '10440', '0000000120,0000001030,0000010440,', '1', '2', '安徽省/蚌埠市/五河县', '五河县', '3', '0', 'system', '2018-03-11 15:59:49', 'system', '2018-03-11 15:59:49', null);
INSERT INTO `js_sys_area` VALUES ('340323', '340300', '0,340000,340300,', '10450', '0000000120,0000001030,0000010450,', '1', '2', '安徽省/蚌埠市/固镇县', '固镇县', '3', '0', 'system', '2018-03-11 15:59:49', 'system', '2018-03-11 15:59:49', null);
INSERT INTO `js_sys_area` VALUES ('340400', '340000', '0,340000,', '1040', '0000000120,0000001040,', '0', '1', '安徽省/淮南市', '淮南市', '2', '0', 'system', '2018-03-11 15:59:49', 'system', '2018-03-11 15:59:49', null);
INSERT INTO `js_sys_area` VALUES ('340401', '340400', '0,340000,340400,', '10460', '0000000120,0000001040,0000010460,', '1', '2', '安徽省/淮南市/市辖区', '市辖区', '3', '0', 'system', '2018-03-11 15:59:49', 'system', '2018-03-11 15:59:49', null);
INSERT INTO `js_sys_area` VALUES ('340402', '340400', '0,340000,340400,', '10470', '0000000120,0000001040,0000010470,', '1', '2', '安徽省/淮南市/大通区', '大通区', '3', '0', 'system', '2018-03-11 15:59:49', 'system', '2018-03-11 15:59:49', null);
INSERT INTO `js_sys_area` VALUES ('340403', '340400', '0,340000,340400,', '10480', '0000000120,0000001040,0000010480,', '1', '2', '安徽省/淮南市/田家庵区', '田家庵区', '3', '0', 'system', '2018-03-11 15:59:49', 'system', '2018-03-11 15:59:49', null);
INSERT INTO `js_sys_area` VALUES ('340404', '340400', '0,340000,340400,', '10490', '0000000120,0000001040,0000010490,', '1', '2', '安徽省/淮南市/谢家集区', '谢家集区', '3', '0', 'system', '2018-03-11 15:59:49', 'system', '2018-03-11 15:59:49', null);
INSERT INTO `js_sys_area` VALUES ('340405', '340400', '0,340000,340400,', '10500', '0000000120,0000001040,0000010500,', '1', '2', '安徽省/淮南市/八公山区', '八公山区', '3', '0', 'system', '2018-03-11 15:59:49', 'system', '2018-03-11 15:59:49', null);
INSERT INTO `js_sys_area` VALUES ('340406', '340400', '0,340000,340400,', '10510', '0000000120,0000001040,0000010510,', '1', '2', '安徽省/淮南市/潘集区', '潘集区', '3', '0', 'system', '2018-03-11 15:59:49', 'system', '2018-03-11 15:59:49', null);
INSERT INTO `js_sys_area` VALUES ('340421', '340400', '0,340000,340400,', '10520', '0000000120,0000001040,0000010520,', '1', '2', '安徽省/淮南市/凤台县', '凤台县', '3', '0', 'system', '2018-03-11 15:59:49', 'system', '2018-03-11 15:59:49', null);
INSERT INTO `js_sys_area` VALUES ('340500', '340000', '0,340000,', '1050', '0000000120,0000001050,', '0', '1', '安徽省/马鞍山市', '马鞍山市', '2', '0', 'system', '2018-03-11 15:59:50', 'system', '2018-03-11 15:59:49', null);
INSERT INTO `js_sys_area` VALUES ('340501', '340500', '0,340000,340500,', '10530', '0000000120,0000001050,0000010530,', '1', '2', '安徽省/马鞍山市/市辖区', '市辖区', '3', '0', 'system', '2018-03-11 15:59:50', 'system', '2018-03-11 15:59:50', null);
INSERT INTO `js_sys_area` VALUES ('340502', '340500', '0,340000,340500,', '10540', '0000000120,0000001050,0000010540,', '1', '2', '安徽省/马鞍山市/金家庄区', '金家庄区', '3', '0', 'system', '2018-03-11 15:59:50', 'system', '2018-03-11 15:59:50', null);
INSERT INTO `js_sys_area` VALUES ('340503', '340500', '0,340000,340500,', '10550', '0000000120,0000001050,0000010550,', '1', '2', '安徽省/马鞍山市/花山区', '花山区', '3', '0', 'system', '2018-03-11 15:59:50', 'system', '2018-03-11 15:59:50', null);
INSERT INTO `js_sys_area` VALUES ('340504', '340500', '0,340000,340500,', '10560', '0000000120,0000001050,0000010560,', '1', '2', '安徽省/马鞍山市/雨山区', '雨山区', '3', '0', 'system', '2018-03-11 15:59:50', 'system', '2018-03-11 15:59:50', null);
INSERT INTO `js_sys_area` VALUES ('340521', '340500', '0,340000,340500,', '10570', '0000000120,0000001050,0000010570,', '1', '2', '安徽省/马鞍山市/当涂县', '当涂县', '3', '0', 'system', '2018-03-11 15:59:50', 'system', '2018-03-11 15:59:50', null);
INSERT INTO `js_sys_area` VALUES ('340600', '340000', '0,340000,', '1060', '0000000120,0000001060,', '0', '1', '安徽省/淮北市', '淮北市', '2', '0', 'system', '2018-03-11 15:59:50', 'system', '2018-03-11 15:59:50', null);
INSERT INTO `js_sys_area` VALUES ('340601', '340600', '0,340000,340600,', '10580', '0000000120,0000001060,0000010580,', '1', '2', '安徽省/淮北市/市辖区', '市辖区', '3', '0', 'system', '2018-03-11 15:59:50', 'system', '2018-03-11 15:59:50', null);
INSERT INTO `js_sys_area` VALUES ('340602', '340600', '0,340000,340600,', '10590', '0000000120,0000001060,0000010590,', '1', '2', '安徽省/淮北市/杜集区', '杜集区', '3', '0', 'system', '2018-03-11 15:59:50', 'system', '2018-03-11 15:59:50', null);
INSERT INTO `js_sys_area` VALUES ('340603', '340600', '0,340000,340600,', '10600', '0000000120,0000001060,0000010600,', '1', '2', '安徽省/淮北市/相山区', '相山区', '3', '0', 'system', '2018-03-11 15:59:50', 'system', '2018-03-11 15:59:50', null);
INSERT INTO `js_sys_area` VALUES ('340604', '340600', '0,340000,340600,', '10610', '0000000120,0000001060,0000010610,', '1', '2', '安徽省/淮北市/烈山区', '烈山区', '3', '0', 'system', '2018-03-11 15:59:50', 'system', '2018-03-11 15:59:50', null);
INSERT INTO `js_sys_area` VALUES ('340621', '340600', '0,340000,340600,', '10620', '0000000120,0000001060,0000010620,', '1', '2', '安徽省/淮北市/濉溪县', '濉溪县', '3', '0', 'system', '2018-03-11 15:59:50', 'system', '2018-03-11 15:59:50', null);
INSERT INTO `js_sys_area` VALUES ('340700', '340000', '0,340000,', '1070', '0000000120,0000001070,', '0', '1', '安徽省/铜陵市', '铜陵市', '2', '0', 'system', '2018-03-11 15:59:50', 'system', '2018-03-11 15:59:50', null);
INSERT INTO `js_sys_area` VALUES ('340701', '340700', '0,340000,340700,', '10630', '0000000120,0000001070,0000010630,', '1', '2', '安徽省/铜陵市/市辖区', '市辖区', '3', '0', 'system', '2018-03-11 15:59:50', 'system', '2018-03-11 15:59:50', null);
INSERT INTO `js_sys_area` VALUES ('340702', '340700', '0,340000,340700,', '10640', '0000000120,0000001070,0000010640,', '1', '2', '安徽省/铜陵市/铜官山区', '铜官山区', '3', '0', 'system', '2018-03-11 15:59:50', 'system', '2018-03-11 15:59:50', null);
INSERT INTO `js_sys_area` VALUES ('340703', '340700', '0,340000,340700,', '10650', '0000000120,0000001070,0000010650,', '1', '2', '安徽省/铜陵市/狮子山区', '狮子山区', '3', '0', 'system', '2018-03-11 15:59:50', 'system', '2018-03-11 15:59:50', null);
INSERT INTO `js_sys_area` VALUES ('340711', '340700', '0,340000,340700,', '10660', '0000000120,0000001070,0000010660,', '1', '2', '安徽省/铜陵市/郊　区', '郊　区', '3', '0', 'system', '2018-03-11 15:59:50', 'system', '2018-03-11 15:59:50', null);
INSERT INTO `js_sys_area` VALUES ('340721', '340700', '0,340000,340700,', '10670', '0000000120,0000001070,0000010670,', '1', '2', '安徽省/铜陵市/铜陵县', '铜陵县', '3', '0', 'system', '2018-03-11 15:59:50', 'system', '2018-03-11 15:59:50', null);
INSERT INTO `js_sys_area` VALUES ('340800', '340000', '0,340000,', '1080', '0000000120,0000001080,', '0', '1', '安徽省/安庆市', '安庆市', '2', '0', 'system', '2018-03-11 15:59:50', 'system', '2018-03-11 15:59:50', null);
INSERT INTO `js_sys_area` VALUES ('340801', '340800', '0,340000,340800,', '10680', '0000000120,0000001080,0000010680,', '1', '2', '安徽省/安庆市/市辖区', '市辖区', '3', '0', 'system', '2018-03-11 15:59:50', 'system', '2018-03-11 15:59:50', null);
INSERT INTO `js_sys_area` VALUES ('340802', '340800', '0,340000,340800,', '10690', '0000000120,0000001080,0000010690,', '1', '2', '安徽省/安庆市/迎江区', '迎江区', '3', '0', 'system', '2018-03-11 15:59:50', 'system', '2018-03-11 15:59:50', null);
INSERT INTO `js_sys_area` VALUES ('340803', '340800', '0,340000,340800,', '10700', '0000000120,0000001080,0000010700,', '1', '2', '安徽省/安庆市/大观区', '大观区', '3', '0', 'system', '2018-03-11 15:59:50', 'system', '2018-03-11 15:59:50', null);
INSERT INTO `js_sys_area` VALUES ('340811', '340800', '0,340000,340800,', '10710', '0000000120,0000001080,0000010710,', '1', '2', '安徽省/安庆市/郊　区', '郊　区', '3', '0', 'system', '2018-03-11 15:59:50', 'system', '2018-03-11 15:59:50', null);
INSERT INTO `js_sys_area` VALUES ('340822', '340800', '0,340000,340800,', '10720', '0000000120,0000001080,0000010720,', '1', '2', '安徽省/安庆市/怀宁县', '怀宁县', '3', '0', 'system', '2018-03-11 15:59:50', 'system', '2018-03-11 15:59:50', null);
INSERT INTO `js_sys_area` VALUES ('340823', '340800', '0,340000,340800,', '10730', '0000000120,0000001080,0000010730,', '1', '2', '安徽省/安庆市/枞阳县', '枞阳县', '3', '0', 'system', '2018-03-11 15:59:50', 'system', '2018-03-11 15:59:50', null);
INSERT INTO `js_sys_area` VALUES ('340824', '340800', '0,340000,340800,', '10740', '0000000120,0000001080,0000010740,', '1', '2', '安徽省/安庆市/潜山县', '潜山县', '3', '0', 'system', '2018-03-11 15:59:50', 'system', '2018-03-11 15:59:50', null);
INSERT INTO `js_sys_area` VALUES ('340825', '340800', '0,340000,340800,', '10750', '0000000120,0000001080,0000010750,', '1', '2', '安徽省/安庆市/太湖县', '太湖县', '3', '0', 'system', '2018-03-11 15:59:50', 'system', '2018-03-11 15:59:50', null);
INSERT INTO `js_sys_area` VALUES ('340826', '340800', '0,340000,340800,', '10760', '0000000120,0000001080,0000010760,', '1', '2', '安徽省/安庆市/宿松县', '宿松县', '3', '0', 'system', '2018-03-11 15:59:50', 'system', '2018-03-11 15:59:50', null);
INSERT INTO `js_sys_area` VALUES ('340827', '340800', '0,340000,340800,', '10770', '0000000120,0000001080,0000010770,', '1', '2', '安徽省/安庆市/望江县', '望江县', '3', '0', 'system', '2018-03-11 15:59:50', 'system', '2018-03-11 15:59:50', null);
INSERT INTO `js_sys_area` VALUES ('340828', '340800', '0,340000,340800,', '10780', '0000000120,0000001080,0000010780,', '1', '2', '安徽省/安庆市/岳西县', '岳西县', '3', '0', 'system', '2018-03-11 15:59:50', 'system', '2018-03-11 15:59:50', null);
INSERT INTO `js_sys_area` VALUES ('340881', '340800', '0,340000,340800,', '10790', '0000000120,0000001080,0000010790,', '1', '2', '安徽省/安庆市/桐城市', '桐城市', '3', '0', 'system', '2018-03-11 15:59:50', 'system', '2018-03-11 15:59:50', null);
INSERT INTO `js_sys_area` VALUES ('341000', '340000', '0,340000,', '1090', '0000000120,0000001090,', '0', '1', '安徽省/黄山市', '黄山市', '2', '0', 'system', '2018-03-11 15:59:50', 'system', '2018-03-11 15:59:50', null);
INSERT INTO `js_sys_area` VALUES ('341001', '341000', '0,340000,341000,', '10800', '0000000120,0000001090,0000010800,', '1', '2', '安徽省/黄山市/市辖区', '市辖区', '3', '0', 'system', '2018-03-11 15:59:50', 'system', '2018-03-11 15:59:50', null);
INSERT INTO `js_sys_area` VALUES ('341002', '341000', '0,340000,341000,', '10810', '0000000120,0000001090,0000010810,', '1', '2', '安徽省/黄山市/屯溪区', '屯溪区', '3', '0', 'system', '2018-03-11 15:59:50', 'system', '2018-03-11 15:59:50', null);
INSERT INTO `js_sys_area` VALUES ('341003', '341000', '0,340000,341000,', '10820', '0000000120,0000001090,0000010820,', '1', '2', '安徽省/黄山市/黄山区', '黄山区', '3', '0', 'system', '2018-03-11 15:59:50', 'system', '2018-03-11 15:59:50', null);
INSERT INTO `js_sys_area` VALUES ('341004', '341000', '0,340000,341000,', '10830', '0000000120,0000001090,0000010830,', '1', '2', '安徽省/黄山市/徽州区', '徽州区', '3', '0', 'system', '2018-03-11 15:59:50', 'system', '2018-03-11 15:59:50', null);
INSERT INTO `js_sys_area` VALUES ('341021', '341000', '0,340000,341000,', '10840', '0000000120,0000001090,0000010840,', '1', '2', '安徽省/黄山市/歙　县', '歙　县', '3', '0', 'system', '2018-03-11 15:59:50', 'system', '2018-03-11 15:59:50', null);
INSERT INTO `js_sys_area` VALUES ('341022', '341000', '0,340000,341000,', '10850', '0000000120,0000001090,0000010850,', '1', '2', '安徽省/黄山市/休宁县', '休宁县', '3', '0', 'system', '2018-03-11 15:59:50', 'system', '2018-03-11 15:59:50', null);
INSERT INTO `js_sys_area` VALUES ('341023', '341000', '0,340000,341000,', '10860', '0000000120,0000001090,0000010860,', '1', '2', '安徽省/黄山市/黟　县', '黟　县', '3', '0', 'system', '2018-03-11 15:59:50', 'system', '2018-03-11 15:59:50', null);
INSERT INTO `js_sys_area` VALUES ('341024', '341000', '0,340000,341000,', '10870', '0000000120,0000001090,0000010870,', '1', '2', '安徽省/黄山市/祁门县', '祁门县', '3', '0', 'system', '2018-03-11 15:59:50', 'system', '2018-03-11 15:59:50', null);
INSERT INTO `js_sys_area` VALUES ('341100', '340000', '0,340000,', '1100', '0000000120,0000001100,', '0', '1', '安徽省/滁州市', '滁州市', '2', '0', 'system', '2018-03-11 15:59:50', 'system', '2018-03-11 15:59:50', null);
INSERT INTO `js_sys_area` VALUES ('341101', '341100', '0,340000,341100,', '10880', '0000000120,0000001100,0000010880,', '1', '2', '安徽省/滁州市/市辖区', '市辖区', '3', '0', 'system', '2018-03-11 15:59:50', 'system', '2018-03-11 15:59:50', null);
INSERT INTO `js_sys_area` VALUES ('341102', '341100', '0,340000,341100,', '10890', '0000000120,0000001100,0000010890,', '1', '2', '安徽省/滁州市/琅琊区', '琅琊区', '3', '0', 'system', '2018-03-11 15:59:50', 'system', '2018-03-11 15:59:50', null);
INSERT INTO `js_sys_area` VALUES ('341103', '341100', '0,340000,341100,', '10900', '0000000120,0000001100,0000010900,', '1', '2', '安徽省/滁州市/南谯区', '南谯区', '3', '0', 'system', '2018-03-11 15:59:50', 'system', '2018-03-11 15:59:50', null);
INSERT INTO `js_sys_area` VALUES ('341122', '341100', '0,340000,341100,', '10910', '0000000120,0000001100,0000010910,', '1', '2', '安徽省/滁州市/来安县', '来安县', '3', '0', 'system', '2018-03-11 15:59:50', 'system', '2018-03-11 15:59:50', null);
INSERT INTO `js_sys_area` VALUES ('341124', '341100', '0,340000,341100,', '10920', '0000000120,0000001100,0000010920,', '1', '2', '安徽省/滁州市/全椒县', '全椒县', '3', '0', 'system', '2018-03-11 15:59:50', 'system', '2018-03-11 15:59:50', null);
INSERT INTO `js_sys_area` VALUES ('341125', '341100', '0,340000,341100,', '10930', '0000000120,0000001100,0000010930,', '1', '2', '安徽省/滁州市/定远县', '定远县', '3', '0', 'system', '2018-03-11 15:59:50', 'system', '2018-03-11 15:59:50', null);
INSERT INTO `js_sys_area` VALUES ('341126', '341100', '0,340000,341100,', '10940', '0000000120,0000001100,0000010940,', '1', '2', '安徽省/滁州市/凤阳县', '凤阳县', '3', '0', 'system', '2018-03-11 15:59:50', 'system', '2018-03-11 15:59:50', null);
INSERT INTO `js_sys_area` VALUES ('341181', '341100', '0,340000,341100,', '10950', '0000000120,0000001100,0000010950,', '1', '2', '安徽省/滁州市/天长市', '天长市', '3', '0', 'system', '2018-03-11 15:59:50', 'system', '2018-03-11 15:59:50', null);
INSERT INTO `js_sys_area` VALUES ('341182', '341100', '0,340000,341100,', '10960', '0000000120,0000001100,0000010960,', '1', '2', '安徽省/滁州市/明光市', '明光市', '3', '0', 'system', '2018-03-11 15:59:50', 'system', '2018-03-11 15:59:50', null);
INSERT INTO `js_sys_area` VALUES ('341200', '340000', '0,340000,', '1110', '0000000120,0000001110,', '0', '1', '安徽省/阜阳市', '阜阳市', '2', '0', 'system', '2018-03-11 15:59:50', 'system', '2018-03-11 15:59:50', null);
INSERT INTO `js_sys_area` VALUES ('341201', '341200', '0,340000,341200,', '10970', '0000000120,0000001110,0000010970,', '1', '2', '安徽省/阜阳市/市辖区', '市辖区', '3', '0', 'system', '2018-03-11 15:59:50', 'system', '2018-03-11 15:59:50', null);
INSERT INTO `js_sys_area` VALUES ('341202', '341200', '0,340000,341200,', '10980', '0000000120,0000001110,0000010980,', '1', '2', '安徽省/阜阳市/颍州区', '颍州区', '3', '0', 'system', '2018-03-11 15:59:50', 'system', '2018-03-11 15:59:50', null);
INSERT INTO `js_sys_area` VALUES ('341203', '341200', '0,340000,341200,', '10990', '0000000120,0000001110,0000010990,', '1', '2', '安徽省/阜阳市/颍东区', '颍东区', '3', '0', 'system', '2018-03-11 15:59:50', 'system', '2018-03-11 15:59:50', null);
INSERT INTO `js_sys_area` VALUES ('341204', '341200', '0,340000,341200,', '11000', '0000000120,0000001110,0000011000,', '1', '2', '安徽省/阜阳市/颍泉区', '颍泉区', '3', '0', 'system', '2018-03-11 15:59:50', 'system', '2018-03-11 15:59:50', null);
INSERT INTO `js_sys_area` VALUES ('341221', '341200', '0,340000,341200,', '11010', '0000000120,0000001110,0000011010,', '1', '2', '安徽省/阜阳市/临泉县', '临泉县', '3', '0', 'system', '2018-03-11 15:59:50', 'system', '2018-03-11 15:59:50', null);
INSERT INTO `js_sys_area` VALUES ('341222', '341200', '0,340000,341200,', '11020', '0000000120,0000001110,0000011020,', '1', '2', '安徽省/阜阳市/太和县', '太和县', '3', '0', 'system', '2018-03-11 15:59:50', 'system', '2018-03-11 15:59:50', null);
INSERT INTO `js_sys_area` VALUES ('341225', '341200', '0,340000,341200,', '11030', '0000000120,0000001110,0000011030,', '1', '2', '安徽省/阜阳市/阜南县', '阜南县', '3', '0', 'system', '2018-03-11 15:59:50', 'system', '2018-03-11 15:59:50', null);
INSERT INTO `js_sys_area` VALUES ('341226', '341200', '0,340000,341200,', '11040', '0000000120,0000001110,0000011040,', '1', '2', '安徽省/阜阳市/颍上县', '颍上县', '3', '0', 'system', '2018-03-11 15:59:50', 'system', '2018-03-11 15:59:50', null);
INSERT INTO `js_sys_area` VALUES ('341282', '341200', '0,340000,341200,', '11050', '0000000120,0000001110,0000011050,', '1', '2', '安徽省/阜阳市/界首市', '界首市', '3', '0', 'system', '2018-03-11 15:59:50', 'system', '2018-03-11 15:59:50', null);
INSERT INTO `js_sys_area` VALUES ('341300', '340000', '0,340000,', '1120', '0000000120,0000001120,', '0', '1', '安徽省/宿州市', '宿州市', '2', '0', 'system', '2018-03-11 15:59:50', 'system', '2018-03-11 15:59:50', null);
INSERT INTO `js_sys_area` VALUES ('341301', '341300', '0,340000,341300,', '11060', '0000000120,0000001120,0000011060,', '1', '2', '安徽省/宿州市/市辖区', '市辖区', '3', '0', 'system', '2018-03-11 15:59:50', 'system', '2018-03-11 15:59:50', null);
INSERT INTO `js_sys_area` VALUES ('341302', '341300', '0,340000,341300,', '11070', '0000000120,0000001120,0000011070,', '1', '2', '安徽省/宿州市/墉桥区', '墉桥区', '3', '0', 'system', '2018-03-11 15:59:50', 'system', '2018-03-11 15:59:50', null);
INSERT INTO `js_sys_area` VALUES ('341321', '341300', '0,340000,341300,', '11080', '0000000120,0000001120,0000011080,', '1', '2', '安徽省/宿州市/砀山县', '砀山县', '3', '0', 'system', '2018-03-11 15:59:50', 'system', '2018-03-11 15:59:50', null);
INSERT INTO `js_sys_area` VALUES ('341322', '341300', '0,340000,341300,', '11090', '0000000120,0000001120,0000011090,', '1', '2', '安徽省/宿州市/萧　县', '萧　县', '3', '0', 'system', '2018-03-11 15:59:50', 'system', '2018-03-11 15:59:50', null);
INSERT INTO `js_sys_area` VALUES ('341323', '341300', '0,340000,341300,', '11100', '0000000120,0000001120,0000011100,', '1', '2', '安徽省/宿州市/灵璧县', '灵璧县', '3', '0', 'system', '2018-03-11 15:59:50', 'system', '2018-03-11 15:59:50', null);
INSERT INTO `js_sys_area` VALUES ('341324', '341300', '0,340000,341300,', '11110', '0000000120,0000001120,0000011110,', '1', '2', '安徽省/宿州市/泗　县', '泗　县', '3', '0', 'system', '2018-03-11 15:59:50', 'system', '2018-03-11 15:59:50', null);
INSERT INTO `js_sys_area` VALUES ('341400', '340000', '0,340000,', '1130', '0000000120,0000001130,', '0', '1', '安徽省/巢湖市', '巢湖市', '2', '0', 'system', '2018-03-11 15:59:51', 'system', '2018-03-11 15:59:50', null);
INSERT INTO `js_sys_area` VALUES ('341401', '341400', '0,340000,341400,', '11120', '0000000120,0000001130,0000011120,', '1', '2', '安徽省/巢湖市/市辖区', '市辖区', '3', '0', 'system', '2018-03-11 15:59:51', 'system', '2018-03-11 15:59:51', null);
INSERT INTO `js_sys_area` VALUES ('341402', '341400', '0,340000,341400,', '11130', '0000000120,0000001130,0000011130,', '1', '2', '安徽省/巢湖市/居巢区', '居巢区', '3', '0', 'system', '2018-03-11 15:59:51', 'system', '2018-03-11 15:59:51', null);
INSERT INTO `js_sys_area` VALUES ('341421', '341400', '0,340000,341400,', '11140', '0000000120,0000001130,0000011140,', '1', '2', '安徽省/巢湖市/庐江县', '庐江县', '3', '0', 'system', '2018-03-11 15:59:51', 'system', '2018-03-11 15:59:51', null);
INSERT INTO `js_sys_area` VALUES ('341422', '341400', '0,340000,341400,', '11150', '0000000120,0000001130,0000011150,', '1', '2', '安徽省/巢湖市/无为县', '无为县', '3', '0', 'system', '2018-03-11 15:59:51', 'system', '2018-03-11 15:59:51', null);
INSERT INTO `js_sys_area` VALUES ('341423', '341400', '0,340000,341400,', '11160', '0000000120,0000001130,0000011160,', '1', '2', '安徽省/巢湖市/含山县', '含山县', '3', '0', 'system', '2018-03-11 15:59:51', 'system', '2018-03-11 15:59:51', null);
INSERT INTO `js_sys_area` VALUES ('341424', '341400', '0,340000,341400,', '11170', '0000000120,0000001130,0000011170,', '1', '2', '安徽省/巢湖市/和　县', '和　县', '3', '0', 'system', '2018-03-11 15:59:51', 'system', '2018-03-11 15:59:51', null);
INSERT INTO `js_sys_area` VALUES ('341500', '340000', '0,340000,', '1140', '0000000120,0000001140,', '0', '1', '安徽省/六安市', '六安市', '2', '0', 'system', '2018-03-11 15:59:51', 'system', '2018-03-11 15:59:51', null);
INSERT INTO `js_sys_area` VALUES ('341501', '341500', '0,340000,341500,', '11180', '0000000120,0000001140,0000011180,', '1', '2', '安徽省/六安市/市辖区', '市辖区', '3', '0', 'system', '2018-03-11 15:59:51', 'system', '2018-03-11 15:59:51', null);
INSERT INTO `js_sys_area` VALUES ('341502', '341500', '0,340000,341500,', '11190', '0000000120,0000001140,0000011190,', '1', '2', '安徽省/六安市/金安区', '金安区', '3', '0', 'system', '2018-03-11 15:59:51', 'system', '2018-03-11 15:59:51', null);
INSERT INTO `js_sys_area` VALUES ('341503', '341500', '0,340000,341500,', '11200', '0000000120,0000001140,0000011200,', '1', '2', '安徽省/六安市/裕安区', '裕安区', '3', '0', 'system', '2018-03-11 15:59:51', 'system', '2018-03-11 15:59:51', null);
INSERT INTO `js_sys_area` VALUES ('341521', '341500', '0,340000,341500,', '11210', '0000000120,0000001140,0000011210,', '1', '2', '安徽省/六安市/寿　县', '寿　县', '3', '0', 'system', '2018-03-11 15:59:51', 'system', '2018-03-11 15:59:51', null);
INSERT INTO `js_sys_area` VALUES ('341522', '341500', '0,340000,341500,', '11220', '0000000120,0000001140,0000011220,', '1', '2', '安徽省/六安市/霍邱县', '霍邱县', '3', '0', 'system', '2018-03-11 15:59:51', 'system', '2018-03-11 15:59:51', null);
INSERT INTO `js_sys_area` VALUES ('341523', '341500', '0,340000,341500,', '11230', '0000000120,0000001140,0000011230,', '1', '2', '安徽省/六安市/舒城县', '舒城县', '3', '0', 'system', '2018-03-11 15:59:51', 'system', '2018-03-11 15:59:51', null);
INSERT INTO `js_sys_area` VALUES ('341524', '341500', '0,340000,341500,', '11240', '0000000120,0000001140,0000011240,', '1', '2', '安徽省/六安市/金寨县', '金寨县', '3', '0', 'system', '2018-03-11 15:59:51', 'system', '2018-03-11 15:59:51', null);
INSERT INTO `js_sys_area` VALUES ('341525', '341500', '0,340000,341500,', '11250', '0000000120,0000001140,0000011250,', '1', '2', '安徽省/六安市/霍山县', '霍山县', '3', '0', 'system', '2018-03-11 15:59:51', 'system', '2018-03-11 15:59:51', null);
INSERT INTO `js_sys_area` VALUES ('341600', '340000', '0,340000,', '1150', '0000000120,0000001150,', '0', '1', '安徽省/亳州市', '亳州市', '2', '0', 'system', '2018-03-11 15:59:51', 'system', '2018-03-11 15:59:51', null);
INSERT INTO `js_sys_area` VALUES ('341601', '341600', '0,340000,341600,', '11260', '0000000120,0000001150,0000011260,', '1', '2', '安徽省/亳州市/市辖区', '市辖区', '3', '0', 'system', '2018-03-11 15:59:51', 'system', '2018-03-11 15:59:51', null);
INSERT INTO `js_sys_area` VALUES ('341602', '341600', '0,340000,341600,', '11270', '0000000120,0000001150,0000011270,', '1', '2', '安徽省/亳州市/谯城区', '谯城区', '3', '0', 'system', '2018-03-11 15:59:51', 'system', '2018-03-11 15:59:51', null);
INSERT INTO `js_sys_area` VALUES ('341621', '341600', '0,340000,341600,', '11280', '0000000120,0000001150,0000011280,', '1', '2', '安徽省/亳州市/涡阳县', '涡阳县', '3', '0', 'system', '2018-03-11 15:59:51', 'system', '2018-03-11 15:59:51', null);
INSERT INTO `js_sys_area` VALUES ('341622', '341600', '0,340000,341600,', '11290', '0000000120,0000001150,0000011290,', '1', '2', '安徽省/亳州市/蒙城县', '蒙城县', '3', '0', 'system', '2018-03-11 15:59:51', 'system', '2018-03-11 15:59:51', null);
INSERT INTO `js_sys_area` VALUES ('341623', '341600', '0,340000,341600,', '11300', '0000000120,0000001150,0000011300,', '1', '2', '安徽省/亳州市/利辛县', '利辛县', '3', '0', 'system', '2018-03-11 15:59:51', 'system', '2018-03-11 15:59:51', null);
INSERT INTO `js_sys_area` VALUES ('341700', '340000', '0,340000,', '1160', '0000000120,0000001160,', '0', '1', '安徽省/池州市', '池州市', '2', '0', 'system', '2018-03-11 15:59:51', 'system', '2018-03-11 15:59:51', null);
INSERT INTO `js_sys_area` VALUES ('341701', '341700', '0,340000,341700,', '11310', '0000000120,0000001160,0000011310,', '1', '2', '安徽省/池州市/市辖区', '市辖区', '3', '0', 'system', '2018-03-11 15:59:51', 'system', '2018-03-11 15:59:51', null);
INSERT INTO `js_sys_area` VALUES ('341702', '341700', '0,340000,341700,', '11320', '0000000120,0000001160,0000011320,', '1', '2', '安徽省/池州市/贵池区', '贵池区', '3', '0', 'system', '2018-03-11 15:59:51', 'system', '2018-03-11 15:59:51', null);
INSERT INTO `js_sys_area` VALUES ('341721', '341700', '0,340000,341700,', '11330', '0000000120,0000001160,0000011330,', '1', '2', '安徽省/池州市/东至县', '东至县', '3', '0', 'system', '2018-03-11 15:59:51', 'system', '2018-03-11 15:59:51', null);
INSERT INTO `js_sys_area` VALUES ('341722', '341700', '0,340000,341700,', '11340', '0000000120,0000001160,0000011340,', '1', '2', '安徽省/池州市/石台县', '石台县', '3', '0', 'system', '2018-03-11 15:59:51', 'system', '2018-03-11 15:59:51', null);
INSERT INTO `js_sys_area` VALUES ('341723', '341700', '0,340000,341700,', '11350', '0000000120,0000001160,0000011350,', '1', '2', '安徽省/池州市/青阳县', '青阳县', '3', '0', 'system', '2018-03-11 15:59:51', 'system', '2018-03-11 15:59:51', null);
INSERT INTO `js_sys_area` VALUES ('341800', '340000', '0,340000,', '1170', '0000000120,0000001170,', '0', '1', '安徽省/宣城市', '宣城市', '2', '0', 'system', '2018-03-11 15:59:51', 'system', '2018-03-11 15:59:51', null);
INSERT INTO `js_sys_area` VALUES ('341801', '341800', '0,340000,341800,', '11360', '0000000120,0000001170,0000011360,', '1', '2', '安徽省/宣城市/市辖区', '市辖区', '3', '0', 'system', '2018-03-11 15:59:51', 'system', '2018-03-11 15:59:51', null);
INSERT INTO `js_sys_area` VALUES ('341802', '341800', '0,340000,341800,', '11370', '0000000120,0000001170,0000011370,', '1', '2', '安徽省/宣城市/宣州区', '宣州区', '3', '0', 'system', '2018-03-11 15:59:51', 'system', '2018-03-11 15:59:51', null);
INSERT INTO `js_sys_area` VALUES ('341821', '341800', '0,340000,341800,', '11380', '0000000120,0000001170,0000011380,', '1', '2', '安徽省/宣城市/郎溪县', '郎溪县', '3', '0', 'system', '2018-03-11 15:59:51', 'system', '2018-03-11 15:59:51', null);
INSERT INTO `js_sys_area` VALUES ('341822', '341800', '0,340000,341800,', '11390', '0000000120,0000001170,0000011390,', '1', '2', '安徽省/宣城市/广德县', '广德县', '3', '0', 'system', '2018-03-11 15:59:51', 'system', '2018-03-11 15:59:51', null);
INSERT INTO `js_sys_area` VALUES ('341823', '341800', '0,340000,341800,', '11400', '0000000120,0000001170,0000011400,', '1', '2', '安徽省/宣城市/泾　县', '泾　县', '3', '0', 'system', '2018-03-11 15:59:51', 'system', '2018-03-11 15:59:51', null);
INSERT INTO `js_sys_area` VALUES ('341824', '341800', '0,340000,341800,', '11410', '0000000120,0000001170,0000011410,', '1', '2', '安徽省/宣城市/绩溪县', '绩溪县', '3', '0', 'system', '2018-03-11 15:59:51', 'system', '2018-03-11 15:59:51', null);
INSERT INTO `js_sys_area` VALUES ('341825', '341800', '0,340000,341800,', '11420', '0000000120,0000001170,0000011420,', '1', '2', '安徽省/宣城市/旌德县', '旌德县', '3', '0', 'system', '2018-03-11 15:59:51', 'system', '2018-03-11 15:59:51', null);
INSERT INTO `js_sys_area` VALUES ('341881', '341800', '0,340000,341800,', '11430', '0000000120,0000001170,0000011430,', '1', '2', '安徽省/宣城市/宁国市', '宁国市', '3', '0', 'system', '2018-03-11 15:59:51', 'system', '2018-03-11 15:59:51', null);
INSERT INTO `js_sys_area` VALUES ('350000', '0', '0,', '130', '0000000130,', '0', '0', '福建省', '福建省', '1', '0', 'system', '2018-03-11 15:59:51', 'system', '2018-03-11 15:59:51', null);
INSERT INTO `js_sys_area` VALUES ('350100', '350000', '0,350000,', '1180', '0000000130,0000001180,', '0', '1', '福建省/福州市', '福州市', '2', '0', 'system', '2018-03-11 15:59:51', 'system', '2018-03-11 15:59:51', null);
INSERT INTO `js_sys_area` VALUES ('350101', '350100', '0,350000,350100,', '11440', '0000000130,0000001180,0000011440,', '1', '2', '福建省/福州市/市辖区', '市辖区', '3', '0', 'system', '2018-03-11 15:59:51', 'system', '2018-03-11 15:59:51', null);
INSERT INTO `js_sys_area` VALUES ('350102', '350100', '0,350000,350100,', '11450', '0000000130,0000001180,0000011450,', '1', '2', '福建省/福州市/鼓楼区', '鼓楼区', '3', '0', 'system', '2018-03-11 15:59:51', 'system', '2018-03-11 15:59:51', null);
INSERT INTO `js_sys_area` VALUES ('350103', '350100', '0,350000,350100,', '11460', '0000000130,0000001180,0000011460,', '1', '2', '福建省/福州市/台江区', '台江区', '3', '0', 'system', '2018-03-11 15:59:51', 'system', '2018-03-11 15:59:51', null);
INSERT INTO `js_sys_area` VALUES ('350104', '350100', '0,350000,350100,', '11470', '0000000130,0000001180,0000011470,', '1', '2', '福建省/福州市/仓山区', '仓山区', '3', '0', 'system', '2018-03-11 15:59:51', 'system', '2018-03-11 15:59:51', null);
INSERT INTO `js_sys_area` VALUES ('350105', '350100', '0,350000,350100,', '11480', '0000000130,0000001180,0000011480,', '1', '2', '福建省/福州市/马尾区', '马尾区', '3', '0', 'system', '2018-03-11 15:59:51', 'system', '2018-03-11 15:59:51', null);
INSERT INTO `js_sys_area` VALUES ('350111', '350100', '0,350000,350100,', '11490', '0000000130,0000001180,0000011490,', '1', '2', '福建省/福州市/晋安区', '晋安区', '3', '0', 'system', '2018-03-11 15:59:51', 'system', '2018-03-11 15:59:51', null);
INSERT INTO `js_sys_area` VALUES ('350121', '350100', '0,350000,350100,', '11500', '0000000130,0000001180,0000011500,', '1', '2', '福建省/福州市/闽侯县', '闽侯县', '3', '0', 'system', '2018-03-11 15:59:51', 'system', '2018-03-11 15:59:51', null);
INSERT INTO `js_sys_area` VALUES ('350122', '350100', '0,350000,350100,', '11510', '0000000130,0000001180,0000011510,', '1', '2', '福建省/福州市/连江县', '连江县', '3', '0', 'system', '2018-03-11 15:59:51', 'system', '2018-03-11 15:59:51', null);
INSERT INTO `js_sys_area` VALUES ('350123', '350100', '0,350000,350100,', '11520', '0000000130,0000001180,0000011520,', '1', '2', '福建省/福州市/罗源县', '罗源县', '3', '0', 'system', '2018-03-11 15:59:51', 'system', '2018-03-11 15:59:51', null);
INSERT INTO `js_sys_area` VALUES ('350124', '350100', '0,350000,350100,', '11530', '0000000130,0000001180,0000011530,', '1', '2', '福建省/福州市/闽清县', '闽清县', '3', '0', 'system', '2018-03-11 15:59:51', 'system', '2018-03-11 15:59:51', null);
INSERT INTO `js_sys_area` VALUES ('350125', '350100', '0,350000,350100,', '11540', '0000000130,0000001180,0000011540,', '1', '2', '福建省/福州市/永泰县', '永泰县', '3', '0', 'system', '2018-03-11 15:59:51', 'system', '2018-03-11 15:59:51', null);
INSERT INTO `js_sys_area` VALUES ('350128', '350100', '0,350000,350100,', '11550', '0000000130,0000001180,0000011550,', '1', '2', '福建省/福州市/平潭县', '平潭县', '3', '0', 'system', '2018-03-11 15:59:51', 'system', '2018-03-11 15:59:51', null);
INSERT INTO `js_sys_area` VALUES ('350181', '350100', '0,350000,350100,', '11560', '0000000130,0000001180,0000011560,', '1', '2', '福建省/福州市/福清市', '福清市', '3', '0', 'system', '2018-03-11 15:59:51', 'system', '2018-03-11 15:59:51', null);
INSERT INTO `js_sys_area` VALUES ('350182', '350100', '0,350000,350100,', '11570', '0000000130,0000001180,0000011570,', '1', '2', '福建省/福州市/长乐市', '长乐市', '3', '0', 'system', '2018-03-11 15:59:51', 'system', '2018-03-11 15:59:51', null);
INSERT INTO `js_sys_area` VALUES ('350200', '350000', '0,350000,', '1190', '0000000130,0000001190,', '0', '1', '福建省/厦门市', '厦门市', '2', '0', 'system', '2018-03-11 15:59:51', 'system', '2018-03-11 15:59:51', null);
INSERT INTO `js_sys_area` VALUES ('350201', '350200', '0,350000,350200,', '11580', '0000000130,0000001190,0000011580,', '1', '2', '福建省/厦门市/市辖区', '市辖区', '3', '0', 'system', '2018-03-11 15:59:51', 'system', '2018-03-11 15:59:51', null);
INSERT INTO `js_sys_area` VALUES ('350203', '350200', '0,350000,350200,', '11590', '0000000130,0000001190,0000011590,', '1', '2', '福建省/厦门市/思明区', '思明区', '3', '0', 'system', '2018-03-11 15:59:51', 'system', '2018-03-11 15:59:51', null);
INSERT INTO `js_sys_area` VALUES ('350205', '350200', '0,350000,350200,', '11600', '0000000130,0000001190,0000011600,', '1', '2', '福建省/厦门市/海沧区', '海沧区', '3', '0', 'system', '2018-03-11 15:59:51', 'system', '2018-03-11 15:59:51', null);
INSERT INTO `js_sys_area` VALUES ('350206', '350200', '0,350000,350200,', '11610', '0000000130,0000001190,0000011610,', '1', '2', '福建省/厦门市/湖里区', '湖里区', '3', '0', 'system', '2018-03-11 15:59:51', 'system', '2018-03-11 15:59:51', null);
INSERT INTO `js_sys_area` VALUES ('350211', '350200', '0,350000,350200,', '11620', '0000000130,0000001190,0000011620,', '1', '2', '福建省/厦门市/集美区', '集美区', '3', '0', 'system', '2018-03-11 15:59:51', 'system', '2018-03-11 15:59:51', null);
INSERT INTO `js_sys_area` VALUES ('350212', '350200', '0,350000,350200,', '11630', '0000000130,0000001190,0000011630,', '1', '2', '福建省/厦门市/同安区', '同安区', '3', '0', 'system', '2018-03-11 15:59:51', 'system', '2018-03-11 15:59:51', null);
INSERT INTO `js_sys_area` VALUES ('350213', '350200', '0,350000,350200,', '11640', '0000000130,0000001190,0000011640,', '1', '2', '福建省/厦门市/翔安区', '翔安区', '3', '0', 'system', '2018-03-11 15:59:51', 'system', '2018-03-11 15:59:51', null);
INSERT INTO `js_sys_area` VALUES ('350300', '350000', '0,350000,', '1200', '0000000130,0000001200,', '0', '1', '福建省/莆田市', '莆田市', '2', '0', 'system', '2018-03-11 15:59:51', 'system', '2018-03-11 15:59:51', null);
INSERT INTO `js_sys_area` VALUES ('350301', '350300', '0,350000,350300,', '11650', '0000000130,0000001200,0000011650,', '1', '2', '福建省/莆田市/市辖区', '市辖区', '3', '0', 'system', '2018-03-11 15:59:51', 'system', '2018-03-11 15:59:51', null);
INSERT INTO `js_sys_area` VALUES ('350302', '350300', '0,350000,350300,', '11660', '0000000130,0000001200,0000011660,', '1', '2', '福建省/莆田市/城厢区', '城厢区', '3', '0', 'system', '2018-03-11 15:59:52', 'system', '2018-03-11 15:59:52', null);
INSERT INTO `js_sys_area` VALUES ('350303', '350300', '0,350000,350300,', '11670', '0000000130,0000001200,0000011670,', '1', '2', '福建省/莆田市/涵江区', '涵江区', '3', '0', 'system', '2018-03-11 15:59:52', 'system', '2018-03-11 15:59:52', null);
INSERT INTO `js_sys_area` VALUES ('350304', '350300', '0,350000,350300,', '11680', '0000000130,0000001200,0000011680,', '1', '2', '福建省/莆田市/荔城区', '荔城区', '3', '0', 'system', '2018-03-11 15:59:52', 'system', '2018-03-11 15:59:52', null);
INSERT INTO `js_sys_area` VALUES ('350305', '350300', '0,350000,350300,', '11690', '0000000130,0000001200,0000011690,', '1', '2', '福建省/莆田市/秀屿区', '秀屿区', '3', '0', 'system', '2018-03-11 15:59:52', 'system', '2018-03-11 15:59:52', null);
INSERT INTO `js_sys_area` VALUES ('350322', '350300', '0,350000,350300,', '11700', '0000000130,0000001200,0000011700,', '1', '2', '福建省/莆田市/仙游县', '仙游县', '3', '0', 'system', '2018-03-11 15:59:52', 'system', '2018-03-11 15:59:52', null);
INSERT INTO `js_sys_area` VALUES ('350400', '350000', '0,350000,', '1210', '0000000130,0000001210,', '0', '1', '福建省/三明市', '三明市', '2', '0', 'system', '2018-03-11 15:59:52', 'system', '2018-03-11 15:59:52', null);
INSERT INTO `js_sys_area` VALUES ('350401', '350400', '0,350000,350400,', '11710', '0000000130,0000001210,0000011710,', '1', '2', '福建省/三明市/市辖区', '市辖区', '3', '0', 'system', '2018-03-11 15:59:52', 'system', '2018-03-11 15:59:52', null);
INSERT INTO `js_sys_area` VALUES ('350402', '350400', '0,350000,350400,', '11720', '0000000130,0000001210,0000011720,', '1', '2', '福建省/三明市/梅列区', '梅列区', '3', '0', 'system', '2018-03-11 15:59:52', 'system', '2018-03-11 15:59:52', null);
INSERT INTO `js_sys_area` VALUES ('350403', '350400', '0,350000,350400,', '11730', '0000000130,0000001210,0000011730,', '1', '2', '福建省/三明市/三元区', '三元区', '3', '0', 'system', '2018-03-11 15:59:52', 'system', '2018-03-11 15:59:52', null);
INSERT INTO `js_sys_area` VALUES ('350421', '350400', '0,350000,350400,', '11740', '0000000130,0000001210,0000011740,', '1', '2', '福建省/三明市/明溪县', '明溪县', '3', '0', 'system', '2018-03-11 15:59:52', 'system', '2018-03-11 15:59:52', null);
INSERT INTO `js_sys_area` VALUES ('350423', '350400', '0,350000,350400,', '11750', '0000000130,0000001210,0000011750,', '1', '2', '福建省/三明市/清流县', '清流县', '3', '0', 'system', '2018-03-11 15:59:52', 'system', '2018-03-11 15:59:52', null);
INSERT INTO `js_sys_area` VALUES ('350424', '350400', '0,350000,350400,', '11760', '0000000130,0000001210,0000011760,', '1', '2', '福建省/三明市/宁化县', '宁化县', '3', '0', 'system', '2018-03-11 15:59:52', 'system', '2018-03-11 15:59:52', null);
INSERT INTO `js_sys_area` VALUES ('350425', '350400', '0,350000,350400,', '11770', '0000000130,0000001210,0000011770,', '1', '2', '福建省/三明市/大田县', '大田县', '3', '0', 'system', '2018-03-11 15:59:52', 'system', '2018-03-11 15:59:52', null);
INSERT INTO `js_sys_area` VALUES ('350426', '350400', '0,350000,350400,', '11780', '0000000130,0000001210,0000011780,', '1', '2', '福建省/三明市/尤溪县', '尤溪县', '3', '0', 'system', '2018-03-11 15:59:52', 'system', '2018-03-11 15:59:52', null);
INSERT INTO `js_sys_area` VALUES ('350427', '350400', '0,350000,350400,', '11790', '0000000130,0000001210,0000011790,', '1', '2', '福建省/三明市/沙　县', '沙　县', '3', '0', 'system', '2018-03-11 15:59:52', 'system', '2018-03-11 15:59:52', null);
INSERT INTO `js_sys_area` VALUES ('350428', '350400', '0,350000,350400,', '11800', '0000000130,0000001210,0000011800,', '1', '2', '福建省/三明市/将乐县', '将乐县', '3', '0', 'system', '2018-03-11 15:59:52', 'system', '2018-03-11 15:59:52', null);
INSERT INTO `js_sys_area` VALUES ('350429', '350400', '0,350000,350400,', '11810', '0000000130,0000001210,0000011810,', '1', '2', '福建省/三明市/泰宁县', '泰宁县', '3', '0', 'system', '2018-03-11 15:59:52', 'system', '2018-03-11 15:59:52', null);
INSERT INTO `js_sys_area` VALUES ('350430', '350400', '0,350000,350400,', '11820', '0000000130,0000001210,0000011820,', '1', '2', '福建省/三明市/建宁县', '建宁县', '3', '0', 'system', '2018-03-11 15:59:52', 'system', '2018-03-11 15:59:52', null);
INSERT INTO `js_sys_area` VALUES ('350481', '350400', '0,350000,350400,', '11830', '0000000130,0000001210,0000011830,', '1', '2', '福建省/三明市/永安市', '永安市', '3', '0', 'system', '2018-03-11 15:59:52', 'system', '2018-03-11 15:59:52', null);
INSERT INTO `js_sys_area` VALUES ('350500', '350000', '0,350000,', '1220', '0000000130,0000001220,', '0', '1', '福建省/泉州市', '泉州市', '2', '0', 'system', '2018-03-11 15:59:52', 'system', '2018-03-11 15:59:52', null);
INSERT INTO `js_sys_area` VALUES ('350501', '350500', '0,350000,350500,', '11840', '0000000130,0000001220,0000011840,', '1', '2', '福建省/泉州市/市辖区', '市辖区', '3', '0', 'system', '2018-03-11 15:59:52', 'system', '2018-03-11 15:59:52', null);
INSERT INTO `js_sys_area` VALUES ('350502', '350500', '0,350000,350500,', '11850', '0000000130,0000001220,0000011850,', '1', '2', '福建省/泉州市/鲤城区', '鲤城区', '3', '0', 'system', '2018-03-11 15:59:52', 'system', '2018-03-11 15:59:52', null);
INSERT INTO `js_sys_area` VALUES ('350503', '350500', '0,350000,350500,', '11860', '0000000130,0000001220,0000011860,', '1', '2', '福建省/泉州市/丰泽区', '丰泽区', '3', '0', 'system', '2018-03-11 15:59:52', 'system', '2018-03-11 15:59:52', null);
INSERT INTO `js_sys_area` VALUES ('350504', '350500', '0,350000,350500,', '11870', '0000000130,0000001220,0000011870,', '1', '2', '福建省/泉州市/洛江区', '洛江区', '3', '0', 'system', '2018-03-11 15:59:52', 'system', '2018-03-11 15:59:52', null);
INSERT INTO `js_sys_area` VALUES ('350505', '350500', '0,350000,350500,', '11880', '0000000130,0000001220,0000011880,', '1', '2', '福建省/泉州市/泉港区', '泉港区', '3', '0', 'system', '2018-03-11 15:59:52', 'system', '2018-03-11 15:59:52', null);
INSERT INTO `js_sys_area` VALUES ('350521', '350500', '0,350000,350500,', '11890', '0000000130,0000001220,0000011890,', '1', '2', '福建省/泉州市/惠安县', '惠安县', '3', '0', 'system', '2018-03-11 15:59:52', 'system', '2018-03-11 15:59:52', null);
INSERT INTO `js_sys_area` VALUES ('350524', '350500', '0,350000,350500,', '11900', '0000000130,0000001220,0000011900,', '1', '2', '福建省/泉州市/安溪县', '安溪县', '3', '0', 'system', '2018-03-11 15:59:52', 'system', '2018-03-11 15:59:52', null);
INSERT INTO `js_sys_area` VALUES ('350525', '350500', '0,350000,350500,', '11910', '0000000130,0000001220,0000011910,', '1', '2', '福建省/泉州市/永春县', '永春县', '3', '0', 'system', '2018-03-11 15:59:52', 'system', '2018-03-11 15:59:52', null);
INSERT INTO `js_sys_area` VALUES ('350526', '350500', '0,350000,350500,', '11920', '0000000130,0000001220,0000011920,', '1', '2', '福建省/泉州市/德化县', '德化县', '3', '0', 'system', '2018-03-11 15:59:52', 'system', '2018-03-11 15:59:52', null);
INSERT INTO `js_sys_area` VALUES ('350527', '350500', '0,350000,350500,', '11930', '0000000130,0000001220,0000011930,', '1', '2', '福建省/泉州市/金门县', '金门县', '3', '0', 'system', '2018-03-11 15:59:52', 'system', '2018-03-11 15:59:52', null);
INSERT INTO `js_sys_area` VALUES ('350581', '350500', '0,350000,350500,', '11940', '0000000130,0000001220,0000011940,', '1', '2', '福建省/泉州市/石狮市', '石狮市', '3', '0', 'system', '2018-03-11 15:59:52', 'system', '2018-03-11 15:59:52', null);
INSERT INTO `js_sys_area` VALUES ('350582', '350500', '0,350000,350500,', '11950', '0000000130,0000001220,0000011950,', '1', '2', '福建省/泉州市/晋江市', '晋江市', '3', '0', 'system', '2018-03-11 15:59:52', 'system', '2018-03-11 15:59:52', null);
INSERT INTO `js_sys_area` VALUES ('350583', '350500', '0,350000,350500,', '11960', '0000000130,0000001220,0000011960,', '1', '2', '福建省/泉州市/南安市', '南安市', '3', '0', 'system', '2018-03-11 15:59:52', 'system', '2018-03-11 15:59:52', null);
INSERT INTO `js_sys_area` VALUES ('350600', '350000', '0,350000,', '1230', '0000000130,0000001230,', '0', '1', '福建省/漳州市', '漳州市', '2', '0', 'system', '2018-03-11 15:59:52', 'system', '2018-03-11 15:59:52', null);
INSERT INTO `js_sys_area` VALUES ('350601', '350600', '0,350000,350600,', '11970', '0000000130,0000001230,0000011970,', '1', '2', '福建省/漳州市/市辖区', '市辖区', '3', '0', 'system', '2018-03-11 15:59:52', 'system', '2018-03-11 15:59:52', null);
INSERT INTO `js_sys_area` VALUES ('350602', '350600', '0,350000,350600,', '11980', '0000000130,0000001230,0000011980,', '1', '2', '福建省/漳州市/芗城区', '芗城区', '3', '0', 'system', '2018-03-11 15:59:52', 'system', '2018-03-11 15:59:52', null);
INSERT INTO `js_sys_area` VALUES ('350603', '350600', '0,350000,350600,', '11990', '0000000130,0000001230,0000011990,', '1', '2', '福建省/漳州市/龙文区', '龙文区', '3', '0', 'system', '2018-03-11 15:59:52', 'system', '2018-03-11 15:59:52', null);
INSERT INTO `js_sys_area` VALUES ('350622', '350600', '0,350000,350600,', '12000', '0000000130,0000001230,0000012000,', '1', '2', '福建省/漳州市/云霄县', '云霄县', '3', '0', 'system', '2018-03-11 15:59:52', 'system', '2018-03-11 15:59:52', null);
INSERT INTO `js_sys_area` VALUES ('350623', '350600', '0,350000,350600,', '12010', '0000000130,0000001230,0000012010,', '1', '2', '福建省/漳州市/漳浦县', '漳浦县', '3', '0', 'system', '2018-03-11 15:59:52', 'system', '2018-03-11 15:59:52', null);
INSERT INTO `js_sys_area` VALUES ('350624', '350600', '0,350000,350600,', '12020', '0000000130,0000001230,0000012020,', '1', '2', '福建省/漳州市/诏安县', '诏安县', '3', '0', 'system', '2018-03-11 15:59:52', 'system', '2018-03-11 15:59:52', null);
INSERT INTO `js_sys_area` VALUES ('350625', '350600', '0,350000,350600,', '12030', '0000000130,0000001230,0000012030,', '1', '2', '福建省/漳州市/长泰县', '长泰县', '3', '0', 'system', '2018-03-11 15:59:52', 'system', '2018-03-11 15:59:52', null);
INSERT INTO `js_sys_area` VALUES ('350626', '350600', '0,350000,350600,', '12040', '0000000130,0000001230,0000012040,', '1', '2', '福建省/漳州市/东山县', '东山县', '3', '0', 'system', '2018-03-11 15:59:52', 'system', '2018-03-11 15:59:52', null);
INSERT INTO `js_sys_area` VALUES ('350627', '350600', '0,350000,350600,', '12050', '0000000130,0000001230,0000012050,', '1', '2', '福建省/漳州市/南靖县', '南靖县', '3', '0', 'system', '2018-03-11 15:59:52', 'system', '2018-03-11 15:59:52', null);
INSERT INTO `js_sys_area` VALUES ('350628', '350600', '0,350000,350600,', '12060', '0000000130,0000001230,0000012060,', '1', '2', '福建省/漳州市/平和县', '平和县', '3', '0', 'system', '2018-03-11 15:59:52', 'system', '2018-03-11 15:59:52', null);
INSERT INTO `js_sys_area` VALUES ('350629', '350600', '0,350000,350600,', '12070', '0000000130,0000001230,0000012070,', '1', '2', '福建省/漳州市/华安县', '华安县', '3', '0', 'system', '2018-03-11 15:59:52', 'system', '2018-03-11 15:59:52', null);
INSERT INTO `js_sys_area` VALUES ('350681', '350600', '0,350000,350600,', '12080', '0000000130,0000001230,0000012080,', '1', '2', '福建省/漳州市/龙海市', '龙海市', '3', '0', 'system', '2018-03-11 15:59:52', 'system', '2018-03-11 15:59:52', null);
INSERT INTO `js_sys_area` VALUES ('350700', '350000', '0,350000,', '1240', '0000000130,0000001240,', '0', '1', '福建省/南平市', '南平市', '2', '0', 'system', '2018-03-11 15:59:52', 'system', '2018-03-11 15:59:52', null);
INSERT INTO `js_sys_area` VALUES ('350701', '350700', '0,350000,350700,', '12090', '0000000130,0000001240,0000012090,', '1', '2', '福建省/南平市/市辖区', '市辖区', '3', '0', 'system', '2018-03-11 15:59:52', 'system', '2018-03-11 15:59:52', null);
INSERT INTO `js_sys_area` VALUES ('350702', '350700', '0,350000,350700,', '12100', '0000000130,0000001240,0000012100,', '1', '2', '福建省/南平市/延平区', '延平区', '3', '0', 'system', '2018-03-11 15:59:52', 'system', '2018-03-11 15:59:52', null);
INSERT INTO `js_sys_area` VALUES ('350721', '350700', '0,350000,350700,', '12110', '0000000130,0000001240,0000012110,', '1', '2', '福建省/南平市/顺昌县', '顺昌县', '3', '0', 'system', '2018-03-11 15:59:52', 'system', '2018-03-11 15:59:52', null);
INSERT INTO `js_sys_area` VALUES ('350722', '350700', '0,350000,350700,', '12120', '0000000130,0000001240,0000012120,', '1', '2', '福建省/南平市/浦城县', '浦城县', '3', '0', 'system', '2018-03-11 15:59:52', 'system', '2018-03-11 15:59:52', null);
INSERT INTO `js_sys_area` VALUES ('350723', '350700', '0,350000,350700,', '12130', '0000000130,0000001240,0000012130,', '1', '2', '福建省/南平市/光泽县', '光泽县', '3', '0', 'system', '2018-03-11 15:59:52', 'system', '2018-03-11 15:59:52', null);
INSERT INTO `js_sys_area` VALUES ('350724', '350700', '0,350000,350700,', '12140', '0000000130,0000001240,0000012140,', '1', '2', '福建省/南平市/松溪县', '松溪县', '3', '0', 'system', '2018-03-11 15:59:52', 'system', '2018-03-11 15:59:52', null);
INSERT INTO `js_sys_area` VALUES ('350725', '350700', '0,350000,350700,', '12150', '0000000130,0000001240,0000012150,', '1', '2', '福建省/南平市/政和县', '政和县', '3', '0', 'system', '2018-03-11 15:59:53', 'system', '2018-03-11 15:59:53', null);
INSERT INTO `js_sys_area` VALUES ('350781', '350700', '0,350000,350700,', '12160', '0000000130,0000001240,0000012160,', '1', '2', '福建省/南平市/邵武市', '邵武市', '3', '0', 'system', '2018-03-11 15:59:53', 'system', '2018-03-11 15:59:53', null);
INSERT INTO `js_sys_area` VALUES ('350782', '350700', '0,350000,350700,', '12170', '0000000130,0000001240,0000012170,', '1', '2', '福建省/南平市/武夷山市', '武夷山市', '3', '0', 'system', '2018-03-11 15:59:53', 'system', '2018-03-11 15:59:53', null);
INSERT INTO `js_sys_area` VALUES ('350783', '350700', '0,350000,350700,', '12180', '0000000130,0000001240,0000012180,', '1', '2', '福建省/南平市/建瓯市', '建瓯市', '3', '0', 'system', '2018-03-11 15:59:53', 'system', '2018-03-11 15:59:53', null);
INSERT INTO `js_sys_area` VALUES ('350784', '350700', '0,350000,350700,', '12190', '0000000130,0000001240,0000012190,', '1', '2', '福建省/南平市/建阳市', '建阳市', '3', '0', 'system', '2018-03-11 15:59:53', 'system', '2018-03-11 15:59:53', null);
INSERT INTO `js_sys_area` VALUES ('350800', '350000', '0,350000,', '1250', '0000000130,0000001250,', '0', '1', '福建省/龙岩市', '龙岩市', '2', '0', 'system', '2018-03-11 15:59:53', 'system', '2018-03-11 15:59:53', null);
INSERT INTO `js_sys_area` VALUES ('350801', '350800', '0,350000,350800,', '12200', '0000000130,0000001250,0000012200,', '1', '2', '福建省/龙岩市/市辖区', '市辖区', '3', '0', 'system', '2018-03-11 15:59:53', 'system', '2018-03-11 15:59:53', null);
INSERT INTO `js_sys_area` VALUES ('350802', '350800', '0,350000,350800,', '12210', '0000000130,0000001250,0000012210,', '1', '2', '福建省/龙岩市/新罗区', '新罗区', '3', '0', 'system', '2018-03-11 15:59:53', 'system', '2018-03-11 15:59:53', null);
INSERT INTO `js_sys_area` VALUES ('350821', '350800', '0,350000,350800,', '12220', '0000000130,0000001250,0000012220,', '1', '2', '福建省/龙岩市/长汀县', '长汀县', '3', '0', 'system', '2018-03-11 15:59:53', 'system', '2018-03-11 15:59:53', null);
INSERT INTO `js_sys_area` VALUES ('350822', '350800', '0,350000,350800,', '12230', '0000000130,0000001250,0000012230,', '1', '2', '福建省/龙岩市/永定县', '永定县', '3', '0', 'system', '2018-03-11 15:59:53', 'system', '2018-03-11 15:59:53', null);
INSERT INTO `js_sys_area` VALUES ('350823', '350800', '0,350000,350800,', '12240', '0000000130,0000001250,0000012240,', '1', '2', '福建省/龙岩市/上杭县', '上杭县', '3', '0', 'system', '2018-03-11 15:59:53', 'system', '2018-03-11 15:59:53', null);
INSERT INTO `js_sys_area` VALUES ('350824', '350800', '0,350000,350800,', '12250', '0000000130,0000001250,0000012250,', '1', '2', '福建省/龙岩市/武平县', '武平县', '3', '0', 'system', '2018-03-11 15:59:53', 'system', '2018-03-11 15:59:53', null);
INSERT INTO `js_sys_area` VALUES ('350825', '350800', '0,350000,350800,', '12260', '0000000130,0000001250,0000012260,', '1', '2', '福建省/龙岩市/连城县', '连城县', '3', '0', 'system', '2018-03-11 15:59:53', 'system', '2018-03-11 15:59:53', null);
INSERT INTO `js_sys_area` VALUES ('350881', '350800', '0,350000,350800,', '12270', '0000000130,0000001250,0000012270,', '1', '2', '福建省/龙岩市/漳平市', '漳平市', '3', '0', 'system', '2018-03-11 15:59:53', 'system', '2018-03-11 15:59:53', null);
INSERT INTO `js_sys_area` VALUES ('350900', '350000', '0,350000,', '1260', '0000000130,0000001260,', '0', '1', '福建省/宁德市', '宁德市', '2', '0', 'system', '2018-03-11 15:59:53', 'system', '2018-03-11 15:59:53', null);
INSERT INTO `js_sys_area` VALUES ('350901', '350900', '0,350000,350900,', '12280', '0000000130,0000001260,0000012280,', '1', '2', '福建省/宁德市/市辖区', '市辖区', '3', '0', 'system', '2018-03-11 15:59:53', 'system', '2018-03-11 15:59:53', null);
INSERT INTO `js_sys_area` VALUES ('350902', '350900', '0,350000,350900,', '12290', '0000000130,0000001260,0000012290,', '1', '2', '福建省/宁德市/蕉城区', '蕉城区', '3', '0', 'system', '2018-03-11 15:59:53', 'system', '2018-03-11 15:59:53', null);
INSERT INTO `js_sys_area` VALUES ('350921', '350900', '0,350000,350900,', '12300', '0000000130,0000001260,0000012300,', '1', '2', '福建省/宁德市/霞浦县', '霞浦县', '3', '0', 'system', '2018-03-11 15:59:53', 'system', '2018-03-11 15:59:53', null);
INSERT INTO `js_sys_area` VALUES ('350922', '350900', '0,350000,350900,', '12310', '0000000130,0000001260,0000012310,', '1', '2', '福建省/宁德市/古田县', '古田县', '3', '0', 'system', '2018-03-11 15:59:53', 'system', '2018-03-11 15:59:53', null);
INSERT INTO `js_sys_area` VALUES ('350923', '350900', '0,350000,350900,', '12320', '0000000130,0000001260,0000012320,', '1', '2', '福建省/宁德市/屏南县', '屏南县', '3', '0', 'system', '2018-03-11 15:59:53', 'system', '2018-03-11 15:59:53', null);
INSERT INTO `js_sys_area` VALUES ('350924', '350900', '0,350000,350900,', '12330', '0000000130,0000001260,0000012330,', '1', '2', '福建省/宁德市/寿宁县', '寿宁县', '3', '0', 'system', '2018-03-11 15:59:53', 'system', '2018-03-11 15:59:53', null);
INSERT INTO `js_sys_area` VALUES ('350925', '350900', '0,350000,350900,', '12340', '0000000130,0000001260,0000012340,', '1', '2', '福建省/宁德市/周宁县', '周宁县', '3', '0', 'system', '2018-03-11 15:59:53', 'system', '2018-03-11 15:59:53', null);
INSERT INTO `js_sys_area` VALUES ('350926', '350900', '0,350000,350900,', '12350', '0000000130,0000001260,0000012350,', '1', '2', '福建省/宁德市/柘荣县', '柘荣县', '3', '0', 'system', '2018-03-11 15:59:53', 'system', '2018-03-11 15:59:53', null);
INSERT INTO `js_sys_area` VALUES ('350981', '350900', '0,350000,350900,', '12360', '0000000130,0000001260,0000012360,', '1', '2', '福建省/宁德市/福安市', '福安市', '3', '0', 'system', '2018-03-11 15:59:53', 'system', '2018-03-11 15:59:53', null);
INSERT INTO `js_sys_area` VALUES ('350982', '350900', '0,350000,350900,', '12370', '0000000130,0000001260,0000012370,', '1', '2', '福建省/宁德市/福鼎市', '福鼎市', '3', '0', 'system', '2018-03-11 15:59:53', 'system', '2018-03-11 15:59:53', null);
INSERT INTO `js_sys_area` VALUES ('360000', '0', '0,', '140', '0000000140,', '0', '0', '江西省', '江西省', '1', '0', 'system', '2018-03-11 15:59:53', 'system', '2018-03-11 15:59:53', null);
INSERT INTO `js_sys_area` VALUES ('360100', '360000', '0,360000,', '1270', '0000000140,0000001270,', '0', '1', '江西省/南昌市', '南昌市', '2', '0', 'system', '2018-03-11 15:59:53', 'system', '2018-03-11 15:59:53', null);
INSERT INTO `js_sys_area` VALUES ('360101', '360100', '0,360000,360100,', '12380', '0000000140,0000001270,0000012380,', '1', '2', '江西省/南昌市/市辖区', '市辖区', '3', '0', 'system', '2018-03-11 15:59:53', 'system', '2018-03-11 15:59:53', null);
INSERT INTO `js_sys_area` VALUES ('360102', '360100', '0,360000,360100,', '12390', '0000000140,0000001270,0000012390,', '1', '2', '江西省/南昌市/东湖区', '东湖区', '3', '0', 'system', '2018-03-11 15:59:53', 'system', '2018-03-11 15:59:53', null);
INSERT INTO `js_sys_area` VALUES ('360103', '360100', '0,360000,360100,', '12400', '0000000140,0000001270,0000012400,', '1', '2', '江西省/南昌市/西湖区', '西湖区', '3', '0', 'system', '2018-03-11 15:59:53', 'system', '2018-03-11 15:59:53', null);
INSERT INTO `js_sys_area` VALUES ('360104', '360100', '0,360000,360100,', '12410', '0000000140,0000001270,0000012410,', '1', '2', '江西省/南昌市/青云谱区', '青云谱区', '3', '0', 'system', '2018-03-11 15:59:53', 'system', '2018-03-11 15:59:53', null);
INSERT INTO `js_sys_area` VALUES ('360105', '360100', '0,360000,360100,', '12420', '0000000140,0000001270,0000012420,', '1', '2', '江西省/南昌市/湾里区', '湾里区', '3', '0', 'system', '2018-03-11 15:59:53', 'system', '2018-03-11 15:59:53', null);
INSERT INTO `js_sys_area` VALUES ('360111', '360100', '0,360000,360100,', '12430', '0000000140,0000001270,0000012430,', '1', '2', '江西省/南昌市/青山湖区', '青山湖区', '3', '0', 'system', '2018-03-11 15:59:53', 'system', '2018-03-11 15:59:53', null);
INSERT INTO `js_sys_area` VALUES ('360121', '360100', '0,360000,360100,', '12440', '0000000140,0000001270,0000012440,', '1', '2', '江西省/南昌市/南昌县', '南昌县', '3', '0', 'system', '2018-03-11 15:59:53', 'system', '2018-03-11 15:59:53', null);
INSERT INTO `js_sys_area` VALUES ('360122', '360100', '0,360000,360100,', '12450', '0000000140,0000001270,0000012450,', '1', '2', '江西省/南昌市/新建县', '新建县', '3', '0', 'system', '2018-03-11 15:59:53', 'system', '2018-03-11 15:59:53', null);
INSERT INTO `js_sys_area` VALUES ('360123', '360100', '0,360000,360100,', '12460', '0000000140,0000001270,0000012460,', '1', '2', '江西省/南昌市/安义县', '安义县', '3', '0', 'system', '2018-03-11 15:59:53', 'system', '2018-03-11 15:59:53', null);
INSERT INTO `js_sys_area` VALUES ('360124', '360100', '0,360000,360100,', '12470', '0000000140,0000001270,0000012470,', '1', '2', '江西省/南昌市/进贤县', '进贤县', '3', '0', 'system', '2018-03-11 15:59:53', 'system', '2018-03-11 15:59:53', null);
INSERT INTO `js_sys_area` VALUES ('360200', '360000', '0,360000,', '1280', '0000000140,0000001280,', '0', '1', '江西省/景德镇市', '景德镇市', '2', '0', 'system', '2018-03-11 15:59:53', 'system', '2018-03-11 15:59:53', null);
INSERT INTO `js_sys_area` VALUES ('360201', '360200', '0,360000,360200,', '12480', '0000000140,0000001280,0000012480,', '1', '2', '江西省/景德镇市/市辖区', '市辖区', '3', '0', 'system', '2018-03-11 15:59:53', 'system', '2018-03-11 15:59:53', null);
INSERT INTO `js_sys_area` VALUES ('360202', '360200', '0,360000,360200,', '12490', '0000000140,0000001280,0000012490,', '1', '2', '江西省/景德镇市/昌江区', '昌江区', '3', '0', 'system', '2018-03-11 15:59:53', 'system', '2018-03-11 15:59:53', null);
INSERT INTO `js_sys_area` VALUES ('360203', '360200', '0,360000,360200,', '12500', '0000000140,0000001280,0000012500,', '1', '2', '江西省/景德镇市/珠山区', '珠山区', '3', '0', 'system', '2018-03-11 15:59:53', 'system', '2018-03-11 15:59:53', null);
INSERT INTO `js_sys_area` VALUES ('360222', '360200', '0,360000,360200,', '12510', '0000000140,0000001280,0000012510,', '1', '2', '江西省/景德镇市/浮梁县', '浮梁县', '3', '0', 'system', '2018-03-11 15:59:53', 'system', '2018-03-11 15:59:53', null);
INSERT INTO `js_sys_area` VALUES ('360281', '360200', '0,360000,360200,', '12520', '0000000140,0000001280,0000012520,', '1', '2', '江西省/景德镇市/乐平市', '乐平市', '3', '0', 'system', '2018-03-11 15:59:53', 'system', '2018-03-11 15:59:53', null);
INSERT INTO `js_sys_area` VALUES ('360300', '360000', '0,360000,', '1290', '0000000140,0000001290,', '0', '1', '江西省/萍乡市', '萍乡市', '2', '0', 'system', '2018-03-11 15:59:53', 'system', '2018-03-11 15:59:53', null);
INSERT INTO `js_sys_area` VALUES ('360301', '360300', '0,360000,360300,', '12530', '0000000140,0000001290,0000012530,', '1', '2', '江西省/萍乡市/市辖区', '市辖区', '3', '0', 'system', '2018-03-11 15:59:53', 'system', '2018-03-11 15:59:53', null);
INSERT INTO `js_sys_area` VALUES ('360302', '360300', '0,360000,360300,', '12540', '0000000140,0000001290,0000012540,', '1', '2', '江西省/萍乡市/安源区', '安源区', '3', '0', 'system', '2018-03-11 15:59:53', 'system', '2018-03-11 15:59:53', null);
INSERT INTO `js_sys_area` VALUES ('360313', '360300', '0,360000,360300,', '12550', '0000000140,0000001290,0000012550,', '1', '2', '江西省/萍乡市/湘东区', '湘东区', '3', '0', 'system', '2018-03-11 15:59:53', 'system', '2018-03-11 15:59:53', null);
INSERT INTO `js_sys_area` VALUES ('360321', '360300', '0,360000,360300,', '12560', '0000000140,0000001290,0000012560,', '1', '2', '江西省/萍乡市/莲花县', '莲花县', '3', '0', 'system', '2018-03-11 15:59:53', 'system', '2018-03-11 15:59:53', null);
INSERT INTO `js_sys_area` VALUES ('360322', '360300', '0,360000,360300,', '12570', '0000000140,0000001290,0000012570,', '1', '2', '江西省/萍乡市/上栗县', '上栗县', '3', '0', 'system', '2018-03-11 15:59:53', 'system', '2018-03-11 15:59:53', null);
INSERT INTO `js_sys_area` VALUES ('360323', '360300', '0,360000,360300,', '12580', '0000000140,0000001290,0000012580,', '1', '2', '江西省/萍乡市/芦溪县', '芦溪县', '3', '0', 'system', '2018-03-11 15:59:53', 'system', '2018-03-11 15:59:53', null);
INSERT INTO `js_sys_area` VALUES ('360400', '360000', '0,360000,', '1300', '0000000140,0000001300,', '0', '1', '江西省/九江市', '九江市', '2', '0', 'system', '2018-03-11 15:59:54', 'system', '2018-03-11 15:59:54', null);
INSERT INTO `js_sys_area` VALUES ('360401', '360400', '0,360000,360400,', '12590', '0000000140,0000001300,0000012590,', '1', '2', '江西省/九江市/市辖区', '市辖区', '3', '0', 'system', '2018-03-11 15:59:54', 'system', '2018-03-11 15:59:54', null);
INSERT INTO `js_sys_area` VALUES ('360402', '360400', '0,360000,360400,', '12600', '0000000140,0000001300,0000012600,', '1', '2', '江西省/九江市/庐山区', '庐山区', '3', '0', 'system', '2018-03-11 15:59:54', 'system', '2018-03-11 15:59:54', null);
INSERT INTO `js_sys_area` VALUES ('360403', '360400', '0,360000,360400,', '12610', '0000000140,0000001300,0000012610,', '1', '2', '江西省/九江市/浔阳区', '浔阳区', '3', '0', 'system', '2018-03-11 15:59:54', 'system', '2018-03-11 15:59:54', null);
INSERT INTO `js_sys_area` VALUES ('360421', '360400', '0,360000,360400,', '12620', '0000000140,0000001300,0000012620,', '1', '2', '江西省/九江市/九江县', '九江县', '3', '0', 'system', '2018-03-11 15:59:54', 'system', '2018-03-11 15:59:54', null);
INSERT INTO `js_sys_area` VALUES ('360423', '360400', '0,360000,360400,', '12630', '0000000140,0000001300,0000012630,', '1', '2', '江西省/九江市/武宁县', '武宁县', '3', '0', 'system', '2018-03-11 15:59:54', 'system', '2018-03-11 15:59:54', null);
INSERT INTO `js_sys_area` VALUES ('360424', '360400', '0,360000,360400,', '12640', '0000000140,0000001300,0000012640,', '1', '2', '江西省/九江市/修水县', '修水县', '3', '0', 'system', '2018-03-11 15:59:54', 'system', '2018-03-11 15:59:54', null);
INSERT INTO `js_sys_area` VALUES ('360425', '360400', '0,360000,360400,', '12650', '0000000140,0000001300,0000012650,', '1', '2', '江西省/九江市/永修县', '永修县', '3', '0', 'system', '2018-03-11 15:59:54', 'system', '2018-03-11 15:59:54', null);
INSERT INTO `js_sys_area` VALUES ('360426', '360400', '0,360000,360400,', '12660', '0000000140,0000001300,0000012660,', '1', '2', '江西省/九江市/德安县', '德安县', '3', '0', 'system', '2018-03-11 15:59:54', 'system', '2018-03-11 15:59:54', null);
INSERT INTO `js_sys_area` VALUES ('360427', '360400', '0,360000,360400,', '12670', '0000000140,0000001300,0000012670,', '1', '2', '江西省/九江市/星子县', '星子县', '3', '0', 'system', '2018-03-11 15:59:54', 'system', '2018-03-11 15:59:54', null);
INSERT INTO `js_sys_area` VALUES ('360428', '360400', '0,360000,360400,', '12680', '0000000140,0000001300,0000012680,', '1', '2', '江西省/九江市/都昌县', '都昌县', '3', '0', 'system', '2018-03-11 15:59:54', 'system', '2018-03-11 15:59:54', null);
INSERT INTO `js_sys_area` VALUES ('360429', '360400', '0,360000,360400,', '12690', '0000000140,0000001300,0000012690,', '1', '2', '江西省/九江市/湖口县', '湖口县', '3', '0', 'system', '2018-03-11 15:59:54', 'system', '2018-03-11 15:59:54', null);
INSERT INTO `js_sys_area` VALUES ('360430', '360400', '0,360000,360400,', '12700', '0000000140,0000001300,0000012700,', '1', '2', '江西省/九江市/彭泽县', '彭泽县', '3', '0', 'system', '2018-03-11 15:59:54', 'system', '2018-03-11 15:59:54', null);
INSERT INTO `js_sys_area` VALUES ('360481', '360400', '0,360000,360400,', '12710', '0000000140,0000001300,0000012710,', '1', '2', '江西省/九江市/瑞昌市', '瑞昌市', '3', '0', 'system', '2018-03-11 15:59:54', 'system', '2018-03-11 15:59:54', null);
INSERT INTO `js_sys_area` VALUES ('360500', '360000', '0,360000,', '1310', '0000000140,0000001310,', '0', '1', '江西省/新余市', '新余市', '2', '0', 'system', '2018-03-11 15:59:54', 'system', '2018-03-11 15:59:54', null);
INSERT INTO `js_sys_area` VALUES ('360501', '360500', '0,360000,360500,', '12720', '0000000140,0000001310,0000012720,', '1', '2', '江西省/新余市/市辖区', '市辖区', '3', '0', 'system', '2018-03-11 15:59:54', 'system', '2018-03-11 15:59:54', null);
INSERT INTO `js_sys_area` VALUES ('360502', '360500', '0,360000,360500,', '12730', '0000000140,0000001310,0000012730,', '1', '2', '江西省/新余市/渝水区', '渝水区', '3', '0', 'system', '2018-03-11 15:59:54', 'system', '2018-03-11 15:59:54', null);
INSERT INTO `js_sys_area` VALUES ('360521', '360500', '0,360000,360500,', '12740', '0000000140,0000001310,0000012740,', '1', '2', '江西省/新余市/分宜县', '分宜县', '3', '0', 'system', '2018-03-11 15:59:54', 'system', '2018-03-11 15:59:54', null);
INSERT INTO `js_sys_area` VALUES ('360600', '360000', '0,360000,', '1320', '0000000140,0000001320,', '0', '1', '江西省/鹰潭市', '鹰潭市', '2', '0', 'system', '2018-03-11 15:59:54', 'system', '2018-03-11 15:59:54', null);
INSERT INTO `js_sys_area` VALUES ('360601', '360600', '0,360000,360600,', '12750', '0000000140,0000001320,0000012750,', '1', '2', '江西省/鹰潭市/市辖区', '市辖区', '3', '0', 'system', '2018-03-11 15:59:54', 'system', '2018-03-11 15:59:54', null);
INSERT INTO `js_sys_area` VALUES ('360602', '360600', '0,360000,360600,', '12760', '0000000140,0000001320,0000012760,', '1', '2', '江西省/鹰潭市/月湖区', '月湖区', '3', '0', 'system', '2018-03-11 15:59:54', 'system', '2018-03-11 15:59:54', null);
INSERT INTO `js_sys_area` VALUES ('360622', '360600', '0,360000,360600,', '12770', '0000000140,0000001320,0000012770,', '1', '2', '江西省/鹰潭市/余江县', '余江县', '3', '0', 'system', '2018-03-11 15:59:54', 'system', '2018-03-11 15:59:54', null);
INSERT INTO `js_sys_area` VALUES ('360681', '360600', '0,360000,360600,', '12780', '0000000140,0000001320,0000012780,', '1', '2', '江西省/鹰潭市/贵溪市', '贵溪市', '3', '0', 'system', '2018-03-11 15:59:54', 'system', '2018-03-11 15:59:54', null);
INSERT INTO `js_sys_area` VALUES ('360700', '360000', '0,360000,', '1330', '0000000140,0000001330,', '0', '1', '江西省/赣州市', '赣州市', '2', '0', 'system', '2018-03-11 15:59:54', 'system', '2018-03-11 15:59:54', null);
INSERT INTO `js_sys_area` VALUES ('360701', '360700', '0,360000,360700,', '12790', '0000000140,0000001330,0000012790,', '1', '2', '江西省/赣州市/市辖区', '市辖区', '3', '0', 'system', '2018-03-11 15:59:54', 'system', '2018-03-11 15:59:54', null);
INSERT INTO `js_sys_area` VALUES ('360702', '360700', '0,360000,360700,', '12800', '0000000140,0000001330,0000012800,', '1', '2', '江西省/赣州市/章贡区', '章贡区', '3', '0', 'system', '2018-03-11 15:59:54', 'system', '2018-03-11 15:59:54', null);
INSERT INTO `js_sys_area` VALUES ('360721', '360700', '0,360000,360700,', '12810', '0000000140,0000001330,0000012810,', '1', '2', '江西省/赣州市/赣　县', '赣　县', '3', '0', 'system', '2018-03-11 15:59:54', 'system', '2018-03-11 15:59:54', null);
INSERT INTO `js_sys_area` VALUES ('360722', '360700', '0,360000,360700,', '12820', '0000000140,0000001330,0000012820,', '1', '2', '江西省/赣州市/信丰县', '信丰县', '3', '0', 'system', '2018-03-11 15:59:54', 'system', '2018-03-11 15:59:54', null);
INSERT INTO `js_sys_area` VALUES ('360723', '360700', '0,360000,360700,', '12830', '0000000140,0000001330,0000012830,', '1', '2', '江西省/赣州市/大余县', '大余县', '3', '0', 'system', '2018-03-11 15:59:54', 'system', '2018-03-11 15:59:54', null);
INSERT INTO `js_sys_area` VALUES ('360724', '360700', '0,360000,360700,', '12840', '0000000140,0000001330,0000012840,', '1', '2', '江西省/赣州市/上犹县', '上犹县', '3', '0', 'system', '2018-03-11 15:59:54', 'system', '2018-03-11 15:59:54', null);
INSERT INTO `js_sys_area` VALUES ('360725', '360700', '0,360000,360700,', '12850', '0000000140,0000001330,0000012850,', '1', '2', '江西省/赣州市/崇义县', '崇义县', '3', '0', 'system', '2018-03-11 15:59:54', 'system', '2018-03-11 15:59:54', null);
INSERT INTO `js_sys_area` VALUES ('360726', '360700', '0,360000,360700,', '12860', '0000000140,0000001330,0000012860,', '1', '2', '江西省/赣州市/安远县', '安远县', '3', '0', 'system', '2018-03-11 15:59:54', 'system', '2018-03-11 15:59:54', null);
INSERT INTO `js_sys_area` VALUES ('360727', '360700', '0,360000,360700,', '12870', '0000000140,0000001330,0000012870,', '1', '2', '江西省/赣州市/龙南县', '龙南县', '3', '0', 'system', '2018-03-11 15:59:54', 'system', '2018-03-11 15:59:54', null);
INSERT INTO `js_sys_area` VALUES ('360728', '360700', '0,360000,360700,', '12880', '0000000140,0000001330,0000012880,', '1', '2', '江西省/赣州市/定南县', '定南县', '3', '0', 'system', '2018-03-11 15:59:54', 'system', '2018-03-11 15:59:54', null);
INSERT INTO `js_sys_area` VALUES ('360729', '360700', '0,360000,360700,', '12890', '0000000140,0000001330,0000012890,', '1', '2', '江西省/赣州市/全南县', '全南县', '3', '0', 'system', '2018-03-11 15:59:54', 'system', '2018-03-11 15:59:54', null);
INSERT INTO `js_sys_area` VALUES ('360730', '360700', '0,360000,360700,', '12900', '0000000140,0000001330,0000012900,', '1', '2', '江西省/赣州市/宁都县', '宁都县', '3', '0', 'system', '2018-03-11 15:59:54', 'system', '2018-03-11 15:59:54', null);
INSERT INTO `js_sys_area` VALUES ('360731', '360700', '0,360000,360700,', '12910', '0000000140,0000001330,0000012910,', '1', '2', '江西省/赣州市/于都县', '于都县', '3', '0', 'system', '2018-03-11 15:59:54', 'system', '2018-03-11 15:59:54', null);
INSERT INTO `js_sys_area` VALUES ('360732', '360700', '0,360000,360700,', '12920', '0000000140,0000001330,0000012920,', '1', '2', '江西省/赣州市/兴国县', '兴国县', '3', '0', 'system', '2018-03-11 15:59:54', 'system', '2018-03-11 15:59:54', null);
INSERT INTO `js_sys_area` VALUES ('360733', '360700', '0,360000,360700,', '12930', '0000000140,0000001330,0000012930,', '1', '2', '江西省/赣州市/会昌县', '会昌县', '3', '0', 'system', '2018-03-11 15:59:54', 'system', '2018-03-11 15:59:54', null);
INSERT INTO `js_sys_area` VALUES ('360734', '360700', '0,360000,360700,', '12940', '0000000140,0000001330,0000012940,', '1', '2', '江西省/赣州市/寻乌县', '寻乌县', '3', '0', 'system', '2018-03-11 15:59:54', 'system', '2018-03-11 15:59:54', null);
INSERT INTO `js_sys_area` VALUES ('360735', '360700', '0,360000,360700,', '12950', '0000000140,0000001330,0000012950,', '1', '2', '江西省/赣州市/石城县', '石城县', '3', '0', 'system', '2018-03-11 15:59:54', 'system', '2018-03-11 15:59:54', null);
INSERT INTO `js_sys_area` VALUES ('360781', '360700', '0,360000,360700,', '12960', '0000000140,0000001330,0000012960,', '1', '2', '江西省/赣州市/瑞金市', '瑞金市', '3', '0', 'system', '2018-03-11 15:59:54', 'system', '2018-03-11 15:59:54', null);
INSERT INTO `js_sys_area` VALUES ('360782', '360700', '0,360000,360700,', '12970', '0000000140,0000001330,0000012970,', '1', '2', '江西省/赣州市/南康市', '南康市', '3', '0', 'system', '2018-03-11 15:59:54', 'system', '2018-03-11 15:59:54', null);
INSERT INTO `js_sys_area` VALUES ('360800', '360000', '0,360000,', '1340', '0000000140,0000001340,', '0', '1', '江西省/吉安市', '吉安市', '2', '0', 'system', '2018-03-11 15:59:54', 'system', '2018-03-11 15:59:54', null);
INSERT INTO `js_sys_area` VALUES ('360801', '360800', '0,360000,360800,', '12980', '0000000140,0000001340,0000012980,', '1', '2', '江西省/吉安市/市辖区', '市辖区', '3', '0', 'system', '2018-03-11 15:59:54', 'system', '2018-03-11 15:59:54', null);
INSERT INTO `js_sys_area` VALUES ('360802', '360800', '0,360000,360800,', '12990', '0000000140,0000001340,0000012990,', '1', '2', '江西省/吉安市/吉州区', '吉州区', '3', '0', 'system', '2018-03-11 15:59:54', 'system', '2018-03-11 15:59:54', null);
INSERT INTO `js_sys_area` VALUES ('360803', '360800', '0,360000,360800,', '13000', '0000000140,0000001340,0000013000,', '1', '2', '江西省/吉安市/青原区', '青原区', '3', '0', 'system', '2018-03-11 15:59:54', 'system', '2018-03-11 15:59:54', null);
INSERT INTO `js_sys_area` VALUES ('360821', '360800', '0,360000,360800,', '13010', '0000000140,0000001340,0000013010,', '1', '2', '江西省/吉安市/吉安县', '吉安县', '3', '0', 'system', '2018-03-11 15:59:54', 'system', '2018-03-11 15:59:54', null);
INSERT INTO `js_sys_area` VALUES ('360822', '360800', '0,360000,360800,', '13020', '0000000140,0000001340,0000013020,', '1', '2', '江西省/吉安市/吉水县', '吉水县', '3', '0', 'system', '2018-03-11 15:59:54', 'system', '2018-03-11 15:59:54', null);
INSERT INTO `js_sys_area` VALUES ('360823', '360800', '0,360000,360800,', '13030', '0000000140,0000001340,0000013030,', '1', '2', '江西省/吉安市/峡江县', '峡江县', '3', '0', 'system', '2018-03-11 15:59:54', 'system', '2018-03-11 15:59:54', null);
INSERT INTO `js_sys_area` VALUES ('360824', '360800', '0,360000,360800,', '13040', '0000000140,0000001340,0000013040,', '1', '2', '江西省/吉安市/新干县', '新干县', '3', '0', 'system', '2018-03-11 15:59:54', 'system', '2018-03-11 15:59:54', null);
INSERT INTO `js_sys_area` VALUES ('360825', '360800', '0,360000,360800,', '13050', '0000000140,0000001340,0000013050,', '1', '2', '江西省/吉安市/永丰县', '永丰县', '3', '0', 'system', '2018-03-11 15:59:54', 'system', '2018-03-11 15:59:54', null);
INSERT INTO `js_sys_area` VALUES ('360826', '360800', '0,360000,360800,', '13060', '0000000140,0000001340,0000013060,', '1', '2', '江西省/吉安市/泰和县', '泰和县', '3', '0', 'system', '2018-03-11 15:59:54', 'system', '2018-03-11 15:59:54', null);
INSERT INTO `js_sys_area` VALUES ('360827', '360800', '0,360000,360800,', '13070', '0000000140,0000001340,0000013070,', '1', '2', '江西省/吉安市/遂川县', '遂川县', '3', '0', 'system', '2018-03-11 15:59:55', 'system', '2018-03-11 15:59:55', null);
INSERT INTO `js_sys_area` VALUES ('360828', '360800', '0,360000,360800,', '13080', '0000000140,0000001340,0000013080,', '1', '2', '江西省/吉安市/万安县', '万安县', '3', '0', 'system', '2018-03-11 15:59:55', 'system', '2018-03-11 15:59:55', null);
INSERT INTO `js_sys_area` VALUES ('360829', '360800', '0,360000,360800,', '13090', '0000000140,0000001340,0000013090,', '1', '2', '江西省/吉安市/安福县', '安福县', '3', '0', 'system', '2018-03-11 15:59:55', 'system', '2018-03-11 15:59:55', null);
INSERT INTO `js_sys_area` VALUES ('360830', '360800', '0,360000,360800,', '13100', '0000000140,0000001340,0000013100,', '1', '2', '江西省/吉安市/永新县', '永新县', '3', '0', 'system', '2018-03-11 15:59:55', 'system', '2018-03-11 15:59:55', null);
INSERT INTO `js_sys_area` VALUES ('360881', '360800', '0,360000,360800,', '13110', '0000000140,0000001340,0000013110,', '1', '2', '江西省/吉安市/井冈山市', '井冈山市', '3', '0', 'system', '2018-03-11 15:59:55', 'system', '2018-03-11 15:59:55', null);
INSERT INTO `js_sys_area` VALUES ('360900', '360000', '0,360000,', '1350', '0000000140,0000001350,', '0', '1', '江西省/宜春市', '宜春市', '2', '0', 'system', '2018-03-11 15:59:55', 'system', '2018-03-11 15:59:55', null);
INSERT INTO `js_sys_area` VALUES ('360901', '360900', '0,360000,360900,', '13120', '0000000140,0000001350,0000013120,', '1', '2', '江西省/宜春市/市辖区', '市辖区', '3', '0', 'system', '2018-03-11 15:59:55', 'system', '2018-03-11 15:59:55', null);
INSERT INTO `js_sys_area` VALUES ('360902', '360900', '0,360000,360900,', '13130', '0000000140,0000001350,0000013130,', '1', '2', '江西省/宜春市/袁州区', '袁州区', '3', '0', 'system', '2018-03-11 15:59:55', 'system', '2018-03-11 15:59:55', null);
INSERT INTO `js_sys_area` VALUES ('360921', '360900', '0,360000,360900,', '13140', '0000000140,0000001350,0000013140,', '1', '2', '江西省/宜春市/奉新县', '奉新县', '3', '0', 'system', '2018-03-11 15:59:55', 'system', '2018-03-11 15:59:55', null);
INSERT INTO `js_sys_area` VALUES ('360922', '360900', '0,360000,360900,', '13150', '0000000140,0000001350,0000013150,', '1', '2', '江西省/宜春市/万载县', '万载县', '3', '0', 'system', '2018-03-11 15:59:55', 'system', '2018-03-11 15:59:55', null);
INSERT INTO `js_sys_area` VALUES ('360923', '360900', '0,360000,360900,', '13160', '0000000140,0000001350,0000013160,', '1', '2', '江西省/宜春市/上高县', '上高县', '3', '0', 'system', '2018-03-11 15:59:55', 'system', '2018-03-11 15:59:55', null);
INSERT INTO `js_sys_area` VALUES ('360924', '360900', '0,360000,360900,', '13170', '0000000140,0000001350,0000013170,', '1', '2', '江西省/宜春市/宜丰县', '宜丰县', '3', '0', 'system', '2018-03-11 15:59:55', 'system', '2018-03-11 15:59:55', null);
INSERT INTO `js_sys_area` VALUES ('360925', '360900', '0,360000,360900,', '13180', '0000000140,0000001350,0000013180,', '1', '2', '江西省/宜春市/靖安县', '靖安县', '3', '0', 'system', '2018-03-11 15:59:55', 'system', '2018-03-11 15:59:55', null);
INSERT INTO `js_sys_area` VALUES ('360926', '360900', '0,360000,360900,', '13190', '0000000140,0000001350,0000013190,', '1', '2', '江西省/宜春市/铜鼓县', '铜鼓县', '3', '0', 'system', '2018-03-11 15:59:55', 'system', '2018-03-11 15:59:55', null);
INSERT INTO `js_sys_area` VALUES ('360981', '360900', '0,360000,360900,', '13200', '0000000140,0000001350,0000013200,', '1', '2', '江西省/宜春市/丰城市', '丰城市', '3', '0', 'system', '2018-03-11 15:59:55', 'system', '2018-03-11 15:59:55', null);
INSERT INTO `js_sys_area` VALUES ('360982', '360900', '0,360000,360900,', '13210', '0000000140,0000001350,0000013210,', '1', '2', '江西省/宜春市/樟树市', '樟树市', '3', '0', 'system', '2018-03-11 15:59:55', 'system', '2018-03-11 15:59:55', null);
INSERT INTO `js_sys_area` VALUES ('360983', '360900', '0,360000,360900,', '13220', '0000000140,0000001350,0000013220,', '1', '2', '江西省/宜春市/高安市', '高安市', '3', '0', 'system', '2018-03-11 15:59:55', 'system', '2018-03-11 15:59:55', null);
INSERT INTO `js_sys_area` VALUES ('361000', '360000', '0,360000,', '1360', '0000000140,0000001360,', '0', '1', '江西省/抚州市', '抚州市', '2', '0', 'system', '2018-03-11 15:59:55', 'system', '2018-03-11 15:59:55', null);
INSERT INTO `js_sys_area` VALUES ('361001', '361000', '0,360000,361000,', '13230', '0000000140,0000001360,0000013230,', '1', '2', '江西省/抚州市/市辖区', '市辖区', '3', '0', 'system', '2018-03-11 15:59:55', 'system', '2018-03-11 15:59:55', null);
INSERT INTO `js_sys_area` VALUES ('361002', '361000', '0,360000,361000,', '13240', '0000000140,0000001360,0000013240,', '1', '2', '江西省/抚州市/临川区', '临川区', '3', '0', 'system', '2018-03-11 15:59:55', 'system', '2018-03-11 15:59:55', null);
INSERT INTO `js_sys_area` VALUES ('361021', '361000', '0,360000,361000,', '13250', '0000000140,0000001360,0000013250,', '1', '2', '江西省/抚州市/南城县', '南城县', '3', '0', 'system', '2018-03-11 15:59:55', 'system', '2018-03-11 15:59:55', null);
INSERT INTO `js_sys_area` VALUES ('361022', '361000', '0,360000,361000,', '13260', '0000000140,0000001360,0000013260,', '1', '2', '江西省/抚州市/黎川县', '黎川县', '3', '0', 'system', '2018-03-11 15:59:55', 'system', '2018-03-11 15:59:55', null);
INSERT INTO `js_sys_area` VALUES ('361023', '361000', '0,360000,361000,', '13270', '0000000140,0000001360,0000013270,', '1', '2', '江西省/抚州市/南丰县', '南丰县', '3', '0', 'system', '2018-03-11 15:59:55', 'system', '2018-03-11 15:59:55', null);
INSERT INTO `js_sys_area` VALUES ('361024', '361000', '0,360000,361000,', '13280', '0000000140,0000001360,0000013280,', '1', '2', '江西省/抚州市/崇仁县', '崇仁县', '3', '0', 'system', '2018-03-11 15:59:55', 'system', '2018-03-11 15:59:55', null);
INSERT INTO `js_sys_area` VALUES ('361025', '361000', '0,360000,361000,', '13290', '0000000140,0000001360,0000013290,', '1', '2', '江西省/抚州市/乐安县', '乐安县', '3', '0', 'system', '2018-03-11 15:59:55', 'system', '2018-03-11 15:59:55', null);
INSERT INTO `js_sys_area` VALUES ('361026', '361000', '0,360000,361000,', '13300', '0000000140,0000001360,0000013300,', '1', '2', '江西省/抚州市/宜黄县', '宜黄县', '3', '0', 'system', '2018-03-11 15:59:55', 'system', '2018-03-11 15:59:55', null);
INSERT INTO `js_sys_area` VALUES ('361027', '361000', '0,360000,361000,', '13310', '0000000140,0000001360,0000013310,', '1', '2', '江西省/抚州市/金溪县', '金溪县', '3', '0', 'system', '2018-03-11 15:59:55', 'system', '2018-03-11 15:59:55', null);
INSERT INTO `js_sys_area` VALUES ('361028', '361000', '0,360000,361000,', '13320', '0000000140,0000001360,0000013320,', '1', '2', '江西省/抚州市/资溪县', '资溪县', '3', '0', 'system', '2018-03-11 15:59:55', 'system', '2018-03-11 15:59:55', null);
INSERT INTO `js_sys_area` VALUES ('361029', '361000', '0,360000,361000,', '13330', '0000000140,0000001360,0000013330,', '1', '2', '江西省/抚州市/东乡县', '东乡县', '3', '0', 'system', '2018-03-11 15:59:55', 'system', '2018-03-11 15:59:55', null);
INSERT INTO `js_sys_area` VALUES ('361030', '361000', '0,360000,361000,', '13340', '0000000140,0000001360,0000013340,', '1', '2', '江西省/抚州市/广昌县', '广昌县', '3', '0', 'system', '2018-03-11 15:59:55', 'system', '2018-03-11 15:59:55', null);
INSERT INTO `js_sys_area` VALUES ('361100', '360000', '0,360000,', '1370', '0000000140,0000001370,', '0', '1', '江西省/上饶市', '上饶市', '2', '0', 'system', '2018-03-11 15:59:55', 'system', '2018-03-11 15:59:55', null);
INSERT INTO `js_sys_area` VALUES ('361101', '361100', '0,360000,361100,', '13350', '0000000140,0000001370,0000013350,', '1', '2', '江西省/上饶市/市辖区', '市辖区', '3', '0', 'system', '2018-03-11 15:59:55', 'system', '2018-03-11 15:59:55', null);
INSERT INTO `js_sys_area` VALUES ('361102', '361100', '0,360000,361100,', '13360', '0000000140,0000001370,0000013360,', '1', '2', '江西省/上饶市/信州区', '信州区', '3', '0', 'system', '2018-03-11 15:59:55', 'system', '2018-03-11 15:59:55', null);
INSERT INTO `js_sys_area` VALUES ('361121', '361100', '0,360000,361100,', '13370', '0000000140,0000001370,0000013370,', '1', '2', '江西省/上饶市/上饶县', '上饶县', '3', '0', 'system', '2018-03-11 15:59:55', 'system', '2018-03-11 15:59:55', null);
INSERT INTO `js_sys_area` VALUES ('361122', '361100', '0,360000,361100,', '13380', '0000000140,0000001370,0000013380,', '1', '2', '江西省/上饶市/广丰县', '广丰县', '3', '0', 'system', '2018-03-11 15:59:55', 'system', '2018-03-11 15:59:55', null);
INSERT INTO `js_sys_area` VALUES ('361123', '361100', '0,360000,361100,', '13390', '0000000140,0000001370,0000013390,', '1', '2', '江西省/上饶市/玉山县', '玉山县', '3', '0', 'system', '2018-03-11 15:59:55', 'system', '2018-03-11 15:59:55', null);
INSERT INTO `js_sys_area` VALUES ('361124', '361100', '0,360000,361100,', '13400', '0000000140,0000001370,0000013400,', '1', '2', '江西省/上饶市/铅山县', '铅山县', '3', '0', 'system', '2018-03-11 15:59:55', 'system', '2018-03-11 15:59:55', null);
INSERT INTO `js_sys_area` VALUES ('361125', '361100', '0,360000,361100,', '13410', '0000000140,0000001370,0000013410,', '1', '2', '江西省/上饶市/横峰县', '横峰县', '3', '0', 'system', '2018-03-11 15:59:55', 'system', '2018-03-11 15:59:55', null);
INSERT INTO `js_sys_area` VALUES ('361126', '361100', '0,360000,361100,', '13420', '0000000140,0000001370,0000013420,', '1', '2', '江西省/上饶市/弋阳县', '弋阳县', '3', '0', 'system', '2018-03-11 15:59:55', 'system', '2018-03-11 15:59:55', null);
INSERT INTO `js_sys_area` VALUES ('361127', '361100', '0,360000,361100,', '13430', '0000000140,0000001370,0000013430,', '1', '2', '江西省/上饶市/余干县', '余干县', '3', '0', 'system', '2018-03-11 15:59:55', 'system', '2018-03-11 15:59:55', null);
INSERT INTO `js_sys_area` VALUES ('361128', '361100', '0,360000,361100,', '13440', '0000000140,0000001370,0000013440,', '1', '2', '江西省/上饶市/鄱阳县', '鄱阳县', '3', '0', 'system', '2018-03-11 15:59:55', 'system', '2018-03-11 15:59:55', null);
INSERT INTO `js_sys_area` VALUES ('361129', '361100', '0,360000,361100,', '13450', '0000000140,0000001370,0000013450,', '1', '2', '江西省/上饶市/万年县', '万年县', '3', '0', 'system', '2018-03-11 15:59:55', 'system', '2018-03-11 15:59:55', null);
INSERT INTO `js_sys_area` VALUES ('361130', '361100', '0,360000,361100,', '13460', '0000000140,0000001370,0000013460,', '1', '2', '江西省/上饶市/婺源县', '婺源县', '3', '0', 'system', '2018-03-11 15:59:55', 'system', '2018-03-11 15:59:55', null);
INSERT INTO `js_sys_area` VALUES ('361181', '361100', '0,360000,361100,', '13470', '0000000140,0000001370,0000013470,', '1', '2', '江西省/上饶市/德兴市', '德兴市', '3', '0', 'system', '2018-03-11 15:59:55', 'system', '2018-03-11 15:59:55', null);
INSERT INTO `js_sys_area` VALUES ('370000', '0', '0,', '150', '0000000150,', '0', '0', '山东省', '山东省', '1', '0', 'system', '2018-03-11 15:59:55', 'system', '2018-03-11 15:59:55', null);
INSERT INTO `js_sys_area` VALUES ('370100', '370000', '0,370000,', '1380', '0000000150,0000001380,', '0', '1', '山东省/济南市', '济南市', '2', '0', 'system', '2018-03-11 15:59:55', 'system', '2018-03-11 15:59:55', null);
INSERT INTO `js_sys_area` VALUES ('370101', '370100', '0,370000,370100,', '13480', '0000000150,0000001380,0000013480,', '1', '2', '山东省/济南市/市辖区', '市辖区', '3', '0', 'system', '2018-03-11 15:59:55', 'system', '2018-03-11 15:59:55', null);
INSERT INTO `js_sys_area` VALUES ('370102', '370100', '0,370000,370100,', '13490', '0000000150,0000001380,0000013490,', '1', '2', '山东省/济南市/历下区', '历下区', '3', '0', 'system', '2018-03-11 15:59:55', 'system', '2018-03-11 15:59:55', null);
INSERT INTO `js_sys_area` VALUES ('370103', '370100', '0,370000,370100,', '13500', '0000000150,0000001380,0000013500,', '1', '2', '山东省/济南市/市中区', '市中区', '3', '0', 'system', '2018-03-11 15:59:55', 'system', '2018-03-11 15:59:55', null);
INSERT INTO `js_sys_area` VALUES ('370104', '370100', '0,370000,370100,', '13510', '0000000150,0000001380,0000013510,', '1', '2', '山东省/济南市/槐荫区', '槐荫区', '3', '0', 'system', '2018-03-11 15:59:55', 'system', '2018-03-11 15:59:55', null);
INSERT INTO `js_sys_area` VALUES ('370105', '370100', '0,370000,370100,', '13520', '0000000150,0000001380,0000013520,', '1', '2', '山东省/济南市/天桥区', '天桥区', '3', '0', 'system', '2018-03-11 15:59:55', 'system', '2018-03-11 15:59:55', null);
INSERT INTO `js_sys_area` VALUES ('370112', '370100', '0,370000,370100,', '13530', '0000000150,0000001380,0000013530,', '1', '2', '山东省/济南市/历城区', '历城区', '3', '0', 'system', '2018-03-11 15:59:55', 'system', '2018-03-11 15:59:55', null);
INSERT INTO `js_sys_area` VALUES ('370113', '370100', '0,370000,370100,', '13540', '0000000150,0000001380,0000013540,', '1', '2', '山东省/济南市/长清区', '长清区', '3', '0', 'system', '2018-03-11 15:59:55', 'system', '2018-03-11 15:59:55', null);
INSERT INTO `js_sys_area` VALUES ('370124', '370100', '0,370000,370100,', '13550', '0000000150,0000001380,0000013550,', '1', '2', '山东省/济南市/平阴县', '平阴县', '3', '0', 'system', '2018-03-11 15:59:55', 'system', '2018-03-11 15:59:55', null);
INSERT INTO `js_sys_area` VALUES ('370125', '370100', '0,370000,370100,', '13560', '0000000150,0000001380,0000013560,', '1', '2', '山东省/济南市/济阳县', '济阳县', '3', '0', 'system', '2018-03-11 15:59:55', 'system', '2018-03-11 15:59:55', null);
INSERT INTO `js_sys_area` VALUES ('370126', '370100', '0,370000,370100,', '13570', '0000000150,0000001380,0000013570,', '1', '2', '山东省/济南市/商河县', '商河县', '3', '0', 'system', '2018-03-11 15:59:55', 'system', '2018-03-11 15:59:55', null);
INSERT INTO `js_sys_area` VALUES ('370181', '370100', '0,370000,370100,', '13580', '0000000150,0000001380,0000013580,', '1', '2', '山东省/济南市/章丘市', '章丘市', '3', '0', 'system', '2018-03-11 15:59:55', 'system', '2018-03-11 15:59:55', null);
INSERT INTO `js_sys_area` VALUES ('370200', '370000', '0,370000,', '1390', '0000000150,0000001390,', '0', '1', '山东省/青岛市', '青岛市', '2', '0', 'system', '2018-03-11 15:59:55', 'system', '2018-03-11 15:59:55', null);
INSERT INTO `js_sys_area` VALUES ('370201', '370200', '0,370000,370200,', '13590', '0000000150,0000001390,0000013590,', '1', '2', '山东省/青岛市/市辖区', '市辖区', '3', '0', 'system', '2018-03-11 15:59:55', 'system', '2018-03-11 15:59:55', null);
INSERT INTO `js_sys_area` VALUES ('370202', '370200', '0,370000,370200,', '13600', '0000000150,0000001390,0000013600,', '1', '2', '山东省/青岛市/市南区', '市南区', '3', '0', 'system', '2018-03-11 15:59:55', 'system', '2018-03-11 15:59:55', null);
INSERT INTO `js_sys_area` VALUES ('370203', '370200', '0,370000,370200,', '13610', '0000000150,0000001390,0000013610,', '1', '2', '山东省/青岛市/市北区', '市北区', '3', '0', 'system', '2018-03-11 15:59:55', 'system', '2018-03-11 15:59:55', null);
INSERT INTO `js_sys_area` VALUES ('370205', '370200', '0,370000,370200,', '13620', '0000000150,0000001390,0000013620,', '1', '2', '山东省/青岛市/四方区', '四方区', '3', '0', 'system', '2018-03-11 15:59:55', 'system', '2018-03-11 15:59:55', null);
INSERT INTO `js_sys_area` VALUES ('370211', '370200', '0,370000,370200,', '13630', '0000000150,0000001390,0000013630,', '1', '2', '山东省/青岛市/黄岛区', '黄岛区', '3', '0', 'system', '2018-03-11 15:59:55', 'system', '2018-03-11 15:59:55', null);
INSERT INTO `js_sys_area` VALUES ('370212', '370200', '0,370000,370200,', '13640', '0000000150,0000001390,0000013640,', '1', '2', '山东省/青岛市/崂山区', '崂山区', '3', '0', 'system', '2018-03-11 15:59:55', 'system', '2018-03-11 15:59:55', null);
INSERT INTO `js_sys_area` VALUES ('370213', '370200', '0,370000,370200,', '13650', '0000000150,0000001390,0000013650,', '1', '2', '山东省/青岛市/李沧区', '李沧区', '3', '0', 'system', '2018-03-11 15:59:55', 'system', '2018-03-11 15:59:55', null);
INSERT INTO `js_sys_area` VALUES ('370214', '370200', '0,370000,370200,', '13660', '0000000150,0000001390,0000013660,', '1', '2', '山东省/青岛市/城阳区', '城阳区', '3', '0', 'system', '2018-03-11 15:59:55', 'system', '2018-03-11 15:59:55', null);
INSERT INTO `js_sys_area` VALUES ('370281', '370200', '0,370000,370200,', '13670', '0000000150,0000001390,0000013670,', '1', '2', '山东省/青岛市/胶州市', '胶州市', '3', '0', 'system', '2018-03-11 15:59:55', 'system', '2018-03-11 15:59:55', null);
INSERT INTO `js_sys_area` VALUES ('370282', '370200', '0,370000,370200,', '13680', '0000000150,0000001390,0000013680,', '1', '2', '山东省/青岛市/即墨市', '即墨市', '3', '0', 'system', '2018-03-11 15:59:55', 'system', '2018-03-11 15:59:55', null);
INSERT INTO `js_sys_area` VALUES ('370283', '370200', '0,370000,370200,', '13690', '0000000150,0000001390,0000013690,', '1', '2', '山东省/青岛市/平度市', '平度市', '3', '0', 'system', '2018-03-11 15:59:55', 'system', '2018-03-11 15:59:55', null);
INSERT INTO `js_sys_area` VALUES ('370284', '370200', '0,370000,370200,', '13700', '0000000150,0000001390,0000013700,', '1', '2', '山东省/青岛市/胶南市', '胶南市', '3', '0', 'system', '2018-03-11 15:59:55', 'system', '2018-03-11 15:59:55', null);
INSERT INTO `js_sys_area` VALUES ('370285', '370200', '0,370000,370200,', '13710', '0000000150,0000001390,0000013710,', '1', '2', '山东省/青岛市/莱西市', '莱西市', '3', '0', 'system', '2018-03-11 15:59:55', 'system', '2018-03-11 15:59:55', null);
INSERT INTO `js_sys_area` VALUES ('370300', '370000', '0,370000,', '1400', '0000000150,0000001400,', '0', '1', '山东省/淄博市', '淄博市', '2', '0', 'system', '2018-03-11 15:59:56', 'system', '2018-03-11 15:59:55', null);
INSERT INTO `js_sys_area` VALUES ('370301', '370300', '0,370000,370300,', '13720', '0000000150,0000001400,0000013720,', '1', '2', '山东省/淄博市/市辖区', '市辖区', '3', '0', 'system', '2018-03-11 15:59:56', 'system', '2018-03-11 15:59:56', null);
INSERT INTO `js_sys_area` VALUES ('370302', '370300', '0,370000,370300,', '13730', '0000000150,0000001400,0000013730,', '1', '2', '山东省/淄博市/淄川区', '淄川区', '3', '0', 'system', '2018-03-11 15:59:56', 'system', '2018-03-11 15:59:56', null);
INSERT INTO `js_sys_area` VALUES ('370303', '370300', '0,370000,370300,', '13740', '0000000150,0000001400,0000013740,', '1', '2', '山东省/淄博市/张店区', '张店区', '3', '0', 'system', '2018-03-11 15:59:56', 'system', '2018-03-11 15:59:56', null);
INSERT INTO `js_sys_area` VALUES ('370304', '370300', '0,370000,370300,', '13750', '0000000150,0000001400,0000013750,', '1', '2', '山东省/淄博市/博山区', '博山区', '3', '0', 'system', '2018-03-11 15:59:56', 'system', '2018-03-11 15:59:56', null);
INSERT INTO `js_sys_area` VALUES ('370305', '370300', '0,370000,370300,', '13760', '0000000150,0000001400,0000013760,', '1', '2', '山东省/淄博市/临淄区', '临淄区', '3', '0', 'system', '2018-03-11 15:59:56', 'system', '2018-03-11 15:59:56', null);
INSERT INTO `js_sys_area` VALUES ('370306', '370300', '0,370000,370300,', '13770', '0000000150,0000001400,0000013770,', '1', '2', '山东省/淄博市/周村区', '周村区', '3', '0', 'system', '2018-03-11 15:59:56', 'system', '2018-03-11 15:59:56', null);
INSERT INTO `js_sys_area` VALUES ('370321', '370300', '0,370000,370300,', '13780', '0000000150,0000001400,0000013780,', '1', '2', '山东省/淄博市/桓台县', '桓台县', '3', '0', 'system', '2018-03-11 15:59:56', 'system', '2018-03-11 15:59:56', null);
INSERT INTO `js_sys_area` VALUES ('370322', '370300', '0,370000,370300,', '13790', '0000000150,0000001400,0000013790,', '1', '2', '山东省/淄博市/高青县', '高青县', '3', '0', 'system', '2018-03-11 15:59:56', 'system', '2018-03-11 15:59:56', null);
INSERT INTO `js_sys_area` VALUES ('370323', '370300', '0,370000,370300,', '13800', '0000000150,0000001400,0000013800,', '1', '2', '山东省/淄博市/沂源县', '沂源县', '3', '0', 'system', '2018-03-11 15:59:56', 'system', '2018-03-11 15:59:56', null);
INSERT INTO `js_sys_area` VALUES ('370400', '370000', '0,370000,', '1410', '0000000150,0000001410,', '0', '1', '山东省/枣庄市', '枣庄市', '2', '0', 'system', '2018-03-11 15:59:56', 'system', '2018-03-11 15:59:56', null);
INSERT INTO `js_sys_area` VALUES ('370401', '370400', '0,370000,370400,', '13810', '0000000150,0000001410,0000013810,', '1', '2', '山东省/枣庄市/市辖区', '市辖区', '3', '0', 'system', '2018-03-11 15:59:56', 'system', '2018-03-11 15:59:56', null);
INSERT INTO `js_sys_area` VALUES ('370402', '370400', '0,370000,370400,', '13820', '0000000150,0000001410,0000013820,', '1', '2', '山东省/枣庄市/市中区', '市中区', '3', '0', 'system', '2018-03-11 15:59:56', 'system', '2018-03-11 15:59:56', null);
INSERT INTO `js_sys_area` VALUES ('370403', '370400', '0,370000,370400,', '13830', '0000000150,0000001410,0000013830,', '1', '2', '山东省/枣庄市/薛城区', '薛城区', '3', '0', 'system', '2018-03-11 15:59:56', 'system', '2018-03-11 15:59:56', null);
INSERT INTO `js_sys_area` VALUES ('370404', '370400', '0,370000,370400,', '13840', '0000000150,0000001410,0000013840,', '1', '2', '山东省/枣庄市/峄城区', '峄城区', '3', '0', 'system', '2018-03-11 15:59:56', 'system', '2018-03-11 15:59:56', null);
INSERT INTO `js_sys_area` VALUES ('370405', '370400', '0,370000,370400,', '13850', '0000000150,0000001410,0000013850,', '1', '2', '山东省/枣庄市/台儿庄区', '台儿庄区', '3', '0', 'system', '2018-03-11 15:59:56', 'system', '2018-03-11 15:59:56', null);
INSERT INTO `js_sys_area` VALUES ('370406', '370400', '0,370000,370400,', '13860', '0000000150,0000001410,0000013860,', '1', '2', '山东省/枣庄市/山亭区', '山亭区', '3', '0', 'system', '2018-03-11 15:59:56', 'system', '2018-03-11 15:59:56', null);
INSERT INTO `js_sys_area` VALUES ('370481', '370400', '0,370000,370400,', '13870', '0000000150,0000001410,0000013870,', '1', '2', '山东省/枣庄市/滕州市', '滕州市', '3', '0', 'system', '2018-03-11 15:59:56', 'system', '2018-03-11 15:59:56', null);
INSERT INTO `js_sys_area` VALUES ('370500', '370000', '0,370000,', '1420', '0000000150,0000001420,', '0', '1', '山东省/东营市', '东营市', '2', '0', 'system', '2018-03-11 15:59:56', 'system', '2018-03-11 15:59:56', null);
INSERT INTO `js_sys_area` VALUES ('370501', '370500', '0,370000,370500,', '13880', '0000000150,0000001420,0000013880,', '1', '2', '山东省/东营市/市辖区', '市辖区', '3', '0', 'system', '2018-03-11 15:59:56', 'system', '2018-03-11 15:59:56', null);
INSERT INTO `js_sys_area` VALUES ('370502', '370500', '0,370000,370500,', '13890', '0000000150,0000001420,0000013890,', '1', '2', '山东省/东营市/东营区', '东营区', '3', '0', 'system', '2018-03-11 15:59:56', 'system', '2018-03-11 15:59:56', null);
INSERT INTO `js_sys_area` VALUES ('370503', '370500', '0,370000,370500,', '13900', '0000000150,0000001420,0000013900,', '1', '2', '山东省/东营市/河口区', '河口区', '3', '0', 'system', '2018-03-11 15:59:56', 'system', '2018-03-11 15:59:56', null);
INSERT INTO `js_sys_area` VALUES ('370521', '370500', '0,370000,370500,', '13910', '0000000150,0000001420,0000013910,', '1', '2', '山东省/东营市/垦利县', '垦利县', '3', '0', 'system', '2018-03-11 15:59:56', 'system', '2018-03-11 15:59:56', null);
INSERT INTO `js_sys_area` VALUES ('370522', '370500', '0,370000,370500,', '13920', '0000000150,0000001420,0000013920,', '1', '2', '山东省/东营市/利津县', '利津县', '3', '0', 'system', '2018-03-11 15:59:56', 'system', '2018-03-11 15:59:56', null);
INSERT INTO `js_sys_area` VALUES ('370523', '370500', '0,370000,370500,', '13930', '0000000150,0000001420,0000013930,', '1', '2', '山东省/东营市/广饶县', '广饶县', '3', '0', 'system', '2018-03-11 15:59:56', 'system', '2018-03-11 15:59:56', null);
INSERT INTO `js_sys_area` VALUES ('370600', '370000', '0,370000,', '1430', '0000000150,0000001430,', '0', '1', '山东省/烟台市', '烟台市', '2', '0', 'system', '2018-03-11 15:59:56', 'system', '2018-03-11 15:59:56', null);
INSERT INTO `js_sys_area` VALUES ('370601', '370600', '0,370000,370600,', '13940', '0000000150,0000001430,0000013940,', '1', '2', '山东省/烟台市/市辖区', '市辖区', '3', '0', 'system', '2018-03-11 15:59:56', 'system', '2018-03-11 15:59:56', null);
INSERT INTO `js_sys_area` VALUES ('370602', '370600', '0,370000,370600,', '13950', '0000000150,0000001430,0000013950,', '1', '2', '山东省/烟台市/芝罘区', '芝罘区', '3', '0', 'system', '2018-03-11 15:59:56', 'system', '2018-03-11 15:59:56', null);
INSERT INTO `js_sys_area` VALUES ('370611', '370600', '0,370000,370600,', '13960', '0000000150,0000001430,0000013960,', '1', '2', '山东省/烟台市/福山区', '福山区', '3', '0', 'system', '2018-03-11 15:59:56', 'system', '2018-03-11 15:59:56', null);
INSERT INTO `js_sys_area` VALUES ('370612', '370600', '0,370000,370600,', '13970', '0000000150,0000001430,0000013970,', '1', '2', '山东省/烟台市/牟平区', '牟平区', '3', '0', 'system', '2018-03-11 15:59:56', 'system', '2018-03-11 15:59:56', null);
INSERT INTO `js_sys_area` VALUES ('370613', '370600', '0,370000,370600,', '13980', '0000000150,0000001430,0000013980,', '1', '2', '山东省/烟台市/莱山区', '莱山区', '3', '0', 'system', '2018-03-11 15:59:56', 'system', '2018-03-11 15:59:56', null);
INSERT INTO `js_sys_area` VALUES ('370634', '370600', '0,370000,370600,', '13990', '0000000150,0000001430,0000013990,', '1', '2', '山东省/烟台市/长岛县', '长岛县', '3', '0', 'system', '2018-03-11 15:59:56', 'system', '2018-03-11 15:59:56', null);
INSERT INTO `js_sys_area` VALUES ('370681', '370600', '0,370000,370600,', '14000', '0000000150,0000001430,0000014000,', '1', '2', '山东省/烟台市/龙口市', '龙口市', '3', '0', 'system', '2018-03-11 15:59:56', 'system', '2018-03-11 15:59:56', null);
INSERT INTO `js_sys_area` VALUES ('370682', '370600', '0,370000,370600,', '14010', '0000000150,0000001430,0000014010,', '1', '2', '山东省/烟台市/莱阳市', '莱阳市', '3', '0', 'system', '2018-03-11 15:59:56', 'system', '2018-03-11 15:59:56', null);
INSERT INTO `js_sys_area` VALUES ('370683', '370600', '0,370000,370600,', '14020', '0000000150,0000001430,0000014020,', '1', '2', '山东省/烟台市/莱州市', '莱州市', '3', '0', 'system', '2018-03-11 15:59:56', 'system', '2018-03-11 15:59:56', null);
INSERT INTO `js_sys_area` VALUES ('370684', '370600', '0,370000,370600,', '14030', '0000000150,0000001430,0000014030,', '1', '2', '山东省/烟台市/蓬莱市', '蓬莱市', '3', '0', 'system', '2018-03-11 15:59:56', 'system', '2018-03-11 15:59:56', null);
INSERT INTO `js_sys_area` VALUES ('370685', '370600', '0,370000,370600,', '14040', '0000000150,0000001430,0000014040,', '1', '2', '山东省/烟台市/招远市', '招远市', '3', '0', 'system', '2018-03-11 15:59:56', 'system', '2018-03-11 15:59:56', null);
INSERT INTO `js_sys_area` VALUES ('370686', '370600', '0,370000,370600,', '14050', '0000000150,0000001430,0000014050,', '1', '2', '山东省/烟台市/栖霞市', '栖霞市', '3', '0', 'system', '2018-03-11 15:59:56', 'system', '2018-03-11 15:59:56', null);
INSERT INTO `js_sys_area` VALUES ('370687', '370600', '0,370000,370600,', '14060', '0000000150,0000001430,0000014060,', '1', '2', '山东省/烟台市/海阳市', '海阳市', '3', '0', 'system', '2018-03-11 15:59:56', 'system', '2018-03-11 15:59:56', null);
INSERT INTO `js_sys_area` VALUES ('370700', '370000', '0,370000,', '1440', '0000000150,0000001440,', '0', '1', '山东省/潍坊市', '潍坊市', '2', '0', 'system', '2018-03-11 15:59:56', 'system', '2018-03-11 15:59:56', null);
INSERT INTO `js_sys_area` VALUES ('370701', '370700', '0,370000,370700,', '14070', '0000000150,0000001440,0000014070,', '1', '2', '山东省/潍坊市/市辖区', '市辖区', '3', '0', 'system', '2018-03-11 15:59:56', 'system', '2018-03-11 15:59:56', null);
INSERT INTO `js_sys_area` VALUES ('370702', '370700', '0,370000,370700,', '14080', '0000000150,0000001440,0000014080,', '1', '2', '山东省/潍坊市/潍城区', '潍城区', '3', '0', 'system', '2018-03-11 15:59:56', 'system', '2018-03-11 15:59:56', null);
INSERT INTO `js_sys_area` VALUES ('370703', '370700', '0,370000,370700,', '14090', '0000000150,0000001440,0000014090,', '1', '2', '山东省/潍坊市/寒亭区', '寒亭区', '3', '0', 'system', '2018-03-11 15:59:56', 'system', '2018-03-11 15:59:56', null);
INSERT INTO `js_sys_area` VALUES ('370704', '370700', '0,370000,370700,', '14100', '0000000150,0000001440,0000014100,', '1', '2', '山东省/潍坊市/坊子区', '坊子区', '3', '0', 'system', '2018-03-11 15:59:56', 'system', '2018-03-11 15:59:56', null);
INSERT INTO `js_sys_area` VALUES ('370705', '370700', '0,370000,370700,', '14110', '0000000150,0000001440,0000014110,', '1', '2', '山东省/潍坊市/奎文区', '奎文区', '3', '0', 'system', '2018-03-11 15:59:56', 'system', '2018-03-11 15:59:56', null);
INSERT INTO `js_sys_area` VALUES ('370724', '370700', '0,370000,370700,', '14120', '0000000150,0000001440,0000014120,', '1', '2', '山东省/潍坊市/临朐县', '临朐县', '3', '0', 'system', '2018-03-11 15:59:56', 'system', '2018-03-11 15:59:56', null);
INSERT INTO `js_sys_area` VALUES ('370725', '370700', '0,370000,370700,', '14130', '0000000150,0000001440,0000014130,', '1', '2', '山东省/潍坊市/昌乐县', '昌乐县', '3', '0', 'system', '2018-03-11 15:59:56', 'system', '2018-03-11 15:59:56', null);
INSERT INTO `js_sys_area` VALUES ('370781', '370700', '0,370000,370700,', '14140', '0000000150,0000001440,0000014140,', '1', '2', '山东省/潍坊市/青州市', '青州市', '3', '0', 'system', '2018-03-11 15:59:56', 'system', '2018-03-11 15:59:56', null);
INSERT INTO `js_sys_area` VALUES ('370782', '370700', '0,370000,370700,', '14150', '0000000150,0000001440,0000014150,', '1', '2', '山东省/潍坊市/诸城市', '诸城市', '3', '0', 'system', '2018-03-11 15:59:56', 'system', '2018-03-11 15:59:56', null);
INSERT INTO `js_sys_area` VALUES ('370783', '370700', '0,370000,370700,', '14160', '0000000150,0000001440,0000014160,', '1', '2', '山东省/潍坊市/寿光市', '寿光市', '3', '0', 'system', '2018-03-11 15:59:56', 'system', '2018-03-11 15:59:56', null);
INSERT INTO `js_sys_area` VALUES ('370784', '370700', '0,370000,370700,', '14170', '0000000150,0000001440,0000014170,', '1', '2', '山东省/潍坊市/安丘市', '安丘市', '3', '0', 'system', '2018-03-11 15:59:56', 'system', '2018-03-11 15:59:56', null);
INSERT INTO `js_sys_area` VALUES ('370785', '370700', '0,370000,370700,', '14180', '0000000150,0000001440,0000014180,', '1', '2', '山东省/潍坊市/高密市', '高密市', '3', '0', 'system', '2018-03-11 15:59:56', 'system', '2018-03-11 15:59:56', null);
INSERT INTO `js_sys_area` VALUES ('370786', '370700', '0,370000,370700,', '14190', '0000000150,0000001440,0000014190,', '1', '2', '山东省/潍坊市/昌邑市', '昌邑市', '3', '0', 'system', '2018-03-11 15:59:56', 'system', '2018-03-11 15:59:56', null);
INSERT INTO `js_sys_area` VALUES ('370800', '370000', '0,370000,', '1450', '0000000150,0000001450,', '0', '1', '山东省/济宁市', '济宁市', '2', '0', 'system', '2018-03-11 15:59:56', 'system', '2018-03-11 15:59:56', null);
INSERT INTO `js_sys_area` VALUES ('370801', '370800', '0,370000,370800,', '14200', '0000000150,0000001450,0000014200,', '1', '2', '山东省/济宁市/市辖区', '市辖区', '3', '0', 'system', '2018-03-11 15:59:56', 'system', '2018-03-11 15:59:56', null);
INSERT INTO `js_sys_area` VALUES ('370802', '370800', '0,370000,370800,', '14210', '0000000150,0000001450,0000014210,', '1', '2', '山东省/济宁市/市中区', '市中区', '3', '0', 'system', '2018-03-11 15:59:56', 'system', '2018-03-11 15:59:56', null);
INSERT INTO `js_sys_area` VALUES ('370811', '370800', '0,370000,370800,', '14220', '0000000150,0000001450,0000014220,', '1', '2', '山东省/济宁市/任城区', '任城区', '3', '0', 'system', '2018-03-11 15:59:56', 'system', '2018-03-11 15:59:56', null);
INSERT INTO `js_sys_area` VALUES ('370826', '370800', '0,370000,370800,', '14230', '0000000150,0000001450,0000014230,', '1', '2', '山东省/济宁市/微山县', '微山县', '3', '0', 'system', '2018-03-11 15:59:56', 'system', '2018-03-11 15:59:56', null);
INSERT INTO `js_sys_area` VALUES ('370827', '370800', '0,370000,370800,', '14240', '0000000150,0000001450,0000014240,', '1', '2', '山东省/济宁市/鱼台县', '鱼台县', '3', '0', 'system', '2018-03-11 15:59:56', 'system', '2018-03-11 15:59:56', null);
INSERT INTO `js_sys_area` VALUES ('370828', '370800', '0,370000,370800,', '14250', '0000000150,0000001450,0000014250,', '1', '2', '山东省/济宁市/金乡县', '金乡县', '3', '0', 'system', '2018-03-11 15:59:56', 'system', '2018-03-11 15:59:56', null);
INSERT INTO `js_sys_area` VALUES ('370829', '370800', '0,370000,370800,', '14260', '0000000150,0000001450,0000014260,', '1', '2', '山东省/济宁市/嘉祥县', '嘉祥县', '3', '0', 'system', '2018-03-11 15:59:56', 'system', '2018-03-11 15:59:56', null);
INSERT INTO `js_sys_area` VALUES ('370830', '370800', '0,370000,370800,', '14270', '0000000150,0000001450,0000014270,', '1', '2', '山东省/济宁市/汶上县', '汶上县', '3', '0', 'system', '2018-03-11 15:59:56', 'system', '2018-03-11 15:59:56', null);
INSERT INTO `js_sys_area` VALUES ('370831', '370800', '0,370000,370800,', '14280', '0000000150,0000001450,0000014280,', '1', '2', '山东省/济宁市/泗水县', '泗水县', '3', '0', 'system', '2018-03-11 15:59:56', 'system', '2018-03-11 15:59:56', null);
INSERT INTO `js_sys_area` VALUES ('370832', '370800', '0,370000,370800,', '14290', '0000000150,0000001450,0000014290,', '1', '2', '山东省/济宁市/梁山县', '梁山县', '3', '0', 'system', '2018-03-11 15:59:56', 'system', '2018-03-11 15:59:56', null);
INSERT INTO `js_sys_area` VALUES ('370881', '370800', '0,370000,370800,', '14300', '0000000150,0000001450,0000014300,', '1', '2', '山东省/济宁市/曲阜市', '曲阜市', '3', '0', 'system', '2018-03-11 15:59:56', 'system', '2018-03-11 15:59:56', null);
INSERT INTO `js_sys_area` VALUES ('370882', '370800', '0,370000,370800,', '14310', '0000000150,0000001450,0000014310,', '1', '2', '山东省/济宁市/兖州市', '兖州市', '3', '0', 'system', '2018-03-11 15:59:56', 'system', '2018-03-11 15:59:56', null);
INSERT INTO `js_sys_area` VALUES ('370883', '370800', '0,370000,370800,', '14320', '0000000150,0000001450,0000014320,', '1', '2', '山东省/济宁市/邹城市', '邹城市', '3', '0', 'system', '2018-03-11 15:59:57', 'system', '2018-03-11 15:59:57', null);
INSERT INTO `js_sys_area` VALUES ('370900', '370000', '0,370000,', '1460', '0000000150,0000001460,', '0', '1', '山东省/泰安市', '泰安市', '2', '0', 'system', '2018-03-11 15:59:57', 'system', '2018-03-11 15:59:57', null);
INSERT INTO `js_sys_area` VALUES ('370901', '370900', '0,370000,370900,', '14330', '0000000150,0000001460,0000014330,', '1', '2', '山东省/泰安市/市辖区', '市辖区', '3', '0', 'system', '2018-03-11 15:59:57', 'system', '2018-03-11 15:59:57', null);
INSERT INTO `js_sys_area` VALUES ('370903', '370900', '0,370000,370900,', '14350', '0000000150,0000001460,0000014350,', '1', '2', '山东省/泰安市/岱岳区', '岱岳区', '3', '0', 'system', '2018-03-11 15:59:57', 'system', '2018-03-11 15:59:57', null);
INSERT INTO `js_sys_area` VALUES ('370921', '370900', '0,370000,370900,', '14360', '0000000150,0000001460,0000014360,', '1', '2', '山东省/泰安市/宁阳县', '宁阳县', '3', '0', 'system', '2018-03-11 15:59:57', 'system', '2018-03-11 15:59:57', null);
INSERT INTO `js_sys_area` VALUES ('370923', '370900', '0,370000,370900,', '14370', '0000000150,0000001460,0000014370,', '1', '2', '山东省/泰安市/东平县', '东平县', '3', '0', 'system', '2018-03-11 15:59:57', 'system', '2018-03-11 15:59:57', null);
INSERT INTO `js_sys_area` VALUES ('370982', '370900', '0,370000,370900,', '14380', '0000000150,0000001460,0000014380,', '1', '2', '山东省/泰安市/新泰市', '新泰市', '3', '0', 'system', '2018-03-11 15:59:57', 'system', '2018-03-11 15:59:57', null);
INSERT INTO `js_sys_area` VALUES ('370983', '370900', '0,370000,370900,', '14390', '0000000150,0000001460,0000014390,', '1', '2', '山东省/泰安市/肥城市', '肥城市', '3', '0', 'system', '2018-03-11 15:59:57', 'system', '2018-03-11 15:59:57', null);
INSERT INTO `js_sys_area` VALUES ('371000', '370000', '0,370000,', '1470', '0000000150,0000001470,', '0', '1', '山东省/威海市', '威海市', '2', '0', 'system', '2018-03-11 15:59:57', 'system', '2018-03-11 15:59:57', null);
INSERT INTO `js_sys_area` VALUES ('371001', '371000', '0,370000,371000,', '14400', '0000000150,0000001470,0000014400,', '1', '2', '山东省/威海市/市辖区', '市辖区', '3', '0', 'system', '2018-03-11 15:59:57', 'system', '2018-03-11 15:59:57', null);
INSERT INTO `js_sys_area` VALUES ('371002', '371000', '0,370000,371000,', '14410', '0000000150,0000001470,0000014410,', '1', '2', '山东省/威海市/环翠区', '环翠区', '3', '0', 'system', '2018-03-11 15:59:57', 'system', '2018-03-11 15:59:57', null);
INSERT INTO `js_sys_area` VALUES ('371081', '371000', '0,370000,371000,', '14420', '0000000150,0000001470,0000014420,', '1', '2', '山东省/威海市/文登市', '文登市', '3', '0', 'system', '2018-03-11 15:59:57', 'system', '2018-03-11 15:59:57', null);
INSERT INTO `js_sys_area` VALUES ('371082', '371000', '0,370000,371000,', '14430', '0000000150,0000001470,0000014430,', '1', '2', '山东省/威海市/荣成市', '荣成市', '3', '0', 'system', '2018-03-11 15:59:57', 'system', '2018-03-11 15:59:57', null);
INSERT INTO `js_sys_area` VALUES ('371083', '371000', '0,370000,371000,', '14440', '0000000150,0000001470,0000014440,', '1', '2', '山东省/威海市/乳山市', '乳山市', '3', '0', 'system', '2018-03-11 15:59:57', 'system', '2018-03-11 15:59:57', null);
INSERT INTO `js_sys_area` VALUES ('371100', '370000', '0,370000,', '1480', '0000000150,0000001480,', '0', '1', '山东省/日照市', '日照市', '2', '0', 'system', '2018-03-11 15:59:57', 'system', '2018-03-11 15:59:57', null);
INSERT INTO `js_sys_area` VALUES ('371101', '371100', '0,370000,371100,', '14450', '0000000150,0000001480,0000014450,', '1', '2', '山东省/日照市/市辖区', '市辖区', '3', '0', 'system', '2018-03-11 15:59:57', 'system', '2018-03-11 15:59:57', null);
INSERT INTO `js_sys_area` VALUES ('371102', '371100', '0,370000,371100,', '14460', '0000000150,0000001480,0000014460,', '1', '2', '山东省/日照市/东港区', '东港区', '3', '0', 'system', '2018-03-11 15:59:57', 'system', '2018-03-11 15:59:57', null);
INSERT INTO `js_sys_area` VALUES ('371103', '371100', '0,370000,371100,', '14470', '0000000150,0000001480,0000014470,', '1', '2', '山东省/日照市/岚山区', '岚山区', '3', '0', 'system', '2018-03-11 15:59:57', 'system', '2018-03-11 15:59:57', null);
INSERT INTO `js_sys_area` VALUES ('371121', '371100', '0,370000,371100,', '14480', '0000000150,0000001480,0000014480,', '1', '2', '山东省/日照市/五莲县', '五莲县', '3', '0', 'system', '2018-03-11 15:59:57', 'system', '2018-03-11 15:59:57', null);
INSERT INTO `js_sys_area` VALUES ('371122', '371100', '0,370000,371100,', '14490', '0000000150,0000001480,0000014490,', '1', '2', '山东省/日照市/莒　县', '莒　县', '3', '0', 'system', '2018-03-11 15:59:57', 'system', '2018-03-11 15:59:57', null);
INSERT INTO `js_sys_area` VALUES ('371200', '370000', '0,370000,', '1490', '0000000150,0000001490,', '0', '1', '山东省/莱芜市', '莱芜市', '2', '0', 'system', '2018-03-11 15:59:57', 'system', '2018-03-11 15:59:57', null);
INSERT INTO `js_sys_area` VALUES ('371201', '371200', '0,370000,371200,', '14500', '0000000150,0000001490,0000014500,', '1', '2', '山东省/莱芜市/市辖区', '市辖区', '3', '0', 'system', '2018-03-11 15:59:57', 'system', '2018-03-11 15:59:57', null);
INSERT INTO `js_sys_area` VALUES ('371202', '371200', '0,370000,371200,', '14510', '0000000150,0000001490,0000014510,', '1', '2', '山东省/莱芜市/莱城区', '莱城区', '3', '0', 'system', '2018-03-11 15:59:57', 'system', '2018-03-11 15:59:57', null);
INSERT INTO `js_sys_area` VALUES ('371203', '371200', '0,370000,371200,', '14520', '0000000150,0000001490,0000014520,', '1', '2', '山东省/莱芜市/钢城区', '钢城区', '3', '0', 'system', '2018-03-11 15:59:57', 'system', '2018-03-11 15:59:57', null);
INSERT INTO `js_sys_area` VALUES ('371300', '370000', '0,370000,', '1500', '0000000150,0000001500,', '0', '1', '山东省/临沂市', '临沂市', '2', '0', 'system', '2018-03-11 15:59:57', 'system', '2018-03-11 15:59:57', null);
INSERT INTO `js_sys_area` VALUES ('371301', '371300', '0,370000,371300,', '14530', '0000000150,0000001500,0000014530,', '1', '2', '山东省/临沂市/市辖区', '市辖区', '3', '0', 'system', '2018-03-11 15:59:57', 'system', '2018-03-11 15:59:57', null);
INSERT INTO `js_sys_area` VALUES ('371302', '371300', '0,370000,371300,', '14540', '0000000150,0000001500,0000014540,', '1', '2', '山东省/临沂市/兰山区', '兰山区', '3', '0', 'system', '2018-03-11 15:59:57', 'system', '2018-03-11 15:59:57', null);
INSERT INTO `js_sys_area` VALUES ('371311', '371300', '0,370000,371300,', '14550', '0000000150,0000001500,0000014550,', '1', '2', '山东省/临沂市/罗庄区', '罗庄区', '3', '0', 'system', '2018-03-11 15:59:57', 'system', '2018-03-11 15:59:57', null);
INSERT INTO `js_sys_area` VALUES ('371312', '371300', '0,370000,371300,', '14560', '0000000150,0000001500,0000014560,', '1', '2', '山东省/临沂市/河东区', '河东区', '3', '0', 'system', '2018-03-11 15:59:57', 'system', '2018-03-11 15:59:57', null);
INSERT INTO `js_sys_area` VALUES ('371321', '371300', '0,370000,371300,', '14570', '0000000150,0000001500,0000014570,', '1', '2', '山东省/临沂市/沂南县', '沂南县', '3', '0', 'system', '2018-03-11 15:59:57', 'system', '2018-03-11 15:59:57', null);
INSERT INTO `js_sys_area` VALUES ('371322', '371300', '0,370000,371300,', '14580', '0000000150,0000001500,0000014580,', '1', '2', '山东省/临沂市/郯城县', '郯城县', '3', '0', 'system', '2018-03-11 15:59:57', 'system', '2018-03-11 15:59:57', null);
INSERT INTO `js_sys_area` VALUES ('371323', '371300', '0,370000,371300,', '14590', '0000000150,0000001500,0000014590,', '1', '2', '山东省/临沂市/沂水县', '沂水县', '3', '0', 'system', '2018-03-11 15:59:57', 'system', '2018-03-11 15:59:57', null);
INSERT INTO `js_sys_area` VALUES ('371324', '371300', '0,370000,371300,', '14600', '0000000150,0000001500,0000014600,', '1', '2', '山东省/临沂市/苍山县', '苍山县', '3', '0', 'system', '2018-03-11 15:59:57', 'system', '2018-03-11 15:59:57', null);
INSERT INTO `js_sys_area` VALUES ('371325', '371300', '0,370000,371300,', '14610', '0000000150,0000001500,0000014610,', '1', '2', '山东省/临沂市/费　县', '费　县', '3', '0', 'system', '2018-03-11 15:59:57', 'system', '2018-03-11 15:59:57', null);
INSERT INTO `js_sys_area` VALUES ('371326', '371300', '0,370000,371300,', '14620', '0000000150,0000001500,0000014620,', '1', '2', '山东省/临沂市/平邑县', '平邑县', '3', '0', 'system', '2018-03-11 15:59:57', 'system', '2018-03-11 15:59:57', null);
INSERT INTO `js_sys_area` VALUES ('371327', '371300', '0,370000,371300,', '14630', '0000000150,0000001500,0000014630,', '1', '2', '山东省/临沂市/莒南县', '莒南县', '3', '0', 'system', '2018-03-11 15:59:57', 'system', '2018-03-11 15:59:57', null);
INSERT INTO `js_sys_area` VALUES ('371328', '371300', '0,370000,371300,', '14640', '0000000150,0000001500,0000014640,', '1', '2', '山东省/临沂市/蒙阴县', '蒙阴县', '3', '0', 'system', '2018-03-11 15:59:57', 'system', '2018-03-11 15:59:57', null);
INSERT INTO `js_sys_area` VALUES ('371329', '371300', '0,370000,371300,', '14650', '0000000150,0000001500,0000014650,', '1', '2', '山东省/临沂市/临沭县', '临沭县', '3', '0', 'system', '2018-03-11 15:59:57', 'system', '2018-03-11 15:59:57', null);
INSERT INTO `js_sys_area` VALUES ('371400', '370000', '0,370000,', '1510', '0000000150,0000001510,', '0', '1', '山东省/德州市', '德州市', '2', '0', 'system', '2018-03-11 15:59:57', 'system', '2018-03-11 15:59:57', null);
INSERT INTO `js_sys_area` VALUES ('371401', '371400', '0,370000,371400,', '14660', '0000000150,0000001510,0000014660,', '1', '2', '山东省/德州市/市辖区', '市辖区', '3', '0', 'system', '2018-03-11 15:59:57', 'system', '2018-03-11 15:59:57', null);
INSERT INTO `js_sys_area` VALUES ('371402', '371400', '0,370000,371400,', '14670', '0000000150,0000001510,0000014670,', '1', '2', '山东省/德州市/德城区', '德城区', '3', '0', 'system', '2018-03-11 15:59:57', 'system', '2018-03-11 15:59:57', null);
INSERT INTO `js_sys_area` VALUES ('371421', '371400', '0,370000,371400,', '14680', '0000000150,0000001510,0000014680,', '1', '2', '山东省/德州市/陵　县', '陵　县', '3', '0', 'system', '2018-03-11 15:59:57', 'system', '2018-03-11 15:59:57', null);
INSERT INTO `js_sys_area` VALUES ('371422', '371400', '0,370000,371400,', '14690', '0000000150,0000001510,0000014690,', '1', '2', '山东省/德州市/宁津县', '宁津县', '3', '0', 'system', '2018-03-11 15:59:57', 'system', '2018-03-11 15:59:57', null);
INSERT INTO `js_sys_area` VALUES ('371423', '371400', '0,370000,371400,', '14700', '0000000150,0000001510,0000014700,', '1', '2', '山东省/德州市/庆云县', '庆云县', '3', '0', 'system', '2018-03-11 15:59:57', 'system', '2018-03-11 15:59:57', null);
INSERT INTO `js_sys_area` VALUES ('371424', '371400', '0,370000,371400,', '14710', '0000000150,0000001510,0000014710,', '1', '2', '山东省/德州市/临邑县', '临邑县', '3', '0', 'system', '2018-03-11 15:59:57', 'system', '2018-03-11 15:59:57', null);
INSERT INTO `js_sys_area` VALUES ('371425', '371400', '0,370000,371400,', '14720', '0000000150,0000001510,0000014720,', '1', '2', '山东省/德州市/齐河县', '齐河县', '3', '0', 'system', '2018-03-11 15:59:57', 'system', '2018-03-11 15:59:57', null);
INSERT INTO `js_sys_area` VALUES ('371426', '371400', '0,370000,371400,', '14730', '0000000150,0000001510,0000014730,', '1', '2', '山东省/德州市/平原县', '平原县', '3', '0', 'system', '2018-03-11 15:59:57', 'system', '2018-03-11 15:59:57', null);
INSERT INTO `js_sys_area` VALUES ('371427', '371400', '0,370000,371400,', '14740', '0000000150,0000001510,0000014740,', '1', '2', '山东省/德州市/夏津县', '夏津县', '3', '0', 'system', '2018-03-11 15:59:57', 'system', '2018-03-11 15:59:57', null);
INSERT INTO `js_sys_area` VALUES ('371428', '371400', '0,370000,371400,', '14750', '0000000150,0000001510,0000014750,', '1', '2', '山东省/德州市/武城县', '武城县', '3', '0', 'system', '2018-03-11 15:59:57', 'system', '2018-03-11 15:59:57', null);
INSERT INTO `js_sys_area` VALUES ('371481', '371400', '0,370000,371400,', '14760', '0000000150,0000001510,0000014760,', '1', '2', '山东省/德州市/乐陵市', '乐陵市', '3', '0', 'system', '2018-03-11 15:59:57', 'system', '2018-03-11 15:59:57', null);
INSERT INTO `js_sys_area` VALUES ('371482', '371400', '0,370000,371400,', '14770', '0000000150,0000001510,0000014770,', '1', '2', '山东省/德州市/禹城市', '禹城市', '3', '0', 'system', '2018-03-11 15:59:57', 'system', '2018-03-11 15:59:57', null);
INSERT INTO `js_sys_area` VALUES ('371500', '370000', '0,370000,', '1520', '0000000150,0000001520,', '0', '1', '山东省/聊城市', '聊城市', '2', '0', 'system', '2018-03-11 15:59:57', 'system', '2018-03-11 15:59:57', null);
INSERT INTO `js_sys_area` VALUES ('371501', '371500', '0,370000,371500,', '14780', '0000000150,0000001520,0000014780,', '1', '2', '山东省/聊城市/市辖区', '市辖区', '3', '0', 'system', '2018-03-11 15:59:57', 'system', '2018-03-11 15:59:57', null);
INSERT INTO `js_sys_area` VALUES ('371502', '371500', '0,370000,371500,', '14790', '0000000150,0000001520,0000014790,', '1', '2', '山东省/聊城市/东昌府区', '东昌府区', '3', '0', 'system', '2018-03-11 15:59:57', 'system', '2018-03-11 15:59:57', null);
INSERT INTO `js_sys_area` VALUES ('371521', '371500', '0,370000,371500,', '14800', '0000000150,0000001520,0000014800,', '1', '2', '山东省/聊城市/阳谷县', '阳谷县', '3', '0', 'system', '2018-03-11 15:59:57', 'system', '2018-03-11 15:59:57', null);
INSERT INTO `js_sys_area` VALUES ('371522', '371500', '0,370000,371500,', '14810', '0000000150,0000001520,0000014810,', '1', '2', '山东省/聊城市/莘　县', '莘　县', '3', '0', 'system', '2018-03-11 15:59:57', 'system', '2018-03-11 15:59:57', null);
INSERT INTO `js_sys_area` VALUES ('371523', '371500', '0,370000,371500,', '14820', '0000000150,0000001520,0000014820,', '1', '2', '山东省/聊城市/茌平县', '茌平县', '3', '0', 'system', '2018-03-11 15:59:57', 'system', '2018-03-11 15:59:57', null);
INSERT INTO `js_sys_area` VALUES ('371524', '371500', '0,370000,371500,', '14830', '0000000150,0000001520,0000014830,', '1', '2', '山东省/聊城市/东阿县', '东阿县', '3', '0', 'system', '2018-03-11 15:59:57', 'system', '2018-03-11 15:59:57', null);
INSERT INTO `js_sys_area` VALUES ('371525', '371500', '0,370000,371500,', '14840', '0000000150,0000001520,0000014840,', '1', '2', '山东省/聊城市/冠　县', '冠　县', '3', '0', 'system', '2018-03-11 15:59:57', 'system', '2018-03-11 15:59:57', null);
INSERT INTO `js_sys_area` VALUES ('371526', '371500', '0,370000,371500,', '14850', '0000000150,0000001520,0000014850,', '1', '2', '山东省/聊城市/高唐县', '高唐县', '3', '0', 'system', '2018-03-11 15:59:57', 'system', '2018-03-11 15:59:57', null);
INSERT INTO `js_sys_area` VALUES ('371581', '371500', '0,370000,371500,', '14860', '0000000150,0000001520,0000014860,', '1', '2', '山东省/聊城市/临清市', '临清市', '3', '0', 'system', '2018-03-11 15:59:57', 'system', '2018-03-11 15:59:57', null);
INSERT INTO `js_sys_area` VALUES ('371600', '370000', '0,370000,', '1530', '0000000150,0000001530,', '0', '1', '山东省/滨州市', '滨州市', '2', '0', 'system', '2018-03-11 15:59:57', 'system', '2018-03-11 15:59:57', null);
INSERT INTO `js_sys_area` VALUES ('371601', '371600', '0,370000,371600,', '14870', '0000000150,0000001530,0000014870,', '1', '2', '山东省/滨州市/市辖区', '市辖区', '3', '0', 'system', '2018-03-11 15:59:57', 'system', '2018-03-11 15:59:57', null);
INSERT INTO `js_sys_area` VALUES ('371602', '371600', '0,370000,371600,', '14880', '0000000150,0000001530,0000014880,', '1', '2', '山东省/滨州市/滨城区', '滨城区', '3', '0', 'system', '2018-03-11 15:59:57', 'system', '2018-03-11 15:59:57', null);
INSERT INTO `js_sys_area` VALUES ('371621', '371600', '0,370000,371600,', '14890', '0000000150,0000001530,0000014890,', '1', '2', '山东省/滨州市/惠民县', '惠民县', '3', '0', 'system', '2018-03-11 15:59:58', 'system', '2018-03-11 15:59:58', null);
INSERT INTO `js_sys_area` VALUES ('371622', '371600', '0,370000,371600,', '14900', '0000000150,0000001530,0000014900,', '1', '2', '山东省/滨州市/阳信县', '阳信县', '3', '0', 'system', '2018-03-11 15:59:58', 'system', '2018-03-11 15:59:58', null);
INSERT INTO `js_sys_area` VALUES ('371623', '371600', '0,370000,371600,', '14910', '0000000150,0000001530,0000014910,', '1', '2', '山东省/滨州市/无棣县', '无棣县', '3', '0', 'system', '2018-03-11 15:59:58', 'system', '2018-03-11 15:59:58', null);
INSERT INTO `js_sys_area` VALUES ('371624', '371600', '0,370000,371600,', '14920', '0000000150,0000001530,0000014920,', '1', '2', '山东省/滨州市/沾化县', '沾化县', '3', '0', 'system', '2018-03-11 15:59:58', 'system', '2018-03-11 15:59:58', null);
INSERT INTO `js_sys_area` VALUES ('371625', '371600', '0,370000,371600,', '14930', '0000000150,0000001530,0000014930,', '1', '2', '山东省/滨州市/博兴县', '博兴县', '3', '0', 'system', '2018-03-11 15:59:58', 'system', '2018-03-11 15:59:58', null);
INSERT INTO `js_sys_area` VALUES ('371626', '371600', '0,370000,371600,', '14940', '0000000150,0000001530,0000014940,', '1', '2', '山东省/滨州市/邹平县', '邹平县', '3', '0', 'system', '2018-03-11 15:59:58', 'system', '2018-03-11 15:59:58', null);
INSERT INTO `js_sys_area` VALUES ('371700', '370000', '0,370000,', '1540', '0000000150,0000001540,', '0', '1', '山东省/菏泽市', '菏泽市', '2', '0', 'system', '2018-03-11 15:59:58', 'system', '2018-03-11 15:59:58', null);
INSERT INTO `js_sys_area` VALUES ('371701', '371700', '0,370000,371700,', '14950', '0000000150,0000001540,0000014950,', '1', '2', '山东省/菏泽市/市辖区', '市辖区', '3', '0', 'system', '2018-03-11 15:59:58', 'system', '2018-03-11 15:59:58', null);
INSERT INTO `js_sys_area` VALUES ('371702', '371700', '0,370000,371700,', '14960', '0000000150,0000001540,0000014960,', '1', '2', '山东省/菏泽市/牡丹区', '牡丹区', '3', '0', 'system', '2018-03-11 15:59:58', 'system', '2018-03-11 15:59:58', null);
INSERT INTO `js_sys_area` VALUES ('371721', '371700', '0,370000,371700,', '14970', '0000000150,0000001540,0000014970,', '1', '2', '山东省/菏泽市/曹　县', '曹　县', '3', '0', 'system', '2018-03-11 15:59:58', 'system', '2018-03-11 15:59:58', null);
INSERT INTO `js_sys_area` VALUES ('371722', '371700', '0,370000,371700,', '14980', '0000000150,0000001540,0000014980,', '1', '2', '山东省/菏泽市/单　县', '单　县', '3', '0', 'system', '2018-03-11 15:59:58', 'system', '2018-03-11 15:59:58', null);
INSERT INTO `js_sys_area` VALUES ('371723', '371700', '0,370000,371700,', '14990', '0000000150,0000001540,0000014990,', '1', '2', '山东省/菏泽市/成武县', '成武县', '3', '0', 'system', '2018-03-11 15:59:58', 'system', '2018-03-11 15:59:58', null);
INSERT INTO `js_sys_area` VALUES ('371724', '371700', '0,370000,371700,', '15000', '0000000150,0000001540,0000015000,', '1', '2', '山东省/菏泽市/巨野县', '巨野县', '3', '0', 'system', '2018-03-11 15:59:58', 'system', '2018-03-11 15:59:58', null);
INSERT INTO `js_sys_area` VALUES ('371725', '371700', '0,370000,371700,', '15010', '0000000150,0000001540,0000015010,', '1', '2', '山东省/菏泽市/郓城县', '郓城县', '3', '0', 'system', '2018-03-11 15:59:58', 'system', '2018-03-11 15:59:58', null);
INSERT INTO `js_sys_area` VALUES ('371726', '371700', '0,370000,371700,', '15020', '0000000150,0000001540,0000015020,', '1', '2', '山东省/菏泽市/鄄城县', '鄄城县', '3', '0', 'system', '2018-03-11 15:59:58', 'system', '2018-03-11 15:59:58', null);
INSERT INTO `js_sys_area` VALUES ('371727', '371700', '0,370000,371700,', '15030', '0000000150,0000001540,0000015030,', '1', '2', '山东省/菏泽市/定陶县', '定陶县', '3', '0', 'system', '2018-03-11 15:59:58', 'system', '2018-03-11 15:59:58', null);
INSERT INTO `js_sys_area` VALUES ('371728', '371700', '0,370000,371700,', '15040', '0000000150,0000001540,0000015040,', '1', '2', '山东省/菏泽市/东明县', '东明县', '3', '0', 'system', '2018-03-11 15:59:58', 'system', '2018-03-11 15:59:58', null);
INSERT INTO `js_sys_area` VALUES ('410000', '0', '0,', '160', '0000000160,', '0', '0', '河南省', '河南省', '1', '0', 'system', '2018-03-11 15:59:58', 'system', '2018-03-11 15:59:58', null);
INSERT INTO `js_sys_area` VALUES ('410100', '410000', '0,410000,', '1550', '0000000160,0000001550,', '0', '1', '河南省/郑州市', '郑州市', '2', '0', 'system', '2018-03-11 15:59:58', 'system', '2018-03-11 15:59:58', null);
INSERT INTO `js_sys_area` VALUES ('410101', '410100', '0,410000,410100,', '15050', '0000000160,0000001550,0000015050,', '1', '2', '河南省/郑州市/市辖区', '市辖区', '3', '0', 'system', '2018-03-11 15:59:58', 'system', '2018-03-11 15:59:58', null);
INSERT INTO `js_sys_area` VALUES ('410102', '410100', '0,410000,410100,', '15060', '0000000160,0000001550,0000015060,', '1', '2', '河南省/郑州市/中原区', '中原区', '3', '0', 'system', '2018-03-11 15:59:58', 'system', '2018-03-11 15:59:58', null);
INSERT INTO `js_sys_area` VALUES ('410103', '410100', '0,410000,410100,', '15070', '0000000160,0000001550,0000015070,', '1', '2', '河南省/郑州市/二七区', '二七区', '3', '0', 'system', '2018-03-11 15:59:58', 'system', '2018-03-11 15:59:58', null);
INSERT INTO `js_sys_area` VALUES ('410104', '410100', '0,410000,410100,', '15080', '0000000160,0000001550,0000015080,', '1', '2', '河南省/郑州市/管城回族区', '管城回族区', '3', '0', 'system', '2018-03-11 15:59:58', 'system', '2018-03-11 15:59:58', null);
INSERT INTO `js_sys_area` VALUES ('410105', '410100', '0,410000,410100,', '15090', '0000000160,0000001550,0000015090,', '1', '2', '河南省/郑州市/金水区', '金水区', '3', '0', 'system', '2018-03-11 15:59:58', 'system', '2018-03-11 15:59:58', null);
INSERT INTO `js_sys_area` VALUES ('410106', '410100', '0,410000,410100,', '15100', '0000000160,0000001550,0000015100,', '1', '2', '河南省/郑州市/上街区', '上街区', '3', '0', 'system', '2018-03-11 15:59:58', 'system', '2018-03-11 15:59:58', null);
INSERT INTO `js_sys_area` VALUES ('410108', '410100', '0,410000,410100,', '15110', '0000000160,0000001550,0000015110,', '1', '2', '河南省/郑州市/邙山区', '邙山区', '3', '0', 'system', '2018-03-11 15:59:58', 'system', '2018-03-11 15:59:58', null);
INSERT INTO `js_sys_area` VALUES ('410122', '410100', '0,410000,410100,', '15120', '0000000160,0000001550,0000015120,', '1', '2', '河南省/郑州市/中牟县', '中牟县', '3', '0', 'system', '2018-03-11 15:59:58', 'system', '2018-03-11 15:59:58', null);
INSERT INTO `js_sys_area` VALUES ('410181', '410100', '0,410000,410100,', '15130', '0000000160,0000001550,0000015130,', '1', '2', '河南省/郑州市/巩义市', '巩义市', '3', '0', 'system', '2018-03-11 15:59:58', 'system', '2018-03-11 15:59:58', null);
INSERT INTO `js_sys_area` VALUES ('410182', '410100', '0,410000,410100,', '15140', '0000000160,0000001550,0000015140,', '1', '2', '河南省/郑州市/荥阳市', '荥阳市', '3', '0', 'system', '2018-03-11 15:59:58', 'system', '2018-03-11 15:59:58', null);
INSERT INTO `js_sys_area` VALUES ('410183', '410100', '0,410000,410100,', '15150', '0000000160,0000001550,0000015150,', '1', '2', '河南省/郑州市/新密市', '新密市', '3', '0', 'system', '2018-03-11 15:59:58', 'system', '2018-03-11 15:59:58', null);
INSERT INTO `js_sys_area` VALUES ('410184', '410100', '0,410000,410100,', '15160', '0000000160,0000001550,0000015160,', '1', '2', '河南省/郑州市/新郑市', '新郑市', '3', '0', 'system', '2018-03-11 15:59:58', 'system', '2018-03-11 15:59:58', null);
INSERT INTO `js_sys_area` VALUES ('410185', '410100', '0,410000,410100,', '15170', '0000000160,0000001550,0000015170,', '1', '2', '河南省/郑州市/登封市', '登封市', '3', '0', 'system', '2018-03-11 15:59:58', 'system', '2018-03-11 15:59:58', null);
INSERT INTO `js_sys_area` VALUES ('410200', '410000', '0,410000,', '1560', '0000000160,0000001560,', '0', '1', '河南省/开封市', '开封市', '2', '0', 'system', '2018-03-11 15:59:58', 'system', '2018-03-11 15:59:58', null);
INSERT INTO `js_sys_area` VALUES ('410201', '410200', '0,410000,410200,', '15180', '0000000160,0000001560,0000015180,', '1', '2', '河南省/开封市/市辖区', '市辖区', '3', '0', 'system', '2018-03-11 15:59:58', 'system', '2018-03-11 15:59:58', null);
INSERT INTO `js_sys_area` VALUES ('410202', '410200', '0,410000,410200,', '15190', '0000000160,0000001560,0000015190,', '1', '2', '河南省/开封市/龙亭区', '龙亭区', '3', '0', 'system', '2018-03-11 15:59:58', 'system', '2018-03-11 15:59:58', null);
INSERT INTO `js_sys_area` VALUES ('410203', '410200', '0,410000,410200,', '15200', '0000000160,0000001560,0000015200,', '1', '2', '河南省/开封市/顺河回族区', '顺河回族区', '3', '0', 'system', '2018-03-11 15:59:58', 'system', '2018-03-11 15:59:58', null);
INSERT INTO `js_sys_area` VALUES ('410204', '410200', '0,410000,410200,', '15210', '0000000160,0000001560,0000015210,', '1', '2', '河南省/开封市/鼓楼区', '鼓楼区', '3', '0', 'system', '2018-03-11 15:59:58', 'system', '2018-03-11 15:59:58', null);
INSERT INTO `js_sys_area` VALUES ('410205', '410200', '0,410000,410200,', '15220', '0000000160,0000001560,0000015220,', '1', '2', '河南省/开封市/南关区', '南关区', '3', '0', 'system', '2018-03-11 15:59:58', 'system', '2018-03-11 15:59:58', null);
INSERT INTO `js_sys_area` VALUES ('410211', '410200', '0,410000,410200,', '15230', '0000000160,0000001560,0000015230,', '1', '2', '河南省/开封市/郊　区', '郊　区', '3', '0', 'system', '2018-03-11 15:59:58', 'system', '2018-03-11 15:59:58', null);
INSERT INTO `js_sys_area` VALUES ('410221', '410200', '0,410000,410200,', '15240', '0000000160,0000001560,0000015240,', '1', '2', '河南省/开封市/杞　县', '杞　县', '3', '0', 'system', '2018-03-11 15:59:58', 'system', '2018-03-11 15:59:58', null);
INSERT INTO `js_sys_area` VALUES ('410222', '410200', '0,410000,410200,', '15250', '0000000160,0000001560,0000015250,', '1', '2', '河南省/开封市/通许县', '通许县', '3', '0', 'system', '2018-03-11 15:59:58', 'system', '2018-03-11 15:59:58', null);
INSERT INTO `js_sys_area` VALUES ('410223', '410200', '0,410000,410200,', '15260', '0000000160,0000001560,0000015260,', '1', '2', '河南省/开封市/尉氏县', '尉氏县', '3', '0', 'system', '2018-03-11 15:59:58', 'system', '2018-03-11 15:59:58', null);
INSERT INTO `js_sys_area` VALUES ('410224', '410200', '0,410000,410200,', '15270', '0000000160,0000001560,0000015270,', '1', '2', '河南省/开封市/开封县', '开封县', '3', '0', 'system', '2018-03-11 15:59:58', 'system', '2018-03-11 15:59:58', null);
INSERT INTO `js_sys_area` VALUES ('410225', '410200', '0,410000,410200,', '15280', '0000000160,0000001560,0000015280,', '1', '2', '河南省/开封市/兰考县', '兰考县', '3', '0', 'system', '2018-03-11 15:59:58', 'system', '2018-03-11 15:59:58', null);
INSERT INTO `js_sys_area` VALUES ('410300', '410000', '0,410000,', '1570', '0000000160,0000001570,', '0', '1', '河南省/洛阳市', '洛阳市', '2', '0', 'system', '2018-03-11 15:59:58', 'system', '2018-03-11 15:59:58', null);
INSERT INTO `js_sys_area` VALUES ('410301', '410300', '0,410000,410300,', '15290', '0000000160,0000001570,0000015290,', '1', '2', '河南省/洛阳市/市辖区', '市辖区', '3', '0', 'system', '2018-03-11 15:59:58', 'system', '2018-03-11 15:59:58', null);
INSERT INTO `js_sys_area` VALUES ('410302', '410300', '0,410000,410300,', '15300', '0000000160,0000001570,0000015300,', '1', '2', '河南省/洛阳市/老城区', '老城区', '3', '0', 'system', '2018-03-11 15:59:58', 'system', '2018-03-11 15:59:58', null);
INSERT INTO `js_sys_area` VALUES ('410303', '410300', '0,410000,410300,', '15310', '0000000160,0000001570,0000015310,', '1', '2', '河南省/洛阳市/西工区', '西工区', '3', '0', 'system', '2018-03-11 15:59:58', 'system', '2018-03-11 15:59:58', null);
INSERT INTO `js_sys_area` VALUES ('410304', '410300', '0,410000,410300,', '15320', '0000000160,0000001570,0000015320,', '1', '2', '河南省/洛阳市/廛河回族区', '廛河回族区', '3', '0', 'system', '2018-03-11 15:59:58', 'system', '2018-03-11 15:59:58', null);
INSERT INTO `js_sys_area` VALUES ('410305', '410300', '0,410000,410300,', '15330', '0000000160,0000001570,0000015330,', '1', '2', '河南省/洛阳市/涧西区', '涧西区', '3', '0', 'system', '2018-03-11 15:59:58', 'system', '2018-03-11 15:59:58', null);
INSERT INTO `js_sys_area` VALUES ('410306', '410300', '0,410000,410300,', '15340', '0000000160,0000001570,0000015340,', '1', '2', '河南省/洛阳市/吉利区', '吉利区', '3', '0', 'system', '2018-03-11 15:59:58', 'system', '2018-03-11 15:59:58', null);
INSERT INTO `js_sys_area` VALUES ('410307', '410300', '0,410000,410300,', '15350', '0000000160,0000001570,0000015350,', '1', '2', '河南省/洛阳市/洛龙区', '洛龙区', '3', '0', 'system', '2018-03-11 15:59:58', 'system', '2018-03-11 15:59:58', null);
INSERT INTO `js_sys_area` VALUES ('410322', '410300', '0,410000,410300,', '15360', '0000000160,0000001570,0000015360,', '1', '2', '河南省/洛阳市/孟津县', '孟津县', '3', '0', 'system', '2018-03-11 15:59:58', 'system', '2018-03-11 15:59:58', null);
INSERT INTO `js_sys_area` VALUES ('410323', '410300', '0,410000,410300,', '15370', '0000000160,0000001570,0000015370,', '1', '2', '河南省/洛阳市/新安县', '新安县', '3', '0', 'system', '2018-03-11 15:59:58', 'system', '2018-03-11 15:59:58', null);
INSERT INTO `js_sys_area` VALUES ('410324', '410300', '0,410000,410300,', '15380', '0000000160,0000001570,0000015380,', '1', '2', '河南省/洛阳市/栾川县', '栾川县', '3', '0', 'system', '2018-03-11 15:59:58', 'system', '2018-03-11 15:59:58', null);
INSERT INTO `js_sys_area` VALUES ('410325', '410300', '0,410000,410300,', '15390', '0000000160,0000001570,0000015390,', '1', '2', '河南省/洛阳市/嵩　县', '嵩　县', '3', '0', 'system', '2018-03-11 15:59:58', 'system', '2018-03-11 15:59:58', null);
INSERT INTO `js_sys_area` VALUES ('410326', '410300', '0,410000,410300,', '15400', '0000000160,0000001570,0000015400,', '1', '2', '河南省/洛阳市/汝阳县', '汝阳县', '3', '0', 'system', '2018-03-11 15:59:58', 'system', '2018-03-11 15:59:58', null);
INSERT INTO `js_sys_area` VALUES ('410327', '410300', '0,410000,410300,', '15410', '0000000160,0000001570,0000015410,', '1', '2', '河南省/洛阳市/宜阳县', '宜阳县', '3', '0', 'system', '2018-03-11 15:59:58', 'system', '2018-03-11 15:59:58', null);
INSERT INTO `js_sys_area` VALUES ('410328', '410300', '0,410000,410300,', '15420', '0000000160,0000001570,0000015420,', '1', '2', '河南省/洛阳市/洛宁县', '洛宁县', '3', '0', 'system', '2018-03-11 15:59:58', 'system', '2018-03-11 15:59:58', null);
INSERT INTO `js_sys_area` VALUES ('410329', '410300', '0,410000,410300,', '15430', '0000000160,0000001570,0000015430,', '1', '2', '河南省/洛阳市/伊川县', '伊川县', '3', '0', 'system', '2018-03-11 15:59:58', 'system', '2018-03-11 15:59:58', null);
INSERT INTO `js_sys_area` VALUES ('410381', '410300', '0,410000,410300,', '15440', '0000000160,0000001570,0000015440,', '1', '2', '河南省/洛阳市/偃师市', '偃师市', '3', '0', 'system', '2018-03-11 15:59:58', 'system', '2018-03-11 15:59:58', null);
INSERT INTO `js_sys_area` VALUES ('410400', '410000', '0,410000,', '1580', '0000000160,0000001580,', '0', '1', '河南省/平顶山市', '平顶山市', '2', '0', 'system', '2018-03-11 15:59:58', 'system', '2018-03-11 15:59:58', null);
INSERT INTO `js_sys_area` VALUES ('410401', '410400', '0,410000,410400,', '15450', '0000000160,0000001580,0000015450,', '1', '2', '河南省/平顶山市/市辖区', '市辖区', '3', '0', 'system', '2018-03-11 15:59:58', 'system', '2018-03-11 15:59:58', null);
INSERT INTO `js_sys_area` VALUES ('410402', '410400', '0,410000,410400,', '15460', '0000000160,0000001580,0000015460,', '1', '2', '河南省/平顶山市/新华区', '新华区', '3', '0', 'system', '2018-03-11 15:59:58', 'system', '2018-03-11 15:59:58', null);
INSERT INTO `js_sys_area` VALUES ('410403', '410400', '0,410000,410400,', '15470', '0000000160,0000001580,0000015470,', '1', '2', '河南省/平顶山市/卫东区', '卫东区', '3', '0', 'system', '2018-03-11 15:59:58', 'system', '2018-03-11 15:59:58', null);
INSERT INTO `js_sys_area` VALUES ('410404', '410400', '0,410000,410400,', '15480', '0000000160,0000001580,0000015480,', '1', '2', '河南省/平顶山市/石龙区', '石龙区', '3', '0', 'system', '2018-03-11 15:59:58', 'system', '2018-03-11 15:59:58', null);
INSERT INTO `js_sys_area` VALUES ('410411', '410400', '0,410000,410400,', '15490', '0000000160,0000001580,0000015490,', '1', '2', '河南省/平顶山市/湛河区', '湛河区', '3', '0', 'system', '2018-03-11 15:59:58', 'system', '2018-03-11 15:59:58', null);
INSERT INTO `js_sys_area` VALUES ('410421', '410400', '0,410000,410400,', '15500', '0000000160,0000001580,0000015500,', '1', '2', '河南省/平顶山市/宝丰县', '宝丰县', '3', '0', 'system', '2018-03-11 15:59:58', 'system', '2018-03-11 15:59:58', null);
INSERT INTO `js_sys_area` VALUES ('410422', '410400', '0,410000,410400,', '15510', '0000000160,0000001580,0000015510,', '1', '2', '河南省/平顶山市/叶　县', '叶　县', '3', '0', 'system', '2018-03-11 15:59:58', 'system', '2018-03-11 15:59:58', null);
INSERT INTO `js_sys_area` VALUES ('410423', '410400', '0,410000,410400,', '15520', '0000000160,0000001580,0000015520,', '1', '2', '河南省/平顶山市/鲁山县', '鲁山县', '3', '0', 'system', '2018-03-11 15:59:58', 'system', '2018-03-11 15:59:58', null);
INSERT INTO `js_sys_area` VALUES ('410425', '410400', '0,410000,410400,', '15530', '0000000160,0000001580,0000015530,', '1', '2', '河南省/平顶山市/郏　县', '郏　县', '3', '0', 'system', '2018-03-11 15:59:59', 'system', '2018-03-11 15:59:59', null);
INSERT INTO `js_sys_area` VALUES ('410481', '410400', '0,410000,410400,', '15540', '0000000160,0000001580,0000015540,', '1', '2', '河南省/平顶山市/舞钢市', '舞钢市', '3', '0', 'system', '2018-03-11 15:59:59', 'system', '2018-03-11 15:59:59', null);
INSERT INTO `js_sys_area` VALUES ('410482', '410400', '0,410000,410400,', '15550', '0000000160,0000001580,0000015550,', '1', '2', '河南省/平顶山市/汝州市', '汝州市', '3', '0', 'system', '2018-03-11 15:59:59', 'system', '2018-03-11 15:59:59', null);
INSERT INTO `js_sys_area` VALUES ('410500', '410000', '0,410000,', '1590', '0000000160,0000001590,', '0', '1', '河南省/安阳市', '安阳市', '2', '0', 'system', '2018-03-11 15:59:59', 'system', '2018-03-11 15:59:59', null);
INSERT INTO `js_sys_area` VALUES ('410501', '410500', '0,410000,410500,', '15560', '0000000160,0000001590,0000015560,', '1', '2', '河南省/安阳市/市辖区', '市辖区', '3', '0', 'system', '2018-03-11 15:59:59', 'system', '2018-03-11 15:59:59', null);
INSERT INTO `js_sys_area` VALUES ('410502', '410500', '0,410000,410500,', '15570', '0000000160,0000001590,0000015570,', '1', '2', '河南省/安阳市/文峰区', '文峰区', '3', '0', 'system', '2018-03-11 15:59:59', 'system', '2018-03-11 15:59:59', null);
INSERT INTO `js_sys_area` VALUES ('410503', '410500', '0,410000,410500,', '15580', '0000000160,0000001590,0000015580,', '1', '2', '河南省/安阳市/北关区', '北关区', '3', '0', 'system', '2018-03-11 15:59:59', 'system', '2018-03-11 15:59:59', null);
INSERT INTO `js_sys_area` VALUES ('410505', '410500', '0,410000,410500,', '15590', '0000000160,0000001590,0000015590,', '1', '2', '河南省/安阳市/殷都区', '殷都区', '3', '0', 'system', '2018-03-11 15:59:59', 'system', '2018-03-11 15:59:59', null);
INSERT INTO `js_sys_area` VALUES ('410506', '410500', '0,410000,410500,', '15600', '0000000160,0000001590,0000015600,', '1', '2', '河南省/安阳市/龙安区', '龙安区', '3', '0', 'system', '2018-03-11 15:59:59', 'system', '2018-03-11 15:59:59', null);
INSERT INTO `js_sys_area` VALUES ('410522', '410500', '0,410000,410500,', '15610', '0000000160,0000001590,0000015610,', '1', '2', '河南省/安阳市/安阳县', '安阳县', '3', '0', 'system', '2018-03-11 15:59:59', 'system', '2018-03-11 15:59:59', null);
INSERT INTO `js_sys_area` VALUES ('410523', '410500', '0,410000,410500,', '15620', '0000000160,0000001590,0000015620,', '1', '2', '河南省/安阳市/汤阴县', '汤阴县', '3', '0', 'system', '2018-03-11 15:59:59', 'system', '2018-03-11 15:59:59', null);
INSERT INTO `js_sys_area` VALUES ('410526', '410500', '0,410000,410500,', '15630', '0000000160,0000001590,0000015630,', '1', '2', '河南省/安阳市/滑　县', '滑　县', '3', '0', 'system', '2018-03-11 15:59:59', 'system', '2018-03-11 15:59:59', null);
INSERT INTO `js_sys_area` VALUES ('410527', '410500', '0,410000,410500,', '15640', '0000000160,0000001590,0000015640,', '1', '2', '河南省/安阳市/内黄县', '内黄县', '3', '0', 'system', '2018-03-11 15:59:59', 'system', '2018-03-11 15:59:59', null);
INSERT INTO `js_sys_area` VALUES ('410581', '410500', '0,410000,410500,', '15650', '0000000160,0000001590,0000015650,', '1', '2', '河南省/安阳市/林州市', '林州市', '3', '0', 'system', '2018-03-11 15:59:59', 'system', '2018-03-11 15:59:59', null);
INSERT INTO `js_sys_area` VALUES ('410600', '410000', '0,410000,', '1600', '0000000160,0000001600,', '0', '1', '河南省/鹤壁市', '鹤壁市', '2', '0', 'system', '2018-03-11 15:59:59', 'system', '2018-03-11 15:59:59', null);
INSERT INTO `js_sys_area` VALUES ('410601', '410600', '0,410000,410600,', '15660', '0000000160,0000001600,0000015660,', '1', '2', '河南省/鹤壁市/市辖区', '市辖区', '3', '0', 'system', '2018-03-11 15:59:59', 'system', '2018-03-11 15:59:59', null);
INSERT INTO `js_sys_area` VALUES ('410602', '410600', '0,410000,410600,', '15670', '0000000160,0000001600,0000015670,', '1', '2', '河南省/鹤壁市/鹤山区', '鹤山区', '3', '0', 'system', '2018-03-11 15:59:59', 'system', '2018-03-11 15:59:59', null);
INSERT INTO `js_sys_area` VALUES ('410603', '410600', '0,410000,410600,', '15680', '0000000160,0000001600,0000015680,', '1', '2', '河南省/鹤壁市/山城区', '山城区', '3', '0', 'system', '2018-03-11 15:59:59', 'system', '2018-03-11 15:59:59', null);
INSERT INTO `js_sys_area` VALUES ('410611', '410600', '0,410000,410600,', '15690', '0000000160,0000001600,0000015690,', '1', '2', '河南省/鹤壁市/淇滨区', '淇滨区', '3', '0', 'system', '2018-03-11 15:59:59', 'system', '2018-03-11 15:59:59', null);
INSERT INTO `js_sys_area` VALUES ('410621', '410600', '0,410000,410600,', '15700', '0000000160,0000001600,0000015700,', '1', '2', '河南省/鹤壁市/浚　县', '浚　县', '3', '0', 'system', '2018-03-11 15:59:59', 'system', '2018-03-11 15:59:59', null);
INSERT INTO `js_sys_area` VALUES ('410622', '410600', '0,410000,410600,', '15710', '0000000160,0000001600,0000015710,', '1', '2', '河南省/鹤壁市/淇　县', '淇　县', '3', '0', 'system', '2018-03-11 15:59:59', 'system', '2018-03-11 15:59:59', null);
INSERT INTO `js_sys_area` VALUES ('410700', '410000', '0,410000,', '1610', '0000000160,0000001610,', '0', '1', '河南省/新乡市', '新乡市', '2', '0', 'system', '2018-03-11 15:59:59', 'system', '2018-03-11 15:59:59', null);
INSERT INTO `js_sys_area` VALUES ('410701', '410700', '0,410000,410700,', '15720', '0000000160,0000001610,0000015720,', '1', '2', '河南省/新乡市/市辖区', '市辖区', '3', '0', 'system', '2018-03-11 15:59:59', 'system', '2018-03-11 15:59:59', null);
INSERT INTO `js_sys_area` VALUES ('410702', '410700', '0,410000,410700,', '15730', '0000000160,0000001610,0000015730,', '1', '2', '河南省/新乡市/红旗区', '红旗区', '3', '0', 'system', '2018-03-11 15:59:59', 'system', '2018-03-11 15:59:59', null);
INSERT INTO `js_sys_area` VALUES ('410703', '410700', '0,410000,410700,', '15740', '0000000160,0000001610,0000015740,', '1', '2', '河南省/新乡市/卫滨区', '卫滨区', '3', '0', 'system', '2018-03-11 15:59:59', 'system', '2018-03-11 15:59:59', null);
INSERT INTO `js_sys_area` VALUES ('410704', '410700', '0,410000,410700,', '15750', '0000000160,0000001610,0000015750,', '1', '2', '河南省/新乡市/凤泉区', '凤泉区', '3', '0', 'system', '2018-03-11 15:59:59', 'system', '2018-03-11 15:59:59', null);
INSERT INTO `js_sys_area` VALUES ('410711', '410700', '0,410000,410700,', '15760', '0000000160,0000001610,0000015760,', '1', '2', '河南省/新乡市/牧野区', '牧野区', '3', '0', 'system', '2018-03-11 15:59:59', 'system', '2018-03-11 15:59:59', null);
INSERT INTO `js_sys_area` VALUES ('410721', '410700', '0,410000,410700,', '15770', '0000000160,0000001610,0000015770,', '1', '2', '河南省/新乡市/新乡县', '新乡县', '3', '0', 'system', '2018-03-11 15:59:59', 'system', '2018-03-11 15:59:59', null);
INSERT INTO `js_sys_area` VALUES ('410724', '410700', '0,410000,410700,', '15780', '0000000160,0000001610,0000015780,', '1', '2', '河南省/新乡市/获嘉县', '获嘉县', '3', '0', 'system', '2018-03-11 15:59:59', 'system', '2018-03-11 15:59:59', null);
INSERT INTO `js_sys_area` VALUES ('410725', '410700', '0,410000,410700,', '15790', '0000000160,0000001610,0000015790,', '1', '2', '河南省/新乡市/原阳县', '原阳县', '3', '0', 'system', '2018-03-11 15:59:59', 'system', '2018-03-11 15:59:59', null);
INSERT INTO `js_sys_area` VALUES ('410726', '410700', '0,410000,410700,', '15800', '0000000160,0000001610,0000015800,', '1', '2', '河南省/新乡市/延津县', '延津县', '3', '0', 'system', '2018-03-11 15:59:59', 'system', '2018-03-11 15:59:59', null);
INSERT INTO `js_sys_area` VALUES ('410727', '410700', '0,410000,410700,', '15810', '0000000160,0000001610,0000015810,', '1', '2', '河南省/新乡市/封丘县', '封丘县', '3', '0', 'system', '2018-03-11 15:59:59', 'system', '2018-03-11 15:59:59', null);
INSERT INTO `js_sys_area` VALUES ('410728', '410700', '0,410000,410700,', '15820', '0000000160,0000001610,0000015820,', '1', '2', '河南省/新乡市/长垣县', '长垣县', '3', '0', 'system', '2018-03-11 15:59:59', 'system', '2018-03-11 15:59:59', null);
INSERT INTO `js_sys_area` VALUES ('410781', '410700', '0,410000,410700,', '15830', '0000000160,0000001610,0000015830,', '1', '2', '河南省/新乡市/卫辉市', '卫辉市', '3', '0', 'system', '2018-03-11 15:59:59', 'system', '2018-03-11 15:59:59', null);
INSERT INTO `js_sys_area` VALUES ('410782', '410700', '0,410000,410700,', '15840', '0000000160,0000001610,0000015840,', '1', '2', '河南省/新乡市/辉县市', '辉县市', '3', '0', 'system', '2018-03-11 15:59:59', 'system', '2018-03-11 15:59:59', null);
INSERT INTO `js_sys_area` VALUES ('410800', '410000', '0,410000,', '1620', '0000000160,0000001620,', '0', '1', '河南省/焦作市', '焦作市', '2', '0', 'system', '2018-03-11 15:59:59', 'system', '2018-03-11 15:59:59', null);
INSERT INTO `js_sys_area` VALUES ('410801', '410800', '0,410000,410800,', '15850', '0000000160,0000001620,0000015850,', '1', '2', '河南省/焦作市/市辖区', '市辖区', '3', '0', 'system', '2018-03-11 15:59:59', 'system', '2018-03-11 15:59:59', null);
INSERT INTO `js_sys_area` VALUES ('410802', '410800', '0,410000,410800,', '15860', '0000000160,0000001620,0000015860,', '1', '2', '河南省/焦作市/解放区', '解放区', '3', '0', 'system', '2018-03-11 15:59:59', 'system', '2018-03-11 15:59:59', null);
INSERT INTO `js_sys_area` VALUES ('410803', '410800', '0,410000,410800,', '15870', '0000000160,0000001620,0000015870,', '1', '2', '河南省/焦作市/中站区', '中站区', '3', '0', 'system', '2018-03-11 15:59:59', 'system', '2018-03-11 15:59:59', null);
INSERT INTO `js_sys_area` VALUES ('410804', '410800', '0,410000,410800,', '15880', '0000000160,0000001620,0000015880,', '1', '2', '河南省/焦作市/马村区', '马村区', '3', '0', 'system', '2018-03-11 15:59:59', 'system', '2018-03-11 15:59:59', null);
INSERT INTO `js_sys_area` VALUES ('410811', '410800', '0,410000,410800,', '15890', '0000000160,0000001620,0000015890,', '1', '2', '河南省/焦作市/山阳区', '山阳区', '3', '0', 'system', '2018-03-11 15:59:59', 'system', '2018-03-11 15:59:59', null);
INSERT INTO `js_sys_area` VALUES ('410821', '410800', '0,410000,410800,', '15900', '0000000160,0000001620,0000015900,', '1', '2', '河南省/焦作市/修武县', '修武县', '3', '0', 'system', '2018-03-11 15:59:59', 'system', '2018-03-11 15:59:59', null);
INSERT INTO `js_sys_area` VALUES ('410822', '410800', '0,410000,410800,', '15910', '0000000160,0000001620,0000015910,', '1', '2', '河南省/焦作市/博爱县', '博爱县', '3', '0', 'system', '2018-03-11 15:59:59', 'system', '2018-03-11 15:59:59', null);
INSERT INTO `js_sys_area` VALUES ('410823', '410800', '0,410000,410800,', '15920', '0000000160,0000001620,0000015920,', '1', '2', '河南省/焦作市/武陟县', '武陟县', '3', '0', 'system', '2018-03-11 15:59:59', 'system', '2018-03-11 15:59:59', null);
INSERT INTO `js_sys_area` VALUES ('410825', '410800', '0,410000,410800,', '15930', '0000000160,0000001620,0000015930,', '1', '2', '河南省/焦作市/温　县', '温　县', '3', '0', 'system', '2018-03-11 15:59:59', 'system', '2018-03-11 15:59:59', null);
INSERT INTO `js_sys_area` VALUES ('410881', '410800', '0,410000,410800,', '15940', '0000000160,0000001620,0000015940,', '1', '2', '河南省/焦作市/济源市', '济源市', '3', '0', 'system', '2018-03-11 15:59:59', 'system', '2018-03-11 15:59:59', null);
INSERT INTO `js_sys_area` VALUES ('410882', '410800', '0,410000,410800,', '15950', '0000000160,0000001620,0000015950,', '1', '2', '河南省/焦作市/沁阳市', '沁阳市', '3', '0', 'system', '2018-03-11 15:59:59', 'system', '2018-03-11 15:59:59', null);
INSERT INTO `js_sys_area` VALUES ('410883', '410800', '0,410000,410800,', '15960', '0000000160,0000001620,0000015960,', '1', '2', '河南省/焦作市/孟州市', '孟州市', '3', '0', 'system', '2018-03-11 15:59:59', 'system', '2018-03-11 15:59:59', null);
INSERT INTO `js_sys_area` VALUES ('410900', '410000', '0,410000,', '1630', '0000000160,0000001630,', '0', '1', '河南省/濮阳市', '濮阳市', '2', '0', 'system', '2018-03-11 15:59:59', 'system', '2018-03-11 15:59:59', null);
INSERT INTO `js_sys_area` VALUES ('410901', '410900', '0,410000,410900,', '15970', '0000000160,0000001630,0000015970,', '1', '2', '河南省/濮阳市/市辖区', '市辖区', '3', '0', 'system', '2018-03-11 15:59:59', 'system', '2018-03-11 15:59:59', null);
INSERT INTO `js_sys_area` VALUES ('410902', '410900', '0,410000,410900,', '15980', '0000000160,0000001630,0000015980,', '1', '2', '河南省/濮阳市/华龙区', '华龙区', '3', '0', 'system', '2018-03-11 15:59:59', 'system', '2018-03-11 15:59:59', null);
INSERT INTO `js_sys_area` VALUES ('410922', '410900', '0,410000,410900,', '15990', '0000000160,0000001630,0000015990,', '1', '2', '河南省/濮阳市/清丰县', '清丰县', '3', '0', 'system', '2018-03-11 15:59:59', 'system', '2018-03-11 15:59:59', null);
INSERT INTO `js_sys_area` VALUES ('410923', '410900', '0,410000,410900,', '16000', '0000000160,0000001630,0000016000,', '1', '2', '河南省/濮阳市/南乐县', '南乐县', '3', '0', 'system', '2018-03-11 15:59:59', 'system', '2018-03-11 15:59:59', null);
INSERT INTO `js_sys_area` VALUES ('410926', '410900', '0,410000,410900,', '16010', '0000000160,0000001630,0000016010,', '1', '2', '河南省/濮阳市/范　县', '范　县', '3', '0', 'system', '2018-03-11 15:59:59', 'system', '2018-03-11 15:59:59', null);
INSERT INTO `js_sys_area` VALUES ('410927', '410900', '0,410000,410900,', '16020', '0000000160,0000001630,0000016020,', '1', '2', '河南省/濮阳市/台前县', '台前县', '3', '0', 'system', '2018-03-11 15:59:59', 'system', '2018-03-11 15:59:59', null);
INSERT INTO `js_sys_area` VALUES ('410928', '410900', '0,410000,410900,', '16030', '0000000160,0000001630,0000016030,', '1', '2', '河南省/濮阳市/濮阳县', '濮阳县', '3', '0', 'system', '2018-03-11 15:59:59', 'system', '2018-03-11 15:59:59', null);
INSERT INTO `js_sys_area` VALUES ('411000', '410000', '0,410000,', '1640', '0000000160,0000001640,', '0', '1', '河南省/许昌市', '许昌市', '2', '0', 'system', '2018-03-11 15:59:59', 'system', '2018-03-11 15:59:59', null);
INSERT INTO `js_sys_area` VALUES ('411001', '411000', '0,410000,411000,', '16040', '0000000160,0000001640,0000016040,', '1', '2', '河南省/许昌市/市辖区', '市辖区', '3', '0', 'system', '2018-03-11 15:59:59', 'system', '2018-03-11 15:59:59', null);
INSERT INTO `js_sys_area` VALUES ('411002', '411000', '0,410000,411000,', '16050', '0000000160,0000001640,0000016050,', '1', '2', '河南省/许昌市/魏都区', '魏都区', '3', '0', 'system', '2018-03-11 15:59:59', 'system', '2018-03-11 15:59:59', null);
INSERT INTO `js_sys_area` VALUES ('411023', '411000', '0,410000,411000,', '16060', '0000000160,0000001640,0000016060,', '1', '2', '河南省/许昌市/许昌县', '许昌县', '3', '0', 'system', '2018-03-11 15:59:59', 'system', '2018-03-11 15:59:59', null);
INSERT INTO `js_sys_area` VALUES ('411024', '411000', '0,410000,411000,', '16070', '0000000160,0000001640,0000016070,', '1', '2', '河南省/许昌市/鄢陵县', '鄢陵县', '3', '0', 'system', '2018-03-11 15:59:59', 'system', '2018-03-11 15:59:59', null);
INSERT INTO `js_sys_area` VALUES ('411025', '411000', '0,410000,411000,', '16080', '0000000160,0000001640,0000016080,', '1', '2', '河南省/许昌市/襄城县', '襄城县', '3', '0', 'system', '2018-03-11 15:59:59', 'system', '2018-03-11 15:59:59', null);
INSERT INTO `js_sys_area` VALUES ('411081', '411000', '0,410000,411000,', '16090', '0000000160,0000001640,0000016090,', '1', '2', '河南省/许昌市/禹州市', '禹州市', '3', '0', 'system', '2018-03-11 15:59:59', 'system', '2018-03-11 15:59:59', null);
INSERT INTO `js_sys_area` VALUES ('411082', '411000', '0,410000,411000,', '16100', '0000000160,0000001640,0000016100,', '1', '2', '河南省/许昌市/长葛市', '长葛市', '3', '0', 'system', '2018-03-11 15:59:59', 'system', '2018-03-11 15:59:59', null);
INSERT INTO `js_sys_area` VALUES ('411100', '410000', '0,410000,', '1650', '0000000160,0000001650,', '0', '1', '河南省/漯河市', '漯河市', '2', '0', 'system', '2018-03-11 15:59:59', 'system', '2018-03-11 15:59:59', null);
INSERT INTO `js_sys_area` VALUES ('411101', '411100', '0,410000,411100,', '16110', '0000000160,0000001650,0000016110,', '1', '2', '河南省/漯河市/市辖区', '市辖区', '3', '0', 'system', '2018-03-11 15:59:59', 'system', '2018-03-11 15:59:59', null);
INSERT INTO `js_sys_area` VALUES ('411102', '411100', '0,410000,411100,', '16120', '0000000160,0000001650,0000016120,', '1', '2', '河南省/漯河市/源汇区', '源汇区', '3', '0', 'system', '2018-03-11 15:59:59', 'system', '2018-03-11 15:59:59', null);
INSERT INTO `js_sys_area` VALUES ('411103', '411100', '0,410000,411100,', '16130', '0000000160,0000001650,0000016130,', '1', '2', '河南省/漯河市/郾城区', '郾城区', '3', '0', 'system', '2018-03-11 15:59:59', 'system', '2018-03-11 15:59:59', null);
INSERT INTO `js_sys_area` VALUES ('411104', '411100', '0,410000,411100,', '16140', '0000000160,0000001650,0000016140,', '1', '2', '河南省/漯河市/召陵区', '召陵区', '3', '0', 'system', '2018-03-11 15:59:59', 'system', '2018-03-11 15:59:59', null);
INSERT INTO `js_sys_area` VALUES ('411121', '411100', '0,410000,411100,', '16150', '0000000160,0000001650,0000016150,', '1', '2', '河南省/漯河市/舞阳县', '舞阳县', '3', '0', 'system', '2018-03-11 15:59:59', 'system', '2018-03-11 15:59:59', null);
INSERT INTO `js_sys_area` VALUES ('411122', '411100', '0,410000,411100,', '16160', '0000000160,0000001650,0000016160,', '1', '2', '河南省/漯河市/临颍县', '临颍县', '3', '0', 'system', '2018-03-11 15:59:59', 'system', '2018-03-11 15:59:59', null);
INSERT INTO `js_sys_area` VALUES ('411200', '410000', '0,410000,', '1660', '0000000160,0000001660,', '0', '1', '河南省/三门峡市', '三门峡市', '2', '0', 'system', '2018-03-11 16:00:00', 'system', '2018-03-11 16:00:00', null);
INSERT INTO `js_sys_area` VALUES ('411201', '411200', '0,410000,411200,', '16170', '0000000160,0000001660,0000016170,', '1', '2', '河南省/三门峡市/市辖区', '市辖区', '3', '0', 'system', '2018-03-11 16:00:00', 'system', '2018-03-11 16:00:00', null);
INSERT INTO `js_sys_area` VALUES ('411202', '411200', '0,410000,411200,', '16180', '0000000160,0000001660,0000016180,', '1', '2', '河南省/三门峡市/湖滨区', '湖滨区', '3', '0', 'system', '2018-03-11 16:00:00', 'system', '2018-03-11 16:00:00', null);
INSERT INTO `js_sys_area` VALUES ('411221', '411200', '0,410000,411200,', '16190', '0000000160,0000001660,0000016190,', '1', '2', '河南省/三门峡市/渑池县', '渑池县', '3', '0', 'system', '2018-03-11 16:00:00', 'system', '2018-03-11 16:00:00', null);
INSERT INTO `js_sys_area` VALUES ('411222', '411200', '0,410000,411200,', '16200', '0000000160,0000001660,0000016200,', '1', '2', '河南省/三门峡市/陕　县', '陕　县', '3', '0', 'system', '2018-03-11 16:00:00', 'system', '2018-03-11 16:00:00', null);
INSERT INTO `js_sys_area` VALUES ('411224', '411200', '0,410000,411200,', '16210', '0000000160,0000001660,0000016210,', '1', '2', '河南省/三门峡市/卢氏县', '卢氏县', '3', '0', 'system', '2018-03-11 16:00:00', 'system', '2018-03-11 16:00:00', null);
INSERT INTO `js_sys_area` VALUES ('411281', '411200', '0,410000,411200,', '16220', '0000000160,0000001660,0000016220,', '1', '2', '河南省/三门峡市/义马市', '义马市', '3', '0', 'system', '2018-03-11 16:00:00', 'system', '2018-03-11 16:00:00', null);
INSERT INTO `js_sys_area` VALUES ('411282', '411200', '0,410000,411200,', '16230', '0000000160,0000001660,0000016230,', '1', '2', '河南省/三门峡市/灵宝市', '灵宝市', '3', '0', 'system', '2018-03-11 16:00:00', 'system', '2018-03-11 16:00:00', null);
INSERT INTO `js_sys_area` VALUES ('411300', '410000', '0,410000,', '1670', '0000000160,0000001670,', '0', '1', '河南省/南阳市', '南阳市', '2', '0', 'system', '2018-03-11 16:00:00', 'system', '2018-03-11 16:00:00', null);
INSERT INTO `js_sys_area` VALUES ('411301', '411300', '0,410000,411300,', '16240', '0000000160,0000001670,0000016240,', '1', '2', '河南省/南阳市/市辖区', '市辖区', '3', '0', 'system', '2018-03-11 16:00:00', 'system', '2018-03-11 16:00:00', null);
INSERT INTO `js_sys_area` VALUES ('411302', '411300', '0,410000,411300,', '16250', '0000000160,0000001670,0000016250,', '1', '2', '河南省/南阳市/宛城区', '宛城区', '3', '0', 'system', '2018-03-11 16:00:00', 'system', '2018-03-11 16:00:00', null);
INSERT INTO `js_sys_area` VALUES ('411303', '411300', '0,410000,411300,', '16260', '0000000160,0000001670,0000016260,', '1', '2', '河南省/南阳市/卧龙区', '卧龙区', '3', '0', 'system', '2018-03-11 16:00:00', 'system', '2018-03-11 16:00:00', null);
INSERT INTO `js_sys_area` VALUES ('411321', '411300', '0,410000,411300,', '16270', '0000000160,0000001670,0000016270,', '1', '2', '河南省/南阳市/南召县', '南召县', '3', '0', 'system', '2018-03-11 16:00:00', 'system', '2018-03-11 16:00:00', null);
INSERT INTO `js_sys_area` VALUES ('411322', '411300', '0,410000,411300,', '16280', '0000000160,0000001670,0000016280,', '1', '2', '河南省/南阳市/方城县', '方城县', '3', '0', 'system', '2018-03-11 16:00:00', 'system', '2018-03-11 16:00:00', null);
INSERT INTO `js_sys_area` VALUES ('411323', '411300', '0,410000,411300,', '16290', '0000000160,0000001670,0000016290,', '1', '2', '河南省/南阳市/西峡县', '西峡县', '3', '0', 'system', '2018-03-11 16:00:00', 'system', '2018-03-11 16:00:00', null);
INSERT INTO `js_sys_area` VALUES ('411324', '411300', '0,410000,411300,', '16300', '0000000160,0000001670,0000016300,', '1', '2', '河南省/南阳市/镇平县', '镇平县', '3', '0', 'system', '2018-03-11 16:00:00', 'system', '2018-03-11 16:00:00', null);
INSERT INTO `js_sys_area` VALUES ('411325', '411300', '0,410000,411300,', '16310', '0000000160,0000001670,0000016310,', '1', '2', '河南省/南阳市/内乡县', '内乡县', '3', '0', 'system', '2018-03-11 16:00:00', 'system', '2018-03-11 16:00:00', null);
INSERT INTO `js_sys_area` VALUES ('411326', '411300', '0,410000,411300,', '16320', '0000000160,0000001670,0000016320,', '1', '2', '河南省/南阳市/淅川县', '淅川县', '3', '0', 'system', '2018-03-11 16:00:00', 'system', '2018-03-11 16:00:00', null);
INSERT INTO `js_sys_area` VALUES ('411327', '411300', '0,410000,411300,', '16330', '0000000160,0000001670,0000016330,', '1', '2', '河南省/南阳市/社旗县', '社旗县', '3', '0', 'system', '2018-03-11 16:00:00', 'system', '2018-03-11 16:00:00', null);
INSERT INTO `js_sys_area` VALUES ('411328', '411300', '0,410000,411300,', '16340', '0000000160,0000001670,0000016340,', '1', '2', '河南省/南阳市/唐河县', '唐河县', '3', '0', 'system', '2018-03-11 16:00:00', 'system', '2018-03-11 16:00:00', null);
INSERT INTO `js_sys_area` VALUES ('411329', '411300', '0,410000,411300,', '16350', '0000000160,0000001670,0000016350,', '1', '2', '河南省/南阳市/新野县', '新野县', '3', '0', 'system', '2018-03-11 16:00:00', 'system', '2018-03-11 16:00:00', null);
INSERT INTO `js_sys_area` VALUES ('411330', '411300', '0,410000,411300,', '16360', '0000000160,0000001670,0000016360,', '1', '2', '河南省/南阳市/桐柏县', '桐柏县', '3', '0', 'system', '2018-03-11 16:00:00', 'system', '2018-03-11 16:00:00', null);
INSERT INTO `js_sys_area` VALUES ('411381', '411300', '0,410000,411300,', '16370', '0000000160,0000001670,0000016370,', '1', '2', '河南省/南阳市/邓州市', '邓州市', '3', '0', 'system', '2018-03-11 16:00:00', 'system', '2018-03-11 16:00:00', null);
INSERT INTO `js_sys_area` VALUES ('411400', '410000', '0,410000,', '1680', '0000000160,0000001680,', '0', '1', '河南省/商丘市', '商丘市', '2', '0', 'system', '2018-03-11 16:00:00', 'system', '2018-03-11 16:00:00', null);
INSERT INTO `js_sys_area` VALUES ('411401', '411400', '0,410000,411400,', '16380', '0000000160,0000001680,0000016380,', '1', '2', '河南省/商丘市/市辖区', '市辖区', '3', '0', 'system', '2018-03-11 16:00:00', 'system', '2018-03-11 16:00:00', null);
INSERT INTO `js_sys_area` VALUES ('411402', '411400', '0,410000,411400,', '16390', '0000000160,0000001680,0000016390,', '1', '2', '河南省/商丘市/梁园区', '梁园区', '3', '0', 'system', '2018-03-11 16:00:00', 'system', '2018-03-11 16:00:00', null);
INSERT INTO `js_sys_area` VALUES ('411403', '411400', '0,410000,411400,', '16400', '0000000160,0000001680,0000016400,', '1', '2', '河南省/商丘市/睢阳区', '睢阳区', '3', '0', 'system', '2018-03-11 16:00:00', 'system', '2018-03-11 16:00:00', null);
INSERT INTO `js_sys_area` VALUES ('411421', '411400', '0,410000,411400,', '16410', '0000000160,0000001680,0000016410,', '1', '2', '河南省/商丘市/民权县', '民权县', '3', '0', 'system', '2018-03-11 16:00:00', 'system', '2018-03-11 16:00:00', null);
INSERT INTO `js_sys_area` VALUES ('411422', '411400', '0,410000,411400,', '16420', '0000000160,0000001680,0000016420,', '1', '2', '河南省/商丘市/睢　县', '睢　县', '3', '0', 'system', '2018-03-11 16:00:00', 'system', '2018-03-11 16:00:00', null);
INSERT INTO `js_sys_area` VALUES ('411423', '411400', '0,410000,411400,', '16430', '0000000160,0000001680,0000016430,', '1', '2', '河南省/商丘市/宁陵县', '宁陵县', '3', '0', 'system', '2018-03-11 16:00:00', 'system', '2018-03-11 16:00:00', null);
INSERT INTO `js_sys_area` VALUES ('411424', '411400', '0,410000,411400,', '16440', '0000000160,0000001680,0000016440,', '1', '2', '河南省/商丘市/柘城县', '柘城县', '3', '0', 'system', '2018-03-11 16:00:00', 'system', '2018-03-11 16:00:00', null);
INSERT INTO `js_sys_area` VALUES ('411425', '411400', '0,410000,411400,', '16450', '0000000160,0000001680,0000016450,', '1', '2', '河南省/商丘市/虞城县', '虞城县', '3', '0', 'system', '2018-03-11 16:00:00', 'system', '2018-03-11 16:00:00', null);
INSERT INTO `js_sys_area` VALUES ('411426', '411400', '0,410000,411400,', '16460', '0000000160,0000001680,0000016460,', '1', '2', '河南省/商丘市/夏邑县', '夏邑县', '3', '0', 'system', '2018-03-11 16:00:00', 'system', '2018-03-11 16:00:00', null);
INSERT INTO `js_sys_area` VALUES ('411481', '411400', '0,410000,411400,', '16470', '0000000160,0000001680,0000016470,', '1', '2', '河南省/商丘市/永城市', '永城市', '3', '0', 'system', '2018-03-11 16:00:00', 'system', '2018-03-11 16:00:00', null);
INSERT INTO `js_sys_area` VALUES ('411500', '410000', '0,410000,', '1690', '0000000160,0000001690,', '0', '1', '河南省/信阳市', '信阳市', '2', '0', 'system', '2018-03-11 16:00:00', 'system', '2018-03-11 16:00:00', null);
INSERT INTO `js_sys_area` VALUES ('411501', '411500', '0,410000,411500,', '16480', '0000000160,0000001690,0000016480,', '1', '2', '河南省/信阳市/市辖区', '市辖区', '3', '0', 'system', '2018-03-11 16:00:00', 'system', '2018-03-11 16:00:00', null);
INSERT INTO `js_sys_area` VALUES ('411502', '411500', '0,410000,411500,', '16490', '0000000160,0000001690,0000016490,', '1', '2', '河南省/信阳市/师河区', '师河区', '3', '0', 'system', '2018-03-11 16:00:00', 'system', '2018-03-11 16:00:00', null);
INSERT INTO `js_sys_area` VALUES ('411503', '411500', '0,410000,411500,', '16500', '0000000160,0000001690,0000016500,', '1', '2', '河南省/信阳市/平桥区', '平桥区', '3', '0', 'system', '2018-03-11 16:00:00', 'system', '2018-03-11 16:00:00', null);
INSERT INTO `js_sys_area` VALUES ('411521', '411500', '0,410000,411500,', '16510', '0000000160,0000001690,0000016510,', '1', '2', '河南省/信阳市/罗山县', '罗山县', '3', '0', 'system', '2018-03-11 16:00:00', 'system', '2018-03-11 16:00:00', null);
INSERT INTO `js_sys_area` VALUES ('411522', '411500', '0,410000,411500,', '16520', '0000000160,0000001690,0000016520,', '1', '2', '河南省/信阳市/光山县', '光山县', '3', '0', 'system', '2018-03-11 16:00:00', 'system', '2018-03-11 16:00:00', null);
INSERT INTO `js_sys_area` VALUES ('411523', '411500', '0,410000,411500,', '16530', '0000000160,0000001690,0000016530,', '1', '2', '河南省/信阳市/新　县', '新　县', '3', '0', 'system', '2018-03-11 16:00:00', 'system', '2018-03-11 16:00:00', null);
INSERT INTO `js_sys_area` VALUES ('411524', '411500', '0,410000,411500,', '16540', '0000000160,0000001690,0000016540,', '1', '2', '河南省/信阳市/商城县', '商城县', '3', '0', 'system', '2018-03-11 16:00:00', 'system', '2018-03-11 16:00:00', null);
INSERT INTO `js_sys_area` VALUES ('411525', '411500', '0,410000,411500,', '16550', '0000000160,0000001690,0000016550,', '1', '2', '河南省/信阳市/固始县', '固始县', '3', '0', 'system', '2018-03-11 16:00:00', 'system', '2018-03-11 16:00:00', null);
INSERT INTO `js_sys_area` VALUES ('411526', '411500', '0,410000,411500,', '16560', '0000000160,0000001690,0000016560,', '1', '2', '河南省/信阳市/潢川县', '潢川县', '3', '0', 'system', '2018-03-11 16:00:00', 'system', '2018-03-11 16:00:00', null);
INSERT INTO `js_sys_area` VALUES ('411527', '411500', '0,410000,411500,', '16570', '0000000160,0000001690,0000016570,', '1', '2', '河南省/信阳市/淮滨县', '淮滨县', '3', '0', 'system', '2018-03-11 16:00:00', 'system', '2018-03-11 16:00:00', null);
INSERT INTO `js_sys_area` VALUES ('411528', '411500', '0,410000,411500,', '16580', '0000000160,0000001690,0000016580,', '1', '2', '河南省/信阳市/息　县', '息　县', '3', '0', 'system', '2018-03-11 16:00:00', 'system', '2018-03-11 16:00:00', null);
INSERT INTO `js_sys_area` VALUES ('411600', '410000', '0,410000,', '1700', '0000000160,0000001700,', '0', '1', '河南省/周口市', '周口市', '2', '0', 'system', '2018-03-11 16:00:00', 'system', '2018-03-11 16:00:00', null);
INSERT INTO `js_sys_area` VALUES ('411601', '411600', '0,410000,411600,', '16590', '0000000160,0000001700,0000016590,', '1', '2', '河南省/周口市/市辖区', '市辖区', '3', '0', 'system', '2018-03-11 16:00:00', 'system', '2018-03-11 16:00:00', null);
INSERT INTO `js_sys_area` VALUES ('411602', '411600', '0,410000,411600,', '16600', '0000000160,0000001700,0000016600,', '1', '2', '河南省/周口市/川汇区', '川汇区', '3', '0', 'system', '2018-03-11 16:00:00', 'system', '2018-03-11 16:00:00', null);
INSERT INTO `js_sys_area` VALUES ('411621', '411600', '0,410000,411600,', '16610', '0000000160,0000001700,0000016610,', '1', '2', '河南省/周口市/扶沟县', '扶沟县', '3', '0', 'system', '2018-03-11 16:00:00', 'system', '2018-03-11 16:00:00', null);
INSERT INTO `js_sys_area` VALUES ('411622', '411600', '0,410000,411600,', '16620', '0000000160,0000001700,0000016620,', '1', '2', '河南省/周口市/西华县', '西华县', '3', '0', 'system', '2018-03-11 16:00:00', 'system', '2018-03-11 16:00:00', null);
INSERT INTO `js_sys_area` VALUES ('411623', '411600', '0,410000,411600,', '16630', '0000000160,0000001700,0000016630,', '1', '2', '河南省/周口市/商水县', '商水县', '3', '0', 'system', '2018-03-11 16:00:00', 'system', '2018-03-11 16:00:00', null);
INSERT INTO `js_sys_area` VALUES ('411624', '411600', '0,410000,411600,', '16640', '0000000160,0000001700,0000016640,', '1', '2', '河南省/周口市/沈丘县', '沈丘县', '3', '0', 'system', '2018-03-11 16:00:00', 'system', '2018-03-11 16:00:00', null);
INSERT INTO `js_sys_area` VALUES ('411625', '411600', '0,410000,411600,', '16650', '0000000160,0000001700,0000016650,', '1', '2', '河南省/周口市/郸城县', '郸城县', '3', '0', 'system', '2018-03-11 16:00:00', 'system', '2018-03-11 16:00:00', null);
INSERT INTO `js_sys_area` VALUES ('411626', '411600', '0,410000,411600,', '16660', '0000000160,0000001700,0000016660,', '1', '2', '河南省/周口市/淮阳县', '淮阳县', '3', '0', 'system', '2018-03-11 16:00:00', 'system', '2018-03-11 16:00:00', null);
INSERT INTO `js_sys_area` VALUES ('411627', '411600', '0,410000,411600,', '16670', '0000000160,0000001700,0000016670,', '1', '2', '河南省/周口市/太康县', '太康县', '3', '0', 'system', '2018-03-11 16:00:00', 'system', '2018-03-11 16:00:00', null);
INSERT INTO `js_sys_area` VALUES ('411628', '411600', '0,410000,411600,', '16680', '0000000160,0000001700,0000016680,', '1', '2', '河南省/周口市/鹿邑县', '鹿邑县', '3', '0', 'system', '2018-03-11 16:00:00', 'system', '2018-03-11 16:00:00', null);
INSERT INTO `js_sys_area` VALUES ('411681', '411600', '0,410000,411600,', '16690', '0000000160,0000001700,0000016690,', '1', '2', '河南省/周口市/项城市', '项城市', '3', '0', 'system', '2018-03-11 16:00:00', 'system', '2018-03-11 16:00:00', null);
INSERT INTO `js_sys_area` VALUES ('411700', '410000', '0,410000,', '1710', '0000000160,0000001710,', '0', '1', '河南省/驻马店市', '驻马店市', '2', '0', 'system', '2018-03-11 16:00:00', 'system', '2018-03-11 16:00:00', null);
INSERT INTO `js_sys_area` VALUES ('411701', '411700', '0,410000,411700,', '16700', '0000000160,0000001710,0000016700,', '1', '2', '河南省/驻马店市/市辖区', '市辖区', '3', '0', 'system', '2018-03-11 16:00:00', 'system', '2018-03-11 16:00:00', null);
INSERT INTO `js_sys_area` VALUES ('411702', '411700', '0,410000,411700,', '16710', '0000000160,0000001710,0000016710,', '1', '2', '河南省/驻马店市/驿城区', '驿城区', '3', '0', 'system', '2018-03-11 16:00:00', 'system', '2018-03-11 16:00:00', null);
INSERT INTO `js_sys_area` VALUES ('411721', '411700', '0,410000,411700,', '16720', '0000000160,0000001710,0000016720,', '1', '2', '河南省/驻马店市/西平县', '西平县', '3', '0', 'system', '2018-03-11 16:00:00', 'system', '2018-03-11 16:00:00', null);
INSERT INTO `js_sys_area` VALUES ('411722', '411700', '0,410000,411700,', '16730', '0000000160,0000001710,0000016730,', '1', '2', '河南省/驻马店市/上蔡县', '上蔡县', '3', '0', 'system', '2018-03-11 16:00:00', 'system', '2018-03-11 16:00:00', null);
INSERT INTO `js_sys_area` VALUES ('411723', '411700', '0,410000,411700,', '16740', '0000000160,0000001710,0000016740,', '1', '2', '河南省/驻马店市/平舆县', '平舆县', '3', '0', 'system', '2018-03-11 16:00:00', 'system', '2018-03-11 16:00:00', null);
INSERT INTO `js_sys_area` VALUES ('411724', '411700', '0,410000,411700,', '16750', '0000000160,0000001710,0000016750,', '1', '2', '河南省/驻马店市/正阳县', '正阳县', '3', '0', 'system', '2018-03-11 16:00:00', 'system', '2018-03-11 16:00:00', null);
INSERT INTO `js_sys_area` VALUES ('411725', '411700', '0,410000,411700,', '16760', '0000000160,0000001710,0000016760,', '1', '2', '河南省/驻马店市/确山县', '确山县', '3', '0', 'system', '2018-03-11 16:00:00', 'system', '2018-03-11 16:00:00', null);
INSERT INTO `js_sys_area` VALUES ('411726', '411700', '0,410000,411700,', '16770', '0000000160,0000001710,0000016770,', '1', '2', '河南省/驻马店市/泌阳县', '泌阳县', '3', '0', 'system', '2018-03-11 16:00:00', 'system', '2018-03-11 16:00:00', null);
INSERT INTO `js_sys_area` VALUES ('411727', '411700', '0,410000,411700,', '16780', '0000000160,0000001710,0000016780,', '1', '2', '河南省/驻马店市/汝南县', '汝南县', '3', '0', 'system', '2018-03-11 16:00:00', 'system', '2018-03-11 16:00:00', null);
INSERT INTO `js_sys_area` VALUES ('411728', '411700', '0,410000,411700,', '16790', '0000000160,0000001710,0000016790,', '1', '2', '河南省/驻马店市/遂平县', '遂平县', '3', '0', 'system', '2018-03-11 16:00:00', 'system', '2018-03-11 16:00:00', null);
INSERT INTO `js_sys_area` VALUES ('411729', '411700', '0,410000,411700,', '16800', '0000000160,0000001710,0000016800,', '1', '2', '河南省/驻马店市/新蔡县', '新蔡县', '3', '0', 'system', '2018-03-11 16:00:01', 'system', '2018-03-11 16:00:01', null);
INSERT INTO `js_sys_area` VALUES ('420000', '0', '0,', '170', '0000000170,', '0', '0', '湖北省', '湖北省', '1', '0', 'system', '2018-03-11 16:00:01', 'system', '2018-03-11 16:00:01', null);
INSERT INTO `js_sys_area` VALUES ('420100', '420000', '0,420000,', '1720', '0000000170,0000001720,', '0', '1', '湖北省/武汉市', '武汉市', '2', '0', 'system', '2018-03-11 16:00:01', 'system', '2018-03-11 16:00:01', null);
INSERT INTO `js_sys_area` VALUES ('420101', '420100', '0,420000,420100,', '16810', '0000000170,0000001720,0000016810,', '1', '2', '湖北省/武汉市/市辖区', '市辖区', '3', '0', 'system', '2018-03-11 16:00:01', 'system', '2018-03-11 16:00:01', null);
INSERT INTO `js_sys_area` VALUES ('420102', '420100', '0,420000,420100,', '16820', '0000000170,0000001720,0000016820,', '1', '2', '湖北省/武汉市/江岸区', '江岸区', '3', '0', 'system', '2018-03-11 16:00:01', 'system', '2018-03-11 16:00:01', null);
INSERT INTO `js_sys_area` VALUES ('420103', '420100', '0,420000,420100,', '16830', '0000000170,0000001720,0000016830,', '1', '2', '湖北省/武汉市/江汉区', '江汉区', '3', '0', 'system', '2018-03-11 16:00:01', 'system', '2018-03-11 16:00:01', null);
INSERT INTO `js_sys_area` VALUES ('420104', '420100', '0,420000,420100,', '16840', '0000000170,0000001720,0000016840,', '1', '2', '湖北省/武汉市/乔口区', '乔口区', '3', '0', 'system', '2018-03-11 16:00:01', 'system', '2018-03-11 16:00:01', null);
INSERT INTO `js_sys_area` VALUES ('420105', '420100', '0,420000,420100,', '16850', '0000000170,0000001720,0000016850,', '1', '2', '湖北省/武汉市/汉阳区', '汉阳区', '3', '0', 'system', '2018-03-11 16:00:01', 'system', '2018-03-11 16:00:01', null);
INSERT INTO `js_sys_area` VALUES ('420106', '420100', '0,420000,420100,', '16860', '0000000170,0000001720,0000016860,', '1', '2', '湖北省/武汉市/武昌区', '武昌区', '3', '0', 'system', '2018-03-11 16:00:01', 'system', '2018-03-11 16:00:01', null);
INSERT INTO `js_sys_area` VALUES ('420107', '420100', '0,420000,420100,', '16870', '0000000170,0000001720,0000016870,', '1', '2', '湖北省/武汉市/青山区', '青山区', '3', '0', 'system', '2018-03-11 16:00:01', 'system', '2018-03-11 16:00:01', null);
INSERT INTO `js_sys_area` VALUES ('420111', '420100', '0,420000,420100,', '16880', '0000000170,0000001720,0000016880,', '1', '2', '湖北省/武汉市/洪山区', '洪山区', '3', '0', 'system', '2018-03-11 16:00:01', 'system', '2018-03-11 16:00:01', null);
INSERT INTO `js_sys_area` VALUES ('420112', '420100', '0,420000,420100,', '16890', '0000000170,0000001720,0000016890,', '1', '2', '湖北省/武汉市/东西湖区', '东西湖区', '3', '0', 'system', '2018-03-11 16:00:01', 'system', '2018-03-11 16:00:01', null);
INSERT INTO `js_sys_area` VALUES ('420113', '420100', '0,420000,420100,', '16900', '0000000170,0000001720,0000016900,', '1', '2', '湖北省/武汉市/汉南区', '汉南区', '3', '0', 'system', '2018-03-11 16:00:01', 'system', '2018-03-11 16:00:01', null);
INSERT INTO `js_sys_area` VALUES ('420114', '420100', '0,420000,420100,', '16910', '0000000170,0000001720,0000016910,', '1', '2', '湖北省/武汉市/蔡甸区', '蔡甸区', '3', '0', 'system', '2018-03-11 16:00:01', 'system', '2018-03-11 16:00:01', null);
INSERT INTO `js_sys_area` VALUES ('420115', '420100', '0,420000,420100,', '16920', '0000000170,0000001720,0000016920,', '1', '2', '湖北省/武汉市/江夏区', '江夏区', '3', '0', 'system', '2018-03-11 16:00:01', 'system', '2018-03-11 16:00:01', null);
INSERT INTO `js_sys_area` VALUES ('420116', '420100', '0,420000,420100,', '16930', '0000000170,0000001720,0000016930,', '1', '2', '湖北省/武汉市/黄陂区', '黄陂区', '3', '0', 'system', '2018-03-11 16:00:01', 'system', '2018-03-11 16:00:01', null);
INSERT INTO `js_sys_area` VALUES ('420117', '420100', '0,420000,420100,', '16940', '0000000170,0000001720,0000016940,', '1', '2', '湖北省/武汉市/新洲区', '新洲区', '3', '0', 'system', '2018-03-11 16:00:01', 'system', '2018-03-11 16:00:01', null);
INSERT INTO `js_sys_area` VALUES ('420200', '420000', '0,420000,', '1730', '0000000170,0000001730,', '0', '1', '湖北省/黄石市', '黄石市', '2', '0', 'system', '2018-03-11 16:00:01', 'system', '2018-03-11 16:00:01', null);
INSERT INTO `js_sys_area` VALUES ('420201', '420200', '0,420000,420200,', '16950', '0000000170,0000001730,0000016950,', '1', '2', '湖北省/黄石市/市辖区', '市辖区', '3', '0', 'system', '2018-03-11 16:00:01', 'system', '2018-03-11 16:00:01', null);
INSERT INTO `js_sys_area` VALUES ('420202', '420200', '0,420000,420200,', '16960', '0000000170,0000001730,0000016960,', '1', '2', '湖北省/黄石市/黄石港区', '黄石港区', '3', '0', 'system', '2018-03-11 16:00:01', 'system', '2018-03-11 16:00:01', null);
INSERT INTO `js_sys_area` VALUES ('420203', '420200', '0,420000,420200,', '16970', '0000000170,0000001730,0000016970,', '1', '2', '湖北省/黄石市/西塞山区', '西塞山区', '3', '0', 'system', '2018-03-11 16:00:01', 'system', '2018-03-11 16:00:01', null);
INSERT INTO `js_sys_area` VALUES ('420204', '420200', '0,420000,420200,', '16980', '0000000170,0000001730,0000016980,', '1', '2', '湖北省/黄石市/下陆区', '下陆区', '3', '0', 'system', '2018-03-11 16:00:01', 'system', '2018-03-11 16:00:01', null);
INSERT INTO `js_sys_area` VALUES ('420205', '420200', '0,420000,420200,', '16990', '0000000170,0000001730,0000016990,', '1', '2', '湖北省/黄石市/铁山区', '铁山区', '3', '0', 'system', '2018-03-11 16:00:01', 'system', '2018-03-11 16:00:01', null);
INSERT INTO `js_sys_area` VALUES ('420222', '420200', '0,420000,420200,', '17000', '0000000170,0000001730,0000017000,', '1', '2', '湖北省/黄石市/阳新县', '阳新县', '3', '0', 'system', '2018-03-11 16:00:01', 'system', '2018-03-11 16:00:01', null);
INSERT INTO `js_sys_area` VALUES ('420281', '420200', '0,420000,420200,', '17010', '0000000170,0000001730,0000017010,', '1', '2', '湖北省/黄石市/大冶市', '大冶市', '3', '0', 'system', '2018-03-11 16:00:01', 'system', '2018-03-11 16:00:01', null);
INSERT INTO `js_sys_area` VALUES ('420300', '420000', '0,420000,', '1740', '0000000170,0000001740,', '0', '1', '湖北省/十堰市', '十堰市', '2', '0', 'system', '2018-03-11 16:00:01', 'system', '2018-03-11 16:00:01', null);
INSERT INTO `js_sys_area` VALUES ('420301', '420300', '0,420000,420300,', '17020', '0000000170,0000001740,0000017020,', '1', '2', '湖北省/十堰市/市辖区', '市辖区', '3', '0', 'system', '2018-03-11 16:00:01', 'system', '2018-03-11 16:00:01', null);
INSERT INTO `js_sys_area` VALUES ('420302', '420300', '0,420000,420300,', '17030', '0000000170,0000001740,0000017030,', '1', '2', '湖北省/十堰市/茅箭区', '茅箭区', '3', '0', 'system', '2018-03-11 16:00:01', 'system', '2018-03-11 16:00:01', null);
INSERT INTO `js_sys_area` VALUES ('420303', '420300', '0,420000,420300,', '17040', '0000000170,0000001740,0000017040,', '1', '2', '湖北省/十堰市/张湾区', '张湾区', '3', '0', 'system', '2018-03-11 16:00:01', 'system', '2018-03-11 16:00:01', null);
INSERT INTO `js_sys_area` VALUES ('420321', '420300', '0,420000,420300,', '17050', '0000000170,0000001740,0000017050,', '1', '2', '湖北省/十堰市/郧　县', '郧　县', '3', '0', 'system', '2018-03-11 16:00:01', 'system', '2018-03-11 16:00:01', null);
INSERT INTO `js_sys_area` VALUES ('420322', '420300', '0,420000,420300,', '17060', '0000000170,0000001740,0000017060,', '1', '2', '湖北省/十堰市/郧西县', '郧西县', '3', '0', 'system', '2018-03-11 16:00:01', 'system', '2018-03-11 16:00:01', null);
INSERT INTO `js_sys_area` VALUES ('420323', '420300', '0,420000,420300,', '17070', '0000000170,0000001740,0000017070,', '1', '2', '湖北省/十堰市/竹山县', '竹山县', '3', '0', 'system', '2018-03-11 16:00:01', 'system', '2018-03-11 16:00:01', null);
INSERT INTO `js_sys_area` VALUES ('420324', '420300', '0,420000,420300,', '17080', '0000000170,0000001740,0000017080,', '1', '2', '湖北省/十堰市/竹溪县', '竹溪县', '3', '0', 'system', '2018-03-11 16:00:01', 'system', '2018-03-11 16:00:01', null);
INSERT INTO `js_sys_area` VALUES ('420325', '420300', '0,420000,420300,', '17090', '0000000170,0000001740,0000017090,', '1', '2', '湖北省/十堰市/房　县', '房　县', '3', '0', 'system', '2018-03-11 16:00:01', 'system', '2018-03-11 16:00:01', null);
INSERT INTO `js_sys_area` VALUES ('420381', '420300', '0,420000,420300,', '17100', '0000000170,0000001740,0000017100,', '1', '2', '湖北省/十堰市/丹江口市', '丹江口市', '3', '0', 'system', '2018-03-11 16:00:01', 'system', '2018-03-11 16:00:01', null);
INSERT INTO `js_sys_area` VALUES ('420500', '420000', '0,420000,', '1750', '0000000170,0000001750,', '0', '1', '湖北省/宜昌市', '宜昌市', '2', '0', 'system', '2018-03-11 16:00:01', 'system', '2018-03-11 16:00:01', null);
INSERT INTO `js_sys_area` VALUES ('420501', '420500', '0,420000,420500,', '17110', '0000000170,0000001750,0000017110,', '1', '2', '湖北省/宜昌市/市辖区', '市辖区', '3', '0', 'system', '2018-03-11 16:00:01', 'system', '2018-03-11 16:00:01', null);
INSERT INTO `js_sys_area` VALUES ('420502', '420500', '0,420000,420500,', '17120', '0000000170,0000001750,0000017120,', '1', '2', '湖北省/宜昌市/西陵区', '西陵区', '3', '0', 'system', '2018-03-11 16:00:01', 'system', '2018-03-11 16:00:01', null);
INSERT INTO `js_sys_area` VALUES ('420503', '420500', '0,420000,420500,', '17130', '0000000170,0000001750,0000017130,', '1', '2', '湖北省/宜昌市/伍家岗区', '伍家岗区', '3', '0', 'system', '2018-03-11 16:00:01', 'system', '2018-03-11 16:00:01', null);
INSERT INTO `js_sys_area` VALUES ('420504', '420500', '0,420000,420500,', '17140', '0000000170,0000001750,0000017140,', '1', '2', '湖北省/宜昌市/点军区', '点军区', '3', '0', 'system', '2018-03-11 16:00:01', 'system', '2018-03-11 16:00:01', null);
INSERT INTO `js_sys_area` VALUES ('420505', '420500', '0,420000,420500,', '17150', '0000000170,0000001750,0000017150,', '1', '2', '湖北省/宜昌市/猇亭区', '猇亭区', '3', '0', 'system', '2018-03-11 16:00:01', 'system', '2018-03-11 16:00:01', null);
INSERT INTO `js_sys_area` VALUES ('420506', '420500', '0,420000,420500,', '17160', '0000000170,0000001750,0000017160,', '1', '2', '湖北省/宜昌市/夷陵区', '夷陵区', '3', '0', 'system', '2018-03-11 16:00:01', 'system', '2018-03-11 16:00:01', null);
INSERT INTO `js_sys_area` VALUES ('420525', '420500', '0,420000,420500,', '17170', '0000000170,0000001750,0000017170,', '1', '2', '湖北省/宜昌市/远安县', '远安县', '3', '0', 'system', '2018-03-11 16:00:01', 'system', '2018-03-11 16:00:01', null);
INSERT INTO `js_sys_area` VALUES ('420526', '420500', '0,420000,420500,', '17180', '0000000170,0000001750,0000017180,', '1', '2', '湖北省/宜昌市/兴山县', '兴山县', '3', '0', 'system', '2018-03-11 16:00:01', 'system', '2018-03-11 16:00:01', null);
INSERT INTO `js_sys_area` VALUES ('420527', '420500', '0,420000,420500,', '17190', '0000000170,0000001750,0000017190,', '1', '2', '湖北省/宜昌市/秭归县', '秭归县', '3', '0', 'system', '2018-03-11 16:00:01', 'system', '2018-03-11 16:00:01', null);
INSERT INTO `js_sys_area` VALUES ('420528', '420500', '0,420000,420500,', '17200', '0000000170,0000001750,0000017200,', '1', '2', '湖北省/宜昌市/长阳土家族自治县', '长阳土家族自治县', '3', '0', 'system', '2018-03-11 16:00:01', 'system', '2018-03-11 16:00:01', null);
INSERT INTO `js_sys_area` VALUES ('420529', '420500', '0,420000,420500,', '17210', '0000000170,0000001750,0000017210,', '1', '2', '湖北省/宜昌市/五峰土家族自治县', '五峰土家族自治县', '3', '0', 'system', '2018-03-11 16:00:01', 'system', '2018-03-11 16:00:01', null);
INSERT INTO `js_sys_area` VALUES ('420581', '420500', '0,420000,420500,', '17220', '0000000170,0000001750,0000017220,', '1', '2', '湖北省/宜昌市/宜都市', '宜都市', '3', '0', 'system', '2018-03-11 16:00:01', 'system', '2018-03-11 16:00:01', null);
INSERT INTO `js_sys_area` VALUES ('420582', '420500', '0,420000,420500,', '17230', '0000000170,0000001750,0000017230,', '1', '2', '湖北省/宜昌市/当阳市', '当阳市', '3', '0', 'system', '2018-03-11 16:00:01', 'system', '2018-03-11 16:00:01', null);
INSERT INTO `js_sys_area` VALUES ('420583', '420500', '0,420000,420500,', '17240', '0000000170,0000001750,0000017240,', '1', '2', '湖北省/宜昌市/枝江市', '枝江市', '3', '0', 'system', '2018-03-11 16:00:01', 'system', '2018-03-11 16:00:01', null);
INSERT INTO `js_sys_area` VALUES ('420600', '420000', '0,420000,', '1760', '0000000170,0000001760,', '0', '1', '湖北省/襄樊市', '襄樊市', '2', '0', 'system', '2018-03-11 16:00:01', 'system', '2018-03-11 16:00:01', null);
INSERT INTO `js_sys_area` VALUES ('420601', '420600', '0,420000,420600,', '17250', '0000000170,0000001760,0000017250,', '1', '2', '湖北省/襄樊市/市辖区', '市辖区', '3', '0', 'system', '2018-03-11 16:00:01', 'system', '2018-03-11 16:00:01', null);
INSERT INTO `js_sys_area` VALUES ('420602', '420600', '0,420000,420600,', '17260', '0000000170,0000001760,0000017260,', '1', '2', '湖北省/襄樊市/襄城区', '襄城区', '3', '0', 'system', '2018-03-11 16:00:01', 'system', '2018-03-11 16:00:01', null);
INSERT INTO `js_sys_area` VALUES ('420606', '420600', '0,420000,420600,', '17270', '0000000170,0000001760,0000017270,', '1', '2', '湖北省/襄樊市/樊城区', '樊城区', '3', '0', 'system', '2018-03-11 16:00:01', 'system', '2018-03-11 16:00:01', null);
INSERT INTO `js_sys_area` VALUES ('420607', '420600', '0,420000,420600,', '17280', '0000000170,0000001760,0000017280,', '1', '2', '湖北省/襄樊市/襄阳区', '襄阳区', '3', '0', 'system', '2018-03-11 16:00:01', 'system', '2018-03-11 16:00:01', null);
INSERT INTO `js_sys_area` VALUES ('420624', '420600', '0,420000,420600,', '17290', '0000000170,0000001760,0000017290,', '1', '2', '湖北省/襄樊市/南漳县', '南漳县', '3', '0', 'system', '2018-03-11 16:00:01', 'system', '2018-03-11 16:00:01', null);
INSERT INTO `js_sys_area` VALUES ('420625', '420600', '0,420000,420600,', '17300', '0000000170,0000001760,0000017300,', '1', '2', '湖北省/襄樊市/谷城县', '谷城县', '3', '0', 'system', '2018-03-11 16:00:01', 'system', '2018-03-11 16:00:01', null);
INSERT INTO `js_sys_area` VALUES ('420626', '420600', '0,420000,420600,', '17310', '0000000170,0000001760,0000017310,', '1', '2', '湖北省/襄樊市/保康县', '保康县', '3', '0', 'system', '2018-03-11 16:00:01', 'system', '2018-03-11 16:00:01', null);
INSERT INTO `js_sys_area` VALUES ('420682', '420600', '0,420000,420600,', '17320', '0000000170,0000001760,0000017320,', '1', '2', '湖北省/襄樊市/老河口市', '老河口市', '3', '0', 'system', '2018-03-11 16:00:01', 'system', '2018-03-11 16:00:01', null);
INSERT INTO `js_sys_area` VALUES ('420683', '420600', '0,420000,420600,', '17330', '0000000170,0000001760,0000017330,', '1', '2', '湖北省/襄樊市/枣阳市', '枣阳市', '3', '0', 'system', '2018-03-11 16:00:01', 'system', '2018-03-11 16:00:01', null);
INSERT INTO `js_sys_area` VALUES ('420684', '420600', '0,420000,420600,', '17340', '0000000170,0000001760,0000017340,', '1', '2', '湖北省/襄樊市/宜城市', '宜城市', '3', '0', 'system', '2018-03-11 16:00:01', 'system', '2018-03-11 16:00:01', null);
INSERT INTO `js_sys_area` VALUES ('420700', '420000', '0,420000,', '1770', '0000000170,0000001770,', '0', '1', '湖北省/鄂州市', '鄂州市', '2', '0', 'system', '2018-03-11 16:00:01', 'system', '2018-03-11 16:00:01', null);
INSERT INTO `js_sys_area` VALUES ('420701', '420700', '0,420000,420700,', '17350', '0000000170,0000001770,0000017350,', '1', '2', '湖北省/鄂州市/市辖区', '市辖区', '3', '0', 'system', '2018-03-11 16:00:01', 'system', '2018-03-11 16:00:01', null);
INSERT INTO `js_sys_area` VALUES ('420702', '420700', '0,420000,420700,', '17360', '0000000170,0000001770,0000017360,', '1', '2', '湖北省/鄂州市/梁子湖区', '梁子湖区', '3', '0', 'system', '2018-03-11 16:00:01', 'system', '2018-03-11 16:00:01', null);
INSERT INTO `js_sys_area` VALUES ('420703', '420700', '0,420000,420700,', '17370', '0000000170,0000001770,0000017370,', '1', '2', '湖北省/鄂州市/华容区', '华容区', '3', '0', 'system', '2018-03-11 16:00:01', 'system', '2018-03-11 16:00:01', null);
INSERT INTO `js_sys_area` VALUES ('420704', '420700', '0,420000,420700,', '17380', '0000000170,0000001770,0000017380,', '1', '2', '湖北省/鄂州市/鄂城区', '鄂城区', '3', '0', 'system', '2018-03-11 16:00:01', 'system', '2018-03-11 16:00:01', null);
INSERT INTO `js_sys_area` VALUES ('420800', '420000', '0,420000,', '1780', '0000000170,0000001780,', '0', '1', '湖北省/荆门市', '荆门市', '2', '0', 'system', '2018-03-11 16:00:02', 'system', '2018-03-11 16:00:02', null);
INSERT INTO `js_sys_area` VALUES ('420801', '420800', '0,420000,420800,', '17390', '0000000170,0000001780,0000017390,', '1', '2', '湖北省/荆门市/市辖区', '市辖区', '3', '0', 'system', '2018-03-11 16:00:02', 'system', '2018-03-11 16:00:02', null);
INSERT INTO `js_sys_area` VALUES ('420802', '420800', '0,420000,420800,', '17400', '0000000170,0000001780,0000017400,', '1', '2', '湖北省/荆门市/东宝区', '东宝区', '3', '0', 'system', '2018-03-11 16:00:02', 'system', '2018-03-11 16:00:02', null);
INSERT INTO `js_sys_area` VALUES ('420804', '420800', '0,420000,420800,', '17410', '0000000170,0000001780,0000017410,', '1', '2', '湖北省/荆门市/掇刀区', '掇刀区', '3', '0', 'system', '2018-03-11 16:00:02', 'system', '2018-03-11 16:00:02', null);
INSERT INTO `js_sys_area` VALUES ('420821', '420800', '0,420000,420800,', '17420', '0000000170,0000001780,0000017420,', '1', '2', '湖北省/荆门市/京山县', '京山县', '3', '0', 'system', '2018-03-11 16:00:02', 'system', '2018-03-11 16:00:02', null);
INSERT INTO `js_sys_area` VALUES ('420822', '420800', '0,420000,420800,', '17430', '0000000170,0000001780,0000017430,', '1', '2', '湖北省/荆门市/沙洋县', '沙洋县', '3', '0', 'system', '2018-03-11 16:00:02', 'system', '2018-03-11 16:00:02', null);
INSERT INTO `js_sys_area` VALUES ('420881', '420800', '0,420000,420800,', '17440', '0000000170,0000001780,0000017440,', '1', '2', '湖北省/荆门市/钟祥市', '钟祥市', '3', '0', 'system', '2018-03-11 16:00:02', 'system', '2018-03-11 16:00:02', null);
INSERT INTO `js_sys_area` VALUES ('420900', '420000', '0,420000,', '1790', '0000000170,0000001790,', '0', '1', '湖北省/孝感市', '孝感市', '2', '0', 'system', '2018-03-11 16:00:02', 'system', '2018-03-11 16:00:02', null);
INSERT INTO `js_sys_area` VALUES ('420901', '420900', '0,420000,420900,', '17450', '0000000170,0000001790,0000017450,', '1', '2', '湖北省/孝感市/市辖区', '市辖区', '3', '0', 'system', '2018-03-11 16:00:02', 'system', '2018-03-11 16:00:02', null);
INSERT INTO `js_sys_area` VALUES ('420902', '420900', '0,420000,420900,', '17460', '0000000170,0000001790,0000017460,', '1', '2', '湖北省/孝感市/孝南区', '孝南区', '3', '0', 'system', '2018-03-11 16:00:02', 'system', '2018-03-11 16:00:02', null);
INSERT INTO `js_sys_area` VALUES ('420921', '420900', '0,420000,420900,', '17470', '0000000170,0000001790,0000017470,', '1', '2', '湖北省/孝感市/孝昌县', '孝昌县', '3', '0', 'system', '2018-03-11 16:00:02', 'system', '2018-03-11 16:00:02', null);
INSERT INTO `js_sys_area` VALUES ('420922', '420900', '0,420000,420900,', '17480', '0000000170,0000001790,0000017480,', '1', '2', '湖北省/孝感市/大悟县', '大悟县', '3', '0', 'system', '2018-03-11 16:00:02', 'system', '2018-03-11 16:00:02', null);
INSERT INTO `js_sys_area` VALUES ('420923', '420900', '0,420000,420900,', '17490', '0000000170,0000001790,0000017490,', '1', '2', '湖北省/孝感市/云梦县', '云梦县', '3', '0', 'system', '2018-03-11 16:00:02', 'system', '2018-03-11 16:00:02', null);
INSERT INTO `js_sys_area` VALUES ('420981', '420900', '0,420000,420900,', '17500', '0000000170,0000001790,0000017500,', '1', '2', '湖北省/孝感市/应城市', '应城市', '3', '0', 'system', '2018-03-11 16:00:02', 'system', '2018-03-11 16:00:02', null);
INSERT INTO `js_sys_area` VALUES ('420982', '420900', '0,420000,420900,', '17510', '0000000170,0000001790,0000017510,', '1', '2', '湖北省/孝感市/安陆市', '安陆市', '3', '0', 'system', '2018-03-11 16:00:02', 'system', '2018-03-11 16:00:02', null);
INSERT INTO `js_sys_area` VALUES ('420984', '420900', '0,420000,420900,', '17520', '0000000170,0000001790,0000017520,', '1', '2', '湖北省/孝感市/汉川市', '汉川市', '3', '0', 'system', '2018-03-11 16:00:02', 'system', '2018-03-11 16:00:02', null);
INSERT INTO `js_sys_area` VALUES ('421000', '420000', '0,420000,', '1800', '0000000170,0000001800,', '0', '1', '湖北省/荆州市', '荆州市', '2', '0', 'system', '2018-03-11 16:00:02', 'system', '2018-03-11 16:00:02', null);
INSERT INTO `js_sys_area` VALUES ('421001', '421000', '0,420000,421000,', '17530', '0000000170,0000001800,0000017530,', '1', '2', '湖北省/荆州市/市辖区', '市辖区', '3', '0', 'system', '2018-03-11 16:00:02', 'system', '2018-03-11 16:00:02', null);
INSERT INTO `js_sys_area` VALUES ('421002', '421000', '0,420000,421000,', '17540', '0000000170,0000001800,0000017540,', '1', '2', '湖北省/荆州市/沙市区', '沙市区', '3', '0', 'system', '2018-03-11 16:00:02', 'system', '2018-03-11 16:00:02', null);
INSERT INTO `js_sys_area` VALUES ('421003', '421000', '0,420000,421000,', '17550', '0000000170,0000001800,0000017550,', '1', '2', '湖北省/荆州市/荆州区', '荆州区', '3', '0', 'system', '2018-03-11 16:00:02', 'system', '2018-03-11 16:00:02', null);
INSERT INTO `js_sys_area` VALUES ('421022', '421000', '0,420000,421000,', '17560', '0000000170,0000001800,0000017560,', '1', '2', '湖北省/荆州市/公安县', '公安县', '3', '0', 'system', '2018-03-11 16:00:02', 'system', '2018-03-11 16:00:02', null);
INSERT INTO `js_sys_area` VALUES ('421023', '421000', '0,420000,421000,', '17570', '0000000170,0000001800,0000017570,', '1', '2', '湖北省/荆州市/监利县', '监利县', '3', '0', 'system', '2018-03-11 16:00:02', 'system', '2018-03-11 16:00:02', null);
INSERT INTO `js_sys_area` VALUES ('421024', '421000', '0,420000,421000,', '17580', '0000000170,0000001800,0000017580,', '1', '2', '湖北省/荆州市/江陵县', '江陵县', '3', '0', 'system', '2018-03-11 16:00:02', 'system', '2018-03-11 16:00:02', null);
INSERT INTO `js_sys_area` VALUES ('421081', '421000', '0,420000,421000,', '17590', '0000000170,0000001800,0000017590,', '1', '2', '湖北省/荆州市/石首市', '石首市', '3', '0', 'system', '2018-03-11 16:00:02', 'system', '2018-03-11 16:00:02', null);
INSERT INTO `js_sys_area` VALUES ('421083', '421000', '0,420000,421000,', '17600', '0000000170,0000001800,0000017600,', '1', '2', '湖北省/荆州市/洪湖市', '洪湖市', '3', '0', 'system', '2018-03-11 16:00:02', 'system', '2018-03-11 16:00:02', null);
INSERT INTO `js_sys_area` VALUES ('421087', '421000', '0,420000,421000,', '17610', '0000000170,0000001800,0000017610,', '1', '2', '湖北省/荆州市/松滋市', '松滋市', '3', '0', 'system', '2018-03-11 16:00:02', 'system', '2018-03-11 16:00:02', null);
INSERT INTO `js_sys_area` VALUES ('421100', '420000', '0,420000,', '1810', '0000000170,0000001810,', '0', '1', '湖北省/黄冈市', '黄冈市', '2', '0', 'system', '2018-03-11 16:00:02', 'system', '2018-03-11 16:00:02', null);
INSERT INTO `js_sys_area` VALUES ('421101', '421100', '0,420000,421100,', '17620', '0000000170,0000001810,0000017620,', '1', '2', '湖北省/黄冈市/市辖区', '市辖区', '3', '0', 'system', '2018-03-11 16:00:02', 'system', '2018-03-11 16:00:02', null);
INSERT INTO `js_sys_area` VALUES ('421102', '421100', '0,420000,421100,', '17630', '0000000170,0000001810,0000017630,', '1', '2', '湖北省/黄冈市/黄州区', '黄州区', '3', '0', 'system', '2018-03-11 16:00:02', 'system', '2018-03-11 16:00:02', null);
INSERT INTO `js_sys_area` VALUES ('421121', '421100', '0,420000,421100,', '17640', '0000000170,0000001810,0000017640,', '1', '2', '湖北省/黄冈市/团风县', '团风县', '3', '0', 'system', '2018-03-11 16:00:02', 'system', '2018-03-11 16:00:02', null);
INSERT INTO `js_sys_area` VALUES ('421122', '421100', '0,420000,421100,', '17650', '0000000170,0000001810,0000017650,', '1', '2', '湖北省/黄冈市/红安县', '红安县', '3', '0', 'system', '2018-03-11 16:00:02', 'system', '2018-03-11 16:00:02', null);
INSERT INTO `js_sys_area` VALUES ('421123', '421100', '0,420000,421100,', '17660', '0000000170,0000001810,0000017660,', '1', '2', '湖北省/黄冈市/罗田县', '罗田县', '3', '0', 'system', '2018-03-11 16:00:02', 'system', '2018-03-11 16:00:02', null);
INSERT INTO `js_sys_area` VALUES ('421124', '421100', '0,420000,421100,', '17670', '0000000170,0000001810,0000017670,', '1', '2', '湖北省/黄冈市/英山县', '英山县', '3', '0', 'system', '2018-03-11 16:00:02', 'system', '2018-03-11 16:00:02', null);
INSERT INTO `js_sys_area` VALUES ('421125', '421100', '0,420000,421100,', '17680', '0000000170,0000001810,0000017680,', '1', '2', '湖北省/黄冈市/浠水县', '浠水县', '3', '0', 'system', '2018-03-11 16:00:02', 'system', '2018-03-11 16:00:02', null);
INSERT INTO `js_sys_area` VALUES ('421126', '421100', '0,420000,421100,', '17690', '0000000170,0000001810,0000017690,', '1', '2', '湖北省/黄冈市/蕲春县', '蕲春县', '3', '0', 'system', '2018-03-11 16:00:02', 'system', '2018-03-11 16:00:02', null);
INSERT INTO `js_sys_area` VALUES ('421127', '421100', '0,420000,421100,', '17700', '0000000170,0000001810,0000017700,', '1', '2', '湖北省/黄冈市/黄梅县', '黄梅县', '3', '0', 'system', '2018-03-11 16:00:02', 'system', '2018-03-11 16:00:02', null);
INSERT INTO `js_sys_area` VALUES ('421181', '421100', '0,420000,421100,', '17710', '0000000170,0000001810,0000017710,', '1', '2', '湖北省/黄冈市/麻城市', '麻城市', '3', '0', 'system', '2018-03-11 16:00:02', 'system', '2018-03-11 16:00:02', null);
INSERT INTO `js_sys_area` VALUES ('421182', '421100', '0,420000,421100,', '17720', '0000000170,0000001810,0000017720,', '1', '2', '湖北省/黄冈市/武穴市', '武穴市', '3', '0', 'system', '2018-03-11 16:00:02', 'system', '2018-03-11 16:00:02', null);
INSERT INTO `js_sys_area` VALUES ('421200', '420000', '0,420000,', '1820', '0000000170,0000001820,', '0', '1', '湖北省/咸宁市', '咸宁市', '2', '0', 'system', '2018-03-11 16:00:02', 'system', '2018-03-11 16:00:02', null);
INSERT INTO `js_sys_area` VALUES ('421201', '421200', '0,420000,421200,', '17730', '0000000170,0000001820,0000017730,', '1', '2', '湖北省/咸宁市/市辖区', '市辖区', '3', '0', 'system', '2018-03-11 16:00:02', 'system', '2018-03-11 16:00:02', null);
INSERT INTO `js_sys_area` VALUES ('421202', '421200', '0,420000,421200,', '17740', '0000000170,0000001820,0000017740,', '1', '2', '湖北省/咸宁市/咸安区', '咸安区', '3', '0', 'system', '2018-03-11 16:00:02', 'system', '2018-03-11 16:00:02', null);
INSERT INTO `js_sys_area` VALUES ('421221', '421200', '0,420000,421200,', '17750', '0000000170,0000001820,0000017750,', '1', '2', '湖北省/咸宁市/嘉鱼县', '嘉鱼县', '3', '0', 'system', '2018-03-11 16:00:02', 'system', '2018-03-11 16:00:02', null);
INSERT INTO `js_sys_area` VALUES ('421222', '421200', '0,420000,421200,', '17760', '0000000170,0000001820,0000017760,', '1', '2', '湖北省/咸宁市/通城县', '通城县', '3', '0', 'system', '2018-03-11 16:00:02', 'system', '2018-03-11 16:00:02', null);
INSERT INTO `js_sys_area` VALUES ('421223', '421200', '0,420000,421200,', '17770', '0000000170,0000001820,0000017770,', '1', '2', '湖北省/咸宁市/崇阳县', '崇阳县', '3', '0', 'system', '2018-03-11 16:00:02', 'system', '2018-03-11 16:00:02', null);
INSERT INTO `js_sys_area` VALUES ('421224', '421200', '0,420000,421200,', '17780', '0000000170,0000001820,0000017780,', '1', '2', '湖北省/咸宁市/通山县', '通山县', '3', '0', 'system', '2018-03-11 16:00:02', 'system', '2018-03-11 16:00:02', null);
INSERT INTO `js_sys_area` VALUES ('421281', '421200', '0,420000,421200,', '17790', '0000000170,0000001820,0000017790,', '1', '2', '湖北省/咸宁市/赤壁市', '赤壁市', '3', '0', 'system', '2018-03-11 16:00:02', 'system', '2018-03-11 16:00:02', null);
INSERT INTO `js_sys_area` VALUES ('421300', '420000', '0,420000,', '1830', '0000000170,0000001830,', '0', '1', '湖北省/随州市', '随州市', '2', '0', 'system', '2018-03-11 16:00:02', 'system', '2018-03-11 16:00:02', null);
INSERT INTO `js_sys_area` VALUES ('421301', '421300', '0,420000,421300,', '17800', '0000000170,0000001830,0000017800,', '1', '2', '湖北省/随州市/市辖区', '市辖区', '3', '0', 'system', '2018-03-11 16:00:02', 'system', '2018-03-11 16:00:02', null);
INSERT INTO `js_sys_area` VALUES ('421302', '421300', '0,420000,421300,', '17810', '0000000170,0000001830,0000017810,', '1', '2', '湖北省/随州市/曾都区', '曾都区', '3', '0', 'system', '2018-03-11 16:00:02', 'system', '2018-03-11 16:00:02', null);
INSERT INTO `js_sys_area` VALUES ('421381', '421300', '0,420000,421300,', '17820', '0000000170,0000001830,0000017820,', '1', '2', '湖北省/随州市/广水市', '广水市', '3', '0', 'system', '2018-03-11 16:00:02', 'system', '2018-03-11 16:00:02', null);
INSERT INTO `js_sys_area` VALUES ('422800', '420000', '0,420000,', '1840', '0000000170,0000001840,', '0', '1', '湖北省/恩施土家族苗族自治州', '恩施土家族苗族自治州', '2', '0', 'system', '2018-03-11 16:00:02', 'system', '2018-03-11 16:00:02', null);
INSERT INTO `js_sys_area` VALUES ('422801', '422800', '0,420000,422800,', '17830', '0000000170,0000001840,0000017830,', '1', '2', '湖北省/恩施土家族苗族自治州/恩施市', '恩施市', '3', '0', 'system', '2018-03-11 16:00:02', 'system', '2018-03-11 16:00:02', null);
INSERT INTO `js_sys_area` VALUES ('422802', '422800', '0,420000,422800,', '17840', '0000000170,0000001840,0000017840,', '1', '2', '湖北省/恩施土家族苗族自治州/利川市', '利川市', '3', '0', 'system', '2018-03-11 16:00:02', 'system', '2018-03-11 16:00:02', null);
INSERT INTO `js_sys_area` VALUES ('422822', '422800', '0,420000,422800,', '17850', '0000000170,0000001840,0000017850,', '1', '2', '湖北省/恩施土家族苗族自治州/建始县', '建始县', '3', '0', 'system', '2018-03-11 16:00:02', 'system', '2018-03-11 16:00:02', null);
INSERT INTO `js_sys_area` VALUES ('422823', '422800', '0,420000,422800,', '17860', '0000000170,0000001840,0000017860,', '1', '2', '湖北省/恩施土家族苗族自治州/巴东县', '巴东县', '3', '0', 'system', '2018-03-11 16:00:02', 'system', '2018-03-11 16:00:02', null);
INSERT INTO `js_sys_area` VALUES ('422825', '422800', '0,420000,422800,', '17870', '0000000170,0000001840,0000017870,', '1', '2', '湖北省/恩施土家族苗族自治州/宣恩县', '宣恩县', '3', '0', 'system', '2018-03-11 16:00:02', 'system', '2018-03-11 16:00:02', null);
INSERT INTO `js_sys_area` VALUES ('422826', '422800', '0,420000,422800,', '17880', '0000000170,0000001840,0000017880,', '1', '2', '湖北省/恩施土家族苗族自治州/咸丰县', '咸丰县', '3', '0', 'system', '2018-03-11 16:00:02', 'system', '2018-03-11 16:00:02', null);
INSERT INTO `js_sys_area` VALUES ('422827', '422800', '0,420000,422800,', '17890', '0000000170,0000001840,0000017890,', '1', '2', '湖北省/恩施土家族苗族自治州/来凤县', '来凤县', '3', '0', 'system', '2018-03-11 16:00:02', 'system', '2018-03-11 16:00:02', null);
INSERT INTO `js_sys_area` VALUES ('422828', '422800', '0,420000,422800,', '17900', '0000000170,0000001840,0000017900,', '1', '2', '湖北省/恩施土家族苗族自治州/鹤峰县', '鹤峰县', '3', '0', 'system', '2018-03-11 16:00:02', 'system', '2018-03-11 16:00:02', null);
INSERT INTO `js_sys_area` VALUES ('429000', '420000', '0,420000,', '1850', '0000000170,0000001850,', '0', '1', '湖北省/省直辖行政单位', '省直辖行政单位', '2', '0', 'system', '2018-03-11 16:00:02', 'system', '2018-03-11 16:00:02', null);
INSERT INTO `js_sys_area` VALUES ('429004', '429000', '0,420000,429000,', '17910', '0000000170,0000001850,0000017910,', '1', '2', '湖北省/省直辖行政单位/仙桃市', '仙桃市', '3', '0', 'system', '2018-03-11 16:00:02', 'system', '2018-03-11 16:00:02', null);
INSERT INTO `js_sys_area` VALUES ('429005', '429000', '0,420000,429000,', '17920', '0000000170,0000001850,0000017920,', '1', '2', '湖北省/省直辖行政单位/潜江市', '潜江市', '3', '0', 'system', '2018-03-11 16:00:02', 'system', '2018-03-11 16:00:02', null);
INSERT INTO `js_sys_area` VALUES ('429006', '429000', '0,420000,429000,', '17930', '0000000170,0000001850,0000017930,', '1', '2', '湖北省/省直辖行政单位/天门市', '天门市', '3', '0', 'system', '2018-03-11 16:00:02', 'system', '2018-03-11 16:00:02', null);
INSERT INTO `js_sys_area` VALUES ('429021', '429000', '0,420000,429000,', '17940', '0000000170,0000001850,0000017940,', '1', '2', '湖北省/省直辖行政单位/神农架林区', '神农架林区', '3', '0', 'system', '2018-03-11 16:00:02', 'system', '2018-03-11 16:00:02', null);
INSERT INTO `js_sys_area` VALUES ('430000', '0', '0,', '180', '0000000180,', '0', '0', '湖南省', '湖南省', '1', '0', 'system', '2018-03-11 16:00:02', 'system', '2018-03-11 16:00:02', null);
INSERT INTO `js_sys_area` VALUES ('430100', '430000', '0,430000,', '1860', '0000000180,0000001860,', '0', '1', '湖南省/长沙市', '长沙市', '2', '0', 'system', '2018-03-11 16:00:02', 'system', '2018-03-11 16:00:02', null);
INSERT INTO `js_sys_area` VALUES ('430101', '430100', '0,430000,430100,', '17950', '0000000180,0000001860,0000017950,', '1', '2', '湖南省/长沙市/市辖区', '市辖区', '3', '0', 'system', '2018-03-11 16:00:02', 'system', '2018-03-11 16:00:02', null);
INSERT INTO `js_sys_area` VALUES ('430102', '430100', '0,430000,430100,', '17960', '0000000180,0000001860,0000017960,', '1', '2', '湖南省/长沙市/芙蓉区', '芙蓉区', '3', '0', 'system', '2018-03-11 16:00:02', 'system', '2018-03-11 16:00:02', null);
INSERT INTO `js_sys_area` VALUES ('430103', '430100', '0,430000,430100,', '17970', '0000000180,0000001860,0000017970,', '1', '2', '湖南省/长沙市/天心区', '天心区', '3', '0', 'system', '2018-03-11 16:00:02', 'system', '2018-03-11 16:00:02', null);
INSERT INTO `js_sys_area` VALUES ('430104', '430100', '0,430000,430100,', '17980', '0000000180,0000001860,0000017980,', '1', '2', '湖南省/长沙市/岳麓区', '岳麓区', '3', '0', 'system', '2018-03-11 16:00:02', 'system', '2018-03-11 16:00:02', null);
INSERT INTO `js_sys_area` VALUES ('430105', '430100', '0,430000,430100,', '17990', '0000000180,0000001860,0000017990,', '1', '2', '湖南省/长沙市/开福区', '开福区', '3', '0', 'system', '2018-03-11 16:00:03', 'system', '2018-03-11 16:00:03', null);
INSERT INTO `js_sys_area` VALUES ('430111', '430100', '0,430000,430100,', '18000', '0000000180,0000001860,0000018000,', '1', '2', '湖南省/长沙市/雨花区', '雨花区', '3', '0', 'system', '2018-03-11 16:00:03', 'system', '2018-03-11 16:00:03', null);
INSERT INTO `js_sys_area` VALUES ('430121', '430100', '0,430000,430100,', '18010', '0000000180,0000001860,0000018010,', '1', '2', '湖南省/长沙市/长沙县', '长沙县', '3', '0', 'system', '2018-03-11 16:00:03', 'system', '2018-03-11 16:00:03', null);
INSERT INTO `js_sys_area` VALUES ('430122', '430100', '0,430000,430100,', '18020', '0000000180,0000001860,0000018020,', '1', '2', '湖南省/长沙市/望城县', '望城县', '3', '0', 'system', '2018-03-11 16:00:03', 'system', '2018-03-11 16:00:03', null);
INSERT INTO `js_sys_area` VALUES ('430124', '430100', '0,430000,430100,', '18030', '0000000180,0000001860,0000018030,', '1', '2', '湖南省/长沙市/宁乡县', '宁乡县', '3', '0', 'system', '2018-03-11 16:00:03', 'system', '2018-03-11 16:00:03', null);
INSERT INTO `js_sys_area` VALUES ('430181', '430100', '0,430000,430100,', '18040', '0000000180,0000001860,0000018040,', '1', '2', '湖南省/长沙市/浏阳市', '浏阳市', '3', '0', 'system', '2018-03-11 16:00:03', 'system', '2018-03-11 16:00:03', null);
INSERT INTO `js_sys_area` VALUES ('430200', '430000', '0,430000,', '1870', '0000000180,0000001870,', '0', '1', '湖南省/株洲市', '株洲市', '2', '0', 'system', '2018-03-11 16:00:03', 'system', '2018-03-11 16:00:03', null);
INSERT INTO `js_sys_area` VALUES ('430201', '430200', '0,430000,430200,', '18050', '0000000180,0000001870,0000018050,', '1', '2', '湖南省/株洲市/市辖区', '市辖区', '3', '0', 'system', '2018-03-11 16:00:03', 'system', '2018-03-11 16:00:03', null);
INSERT INTO `js_sys_area` VALUES ('430202', '430200', '0,430000,430200,', '18060', '0000000180,0000001870,0000018060,', '1', '2', '湖南省/株洲市/荷塘区', '荷塘区', '3', '0', 'system', '2018-03-11 16:00:03', 'system', '2018-03-11 16:00:03', null);
INSERT INTO `js_sys_area` VALUES ('430203', '430200', '0,430000,430200,', '18070', '0000000180,0000001870,0000018070,', '1', '2', '湖南省/株洲市/芦淞区', '芦淞区', '3', '0', 'system', '2018-03-11 16:00:03', 'system', '2018-03-11 16:00:03', null);
INSERT INTO `js_sys_area` VALUES ('430204', '430200', '0,430000,430200,', '18080', '0000000180,0000001870,0000018080,', '1', '2', '湖南省/株洲市/石峰区', '石峰区', '3', '0', 'system', '2018-03-11 16:00:03', 'system', '2018-03-11 16:00:03', null);
INSERT INTO `js_sys_area` VALUES ('430211', '430200', '0,430000,430200,', '18090', '0000000180,0000001870,0000018090,', '1', '2', '湖南省/株洲市/天元区', '天元区', '3', '0', 'system', '2018-03-11 16:00:03', 'system', '2018-03-11 16:00:03', null);
INSERT INTO `js_sys_area` VALUES ('430221', '430200', '0,430000,430200,', '18100', '0000000180,0000001870,0000018100,', '1', '2', '湖南省/株洲市/株洲县', '株洲县', '3', '0', 'system', '2018-03-11 16:00:03', 'system', '2018-03-11 16:00:03', null);
INSERT INTO `js_sys_area` VALUES ('430223', '430200', '0,430000,430200,', '18110', '0000000180,0000001870,0000018110,', '1', '2', '湖南省/株洲市/攸　县', '攸　县', '3', '0', 'system', '2018-03-11 16:00:03', 'system', '2018-03-11 16:00:03', null);
INSERT INTO `js_sys_area` VALUES ('430224', '430200', '0,430000,430200,', '18120', '0000000180,0000001870,0000018120,', '1', '2', '湖南省/株洲市/茶陵县', '茶陵县', '3', '0', 'system', '2018-03-11 16:00:03', 'system', '2018-03-11 16:00:03', null);
INSERT INTO `js_sys_area` VALUES ('430225', '430200', '0,430000,430200,', '18130', '0000000180,0000001870,0000018130,', '1', '2', '湖南省/株洲市/炎陵县', '炎陵县', '3', '0', 'system', '2018-03-11 16:00:03', 'system', '2018-03-11 16:00:03', null);
INSERT INTO `js_sys_area` VALUES ('430281', '430200', '0,430000,430200,', '18140', '0000000180,0000001870,0000018140,', '1', '2', '湖南省/株洲市/醴陵市', '醴陵市', '3', '0', 'system', '2018-03-11 16:00:03', 'system', '2018-03-11 16:00:03', null);
INSERT INTO `js_sys_area` VALUES ('430300', '430000', '0,430000,', '1880', '0000000180,0000001880,', '0', '1', '湖南省/湘潭市', '湘潭市', '2', '0', 'system', '2018-03-11 16:00:03', 'system', '2018-03-11 16:00:03', null);
INSERT INTO `js_sys_area` VALUES ('430301', '430300', '0,430000,430300,', '18150', '0000000180,0000001880,0000018150,', '1', '2', '湖南省/湘潭市/市辖区', '市辖区', '3', '0', 'system', '2018-03-11 16:00:03', 'system', '2018-03-11 16:00:03', null);
INSERT INTO `js_sys_area` VALUES ('430302', '430300', '0,430000,430300,', '18160', '0000000180,0000001880,0000018160,', '1', '2', '湖南省/湘潭市/雨湖区', '雨湖区', '3', '0', 'system', '2018-03-11 16:00:03', 'system', '2018-03-11 16:00:03', null);
INSERT INTO `js_sys_area` VALUES ('430304', '430300', '0,430000,430300,', '18170', '0000000180,0000001880,0000018170,', '1', '2', '湖南省/湘潭市/岳塘区', '岳塘区', '3', '0', 'system', '2018-03-11 16:00:03', 'system', '2018-03-11 16:00:03', null);
INSERT INTO `js_sys_area` VALUES ('430321', '430300', '0,430000,430300,', '18180', '0000000180,0000001880,0000018180,', '1', '2', '湖南省/湘潭市/湘潭县', '湘潭县', '3', '0', 'system', '2018-03-11 16:00:03', 'system', '2018-03-11 16:00:03', null);
INSERT INTO `js_sys_area` VALUES ('430381', '430300', '0,430000,430300,', '18190', '0000000180,0000001880,0000018190,', '1', '2', '湖南省/湘潭市/湘乡市', '湘乡市', '3', '0', 'system', '2018-03-11 16:00:03', 'system', '2018-03-11 16:00:03', null);
INSERT INTO `js_sys_area` VALUES ('430382', '430300', '0,430000,430300,', '18200', '0000000180,0000001880,0000018200,', '1', '2', '湖南省/湘潭市/韶山市', '韶山市', '3', '0', 'system', '2018-03-11 16:00:03', 'system', '2018-03-11 16:00:03', null);
INSERT INTO `js_sys_area` VALUES ('430400', '430000', '0,430000,', '1890', '0000000180,0000001890,', '0', '1', '湖南省/衡阳市', '衡阳市', '2', '0', 'system', '2018-03-11 16:00:03', 'system', '2018-03-11 16:00:03', null);
INSERT INTO `js_sys_area` VALUES ('430401', '430400', '0,430000,430400,', '18210', '0000000180,0000001890,0000018210,', '1', '2', '湖南省/衡阳市/市辖区', '市辖区', '3', '0', 'system', '2018-03-11 16:00:03', 'system', '2018-03-11 16:00:03', null);
INSERT INTO `js_sys_area` VALUES ('430405', '430400', '0,430000,430400,', '18220', '0000000180,0000001890,0000018220,', '1', '2', '湖南省/衡阳市/珠晖区', '珠晖区', '3', '0', 'system', '2018-03-11 16:00:03', 'system', '2018-03-11 16:00:03', null);
INSERT INTO `js_sys_area` VALUES ('430406', '430400', '0,430000,430400,', '18230', '0000000180,0000001890,0000018230,', '1', '2', '湖南省/衡阳市/雁峰区', '雁峰区', '3', '0', 'system', '2018-03-11 16:00:03', 'system', '2018-03-11 16:00:03', null);
INSERT INTO `js_sys_area` VALUES ('430407', '430400', '0,430000,430400,', '18240', '0000000180,0000001890,0000018240,', '1', '2', '湖南省/衡阳市/石鼓区', '石鼓区', '3', '0', 'system', '2018-03-11 16:00:03', 'system', '2018-03-11 16:00:03', null);
INSERT INTO `js_sys_area` VALUES ('430408', '430400', '0,430000,430400,', '18250', '0000000180,0000001890,0000018250,', '1', '2', '湖南省/衡阳市/蒸湘区', '蒸湘区', '3', '0', 'system', '2018-03-11 16:00:03', 'system', '2018-03-11 16:00:03', null);
INSERT INTO `js_sys_area` VALUES ('430412', '430400', '0,430000,430400,', '18260', '0000000180,0000001890,0000018260,', '1', '2', '湖南省/衡阳市/南岳区', '南岳区', '3', '0', 'system', '2018-03-11 16:00:03', 'system', '2018-03-11 16:00:03', null);
INSERT INTO `js_sys_area` VALUES ('430421', '430400', '0,430000,430400,', '18270', '0000000180,0000001890,0000018270,', '1', '2', '湖南省/衡阳市/衡阳县', '衡阳县', '3', '0', 'system', '2018-03-11 16:00:03', 'system', '2018-03-11 16:00:03', null);
INSERT INTO `js_sys_area` VALUES ('430422', '430400', '0,430000,430400,', '18280', '0000000180,0000001890,0000018280,', '1', '2', '湖南省/衡阳市/衡南县', '衡南县', '3', '0', 'system', '2018-03-11 16:00:03', 'system', '2018-03-11 16:00:03', null);
INSERT INTO `js_sys_area` VALUES ('430423', '430400', '0,430000,430400,', '18290', '0000000180,0000001890,0000018290,', '1', '2', '湖南省/衡阳市/衡山县', '衡山县', '3', '0', 'system', '2018-03-11 16:00:03', 'system', '2018-03-11 16:00:03', null);
INSERT INTO `js_sys_area` VALUES ('430424', '430400', '0,430000,430400,', '18300', '0000000180,0000001890,0000018300,', '1', '2', '湖南省/衡阳市/衡东县', '衡东县', '3', '0', 'system', '2018-03-11 16:00:03', 'system', '2018-03-11 16:00:03', null);
INSERT INTO `js_sys_area` VALUES ('430426', '430400', '0,430000,430400,', '18310', '0000000180,0000001890,0000018310,', '1', '2', '湖南省/衡阳市/祁东县', '祁东县', '3', '0', 'system', '2018-03-11 16:00:03', 'system', '2018-03-11 16:00:03', null);
INSERT INTO `js_sys_area` VALUES ('430481', '430400', '0,430000,430400,', '18320', '0000000180,0000001890,0000018320,', '1', '2', '湖南省/衡阳市/耒阳市', '耒阳市', '3', '0', 'system', '2018-03-11 16:00:03', 'system', '2018-03-11 16:00:03', null);
INSERT INTO `js_sys_area` VALUES ('430482', '430400', '0,430000,430400,', '18330', '0000000180,0000001890,0000018330,', '1', '2', '湖南省/衡阳市/常宁市', '常宁市', '3', '0', 'system', '2018-03-11 16:00:03', 'system', '2018-03-11 16:00:03', null);
INSERT INTO `js_sys_area` VALUES ('430500', '430000', '0,430000,', '1900', '0000000180,0000001900,', '0', '1', '湖南省/邵阳市', '邵阳市', '2', '0', 'system', '2018-03-11 16:00:03', 'system', '2018-03-11 16:00:03', null);
INSERT INTO `js_sys_area` VALUES ('430501', '430500', '0,430000,430500,', '18340', '0000000180,0000001900,0000018340,', '1', '2', '湖南省/邵阳市/市辖区', '市辖区', '3', '0', 'system', '2018-03-11 16:00:03', 'system', '2018-03-11 16:00:03', null);
INSERT INTO `js_sys_area` VALUES ('430502', '430500', '0,430000,430500,', '18350', '0000000180,0000001900,0000018350,', '1', '2', '湖南省/邵阳市/双清区', '双清区', '3', '0', 'system', '2018-03-11 16:00:03', 'system', '2018-03-11 16:00:03', null);
INSERT INTO `js_sys_area` VALUES ('430503', '430500', '0,430000,430500,', '18360', '0000000180,0000001900,0000018360,', '1', '2', '湖南省/邵阳市/大祥区', '大祥区', '3', '0', 'system', '2018-03-11 16:00:03', 'system', '2018-03-11 16:00:03', null);
INSERT INTO `js_sys_area` VALUES ('430511', '430500', '0,430000,430500,', '18370', '0000000180,0000001900,0000018370,', '1', '2', '湖南省/邵阳市/北塔区', '北塔区', '3', '0', 'system', '2018-03-11 16:00:03', 'system', '2018-03-11 16:00:03', null);
INSERT INTO `js_sys_area` VALUES ('430521', '430500', '0,430000,430500,', '18380', '0000000180,0000001900,0000018380,', '1', '2', '湖南省/邵阳市/邵东县', '邵东县', '3', '0', 'system', '2018-03-11 16:00:03', 'system', '2018-03-11 16:00:03', null);
INSERT INTO `js_sys_area` VALUES ('430522', '430500', '0,430000,430500,', '18390', '0000000180,0000001900,0000018390,', '1', '2', '湖南省/邵阳市/新邵县', '新邵县', '3', '0', 'system', '2018-03-11 16:00:03', 'system', '2018-03-11 16:00:03', null);
INSERT INTO `js_sys_area` VALUES ('430523', '430500', '0,430000,430500,', '18400', '0000000180,0000001900,0000018400,', '1', '2', '湖南省/邵阳市/邵阳县', '邵阳县', '3', '0', 'system', '2018-03-11 16:00:03', 'system', '2018-03-11 16:00:03', null);
INSERT INTO `js_sys_area` VALUES ('430524', '430500', '0,430000,430500,', '18410', '0000000180,0000001900,0000018410,', '1', '2', '湖南省/邵阳市/隆回县', '隆回县', '3', '0', 'system', '2018-03-11 16:00:03', 'system', '2018-03-11 16:00:03', null);
INSERT INTO `js_sys_area` VALUES ('430525', '430500', '0,430000,430500,', '18420', '0000000180,0000001900,0000018420,', '1', '2', '湖南省/邵阳市/洞口县', '洞口县', '3', '0', 'system', '2018-03-11 16:00:03', 'system', '2018-03-11 16:00:03', null);
INSERT INTO `js_sys_area` VALUES ('430527', '430500', '0,430000,430500,', '18430', '0000000180,0000001900,0000018430,', '1', '2', '湖南省/邵阳市/绥宁县', '绥宁县', '3', '0', 'system', '2018-03-11 16:00:03', 'system', '2018-03-11 16:00:03', null);
INSERT INTO `js_sys_area` VALUES ('430528', '430500', '0,430000,430500,', '18440', '0000000180,0000001900,0000018440,', '1', '2', '湖南省/邵阳市/新宁县', '新宁县', '3', '0', 'system', '2018-03-11 16:00:03', 'system', '2018-03-11 16:00:03', null);
INSERT INTO `js_sys_area` VALUES ('430529', '430500', '0,430000,430500,', '18450', '0000000180,0000001900,0000018450,', '1', '2', '湖南省/邵阳市/城步苗族自治县', '城步苗族自治县', '3', '0', 'system', '2018-03-11 16:00:03', 'system', '2018-03-11 16:00:03', null);
INSERT INTO `js_sys_area` VALUES ('430581', '430500', '0,430000,430500,', '18460', '0000000180,0000001900,0000018460,', '1', '2', '湖南省/邵阳市/武冈市', '武冈市', '3', '0', 'system', '2018-03-11 16:00:03', 'system', '2018-03-11 16:00:03', null);
INSERT INTO `js_sys_area` VALUES ('430600', '430000', '0,430000,', '1910', '0000000180,0000001910,', '0', '1', '湖南省/岳阳市', '岳阳市', '2', '0', 'system', '2018-03-11 16:00:03', 'system', '2018-03-11 16:00:03', null);
INSERT INTO `js_sys_area` VALUES ('430601', '430600', '0,430000,430600,', '18470', '0000000180,0000001910,0000018470,', '1', '2', '湖南省/岳阳市/市辖区', '市辖区', '3', '0', 'system', '2018-03-11 16:00:03', 'system', '2018-03-11 16:00:03', null);
INSERT INTO `js_sys_area` VALUES ('430602', '430600', '0,430000,430600,', '18480', '0000000180,0000001910,0000018480,', '1', '2', '湖南省/岳阳市/岳阳楼区', '岳阳楼区', '3', '0', 'system', '2018-03-11 16:00:03', 'system', '2018-03-11 16:00:03', null);
INSERT INTO `js_sys_area` VALUES ('430603', '430600', '0,430000,430600,', '18490', '0000000180,0000001910,0000018490,', '1', '2', '湖南省/岳阳市/云溪区', '云溪区', '3', '0', 'system', '2018-03-11 16:00:03', 'system', '2018-03-11 16:00:03', null);
INSERT INTO `js_sys_area` VALUES ('430611', '430600', '0,430000,430600,', '18500', '0000000180,0000001910,0000018500,', '1', '2', '湖南省/岳阳市/君山区', '君山区', '3', '0', 'system', '2018-03-11 16:00:03', 'system', '2018-03-11 16:00:03', null);
INSERT INTO `js_sys_area` VALUES ('430621', '430600', '0,430000,430600,', '18510', '0000000180,0000001910,0000018510,', '1', '2', '湖南省/岳阳市/岳阳县', '岳阳县', '3', '0', 'system', '2018-03-11 16:00:03', 'system', '2018-03-11 16:00:03', null);
INSERT INTO `js_sys_area` VALUES ('430623', '430600', '0,430000,430600,', '18520', '0000000180,0000001910,0000018520,', '1', '2', '湖南省/岳阳市/华容县', '华容县', '3', '0', 'system', '2018-03-11 16:00:03', 'system', '2018-03-11 16:00:03', null);
INSERT INTO `js_sys_area` VALUES ('430624', '430600', '0,430000,430600,', '18530', '0000000180,0000001910,0000018530,', '1', '2', '湖南省/岳阳市/湘阴县', '湘阴县', '3', '0', 'system', '2018-03-11 16:00:03', 'system', '2018-03-11 16:00:03', null);
INSERT INTO `js_sys_area` VALUES ('430626', '430600', '0,430000,430600,', '18540', '0000000180,0000001910,0000018540,', '1', '2', '湖南省/岳阳市/平江县', '平江县', '3', '0', 'system', '2018-03-11 16:00:03', 'system', '2018-03-11 16:00:03', null);
INSERT INTO `js_sys_area` VALUES ('430681', '430600', '0,430000,430600,', '18550', '0000000180,0000001910,0000018550,', '1', '2', '湖南省/岳阳市/汨罗市', '汨罗市', '3', '0', 'system', '2018-03-11 16:00:03', 'system', '2018-03-11 16:00:03', null);
INSERT INTO `js_sys_area` VALUES ('430682', '430600', '0,430000,430600,', '18560', '0000000180,0000001910,0000018560,', '1', '2', '湖南省/岳阳市/临湘市', '临湘市', '3', '0', 'system', '2018-03-11 16:00:03', 'system', '2018-03-11 16:00:03', null);
INSERT INTO `js_sys_area` VALUES ('430700', '430000', '0,430000,', '1920', '0000000180,0000001920,', '0', '1', '湖南省/常德市', '常德市', '2', '0', 'system', '2018-03-11 16:00:03', 'system', '2018-03-11 16:00:03', null);
INSERT INTO `js_sys_area` VALUES ('430701', '430700', '0,430000,430700,', '18570', '0000000180,0000001920,0000018570,', '1', '2', '湖南省/常德市/市辖区', '市辖区', '3', '0', 'system', '2018-03-11 16:00:03', 'system', '2018-03-11 16:00:03', null);
INSERT INTO `js_sys_area` VALUES ('430702', '430700', '0,430000,430700,', '18580', '0000000180,0000001920,0000018580,', '1', '2', '湖南省/常德市/武陵区', '武陵区', '3', '0', 'system', '2018-03-11 16:00:03', 'system', '2018-03-11 16:00:03', null);
INSERT INTO `js_sys_area` VALUES ('430703', '430700', '0,430000,430700,', '18590', '0000000180,0000001920,0000018590,', '1', '2', '湖南省/常德市/鼎城区', '鼎城区', '3', '0', 'system', '2018-03-11 16:00:03', 'system', '2018-03-11 16:00:03', null);
INSERT INTO `js_sys_area` VALUES ('430721', '430700', '0,430000,430700,', '18600', '0000000180,0000001920,0000018600,', '1', '2', '湖南省/常德市/安乡县', '安乡县', '3', '0', 'system', '2018-03-11 16:00:03', 'system', '2018-03-11 16:00:03', null);
INSERT INTO `js_sys_area` VALUES ('430722', '430700', '0,430000,430700,', '18610', '0000000180,0000001920,0000018610,', '1', '2', '湖南省/常德市/汉寿县', '汉寿县', '3', '0', 'system', '2018-03-11 16:00:03', 'system', '2018-03-11 16:00:03', null);
INSERT INTO `js_sys_area` VALUES ('430723', '430700', '0,430000,430700,', '18620', '0000000180,0000001920,0000018620,', '1', '2', '湖南省/常德市/澧　县', '澧　县', '3', '0', 'system', '2018-03-11 16:00:04', 'system', '2018-03-11 16:00:04', null);
INSERT INTO `js_sys_area` VALUES ('430724', '430700', '0,430000,430700,', '18630', '0000000180,0000001920,0000018630,', '1', '2', '湖南省/常德市/临澧县', '临澧县', '3', '0', 'system', '2018-03-11 16:00:04', 'system', '2018-03-11 16:00:04', null);
INSERT INTO `js_sys_area` VALUES ('430725', '430700', '0,430000,430700,', '18640', '0000000180,0000001920,0000018640,', '1', '2', '湖南省/常德市/桃源县', '桃源县', '3', '0', 'system', '2018-03-11 16:00:04', 'system', '2018-03-11 16:00:04', null);
INSERT INTO `js_sys_area` VALUES ('430726', '430700', '0,430000,430700,', '18650', '0000000180,0000001920,0000018650,', '1', '2', '湖南省/常德市/石门县', '石门县', '3', '0', 'system', '2018-03-11 16:00:04', 'system', '2018-03-11 16:00:04', null);
INSERT INTO `js_sys_area` VALUES ('430781', '430700', '0,430000,430700,', '18660', '0000000180,0000001920,0000018660,', '1', '2', '湖南省/常德市/津市市', '津市市', '3', '0', 'system', '2018-03-11 16:00:04', 'system', '2018-03-11 16:00:04', null);
INSERT INTO `js_sys_area` VALUES ('430800', '430000', '0,430000,', '1930', '0000000180,0000001930,', '0', '1', '湖南省/张家界市', '张家界市', '2', '0', 'system', '2018-03-11 16:00:04', 'system', '2018-03-11 16:00:04', null);
INSERT INTO `js_sys_area` VALUES ('430801', '430800', '0,430000,430800,', '18670', '0000000180,0000001930,0000018670,', '1', '2', '湖南省/张家界市/市辖区', '市辖区', '3', '0', 'system', '2018-03-11 16:00:04', 'system', '2018-03-11 16:00:04', null);
INSERT INTO `js_sys_area` VALUES ('430802', '430800', '0,430000,430800,', '18680', '0000000180,0000001930,0000018680,', '1', '2', '湖南省/张家界市/永定区', '永定区', '3', '0', 'system', '2018-03-11 16:00:04', 'system', '2018-03-11 16:00:04', null);
INSERT INTO `js_sys_area` VALUES ('430811', '430800', '0,430000,430800,', '18690', '0000000180,0000001930,0000018690,', '1', '2', '湖南省/张家界市/武陵源区', '武陵源区', '3', '0', 'system', '2018-03-11 16:00:04', 'system', '2018-03-11 16:00:04', null);
INSERT INTO `js_sys_area` VALUES ('430821', '430800', '0,430000,430800,', '18700', '0000000180,0000001930,0000018700,', '1', '2', '湖南省/张家界市/慈利县', '慈利县', '3', '0', 'system', '2018-03-11 16:00:04', 'system', '2018-03-11 16:00:04', null);
INSERT INTO `js_sys_area` VALUES ('430822', '430800', '0,430000,430800,', '18710', '0000000180,0000001930,0000018710,', '1', '2', '湖南省/张家界市/桑植县', '桑植县', '3', '0', 'system', '2018-03-11 16:00:04', 'system', '2018-03-11 16:00:04', null);
INSERT INTO `js_sys_area` VALUES ('430900', '430000', '0,430000,', '1940', '0000000180,0000001940,', '0', '1', '湖南省/益阳市', '益阳市', '2', '0', 'system', '2018-03-11 16:00:04', 'system', '2018-03-11 16:00:04', null);
INSERT INTO `js_sys_area` VALUES ('430901', '430900', '0,430000,430900,', '18720', '0000000180,0000001940,0000018720,', '1', '2', '湖南省/益阳市/市辖区', '市辖区', '3', '0', 'system', '2018-03-11 16:00:04', 'system', '2018-03-11 16:00:04', null);
INSERT INTO `js_sys_area` VALUES ('430902', '430900', '0,430000,430900,', '18730', '0000000180,0000001940,0000018730,', '1', '2', '湖南省/益阳市/资阳区', '资阳区', '3', '0', 'system', '2018-03-11 16:00:04', 'system', '2018-03-11 16:00:04', null);
INSERT INTO `js_sys_area` VALUES ('430903', '430900', '0,430000,430900,', '18740', '0000000180,0000001940,0000018740,', '1', '2', '湖南省/益阳市/赫山区', '赫山区', '3', '0', 'system', '2018-03-11 16:00:04', 'system', '2018-03-11 16:00:04', null);
INSERT INTO `js_sys_area` VALUES ('430921', '430900', '0,430000,430900,', '18750', '0000000180,0000001940,0000018750,', '1', '2', '湖南省/益阳市/南　县', '南　县', '3', '0', 'system', '2018-03-11 16:00:04', 'system', '2018-03-11 16:00:04', null);
INSERT INTO `js_sys_area` VALUES ('430922', '430900', '0,430000,430900,', '18760', '0000000180,0000001940,0000018760,', '1', '2', '湖南省/益阳市/桃江县', '桃江县', '3', '0', 'system', '2018-03-11 16:00:04', 'system', '2018-03-11 16:00:04', null);
INSERT INTO `js_sys_area` VALUES ('430923', '430900', '0,430000,430900,', '18770', '0000000180,0000001940,0000018770,', '1', '2', '湖南省/益阳市/安化县', '安化县', '3', '0', 'system', '2018-03-11 16:00:04', 'system', '2018-03-11 16:00:04', null);
INSERT INTO `js_sys_area` VALUES ('430981', '430900', '0,430000,430900,', '18780', '0000000180,0000001940,0000018780,', '1', '2', '湖南省/益阳市/沅江市', '沅江市', '3', '0', 'system', '2018-03-11 16:00:04', 'system', '2018-03-11 16:00:04', null);
INSERT INTO `js_sys_area` VALUES ('431000', '430000', '0,430000,', '1950', '0000000180,0000001950,', '0', '1', '湖南省/郴州市', '郴州市', '2', '0', 'system', '2018-03-11 16:00:04', 'system', '2018-03-11 16:00:04', null);
INSERT INTO `js_sys_area` VALUES ('431001', '431000', '0,430000,431000,', '18790', '0000000180,0000001950,0000018790,', '1', '2', '湖南省/郴州市/市辖区', '市辖区', '3', '0', 'system', '2018-03-11 16:00:04', 'system', '2018-03-11 16:00:04', null);
INSERT INTO `js_sys_area` VALUES ('431002', '431000', '0,430000,431000,', '18800', '0000000180,0000001950,0000018800,', '1', '2', '湖南省/郴州市/北湖区', '北湖区', '3', '0', 'system', '2018-03-11 16:00:04', 'system', '2018-03-11 16:00:04', null);
INSERT INTO `js_sys_area` VALUES ('431003', '431000', '0,430000,431000,', '18810', '0000000180,0000001950,0000018810,', '1', '2', '湖南省/郴州市/苏仙区', '苏仙区', '3', '0', 'system', '2018-03-11 16:00:04', 'system', '2018-03-11 16:00:04', null);
INSERT INTO `js_sys_area` VALUES ('431021', '431000', '0,430000,431000,', '18820', '0000000180,0000001950,0000018820,', '1', '2', '湖南省/郴州市/桂阳县', '桂阳县', '3', '0', 'system', '2018-03-11 16:00:04', 'system', '2018-03-11 16:00:04', null);
INSERT INTO `js_sys_area` VALUES ('431022', '431000', '0,430000,431000,', '18830', '0000000180,0000001950,0000018830,', '1', '2', '湖南省/郴州市/宜章县', '宜章县', '3', '0', 'system', '2018-03-11 16:00:04', 'system', '2018-03-11 16:00:04', null);
INSERT INTO `js_sys_area` VALUES ('431023', '431000', '0,430000,431000,', '18840', '0000000180,0000001950,0000018840,', '1', '2', '湖南省/郴州市/永兴县', '永兴县', '3', '0', 'system', '2018-03-11 16:00:04', 'system', '2018-03-11 16:00:04', null);
INSERT INTO `js_sys_area` VALUES ('431024', '431000', '0,430000,431000,', '18850', '0000000180,0000001950,0000018850,', '1', '2', '湖南省/郴州市/嘉禾县', '嘉禾县', '3', '0', 'system', '2018-03-11 16:00:04', 'system', '2018-03-11 16:00:04', null);
INSERT INTO `js_sys_area` VALUES ('431025', '431000', '0,430000,431000,', '18860', '0000000180,0000001950,0000018860,', '1', '2', '湖南省/郴州市/临武县', '临武县', '3', '0', 'system', '2018-03-11 16:00:04', 'system', '2018-03-11 16:00:04', null);
INSERT INTO `js_sys_area` VALUES ('431026', '431000', '0,430000,431000,', '18870', '0000000180,0000001950,0000018870,', '1', '2', '湖南省/郴州市/汝城县', '汝城县', '3', '0', 'system', '2018-03-11 16:00:04', 'system', '2018-03-11 16:00:04', null);
INSERT INTO `js_sys_area` VALUES ('431027', '431000', '0,430000,431000,', '18880', '0000000180,0000001950,0000018880,', '1', '2', '湖南省/郴州市/桂东县', '桂东县', '3', '0', 'system', '2018-03-11 16:00:04', 'system', '2018-03-11 16:00:04', null);
INSERT INTO `js_sys_area` VALUES ('431028', '431000', '0,430000,431000,', '18890', '0000000180,0000001950,0000018890,', '1', '2', '湖南省/郴州市/安仁县', '安仁县', '3', '0', 'system', '2018-03-11 16:00:04', 'system', '2018-03-11 16:00:04', null);
INSERT INTO `js_sys_area` VALUES ('431081', '431000', '0,430000,431000,', '18900', '0000000180,0000001950,0000018900,', '1', '2', '湖南省/郴州市/资兴市', '资兴市', '3', '0', 'system', '2018-03-11 16:00:04', 'system', '2018-03-11 16:00:04', null);
INSERT INTO `js_sys_area` VALUES ('431100', '430000', '0,430000,', '1960', '0000000180,0000001960,', '0', '1', '湖南省/永州市', '永州市', '2', '0', 'system', '2018-03-11 16:00:04', 'system', '2018-03-11 16:00:04', null);
INSERT INTO `js_sys_area` VALUES ('431101', '431100', '0,430000,431100,', '18910', '0000000180,0000001960,0000018910,', '1', '2', '湖南省/永州市/市辖区', '市辖区', '3', '0', 'system', '2018-03-11 16:00:04', 'system', '2018-03-11 16:00:04', null);
INSERT INTO `js_sys_area` VALUES ('431102', '431100', '0,430000,431100,', '18920', '0000000180,0000001960,0000018920,', '1', '2', '湖南省/永州市/芝山区', '芝山区', '3', '0', 'system', '2018-03-11 16:00:04', 'system', '2018-03-11 16:00:04', null);
INSERT INTO `js_sys_area` VALUES ('431103', '431100', '0,430000,431100,', '18930', '0000000180,0000001960,0000018930,', '1', '2', '湖南省/永州市/冷水滩区', '冷水滩区', '3', '0', 'system', '2018-03-11 16:00:04', 'system', '2018-03-11 16:00:04', null);
INSERT INTO `js_sys_area` VALUES ('431121', '431100', '0,430000,431100,', '18940', '0000000180,0000001960,0000018940,', '1', '2', '湖南省/永州市/祁阳县', '祁阳县', '3', '0', 'system', '2018-03-11 16:00:04', 'system', '2018-03-11 16:00:04', null);
INSERT INTO `js_sys_area` VALUES ('431122', '431100', '0,430000,431100,', '18950', '0000000180,0000001960,0000018950,', '1', '2', '湖南省/永州市/东安县', '东安县', '3', '0', 'system', '2018-03-11 16:00:04', 'system', '2018-03-11 16:00:04', null);
INSERT INTO `js_sys_area` VALUES ('431123', '431100', '0,430000,431100,', '18960', '0000000180,0000001960,0000018960,', '1', '2', '湖南省/永州市/双牌县', '双牌县', '3', '0', 'system', '2018-03-11 16:00:04', 'system', '2018-03-11 16:00:04', null);
INSERT INTO `js_sys_area` VALUES ('431124', '431100', '0,430000,431100,', '18970', '0000000180,0000001960,0000018970,', '1', '2', '湖南省/永州市/道　县', '道　县', '3', '0', 'system', '2018-03-11 16:00:04', 'system', '2018-03-11 16:00:04', null);
INSERT INTO `js_sys_area` VALUES ('431125', '431100', '0,430000,431100,', '18980', '0000000180,0000001960,0000018980,', '1', '2', '湖南省/永州市/江永县', '江永县', '3', '0', 'system', '2018-03-11 16:00:04', 'system', '2018-03-11 16:00:04', null);
INSERT INTO `js_sys_area` VALUES ('431126', '431100', '0,430000,431100,', '18990', '0000000180,0000001960,0000018990,', '1', '2', '湖南省/永州市/宁远县', '宁远县', '3', '0', 'system', '2018-03-11 16:00:04', 'system', '2018-03-11 16:00:04', null);
INSERT INTO `js_sys_area` VALUES ('431127', '431100', '0,430000,431100,', '19000', '0000000180,0000001960,0000019000,', '1', '2', '湖南省/永州市/蓝山县', '蓝山县', '3', '0', 'system', '2018-03-11 16:00:04', 'system', '2018-03-11 16:00:04', null);
INSERT INTO `js_sys_area` VALUES ('431128', '431100', '0,430000,431100,', '19010', '0000000180,0000001960,0000019010,', '1', '2', '湖南省/永州市/新田县', '新田县', '3', '0', 'system', '2018-03-11 16:00:04', 'system', '2018-03-11 16:00:04', null);
INSERT INTO `js_sys_area` VALUES ('431129', '431100', '0,430000,431100,', '19020', '0000000180,0000001960,0000019020,', '1', '2', '湖南省/永州市/江华瑶族自治县', '江华瑶族自治县', '3', '0', 'system', '2018-03-11 16:00:04', 'system', '2018-03-11 16:00:04', null);
INSERT INTO `js_sys_area` VALUES ('431200', '430000', '0,430000,', '1970', '0000000180,0000001970,', '0', '1', '湖南省/怀化市', '怀化市', '2', '0', 'system', '2018-03-11 16:00:04', 'system', '2018-03-11 16:00:04', null);
INSERT INTO `js_sys_area` VALUES ('431201', '431200', '0,430000,431200,', '19030', '0000000180,0000001970,0000019030,', '1', '2', '湖南省/怀化市/市辖区', '市辖区', '3', '0', 'system', '2018-03-11 16:00:04', 'system', '2018-03-11 16:00:04', null);
INSERT INTO `js_sys_area` VALUES ('431202', '431200', '0,430000,431200,', '19040', '0000000180,0000001970,0000019040,', '1', '2', '湖南省/怀化市/鹤城区', '鹤城区', '3', '0', 'system', '2018-03-11 16:00:04', 'system', '2018-03-11 16:00:04', null);
INSERT INTO `js_sys_area` VALUES ('431221', '431200', '0,430000,431200,', '19050', '0000000180,0000001970,0000019050,', '1', '2', '湖南省/怀化市/中方县', '中方县', '3', '0', 'system', '2018-03-11 16:00:04', 'system', '2018-03-11 16:00:04', null);
INSERT INTO `js_sys_area` VALUES ('431222', '431200', '0,430000,431200,', '19060', '0000000180,0000001970,0000019060,', '1', '2', '湖南省/怀化市/沅陵县', '沅陵县', '3', '0', 'system', '2018-03-11 16:00:04', 'system', '2018-03-11 16:00:04', null);
INSERT INTO `js_sys_area` VALUES ('431223', '431200', '0,430000,431200,', '19070', '0000000180,0000001970,0000019070,', '1', '2', '湖南省/怀化市/辰溪县', '辰溪县', '3', '0', 'system', '2018-03-11 16:00:04', 'system', '2018-03-11 16:00:04', null);
INSERT INTO `js_sys_area` VALUES ('431224', '431200', '0,430000,431200,', '19080', '0000000180,0000001970,0000019080,', '1', '2', '湖南省/怀化市/溆浦县', '溆浦县', '3', '0', 'system', '2018-03-11 16:00:04', 'system', '2018-03-11 16:00:04', null);
INSERT INTO `js_sys_area` VALUES ('431225', '431200', '0,430000,431200,', '19090', '0000000180,0000001970,0000019090,', '1', '2', '湖南省/怀化市/会同县', '会同县', '3', '0', 'system', '2018-03-11 16:00:04', 'system', '2018-03-11 16:00:04', null);
INSERT INTO `js_sys_area` VALUES ('431226', '431200', '0,430000,431200,', '19100', '0000000180,0000001970,0000019100,', '1', '2', '湖南省/怀化市/麻阳苗族自治县', '麻阳苗族自治县', '3', '0', 'system', '2018-03-11 16:00:04', 'system', '2018-03-11 16:00:04', null);
INSERT INTO `js_sys_area` VALUES ('431227', '431200', '0,430000,431200,', '19110', '0000000180,0000001970,0000019110,', '1', '2', '湖南省/怀化市/新晃侗族自治县', '新晃侗族自治县', '3', '0', 'system', '2018-03-11 16:00:04', 'system', '2018-03-11 16:00:04', null);
INSERT INTO `js_sys_area` VALUES ('431228', '431200', '0,430000,431200,', '19120', '0000000180,0000001970,0000019120,', '1', '2', '湖南省/怀化市/芷江侗族自治县', '芷江侗族自治县', '3', '0', 'system', '2018-03-11 16:00:04', 'system', '2018-03-11 16:00:04', null);
INSERT INTO `js_sys_area` VALUES ('431229', '431200', '0,430000,431200,', '19130', '0000000180,0000001970,0000019130,', '1', '2', '湖南省/怀化市/靖州苗族侗族自治县', '靖州苗族侗族自治县', '3', '0', 'system', '2018-03-11 16:00:04', 'system', '2018-03-11 16:00:04', null);
INSERT INTO `js_sys_area` VALUES ('431230', '431200', '0,430000,431200,', '19140', '0000000180,0000001970,0000019140,', '1', '2', '湖南省/怀化市/通道侗族自治县', '通道侗族自治县', '3', '0', 'system', '2018-03-11 16:00:04', 'system', '2018-03-11 16:00:04', null);
INSERT INTO `js_sys_area` VALUES ('431281', '431200', '0,430000,431200,', '19150', '0000000180,0000001970,0000019150,', '1', '2', '湖南省/怀化市/洪江市', '洪江市', '3', '0', 'system', '2018-03-11 16:00:04', 'system', '2018-03-11 16:00:04', null);
INSERT INTO `js_sys_area` VALUES ('431300', '430000', '0,430000,', '1980', '0000000180,0000001980,', '0', '1', '湖南省/娄底市', '娄底市', '2', '0', 'system', '2018-03-11 16:00:04', 'system', '2018-03-11 16:00:04', null);
INSERT INTO `js_sys_area` VALUES ('431301', '431300', '0,430000,431300,', '19160', '0000000180,0000001980,0000019160,', '1', '2', '湖南省/娄底市/市辖区', '市辖区', '3', '0', 'system', '2018-03-11 16:00:04', 'system', '2018-03-11 16:00:04', null);
INSERT INTO `js_sys_area` VALUES ('431302', '431300', '0,430000,431300,', '19170', '0000000180,0000001980,0000019170,', '1', '2', '湖南省/娄底市/娄星区', '娄星区', '3', '0', 'system', '2018-03-11 16:00:04', 'system', '2018-03-11 16:00:04', null);
INSERT INTO `js_sys_area` VALUES ('431321', '431300', '0,430000,431300,', '19180', '0000000180,0000001980,0000019180,', '1', '2', '湖南省/娄底市/双峰县', '双峰县', '3', '0', 'system', '2018-03-11 16:00:04', 'system', '2018-03-11 16:00:04', null);
INSERT INTO `js_sys_area` VALUES ('431322', '431300', '0,430000,431300,', '19190', '0000000180,0000001980,0000019190,', '1', '2', '湖南省/娄底市/新化县', '新化县', '3', '0', 'system', '2018-03-11 16:00:05', 'system', '2018-03-11 16:00:05', null);
INSERT INTO `js_sys_area` VALUES ('431381', '431300', '0,430000,431300,', '19200', '0000000180,0000001980,0000019200,', '1', '2', '湖南省/娄底市/冷水江市', '冷水江市', '3', '0', 'system', '2018-03-11 16:00:05', 'system', '2018-03-11 16:00:05', null);
INSERT INTO `js_sys_area` VALUES ('431382', '431300', '0,430000,431300,', '19210', '0000000180,0000001980,0000019210,', '1', '2', '湖南省/娄底市/涟源市', '涟源市', '3', '0', 'system', '2018-03-11 16:00:05', 'system', '2018-03-11 16:00:05', null);
INSERT INTO `js_sys_area` VALUES ('433100', '430000', '0,430000,', '1990', '0000000180,0000001990,', '0', '1', '湖南省/湘西土家族苗族自治州', '湘西土家族苗族自治州', '2', '0', 'system', '2018-03-11 16:00:05', 'system', '2018-03-11 16:00:05', null);
INSERT INTO `js_sys_area` VALUES ('433101', '433100', '0,430000,433100,', '19220', '0000000180,0000001990,0000019220,', '1', '2', '湖南省/湘西土家族苗族自治州/吉首市', '吉首市', '3', '0', 'system', '2018-03-11 16:00:05', 'system', '2018-03-11 16:00:05', null);
INSERT INTO `js_sys_area` VALUES ('433122', '433100', '0,430000,433100,', '19230', '0000000180,0000001990,0000019230,', '1', '2', '湖南省/湘西土家族苗族自治州/泸溪县', '泸溪县', '3', '0', 'system', '2018-03-11 16:00:05', 'system', '2018-03-11 16:00:05', null);
INSERT INTO `js_sys_area` VALUES ('433123', '433100', '0,430000,433100,', '19240', '0000000180,0000001990,0000019240,', '1', '2', '湖南省/湘西土家族苗族自治州/凤凰县', '凤凰县', '3', '0', 'system', '2018-03-11 16:00:05', 'system', '2018-03-11 16:00:05', null);
INSERT INTO `js_sys_area` VALUES ('433124', '433100', '0,430000,433100,', '19250', '0000000180,0000001990,0000019250,', '1', '2', '湖南省/湘西土家族苗族自治州/花垣县', '花垣县', '3', '0', 'system', '2018-03-11 16:00:05', 'system', '2018-03-11 16:00:05', null);
INSERT INTO `js_sys_area` VALUES ('433125', '433100', '0,430000,433100,', '19260', '0000000180,0000001990,0000019260,', '1', '2', '湖南省/湘西土家族苗族自治州/保靖县', '保靖县', '3', '0', 'system', '2018-03-11 16:00:05', 'system', '2018-03-11 16:00:05', null);
INSERT INTO `js_sys_area` VALUES ('433126', '433100', '0,430000,433100,', '19270', '0000000180,0000001990,0000019270,', '1', '2', '湖南省/湘西土家族苗族自治州/古丈县', '古丈县', '3', '0', 'system', '2018-03-11 16:00:05', 'system', '2018-03-11 16:00:05', null);
INSERT INTO `js_sys_area` VALUES ('433127', '433100', '0,430000,433100,', '19280', '0000000180,0000001990,0000019280,', '1', '2', '湖南省/湘西土家族苗族自治州/永顺县', '永顺县', '3', '0', 'system', '2018-03-11 16:00:05', 'system', '2018-03-11 16:00:05', null);
INSERT INTO `js_sys_area` VALUES ('433130', '433100', '0,430000,433100,', '19290', '0000000180,0000001990,0000019290,', '1', '2', '湖南省/湘西土家族苗族自治州/龙山县', '龙山县', '3', '0', 'system', '2018-03-11 16:00:05', 'system', '2018-03-11 16:00:05', null);
INSERT INTO `js_sys_area` VALUES ('440000', '0', '0,', '190', '0000000190,', '0', '0', '广东省', '广东省', '1', '0', 'system', '2018-03-11 16:00:05', 'system', '2018-03-11 16:00:05', null);
INSERT INTO `js_sys_area` VALUES ('440100', '440000', '0,440000,', '2000', '0000000190,0000002000,', '0', '1', '广东省/广州市', '广州市', '2', '0', 'system', '2018-03-11 16:00:05', 'system', '2018-03-11 16:00:05', null);
INSERT INTO `js_sys_area` VALUES ('440101', '440100', '0,440000,440100,', '19300', '0000000190,0000002000,0000019300,', '1', '2', '广东省/广州市/市辖区', '市辖区', '3', '0', 'system', '2018-03-11 16:00:05', 'system', '2018-03-11 16:00:05', null);
INSERT INTO `js_sys_area` VALUES ('440102', '440100', '0,440000,440100,', '19310', '0000000190,0000002000,0000019310,', '1', '2', '广东省/广州市/东山区', '东山区', '3', '0', 'system', '2018-03-11 16:00:05', 'system', '2018-03-11 16:00:05', null);
INSERT INTO `js_sys_area` VALUES ('440103', '440100', '0,440000,440100,', '19320', '0000000190,0000002000,0000019320,', '1', '2', '广东省/广州市/荔湾区', '荔湾区', '3', '0', 'system', '2018-03-11 16:00:05', 'system', '2018-03-11 16:00:05', null);
INSERT INTO `js_sys_area` VALUES ('440104', '440100', '0,440000,440100,', '19330', '0000000190,0000002000,0000019330,', '1', '2', '广东省/广州市/越秀区', '越秀区', '3', '0', 'system', '2018-03-11 16:00:05', 'system', '2018-03-11 16:00:05', null);
INSERT INTO `js_sys_area` VALUES ('440105', '440100', '0,440000,440100,', '19340', '0000000190,0000002000,0000019340,', '1', '2', '广东省/广州市/海珠区', '海珠区', '3', '0', 'system', '2018-03-11 16:00:05', 'system', '2018-03-11 16:00:05', null);
INSERT INTO `js_sys_area` VALUES ('440106', '440100', '0,440000,440100,', '19350', '0000000190,0000002000,0000019350,', '1', '2', '广东省/广州市/天河区', '天河区', '3', '0', 'system', '2018-03-11 16:00:05', 'system', '2018-03-11 16:00:05', null);
INSERT INTO `js_sys_area` VALUES ('440107', '440100', '0,440000,440100,', '19360', '0000000190,0000002000,0000019360,', '1', '2', '广东省/广州市/芳村区', '芳村区', '3', '0', 'system', '2018-03-11 16:00:05', 'system', '2018-03-11 16:00:05', null);
INSERT INTO `js_sys_area` VALUES ('440111', '440100', '0,440000,440100,', '19370', '0000000190,0000002000,0000019370,', '1', '2', '广东省/广州市/白云区', '白云区', '3', '0', 'system', '2018-03-11 16:00:05', 'system', '2018-03-11 16:00:05', null);
INSERT INTO `js_sys_area` VALUES ('440112', '440100', '0,440000,440100,', '19380', '0000000190,0000002000,0000019380,', '1', '2', '广东省/广州市/黄埔区', '黄埔区', '3', '0', 'system', '2018-03-11 16:00:05', 'system', '2018-03-11 16:00:05', null);
INSERT INTO `js_sys_area` VALUES ('440113', '440100', '0,440000,440100,', '19390', '0000000190,0000002000,0000019390,', '1', '2', '广东省/广州市/番禺区', '番禺区', '3', '0', 'system', '2018-03-11 16:00:05', 'system', '2018-03-11 16:00:05', null);
INSERT INTO `js_sys_area` VALUES ('440114', '440100', '0,440000,440100,', '19400', '0000000190,0000002000,0000019400,', '1', '2', '广东省/广州市/花都区', '花都区', '3', '0', 'system', '2018-03-11 16:00:05', 'system', '2018-03-11 16:00:05', null);
INSERT INTO `js_sys_area` VALUES ('440183', '440100', '0,440000,440100,', '19410', '0000000190,0000002000,0000019410,', '1', '2', '广东省/广州市/增城市', '增城市', '3', '0', 'system', '2018-03-11 16:00:05', 'system', '2018-03-11 16:00:05', null);
INSERT INTO `js_sys_area` VALUES ('440184', '440100', '0,440000,440100,', '19420', '0000000190,0000002000,0000019420,', '1', '2', '广东省/广州市/从化市', '从化市', '3', '0', 'system', '2018-03-11 16:00:05', 'system', '2018-03-11 16:00:05', null);
INSERT INTO `js_sys_area` VALUES ('440200', '440000', '0,440000,', '2010', '0000000190,0000002010,', '0', '1', '广东省/韶关市', '韶关市', '2', '0', 'system', '2018-03-11 16:00:05', 'system', '2018-03-11 16:00:05', null);
INSERT INTO `js_sys_area` VALUES ('440201', '440200', '0,440000,440200,', '19430', '0000000190,0000002010,0000019430,', '1', '2', '广东省/韶关市/市辖区', '市辖区', '3', '0', 'system', '2018-03-11 16:00:05', 'system', '2018-03-11 16:00:05', null);
INSERT INTO `js_sys_area` VALUES ('440203', '440200', '0,440000,440200,', '19440', '0000000190,0000002010,0000019440,', '1', '2', '广东省/韶关市/武江区', '武江区', '3', '0', 'system', '2018-03-11 16:00:05', 'system', '2018-03-11 16:00:05', null);
INSERT INTO `js_sys_area` VALUES ('440204', '440200', '0,440000,440200,', '19450', '0000000190,0000002010,0000019450,', '1', '2', '广东省/韶关市/浈江区', '浈江区', '3', '0', 'system', '2018-03-11 16:00:05', 'system', '2018-03-11 16:00:05', null);
INSERT INTO `js_sys_area` VALUES ('440205', '440200', '0,440000,440200,', '19460', '0000000190,0000002010,0000019460,', '1', '2', '广东省/韶关市/曲江区', '曲江区', '3', '0', 'system', '2018-03-11 16:00:05', 'system', '2018-03-11 16:00:05', null);
INSERT INTO `js_sys_area` VALUES ('440222', '440200', '0,440000,440200,', '19470', '0000000190,0000002010,0000019470,', '1', '2', '广东省/韶关市/始兴县', '始兴县', '3', '0', 'system', '2018-03-11 16:00:05', 'system', '2018-03-11 16:00:05', null);
INSERT INTO `js_sys_area` VALUES ('440224', '440200', '0,440000,440200,', '19480', '0000000190,0000002010,0000019480,', '1', '2', '广东省/韶关市/仁化县', '仁化县', '3', '0', 'system', '2018-03-11 16:00:05', 'system', '2018-03-11 16:00:05', null);
INSERT INTO `js_sys_area` VALUES ('440229', '440200', '0,440000,440200,', '19490', '0000000190,0000002010,0000019490,', '1', '2', '广东省/韶关市/翁源县', '翁源县', '3', '0', 'system', '2018-03-11 16:00:05', 'system', '2018-03-11 16:00:05', null);
INSERT INTO `js_sys_area` VALUES ('440232', '440200', '0,440000,440200,', '19500', '0000000190,0000002010,0000019500,', '1', '2', '广东省/韶关市/乳源瑶族自治县', '乳源瑶族自治县', '3', '0', 'system', '2018-03-11 16:00:05', 'system', '2018-03-11 16:00:05', null);
INSERT INTO `js_sys_area` VALUES ('440233', '440200', '0,440000,440200,', '19510', '0000000190,0000002010,0000019510,', '1', '2', '广东省/韶关市/新丰县', '新丰县', '3', '0', 'system', '2018-03-11 16:00:05', 'system', '2018-03-11 16:00:05', null);
INSERT INTO `js_sys_area` VALUES ('440281', '440200', '0,440000,440200,', '19520', '0000000190,0000002010,0000019520,', '1', '2', '广东省/韶关市/乐昌市', '乐昌市', '3', '0', 'system', '2018-03-11 16:00:05', 'system', '2018-03-11 16:00:05', null);
INSERT INTO `js_sys_area` VALUES ('440282', '440200', '0,440000,440200,', '19530', '0000000190,0000002010,0000019530,', '1', '2', '广东省/韶关市/南雄市', '南雄市', '3', '0', 'system', '2018-03-11 16:00:05', 'system', '2018-03-11 16:00:05', null);
INSERT INTO `js_sys_area` VALUES ('440300', '440000', '0,440000,', '2020', '0000000190,0000002020,', '0', '1', '广东省/深圳市', '深圳市', '2', '0', 'system', '2018-03-11 16:00:05', 'system', '2018-03-11 16:00:05', null);
INSERT INTO `js_sys_area` VALUES ('440301', '440300', '0,440000,440300,', '19540', '0000000190,0000002020,0000019540,', '1', '2', '广东省/深圳市/市辖区', '市辖区', '3', '0', 'system', '2018-03-11 16:00:05', 'system', '2018-03-11 16:00:05', null);
INSERT INTO `js_sys_area` VALUES ('440303', '440300', '0,440000,440300,', '19550', '0000000190,0000002020,0000019550,', '1', '2', '广东省/深圳市/罗湖区', '罗湖区', '3', '0', 'system', '2018-03-11 16:00:05', 'system', '2018-03-11 16:00:05', null);
INSERT INTO `js_sys_area` VALUES ('440304', '440300', '0,440000,440300,', '19560', '0000000190,0000002020,0000019560,', '1', '2', '广东省/深圳市/福田区', '福田区', '3', '0', 'system', '2018-03-11 16:00:05', 'system', '2018-03-11 16:00:05', null);
INSERT INTO `js_sys_area` VALUES ('440305', '440300', '0,440000,440300,', '19570', '0000000190,0000002020,0000019570,', '1', '2', '广东省/深圳市/南山区', '南山区', '3', '0', 'system', '2018-03-11 16:00:05', 'system', '2018-03-11 16:00:05', null);
INSERT INTO `js_sys_area` VALUES ('440306', '440300', '0,440000,440300,', '19580', '0000000190,0000002020,0000019580,', '1', '2', '广东省/深圳市/宝安区', '宝安区', '3', '0', 'system', '2018-03-11 16:00:05', 'system', '2018-03-11 16:00:05', null);
INSERT INTO `js_sys_area` VALUES ('440307', '440300', '0,440000,440300,', '19590', '0000000190,0000002020,0000019590,', '1', '2', '广东省/深圳市/龙岗区', '龙岗区', '3', '0', 'system', '2018-03-11 16:00:05', 'system', '2018-03-11 16:00:05', null);
INSERT INTO `js_sys_area` VALUES ('440308', '440300', '0,440000,440300,', '19600', '0000000190,0000002020,0000019600,', '1', '2', '广东省/深圳市/盐田区', '盐田区', '3', '0', 'system', '2018-03-11 16:00:05', 'system', '2018-03-11 16:00:05', null);
INSERT INTO `js_sys_area` VALUES ('440400', '440000', '0,440000,', '2030', '0000000190,0000002030,', '0', '1', '广东省/珠海市', '珠海市', '2', '0', 'system', '2018-03-11 16:00:05', 'system', '2018-03-11 16:00:05', null);
INSERT INTO `js_sys_area` VALUES ('440401', '440400', '0,440000,440400,', '19610', '0000000190,0000002030,0000019610,', '1', '2', '广东省/珠海市/市辖区', '市辖区', '3', '0', 'system', '2018-03-11 16:00:05', 'system', '2018-03-11 16:00:05', null);
INSERT INTO `js_sys_area` VALUES ('440402', '440400', '0,440000,440400,', '19620', '0000000190,0000002030,0000019620,', '1', '2', '广东省/珠海市/香洲区', '香洲区', '3', '0', 'system', '2018-03-11 16:00:05', 'system', '2018-03-11 16:00:05', null);
INSERT INTO `js_sys_area` VALUES ('440403', '440400', '0,440000,440400,', '19630', '0000000190,0000002030,0000019630,', '1', '2', '广东省/珠海市/斗门区', '斗门区', '3', '0', 'system', '2018-03-11 16:00:05', 'system', '2018-03-11 16:00:05', null);
INSERT INTO `js_sys_area` VALUES ('440404', '440400', '0,440000,440400,', '19640', '0000000190,0000002030,0000019640,', '1', '2', '广东省/珠海市/金湾区', '金湾区', '3', '0', 'system', '2018-03-11 16:00:05', 'system', '2018-03-11 16:00:05', null);
INSERT INTO `js_sys_area` VALUES ('440500', '440000', '0,440000,', '2040', '0000000190,0000002040,', '0', '1', '广东省/汕头市', '汕头市', '2', '0', 'system', '2018-03-11 16:00:05', 'system', '2018-03-11 16:00:05', null);
INSERT INTO `js_sys_area` VALUES ('440501', '440500', '0,440000,440500,', '19650', '0000000190,0000002040,0000019650,', '1', '2', '广东省/汕头市/市辖区', '市辖区', '3', '0', 'system', '2018-03-11 16:00:05', 'system', '2018-03-11 16:00:05', null);
INSERT INTO `js_sys_area` VALUES ('440507', '440500', '0,440000,440500,', '19660', '0000000190,0000002040,0000019660,', '1', '2', '广东省/汕头市/龙湖区', '龙湖区', '3', '0', 'system', '2018-03-11 16:00:05', 'system', '2018-03-11 16:00:05', null);
INSERT INTO `js_sys_area` VALUES ('440511', '440500', '0,440000,440500,', '19670', '0000000190,0000002040,0000019670,', '1', '2', '广东省/汕头市/金平区', '金平区', '3', '0', 'system', '2018-03-11 16:00:05', 'system', '2018-03-11 16:00:05', null);
INSERT INTO `js_sys_area` VALUES ('440512', '440500', '0,440000,440500,', '19680', '0000000190,0000002040,0000019680,', '1', '2', '广东省/汕头市/濠江区', '濠江区', '3', '0', 'system', '2018-03-11 16:00:05', 'system', '2018-03-11 16:00:05', null);
INSERT INTO `js_sys_area` VALUES ('440513', '440500', '0,440000,440500,', '19690', '0000000190,0000002040,0000019690,', '1', '2', '广东省/汕头市/潮阳区', '潮阳区', '3', '0', 'system', '2018-03-11 16:00:05', 'system', '2018-03-11 16:00:05', null);
INSERT INTO `js_sys_area` VALUES ('440514', '440500', '0,440000,440500,', '19700', '0000000190,0000002040,0000019700,', '1', '2', '广东省/汕头市/潮南区', '潮南区', '3', '0', 'system', '2018-03-11 16:00:05', 'system', '2018-03-11 16:00:05', null);
INSERT INTO `js_sys_area` VALUES ('440515', '440500', '0,440000,440500,', '19710', '0000000190,0000002040,0000019710,', '1', '2', '广东省/汕头市/澄海区', '澄海区', '3', '0', 'system', '2018-03-11 16:00:05', 'system', '2018-03-11 16:00:05', null);
INSERT INTO `js_sys_area` VALUES ('440523', '440500', '0,440000,440500,', '19720', '0000000190,0000002040,0000019720,', '1', '2', '广东省/汕头市/南澳县', '南澳县', '3', '0', 'system', '2018-03-11 16:00:05', 'system', '2018-03-11 16:00:05', null);
INSERT INTO `js_sys_area` VALUES ('440600', '440000', '0,440000,', '2050', '0000000190,0000002050,', '0', '1', '广东省/佛山市', '佛山市', '2', '0', 'system', '2018-03-11 16:00:05', 'system', '2018-03-11 16:00:05', null);
INSERT INTO `js_sys_area` VALUES ('440601', '440600', '0,440000,440600,', '19730', '0000000190,0000002050,0000019730,', '1', '2', '广东省/佛山市/市辖区', '市辖区', '3', '0', 'system', '2018-03-11 16:00:05', 'system', '2018-03-11 16:00:05', null);
INSERT INTO `js_sys_area` VALUES ('440604', '440600', '0,440000,440600,', '19740', '0000000190,0000002050,0000019740,', '1', '2', '广东省/佛山市/禅城区', '禅城区', '3', '0', 'system', '2018-03-11 16:00:05', 'system', '2018-03-11 16:00:05', null);
INSERT INTO `js_sys_area` VALUES ('440605', '440600', '0,440000,440600,', '19750', '0000000190,0000002050,0000019750,', '1', '2', '广东省/佛山市/南海区', '南海区', '3', '0', 'system', '2018-03-11 16:00:05', 'system', '2018-03-11 16:00:05', null);
INSERT INTO `js_sys_area` VALUES ('440606', '440600', '0,440000,440600,', '19760', '0000000190,0000002050,0000019760,', '1', '2', '广东省/佛山市/顺德区', '顺德区', '3', '0', 'system', '2018-03-11 16:00:05', 'system', '2018-03-11 16:00:05', null);
INSERT INTO `js_sys_area` VALUES ('440607', '440600', '0,440000,440600,', '19770', '0000000190,0000002050,0000019770,', '1', '2', '广东省/佛山市/三水区', '三水区', '3', '0', 'system', '2018-03-11 16:00:05', 'system', '2018-03-11 16:00:05', null);
INSERT INTO `js_sys_area` VALUES ('440608', '440600', '0,440000,440600,', '19780', '0000000190,0000002050,0000019780,', '1', '2', '广东省/佛山市/高明区', '高明区', '3', '0', 'system', '2018-03-11 16:00:05', 'system', '2018-03-11 16:00:05', null);
INSERT INTO `js_sys_area` VALUES ('440700', '440000', '0,440000,', '2060', '0000000190,0000002060,', '0', '1', '广东省/江门市', '江门市', '2', '0', 'system', '2018-03-11 16:00:06', 'system', '2018-03-11 16:00:06', null);
INSERT INTO `js_sys_area` VALUES ('440701', '440700', '0,440000,440700,', '19790', '0000000190,0000002060,0000019790,', '1', '2', '广东省/江门市/市辖区', '市辖区', '3', '0', 'system', '2018-03-11 16:00:06', 'system', '2018-03-11 16:00:06', null);
INSERT INTO `js_sys_area` VALUES ('440703', '440700', '0,440000,440700,', '19800', '0000000190,0000002060,0000019800,', '1', '2', '广东省/江门市/蓬江区', '蓬江区', '3', '0', 'system', '2018-03-11 16:00:06', 'system', '2018-03-11 16:00:06', null);
INSERT INTO `js_sys_area` VALUES ('440704', '440700', '0,440000,440700,', '19810', '0000000190,0000002060,0000019810,', '1', '2', '广东省/江门市/江海区', '江海区', '3', '0', 'system', '2018-03-11 16:00:06', 'system', '2018-03-11 16:00:06', null);
INSERT INTO `js_sys_area` VALUES ('440705', '440700', '0,440000,440700,', '19820', '0000000190,0000002060,0000019820,', '1', '2', '广东省/江门市/新会区', '新会区', '3', '0', 'system', '2018-03-11 16:00:06', 'system', '2018-03-11 16:00:06', null);
INSERT INTO `js_sys_area` VALUES ('440781', '440700', '0,440000,440700,', '19830', '0000000190,0000002060,0000019830,', '1', '2', '广东省/江门市/台山市', '台山市', '3', '0', 'system', '2018-03-11 16:00:06', 'system', '2018-03-11 16:00:06', null);
INSERT INTO `js_sys_area` VALUES ('440783', '440700', '0,440000,440700,', '19840', '0000000190,0000002060,0000019840,', '1', '2', '广东省/江门市/开平市', '开平市', '3', '0', 'system', '2018-03-11 16:00:06', 'system', '2018-03-11 16:00:06', null);
INSERT INTO `js_sys_area` VALUES ('440784', '440700', '0,440000,440700,', '19850', '0000000190,0000002060,0000019850,', '1', '2', '广东省/江门市/鹤山市', '鹤山市', '3', '0', 'system', '2018-03-11 16:00:06', 'system', '2018-03-11 16:00:06', null);
INSERT INTO `js_sys_area` VALUES ('440785', '440700', '0,440000,440700,', '19860', '0000000190,0000002060,0000019860,', '1', '2', '广东省/江门市/恩平市', '恩平市', '3', '0', 'system', '2018-03-11 16:00:06', 'system', '2018-03-11 16:00:06', null);
INSERT INTO `js_sys_area` VALUES ('440800', '440000', '0,440000,', '2070', '0000000190,0000002070,', '0', '1', '广东省/湛江市', '湛江市', '2', '0', 'system', '2018-03-11 16:00:06', 'system', '2018-03-11 16:00:06', null);
INSERT INTO `js_sys_area` VALUES ('440801', '440800', '0,440000,440800,', '19870', '0000000190,0000002070,0000019870,', '1', '2', '广东省/湛江市/市辖区', '市辖区', '3', '0', 'system', '2018-03-11 16:00:06', 'system', '2018-03-11 16:00:06', null);
INSERT INTO `js_sys_area` VALUES ('440802', '440800', '0,440000,440800,', '19880', '0000000190,0000002070,0000019880,', '1', '2', '广东省/湛江市/赤坎区', '赤坎区', '3', '0', 'system', '2018-03-11 16:00:06', 'system', '2018-03-11 16:00:06', null);
INSERT INTO `js_sys_area` VALUES ('440803', '440800', '0,440000,440800,', '19890', '0000000190,0000002070,0000019890,', '1', '2', '广东省/湛江市/霞山区', '霞山区', '3', '0', 'system', '2018-03-11 16:00:06', 'system', '2018-03-11 16:00:06', null);
INSERT INTO `js_sys_area` VALUES ('440804', '440800', '0,440000,440800,', '19900', '0000000190,0000002070,0000019900,', '1', '2', '广东省/湛江市/坡头区', '坡头区', '3', '0', 'system', '2018-03-11 16:00:06', 'system', '2018-03-11 16:00:06', null);
INSERT INTO `js_sys_area` VALUES ('440811', '440800', '0,440000,440800,', '19910', '0000000190,0000002070,0000019910,', '1', '2', '广东省/湛江市/麻章区', '麻章区', '3', '0', 'system', '2018-03-11 16:00:06', 'system', '2018-03-11 16:00:06', null);
INSERT INTO `js_sys_area` VALUES ('440823', '440800', '0,440000,440800,', '19920', '0000000190,0000002070,0000019920,', '1', '2', '广东省/湛江市/遂溪县', '遂溪县', '3', '0', 'system', '2018-03-11 16:00:06', 'system', '2018-03-11 16:00:06', null);
INSERT INTO `js_sys_area` VALUES ('440825', '440800', '0,440000,440800,', '19930', '0000000190,0000002070,0000019930,', '1', '2', '广东省/湛江市/徐闻县', '徐闻县', '3', '0', 'system', '2018-03-11 16:00:06', 'system', '2018-03-11 16:00:06', null);
INSERT INTO `js_sys_area` VALUES ('440881', '440800', '0,440000,440800,', '19940', '0000000190,0000002070,0000019940,', '1', '2', '广东省/湛江市/廉江市', '廉江市', '3', '0', 'system', '2018-03-11 16:00:06', 'system', '2018-03-11 16:00:06', null);
INSERT INTO `js_sys_area` VALUES ('440882', '440800', '0,440000,440800,', '19950', '0000000190,0000002070,0000019950,', '1', '2', '广东省/湛江市/雷州市', '雷州市', '3', '0', 'system', '2018-03-11 16:00:06', 'system', '2018-03-11 16:00:06', null);
INSERT INTO `js_sys_area` VALUES ('440883', '440800', '0,440000,440800,', '19960', '0000000190,0000002070,0000019960,', '1', '2', '广东省/湛江市/吴川市', '吴川市', '3', '0', 'system', '2018-03-11 16:00:06', 'system', '2018-03-11 16:00:06', null);
INSERT INTO `js_sys_area` VALUES ('440900', '440000', '0,440000,', '2080', '0000000190,0000002080,', '0', '1', '广东省/茂名市', '茂名市', '2', '0', 'system', '2018-03-11 16:00:06', 'system', '2018-03-11 16:00:06', null);
INSERT INTO `js_sys_area` VALUES ('440901', '440900', '0,440000,440900,', '19970', '0000000190,0000002080,0000019970,', '1', '2', '广东省/茂名市/市辖区', '市辖区', '3', '0', 'system', '2018-03-11 16:00:06', 'system', '2018-03-11 16:00:06', null);
INSERT INTO `js_sys_area` VALUES ('440902', '440900', '0,440000,440900,', '19980', '0000000190,0000002080,0000019980,', '1', '2', '广东省/茂名市/茂南区', '茂南区', '3', '0', 'system', '2018-03-11 16:00:06', 'system', '2018-03-11 16:00:06', null);
INSERT INTO `js_sys_area` VALUES ('440903', '440900', '0,440000,440900,', '19990', '0000000190,0000002080,0000019990,', '1', '2', '广东省/茂名市/茂港区', '茂港区', '3', '0', 'system', '2018-03-11 16:00:06', 'system', '2018-03-11 16:00:06', null);
INSERT INTO `js_sys_area` VALUES ('440923', '440900', '0,440000,440900,', '20000', '0000000190,0000002080,0000020000,', '1', '2', '广东省/茂名市/电白县', '电白县', '3', '0', 'system', '2018-03-11 16:00:06', 'system', '2018-03-11 16:00:06', null);
INSERT INTO `js_sys_area` VALUES ('440981', '440900', '0,440000,440900,', '20010', '0000000190,0000002080,0000020010,', '1', '2', '广东省/茂名市/高州市', '高州市', '3', '0', 'system', '2018-03-11 16:00:06', 'system', '2018-03-11 16:00:06', null);
INSERT INTO `js_sys_area` VALUES ('440982', '440900', '0,440000,440900,', '20020', '0000000190,0000002080,0000020020,', '1', '2', '广东省/茂名市/化州市', '化州市', '3', '0', 'system', '2018-03-11 16:00:06', 'system', '2018-03-11 16:00:06', null);
INSERT INTO `js_sys_area` VALUES ('440983', '440900', '0,440000,440900,', '20030', '0000000190,0000002080,0000020030,', '1', '2', '广东省/茂名市/信宜市', '信宜市', '3', '0', 'system', '2018-03-11 16:00:06', 'system', '2018-03-11 16:00:06', null);
INSERT INTO `js_sys_area` VALUES ('441200', '440000', '0,440000,', '2090', '0000000190,0000002090,', '0', '1', '广东省/肇庆市', '肇庆市', '2', '0', 'system', '2018-03-11 16:00:06', 'system', '2018-03-11 16:00:06', null);
INSERT INTO `js_sys_area` VALUES ('441201', '441200', '0,440000,441200,', '20040', '0000000190,0000002090,0000020040,', '1', '2', '广东省/肇庆市/市辖区', '市辖区', '3', '0', 'system', '2018-03-11 16:00:06', 'system', '2018-03-11 16:00:06', null);
INSERT INTO `js_sys_area` VALUES ('441202', '441200', '0,440000,441200,', '20050', '0000000190,0000002090,0000020050,', '1', '2', '广东省/肇庆市/端州区', '端州区', '3', '0', 'system', '2018-03-11 16:00:06', 'system', '2018-03-11 16:00:06', null);
INSERT INTO `js_sys_area` VALUES ('441203', '441200', '0,440000,441200,', '20060', '0000000190,0000002090,0000020060,', '1', '2', '广东省/肇庆市/鼎湖区', '鼎湖区', '3', '0', 'system', '2018-03-11 16:00:06', 'system', '2018-03-11 16:00:06', null);
INSERT INTO `js_sys_area` VALUES ('441223', '441200', '0,440000,441200,', '20070', '0000000190,0000002090,0000020070,', '1', '2', '广东省/肇庆市/广宁县', '广宁县', '3', '0', 'system', '2018-03-11 16:00:06', 'system', '2018-03-11 16:00:06', null);
INSERT INTO `js_sys_area` VALUES ('441224', '441200', '0,440000,441200,', '20080', '0000000190,0000002090,0000020080,', '1', '2', '广东省/肇庆市/怀集县', '怀集县', '3', '0', 'system', '2018-03-11 16:00:06', 'system', '2018-03-11 16:00:06', null);
INSERT INTO `js_sys_area` VALUES ('441225', '441200', '0,440000,441200,', '20090', '0000000190,0000002090,0000020090,', '1', '2', '广东省/肇庆市/封开县', '封开县', '3', '0', 'system', '2018-03-11 16:00:06', 'system', '2018-03-11 16:00:06', null);
INSERT INTO `js_sys_area` VALUES ('441226', '441200', '0,440000,441200,', '20100', '0000000190,0000002090,0000020100,', '1', '2', '广东省/肇庆市/德庆县', '德庆县', '3', '0', 'system', '2018-03-11 16:00:06', 'system', '2018-03-11 16:00:06', null);
INSERT INTO `js_sys_area` VALUES ('441283', '441200', '0,440000,441200,', '20110', '0000000190,0000002090,0000020110,', '1', '2', '广东省/肇庆市/高要市', '高要市', '3', '0', 'system', '2018-03-11 16:00:06', 'system', '2018-03-11 16:00:06', null);
INSERT INTO `js_sys_area` VALUES ('441284', '441200', '0,440000,441200,', '20120', '0000000190,0000002090,0000020120,', '1', '2', '广东省/肇庆市/四会市', '四会市', '3', '0', 'system', '2018-03-11 16:00:06', 'system', '2018-03-11 16:00:06', null);
INSERT INTO `js_sys_area` VALUES ('441300', '440000', '0,440000,', '2100', '0000000190,0000002100,', '0', '1', '广东省/惠州市', '惠州市', '2', '0', 'system', '2018-03-11 16:00:06', 'system', '2018-03-11 16:00:06', null);
INSERT INTO `js_sys_area` VALUES ('441301', '441300', '0,440000,441300,', '20130', '0000000190,0000002100,0000020130,', '1', '2', '广东省/惠州市/市辖区', '市辖区', '3', '0', 'system', '2018-03-11 16:00:06', 'system', '2018-03-11 16:00:06', null);
INSERT INTO `js_sys_area` VALUES ('441302', '441300', '0,440000,441300,', '20140', '0000000190,0000002100,0000020140,', '1', '2', '广东省/惠州市/惠城区', '惠城区', '3', '0', 'system', '2018-03-11 16:00:06', 'system', '2018-03-11 16:00:06', null);
INSERT INTO `js_sys_area` VALUES ('441303', '441300', '0,440000,441300,', '20150', '0000000190,0000002100,0000020150,', '1', '2', '广东省/惠州市/惠阳区', '惠阳区', '3', '0', 'system', '2018-03-11 16:00:06', 'system', '2018-03-11 16:00:06', null);
INSERT INTO `js_sys_area` VALUES ('441322', '441300', '0,440000,441300,', '20160', '0000000190,0000002100,0000020160,', '1', '2', '广东省/惠州市/博罗县', '博罗县', '3', '0', 'system', '2018-03-11 16:00:06', 'system', '2018-03-11 16:00:06', null);
INSERT INTO `js_sys_area` VALUES ('441323', '441300', '0,440000,441300,', '20170', '0000000190,0000002100,0000020170,', '1', '2', '广东省/惠州市/惠东县', '惠东县', '3', '0', 'system', '2018-03-11 16:00:06', 'system', '2018-03-11 16:00:06', null);
INSERT INTO `js_sys_area` VALUES ('441324', '441300', '0,440000,441300,', '20180', '0000000190,0000002100,0000020180,', '1', '2', '广东省/惠州市/龙门县', '龙门县', '3', '0', 'system', '2018-03-11 16:00:06', 'system', '2018-03-11 16:00:06', null);
INSERT INTO `js_sys_area` VALUES ('441400', '440000', '0,440000,', '2110', '0000000190,0000002110,', '0', '1', '广东省/梅州市', '梅州市', '2', '0', 'system', '2018-03-11 16:00:06', 'system', '2018-03-11 16:00:06', null);
INSERT INTO `js_sys_area` VALUES ('441401', '441400', '0,440000,441400,', '20190', '0000000190,0000002110,0000020190,', '1', '2', '广东省/梅州市/市辖区', '市辖区', '3', '0', 'system', '2018-03-11 16:00:06', 'system', '2018-03-11 16:00:06', null);
INSERT INTO `js_sys_area` VALUES ('441402', '441400', '0,440000,441400,', '20200', '0000000190,0000002110,0000020200,', '1', '2', '广东省/梅州市/梅江区', '梅江区', '3', '0', 'system', '2018-03-11 16:00:06', 'system', '2018-03-11 16:00:06', null);
INSERT INTO `js_sys_area` VALUES ('441421', '441400', '0,440000,441400,', '20210', '0000000190,0000002110,0000020210,', '1', '2', '广东省/梅州市/梅　县', '梅　县', '3', '0', 'system', '2018-03-11 16:00:06', 'system', '2018-03-11 16:00:06', null);
INSERT INTO `js_sys_area` VALUES ('441422', '441400', '0,440000,441400,', '20220', '0000000190,0000002110,0000020220,', '1', '2', '广东省/梅州市/大埔县', '大埔县', '3', '0', 'system', '2018-03-11 16:00:06', 'system', '2018-03-11 16:00:06', null);
INSERT INTO `js_sys_area` VALUES ('441423', '441400', '0,440000,441400,', '20230', '0000000190,0000002110,0000020230,', '1', '2', '广东省/梅州市/丰顺县', '丰顺县', '3', '0', 'system', '2018-03-11 16:00:06', 'system', '2018-03-11 16:00:06', null);
INSERT INTO `js_sys_area` VALUES ('441424', '441400', '0,440000,441400,', '20240', '0000000190,0000002110,0000020240,', '1', '2', '广东省/梅州市/五华县', '五华县', '3', '0', 'system', '2018-03-11 16:00:06', 'system', '2018-03-11 16:00:06', null);
INSERT INTO `js_sys_area` VALUES ('441426', '441400', '0,440000,441400,', '20250', '0000000190,0000002110,0000020250,', '1', '2', '广东省/梅州市/平远县', '平远县', '3', '0', 'system', '2018-03-11 16:00:06', 'system', '2018-03-11 16:00:06', null);
INSERT INTO `js_sys_area` VALUES ('441427', '441400', '0,440000,441400,', '20260', '0000000190,0000002110,0000020260,', '1', '2', '广东省/梅州市/蕉岭县', '蕉岭县', '3', '0', 'system', '2018-03-11 16:00:06', 'system', '2018-03-11 16:00:06', null);
INSERT INTO `js_sys_area` VALUES ('441481', '441400', '0,440000,441400,', '20270', '0000000190,0000002110,0000020270,', '1', '2', '广东省/梅州市/兴宁市', '兴宁市', '3', '0', 'system', '2018-03-11 16:00:06', 'system', '2018-03-11 16:00:06', null);
INSERT INTO `js_sys_area` VALUES ('441500', '440000', '0,440000,', '2120', '0000000190,0000002120,', '0', '1', '广东省/汕尾市', '汕尾市', '2', '0', 'system', '2018-03-11 16:00:06', 'system', '2018-03-11 16:00:06', null);
INSERT INTO `js_sys_area` VALUES ('441501', '441500', '0,440000,441500,', '20280', '0000000190,0000002120,0000020280,', '1', '2', '广东省/汕尾市/市辖区', '市辖区', '3', '0', 'system', '2018-03-11 16:00:06', 'system', '2018-03-11 16:00:06', null);
INSERT INTO `js_sys_area` VALUES ('441502', '441500', '0,440000,441500,', '20290', '0000000190,0000002120,0000020290,', '1', '2', '广东省/汕尾市/城　区', '城　区', '3', '0', 'system', '2018-03-11 16:00:06', 'system', '2018-03-11 16:00:06', null);
INSERT INTO `js_sys_area` VALUES ('441521', '441500', '0,440000,441500,', '20300', '0000000190,0000002120,0000020300,', '1', '2', '广东省/汕尾市/海丰县', '海丰县', '3', '0', 'system', '2018-03-11 16:00:06', 'system', '2018-03-11 16:00:06', null);
INSERT INTO `js_sys_area` VALUES ('441523', '441500', '0,440000,441500,', '20310', '0000000190,0000002120,0000020310,', '1', '2', '广东省/汕尾市/陆河县', '陆河县', '3', '0', 'system', '2018-03-11 16:00:06', 'system', '2018-03-11 16:00:06', null);
INSERT INTO `js_sys_area` VALUES ('441581', '441500', '0,440000,441500,', '20320', '0000000190,0000002120,0000020320,', '1', '2', '广东省/汕尾市/陆丰市', '陆丰市', '3', '0', 'system', '2018-03-11 16:00:06', 'system', '2018-03-11 16:00:06', null);
INSERT INTO `js_sys_area` VALUES ('441600', '440000', '0,440000,', '2130', '0000000190,0000002130,', '0', '1', '广东省/河源市', '河源市', '2', '0', 'system', '2018-03-11 16:00:06', 'system', '2018-03-11 16:00:06', null);
INSERT INTO `js_sys_area` VALUES ('441601', '441600', '0,440000,441600,', '20330', '0000000190,0000002130,0000020330,', '1', '2', '广东省/河源市/市辖区', '市辖区', '3', '0', 'system', '2018-03-11 16:00:06', 'system', '2018-03-11 16:00:06', null);
INSERT INTO `js_sys_area` VALUES ('441602', '441600', '0,440000,441600,', '20340', '0000000190,0000002130,0000020340,', '1', '2', '广东省/河源市/源城区', '源城区', '3', '0', 'system', '2018-03-11 16:00:06', 'system', '2018-03-11 16:00:06', null);
INSERT INTO `js_sys_area` VALUES ('441621', '441600', '0,440000,441600,', '20350', '0000000190,0000002130,0000020350,', '1', '2', '广东省/河源市/紫金县', '紫金县', '3', '0', 'system', '2018-03-11 16:00:06', 'system', '2018-03-11 16:00:06', null);
INSERT INTO `js_sys_area` VALUES ('441622', '441600', '0,440000,441600,', '20360', '0000000190,0000002130,0000020360,', '1', '2', '广东省/河源市/龙川县', '龙川县', '3', '0', 'system', '2018-03-11 16:00:06', 'system', '2018-03-11 16:00:06', null);
INSERT INTO `js_sys_area` VALUES ('441623', '441600', '0,440000,441600,', '20370', '0000000190,0000002130,0000020370,', '1', '2', '广东省/河源市/连平县', '连平县', '3', '0', 'system', '2018-03-11 16:00:06', 'system', '2018-03-11 16:00:06', null);
INSERT INTO `js_sys_area` VALUES ('441624', '441600', '0,440000,441600,', '20380', '0000000190,0000002130,0000020380,', '1', '2', '广东省/河源市/和平县', '和平县', '3', '0', 'system', '2018-03-11 16:00:06', 'system', '2018-03-11 16:00:06', null);
INSERT INTO `js_sys_area` VALUES ('441625', '441600', '0,440000,441600,', '20390', '0000000190,0000002130,0000020390,', '1', '2', '广东省/河源市/东源县', '东源县', '3', '0', 'system', '2018-03-11 16:00:07', 'system', '2018-03-11 16:00:07', null);
INSERT INTO `js_sys_area` VALUES ('441700', '440000', '0,440000,', '2140', '0000000190,0000002140,', '0', '1', '广东省/阳江市', '阳江市', '2', '0', 'system', '2018-03-11 16:00:07', 'system', '2018-03-11 16:00:07', null);
INSERT INTO `js_sys_area` VALUES ('441701', '441700', '0,440000,441700,', '20400', '0000000190,0000002140,0000020400,', '1', '2', '广东省/阳江市/市辖区', '市辖区', '3', '0', 'system', '2018-03-11 16:00:07', 'system', '2018-03-11 16:00:07', null);
INSERT INTO `js_sys_area` VALUES ('441702', '441700', '0,440000,441700,', '20410', '0000000190,0000002140,0000020410,', '1', '2', '广东省/阳江市/江城区', '江城区', '3', '0', 'system', '2018-03-11 16:00:07', 'system', '2018-03-11 16:00:07', null);
INSERT INTO `js_sys_area` VALUES ('441721', '441700', '0,440000,441700,', '20420', '0000000190,0000002140,0000020420,', '1', '2', '广东省/阳江市/阳西县', '阳西县', '3', '0', 'system', '2018-03-11 16:00:07', 'system', '2018-03-11 16:00:07', null);
INSERT INTO `js_sys_area` VALUES ('441723', '441700', '0,440000,441700,', '20430', '0000000190,0000002140,0000020430,', '1', '2', '广东省/阳江市/阳东县', '阳东县', '3', '0', 'system', '2018-03-11 16:00:07', 'system', '2018-03-11 16:00:07', null);
INSERT INTO `js_sys_area` VALUES ('441781', '441700', '0,440000,441700,', '20440', '0000000190,0000002140,0000020440,', '1', '2', '广东省/阳江市/阳春市', '阳春市', '3', '0', 'system', '2018-03-11 16:00:07', 'system', '2018-03-11 16:00:07', null);
INSERT INTO `js_sys_area` VALUES ('441800', '440000', '0,440000,', '2150', '0000000190,0000002150,', '0', '1', '广东省/清远市', '清远市', '2', '0', 'system', '2018-03-11 16:00:07', 'system', '2018-03-11 16:00:07', null);
INSERT INTO `js_sys_area` VALUES ('441801', '441800', '0,440000,441800,', '20450', '0000000190,0000002150,0000020450,', '1', '2', '广东省/清远市/市辖区', '市辖区', '3', '0', 'system', '2018-03-11 16:00:07', 'system', '2018-03-11 16:00:07', null);
INSERT INTO `js_sys_area` VALUES ('441802', '441800', '0,440000,441800,', '20460', '0000000190,0000002150,0000020460,', '1', '2', '广东省/清远市/清城区', '清城区', '3', '0', 'system', '2018-03-11 16:00:07', 'system', '2018-03-11 16:00:07', null);
INSERT INTO `js_sys_area` VALUES ('441821', '441800', '0,440000,441800,', '20470', '0000000190,0000002150,0000020470,', '1', '2', '广东省/清远市/佛冈县', '佛冈县', '3', '0', 'system', '2018-03-11 16:00:07', 'system', '2018-03-11 16:00:07', null);
INSERT INTO `js_sys_area` VALUES ('441823', '441800', '0,440000,441800,', '20480', '0000000190,0000002150,0000020480,', '1', '2', '广东省/清远市/阳山县', '阳山县', '3', '0', 'system', '2018-03-11 16:00:07', 'system', '2018-03-11 16:00:07', null);
INSERT INTO `js_sys_area` VALUES ('441825', '441800', '0,440000,441800,', '20490', '0000000190,0000002150,0000020490,', '1', '2', '广东省/清远市/连山壮族瑶族自治县', '连山壮族瑶族自治县', '3', '0', 'system', '2018-03-11 16:00:07', 'system', '2018-03-11 16:00:07', null);
INSERT INTO `js_sys_area` VALUES ('441826', '441800', '0,440000,441800,', '20500', '0000000190,0000002150,0000020500,', '1', '2', '广东省/清远市/连南瑶族自治县', '连南瑶族自治县', '3', '0', 'system', '2018-03-11 16:00:07', 'system', '2018-03-11 16:00:07', null);
INSERT INTO `js_sys_area` VALUES ('441827', '441800', '0,440000,441800,', '20510', '0000000190,0000002150,0000020510,', '1', '2', '广东省/清远市/清新县', '清新县', '3', '0', 'system', '2018-03-11 16:00:07', 'system', '2018-03-11 16:00:07', null);
INSERT INTO `js_sys_area` VALUES ('441881', '441800', '0,440000,441800,', '20520', '0000000190,0000002150,0000020520,', '1', '2', '广东省/清远市/英德市', '英德市', '3', '0', 'system', '2018-03-11 16:00:07', 'system', '2018-03-11 16:00:07', null);
INSERT INTO `js_sys_area` VALUES ('441882', '441800', '0,440000,441800,', '20530', '0000000190,0000002150,0000020530,', '1', '2', '广东省/清远市/连州市', '连州市', '3', '0', 'system', '2018-03-11 16:00:07', 'system', '2018-03-11 16:00:07', null);
INSERT INTO `js_sys_area` VALUES ('441900', '440000', '0,440000,', '2160', '0000000190,0000002160,', '1', '1', '广东省/东莞市', '东莞市', '2', '0', 'system', '2018-03-11 16:00:07', 'system', '2018-03-11 16:00:07', null);
INSERT INTO `js_sys_area` VALUES ('442000', '440000', '0,440000,', '2170', '0000000190,0000002170,', '1', '1', '广东省/中山市', '中山市', '2', '0', 'system', '2018-03-11 16:00:07', 'system', '2018-03-11 16:00:07', null);
INSERT INTO `js_sys_area` VALUES ('445100', '440000', '0,440000,', '2180', '0000000190,0000002180,', '0', '1', '广东省/潮州市', '潮州市', '2', '0', 'system', '2018-03-11 16:00:07', 'system', '2018-03-11 16:00:07', null);
INSERT INTO `js_sys_area` VALUES ('445101', '445100', '0,440000,445100,', '20540', '0000000190,0000002180,0000020540,', '1', '2', '广东省/潮州市/市辖区', '市辖区', '3', '0', 'system', '2018-03-11 16:00:07', 'system', '2018-03-11 16:00:07', null);
INSERT INTO `js_sys_area` VALUES ('445102', '445100', '0,440000,445100,', '20550', '0000000190,0000002180,0000020550,', '1', '2', '广东省/潮州市/湘桥区', '湘桥区', '3', '0', 'system', '2018-03-11 16:00:07', 'system', '2018-03-11 16:00:07', null);
INSERT INTO `js_sys_area` VALUES ('445121', '445100', '0,440000,445100,', '20560', '0000000190,0000002180,0000020560,', '1', '2', '广东省/潮州市/潮安县', '潮安县', '3', '0', 'system', '2018-03-11 16:00:07', 'system', '2018-03-11 16:00:07', null);
INSERT INTO `js_sys_area` VALUES ('445122', '445100', '0,440000,445100,', '20570', '0000000190,0000002180,0000020570,', '1', '2', '广东省/潮州市/饶平县', '饶平县', '3', '0', 'system', '2018-03-11 16:00:07', 'system', '2018-03-11 16:00:07', null);
INSERT INTO `js_sys_area` VALUES ('445200', '440000', '0,440000,', '2190', '0000000190,0000002190,', '0', '1', '广东省/揭阳市', '揭阳市', '2', '0', 'system', '2018-03-11 16:00:07', 'system', '2018-03-11 16:00:07', null);
INSERT INTO `js_sys_area` VALUES ('445201', '445200', '0,440000,445200,', '20580', '0000000190,0000002190,0000020580,', '1', '2', '广东省/揭阳市/市辖区', '市辖区', '3', '0', 'system', '2018-03-11 16:00:07', 'system', '2018-03-11 16:00:07', null);
INSERT INTO `js_sys_area` VALUES ('445202', '445200', '0,440000,445200,', '20590', '0000000190,0000002190,0000020590,', '1', '2', '广东省/揭阳市/榕城区', '榕城区', '3', '0', 'system', '2018-03-11 16:00:07', 'system', '2018-03-11 16:00:07', null);
INSERT INTO `js_sys_area` VALUES ('445221', '445200', '0,440000,445200,', '20600', '0000000190,0000002190,0000020600,', '1', '2', '广东省/揭阳市/揭东县', '揭东县', '3', '0', 'system', '2018-03-11 16:00:07', 'system', '2018-03-11 16:00:07', null);
INSERT INTO `js_sys_area` VALUES ('445222', '445200', '0,440000,445200,', '20610', '0000000190,0000002190,0000020610,', '1', '2', '广东省/揭阳市/揭西县', '揭西县', '3', '0', 'system', '2018-03-11 16:00:07', 'system', '2018-03-11 16:00:07', null);
INSERT INTO `js_sys_area` VALUES ('445224', '445200', '0,440000,445200,', '20620', '0000000190,0000002190,0000020620,', '1', '2', '广东省/揭阳市/惠来县', '惠来县', '3', '0', 'system', '2018-03-11 16:00:07', 'system', '2018-03-11 16:00:07', null);
INSERT INTO `js_sys_area` VALUES ('445281', '445200', '0,440000,445200,', '20630', '0000000190,0000002190,0000020630,', '1', '2', '广东省/揭阳市/普宁市', '普宁市', '3', '0', 'system', '2018-03-11 16:00:07', 'system', '2018-03-11 16:00:07', null);
INSERT INTO `js_sys_area` VALUES ('445300', '440000', '0,440000,', '2200', '0000000190,0000002200,', '0', '1', '广东省/云浮市', '云浮市', '2', '0', 'system', '2018-03-11 16:00:07', 'system', '2018-03-11 16:00:07', null);
INSERT INTO `js_sys_area` VALUES ('445301', '445300', '0,440000,445300,', '20640', '0000000190,0000002200,0000020640,', '1', '2', '广东省/云浮市/市辖区', '市辖区', '3', '0', 'system', '2018-03-11 16:00:07', 'system', '2018-03-11 16:00:07', null);
INSERT INTO `js_sys_area` VALUES ('445302', '445300', '0,440000,445300,', '20650', '0000000190,0000002200,0000020650,', '1', '2', '广东省/云浮市/云城区', '云城区', '3', '0', 'system', '2018-03-11 16:00:07', 'system', '2018-03-11 16:00:07', null);
INSERT INTO `js_sys_area` VALUES ('445321', '445300', '0,440000,445300,', '20660', '0000000190,0000002200,0000020660,', '1', '2', '广东省/云浮市/新兴县', '新兴县', '3', '0', 'system', '2018-03-11 16:00:07', 'system', '2018-03-11 16:00:07', null);
INSERT INTO `js_sys_area` VALUES ('445322', '445300', '0,440000,445300,', '20670', '0000000190,0000002200,0000020670,', '1', '2', '广东省/云浮市/郁南县', '郁南县', '3', '0', 'system', '2018-03-11 16:00:07', 'system', '2018-03-11 16:00:07', null);
INSERT INTO `js_sys_area` VALUES ('445323', '445300', '0,440000,445300,', '20680', '0000000190,0000002200,0000020680,', '1', '2', '广东省/云浮市/云安县', '云安县', '3', '0', 'system', '2018-03-11 16:00:07', 'system', '2018-03-11 16:00:07', null);
INSERT INTO `js_sys_area` VALUES ('445381', '445300', '0,440000,445300,', '20690', '0000000190,0000002200,0000020690,', '1', '2', '广东省/云浮市/罗定市', '罗定市', '3', '0', 'system', '2018-03-11 16:00:07', 'system', '2018-03-11 16:00:07', null);
INSERT INTO `js_sys_area` VALUES ('450000', '0', '0,', '200', '0000000200,', '0', '0', '广西壮族自治区', '广西壮族自治区', '1', '0', 'system', '2018-03-11 16:00:07', 'system', '2018-03-11 16:00:07', null);
INSERT INTO `js_sys_area` VALUES ('450100', '450000', '0,450000,', '2210', '0000000200,0000002210,', '0', '1', '广西壮族自治区/南宁市', '南宁市', '2', '0', 'system', '2018-03-11 16:00:07', 'system', '2018-03-11 16:00:07', null);
INSERT INTO `js_sys_area` VALUES ('450101', '450100', '0,450000,450100,', '20700', '0000000200,0000002210,0000020700,', '1', '2', '广西壮族自治区/南宁市/市辖区', '市辖区', '3', '0', 'system', '2018-03-11 16:00:07', 'system', '2018-03-11 16:00:07', null);
INSERT INTO `js_sys_area` VALUES ('450102', '450100', '0,450000,450100,', '20710', '0000000200,0000002210,0000020710,', '1', '2', '广西壮族自治区/南宁市/兴宁区', '兴宁区', '3', '0', 'system', '2018-03-11 16:00:07', 'system', '2018-03-11 16:00:07', null);
INSERT INTO `js_sys_area` VALUES ('450103', '450100', '0,450000,450100,', '20720', '0000000200,0000002210,0000020720,', '1', '2', '广西壮族自治区/南宁市/青秀区', '青秀区', '3', '0', 'system', '2018-03-11 16:00:07', 'system', '2018-03-11 16:00:07', null);
INSERT INTO `js_sys_area` VALUES ('450105', '450100', '0,450000,450100,', '20730', '0000000200,0000002210,0000020730,', '1', '2', '广西壮族自治区/南宁市/江南区', '江南区', '3', '0', 'system', '2018-03-11 16:00:07', 'system', '2018-03-11 16:00:07', null);
INSERT INTO `js_sys_area` VALUES ('450107', '450100', '0,450000,450100,', '20740', '0000000200,0000002210,0000020740,', '1', '2', '广西壮族自治区/南宁市/西乡塘区', '西乡塘区', '3', '0', 'system', '2018-03-11 16:00:07', 'system', '2018-03-11 16:00:07', null);
INSERT INTO `js_sys_area` VALUES ('450108', '450100', '0,450000,450100,', '20750', '0000000200,0000002210,0000020750,', '1', '2', '广西壮族自治区/南宁市/良庆区', '良庆区', '3', '0', 'system', '2018-03-11 16:00:07', 'system', '2018-03-11 16:00:07', null);
INSERT INTO `js_sys_area` VALUES ('450109', '450100', '0,450000,450100,', '20760', '0000000200,0000002210,0000020760,', '1', '2', '广西壮族自治区/南宁市/邕宁区', '邕宁区', '3', '0', 'system', '2018-03-11 16:00:07', 'system', '2018-03-11 16:00:07', null);
INSERT INTO `js_sys_area` VALUES ('450122', '450100', '0,450000,450100,', '20770', '0000000200,0000002210,0000020770,', '1', '2', '广西壮族自治区/南宁市/武鸣县', '武鸣县', '3', '0', 'system', '2018-03-11 16:00:07', 'system', '2018-03-11 16:00:07', null);
INSERT INTO `js_sys_area` VALUES ('450123', '450100', '0,450000,450100,', '20780', '0000000200,0000002210,0000020780,', '1', '2', '广西壮族自治区/南宁市/隆安县', '隆安县', '3', '0', 'system', '2018-03-11 16:00:07', 'system', '2018-03-11 16:00:07', null);
INSERT INTO `js_sys_area` VALUES ('450124', '450100', '0,450000,450100,', '20790', '0000000200,0000002210,0000020790,', '1', '2', '广西壮族自治区/南宁市/马山县', '马山县', '3', '0', 'system', '2018-03-11 16:00:07', 'system', '2018-03-11 16:00:07', null);
INSERT INTO `js_sys_area` VALUES ('450125', '450100', '0,450000,450100,', '20800', '0000000200,0000002210,0000020800,', '1', '2', '广西壮族自治区/南宁市/上林县', '上林县', '3', '0', 'system', '2018-03-11 16:00:07', 'system', '2018-03-11 16:00:07', null);
INSERT INTO `js_sys_area` VALUES ('450126', '450100', '0,450000,450100,', '20810', '0000000200,0000002210,0000020810,', '1', '2', '广西壮族自治区/南宁市/宾阳县', '宾阳县', '3', '0', 'system', '2018-03-11 16:00:07', 'system', '2018-03-11 16:00:07', null);
INSERT INTO `js_sys_area` VALUES ('450127', '450100', '0,450000,450100,', '20820', '0000000200,0000002210,0000020820,', '1', '2', '广西壮族自治区/南宁市/横　县', '横　县', '3', '0', 'system', '2018-03-11 16:00:07', 'system', '2018-03-11 16:00:07', null);
INSERT INTO `js_sys_area` VALUES ('450200', '450000', '0,450000,', '2220', '0000000200,0000002220,', '0', '1', '广西壮族自治区/柳州市', '柳州市', '2', '0', 'system', '2018-03-11 16:00:07', 'system', '2018-03-11 16:00:07', null);
INSERT INTO `js_sys_area` VALUES ('450201', '450200', '0,450000,450200,', '20830', '0000000200,0000002220,0000020830,', '1', '2', '广西壮族自治区/柳州市/市辖区', '市辖区', '3', '0', 'system', '2018-03-11 16:00:07', 'system', '2018-03-11 16:00:07', null);
INSERT INTO `js_sys_area` VALUES ('450202', '450200', '0,450000,450200,', '20840', '0000000200,0000002220,0000020840,', '1', '2', '广西壮族自治区/柳州市/城中区', '城中区', '3', '0', 'system', '2018-03-11 16:00:07', 'system', '2018-03-11 16:00:07', null);
INSERT INTO `js_sys_area` VALUES ('450203', '450200', '0,450000,450200,', '20850', '0000000200,0000002220,0000020850,', '1', '2', '广西壮族自治区/柳州市/鱼峰区', '鱼峰区', '3', '0', 'system', '2018-03-11 16:00:07', 'system', '2018-03-11 16:00:07', null);
INSERT INTO `js_sys_area` VALUES ('450204', '450200', '0,450000,450200,', '20860', '0000000200,0000002220,0000020860,', '1', '2', '广西壮族自治区/柳州市/柳南区', '柳南区', '3', '0', 'system', '2018-03-11 16:00:07', 'system', '2018-03-11 16:00:07', null);
INSERT INTO `js_sys_area` VALUES ('450205', '450200', '0,450000,450200,', '20870', '0000000200,0000002220,0000020870,', '1', '2', '广西壮族自治区/柳州市/柳北区', '柳北区', '3', '0', 'system', '2018-03-11 16:00:07', 'system', '2018-03-11 16:00:07', null);
INSERT INTO `js_sys_area` VALUES ('450221', '450200', '0,450000,450200,', '20880', '0000000200,0000002220,0000020880,', '1', '2', '广西壮族自治区/柳州市/柳江县', '柳江县', '3', '0', 'system', '2018-03-11 16:00:07', 'system', '2018-03-11 16:00:07', null);
INSERT INTO `js_sys_area` VALUES ('450222', '450200', '0,450000,450200,', '20890', '0000000200,0000002220,0000020890,', '1', '2', '广西壮族自治区/柳州市/柳城县', '柳城县', '3', '0', 'system', '2018-03-11 16:00:07', 'system', '2018-03-11 16:00:07', null);
INSERT INTO `js_sys_area` VALUES ('450223', '450200', '0,450000,450200,', '20900', '0000000200,0000002220,0000020900,', '1', '2', '广西壮族自治区/柳州市/鹿寨县', '鹿寨县', '3', '0', 'system', '2018-03-11 16:00:07', 'system', '2018-03-11 16:00:07', null);
INSERT INTO `js_sys_area` VALUES ('450224', '450200', '0,450000,450200,', '20910', '0000000200,0000002220,0000020910,', '1', '2', '广西壮族自治区/柳州市/融安县', '融安县', '3', '0', 'system', '2018-03-11 16:00:07', 'system', '2018-03-11 16:00:07', null);
INSERT INTO `js_sys_area` VALUES ('450225', '450200', '0,450000,450200,', '20920', '0000000200,0000002220,0000020920,', '1', '2', '广西壮族自治区/柳州市/融水苗族自治县', '融水苗族自治县', '3', '0', 'system', '2018-03-11 16:00:07', 'system', '2018-03-11 16:00:07', null);
INSERT INTO `js_sys_area` VALUES ('450226', '450200', '0,450000,450200,', '20930', '0000000200,0000002220,0000020930,', '1', '2', '广西壮族自治区/柳州市/三江侗族自治县', '三江侗族自治县', '3', '0', 'system', '2018-03-11 16:00:07', 'system', '2018-03-11 16:00:07', null);
INSERT INTO `js_sys_area` VALUES ('450300', '450000', '0,450000,', '2230', '0000000200,0000002230,', '0', '1', '广西壮族自治区/桂林市', '桂林市', '2', '0', 'system', '2018-03-11 16:00:07', 'system', '2018-03-11 16:00:07', null);
INSERT INTO `js_sys_area` VALUES ('450301', '450300', '0,450000,450300,', '20940', '0000000200,0000002230,0000020940,', '1', '2', '广西壮族自治区/桂林市/市辖区', '市辖区', '3', '0', 'system', '2018-03-11 16:00:07', 'system', '2018-03-11 16:00:07', null);
INSERT INTO `js_sys_area` VALUES ('450302', '450300', '0,450000,450300,', '20950', '0000000200,0000002230,0000020950,', '1', '2', '广西壮族自治区/桂林市/秀峰区', '秀峰区', '3', '0', 'system', '2018-03-11 16:00:07', 'system', '2018-03-11 16:00:07', null);
INSERT INTO `js_sys_area` VALUES ('450303', '450300', '0,450000,450300,', '20960', '0000000200,0000002230,0000020960,', '1', '2', '广西壮族自治区/桂林市/叠彩区', '叠彩区', '3', '0', 'system', '2018-03-11 16:00:08', 'system', '2018-03-11 16:00:08', null);
INSERT INTO `js_sys_area` VALUES ('450304', '450300', '0,450000,450300,', '20970', '0000000200,0000002230,0000020970,', '1', '2', '广西壮族自治区/桂林市/象山区', '象山区', '3', '0', 'system', '2018-03-11 16:00:08', 'system', '2018-03-11 16:00:08', null);
INSERT INTO `js_sys_area` VALUES ('450305', '450300', '0,450000,450300,', '20980', '0000000200,0000002230,0000020980,', '1', '2', '广西壮族自治区/桂林市/七星区', '七星区', '3', '0', 'system', '2018-03-11 16:00:08', 'system', '2018-03-11 16:00:08', null);
INSERT INTO `js_sys_area` VALUES ('450311', '450300', '0,450000,450300,', '20990', '0000000200,0000002230,0000020990,', '1', '2', '广西壮族自治区/桂林市/雁山区', '雁山区', '3', '0', 'system', '2018-03-11 16:00:08', 'system', '2018-03-11 16:00:08', null);
INSERT INTO `js_sys_area` VALUES ('450321', '450300', '0,450000,450300,', '21000', '0000000200,0000002230,0000021000,', '1', '2', '广西壮族自治区/桂林市/阳朔县', '阳朔县', '3', '0', 'system', '2018-03-11 16:00:08', 'system', '2018-03-11 16:00:08', null);
INSERT INTO `js_sys_area` VALUES ('450322', '450300', '0,450000,450300,', '21010', '0000000200,0000002230,0000021010,', '1', '2', '广西壮族自治区/桂林市/临桂县', '临桂县', '3', '0', 'system', '2018-03-11 16:00:08', 'system', '2018-03-11 16:00:08', null);
INSERT INTO `js_sys_area` VALUES ('450323', '450300', '0,450000,450300,', '21020', '0000000200,0000002230,0000021020,', '1', '2', '广西壮族自治区/桂林市/灵川县', '灵川县', '3', '0', 'system', '2018-03-11 16:00:08', 'system', '2018-03-11 16:00:08', null);
INSERT INTO `js_sys_area` VALUES ('450324', '450300', '0,450000,450300,', '21030', '0000000200,0000002230,0000021030,', '1', '2', '广西壮族自治区/桂林市/全州县', '全州县', '3', '0', 'system', '2018-03-11 16:00:08', 'system', '2018-03-11 16:00:08', null);
INSERT INTO `js_sys_area` VALUES ('450325', '450300', '0,450000,450300,', '21040', '0000000200,0000002230,0000021040,', '1', '2', '广西壮族自治区/桂林市/兴安县', '兴安县', '3', '0', 'system', '2018-03-11 16:00:08', 'system', '2018-03-11 16:00:08', null);
INSERT INTO `js_sys_area` VALUES ('450326', '450300', '0,450000,450300,', '21050', '0000000200,0000002230,0000021050,', '1', '2', '广西壮族自治区/桂林市/永福县', '永福县', '3', '0', 'system', '2018-03-11 16:00:08', 'system', '2018-03-11 16:00:08', null);
INSERT INTO `js_sys_area` VALUES ('450327', '450300', '0,450000,450300,', '21060', '0000000200,0000002230,0000021060,', '1', '2', '广西壮族自治区/桂林市/灌阳县', '灌阳县', '3', '0', 'system', '2018-03-11 16:00:08', 'system', '2018-03-11 16:00:08', null);
INSERT INTO `js_sys_area` VALUES ('450328', '450300', '0,450000,450300,', '21070', '0000000200,0000002230,0000021070,', '1', '2', '广西壮族自治区/桂林市/龙胜各族自治县', '龙胜各族自治县', '3', '0', 'system', '2018-03-11 16:00:08', 'system', '2018-03-11 16:00:08', null);
INSERT INTO `js_sys_area` VALUES ('450329', '450300', '0,450000,450300,', '21080', '0000000200,0000002230,0000021080,', '1', '2', '广西壮族自治区/桂林市/资源县', '资源县', '3', '0', 'system', '2018-03-11 16:00:08', 'system', '2018-03-11 16:00:08', null);
INSERT INTO `js_sys_area` VALUES ('450330', '450300', '0,450000,450300,', '21090', '0000000200,0000002230,0000021090,', '1', '2', '广西壮族自治区/桂林市/平乐县', '平乐县', '3', '0', 'system', '2018-03-11 16:00:08', 'system', '2018-03-11 16:00:08', null);
INSERT INTO `js_sys_area` VALUES ('450331', '450300', '0,450000,450300,', '21100', '0000000200,0000002230,0000021100,', '1', '2', '广西壮族自治区/桂林市/荔蒲县', '荔蒲县', '3', '0', 'system', '2018-03-11 16:00:08', 'system', '2018-03-11 16:00:08', null);
INSERT INTO `js_sys_area` VALUES ('450332', '450300', '0,450000,450300,', '21110', '0000000200,0000002230,0000021110,', '1', '2', '广西壮族自治区/桂林市/恭城瑶族自治县', '恭城瑶族自治县', '3', '0', 'system', '2018-03-11 16:00:08', 'system', '2018-03-11 16:00:08', null);
INSERT INTO `js_sys_area` VALUES ('450400', '450000', '0,450000,', '2240', '0000000200,0000002240,', '0', '1', '广西壮族自治区/梧州市', '梧州市', '2', '0', 'system', '2018-03-11 16:00:08', 'system', '2018-03-11 16:00:08', null);
INSERT INTO `js_sys_area` VALUES ('450401', '450400', '0,450000,450400,', '21120', '0000000200,0000002240,0000021120,', '1', '2', '广西壮族自治区/梧州市/市辖区', '市辖区', '3', '0', 'system', '2018-03-11 16:00:08', 'system', '2018-03-11 16:00:08', null);
INSERT INTO `js_sys_area` VALUES ('450403', '450400', '0,450000,450400,', '21130', '0000000200,0000002240,0000021130,', '1', '2', '广西壮族自治区/梧州市/万秀区', '万秀区', '3', '0', 'system', '2018-03-11 16:00:08', 'system', '2018-03-11 16:00:08', null);
INSERT INTO `js_sys_area` VALUES ('450404', '450400', '0,450000,450400,', '21140', '0000000200,0000002240,0000021140,', '1', '2', '广西壮族自治区/梧州市/蝶山区', '蝶山区', '3', '0', 'system', '2018-03-11 16:00:08', 'system', '2018-03-11 16:00:08', null);
INSERT INTO `js_sys_area` VALUES ('450405', '450400', '0,450000,450400,', '21150', '0000000200,0000002240,0000021150,', '1', '2', '广西壮族自治区/梧州市/长洲区', '长洲区', '3', '0', 'system', '2018-03-11 16:00:08', 'system', '2018-03-11 16:00:08', null);
INSERT INTO `js_sys_area` VALUES ('450421', '450400', '0,450000,450400,', '21160', '0000000200,0000002240,0000021160,', '1', '2', '广西壮族自治区/梧州市/苍梧县', '苍梧县', '3', '0', 'system', '2018-03-11 16:00:08', 'system', '2018-03-11 16:00:08', null);
INSERT INTO `js_sys_area` VALUES ('450422', '450400', '0,450000,450400,', '21170', '0000000200,0000002240,0000021170,', '1', '2', '广西壮族自治区/梧州市/藤　县', '藤　县', '3', '0', 'system', '2018-03-11 16:00:08', 'system', '2018-03-11 16:00:08', null);
INSERT INTO `js_sys_area` VALUES ('450423', '450400', '0,450000,450400,', '21180', '0000000200,0000002240,0000021180,', '1', '2', '广西壮族自治区/梧州市/蒙山县', '蒙山县', '3', '0', 'system', '2018-03-11 16:00:08', 'system', '2018-03-11 16:00:08', null);
INSERT INTO `js_sys_area` VALUES ('450481', '450400', '0,450000,450400,', '21190', '0000000200,0000002240,0000021190,', '1', '2', '广西壮族自治区/梧州市/岑溪市', '岑溪市', '3', '0', 'system', '2018-03-11 16:00:08', 'system', '2018-03-11 16:00:08', null);
INSERT INTO `js_sys_area` VALUES ('450500', '450000', '0,450000,', '2250', '0000000200,0000002250,', '0', '1', '广西壮族自治区/北海市', '北海市', '2', '0', 'system', '2018-03-11 16:00:08', 'system', '2018-03-11 16:00:08', null);
INSERT INTO `js_sys_area` VALUES ('450501', '450500', '0,450000,450500,', '21200', '0000000200,0000002250,0000021200,', '1', '2', '广西壮族自治区/北海市/市辖区', '市辖区', '3', '0', 'system', '2018-03-11 16:00:08', 'system', '2018-03-11 16:00:08', null);
INSERT INTO `js_sys_area` VALUES ('450502', '450500', '0,450000,450500,', '21210', '0000000200,0000002250,0000021210,', '1', '2', '广西壮族自治区/北海市/海城区', '海城区', '3', '0', 'system', '2018-03-11 16:00:08', 'system', '2018-03-11 16:00:08', null);
INSERT INTO `js_sys_area` VALUES ('450503', '450500', '0,450000,450500,', '21220', '0000000200,0000002250,0000021220,', '1', '2', '广西壮族自治区/北海市/银海区', '银海区', '3', '0', 'system', '2018-03-11 16:00:08', 'system', '2018-03-11 16:00:08', null);
INSERT INTO `js_sys_area` VALUES ('450512', '450500', '0,450000,450500,', '21230', '0000000200,0000002250,0000021230,', '1', '2', '广西壮族自治区/北海市/铁山港区', '铁山港区', '3', '0', 'system', '2018-03-11 16:00:08', 'system', '2018-03-11 16:00:08', null);
INSERT INTO `js_sys_area` VALUES ('450521', '450500', '0,450000,450500,', '21240', '0000000200,0000002250,0000021240,', '1', '2', '广西壮族自治区/北海市/合浦县', '合浦县', '3', '0', 'system', '2018-03-11 16:00:08', 'system', '2018-03-11 16:00:08', null);
INSERT INTO `js_sys_area` VALUES ('450600', '450000', '0,450000,', '2260', '0000000200,0000002260,', '0', '1', '广西壮族自治区/防城港市', '防城港市', '2', '0', 'system', '2018-03-11 16:00:08', 'system', '2018-03-11 16:00:08', null);
INSERT INTO `js_sys_area` VALUES ('450601', '450600', '0,450000,450600,', '21250', '0000000200,0000002260,0000021250,', '1', '2', '广西壮族自治区/防城港市/市辖区', '市辖区', '3', '0', 'system', '2018-03-11 16:00:08', 'system', '2018-03-11 16:00:08', null);
INSERT INTO `js_sys_area` VALUES ('450602', '450600', '0,450000,450600,', '21260', '0000000200,0000002260,0000021260,', '1', '2', '广西壮族自治区/防城港市/港口区', '港口区', '3', '0', 'system', '2018-03-11 16:00:08', 'system', '2018-03-11 16:00:08', null);
INSERT INTO `js_sys_area` VALUES ('450603', '450600', '0,450000,450600,', '21270', '0000000200,0000002260,0000021270,', '1', '2', '广西壮族自治区/防城港市/防城区', '防城区', '3', '0', 'system', '2018-03-11 16:00:08', 'system', '2018-03-11 16:00:08', null);
INSERT INTO `js_sys_area` VALUES ('450621', '450600', '0,450000,450600,', '21280', '0000000200,0000002260,0000021280,', '1', '2', '广西壮族自治区/防城港市/上思县', '上思县', '3', '0', 'system', '2018-03-11 16:00:08', 'system', '2018-03-11 16:00:08', null);
INSERT INTO `js_sys_area` VALUES ('450681', '450600', '0,450000,450600,', '21290', '0000000200,0000002260,0000021290,', '1', '2', '广西壮族自治区/防城港市/东兴市', '东兴市', '3', '0', 'system', '2018-03-11 16:00:08', 'system', '2018-03-11 16:00:08', null);
INSERT INTO `js_sys_area` VALUES ('450700', '450000', '0,450000,', '2270', '0000000200,0000002270,', '0', '1', '广西壮族自治区/钦州市', '钦州市', '2', '0', 'system', '2018-03-11 16:00:08', 'system', '2018-03-11 16:00:08', null);
INSERT INTO `js_sys_area` VALUES ('450701', '450700', '0,450000,450700,', '21300', '0000000200,0000002270,0000021300,', '1', '2', '广西壮族自治区/钦州市/市辖区', '市辖区', '3', '0', 'system', '2018-03-11 16:00:08', 'system', '2018-03-11 16:00:08', null);
INSERT INTO `js_sys_area` VALUES ('450702', '450700', '0,450000,450700,', '21310', '0000000200,0000002270,0000021310,', '1', '2', '广西壮族自治区/钦州市/钦南区', '钦南区', '3', '0', 'system', '2018-03-11 16:00:08', 'system', '2018-03-11 16:00:08', null);
INSERT INTO `js_sys_area` VALUES ('450703', '450700', '0,450000,450700,', '21320', '0000000200,0000002270,0000021320,', '1', '2', '广西壮族自治区/钦州市/钦北区', '钦北区', '3', '0', 'system', '2018-03-11 16:00:08', 'system', '2018-03-11 16:00:08', null);
INSERT INTO `js_sys_area` VALUES ('450721', '450700', '0,450000,450700,', '21330', '0000000200,0000002270,0000021330,', '1', '2', '广西壮族自治区/钦州市/灵山县', '灵山县', '3', '0', 'system', '2018-03-11 16:00:08', 'system', '2018-03-11 16:00:08', null);
INSERT INTO `js_sys_area` VALUES ('450722', '450700', '0,450000,450700,', '21340', '0000000200,0000002270,0000021340,', '1', '2', '广西壮族自治区/钦州市/浦北县', '浦北县', '3', '0', 'system', '2018-03-11 16:00:08', 'system', '2018-03-11 16:00:08', null);
INSERT INTO `js_sys_area` VALUES ('450800', '450000', '0,450000,', '2280', '0000000200,0000002280,', '0', '1', '广西壮族自治区/贵港市', '贵港市', '2', '0', 'system', '2018-03-11 16:00:08', 'system', '2018-03-11 16:00:08', null);
INSERT INTO `js_sys_area` VALUES ('450801', '450800', '0,450000,450800,', '21350', '0000000200,0000002280,0000021350,', '1', '2', '广西壮族自治区/贵港市/市辖区', '市辖区', '3', '0', 'system', '2018-03-11 16:00:08', 'system', '2018-03-11 16:00:08', null);
INSERT INTO `js_sys_area` VALUES ('450802', '450800', '0,450000,450800,', '21360', '0000000200,0000002280,0000021360,', '1', '2', '广西壮族自治区/贵港市/港北区', '港北区', '3', '0', 'system', '2018-03-11 16:00:08', 'system', '2018-03-11 16:00:08', null);
INSERT INTO `js_sys_area` VALUES ('450803', '450800', '0,450000,450800,', '21370', '0000000200,0000002280,0000021370,', '1', '2', '广西壮族自治区/贵港市/港南区', '港南区', '3', '0', 'system', '2018-03-11 16:00:08', 'system', '2018-03-11 16:00:08', null);
INSERT INTO `js_sys_area` VALUES ('450804', '450800', '0,450000,450800,', '21380', '0000000200,0000002280,0000021380,', '1', '2', '广西壮族自治区/贵港市/覃塘区', '覃塘区', '3', '0', 'system', '2018-03-11 16:00:08', 'system', '2018-03-11 16:00:08', null);
INSERT INTO `js_sys_area` VALUES ('450821', '450800', '0,450000,450800,', '21390', '0000000200,0000002280,0000021390,', '1', '2', '广西壮族自治区/贵港市/平南县', '平南县', '3', '0', 'system', '2018-03-11 16:00:08', 'system', '2018-03-11 16:00:08', null);
INSERT INTO `js_sys_area` VALUES ('450881', '450800', '0,450000,450800,', '21400', '0000000200,0000002280,0000021400,', '1', '2', '广西壮族自治区/贵港市/桂平市', '桂平市', '3', '0', 'system', '2018-03-11 16:00:08', 'system', '2018-03-11 16:00:08', null);
INSERT INTO `js_sys_area` VALUES ('450900', '450000', '0,450000,', '2290', '0000000200,0000002290,', '0', '1', '广西壮族自治区/玉林市', '玉林市', '2', '0', 'system', '2018-03-11 16:00:08', 'system', '2018-03-11 16:00:08', null);
INSERT INTO `js_sys_area` VALUES ('450901', '450900', '0,450000,450900,', '21410', '0000000200,0000002290,0000021410,', '1', '2', '广西壮族自治区/玉林市/市辖区', '市辖区', '3', '0', 'system', '2018-03-11 16:00:08', 'system', '2018-03-11 16:00:08', null);
INSERT INTO `js_sys_area` VALUES ('450902', '450900', '0,450000,450900,', '21420', '0000000200,0000002290,0000021420,', '1', '2', '广西壮族自治区/玉林市/玉州区', '玉州区', '3', '0', 'system', '2018-03-11 16:00:08', 'system', '2018-03-11 16:00:08', null);
INSERT INTO `js_sys_area` VALUES ('450921', '450900', '0,450000,450900,', '21430', '0000000200,0000002290,0000021430,', '1', '2', '广西壮族自治区/玉林市/容　县', '容　县', '3', '0', 'system', '2018-03-11 16:00:08', 'system', '2018-03-11 16:00:08', null);
INSERT INTO `js_sys_area` VALUES ('450922', '450900', '0,450000,450900,', '21440', '0000000200,0000002290,0000021440,', '1', '2', '广西壮族自治区/玉林市/陆川县', '陆川县', '3', '0', 'system', '2018-03-11 16:00:08', 'system', '2018-03-11 16:00:08', null);
INSERT INTO `js_sys_area` VALUES ('450923', '450900', '0,450000,450900,', '21450', '0000000200,0000002290,0000021450,', '1', '2', '广西壮族自治区/玉林市/博白县', '博白县', '3', '0', 'system', '2018-03-11 16:00:08', 'system', '2018-03-11 16:00:08', null);
INSERT INTO `js_sys_area` VALUES ('450924', '450900', '0,450000,450900,', '21460', '0000000200,0000002290,0000021460,', '1', '2', '广西壮族自治区/玉林市/兴业县', '兴业县', '3', '0', 'system', '2018-03-11 16:00:08', 'system', '2018-03-11 16:00:08', null);
INSERT INTO `js_sys_area` VALUES ('450981', '450900', '0,450000,450900,', '21470', '0000000200,0000002290,0000021470,', '1', '2', '广西壮族自治区/玉林市/北流市', '北流市', '3', '0', 'system', '2018-03-11 16:00:08', 'system', '2018-03-11 16:00:08', null);
INSERT INTO `js_sys_area` VALUES ('451000', '450000', '0,450000,', '2300', '0000000200,0000002300,', '0', '1', '广西壮族自治区/百色市', '百色市', '2', '0', 'system', '2018-03-11 16:00:08', 'system', '2018-03-11 16:00:08', null);
INSERT INTO `js_sys_area` VALUES ('451001', '451000', '0,450000,451000,', '21480', '0000000200,0000002300,0000021480,', '1', '2', '广西壮族自治区/百色市/市辖区', '市辖区', '3', '0', 'system', '2018-03-11 16:00:08', 'system', '2018-03-11 16:00:08', null);
INSERT INTO `js_sys_area` VALUES ('451002', '451000', '0,450000,451000,', '21490', '0000000200,0000002300,0000021490,', '1', '2', '广西壮族自治区/百色市/右江区', '右江区', '3', '0', 'system', '2018-03-11 16:00:08', 'system', '2018-03-11 16:00:08', null);
INSERT INTO `js_sys_area` VALUES ('451021', '451000', '0,450000,451000,', '21500', '0000000200,0000002300,0000021500,', '1', '2', '广西壮族自治区/百色市/田阳县', '田阳县', '3', '0', 'system', '2018-03-11 16:00:09', 'system', '2018-03-11 16:00:09', null);
INSERT INTO `js_sys_area` VALUES ('451022', '451000', '0,450000,451000,', '21510', '0000000200,0000002300,0000021510,', '1', '2', '广西壮族自治区/百色市/田东县', '田东县', '3', '0', 'system', '2018-03-11 16:00:09', 'system', '2018-03-11 16:00:09', null);
INSERT INTO `js_sys_area` VALUES ('451023', '451000', '0,450000,451000,', '21520', '0000000200,0000002300,0000021520,', '1', '2', '广西壮族自治区/百色市/平果县', '平果县', '3', '0', 'system', '2018-03-11 16:00:09', 'system', '2018-03-11 16:00:09', null);
INSERT INTO `js_sys_area` VALUES ('451024', '451000', '0,450000,451000,', '21530', '0000000200,0000002300,0000021530,', '1', '2', '广西壮族自治区/百色市/德保县', '德保县', '3', '0', 'system', '2018-03-11 16:00:09', 'system', '2018-03-11 16:00:09', null);
INSERT INTO `js_sys_area` VALUES ('451025', '451000', '0,450000,451000,', '21540', '0000000200,0000002300,0000021540,', '1', '2', '广西壮族自治区/百色市/靖西县', '靖西县', '3', '0', 'system', '2018-03-11 16:00:09', 'system', '2018-03-11 16:00:09', null);
INSERT INTO `js_sys_area` VALUES ('451026', '451000', '0,450000,451000,', '21550', '0000000200,0000002300,0000021550,', '1', '2', '广西壮族自治区/百色市/那坡县', '那坡县', '3', '0', 'system', '2018-03-11 16:00:09', 'system', '2018-03-11 16:00:09', null);
INSERT INTO `js_sys_area` VALUES ('451027', '451000', '0,450000,451000,', '21560', '0000000200,0000002300,0000021560,', '1', '2', '广西壮族自治区/百色市/凌云县', '凌云县', '3', '0', 'system', '2018-03-11 16:00:09', 'system', '2018-03-11 16:00:09', null);
INSERT INTO `js_sys_area` VALUES ('451028', '451000', '0,450000,451000,', '21570', '0000000200,0000002300,0000021570,', '1', '2', '广西壮族自治区/百色市/乐业县', '乐业县', '3', '0', 'system', '2018-03-11 16:00:09', 'system', '2018-03-11 16:00:09', null);
INSERT INTO `js_sys_area` VALUES ('451029', '451000', '0,450000,451000,', '21580', '0000000200,0000002300,0000021580,', '1', '2', '广西壮族自治区/百色市/田林县', '田林县', '3', '0', 'system', '2018-03-11 16:00:09', 'system', '2018-03-11 16:00:09', null);
INSERT INTO `js_sys_area` VALUES ('451030', '451000', '0,450000,451000,', '21590', '0000000200,0000002300,0000021590,', '1', '2', '广西壮族自治区/百色市/西林县', '西林县', '3', '0', 'system', '2018-03-11 16:00:09', 'system', '2018-03-11 16:00:09', null);
INSERT INTO `js_sys_area` VALUES ('451031', '451000', '0,450000,451000,', '21600', '0000000200,0000002300,0000021600,', '1', '2', '广西壮族自治区/百色市/隆林各族自治县', '隆林各族自治县', '3', '0', 'system', '2018-03-11 16:00:09', 'system', '2018-03-11 16:00:09', null);
INSERT INTO `js_sys_area` VALUES ('451100', '450000', '0,450000,', '2310', '0000000200,0000002310,', '0', '1', '广西壮族自治区/贺州市', '贺州市', '2', '0', 'system', '2018-03-11 16:00:09', 'system', '2018-03-11 16:00:09', null);
INSERT INTO `js_sys_area` VALUES ('451101', '451100', '0,450000,451100,', '21610', '0000000200,0000002310,0000021610,', '1', '2', '广西壮族自治区/贺州市/市辖区', '市辖区', '3', '0', 'system', '2018-03-11 16:00:09', 'system', '2018-03-11 16:00:09', null);
INSERT INTO `js_sys_area` VALUES ('451102', '451100', '0,450000,451100,', '21620', '0000000200,0000002310,0000021620,', '1', '2', '广西壮族自治区/贺州市/八步区', '八步区', '3', '0', 'system', '2018-03-11 16:00:09', 'system', '2018-03-11 16:00:09', null);
INSERT INTO `js_sys_area` VALUES ('451121', '451100', '0,450000,451100,', '21630', '0000000200,0000002310,0000021630,', '1', '2', '广西壮族自治区/贺州市/昭平县', '昭平县', '3', '0', 'system', '2018-03-11 16:00:09', 'system', '2018-03-11 16:00:09', null);
INSERT INTO `js_sys_area` VALUES ('451122', '451100', '0,450000,451100,', '21640', '0000000200,0000002310,0000021640,', '1', '2', '广西壮族自治区/贺州市/钟山县', '钟山县', '3', '0', 'system', '2018-03-11 16:00:09', 'system', '2018-03-11 16:00:09', null);
INSERT INTO `js_sys_area` VALUES ('451123', '451100', '0,450000,451100,', '21650', '0000000200,0000002310,0000021650,', '1', '2', '广西壮族自治区/贺州市/富川瑶族自治县', '富川瑶族自治县', '3', '0', 'system', '2018-03-11 16:00:09', 'system', '2018-03-11 16:00:09', null);
INSERT INTO `js_sys_area` VALUES ('451200', '450000', '0,450000,', '2320', '0000000200,0000002320,', '0', '1', '广西壮族自治区/河池市', '河池市', '2', '0', 'system', '2018-03-11 16:00:09', 'system', '2018-03-11 16:00:09', null);
INSERT INTO `js_sys_area` VALUES ('451201', '451200', '0,450000,451200,', '21660', '0000000200,0000002320,0000021660,', '1', '2', '广西壮族自治区/河池市/市辖区', '市辖区', '3', '0', 'system', '2018-03-11 16:00:09', 'system', '2018-03-11 16:00:09', null);
INSERT INTO `js_sys_area` VALUES ('451202', '451200', '0,450000,451200,', '21670', '0000000200,0000002320,0000021670,', '1', '2', '广西壮族自治区/河池市/金城江区', '金城江区', '3', '0', 'system', '2018-03-11 16:00:09', 'system', '2018-03-11 16:00:09', null);
INSERT INTO `js_sys_area` VALUES ('451221', '451200', '0,450000,451200,', '21680', '0000000200,0000002320,0000021680,', '1', '2', '广西壮族自治区/河池市/南丹县', '南丹县', '3', '0', 'system', '2018-03-11 16:00:09', 'system', '2018-03-11 16:00:09', null);
INSERT INTO `js_sys_area` VALUES ('451222', '451200', '0,450000,451200,', '21690', '0000000200,0000002320,0000021690,', '1', '2', '广西壮族自治区/河池市/天峨县', '天峨县', '3', '0', 'system', '2018-03-11 16:00:09', 'system', '2018-03-11 16:00:09', null);
INSERT INTO `js_sys_area` VALUES ('451223', '451200', '0,450000,451200,', '21700', '0000000200,0000002320,0000021700,', '1', '2', '广西壮族自治区/河池市/凤山县', '凤山县', '3', '0', 'system', '2018-03-11 16:00:09', 'system', '2018-03-11 16:00:09', null);
INSERT INTO `js_sys_area` VALUES ('451224', '451200', '0,450000,451200,', '21710', '0000000200,0000002320,0000021710,', '1', '2', '广西壮族自治区/河池市/东兰县', '东兰县', '3', '0', 'system', '2018-03-11 16:00:09', 'system', '2018-03-11 16:00:09', null);
INSERT INTO `js_sys_area` VALUES ('451225', '451200', '0,450000,451200,', '21720', '0000000200,0000002320,0000021720,', '1', '2', '广西壮族自治区/河池市/罗城仫佬族自治县', '罗城仫佬族自治县', '3', '0', 'system', '2018-03-11 16:00:09', 'system', '2018-03-11 16:00:09', null);
INSERT INTO `js_sys_area` VALUES ('451226', '451200', '0,450000,451200,', '21730', '0000000200,0000002320,0000021730,', '1', '2', '广西壮族自治区/河池市/环江毛南族自治县', '环江毛南族自治县', '3', '0', 'system', '2018-03-11 16:00:09', 'system', '2018-03-11 16:00:09', null);
INSERT INTO `js_sys_area` VALUES ('451227', '451200', '0,450000,451200,', '21740', '0000000200,0000002320,0000021740,', '1', '2', '广西壮族自治区/河池市/巴马瑶族自治县', '巴马瑶族自治县', '3', '0', 'system', '2018-03-11 16:00:09', 'system', '2018-03-11 16:00:09', null);
INSERT INTO `js_sys_area` VALUES ('451228', '451200', '0,450000,451200,', '21750', '0000000200,0000002320,0000021750,', '1', '2', '广西壮族自治区/河池市/都安瑶族自治县', '都安瑶族自治县', '3', '0', 'system', '2018-03-11 16:00:09', 'system', '2018-03-11 16:00:09', null);
INSERT INTO `js_sys_area` VALUES ('451229', '451200', '0,450000,451200,', '21760', '0000000200,0000002320,0000021760,', '1', '2', '广西壮族自治区/河池市/大化瑶族自治县', '大化瑶族自治县', '3', '0', 'system', '2018-03-11 16:00:09', 'system', '2018-03-11 16:00:09', null);
INSERT INTO `js_sys_area` VALUES ('451281', '451200', '0,450000,451200,', '21770', '0000000200,0000002320,0000021770,', '1', '2', '广西壮族自治区/河池市/宜州市', '宜州市', '3', '0', 'system', '2018-03-11 16:00:09', 'system', '2018-03-11 16:00:09', null);
INSERT INTO `js_sys_area` VALUES ('451300', '450000', '0,450000,', '2330', '0000000200,0000002330,', '0', '1', '广西壮族自治区/来宾市', '来宾市', '2', '0', 'system', '2018-03-11 16:00:09', 'system', '2018-03-11 16:00:09', null);
INSERT INTO `js_sys_area` VALUES ('451301', '451300', '0,450000,451300,', '21780', '0000000200,0000002330,0000021780,', '1', '2', '广西壮族自治区/来宾市/市辖区', '市辖区', '3', '0', 'system', '2018-03-11 16:00:09', 'system', '2018-03-11 16:00:09', null);
INSERT INTO `js_sys_area` VALUES ('451302', '451300', '0,450000,451300,', '21790', '0000000200,0000002330,0000021790,', '1', '2', '广西壮族自治区/来宾市/兴宾区', '兴宾区', '3', '0', 'system', '2018-03-11 16:00:09', 'system', '2018-03-11 16:00:09', null);
INSERT INTO `js_sys_area` VALUES ('451321', '451300', '0,450000,451300,', '21800', '0000000200,0000002330,0000021800,', '1', '2', '广西壮族自治区/来宾市/忻城县', '忻城县', '3', '0', 'system', '2018-03-11 16:00:09', 'system', '2018-03-11 16:00:09', null);
INSERT INTO `js_sys_area` VALUES ('451322', '451300', '0,450000,451300,', '21810', '0000000200,0000002330,0000021810,', '1', '2', '广西壮族自治区/来宾市/象州县', '象州县', '3', '0', 'system', '2018-03-11 16:00:09', 'system', '2018-03-11 16:00:09', null);
INSERT INTO `js_sys_area` VALUES ('451323', '451300', '0,450000,451300,', '21820', '0000000200,0000002330,0000021820,', '1', '2', '广西壮族自治区/来宾市/武宣县', '武宣县', '3', '0', 'system', '2018-03-11 16:00:09', 'system', '2018-03-11 16:00:09', null);
INSERT INTO `js_sys_area` VALUES ('451324', '451300', '0,450000,451300,', '21830', '0000000200,0000002330,0000021830,', '1', '2', '广西壮族自治区/来宾市/金秀瑶族自治县', '金秀瑶族自治县', '3', '0', 'system', '2018-03-11 16:00:09', 'system', '2018-03-11 16:00:09', null);
INSERT INTO `js_sys_area` VALUES ('451381', '451300', '0,450000,451300,', '21840', '0000000200,0000002330,0000021840,', '1', '2', '广西壮族自治区/来宾市/合山市', '合山市', '3', '0', 'system', '2018-03-11 16:00:09', 'system', '2018-03-11 16:00:09', null);
INSERT INTO `js_sys_area` VALUES ('451400', '450000', '0,450000,', '2340', '0000000200,0000002340,', '0', '1', '广西壮族自治区/崇左市', '崇左市', '2', '0', 'system', '2018-03-11 16:00:09', 'system', '2018-03-11 16:00:09', null);
INSERT INTO `js_sys_area` VALUES ('451401', '451400', '0,450000,451400,', '21850', '0000000200,0000002340,0000021850,', '1', '2', '广西壮族自治区/崇左市/市辖区', '市辖区', '3', '0', 'system', '2018-03-11 16:00:09', 'system', '2018-03-11 16:00:09', null);
INSERT INTO `js_sys_area` VALUES ('451402', '451400', '0,450000,451400,', '21860', '0000000200,0000002340,0000021860,', '1', '2', '广西壮族自治区/崇左市/江洲区', '江洲区', '3', '0', 'system', '2018-03-11 16:00:09', 'system', '2018-03-11 16:00:09', null);
INSERT INTO `js_sys_area` VALUES ('451421', '451400', '0,450000,451400,', '21870', '0000000200,0000002340,0000021870,', '1', '2', '广西壮族自治区/崇左市/扶绥县', '扶绥县', '3', '0', 'system', '2018-03-11 16:00:09', 'system', '2018-03-11 16:00:09', null);
INSERT INTO `js_sys_area` VALUES ('451422', '451400', '0,450000,451400,', '21880', '0000000200,0000002340,0000021880,', '1', '2', '广西壮族自治区/崇左市/宁明县', '宁明县', '3', '0', 'system', '2018-03-11 16:00:09', 'system', '2018-03-11 16:00:09', null);
INSERT INTO `js_sys_area` VALUES ('451423', '451400', '0,450000,451400,', '21890', '0000000200,0000002340,0000021890,', '1', '2', '广西壮族自治区/崇左市/龙州县', '龙州县', '3', '0', 'system', '2018-03-11 16:00:09', 'system', '2018-03-11 16:00:09', null);
INSERT INTO `js_sys_area` VALUES ('451424', '451400', '0,450000,451400,', '21900', '0000000200,0000002340,0000021900,', '1', '2', '广西壮族自治区/崇左市/大新县', '大新县', '3', '0', 'system', '2018-03-11 16:00:09', 'system', '2018-03-11 16:00:09', null);
INSERT INTO `js_sys_area` VALUES ('451425', '451400', '0,450000,451400,', '21910', '0000000200,0000002340,0000021910,', '1', '2', '广西壮族自治区/崇左市/天等县', '天等县', '3', '0', 'system', '2018-03-11 16:00:09', 'system', '2018-03-11 16:00:09', null);
INSERT INTO `js_sys_area` VALUES ('451481', '451400', '0,450000,451400,', '21920', '0000000200,0000002340,0000021920,', '1', '2', '广西壮族自治区/崇左市/凭祥市', '凭祥市', '3', '0', 'system', '2018-03-11 16:00:09', 'system', '2018-03-11 16:00:09', null);
INSERT INTO `js_sys_area` VALUES ('460000', '0', '0,', '210', '0000000210,', '0', '0', '海南省', '海南省', '1', '0', 'system', '2018-03-11 16:00:09', 'system', '2018-03-11 16:00:09', null);
INSERT INTO `js_sys_area` VALUES ('460100', '460000', '0,460000,', '2350', '0000000210,0000002350,', '0', '1', '海南省/海口市', '海口市', '2', '0', 'system', '2018-03-11 16:00:09', 'system', '2018-03-11 16:00:09', null);
INSERT INTO `js_sys_area` VALUES ('460101', '460100', '0,460000,460100,', '21930', '0000000210,0000002350,0000021930,', '1', '2', '海南省/海口市/市辖区', '市辖区', '3', '0', 'system', '2018-03-11 16:00:09', 'system', '2018-03-11 16:00:09', null);
INSERT INTO `js_sys_area` VALUES ('460105', '460100', '0,460000,460100,', '21940', '0000000210,0000002350,0000021940,', '1', '2', '海南省/海口市/秀英区', '秀英区', '3', '0', 'system', '2018-03-11 16:00:09', 'system', '2018-03-11 16:00:09', null);
INSERT INTO `js_sys_area` VALUES ('460106', '460100', '0,460000,460100,', '21950', '0000000210,0000002350,0000021950,', '1', '2', '海南省/海口市/龙华区', '龙华区', '3', '0', 'system', '2018-03-11 16:00:09', 'system', '2018-03-11 16:00:09', null);
INSERT INTO `js_sys_area` VALUES ('460107', '460100', '0,460000,460100,', '21960', '0000000210,0000002350,0000021960,', '1', '2', '海南省/海口市/琼山区', '琼山区', '3', '0', 'system', '2018-03-11 16:00:09', 'system', '2018-03-11 16:00:09', null);
INSERT INTO `js_sys_area` VALUES ('460108', '460100', '0,460000,460100,', '21970', '0000000210,0000002350,0000021970,', '1', '2', '海南省/海口市/美兰区', '美兰区', '3', '0', 'system', '2018-03-11 16:00:09', 'system', '2018-03-11 16:00:09', null);
INSERT INTO `js_sys_area` VALUES ('460200', '460000', '0,460000,', '2360', '0000000210,0000002360,', '0', '1', '海南省/三亚市', '三亚市', '2', '0', 'system', '2018-03-11 16:00:09', 'system', '2018-03-11 16:00:09', null);
INSERT INTO `js_sys_area` VALUES ('460201', '460200', '0,460000,460200,', '21980', '0000000210,0000002360,0000021980,', '1', '2', '海南省/三亚市/市辖区', '市辖区', '3', '0', 'system', '2018-03-11 16:00:09', 'system', '2018-03-11 16:00:09', null);
INSERT INTO `js_sys_area` VALUES ('469000', '460000', '0,460000,', '2370', '0000000210,0000002370,', '0', '1', '海南省/省直辖县级行政单位', '省直辖县级行政单位', '2', '0', 'system', '2018-03-11 16:00:09', 'system', '2018-03-11 16:00:09', null);
INSERT INTO `js_sys_area` VALUES ('469001', '469000', '0,460000,469000,', '21990', '0000000210,0000002370,0000021990,', '1', '2', '海南省/省直辖县级行政单位/五指山市', '五指山市', '3', '0', 'system', '2018-03-11 16:00:09', 'system', '2018-03-11 16:00:09', null);
INSERT INTO `js_sys_area` VALUES ('469002', '469000', '0,460000,469000,', '22000', '0000000210,0000002370,0000022000,', '1', '2', '海南省/省直辖县级行政单位/琼海市', '琼海市', '3', '0', 'system', '2018-03-11 16:00:09', 'system', '2018-03-11 16:00:09', null);
INSERT INTO `js_sys_area` VALUES ('469003', '469000', '0,460000,469000,', '22010', '0000000210,0000002370,0000022010,', '1', '2', '海南省/省直辖县级行政单位/儋州市', '儋州市', '3', '0', 'system', '2018-03-11 16:00:09', 'system', '2018-03-11 16:00:09', null);
INSERT INTO `js_sys_area` VALUES ('469005', '469000', '0,460000,469000,', '22020', '0000000210,0000002370,0000022020,', '1', '2', '海南省/省直辖县级行政单位/文昌市', '文昌市', '3', '0', 'system', '2018-03-11 16:00:10', 'system', '2018-03-11 16:00:10', null);
INSERT INTO `js_sys_area` VALUES ('469006', '469000', '0,460000,469000,', '22030', '0000000210,0000002370,0000022030,', '1', '2', '海南省/省直辖县级行政单位/万宁市', '万宁市', '3', '0', 'system', '2018-03-11 16:00:10', 'system', '2018-03-11 16:00:10', null);
INSERT INTO `js_sys_area` VALUES ('469007', '469000', '0,460000,469000,', '22040', '0000000210,0000002370,0000022040,', '1', '2', '海南省/省直辖县级行政单位/东方市', '东方市', '3', '0', 'system', '2018-03-11 16:00:10', 'system', '2018-03-11 16:00:10', null);
INSERT INTO `js_sys_area` VALUES ('469025', '469000', '0,460000,469000,', '22050', '0000000210,0000002370,0000022050,', '1', '2', '海南省/省直辖县级行政单位/定安县', '定安县', '3', '0', 'system', '2018-03-11 16:00:10', 'system', '2018-03-11 16:00:10', null);
INSERT INTO `js_sys_area` VALUES ('469026', '469000', '0,460000,469000,', '22060', '0000000210,0000002370,0000022060,', '1', '2', '海南省/省直辖县级行政单位/屯昌县', '屯昌县', '3', '0', 'system', '2018-03-11 16:00:10', 'system', '2018-03-11 16:00:10', null);
INSERT INTO `js_sys_area` VALUES ('469027', '469000', '0,460000,469000,', '22070', '0000000210,0000002370,0000022070,', '1', '2', '海南省/省直辖县级行政单位/澄迈县', '澄迈县', '3', '0', 'system', '2018-03-11 16:00:10', 'system', '2018-03-11 16:00:10', null);
INSERT INTO `js_sys_area` VALUES ('469028', '469000', '0,460000,469000,', '22080', '0000000210,0000002370,0000022080,', '1', '2', '海南省/省直辖县级行政单位/临高县', '临高县', '3', '0', 'system', '2018-03-11 16:00:10', 'system', '2018-03-11 16:00:10', null);
INSERT INTO `js_sys_area` VALUES ('469030', '469000', '0,460000,469000,', '22090', '0000000210,0000002370,0000022090,', '1', '2', '海南省/省直辖县级行政单位/白沙黎族自治县', '白沙黎族自治县', '3', '0', 'system', '2018-03-11 16:00:10', 'system', '2018-03-11 16:00:10', null);
INSERT INTO `js_sys_area` VALUES ('469031', '469000', '0,460000,469000,', '22100', '0000000210,0000002370,0000022100,', '1', '2', '海南省/省直辖县级行政单位/昌江黎族自治县', '昌江黎族自治县', '3', '0', 'system', '2018-03-11 16:00:10', 'system', '2018-03-11 16:00:10', null);
INSERT INTO `js_sys_area` VALUES ('469033', '469000', '0,460000,469000,', '22110', '0000000210,0000002370,0000022110,', '1', '2', '海南省/省直辖县级行政单位/乐东黎族自治县', '乐东黎族自治县', '3', '0', 'system', '2018-03-11 16:00:10', 'system', '2018-03-11 16:00:10', null);
INSERT INTO `js_sys_area` VALUES ('469034', '469000', '0,460000,469000,', '22120', '0000000210,0000002370,0000022120,', '1', '2', '海南省/省直辖县级行政单位/陵水黎族自治县', '陵水黎族自治县', '3', '0', 'system', '2018-03-11 16:00:10', 'system', '2018-03-11 16:00:10', null);
INSERT INTO `js_sys_area` VALUES ('469035', '469000', '0,460000,469000,', '22130', '0000000210,0000002370,0000022130,', '1', '2', '海南省/省直辖县级行政单位/保亭黎族苗族自治县', '保亭黎族苗族自治县', '3', '0', 'system', '2018-03-11 16:00:10', 'system', '2018-03-11 16:00:10', null);
INSERT INTO `js_sys_area` VALUES ('469036', '469000', '0,460000,469000,', '22140', '0000000210,0000002370,0000022140,', '1', '2', '海南省/省直辖县级行政单位/琼中黎族苗族自治县', '琼中黎族苗族自治县', '3', '0', 'system', '2018-03-11 16:00:10', 'system', '2018-03-11 16:00:10', null);
INSERT INTO `js_sys_area` VALUES ('469037', '469000', '0,460000,469000,', '22150', '0000000210,0000002370,0000022150,', '1', '2', '海南省/省直辖县级行政单位/西沙群岛', '西沙群岛', '3', '0', 'system', '2018-03-11 16:00:10', 'system', '2018-03-11 16:00:10', null);
INSERT INTO `js_sys_area` VALUES ('469038', '469000', '0,460000,469000,', '22160', '0000000210,0000002370,0000022160,', '1', '2', '海南省/省直辖县级行政单位/南沙群岛', '南沙群岛', '3', '0', 'system', '2018-03-11 16:00:10', 'system', '2018-03-11 16:00:10', null);
INSERT INTO `js_sys_area` VALUES ('500000', '0', '0,', '220', '0000000220,', '0', '0', '重庆市', '重庆市', '1', '0', 'system', '2018-03-11 16:00:10', 'system', '2018-03-11 16:00:10', null);
INSERT INTO `js_sys_area` VALUES ('500100', '500000', '0,500000,', '2380', '0000000220,0000002380,', '0', '1', '重庆市/市辖区', '市辖区', '2', '0', 'system', '2018-03-11 16:00:10', 'system', '2018-03-11 16:00:10', null);
INSERT INTO `js_sys_area` VALUES ('500101', '500100', '0,500000,500100,', '22180', '0000000220,0000002380,0000022180,', '1', '2', '重庆市/市辖区/万州区', '万州区', '3', '0', 'system', '2018-03-11 16:00:10', 'system', '2018-03-11 16:00:10', null);
INSERT INTO `js_sys_area` VALUES ('500102', '500100', '0,500000,500100,', '22190', '0000000220,0000002380,0000022190,', '1', '2', '重庆市/市辖区/涪陵区', '涪陵区', '3', '0', 'system', '2018-03-11 16:00:10', 'system', '2018-03-11 16:00:10', null);
INSERT INTO `js_sys_area` VALUES ('500103', '500100', '0,500000,500100,', '22200', '0000000220,0000002380,0000022200,', '1', '2', '重庆市/市辖区/渝中区', '渝中区', '3', '0', 'system', '2018-03-11 16:00:10', 'system', '2018-03-11 16:00:10', null);
INSERT INTO `js_sys_area` VALUES ('500104', '500100', '0,500000,500100,', '22210', '0000000220,0000002380,0000022210,', '1', '2', '重庆市/市辖区/大渡口区', '大渡口区', '3', '0', 'system', '2018-03-11 16:00:10', 'system', '2018-03-11 16:00:10', null);
INSERT INTO `js_sys_area` VALUES ('500105', '500100', '0,500000,500100,', '22220', '0000000220,0000002380,0000022220,', '1', '2', '重庆市/市辖区/江北区', '江北区', '3', '0', 'system', '2018-03-11 16:00:10', 'system', '2018-03-11 16:00:10', null);
INSERT INTO `js_sys_area` VALUES ('500106', '500100', '0,500000,500100,', '22230', '0000000220,0000002380,0000022230,', '1', '2', '重庆市/市辖区/沙坪坝区', '沙坪坝区', '3', '0', 'system', '2018-03-11 16:00:10', 'system', '2018-03-11 16:00:10', null);
INSERT INTO `js_sys_area` VALUES ('500107', '500100', '0,500000,500100,', '22240', '0000000220,0000002380,0000022240,', '1', '2', '重庆市/市辖区/九龙坡区', '九龙坡区', '3', '0', 'system', '2018-03-11 16:00:10', 'system', '2018-03-11 16:00:10', null);
INSERT INTO `js_sys_area` VALUES ('500108', '500100', '0,500000,500100,', '22250', '0000000220,0000002380,0000022250,', '1', '2', '重庆市/市辖区/南岸区', '南岸区', '3', '0', 'system', '2018-03-11 16:00:10', 'system', '2018-03-11 16:00:10', null);
INSERT INTO `js_sys_area` VALUES ('500109', '500100', '0,500000,500100,', '22260', '0000000220,0000002380,0000022260,', '1', '2', '重庆市/市辖区/北碚区', '北碚区', '3', '0', 'system', '2018-03-11 16:00:10', 'system', '2018-03-11 16:00:10', null);
INSERT INTO `js_sys_area` VALUES ('500110', '500100', '0,500000,500100,', '22270', '0000000220,0000002380,0000022270,', '1', '2', '重庆市/市辖区/万盛区', '万盛区', '3', '0', 'system', '2018-03-11 16:00:10', 'system', '2018-03-11 16:00:10', null);
INSERT INTO `js_sys_area` VALUES ('500111', '500100', '0,500000,500100,', '22280', '0000000220,0000002380,0000022280,', '1', '2', '重庆市/市辖区/双桥区', '双桥区', '3', '0', 'system', '2018-03-11 16:00:10', 'system', '2018-03-11 16:00:10', null);
INSERT INTO `js_sys_area` VALUES ('500112', '500100', '0,500000,500100,', '22290', '0000000220,0000002380,0000022290,', '1', '2', '重庆市/市辖区/渝北区', '渝北区', '3', '0', 'system', '2018-03-11 16:00:10', 'system', '2018-03-11 16:00:10', null);
INSERT INTO `js_sys_area` VALUES ('500113', '500100', '0,500000,500100,', '22300', '0000000220,0000002380,0000022300,', '1', '2', '重庆市/市辖区/巴南区', '巴南区', '3', '0', 'system', '2018-03-11 16:00:10', 'system', '2018-03-11 16:00:10', null);
INSERT INTO `js_sys_area` VALUES ('500114', '500100', '0,500000,500100,', '22310', '0000000220,0000002380,0000022310,', '1', '2', '重庆市/市辖区/黔江区', '黔江区', '3', '0', 'system', '2018-03-11 16:00:10', 'system', '2018-03-11 16:00:10', null);
INSERT INTO `js_sys_area` VALUES ('500115', '500100', '0,500000,500100,', '22320', '0000000220,0000002380,0000022320,', '1', '2', '重庆市/市辖区/长寿区', '长寿区', '3', '0', 'system', '2018-03-11 16:00:10', 'system', '2018-03-11 16:00:10', null);
INSERT INTO `js_sys_area` VALUES ('500200', '500000', '0,500000,', '2390', '0000000220,0000002390,', '0', '1', '重庆市/县', '县', '2', '0', 'system', '2018-03-11 16:00:10', 'system', '2018-03-11 16:00:10', null);
INSERT INTO `js_sys_area` VALUES ('500222', '500200', '0,500000,500200,', '22330', '0000000220,0000002390,0000022330,', '1', '2', '重庆市/县/綦江县', '綦江县', '3', '0', 'system', '2018-03-11 16:00:10', 'system', '2018-03-11 16:00:10', null);
INSERT INTO `js_sys_area` VALUES ('500223', '500200', '0,500000,500200,', '22340', '0000000220,0000002390,0000022340,', '1', '2', '重庆市/县/潼南县', '潼南县', '3', '0', 'system', '2018-03-11 16:00:10', 'system', '2018-03-11 16:00:10', null);
INSERT INTO `js_sys_area` VALUES ('500224', '500200', '0,500000,500200,', '22350', '0000000220,0000002390,0000022350,', '1', '2', '重庆市/县/铜梁县', '铜梁县', '3', '0', 'system', '2018-03-11 16:00:10', 'system', '2018-03-11 16:00:10', null);
INSERT INTO `js_sys_area` VALUES ('500225', '500200', '0,500000,500200,', '22360', '0000000220,0000002390,0000022360,', '1', '2', '重庆市/县/大足县', '大足县', '3', '0', 'system', '2018-03-11 16:00:10', 'system', '2018-03-11 16:00:10', null);
INSERT INTO `js_sys_area` VALUES ('500226', '500200', '0,500000,500200,', '22370', '0000000220,0000002390,0000022370,', '1', '2', '重庆市/县/荣昌县', '荣昌县', '3', '0', 'system', '2018-03-11 16:00:10', 'system', '2018-03-11 16:00:10', null);
INSERT INTO `js_sys_area` VALUES ('500227', '500200', '0,500000,500200,', '22380', '0000000220,0000002390,0000022380,', '1', '2', '重庆市/县/璧山县', '璧山县', '3', '0', 'system', '2018-03-11 16:00:10', 'system', '2018-03-11 16:00:10', null);
INSERT INTO `js_sys_area` VALUES ('500228', '500200', '0,500000,500200,', '22390', '0000000220,0000002390,0000022390,', '1', '2', '重庆市/县/梁平县', '梁平县', '3', '0', 'system', '2018-03-11 16:00:10', 'system', '2018-03-11 16:00:10', null);
INSERT INTO `js_sys_area` VALUES ('500229', '500200', '0,500000,500200,', '22400', '0000000220,0000002390,0000022400,', '1', '2', '重庆市/县/城口县', '城口县', '3', '0', 'system', '2018-03-11 16:00:10', 'system', '2018-03-11 16:00:10', null);
INSERT INTO `js_sys_area` VALUES ('500230', '500200', '0,500000,500200,', '22410', '0000000220,0000002390,0000022410,', '1', '2', '重庆市/县/丰都县', '丰都县', '3', '0', 'system', '2018-03-11 16:00:10', 'system', '2018-03-11 16:00:10', null);
INSERT INTO `js_sys_area` VALUES ('500231', '500200', '0,500000,500200,', '22420', '0000000220,0000002390,0000022420,', '1', '2', '重庆市/县/垫江县', '垫江县', '3', '0', 'system', '2018-03-11 16:00:10', 'system', '2018-03-11 16:00:10', null);
INSERT INTO `js_sys_area` VALUES ('500232', '500200', '0,500000,500200,', '22430', '0000000220,0000002390,0000022430,', '1', '2', '重庆市/县/武隆县', '武隆县', '3', '0', 'system', '2018-03-11 16:00:10', 'system', '2018-03-11 16:00:10', null);
INSERT INTO `js_sys_area` VALUES ('500233', '500200', '0,500000,500200,', '22440', '0000000220,0000002390,0000022440,', '1', '2', '重庆市/县/忠　县', '忠　县', '3', '0', 'system', '2018-03-11 16:00:10', 'system', '2018-03-11 16:00:10', null);
INSERT INTO `js_sys_area` VALUES ('500234', '500200', '0,500000,500200,', '22450', '0000000220,0000002390,0000022450,', '1', '2', '重庆市/县/开　县', '开　县', '3', '0', 'system', '2018-03-11 16:00:10', 'system', '2018-03-11 16:00:10', null);
INSERT INTO `js_sys_area` VALUES ('500235', '500200', '0,500000,500200,', '22460', '0000000220,0000002390,0000022460,', '1', '2', '重庆市/县/云阳县', '云阳县', '3', '0', 'system', '2018-03-11 16:00:10', 'system', '2018-03-11 16:00:10', null);
INSERT INTO `js_sys_area` VALUES ('500236', '500200', '0,500000,500200,', '22470', '0000000220,0000002390,0000022470,', '1', '2', '重庆市/县/奉节县', '奉节县', '3', '0', 'system', '2018-03-11 16:00:10', 'system', '2018-03-11 16:00:10', null);
INSERT INTO `js_sys_area` VALUES ('500237', '500200', '0,500000,500200,', '22480', '0000000220,0000002390,0000022480,', '1', '2', '重庆市/县/巫山县', '巫山县', '3', '0', 'system', '2018-03-11 16:00:10', 'system', '2018-03-11 16:00:10', null);
INSERT INTO `js_sys_area` VALUES ('500238', '500200', '0,500000,500200,', '22490', '0000000220,0000002390,0000022490,', '1', '2', '重庆市/县/巫溪县', '巫溪县', '3', '0', 'system', '2018-03-11 16:00:10', 'system', '2018-03-11 16:00:10', null);
INSERT INTO `js_sys_area` VALUES ('500240', '500200', '0,500000,500200,', '22500', '0000000220,0000002390,0000022500,', '1', '2', '重庆市/县/石柱土家族自治县', '石柱土家族自治县', '3', '0', 'system', '2018-03-11 16:00:10', 'system', '2018-03-11 16:00:10', null);
INSERT INTO `js_sys_area` VALUES ('500241', '500200', '0,500000,500200,', '22510', '0000000220,0000002390,0000022510,', '1', '2', '重庆市/县/秀山土家族苗族自治县', '秀山土家族苗族自治县', '3', '0', 'system', '2018-03-11 16:00:10', 'system', '2018-03-11 16:00:10', null);
INSERT INTO `js_sys_area` VALUES ('500242', '500200', '0,500000,500200,', '22520', '0000000220,0000002390,0000022520,', '1', '2', '重庆市/县/酉阳土家族苗族自治县', '酉阳土家族苗族自治县', '3', '0', 'system', '2018-03-11 16:00:10', 'system', '2018-03-11 16:00:10', null);
INSERT INTO `js_sys_area` VALUES ('500243', '500200', '0,500000,500200,', '22530', '0000000220,0000002390,0000022530,', '1', '2', '重庆市/县/彭水苗族土家族自治县', '彭水苗族土家族自治县', '3', '0', 'system', '2018-03-11 16:00:10', 'system', '2018-03-11 16:00:10', null);
INSERT INTO `js_sys_area` VALUES ('500300', '500000', '0,500000,', '2400', '0000000220,0000002400,', '0', '1', '重庆市/市', '市', '2', '0', 'system', '2018-03-11 16:00:10', 'system', '2018-03-11 16:00:10', null);
INSERT INTO `js_sys_area` VALUES ('500381', '500300', '0,500000,500300,', '22540', '0000000220,0000002400,0000022540,', '1', '2', '重庆市/市/江津市', '江津市', '3', '0', 'system', '2018-03-11 16:00:10', 'system', '2018-03-11 16:00:10', null);
INSERT INTO `js_sys_area` VALUES ('500382', '500300', '0,500000,500300,', '22550', '0000000220,0000002400,0000022550,', '1', '2', '重庆市/市/合川市', '合川市', '3', '0', 'system', '2018-03-11 16:00:10', 'system', '2018-03-11 16:00:10', null);
INSERT INTO `js_sys_area` VALUES ('500383', '500300', '0,500000,500300,', '22560', '0000000220,0000002400,0000022560,', '1', '2', '重庆市/市/永川市', '永川市', '3', '0', 'system', '2018-03-11 16:00:10', 'system', '2018-03-11 16:00:10', null);
INSERT INTO `js_sys_area` VALUES ('500384', '500300', '0,500000,500300,', '22570', '0000000220,0000002400,0000022570,', '1', '2', '重庆市/市/南川市', '南川市', '3', '0', 'system', '2018-03-11 16:00:10', 'system', '2018-03-11 16:00:10', null);
INSERT INTO `js_sys_area` VALUES ('510000', '0', '0,', '230', '0000000230,', '0', '0', '四川省', '四川省', '1', '0', 'system', '2018-03-11 16:00:10', 'system', '2018-03-11 16:00:10', null);
INSERT INTO `js_sys_area` VALUES ('510100', '510000', '0,510000,', '2410', '0000000230,0000002410,', '0', '1', '四川省/成都市', '成都市', '2', '0', 'system', '2018-03-11 16:00:10', 'system', '2018-03-11 16:00:10', null);
INSERT INTO `js_sys_area` VALUES ('510101', '510100', '0,510000,510100,', '22580', '0000000230,0000002410,0000022580,', '1', '2', '四川省/成都市/市辖区', '市辖区', '3', '0', 'system', '2018-03-11 16:00:10', 'system', '2018-03-11 16:00:10', null);
INSERT INTO `js_sys_area` VALUES ('510104', '510100', '0,510000,510100,', '22590', '0000000230,0000002410,0000022590,', '1', '2', '四川省/成都市/锦江区', '锦江区', '3', '0', 'system', '2018-03-11 16:00:10', 'system', '2018-03-11 16:00:10', null);
INSERT INTO `js_sys_area` VALUES ('510105', '510100', '0,510000,510100,', '22600', '0000000230,0000002410,0000022600,', '1', '2', '四川省/成都市/青羊区', '青羊区', '3', '0', 'system', '2018-03-11 16:00:10', 'system', '2018-03-11 16:00:10', null);
INSERT INTO `js_sys_area` VALUES ('510106', '510100', '0,510000,510100,', '22610', '0000000230,0000002410,0000022610,', '1', '2', '四川省/成都市/金牛区', '金牛区', '3', '0', 'system', '2018-03-11 16:00:10', 'system', '2018-03-11 16:00:10', null);
INSERT INTO `js_sys_area` VALUES ('510107', '510100', '0,510000,510100,', '22620', '0000000230,0000002410,0000022620,', '1', '2', '四川省/成都市/武侯区', '武侯区', '3', '0', 'system', '2018-03-11 16:00:10', 'system', '2018-03-11 16:00:10', null);
INSERT INTO `js_sys_area` VALUES ('510108', '510100', '0,510000,510100,', '22630', '0000000230,0000002410,0000022630,', '1', '2', '四川省/成都市/成华区', '成华区', '3', '0', 'system', '2018-03-11 16:00:10', 'system', '2018-03-11 16:00:10', null);
INSERT INTO `js_sys_area` VALUES ('510112', '510100', '0,510000,510100,', '22640', '0000000230,0000002410,0000022640,', '1', '2', '四川省/成都市/龙泉驿区', '龙泉驿区', '3', '0', 'system', '2018-03-11 16:00:11', 'system', '2018-03-11 16:00:11', null);
INSERT INTO `js_sys_area` VALUES ('510113', '510100', '0,510000,510100,', '22650', '0000000230,0000002410,0000022650,', '1', '2', '四川省/成都市/青白江区', '青白江区', '3', '0', 'system', '2018-03-11 16:00:11', 'system', '2018-03-11 16:00:11', null);
INSERT INTO `js_sys_area` VALUES ('510114', '510100', '0,510000,510100,', '22660', '0000000230,0000002410,0000022660,', '1', '2', '四川省/成都市/新都区', '新都区', '3', '0', 'system', '2018-03-11 16:00:11', 'system', '2018-03-11 16:00:11', null);
INSERT INTO `js_sys_area` VALUES ('510115', '510100', '0,510000,510100,', '22670', '0000000230,0000002410,0000022670,', '1', '2', '四川省/成都市/温江区', '温江区', '3', '0', 'system', '2018-03-11 16:00:11', 'system', '2018-03-11 16:00:11', null);
INSERT INTO `js_sys_area` VALUES ('510121', '510100', '0,510000,510100,', '22680', '0000000230,0000002410,0000022680,', '1', '2', '四川省/成都市/金堂县', '金堂县', '3', '0', 'system', '2018-03-11 16:00:11', 'system', '2018-03-11 16:00:11', null);
INSERT INTO `js_sys_area` VALUES ('510122', '510100', '0,510000,510100,', '22690', '0000000230,0000002410,0000022690,', '1', '2', '四川省/成都市/双流县', '双流县', '3', '0', 'system', '2018-03-11 16:00:11', 'system', '2018-03-11 16:00:11', null);
INSERT INTO `js_sys_area` VALUES ('510124', '510100', '0,510000,510100,', '22700', '0000000230,0000002410,0000022700,', '1', '2', '四川省/成都市/郫　县', '郫　县', '3', '0', 'system', '2018-03-11 16:00:11', 'system', '2018-03-11 16:00:11', null);
INSERT INTO `js_sys_area` VALUES ('510129', '510100', '0,510000,510100,', '22710', '0000000230,0000002410,0000022710,', '1', '2', '四川省/成都市/大邑县', '大邑县', '3', '0', 'system', '2018-03-11 16:00:11', 'system', '2018-03-11 16:00:11', null);
INSERT INTO `js_sys_area` VALUES ('510131', '510100', '0,510000,510100,', '22720', '0000000230,0000002410,0000022720,', '1', '2', '四川省/成都市/蒲江县', '蒲江县', '3', '0', 'system', '2018-03-11 16:00:11', 'system', '2018-03-11 16:00:11', null);
INSERT INTO `js_sys_area` VALUES ('510132', '510100', '0,510000,510100,', '22730', '0000000230,0000002410,0000022730,', '1', '2', '四川省/成都市/新津县', '新津县', '3', '0', 'system', '2018-03-11 16:00:11', 'system', '2018-03-11 16:00:11', null);
INSERT INTO `js_sys_area` VALUES ('510181', '510100', '0,510000,510100,', '22740', '0000000230,0000002410,0000022740,', '1', '2', '四川省/成都市/都江堰市', '都江堰市', '3', '0', 'system', '2018-03-11 16:00:11', 'system', '2018-03-11 16:00:11', null);
INSERT INTO `js_sys_area` VALUES ('510182', '510100', '0,510000,510100,', '22750', '0000000230,0000002410,0000022750,', '1', '2', '四川省/成都市/彭州市', '彭州市', '3', '0', 'system', '2018-03-11 16:00:11', 'system', '2018-03-11 16:00:11', null);
INSERT INTO `js_sys_area` VALUES ('510183', '510100', '0,510000,510100,', '22760', '0000000230,0000002410,0000022760,', '1', '2', '四川省/成都市/邛崃市', '邛崃市', '3', '0', 'system', '2018-03-11 16:00:11', 'system', '2018-03-11 16:00:11', null);
INSERT INTO `js_sys_area` VALUES ('510184', '510100', '0,510000,510100,', '22770', '0000000230,0000002410,0000022770,', '1', '2', '四川省/成都市/崇州市', '崇州市', '3', '0', 'system', '2018-03-11 16:00:11', 'system', '2018-03-11 16:00:11', null);
INSERT INTO `js_sys_area` VALUES ('510300', '510000', '0,510000,', '2420', '0000000230,0000002420,', '0', '1', '四川省/自贡市', '自贡市', '2', '0', 'system', '2018-03-11 16:00:11', 'system', '2018-03-11 16:00:11', null);
INSERT INTO `js_sys_area` VALUES ('510301', '510300', '0,510000,510300,', '22780', '0000000230,0000002420,0000022780,', '1', '2', '四川省/自贡市/市辖区', '市辖区', '3', '0', 'system', '2018-03-11 16:00:11', 'system', '2018-03-11 16:00:11', null);
INSERT INTO `js_sys_area` VALUES ('510302', '510300', '0,510000,510300,', '22790', '0000000230,0000002420,0000022790,', '1', '2', '四川省/自贡市/自流井区', '自流井区', '3', '0', 'system', '2018-03-11 16:00:11', 'system', '2018-03-11 16:00:11', null);
INSERT INTO `js_sys_area` VALUES ('510303', '510300', '0,510000,510300,', '22800', '0000000230,0000002420,0000022800,', '1', '2', '四川省/自贡市/贡井区', '贡井区', '3', '0', 'system', '2018-03-11 16:00:11', 'system', '2018-03-11 16:00:11', null);
INSERT INTO `js_sys_area` VALUES ('510304', '510300', '0,510000,510300,', '22810', '0000000230,0000002420,0000022810,', '1', '2', '四川省/自贡市/大安区', '大安区', '3', '0', 'system', '2018-03-11 16:00:11', 'system', '2018-03-11 16:00:11', null);
INSERT INTO `js_sys_area` VALUES ('510311', '510300', '0,510000,510300,', '22820', '0000000230,0000002420,0000022820,', '1', '2', '四川省/自贡市/沿滩区', '沿滩区', '3', '0', 'system', '2018-03-11 16:00:11', 'system', '2018-03-11 16:00:11', null);
INSERT INTO `js_sys_area` VALUES ('510321', '510300', '0,510000,510300,', '22830', '0000000230,0000002420,0000022830,', '1', '2', '四川省/自贡市/荣　县', '荣　县', '3', '0', 'system', '2018-03-11 16:00:11', 'system', '2018-03-11 16:00:11', null);
INSERT INTO `js_sys_area` VALUES ('510322', '510300', '0,510000,510300,', '22840', '0000000230,0000002420,0000022840,', '1', '2', '四川省/自贡市/富顺县', '富顺县', '3', '0', 'system', '2018-03-11 16:00:11', 'system', '2018-03-11 16:00:11', null);
INSERT INTO `js_sys_area` VALUES ('510400', '510000', '0,510000,', '2430', '0000000230,0000002430,', '0', '1', '四川省/攀枝花市', '攀枝花市', '2', '0', 'system', '2018-03-11 16:00:11', 'system', '2018-03-11 16:00:11', null);
INSERT INTO `js_sys_area` VALUES ('510401', '510400', '0,510000,510400,', '22850', '0000000230,0000002430,0000022850,', '1', '2', '四川省/攀枝花市/市辖区', '市辖区', '3', '0', 'system', '2018-03-11 16:00:11', 'system', '2018-03-11 16:00:11', null);
INSERT INTO `js_sys_area` VALUES ('510402', '510400', '0,510000,510400,', '22860', '0000000230,0000002430,0000022860,', '1', '2', '四川省/攀枝花市/东　区', '东　区', '3', '0', 'system', '2018-03-11 16:00:11', 'system', '2018-03-11 16:00:11', null);
INSERT INTO `js_sys_area` VALUES ('510403', '510400', '0,510000,510400,', '22870', '0000000230,0000002430,0000022870,', '1', '2', '四川省/攀枝花市/西　区', '西　区', '3', '0', 'system', '2018-03-11 16:00:11', 'system', '2018-03-11 16:00:11', null);
INSERT INTO `js_sys_area` VALUES ('510411', '510400', '0,510000,510400,', '22880', '0000000230,0000002430,0000022880,', '1', '2', '四川省/攀枝花市/仁和区', '仁和区', '3', '0', 'system', '2018-03-11 16:00:11', 'system', '2018-03-11 16:00:11', null);
INSERT INTO `js_sys_area` VALUES ('510421', '510400', '0,510000,510400,', '22890', '0000000230,0000002430,0000022890,', '1', '2', '四川省/攀枝花市/米易县', '米易县', '3', '0', 'system', '2018-03-11 16:00:11', 'system', '2018-03-11 16:00:11', null);
INSERT INTO `js_sys_area` VALUES ('510422', '510400', '0,510000,510400,', '22900', '0000000230,0000002430,0000022900,', '1', '2', '四川省/攀枝花市/盐边县', '盐边县', '3', '0', 'system', '2018-03-11 16:00:11', 'system', '2018-03-11 16:00:11', null);
INSERT INTO `js_sys_area` VALUES ('510500', '510000', '0,510000,', '2440', '0000000230,0000002440,', '0', '1', '四川省/泸州市', '泸州市', '2', '0', 'system', '2018-03-11 16:00:11', 'system', '2018-03-11 16:00:11', null);
INSERT INTO `js_sys_area` VALUES ('510501', '510500', '0,510000,510500,', '22910', '0000000230,0000002440,0000022910,', '1', '2', '四川省/泸州市/市辖区', '市辖区', '3', '0', 'system', '2018-03-11 16:00:11', 'system', '2018-03-11 16:00:11', null);
INSERT INTO `js_sys_area` VALUES ('510502', '510500', '0,510000,510500,', '22920', '0000000230,0000002440,0000022920,', '1', '2', '四川省/泸州市/江阳区', '江阳区', '3', '0', 'system', '2018-03-11 16:00:11', 'system', '2018-03-11 16:00:11', null);
INSERT INTO `js_sys_area` VALUES ('510503', '510500', '0,510000,510500,', '22930', '0000000230,0000002440,0000022930,', '1', '2', '四川省/泸州市/纳溪区', '纳溪区', '3', '0', 'system', '2018-03-11 16:00:11', 'system', '2018-03-11 16:00:11', null);
INSERT INTO `js_sys_area` VALUES ('510504', '510500', '0,510000,510500,', '22940', '0000000230,0000002440,0000022940,', '1', '2', '四川省/泸州市/龙马潭区', '龙马潭区', '3', '0', 'system', '2018-03-11 16:00:11', 'system', '2018-03-11 16:00:11', null);
INSERT INTO `js_sys_area` VALUES ('510521', '510500', '0,510000,510500,', '22950', '0000000230,0000002440,0000022950,', '1', '2', '四川省/泸州市/泸　县', '泸　县', '3', '0', 'system', '2018-03-11 16:00:11', 'system', '2018-03-11 16:00:11', null);
INSERT INTO `js_sys_area` VALUES ('510522', '510500', '0,510000,510500,', '22960', '0000000230,0000002440,0000022960,', '1', '2', '四川省/泸州市/合江县', '合江县', '3', '0', 'system', '2018-03-11 16:00:11', 'system', '2018-03-11 16:00:11', null);
INSERT INTO `js_sys_area` VALUES ('510524', '510500', '0,510000,510500,', '22970', '0000000230,0000002440,0000022970,', '1', '2', '四川省/泸州市/叙永县', '叙永县', '3', '0', 'system', '2018-03-11 16:00:11', 'system', '2018-03-11 16:00:11', null);
INSERT INTO `js_sys_area` VALUES ('510525', '510500', '0,510000,510500,', '22980', '0000000230,0000002440,0000022980,', '1', '2', '四川省/泸州市/古蔺县', '古蔺县', '3', '0', 'system', '2018-03-11 16:00:11', 'system', '2018-03-11 16:00:11', null);
INSERT INTO `js_sys_area` VALUES ('510600', '510000', '0,510000,', '2450', '0000000230,0000002450,', '0', '1', '四川省/德阳市', '德阳市', '2', '0', 'system', '2018-03-11 16:00:11', 'system', '2018-03-11 16:00:11', null);
INSERT INTO `js_sys_area` VALUES ('510601', '510600', '0,510000,510600,', '22990', '0000000230,0000002450,0000022990,', '1', '2', '四川省/德阳市/市辖区', '市辖区', '3', '0', 'system', '2018-03-11 16:00:11', 'system', '2018-03-11 16:00:11', null);
INSERT INTO `js_sys_area` VALUES ('510603', '510600', '0,510000,510600,', '23000', '0000000230,0000002450,0000023000,', '1', '2', '四川省/德阳市/旌阳区', '旌阳区', '3', '0', 'system', '2018-03-11 16:00:11', 'system', '2018-03-11 16:00:11', null);
INSERT INTO `js_sys_area` VALUES ('510623', '510600', '0,510000,510600,', '23010', '0000000230,0000002450,0000023010,', '1', '2', '四川省/德阳市/中江县', '中江县', '3', '0', 'system', '2018-03-11 16:00:11', 'system', '2018-03-11 16:00:11', null);
INSERT INTO `js_sys_area` VALUES ('510626', '510600', '0,510000,510600,', '23020', '0000000230,0000002450,0000023020,', '1', '2', '四川省/德阳市/罗江县', '罗江县', '3', '0', 'system', '2018-03-11 16:00:11', 'system', '2018-03-11 16:00:11', null);
INSERT INTO `js_sys_area` VALUES ('510681', '510600', '0,510000,510600,', '23030', '0000000230,0000002450,0000023030,', '1', '2', '四川省/德阳市/广汉市', '广汉市', '3', '0', 'system', '2018-03-11 16:00:11', 'system', '2018-03-11 16:00:11', null);
INSERT INTO `js_sys_area` VALUES ('510682', '510600', '0,510000,510600,', '23040', '0000000230,0000002450,0000023040,', '1', '2', '四川省/德阳市/什邡市', '什邡市', '3', '0', 'system', '2018-03-11 16:00:11', 'system', '2018-03-11 16:00:11', null);
INSERT INTO `js_sys_area` VALUES ('510683', '510600', '0,510000,510600,', '23050', '0000000230,0000002450,0000023050,', '1', '2', '四川省/德阳市/绵竹市', '绵竹市', '3', '0', 'system', '2018-03-11 16:00:11', 'system', '2018-03-11 16:00:11', null);
INSERT INTO `js_sys_area` VALUES ('510700', '510000', '0,510000,', '2460', '0000000230,0000002460,', '0', '1', '四川省/绵阳市', '绵阳市', '2', '0', 'system', '2018-03-11 16:00:11', 'system', '2018-03-11 16:00:11', null);
INSERT INTO `js_sys_area` VALUES ('510701', '510700', '0,510000,510700,', '23060', '0000000230,0000002460,0000023060,', '1', '2', '四川省/绵阳市/市辖区', '市辖区', '3', '0', 'system', '2018-03-11 16:00:11', 'system', '2018-03-11 16:00:11', null);
INSERT INTO `js_sys_area` VALUES ('510703', '510700', '0,510000,510700,', '23070', '0000000230,0000002460,0000023070,', '1', '2', '四川省/绵阳市/涪城区', '涪城区', '3', '0', 'system', '2018-03-11 16:00:11', 'system', '2018-03-11 16:00:11', null);
INSERT INTO `js_sys_area` VALUES ('510704', '510700', '0,510000,510700,', '23080', '0000000230,0000002460,0000023080,', '1', '2', '四川省/绵阳市/游仙区', '游仙区', '3', '0', 'system', '2018-03-11 16:00:11', 'system', '2018-03-11 16:00:11', null);
INSERT INTO `js_sys_area` VALUES ('510722', '510700', '0,510000,510700,', '23090', '0000000230,0000002460,0000023090,', '1', '2', '四川省/绵阳市/三台县', '三台县', '3', '0', 'system', '2018-03-11 16:00:11', 'system', '2018-03-11 16:00:11', null);
INSERT INTO `js_sys_area` VALUES ('510723', '510700', '0,510000,510700,', '23100', '0000000230,0000002460,0000023100,', '1', '2', '四川省/绵阳市/盐亭县', '盐亭县', '3', '0', 'system', '2018-03-11 16:00:11', 'system', '2018-03-11 16:00:11', null);
INSERT INTO `js_sys_area` VALUES ('510724', '510700', '0,510000,510700,', '23110', '0000000230,0000002460,0000023110,', '1', '2', '四川省/绵阳市/安　县', '安　县', '3', '0', 'system', '2018-03-11 16:00:11', 'system', '2018-03-11 16:00:11', null);
INSERT INTO `js_sys_area` VALUES ('510725', '510700', '0,510000,510700,', '23120', '0000000230,0000002460,0000023120,', '1', '2', '四川省/绵阳市/梓潼县', '梓潼县', '3', '0', 'system', '2018-03-11 16:00:11', 'system', '2018-03-11 16:00:11', null);
INSERT INTO `js_sys_area` VALUES ('510726', '510700', '0,510000,510700,', '23130', '0000000230,0000002460,0000023130,', '1', '2', '四川省/绵阳市/北川羌族自治县', '北川羌族自治县', '3', '0', 'system', '2018-03-11 16:00:11', 'system', '2018-03-11 16:00:11', null);
INSERT INTO `js_sys_area` VALUES ('510727', '510700', '0,510000,510700,', '23140', '0000000230,0000002460,0000023140,', '1', '2', '四川省/绵阳市/平武县', '平武县', '3', '0', 'system', '2018-03-11 16:00:11', 'system', '2018-03-11 16:00:11', null);
INSERT INTO `js_sys_area` VALUES ('510781', '510700', '0,510000,510700,', '23150', '0000000230,0000002460,0000023150,', '1', '2', '四川省/绵阳市/江油市', '江油市', '3', '0', 'system', '2018-03-11 16:00:11', 'system', '2018-03-11 16:00:11', null);
INSERT INTO `js_sys_area` VALUES ('510800', '510000', '0,510000,', '2470', '0000000230,0000002470,', '0', '1', '四川省/广元市', '广元市', '2', '0', 'system', '2018-03-11 16:00:11', 'system', '2018-03-11 16:00:11', null);
INSERT INTO `js_sys_area` VALUES ('510801', '510800', '0,510000,510800,', '23160', '0000000230,0000002470,0000023160,', '1', '2', '四川省/广元市/市辖区', '市辖区', '3', '0', 'system', '2018-03-11 16:00:11', 'system', '2018-03-11 16:00:11', null);
INSERT INTO `js_sys_area` VALUES ('510802', '510800', '0,510000,510800,', '23170', '0000000230,0000002470,0000023170,', '1', '2', '四川省/广元市/市中区', '市中区', '3', '0', 'system', '2018-03-11 16:00:11', 'system', '2018-03-11 16:00:11', null);
INSERT INTO `js_sys_area` VALUES ('510811', '510800', '0,510000,510800,', '23180', '0000000230,0000002470,0000023180,', '1', '2', '四川省/广元市/元坝区', '元坝区', '3', '0', 'system', '2018-03-11 16:00:11', 'system', '2018-03-11 16:00:11', null);
INSERT INTO `js_sys_area` VALUES ('510812', '510800', '0,510000,510800,', '23190', '0000000230,0000002470,0000023190,', '1', '2', '四川省/广元市/朝天区', '朝天区', '3', '0', 'system', '2018-03-11 16:00:11', 'system', '2018-03-11 16:00:11', null);
INSERT INTO `js_sys_area` VALUES ('510821', '510800', '0,510000,510800,', '23200', '0000000230,0000002470,0000023200,', '1', '2', '四川省/广元市/旺苍县', '旺苍县', '3', '0', 'system', '2018-03-11 16:00:11', 'system', '2018-03-11 16:00:11', null);
INSERT INTO `js_sys_area` VALUES ('510822', '510800', '0,510000,510800,', '23210', '0000000230,0000002470,0000023210,', '1', '2', '四川省/广元市/青川县', '青川县', '3', '0', 'system', '2018-03-11 16:00:11', 'system', '2018-03-11 16:00:11', null);
INSERT INTO `js_sys_area` VALUES ('510823', '510800', '0,510000,510800,', '23220', '0000000230,0000002470,0000023220,', '1', '2', '四川省/广元市/剑阁县', '剑阁县', '3', '0', 'system', '2018-03-11 16:00:11', 'system', '2018-03-11 16:00:11', null);
INSERT INTO `js_sys_area` VALUES ('510824', '510800', '0,510000,510800,', '23230', '0000000230,0000002470,0000023230,', '1', '2', '四川省/广元市/苍溪县', '苍溪县', '3', '0', 'system', '2018-03-11 16:00:11', 'system', '2018-03-11 16:00:11', null);
INSERT INTO `js_sys_area` VALUES ('510900', '510000', '0,510000,', '2480', '0000000230,0000002480,', '0', '1', '四川省/遂宁市', '遂宁市', '2', '0', 'system', '2018-03-11 16:00:12', 'system', '2018-03-11 16:00:12', null);
INSERT INTO `js_sys_area` VALUES ('510901', '510900', '0,510000,510900,', '23240', '0000000230,0000002480,0000023240,', '1', '2', '四川省/遂宁市/市辖区', '市辖区', '3', '0', 'system', '2018-03-11 16:00:12', 'system', '2018-03-11 16:00:12', null);
INSERT INTO `js_sys_area` VALUES ('510903', '510900', '0,510000,510900,', '23250', '0000000230,0000002480,0000023250,', '1', '2', '四川省/遂宁市/船山区', '船山区', '3', '0', 'system', '2018-03-11 16:00:12', 'system', '2018-03-11 16:00:12', null);
INSERT INTO `js_sys_area` VALUES ('510904', '510900', '0,510000,510900,', '23260', '0000000230,0000002480,0000023260,', '1', '2', '四川省/遂宁市/安居区', '安居区', '3', '0', 'system', '2018-03-11 16:00:12', 'system', '2018-03-11 16:00:12', null);
INSERT INTO `js_sys_area` VALUES ('510921', '510900', '0,510000,510900,', '23270', '0000000230,0000002480,0000023270,', '1', '2', '四川省/遂宁市/蓬溪县', '蓬溪县', '3', '0', 'system', '2018-03-11 16:00:12', 'system', '2018-03-11 16:00:12', null);
INSERT INTO `js_sys_area` VALUES ('510922', '510900', '0,510000,510900,', '23280', '0000000230,0000002480,0000023280,', '1', '2', '四川省/遂宁市/射洪县', '射洪县', '3', '0', 'system', '2018-03-11 16:00:12', 'system', '2018-03-11 16:00:12', null);
INSERT INTO `js_sys_area` VALUES ('510923', '510900', '0,510000,510900,', '23290', '0000000230,0000002480,0000023290,', '1', '2', '四川省/遂宁市/大英县', '大英县', '3', '0', 'system', '2018-03-11 16:00:12', 'system', '2018-03-11 16:00:12', null);
INSERT INTO `js_sys_area` VALUES ('511000', '510000', '0,510000,', '2490', '0000000230,0000002490,', '0', '1', '四川省/内江市', '内江市', '2', '0', 'system', '2018-03-11 16:00:12', 'system', '2018-03-11 16:00:12', null);
INSERT INTO `js_sys_area` VALUES ('511001', '511000', '0,510000,511000,', '23300', '0000000230,0000002490,0000023300,', '1', '2', '四川省/内江市/市辖区', '市辖区', '3', '0', 'system', '2018-03-11 16:00:12', 'system', '2018-03-11 16:00:12', null);
INSERT INTO `js_sys_area` VALUES ('511002', '511000', '0,510000,511000,', '23310', '0000000230,0000002490,0000023310,', '1', '2', '四川省/内江市/市中区', '市中区', '3', '0', 'system', '2018-03-11 16:00:12', 'system', '2018-03-11 16:00:12', null);
INSERT INTO `js_sys_area` VALUES ('511011', '511000', '0,510000,511000,', '23320', '0000000230,0000002490,0000023320,', '1', '2', '四川省/内江市/东兴区', '东兴区', '3', '0', 'system', '2018-03-11 16:00:12', 'system', '2018-03-11 16:00:12', null);
INSERT INTO `js_sys_area` VALUES ('511024', '511000', '0,510000,511000,', '23330', '0000000230,0000002490,0000023330,', '1', '2', '四川省/内江市/威远县', '威远县', '3', '0', 'system', '2018-03-11 16:00:12', 'system', '2018-03-11 16:00:12', null);
INSERT INTO `js_sys_area` VALUES ('511025', '511000', '0,510000,511000,', '23340', '0000000230,0000002490,0000023340,', '1', '2', '四川省/内江市/资中县', '资中县', '3', '0', 'system', '2018-03-11 16:00:12', 'system', '2018-03-11 16:00:12', null);
INSERT INTO `js_sys_area` VALUES ('511028', '511000', '0,510000,511000,', '23350', '0000000230,0000002490,0000023350,', '1', '2', '四川省/内江市/隆昌县', '隆昌县', '3', '0', 'system', '2018-03-11 16:00:12', 'system', '2018-03-11 16:00:12', null);
INSERT INTO `js_sys_area` VALUES ('511100', '510000', '0,510000,', '2500', '0000000230,0000002500,', '0', '1', '四川省/乐山市', '乐山市', '2', '0', 'system', '2018-03-11 16:00:12', 'system', '2018-03-11 16:00:12', null);
INSERT INTO `js_sys_area` VALUES ('511101', '511100', '0,510000,511100,', '23360', '0000000230,0000002500,0000023360,', '1', '2', '四川省/乐山市/市辖区', '市辖区', '3', '0', 'system', '2018-03-11 16:00:12', 'system', '2018-03-11 16:00:12', null);
INSERT INTO `js_sys_area` VALUES ('511102', '511100', '0,510000,511100,', '23370', '0000000230,0000002500,0000023370,', '1', '2', '四川省/乐山市/市中区', '市中区', '3', '0', 'system', '2018-03-11 16:00:12', 'system', '2018-03-11 16:00:12', null);
INSERT INTO `js_sys_area` VALUES ('511111', '511100', '0,510000,511100,', '23380', '0000000230,0000002500,0000023380,', '1', '2', '四川省/乐山市/沙湾区', '沙湾区', '3', '0', 'system', '2018-03-11 16:00:12', 'system', '2018-03-11 16:00:12', null);
INSERT INTO `js_sys_area` VALUES ('511112', '511100', '0,510000,511100,', '23390', '0000000230,0000002500,0000023390,', '1', '2', '四川省/乐山市/五通桥区', '五通桥区', '3', '0', 'system', '2018-03-11 16:00:12', 'system', '2018-03-11 16:00:12', null);
INSERT INTO `js_sys_area` VALUES ('511113', '511100', '0,510000,511100,', '23400', '0000000230,0000002500,0000023400,', '1', '2', '四川省/乐山市/金口河区', '金口河区', '3', '0', 'system', '2018-03-11 16:00:12', 'system', '2018-03-11 16:00:12', null);
INSERT INTO `js_sys_area` VALUES ('511123', '511100', '0,510000,511100,', '23410', '0000000230,0000002500,0000023410,', '1', '2', '四川省/乐山市/犍为县', '犍为县', '3', '0', 'system', '2018-03-11 16:00:12', 'system', '2018-03-11 16:00:12', null);
INSERT INTO `js_sys_area` VALUES ('511124', '511100', '0,510000,511100,', '23420', '0000000230,0000002500,0000023420,', '1', '2', '四川省/乐山市/井研县', '井研县', '3', '0', 'system', '2018-03-11 16:00:12', 'system', '2018-03-11 16:00:12', null);
INSERT INTO `js_sys_area` VALUES ('511126', '511100', '0,510000,511100,', '23430', '0000000230,0000002500,0000023430,', '1', '2', '四川省/乐山市/夹江县', '夹江县', '3', '0', 'system', '2018-03-11 16:00:12', 'system', '2018-03-11 16:00:12', null);
INSERT INTO `js_sys_area` VALUES ('511129', '511100', '0,510000,511100,', '23440', '0000000230,0000002500,0000023440,', '1', '2', '四川省/乐山市/沐川县', '沐川县', '3', '0', 'system', '2018-03-11 16:00:12', 'system', '2018-03-11 16:00:12', null);
INSERT INTO `js_sys_area` VALUES ('511132', '511100', '0,510000,511100,', '23450', '0000000230,0000002500,0000023450,', '1', '2', '四川省/乐山市/峨边彝族自治县', '峨边彝族自治县', '3', '0', 'system', '2018-03-11 16:00:12', 'system', '2018-03-11 16:00:12', null);
INSERT INTO `js_sys_area` VALUES ('511133', '511100', '0,510000,511100,', '23460', '0000000230,0000002500,0000023460,', '1', '2', '四川省/乐山市/马边彝族自治县', '马边彝族自治县', '3', '0', 'system', '2018-03-11 16:00:12', 'system', '2018-03-11 16:00:12', null);
INSERT INTO `js_sys_area` VALUES ('511181', '511100', '0,510000,511100,', '23470', '0000000230,0000002500,0000023470,', '1', '2', '四川省/乐山市/峨眉山市', '峨眉山市', '3', '0', 'system', '2018-03-11 16:00:12', 'system', '2018-03-11 16:00:12', null);
INSERT INTO `js_sys_area` VALUES ('511300', '510000', '0,510000,', '2510', '0000000230,0000002510,', '0', '1', '四川省/南充市', '南充市', '2', '0', 'system', '2018-03-11 16:00:12', 'system', '2018-03-11 16:00:12', null);
INSERT INTO `js_sys_area` VALUES ('511301', '511300', '0,510000,511300,', '23480', '0000000230,0000002510,0000023480,', '1', '2', '四川省/南充市/市辖区', '市辖区', '3', '0', 'system', '2018-03-11 16:00:12', 'system', '2018-03-11 16:00:12', null);
INSERT INTO `js_sys_area` VALUES ('511302', '511300', '0,510000,511300,', '23490', '0000000230,0000002510,0000023490,', '1', '2', '四川省/南充市/顺庆区', '顺庆区', '3', '0', 'system', '2018-03-11 16:00:12', 'system', '2018-03-11 16:00:12', null);
INSERT INTO `js_sys_area` VALUES ('511303', '511300', '0,510000,511300,', '23500', '0000000230,0000002510,0000023500,', '1', '2', '四川省/南充市/高坪区', '高坪区', '3', '0', 'system', '2018-03-11 16:00:12', 'system', '2018-03-11 16:00:12', null);
INSERT INTO `js_sys_area` VALUES ('511304', '511300', '0,510000,511300,', '23510', '0000000230,0000002510,0000023510,', '1', '2', '四川省/南充市/嘉陵区', '嘉陵区', '3', '0', 'system', '2018-03-11 16:00:12', 'system', '2018-03-11 16:00:12', null);
INSERT INTO `js_sys_area` VALUES ('511321', '511300', '0,510000,511300,', '23520', '0000000230,0000002510,0000023520,', '1', '2', '四川省/南充市/南部县', '南部县', '3', '0', 'system', '2018-03-11 16:00:12', 'system', '2018-03-11 16:00:12', null);
INSERT INTO `js_sys_area` VALUES ('511322', '511300', '0,510000,511300,', '23530', '0000000230,0000002510,0000023530,', '1', '2', '四川省/南充市/营山县', '营山县', '3', '0', 'system', '2018-03-11 16:00:12', 'system', '2018-03-11 16:00:12', null);
INSERT INTO `js_sys_area` VALUES ('511323', '511300', '0,510000,511300,', '23540', '0000000230,0000002510,0000023540,', '1', '2', '四川省/南充市/蓬安县', '蓬安县', '3', '0', 'system', '2018-03-11 16:00:12', 'system', '2018-03-11 16:00:12', null);
INSERT INTO `js_sys_area` VALUES ('511324', '511300', '0,510000,511300,', '23550', '0000000230,0000002510,0000023550,', '1', '2', '四川省/南充市/仪陇县', '仪陇县', '3', '0', 'system', '2018-03-11 16:00:12', 'system', '2018-03-11 16:00:12', null);
INSERT INTO `js_sys_area` VALUES ('511325', '511300', '0,510000,511300,', '23560', '0000000230,0000002510,0000023560,', '1', '2', '四川省/南充市/西充县', '西充县', '3', '0', 'system', '2018-03-11 16:00:12', 'system', '2018-03-11 16:00:12', null);
INSERT INTO `js_sys_area` VALUES ('511381', '511300', '0,510000,511300,', '23570', '0000000230,0000002510,0000023570,', '1', '2', '四川省/南充市/阆中市', '阆中市', '3', '0', 'system', '2018-03-11 16:00:12', 'system', '2018-03-11 16:00:12', null);
INSERT INTO `js_sys_area` VALUES ('511400', '510000', '0,510000,', '2520', '0000000230,0000002520,', '0', '1', '四川省/眉山市', '眉山市', '2', '0', 'system', '2018-03-11 16:00:12', 'system', '2018-03-11 16:00:12', null);
INSERT INTO `js_sys_area` VALUES ('511401', '511400', '0,510000,511400,', '23580', '0000000230,0000002520,0000023580,', '1', '2', '四川省/眉山市/市辖区', '市辖区', '3', '0', 'system', '2018-03-11 16:00:12', 'system', '2018-03-11 16:00:12', null);
INSERT INTO `js_sys_area` VALUES ('511402', '511400', '0,510000,511400,', '23590', '0000000230,0000002520,0000023590,', '1', '2', '四川省/眉山市/东坡区', '东坡区', '3', '0', 'system', '2018-03-11 16:00:12', 'system', '2018-03-11 16:00:12', null);
INSERT INTO `js_sys_area` VALUES ('511421', '511400', '0,510000,511400,', '23600', '0000000230,0000002520,0000023600,', '1', '2', '四川省/眉山市/仁寿县', '仁寿县', '3', '0', 'system', '2018-03-11 16:00:12', 'system', '2018-03-11 16:00:12', null);
INSERT INTO `js_sys_area` VALUES ('511422', '511400', '0,510000,511400,', '23610', '0000000230,0000002520,0000023610,', '1', '2', '四川省/眉山市/彭山县', '彭山县', '3', '0', 'system', '2018-03-11 16:00:12', 'system', '2018-03-11 16:00:12', null);
INSERT INTO `js_sys_area` VALUES ('511423', '511400', '0,510000,511400,', '23620', '0000000230,0000002520,0000023620,', '1', '2', '四川省/眉山市/洪雅县', '洪雅县', '3', '0', 'system', '2018-03-11 16:00:12', 'system', '2018-03-11 16:00:12', null);
INSERT INTO `js_sys_area` VALUES ('511424', '511400', '0,510000,511400,', '23630', '0000000230,0000002520,0000023630,', '1', '2', '四川省/眉山市/丹棱县', '丹棱县', '3', '0', 'system', '2018-03-11 16:00:12', 'system', '2018-03-11 16:00:12', null);
INSERT INTO `js_sys_area` VALUES ('511425', '511400', '0,510000,511400,', '23640', '0000000230,0000002520,0000023640,', '1', '2', '四川省/眉山市/青神县', '青神县', '3', '0', 'system', '2018-03-11 16:00:12', 'system', '2018-03-11 16:00:12', null);
INSERT INTO `js_sys_area` VALUES ('511500', '510000', '0,510000,', '2530', '0000000230,0000002530,', '0', '1', '四川省/宜宾市', '宜宾市', '2', '0', 'system', '2018-03-11 16:00:12', 'system', '2018-03-11 16:00:12', null);
INSERT INTO `js_sys_area` VALUES ('511501', '511500', '0,510000,511500,', '23650', '0000000230,0000002530,0000023650,', '1', '2', '四川省/宜宾市/市辖区', '市辖区', '3', '0', 'system', '2018-03-11 16:00:12', 'system', '2018-03-11 16:00:12', null);
INSERT INTO `js_sys_area` VALUES ('511502', '511500', '0,510000,511500,', '23660', '0000000230,0000002530,0000023660,', '1', '2', '四川省/宜宾市/翠屏区', '翠屏区', '3', '0', 'system', '2018-03-11 16:00:12', 'system', '2018-03-11 16:00:12', null);
INSERT INTO `js_sys_area` VALUES ('511521', '511500', '0,510000,511500,', '23670', '0000000230,0000002530,0000023670,', '1', '2', '四川省/宜宾市/宜宾县', '宜宾县', '3', '0', 'system', '2018-03-11 16:00:12', 'system', '2018-03-11 16:00:12', null);
INSERT INTO `js_sys_area` VALUES ('511522', '511500', '0,510000,511500,', '23680', '0000000230,0000002530,0000023680,', '1', '2', '四川省/宜宾市/南溪县', '南溪县', '3', '0', 'system', '2018-03-11 16:00:12', 'system', '2018-03-11 16:00:12', null);
INSERT INTO `js_sys_area` VALUES ('511523', '511500', '0,510000,511500,', '23690', '0000000230,0000002530,0000023690,', '1', '2', '四川省/宜宾市/江安县', '江安县', '3', '0', 'system', '2018-03-11 16:00:12', 'system', '2018-03-11 16:00:12', null);
INSERT INTO `js_sys_area` VALUES ('511524', '511500', '0,510000,511500,', '23700', '0000000230,0000002530,0000023700,', '1', '2', '四川省/宜宾市/长宁县', '长宁县', '3', '0', 'system', '2018-03-11 16:00:12', 'system', '2018-03-11 16:00:12', null);
INSERT INTO `js_sys_area` VALUES ('511525', '511500', '0,510000,511500,', '23710', '0000000230,0000002530,0000023710,', '1', '2', '四川省/宜宾市/高　县', '高　县', '3', '0', 'system', '2018-03-11 16:00:12', 'system', '2018-03-11 16:00:12', null);
INSERT INTO `js_sys_area` VALUES ('511526', '511500', '0,510000,511500,', '23720', '0000000230,0000002530,0000023720,', '1', '2', '四川省/宜宾市/珙　县', '珙　县', '3', '0', 'system', '2018-03-11 16:00:12', 'system', '2018-03-11 16:00:12', null);
INSERT INTO `js_sys_area` VALUES ('511527', '511500', '0,510000,511500,', '23730', '0000000230,0000002530,0000023730,', '1', '2', '四川省/宜宾市/筠连县', '筠连县', '3', '0', 'system', '2018-03-11 16:00:12', 'system', '2018-03-11 16:00:12', null);
INSERT INTO `js_sys_area` VALUES ('511528', '511500', '0,510000,511500,', '23740', '0000000230,0000002530,0000023740,', '1', '2', '四川省/宜宾市/兴文县', '兴文县', '3', '0', 'system', '2018-03-11 16:00:12', 'system', '2018-03-11 16:00:12', null);
INSERT INTO `js_sys_area` VALUES ('511529', '511500', '0,510000,511500,', '23750', '0000000230,0000002530,0000023750,', '1', '2', '四川省/宜宾市/屏山县', '屏山县', '3', '0', 'system', '2018-03-11 16:00:12', 'system', '2018-03-11 16:00:12', null);
INSERT INTO `js_sys_area` VALUES ('511600', '510000', '0,510000,', '2540', '0000000230,0000002540,', '0', '1', '四川省/广安市', '广安市', '2', '0', 'system', '2018-03-11 16:00:12', 'system', '2018-03-11 16:00:12', null);
INSERT INTO `js_sys_area` VALUES ('511601', '511600', '0,510000,511600,', '23760', '0000000230,0000002540,0000023760,', '1', '2', '四川省/广安市/市辖区', '市辖区', '3', '0', 'system', '2018-03-11 16:00:12', 'system', '2018-03-11 16:00:12', null);
INSERT INTO `js_sys_area` VALUES ('511602', '511600', '0,510000,511600,', '23770', '0000000230,0000002540,0000023770,', '1', '2', '四川省/广安市/广安区', '广安区', '3', '0', 'system', '2018-03-11 16:00:12', 'system', '2018-03-11 16:00:12', null);
INSERT INTO `js_sys_area` VALUES ('511621', '511600', '0,510000,511600,', '23780', '0000000230,0000002540,0000023780,', '1', '2', '四川省/广安市/岳池县', '岳池县', '3', '0', 'system', '2018-03-11 16:00:12', 'system', '2018-03-11 16:00:12', null);
INSERT INTO `js_sys_area` VALUES ('511622', '511600', '0,510000,511600,', '23790', '0000000230,0000002540,0000023790,', '1', '2', '四川省/广安市/武胜县', '武胜县', '3', '0', 'system', '2018-03-11 16:00:12', 'system', '2018-03-11 16:00:12', null);
INSERT INTO `js_sys_area` VALUES ('511623', '511600', '0,510000,511600,', '23800', '0000000230,0000002540,0000023800,', '1', '2', '四川省/广安市/邻水县', '邻水县', '3', '0', 'system', '2018-03-11 16:00:13', 'system', '2018-03-11 16:00:13', null);
INSERT INTO `js_sys_area` VALUES ('511681', '511600', '0,510000,511600,', '23810', '0000000230,0000002540,0000023810,', '1', '2', '四川省/广安市/华莹市', '华莹市', '3', '0', 'system', '2018-03-11 16:00:13', 'system', '2018-03-11 16:00:13', null);
INSERT INTO `js_sys_area` VALUES ('511700', '510000', '0,510000,', '2550', '0000000230,0000002550,', '0', '1', '四川省/达州市', '达州市', '2', '0', 'system', '2018-03-11 16:00:13', 'system', '2018-03-11 16:00:13', null);
INSERT INTO `js_sys_area` VALUES ('511701', '511700', '0,510000,511700,', '23820', '0000000230,0000002550,0000023820,', '1', '2', '四川省/达州市/市辖区', '市辖区', '3', '0', 'system', '2018-03-11 16:00:13', 'system', '2018-03-11 16:00:13', null);
INSERT INTO `js_sys_area` VALUES ('511702', '511700', '0,510000,511700,', '23830', '0000000230,0000002550,0000023830,', '1', '2', '四川省/达州市/通川区', '通川区', '3', '0', 'system', '2018-03-11 16:00:13', 'system', '2018-03-11 16:00:13', null);
INSERT INTO `js_sys_area` VALUES ('511721', '511700', '0,510000,511700,', '23840', '0000000230,0000002550,0000023840,', '1', '2', '四川省/达州市/达　县', '达　县', '3', '0', 'system', '2018-03-11 16:00:13', 'system', '2018-03-11 16:00:13', null);
INSERT INTO `js_sys_area` VALUES ('511722', '511700', '0,510000,511700,', '23850', '0000000230,0000002550,0000023850,', '1', '2', '四川省/达州市/宣汉县', '宣汉县', '3', '0', 'system', '2018-03-11 16:00:13', 'system', '2018-03-11 16:00:13', null);
INSERT INTO `js_sys_area` VALUES ('511723', '511700', '0,510000,511700,', '23860', '0000000230,0000002550,0000023860,', '1', '2', '四川省/达州市/开江县', '开江县', '3', '0', 'system', '2018-03-11 16:00:13', 'system', '2018-03-11 16:00:13', null);
INSERT INTO `js_sys_area` VALUES ('511724', '511700', '0,510000,511700,', '23870', '0000000230,0000002550,0000023870,', '1', '2', '四川省/达州市/大竹县', '大竹县', '3', '0', 'system', '2018-03-11 16:00:13', 'system', '2018-03-11 16:00:13', null);
INSERT INTO `js_sys_area` VALUES ('511725', '511700', '0,510000,511700,', '23880', '0000000230,0000002550,0000023880,', '1', '2', '四川省/达州市/渠　县', '渠　县', '3', '0', 'system', '2018-03-11 16:00:13', 'system', '2018-03-11 16:00:13', null);
INSERT INTO `js_sys_area` VALUES ('511781', '511700', '0,510000,511700,', '23890', '0000000230,0000002550,0000023890,', '1', '2', '四川省/达州市/万源市', '万源市', '3', '0', 'system', '2018-03-11 16:00:13', 'system', '2018-03-11 16:00:13', null);
INSERT INTO `js_sys_area` VALUES ('511800', '510000', '0,510000,', '2560', '0000000230,0000002560,', '0', '1', '四川省/雅安市', '雅安市', '2', '0', 'system', '2018-03-11 16:00:13', 'system', '2018-03-11 16:00:13', null);
INSERT INTO `js_sys_area` VALUES ('511801', '511800', '0,510000,511800,', '23900', '0000000230,0000002560,0000023900,', '1', '2', '四川省/雅安市/市辖区', '市辖区', '3', '0', 'system', '2018-03-11 16:00:13', 'system', '2018-03-11 16:00:13', null);
INSERT INTO `js_sys_area` VALUES ('511802', '511800', '0,510000,511800,', '23910', '0000000230,0000002560,0000023910,', '1', '2', '四川省/雅安市/雨城区', '雨城区', '3', '0', 'system', '2018-03-11 16:00:13', 'system', '2018-03-11 16:00:13', null);
INSERT INTO `js_sys_area` VALUES ('511821', '511800', '0,510000,511800,', '23920', '0000000230,0000002560,0000023920,', '1', '2', '四川省/雅安市/名山县', '名山县', '3', '0', 'system', '2018-03-11 16:00:13', 'system', '2018-03-11 16:00:13', null);
INSERT INTO `js_sys_area` VALUES ('511822', '511800', '0,510000,511800,', '23930', '0000000230,0000002560,0000023930,', '1', '2', '四川省/雅安市/荥经县', '荥经县', '3', '0', 'system', '2018-03-11 16:00:13', 'system', '2018-03-11 16:00:13', null);
INSERT INTO `js_sys_area` VALUES ('511823', '511800', '0,510000,511800,', '23940', '0000000230,0000002560,0000023940,', '1', '2', '四川省/雅安市/汉源县', '汉源县', '3', '0', 'system', '2018-03-11 16:00:13', 'system', '2018-03-11 16:00:13', null);
INSERT INTO `js_sys_area` VALUES ('511824', '511800', '0,510000,511800,', '23950', '0000000230,0000002560,0000023950,', '1', '2', '四川省/雅安市/石棉县', '石棉县', '3', '0', 'system', '2018-03-11 16:00:13', 'system', '2018-03-11 16:00:13', null);
INSERT INTO `js_sys_area` VALUES ('511825', '511800', '0,510000,511800,', '23960', '0000000230,0000002560,0000023960,', '1', '2', '四川省/雅安市/天全县', '天全县', '3', '0', 'system', '2018-03-11 16:00:13', 'system', '2018-03-11 16:00:13', null);
INSERT INTO `js_sys_area` VALUES ('511826', '511800', '0,510000,511800,', '23970', '0000000230,0000002560,0000023970,', '1', '2', '四川省/雅安市/芦山县', '芦山县', '3', '0', 'system', '2018-03-11 16:00:13', 'system', '2018-03-11 16:00:13', null);
INSERT INTO `js_sys_area` VALUES ('511827', '511800', '0,510000,511800,', '23980', '0000000230,0000002560,0000023980,', '1', '2', '四川省/雅安市/宝兴县', '宝兴县', '3', '0', 'system', '2018-03-11 16:00:13', 'system', '2018-03-11 16:00:13', null);
INSERT INTO `js_sys_area` VALUES ('511900', '510000', '0,510000,', '2570', '0000000230,0000002570,', '0', '1', '四川省/巴中市', '巴中市', '2', '0', 'system', '2018-03-11 16:00:13', 'system', '2018-03-11 16:00:13', null);
INSERT INTO `js_sys_area` VALUES ('511901', '511900', '0,510000,511900,', '23990', '0000000230,0000002570,0000023990,', '1', '2', '四川省/巴中市/市辖区', '市辖区', '3', '0', 'system', '2018-03-11 16:00:13', 'system', '2018-03-11 16:00:13', null);
INSERT INTO `js_sys_area` VALUES ('511902', '511900', '0,510000,511900,', '24000', '0000000230,0000002570,0000024000,', '1', '2', '四川省/巴中市/巴州区', '巴州区', '3', '0', 'system', '2018-03-11 16:00:13', 'system', '2018-03-11 16:00:13', null);
INSERT INTO `js_sys_area` VALUES ('511921', '511900', '0,510000,511900,', '24010', '0000000230,0000002570,0000024010,', '1', '2', '四川省/巴中市/通江县', '通江县', '3', '0', 'system', '2018-03-11 16:00:13', 'system', '2018-03-11 16:00:13', null);
INSERT INTO `js_sys_area` VALUES ('511922', '511900', '0,510000,511900,', '24020', '0000000230,0000002570,0000024020,', '1', '2', '四川省/巴中市/南江县', '南江县', '3', '0', 'system', '2018-03-11 16:00:13', 'system', '2018-03-11 16:00:13', null);
INSERT INTO `js_sys_area` VALUES ('511923', '511900', '0,510000,511900,', '24030', '0000000230,0000002570,0000024030,', '1', '2', '四川省/巴中市/平昌县', '平昌县', '3', '0', 'system', '2018-03-11 16:00:13', 'system', '2018-03-11 16:00:13', null);
INSERT INTO `js_sys_area` VALUES ('512000', '510000', '0,510000,', '2580', '0000000230,0000002580,', '0', '1', '四川省/资阳市', '资阳市', '2', '0', 'system', '2018-03-11 16:00:13', 'system', '2018-03-11 16:00:13', null);
INSERT INTO `js_sys_area` VALUES ('512001', '512000', '0,510000,512000,', '24040', '0000000230,0000002580,0000024040,', '1', '2', '四川省/资阳市/市辖区', '市辖区', '3', '0', 'system', '2018-03-11 16:00:13', 'system', '2018-03-11 16:00:13', null);
INSERT INTO `js_sys_area` VALUES ('512002', '512000', '0,510000,512000,', '24050', '0000000230,0000002580,0000024050,', '1', '2', '四川省/资阳市/雁江区', '雁江区', '3', '0', 'system', '2018-03-11 16:00:13', 'system', '2018-03-11 16:00:13', null);
INSERT INTO `js_sys_area` VALUES ('512021', '512000', '0,510000,512000,', '24060', '0000000230,0000002580,0000024060,', '1', '2', '四川省/资阳市/安岳县', '安岳县', '3', '0', 'system', '2018-03-11 16:00:13', 'system', '2018-03-11 16:00:13', null);
INSERT INTO `js_sys_area` VALUES ('512022', '512000', '0,510000,512000,', '24070', '0000000230,0000002580,0000024070,', '1', '2', '四川省/资阳市/乐至县', '乐至县', '3', '0', 'system', '2018-03-11 16:00:13', 'system', '2018-03-11 16:00:13', null);
INSERT INTO `js_sys_area` VALUES ('512081', '512000', '0,510000,512000,', '24080', '0000000230,0000002580,0000024080,', '1', '2', '四川省/资阳市/简阳市', '简阳市', '3', '0', 'system', '2018-03-11 16:00:13', 'system', '2018-03-11 16:00:13', null);
INSERT INTO `js_sys_area` VALUES ('513200', '510000', '0,510000,', '2590', '0000000230,0000002590,', '0', '1', '四川省/阿坝藏族羌族自治州', '阿坝藏族羌族自治州', '2', '0', 'system', '2018-03-11 16:00:13', 'system', '2018-03-11 16:00:13', null);
INSERT INTO `js_sys_area` VALUES ('513221', '513200', '0,510000,513200,', '24090', '0000000230,0000002590,0000024090,', '1', '2', '四川省/阿坝藏族羌族自治州/汶川县', '汶川县', '3', '0', 'system', '2018-03-11 16:00:13', 'system', '2018-03-11 16:00:13', null);
INSERT INTO `js_sys_area` VALUES ('513222', '513200', '0,510000,513200,', '24100', '0000000230,0000002590,0000024100,', '1', '2', '四川省/阿坝藏族羌族自治州/理　县', '理　县', '3', '0', 'system', '2018-03-11 16:00:13', 'system', '2018-03-11 16:00:13', null);
INSERT INTO `js_sys_area` VALUES ('513223', '513200', '0,510000,513200,', '24110', '0000000230,0000002590,0000024110,', '1', '2', '四川省/阿坝藏族羌族自治州/茂　县', '茂　县', '3', '0', 'system', '2018-03-11 16:00:13', 'system', '2018-03-11 16:00:13', null);
INSERT INTO `js_sys_area` VALUES ('513224', '513200', '0,510000,513200,', '24120', '0000000230,0000002590,0000024120,', '1', '2', '四川省/阿坝藏族羌族自治州/松潘县', '松潘县', '3', '0', 'system', '2018-03-11 16:00:13', 'system', '2018-03-11 16:00:13', null);
INSERT INTO `js_sys_area` VALUES ('513225', '513200', '0,510000,513200,', '24130', '0000000230,0000002590,0000024130,', '1', '2', '四川省/阿坝藏族羌族自治州/九寨沟县', '九寨沟县', '3', '0', 'system', '2018-03-11 16:00:13', 'system', '2018-03-11 16:00:13', null);
INSERT INTO `js_sys_area` VALUES ('513226', '513200', '0,510000,513200,', '24140', '0000000230,0000002590,0000024140,', '1', '2', '四川省/阿坝藏族羌族自治州/金川县', '金川县', '3', '0', 'system', '2018-03-11 16:00:13', 'system', '2018-03-11 16:00:13', null);
INSERT INTO `js_sys_area` VALUES ('513227', '513200', '0,510000,513200,', '24150', '0000000230,0000002590,0000024150,', '1', '2', '四川省/阿坝藏族羌族自治州/小金县', '小金县', '3', '0', 'system', '2018-03-11 16:00:13', 'system', '2018-03-11 16:00:13', null);
INSERT INTO `js_sys_area` VALUES ('513228', '513200', '0,510000,513200,', '24160', '0000000230,0000002590,0000024160,', '1', '2', '四川省/阿坝藏族羌族自治州/黑水县', '黑水县', '3', '0', 'system', '2018-03-11 16:00:13', 'system', '2018-03-11 16:00:13', null);
INSERT INTO `js_sys_area` VALUES ('513229', '513200', '0,510000,513200,', '24170', '0000000230,0000002590,0000024170,', '1', '2', '四川省/阿坝藏族羌族自治州/马尔康县', '马尔康县', '3', '0', 'system', '2018-03-11 16:00:13', 'system', '2018-03-11 16:00:13', null);
INSERT INTO `js_sys_area` VALUES ('513230', '513200', '0,510000,513200,', '24180', '0000000230,0000002590,0000024180,', '1', '2', '四川省/阿坝藏族羌族自治州/壤塘县', '壤塘县', '3', '0', 'system', '2018-03-11 16:00:13', 'system', '2018-03-11 16:00:13', null);
INSERT INTO `js_sys_area` VALUES ('513231', '513200', '0,510000,513200,', '24190', '0000000230,0000002590,0000024190,', '1', '2', '四川省/阿坝藏族羌族自治州/阿坝县', '阿坝县', '3', '0', 'system', '2018-03-11 16:00:13', 'system', '2018-03-11 16:00:13', null);
INSERT INTO `js_sys_area` VALUES ('513232', '513200', '0,510000,513200,', '24200', '0000000230,0000002590,0000024200,', '1', '2', '四川省/阿坝藏族羌族自治州/若尔盖县', '若尔盖县', '3', '0', 'system', '2018-03-11 16:00:13', 'system', '2018-03-11 16:00:13', null);
INSERT INTO `js_sys_area` VALUES ('513233', '513200', '0,510000,513200,', '24210', '0000000230,0000002590,0000024210,', '1', '2', '四川省/阿坝藏族羌族自治州/红原县', '红原县', '3', '0', 'system', '2018-03-11 16:00:13', 'system', '2018-03-11 16:00:13', null);
INSERT INTO `js_sys_area` VALUES ('513300', '510000', '0,510000,', '2600', '0000000230,0000002600,', '0', '1', '四川省/甘孜藏族自治州', '甘孜藏族自治州', '2', '0', 'system', '2018-03-11 16:00:13', 'system', '2018-03-11 16:00:13', null);
INSERT INTO `js_sys_area` VALUES ('513321', '513300', '0,510000,513300,', '24220', '0000000230,0000002600,0000024220,', '1', '2', '四川省/甘孜藏族自治州/康定县', '康定县', '3', '0', 'system', '2018-03-11 16:00:13', 'system', '2018-03-11 16:00:13', null);
INSERT INTO `js_sys_area` VALUES ('513322', '513300', '0,510000,513300,', '24230', '0000000230,0000002600,0000024230,', '1', '2', '四川省/甘孜藏族自治州/泸定县', '泸定县', '3', '0', 'system', '2018-03-11 16:00:13', 'system', '2018-03-11 16:00:13', null);
INSERT INTO `js_sys_area` VALUES ('513323', '513300', '0,510000,513300,', '24240', '0000000230,0000002600,0000024240,', '1', '2', '四川省/甘孜藏族自治州/丹巴县', '丹巴县', '3', '0', 'system', '2018-03-11 16:00:13', 'system', '2018-03-11 16:00:13', null);
INSERT INTO `js_sys_area` VALUES ('513324', '513300', '0,510000,513300,', '24250', '0000000230,0000002600,0000024250,', '1', '2', '四川省/甘孜藏族自治州/九龙县', '九龙县', '3', '0', 'system', '2018-03-11 16:00:13', 'system', '2018-03-11 16:00:13', null);
INSERT INTO `js_sys_area` VALUES ('513325', '513300', '0,510000,513300,', '24260', '0000000230,0000002600,0000024260,', '1', '2', '四川省/甘孜藏族自治州/雅江县', '雅江县', '3', '0', 'system', '2018-03-11 16:00:13', 'system', '2018-03-11 16:00:13', null);
INSERT INTO `js_sys_area` VALUES ('513326', '513300', '0,510000,513300,', '24270', '0000000230,0000002600,0000024270,', '1', '2', '四川省/甘孜藏族自治州/道孚县', '道孚县', '3', '0', 'system', '2018-03-11 16:00:13', 'system', '2018-03-11 16:00:13', null);
INSERT INTO `js_sys_area` VALUES ('513327', '513300', '0,510000,513300,', '24280', '0000000230,0000002600,0000024280,', '1', '2', '四川省/甘孜藏族自治州/炉霍县', '炉霍县', '3', '0', 'system', '2018-03-11 16:00:13', 'system', '2018-03-11 16:00:13', null);
INSERT INTO `js_sys_area` VALUES ('513328', '513300', '0,510000,513300,', '24290', '0000000230,0000002600,0000024290,', '1', '2', '四川省/甘孜藏族自治州/甘孜县', '甘孜县', '3', '0', 'system', '2018-03-11 16:00:13', 'system', '2018-03-11 16:00:13', null);
INSERT INTO `js_sys_area` VALUES ('513329', '513300', '0,510000,513300,', '24300', '0000000230,0000002600,0000024300,', '1', '2', '四川省/甘孜藏族自治州/新龙县', '新龙县', '3', '0', 'system', '2018-03-11 16:00:13', 'system', '2018-03-11 16:00:13', null);
INSERT INTO `js_sys_area` VALUES ('513330', '513300', '0,510000,513300,', '24310', '0000000230,0000002600,0000024310,', '1', '2', '四川省/甘孜藏族自治州/德格县', '德格县', '3', '0', 'system', '2018-03-11 16:00:13', 'system', '2018-03-11 16:00:13', null);
INSERT INTO `js_sys_area` VALUES ('513331', '513300', '0,510000,513300,', '24320', '0000000230,0000002600,0000024320,', '1', '2', '四川省/甘孜藏族自治州/白玉县', '白玉县', '3', '0', 'system', '2018-03-11 16:00:13', 'system', '2018-03-11 16:00:13', null);
INSERT INTO `js_sys_area` VALUES ('513332', '513300', '0,510000,513300,', '24330', '0000000230,0000002600,0000024330,', '1', '2', '四川省/甘孜藏族自治州/石渠县', '石渠县', '3', '0', 'system', '2018-03-11 16:00:13', 'system', '2018-03-11 16:00:13', null);
INSERT INTO `js_sys_area` VALUES ('513333', '513300', '0,510000,513300,', '24340', '0000000230,0000002600,0000024340,', '1', '2', '四川省/甘孜藏族自治州/色达县', '色达县', '3', '0', 'system', '2018-03-11 16:00:13', 'system', '2018-03-11 16:00:13', null);
INSERT INTO `js_sys_area` VALUES ('513334', '513300', '0,510000,513300,', '24350', '0000000230,0000002600,0000024350,', '1', '2', '四川省/甘孜藏族自治州/理塘县', '理塘县', '3', '0', 'system', '2018-03-11 16:00:14', 'system', '2018-03-11 16:00:14', null);
INSERT INTO `js_sys_area` VALUES ('513335', '513300', '0,510000,513300,', '24360', '0000000230,0000002600,0000024360,', '1', '2', '四川省/甘孜藏族自治州/巴塘县', '巴塘县', '3', '0', 'system', '2018-03-11 16:00:14', 'system', '2018-03-11 16:00:14', null);
INSERT INTO `js_sys_area` VALUES ('513336', '513300', '0,510000,513300,', '24370', '0000000230,0000002600,0000024370,', '1', '2', '四川省/甘孜藏族自治州/乡城县', '乡城县', '3', '0', 'system', '2018-03-11 16:00:14', 'system', '2018-03-11 16:00:14', null);
INSERT INTO `js_sys_area` VALUES ('513337', '513300', '0,510000,513300,', '24380', '0000000230,0000002600,0000024380,', '1', '2', '四川省/甘孜藏族自治州/稻城县', '稻城县', '3', '0', 'system', '2018-03-11 16:00:14', 'system', '2018-03-11 16:00:14', null);
INSERT INTO `js_sys_area` VALUES ('513338', '513300', '0,510000,513300,', '24390', '0000000230,0000002600,0000024390,', '1', '2', '四川省/甘孜藏族自治州/得荣县', '得荣县', '3', '0', 'system', '2018-03-11 16:00:14', 'system', '2018-03-11 16:00:14', null);
INSERT INTO `js_sys_area` VALUES ('513400', '510000', '0,510000,', '2610', '0000000230,0000002610,', '0', '1', '四川省/凉山彝族自治州', '凉山彝族自治州', '2', '0', 'system', '2018-03-11 16:00:14', 'system', '2018-03-11 16:00:14', null);
INSERT INTO `js_sys_area` VALUES ('513401', '513400', '0,510000,513400,', '24400', '0000000230,0000002610,0000024400,', '1', '2', '四川省/凉山彝族自治州/西昌市', '西昌市', '3', '0', 'system', '2018-03-11 16:00:14', 'system', '2018-03-11 16:00:14', null);
INSERT INTO `js_sys_area` VALUES ('513422', '513400', '0,510000,513400,', '24410', '0000000230,0000002610,0000024410,', '1', '2', '四川省/凉山彝族自治州/木里藏族自治县', '木里藏族自治县', '3', '0', 'system', '2018-03-11 16:00:14', 'system', '2018-03-11 16:00:14', null);
INSERT INTO `js_sys_area` VALUES ('513423', '513400', '0,510000,513400,', '24420', '0000000230,0000002610,0000024420,', '1', '2', '四川省/凉山彝族自治州/盐源县', '盐源县', '3', '0', 'system', '2018-03-11 16:00:14', 'system', '2018-03-11 16:00:14', null);
INSERT INTO `js_sys_area` VALUES ('513424', '513400', '0,510000,513400,', '24430', '0000000230,0000002610,0000024430,', '1', '2', '四川省/凉山彝族自治州/德昌县', '德昌县', '3', '0', 'system', '2018-03-11 16:00:14', 'system', '2018-03-11 16:00:14', null);
INSERT INTO `js_sys_area` VALUES ('513425', '513400', '0,510000,513400,', '24440', '0000000230,0000002610,0000024440,', '1', '2', '四川省/凉山彝族自治州/会理县', '会理县', '3', '0', 'system', '2018-03-11 16:00:14', 'system', '2018-03-11 16:00:14', null);
INSERT INTO `js_sys_area` VALUES ('513426', '513400', '0,510000,513400,', '24450', '0000000230,0000002610,0000024450,', '1', '2', '四川省/凉山彝族自治州/会东县', '会东县', '3', '0', 'system', '2018-03-11 16:00:14', 'system', '2018-03-11 16:00:14', null);
INSERT INTO `js_sys_area` VALUES ('513427', '513400', '0,510000,513400,', '24460', '0000000230,0000002610,0000024460,', '1', '2', '四川省/凉山彝族自治州/宁南县', '宁南县', '3', '0', 'system', '2018-03-11 16:00:14', 'system', '2018-03-11 16:00:14', null);
INSERT INTO `js_sys_area` VALUES ('513428', '513400', '0,510000,513400,', '24470', '0000000230,0000002610,0000024470,', '1', '2', '四川省/凉山彝族自治州/普格县', '普格县', '3', '0', 'system', '2018-03-11 16:00:14', 'system', '2018-03-11 16:00:14', null);
INSERT INTO `js_sys_area` VALUES ('513429', '513400', '0,510000,513400,', '24480', '0000000230,0000002610,0000024480,', '1', '2', '四川省/凉山彝族自治州/布拖县', '布拖县', '3', '0', 'system', '2018-03-11 16:00:14', 'system', '2018-03-11 16:00:14', null);
INSERT INTO `js_sys_area` VALUES ('513430', '513400', '0,510000,513400,', '24490', '0000000230,0000002610,0000024490,', '1', '2', '四川省/凉山彝族自治州/金阳县', '金阳县', '3', '0', 'system', '2018-03-11 16:00:14', 'system', '2018-03-11 16:00:14', null);
INSERT INTO `js_sys_area` VALUES ('513431', '513400', '0,510000,513400,', '24500', '0000000230,0000002610,0000024500,', '1', '2', '四川省/凉山彝族自治州/昭觉县', '昭觉县', '3', '0', 'system', '2018-03-11 16:00:14', 'system', '2018-03-11 16:00:14', null);
INSERT INTO `js_sys_area` VALUES ('513432', '513400', '0,510000,513400,', '24510', '0000000230,0000002610,0000024510,', '1', '2', '四川省/凉山彝族自治州/喜德县', '喜德县', '3', '0', 'system', '2018-03-11 16:00:14', 'system', '2018-03-11 16:00:14', null);
INSERT INTO `js_sys_area` VALUES ('513433', '513400', '0,510000,513400,', '24520', '0000000230,0000002610,0000024520,', '1', '2', '四川省/凉山彝族自治州/冕宁县', '冕宁县', '3', '0', 'system', '2018-03-11 16:00:14', 'system', '2018-03-11 16:00:14', null);
INSERT INTO `js_sys_area` VALUES ('513434', '513400', '0,510000,513400,', '24530', '0000000230,0000002610,0000024530,', '1', '2', '四川省/凉山彝族自治州/越西县', '越西县', '3', '0', 'system', '2018-03-11 16:00:14', 'system', '2018-03-11 16:00:14', null);
INSERT INTO `js_sys_area` VALUES ('513435', '513400', '0,510000,513400,', '24540', '0000000230,0000002610,0000024540,', '1', '2', '四川省/凉山彝族自治州/甘洛县', '甘洛县', '3', '0', 'system', '2018-03-11 16:00:14', 'system', '2018-03-11 16:00:14', null);
INSERT INTO `js_sys_area` VALUES ('513436', '513400', '0,510000,513400,', '24550', '0000000230,0000002610,0000024550,', '1', '2', '四川省/凉山彝族自治州/美姑县', '美姑县', '3', '0', 'system', '2018-03-11 16:00:14', 'system', '2018-03-11 16:00:14', null);
INSERT INTO `js_sys_area` VALUES ('513437', '513400', '0,510000,513400,', '24560', '0000000230,0000002610,0000024560,', '1', '2', '四川省/凉山彝族自治州/雷波县', '雷波县', '3', '0', 'system', '2018-03-11 16:00:14', 'system', '2018-03-11 16:00:14', null);
INSERT INTO `js_sys_area` VALUES ('520000', '0', '0,', '240', '0000000240,', '0', '0', '贵州省', '贵州省', '1', '0', 'system', '2018-03-11 16:00:14', 'system', '2018-03-11 16:00:14', null);
INSERT INTO `js_sys_area` VALUES ('520100', '520000', '0,520000,', '2620', '0000000240,0000002620,', '0', '1', '贵州省/贵阳市', '贵阳市', '2', '0', 'system', '2018-03-11 16:00:14', 'system', '2018-03-11 16:00:14', null);
INSERT INTO `js_sys_area` VALUES ('520101', '520100', '0,520000,520100,', '24570', '0000000240,0000002620,0000024570,', '1', '2', '贵州省/贵阳市/市辖区', '市辖区', '3', '0', 'system', '2018-03-11 16:00:14', 'system', '2018-03-11 16:00:14', null);
INSERT INTO `js_sys_area` VALUES ('520102', '520100', '0,520000,520100,', '24580', '0000000240,0000002620,0000024580,', '1', '2', '贵州省/贵阳市/南明区', '南明区', '3', '0', 'system', '2018-03-11 16:00:14', 'system', '2018-03-11 16:00:14', null);
INSERT INTO `js_sys_area` VALUES ('520103', '520100', '0,520000,520100,', '24590', '0000000240,0000002620,0000024590,', '1', '2', '贵州省/贵阳市/云岩区', '云岩区', '3', '0', 'system', '2018-03-11 16:00:14', 'system', '2018-03-11 16:00:14', null);
INSERT INTO `js_sys_area` VALUES ('520111', '520100', '0,520000,520100,', '24600', '0000000240,0000002620,0000024600,', '1', '2', '贵州省/贵阳市/花溪区', '花溪区', '3', '0', 'system', '2018-03-11 16:00:14', 'system', '2018-03-11 16:00:14', null);
INSERT INTO `js_sys_area` VALUES ('520112', '520100', '0,520000,520100,', '24610', '0000000240,0000002620,0000024610,', '1', '2', '贵州省/贵阳市/乌当区', '乌当区', '3', '0', 'system', '2018-03-11 16:00:14', 'system', '2018-03-11 16:00:14', null);
INSERT INTO `js_sys_area` VALUES ('520113', '520100', '0,520000,520100,', '24620', '0000000240,0000002620,0000024620,', '1', '2', '贵州省/贵阳市/白云区', '白云区', '3', '0', 'system', '2018-03-11 16:00:14', 'system', '2018-03-11 16:00:14', null);
INSERT INTO `js_sys_area` VALUES ('520114', '520100', '0,520000,520100,', '24630', '0000000240,0000002620,0000024630,', '1', '2', '贵州省/贵阳市/小河区', '小河区', '3', '0', 'system', '2018-03-11 16:00:14', 'system', '2018-03-11 16:00:14', null);
INSERT INTO `js_sys_area` VALUES ('520121', '520100', '0,520000,520100,', '24640', '0000000240,0000002620,0000024640,', '1', '2', '贵州省/贵阳市/开阳县', '开阳县', '3', '0', 'system', '2018-03-11 16:00:14', 'system', '2018-03-11 16:00:14', null);
INSERT INTO `js_sys_area` VALUES ('520122', '520100', '0,520000,520100,', '24650', '0000000240,0000002620,0000024650,', '1', '2', '贵州省/贵阳市/息烽县', '息烽县', '3', '0', 'system', '2018-03-11 16:00:14', 'system', '2018-03-11 16:00:14', null);
INSERT INTO `js_sys_area` VALUES ('520123', '520100', '0,520000,520100,', '24660', '0000000240,0000002620,0000024660,', '1', '2', '贵州省/贵阳市/修文县', '修文县', '3', '0', 'system', '2018-03-11 16:00:14', 'system', '2018-03-11 16:00:14', null);
INSERT INTO `js_sys_area` VALUES ('520181', '520100', '0,520000,520100,', '24670', '0000000240,0000002620,0000024670,', '1', '2', '贵州省/贵阳市/清镇市', '清镇市', '3', '0', 'system', '2018-03-11 16:00:14', 'system', '2018-03-11 16:00:14', null);
INSERT INTO `js_sys_area` VALUES ('520200', '520000', '0,520000,', '2630', '0000000240,0000002630,', '0', '1', '贵州省/六盘水市', '六盘水市', '2', '0', 'system', '2018-03-11 16:00:14', 'system', '2018-03-11 16:00:14', null);
INSERT INTO `js_sys_area` VALUES ('520201', '520200', '0,520000,520200,', '24680', '0000000240,0000002630,0000024680,', '1', '2', '贵州省/六盘水市/钟山区', '钟山区', '3', '0', 'system', '2018-03-11 16:00:14', 'system', '2018-03-11 16:00:14', null);
INSERT INTO `js_sys_area` VALUES ('520203', '520200', '0,520000,520200,', '24690', '0000000240,0000002630,0000024690,', '1', '2', '贵州省/六盘水市/六枝特区', '六枝特区', '3', '0', 'system', '2018-03-11 16:00:14', 'system', '2018-03-11 16:00:14', null);
INSERT INTO `js_sys_area` VALUES ('520221', '520200', '0,520000,520200,', '24700', '0000000240,0000002630,0000024700,', '1', '2', '贵州省/六盘水市/水城县', '水城县', '3', '0', 'system', '2018-03-11 16:00:14', 'system', '2018-03-11 16:00:14', null);
INSERT INTO `js_sys_area` VALUES ('520222', '520200', '0,520000,520200,', '24710', '0000000240,0000002630,0000024710,', '1', '2', '贵州省/六盘水市/盘　县', '盘　县', '3', '0', 'system', '2018-03-11 16:00:14', 'system', '2018-03-11 16:00:14', null);
INSERT INTO `js_sys_area` VALUES ('520300', '520000', '0,520000,', '2640', '0000000240,0000002640,', '0', '1', '贵州省/遵义市', '遵义市', '2', '0', 'system', '2018-03-11 16:00:14', 'system', '2018-03-11 16:00:14', null);
INSERT INTO `js_sys_area` VALUES ('520301', '520300', '0,520000,520300,', '24720', '0000000240,0000002640,0000024720,', '1', '2', '贵州省/遵义市/市辖区', '市辖区', '3', '0', 'system', '2018-03-11 16:00:14', 'system', '2018-03-11 16:00:14', null);
INSERT INTO `js_sys_area` VALUES ('520302', '520300', '0,520000,520300,', '24730', '0000000240,0000002640,0000024730,', '1', '2', '贵州省/遵义市/红花岗区', '红花岗区', '3', '0', 'system', '2018-03-11 16:00:14', 'system', '2018-03-11 16:00:14', null);
INSERT INTO `js_sys_area` VALUES ('520303', '520300', '0,520000,520300,', '24740', '0000000240,0000002640,0000024740,', '1', '2', '贵州省/遵义市/汇川区', '汇川区', '3', '0', 'system', '2018-03-11 16:00:14', 'system', '2018-03-11 16:00:14', null);
INSERT INTO `js_sys_area` VALUES ('520321', '520300', '0,520000,520300,', '24750', '0000000240,0000002640,0000024750,', '1', '2', '贵州省/遵义市/遵义县', '遵义县', '3', '0', 'system', '2018-03-11 16:00:14', 'system', '2018-03-11 16:00:14', null);
INSERT INTO `js_sys_area` VALUES ('520322', '520300', '0,520000,520300,', '24760', '0000000240,0000002640,0000024760,', '1', '2', '贵州省/遵义市/桐梓县', '桐梓县', '3', '0', 'system', '2018-03-11 16:00:14', 'system', '2018-03-11 16:00:14', null);
INSERT INTO `js_sys_area` VALUES ('520323', '520300', '0,520000,520300,', '24770', '0000000240,0000002640,0000024770,', '1', '2', '贵州省/遵义市/绥阳县', '绥阳县', '3', '0', 'system', '2018-03-11 16:00:14', 'system', '2018-03-11 16:00:14', null);
INSERT INTO `js_sys_area` VALUES ('520324', '520300', '0,520000,520300,', '24780', '0000000240,0000002640,0000024780,', '1', '2', '贵州省/遵义市/正安县', '正安县', '3', '0', 'system', '2018-03-11 16:00:14', 'system', '2018-03-11 16:00:14', null);
INSERT INTO `js_sys_area` VALUES ('520325', '520300', '0,520000,520300,', '24790', '0000000240,0000002640,0000024790,', '1', '2', '贵州省/遵义市/道真仡佬族苗族自治县', '道真仡佬族苗族自治县', '3', '0', 'system', '2018-03-11 16:00:14', 'system', '2018-03-11 16:00:14', null);
INSERT INTO `js_sys_area` VALUES ('520326', '520300', '0,520000,520300,', '24800', '0000000240,0000002640,0000024800,', '1', '2', '贵州省/遵义市/务川仡佬族苗族自治县', '务川仡佬族苗族自治县', '3', '0', 'system', '2018-03-11 16:00:14', 'system', '2018-03-11 16:00:14', null);
INSERT INTO `js_sys_area` VALUES ('520327', '520300', '0,520000,520300,', '24810', '0000000240,0000002640,0000024810,', '1', '2', '贵州省/遵义市/凤冈县', '凤冈县', '3', '0', 'system', '2018-03-11 16:00:14', 'system', '2018-03-11 16:00:14', null);
INSERT INTO `js_sys_area` VALUES ('520328', '520300', '0,520000,520300,', '24820', '0000000240,0000002640,0000024820,', '1', '2', '贵州省/遵义市/湄潭县', '湄潭县', '3', '0', 'system', '2018-03-11 16:00:14', 'system', '2018-03-11 16:00:14', null);
INSERT INTO `js_sys_area` VALUES ('520329', '520300', '0,520000,520300,', '24830', '0000000240,0000002640,0000024830,', '1', '2', '贵州省/遵义市/余庆县', '余庆县', '3', '0', 'system', '2018-03-11 16:00:14', 'system', '2018-03-11 16:00:14', null);
INSERT INTO `js_sys_area` VALUES ('520330', '520300', '0,520000,520300,', '24840', '0000000240,0000002640,0000024840,', '1', '2', '贵州省/遵义市/习水县', '习水县', '3', '0', 'system', '2018-03-11 16:00:14', 'system', '2018-03-11 16:00:14', null);
INSERT INTO `js_sys_area` VALUES ('520381', '520300', '0,520000,520300,', '24850', '0000000240,0000002640,0000024850,', '1', '2', '贵州省/遵义市/赤水市', '赤水市', '3', '0', 'system', '2018-03-11 16:00:14', 'system', '2018-03-11 16:00:14', null);
INSERT INTO `js_sys_area` VALUES ('520382', '520300', '0,520000,520300,', '24860', '0000000240,0000002640,0000024860,', '1', '2', '贵州省/遵义市/仁怀市', '仁怀市', '3', '0', 'system', '2018-03-11 16:00:14', 'system', '2018-03-11 16:00:14', null);
INSERT INTO `js_sys_area` VALUES ('520400', '520000', '0,520000,', '2650', '0000000240,0000002650,', '0', '1', '贵州省/安顺市', '安顺市', '2', '0', 'system', '2018-03-11 16:00:14', 'system', '2018-03-11 16:00:14', null);
INSERT INTO `js_sys_area` VALUES ('520401', '520400', '0,520000,520400,', '24870', '0000000240,0000002650,0000024870,', '1', '2', '贵州省/安顺市/市辖区', '市辖区', '3', '0', 'system', '2018-03-11 16:00:14', 'system', '2018-03-11 16:00:14', null);
INSERT INTO `js_sys_area` VALUES ('520402', '520400', '0,520000,520400,', '24880', '0000000240,0000002650,0000024880,', '1', '2', '贵州省/安顺市/西秀区', '西秀区', '3', '0', 'system', '2018-03-11 16:00:14', 'system', '2018-03-11 16:00:14', null);
INSERT INTO `js_sys_area` VALUES ('520421', '520400', '0,520000,520400,', '24890', '0000000240,0000002650,0000024890,', '1', '2', '贵州省/安顺市/平坝县', '平坝县', '3', '0', 'system', '2018-03-11 16:00:14', 'system', '2018-03-11 16:00:14', null);
INSERT INTO `js_sys_area` VALUES ('520422', '520400', '0,520000,520400,', '24900', '0000000240,0000002650,0000024900,', '1', '2', '贵州省/安顺市/普定县', '普定县', '3', '0', 'system', '2018-03-11 16:00:14', 'system', '2018-03-11 16:00:14', null);
INSERT INTO `js_sys_area` VALUES ('520423', '520400', '0,520000,520400,', '24910', '0000000240,0000002650,0000024910,', '1', '2', '贵州省/安顺市/镇宁布依族苗族自治县', '镇宁布依族苗族自治县', '3', '0', 'system', '2018-03-11 16:00:14', 'system', '2018-03-11 16:00:14', null);
INSERT INTO `js_sys_area` VALUES ('520424', '520400', '0,520000,520400,', '24920', '0000000240,0000002650,0000024920,', '1', '2', '贵州省/安顺市/关岭布依族苗族自治县', '关岭布依族苗族自治县', '3', '0', 'system', '2018-03-11 16:00:15', 'system', '2018-03-11 16:00:15', null);
INSERT INTO `js_sys_area` VALUES ('520425', '520400', '0,520000,520400,', '24930', '0000000240,0000002650,0000024930,', '1', '2', '贵州省/安顺市/紫云苗族布依族自治县', '紫云苗族布依族自治县', '3', '0', 'system', '2018-03-11 16:00:15', 'system', '2018-03-11 16:00:15', null);
INSERT INTO `js_sys_area` VALUES ('522200', '520000', '0,520000,', '2660', '0000000240,0000002660,', '0', '1', '贵州省/铜仁地区', '铜仁地区', '2', '0', 'system', '2018-03-11 16:00:15', 'system', '2018-03-11 16:00:15', null);
INSERT INTO `js_sys_area` VALUES ('522201', '522200', '0,520000,522200,', '24940', '0000000240,0000002660,0000024940,', '1', '2', '贵州省/铜仁地区/铜仁市', '铜仁市', '3', '0', 'system', '2018-03-11 16:00:15', 'system', '2018-03-11 16:00:15', null);
INSERT INTO `js_sys_area` VALUES ('522222', '522200', '0,520000,522200,', '24950', '0000000240,0000002660,0000024950,', '1', '2', '贵州省/铜仁地区/江口县', '江口县', '3', '0', 'system', '2018-03-11 16:00:15', 'system', '2018-03-11 16:00:15', null);
INSERT INTO `js_sys_area` VALUES ('522223', '522200', '0,520000,522200,', '24960', '0000000240,0000002660,0000024960,', '1', '2', '贵州省/铜仁地区/玉屏侗族自治县', '玉屏侗族自治县', '3', '0', 'system', '2018-03-11 16:00:15', 'system', '2018-03-11 16:00:15', null);
INSERT INTO `js_sys_area` VALUES ('522224', '522200', '0,520000,522200,', '24970', '0000000240,0000002660,0000024970,', '1', '2', '贵州省/铜仁地区/石阡县', '石阡县', '3', '0', 'system', '2018-03-11 16:00:15', 'system', '2018-03-11 16:00:15', null);
INSERT INTO `js_sys_area` VALUES ('522225', '522200', '0,520000,522200,', '24980', '0000000240,0000002660,0000024980,', '1', '2', '贵州省/铜仁地区/思南县', '思南县', '3', '0', 'system', '2018-03-11 16:00:15', 'system', '2018-03-11 16:00:15', null);
INSERT INTO `js_sys_area` VALUES ('522226', '522200', '0,520000,522200,', '24990', '0000000240,0000002660,0000024990,', '1', '2', '贵州省/铜仁地区/印江土家族苗族自治县', '印江土家族苗族自治县', '3', '0', 'system', '2018-03-11 16:00:15', 'system', '2018-03-11 16:00:15', null);
INSERT INTO `js_sys_area` VALUES ('522227', '522200', '0,520000,522200,', '25000', '0000000240,0000002660,0000025000,', '1', '2', '贵州省/铜仁地区/德江县', '德江县', '3', '0', 'system', '2018-03-11 16:00:15', 'system', '2018-03-11 16:00:15', null);
INSERT INTO `js_sys_area` VALUES ('522228', '522200', '0,520000,522200,', '25010', '0000000240,0000002660,0000025010,', '1', '2', '贵州省/铜仁地区/沿河土家族自治县', '沿河土家族自治县', '3', '0', 'system', '2018-03-11 16:00:15', 'system', '2018-03-11 16:00:15', null);
INSERT INTO `js_sys_area` VALUES ('522229', '522200', '0,520000,522200,', '25020', '0000000240,0000002660,0000025020,', '1', '2', '贵州省/铜仁地区/松桃苗族自治县', '松桃苗族自治县', '3', '0', 'system', '2018-03-11 16:00:15', 'system', '2018-03-11 16:00:15', null);
INSERT INTO `js_sys_area` VALUES ('522230', '522200', '0,520000,522200,', '25030', '0000000240,0000002660,0000025030,', '1', '2', '贵州省/铜仁地区/万山特区', '万山特区', '3', '0', 'system', '2018-03-11 16:00:15', 'system', '2018-03-11 16:00:15', null);
INSERT INTO `js_sys_area` VALUES ('522400', '520000', '0,520000,', '2680', '0000000240,0000002680,', '0', '1', '贵州省/毕节地区', '毕节地区', '2', '0', 'system', '2018-03-11 16:00:15', 'system', '2018-03-11 16:00:15', null);
INSERT INTO `js_sys_area` VALUES ('522401', '522400', '0,520000,522400,', '25120', '0000000240,0000002680,0000025120,', '1', '2', '贵州省/毕节地区/毕节市', '毕节市', '3', '0', 'system', '2018-03-11 16:00:15', 'system', '2018-03-11 16:00:15', null);
INSERT INTO `js_sys_area` VALUES ('522422', '522400', '0,520000,522400,', '25130', '0000000240,0000002680,0000025130,', '1', '2', '贵州省/毕节地区/大方县', '大方县', '3', '0', 'system', '2018-03-11 16:00:15', 'system', '2018-03-11 16:00:15', null);
INSERT INTO `js_sys_area` VALUES ('522423', '522400', '0,520000,522400,', '25140', '0000000240,0000002680,0000025140,', '1', '2', '贵州省/毕节地区/黔西县', '黔西县', '3', '0', 'system', '2018-03-11 16:00:15', 'system', '2018-03-11 16:00:15', null);
INSERT INTO `js_sys_area` VALUES ('522424', '522400', '0,520000,522400,', '25150', '0000000240,0000002680,0000025150,', '1', '2', '贵州省/毕节地区/金沙县', '金沙县', '3', '0', 'system', '2018-03-11 16:00:15', 'system', '2018-03-11 16:00:15', null);
INSERT INTO `js_sys_area` VALUES ('522425', '522400', '0,520000,522400,', '25160', '0000000240,0000002680,0000025160,', '1', '2', '贵州省/毕节地区/织金县', '织金县', '3', '0', 'system', '2018-03-11 16:00:15', 'system', '2018-03-11 16:00:15', null);
INSERT INTO `js_sys_area` VALUES ('522426', '522400', '0,520000,522400,', '25170', '0000000240,0000002680,0000025170,', '1', '2', '贵州省/毕节地区/纳雍县', '纳雍县', '3', '0', 'system', '2018-03-11 16:00:15', 'system', '2018-03-11 16:00:15', null);
INSERT INTO `js_sys_area` VALUES ('522428', '522400', '0,520000,522400,', '25190', '0000000240,0000002680,0000025190,', '1', '2', '贵州省/毕节地区/赫章县', '赫章县', '3', '0', 'system', '2018-03-11 16:00:15', 'system', '2018-03-11 16:00:15', null);
INSERT INTO `js_sys_area` VALUES ('522600', '520000', '0,520000,', '2690', '0000000240,0000002690,', '0', '1', '贵州省/黔东南苗族侗族自治州', '黔东南苗族侗族自治州', '2', '0', 'system', '2018-03-11 16:00:15', 'system', '2018-03-11 16:00:15', null);
INSERT INTO `js_sys_area` VALUES ('522601', '522600', '0,520000,522600,', '25200', '0000000240,0000002690,0000025200,', '1', '2', '贵州省/黔东南苗族侗族自治州/凯里市', '凯里市', '3', '0', 'system', '2018-03-11 16:00:15', 'system', '2018-03-11 16:00:15', null);
INSERT INTO `js_sys_area` VALUES ('522622', '522600', '0,520000,522600,', '25210', '0000000240,0000002690,0000025210,', '1', '2', '贵州省/黔东南苗族侗族自治州/黄平县', '黄平县', '3', '0', 'system', '2018-03-11 16:00:15', 'system', '2018-03-11 16:00:15', null);
INSERT INTO `js_sys_area` VALUES ('522623', '522600', '0,520000,522600,', '25220', '0000000240,0000002690,0000025220,', '1', '2', '贵州省/黔东南苗族侗族自治州/施秉县', '施秉县', '3', '0', 'system', '2018-03-11 16:00:15', 'system', '2018-03-11 16:00:15', null);
INSERT INTO `js_sys_area` VALUES ('522624', '522600', '0,520000,522600,', '25230', '0000000240,0000002690,0000025230,', '1', '2', '贵州省/黔东南苗族侗族自治州/三穗县', '三穗县', '3', '0', 'system', '2018-03-11 16:00:15', 'system', '2018-03-11 16:00:15', null);
INSERT INTO `js_sys_area` VALUES ('522625', '522600', '0,520000,522600,', '25240', '0000000240,0000002690,0000025240,', '1', '2', '贵州省/黔东南苗族侗族自治州/镇远县', '镇远县', '3', '0', 'system', '2018-03-11 16:00:15', 'system', '2018-03-11 16:00:15', null);
INSERT INTO `js_sys_area` VALUES ('522626', '522600', '0,520000,522600,', '25250', '0000000240,0000002690,0000025250,', '1', '2', '贵州省/黔东南苗族侗族自治州/岑巩县', '岑巩县', '3', '0', 'system', '2018-03-11 16:00:15', 'system', '2018-03-11 16:00:15', null);
INSERT INTO `js_sys_area` VALUES ('522627', '522600', '0,520000,522600,', '25260', '0000000240,0000002690,0000025260,', '1', '2', '贵州省/黔东南苗族侗族自治州/天柱县', '天柱县', '3', '0', 'system', '2018-03-11 16:00:15', 'system', '2018-03-11 16:00:15', null);
INSERT INTO `js_sys_area` VALUES ('522628', '522600', '0,520000,522600,', '25270', '0000000240,0000002690,0000025270,', '1', '2', '贵州省/黔东南苗族侗族自治州/锦屏县', '锦屏县', '3', '0', 'system', '2018-03-11 16:00:15', 'system', '2018-03-11 16:00:15', null);
INSERT INTO `js_sys_area` VALUES ('522629', '522600', '0,520000,522600,', '25280', '0000000240,0000002690,0000025280,', '1', '2', '贵州省/黔东南苗族侗族自治州/剑河县', '剑河县', '3', '0', 'system', '2018-03-11 16:00:15', 'system', '2018-03-11 16:00:15', null);
INSERT INTO `js_sys_area` VALUES ('522630', '522600', '0,520000,522600,', '25290', '0000000240,0000002690,0000025290,', '1', '2', '贵州省/黔东南苗族侗族自治州/台江县', '台江县', '3', '0', 'system', '2018-03-11 16:00:15', 'system', '2018-03-11 16:00:15', null);
INSERT INTO `js_sys_area` VALUES ('522631', '522600', '0,520000,522600,', '25300', '0000000240,0000002690,0000025300,', '1', '2', '贵州省/黔东南苗族侗族自治州/黎平县', '黎平县', '3', '0', 'system', '2018-03-11 16:00:15', 'system', '2018-03-11 16:00:15', null);
INSERT INTO `js_sys_area` VALUES ('522632', '522600', '0,520000,522600,', '25310', '0000000240,0000002690,0000025310,', '1', '2', '贵州省/黔东南苗族侗族自治州/榕江县', '榕江县', '3', '0', 'system', '2018-03-11 16:00:15', 'system', '2018-03-11 16:00:15', null);
INSERT INTO `js_sys_area` VALUES ('522633', '522600', '0,520000,522600,', '25320', '0000000240,0000002690,0000025320,', '1', '2', '贵州省/黔东南苗族侗族自治州/从江县', '从江县', '3', '0', 'system', '2018-03-11 16:00:15', 'system', '2018-03-11 16:00:15', null);
INSERT INTO `js_sys_area` VALUES ('522634', '522600', '0,520000,522600,', '25330', '0000000240,0000002690,0000025330,', '1', '2', '贵州省/黔东南苗族侗族自治州/雷山县', '雷山县', '3', '0', 'system', '2018-03-11 16:00:15', 'system', '2018-03-11 16:00:15', null);
INSERT INTO `js_sys_area` VALUES ('522635', '522600', '0,520000,522600,', '25340', '0000000240,0000002690,0000025340,', '1', '2', '贵州省/黔东南苗族侗族自治州/麻江县', '麻江县', '3', '0', 'system', '2018-03-11 16:00:15', 'system', '2018-03-11 16:00:15', null);
INSERT INTO `js_sys_area` VALUES ('522636', '522600', '0,520000,522600,', '25350', '0000000240,0000002690,0000025350,', '1', '2', '贵州省/黔东南苗族侗族自治州/丹寨县', '丹寨县', '3', '0', 'system', '2018-03-11 16:00:15', 'system', '2018-03-11 16:00:15', null);
INSERT INTO `js_sys_area` VALUES ('522700', '520000', '0,520000,', '2700', '0000000240,0000002700,', '0', '1', '贵州省/黔南布依族苗族自治州', '黔南布依族苗族自治州', '2', '0', 'system', '2018-03-11 16:00:15', 'system', '2018-03-11 16:00:15', null);
INSERT INTO `js_sys_area` VALUES ('522701', '522700', '0,520000,522700,', '25360', '0000000240,0000002700,0000025360,', '1', '2', '贵州省/黔南布依族苗族自治州/都匀市', '都匀市', '3', '0', 'system', '2018-03-11 16:00:15', 'system', '2018-03-11 16:00:15', null);
INSERT INTO `js_sys_area` VALUES ('522702', '522700', '0,520000,522700,', '25370', '0000000240,0000002700,0000025370,', '1', '2', '贵州省/黔南布依族苗族自治州/福泉市', '福泉市', '3', '0', 'system', '2018-03-11 16:00:15', 'system', '2018-03-11 16:00:15', null);
INSERT INTO `js_sys_area` VALUES ('522722', '522700', '0,520000,522700,', '25380', '0000000240,0000002700,0000025380,', '1', '2', '贵州省/黔南布依族苗族自治州/荔波县', '荔波县', '3', '0', 'system', '2018-03-11 16:00:15', 'system', '2018-03-11 16:00:15', null);
INSERT INTO `js_sys_area` VALUES ('522723', '522700', '0,520000,522700,', '25390', '0000000240,0000002700,0000025390,', '1', '2', '贵州省/黔南布依族苗族自治州/贵定县', '贵定县', '3', '0', 'system', '2018-03-11 16:00:15', 'system', '2018-03-11 16:00:15', null);
INSERT INTO `js_sys_area` VALUES ('522725', '522700', '0,520000,522700,', '25400', '0000000240,0000002700,0000025400,', '1', '2', '贵州省/黔南布依族苗族自治州/瓮安县', '瓮安县', '3', '0', 'system', '2018-03-11 16:00:15', 'system', '2018-03-11 16:00:15', null);
INSERT INTO `js_sys_area` VALUES ('522726', '522700', '0,520000,522700,', '25410', '0000000240,0000002700,0000025410,', '1', '2', '贵州省/黔南布依族苗族自治州/独山县', '独山县', '3', '0', 'system', '2018-03-11 16:00:15', 'system', '2018-03-11 16:00:15', null);
INSERT INTO `js_sys_area` VALUES ('522727', '522700', '0,520000,522700,', '25420', '0000000240,0000002700,0000025420,', '1', '2', '贵州省/黔南布依族苗族自治州/平塘县', '平塘县', '3', '0', 'system', '2018-03-11 16:00:15', 'system', '2018-03-11 16:00:15', null);
INSERT INTO `js_sys_area` VALUES ('522728', '522700', '0,520000,522700,', '25430', '0000000240,0000002700,0000025430,', '1', '2', '贵州省/黔南布依族苗族自治州/罗甸县', '罗甸县', '3', '0', 'system', '2018-03-11 16:00:15', 'system', '2018-03-11 16:00:15', null);
INSERT INTO `js_sys_area` VALUES ('522729', '522700', '0,520000,522700,', '25440', '0000000240,0000002700,0000025440,', '1', '2', '贵州省/黔南布依族苗族自治州/长顺县', '长顺县', '3', '0', 'system', '2018-03-11 16:00:15', 'system', '2018-03-11 16:00:15', null);
INSERT INTO `js_sys_area` VALUES ('522730', '522700', '0,520000,522700,', '25450', '0000000240,0000002700,0000025450,', '1', '2', '贵州省/黔南布依族苗族自治州/龙里县', '龙里县', '3', '0', 'system', '2018-03-11 16:00:15', 'system', '2018-03-11 16:00:15', null);
INSERT INTO `js_sys_area` VALUES ('522731', '522700', '0,520000,522700,', '25460', '0000000240,0000002700,0000025460,', '1', '2', '贵州省/黔南布依族苗族自治州/惠水县', '惠水县', '3', '0', 'system', '2018-03-11 16:00:15', 'system', '2018-03-11 16:00:15', null);
INSERT INTO `js_sys_area` VALUES ('522732', '522700', '0,520000,522700,', '25470', '0000000240,0000002700,0000025470,', '1', '2', '贵州省/黔南布依族苗族自治州/三都水族自治县', '三都水族自治县', '3', '0', 'system', '2018-03-11 16:00:15', 'system', '2018-03-11 16:00:15', null);
INSERT INTO `js_sys_area` VALUES ('530000', '0', '0,', '250', '0000000250,', '0', '0', '云南省', '云南省', '1', '0', 'system', '2018-03-11 16:00:15', 'system', '2018-03-11 16:00:15', null);
INSERT INTO `js_sys_area` VALUES ('530100', '530000', '0,530000,', '2710', '0000000250,0000002710,', '0', '1', '云南省/昆明市', '昆明市', '2', '0', 'system', '2018-03-11 16:00:15', 'system', '2018-03-11 16:00:15', null);
INSERT INTO `js_sys_area` VALUES ('530101', '530100', '0,530000,530100,', '25480', '0000000250,0000002710,0000025480,', '1', '2', '云南省/昆明市/市辖区', '市辖区', '3', '0', 'system', '2018-03-11 16:00:15', 'system', '2018-03-11 16:00:15', null);
INSERT INTO `js_sys_area` VALUES ('530102', '530100', '0,530000,530100,', '25490', '0000000250,0000002710,0000025490,', '1', '2', '云南省/昆明市/五华区', '五华区', '3', '0', 'system', '2018-03-11 16:00:15', 'system', '2018-03-11 16:00:15', null);
INSERT INTO `js_sys_area` VALUES ('530103', '530100', '0,530000,530100,', '25500', '0000000250,0000002710,0000025500,', '1', '2', '云南省/昆明市/盘龙区', '盘龙区', '3', '0', 'system', '2018-03-11 16:00:16', 'system', '2018-03-11 16:00:16', null);
INSERT INTO `js_sys_area` VALUES ('530111', '530100', '0,530000,530100,', '25510', '0000000250,0000002710,0000025510,', '1', '2', '云南省/昆明市/官渡区', '官渡区', '3', '0', 'system', '2018-03-11 16:00:16', 'system', '2018-03-11 16:00:16', null);
INSERT INTO `js_sys_area` VALUES ('530112', '530100', '0,530000,530100,', '25520', '0000000250,0000002710,0000025520,', '1', '2', '云南省/昆明市/西山区', '西山区', '3', '0', 'system', '2018-03-11 16:00:16', 'system', '2018-03-11 16:00:16', null);
INSERT INTO `js_sys_area` VALUES ('530113', '530100', '0,530000,530100,', '25530', '0000000250,0000002710,0000025530,', '1', '2', '云南省/昆明市/东川区', '东川区', '3', '0', 'system', '2018-03-11 16:00:16', 'system', '2018-03-11 16:00:16', null);
INSERT INTO `js_sys_area` VALUES ('530121', '530100', '0,530000,530100,', '25540', '0000000250,0000002710,0000025540,', '1', '2', '云南省/昆明市/呈贡县', '呈贡县', '3', '0', 'system', '2018-03-11 16:00:16', 'system', '2018-03-11 16:00:16', null);
INSERT INTO `js_sys_area` VALUES ('530122', '530100', '0,530000,530100,', '25550', '0000000250,0000002710,0000025550,', '1', '2', '云南省/昆明市/晋宁县', '晋宁县', '3', '0', 'system', '2018-03-11 16:00:16', 'system', '2018-03-11 16:00:16', null);
INSERT INTO `js_sys_area` VALUES ('530124', '530100', '0,530000,530100,', '25560', '0000000250,0000002710,0000025560,', '1', '2', '云南省/昆明市/富民县', '富民县', '3', '0', 'system', '2018-03-11 16:00:16', 'system', '2018-03-11 16:00:16', null);
INSERT INTO `js_sys_area` VALUES ('530125', '530100', '0,530000,530100,', '25570', '0000000250,0000002710,0000025570,', '1', '2', '云南省/昆明市/宜良县', '宜良县', '3', '0', 'system', '2018-03-11 16:00:16', 'system', '2018-03-11 16:00:16', null);
INSERT INTO `js_sys_area` VALUES ('530126', '530100', '0,530000,530100,', '25580', '0000000250,0000002710,0000025580,', '1', '2', '云南省/昆明市/石林彝族自治县', '石林彝族自治县', '3', '0', 'system', '2018-03-11 16:00:16', 'system', '2018-03-11 16:00:16', null);
INSERT INTO `js_sys_area` VALUES ('530127', '530100', '0,530000,530100,', '25590', '0000000250,0000002710,0000025590,', '1', '2', '云南省/昆明市/嵩明县', '嵩明县', '3', '0', 'system', '2018-03-11 16:00:16', 'system', '2018-03-11 16:00:16', null);
INSERT INTO `js_sys_area` VALUES ('530128', '530100', '0,530000,530100,', '25600', '0000000250,0000002710,0000025600,', '1', '2', '云南省/昆明市/禄劝彝族苗族自治县', '禄劝彝族苗族自治县', '3', '0', 'system', '2018-03-11 16:00:16', 'system', '2018-03-11 16:00:16', null);
INSERT INTO `js_sys_area` VALUES ('530129', '530100', '0,530000,530100,', '25610', '0000000250,0000002710,0000025610,', '1', '2', '云南省/昆明市/寻甸回族彝族自治县', '寻甸回族彝族自治县', '3', '0', 'system', '2018-03-11 16:00:16', 'system', '2018-03-11 16:00:16', null);
INSERT INTO `js_sys_area` VALUES ('530181', '530100', '0,530000,530100,', '25620', '0000000250,0000002710,0000025620,', '1', '2', '云南省/昆明市/安宁市', '安宁市', '3', '0', 'system', '2018-03-11 16:00:16', 'system', '2018-03-11 16:00:16', null);
INSERT INTO `js_sys_area` VALUES ('530300', '530000', '0,530000,', '2720', '0000000250,0000002720,', '0', '1', '云南省/曲靖市', '曲靖市', '2', '0', 'system', '2018-03-11 16:00:16', 'system', '2018-03-11 16:00:16', null);
INSERT INTO `js_sys_area` VALUES ('530301', '530300', '0,530000,530300,', '25630', '0000000250,0000002720,0000025630,', '1', '2', '云南省/曲靖市/市辖区', '市辖区', '3', '0', 'system', '2018-03-11 16:00:16', 'system', '2018-03-11 16:00:16', null);
INSERT INTO `js_sys_area` VALUES ('530302', '530300', '0,530000,530300,', '25640', '0000000250,0000002720,0000025640,', '1', '2', '云南省/曲靖市/麒麟区', '麒麟区', '3', '0', 'system', '2018-03-11 16:00:16', 'system', '2018-03-11 16:00:16', null);
INSERT INTO `js_sys_area` VALUES ('530321', '530300', '0,530000,530300,', '25650', '0000000250,0000002720,0000025650,', '1', '2', '云南省/曲靖市/马龙县', '马龙县', '3', '0', 'system', '2018-03-11 16:00:16', 'system', '2018-03-11 16:00:16', null);
INSERT INTO `js_sys_area` VALUES ('530322', '530300', '0,530000,530300,', '25660', '0000000250,0000002720,0000025660,', '1', '2', '云南省/曲靖市/陆良县', '陆良县', '3', '0', 'system', '2018-03-11 16:00:16', 'system', '2018-03-11 16:00:16', null);
INSERT INTO `js_sys_area` VALUES ('530323', '530300', '0,530000,530300,', '25670', '0000000250,0000002720,0000025670,', '1', '2', '云南省/曲靖市/师宗县', '师宗县', '3', '0', 'system', '2018-03-11 16:00:16', 'system', '2018-03-11 16:00:16', null);
INSERT INTO `js_sys_area` VALUES ('530324', '530300', '0,530000,530300,', '25680', '0000000250,0000002720,0000025680,', '1', '2', '云南省/曲靖市/罗平县', '罗平县', '3', '0', 'system', '2018-03-11 16:00:16', 'system', '2018-03-11 16:00:16', null);
INSERT INTO `js_sys_area` VALUES ('530325', '530300', '0,530000,530300,', '25690', '0000000250,0000002720,0000025690,', '1', '2', '云南省/曲靖市/富源县', '富源县', '3', '0', 'system', '2018-03-11 16:00:16', 'system', '2018-03-11 16:00:16', null);
INSERT INTO `js_sys_area` VALUES ('530326', '530300', '0,530000,530300,', '25700', '0000000250,0000002720,0000025700,', '1', '2', '云南省/曲靖市/会泽县', '会泽县', '3', '0', 'system', '2018-03-11 16:00:16', 'system', '2018-03-11 16:00:16', null);
INSERT INTO `js_sys_area` VALUES ('530328', '530300', '0,530000,530300,', '25710', '0000000250,0000002720,0000025710,', '1', '2', '云南省/曲靖市/沾益县', '沾益县', '3', '0', 'system', '2018-03-11 16:00:16', 'system', '2018-03-11 16:00:16', null);
INSERT INTO `js_sys_area` VALUES ('530381', '530300', '0,530000,530300,', '25720', '0000000250,0000002720,0000025720,', '1', '2', '云南省/曲靖市/宣威市', '宣威市', '3', '0', 'system', '2018-03-11 16:00:16', 'system', '2018-03-11 16:00:16', null);
INSERT INTO `js_sys_area` VALUES ('530400', '530000', '0,530000,', '2730', '0000000250,0000002730,', '0', '1', '云南省/玉溪市', '玉溪市', '2', '0', 'system', '2018-03-11 16:00:16', 'system', '2018-03-11 16:00:16', null);
INSERT INTO `js_sys_area` VALUES ('530401', '530400', '0,530000,530400,', '25730', '0000000250,0000002730,0000025730,', '1', '2', '云南省/玉溪市/市辖区', '市辖区', '3', '0', 'system', '2018-03-11 16:00:16', 'system', '2018-03-11 16:00:16', null);
INSERT INTO `js_sys_area` VALUES ('530402', '530400', '0,530000,530400,', '25740', '0000000250,0000002730,0000025740,', '1', '2', '云南省/玉溪市/红塔区', '红塔区', '3', '0', 'system', '2018-03-11 16:00:16', 'system', '2018-03-11 16:00:16', null);
INSERT INTO `js_sys_area` VALUES ('530421', '530400', '0,530000,530400,', '25750', '0000000250,0000002730,0000025750,', '1', '2', '云南省/玉溪市/江川县', '江川县', '3', '0', 'system', '2018-03-11 16:00:16', 'system', '2018-03-11 16:00:16', null);
INSERT INTO `js_sys_area` VALUES ('530422', '530400', '0,530000,530400,', '25760', '0000000250,0000002730,0000025760,', '1', '2', '云南省/玉溪市/澄江县', '澄江县', '3', '0', 'system', '2018-03-11 16:00:16', 'system', '2018-03-11 16:00:16', null);
INSERT INTO `js_sys_area` VALUES ('530423', '530400', '0,530000,530400,', '25770', '0000000250,0000002730,0000025770,', '1', '2', '云南省/玉溪市/通海县', '通海县', '3', '0', 'system', '2018-03-11 16:00:16', 'system', '2018-03-11 16:00:16', null);
INSERT INTO `js_sys_area` VALUES ('530424', '530400', '0,530000,530400,', '25780', '0000000250,0000002730,0000025780,', '1', '2', '云南省/玉溪市/华宁县', '华宁县', '3', '0', 'system', '2018-03-11 16:00:16', 'system', '2018-03-11 16:00:16', null);
INSERT INTO `js_sys_area` VALUES ('530425', '530400', '0,530000,530400,', '25790', '0000000250,0000002730,0000025790,', '1', '2', '云南省/玉溪市/易门县', '易门县', '3', '0', 'system', '2018-03-11 16:00:16', 'system', '2018-03-11 16:00:16', null);
INSERT INTO `js_sys_area` VALUES ('530426', '530400', '0,530000,530400,', '25800', '0000000250,0000002730,0000025800,', '1', '2', '云南省/玉溪市/峨山彝族自治县', '峨山彝族自治县', '3', '0', 'system', '2018-03-11 16:00:16', 'system', '2018-03-11 16:00:16', null);
INSERT INTO `js_sys_area` VALUES ('530427', '530400', '0,530000,530400,', '25810', '0000000250,0000002730,0000025810,', '1', '2', '云南省/玉溪市/新平彝族傣族自治县', '新平彝族傣族自治县', '3', '0', 'system', '2018-03-11 16:00:16', 'system', '2018-03-11 16:00:16', null);
INSERT INTO `js_sys_area` VALUES ('530500', '530000', '0,530000,', '2740', '0000000250,0000002740,', '0', '1', '云南省/保山市', '保山市', '2', '0', 'system', '2018-03-11 16:00:16', 'system', '2018-03-11 16:00:16', null);
INSERT INTO `js_sys_area` VALUES ('530501', '530500', '0,530000,530500,', '25830', '0000000250,0000002740,0000025830,', '1', '2', '云南省/保山市/市辖区', '市辖区', '3', '0', 'system', '2018-03-11 16:00:16', 'system', '2018-03-11 16:00:16', null);
INSERT INTO `js_sys_area` VALUES ('530502', '530500', '0,530000,530500,', '25840', '0000000250,0000002740,0000025840,', '1', '2', '云南省/保山市/隆阳区', '隆阳区', '3', '0', 'system', '2018-03-11 16:00:16', 'system', '2018-03-11 16:00:16', null);
INSERT INTO `js_sys_area` VALUES ('530521', '530500', '0,530000,530500,', '25850', '0000000250,0000002740,0000025850,', '1', '2', '云南省/保山市/施甸县', '施甸县', '3', '0', 'system', '2018-03-11 16:00:16', 'system', '2018-03-11 16:00:16', null);
INSERT INTO `js_sys_area` VALUES ('530522', '530500', '0,530000,530500,', '25860', '0000000250,0000002740,0000025860,', '1', '2', '云南省/保山市/腾冲县', '腾冲县', '3', '0', 'system', '2018-03-11 16:00:16', 'system', '2018-03-11 16:00:16', null);
INSERT INTO `js_sys_area` VALUES ('530523', '530500', '0,530000,530500,', '25870', '0000000250,0000002740,0000025870,', '1', '2', '云南省/保山市/龙陵县', '龙陵县', '3', '0', 'system', '2018-03-11 16:00:16', 'system', '2018-03-11 16:00:16', null);
INSERT INTO `js_sys_area` VALUES ('530524', '530500', '0,530000,530500,', '25880', '0000000250,0000002740,0000025880,', '1', '2', '云南省/保山市/昌宁县', '昌宁县', '3', '0', 'system', '2018-03-11 16:00:16', 'system', '2018-03-11 16:00:16', null);
INSERT INTO `js_sys_area` VALUES ('530600', '530000', '0,530000,', '2750', '0000000250,0000002750,', '0', '1', '云南省/昭通市', '昭通市', '2', '0', 'system', '2018-03-11 16:00:16', 'system', '2018-03-11 16:00:16', null);
INSERT INTO `js_sys_area` VALUES ('530601', '530600', '0,530000,530600,', '25890', '0000000250,0000002750,0000025890,', '1', '2', '云南省/昭通市/市辖区', '市辖区', '3', '0', 'system', '2018-03-11 16:00:16', 'system', '2018-03-11 16:00:16', null);
INSERT INTO `js_sys_area` VALUES ('530602', '530600', '0,530000,530600,', '25900', '0000000250,0000002750,0000025900,', '1', '2', '云南省/昭通市/昭阳区', '昭阳区', '3', '0', 'system', '2018-03-11 16:00:16', 'system', '2018-03-11 16:00:16', null);
INSERT INTO `js_sys_area` VALUES ('530621', '530600', '0,530000,530600,', '25910', '0000000250,0000002750,0000025910,', '1', '2', '云南省/昭通市/鲁甸县', '鲁甸县', '3', '0', 'system', '2018-03-11 16:00:16', 'system', '2018-03-11 16:00:16', null);
INSERT INTO `js_sys_area` VALUES ('530622', '530600', '0,530000,530600,', '25920', '0000000250,0000002750,0000025920,', '1', '2', '云南省/昭通市/巧家县', '巧家县', '3', '0', 'system', '2018-03-11 16:00:16', 'system', '2018-03-11 16:00:16', null);
INSERT INTO `js_sys_area` VALUES ('530623', '530600', '0,530000,530600,', '25930', '0000000250,0000002750,0000025930,', '1', '2', '云南省/昭通市/盐津县', '盐津县', '3', '0', 'system', '2018-03-11 16:00:16', 'system', '2018-03-11 16:00:16', null);
INSERT INTO `js_sys_area` VALUES ('530624', '530600', '0,530000,530600,', '25940', '0000000250,0000002750,0000025940,', '1', '2', '云南省/昭通市/大关县', '大关县', '3', '0', 'system', '2018-03-11 16:00:17', 'system', '2018-03-11 16:00:17', null);
INSERT INTO `js_sys_area` VALUES ('530625', '530600', '0,530000,530600,', '25950', '0000000250,0000002750,0000025950,', '1', '2', '云南省/昭通市/永善县', '永善县', '3', '0', 'system', '2018-03-11 16:00:17', 'system', '2018-03-11 16:00:17', null);
INSERT INTO `js_sys_area` VALUES ('530626', '530600', '0,530000,530600,', '25960', '0000000250,0000002750,0000025960,', '1', '2', '云南省/昭通市/绥江县', '绥江县', '3', '0', 'system', '2018-03-11 16:00:17', 'system', '2018-03-11 16:00:17', null);
INSERT INTO `js_sys_area` VALUES ('530627', '530600', '0,530000,530600,', '25970', '0000000250,0000002750,0000025970,', '1', '2', '云南省/昭通市/镇雄县', '镇雄县', '3', '0', 'system', '2018-03-11 16:00:17', 'system', '2018-03-11 16:00:17', null);
INSERT INTO `js_sys_area` VALUES ('530628', '530600', '0,530000,530600,', '25980', '0000000250,0000002750,0000025980,', '1', '2', '云南省/昭通市/彝良县', '彝良县', '3', '0', 'system', '2018-03-11 16:00:17', 'system', '2018-03-11 16:00:17', null);
INSERT INTO `js_sys_area` VALUES ('530629', '530600', '0,530000,530600,', '25990', '0000000250,0000002750,0000025990,', '1', '2', '云南省/昭通市/威信县', '威信县', '3', '0', 'system', '2018-03-11 16:00:17', 'system', '2018-03-11 16:00:17', null);
INSERT INTO `js_sys_area` VALUES ('530630', '530600', '0,530000,530600,', '26000', '0000000250,0000002750,0000026000,', '1', '2', '云南省/昭通市/水富县', '水富县', '3', '0', 'system', '2018-03-11 16:00:17', 'system', '2018-03-11 16:00:17', null);
INSERT INTO `js_sys_area` VALUES ('530700', '530000', '0,530000,', '2760', '0000000250,0000002760,', '0', '1', '云南省/丽江市', '丽江市', '2', '0', 'system', '2018-03-11 16:00:17', 'system', '2018-03-11 16:00:17', null);
INSERT INTO `js_sys_area` VALUES ('530701', '530700', '0,530000,530700,', '26010', '0000000250,0000002760,0000026010,', '1', '2', '云南省/丽江市/市辖区', '市辖区', '3', '0', 'system', '2018-03-11 16:00:17', 'system', '2018-03-11 16:00:17', null);
INSERT INTO `js_sys_area` VALUES ('530702', '530700', '0,530000,530700,', '26020', '0000000250,0000002760,0000026020,', '1', '2', '云南省/丽江市/古城区', '古城区', '3', '0', 'system', '2018-03-11 16:00:17', 'system', '2018-03-11 16:00:17', null);
INSERT INTO `js_sys_area` VALUES ('530721', '530700', '0,530000,530700,', '26030', '0000000250,0000002760,0000026030,', '1', '2', '云南省/丽江市/玉龙纳西族自治县', '玉龙纳西族自治县', '3', '0', 'system', '2018-03-11 16:00:17', 'system', '2018-03-11 16:00:17', null);
INSERT INTO `js_sys_area` VALUES ('530722', '530700', '0,530000,530700,', '26040', '0000000250,0000002760,0000026040,', '1', '2', '云南省/丽江市/永胜县', '永胜县', '3', '0', 'system', '2018-03-11 16:00:17', 'system', '2018-03-11 16:00:17', null);
INSERT INTO `js_sys_area` VALUES ('530723', '530700', '0,530000,530700,', '26050', '0000000250,0000002760,0000026050,', '1', '2', '云南省/丽江市/华坪县', '华坪县', '3', '0', 'system', '2018-03-11 16:00:17', 'system', '2018-03-11 16:00:17', null);
INSERT INTO `js_sys_area` VALUES ('530724', '530700', '0,530000,530700,', '26060', '0000000250,0000002760,0000026060,', '1', '2', '云南省/丽江市/宁蒗彝族自治县', '宁蒗彝族自治县', '3', '0', 'system', '2018-03-11 16:00:17', 'system', '2018-03-11 16:00:17', null);
INSERT INTO `js_sys_area` VALUES ('530800', '530000', '0,530000,', '2770', '0000000250,0000002770,', '0', '1', '云南省/思茅市', '思茅市', '2', '0', 'system', '2018-03-11 16:00:17', 'system', '2018-03-11 16:00:17', null);
INSERT INTO `js_sys_area` VALUES ('530801', '530800', '0,530000,530800,', '26070', '0000000250,0000002770,0000026070,', '1', '2', '云南省/思茅市/市辖区', '市辖区', '3', '0', 'system', '2018-03-11 16:00:17', 'system', '2018-03-11 16:00:17', null);
INSERT INTO `js_sys_area` VALUES ('530802', '530800', '0,530000,530800,', '26080', '0000000250,0000002770,0000026080,', '1', '2', '云南省/思茅市/翠云区', '翠云区', '3', '0', 'system', '2018-03-11 16:00:17', 'system', '2018-03-11 16:00:17', null);
INSERT INTO `js_sys_area` VALUES ('530821', '530800', '0,530000,530800,', '26090', '0000000250,0000002770,0000026090,', '1', '2', '云南省/思茅市/普洱哈尼族彝族自治县', '普洱哈尼族彝族自治县', '3', '0', 'system', '2018-03-11 16:00:17', 'system', '2018-03-11 16:00:17', null);
INSERT INTO `js_sys_area` VALUES ('530822', '530800', '0,530000,530800,', '26100', '0000000250,0000002770,0000026100,', '1', '2', '云南省/思茅市/墨江哈尼族自治县', '墨江哈尼族自治县', '3', '0', 'system', '2018-03-11 16:00:17', 'system', '2018-03-11 16:00:17', null);
INSERT INTO `js_sys_area` VALUES ('530823', '530800', '0,530000,530800,', '26110', '0000000250,0000002770,0000026110,', '1', '2', '云南省/思茅市/景东彝族自治县', '景东彝族自治县', '3', '0', 'system', '2018-03-11 16:00:17', 'system', '2018-03-11 16:00:17', null);
INSERT INTO `js_sys_area` VALUES ('530824', '530800', '0,530000,530800,', '26120', '0000000250,0000002770,0000026120,', '1', '2', '云南省/思茅市/景谷傣族彝族自治县', '景谷傣族彝族自治县', '3', '0', 'system', '2018-03-11 16:00:17', 'system', '2018-03-11 16:00:17', null);
INSERT INTO `js_sys_area` VALUES ('530826', '530800', '0,530000,530800,', '26140', '0000000250,0000002770,0000026140,', '1', '2', '云南省/思茅市/江城哈尼族彝族自治县', '江城哈尼族彝族自治县', '3', '0', 'system', '2018-03-11 16:00:17', 'system', '2018-03-11 16:00:17', null);
INSERT INTO `js_sys_area` VALUES ('530828', '530800', '0,530000,530800,', '26160', '0000000250,0000002770,0000026160,', '1', '2', '云南省/思茅市/澜沧拉祜族自治县', '澜沧拉祜族自治县', '3', '0', 'system', '2018-03-11 16:00:17', 'system', '2018-03-11 16:00:17', null);
INSERT INTO `js_sys_area` VALUES ('530829', '530800', '0,530000,530800,', '26170', '0000000250,0000002770,0000026170,', '1', '2', '云南省/思茅市/西盟佤族自治县', '西盟佤族自治县', '3', '0', 'system', '2018-03-11 16:00:17', 'system', '2018-03-11 16:00:17', null);
INSERT INTO `js_sys_area` VALUES ('530900', '530000', '0,530000,', '2780', '0000000250,0000002780,', '0', '1', '云南省/临沧市', '临沧市', '2', '0', 'system', '2018-03-11 16:00:17', 'system', '2018-03-11 16:00:17', null);
INSERT INTO `js_sys_area` VALUES ('530901', '530900', '0,530000,530900,', '26180', '0000000250,0000002780,0000026180,', '1', '2', '云南省/临沧市/市辖区', '市辖区', '3', '0', 'system', '2018-03-11 16:00:17', 'system', '2018-03-11 16:00:17', null);
INSERT INTO `js_sys_area` VALUES ('530902', '530900', '0,530000,530900,', '26190', '0000000250,0000002780,0000026190,', '1', '2', '云南省/临沧市/临翔区', '临翔区', '3', '0', 'system', '2018-03-11 16:00:17', 'system', '2018-03-11 16:00:17', null);
INSERT INTO `js_sys_area` VALUES ('530921', '530900', '0,530000,530900,', '26200', '0000000250,0000002780,0000026200,', '1', '2', '云南省/临沧市/凤庆县', '凤庆县', '3', '0', 'system', '2018-03-11 16:00:17', 'system', '2018-03-11 16:00:17', null);
INSERT INTO `js_sys_area` VALUES ('530922', '530900', '0,530000,530900,', '26210', '0000000250,0000002780,0000026210,', '1', '2', '云南省/临沧市/云　县', '云　县', '3', '0', 'system', '2018-03-11 16:00:17', 'system', '2018-03-11 16:00:17', null);
INSERT INTO `js_sys_area` VALUES ('530923', '530900', '0,530000,530900,', '26220', '0000000250,0000002780,0000026220,', '1', '2', '云南省/临沧市/永德县', '永德县', '3', '0', 'system', '2018-03-11 16:00:17', 'system', '2018-03-11 16:00:17', null);
INSERT INTO `js_sys_area` VALUES ('530924', '530900', '0,530000,530900,', '26230', '0000000250,0000002780,0000026230,', '1', '2', '云南省/临沧市/镇康县', '镇康县', '3', '0', 'system', '2018-03-11 16:00:17', 'system', '2018-03-11 16:00:17', null);
INSERT INTO `js_sys_area` VALUES ('530926', '530900', '0,530000,530900,', '26250', '0000000250,0000002780,0000026250,', '1', '2', '云南省/临沧市/耿马傣族佤族自治县', '耿马傣族佤族自治县', '3', '0', 'system', '2018-03-11 16:00:17', 'system', '2018-03-11 16:00:17', null);
INSERT INTO `js_sys_area` VALUES ('530927', '530900', '0,530000,530900,', '26260', '0000000250,0000002780,0000026260,', '1', '2', '云南省/临沧市/沧源佤族自治县', '沧源佤族自治县', '3', '0', 'system', '2018-03-11 16:00:17', 'system', '2018-03-11 16:00:17', null);
INSERT INTO `js_sys_area` VALUES ('532300', '530000', '0,530000,', '2790', '0000000250,0000002790,', '0', '1', '云南省/楚雄彝族自治州', '楚雄彝族自治州', '2', '0', 'system', '2018-03-11 16:00:17', 'system', '2018-03-11 16:00:17', null);
INSERT INTO `js_sys_area` VALUES ('532301', '532300', '0,530000,532300,', '26270', '0000000250,0000002790,0000026270,', '1', '2', '云南省/楚雄彝族自治州/楚雄市', '楚雄市', '3', '0', 'system', '2018-03-11 16:00:17', 'system', '2018-03-11 16:00:17', null);
INSERT INTO `js_sys_area` VALUES ('532322', '532300', '0,530000,532300,', '26280', '0000000250,0000002790,0000026280,', '1', '2', '云南省/楚雄彝族自治州/双柏县', '双柏县', '3', '0', 'system', '2018-03-11 16:00:17', 'system', '2018-03-11 16:00:17', null);
INSERT INTO `js_sys_area` VALUES ('532323', '532300', '0,530000,532300,', '26290', '0000000250,0000002790,0000026290,', '1', '2', '云南省/楚雄彝族自治州/牟定县', '牟定县', '3', '0', 'system', '2018-03-11 16:00:17', 'system', '2018-03-11 16:00:17', null);
INSERT INTO `js_sys_area` VALUES ('532324', '532300', '0,530000,532300,', '26300', '0000000250,0000002790,0000026300,', '1', '2', '云南省/楚雄彝族自治州/南华县', '南华县', '3', '0', 'system', '2018-03-11 16:00:17', 'system', '2018-03-11 16:00:17', null);
INSERT INTO `js_sys_area` VALUES ('532325', '532300', '0,530000,532300,', '26310', '0000000250,0000002790,0000026310,', '1', '2', '云南省/楚雄彝族自治州/姚安县', '姚安县', '3', '0', 'system', '2018-03-11 16:00:17', 'system', '2018-03-11 16:00:17', null);
INSERT INTO `js_sys_area` VALUES ('532326', '532300', '0,530000,532300,', '26320', '0000000250,0000002790,0000026320,', '1', '2', '云南省/楚雄彝族自治州/大姚县', '大姚县', '3', '0', 'system', '2018-03-11 16:00:17', 'system', '2018-03-11 16:00:17', null);
INSERT INTO `js_sys_area` VALUES ('532327', '532300', '0,530000,532300,', '26330', '0000000250,0000002790,0000026330,', '1', '2', '云南省/楚雄彝族自治州/永仁县', '永仁县', '3', '0', 'system', '2018-03-11 16:00:17', 'system', '2018-03-11 16:00:17', null);
INSERT INTO `js_sys_area` VALUES ('532328', '532300', '0,530000,532300,', '26340', '0000000250,0000002790,0000026340,', '1', '2', '云南省/楚雄彝族自治州/元谋县', '元谋县', '3', '0', 'system', '2018-03-11 16:00:17', 'system', '2018-03-11 16:00:17', null);
INSERT INTO `js_sys_area` VALUES ('532329', '532300', '0,530000,532300,', '26350', '0000000250,0000002790,0000026350,', '1', '2', '云南省/楚雄彝族自治州/武定县', '武定县', '3', '0', 'system', '2018-03-11 16:00:17', 'system', '2018-03-11 16:00:17', null);
INSERT INTO `js_sys_area` VALUES ('532331', '532300', '0,530000,532300,', '26360', '0000000250,0000002790,0000026360,', '1', '2', '云南省/楚雄彝族自治州/禄丰县', '禄丰县', '3', '0', 'system', '2018-03-11 16:00:17', 'system', '2018-03-11 16:00:17', null);
INSERT INTO `js_sys_area` VALUES ('532500', '530000', '0,530000,', '2800', '0000000250,0000002800,', '0', '1', '云南省/红河哈尼族彝族自治州', '红河哈尼族彝族自治州', '2', '0', 'system', '2018-03-11 16:00:17', 'system', '2018-03-11 16:00:17', null);
INSERT INTO `js_sys_area` VALUES ('532501', '532500', '0,530000,532500,', '26370', '0000000250,0000002800,0000026370,', '1', '2', '云南省/红河哈尼族彝族自治州/个旧市', '个旧市', '3', '0', 'system', '2018-03-11 16:00:17', 'system', '2018-03-11 16:00:17', null);
INSERT INTO `js_sys_area` VALUES ('532502', '532500', '0,530000,532500,', '26380', '0000000250,0000002800,0000026380,', '1', '2', '云南省/红河哈尼族彝族自治州/开远市', '开远市', '3', '0', 'system', '2018-03-11 16:00:17', 'system', '2018-03-11 16:00:17', null);
INSERT INTO `js_sys_area` VALUES ('532522', '532500', '0,530000,532500,', '26390', '0000000250,0000002800,0000026390,', '1', '2', '云南省/红河哈尼族彝族自治州/蒙自县', '蒙自县', '3', '0', 'system', '2018-03-11 16:00:17', 'system', '2018-03-11 16:00:17', null);
INSERT INTO `js_sys_area` VALUES ('532523', '532500', '0,530000,532500,', '26400', '0000000250,0000002800,0000026400,', '1', '2', '云南省/红河哈尼族彝族自治州/屏边苗族自治县', '屏边苗族自治县', '3', '0', 'system', '2018-03-11 16:00:17', 'system', '2018-03-11 16:00:17', null);
INSERT INTO `js_sys_area` VALUES ('532524', '532500', '0,530000,532500,', '26410', '0000000250,0000002800,0000026410,', '1', '2', '云南省/红河哈尼族彝族自治州/建水县', '建水县', '3', '0', 'system', '2018-03-11 16:00:17', 'system', '2018-03-11 16:00:17', null);
INSERT INTO `js_sys_area` VALUES ('532525', '532500', '0,530000,532500,', '26420', '0000000250,0000002800,0000026420,', '1', '2', '云南省/红河哈尼族彝族自治州/石屏县', '石屏县', '3', '0', 'system', '2018-03-11 16:00:17', 'system', '2018-03-11 16:00:17', null);
INSERT INTO `js_sys_area` VALUES ('532526', '532500', '0,530000,532500,', '26430', '0000000250,0000002800,0000026430,', '1', '2', '云南省/红河哈尼族彝族自治州/弥勒县', '弥勒县', '3', '0', 'system', '2018-03-11 16:00:17', 'system', '2018-03-11 16:00:17', null);
INSERT INTO `js_sys_area` VALUES ('532527', '532500', '0,530000,532500,', '26440', '0000000250,0000002800,0000026440,', '1', '2', '云南省/红河哈尼族彝族自治州/泸西县', '泸西县', '3', '0', 'system', '2018-03-11 16:00:17', 'system', '2018-03-11 16:00:17', null);
INSERT INTO `js_sys_area` VALUES ('532528', '532500', '0,530000,532500,', '26450', '0000000250,0000002800,0000026450,', '1', '2', '云南省/红河哈尼族彝族自治州/元阳县', '元阳县', '3', '0', 'system', '2018-03-11 16:00:17', 'system', '2018-03-11 16:00:17', null);
INSERT INTO `js_sys_area` VALUES ('532529', '532500', '0,530000,532500,', '26460', '0000000250,0000002800,0000026460,', '1', '2', '云南省/红河哈尼族彝族自治州/红河县', '红河县', '3', '0', 'system', '2018-03-11 16:00:17', 'system', '2018-03-11 16:00:17', null);
INSERT INTO `js_sys_area` VALUES ('532531', '532500', '0,530000,532500,', '26480', '0000000250,0000002800,0000026480,', '1', '2', '云南省/红河哈尼族彝族自治州/绿春县', '绿春县', '3', '0', 'system', '2018-03-11 16:00:17', 'system', '2018-03-11 16:00:17', null);
INSERT INTO `js_sys_area` VALUES ('532532', '532500', '0,530000,532500,', '26490', '0000000250,0000002800,0000026490,', '1', '2', '云南省/红河哈尼族彝族自治州/河口瑶族自治县', '河口瑶族自治县', '3', '0', 'system', '2018-03-11 16:00:17', 'system', '2018-03-11 16:00:17', null);
INSERT INTO `js_sys_area` VALUES ('532600', '530000', '0,530000,', '2810', '0000000250,0000002810,', '0', '1', '云南省/文山壮族苗族自治州', '文山壮族苗族自治州', '2', '0', 'system', '2018-03-11 16:00:17', 'system', '2018-03-11 16:00:17', null);
INSERT INTO `js_sys_area` VALUES ('532621', '532600', '0,530000,532600,', '26500', '0000000250,0000002810,0000026500,', '1', '2', '云南省/文山壮族苗族自治州/文山县', '文山县', '3', '0', 'system', '2018-03-11 16:00:17', 'system', '2018-03-11 16:00:17', null);
INSERT INTO `js_sys_area` VALUES ('532622', '532600', '0,530000,532600,', '26510', '0000000250,0000002810,0000026510,', '1', '2', '云南省/文山壮族苗族自治州/砚山县', '砚山县', '3', '0', 'system', '2018-03-11 16:00:17', 'system', '2018-03-11 16:00:17', null);
INSERT INTO `js_sys_area` VALUES ('532623', '532600', '0,530000,532600,', '26520', '0000000250,0000002810,0000026520,', '1', '2', '云南省/文山壮族苗族自治州/西畴县', '西畴县', '3', '0', 'system', '2018-03-11 16:00:17', 'system', '2018-03-11 16:00:17', null);
INSERT INTO `js_sys_area` VALUES ('532624', '532600', '0,530000,532600,', '26530', '0000000250,0000002810,0000026530,', '1', '2', '云南省/文山壮族苗族自治州/麻栗坡县', '麻栗坡县', '3', '0', 'system', '2018-03-11 16:00:17', 'system', '2018-03-11 16:00:17', null);
INSERT INTO `js_sys_area` VALUES ('532625', '532600', '0,530000,532600,', '26540', '0000000250,0000002810,0000026540,', '1', '2', '云南省/文山壮族苗族自治州/马关县', '马关县', '3', '0', 'system', '2018-03-11 16:00:17', 'system', '2018-03-11 16:00:17', null);
INSERT INTO `js_sys_area` VALUES ('532626', '532600', '0,530000,532600,', '26550', '0000000250,0000002810,0000026550,', '1', '2', '云南省/文山壮族苗族自治州/丘北县', '丘北县', '3', '0', 'system', '2018-03-11 16:00:17', 'system', '2018-03-11 16:00:17', null);
INSERT INTO `js_sys_area` VALUES ('532627', '532600', '0,530000,532600,', '26560', '0000000250,0000002810,0000026560,', '1', '2', '云南省/文山壮族苗族自治州/广南县', '广南县', '3', '0', 'system', '2018-03-11 16:00:17', 'system', '2018-03-11 16:00:17', null);
INSERT INTO `js_sys_area` VALUES ('532628', '532600', '0,530000,532600,', '26570', '0000000250,0000002810,0000026570,', '1', '2', '云南省/文山壮族苗族自治州/富宁县', '富宁县', '3', '0', 'system', '2018-03-11 16:00:18', 'system', '2018-03-11 16:00:18', null);
INSERT INTO `js_sys_area` VALUES ('532800', '530000', '0,530000,', '2820', '0000000250,0000002820,', '0', '1', '云南省/西双版纳傣族自治州', '西双版纳傣族自治州', '2', '0', 'system', '2018-03-11 16:00:18', 'system', '2018-03-11 16:00:18', null);
INSERT INTO `js_sys_area` VALUES ('532801', '532800', '0,530000,532800,', '26580', '0000000250,0000002820,0000026580,', '1', '2', '云南省/西双版纳傣族自治州/景洪市', '景洪市', '3', '0', 'system', '2018-03-11 16:00:18', 'system', '2018-03-11 16:00:18', null);
INSERT INTO `js_sys_area` VALUES ('532822', '532800', '0,530000,532800,', '26590', '0000000250,0000002820,0000026590,', '1', '2', '云南省/西双版纳傣族自治州/勐海县', '勐海县', '3', '0', 'system', '2018-03-11 16:00:18', 'system', '2018-03-11 16:00:18', null);
INSERT INTO `js_sys_area` VALUES ('532823', '532800', '0,530000,532800,', '26600', '0000000250,0000002820,0000026600,', '1', '2', '云南省/西双版纳傣族自治州/勐腊县', '勐腊县', '3', '0', 'system', '2018-03-11 16:00:18', 'system', '2018-03-11 16:00:18', null);
INSERT INTO `js_sys_area` VALUES ('532900', '530000', '0,530000,', '2830', '0000000250,0000002830,', '0', '1', '云南省/大理白族自治州', '大理白族自治州', '2', '0', 'system', '2018-03-11 16:00:18', 'system', '2018-03-11 16:00:18', null);
INSERT INTO `js_sys_area` VALUES ('532901', '532900', '0,530000,532900,', '26610', '0000000250,0000002830,0000026610,', '1', '2', '云南省/大理白族自治州/大理市', '大理市', '3', '0', 'system', '2018-03-11 16:00:18', 'system', '2018-03-11 16:00:18', null);
INSERT INTO `js_sys_area` VALUES ('532922', '532900', '0,530000,532900,', '26620', '0000000250,0000002830,0000026620,', '1', '2', '云南省/大理白族自治州/漾濞彝族自治县', '漾濞彝族自治县', '3', '0', 'system', '2018-03-11 16:00:18', 'system', '2018-03-11 16:00:18', null);
INSERT INTO `js_sys_area` VALUES ('532923', '532900', '0,530000,532900,', '26630', '0000000250,0000002830,0000026630,', '1', '2', '云南省/大理白族自治州/祥云县', '祥云县', '3', '0', 'system', '2018-03-11 16:00:18', 'system', '2018-03-11 16:00:18', null);
INSERT INTO `js_sys_area` VALUES ('532924', '532900', '0,530000,532900,', '26640', '0000000250,0000002830,0000026640,', '1', '2', '云南省/大理白族自治州/宾川县', '宾川县', '3', '0', 'system', '2018-03-11 16:00:18', 'system', '2018-03-11 16:00:18', null);
INSERT INTO `js_sys_area` VALUES ('532925', '532900', '0,530000,532900,', '26650', '0000000250,0000002830,0000026650,', '1', '2', '云南省/大理白族自治州/弥渡县', '弥渡县', '3', '0', 'system', '2018-03-11 16:00:18', 'system', '2018-03-11 16:00:18', null);
INSERT INTO `js_sys_area` VALUES ('532926', '532900', '0,530000,532900,', '26660', '0000000250,0000002830,0000026660,', '1', '2', '云南省/大理白族自治州/南涧彝族自治县', '南涧彝族自治县', '3', '0', 'system', '2018-03-11 16:00:18', 'system', '2018-03-11 16:00:18', null);
INSERT INTO `js_sys_area` VALUES ('532927', '532900', '0,530000,532900,', '26670', '0000000250,0000002830,0000026670,', '1', '2', '云南省/大理白族自治州/巍山彝族回族自治县', '巍山彝族回族自治县', '3', '0', 'system', '2018-03-11 16:00:18', 'system', '2018-03-11 16:00:18', null);
INSERT INTO `js_sys_area` VALUES ('532928', '532900', '0,530000,532900,', '26680', '0000000250,0000002830,0000026680,', '1', '2', '云南省/大理白族自治州/永平县', '永平县', '3', '0', 'system', '2018-03-11 16:00:18', 'system', '2018-03-11 16:00:18', null);
INSERT INTO `js_sys_area` VALUES ('532929', '532900', '0,530000,532900,', '26690', '0000000250,0000002830,0000026690,', '1', '2', '云南省/大理白族自治州/云龙县', '云龙县', '3', '0', 'system', '2018-03-11 16:00:18', 'system', '2018-03-11 16:00:18', null);
INSERT INTO `js_sys_area` VALUES ('532930', '532900', '0,530000,532900,', '26700', '0000000250,0000002830,0000026700,', '1', '2', '云南省/大理白族自治州/洱源县', '洱源县', '3', '0', 'system', '2018-03-11 16:00:18', 'system', '2018-03-11 16:00:18', null);
INSERT INTO `js_sys_area` VALUES ('532931', '532900', '0,530000,532900,', '26710', '0000000250,0000002830,0000026710,', '1', '2', '云南省/大理白族自治州/剑川县', '剑川县', '3', '0', 'system', '2018-03-11 16:00:18', 'system', '2018-03-11 16:00:18', null);
INSERT INTO `js_sys_area` VALUES ('532932', '532900', '0,530000,532900,', '26720', '0000000250,0000002830,0000026720,', '1', '2', '云南省/大理白族自治州/鹤庆县', '鹤庆县', '3', '0', 'system', '2018-03-11 16:00:18', 'system', '2018-03-11 16:00:18', null);
INSERT INTO `js_sys_area` VALUES ('533100', '530000', '0,530000,', '2840', '0000000250,0000002840,', '0', '1', '云南省/德宏傣族景颇族自治州', '德宏傣族景颇族自治州', '2', '0', 'system', '2018-03-11 16:00:18', 'system', '2018-03-11 16:00:18', null);
INSERT INTO `js_sys_area` VALUES ('533102', '533100', '0,530000,533100,', '26730', '0000000250,0000002840,0000026730,', '1', '2', '云南省/德宏傣族景颇族自治州/瑞丽市', '瑞丽市', '3', '0', 'system', '2018-03-11 16:00:18', 'system', '2018-03-11 16:00:18', null);
INSERT INTO `js_sys_area` VALUES ('533103', '533100', '0,530000,533100,', '26740', '0000000250,0000002840,0000026740,', '1', '2', '云南省/德宏傣族景颇族自治州/潞西市', '潞西市', '3', '0', 'system', '2018-03-11 16:00:18', 'system', '2018-03-11 16:00:18', null);
INSERT INTO `js_sys_area` VALUES ('533122', '533100', '0,530000,533100,', '26750', '0000000250,0000002840,0000026750,', '1', '2', '云南省/德宏傣族景颇族自治州/梁河县', '梁河县', '3', '0', 'system', '2018-03-11 16:00:18', 'system', '2018-03-11 16:00:18', null);
INSERT INTO `js_sys_area` VALUES ('533123', '533100', '0,530000,533100,', '26760', '0000000250,0000002840,0000026760,', '1', '2', '云南省/德宏傣族景颇族自治州/盈江县', '盈江县', '3', '0', 'system', '2018-03-11 16:00:18', 'system', '2018-03-11 16:00:18', null);
INSERT INTO `js_sys_area` VALUES ('533124', '533100', '0,530000,533100,', '26770', '0000000250,0000002840,0000026770,', '1', '2', '云南省/德宏傣族景颇族自治州/陇川县', '陇川县', '3', '0', 'system', '2018-03-11 16:00:18', 'system', '2018-03-11 16:00:18', null);
INSERT INTO `js_sys_area` VALUES ('533300', '530000', '0,530000,', '2850', '0000000250,0000002850,', '0', '1', '云南省/怒江傈僳族自治州', '怒江傈僳族自治州', '2', '0', 'system', '2018-03-11 16:00:18', 'system', '2018-03-11 16:00:18', null);
INSERT INTO `js_sys_area` VALUES ('533321', '533300', '0,530000,533300,', '26780', '0000000250,0000002850,0000026780,', '1', '2', '云南省/怒江傈僳族自治州/泸水县', '泸水县', '3', '0', 'system', '2018-03-11 16:00:18', 'system', '2018-03-11 16:00:18', null);
INSERT INTO `js_sys_area` VALUES ('533323', '533300', '0,530000,533300,', '26790', '0000000250,0000002850,0000026790,', '1', '2', '云南省/怒江傈僳族自治州/福贡县', '福贡县', '3', '0', 'system', '2018-03-11 16:00:18', 'system', '2018-03-11 16:00:18', null);
INSERT INTO `js_sys_area` VALUES ('533324', '533300', '0,530000,533300,', '26800', '0000000250,0000002850,0000026800,', '1', '2', '云南省/怒江傈僳族自治州/贡山独龙族怒族自治县', '贡山独龙族怒族自治县', '3', '0', 'system', '2018-03-11 16:00:18', 'system', '2018-03-11 16:00:18', null);
INSERT INTO `js_sys_area` VALUES ('533325', '533300', '0,530000,533300,', '26810', '0000000250,0000002850,0000026810,', '1', '2', '云南省/怒江傈僳族自治州/兰坪白族普米族自治县', '兰坪白族普米族自治县', '3', '0', 'system', '2018-03-11 16:00:18', 'system', '2018-03-11 16:00:18', null);
INSERT INTO `js_sys_area` VALUES ('533400', '530000', '0,530000,', '2860', '0000000250,0000002860,', '0', '1', '云南省/迪庆藏族自治州', '迪庆藏族自治州', '2', '0', 'system', '2018-03-11 16:00:18', 'system', '2018-03-11 16:00:18', null);
INSERT INTO `js_sys_area` VALUES ('533421', '533400', '0,530000,533400,', '26820', '0000000250,0000002860,0000026820,', '1', '2', '云南省/迪庆藏族自治州/香格里拉县', '香格里拉县', '3', '0', 'system', '2018-03-11 16:00:18', 'system', '2018-03-11 16:00:18', null);
INSERT INTO `js_sys_area` VALUES ('533422', '533400', '0,530000,533400,', '26830', '0000000250,0000002860,0000026830,', '1', '2', '云南省/迪庆藏族自治州/德钦县', '德钦县', '3', '0', 'system', '2018-03-11 16:00:18', 'system', '2018-03-11 16:00:18', null);
INSERT INTO `js_sys_area` VALUES ('533423', '533400', '0,530000,533400,', '26840', '0000000250,0000002860,0000026840,', '1', '2', '云南省/迪庆藏族自治州/维西傈僳族自治县', '维西傈僳族自治县', '3', '0', 'system', '2018-03-11 16:00:18', 'system', '2018-03-11 16:00:18', null);
INSERT INTO `js_sys_area` VALUES ('540000', '0', '0,', '260', '0000000260,', '0', '0', '西藏自治区', '西藏自治区', '1', '0', 'system', '2018-03-11 16:00:18', 'system', '2018-03-11 16:00:18', null);
INSERT INTO `js_sys_area` VALUES ('540100', '540000', '0,540000,', '2870', '0000000260,0000002870,', '0', '1', '西藏自治区/拉萨市', '拉萨市', '2', '0', 'system', '2018-03-11 16:00:18', 'system', '2018-03-11 16:00:18', null);
INSERT INTO `js_sys_area` VALUES ('540101', '540100', '0,540000,540100,', '26850', '0000000260,0000002870,0000026850,', '1', '2', '西藏自治区/拉萨市/市辖区', '市辖区', '3', '0', 'system', '2018-03-11 16:00:18', 'system', '2018-03-11 16:00:18', null);
INSERT INTO `js_sys_area` VALUES ('540102', '540100', '0,540000,540100,', '26860', '0000000260,0000002870,0000026860,', '1', '2', '西藏自治区/拉萨市/城关区', '城关区', '3', '0', 'system', '2018-03-11 16:00:18', 'system', '2018-03-11 16:00:18', null);
INSERT INTO `js_sys_area` VALUES ('540121', '540100', '0,540000,540100,', '26870', '0000000260,0000002870,0000026870,', '1', '2', '西藏自治区/拉萨市/林周县', '林周县', '3', '0', 'system', '2018-03-11 16:00:18', 'system', '2018-03-11 16:00:18', null);
INSERT INTO `js_sys_area` VALUES ('540122', '540100', '0,540000,540100,', '26880', '0000000260,0000002870,0000026880,', '1', '2', '西藏自治区/拉萨市/当雄县', '当雄县', '3', '0', 'system', '2018-03-11 16:00:18', 'system', '2018-03-11 16:00:18', null);
INSERT INTO `js_sys_area` VALUES ('540123', '540100', '0,540000,540100,', '26890', '0000000260,0000002870,0000026890,', '1', '2', '西藏自治区/拉萨市/尼木县', '尼木县', '3', '0', 'system', '2018-03-11 16:00:18', 'system', '2018-03-11 16:00:18', null);
INSERT INTO `js_sys_area` VALUES ('540124', '540100', '0,540000,540100,', '26900', '0000000260,0000002870,0000026900,', '1', '2', '西藏自治区/拉萨市/曲水县', '曲水县', '3', '0', 'system', '2018-03-11 16:00:18', 'system', '2018-03-11 16:00:18', null);
INSERT INTO `js_sys_area` VALUES ('540125', '540100', '0,540000,540100,', '26910', '0000000260,0000002870,0000026910,', '1', '2', '西藏自治区/拉萨市/堆龙德庆县', '堆龙德庆县', '3', '0', 'system', '2018-03-11 16:00:18', 'system', '2018-03-11 16:00:18', null);
INSERT INTO `js_sys_area` VALUES ('540126', '540100', '0,540000,540100,', '26920', '0000000260,0000002870,0000026920,', '1', '2', '西藏自治区/拉萨市/达孜县', '达孜县', '3', '0', 'system', '2018-03-11 16:00:18', 'system', '2018-03-11 16:00:18', null);
INSERT INTO `js_sys_area` VALUES ('540127', '540100', '0,540000,540100,', '26930', '0000000260,0000002870,0000026930,', '1', '2', '西藏自治区/拉萨市/墨竹工卡县', '墨竹工卡县', '3', '0', 'system', '2018-03-11 16:00:18', 'system', '2018-03-11 16:00:18', null);
INSERT INTO `js_sys_area` VALUES ('542100', '540000', '0,540000,', '2880', '0000000260,0000002880,', '0', '1', '西藏自治区/昌都地区', '昌都地区', '2', '0', 'system', '2018-03-11 16:00:18', 'system', '2018-03-11 16:00:18', null);
INSERT INTO `js_sys_area` VALUES ('542121', '542100', '0,540000,542100,', '26940', '0000000260,0000002880,0000026940,', '1', '2', '西藏自治区/昌都地区/昌都县', '昌都县', '3', '0', 'system', '2018-03-11 16:00:18', 'system', '2018-03-11 16:00:18', null);
INSERT INTO `js_sys_area` VALUES ('542122', '542100', '0,540000,542100,', '26950', '0000000260,0000002880,0000026950,', '1', '2', '西藏自治区/昌都地区/江达县', '江达县', '3', '0', 'system', '2018-03-11 16:00:18', 'system', '2018-03-11 16:00:18', null);
INSERT INTO `js_sys_area` VALUES ('542123', '542100', '0,540000,542100,', '26960', '0000000260,0000002880,0000026960,', '1', '2', '西藏自治区/昌都地区/贡觉县', '贡觉县', '3', '0', 'system', '2018-03-11 16:00:18', 'system', '2018-03-11 16:00:18', null);
INSERT INTO `js_sys_area` VALUES ('542124', '542100', '0,540000,542100,', '26970', '0000000260,0000002880,0000026970,', '1', '2', '西藏自治区/昌都地区/类乌齐县', '类乌齐县', '3', '0', 'system', '2018-03-11 16:00:18', 'system', '2018-03-11 16:00:18', null);
INSERT INTO `js_sys_area` VALUES ('542125', '542100', '0,540000,542100,', '26980', '0000000260,0000002880,0000026980,', '1', '2', '西藏自治区/昌都地区/丁青县', '丁青县', '3', '0', 'system', '2018-03-11 16:00:18', 'system', '2018-03-11 16:00:18', null);
INSERT INTO `js_sys_area` VALUES ('542126', '542100', '0,540000,542100,', '26990', '0000000260,0000002880,0000026990,', '1', '2', '西藏自治区/昌都地区/察雅县', '察雅县', '3', '0', 'system', '2018-03-11 16:00:18', 'system', '2018-03-11 16:00:18', null);
INSERT INTO `js_sys_area` VALUES ('542127', '542100', '0,540000,542100,', '27000', '0000000260,0000002880,0000027000,', '1', '2', '西藏自治区/昌都地区/八宿县', '八宿县', '3', '0', 'system', '2018-03-11 16:00:18', 'system', '2018-03-11 16:00:18', null);
INSERT INTO `js_sys_area` VALUES ('542128', '542100', '0,540000,542100,', '27010', '0000000260,0000002880,0000027010,', '1', '2', '西藏自治区/昌都地区/左贡县', '左贡县', '3', '0', 'system', '2018-03-11 16:00:18', 'system', '2018-03-11 16:00:18', null);
INSERT INTO `js_sys_area` VALUES ('542129', '542100', '0,540000,542100,', '27020', '0000000260,0000002880,0000027020,', '1', '2', '西藏自治区/昌都地区/芒康县', '芒康县', '3', '0', 'system', '2018-03-11 16:00:18', 'system', '2018-03-11 16:00:18', null);
INSERT INTO `js_sys_area` VALUES ('542132', '542100', '0,540000,542100,', '27030', '0000000260,0000002880,0000027030,', '1', '2', '西藏自治区/昌都地区/洛隆县', '洛隆县', '3', '0', 'system', '2018-03-11 16:00:18', 'system', '2018-03-11 16:00:18', null);
INSERT INTO `js_sys_area` VALUES ('542133', '542100', '0,540000,542100,', '27040', '0000000260,0000002880,0000027040,', '1', '2', '西藏自治区/昌都地区/边坝县', '边坝县', '3', '0', 'system', '2018-03-11 16:00:18', 'system', '2018-03-11 16:00:18', null);
INSERT INTO `js_sys_area` VALUES ('542200', '540000', '0,540000,', '2890', '0000000260,0000002890,', '0', '1', '西藏自治区/山南地区', '山南地区', '2', '0', 'system', '2018-03-11 16:00:18', 'system', '2018-03-11 16:00:18', null);
INSERT INTO `js_sys_area` VALUES ('542221', '542200', '0,540000,542200,', '27050', '0000000260,0000002890,0000027050,', '1', '2', '西藏自治区/山南地区/乃东县', '乃东县', '3', '0', 'system', '2018-03-11 16:00:18', 'system', '2018-03-11 16:00:18', null);
INSERT INTO `js_sys_area` VALUES ('542222', '542200', '0,540000,542200,', '27060', '0000000260,0000002890,0000027060,', '1', '2', '西藏自治区/山南地区/扎囊县', '扎囊县', '3', '0', 'system', '2018-03-11 16:00:18', 'system', '2018-03-11 16:00:18', null);
INSERT INTO `js_sys_area` VALUES ('542223', '542200', '0,540000,542200,', '27070', '0000000260,0000002890,0000027070,', '1', '2', '西藏自治区/山南地区/贡嘎县', '贡嘎县', '3', '0', 'system', '2018-03-11 16:00:18', 'system', '2018-03-11 16:00:18', null);
INSERT INTO `js_sys_area` VALUES ('542224', '542200', '0,540000,542200,', '27080', '0000000260,0000002890,0000027080,', '1', '2', '西藏自治区/山南地区/桑日县', '桑日县', '3', '0', 'system', '2018-03-11 16:00:18', 'system', '2018-03-11 16:00:18', null);
INSERT INTO `js_sys_area` VALUES ('542225', '542200', '0,540000,542200,', '27090', '0000000260,0000002890,0000027090,', '1', '2', '西藏自治区/山南地区/琼结县', '琼结县', '3', '0', 'system', '2018-03-11 16:00:18', 'system', '2018-03-11 16:00:18', null);
INSERT INTO `js_sys_area` VALUES ('542226', '542200', '0,540000,542200,', '27100', '0000000260,0000002890,0000027100,', '1', '2', '西藏自治区/山南地区/曲松县', '曲松县', '3', '0', 'system', '2018-03-11 16:00:18', 'system', '2018-03-11 16:00:18', null);
INSERT INTO `js_sys_area` VALUES ('542227', '542200', '0,540000,542200,', '27110', '0000000260,0000002890,0000027110,', '1', '2', '西藏自治区/山南地区/措美县', '措美县', '3', '0', 'system', '2018-03-11 16:00:19', 'system', '2018-03-11 16:00:19', null);
INSERT INTO `js_sys_area` VALUES ('542228', '542200', '0,540000,542200,', '27120', '0000000260,0000002890,0000027120,', '1', '2', '西藏自治区/山南地区/洛扎县', '洛扎县', '3', '0', 'system', '2018-03-11 16:00:19', 'system', '2018-03-11 16:00:19', null);
INSERT INTO `js_sys_area` VALUES ('542229', '542200', '0,540000,542200,', '27130', '0000000260,0000002890,0000027130,', '1', '2', '西藏自治区/山南地区/加查县', '加查县', '3', '0', 'system', '2018-03-11 16:00:19', 'system', '2018-03-11 16:00:19', null);
INSERT INTO `js_sys_area` VALUES ('542231', '542200', '0,540000,542200,', '27140', '0000000260,0000002890,0000027140,', '1', '2', '西藏自治区/山南地区/隆子县', '隆子县', '3', '0', 'system', '2018-03-11 16:00:19', 'system', '2018-03-11 16:00:19', null);
INSERT INTO `js_sys_area` VALUES ('542232', '542200', '0,540000,542200,', '27150', '0000000260,0000002890,0000027150,', '1', '2', '西藏自治区/山南地区/错那县', '错那县', '3', '0', 'system', '2018-03-11 16:00:19', 'system', '2018-03-11 16:00:19', null);
INSERT INTO `js_sys_area` VALUES ('542233', '542200', '0,540000,542200,', '27160', '0000000260,0000002890,0000027160,', '1', '2', '西藏自治区/山南地区/浪卡子县', '浪卡子县', '3', '0', 'system', '2018-03-11 16:00:19', 'system', '2018-03-11 16:00:19', null);
INSERT INTO `js_sys_area` VALUES ('542300', '540000', '0,540000,', '2900', '0000000260,0000002900,', '0', '1', '西藏自治区/日喀则地区', '日喀则地区', '2', '0', 'system', '2018-03-11 16:00:19', 'system', '2018-03-11 16:00:19', null);
INSERT INTO `js_sys_area` VALUES ('542301', '542300', '0,540000,542300,', '27170', '0000000260,0000002900,0000027170,', '1', '2', '西藏自治区/日喀则地区/日喀则市', '日喀则市', '3', '0', 'system', '2018-03-11 16:00:19', 'system', '2018-03-11 16:00:19', null);
INSERT INTO `js_sys_area` VALUES ('542322', '542300', '0,540000,542300,', '27180', '0000000260,0000002900,0000027180,', '1', '2', '西藏自治区/日喀则地区/南木林县', '南木林县', '3', '0', 'system', '2018-03-11 16:00:19', 'system', '2018-03-11 16:00:19', null);
INSERT INTO `js_sys_area` VALUES ('542323', '542300', '0,540000,542300,', '27190', '0000000260,0000002900,0000027190,', '1', '2', '西藏自治区/日喀则地区/江孜县', '江孜县', '3', '0', 'system', '2018-03-11 16:00:19', 'system', '2018-03-11 16:00:19', null);
INSERT INTO `js_sys_area` VALUES ('542324', '542300', '0,540000,542300,', '27200', '0000000260,0000002900,0000027200,', '1', '2', '西藏自治区/日喀则地区/定日县', '定日县', '3', '0', 'system', '2018-03-11 16:00:19', 'system', '2018-03-11 16:00:19', null);
INSERT INTO `js_sys_area` VALUES ('542325', '542300', '0,540000,542300,', '27210', '0000000260,0000002900,0000027210,', '1', '2', '西藏自治区/日喀则地区/萨迦县', '萨迦县', '3', '0', 'system', '2018-03-11 16:00:19', 'system', '2018-03-11 16:00:19', null);
INSERT INTO `js_sys_area` VALUES ('542326', '542300', '0,540000,542300,', '27220', '0000000260,0000002900,0000027220,', '1', '2', '西藏自治区/日喀则地区/拉孜县', '拉孜县', '3', '0', 'system', '2018-03-11 16:00:19', 'system', '2018-03-11 16:00:19', null);
INSERT INTO `js_sys_area` VALUES ('542327', '542300', '0,540000,542300,', '27230', '0000000260,0000002900,0000027230,', '1', '2', '西藏自治区/日喀则地区/昂仁县', '昂仁县', '3', '0', 'system', '2018-03-11 16:00:19', 'system', '2018-03-11 16:00:19', null);
INSERT INTO `js_sys_area` VALUES ('542328', '542300', '0,540000,542300,', '27240', '0000000260,0000002900,0000027240,', '1', '2', '西藏自治区/日喀则地区/谢通门县', '谢通门县', '3', '0', 'system', '2018-03-11 16:00:19', 'system', '2018-03-11 16:00:19', null);
INSERT INTO `js_sys_area` VALUES ('542329', '542300', '0,540000,542300,', '27250', '0000000260,0000002900,0000027250,', '1', '2', '西藏自治区/日喀则地区/白朗县', '白朗县', '3', '0', 'system', '2018-03-11 16:00:19', 'system', '2018-03-11 16:00:19', null);
INSERT INTO `js_sys_area` VALUES ('542330', '542300', '0,540000,542300,', '27260', '0000000260,0000002900,0000027260,', '1', '2', '西藏自治区/日喀则地区/仁布县', '仁布县', '3', '0', 'system', '2018-03-11 16:00:19', 'system', '2018-03-11 16:00:19', null);
INSERT INTO `js_sys_area` VALUES ('542331', '542300', '0,540000,542300,', '27270', '0000000260,0000002900,0000027270,', '1', '2', '西藏自治区/日喀则地区/康马县', '康马县', '3', '0', 'system', '2018-03-11 16:00:19', 'system', '2018-03-11 16:00:19', null);
INSERT INTO `js_sys_area` VALUES ('542332', '542300', '0,540000,542300,', '27280', '0000000260,0000002900,0000027280,', '1', '2', '西藏自治区/日喀则地区/定结县', '定结县', '3', '0', 'system', '2018-03-11 16:00:19', 'system', '2018-03-11 16:00:19', null);
INSERT INTO `js_sys_area` VALUES ('542333', '542300', '0,540000,542300,', '27290', '0000000260,0000002900,0000027290,', '1', '2', '西藏自治区/日喀则地区/仲巴县', '仲巴县', '3', '0', 'system', '2018-03-11 16:00:19', 'system', '2018-03-11 16:00:19', null);
INSERT INTO `js_sys_area` VALUES ('542334', '542300', '0,540000,542300,', '27300', '0000000260,0000002900,0000027300,', '1', '2', '西藏自治区/日喀则地区/亚东县', '亚东县', '3', '0', 'system', '2018-03-11 16:00:19', 'system', '2018-03-11 16:00:19', null);
INSERT INTO `js_sys_area` VALUES ('542335', '542300', '0,540000,542300,', '27310', '0000000260,0000002900,0000027310,', '1', '2', '西藏自治区/日喀则地区/吉隆县', '吉隆县', '3', '0', 'system', '2018-03-11 16:00:19', 'system', '2018-03-11 16:00:19', null);
INSERT INTO `js_sys_area` VALUES ('542336', '542300', '0,540000,542300,', '27320', '0000000260,0000002900,0000027320,', '1', '2', '西藏自治区/日喀则地区/聂拉木县', '聂拉木县', '3', '0', 'system', '2018-03-11 16:00:19', 'system', '2018-03-11 16:00:19', null);
INSERT INTO `js_sys_area` VALUES ('542337', '542300', '0,540000,542300,', '27330', '0000000260,0000002900,0000027330,', '1', '2', '西藏自治区/日喀则地区/萨嘎县', '萨嘎县', '3', '0', 'system', '2018-03-11 16:00:19', 'system', '2018-03-11 16:00:19', null);
INSERT INTO `js_sys_area` VALUES ('542338', '542300', '0,540000,542300,', '27340', '0000000260,0000002900,0000027340,', '1', '2', '西藏自治区/日喀则地区/岗巴县', '岗巴县', '3', '0', 'system', '2018-03-11 16:00:19', 'system', '2018-03-11 16:00:19', null);
INSERT INTO `js_sys_area` VALUES ('542400', '540000', '0,540000,', '2910', '0000000260,0000002910,', '0', '1', '西藏自治区/那曲地区', '那曲地区', '2', '0', 'system', '2018-03-11 16:00:19', 'system', '2018-03-11 16:00:19', null);
INSERT INTO `js_sys_area` VALUES ('542421', '542400', '0,540000,542400,', '27350', '0000000260,0000002910,0000027350,', '1', '2', '西藏自治区/那曲地区/那曲县', '那曲县', '3', '0', 'system', '2018-03-11 16:00:19', 'system', '2018-03-11 16:00:19', null);
INSERT INTO `js_sys_area` VALUES ('542422', '542400', '0,540000,542400,', '27360', '0000000260,0000002910,0000027360,', '1', '2', '西藏自治区/那曲地区/嘉黎县', '嘉黎县', '3', '0', 'system', '2018-03-11 16:00:19', 'system', '2018-03-11 16:00:19', null);
INSERT INTO `js_sys_area` VALUES ('542423', '542400', '0,540000,542400,', '27370', '0000000260,0000002910,0000027370,', '1', '2', '西藏自治区/那曲地区/比如县', '比如县', '3', '0', 'system', '2018-03-11 16:00:19', 'system', '2018-03-11 16:00:19', null);
INSERT INTO `js_sys_area` VALUES ('542424', '542400', '0,540000,542400,', '27380', '0000000260,0000002910,0000027380,', '1', '2', '西藏自治区/那曲地区/聂荣县', '聂荣县', '3', '0', 'system', '2018-03-11 16:00:19', 'system', '2018-03-11 16:00:19', null);
INSERT INTO `js_sys_area` VALUES ('542425', '542400', '0,540000,542400,', '27390', '0000000260,0000002910,0000027390,', '1', '2', '西藏自治区/那曲地区/安多县', '安多县', '3', '0', 'system', '2018-03-11 16:00:19', 'system', '2018-03-11 16:00:19', null);
INSERT INTO `js_sys_area` VALUES ('542426', '542400', '0,540000,542400,', '27400', '0000000260,0000002910,0000027400,', '1', '2', '西藏自治区/那曲地区/申扎县', '申扎县', '3', '0', 'system', '2018-03-11 16:00:19', 'system', '2018-03-11 16:00:19', null);
INSERT INTO `js_sys_area` VALUES ('542427', '542400', '0,540000,542400,', '27410', '0000000260,0000002910,0000027410,', '1', '2', '西藏自治区/那曲地区/索　县', '索　县', '3', '0', 'system', '2018-03-11 16:00:19', 'system', '2018-03-11 16:00:19', null);
INSERT INTO `js_sys_area` VALUES ('542428', '542400', '0,540000,542400,', '27420', '0000000260,0000002910,0000027420,', '1', '2', '西藏自治区/那曲地区/班戈县', '班戈县', '3', '0', 'system', '2018-03-11 16:00:19', 'system', '2018-03-11 16:00:19', null);
INSERT INTO `js_sys_area` VALUES ('542429', '542400', '0,540000,542400,', '27430', '0000000260,0000002910,0000027430,', '1', '2', '西藏自治区/那曲地区/巴青县', '巴青县', '3', '0', 'system', '2018-03-11 16:00:19', 'system', '2018-03-11 16:00:19', null);
INSERT INTO `js_sys_area` VALUES ('542430', '542400', '0,540000,542400,', '27440', '0000000260,0000002910,0000027440,', '1', '2', '西藏自治区/那曲地区/尼玛县', '尼玛县', '3', '0', 'system', '2018-03-11 16:00:19', 'system', '2018-03-11 16:00:19', null);
INSERT INTO `js_sys_area` VALUES ('542500', '540000', '0,540000,', '2920', '0000000260,0000002920,', '0', '1', '西藏自治区/阿里地区', '阿里地区', '2', '0', 'system', '2018-03-11 16:00:19', 'system', '2018-03-11 16:00:19', null);
INSERT INTO `js_sys_area` VALUES ('542521', '542500', '0,540000,542500,', '27450', '0000000260,0000002920,0000027450,', '1', '2', '西藏自治区/阿里地区/普兰县', '普兰县', '3', '0', 'system', '2018-03-11 16:00:19', 'system', '2018-03-11 16:00:19', null);
INSERT INTO `js_sys_area` VALUES ('542522', '542500', '0,540000,542500,', '27460', '0000000260,0000002920,0000027460,', '1', '2', '西藏自治区/阿里地区/札达县', '札达县', '3', '0', 'system', '2018-03-11 16:00:19', 'system', '2018-03-11 16:00:19', null);
INSERT INTO `js_sys_area` VALUES ('542523', '542500', '0,540000,542500,', '27470', '0000000260,0000002920,0000027470,', '1', '2', '西藏自治区/阿里地区/噶尔县', '噶尔县', '3', '0', 'system', '2018-03-11 16:00:19', 'system', '2018-03-11 16:00:19', null);
INSERT INTO `js_sys_area` VALUES ('542524', '542500', '0,540000,542500,', '27480', '0000000260,0000002920,0000027480,', '1', '2', '西藏自治区/阿里地区/日土县', '日土县', '3', '0', 'system', '2018-03-11 16:00:19', 'system', '2018-03-11 16:00:19', null);
INSERT INTO `js_sys_area` VALUES ('542525', '542500', '0,540000,542500,', '27490', '0000000260,0000002920,0000027490,', '1', '2', '西藏自治区/阿里地区/革吉县', '革吉县', '3', '0', 'system', '2018-03-11 16:00:19', 'system', '2018-03-11 16:00:19', null);
INSERT INTO `js_sys_area` VALUES ('542526', '542500', '0,540000,542500,', '27500', '0000000260,0000002920,0000027500,', '1', '2', '西藏自治区/阿里地区/改则县', '改则县', '3', '0', 'system', '2018-03-11 16:00:19', 'system', '2018-03-11 16:00:19', null);
INSERT INTO `js_sys_area` VALUES ('542527', '542500', '0,540000,542500,', '27510', '0000000260,0000002920,0000027510,', '1', '2', '西藏自治区/阿里地区/措勤县', '措勤县', '3', '0', 'system', '2018-03-11 16:00:19', 'system', '2018-03-11 16:00:19', null);
INSERT INTO `js_sys_area` VALUES ('542600', '540000', '0,540000,', '2930', '0000000260,0000002930,', '0', '1', '西藏自治区/林芝地区', '林芝地区', '2', '0', 'system', '2018-03-11 16:00:19', 'system', '2018-03-11 16:00:19', null);
INSERT INTO `js_sys_area` VALUES ('542621', '542600', '0,540000,542600,', '27520', '0000000260,0000002930,0000027520,', '1', '2', '西藏自治区/林芝地区/林芝县', '林芝县', '3', '0', 'system', '2018-03-11 16:00:19', 'system', '2018-03-11 16:00:19', null);
INSERT INTO `js_sys_area` VALUES ('542622', '542600', '0,540000,542600,', '27530', '0000000260,0000002930,0000027530,', '1', '2', '西藏自治区/林芝地区/工布江达县', '工布江达县', '3', '0', 'system', '2018-03-11 16:00:19', 'system', '2018-03-11 16:00:19', null);
INSERT INTO `js_sys_area` VALUES ('542623', '542600', '0,540000,542600,', '27540', '0000000260,0000002930,0000027540,', '1', '2', '西藏自治区/林芝地区/米林县', '米林县', '3', '0', 'system', '2018-03-11 16:00:19', 'system', '2018-03-11 16:00:19', null);
INSERT INTO `js_sys_area` VALUES ('542624', '542600', '0,540000,542600,', '27550', '0000000260,0000002930,0000027550,', '1', '2', '西藏自治区/林芝地区/墨脱县', '墨脱县', '3', '0', 'system', '2018-03-11 16:00:19', 'system', '2018-03-11 16:00:19', null);
INSERT INTO `js_sys_area` VALUES ('542625', '542600', '0,540000,542600,', '27560', '0000000260,0000002930,0000027560,', '1', '2', '西藏自治区/林芝地区/波密县', '波密县', '3', '0', 'system', '2018-03-11 16:00:19', 'system', '2018-03-11 16:00:19', null);
INSERT INTO `js_sys_area` VALUES ('542626', '542600', '0,540000,542600,', '27570', '0000000260,0000002930,0000027570,', '1', '2', '西藏自治区/林芝地区/察隅县', '察隅县', '3', '0', 'system', '2018-03-11 16:00:19', 'system', '2018-03-11 16:00:19', null);
INSERT INTO `js_sys_area` VALUES ('542627', '542600', '0,540000,542600,', '27580', '0000000260,0000002930,0000027580,', '1', '2', '西藏自治区/林芝地区/朗　县', '朗　县', '3', '0', 'system', '2018-03-11 16:00:19', 'system', '2018-03-11 16:00:19', null);
INSERT INTO `js_sys_area` VALUES ('610000', '0', '0,', '270', '0000000270,', '0', '0', '陕西省', '陕西省', '1', '0', 'system', '2018-03-11 16:00:19', 'system', '2018-03-11 16:00:19', null);
INSERT INTO `js_sys_area` VALUES ('610100', '610000', '0,610000,', '2940', '0000000270,0000002940,', '0', '1', '陕西省/西安市', '西安市', '2', '0', 'system', '2018-03-11 16:00:19', 'system', '2018-03-11 16:00:19', null);
INSERT INTO `js_sys_area` VALUES ('610101', '610100', '0,610000,610100,', '27590', '0000000270,0000002940,0000027590,', '1', '2', '陕西省/西安市/市辖区', '市辖区', '3', '0', 'system', '2018-03-11 16:00:19', 'system', '2018-03-11 16:00:19', null);
INSERT INTO `js_sys_area` VALUES ('610102', '610100', '0,610000,610100,', '27600', '0000000270,0000002940,0000027600,', '1', '2', '陕西省/西安市/新城区', '新城区', '3', '0', 'system', '2018-03-11 16:00:19', 'system', '2018-03-11 16:00:19', null);
INSERT INTO `js_sys_area` VALUES ('610103', '610100', '0,610000,610100,', '27610', '0000000270,0000002940,0000027610,', '1', '2', '陕西省/西安市/碑林区', '碑林区', '3', '0', 'system', '2018-03-11 16:00:19', 'system', '2018-03-11 16:00:19', null);
INSERT INTO `js_sys_area` VALUES ('610104', '610100', '0,610000,610100,', '27620', '0000000270,0000002940,0000027620,', '1', '2', '陕西省/西安市/莲湖区', '莲湖区', '3', '0', 'system', '2018-03-11 16:00:19', 'system', '2018-03-11 16:00:19', null);
INSERT INTO `js_sys_area` VALUES ('610111', '610100', '0,610000,610100,', '27630', '0000000270,0000002940,0000027630,', '1', '2', '陕西省/西安市/灞桥区', '灞桥区', '3', '0', 'system', '2018-03-11 16:00:19', 'system', '2018-03-11 16:00:19', null);
INSERT INTO `js_sys_area` VALUES ('610112', '610100', '0,610000,610100,', '27640', '0000000270,0000002940,0000027640,', '1', '2', '陕西省/西安市/未央区', '未央区', '3', '0', 'system', '2018-03-11 16:00:19', 'system', '2018-03-11 16:00:19', null);
INSERT INTO `js_sys_area` VALUES ('610113', '610100', '0,610000,610100,', '27650', '0000000270,0000002940,0000027650,', '1', '2', '陕西省/西安市/雁塔区', '雁塔区', '3', '0', 'system', '2018-03-11 16:00:19', 'system', '2018-03-11 16:00:19', null);
INSERT INTO `js_sys_area` VALUES ('610114', '610100', '0,610000,610100,', '27660', '0000000270,0000002940,0000027660,', '1', '2', '陕西省/西安市/阎良区', '阎良区', '3', '0', 'system', '2018-03-11 16:00:19', 'system', '2018-03-11 16:00:19', null);
INSERT INTO `js_sys_area` VALUES ('610115', '610100', '0,610000,610100,', '27670', '0000000270,0000002940,0000027670,', '1', '2', '陕西省/西安市/临潼区', '临潼区', '3', '0', 'system', '2018-03-11 16:00:19', 'system', '2018-03-11 16:00:19', null);
INSERT INTO `js_sys_area` VALUES ('610116', '610100', '0,610000,610100,', '27680', '0000000270,0000002940,0000027680,', '1', '2', '陕西省/西安市/长安区', '长安区', '3', '0', 'system', '2018-03-11 16:00:19', 'system', '2018-03-11 16:00:19', null);
INSERT INTO `js_sys_area` VALUES ('610122', '610100', '0,610000,610100,', '27690', '0000000270,0000002940,0000027690,', '1', '2', '陕西省/西安市/蓝田县', '蓝田县', '3', '0', 'system', '2018-03-11 16:00:20', 'system', '2018-03-11 16:00:20', null);
INSERT INTO `js_sys_area` VALUES ('610124', '610100', '0,610000,610100,', '27700', '0000000270,0000002940,0000027700,', '1', '2', '陕西省/西安市/周至县', '周至县', '3', '0', 'system', '2018-03-11 16:00:20', 'system', '2018-03-11 16:00:20', null);
INSERT INTO `js_sys_area` VALUES ('610125', '610100', '0,610000,610100,', '27710', '0000000270,0000002940,0000027710,', '1', '2', '陕西省/西安市/户　县', '户　县', '3', '0', 'system', '2018-03-11 16:00:20', 'system', '2018-03-11 16:00:20', null);
INSERT INTO `js_sys_area` VALUES ('610126', '610100', '0,610000,610100,', '27720', '0000000270,0000002940,0000027720,', '1', '2', '陕西省/西安市/高陵县', '高陵县', '3', '0', 'system', '2018-03-11 16:00:20', 'system', '2018-03-11 16:00:20', null);
INSERT INTO `js_sys_area` VALUES ('610200', '610000', '0,610000,', '2950', '0000000270,0000002950,', '0', '1', '陕西省/铜川市', '铜川市', '2', '0', 'system', '2018-03-11 16:00:20', 'system', '2018-03-11 16:00:20', null);
INSERT INTO `js_sys_area` VALUES ('610201', '610200', '0,610000,610200,', '27730', '0000000270,0000002950,0000027730,', '1', '2', '陕西省/铜川市/市辖区', '市辖区', '3', '0', 'system', '2018-03-11 16:00:20', 'system', '2018-03-11 16:00:20', null);
INSERT INTO `js_sys_area` VALUES ('610202', '610200', '0,610000,610200,', '27740', '0000000270,0000002950,0000027740,', '1', '2', '陕西省/铜川市/王益区', '王益区', '3', '0', 'system', '2018-03-11 16:00:20', 'system', '2018-03-11 16:00:20', null);
INSERT INTO `js_sys_area` VALUES ('610203', '610200', '0,610000,610200,', '27750', '0000000270,0000002950,0000027750,', '1', '2', '陕西省/铜川市/印台区', '印台区', '3', '0', 'system', '2018-03-11 16:00:20', 'system', '2018-03-11 16:00:20', null);
INSERT INTO `js_sys_area` VALUES ('610204', '610200', '0,610000,610200,', '27760', '0000000270,0000002950,0000027760,', '1', '2', '陕西省/铜川市/耀州区', '耀州区', '3', '0', 'system', '2018-03-11 16:00:20', 'system', '2018-03-11 16:00:20', null);
INSERT INTO `js_sys_area` VALUES ('610222', '610200', '0,610000,610200,', '27770', '0000000270,0000002950,0000027770,', '1', '2', '陕西省/铜川市/宜君县', '宜君县', '3', '0', 'system', '2018-03-11 16:00:20', 'system', '2018-03-11 16:00:20', null);
INSERT INTO `js_sys_area` VALUES ('610300', '610000', '0,610000,', '2960', '0000000270,0000002960,', '0', '1', '陕西省/宝鸡市', '宝鸡市', '2', '0', 'system', '2018-03-11 16:00:20', 'system', '2018-03-11 16:00:20', null);
INSERT INTO `js_sys_area` VALUES ('610301', '610300', '0,610000,610300,', '27780', '0000000270,0000002960,0000027780,', '1', '2', '陕西省/宝鸡市/市辖区', '市辖区', '3', '0', 'system', '2018-03-11 16:00:20', 'system', '2018-03-11 16:00:20', null);
INSERT INTO `js_sys_area` VALUES ('610302', '610300', '0,610000,610300,', '27790', '0000000270,0000002960,0000027790,', '1', '2', '陕西省/宝鸡市/渭滨区', '渭滨区', '3', '0', 'system', '2018-03-11 16:00:20', 'system', '2018-03-11 16:00:20', null);
INSERT INTO `js_sys_area` VALUES ('610303', '610300', '0,610000,610300,', '27800', '0000000270,0000002960,0000027800,', '1', '2', '陕西省/宝鸡市/金台区', '金台区', '3', '0', 'system', '2018-03-11 16:00:20', 'system', '2018-03-11 16:00:20', null);
INSERT INTO `js_sys_area` VALUES ('610304', '610300', '0,610000,610300,', '27810', '0000000270,0000002960,0000027810,', '1', '2', '陕西省/宝鸡市/陈仓区', '陈仓区', '3', '0', 'system', '2018-03-11 16:00:20', 'system', '2018-03-11 16:00:20', null);
INSERT INTO `js_sys_area` VALUES ('610322', '610300', '0,610000,610300,', '27820', '0000000270,0000002960,0000027820,', '1', '2', '陕西省/宝鸡市/凤翔县', '凤翔县', '3', '0', 'system', '2018-03-11 16:00:20', 'system', '2018-03-11 16:00:20', null);
INSERT INTO `js_sys_area` VALUES ('610323', '610300', '0,610000,610300,', '27830', '0000000270,0000002960,0000027830,', '1', '2', '陕西省/宝鸡市/岐山县', '岐山县', '3', '0', 'system', '2018-03-11 16:00:20', 'system', '2018-03-11 16:00:20', null);
INSERT INTO `js_sys_area` VALUES ('610324', '610300', '0,610000,610300,', '27840', '0000000270,0000002960,0000027840,', '1', '2', '陕西省/宝鸡市/扶风县', '扶风县', '3', '0', 'system', '2018-03-11 16:00:20', 'system', '2018-03-11 16:00:20', null);
INSERT INTO `js_sys_area` VALUES ('610326', '610300', '0,610000,610300,', '27850', '0000000270,0000002960,0000027850,', '1', '2', '陕西省/宝鸡市/眉　县', '眉　县', '3', '0', 'system', '2018-03-11 16:00:20', 'system', '2018-03-11 16:00:20', null);
INSERT INTO `js_sys_area` VALUES ('610327', '610300', '0,610000,610300,', '27860', '0000000270,0000002960,0000027860,', '1', '2', '陕西省/宝鸡市/陇　县', '陇　县', '3', '0', 'system', '2018-03-11 16:00:20', 'system', '2018-03-11 16:00:20', null);
INSERT INTO `js_sys_area` VALUES ('610328', '610300', '0,610000,610300,', '27870', '0000000270,0000002960,0000027870,', '1', '2', '陕西省/宝鸡市/千阳县', '千阳县', '3', '0', 'system', '2018-03-11 16:00:20', 'system', '2018-03-11 16:00:20', null);
INSERT INTO `js_sys_area` VALUES ('610329', '610300', '0,610000,610300,', '27880', '0000000270,0000002960,0000027880,', '1', '2', '陕西省/宝鸡市/麟游县', '麟游县', '3', '0', 'system', '2018-03-11 16:00:20', 'system', '2018-03-11 16:00:20', null);
INSERT INTO `js_sys_area` VALUES ('610330', '610300', '0,610000,610300,', '27890', '0000000270,0000002960,0000027890,', '1', '2', '陕西省/宝鸡市/凤　县', '凤　县', '3', '0', 'system', '2018-03-11 16:00:20', 'system', '2018-03-11 16:00:20', null);
INSERT INTO `js_sys_area` VALUES ('610331', '610300', '0,610000,610300,', '27900', '0000000270,0000002960,0000027900,', '1', '2', '陕西省/宝鸡市/太白县', '太白县', '3', '0', 'system', '2018-03-11 16:00:20', 'system', '2018-03-11 16:00:20', null);
INSERT INTO `js_sys_area` VALUES ('610400', '610000', '0,610000,', '2970', '0000000270,0000002970,', '0', '1', '陕西省/咸阳市', '咸阳市', '2', '0', 'system', '2018-03-11 16:00:20', 'system', '2018-03-11 16:00:20', null);
INSERT INTO `js_sys_area` VALUES ('610401', '610400', '0,610000,610400,', '27910', '0000000270,0000002970,0000027910,', '1', '2', '陕西省/咸阳市/市辖区', '市辖区', '3', '0', 'system', '2018-03-11 16:00:20', 'system', '2018-03-11 16:00:20', null);
INSERT INTO `js_sys_area` VALUES ('610402', '610400', '0,610000,610400,', '27920', '0000000270,0000002970,0000027920,', '1', '2', '陕西省/咸阳市/秦都区', '秦都区', '3', '0', 'system', '2018-03-11 16:00:20', 'system', '2018-03-11 16:00:20', null);
INSERT INTO `js_sys_area` VALUES ('610403', '610400', '0,610000,610400,', '27930', '0000000270,0000002970,0000027930,', '1', '2', '陕西省/咸阳市/杨凌区', '杨凌区', '3', '0', 'system', '2018-03-11 16:00:20', 'system', '2018-03-11 16:00:20', null);
INSERT INTO `js_sys_area` VALUES ('610404', '610400', '0,610000,610400,', '27940', '0000000270,0000002970,0000027940,', '1', '2', '陕西省/咸阳市/渭城区', '渭城区', '3', '0', 'system', '2018-03-11 16:00:20', 'system', '2018-03-11 16:00:20', null);
INSERT INTO `js_sys_area` VALUES ('610422', '610400', '0,610000,610400,', '27950', '0000000270,0000002970,0000027950,', '1', '2', '陕西省/咸阳市/三原县', '三原县', '3', '0', 'system', '2018-03-11 16:00:20', 'system', '2018-03-11 16:00:20', null);
INSERT INTO `js_sys_area` VALUES ('610423', '610400', '0,610000,610400,', '27960', '0000000270,0000002970,0000027960,', '1', '2', '陕西省/咸阳市/泾阳县', '泾阳县', '3', '0', 'system', '2018-03-11 16:00:20', 'system', '2018-03-11 16:00:20', null);
INSERT INTO `js_sys_area` VALUES ('610424', '610400', '0,610000,610400,', '27970', '0000000270,0000002970,0000027970,', '1', '2', '陕西省/咸阳市/乾　县', '乾　县', '3', '0', 'system', '2018-03-11 16:00:20', 'system', '2018-03-11 16:00:20', null);
INSERT INTO `js_sys_area` VALUES ('610425', '610400', '0,610000,610400,', '27980', '0000000270,0000002970,0000027980,', '1', '2', '陕西省/咸阳市/礼泉县', '礼泉县', '3', '0', 'system', '2018-03-11 16:00:20', 'system', '2018-03-11 16:00:20', null);
INSERT INTO `js_sys_area` VALUES ('610426', '610400', '0,610000,610400,', '27990', '0000000270,0000002970,0000027990,', '1', '2', '陕西省/咸阳市/永寿县', '永寿县', '3', '0', 'system', '2018-03-11 16:00:20', 'system', '2018-03-11 16:00:20', null);
INSERT INTO `js_sys_area` VALUES ('610427', '610400', '0,610000,610400,', '28000', '0000000270,0000002970,0000028000,', '1', '2', '陕西省/咸阳市/彬　县', '彬　县', '3', '0', 'system', '2018-03-11 16:00:20', 'system', '2018-03-11 16:00:20', null);
INSERT INTO `js_sys_area` VALUES ('610428', '610400', '0,610000,610400,', '28010', '0000000270,0000002970,0000028010,', '1', '2', '陕西省/咸阳市/长武县', '长武县', '3', '0', 'system', '2018-03-11 16:00:20', 'system', '2018-03-11 16:00:20', null);
INSERT INTO `js_sys_area` VALUES ('610429', '610400', '0,610000,610400,', '28020', '0000000270,0000002970,0000028020,', '1', '2', '陕西省/咸阳市/旬邑县', '旬邑县', '3', '0', 'system', '2018-03-11 16:00:20', 'system', '2018-03-11 16:00:20', null);
INSERT INTO `js_sys_area` VALUES ('610430', '610400', '0,610000,610400,', '28030', '0000000270,0000002970,0000028030,', '1', '2', '陕西省/咸阳市/淳化县', '淳化县', '3', '0', 'system', '2018-03-11 16:00:20', 'system', '2018-03-11 16:00:20', null);
INSERT INTO `js_sys_area` VALUES ('610431', '610400', '0,610000,610400,', '28040', '0000000270,0000002970,0000028040,', '1', '2', '陕西省/咸阳市/武功县', '武功县', '3', '0', 'system', '2018-03-11 16:00:20', 'system', '2018-03-11 16:00:20', null);
INSERT INTO `js_sys_area` VALUES ('610481', '610400', '0,610000,610400,', '28050', '0000000270,0000002970,0000028050,', '1', '2', '陕西省/咸阳市/兴平市', '兴平市', '3', '0', 'system', '2018-03-11 16:00:20', 'system', '2018-03-11 16:00:20', null);
INSERT INTO `js_sys_area` VALUES ('610500', '610000', '0,610000,', '2980', '0000000270,0000002980,', '0', '1', '陕西省/渭南市', '渭南市', '2', '0', 'system', '2018-03-11 16:00:20', 'system', '2018-03-11 16:00:20', null);
INSERT INTO `js_sys_area` VALUES ('610501', '610500', '0,610000,610500,', '28060', '0000000270,0000002980,0000028060,', '1', '2', '陕西省/渭南市/市辖区', '市辖区', '3', '0', 'system', '2018-03-11 16:00:20', 'system', '2018-03-11 16:00:20', null);
INSERT INTO `js_sys_area` VALUES ('610502', '610500', '0,610000,610500,', '28070', '0000000270,0000002980,0000028070,', '1', '2', '陕西省/渭南市/临渭区', '临渭区', '3', '0', 'system', '2018-03-11 16:00:20', 'system', '2018-03-11 16:00:20', null);
INSERT INTO `js_sys_area` VALUES ('610521', '610500', '0,610000,610500,', '28080', '0000000270,0000002980,0000028080,', '1', '2', '陕西省/渭南市/华　县', '华　县', '3', '0', 'system', '2018-03-11 16:00:20', 'system', '2018-03-11 16:00:20', null);
INSERT INTO `js_sys_area` VALUES ('610522', '610500', '0,610000,610500,', '28090', '0000000270,0000002980,0000028090,', '1', '2', '陕西省/渭南市/潼关县', '潼关县', '3', '0', 'system', '2018-03-11 16:00:20', 'system', '2018-03-11 16:00:20', null);
INSERT INTO `js_sys_area` VALUES ('610523', '610500', '0,610000,610500,', '28100', '0000000270,0000002980,0000028100,', '1', '2', '陕西省/渭南市/大荔县', '大荔县', '3', '0', 'system', '2018-03-11 16:00:20', 'system', '2018-03-11 16:00:20', null);
INSERT INTO `js_sys_area` VALUES ('610524', '610500', '0,610000,610500,', '28110', '0000000270,0000002980,0000028110,', '1', '2', '陕西省/渭南市/合阳县', '合阳县', '3', '0', 'system', '2018-03-11 16:00:20', 'system', '2018-03-11 16:00:20', null);
INSERT INTO `js_sys_area` VALUES ('610525', '610500', '0,610000,610500,', '28120', '0000000270,0000002980,0000028120,', '1', '2', '陕西省/渭南市/澄城县', '澄城县', '3', '0', 'system', '2018-03-11 16:00:20', 'system', '2018-03-11 16:00:20', null);
INSERT INTO `js_sys_area` VALUES ('610526', '610500', '0,610000,610500,', '28130', '0000000270,0000002980,0000028130,', '1', '2', '陕西省/渭南市/蒲城县', '蒲城县', '3', '0', 'system', '2018-03-11 16:00:20', 'system', '2018-03-11 16:00:20', null);
INSERT INTO `js_sys_area` VALUES ('610527', '610500', '0,610000,610500,', '28140', '0000000270,0000002980,0000028140,', '1', '2', '陕西省/渭南市/白水县', '白水县', '3', '0', 'system', '2018-03-11 16:00:20', 'system', '2018-03-11 16:00:20', null);
INSERT INTO `js_sys_area` VALUES ('610528', '610500', '0,610000,610500,', '28150', '0000000270,0000002980,0000028150,', '1', '2', '陕西省/渭南市/富平县', '富平县', '3', '0', 'system', '2018-03-11 16:00:20', 'system', '2018-03-11 16:00:20', null);
INSERT INTO `js_sys_area` VALUES ('610581', '610500', '0,610000,610500,', '28160', '0000000270,0000002980,0000028160,', '1', '2', '陕西省/渭南市/韩城市', '韩城市', '3', '0', 'system', '2018-03-11 16:00:20', 'system', '2018-03-11 16:00:20', null);
INSERT INTO `js_sys_area` VALUES ('610582', '610500', '0,610000,610500,', '28170', '0000000270,0000002980,0000028170,', '1', '2', '陕西省/渭南市/华阴市', '华阴市', '3', '0', 'system', '2018-03-11 16:00:20', 'system', '2018-03-11 16:00:20', null);
INSERT INTO `js_sys_area` VALUES ('610600', '610000', '0,610000,', '2990', '0000000270,0000002990,', '0', '1', '陕西省/延安市', '延安市', '2', '0', 'system', '2018-03-11 16:00:20', 'system', '2018-03-11 16:00:20', null);
INSERT INTO `js_sys_area` VALUES ('610601', '610600', '0,610000,610600,', '28180', '0000000270,0000002990,0000028180,', '1', '2', '陕西省/延安市/市辖区', '市辖区', '3', '0', 'system', '2018-03-11 16:00:20', 'system', '2018-03-11 16:00:20', null);
INSERT INTO `js_sys_area` VALUES ('610621', '610600', '0,610000,610600,', '28200', '0000000270,0000002990,0000028200,', '1', '2', '陕西省/延安市/延长县', '延长县', '3', '0', 'system', '2018-03-11 16:00:20', 'system', '2018-03-11 16:00:20', null);
INSERT INTO `js_sys_area` VALUES ('610622', '610600', '0,610000,610600,', '28210', '0000000270,0000002990,0000028210,', '1', '2', '陕西省/延安市/延川县', '延川县', '3', '0', 'system', '2018-03-11 16:00:20', 'system', '2018-03-11 16:00:20', null);
INSERT INTO `js_sys_area` VALUES ('610623', '610600', '0,610000,610600,', '28220', '0000000270,0000002990,0000028220,', '1', '2', '陕西省/延安市/子长县', '子长县', '3', '0', 'system', '2018-03-11 16:00:20', 'system', '2018-03-11 16:00:20', null);
INSERT INTO `js_sys_area` VALUES ('610624', '610600', '0,610000,610600,', '28230', '0000000270,0000002990,0000028230,', '1', '2', '陕西省/延安市/安塞县', '安塞县', '3', '0', 'system', '2018-03-11 16:00:20', 'system', '2018-03-11 16:00:20', null);
INSERT INTO `js_sys_area` VALUES ('610625', '610600', '0,610000,610600,', '28240', '0000000270,0000002990,0000028240,', '1', '2', '陕西省/延安市/志丹县', '志丹县', '3', '0', 'system', '2018-03-11 16:00:20', 'system', '2018-03-11 16:00:20', null);
INSERT INTO `js_sys_area` VALUES ('610626', '610600', '0,610000,610600,', '28250', '0000000270,0000002990,0000028250,', '1', '2', '陕西省/延安市/吴旗县', '吴旗县', '3', '0', 'system', '2018-03-11 16:00:20', 'system', '2018-03-11 16:00:20', null);
INSERT INTO `js_sys_area` VALUES ('610627', '610600', '0,610000,610600,', '28260', '0000000270,0000002990,0000028260,', '1', '2', '陕西省/延安市/甘泉县', '甘泉县', '3', '0', 'system', '2018-03-11 16:00:20', 'system', '2018-03-11 16:00:20', null);
INSERT INTO `js_sys_area` VALUES ('610628', '610600', '0,610000,610600,', '28270', '0000000270,0000002990,0000028270,', '1', '2', '陕西省/延安市/富　县', '富　县', '3', '0', 'system', '2018-03-11 16:00:21', 'system', '2018-03-11 16:00:21', null);
INSERT INTO `js_sys_area` VALUES ('610629', '610600', '0,610000,610600,', '28280', '0000000270,0000002990,0000028280,', '1', '2', '陕西省/延安市/洛川县', '洛川县', '3', '0', 'system', '2018-03-11 16:00:21', 'system', '2018-03-11 16:00:21', null);
INSERT INTO `js_sys_area` VALUES ('610630', '610600', '0,610000,610600,', '28290', '0000000270,0000002990,0000028290,', '1', '2', '陕西省/延安市/宜川县', '宜川县', '3', '0', 'system', '2018-03-11 16:00:21', 'system', '2018-03-11 16:00:21', null);
INSERT INTO `js_sys_area` VALUES ('610631', '610600', '0,610000,610600,', '28300', '0000000270,0000002990,0000028300,', '1', '2', '陕西省/延安市/黄龙县', '黄龙县', '3', '0', 'system', '2018-03-11 16:00:21', 'system', '2018-03-11 16:00:21', null);
INSERT INTO `js_sys_area` VALUES ('610632', '610600', '0,610000,610600,', '28310', '0000000270,0000002990,0000028310,', '1', '2', '陕西省/延安市/黄陵县', '黄陵县', '3', '0', 'system', '2018-03-11 16:00:21', 'system', '2018-03-11 16:00:21', null);
INSERT INTO `js_sys_area` VALUES ('610700', '610000', '0,610000,', '3000', '0000000270,0000003000,', '0', '1', '陕西省/汉中市', '汉中市', '2', '0', 'system', '2018-03-11 16:00:21', 'system', '2018-03-11 16:00:21', null);
INSERT INTO `js_sys_area` VALUES ('610701', '610700', '0,610000,610700,', '28320', '0000000270,0000003000,0000028320,', '1', '2', '陕西省/汉中市/市辖区', '市辖区', '3', '0', 'system', '2018-03-11 16:00:21', 'system', '2018-03-11 16:00:21', null);
INSERT INTO `js_sys_area` VALUES ('610702', '610700', '0,610000,610700,', '28330', '0000000270,0000003000,0000028330,', '1', '2', '陕西省/汉中市/汉台区', '汉台区', '3', '0', 'system', '2018-03-11 16:00:21', 'system', '2018-03-11 16:00:21', null);
INSERT INTO `js_sys_area` VALUES ('610721', '610700', '0,610000,610700,', '28340', '0000000270,0000003000,0000028340,', '1', '2', '陕西省/汉中市/南郑县', '南郑县', '3', '0', 'system', '2018-03-11 16:00:21', 'system', '2018-03-11 16:00:21', null);
INSERT INTO `js_sys_area` VALUES ('610722', '610700', '0,610000,610700,', '28350', '0000000270,0000003000,0000028350,', '1', '2', '陕西省/汉中市/城固县', '城固县', '3', '0', 'system', '2018-03-11 16:00:21', 'system', '2018-03-11 16:00:21', null);
INSERT INTO `js_sys_area` VALUES ('610723', '610700', '0,610000,610700,', '28360', '0000000270,0000003000,0000028360,', '1', '2', '陕西省/汉中市/洋　县', '洋　县', '3', '0', 'system', '2018-03-11 16:00:21', 'system', '2018-03-11 16:00:21', null);
INSERT INTO `js_sys_area` VALUES ('610724', '610700', '0,610000,610700,', '28370', '0000000270,0000003000,0000028370,', '1', '2', '陕西省/汉中市/西乡县', '西乡县', '3', '0', 'system', '2018-03-11 16:00:21', 'system', '2018-03-11 16:00:21', null);
INSERT INTO `js_sys_area` VALUES ('610725', '610700', '0,610000,610700,', '28380', '0000000270,0000003000,0000028380,', '1', '2', '陕西省/汉中市/勉　县', '勉　县', '3', '0', 'system', '2018-03-11 16:00:21', 'system', '2018-03-11 16:00:21', null);
INSERT INTO `js_sys_area` VALUES ('610726', '610700', '0,610000,610700,', '28390', '0000000270,0000003000,0000028390,', '1', '2', '陕西省/汉中市/宁强县', '宁强县', '3', '0', 'system', '2018-03-11 16:00:21', 'system', '2018-03-11 16:00:21', null);
INSERT INTO `js_sys_area` VALUES ('610727', '610700', '0,610000,610700,', '28400', '0000000270,0000003000,0000028400,', '1', '2', '陕西省/汉中市/略阳县', '略阳县', '3', '0', 'system', '2018-03-11 16:00:21', 'system', '2018-03-11 16:00:21', null);
INSERT INTO `js_sys_area` VALUES ('610728', '610700', '0,610000,610700,', '28410', '0000000270,0000003000,0000028410,', '1', '2', '陕西省/汉中市/镇巴县', '镇巴县', '3', '0', 'system', '2018-03-11 16:00:21', 'system', '2018-03-11 16:00:21', null);
INSERT INTO `js_sys_area` VALUES ('610729', '610700', '0,610000,610700,', '28420', '0000000270,0000003000,0000028420,', '1', '2', '陕西省/汉中市/留坝县', '留坝县', '3', '0', 'system', '2018-03-11 16:00:21', 'system', '2018-03-11 16:00:21', null);
INSERT INTO `js_sys_area` VALUES ('610730', '610700', '0,610000,610700,', '28430', '0000000270,0000003000,0000028430,', '1', '2', '陕西省/汉中市/佛坪县', '佛坪县', '3', '0', 'system', '2018-03-11 16:00:21', 'system', '2018-03-11 16:00:21', null);
INSERT INTO `js_sys_area` VALUES ('610800', '610000', '0,610000,', '3010', '0000000270,0000003010,', '0', '1', '陕西省/榆林市', '榆林市', '2', '0', 'system', '2018-03-11 16:00:21', 'system', '2018-03-11 16:00:21', null);
INSERT INTO `js_sys_area` VALUES ('610801', '610800', '0,610000,610800,', '28440', '0000000270,0000003010,0000028440,', '1', '2', '陕西省/榆林市/市辖区', '市辖区', '3', '0', 'system', '2018-03-11 16:00:21', 'system', '2018-03-11 16:00:21', null);
INSERT INTO `js_sys_area` VALUES ('610802', '610800', '0,610000,610800,', '28450', '0000000270,0000003010,0000028450,', '1', '2', '陕西省/榆林市/榆阳区', '榆阳区', '3', '0', 'system', '2018-03-11 16:00:21', 'system', '2018-03-11 16:00:21', null);
INSERT INTO `js_sys_area` VALUES ('610821', '610800', '0,610000,610800,', '28460', '0000000270,0000003010,0000028460,', '1', '2', '陕西省/榆林市/神木县', '神木县', '3', '0', 'system', '2018-03-11 16:00:21', 'system', '2018-03-11 16:00:21', null);
INSERT INTO `js_sys_area` VALUES ('610822', '610800', '0,610000,610800,', '28470', '0000000270,0000003010,0000028470,', '1', '2', '陕西省/榆林市/府谷县', '府谷县', '3', '0', 'system', '2018-03-11 16:00:21', 'system', '2018-03-11 16:00:21', null);
INSERT INTO `js_sys_area` VALUES ('610823', '610800', '0,610000,610800,', '28480', '0000000270,0000003010,0000028480,', '1', '2', '陕西省/榆林市/横山县', '横山县', '3', '0', 'system', '2018-03-11 16:00:21', 'system', '2018-03-11 16:00:21', null);
INSERT INTO `js_sys_area` VALUES ('610824', '610800', '0,610000,610800,', '28490', '0000000270,0000003010,0000028490,', '1', '2', '陕西省/榆林市/靖边县', '靖边县', '3', '0', 'system', '2018-03-11 16:00:21', 'system', '2018-03-11 16:00:21', null);
INSERT INTO `js_sys_area` VALUES ('610825', '610800', '0,610000,610800,', '28500', '0000000270,0000003010,0000028500,', '1', '2', '陕西省/榆林市/定边县', '定边县', '3', '0', 'system', '2018-03-11 16:00:21', 'system', '2018-03-11 16:00:21', null);
INSERT INTO `js_sys_area` VALUES ('610826', '610800', '0,610000,610800,', '28510', '0000000270,0000003010,0000028510,', '1', '2', '陕西省/榆林市/绥德县', '绥德县', '3', '0', 'system', '2018-03-11 16:00:21', 'system', '2018-03-11 16:00:21', null);
INSERT INTO `js_sys_area` VALUES ('610827', '610800', '0,610000,610800,', '28520', '0000000270,0000003010,0000028520,', '1', '2', '陕西省/榆林市/米脂县', '米脂县', '3', '0', 'system', '2018-03-11 16:00:21', 'system', '2018-03-11 16:00:21', null);
INSERT INTO `js_sys_area` VALUES ('610828', '610800', '0,610000,610800,', '28530', '0000000270,0000003010,0000028530,', '1', '2', '陕西省/榆林市/佳　县', '佳　县', '3', '0', 'system', '2018-03-11 16:00:21', 'system', '2018-03-11 16:00:21', null);
INSERT INTO `js_sys_area` VALUES ('610829', '610800', '0,610000,610800,', '28540', '0000000270,0000003010,0000028540,', '1', '2', '陕西省/榆林市/吴堡县', '吴堡县', '3', '0', 'system', '2018-03-11 16:00:21', 'system', '2018-03-11 16:00:21', null);
INSERT INTO `js_sys_area` VALUES ('610830', '610800', '0,610000,610800,', '28550', '0000000270,0000003010,0000028550,', '1', '2', '陕西省/榆林市/清涧县', '清涧县', '3', '0', 'system', '2018-03-11 16:00:21', 'system', '2018-03-11 16:00:21', null);
INSERT INTO `js_sys_area` VALUES ('610831', '610800', '0,610000,610800,', '28560', '0000000270,0000003010,0000028560,', '1', '2', '陕西省/榆林市/子洲县', '子洲县', '3', '0', 'system', '2018-03-11 16:00:21', 'system', '2018-03-11 16:00:21', null);
INSERT INTO `js_sys_area` VALUES ('610900', '610000', '0,610000,', '3020', '0000000270,0000003020,', '0', '1', '陕西省/安康市', '安康市', '2', '0', 'system', '2018-03-11 16:00:21', 'system', '2018-03-11 16:00:21', null);
INSERT INTO `js_sys_area` VALUES ('610901', '610900', '0,610000,610900,', '28570', '0000000270,0000003020,0000028570,', '1', '2', '陕西省/安康市/市辖区', '市辖区', '3', '0', 'system', '2018-03-11 16:00:21', 'system', '2018-03-11 16:00:21', null);
INSERT INTO `js_sys_area` VALUES ('610902', '610900', '0,610000,610900,', '28580', '0000000270,0000003020,0000028580,', '1', '2', '陕西省/安康市/汉滨区', '汉滨区', '3', '0', 'system', '2018-03-11 16:00:21', 'system', '2018-03-11 16:00:21', null);
INSERT INTO `js_sys_area` VALUES ('610921', '610900', '0,610000,610900,', '28590', '0000000270,0000003020,0000028590,', '1', '2', '陕西省/安康市/汉阴县', '汉阴县', '3', '0', 'system', '2018-03-11 16:00:21', 'system', '2018-03-11 16:00:21', null);
INSERT INTO `js_sys_area` VALUES ('610922', '610900', '0,610000,610900,', '28600', '0000000270,0000003020,0000028600,', '1', '2', '陕西省/安康市/石泉县', '石泉县', '3', '0', 'system', '2018-03-11 16:00:21', 'system', '2018-03-11 16:00:21', null);
INSERT INTO `js_sys_area` VALUES ('610923', '610900', '0,610000,610900,', '28610', '0000000270,0000003020,0000028610,', '1', '2', '陕西省/安康市/宁陕县', '宁陕县', '3', '0', 'system', '2018-03-11 16:00:21', 'system', '2018-03-11 16:00:21', null);
INSERT INTO `js_sys_area` VALUES ('610924', '610900', '0,610000,610900,', '28620', '0000000270,0000003020,0000028620,', '1', '2', '陕西省/安康市/紫阳县', '紫阳县', '3', '0', 'system', '2018-03-11 16:00:21', 'system', '2018-03-11 16:00:21', null);
INSERT INTO `js_sys_area` VALUES ('610925', '610900', '0,610000,610900,', '28630', '0000000270,0000003020,0000028630,', '1', '2', '陕西省/安康市/岚皋县', '岚皋县', '3', '0', 'system', '2018-03-11 16:00:21', 'system', '2018-03-11 16:00:21', null);
INSERT INTO `js_sys_area` VALUES ('610926', '610900', '0,610000,610900,', '28640', '0000000270,0000003020,0000028640,', '1', '2', '陕西省/安康市/平利县', '平利县', '3', '0', 'system', '2018-03-11 16:00:21', 'system', '2018-03-11 16:00:21', null);
INSERT INTO `js_sys_area` VALUES ('610927', '610900', '0,610000,610900,', '28650', '0000000270,0000003020,0000028650,', '1', '2', '陕西省/安康市/镇坪县', '镇坪县', '3', '0', 'system', '2018-03-11 16:00:21', 'system', '2018-03-11 16:00:21', null);
INSERT INTO `js_sys_area` VALUES ('610928', '610900', '0,610000,610900,', '28660', '0000000270,0000003020,0000028660,', '1', '2', '陕西省/安康市/旬阳县', '旬阳县', '3', '0', 'system', '2018-03-11 16:00:21', 'system', '2018-03-11 16:00:21', null);
INSERT INTO `js_sys_area` VALUES ('610929', '610900', '0,610000,610900,', '28670', '0000000270,0000003020,0000028670,', '1', '2', '陕西省/安康市/白河县', '白河县', '3', '0', 'system', '2018-03-11 16:00:21', 'system', '2018-03-11 16:00:21', null);
INSERT INTO `js_sys_area` VALUES ('611000', '610000', '0,610000,', '3030', '0000000270,0000003030,', '0', '1', '陕西省/商洛市', '商洛市', '2', '0', 'system', '2018-03-11 16:00:21', 'system', '2018-03-11 16:00:21', null);
INSERT INTO `js_sys_area` VALUES ('611001', '611000', '0,610000,611000,', '28680', '0000000270,0000003030,0000028680,', '1', '2', '陕西省/商洛市/市辖区', '市辖区', '3', '0', 'system', '2018-03-11 16:00:21', 'system', '2018-03-11 16:00:21', null);
INSERT INTO `js_sys_area` VALUES ('611002', '611000', '0,610000,611000,', '28690', '0000000270,0000003030,0000028690,', '1', '2', '陕西省/商洛市/商州区', '商州区', '3', '0', 'system', '2018-03-11 16:00:21', 'system', '2018-03-11 16:00:21', null);
INSERT INTO `js_sys_area` VALUES ('611021', '611000', '0,610000,611000,', '28700', '0000000270,0000003030,0000028700,', '1', '2', '陕西省/商洛市/洛南县', '洛南县', '3', '0', 'system', '2018-03-11 16:00:21', 'system', '2018-03-11 16:00:21', null);
INSERT INTO `js_sys_area` VALUES ('611022', '611000', '0,610000,611000,', '28710', '0000000270,0000003030,0000028710,', '1', '2', '陕西省/商洛市/丹凤县', '丹凤县', '3', '0', 'system', '2018-03-11 16:00:21', 'system', '2018-03-11 16:00:21', null);
INSERT INTO `js_sys_area` VALUES ('611023', '611000', '0,610000,611000,', '28720', '0000000270,0000003030,0000028720,', '1', '2', '陕西省/商洛市/商南县', '商南县', '3', '0', 'system', '2018-03-11 16:00:21', 'system', '2018-03-11 16:00:21', null);
INSERT INTO `js_sys_area` VALUES ('611024', '611000', '0,610000,611000,', '28730', '0000000270,0000003030,0000028730,', '1', '2', '陕西省/商洛市/山阳县', '山阳县', '3', '0', 'system', '2018-03-11 16:00:21', 'system', '2018-03-11 16:00:21', null);
INSERT INTO `js_sys_area` VALUES ('611025', '611000', '0,610000,611000,', '28740', '0000000270,0000003030,0000028740,', '1', '2', '陕西省/商洛市/镇安县', '镇安县', '3', '0', 'system', '2018-03-11 16:00:21', 'system', '2018-03-11 16:00:21', null);
INSERT INTO `js_sys_area` VALUES ('611026', '611000', '0,610000,611000,', '28750', '0000000270,0000003030,0000028750,', '1', '2', '陕西省/商洛市/柞水县', '柞水县', '3', '0', 'system', '2018-03-11 16:00:21', 'system', '2018-03-11 16:00:21', null);
INSERT INTO `js_sys_area` VALUES ('620000', '0', '0,', '280', '0000000280,', '0', '0', '甘肃省', '甘肃省', '1', '0', 'system', '2018-03-11 16:00:21', 'system', '2018-03-11 16:00:21', null);
INSERT INTO `js_sys_area` VALUES ('620100', '620000', '0,620000,', '3040', '0000000280,0000003040,', '0', '1', '甘肃省/兰州市', '兰州市', '2', '0', 'system', '2018-03-11 16:00:21', 'system', '2018-03-11 16:00:21', null);
INSERT INTO `js_sys_area` VALUES ('620101', '620100', '0,620000,620100,', '28760', '0000000280,0000003040,0000028760,', '1', '2', '甘肃省/兰州市/市辖区', '市辖区', '3', '0', 'system', '2018-03-11 16:00:21', 'system', '2018-03-11 16:00:21', null);
INSERT INTO `js_sys_area` VALUES ('620102', '620100', '0,620000,620100,', '28770', '0000000280,0000003040,0000028770,', '1', '2', '甘肃省/兰州市/城关区', '城关区', '3', '0', 'system', '2018-03-11 16:00:21', 'system', '2018-03-11 16:00:21', null);
INSERT INTO `js_sys_area` VALUES ('620103', '620100', '0,620000,620100,', '28780', '0000000280,0000003040,0000028780,', '1', '2', '甘肃省/兰州市/七里河区', '七里河区', '3', '0', 'system', '2018-03-11 16:00:21', 'system', '2018-03-11 16:00:21', null);
INSERT INTO `js_sys_area` VALUES ('620104', '620100', '0,620000,620100,', '28790', '0000000280,0000003040,0000028790,', '1', '2', '甘肃省/兰州市/西固区', '西固区', '3', '0', 'system', '2018-03-11 16:00:21', 'system', '2018-03-11 16:00:21', null);
INSERT INTO `js_sys_area` VALUES ('620105', '620100', '0,620000,620100,', '28800', '0000000280,0000003040,0000028800,', '1', '2', '甘肃省/兰州市/安宁区', '安宁区', '3', '0', 'system', '2018-03-11 16:00:21', 'system', '2018-03-11 16:00:21', null);
INSERT INTO `js_sys_area` VALUES ('620111', '620100', '0,620000,620100,', '28810', '0000000280,0000003040,0000028810,', '1', '2', '甘肃省/兰州市/红古区', '红古区', '3', '0', 'system', '2018-03-11 16:00:21', 'system', '2018-03-11 16:00:21', null);
INSERT INTO `js_sys_area` VALUES ('620121', '620100', '0,620000,620100,', '28820', '0000000280,0000003040,0000028820,', '1', '2', '甘肃省/兰州市/永登县', '永登县', '3', '0', 'system', '2018-03-11 16:00:21', 'system', '2018-03-11 16:00:21', null);
INSERT INTO `js_sys_area` VALUES ('620122', '620100', '0,620000,620100,', '28830', '0000000280,0000003040,0000028830,', '1', '2', '甘肃省/兰州市/皋兰县', '皋兰县', '3', '0', 'system', '2018-03-11 16:00:21', 'system', '2018-03-11 16:00:21', null);
INSERT INTO `js_sys_area` VALUES ('620123', '620100', '0,620000,620100,', '28840', '0000000280,0000003040,0000028840,', '1', '2', '甘肃省/兰州市/榆中县', '榆中县', '3', '0', 'system', '2018-03-11 16:00:22', 'system', '2018-03-11 16:00:22', null);
INSERT INTO `js_sys_area` VALUES ('620200', '620000', '0,620000,', '3050', '0000000280,0000003050,', '0', '1', '甘肃省/嘉峪关市', '嘉峪关市', '2', '0', 'system', '2018-03-11 16:00:22', 'system', '2018-03-11 16:00:22', null);
INSERT INTO `js_sys_area` VALUES ('620201', '620200', '0,620000,620200,', '28850', '0000000280,0000003050,0000028850,', '1', '2', '甘肃省/嘉峪关市/市辖区', '市辖区', '3', '0', 'system', '2018-03-11 16:00:22', 'system', '2018-03-11 16:00:22', null);
INSERT INTO `js_sys_area` VALUES ('620300', '620000', '0,620000,', '3060', '0000000280,0000003060,', '0', '1', '甘肃省/金昌市', '金昌市', '2', '0', 'system', '2018-03-11 16:00:22', 'system', '2018-03-11 16:00:22', null);
INSERT INTO `js_sys_area` VALUES ('620301', '620300', '0,620000,620300,', '28860', '0000000280,0000003060,0000028860,', '1', '2', '甘肃省/金昌市/市辖区', '市辖区', '3', '0', 'system', '2018-03-11 16:00:22', 'system', '2018-03-11 16:00:22', null);
INSERT INTO `js_sys_area` VALUES ('620302', '620300', '0,620000,620300,', '28870', '0000000280,0000003060,0000028870,', '1', '2', '甘肃省/金昌市/金川区', '金川区', '3', '0', 'system', '2018-03-11 16:00:22', 'system', '2018-03-11 16:00:22', null);
INSERT INTO `js_sys_area` VALUES ('620321', '620300', '0,620000,620300,', '28880', '0000000280,0000003060,0000028880,', '1', '2', '甘肃省/金昌市/永昌县', '永昌县', '3', '0', 'system', '2018-03-11 16:00:22', 'system', '2018-03-11 16:00:22', null);
INSERT INTO `js_sys_area` VALUES ('620400', '620000', '0,620000,', '3070', '0000000280,0000003070,', '0', '1', '甘肃省/白银市', '白银市', '2', '0', 'system', '2018-03-11 16:00:22', 'system', '2018-03-11 16:00:22', null);
INSERT INTO `js_sys_area` VALUES ('620401', '620400', '0,620000,620400,', '28890', '0000000280,0000003070,0000028890,', '1', '2', '甘肃省/白银市/市辖区', '市辖区', '3', '0', 'system', '2018-03-11 16:00:22', 'system', '2018-03-11 16:00:22', null);
INSERT INTO `js_sys_area` VALUES ('620402', '620400', '0,620000,620400,', '28900', '0000000280,0000003070,0000028900,', '1', '2', '甘肃省/白银市/白银区', '白银区', '3', '0', 'system', '2018-03-11 16:00:22', 'system', '2018-03-11 16:00:22', null);
INSERT INTO `js_sys_area` VALUES ('620403', '620400', '0,620000,620400,', '28910', '0000000280,0000003070,0000028910,', '1', '2', '甘肃省/白银市/平川区', '平川区', '3', '0', 'system', '2018-03-11 16:00:22', 'system', '2018-03-11 16:00:22', null);
INSERT INTO `js_sys_area` VALUES ('620421', '620400', '0,620000,620400,', '28920', '0000000280,0000003070,0000028920,', '1', '2', '甘肃省/白银市/靖远县', '靖远县', '3', '0', 'system', '2018-03-11 16:00:22', 'system', '2018-03-11 16:00:22', null);
INSERT INTO `js_sys_area` VALUES ('620422', '620400', '0,620000,620400,', '28930', '0000000280,0000003070,0000028930,', '1', '2', '甘肃省/白银市/会宁县', '会宁县', '3', '0', 'system', '2018-03-11 16:00:22', 'system', '2018-03-11 16:00:22', null);
INSERT INTO `js_sys_area` VALUES ('620423', '620400', '0,620000,620400,', '28940', '0000000280,0000003070,0000028940,', '1', '2', '甘肃省/白银市/景泰县', '景泰县', '3', '0', 'system', '2018-03-11 16:00:22', 'system', '2018-03-11 16:00:22', null);
INSERT INTO `js_sys_area` VALUES ('620500', '620000', '0,620000,', '3080', '0000000280,0000003080,', '0', '1', '甘肃省/天水市', '天水市', '2', '0', 'system', '2018-03-11 16:00:22', 'system', '2018-03-11 16:00:22', null);
INSERT INTO `js_sys_area` VALUES ('620501', '620500', '0,620000,620500,', '28950', '0000000280,0000003080,0000028950,', '1', '2', '甘肃省/天水市/市辖区', '市辖区', '3', '0', 'system', '2018-03-11 16:00:22', 'system', '2018-03-11 16:00:22', null);
INSERT INTO `js_sys_area` VALUES ('620502', '620500', '0,620000,620500,', '28960', '0000000280,0000003080,0000028960,', '1', '2', '甘肃省/天水市/秦城区', '秦城区', '3', '0', 'system', '2018-03-11 16:00:22', 'system', '2018-03-11 16:00:22', null);
INSERT INTO `js_sys_area` VALUES ('620503', '620500', '0,620000,620500,', '28970', '0000000280,0000003080,0000028970,', '1', '2', '甘肃省/天水市/北道区', '北道区', '3', '0', 'system', '2018-03-11 16:00:22', 'system', '2018-03-11 16:00:22', null);
INSERT INTO `js_sys_area` VALUES ('620521', '620500', '0,620000,620500,', '28980', '0000000280,0000003080,0000028980,', '1', '2', '甘肃省/天水市/清水县', '清水县', '3', '0', 'system', '2018-03-11 16:00:22', 'system', '2018-03-11 16:00:22', null);
INSERT INTO `js_sys_area` VALUES ('620522', '620500', '0,620000,620500,', '28990', '0000000280,0000003080,0000028990,', '1', '2', '甘肃省/天水市/秦安县', '秦安县', '3', '0', 'system', '2018-03-11 16:00:22', 'system', '2018-03-11 16:00:22', null);
INSERT INTO `js_sys_area` VALUES ('620523', '620500', '0,620000,620500,', '29000', '0000000280,0000003080,0000029000,', '1', '2', '甘肃省/天水市/甘谷县', '甘谷县', '3', '0', 'system', '2018-03-11 16:00:22', 'system', '2018-03-11 16:00:22', null);
INSERT INTO `js_sys_area` VALUES ('620524', '620500', '0,620000,620500,', '29010', '0000000280,0000003080,0000029010,', '1', '2', '甘肃省/天水市/武山县', '武山县', '3', '0', 'system', '2018-03-11 16:00:22', 'system', '2018-03-11 16:00:22', null);
INSERT INTO `js_sys_area` VALUES ('620525', '620500', '0,620000,620500,', '29020', '0000000280,0000003080,0000029020,', '1', '2', '甘肃省/天水市/张家川回族自治县', '张家川回族自治县', '3', '0', 'system', '2018-03-11 16:00:22', 'system', '2018-03-11 16:00:22', null);
INSERT INTO `js_sys_area` VALUES ('620600', '620000', '0,620000,', '3090', '0000000280,0000003090,', '0', '1', '甘肃省/武威市', '武威市', '2', '0', 'system', '2018-03-11 16:00:22', 'system', '2018-03-11 16:00:22', null);
INSERT INTO `js_sys_area` VALUES ('620601', '620600', '0,620000,620600,', '29030', '0000000280,0000003090,0000029030,', '1', '2', '甘肃省/武威市/市辖区', '市辖区', '3', '0', 'system', '2018-03-11 16:00:22', 'system', '2018-03-11 16:00:22', null);
INSERT INTO `js_sys_area` VALUES ('620602', '620600', '0,620000,620600,', '29040', '0000000280,0000003090,0000029040,', '1', '2', '甘肃省/武威市/凉州区', '凉州区', '3', '0', 'system', '2018-03-11 16:00:22', 'system', '2018-03-11 16:00:22', null);
INSERT INTO `js_sys_area` VALUES ('620621', '620600', '0,620000,620600,', '29050', '0000000280,0000003090,0000029050,', '1', '2', '甘肃省/武威市/民勤县', '民勤县', '3', '0', 'system', '2018-03-11 16:00:22', 'system', '2018-03-11 16:00:22', null);
INSERT INTO `js_sys_area` VALUES ('620622', '620600', '0,620000,620600,', '29060', '0000000280,0000003090,0000029060,', '1', '2', '甘肃省/武威市/古浪县', '古浪县', '3', '0', 'system', '2018-03-11 16:00:22', 'system', '2018-03-11 16:00:22', null);
INSERT INTO `js_sys_area` VALUES ('620623', '620600', '0,620000,620600,', '29070', '0000000280,0000003090,0000029070,', '1', '2', '甘肃省/武威市/天祝藏族自治县', '天祝藏族自治县', '3', '0', 'system', '2018-03-11 16:00:22', 'system', '2018-03-11 16:00:22', null);
INSERT INTO `js_sys_area` VALUES ('620700', '620000', '0,620000,', '3100', '0000000280,0000003100,', '0', '1', '甘肃省/张掖市', '张掖市', '2', '0', 'system', '2018-03-11 16:00:22', 'system', '2018-03-11 16:00:22', null);
INSERT INTO `js_sys_area` VALUES ('620701', '620700', '0,620000,620700,', '29080', '0000000280,0000003100,0000029080,', '1', '2', '甘肃省/张掖市/市辖区', '市辖区', '3', '0', 'system', '2018-03-11 16:00:22', 'system', '2018-03-11 16:00:22', null);
INSERT INTO `js_sys_area` VALUES ('620702', '620700', '0,620000,620700,', '29090', '0000000280,0000003100,0000029090,', '1', '2', '甘肃省/张掖市/甘州区', '甘州区', '3', '0', 'system', '2018-03-11 16:00:22', 'system', '2018-03-11 16:00:22', null);
INSERT INTO `js_sys_area` VALUES ('620721', '620700', '0,620000,620700,', '29100', '0000000280,0000003100,0000029100,', '1', '2', '甘肃省/张掖市/肃南裕固族自治县', '肃南裕固族自治县', '3', '0', 'system', '2018-03-11 16:00:22', 'system', '2018-03-11 16:00:22', null);
INSERT INTO `js_sys_area` VALUES ('620722', '620700', '0,620000,620700,', '29110', '0000000280,0000003100,0000029110,', '1', '2', '甘肃省/张掖市/民乐县', '民乐县', '3', '0', 'system', '2018-03-11 16:00:22', 'system', '2018-03-11 16:00:22', null);
INSERT INTO `js_sys_area` VALUES ('620723', '620700', '0,620000,620700,', '29120', '0000000280,0000003100,0000029120,', '1', '2', '甘肃省/张掖市/临泽县', '临泽县', '3', '0', 'system', '2018-03-11 16:00:22', 'system', '2018-03-11 16:00:22', null);
INSERT INTO `js_sys_area` VALUES ('620724', '620700', '0,620000,620700,', '29130', '0000000280,0000003100,0000029130,', '1', '2', '甘肃省/张掖市/高台县', '高台县', '3', '0', 'system', '2018-03-11 16:00:22', 'system', '2018-03-11 16:00:22', null);
INSERT INTO `js_sys_area` VALUES ('620725', '620700', '0,620000,620700,', '29140', '0000000280,0000003100,0000029140,', '1', '2', '甘肃省/张掖市/山丹县', '山丹县', '3', '0', 'system', '2018-03-11 16:00:22', 'system', '2018-03-11 16:00:22', null);
INSERT INTO `js_sys_area` VALUES ('620800', '620000', '0,620000,', '3110', '0000000280,0000003110,', '0', '1', '甘肃省/平凉市', '平凉市', '2', '0', 'system', '2018-03-11 16:00:22', 'system', '2018-03-11 16:00:22', null);
INSERT INTO `js_sys_area` VALUES ('620801', '620800', '0,620000,620800,', '29150', '0000000280,0000003110,0000029150,', '1', '2', '甘肃省/平凉市/市辖区', '市辖区', '3', '0', 'system', '2018-03-11 16:00:22', 'system', '2018-03-11 16:00:22', null);
INSERT INTO `js_sys_area` VALUES ('620802', '620800', '0,620000,620800,', '29160', '0000000280,0000003110,0000029160,', '1', '2', '甘肃省/平凉市/崆峒区', '崆峒区', '3', '0', 'system', '2018-03-11 16:00:22', 'system', '2018-03-11 16:00:22', null);
INSERT INTO `js_sys_area` VALUES ('620821', '620800', '0,620000,620800,', '29170', '0000000280,0000003110,0000029170,', '1', '2', '甘肃省/平凉市/泾川县', '泾川县', '3', '0', 'system', '2018-03-11 16:00:22', 'system', '2018-03-11 16:00:22', null);
INSERT INTO `js_sys_area` VALUES ('620822', '620800', '0,620000,620800,', '29180', '0000000280,0000003110,0000029180,', '1', '2', '甘肃省/平凉市/灵台县', '灵台县', '3', '0', 'system', '2018-03-11 16:00:22', 'system', '2018-03-11 16:00:22', null);
INSERT INTO `js_sys_area` VALUES ('620823', '620800', '0,620000,620800,', '29190', '0000000280,0000003110,0000029190,', '1', '2', '甘肃省/平凉市/崇信县', '崇信县', '3', '0', 'system', '2018-03-11 16:00:22', 'system', '2018-03-11 16:00:22', null);
INSERT INTO `js_sys_area` VALUES ('620824', '620800', '0,620000,620800,', '29200', '0000000280,0000003110,0000029200,', '1', '2', '甘肃省/平凉市/华亭县', '华亭县', '3', '0', 'system', '2018-03-11 16:00:22', 'system', '2018-03-11 16:00:22', null);
INSERT INTO `js_sys_area` VALUES ('620825', '620800', '0,620000,620800,', '29210', '0000000280,0000003110,0000029210,', '1', '2', '甘肃省/平凉市/庄浪县', '庄浪县', '3', '0', 'system', '2018-03-11 16:00:22', 'system', '2018-03-11 16:00:22', null);
INSERT INTO `js_sys_area` VALUES ('620826', '620800', '0,620000,620800,', '29220', '0000000280,0000003110,0000029220,', '1', '2', '甘肃省/平凉市/静宁县', '静宁县', '3', '0', 'system', '2018-03-11 16:00:22', 'system', '2018-03-11 16:00:22', null);
INSERT INTO `js_sys_area` VALUES ('620900', '620000', '0,620000,', '3120', '0000000280,0000003120,', '0', '1', '甘肃省/酒泉市', '酒泉市', '2', '0', 'system', '2018-03-11 16:00:22', 'system', '2018-03-11 16:00:22', null);
INSERT INTO `js_sys_area` VALUES ('620901', '620900', '0,620000,620900,', '29230', '0000000280,0000003120,0000029230,', '1', '2', '甘肃省/酒泉市/市辖区', '市辖区', '3', '0', 'system', '2018-03-11 16:00:22', 'system', '2018-03-11 16:00:22', null);
INSERT INTO `js_sys_area` VALUES ('620902', '620900', '0,620000,620900,', '29240', '0000000280,0000003120,0000029240,', '1', '2', '甘肃省/酒泉市/肃州区', '肃州区', '3', '0', 'system', '2018-03-11 16:00:22', 'system', '2018-03-11 16:00:22', null);
INSERT INTO `js_sys_area` VALUES ('620921', '620900', '0,620000,620900,', '29250', '0000000280,0000003120,0000029250,', '1', '2', '甘肃省/酒泉市/金塔县', '金塔县', '3', '0', 'system', '2018-03-11 16:00:22', 'system', '2018-03-11 16:00:22', null);
INSERT INTO `js_sys_area` VALUES ('620922', '620900', '0,620000,620900,', '29260', '0000000280,0000003120,0000029260,', '1', '2', '甘肃省/酒泉市/安西县', '安西县', '3', '0', 'system', '2018-03-11 16:00:22', 'system', '2018-03-11 16:00:22', null);
INSERT INTO `js_sys_area` VALUES ('620923', '620900', '0,620000,620900,', '29270', '0000000280,0000003120,0000029270,', '1', '2', '甘肃省/酒泉市/肃北蒙古族自治县', '肃北蒙古族自治县', '3', '0', 'system', '2018-03-11 16:00:22', 'system', '2018-03-11 16:00:22', null);
INSERT INTO `js_sys_area` VALUES ('620924', '620900', '0,620000,620900,', '29280', '0000000280,0000003120,0000029280,', '1', '2', '甘肃省/酒泉市/阿克塞哈萨克族自治县', '阿克塞哈萨克族自治县', '3', '0', 'system', '2018-03-11 16:00:22', 'system', '2018-03-11 16:00:22', null);
INSERT INTO `js_sys_area` VALUES ('620981', '620900', '0,620000,620900,', '29290', '0000000280,0000003120,0000029290,', '1', '2', '甘肃省/酒泉市/玉门市', '玉门市', '3', '0', 'system', '2018-03-11 16:00:22', 'system', '2018-03-11 16:00:22', null);
INSERT INTO `js_sys_area` VALUES ('620982', '620900', '0,620000,620900,', '29300', '0000000280,0000003120,0000029300,', '1', '2', '甘肃省/酒泉市/敦煌市', '敦煌市', '3', '0', 'system', '2018-03-11 16:00:22', 'system', '2018-03-11 16:00:22', null);
INSERT INTO `js_sys_area` VALUES ('621000', '620000', '0,620000,', '3130', '0000000280,0000003130,', '0', '1', '甘肃省/庆阳市', '庆阳市', '2', '0', 'system', '2018-03-11 16:00:22', 'system', '2018-03-11 16:00:22', null);
INSERT INTO `js_sys_area` VALUES ('621001', '621000', '0,620000,621000,', '29310', '0000000280,0000003130,0000029310,', '1', '2', '甘肃省/庆阳市/市辖区', '市辖区', '3', '0', 'system', '2018-03-11 16:00:22', 'system', '2018-03-11 16:00:22', null);
INSERT INTO `js_sys_area` VALUES ('621002', '621000', '0,620000,621000,', '29320', '0000000280,0000003130,0000029320,', '1', '2', '甘肃省/庆阳市/西峰区', '西峰区', '3', '0', 'system', '2018-03-11 16:00:23', 'system', '2018-03-11 16:00:23', null);
INSERT INTO `js_sys_area` VALUES ('621021', '621000', '0,620000,621000,', '29330', '0000000280,0000003130,0000029330,', '1', '2', '甘肃省/庆阳市/庆城县', '庆城县', '3', '0', 'system', '2018-03-11 16:00:23', 'system', '2018-03-11 16:00:23', null);
INSERT INTO `js_sys_area` VALUES ('621022', '621000', '0,620000,621000,', '29340', '0000000280,0000003130,0000029340,', '1', '2', '甘肃省/庆阳市/环　县', '环　县', '3', '0', 'system', '2018-03-11 16:00:23', 'system', '2018-03-11 16:00:23', null);
INSERT INTO `js_sys_area` VALUES ('621023', '621000', '0,620000,621000,', '29350', '0000000280,0000003130,0000029350,', '1', '2', '甘肃省/庆阳市/华池县', '华池县', '3', '0', 'system', '2018-03-11 16:00:23', 'system', '2018-03-11 16:00:23', null);
INSERT INTO `js_sys_area` VALUES ('621024', '621000', '0,620000,621000,', '29360', '0000000280,0000003130,0000029360,', '1', '2', '甘肃省/庆阳市/合水县', '合水县', '3', '0', 'system', '2018-03-11 16:00:23', 'system', '2018-03-11 16:00:23', null);
INSERT INTO `js_sys_area` VALUES ('621025', '621000', '0,620000,621000,', '29370', '0000000280,0000003130,0000029370,', '1', '2', '甘肃省/庆阳市/正宁县', '正宁县', '3', '0', 'system', '2018-03-11 16:00:23', 'system', '2018-03-11 16:00:23', null);
INSERT INTO `js_sys_area` VALUES ('621026', '621000', '0,620000,621000,', '29380', '0000000280,0000003130,0000029380,', '1', '2', '甘肃省/庆阳市/宁　县', '宁　县', '3', '0', 'system', '2018-03-11 16:00:23', 'system', '2018-03-11 16:00:23', null);
INSERT INTO `js_sys_area` VALUES ('621027', '621000', '0,620000,621000,', '29390', '0000000280,0000003130,0000029390,', '1', '2', '甘肃省/庆阳市/镇原县', '镇原县', '3', '0', 'system', '2018-03-11 16:00:23', 'system', '2018-03-11 16:00:23', null);
INSERT INTO `js_sys_area` VALUES ('621100', '620000', '0,620000,', '3140', '0000000280,0000003140,', '0', '1', '甘肃省/定西市', '定西市', '2', '0', 'system', '2018-03-11 16:00:23', 'system', '2018-03-11 16:00:23', null);
INSERT INTO `js_sys_area` VALUES ('621101', '621100', '0,620000,621100,', '29400', '0000000280,0000003140,0000029400,', '1', '2', '甘肃省/定西市/市辖区', '市辖区', '3', '0', 'system', '2018-03-11 16:00:23', 'system', '2018-03-11 16:00:23', null);
INSERT INTO `js_sys_area` VALUES ('621102', '621100', '0,620000,621100,', '29410', '0000000280,0000003140,0000029410,', '1', '2', '甘肃省/定西市/安定区', '安定区', '3', '0', 'system', '2018-03-11 16:00:23', 'system', '2018-03-11 16:00:23', null);
INSERT INTO `js_sys_area` VALUES ('621121', '621100', '0,620000,621100,', '29420', '0000000280,0000003140,0000029420,', '1', '2', '甘肃省/定西市/通渭县', '通渭县', '3', '0', 'system', '2018-03-11 16:00:23', 'system', '2018-03-11 16:00:23', null);
INSERT INTO `js_sys_area` VALUES ('621122', '621100', '0,620000,621100,', '29430', '0000000280,0000003140,0000029430,', '1', '2', '甘肃省/定西市/陇西县', '陇西县', '3', '0', 'system', '2018-03-11 16:00:23', 'system', '2018-03-11 16:00:23', null);
INSERT INTO `js_sys_area` VALUES ('621123', '621100', '0,620000,621100,', '29440', '0000000280,0000003140,0000029440,', '1', '2', '甘肃省/定西市/渭源县', '渭源县', '3', '0', 'system', '2018-03-11 16:00:23', 'system', '2018-03-11 16:00:23', null);
INSERT INTO `js_sys_area` VALUES ('621124', '621100', '0,620000,621100,', '29450', '0000000280,0000003140,0000029450,', '1', '2', '甘肃省/定西市/临洮县', '临洮县', '3', '0', 'system', '2018-03-11 16:00:23', 'system', '2018-03-11 16:00:23', null);
INSERT INTO `js_sys_area` VALUES ('621125', '621100', '0,620000,621100,', '29460', '0000000280,0000003140,0000029460,', '1', '2', '甘肃省/定西市/漳　县', '漳　县', '3', '0', 'system', '2018-03-11 16:00:23', 'system', '2018-03-11 16:00:23', null);
INSERT INTO `js_sys_area` VALUES ('621126', '621100', '0,620000,621100,', '29470', '0000000280,0000003140,0000029470,', '1', '2', '甘肃省/定西市/岷　县', '岷　县', '3', '0', 'system', '2018-03-11 16:00:23', 'system', '2018-03-11 16:00:23', null);
INSERT INTO `js_sys_area` VALUES ('621200', '620000', '0,620000,', '3150', '0000000280,0000003150,', '0', '1', '甘肃省/陇南市', '陇南市', '2', '0', 'system', '2018-03-11 16:00:23', 'system', '2018-03-11 16:00:23', null);
INSERT INTO `js_sys_area` VALUES ('621201', '621200', '0,620000,621200,', '29480', '0000000280,0000003150,0000029480,', '1', '2', '甘肃省/陇南市/市辖区', '市辖区', '3', '0', 'system', '2018-03-11 16:00:23', 'system', '2018-03-11 16:00:23', null);
INSERT INTO `js_sys_area` VALUES ('621202', '621200', '0,620000,621200,', '29490', '0000000280,0000003150,0000029490,', '1', '2', '甘肃省/陇南市/武都区', '武都区', '3', '0', 'system', '2018-03-11 16:00:23', 'system', '2018-03-11 16:00:23', null);
INSERT INTO `js_sys_area` VALUES ('621221', '621200', '0,620000,621200,', '29500', '0000000280,0000003150,0000029500,', '1', '2', '甘肃省/陇南市/成　县', '成　县', '3', '0', 'system', '2018-03-11 16:00:23', 'system', '2018-03-11 16:00:23', null);
INSERT INTO `js_sys_area` VALUES ('621222', '621200', '0,620000,621200,', '29510', '0000000280,0000003150,0000029510,', '1', '2', '甘肃省/陇南市/文　县', '文　县', '3', '0', 'system', '2018-03-11 16:00:23', 'system', '2018-03-11 16:00:23', null);
INSERT INTO `js_sys_area` VALUES ('621223', '621200', '0,620000,621200,', '29520', '0000000280,0000003150,0000029520,', '1', '2', '甘肃省/陇南市/宕昌县', '宕昌县', '3', '0', 'system', '2018-03-11 16:00:23', 'system', '2018-03-11 16:00:23', null);
INSERT INTO `js_sys_area` VALUES ('621224', '621200', '0,620000,621200,', '29530', '0000000280,0000003150,0000029530,', '1', '2', '甘肃省/陇南市/康　县', '康　县', '3', '0', 'system', '2018-03-11 16:00:23', 'system', '2018-03-11 16:00:23', null);
INSERT INTO `js_sys_area` VALUES ('621225', '621200', '0,620000,621200,', '29540', '0000000280,0000003150,0000029540,', '1', '2', '甘肃省/陇南市/西和县', '西和县', '3', '0', 'system', '2018-03-11 16:00:23', 'system', '2018-03-11 16:00:23', null);
INSERT INTO `js_sys_area` VALUES ('621226', '621200', '0,620000,621200,', '29550', '0000000280,0000003150,0000029550,', '1', '2', '甘肃省/陇南市/礼　县', '礼　县', '3', '0', 'system', '2018-03-11 16:00:23', 'system', '2018-03-11 16:00:23', null);
INSERT INTO `js_sys_area` VALUES ('621227', '621200', '0,620000,621200,', '29560', '0000000280,0000003150,0000029560,', '1', '2', '甘肃省/陇南市/徽　县', '徽　县', '3', '0', 'system', '2018-03-11 16:00:23', 'system', '2018-03-11 16:00:23', null);
INSERT INTO `js_sys_area` VALUES ('621228', '621200', '0,620000,621200,', '29570', '0000000280,0000003150,0000029570,', '1', '2', '甘肃省/陇南市/两当县', '两当县', '3', '0', 'system', '2018-03-11 16:00:23', 'system', '2018-03-11 16:00:23', null);
INSERT INTO `js_sys_area` VALUES ('622900', '620000', '0,620000,', '3160', '0000000280,0000003160,', '0', '1', '甘肃省/临夏回族自治州', '临夏回族自治州', '2', '0', 'system', '2018-03-11 16:00:23', 'system', '2018-03-11 16:00:23', null);
INSERT INTO `js_sys_area` VALUES ('622901', '622900', '0,620000,622900,', '29580', '0000000280,0000003160,0000029580,', '1', '2', '甘肃省/临夏回族自治州/临夏市', '临夏市', '3', '0', 'system', '2018-03-11 16:00:23', 'system', '2018-03-11 16:00:23', null);
INSERT INTO `js_sys_area` VALUES ('622921', '622900', '0,620000,622900,', '29590', '0000000280,0000003160,0000029590,', '1', '2', '甘肃省/临夏回族自治州/临夏县', '临夏县', '3', '0', 'system', '2018-03-11 16:00:23', 'system', '2018-03-11 16:00:23', null);
INSERT INTO `js_sys_area` VALUES ('622922', '622900', '0,620000,622900,', '29600', '0000000280,0000003160,0000029600,', '1', '2', '甘肃省/临夏回族自治州/康乐县', '康乐县', '3', '0', 'system', '2018-03-11 16:00:23', 'system', '2018-03-11 16:00:23', null);
INSERT INTO `js_sys_area` VALUES ('622923', '622900', '0,620000,622900,', '29610', '0000000280,0000003160,0000029610,', '1', '2', '甘肃省/临夏回族自治州/永靖县', '永靖县', '3', '0', 'system', '2018-03-11 16:00:23', 'system', '2018-03-11 16:00:23', null);
INSERT INTO `js_sys_area` VALUES ('622924', '622900', '0,620000,622900,', '29620', '0000000280,0000003160,0000029620,', '1', '2', '甘肃省/临夏回族自治州/广河县', '广河县', '3', '0', 'system', '2018-03-11 16:00:23', 'system', '2018-03-11 16:00:23', null);
INSERT INTO `js_sys_area` VALUES ('622925', '622900', '0,620000,622900,', '29630', '0000000280,0000003160,0000029630,', '1', '2', '甘肃省/临夏回族自治州/和政县', '和政县', '3', '0', 'system', '2018-03-11 16:00:23', 'system', '2018-03-11 16:00:23', null);
INSERT INTO `js_sys_area` VALUES ('622926', '622900', '0,620000,622900,', '29640', '0000000280,0000003160,0000029640,', '1', '2', '甘肃省/临夏回族自治州/东乡族自治县', '东乡族自治县', '3', '0', 'system', '2018-03-11 16:00:23', 'system', '2018-03-11 16:00:23', null);
INSERT INTO `js_sys_area` VALUES ('623000', '620000', '0,620000,', '3170', '0000000280,0000003170,', '0', '1', '甘肃省/甘南藏族自治州', '甘南藏族自治州', '2', '0', 'system', '2018-03-11 16:00:23', 'system', '2018-03-11 16:00:23', null);
INSERT INTO `js_sys_area` VALUES ('623001', '623000', '0,620000,623000,', '29660', '0000000280,0000003170,0000029660,', '1', '2', '甘肃省/甘南藏族自治州/合作市', '合作市', '3', '0', 'system', '2018-03-11 16:00:23', 'system', '2018-03-11 16:00:23', null);
INSERT INTO `js_sys_area` VALUES ('623021', '623000', '0,620000,623000,', '29670', '0000000280,0000003170,0000029670,', '1', '2', '甘肃省/甘南藏族自治州/临潭县', '临潭县', '3', '0', 'system', '2018-03-11 16:00:23', 'system', '2018-03-11 16:00:23', null);
INSERT INTO `js_sys_area` VALUES ('623022', '623000', '0,620000,623000,', '29680', '0000000280,0000003170,0000029680,', '1', '2', '甘肃省/甘南藏族自治州/卓尼县', '卓尼县', '3', '0', 'system', '2018-03-11 16:00:23', 'system', '2018-03-11 16:00:23', null);
INSERT INTO `js_sys_area` VALUES ('623023', '623000', '0,620000,623000,', '29690', '0000000280,0000003170,0000029690,', '1', '2', '甘肃省/甘南藏族自治州/舟曲县', '舟曲县', '3', '0', 'system', '2018-03-11 16:00:23', 'system', '2018-03-11 16:00:23', null);
INSERT INTO `js_sys_area` VALUES ('623024', '623000', '0,620000,623000,', '29700', '0000000280,0000003170,0000029700,', '1', '2', '甘肃省/甘南藏族自治州/迭部县', '迭部县', '3', '0', 'system', '2018-03-11 16:00:23', 'system', '2018-03-11 16:00:23', null);
INSERT INTO `js_sys_area` VALUES ('623025', '623000', '0,620000,623000,', '29710', '0000000280,0000003170,0000029710,', '1', '2', '甘肃省/甘南藏族自治州/玛曲县', '玛曲县', '3', '0', 'system', '2018-03-11 16:00:23', 'system', '2018-03-11 16:00:23', null);
INSERT INTO `js_sys_area` VALUES ('623026', '623000', '0,620000,623000,', '29720', '0000000280,0000003170,0000029720,', '1', '2', '甘肃省/甘南藏族自治州/碌曲县', '碌曲县', '3', '0', 'system', '2018-03-11 16:00:23', 'system', '2018-03-11 16:00:23', null);
INSERT INTO `js_sys_area` VALUES ('623027', '623000', '0,620000,623000,', '29730', '0000000280,0000003170,0000029730,', '1', '2', '甘肃省/甘南藏族自治州/夏河县', '夏河县', '3', '0', 'system', '2018-03-11 16:00:23', 'system', '2018-03-11 16:00:23', null);
INSERT INTO `js_sys_area` VALUES ('630000', '0', '0,', '290', '0000000290,', '0', '0', '青海省', '青海省', '1', '0', 'system', '2018-03-11 16:00:23', 'system', '2018-03-11 16:00:23', null);
INSERT INTO `js_sys_area` VALUES ('630100', '630000', '0,630000,', '3180', '0000000290,0000003180,', '0', '1', '青海省/西宁市', '西宁市', '2', '0', 'system', '2018-03-11 16:00:23', 'system', '2018-03-11 16:00:23', null);
INSERT INTO `js_sys_area` VALUES ('630101', '630100', '0,630000,630100,', '29740', '0000000290,0000003180,0000029740,', '1', '2', '青海省/西宁市/市辖区', '市辖区', '3', '0', 'system', '2018-03-11 16:00:23', 'system', '2018-03-11 16:00:23', null);
INSERT INTO `js_sys_area` VALUES ('630102', '630100', '0,630000,630100,', '29750', '0000000290,0000003180,0000029750,', '1', '2', '青海省/西宁市/城东区', '城东区', '3', '0', 'system', '2018-03-11 16:00:23', 'system', '2018-03-11 16:00:23', null);
INSERT INTO `js_sys_area` VALUES ('630103', '630100', '0,630000,630100,', '29760', '0000000290,0000003180,0000029760,', '1', '2', '青海省/西宁市/城中区', '城中区', '3', '0', 'system', '2018-03-11 16:00:23', 'system', '2018-03-11 16:00:23', null);
INSERT INTO `js_sys_area` VALUES ('630104', '630100', '0,630000,630100,', '29770', '0000000290,0000003180,0000029770,', '1', '2', '青海省/西宁市/城西区', '城西区', '3', '0', 'system', '2018-03-11 16:00:23', 'system', '2018-03-11 16:00:23', null);
INSERT INTO `js_sys_area` VALUES ('630105', '630100', '0,630000,630100,', '29780', '0000000290,0000003180,0000029780,', '1', '2', '青海省/西宁市/城北区', '城北区', '3', '0', 'system', '2018-03-11 16:00:23', 'system', '2018-03-11 16:00:23', null);
INSERT INTO `js_sys_area` VALUES ('630121', '630100', '0,630000,630100,', '29790', '0000000290,0000003180,0000029790,', '1', '2', '青海省/西宁市/大通回族土族自治县', '大通回族土族自治县', '3', '0', 'system', '2018-03-11 16:00:23', 'system', '2018-03-11 16:00:23', null);
INSERT INTO `js_sys_area` VALUES ('630122', '630100', '0,630000,630100,', '29800', '0000000290,0000003180,0000029800,', '1', '2', '青海省/西宁市/湟中县', '湟中县', '3', '0', 'system', '2018-03-11 16:00:23', 'system', '2018-03-11 16:00:23', null);
INSERT INTO `js_sys_area` VALUES ('630123', '630100', '0,630000,630100,', '29810', '0000000290,0000003180,0000029810,', '1', '2', '青海省/西宁市/湟源县', '湟源县', '3', '0', 'system', '2018-03-11 16:00:23', 'system', '2018-03-11 16:00:23', null);
INSERT INTO `js_sys_area` VALUES ('632100', '630000', '0,630000,', '3190', '0000000290,0000003190,', '0', '1', '青海省/海东地区', '海东地区', '2', '0', 'system', '2018-03-11 16:00:23', 'system', '2018-03-11 16:00:23', null);
INSERT INTO `js_sys_area` VALUES ('632121', '632100', '0,630000,632100,', '29820', '0000000290,0000003190,0000029820,', '1', '2', '青海省/海东地区/平安县', '平安县', '3', '0', 'system', '2018-03-11 16:00:23', 'system', '2018-03-11 16:00:23', null);
INSERT INTO `js_sys_area` VALUES ('632122', '632100', '0,630000,632100,', '29830', '0000000290,0000003190,0000029830,', '1', '2', '青海省/海东地区/民和回族土族自治县', '民和回族土族自治县', '3', '0', 'system', '2018-03-11 16:00:23', 'system', '2018-03-11 16:00:23', null);
INSERT INTO `js_sys_area` VALUES ('632123', '632100', '0,630000,632100,', '29840', '0000000290,0000003190,0000029840,', '1', '2', '青海省/海东地区/乐都县', '乐都县', '3', '0', 'system', '2018-03-11 16:00:23', 'system', '2018-03-11 16:00:23', null);
INSERT INTO `js_sys_area` VALUES ('632126', '632100', '0,630000,632100,', '29850', '0000000290,0000003190,0000029850,', '1', '2', '青海省/海东地区/互助土族自治县', '互助土族自治县', '3', '0', 'system', '2018-03-11 16:00:23', 'system', '2018-03-11 16:00:23', null);
INSERT INTO `js_sys_area` VALUES ('632127', '632100', '0,630000,632100,', '29860', '0000000290,0000003190,0000029860,', '1', '2', '青海省/海东地区/化隆回族自治县', '化隆回族自治县', '3', '0', 'system', '2018-03-11 16:00:23', 'system', '2018-03-11 16:00:23', null);
INSERT INTO `js_sys_area` VALUES ('632128', '632100', '0,630000,632100,', '29870', '0000000290,0000003190,0000029870,', '1', '2', '青海省/海东地区/循化撒拉族自治县', '循化撒拉族自治县', '3', '0', 'system', '2018-03-11 16:00:24', 'system', '2018-03-11 16:00:24', null);
INSERT INTO `js_sys_area` VALUES ('632200', '630000', '0,630000,', '3200', '0000000290,0000003200,', '0', '1', '青海省/海北藏族自治州', '海北藏族自治州', '2', '0', 'system', '2018-03-11 16:00:24', 'system', '2018-03-11 16:00:24', null);
INSERT INTO `js_sys_area` VALUES ('632221', '632200', '0,630000,632200,', '29880', '0000000290,0000003200,0000029880,', '1', '2', '青海省/海北藏族自治州/门源回族自治县', '门源回族自治县', '3', '0', 'system', '2018-03-11 16:00:24', 'system', '2018-03-11 16:00:24', null);
INSERT INTO `js_sys_area` VALUES ('632222', '632200', '0,630000,632200,', '29890', '0000000290,0000003200,0000029890,', '1', '2', '青海省/海北藏族自治州/祁连县', '祁连县', '3', '0', 'system', '2018-03-11 16:00:24', 'system', '2018-03-11 16:00:24', null);
INSERT INTO `js_sys_area` VALUES ('632223', '632200', '0,630000,632200,', '29900', '0000000290,0000003200,0000029900,', '1', '2', '青海省/海北藏族自治州/海晏县', '海晏县', '3', '0', 'system', '2018-03-11 16:00:24', 'system', '2018-03-11 16:00:24', null);
INSERT INTO `js_sys_area` VALUES ('632224', '632200', '0,630000,632200,', '29910', '0000000290,0000003200,0000029910,', '1', '2', '青海省/海北藏族自治州/刚察县', '刚察县', '3', '0', 'system', '2018-03-11 16:00:24', 'system', '2018-03-11 16:00:24', null);
INSERT INTO `js_sys_area` VALUES ('632300', '630000', '0,630000,', '3210', '0000000290,0000003210,', '0', '1', '青海省/黄南藏族自治州', '黄南藏族自治州', '2', '0', 'system', '2018-03-11 16:00:24', 'system', '2018-03-11 16:00:24', null);
INSERT INTO `js_sys_area` VALUES ('632321', '632300', '0,630000,632300,', '29920', '0000000290,0000003210,0000029920,', '1', '2', '青海省/黄南藏族自治州/同仁县', '同仁县', '3', '0', 'system', '2018-03-11 16:00:24', 'system', '2018-03-11 16:00:24', null);
INSERT INTO `js_sys_area` VALUES ('632322', '632300', '0,630000,632300,', '29930', '0000000290,0000003210,0000029930,', '1', '2', '青海省/黄南藏族自治州/尖扎县', '尖扎县', '3', '0', 'system', '2018-03-11 16:00:24', 'system', '2018-03-11 16:00:24', null);
INSERT INTO `js_sys_area` VALUES ('632323', '632300', '0,630000,632300,', '29940', '0000000290,0000003210,0000029940,', '1', '2', '青海省/黄南藏族自治州/泽库县', '泽库县', '3', '0', 'system', '2018-03-11 16:00:24', 'system', '2018-03-11 16:00:24', null);
INSERT INTO `js_sys_area` VALUES ('632324', '632300', '0,630000,632300,', '29950', '0000000290,0000003210,0000029950,', '1', '2', '青海省/黄南藏族自治州/河南蒙古族自治县', '河南蒙古族自治县', '3', '0', 'system', '2018-03-11 16:00:24', 'system', '2018-03-11 16:00:24', null);
INSERT INTO `js_sys_area` VALUES ('632500', '630000', '0,630000,', '3220', '0000000290,0000003220,', '0', '1', '青海省/海南藏族自治州', '海南藏族自治州', '2', '0', 'system', '2018-03-11 16:00:24', 'system', '2018-03-11 16:00:24', null);
INSERT INTO `js_sys_area` VALUES ('632521', '632500', '0,630000,632500,', '29960', '0000000290,0000003220,0000029960,', '1', '2', '青海省/海南藏族自治州/共和县', '共和县', '3', '0', 'system', '2018-03-11 16:00:24', 'system', '2018-03-11 16:00:24', null);
INSERT INTO `js_sys_area` VALUES ('632522', '632500', '0,630000,632500,', '29970', '0000000290,0000003220,0000029970,', '1', '2', '青海省/海南藏族自治州/同德县', '同德县', '3', '0', 'system', '2018-03-11 16:00:24', 'system', '2018-03-11 16:00:24', null);
INSERT INTO `js_sys_area` VALUES ('632523', '632500', '0,630000,632500,', '29980', '0000000290,0000003220,0000029980,', '1', '2', '青海省/海南藏族自治州/贵德县', '贵德县', '3', '0', 'system', '2018-03-11 16:00:24', 'system', '2018-03-11 16:00:24', null);
INSERT INTO `js_sys_area` VALUES ('632524', '632500', '0,630000,632500,', '29990', '0000000290,0000003220,0000029990,', '1', '2', '青海省/海南藏族自治州/兴海县', '兴海县', '3', '0', 'system', '2018-03-11 16:00:24', 'system', '2018-03-11 16:00:24', null);
INSERT INTO `js_sys_area` VALUES ('632525', '632500', '0,630000,632500,', '30000', '0000000290,0000003220,0000030000,', '1', '2', '青海省/海南藏族自治州/贵南县', '贵南县', '3', '0', 'system', '2018-03-11 16:00:24', 'system', '2018-03-11 16:00:24', null);
INSERT INTO `js_sys_area` VALUES ('632600', '630000', '0,630000,', '3230', '0000000290,0000003230,', '0', '1', '青海省/果洛藏族自治州', '果洛藏族自治州', '2', '0', 'system', '2018-03-11 16:00:24', 'system', '2018-03-11 16:00:24', null);
INSERT INTO `js_sys_area` VALUES ('632621', '632600', '0,630000,632600,', '30010', '0000000290,0000003230,0000030010,', '1', '2', '青海省/果洛藏族自治州/玛沁县', '玛沁县', '3', '0', 'system', '2018-03-11 16:00:24', 'system', '2018-03-11 16:00:24', null);
INSERT INTO `js_sys_area` VALUES ('632622', '632600', '0,630000,632600,', '30020', '0000000290,0000003230,0000030020,', '1', '2', '青海省/果洛藏族自治州/班玛县', '班玛县', '3', '0', 'system', '2018-03-11 16:00:24', 'system', '2018-03-11 16:00:24', null);
INSERT INTO `js_sys_area` VALUES ('632623', '632600', '0,630000,632600,', '30030', '0000000290,0000003230,0000030030,', '1', '2', '青海省/果洛藏族自治州/甘德县', '甘德县', '3', '0', 'system', '2018-03-11 16:00:24', 'system', '2018-03-11 16:00:24', null);
INSERT INTO `js_sys_area` VALUES ('632624', '632600', '0,630000,632600,', '30040', '0000000290,0000003230,0000030040,', '1', '2', '青海省/果洛藏族自治州/达日县', '达日县', '3', '0', 'system', '2018-03-11 16:00:24', 'system', '2018-03-11 16:00:24', null);
INSERT INTO `js_sys_area` VALUES ('632625', '632600', '0,630000,632600,', '30050', '0000000290,0000003230,0000030050,', '1', '2', '青海省/果洛藏族自治州/久治县', '久治县', '3', '0', 'system', '2018-03-11 16:00:24', 'system', '2018-03-11 16:00:24', null);
INSERT INTO `js_sys_area` VALUES ('632626', '632600', '0,630000,632600,', '30060', '0000000290,0000003230,0000030060,', '1', '2', '青海省/果洛藏族自治州/玛多县', '玛多县', '3', '0', 'system', '2018-03-11 16:00:24', 'system', '2018-03-11 16:00:24', null);
INSERT INTO `js_sys_area` VALUES ('632700', '630000', '0,630000,', '3240', '0000000290,0000003240,', '0', '1', '青海省/玉树藏族自治州', '玉树藏族自治州', '2', '0', 'system', '2018-03-11 16:00:24', 'system', '2018-03-11 16:00:24', null);
INSERT INTO `js_sys_area` VALUES ('632721', '632700', '0,630000,632700,', '30070', '0000000290,0000003240,0000030070,', '1', '2', '青海省/玉树藏族自治州/玉树县', '玉树县', '3', '0', 'system', '2018-03-11 16:00:24', 'system', '2018-03-11 16:00:24', null);
INSERT INTO `js_sys_area` VALUES ('632722', '632700', '0,630000,632700,', '30080', '0000000290,0000003240,0000030080,', '1', '2', '青海省/玉树藏族自治州/杂多县', '杂多县', '3', '0', 'system', '2018-03-11 16:00:24', 'system', '2018-03-11 16:00:24', null);
INSERT INTO `js_sys_area` VALUES ('632723', '632700', '0,630000,632700,', '30090', '0000000290,0000003240,0000030090,', '1', '2', '青海省/玉树藏族自治州/称多县', '称多县', '3', '0', 'system', '2018-03-11 16:00:24', 'system', '2018-03-11 16:00:24', null);
INSERT INTO `js_sys_area` VALUES ('632724', '632700', '0,630000,632700,', '30100', '0000000290,0000003240,0000030100,', '1', '2', '青海省/玉树藏族自治州/治多县', '治多县', '3', '0', 'system', '2018-03-11 16:00:24', 'system', '2018-03-11 16:00:24', null);
INSERT INTO `js_sys_area` VALUES ('632725', '632700', '0,630000,632700,', '30110', '0000000290,0000003240,0000030110,', '1', '2', '青海省/玉树藏族自治州/囊谦县', '囊谦县', '3', '0', 'system', '2018-03-11 16:00:24', 'system', '2018-03-11 16:00:24', null);
INSERT INTO `js_sys_area` VALUES ('632726', '632700', '0,630000,632700,', '30120', '0000000290,0000003240,0000030120,', '1', '2', '青海省/玉树藏族自治州/曲麻莱县', '曲麻莱县', '3', '0', 'system', '2018-03-11 16:00:24', 'system', '2018-03-11 16:00:24', null);
INSERT INTO `js_sys_area` VALUES ('632800', '630000', '0,630000,', '3250', '0000000290,0000003250,', '0', '1', '青海省/海西蒙古族藏族自治州', '海西蒙古族藏族自治州', '2', '0', 'system', '2018-03-11 16:00:24', 'system', '2018-03-11 16:00:24', null);
INSERT INTO `js_sys_area` VALUES ('632801', '632800', '0,630000,632800,', '30130', '0000000290,0000003250,0000030130,', '1', '2', '青海省/海西蒙古族藏族自治州/格尔木市', '格尔木市', '3', '0', 'system', '2018-03-11 16:00:24', 'system', '2018-03-11 16:00:24', null);
INSERT INTO `js_sys_area` VALUES ('632802', '632800', '0,630000,632800,', '30140', '0000000290,0000003250,0000030140,', '1', '2', '青海省/海西蒙古族藏族自治州/德令哈市', '德令哈市', '3', '0', 'system', '2018-03-11 16:00:24', 'system', '2018-03-11 16:00:24', null);
INSERT INTO `js_sys_area` VALUES ('632821', '632800', '0,630000,632800,', '30150', '0000000290,0000003250,0000030150,', '1', '2', '青海省/海西蒙古族藏族自治州/乌兰县', '乌兰县', '3', '0', 'system', '2018-03-11 16:00:24', 'system', '2018-03-11 16:00:24', null);
INSERT INTO `js_sys_area` VALUES ('632822', '632800', '0,630000,632800,', '30160', '0000000290,0000003250,0000030160,', '1', '2', '青海省/海西蒙古族藏族自治州/都兰县', '都兰县', '3', '0', 'system', '2018-03-11 16:00:24', 'system', '2018-03-11 16:00:24', null);
INSERT INTO `js_sys_area` VALUES ('632823', '632800', '0,630000,632800,', '30170', '0000000290,0000003250,0000030170,', '1', '2', '青海省/海西蒙古族藏族自治州/天峻县', '天峻县', '3', '0', 'system', '2018-03-11 16:00:24', 'system', '2018-03-11 16:00:24', null);
INSERT INTO `js_sys_area` VALUES ('640000', '0', '0,', '300', '0000000300,', '0', '0', '宁夏回族自治区', '宁夏回族自治区', '1', '0', 'system', '2018-03-11 16:00:24', 'system', '2018-03-11 16:00:24', null);
INSERT INTO `js_sys_area` VALUES ('640100', '640000', '0,640000,', '3260', '0000000300,0000003260,', '0', '1', '宁夏回族自治区/银川市', '银川市', '2', '0', 'system', '2018-03-11 16:00:24', 'system', '2018-03-11 16:00:24', null);
INSERT INTO `js_sys_area` VALUES ('640101', '640100', '0,640000,640100,', '30180', '0000000300,0000003260,0000030180,', '1', '2', '宁夏回族自治区/银川市/市辖区', '市辖区', '3', '0', 'system', '2018-03-11 16:00:24', 'system', '2018-03-11 16:00:24', null);
INSERT INTO `js_sys_area` VALUES ('640104', '640100', '0,640000,640100,', '30190', '0000000300,0000003260,0000030190,', '1', '2', '宁夏回族自治区/银川市/兴庆区', '兴庆区', '3', '0', 'system', '2018-03-11 16:00:24', 'system', '2018-03-11 16:00:24', null);
INSERT INTO `js_sys_area` VALUES ('640105', '640100', '0,640000,640100,', '30200', '0000000300,0000003260,0000030200,', '1', '2', '宁夏回族自治区/银川市/西夏区', '西夏区', '3', '0', 'system', '2018-03-11 16:00:24', 'system', '2018-03-11 16:00:24', null);
INSERT INTO `js_sys_area` VALUES ('640106', '640100', '0,640000,640100,', '30210', '0000000300,0000003260,0000030210,', '1', '2', '宁夏回族自治区/银川市/金凤区', '金凤区', '3', '0', 'system', '2018-03-11 16:00:24', 'system', '2018-03-11 16:00:24', null);
INSERT INTO `js_sys_area` VALUES ('640121', '640100', '0,640000,640100,', '30220', '0000000300,0000003260,0000030220,', '1', '2', '宁夏回族自治区/银川市/永宁县', '永宁县', '3', '0', 'system', '2018-03-11 16:00:24', 'system', '2018-03-11 16:00:24', null);
INSERT INTO `js_sys_area` VALUES ('640122', '640100', '0,640000,640100,', '30230', '0000000300,0000003260,0000030230,', '1', '2', '宁夏回族自治区/银川市/贺兰县', '贺兰县', '3', '0', 'system', '2018-03-11 16:00:24', 'system', '2018-03-11 16:00:24', null);
INSERT INTO `js_sys_area` VALUES ('640181', '640100', '0,640000,640100,', '30240', '0000000300,0000003260,0000030240,', '1', '2', '宁夏回族自治区/银川市/灵武市', '灵武市', '3', '0', 'system', '2018-03-11 16:00:24', 'system', '2018-03-11 16:00:24', null);
INSERT INTO `js_sys_area` VALUES ('640200', '640000', '0,640000,', '3270', '0000000300,0000003270,', '0', '1', '宁夏回族自治区/石嘴山市', '石嘴山市', '2', '0', 'system', '2018-03-11 16:00:24', 'system', '2018-03-11 16:00:24', null);
INSERT INTO `js_sys_area` VALUES ('640201', '640200', '0,640000,640200,', '30250', '0000000300,0000003270,0000030250,', '1', '2', '宁夏回族自治区/石嘴山市/市辖区', '市辖区', '3', '0', 'system', '2018-03-11 16:00:24', 'system', '2018-03-11 16:00:24', null);
INSERT INTO `js_sys_area` VALUES ('640202', '640200', '0,640000,640200,', '30260', '0000000300,0000003270,0000030260,', '1', '2', '宁夏回族自治区/石嘴山市/大武口区', '大武口区', '3', '0', 'system', '2018-03-11 16:00:24', 'system', '2018-03-11 16:00:24', null);
INSERT INTO `js_sys_area` VALUES ('640205', '640200', '0,640000,640200,', '30270', '0000000300,0000003270,0000030270,', '1', '2', '宁夏回族自治区/石嘴山市/惠农区', '惠农区', '3', '0', 'system', '2018-03-11 16:00:24', 'system', '2018-03-11 16:00:24', null);
INSERT INTO `js_sys_area` VALUES ('640221', '640200', '0,640000,640200,', '30280', '0000000300,0000003270,0000030280,', '1', '2', '宁夏回族自治区/石嘴山市/平罗县', '平罗县', '3', '0', 'system', '2018-03-11 16:00:24', 'system', '2018-03-11 16:00:24', null);
INSERT INTO `js_sys_area` VALUES ('640300', '640000', '0,640000,', '3280', '0000000300,0000003280,', '0', '1', '宁夏回族自治区/吴忠市', '吴忠市', '2', '0', 'system', '2018-03-11 16:00:24', 'system', '2018-03-11 16:00:24', null);
INSERT INTO `js_sys_area` VALUES ('640301', '640300', '0,640000,640300,', '30290', '0000000300,0000003280,0000030290,', '1', '2', '宁夏回族自治区/吴忠市/市辖区', '市辖区', '3', '0', 'system', '2018-03-11 16:00:24', 'system', '2018-03-11 16:00:24', null);
INSERT INTO `js_sys_area` VALUES ('640302', '640300', '0,640000,640300,', '30300', '0000000300,0000003280,0000030300,', '1', '2', '宁夏回族自治区/吴忠市/利通区', '利通区', '3', '0', 'system', '2018-03-11 16:00:24', 'system', '2018-03-11 16:00:24', null);
INSERT INTO `js_sys_area` VALUES ('640323', '640300', '0,640000,640300,', '30310', '0000000300,0000003280,0000030310,', '1', '2', '宁夏回族自治区/吴忠市/盐池县', '盐池县', '3', '0', 'system', '2018-03-11 16:00:24', 'system', '2018-03-11 16:00:24', null);
INSERT INTO `js_sys_area` VALUES ('640324', '640300', '0,640000,640300,', '30320', '0000000300,0000003280,0000030320,', '1', '2', '宁夏回族自治区/吴忠市/同心县', '同心县', '3', '0', 'system', '2018-03-11 16:00:24', 'system', '2018-03-11 16:00:24', null);
INSERT INTO `js_sys_area` VALUES ('640381', '640300', '0,640000,640300,', '30330', '0000000300,0000003280,0000030330,', '1', '2', '宁夏回族自治区/吴忠市/青铜峡市', '青铜峡市', '3', '0', 'system', '2018-03-11 16:00:24', 'system', '2018-03-11 16:00:24', null);
INSERT INTO `js_sys_area` VALUES ('640400', '640000', '0,640000,', '3290', '0000000300,0000003290,', '0', '1', '宁夏回族自治区/固原市', '固原市', '2', '0', 'system', '2018-03-11 16:00:25', 'system', '2018-03-11 16:00:25', null);
INSERT INTO `js_sys_area` VALUES ('640401', '640400', '0,640000,640400,', '30340', '0000000300,0000003290,0000030340,', '1', '2', '宁夏回族自治区/固原市/市辖区', '市辖区', '3', '0', 'system', '2018-03-11 16:00:25', 'system', '2018-03-11 16:00:25', null);
INSERT INTO `js_sys_area` VALUES ('640402', '640400', '0,640000,640400,', '30350', '0000000300,0000003290,0000030350,', '1', '2', '宁夏回族自治区/固原市/原州区', '原州区', '3', '0', 'system', '2018-03-11 16:00:25', 'system', '2018-03-11 16:00:25', null);
INSERT INTO `js_sys_area` VALUES ('640422', '640400', '0,640000,640400,', '30360', '0000000300,0000003290,0000030360,', '1', '2', '宁夏回族自治区/固原市/西吉县', '西吉县', '3', '0', 'system', '2018-03-11 16:00:25', 'system', '2018-03-11 16:00:25', null);
INSERT INTO `js_sys_area` VALUES ('640423', '640400', '0,640000,640400,', '30370', '0000000300,0000003290,0000030370,', '1', '2', '宁夏回族自治区/固原市/隆德县', '隆德县', '3', '0', 'system', '2018-03-11 16:00:25', 'system', '2018-03-11 16:00:25', null);
INSERT INTO `js_sys_area` VALUES ('640424', '640400', '0,640000,640400,', '30380', '0000000300,0000003290,0000030380,', '1', '2', '宁夏回族自治区/固原市/泾源县', '泾源县', '3', '0', 'system', '2018-03-11 16:00:25', 'system', '2018-03-11 16:00:25', null);
INSERT INTO `js_sys_area` VALUES ('640425', '640400', '0,640000,640400,', '30390', '0000000300,0000003290,0000030390,', '1', '2', '宁夏回族自治区/固原市/彭阳县', '彭阳县', '3', '0', 'system', '2018-03-11 16:00:25', 'system', '2018-03-11 16:00:25', null);
INSERT INTO `js_sys_area` VALUES ('640500', '640000', '0,640000,', '3300', '0000000300,0000003300,', '0', '1', '宁夏回族自治区/中卫市', '中卫市', '2', '0', 'system', '2018-03-11 16:00:25', 'system', '2018-03-11 16:00:25', null);
INSERT INTO `js_sys_area` VALUES ('640501', '640500', '0,640000,640500,', '30400', '0000000300,0000003300,0000030400,', '1', '2', '宁夏回族自治区/中卫市/市辖区', '市辖区', '3', '0', 'system', '2018-03-11 16:00:25', 'system', '2018-03-11 16:00:25', null);
INSERT INTO `js_sys_area` VALUES ('640502', '640500', '0,640000,640500,', '30410', '0000000300,0000003300,0000030410,', '1', '2', '宁夏回族自治区/中卫市/沙坡头区', '沙坡头区', '3', '0', 'system', '2018-03-11 16:00:25', 'system', '2018-03-11 16:00:25', null);
INSERT INTO `js_sys_area` VALUES ('640521', '640500', '0,640000,640500,', '30420', '0000000300,0000003300,0000030420,', '1', '2', '宁夏回族自治区/中卫市/中宁县', '中宁县', '3', '0', 'system', '2018-03-11 16:00:25', 'system', '2018-03-11 16:00:25', null);
INSERT INTO `js_sys_area` VALUES ('640522', '640500', '0,640000,640500,', '30430', '0000000300,0000003300,0000030430,', '1', '2', '宁夏回族自治区/中卫市/海原县', '海原县', '3', '0', 'system', '2018-03-11 16:00:25', 'system', '2018-03-11 16:00:25', null);
INSERT INTO `js_sys_area` VALUES ('650000', '0', '0,', '310', '0000000310,', '0', '0', '新疆维吾尔自治区', '新疆维吾尔自治区', '1', '0', 'system', '2018-03-11 16:00:25', 'system', '2018-03-11 16:00:25', null);
INSERT INTO `js_sys_area` VALUES ('650100', '650000', '0,650000,', '3310', '0000000310,0000003310,', '0', '1', '新疆维吾尔自治区/乌鲁木齐市', '乌鲁木齐市', '2', '0', 'system', '2018-03-11 16:00:25', 'system', '2018-03-11 16:00:25', null);
INSERT INTO `js_sys_area` VALUES ('650101', '650100', '0,650000,650100,', '30440', '0000000310,0000003310,0000030440,', '1', '2', '新疆维吾尔自治区/乌鲁木齐市/市辖区', '市辖区', '3', '0', 'system', '2018-03-11 16:00:25', 'system', '2018-03-11 16:00:25', null);
INSERT INTO `js_sys_area` VALUES ('650102', '650100', '0,650000,650100,', '30450', '0000000310,0000003310,0000030450,', '1', '2', '新疆维吾尔自治区/乌鲁木齐市/天山区', '天山区', '3', '0', 'system', '2018-03-11 16:00:25', 'system', '2018-03-11 16:00:25', null);
INSERT INTO `js_sys_area` VALUES ('650103', '650100', '0,650000,650100,', '30460', '0000000310,0000003310,0000030460,', '1', '2', '新疆维吾尔自治区/乌鲁木齐市/沙依巴克区', '沙依巴克区', '3', '0', 'system', '2018-03-11 16:00:25', 'system', '2018-03-11 16:00:25', null);
INSERT INTO `js_sys_area` VALUES ('650104', '650100', '0,650000,650100,', '30470', '0000000310,0000003310,0000030470,', '1', '2', '新疆维吾尔自治区/乌鲁木齐市/新市区', '新市区', '3', '0', 'system', '2018-03-11 16:00:25', 'system', '2018-03-11 16:00:25', null);
INSERT INTO `js_sys_area` VALUES ('650105', '650100', '0,650000,650100,', '30480', '0000000310,0000003310,0000030480,', '1', '2', '新疆维吾尔自治区/乌鲁木齐市/水磨沟区', '水磨沟区', '3', '0', 'system', '2018-03-11 16:00:25', 'system', '2018-03-11 16:00:25', null);
INSERT INTO `js_sys_area` VALUES ('650106', '650100', '0,650000,650100,', '30490', '0000000310,0000003310,0000030490,', '1', '2', '新疆维吾尔自治区/乌鲁木齐市/头屯河区', '头屯河区', '3', '0', 'system', '2018-03-11 16:00:25', 'system', '2018-03-11 16:00:25', null);
INSERT INTO `js_sys_area` VALUES ('650107', '650100', '0,650000,650100,', '30500', '0000000310,0000003310,0000030500,', '1', '2', '新疆维吾尔自治区/乌鲁木齐市/达坂城区', '达坂城区', '3', '0', 'system', '2018-03-11 16:00:25', 'system', '2018-03-11 16:00:25', null);
INSERT INTO `js_sys_area` VALUES ('650108', '650100', '0,650000,650100,', '30510', '0000000310,0000003310,0000030510,', '1', '2', '新疆维吾尔自治区/乌鲁木齐市/东山区', '东山区', '3', '0', 'system', '2018-03-11 16:00:25', 'system', '2018-03-11 16:00:25', null);
INSERT INTO `js_sys_area` VALUES ('650121', '650100', '0,650000,650100,', '30520', '0000000310,0000003310,0000030520,', '1', '2', '新疆维吾尔自治区/乌鲁木齐市/乌鲁木齐县', '乌鲁木齐县', '3', '0', 'system', '2018-03-11 16:00:25', 'system', '2018-03-11 16:00:25', null);
INSERT INTO `js_sys_area` VALUES ('650200', '650000', '0,650000,', '3320', '0000000310,0000003320,', '0', '1', '新疆维吾尔自治区/克拉玛依市', '克拉玛依市', '2', '0', 'system', '2018-03-11 16:00:25', 'system', '2018-03-11 16:00:25', null);
INSERT INTO `js_sys_area` VALUES ('650201', '650200', '0,650000,650200,', '30530', '0000000310,0000003320,0000030530,', '1', '2', '新疆维吾尔自治区/克拉玛依市/市辖区', '市辖区', '3', '0', 'system', '2018-03-11 16:00:25', 'system', '2018-03-11 16:00:25', null);
INSERT INTO `js_sys_area` VALUES ('650202', '650200', '0,650000,650200,', '30540', '0000000310,0000003320,0000030540,', '1', '2', '新疆维吾尔自治区/克拉玛依市/独山子区', '独山子区', '3', '0', 'system', '2018-03-11 16:00:25', 'system', '2018-03-11 16:00:25', null);
INSERT INTO `js_sys_area` VALUES ('650203', '650200', '0,650000,650200,', '30550', '0000000310,0000003320,0000030550,', '1', '2', '新疆维吾尔自治区/克拉玛依市/克拉玛依区', '克拉玛依区', '3', '0', 'system', '2018-03-11 16:00:25', 'system', '2018-03-11 16:00:25', null);
INSERT INTO `js_sys_area` VALUES ('650204', '650200', '0,650000,650200,', '30560', '0000000310,0000003320,0000030560,', '1', '2', '新疆维吾尔自治区/克拉玛依市/白碱滩区', '白碱滩区', '3', '0', 'system', '2018-03-11 16:00:25', 'system', '2018-03-11 16:00:25', null);
INSERT INTO `js_sys_area` VALUES ('650205', '650200', '0,650000,650200,', '30570', '0000000310,0000003320,0000030570,', '1', '2', '新疆维吾尔自治区/克拉玛依市/乌尔禾区', '乌尔禾区', '3', '0', 'system', '2018-03-11 16:00:25', 'system', '2018-03-11 16:00:25', null);
INSERT INTO `js_sys_area` VALUES ('652100', '650000', '0,650000,', '3330', '0000000310,0000003330,', '0', '1', '新疆维吾尔自治区/吐鲁番地区', '吐鲁番地区', '2', '0', 'system', '2018-03-11 16:00:25', 'system', '2018-03-11 16:00:25', null);
INSERT INTO `js_sys_area` VALUES ('652101', '652100', '0,650000,652100,', '30580', '0000000310,0000003330,0000030580,', '1', '2', '新疆维吾尔自治区/吐鲁番地区/吐鲁番市', '吐鲁番市', '3', '0', 'system', '2018-03-11 16:00:25', 'system', '2018-03-11 16:00:25', null);
INSERT INTO `js_sys_area` VALUES ('652122', '652100', '0,650000,652100,', '30590', '0000000310,0000003330,0000030590,', '1', '2', '新疆维吾尔自治区/吐鲁番地区/鄯善县', '鄯善县', '3', '0', 'system', '2018-03-11 16:00:25', 'system', '2018-03-11 16:00:25', null);
INSERT INTO `js_sys_area` VALUES ('652123', '652100', '0,650000,652100,', '30600', '0000000310,0000003330,0000030600,', '1', '2', '新疆维吾尔自治区/吐鲁番地区/托克逊县', '托克逊县', '3', '0', 'system', '2018-03-11 16:00:25', 'system', '2018-03-11 16:00:25', null);
INSERT INTO `js_sys_area` VALUES ('652200', '650000', '0,650000,', '3340', '0000000310,0000003340,', '0', '1', '新疆维吾尔自治区/哈密地区', '哈密地区', '2', '0', 'system', '2018-03-11 16:00:25', 'system', '2018-03-11 16:00:25', null);
INSERT INTO `js_sys_area` VALUES ('652201', '652200', '0,650000,652200,', '30610', '0000000310,0000003340,0000030610,', '1', '2', '新疆维吾尔自治区/哈密地区/哈密市', '哈密市', '3', '0', 'system', '2018-03-11 16:00:25', 'system', '2018-03-11 16:00:25', null);
INSERT INTO `js_sys_area` VALUES ('652222', '652200', '0,650000,652200,', '30620', '0000000310,0000003340,0000030620,', '1', '2', '新疆维吾尔自治区/哈密地区/巴里坤哈萨克自治县', '巴里坤哈萨克自治县', '3', '0', 'system', '2018-03-11 16:00:25', 'system', '2018-03-11 16:00:25', null);
INSERT INTO `js_sys_area` VALUES ('652223', '652200', '0,650000,652200,', '30630', '0000000310,0000003340,0000030630,', '1', '2', '新疆维吾尔自治区/哈密地区/伊吾县', '伊吾县', '3', '0', 'system', '2018-03-11 16:00:25', 'system', '2018-03-11 16:00:25', null);
INSERT INTO `js_sys_area` VALUES ('652300', '650000', '0,650000,', '3350', '0000000310,0000003350,', '0', '1', '新疆维吾尔自治区/昌吉回族自治州', '昌吉回族自治州', '2', '0', 'system', '2018-03-11 16:00:25', 'system', '2018-03-11 16:00:25', null);
INSERT INTO `js_sys_area` VALUES ('652301', '652300', '0,650000,652300,', '30640', '0000000310,0000003350,0000030640,', '1', '2', '新疆维吾尔自治区/昌吉回族自治州/昌吉市', '昌吉市', '3', '0', 'system', '2018-03-11 16:00:25', 'system', '2018-03-11 16:00:25', null);
INSERT INTO `js_sys_area` VALUES ('652302', '652300', '0,650000,652300,', '30650', '0000000310,0000003350,0000030650,', '1', '2', '新疆维吾尔自治区/昌吉回族自治州/阜康市', '阜康市', '3', '0', 'system', '2018-03-11 16:00:25', 'system', '2018-03-11 16:00:25', null);
INSERT INTO `js_sys_area` VALUES ('652303', '652300', '0,650000,652300,', '30660', '0000000310,0000003350,0000030660,', '1', '2', '新疆维吾尔自治区/昌吉回族自治州/米泉市', '米泉市', '3', '0', 'system', '2018-03-11 16:00:25', 'system', '2018-03-11 16:00:25', null);
INSERT INTO `js_sys_area` VALUES ('652323', '652300', '0,650000,652300,', '30670', '0000000310,0000003350,0000030670,', '1', '2', '新疆维吾尔自治区/昌吉回族自治州/呼图壁县', '呼图壁县', '3', '0', 'system', '2018-03-11 16:00:25', 'system', '2018-03-11 16:00:25', null);
INSERT INTO `js_sys_area` VALUES ('652324', '652300', '0,650000,652300,', '30680', '0000000310,0000003350,0000030680,', '1', '2', '新疆维吾尔自治区/昌吉回族自治州/玛纳斯县', '玛纳斯县', '3', '0', 'system', '2018-03-11 16:00:25', 'system', '2018-03-11 16:00:25', null);
INSERT INTO `js_sys_area` VALUES ('652325', '652300', '0,650000,652300,', '30690', '0000000310,0000003350,0000030690,', '1', '2', '新疆维吾尔自治区/昌吉回族自治州/奇台县', '奇台县', '3', '0', 'system', '2018-03-11 16:00:25', 'system', '2018-03-11 16:00:25', null);
INSERT INTO `js_sys_area` VALUES ('652327', '652300', '0,650000,652300,', '30700', '0000000310,0000003350,0000030700,', '1', '2', '新疆维吾尔自治区/昌吉回族自治州/吉木萨尔县', '吉木萨尔县', '3', '0', 'system', '2018-03-11 16:00:25', 'system', '2018-03-11 16:00:25', null);
INSERT INTO `js_sys_area` VALUES ('652328', '652300', '0,650000,652300,', '30710', '0000000310,0000003350,0000030710,', '1', '2', '新疆维吾尔自治区/昌吉回族自治州/木垒哈萨克自治县', '木垒哈萨克自治县', '3', '0', 'system', '2018-03-11 16:00:25', 'system', '2018-03-11 16:00:25', null);
INSERT INTO `js_sys_area` VALUES ('652700', '650000', '0,650000,', '3360', '0000000310,0000003360,', '0', '1', '新疆维吾尔自治区/博尔塔拉蒙古自治州', '博尔塔拉蒙古自治州', '2', '0', 'system', '2018-03-11 16:00:25', 'system', '2018-03-11 16:00:25', null);
INSERT INTO `js_sys_area` VALUES ('652701', '652700', '0,650000,652700,', '30720', '0000000310,0000003360,0000030720,', '1', '2', '新疆维吾尔自治区/博尔塔拉蒙古自治州/博乐市', '博乐市', '3', '0', 'system', '2018-03-11 16:00:25', 'system', '2018-03-11 16:00:25', null);
INSERT INTO `js_sys_area` VALUES ('652722', '652700', '0,650000,652700,', '30730', '0000000310,0000003360,0000030730,', '1', '2', '新疆维吾尔自治区/博尔塔拉蒙古自治州/精河县', '精河县', '3', '0', 'system', '2018-03-11 16:00:25', 'system', '2018-03-11 16:00:25', null);
INSERT INTO `js_sys_area` VALUES ('652723', '652700', '0,650000,652700,', '30740', '0000000310,0000003360,0000030740,', '1', '2', '新疆维吾尔自治区/博尔塔拉蒙古自治州/温泉县', '温泉县', '3', '0', 'system', '2018-03-11 16:00:25', 'system', '2018-03-11 16:00:25', null);
INSERT INTO `js_sys_area` VALUES ('652800', '650000', '0,650000,', '3370', '0000000310,0000003370,', '0', '1', '新疆维吾尔自治区/巴音郭楞蒙古自治州', '巴音郭楞蒙古自治州', '2', '0', 'system', '2018-03-11 16:00:25', 'system', '2018-03-11 16:00:25', null);
INSERT INTO `js_sys_area` VALUES ('652801', '652800', '0,650000,652800,', '30750', '0000000310,0000003370,0000030750,', '1', '2', '新疆维吾尔自治区/巴音郭楞蒙古自治州/库尔勒市', '库尔勒市', '3', '0', 'system', '2018-03-11 16:00:25', 'system', '2018-03-11 16:00:25', null);
INSERT INTO `js_sys_area` VALUES ('652822', '652800', '0,650000,652800,', '30760', '0000000310,0000003370,0000030760,', '1', '2', '新疆维吾尔自治区/巴音郭楞蒙古自治州/轮台县', '轮台县', '3', '0', 'system', '2018-03-11 16:00:25', 'system', '2018-03-11 16:00:25', null);
INSERT INTO `js_sys_area` VALUES ('652823', '652800', '0,650000,652800,', '30770', '0000000310,0000003370,0000030770,', '1', '2', '新疆维吾尔自治区/巴音郭楞蒙古自治州/尉犁县', '尉犁县', '3', '0', 'system', '2018-03-11 16:00:25', 'system', '2018-03-11 16:00:25', null);
INSERT INTO `js_sys_area` VALUES ('652824', '652800', '0,650000,652800,', '30780', '0000000310,0000003370,0000030780,', '1', '2', '新疆维吾尔自治区/巴音郭楞蒙古自治州/若羌县', '若羌县', '3', '0', 'system', '2018-03-11 16:00:25', 'system', '2018-03-11 16:00:25', null);
INSERT INTO `js_sys_area` VALUES ('652825', '652800', '0,650000,652800,', '30790', '0000000310,0000003370,0000030790,', '1', '2', '新疆维吾尔自治区/巴音郭楞蒙古自治州/且末县', '且末县', '3', '0', 'system', '2018-03-11 16:00:25', 'system', '2018-03-11 16:00:25', null);
INSERT INTO `js_sys_area` VALUES ('652826', '652800', '0,650000,652800,', '30800', '0000000310,0000003370,0000030800,', '1', '2', '新疆维吾尔自治区/巴音郭楞蒙古自治州/焉耆回族自治县', '焉耆回族自治县', '3', '0', 'system', '2018-03-11 16:00:25', 'system', '2018-03-11 16:00:25', null);
INSERT INTO `js_sys_area` VALUES ('652827', '652800', '0,650000,652800,', '30810', '0000000310,0000003370,0000030810,', '1', '2', '新疆维吾尔自治区/巴音郭楞蒙古自治州/和静县', '和静县', '3', '0', 'system', '2018-03-11 16:00:25', 'system', '2018-03-11 16:00:25', null);
INSERT INTO `js_sys_area` VALUES ('652828', '652800', '0,650000,652800,', '30820', '0000000310,0000003370,0000030820,', '1', '2', '新疆维吾尔自治区/巴音郭楞蒙古自治州/和硕县', '和硕县', '3', '0', 'system', '2018-03-11 16:00:25', 'system', '2018-03-11 16:00:25', null);
INSERT INTO `js_sys_area` VALUES ('652829', '652800', '0,650000,652800,', '30830', '0000000310,0000003370,0000030830,', '1', '2', '新疆维吾尔自治区/巴音郭楞蒙古自治州/博湖县', '博湖县', '3', '0', 'system', '2018-03-11 16:00:25', 'system', '2018-03-11 16:00:25', null);
INSERT INTO `js_sys_area` VALUES ('652900', '650000', '0,650000,', '3380', '0000000310,0000003380,', '0', '1', '新疆维吾尔自治区/阿克苏地区', '阿克苏地区', '2', '0', 'system', '2018-03-11 16:00:26', 'system', '2018-03-11 16:00:25', null);
INSERT INTO `js_sys_area` VALUES ('652901', '652900', '0,650000,652900,', '30840', '0000000310,0000003380,0000030840,', '1', '2', '新疆维吾尔自治区/阿克苏地区/阿克苏市', '阿克苏市', '3', '0', 'system', '2018-03-11 16:00:25', 'system', '2018-03-11 16:00:25', null);
INSERT INTO `js_sys_area` VALUES ('652922', '652900', '0,650000,652900,', '30850', '0000000310,0000003380,0000030850,', '1', '2', '新疆维吾尔自治区/阿克苏地区/温宿县', '温宿县', '3', '0', 'system', '2018-03-11 16:00:26', 'system', '2018-03-11 16:00:26', null);
INSERT INTO `js_sys_area` VALUES ('652923', '652900', '0,650000,652900,', '30860', '0000000310,0000003380,0000030860,', '1', '2', '新疆维吾尔自治区/阿克苏地区/库车县', '库车县', '3', '0', 'system', '2018-03-11 16:00:26', 'system', '2018-03-11 16:00:26', null);
INSERT INTO `js_sys_area` VALUES ('652924', '652900', '0,650000,652900,', '30870', '0000000310,0000003380,0000030870,', '1', '2', '新疆维吾尔自治区/阿克苏地区/沙雅县', '沙雅县', '3', '0', 'system', '2018-03-11 16:00:26', 'system', '2018-03-11 16:00:26', null);
INSERT INTO `js_sys_area` VALUES ('652925', '652900', '0,650000,652900,', '30880', '0000000310,0000003380,0000030880,', '1', '2', '新疆维吾尔自治区/阿克苏地区/新和县', '新和县', '3', '0', 'system', '2018-03-11 16:00:26', 'system', '2018-03-11 16:00:26', null);
INSERT INTO `js_sys_area` VALUES ('652926', '652900', '0,650000,652900,', '30890', '0000000310,0000003380,0000030890,', '1', '2', '新疆维吾尔自治区/阿克苏地区/拜城县', '拜城县', '3', '0', 'system', '2018-03-11 16:00:26', 'system', '2018-03-11 16:00:26', null);
INSERT INTO `js_sys_area` VALUES ('652927', '652900', '0,650000,652900,', '30900', '0000000310,0000003380,0000030900,', '1', '2', '新疆维吾尔自治区/阿克苏地区/乌什县', '乌什县', '3', '0', 'system', '2018-03-11 16:00:26', 'system', '2018-03-11 16:00:26', null);
INSERT INTO `js_sys_area` VALUES ('652928', '652900', '0,650000,652900,', '30910', '0000000310,0000003380,0000030910,', '1', '2', '新疆维吾尔自治区/阿克苏地区/阿瓦提县', '阿瓦提县', '3', '0', 'system', '2018-03-11 16:00:26', 'system', '2018-03-11 16:00:26', null);
INSERT INTO `js_sys_area` VALUES ('652929', '652900', '0,650000,652900,', '30920', '0000000310,0000003380,0000030920,', '1', '2', '新疆维吾尔自治区/阿克苏地区/柯坪县', '柯坪县', '3', '0', 'system', '2018-03-11 16:00:26', 'system', '2018-03-11 16:00:26', null);
INSERT INTO `js_sys_area` VALUES ('653100', '650000', '0,650000,', '3400', '0000000310,0000003400,', '0', '1', '新疆维吾尔自治区/喀什地区', '喀什地区', '2', '0', 'system', '2018-03-11 16:00:26', 'system', '2018-03-11 16:00:26', null);
INSERT INTO `js_sys_area` VALUES ('653101', '653100', '0,650000,653100,', '30970', '0000000310,0000003400,0000030970,', '1', '2', '新疆维吾尔自治区/喀什地区/喀什市', '喀什市', '3', '0', 'system', '2018-03-11 16:00:26', 'system', '2018-03-11 16:00:26', null);
INSERT INTO `js_sys_area` VALUES ('653121', '653100', '0,650000,653100,', '30980', '0000000310,0000003400,0000030980,', '1', '2', '新疆维吾尔自治区/喀什地区/疏附县', '疏附县', '3', '0', 'system', '2018-03-11 16:00:26', 'system', '2018-03-11 16:00:26', null);
INSERT INTO `js_sys_area` VALUES ('653122', '653100', '0,650000,653100,', '30990', '0000000310,0000003400,0000030990,', '1', '2', '新疆维吾尔自治区/喀什地区/疏勒县', '疏勒县', '3', '0', 'system', '2018-03-11 16:00:26', 'system', '2018-03-11 16:00:26', null);
INSERT INTO `js_sys_area` VALUES ('653123', '653100', '0,650000,653100,', '31000', '0000000310,0000003400,0000031000,', '1', '2', '新疆维吾尔自治区/喀什地区/英吉沙县', '英吉沙县', '3', '0', 'system', '2018-03-11 16:00:26', 'system', '2018-03-11 16:00:26', null);
INSERT INTO `js_sys_area` VALUES ('653124', '653100', '0,650000,653100,', '31010', '0000000310,0000003400,0000031010,', '1', '2', '新疆维吾尔自治区/喀什地区/泽普县', '泽普县', '3', '0', 'system', '2018-03-11 16:00:26', 'system', '2018-03-11 16:00:26', null);
INSERT INTO `js_sys_area` VALUES ('653125', '653100', '0,650000,653100,', '31020', '0000000310,0000003400,0000031020,', '1', '2', '新疆维吾尔自治区/喀什地区/莎车县', '莎车县', '3', '0', 'system', '2018-03-11 16:00:26', 'system', '2018-03-11 16:00:26', null);
INSERT INTO `js_sys_area` VALUES ('653126', '653100', '0,650000,653100,', '31030', '0000000310,0000003400,0000031030,', '1', '2', '新疆维吾尔自治区/喀什地区/叶城县', '叶城县', '3', '0', 'system', '2018-03-11 16:00:26', 'system', '2018-03-11 16:00:26', null);
INSERT INTO `js_sys_area` VALUES ('653127', '653100', '0,650000,653100,', '31040', '0000000310,0000003400,0000031040,', '1', '2', '新疆维吾尔自治区/喀什地区/麦盖提县', '麦盖提县', '3', '0', 'system', '2018-03-11 16:00:26', 'system', '2018-03-11 16:00:26', null);
INSERT INTO `js_sys_area` VALUES ('653128', '653100', '0,650000,653100,', '31050', '0000000310,0000003400,0000031050,', '1', '2', '新疆维吾尔自治区/喀什地区/岳普湖县', '岳普湖县', '3', '0', 'system', '2018-03-11 16:00:26', 'system', '2018-03-11 16:00:26', null);
INSERT INTO `js_sys_area` VALUES ('653129', '653100', '0,650000,653100,', '31060', '0000000310,0000003400,0000031060,', '1', '2', '新疆维吾尔自治区/喀什地区/伽师县', '伽师县', '3', '0', 'system', '2018-03-11 16:00:26', 'system', '2018-03-11 16:00:26', null);
INSERT INTO `js_sys_area` VALUES ('653130', '653100', '0,650000,653100,', '31070', '0000000310,0000003400,0000031070,', '1', '2', '新疆维吾尔自治区/喀什地区/巴楚县', '巴楚县', '3', '0', 'system', '2018-03-11 16:00:26', 'system', '2018-03-11 16:00:26', null);
INSERT INTO `js_sys_area` VALUES ('653200', '650000', '0,650000,', '3410', '0000000310,0000003410,', '0', '1', '新疆维吾尔自治区/和田地区', '和田地区', '2', '0', 'system', '2018-03-11 16:00:26', 'system', '2018-03-11 16:00:26', null);
INSERT INTO `js_sys_area` VALUES ('653201', '653200', '0,650000,653200,', '31090', '0000000310,0000003410,0000031090,', '1', '2', '新疆维吾尔自治区/和田地区/和田市', '和田市', '3', '0', 'system', '2018-03-11 16:00:26', 'system', '2018-03-11 16:00:26', null);
INSERT INTO `js_sys_area` VALUES ('653221', '653200', '0,650000,653200,', '31100', '0000000310,0000003410,0000031100,', '1', '2', '新疆维吾尔自治区/和田地区/和田县', '和田县', '3', '0', 'system', '2018-03-11 16:00:26', 'system', '2018-03-11 16:00:26', null);
INSERT INTO `js_sys_area` VALUES ('653222', '653200', '0,650000,653200,', '31110', '0000000310,0000003410,0000031110,', '1', '2', '新疆维吾尔自治区/和田地区/墨玉县', '墨玉县', '3', '0', 'system', '2018-03-11 16:00:26', 'system', '2018-03-11 16:00:26', null);
INSERT INTO `js_sys_area` VALUES ('653223', '653200', '0,650000,653200,', '31120', '0000000310,0000003410,0000031120,', '1', '2', '新疆维吾尔自治区/和田地区/皮山县', '皮山县', '3', '0', 'system', '2018-03-11 16:00:26', 'system', '2018-03-11 16:00:26', null);
INSERT INTO `js_sys_area` VALUES ('653224', '653200', '0,650000,653200,', '31130', '0000000310,0000003410,0000031130,', '1', '2', '新疆维吾尔自治区/和田地区/洛浦县', '洛浦县', '3', '0', 'system', '2018-03-11 16:00:26', 'system', '2018-03-11 16:00:26', null);
INSERT INTO `js_sys_area` VALUES ('653225', '653200', '0,650000,653200,', '31140', '0000000310,0000003410,0000031140,', '1', '2', '新疆维吾尔自治区/和田地区/策勒县', '策勒县', '3', '0', 'system', '2018-03-11 16:00:26', 'system', '2018-03-11 16:00:26', null);
INSERT INTO `js_sys_area` VALUES ('653226', '653200', '0,650000,653200,', '31150', '0000000310,0000003410,0000031150,', '1', '2', '新疆维吾尔自治区/和田地区/于田县', '于田县', '3', '0', 'system', '2018-03-11 16:00:26', 'system', '2018-03-11 16:00:26', null);
INSERT INTO `js_sys_area` VALUES ('653227', '653200', '0,650000,653200,', '31160', '0000000310,0000003410,0000031160,', '1', '2', '新疆维吾尔自治区/和田地区/民丰县', '民丰县', '3', '0', 'system', '2018-03-11 16:00:26', 'system', '2018-03-11 16:00:26', null);
INSERT INTO `js_sys_area` VALUES ('654000', '650000', '0,650000,', '3420', '0000000310,0000003420,', '0', '1', '新疆维吾尔自治区/伊犁哈萨克自治州', '伊犁哈萨克自治州', '2', '0', 'system', '2018-03-11 16:00:26', 'system', '2018-03-11 16:00:26', null);
INSERT INTO `js_sys_area` VALUES ('654002', '654000', '0,650000,654000,', '31170', '0000000310,0000003420,0000031170,', '1', '2', '新疆维吾尔自治区/伊犁哈萨克自治州/伊宁市', '伊宁市', '3', '0', 'system', '2018-03-11 16:00:26', 'system', '2018-03-11 16:00:26', null);
INSERT INTO `js_sys_area` VALUES ('654003', '654000', '0,650000,654000,', '31180', '0000000310,0000003420,0000031180,', '1', '2', '新疆维吾尔自治区/伊犁哈萨克自治州/奎屯市', '奎屯市', '3', '0', 'system', '2018-03-11 16:00:26', 'system', '2018-03-11 16:00:26', null);
INSERT INTO `js_sys_area` VALUES ('654021', '654000', '0,650000,654000,', '31190', '0000000310,0000003420,0000031190,', '1', '2', '新疆维吾尔自治区/伊犁哈萨克自治州/伊宁县', '伊宁县', '3', '0', 'system', '2018-03-11 16:00:26', 'system', '2018-03-11 16:00:26', null);
INSERT INTO `js_sys_area` VALUES ('654022', '654000', '0,650000,654000,', '31200', '0000000310,0000003420,0000031200,', '1', '2', '新疆维吾尔自治区/伊犁哈萨克自治州/察布查尔锡伯自治县', '察布查尔锡伯自治县', '3', '0', 'system', '2018-03-11 16:00:26', 'system', '2018-03-11 16:00:26', null);
INSERT INTO `js_sys_area` VALUES ('654023', '654000', '0,650000,654000,', '31210', '0000000310,0000003420,0000031210,', '1', '2', '新疆维吾尔自治区/伊犁哈萨克自治州/霍城县', '霍城县', '3', '0', 'system', '2018-03-11 16:00:26', 'system', '2018-03-11 16:00:26', null);
INSERT INTO `js_sys_area` VALUES ('654024', '654000', '0,650000,654000,', '31220', '0000000310,0000003420,0000031220,', '1', '2', '新疆维吾尔自治区/伊犁哈萨克自治州/巩留县', '巩留县', '3', '0', 'system', '2018-03-11 16:00:26', 'system', '2018-03-11 16:00:26', null);
INSERT INTO `js_sys_area` VALUES ('654025', '654000', '0,650000,654000,', '31230', '0000000310,0000003420,0000031230,', '1', '2', '新疆维吾尔自治区/伊犁哈萨克自治州/新源县', '新源县', '3', '0', 'system', '2018-03-11 16:00:26', 'system', '2018-03-11 16:00:26', null);
INSERT INTO `js_sys_area` VALUES ('654026', '654000', '0,650000,654000,', '31240', '0000000310,0000003420,0000031240,', '1', '2', '新疆维吾尔自治区/伊犁哈萨克自治州/昭苏县', '昭苏县', '3', '0', 'system', '2018-03-11 16:00:26', 'system', '2018-03-11 16:00:26', null);
INSERT INTO `js_sys_area` VALUES ('654027', '654000', '0,650000,654000,', '31250', '0000000310,0000003420,0000031250,', '1', '2', '新疆维吾尔自治区/伊犁哈萨克自治州/特克斯县', '特克斯县', '3', '0', 'system', '2018-03-11 16:00:26', 'system', '2018-03-11 16:00:26', null);
INSERT INTO `js_sys_area` VALUES ('654028', '654000', '0,650000,654000,', '31260', '0000000310,0000003420,0000031260,', '1', '2', '新疆维吾尔自治区/伊犁哈萨克自治州/尼勒克县', '尼勒克县', '3', '0', 'system', '2018-03-11 16:00:26', 'system', '2018-03-11 16:00:26', null);
INSERT INTO `js_sys_area` VALUES ('654200', '650000', '0,650000,', '3430', '0000000310,0000003430,', '0', '1', '新疆维吾尔自治区/塔城地区', '塔城地区', '2', '0', 'system', '2018-03-11 16:00:26', 'system', '2018-03-11 16:00:26', null);
INSERT INTO `js_sys_area` VALUES ('654201', '654200', '0,650000,654200,', '31270', '0000000310,0000003430,0000031270,', '1', '2', '新疆维吾尔自治区/塔城地区/塔城市', '塔城市', '3', '0', 'system', '2018-03-11 16:00:26', 'system', '2018-03-11 16:00:26', null);
INSERT INTO `js_sys_area` VALUES ('654202', '654200', '0,650000,654200,', '31280', '0000000310,0000003430,0000031280,', '1', '2', '新疆维吾尔自治区/塔城地区/乌苏市', '乌苏市', '3', '0', 'system', '2018-03-11 16:00:26', 'system', '2018-03-11 16:00:26', null);
INSERT INTO `js_sys_area` VALUES ('654221', '654200', '0,650000,654200,', '31290', '0000000310,0000003430,0000031290,', '1', '2', '新疆维吾尔自治区/塔城地区/额敏县', '额敏县', '3', '0', 'system', '2018-03-11 16:00:26', 'system', '2018-03-11 16:00:26', null);
INSERT INTO `js_sys_area` VALUES ('654223', '654200', '0,650000,654200,', '31300', '0000000310,0000003430,0000031300,', '1', '2', '新疆维吾尔自治区/塔城地区/沙湾县', '沙湾县', '3', '0', 'system', '2018-03-11 16:00:26', 'system', '2018-03-11 16:00:26', null);
INSERT INTO `js_sys_area` VALUES ('654224', '654200', '0,650000,654200,', '31310', '0000000310,0000003430,0000031310,', '1', '2', '新疆维吾尔自治区/塔城地区/托里县', '托里县', '3', '0', 'system', '2018-03-11 16:00:26', 'system', '2018-03-11 16:00:26', null);
INSERT INTO `js_sys_area` VALUES ('654225', '654200', '0,650000,654200,', '31320', '0000000310,0000003430,0000031320,', '1', '2', '新疆维吾尔自治区/塔城地区/裕民县', '裕民县', '3', '0', 'system', '2018-03-11 16:00:26', 'system', '2018-03-11 16:00:26', null);
INSERT INTO `js_sys_area` VALUES ('654226', '654200', '0,650000,654200,', '31330', '0000000310,0000003430,0000031330,', '1', '2', '新疆维吾尔自治区/塔城地区/和布克赛尔蒙古自治县', '和布克赛尔蒙古自治县', '3', '0', 'system', '2018-03-11 16:00:26', 'system', '2018-03-11 16:00:26', null);
INSERT INTO `js_sys_area` VALUES ('654300', '650000', '0,650000,', '3440', '0000000310,0000003440,', '0', '1', '新疆维吾尔自治区/阿勒泰地区', '阿勒泰地区', '2', '0', 'system', '2018-03-11 16:00:26', 'system', '2018-03-11 16:00:26', null);
INSERT INTO `js_sys_area` VALUES ('654301', '654300', '0,650000,654300,', '31340', '0000000310,0000003440,0000031340,', '1', '2', '新疆维吾尔自治区/阿勒泰地区/阿勒泰市', '阿勒泰市', '3', '0', 'system', '2018-03-11 16:00:26', 'system', '2018-03-11 16:00:26', null);
INSERT INTO `js_sys_area` VALUES ('654321', '654300', '0,650000,654300,', '31350', '0000000310,0000003440,0000031350,', '1', '2', '新疆维吾尔自治区/阿勒泰地区/布尔津县', '布尔津县', '3', '0', 'system', '2018-03-11 16:00:26', 'system', '2018-03-11 16:00:26', null);
INSERT INTO `js_sys_area` VALUES ('654322', '654300', '0,650000,654300,', '31360', '0000000310,0000003440,0000031360,', '1', '2', '新疆维吾尔自治区/阿勒泰地区/富蕴县', '富蕴县', '3', '0', 'system', '2018-03-11 16:00:26', 'system', '2018-03-11 16:00:26', null);
INSERT INTO `js_sys_area` VALUES ('654323', '654300', '0,650000,654300,', '31370', '0000000310,0000003440,0000031370,', '1', '2', '新疆维吾尔自治区/阿勒泰地区/福海县', '福海县', '3', '0', 'system', '2018-03-11 16:00:26', 'system', '2018-03-11 16:00:26', null);
INSERT INTO `js_sys_area` VALUES ('654324', '654300', '0,650000,654300,', '31380', '0000000310,0000003440,0000031380,', '1', '2', '新疆维吾尔自治区/阿勒泰地区/哈巴河县', '哈巴河县', '3', '0', 'system', '2018-03-11 16:00:26', 'system', '2018-03-11 16:00:26', null);
INSERT INTO `js_sys_area` VALUES ('654325', '654300', '0,650000,654300,', '31390', '0000000310,0000003440,0000031390,', '1', '2', '新疆维吾尔自治区/阿勒泰地区/青河县', '青河县', '3', '0', 'system', '2018-03-11 16:00:26', 'system', '2018-03-11 16:00:26', null);
INSERT INTO `js_sys_area` VALUES ('654326', '654300', '0,650000,654300,', '31400', '0000000310,0000003440,0000031400,', '1', '2', '新疆维吾尔自治区/阿勒泰地区/吉木乃县', '吉木乃县', '3', '0', 'system', '2018-03-11 16:00:26', 'system', '2018-03-11 16:00:26', null);
INSERT INTO `js_sys_area` VALUES ('659000', '650000', '0,650000,', '3450', '0000000310,0000003450,', '0', '1', '新疆维吾尔自治区/省直辖行政单位', '省直辖行政单位', '2', '0', 'system', '2018-03-11 16:00:26', 'system', '2018-03-11 16:00:26', null);
INSERT INTO `js_sys_area` VALUES ('659001', '659000', '0,650000,659000,', '31410', '0000000310,0000003450,0000031410,', '1', '2', '新疆维吾尔自治区/省直辖行政单位/石河子市', '石河子市', '3', '0', 'system', '2018-03-11 16:00:26', 'system', '2018-03-11 16:00:26', null);
INSERT INTO `js_sys_area` VALUES ('659002', '659000', '0,650000,659000,', '31420', '0000000310,0000003450,0000031420,', '1', '2', '新疆维吾尔自治区/省直辖行政单位/阿拉尔市', '阿拉尔市', '3', '0', 'system', '2018-03-11 16:00:26', 'system', '2018-03-11 16:00:26', null);
INSERT INTO `js_sys_area` VALUES ('659003', '659000', '0,650000,659000,', '31430', '0000000310,0000003450,0000031430,', '1', '2', '新疆维吾尔自治区/省直辖行政单位/图木舒克市', '图木舒克市', '3', '0', 'system', '2018-03-11 16:00:26', 'system', '2018-03-11 16:00:26', null);
INSERT INTO `js_sys_area` VALUES ('659004', '659000', '0,650000,659000,', '31440', '0000000310,0000003450,0000031440,', '1', '2', '新疆维吾尔自治区/省直辖行政单位/五家渠市', '五家渠市', '3', '0', 'system', '2018-03-11 16:00:27', 'system', '2018-03-11 16:00:27', null);
INSERT INTO `js_sys_area` VALUES ('710000', '0', '0,', '320', '0000000320,', '1', '0', '台湾省', '台湾省', '1', '0', 'system', '2018-03-11 16:00:27', 'system', '2018-03-11 16:00:27', null);
INSERT INTO `js_sys_area` VALUES ('810000', '0', '0,', '330', '0000000330,', '1', '0', '香港特别行政区', '香港特别行政区', '1', '0', 'system', '2018-03-11 16:00:27', 'system', '2018-03-11 16:00:27', null);
INSERT INTO `js_sys_area` VALUES ('820000', '0', '0,', '340', '0000000340,', '1', '0', '澳门特别行政区', '澳门特别行政区', '1', '0', 'system', '2018-03-11 16:00:27', 'system', '2018-03-11 16:00:27', null);

-- ----------------------------
-- Table structure for js_sys_company
-- ----------------------------
DROP TABLE IF EXISTS `js_sys_company`;
CREATE TABLE `js_sys_company` (
  `company_code` varchar(64) NOT NULL COMMENT '公司编码',
  `parent_code` varchar(64) NOT NULL COMMENT '父级编号',
  `parent_codes` varchar(2000) NOT NULL COMMENT '所有父级编号',
  `tree_sort` decimal(10,0) NOT NULL COMMENT '本级排序号（升序）',
  `tree_sorts` varchar(1200) NOT NULL COMMENT '所有级别排序号',
  `tree_leaf` char(1) NOT NULL COMMENT '是否最末级',
  `tree_level` decimal(4,0) NOT NULL COMMENT '层次级别',
  `tree_names` varchar(2000) NOT NULL COMMENT '全节点名',
  `view_code` varchar(100) NOT NULL COMMENT '公司代码',
  `company_name` varchar(200) NOT NULL COMMENT '公司名称',
  `full_name` varchar(200) NOT NULL COMMENT '公司全称',
  `area_code` varchar(100) DEFAULT NULL COMMENT '区域编码',
  `status` char(1) NOT NULL DEFAULT '0' COMMENT '状态（0正常 1删除 2停用）',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `remarks` varchar(500) DEFAULT NULL COMMENT '备注信息',
  `corp_code` varchar(64) NOT NULL DEFAULT '0' COMMENT '归属集团Code',
  `corp_name` varchar(100) NOT NULL DEFAULT 'JeeSite' COMMENT '归属集团Name',
  `extend_s1` varchar(500) DEFAULT NULL COMMENT '扩展 String 1',
  `extend_s2` varchar(500) DEFAULT NULL COMMENT '扩展 String 2',
  `extend_s3` varchar(500) DEFAULT NULL COMMENT '扩展 String 3',
  `extend_s4` varchar(500) DEFAULT NULL COMMENT '扩展 String 4',
  `extend_s5` varchar(500) DEFAULT NULL COMMENT '扩展 String 5',
  `extend_s6` varchar(500) DEFAULT NULL COMMENT '扩展 String 6',
  `extend_s7` varchar(500) DEFAULT NULL COMMENT '扩展 String 7',
  `extend_s8` varchar(500) DEFAULT NULL COMMENT '扩展 String 8',
  `extend_i1` decimal(19,0) DEFAULT NULL COMMENT '扩展 Integer 1',
  `extend_i2` decimal(19,0) DEFAULT NULL COMMENT '扩展 Integer 2',
  `extend_i3` decimal(19,0) DEFAULT NULL COMMENT '扩展 Integer 3',
  `extend_i4` decimal(19,0) DEFAULT NULL COMMENT '扩展 Integer 4',
  `extend_f1` decimal(19,4) DEFAULT NULL COMMENT '扩展 Float 1',
  `extend_f2` decimal(19,4) DEFAULT NULL COMMENT '扩展 Float 2',
  `extend_f3` decimal(19,4) DEFAULT NULL COMMENT '扩展 Float 3',
  `extend_f4` decimal(19,4) DEFAULT NULL COMMENT '扩展 Float 4',
  `extend_d1` datetime DEFAULT NULL COMMENT '扩展 Date 1',
  `extend_d2` datetime DEFAULT NULL COMMENT '扩展 Date 2',
  `extend_d3` datetime DEFAULT NULL COMMENT '扩展 Date 3',
  `extend_d4` datetime DEFAULT NULL COMMENT '扩展 Date 4',
  PRIMARY KEY (`company_code`),
  KEY `idx_sys_company_cc` (`corp_code`),
  KEY `idx_sys_company_pc` (`parent_code`),
  KEY `idx_sys_company_ts` (`tree_sort`),
  KEY `idx_sys_company_status` (`status`),
  KEY `idx_sys_company_vc` (`view_code`),
  KEY `idx_sys_company_pcs` (`parent_codes`(255)),
  KEY `idx_sys_company_tss` (`tree_sorts`(255))
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='公司表';

-- ----------------------------
-- Records of js_sys_company
-- ----------------------------

-- ----------------------------
-- Table structure for js_sys_company_office
-- ----------------------------
DROP TABLE IF EXISTS `js_sys_company_office`;
CREATE TABLE `js_sys_company_office` (
  `company_code` varchar(64) NOT NULL COMMENT '公司编码',
  `office_code` varchar(64) NOT NULL COMMENT '机构编码',
  PRIMARY KEY (`company_code`,`office_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='公司部门关联表';

-- ----------------------------
-- Records of js_sys_company_office
-- ----------------------------

-- ----------------------------
-- Table structure for js_sys_config
-- ----------------------------
DROP TABLE IF EXISTS `js_sys_config`;
CREATE TABLE `js_sys_config` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `config_name` varchar(100) NOT NULL COMMENT '名称',
  `config_key` varchar(100) NOT NULL COMMENT '参数键',
  `config_value` varchar(2000) NOT NULL COMMENT '参数值',
  `is_sys` char(1) NOT NULL COMMENT '系统内置（1是 0否）',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `remarks` varchar(500) DEFAULT NULL COMMENT '备注信息',
  PRIMARY KEY (`id`),
  KEY `idx_sys_config_key` (`config_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='参数配置表';

-- ----------------------------
-- Records of js_sys_config
-- ----------------------------
INSERT INTO `js_sys_config` VALUES ('972744043502039040', '研发工具-代码生成默认包名', 'gen.defaultPackageName', 'com.jeesite.modules', '0', 'system', '2018-03-11 16:00:27', 'system', '2018-03-11 16:00:27', '新建项目后，修改该键值，在生成代码的时候就不要再修改了');
INSERT INTO `js_sys_config` VALUES ('972744043741114368', '主框架页-桌面仪表盘首页地址', 'sys.index.desktopUrl', '/desktop', '0', 'system', '2018-03-11 16:00:27', 'system', '2018-03-11 16:00:27', '主页面的第一个页签首页桌面地址');
INSERT INTO `js_sys_config` VALUES ('972744043879526400', '主框架页-侧边栏的默认显示样式', 'sys.index.sidebarStyle', '1', '0', 'system', '2018-03-11 16:00:27', 'system', '2018-03-11 16:00:27', '1：默认显示侧边栏；2：默认折叠侧边栏');
INSERT INTO `js_sys_config` VALUES ('972744043996966912', '主框架页-默认皮肤样式名称', 'sys.index.skinName', 'skin-blue-light', '0', 'system', '2018-03-11 16:00:27', 'system', '2018-03-11 16:00:27', 'skin-black-light、skin-black、skin-blue-light、skin-blue、skin-green-light、skin-green、skin-purple-light、skin-purple、skin-red-light、skin-red、skin-yellow-light、skin-yellow');
INSERT INTO `js_sys_config` VALUES ('972744044085047296', '用户登录-登录失败多少次数后显示验证码', 'sys.login.failedNumAfterValidCode', '100', '0', 'system', '2018-03-11 16:00:27', 'system', '2018-03-11 16:00:27', '设置为0强制使用验证码登录');
INSERT INTO `js_sys_config` VALUES ('972744044164739072', '用户登录-登录失败多少次数后锁定账号', 'sys.login.failedNumAfterLockAccount', '200', '0', 'system', '2018-03-11 16:00:27', 'system', '2018-03-11 16:00:27', '登录失败多少次数后锁定账号');
INSERT INTO `js_sys_config` VALUES ('972744044252819456', '用户登录-登录失败多少次数后锁定账号的时间', 'sys.login.failedNumAfterLockMinute', '20', '0', 'system', '2018-03-11 16:00:27', 'system', '2018-03-11 16:00:27', '锁定账号的时间（单位：分钟）');
INSERT INTO `js_sys_config` VALUES ('972744044340899840', '账号自助-是否开启用户注册功能', 'sys.account.registerUser', 'true', '0', 'system', '2018-03-11 16:00:27', 'system', '2018-03-11 16:00:27', '是否开启注册用户功能');
INSERT INTO `js_sys_config` VALUES ('972744044445757440', '账号自助-允许自助注册的用户类型', 'sys.account.registerUser.userTypes', '-1', '0', 'system', '2018-03-11 16:00:27', 'system', '2018-03-11 16:00:27', '允许注册的用户类型（多个用逗号隔开，如果注册时不选择用户类型，则第一个为默认类型）');
INSERT INTO `js_sys_config` VALUES ('972744044512866304', '账号自助-验证码有效时间（分钟）', 'sys.account.validCodeTimeout', '10', '0', 'system', '2018-03-11 16:00:27', 'system', '2018-03-11 16:00:27', '找回密码时，短信/邮件验证码有效时间（单位：分钟，0表示不限制）');
INSERT INTO `js_sys_config` VALUES ('972744044579975168', '用户管理-账号默认角色-员工类型', 'sys.user.defaultRoleCodes.employee', 'default', '0', 'system', '2018-03-11 16:00:27', 'system', '2018-03-11 16:00:27', '所有员工用户都拥有的角色权限（适用于菜单授权查询）');
INSERT INTO `js_sys_config` VALUES ('972744044663861248', '用户管理-账号初始密码', 'sys.user.initPassword', '123456', '0', 'system', '2018-03-11 16:00:27', 'system', '2018-03-11 16:00:27', '创建用户和重置密码的时候用户的密码');
INSERT INTO `js_sys_config` VALUES ('972744044743553024', '用户管理-初始密码修改策略', 'sys.user.initPasswordModify', '1', '0', 'system', '2018-03-11 16:00:27', 'system', '2018-03-11 16:00:27', '0：初始密码修改策略关闭，没有任何提示；1：提醒用户，如果未修改初始密码，则在登录时和点击菜单就会提醒修改密码对话框；2：强制实行初始密码修改，登录后若不修改密码则不能进行系统操作');
INSERT INTO `js_sys_config` VALUES ('972744044806467584', '用户管理-账号密码修改策略', 'sys.user.passwordModify', '1', '0', 'system', '2018-03-11 16:00:27', 'system', '2018-03-11 16:00:27', '0：密码修改策略关闭，没有任何提示；1：提醒用户，如果未修改初始密码，则在登录时和点击菜单就会提醒修改密码对话框；2：强制实行初始密码修改，登录后若不修改密码则不能进行系统操作。');
INSERT INTO `js_sys_config` VALUES ('972744044877770752', '用户管理-账号密码修改策略验证周期', 'sys.user.passwordModifyCycle', '30', '0', 'system', '2018-03-11 16:00:27', 'system', '2018-03-11 16:00:27', '密码安全修改周期是指定时间内提醒或必须修改密码（例如设置30天）的验证时间（天），超过这个时间登录系统时需，提醒用户修改密码或强制修改密码才能继续使用系统。单位：天，如果设置30天，则第31天开始强制修改密码');
INSERT INTO `js_sys_config` VALUES ('972744044957462528', '用户管理-密码修改多少次内不允许重复', 'sys.user.passwordModifyNotRepeatNum', '1', '0', 'system', '2018-03-11 16:00:27', 'system', '2018-03-11 16:00:27', '默认1次，表示不能与上次密码重复；若设置为3，表示并与前3次密码重复');
INSERT INTO `js_sys_config` VALUES ('972744045045542912', '用户管理-账号密码修改最低安全等级', 'sys.user.passwordModifySecurityLevel', '0', '0', 'system', '2018-03-11 16:00:27', 'system', '2018-03-11 16:00:27', '0：不限制等级（用户在修改密码的时候不进行等级验证）\r；1：限制最低等级为很弱\r；2：限制最低等级为弱\r；3：限制最低等级为安全\r；4：限制最低等级为很安全');

-- ----------------------------
-- Table structure for js_sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `js_sys_dict_data`;
CREATE TABLE `js_sys_dict_data` (
  `dict_code` varchar(64) NOT NULL COMMENT '字典编码',
  `parent_code` varchar(64) NOT NULL COMMENT '父级编号',
  `parent_codes` varchar(2000) NOT NULL COMMENT '所有父级编号',
  `tree_sort` decimal(10,0) NOT NULL COMMENT '本级排序号（升序）',
  `tree_sorts` varchar(1200) NOT NULL COMMENT '所有级别排序号',
  `tree_leaf` char(1) NOT NULL COMMENT '是否最末级',
  `tree_level` decimal(4,0) NOT NULL COMMENT '层次级别',
  `tree_names` varchar(2000) NOT NULL COMMENT '全节点名',
  `dict_label` varchar(100) NOT NULL COMMENT '字典标签',
  `dict_value` varchar(100) NOT NULL COMMENT '字典键值',
  `dict_type` varchar(100) NOT NULL COMMENT '字典类型',
  `is_sys` char(1) NOT NULL COMMENT '系统内置（1是 0否）',
  `description` varchar(500) DEFAULT NULL COMMENT '字典描述',
  `css_style` varchar(500) DEFAULT NULL COMMENT 'css样式（如：color:red)',
  `css_class` varchar(500) DEFAULT NULL COMMENT 'css类名（如：red）',
  `status` char(1) NOT NULL DEFAULT '0' COMMENT '状态（0正常 1删除 2停用）',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `remarks` varchar(500) DEFAULT NULL COMMENT '备注信息',
  `corp_code` varchar(64) NOT NULL DEFAULT '0' COMMENT '归属集团Code',
  `corp_name` varchar(100) NOT NULL DEFAULT 'JeeSite' COMMENT '归属集团Name',
  `extend_s1` varchar(500) DEFAULT NULL COMMENT '扩展 String 1',
  `extend_s2` varchar(500) DEFAULT NULL COMMENT '扩展 String 2',
  `extend_s3` varchar(500) DEFAULT NULL COMMENT '扩展 String 3',
  `extend_s4` varchar(500) DEFAULT NULL COMMENT '扩展 String 4',
  `extend_s5` varchar(500) DEFAULT NULL COMMENT '扩展 String 5',
  `extend_s6` varchar(500) DEFAULT NULL COMMENT '扩展 String 6',
  `extend_s7` varchar(500) DEFAULT NULL COMMENT '扩展 String 7',
  `extend_s8` varchar(500) DEFAULT NULL COMMENT '扩展 String 8',
  `extend_i1` decimal(19,0) DEFAULT NULL COMMENT '扩展 Integer 1',
  `extend_i2` decimal(19,0) DEFAULT NULL COMMENT '扩展 Integer 2',
  `extend_i3` decimal(19,0) DEFAULT NULL COMMENT '扩展 Integer 3',
  `extend_i4` decimal(19,0) DEFAULT NULL COMMENT '扩展 Integer 4',
  `extend_f1` decimal(19,4) DEFAULT NULL COMMENT '扩展 Float 1',
  `extend_f2` decimal(19,4) DEFAULT NULL COMMENT '扩展 Float 2',
  `extend_f3` decimal(19,4) DEFAULT NULL COMMENT '扩展 Float 3',
  `extend_f4` decimal(19,4) DEFAULT NULL COMMENT '扩展 Float 4',
  `extend_d1` datetime DEFAULT NULL COMMENT '扩展 Date 1',
  `extend_d2` datetime DEFAULT NULL COMMENT '扩展 Date 2',
  `extend_d3` datetime DEFAULT NULL COMMENT '扩展 Date 3',
  `extend_d4` datetime DEFAULT NULL COMMENT '扩展 Date 4',
  PRIMARY KEY (`dict_code`),
  KEY `idx_sys_dict_data_cc` (`corp_code`),
  KEY `idx_sys_dict_data_dt` (`dict_type`),
  KEY `idx_sys_dict_data_pc` (`parent_code`),
  KEY `idx_sys_dict_data_status` (`status`),
  KEY `idx_sys_dict_data_pcs` (`parent_codes`(255)),
  KEY `idx_sys_dict_data_ts` (`tree_sort`),
  KEY `idx_sys_dict_data_tss` (`tree_sorts`(255)),
  KEY `idx_sys_dict_data_dv` (`dict_value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='字典数据表';

-- ----------------------------
-- Records of js_sys_dict_data
-- ----------------------------
INSERT INTO `js_sys_dict_data` VALUES ('972744049487310848', '0', '0,', '30', '0000000030,', '1', '0', '是', '是', '1', 'sys_yes_no', '1', '', '', '', '0', 'system', '2018-03-11 16:00:28', 'system', '2018-03-11 16:00:28', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('972744049646694400', '0', '0,', '40', '0000000040,', '1', '0', '否', '否', '0', 'sys_yes_no', '1', '', 'color:#aaa;', '', '0', 'system', '2018-03-11 16:00:28', 'system', '2018-03-11 16:00:28', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('972744049713803264', '0', '0,', '20', '0000000020,', '1', '0', '正常', '正常', '0', 'sys_status', '1', '', '', '', '0', 'system', '2018-03-11 16:00:28', 'system', '2018-03-11 16:00:28', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('972744049772523520', '0', '0,', '30', '0000000030,', '1', '0', '删除', '删除', '1', 'sys_status', '1', '', 'color:#f00;', '', '0', 'system', '2018-03-11 16:00:28', 'system', '2018-03-11 16:00:28', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('972744049839632384', '0', '0,', '40', '0000000040,', '1', '0', '停用', '停用', '2', 'sys_status', '1', '', 'color:#f00;', '', '0', 'system', '2018-03-11 16:00:28', 'system', '2018-03-11 16:00:28', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('972744049894158336', '0', '0,', '50', '0000000050,', '1', '0', '冻结', '冻结', '3', 'sys_status', '1', '', 'color:#fa0;', '', '0', 'system', '2018-03-11 16:00:28', 'system', '2018-03-11 16:00:28', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('972744049940295680', '0', '0,', '60', '0000000060,', '1', '0', '待审', '待审', '4', 'sys_status', '1', '', '', '', '0', 'system', '2018-03-11 16:00:28', 'system', '2018-03-11 16:00:28', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('972744050036764672', '0', '0,', '70', '0000000070,', '1', '0', '驳回', '驳回', '5', 'sys_status', '1', '', '', '', '0', 'system', '2018-03-11 16:00:28', 'system', '2018-03-11 16:00:28', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('972744050108067840', '0', '0,', '80', '0000000080,', '1', '0', '草稿', '草稿', '9', 'sys_status', '1', '', 'color:#aaa;', '', '0', 'system', '2018-03-11 16:00:28', 'system', '2018-03-11 16:00:28', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('972744050170982400', '0', '0,', '30', '0000000030,', '1', '0', '显示', '显示', '1', 'sys_show_hide', '1', '', '', '', '0', 'system', '2018-03-11 16:00:28', 'system', '2018-03-11 16:00:28', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('972744050238091264', '0', '0,', '40', '0000000040,', '1', '0', '隐藏', '隐藏', '0', 'sys_show_hide', '1', '', 'color:#aaa;', '', '0', 'system', '2018-03-11 16:00:28', 'system', '2018-03-11 16:00:28', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('972744050288422912', '0', '0,', '30', '0000000030,', '1', '0', '简体中文', '简体中文', 'zh_CN', 'sys_lang_type', '1', '', '', '', '0', 'system', '2018-03-11 16:00:28', 'system', '2018-03-11 16:00:28', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('972744050363920384', '0', '0,', '30', '0000000030,', '1', '0', 'PC电脑', 'PC电脑', 'pc', 'sys_device_type', '1', '', '', '', '0', 'system', '2018-03-11 16:00:28', 'system', '2018-03-11 16:00:28', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('972744050418446336', '0', '0,', '40', '0000000040,', '1', '0', '手机APP', '手机APP', 'mobileApp', 'sys_device_type', '1', '', '', '', '0', 'system', '2018-03-11 16:00:28', 'system', '2018-03-11 16:00:28', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('972744050489749504', '0', '0,', '50', '0000000050,', '1', '0', '手机Web', '手机Web', 'mobileWeb', 'sys_device_type', '1', '', '', '', '0', 'system', '2018-03-11 16:00:29', 'system', '2018-03-11 16:00:29', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('972744050548469760', '0', '0,', '60', '0000000060,', '1', '0', '微信设备', '微信设备', 'weixin', 'sys_device_type', '1', '', '', '', '0', 'system', '2018-03-11 16:00:29', 'system', '2018-03-11 16:00:29', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('972744050623967232', '0', '0,', '30', '0000000030,', '1', '0', '主导航菜单', '主导航菜单', 'default', 'sys_menu_sys_code', '1', '', '', '', '0', 'system', '2018-03-11 16:00:29', 'system', '2018-03-11 16:00:29', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('972744050686881792', '0', '0,', '30', '0000000030,', '1', '0', '菜单', '菜单', '1', 'sys_menu_type', '1', '', '', '', '0', 'system', '2018-03-11 16:00:29', 'system', '2018-03-11 16:00:29', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('972744050779156480', '0', '0,', '40', '0000000040,', '1', '0', '权限', '权限', '2', 'sys_menu_type', '1', '', 'color:#c243d6;', '', '0', 'system', '2018-03-11 16:00:29', 'system', '2018-03-11 16:00:29', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('972744050879819776', '0', '0,', '30', '0000000030,', '1', '0', '默认权重', '默认权重', '20', 'sys_menu_weight', '1', '', '', '', '0', 'system', '2018-03-11 16:00:29', 'system', '2018-03-11 16:00:29', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('972744050951122944', '0', '0,', '40', '0000000040,', '1', '0', '二级管理员', '二级管理员', '40', 'sys_menu_weight', '1', '', '', '', '0', 'system', '2018-03-11 16:00:29', 'system', '2018-03-11 16:00:29', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('972744051009843200', '0', '0,', '50', '0000000050,', '1', '0', '系统管理员', '系统管理员', '60', 'sys_menu_weight', '1', '', '', '', '0', 'system', '2018-03-11 16:00:29', 'system', '2018-03-11 16:00:29', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('972744051064369152', '0', '0,', '60', '0000000060,', '1', '0', '超级管理员', '超级管理员', '80', 'sys_menu_weight', '1', '', 'color:#c243d6;', '', '0', 'system', '2018-03-11 16:00:29', 'system', '2018-03-11 16:00:29', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('972744051135672320', '0', '0,', '30', '0000000030,', '1', '0', '国家', '国家', '0', 'sys_area_type', '1', '', '', '', '0', 'system', '2018-03-11 16:00:29', 'system', '2018-03-11 16:00:29', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('972744051190198272', '0', '0,', '40', '0000000040,', '1', '0', '省份直辖市', '省份直辖市', '1', 'sys_area_type', '1', '', '', '', '0', 'system', '2018-03-11 16:00:29', 'system', '2018-03-11 16:00:29', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('972744051253112832', '0', '0,', '50', '0000000050,', '1', '0', '地市', '地市', '2', 'sys_area_type', '1', '', '', '', '0', 'system', '2018-03-11 16:00:29', 'system', '2018-03-11 16:00:29', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('972744051311833088', '0', '0,', '60', '0000000060,', '1', '0', '区县', '区县', '3', 'sys_area_type', '1', '', '', '', '0', 'system', '2018-03-11 16:00:29', 'system', '2018-03-11 16:00:29', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('972744051366359040', '0', '0,', '30', '0000000030,', '1', '0', '省级公司', '省级公司', '1', 'sys_office_type', '1', '', '', '', '0', 'system', '2018-03-11 16:00:29', 'system', '2018-03-11 16:00:29', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('972744051425079296', '0', '0,', '40', '0000000040,', '1', '0', '市级公司', '市级公司', '2', 'sys_office_type', '1', '', '', '', '0', 'system', '2018-03-11 16:00:29', 'system', '2018-03-11 16:00:29', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('972744051475410944', '0', '0,', '50', '0000000050,', '1', '0', '部门', '部门', '3', 'sys_office_type', '1', '', '', '', '0', 'system', '2018-03-11 16:00:29', 'system', '2018-03-11 16:00:29', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('972744051534131200', '0', '0,', '30', '0000000030,', '1', '0', '正常', '正常', '0', 'sys_search_status', '1', '', '', '', '0', 'system', '2018-03-11 16:00:29', 'system', '2018-03-11 16:00:29', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('972744051605434368', '0', '0,', '40', '0000000040,', '1', '0', '停用', '停用', '2', 'sys_search_status', '1', '', 'color:#f00;', '', '0', 'system', '2018-03-11 16:00:29', 'system', '2018-03-11 16:00:29', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('972744051664154624', '0', '0,', '30', '0000000030,', '1', '0', '男', '男', '1', 'sys_user_sex', '1', '', '', '', '0', 'system', '2018-03-11 16:00:29', 'system', '2018-03-11 16:00:29', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('972744051722874880', '0', '0,', '40', '0000000040,', '1', '0', '女', '女', '2', 'sys_user_sex', '1', '', '', '', '0', 'system', '2018-03-11 16:00:29', 'system', '2018-03-11 16:00:29', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('972744051823538176', '0', '0,', '30', '0000000030,', '1', '0', '正常', '正常', '0', 'sys_user_status', '1', '', '', '', '0', 'system', '2018-03-11 16:00:29', 'system', '2018-03-11 16:00:29', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('972744051886452736', '0', '0,', '40', '0000000040,', '1', '0', '停用', '停用', '2', 'sys_user_status', '1', '', 'color:#f00;', '', '0', 'system', '2018-03-11 16:00:29', 'system', '2018-03-11 16:00:29', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('972744051953561600', '0', '0,', '50', '0000000050,', '1', '0', '冻结', '冻结', '3', 'sys_user_status', '1', '', 'color:#fa0;', '', '0', 'system', '2018-03-11 16:00:29', 'system', '2018-03-11 16:00:29', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('972744052024864768', '0', '0,', '30', '0000000030,', '1', '0', '员工', '员工', 'employee', 'sys_user_type', '1', '', '', '', '0', 'system', '2018-03-11 16:00:29', 'system', '2018-03-11 16:00:29', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('972744052087779328', '0', '0,', '40', '0000000040,', '1', '0', '会员', '会员', 'member', 'sys_user_type', '1', '', '', '', '0', 'system', '2018-03-11 16:00:29', 'system', '2018-03-11 16:00:29', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('972744052150693888', '0', '0,', '50', '0000000050,', '1', '0', '单位', '单位', 'btype', 'sys_user_type', '1', '', '', '', '0', 'system', '2018-03-11 16:00:29', 'system', '2018-03-11 16:00:29', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('972744052230385664', '0', '0,', '60', '0000000060,', '1', '0', '个人', '个人', 'persion', 'sys_user_type', '1', '', '', '', '0', 'system', '2018-03-11 16:00:29', 'system', '2018-03-11 16:00:29', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('972744052301688832', '0', '0,', '70', '0000000070,', '1', '0', '专家', '专家', 'expert', 'sys_user_type', '1', '', '', '', '0', 'system', '2018-03-11 16:00:29', 'system', '2018-03-11 16:00:29', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('972744052372992000', '0', '0,', '30', '0000000030,', '1', '0', '高管', '高管', '1', 'sys_role_type', '1', '', '', '', '0', 'system', '2018-03-11 16:00:29', 'system', '2018-03-11 16:00:29', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('972744052427517952', '0', '0,', '40', '0000000040,', '1', '0', '中层', '中层', '2', 'sys_role_type', '1', '', '', '', '0', 'system', '2018-03-11 16:00:29', 'system', '2018-03-11 16:00:29', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('972744052482043904', '0', '0,', '50', '0000000050,', '1', '0', '基层', '基层', '3', 'sys_role_type', '1', '', '', '', '0', 'system', '2018-03-11 16:00:29', 'system', '2018-03-11 16:00:29', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('972744052528181248', '0', '0,', '60', '0000000060,', '1', '0', '其它', '其它', '4', 'sys_role_type', '1', '', '', '', '0', 'system', '2018-03-11 16:00:29', 'system', '2018-03-11 16:00:29', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('972744052591095808', '0', '0,', '30', '0000000030,', '1', '0', '未设置', '未设置', '0', 'sys_role_data_scope', '1', '', '', '', '0', 'system', '2018-03-11 16:00:29', 'system', '2018-03-11 16:00:29', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('972744052645621760', '0', '0,', '40', '0000000040,', '1', '0', '全部数据权限', '全部数据权限', '1', 'sys_role_data_scope', '1', '', '', '', '0', 'system', '2018-03-11 16:00:29', 'system', '2018-03-11 16:00:29', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('972744052704342016', '0', '0,', '50', '0000000050,', '1', '0', '自定数据权限', '自定数据权限', '2', 'sys_role_data_scope', '1', '', '', '', '0', 'system', '2018-03-11 16:00:29', 'system', '2018-03-11 16:00:29', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('972744052767256576', '0', '0,', '30', '0000000030,', '1', '0', '高管', '高管', '1', 'sys_post_type', '1', '', '', '', '0', 'system', '2018-03-11 16:00:29', 'system', '2018-03-11 16:00:29', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('972744052846948352', '0', '0,', '40', '0000000040,', '1', '0', '中层', '中层', '2', 'sys_post_type', '1', '', '', '', '0', 'system', '2018-03-11 16:00:29', 'system', '2018-03-11 16:00:29', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('972744052901474304', '0', '0,', '50', '0000000050,', '1', '0', '基层', '基层', '3', 'sys_post_type', '1', '', '', '', '0', 'system', '2018-03-11 16:00:29', 'system', '2018-03-11 16:00:29', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('972744052947611648', '0', '0,', '60', '0000000060,', '1', '0', '其它', '其它', '4', 'sys_post_type', '1', '', '', '', '0', 'system', '2018-03-11 16:00:29', 'system', '2018-03-11 16:00:29', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('972744053010526208', '0', '0,', '30', '0000000030,', '1', '0', '接入日志', '接入日志', 'access', 'sys_log_type', '1', '', '', '', '0', 'system', '2018-03-11 16:00:29', 'system', '2018-03-11 16:00:29', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('972744053069246464', '0', '0,', '40', '0000000040,', '1', '0', '修改日志', '修改日志', 'update', 'sys_log_type', '1', '', '', '', '0', 'system', '2018-03-11 16:00:29', 'system', '2018-03-11 16:00:29', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('972744053127966720', '0', '0,', '50', '0000000050,', '1', '0', '查询日志', '查询日志', 'select', 'sys_log_type', '1', '', '', '', '0', 'system', '2018-03-11 16:00:29', 'system', '2018-03-11 16:00:29', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('972744053195075584', '0', '0,', '60', '0000000060,', '1', '0', '登录登出', '登录登出', 'loginLogout', 'sys_log_type', '1', '', '', '', '0', 'system', '2018-03-11 16:00:29', 'system', '2018-03-11 16:00:29', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('972744053253795840', '0', '0,', '30', '0000000030,', '1', '0', '默认', '默认', 'DEFAULT', 'sys_job_group', '1', '', '', '', '0', 'system', '2018-03-11 16:00:29', 'system', '2018-03-11 16:00:29', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('972744053320904704', '0', '0,', '40', '0000000040,', '1', '0', '系统', '系统', 'SYSTEM', 'sys_job_group', '1', '', '', '', '0', 'system', '2018-03-11 16:00:29', 'system', '2018-03-11 16:00:29', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('972744053396402176', '0', '0,', '30', '0000000030,', '1', '0', '错过计划等待本次计划完成后立即执行一次', '错过计划等待本次计划完成后立即执行一次', '1', 'sys_job_misfire_instruction', '1', '', '', '', '0', 'system', '2018-03-11 16:00:29', 'system', '2018-03-11 16:00:29', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('972744053438345216', '0', '0,', '40', '0000000040,', '1', '0', '本次执行时间根据上次结束时间重新计算（时间间隔方式）', '本次执行时间根据上次结束时间重新计算（时间间隔方式）', '2', 'sys_job_misfire_instruction', '1', '', '', '', '0', 'system', '2018-03-11 16:00:29', 'system', '2018-03-11 16:00:29', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('972744053484482560', '0', '0,', '30', '0000000030,', '1', '0', '正常', '正常', '0', 'sys_job_status', '1', '', '', '', '0', 'system', '2018-03-11 16:00:29', 'system', '2018-03-11 16:00:29', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('972744053522231296', '0', '0,', '40', '0000000040,', '1', '0', '删除', '删除', '1', 'sys_job_status', '1', '', '', '', '0', 'system', '2018-03-11 16:00:29', 'system', '2018-03-11 16:00:29', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('972744053568368640', '0', '0,', '50', '0000000050,', '1', '0', '暂停', '暂停', '2', 'sys_job_status', '1', '', 'color:#f00;', '', '0', 'system', '2018-03-11 16:00:29', 'system', '2018-03-11 16:00:29', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('972744053618700288', '0', '0,', '30', '0000000030,', '1', '0', '完成', '完成', '3', 'sys_job_status', '1', '', '', '', '0', 'system', '2018-03-11 16:00:29', 'system', '2018-03-11 16:00:29', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('972744053677420544', '0', '0,', '40', '0000000040,', '1', '0', '错误', '错误', '4', 'sys_job_status', '1', '', 'color:#f00;', '', '0', 'system', '2018-03-11 16:00:29', 'system', '2018-03-11 16:00:29', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('972744053723557888', '0', '0,', '50', '0000000050,', '1', '0', '运行', '运行', '5', 'sys_job_status', '1', '', '', '', '0', 'system', '2018-03-11 16:00:29', 'system', '2018-03-11 16:00:29', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('972744053782278144', '0', '0,', '30', '0000000030,', '1', '0', '计划日志', '计划日志', 'scheduler', 'sys_job_type', '1', '', '', '', '0', 'system', '2018-03-11 16:00:29', 'system', '2018-03-11 16:00:29', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('972744053853581312', '0', '0,', '40', '0000000040,', '1', '0', '任务日志', '任务日志', 'job', 'sys_job_type', '1', '', '', '', '0', 'system', '2018-03-11 16:00:29', 'system', '2018-03-11 16:00:29', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('972744053912301568', '0', '0,', '50', '0000000050,', '1', '0', '触发日志', '触发日志', 'trigger', 'sys_job_type', '1', '', '', '', '0', 'system', '2018-03-11 16:00:29', 'system', '2018-03-11 16:00:29', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('972744053966827520', '0', '0,', '30', '0000000030,', '1', '0', '计划创建', '计划创建', 'jobScheduled', 'sys_job_event', '1', '', '', '', '0', 'system', '2018-03-11 16:00:29', 'system', '2018-03-11 16:00:29', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('972744054033936384', '0', '0,', '40', '0000000040,', '1', '0', '计划移除', '计划移除', 'jobUnscheduled', 'sys_job_event', '1', '', '', '', '0', 'system', '2018-03-11 16:00:29', 'system', '2018-03-11 16:00:29', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('972744054092656640', '0', '0,', '50', '0000000050,', '1', '0', '计划暂停', '计划暂停', 'triggerPaused', 'sys_job_event', '1', '', '', '', '0', 'system', '2018-03-11 16:00:29', 'system', '2018-03-11 16:00:29', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('972744054159765504', '0', '0,', '60', '0000000060,', '1', '0', '计划恢复', '计划恢复', 'triggerResumed', 'sys_job_event', '1', '', '', '', '0', 'system', '2018-03-11 16:00:29', 'system', '2018-03-11 16:00:29', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('972744054231068672', '0', '0,', '70', '0000000070,', '1', '0', '调度错误', '调度错误', 'schedulerError', 'sys_job_event', '1', '', '', '', '0', 'system', '2018-03-11 16:00:29', 'system', '2018-03-11 16:00:29', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('972744054277206016', '0', '0,', '80', '0000000080,', '1', '0', '任务执行', '任务执行', 'jobToBeExecuted', 'sys_job_event', '1', '', '', '', '0', 'system', '2018-03-11 16:00:29', 'system', '2018-03-11 16:00:29', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('972744054340120576', '0', '0,', '90', '0000000090,', '1', '0', '任务结束', '任务结束', 'jobWasExecuted', 'sys_job_event', '1', '', '', '', '0', 'system', '2018-03-11 16:00:29', 'system', '2018-03-11 16:00:29', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('972744054403035136', '0', '0,', '100', '0000000100,', '1', '0', '任务停止', '任务停止', 'jobExecutionVetoed', 'sys_job_event', '1', '', '', '', '0', 'system', '2018-03-11 16:00:29', 'system', '2018-03-11 16:00:29', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('972744054461755392', '0', '0,', '110', '0000000110,', '1', '0', '触发计划', '触发计划', 'triggerFired', 'sys_job_event', '1', '', '', '', '0', 'system', '2018-03-11 16:00:29', 'system', '2018-03-11 16:00:29', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('972744054524669952', '0', '0,', '120', '0000000120,', '1', '0', '触发验证', '触发验证', 'vetoJobExecution', 'sys_job_event', '1', '', '', '', '0', 'system', '2018-03-11 16:00:29', 'system', '2018-03-11 16:00:29', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('972744054583390208', '0', '0,', '130', '0000000130,', '1', '0', '触发完成', '触发完成', 'triggerComplete', 'sys_job_event', '1', '', '', '', '0', 'system', '2018-03-11 16:00:29', 'system', '2018-03-11 16:00:29', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('972744054642110464', '0', '0,', '140', '0000000140,', '1', '0', '触发错过', '触发错过', 'triggerMisfired', 'sys_job_event', '1', '', '', '', '0', 'system', '2018-03-11 16:00:30', 'system', '2018-03-11 16:00:30', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('972744054700830720', '0', '0,', '30', '0000000030,', '1', '0', 'PC', 'PC', 'pc', 'sys_msg_type', '1', '消息类型', '', '', '0', 'system', '2018-03-11 16:00:30', 'system', '2018-03-11 16:00:30', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('972744054759550976', '0', '0,', '40', '0000000040,', '1', '0', 'APP', 'APP', 'app', 'sys_msg_type', '1', '', '', '', '0', 'system', '2018-03-11 16:00:30', 'system', '2018-03-11 16:00:30', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('972744054822465536', '0', '0,', '50', '0000000050,', '1', '0', '短信', '短信', 'sms', 'sys_msg_type', '1', '', '', '', '0', 'system', '2018-03-11 16:00:30', 'system', '2018-03-11 16:00:30', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('972744054881185792', '0', '0,', '60', '0000000060,', '1', '0', '邮件', '邮件', 'email', 'sys_msg_type', '1', '', '', '', '0', 'system', '2018-03-11 16:00:30', 'system', '2018-03-11 16:00:30', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('972744054944100352', '0', '0,', '70', '0000000070,', '1', '0', '微信', '微信', 'weixin', 'sys_msg_type', '1', '', '', '', '0', 'system', '2018-03-11 16:00:30', 'system', '2018-03-11 16:00:30', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('972744055007014912', '0', '0,', '30', '0000000030,', '1', '0', '成功', '成功', '1', 'sys_msg_push_status', '1', '推送状态', '', '', '0', 'system', '2018-03-11 16:00:30', 'system', '2018-03-11 16:00:30', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('972744055074123776', '0', '0,', '40', '0000000040,', '1', '0', '失败', '失败', '2', 'sys_msg_push_status', '1', '', 'color:#f00;', '', '0', 'system', '2018-03-11 16:00:30', 'system', '2018-03-11 16:00:30', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('972744055145426944', '0', '0,', '30', '0000000030,', '1', '0', '未送达', '未送达', '0', 'sys_msg_read_status', '1', '', '', '', '0', 'system', '2018-03-11 16:00:30', 'system', '2018-03-11 16:00:30', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('972744055212535808', '0', '0,', '40', '0000000040,', '1', '0', '已读', '已读', '1', 'sys_msg_read_status', '1', '', '', '', '0', 'system', '2018-03-11 16:00:30', 'system', '2018-03-11 16:00:30', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('972744055258673152', '0', '0,', '50', '0000000050,', '1', '0', '未读', '未读', '2', 'sys_msg_read_status', '1', '', '', '', '0', 'system', '2018-03-11 16:00:30', 'system', '2018-03-11 16:00:30', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('972744055313199104', '0', '0,', '30', '0000000030,', '1', '0', '普通', '普通', '1', 'msg_inner_content_level', '1', '内容级别', '', '', '0', 'system', '2018-03-11 16:00:30', 'system', '2018-03-11 16:00:30', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('972744055371919360', '0', '0,', '40', '0000000040,', '1', '0', '一般', '一般', '2', 'msg_inner_content_level', '1', '', '', '', '0', 'system', '2018-03-11 16:00:30', 'system', '2018-03-11 16:00:30', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('972744055434833920', '0', '0,', '50', '0000000050,', '1', '0', '紧急', '紧急', '3', 'msg_inner_content_level', '1', '', 'color:#f00;', '', '0', 'system', '2018-03-11 16:00:30', 'system', '2018-03-11 16:00:30', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('972744055497748480', '0', '0,', '30', '0000000030,', '1', '0', '公告', '公告', '1', 'msg_inner_content_type', '1', '内容类型', '', '', '0', 'system', '2018-03-11 16:00:30', 'system', '2018-03-11 16:00:30', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('972744055556468736', '0', '0,', '40', '0000000040,', '1', '0', '新闻', '新闻', '2', 'msg_inner_content_type', '1', '', '', '', '0', 'system', '2018-03-11 16:00:30', 'system', '2018-03-11 16:00:30', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('972744055606800384', '0', '0,', '50', '0000000050,', '1', '0', '会议', '会议', '3', 'msg_inner_content_type', '1', '', '', '', '0', 'system', '2018-03-11 16:00:30', 'system', '2018-03-11 16:00:30', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('972744055699075072', '0', '0,', '60', '0000000060,', '1', '0', '其它', '其它', '4', 'msg_inner_content_type', '1', '', '', '', '0', 'system', '2018-03-11 16:00:30', 'system', '2018-03-11 16:00:30', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('972744055766183936', '0', '0,', '30', '0000000030,', '1', '0', '用户', '用户', '1', 'msg_inner_receiver_type', '1', '接受类型', '', '', '0', 'system', '2018-03-11 16:00:30', 'system', '2018-03-11 16:00:30', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('972744055812321280', '0', '0,', '40', '0000000040,', '1', '0', '部门', '部门', '2', 'msg_inner_receiver_type', '1', '', '', '', '0', 'system', '2018-03-11 16:00:30', 'system', '2018-03-11 16:00:30', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('972744055883624448', '0', '0,', '50', '0000000050,', '1', '0', '角色', '角色', '3', 'msg_inner_receiver_type', '1', '', '', '', '0', 'system', '2018-03-11 16:00:30', 'system', '2018-03-11 16:00:30', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('972744055950733312', '0', '0,', '60', '0000000060,', '1', '0', '岗位', '岗位', '4', 'msg_inner_receiver_type', '1', '', '', '', '0', 'system', '2018-03-11 16:00:30', 'system', '2018-03-11 16:00:30', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('972744056273694720', '0', '0,', '30', '0000000030,', '1', '0', '正常', '正常', '0', 'msg_inner_msg_status', '1', '消息状态', '', '', '0', 'system', '2018-03-11 16:00:30', 'system', '2018-03-11 16:00:30', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('972744056336609280', '0', '0,', '40', '0000000040,', '1', '0', '删除', '删除', '1', 'msg_inner_msg_status', '1', '', '', '', '0', 'system', '2018-03-11 16:00:30', 'system', '2018-03-11 16:00:30', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('972744056395329536', '0', '0,', '50', '0000000050,', '1', '0', '审核', '审核', '4', 'msg_inner_msg_status', '1', '', '', '', '0', 'system', '2018-03-11 16:00:30', 'system', '2018-03-11 16:00:30', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('972744056483409920', '0', '0,', '60', '0000000060,', '1', '0', '驳回', '驳回', '5', 'msg_inner_msg_status', '1', '', 'color:#f00;', '', '0', 'system', '2018-03-11 16:00:30', 'system', '2018-03-11 16:00:30', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('972744056563101696', '0', '0,', '70', '0000000070,', '1', '0', '草稿', '草稿', '9', 'msg_inner_msg_status', '1', '', '', '', '0', 'system', '2018-03-11 16:00:30', 'system', '2018-03-11 16:00:30', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for js_sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `js_sys_dict_type`;
CREATE TABLE `js_sys_dict_type` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `dict_name` varchar(100) NOT NULL COMMENT '字典名称',
  `dict_type` varchar(100) NOT NULL COMMENT '字典类型',
  `is_sys` char(1) NOT NULL COMMENT '是否系统字典',
  `status` char(1) NOT NULL DEFAULT '0' COMMENT '状态（0正常 1删除 2停用）',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `remarks` varchar(500) DEFAULT NULL COMMENT '备注信息',
  PRIMARY KEY (`id`),
  UNIQUE KEY `dict_type` (`dict_type`),
  KEY `idx_sys_dict_type_is` (`is_sys`),
  KEY `idx_sys_dict_type_status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='字典类型表';

-- ----------------------------
-- Records of js_sys_dict_type
-- ----------------------------
INSERT INTO `js_sys_dict_type` VALUES ('972744047536959488', '是否', 'sys_yes_no', '1', '0', 'system', '2018-03-11 16:00:28', 'system', '2018-03-11 16:00:28', null);
INSERT INTO `js_sys_dict_type` VALUES ('972744047662788608', '状态', 'sys_status', '1', '0', 'system', '2018-03-11 16:00:28', 'system', '2018-03-11 16:00:28', null);
INSERT INTO `js_sys_dict_type` VALUES ('972744047692148736', '显示隐藏', 'sys_show_hide', '1', '0', 'system', '2018-03-11 16:00:28', 'system', '2018-03-11 16:00:28', null);
INSERT INTO `js_sys_dict_type` VALUES ('972744047721508864', '国际化语言类型', 'sys_lang_type', '1', '0', 'system', '2018-03-11 16:00:28', 'system', '2018-03-11 16:00:28', null);
INSERT INTO `js_sys_dict_type` VALUES ('972744047742480384', '客户端设备类型', 'sys_device_type', '1', '0', 'system', '2018-03-11 16:00:28', 'system', '2018-03-11 16:00:28', null);
INSERT INTO `js_sys_dict_type` VALUES ('972744047763451904', '菜单归属系统', 'sys_menu_sys_code', '1', '0', 'system', '2018-03-11 16:00:28', 'system', '2018-03-11 16:00:28', null);
INSERT INTO `js_sys_dict_type` VALUES ('972744047809589248', '菜单类型', 'sys_menu_type', '1', '0', 'system', '2018-03-11 16:00:28', 'system', '2018-03-11 16:00:28', null);
INSERT INTO `js_sys_dict_type` VALUES ('972744047977361408', '菜单权重', 'sys_menu_weight', '1', '0', 'system', '2018-03-11 16:00:28', 'system', '2018-03-11 16:00:28', null);
INSERT INTO `js_sys_dict_type` VALUES ('972744048019304448', '区域类型', 'sys_area_type', '1', '0', 'system', '2018-03-11 16:00:28', 'system', '2018-03-11 16:00:28', null);
INSERT INTO `js_sys_dict_type` VALUES ('972744048036081664', '机构类型', 'sys_office_type', '1', '0', 'system', '2018-03-11 16:00:28', 'system', '2018-03-11 16:00:28', null);
INSERT INTO `js_sys_dict_type` VALUES ('972744048052858880', '查询状态', 'sys_search_status', '1', '0', 'system', '2018-03-11 16:00:28', 'system', '2018-03-11 16:00:28', null);
INSERT INTO `js_sys_dict_type` VALUES ('972744048090607616', '用户性别', 'sys_user_sex', '1', '0', 'system', '2018-03-11 16:00:28', 'system', '2018-03-11 16:00:28', null);
INSERT INTO `js_sys_dict_type` VALUES ('972744048107384832', '用户状态', 'sys_user_status', '1', '0', 'system', '2018-03-11 16:00:28', 'system', '2018-03-11 16:00:28', null);
INSERT INTO `js_sys_dict_type` VALUES ('972744048128356352', '用户类型', 'sys_user_type', '1', '0', 'system', '2018-03-11 16:00:28', 'system', '2018-03-11 16:00:28', null);
INSERT INTO `js_sys_dict_type` VALUES ('972744048157716480', '角色分类', 'sys_role_type', '1', '0', 'system', '2018-03-11 16:00:28', 'system', '2018-03-11 16:00:28', null);
INSERT INTO `js_sys_dict_type` VALUES ('972744048178688000', '角色数据范围', 'sys_role_data_scope', '1', '0', 'system', '2018-03-11 16:00:28', 'system', '2018-03-11 16:00:28', null);
INSERT INTO `js_sys_dict_type` VALUES ('972744048212242432', '岗位分类', 'sys_post_type', '1', '0', 'system', '2018-03-11 16:00:28', 'system', '2018-03-11 16:00:28', null);
INSERT INTO `js_sys_dict_type` VALUES ('972744048237408256', '日志类型', 'sys_log_type', '1', '0', 'system', '2018-03-11 16:00:28', 'system', '2018-03-11 16:00:28', null);
INSERT INTO `js_sys_dict_type` VALUES ('972744048254185472', '作业分组', 'sys_job_group', '1', '0', 'system', '2018-03-11 16:00:28', 'system', '2018-03-11 16:00:28', null);
INSERT INTO `js_sys_dict_type` VALUES ('972744048287739904', '作业错过策略', 'sys_job_misfire_instruction', '1', '0', 'system', '2018-03-11 16:00:28', 'system', '2018-03-11 16:00:28', null);
INSERT INTO `js_sys_dict_type` VALUES ('972744048317100032', '作业状态', 'sys_job_status', '1', '0', 'system', '2018-03-11 16:00:28', 'system', '2018-03-11 16:00:28', null);
INSERT INTO `js_sys_dict_type` VALUES ('972744048338071552', '作业任务类型', 'sys_job_type', '1', '0', 'system', '2018-03-11 16:00:28', 'system', '2018-03-11 16:00:28', null);
INSERT INTO `js_sys_dict_type` VALUES ('972744048380014592', '作业任务事件', 'sys_job_event', '1', '0', 'system', '2018-03-11 16:00:28', 'system', '2018-03-11 16:00:28', null);
INSERT INTO `js_sys_dict_type` VALUES ('972744048400986112', '消息类型', 'sys_msg_type', '1', '0', 'system', '2018-03-11 16:00:28', 'system', '2018-03-11 16:00:28', null);
INSERT INTO `js_sys_dict_type` VALUES ('972744048430346240', '推送状态', 'sys_msg_push_status', '1', '0', 'system', '2018-03-11 16:00:28', 'system', '2018-03-11 16:00:28', null);
INSERT INTO `js_sys_dict_type` VALUES ('972744048459706368', '读取状态', 'sys_msg_read_status', '1', '0', 'system', '2018-03-11 16:00:28', 'system', '2018-03-11 16:00:28', null);

-- ----------------------------
-- Table structure for js_sys_employee
-- ----------------------------
DROP TABLE IF EXISTS `js_sys_employee`;
CREATE TABLE `js_sys_employee` (
  `emp_code` varchar(64) NOT NULL COMMENT '员工编码',
  `emp_name` varchar(100) NOT NULL COMMENT '员工姓名',
  `emp_name_en` varchar(100) DEFAULT NULL COMMENT '英文名',
  `office_code` varchar(64) NOT NULL COMMENT '机构编码',
  `office_name` varchar(100) NOT NULL COMMENT '机构名称',
  `company_code` varchar(64) DEFAULT NULL COMMENT '公司编码',
  `company_name` varchar(200) DEFAULT NULL COMMENT '公司名称',
  `status` char(1) NOT NULL COMMENT '状态（0在职 1删除 2离职）',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `remarks` varchar(500) DEFAULT NULL COMMENT '备注信息',
  `corp_code` varchar(64) NOT NULL DEFAULT '0' COMMENT '归属集团Code',
  `corp_name` varchar(100) NOT NULL DEFAULT 'JeeSite' COMMENT '归属集团Name',
  PRIMARY KEY (`emp_code`),
  KEY `idx_sys_employee_cco` (`company_code`),
  KEY `idx_sys_employee_cc` (`corp_code`),
  KEY `idx_sys_employee_ud` (`update_date`),
  KEY `idx_sys_employee_oc` (`office_code`),
  KEY `idx_sys_employee_status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='员工表';

-- ----------------------------
-- Records of js_sys_employee
-- ----------------------------

-- ----------------------------
-- Table structure for js_sys_employee_post
-- ----------------------------
DROP TABLE IF EXISTS `js_sys_employee_post`;
CREATE TABLE `js_sys_employee_post` (
  `emp_code` varchar(64) NOT NULL COMMENT '员工编码',
  `post_code` varchar(64) NOT NULL COMMENT '岗位编码',
  PRIMARY KEY (`emp_code`,`post_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='员工与岗位关联表';

-- ----------------------------
-- Records of js_sys_employee_post
-- ----------------------------

-- ----------------------------
-- Table structure for js_sys_file_entity
-- ----------------------------
DROP TABLE IF EXISTS `js_sys_file_entity`;
CREATE TABLE `js_sys_file_entity` (
  `file_id` varchar(64) NOT NULL COMMENT '文件编号',
  `file_md5` varchar(64) NOT NULL COMMENT '文件MD5',
  `file_path` varchar(1000) NOT NULL COMMENT '文件相对路径',
  `file_content_type` varchar(200) NOT NULL COMMENT '文件内容类型',
  `file_extension` varchar(100) NOT NULL COMMENT '文件后缀扩展名',
  `file_size` decimal(38,0) NOT NULL COMMENT '文件大小(单位B)',
  PRIMARY KEY (`file_id`),
  UNIQUE KEY `file_md5` (`file_md5`),
  KEY `idx_sys_file_entity_md5` (`file_md5`),
  KEY `idx_sys_file_entity_size` (`file_size`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='文件实体表';

-- ----------------------------
-- Records of js_sys_file_entity
-- ----------------------------

-- ----------------------------
-- Table structure for js_sys_file_upload
-- ----------------------------
DROP TABLE IF EXISTS `js_sys_file_upload`;
CREATE TABLE `js_sys_file_upload` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `file_id` varchar(64) NOT NULL COMMENT '文件编号',
  `file_name` varchar(500) NOT NULL COMMENT '文件名称',
  `file_type` varchar(20) NOT NULL COMMENT '文件分类（image、media、file）',
  `biz_key` varchar(64) DEFAULT NULL COMMENT '业务主键',
  `biz_type` varchar(64) DEFAULT NULL COMMENT '业务类型',
  `status` char(1) NOT NULL DEFAULT '0' COMMENT '状态（0正常 1删除 2停用）',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `remarks` varchar(500) DEFAULT NULL COMMENT '备注信息',
  PRIMARY KEY (`id`),
  KEY `idx_sys_file_biz_ft` (`file_type`),
  KEY `idx_sys_file_biz_fi` (`file_id`),
  KEY `idx_sys_file_biz_status` (`status`),
  KEY `idx_sys_file_biz_cb` (`create_by`),
  KEY `idx_sys_file_biz_ud` (`update_date`),
  KEY `idx_sys_file_biz_bt` (`biz_type`),
  KEY `idx_sys_file_biz_bk` (`biz_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='文件上传表';

-- ----------------------------
-- Records of js_sys_file_upload
-- ----------------------------

-- ----------------------------
-- Table structure for js_sys_job
-- ----------------------------
DROP TABLE IF EXISTS `js_sys_job`;
CREATE TABLE `js_sys_job` (
  `job_name` varchar(64) NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) NOT NULL COMMENT '任务组名',
  `description` varchar(100) NOT NULL COMMENT '任务描述',
  `invoke_target` varchar(1000) NOT NULL COMMENT '调用目标字符串',
  `cron_expression` varchar(255) NOT NULL COMMENT 'Cron执行表达式',
  `misfire_instruction` decimal(1,0) NOT NULL COMMENT '计划执行错误策略',
  `concurrent` char(1) NOT NULL COMMENT '是否并发执行',
  `status` char(1) NOT NULL COMMENT '状态（0正常 1删除 2暂停）',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `remarks` varchar(500) DEFAULT NULL COMMENT '备注信息',
  PRIMARY KEY (`job_name`,`job_group`),
  KEY `idx_sys_job_status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='作业调度表';

-- ----------------------------
-- Records of js_sys_job
-- ----------------------------

-- ----------------------------
-- Table structure for js_sys_job_log
-- ----------------------------
DROP TABLE IF EXISTS `js_sys_job_log`;
CREATE TABLE `js_sys_job_log` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `job_name` varchar(64) NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) NOT NULL COMMENT '任务组名',
  `job_type` varchar(50) DEFAULT NULL COMMENT '日志类型',
  `job_event` varchar(200) DEFAULT NULL COMMENT '日志事件',
  `job_message` varchar(500) DEFAULT NULL COMMENT '日志信息',
  `is_exception` char(1) DEFAULT NULL COMMENT '是否异常',
  `exception_info` text COMMENT '异常信息',
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `idx_sys_job_log_jn` (`job_name`),
  KEY `idx_sys_job_log_jg` (`job_group`),
  KEY `idx_sys_job_log_t` (`job_type`),
  KEY `idx_sys_job_log_e` (`job_event`),
  KEY `idx_sys_job_log_ie` (`is_exception`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='作业调度日志表';

-- ----------------------------
-- Records of js_sys_job_log
-- ----------------------------

-- ----------------------------
-- Table structure for js_sys_lang
-- ----------------------------
DROP TABLE IF EXISTS `js_sys_lang`;
CREATE TABLE `js_sys_lang` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `module_code` varchar(64) NOT NULL COMMENT '归属模块',
  `lang_code` varchar(500) NOT NULL COMMENT '语言编码',
  `lang_text` varchar(500) NOT NULL COMMENT '语言译文',
  `lang_type` varchar(50) NOT NULL COMMENT '语言类型',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `remarks` varchar(500) DEFAULT NULL COMMENT '备注信息',
  PRIMARY KEY (`id`),
  KEY `idx_sys_lang_code` (`lang_code`(255)),
  KEY `idx_sys_lang_type` (`lang_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='国际化语言';

-- ----------------------------
-- Records of js_sys_lang
-- ----------------------------

-- ----------------------------
-- Table structure for js_sys_log
-- ----------------------------
DROP TABLE IF EXISTS `js_sys_log`;
CREATE TABLE `js_sys_log` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `log_type` varchar(50) NOT NULL COMMENT '日志类型',
  `log_title` varchar(500) NOT NULL COMMENT '日志标题',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_by_name` varchar(100) NOT NULL COMMENT '用户名称',
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `request_uri` varchar(500) DEFAULT NULL COMMENT '请求URI',
  `request_method` varchar(10) DEFAULT NULL COMMENT '操作方式',
  `request_params` longtext COMMENT '操作提交的数据',
  `diff_modify_data` text COMMENT '新旧数据比较结果',
  `biz_key` varchar(64) DEFAULT NULL COMMENT '业务主键',
  `biz_type` varchar(64) DEFAULT NULL COMMENT '业务类型',
  `remote_addr` varchar(255) NOT NULL COMMENT '操作IP地址',
  `server_addr` varchar(255) NOT NULL COMMENT '请求服务器地址',
  `is_exception` char(1) DEFAULT NULL COMMENT '是否异常',
  `exception_info` text COMMENT '异常信息',
  `user_agent` varchar(500) DEFAULT NULL COMMENT '用户代理',
  `device_name` varchar(100) DEFAULT NULL COMMENT '设备名称/操作系统',
  `browser_name` varchar(100) DEFAULT NULL COMMENT '浏览器名称',
  `corp_code` varchar(64) NOT NULL DEFAULT '0' COMMENT '归属集团Code',
  `corp_name` varchar(100) NOT NULL DEFAULT 'JeeSite' COMMENT '归属集团Name',
  PRIMARY KEY (`id`),
  KEY `idx_sys_log_cb` (`create_by`),
  KEY `idx_sys_log_cc` (`corp_code`),
  KEY `idx_sys_log_lt` (`log_type`),
  KEY `idx_sys_log_bk` (`biz_key`),
  KEY `idx_sys_log_bt` (`biz_type`),
  KEY `idx_sys_log_ie` (`is_exception`),
  KEY `idx_sys_log_cd` (`create_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='操作日志表';

-- ----------------------------
-- Records of js_sys_log
-- ----------------------------
INSERT INTO `js_sys_log` VALUES ('972748035865997312', 'access', '系统管理/研发工具/代码生成工具', 'system', '超级管理员', '2018-03-11 16:16:19', '/a/gen/genTable/list', 'GET', '', null, '', 'GenTable', '127.0.0.1', 'http://127.0.0.1:8080', '0', '', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.89 Safari/537.36', 'Windows 10', 'Chrome', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('972748036918767616', 'select', '系统管理/研发工具/代码生成工具', 'system', '超级管理员', '2018-03-11 16:16:19', '/a/gen/genTable/listData', 'POST', 'parentTableName_isNull=&tableName_like=&comments=&pageNo=&pageSize=&orderBy=', null, '', 'GenTable', '127.0.0.1', 'http://127.0.0.1:8080', '0', '', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.89 Safari/537.36', 'Windows 10', 'Chrome', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('972748056061571072', 'access', '系统管理/研发工具/代码生成工具', 'system', '超级管理员', '2018-03-11 16:16:24', '/a/gen/genTable/list', 'GET', '', null, '', 'GenTable', '127.0.0.1', 'http://127.0.0.1:8080', '0', '', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.89 Safari/537.36', 'Windows 10', 'Chrome', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('972748058037088256', 'select', '系统管理/研发工具/代码生成工具', 'system', '超级管理员', '2018-03-11 16:16:24', '/a/gen/genTable/listData', 'POST', 'parentTableName_isNull=&tableName_like=&comments=&pageNo=&pageSize=&orderBy=', null, '', 'GenTable', '127.0.0.1', 'http://127.0.0.1:8080', '0', '', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.89 Safari/537.36', 'Windows 10', 'Chrome', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('972748114249150464', 'access', '系统管理/组织管理/用户管理', 'system', '超级管理员', '2018-03-11 16:16:37', '/a/sys/empUser/index', 'GET', '', null, '', 'EmpUser', '127.0.0.1', 'http://127.0.0.1:8080', '0', '', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.89 Safari/537.36', 'Windows 10', 'Chrome', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('972748114534363136', 'select', '系统管理/组织管理/用户管理/查看', 'system', '超级管理员', '2018-03-11 16:16:37', '/a/sys/empUser/list', 'GET', '', null, '', 'EmpUser', '127.0.0.1', 'http://127.0.0.1:8080', '0', '', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.89 Safari/537.36', 'Windows 10', 'Chrome', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('972748115817820160', 'select', '系统管理/组织管理/用户管理', 'system', '超级管理员', '2018-03-11 16:16:38', '/a/sys/empUser/listData', 'POST', 'loginCode=&userName=&email=&mobile=&phone=&refName=&employee.office.officeCode=&employee.office.officeName=&employee.company.companyCode=&employee.company.companyName=&employee.postCode=&status=&pageNo=&pageSize=&orderBy=', null, '', 'EmpUser', '127.0.0.1', 'http://127.0.0.1:8080', '0', '', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.89 Safari/537.36', 'Windows 10', 'Chrome', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('972748129088598016', 'access', '系统管理/组织管理/机构管理', 'system', '超级管理员', '2018-03-11 16:16:41', '/a/sys/office/list', 'GET', '', null, '', 'Office', '127.0.0.1', 'http://127.0.0.1:8080', '0', '', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.89 Safari/537.36', 'Windows 10', 'Chrome', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('972748129696772096', 'select', '系统管理/组织管理/机构管理', 'system', '超级管理员', '2018-03-11 16:16:41', '/a/sys/office/listData', 'POST', 'viewCode=&officeName=&fullName=&officeType=&status=&pageNo=&pageSize=&orderBy=', null, '', 'Office', '127.0.0.1', 'http://127.0.0.1:8080', '0', '', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.89 Safari/537.36', 'Windows 10', 'Chrome', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('972748139561775104', 'access', '系统管理/组织管理/公司管理', 'system', '超级管理员', '2018-03-11 16:16:43', '/a/sys/company/list', 'GET', '', null, '', 'Company', '127.0.0.1', 'http://127.0.0.1:8080', '0', '', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.89 Safari/537.36', 'Windows 10', 'Chrome', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('972748140249640960', 'select', '系统管理/组织管理/公司管理', 'system', '超级管理员', '2018-03-11 16:16:44', '/a/sys/company/listData', 'POST', 'viewCode=&companyName=&fullName=&status=&pageNo=&pageSize=&orderBy=', null, '', 'Company', '127.0.0.1', 'http://127.0.0.1:8080', '0', '', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.89 Safari/537.36', 'Windows 10', 'Chrome', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('972755031290298368', 'access', '系统管理/系统监控/在线用户', 'system', '超级管理员', '2018-03-11 16:44:07', '/a/sys/online/list', 'GET', '', null, null, null, '127.0.0.1', 'http://127.0.0.1:8080', '0', '', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.89 Safari/537.36', 'Windows 10', 'Chrome', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('972755034842873856', 'access', '系统管理/系统监控/在线用户', 'system', '超级管理员', '2018-03-11 16:44:07', '/a/sys/online/listData', 'POST', 'userCode=&_isAllOnline=0&_isVisitor=0&pageNo=&pageSize=&orderBy=', null, null, null, '127.0.0.1', 'http://127.0.0.1:8080', '0', '', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.89 Safari/537.36', 'Windows 10', 'Chrome', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('972755042329706496', 'access', '系统管理/系统监控/在线用户', 'system', '超级管理员', '2018-03-11 16:44:09', '/a/sys/online/listData', 'POST', 'userCode=&_isAllOnline=0&_isVisitor=0&pageNo=&pageSize=&orderBy=lastAccessTime asc', null, null, null, '127.0.0.1', 'http://127.0.0.1:8080', '0', '', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.89 Safari/537.36', 'Windows 10', 'Chrome', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('972755066270793728', 'access', '系统管理/组织管理/用户管理', 'system', '超级管理员', '2018-03-11 16:44:15', '/a/sys/empUser/index', 'GET', '', null, '', 'EmpUser', '127.0.0.1', 'http://127.0.0.1:8080', '0', '', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.89 Safari/537.36', 'Windows 10', 'Chrome', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('972755070754504704', 'select', '系统管理/组织管理/用户管理/查看', 'system', '超级管理员', '2018-03-11 16:44:16', '/a/sys/empUser/list', 'GET', '', null, '', 'EmpUser', '127.0.0.1', 'http://127.0.0.1:8080', '0', '', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.89 Safari/537.36', 'Windows 10', 'Chrome', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('972755073682128896', 'select', '系统管理/组织管理/用户管理', 'system', '超级管理员', '2018-03-11 16:44:17', '/a/sys/empUser/listData', 'POST', 'loginCode=&userName=&email=&mobile=&phone=&refName=&employee.office.officeCode=&employee.office.officeName=&employee.company.companyCode=&employee.company.companyName=&employee.postCode=&status=&pageNo=&pageSize=&orderBy=', null, '', 'EmpUser', '127.0.0.1', 'http://127.0.0.1:8080', '0', '', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.89 Safari/537.36', 'Windows 10', 'Chrome', '0', 'JeeSite');

-- ----------------------------
-- Table structure for js_sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `js_sys_menu`;
CREATE TABLE `js_sys_menu` (
  `menu_code` varchar(64) NOT NULL COMMENT '菜单编码',
  `parent_code` varchar(64) NOT NULL COMMENT '父级编号',
  `parent_codes` varchar(2000) NOT NULL COMMENT '所有父级编号',
  `tree_sort` decimal(10,0) NOT NULL COMMENT '本级排序号（升序）',
  `tree_sorts` varchar(1200) NOT NULL COMMENT '所有级别排序号',
  `tree_leaf` char(1) NOT NULL COMMENT '是否最末级',
  `tree_level` decimal(4,0) NOT NULL COMMENT '层次级别',
  `tree_names` varchar(2000) NOT NULL COMMENT '全节点名',
  `menu_name` varchar(100) NOT NULL COMMENT '菜单名称',
  `menu_type` char(1) NOT NULL COMMENT '菜单类型（1菜单 2权限 3开发）',
  `menu_href` varchar(2000) DEFAULT NULL COMMENT '链接',
  `menu_target` varchar(20) DEFAULT NULL COMMENT '目标',
  `menu_icon` varchar(100) DEFAULT NULL COMMENT '图标',
  `menu_color` varchar(50) DEFAULT NULL COMMENT '颜色',
  `permission` varchar(2000) DEFAULT NULL COMMENT '权限标识',
  `weight` decimal(4,0) DEFAULT NULL COMMENT '菜单权重',
  `is_show` char(1) NOT NULL COMMENT '是否显示（1显示 0隐藏）',
  `sys_code` varchar(64) NOT NULL COMMENT '归属系统（default:主导航菜单、mobileApp:APP菜单）',
  `module_codes` varchar(500) NOT NULL COMMENT '归属模块（多个用逗号隔开）',
  `status` char(1) NOT NULL DEFAULT '0' COMMENT '状态（0正常 1删除 2停用）',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `remarks` varchar(500) DEFAULT NULL COMMENT '备注信息',
  `extend_s1` varchar(500) DEFAULT NULL COMMENT '扩展 String 1',
  `extend_s2` varchar(500) DEFAULT NULL COMMENT '扩展 String 2',
  `extend_s3` varchar(500) DEFAULT NULL COMMENT '扩展 String 3',
  `extend_s4` varchar(500) DEFAULT NULL COMMENT '扩展 String 4',
  `extend_s5` varchar(500) DEFAULT NULL COMMENT '扩展 String 5',
  `extend_s6` varchar(500) DEFAULT NULL COMMENT '扩展 String 6',
  `extend_s7` varchar(500) DEFAULT NULL COMMENT '扩展 String 7',
  `extend_s8` varchar(500) DEFAULT NULL COMMENT '扩展 String 8',
  `extend_i1` decimal(19,0) DEFAULT NULL COMMENT '扩展 Integer 1',
  `extend_i2` decimal(19,0) DEFAULT NULL COMMENT '扩展 Integer 2',
  `extend_i3` decimal(19,0) DEFAULT NULL COMMENT '扩展 Integer 3',
  `extend_i4` decimal(19,0) DEFAULT NULL COMMENT '扩展 Integer 4',
  `extend_f1` decimal(19,4) DEFAULT NULL COMMENT '扩展 Float 1',
  `extend_f2` decimal(19,4) DEFAULT NULL COMMENT '扩展 Float 2',
  `extend_f3` decimal(19,4) DEFAULT NULL COMMENT '扩展 Float 3',
  `extend_f4` decimal(19,4) DEFAULT NULL COMMENT '扩展 Float 4',
  `extend_d1` datetime DEFAULT NULL COMMENT '扩展 Date 1',
  `extend_d2` datetime DEFAULT NULL COMMENT '扩展 Date 2',
  `extend_d3` datetime DEFAULT NULL COMMENT '扩展 Date 3',
  `extend_d4` datetime DEFAULT NULL COMMENT '扩展 Date 4',
  PRIMARY KEY (`menu_code`),
  KEY `idx_sys_menu_pc` (`parent_code`),
  KEY `idx_sys_menu_ts` (`tree_sort`),
  KEY `idx_sys_menu_status` (`status`),
  KEY `idx_sys_menu_mt` (`menu_type`),
  KEY `idx_sys_menu_pss` (`parent_codes`(255)),
  KEY `idx_sys_menu_tss` (`tree_sorts`(255)),
  KEY `idx_sys_menu_sc` (`sys_code`),
  KEY `idx_sys_menu_is` (`is_show`),
  KEY `idx_sys_menu_mcs` (`module_codes`(255))
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='菜单表';

-- ----------------------------
-- Records of js_sys_menu
-- ----------------------------
INSERT INTO `js_sys_menu` VALUES ('972744059415228416', '0', '0,', '9000', '0000009000,', '0', '0', '系统管理', '系统管理', '1', '', '', 'icon-settings', '', '', '40', '1', 'default', 'core', '0', 'system', '2018-03-11 16:42:06', 'system', '2018-03-11 16:42:06', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_menu` VALUES ('972744059608166400', '972744059415228416', '0,972744059415228416,', '300', '0000009000,0000000300,', '0', '1', '系统管理/组织管理', '组织管理', '1', '', '', 'icon-grid', '', '', '40', '1', 'default', 'core', '0', 'system', '2018-03-11 16:42:06', 'system', '2018-03-11 16:42:06', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_menu` VALUES ('972744059729801216', '972744059608166400', '0,972744059415228416,972744059608166400,', '40', '0000009000,0000000300,0000000040,', '0', '2', '系统管理/组织管理/用户管理', '用户管理', '1', '/sys/empUser/index', '', 'icon-user', '', '', '40', '1', 'default', 'core', '0', 'system', '2018-03-11 16:42:06', 'system', '2018-03-11 16:42:06', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_menu` VALUES ('972744059855630336', '972744059729801216', '0,972744059415228416,972744059608166400,972744059729801216,', '30', '0000009000,0000000300,0000000040,0000000030,', '1', '3', '系统管理/组织管理/用户管理/查看', '查看', '2', '', '', '', '', 'sys:empUser:view', '40', '1', 'default', 'core', '0', 'system', '2018-03-11 16:42:06', 'system', '2018-03-11 16:42:06', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_menu` VALUES ('972744060002430976', '972744059729801216', '0,972744059415228416,972744059608166400,972744059729801216,', '40', '0000009000,0000000300,0000000040,0000000040,', '1', '3', '系统管理/组织管理/用户管理/编辑', '编辑', '2', '', '', '', '', 'sys:empUser:edit', '40', '1', 'default', 'core', '0', 'system', '2018-03-11 16:42:06', 'system', '2018-03-11 16:42:06', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_menu` VALUES ('972744060140843008', '972744059729801216', '0,972744059415228416,972744059608166400,972744059729801216,', '60', '0000009000,0000000300,0000000040,0000000060,', '1', '3', '系统管理/组织管理/用户管理/分配角色', '分配角色', '2', '', '', '', '', 'sys:empUser:authRole', '40', '1', 'default', 'core', '0', 'system', '2018-03-11 16:42:06', 'system', '2018-03-11 16:42:06', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_menu` VALUES ('972744060270866432', '972744059729801216', '0,972744059415228416,972744059608166400,972744059729801216,', '50', '0000009000,0000000300,0000000040,0000000050,', '1', '3', '系统管理/组织管理/用户管理/分配数据', '分配数据', '2', '', '', '', '', 'sys:empUser:authDataScope', '40', '1', 'default', 'core', '0', 'system', '2018-03-11 16:42:06', 'system', '2018-03-11 16:42:06', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_menu` VALUES ('972744060400889856', '972744059729801216', '0,972744059415228416,972744059608166400,972744059729801216,', '60', '0000009000,0000000300,0000000040,0000000060,', '1', '3', '系统管理/组织管理/用户管理/停用启用', '停用启用', '2', '', '', '', '', 'sys:empUser:updateStatus', '40', '1', 'default', 'core', '0', 'system', '2018-03-11 16:42:06', 'system', '2018-03-11 16:42:06', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_menu` VALUES ('972744060539301888', '972744059729801216', '0,972744059415228416,972744059608166400,972744059729801216,', '70', '0000009000,0000000300,0000000040,0000000070,', '1', '3', '系统管理/组织管理/用户管理/重置密码', '重置密码', '2', '', '', '', '', 'sys:empUser:resetpwd', '40', '1', 'default', 'core', '0', 'system', '2018-03-11 16:42:06', 'system', '2018-03-11 16:42:06', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_menu` VALUES ('972744060686102528', '972744059608166400', '0,972744059415228416,972744059608166400,', '50', '0000009000,0000000300,0000000050,', '0', '2', '系统管理/组织管理/机构管理', '机构管理', '1', '/sys/office/list', '', 'icon-grid', '', '', '60', '1', 'default', 'core', '0', 'system', '2018-03-11 16:42:06', 'system', '2018-03-11 16:42:06', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_menu` VALUES ('972744060816125952', '972744060686102528', '0,972744059415228416,972744059608166400,972744060686102528,', '30', '0000009000,0000000300,0000000050,0000000030,', '1', '3', '系统管理/组织管理/机构管理/查看', '查看', '2', '', '', '', '', 'sys:office:view', '60', '1', 'default', 'core', '0', 'system', '2018-03-11 16:42:06', 'system', '2018-03-11 16:42:06', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_menu` VALUES ('972744060950343680', '972744060686102528', '0,972744059415228416,972744059608166400,972744060686102528,', '40', '0000009000,0000000300,0000000050,0000000040,', '1', '3', '系统管理/组织管理/机构管理/编辑', '编辑', '2', '', '', '', '', 'sys:office:edit', '60', '1', 'default', 'core', '0', 'system', '2018-03-11 16:42:06', 'system', '2018-03-11 16:42:06', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_menu` VALUES ('972744061063589888', '972744059608166400', '0,972744059415228416,972744059608166400,', '70', '0000009000,0000000300,0000000070,', '0', '2', '系统管理/组织管理/公司管理', '公司管理', '1', '/sys/company/list', '', 'icon-fire', '', '', '60', '1', 'default', 'core', '0', 'system', '2018-03-11 16:42:06', 'system', '2018-03-11 16:42:06', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_menu` VALUES ('972744061197807616', '972744061063589888', '0,972744059415228416,972744059608166400,972744061063589888,', '30', '0000009000,0000000300,0000000070,0000000030,', '1', '3', '系统管理/组织管理/公司管理/查看', '查看', '2', '', '', '', '', 'sys:company:view', '60', '1', 'default', 'core', '0', 'system', '2018-03-11 16:42:06', 'system', '2018-03-11 16:42:06', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_menu` VALUES ('972744061336219648', '972744061063589888', '0,972744059415228416,972744059608166400,972744061063589888,', '40', '0000009000,0000000300,0000000070,0000000040,', '1', '3', '系统管理/组织管理/公司管理/编辑', '编辑', '2', '', '', '', '', 'sys:company:edit', '60', '1', 'default', 'core', '0', 'system', '2018-03-11 16:42:06', 'system', '2018-03-11 16:42:06', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_menu` VALUES ('972744061491408896', '972744059608166400', '0,972744059415228416,972744059608166400,', '70', '0000009000,0000000300,0000000070,', '0', '2', '系统管理/组织管理/岗位管理', '岗位管理', '1', '/sys/post/list', '', 'icon-trophy', '', '', '60', '1', 'default', 'core', '0', 'system', '2018-03-11 16:42:06', 'system', '2018-03-11 16:42:06', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_menu` VALUES ('972744061604655104', '972744061491408896', '0,972744059415228416,972744059608166400,972744061491408896,', '30', '0000009000,0000000300,0000000070,0000000030,', '1', '3', '系统管理/组织管理/岗位管理/查看', '查看', '2', '', '', '', '', 'sys:post:view', '60', '1', 'default', 'core', '0', 'system', '2018-03-11 16:42:06', 'system', '2018-03-11 16:42:06', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_menu` VALUES ('972744061730484224', '972744061491408896', '0,972744059415228416,972744059608166400,972744061491408896,', '40', '0000009000,0000000300,0000000070,0000000040,', '1', '3', '系统管理/组织管理/岗位管理/编辑', '编辑', '2', '', '', '', '', 'sys:post:edit', '60', '1', 'default', 'core', '0', 'system', '2018-03-11 16:42:06', 'system', '2018-03-11 16:42:06', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_menu` VALUES ('972744061885673472', '972744059415228416', '0,972744059415228416,', '400', '0000009000,0000000400,', '0', '1', '系统管理/权限管理', '权限管理', '1', '', '', 'icon-social-dropbox', '', '', '60', '1', 'default', 'core', '0', 'system', '2018-03-11 16:42:06', 'system', '2018-03-11 16:42:06', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_menu` VALUES ('972744062011502592', '972744061885673472', '0,972744059415228416,972744061885673472,', '30', '0000009000,0000000400,0000000030,', '1', '2', '系统管理/权限管理/角色管理', '角色管理', '1', '/sys/role/list', '', 'icon-people', '', 'sys:role', '60', '1', 'default', 'core', '0', 'system', '2018-03-11 16:42:06', 'system', '2018-03-11 16:42:06', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_menu` VALUES ('972744062124748800', '972744061885673472', '0,972744059415228416,972744061885673472,', '40', '0000009000,0000000400,0000000040,', '1', '2', '系统管理/权限管理/二级管理员', '二级管理员', '1', '/sys/secAdmin/list', '', 'icon-user-female', '', 'sys:secAdmin', '60', '1', 'default', 'core', '0', 'system', '2018-03-11 16:42:06', 'system', '2018-03-11 16:42:06', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_menu` VALUES ('972744062237995008', '972744061885673472', '0,972744059415228416,972744061885673472,', '50', '0000009000,0000000400,0000000050,', '1', '2', '系统管理/权限管理/系统管理员', '系统管理员', '1', '/sys/corpAdmin/list', '', 'icon-badge', '', 'sys:corpAdmin', '80', '1', 'default', 'core', '0', 'system', '2018-03-11 16:42:06', 'system', '2018-03-11 16:42:06', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_menu` VALUES ('972744062359629824', '972744059415228416', '0,972744059415228416,', '500', '0000009000,0000000500,', '0', '1', '系统管理/系统设置', '系统设置', '1', '', '', 'icon-settings', '', '', '60', '1', 'default', 'core', '0', 'system', '2018-03-11 16:42:06', 'system', '2018-03-11 16:42:06', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_menu` VALUES ('972744062485458944', '972744062359629824', '0,972744059415228416,972744062359629824,', '30', '0000009000,0000000500,0000000030,', '1', '2', '系统管理/系统设置/菜单管理', '菜单管理', '1', '/sys/menu/list', '', 'icon-book-open', '', 'sys:menu', '80', '1', 'default', 'core', '0', 'system', '2018-03-11 16:42:06', 'system', '2018-03-11 16:42:06', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_menu` VALUES ('972744062636453888', '972744062359629824', '0,972744059415228416,972744062359629824,', '40', '0000009000,0000000500,0000000040,', '1', '2', '系统管理/系统设置/模块管理', '模块管理', '1', '/sys/module/list', '', 'icon-grid', '', 'sys:module', '80', '1', 'default', 'core', '0', 'system', '2018-03-11 16:42:06', 'system', '2018-03-11 16:42:06', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_menu` VALUES ('972744062774865920', '972744062359629824', '0,972744059415228416,972744062359629824,', '50', '0000009000,0000000500,0000000050,', '1', '2', '系统管理/系统设置/参数设置', '参数设置', '1', '/sys/config/list', '', 'icon-wrench', '', 'sys:config', '60', '1', 'default', 'core', '0', 'system', '2018-03-11 16:42:06', 'system', '2018-03-11 16:42:06', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_menu` VALUES ('972744062875529216', '972744062359629824', '0,972744059415228416,972744062359629824,', '60', '0000009000,0000000500,0000000060,', '0', '2', '系统管理/系统设置/字典管理', '字典管理', '1', '/sys/dictType/list', '', 'icon-social-dropbox', '', '', '60', '1', 'default', 'core', '0', 'system', '2018-03-11 16:42:06', 'system', '2018-03-11 16:42:06', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_menu` VALUES ('972744063005552640', '972744062875529216', '0,972744059415228416,972744062359629824,972744062875529216,', '30', '0000009000,0000000500,0000000060,0000000030,', '1', '3', '系统管理/系统设置/字典管理/类型查看', '类型查看', '2', '', '', '', '', 'sys:dictType:view', '60', '1', 'default', 'core', '0', 'system', '2018-03-11 16:42:06', 'system', '2018-03-11 16:42:06', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_menu` VALUES ('972744063143964672', '972744062875529216', '0,972744059415228416,972744062359629824,972744062875529216,', '40', '0000009000,0000000500,0000000060,0000000040,', '1', '3', '系统管理/系统设置/字典管理/类型编辑', '类型编辑', '2', '', '', '', '', 'sys:dictType:edit', '80', '1', 'default', 'core', '0', 'system', '2018-03-11 16:42:06', 'system', '2018-03-11 16:42:06', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_menu` VALUES ('972744063278182400', '972744062875529216', '0,972744059415228416,972744062359629824,972744062875529216,', '50', '0000009000,0000000500,0000000060,0000000050,', '1', '3', '系统管理/系统设置/字典管理/数据查看', '数据查看', '2', '', '', '', '', 'sys:dictData:view', '60', '1', 'default', 'core', '0', 'system', '2018-03-11 16:42:06', 'system', '2018-03-11 16:42:06', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_menu` VALUES ('972744063412400128', '972744062875529216', '0,972744059415228416,972744062359629824,972744062875529216,', '60', '0000009000,0000000500,0000000060,0000000060,', '1', '3', '系统管理/系统设置/字典管理/数据编辑', '数据编辑', '2', '', '', '', '', 'sys:dictData:edit', '60', '1', 'default', 'core', '0', 'system', '2018-03-11 16:42:06', 'system', '2018-03-11 16:42:06', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_menu` VALUES ('972744063538229248', '972744062359629824', '0,972744059415228416,972744062359629824,', '70', '0000009000,0000000500,0000000070,', '1', '2', '系统管理/系统设置/行政区划', '行政区划', '1', '/sys/area/list', '', 'icon-map', '', 'sys:area', '60', '1', 'default', 'core', '0', 'system', '2018-03-11 16:42:06', 'system', '2018-03-11 16:42:06', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_menu` VALUES ('972744063651475456', '972744062359629824', '0,972744059415228416,972744062359629824,', '80', '0000009000,0000000500,0000000080,', '1', '2', '系统管理/系统设置/国际化管理', '国际化管理', '1', '/sys/lang/list', '', 'icon-globe', '', 'sys:lang', '80', '1', 'default', 'core', '0', 'system', '2018-03-11 16:42:06', 'system', '2018-03-11 16:42:06', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_menu` VALUES ('972744063781498880', '972744062359629824', '0,972744059415228416,972744062359629824,', '90', '0000009000,0000000500,0000000090,', '1', '2', '系统管理/系统设置/产品许可信息', '产品许可信息', '1', '//licence', '', 'icon-paper-plane', '', '', '80', '1', 'default', 'core', '0', 'system', '2018-03-11 16:42:06', 'system', '2018-03-11 16:42:06', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_menu` VALUES ('972744063894745088', '972744059415228416', '0,972744059415228416,', '600', '0000009000,0000000600,', '0', '1', '系统管理/系统监控', '系统监控', '1', '', '', 'icon-ghost', '', '', '60', '1', 'default', 'core', '0', 'system', '2018-03-11 16:42:06', 'system', '2018-03-11 16:42:06', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_menu` VALUES ('972744064003796992', '972744063894745088', '0,972744059415228416,972744063894745088,', '40', '0000009000,0000000600,0000000040,', '1', '2', '系统管理/系统监控/访问日志', '访问日志', '1', '/sys/log/list', '', 'fa fa-bug', '', 'sys:log', '60', '1', 'default', 'core', '0', 'system', '2018-03-11 16:42:06', 'system', '2018-03-11 16:42:06', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_menu` VALUES ('972744064330952704', '972744063894745088', '0,972744059415228416,972744063894745088,', '50', '0000009000,0000000600,0000000050,', '1', '2', '系统管理/系统监控/数据监控', '数据监控', '1', '//druid', '', 'icon-disc', '', 'sys:state:druid', '80', '1', 'default', 'core', '0', 'system', '2018-03-11 16:42:06', 'system', '2018-03-11 16:42:06', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_menu` VALUES ('972744064469364736', '972744063894745088', '0,972744059415228416,972744063894745088,', '60', '0000009000,0000000600,0000000060,', '1', '2', '系统管理/系统监控/缓存监控', '缓存监控', '1', '/state/ehcache', '', 'icon-social-dribbble', '', 'sys:stste:ehcache', '80', '1', 'default', 'core', '0', 'system', '2018-03-11 16:42:06', 'system', '2018-03-11 16:42:06', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_menu` VALUES ('972744064607776768', '972744063894745088', '0,972744059415228416,972744063894745088,', '70', '0000009000,0000000600,0000000070,', '1', '2', '系统管理/系统监控/服务器监控', '服务器监控', '1', '/state/server', '', 'icon-speedometer', '', 'sys:state:server', '80', '1', 'default', 'core', '0', 'system', '2018-03-11 16:42:06', 'system', '2018-03-11 16:42:06', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_menu` VALUES ('972744064716828672', '972744063894745088', '0,972744059415228416,972744063894745088,', '80', '0000009000,0000000600,0000000080,', '1', '2', '系统管理/系统监控/作业监控', '作业监控', '1', '/job/list', '', 'icon-notebook', '', 'sys:job', '80', '1', 'default', 'core', '0', 'system', '2018-03-11 16:42:06', 'system', '2018-03-11 16:42:06', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_menu` VALUES ('972744064834269184', '972744063894745088', '0,972744059415228416,972744063894745088,', '90', '0000009000,0000000600,0000000090,', '1', '2', '系统管理/系统监控/在线用户', '在线用户', '1', '/sys/online/list', '', 'icon-social-twitter', '', 'sys:online', '60', '1', 'default', 'core', '0', 'system', '2018-03-11 16:42:06', 'system', '2018-03-11 16:42:06', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_menu` VALUES ('972744064934932480', '972744059415228416', '0,972744059415228416,', '900', '0000009000,0000000900,', '0', '1', '系统管理/研发工具', '研发工具', '1', '', '', 'fa fa-code', '', '', '80', '1', 'default', 'devtools', '0', 'system', '2018-03-11 16:42:06', 'system', '2018-03-11 16:42:06', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_menu` VALUES ('972744065035595776', '972744064934932480', '0,972744059415228416,972744064934932480,', '30', '0000009000,0000000900,0000000030,', '1', '2', '系统管理/研发工具/代码生成工具', '代码生成工具', '1', '/gen/genTable/list', '', 'fa fa-code', '', 'gen:genTable', '80', '1', 'default', 'devtools', '0', 'system', '2018-03-11 16:42:06', 'system', '2018-03-11 16:42:06', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_menu` VALUES ('972744065157230592', '972744064934932480', '0,972744059415228416,972744064934932480,', '100', '0000009000,0000000900,0000000100,', '0', '2', '系统管理/研发工具/代码生成实例', '代码生成实例', '1', '', '', 'icon-social-dropbox', '', '', '80', '1', 'default', 'devtools', '0', 'system', '2018-03-11 16:42:06', 'system', '2018-03-11 16:42:06', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_menu` VALUES ('972744065295642624', '972744065157230592', '0,972744059415228416,972744064934932480,972744065157230592,', '30', '0000009000,0000000900,0000000100,0000000030,', '1', '3', '系统管理/研发工具/代码生成实例/单表_主子表', '单表/主子表', '1', '/test/testData/list', '', '', '', 'test:testData', '80', '1', 'default', 'devtools', '0', 'system', '2018-03-11 16:42:06', 'system', '2018-03-11 16:42:06', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_menu` VALUES ('972744065392111616', '972744065157230592', '0,972744059415228416,972744064934932480,972744065157230592,', '40', '0000009000,0000000900,0000000100,0000000040,', '1', '3', '系统管理/研发工具/代码生成实例/树表_树结构表', '树表/树结构表', '1', '/test/testTree/list', '', '', '', 'test:testTree', '80', '1', 'default', 'devtools', '0', 'system', '2018-03-11 16:42:06', 'system', '2018-03-11 16:42:06', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_menu` VALUES ('972744065492774912', '972744064934932480', '0,972744059415228416,972744064934932480,', '200', '0000009000,0000000900,0000000200,', '0', '2', '系统管理/研发工具/数据表格实例', '数据表格实例', '1', '', '', '', '', '', '80', '1', 'default', 'devtools', '0', 'system', '2018-03-11 16:42:06', 'system', '2018-03-11 16:42:06', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_menu` VALUES ('972744065631186944', '972744065492774912', '0,972744059415228416,972744064934932480,972744065492774912,', '30', '0000009000,0000000900,0000000200,0000000030,', '1', '3', '系统管理/研发工具/数据表格实例/多表头分组小计合计', '多表头分组小计合计', '1', '/demo/dataGrid/groupGrid', '', '', '', '', '80', '1', 'default', 'devtools', '0', 'system', '2018-03-11 16:42:06', 'system', '2018-03-11 16:42:06', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_menu` VALUES ('972744065798959104', '972744065492774912', '0,972744059415228416,972744064934932480,972744065492774912,', '40', '0000009000,0000000900,0000000200,0000000040,', '1', '3', '系统管理/研发工具/数据表格实例/编辑表格多行编辑', '编辑表格多行编辑', '1', '/demo/dataGrid/editGrid', '', '', '', '', '80', '1', 'default', 'devtools', '0', 'system', '2018-03-11 16:42:06', 'system', '2018-03-11 16:42:06', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_menu` VALUES ('972744066000285696', '972744064934932480', '0,972744059415228416,972744064934932480,', '300', '0000009000,0000000900,0000000300,', '0', '2', '系统管理/研发工具/表单组件实例', '表单组件实例', '1', '', '', '', '', '', '80', '1', 'default', 'devtools', '0', 'system', '2018-03-11 16:42:06', 'system', '2018-03-11 16:42:06', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_menu` VALUES ('972744066138697728', '972744066000285696', '0,972744059415228416,972744064934932480,972744066000285696,', '30', '0000009000,0000000900,0000000300,0000000030,', '1', '3', '系统管理/研发工具/表单组件实例/组件应用实例', '组件应用实例', '1', '/demo/from/editForm', '', '', '', '', '80', '1', 'default', 'devtools', '0', 'system', '2018-03-11 16:42:06', 'system', '2018-03-11 16:42:06', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_menu` VALUES ('972744066264526848', '972744066000285696', '0,972744059415228416,972744064934932480,972744066000285696,', '40', '0000009000,0000000900,0000000300,0000000040,', '1', '3', '系统管理/研发工具/表单组件实例/栅格布局实例', '栅格布局实例', '1', '/demo/from/layoutForm', '', '', '', '', '80', '1', 'default', 'devtools', '0', 'system', '2018-03-11 16:42:06', 'system', '2018-03-11 16:42:06', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_menu` VALUES ('972744066373578752', '972744066000285696', '0,972744059415228416,972744064934932480,972744066000285696,', '50', '0000009000,0000000900,0000000300,0000000050,', '1', '3', '系统管理/研发工具/表单组件实例/表格表单实例', '表格表单实例', '1', '/demo/from/tableForm', '', '', '', '', '80', '1', 'default', 'devtools', '0', 'system', '2018-03-11 16:42:06', 'system', '2018-03-11 16:42:06', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_menu` VALUES ('972744066507796480', '972744064934932480', '0,972744059415228416,972744064934932480,', '400', '0000009000,0000000900,0000000400,', '0', '2', '系统管理/研发工具/前端界面实例', '前端界面实例', '1', '', '', '', '', '', '80', '1', 'default', 'devtools', '0', 'system', '2018-03-11 16:42:06', 'system', '2018-03-11 16:42:06', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_menu` VALUES ('972744066621042688', '972744066507796480', '0,972744059415228416,972744064934932480,972744066507796480,', '30', '0000009000,0000000900,0000000400,0000000030,', '1', '3', '系统管理/研发工具/前端界面实例/图标样式查找', '图标样式查找', '1', '//tags/iconselect', '', '', '', '', '80', '1', 'default', 'devtools', '0', 'system', '2018-03-11 16:42:06', 'system', '2018-03-11 16:42:06', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_menu` VALUES ('972744066725900288', '972744059415228416', '0,972744059415228416,', '999', '0000009000,0000000999,', '0', '1', '系统管理/JeeSite社区', 'JeeSite社区', '1', '', '', 'fa fa-code', '', '', '80', '1', 'default', 'devtools', '0', 'system', '2018-03-11 16:42:06', 'system', '2018-03-11 16:42:06', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_menu` VALUES ('972744066897866752', '972744066725900288', '0,972744059415228416,972744066725900288,', '30', '0000009000,0000000999,0000000030,', '1', '2', '系统管理/JeeSite社区/官方网站', '官方网站', '1', 'http://jeesite.com', '', '', '', '', '80', '1', 'default', 'devtools', '0', 'system', '2018-03-11 16:42:06', 'system', '2018-03-11 16:42:06', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_menu` VALUES ('972744067036278784', '972744066725900288', '0,972744059415228416,972744066725900288,', '50', '0000009000,0000000999,0000000050,', '1', '2', '系统管理/JeeSite社区/作者博客', '作者博客', '1', 'https://my.oschina.net/thinkgem', '', '', '', '', '80', '1', 'default', 'devtools', '0', 'system', '2018-03-11 16:42:06', 'system', '2018-03-11 16:42:06', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_menu` VALUES ('972744067187273728', '972744066725900288', '0,972744059415228416,972744066725900288,', '40', '0000009000,0000000999,0000000040,', '1', '2', '系统管理/JeeSite社区/问题反馈', '问题反馈', '1', 'https://gitee.com/thinkgem/jeesite4/issues', '', '', '', '', '80', '1', 'default', 'devtools', '0', 'system', '2018-03-11 16:42:06', 'system', '2018-03-11 16:42:06', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_menu` VALUES ('972744067296325632', '972744066725900288', '0,972744059415228416,972744066725900288,', '60', '0000009000,0000000999,0000000060,', '1', '2', '系统管理/JeeSite社区/开源社区', '开源社区', '1', 'http://jeesite.net', '', '', '', '', '80', '1', 'default', 'devtools', '0', 'system', '2018-03-11 16:42:06', 'system', '2018-03-11 16:42:06', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for js_sys_module
-- ----------------------------
DROP TABLE IF EXISTS `js_sys_module`;
CREATE TABLE `js_sys_module` (
  `module_code` varchar(64) NOT NULL COMMENT '模块编码',
  `module_name` varchar(100) NOT NULL COMMENT '模块名称',
  `description` varchar(500) DEFAULT NULL COMMENT '模块描述',
  `main_class_name` varchar(500) DEFAULT NULL COMMENT '主类全名',
  `current_version` varchar(50) DEFAULT NULL COMMENT '当前版本',
  `upgrade_info` varchar(300) DEFAULT NULL COMMENT '升级信息',
  `status` char(1) NOT NULL DEFAULT '0' COMMENT '状态（0正常 1删除 2停用）',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `remarks` varchar(500) DEFAULT NULL COMMENT '备注信息',
  PRIMARY KEY (`module_code`),
  KEY `idx_sys_module_status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='模块表';

-- ----------------------------
-- Records of js_sys_module
-- ----------------------------
INSERT INTO `js_sys_module` VALUES ('cms', '内容管理', '网站、站点、栏目、文章、链接、评论、留言板', 'com.jeesite.modules.cms.web.CmsController', '4.0.0', null, '0', 'system', '2018-03-11 16:00:28', 'system', '2018-03-11 16:00:28', null);
INSERT INTO `js_sys_module` VALUES ('core', '核心模块', '用户、角色、组织、模块、菜单、字典、参数', 'com.jeesite.modules.sys.web.LoginController', '4.0.0', null, '0', 'system', '2018-03-11 16:00:28', 'system', '2018-03-11 16:00:28', null);
INSERT INTO `js_sys_module` VALUES ('devtools', '研发工具', '代码生成器、组件演示示例、API接口文档等', 'com.jeesite.modules.gen.web.GenTableController', '4.0.0', null, '0', 'system', '2018-03-11 16:00:28', 'system', '2018-03-11 16:00:28', null);

-- ----------------------------
-- Table structure for js_sys_msg_inner
-- ----------------------------
DROP TABLE IF EXISTS `js_sys_msg_inner`;
CREATE TABLE `js_sys_msg_inner` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `msg_title` varchar(200) NOT NULL COMMENT '消息标题',
  `content_level` char(1) NOT NULL COMMENT '内容级别（1普通 2一般 3紧急）',
  `content_type` char(1) DEFAULT NULL COMMENT '内容类型（1公告 2新闻 3会议 4其它）',
  `msg_content` text NOT NULL COMMENT '消息内容',
  `receive_type` char(1) NOT NULL COMMENT '接受者类型（1用户 2部门 3角色 4岗位）',
  `receive_codes` text NOT NULL COMMENT '接受者字符串',
  `receive_names` text NOT NULL COMMENT '接受者名称字符串',
  `send_user_code` varchar(64) NOT NULL COMMENT '发送者用户编码',
  `send_user_name` varchar(100) NOT NULL COMMENT '发送者用户姓名',
  `send_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '发送时间',
  `is_attac` char(1) DEFAULT NULL COMMENT '是否有附件',
  `notify_types` varchar(100) NOT NULL COMMENT '通知类型（PC APP 短信 邮件 微信）多选',
  `status` char(1) NOT NULL COMMENT '状态（0正常 1删除 4审核 5驳回 9草稿）',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `remarks` varchar(500) DEFAULT NULL COMMENT '备注信息',
  PRIMARY KEY (`id`),
  KEY `idx_sys_msg_inner_cb` (`create_by`),
  KEY `idx_sys_msg_inner_status` (`status`),
  KEY `idx_sys_msg_inner_cl` (`content_level`),
  KEY `idx_sys_msg_inner_sc` (`send_user_code`),
  KEY `idx_sys_msg_inner_sd` (`send_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='内部消息';

-- ----------------------------
-- Records of js_sys_msg_inner
-- ----------------------------

-- ----------------------------
-- Table structure for js_sys_msg_inner_record
-- ----------------------------
DROP TABLE IF EXISTS `js_sys_msg_inner_record`;
CREATE TABLE `js_sys_msg_inner_record` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `msg_inner_id` varchar(64) NOT NULL COMMENT '所属消息',
  `receive_user_code` varchar(64) DEFAULT NULL COMMENT '接受者用户编码',
  `receive_user_name` varchar(100) NOT NULL COMMENT '接受者用户姓名',
  `read_status` char(1) NOT NULL COMMENT '读取状态（0未送达 1未读 2已读）',
  `read_date` datetime DEFAULT NULL COMMENT '阅读时间',
  `is_star` char(1) DEFAULT NULL COMMENT '是否标星',
  PRIMARY KEY (`id`),
  KEY `idx_sys_msg_inner_r_mi` (`msg_inner_id`),
  KEY `idx_sys_msg_inner_r_rc` (`receive_user_code`),
  KEY `idx_sys_msg_inner_r_ruc` (`receive_user_code`),
  KEY `idx_sys_msg_inner_r_status` (`read_status`),
  KEY `idx_sys_msg_inner_r_star` (`is_star`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='内部消息发送记录表';

-- ----------------------------
-- Records of js_sys_msg_inner_record
-- ----------------------------

-- ----------------------------
-- Table structure for js_sys_msg_push
-- ----------------------------
DROP TABLE IF EXISTS `js_sys_msg_push`;
CREATE TABLE `js_sys_msg_push` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `msg_type` varchar(16) NOT NULL COMMENT '消息类型（PC APP 短信 邮件 微信）',
  `msg_title` varchar(200) NOT NULL COMMENT '消息标题',
  `msg_content` text NOT NULL COMMENT '消息内容',
  `biz_key` varchar(64) DEFAULT NULL COMMENT '业务主键',
  `biz_type` varchar(64) DEFAULT NULL COMMENT '业务类型',
  `receive_code` varchar(64) NOT NULL COMMENT '接受者账号',
  `receive_user_code` varchar(64) NOT NULL COMMENT '接受者用户编码',
  `receive_user_name` varchar(100) NOT NULL COMMENT '接受者用户姓名',
  `send_user_code` varchar(64) NOT NULL COMMENT '发送者用户编码',
  `send_user_name` varchar(100) NOT NULL COMMENT '发送者用户姓名',
  `send_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '发送时间',
  `is_merge_push` char(1) DEFAULT NULL COMMENT '是否合并推送',
  `plan_push_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '计划推送时间',
  `push_number` int(11) DEFAULT NULL COMMENT '推送尝试次数',
  `push_return_code` varchar(200) DEFAULT NULL COMMENT '推送返回结果码',
  `push_return_msg_id` varchar(200) DEFAULT NULL COMMENT '推送返回消息编号',
  `push_return_content` text COMMENT '推送返回的内容信息',
  `push_status` char(1) DEFAULT NULL COMMENT '推送状态（0未推送 1成功  2失败）',
  `push_date` date DEFAULT NULL COMMENT '推送时间',
  `read_status` char(1) DEFAULT NULL COMMENT '读取状态（0未送达 1未读 2已读）',
  `read_date` date DEFAULT NULL COMMENT '读取时间',
  PRIMARY KEY (`id`),
  KEY `idx_sys_msg_push_type` (`msg_type`),
  KEY `idx_sys_msg_push_rc` (`receive_code`),
  KEY `idx_sys_msg_push_uc` (`receive_user_code`),
  KEY `idx_sys_msg_push_suc` (`send_user_code`),
  KEY `idx_sys_msg_push_pd` (`plan_push_date`),
  KEY `idx_sys_msg_push_ps` (`push_status`),
  KEY `idx_sys_msg_push_rs` (`read_status`),
  KEY `idx_sys_msg_push_bk` (`biz_key`),
  KEY `idx_sys_msg_push_bt` (`biz_type`),
  KEY `idx_sys_msg_push_imp` (`is_merge_push`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='消息推送表';

-- ----------------------------
-- Records of js_sys_msg_push
-- ----------------------------

-- ----------------------------
-- Table structure for js_sys_msg_push_wait
-- ----------------------------
DROP TABLE IF EXISTS `js_sys_msg_push_wait`;
CREATE TABLE `js_sys_msg_push_wait` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `msg_type` varchar(16) NOT NULL COMMENT '消息类型（PC APP 短信 邮件 微信）',
  `msg_title` varchar(200) NOT NULL COMMENT '消息标题',
  `msg_content` text NOT NULL COMMENT '消息内容',
  `biz_key` varchar(64) DEFAULT NULL COMMENT '业务主键',
  `biz_type` varchar(64) DEFAULT NULL COMMENT '业务类型',
  `receive_code` varchar(64) NOT NULL COMMENT '接受者账号',
  `receive_user_code` varchar(64) NOT NULL COMMENT '接受者用户编码',
  `receive_user_name` varchar(100) NOT NULL COMMENT '接受者用户姓名',
  `send_user_code` varchar(64) NOT NULL COMMENT '发送者用户编码',
  `send_user_name` varchar(100) NOT NULL COMMENT '发送者用户姓名',
  `send_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '发送时间',
  `is_merge_push` char(1) DEFAULT NULL COMMENT '是否合并推送',
  `plan_push_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '计划推送时间',
  `push_number` int(11) DEFAULT NULL COMMENT '推送尝试次数',
  `push_return_content` text COMMENT '推送返回的内容信息',
  `push_return_code` varchar(200) DEFAULT NULL COMMENT '推送返回结果码',
  `push_return_msg_id` varchar(200) DEFAULT NULL COMMENT '推送返回消息编号',
  `push_status` char(1) DEFAULT NULL COMMENT '推送状态（0未推送 1成功  2失败）',
  `push_date` date DEFAULT NULL COMMENT '推送时间',
  `read_status` char(1) DEFAULT NULL COMMENT '读取状态（0未送达 1未读 2已读）',
  `read_date` date DEFAULT NULL COMMENT '读取时间',
  PRIMARY KEY (`id`),
  KEY `idx_sys_msg_pushw_type` (`msg_type`),
  KEY `idx_sys_msg_pushw_rc` (`receive_code`),
  KEY `idx_sys_msg_pushw_uc` (`receive_user_code`),
  KEY `idx_sys_msg_pushw_suc` (`send_user_code`),
  KEY `idx_sys_msg_pushw_pd` (`plan_push_date`),
  KEY `idx_sys_msg_pushw_ps` (`push_status`),
  KEY `idx_sys_msg_pushw_rs` (`read_status`),
  KEY `idx_sys_msg_pushw_bk` (`biz_key`),
  KEY `idx_sys_msg_pushw_bt` (`biz_type`),
  KEY `idx_sys_msg_pushw_imp` (`is_merge_push`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='消息待推送表';

-- ----------------------------
-- Records of js_sys_msg_push_wait
-- ----------------------------

-- ----------------------------
-- Table structure for js_sys_msg_template
-- ----------------------------
DROP TABLE IF EXISTS `js_sys_msg_template`;
CREATE TABLE `js_sys_msg_template` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `module_code` varchar(64) DEFAULT NULL COMMENT '归属模块',
  `tpl_key` varchar(100) NOT NULL COMMENT '模板键值',
  `tpl_name` varchar(100) NOT NULL COMMENT '模板名称',
  `tpl_type` varchar(16) NOT NULL COMMENT '模板类型',
  `tpl_content` text NOT NULL COMMENT '模板内容',
  `status` char(1) NOT NULL DEFAULT '0' COMMENT '状态（0正常 1删除 2停用）',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `remarks` varchar(500) DEFAULT NULL COMMENT '备注信息',
  PRIMARY KEY (`id`),
  KEY `idx_sys_msg_tpl_key` (`tpl_key`),
  KEY `idx_sys_msg_tpl_type` (`tpl_type`),
  KEY `idx_sys_msg_tpl_status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='消息模板';

-- ----------------------------
-- Records of js_sys_msg_template
-- ----------------------------

-- ----------------------------
-- Table structure for js_sys_office
-- ----------------------------
DROP TABLE IF EXISTS `js_sys_office`;
CREATE TABLE `js_sys_office` (
  `office_code` varchar(64) NOT NULL COMMENT '机构编码',
  `parent_code` varchar(64) NOT NULL COMMENT '父级编号',
  `parent_codes` varchar(2000) NOT NULL COMMENT '所有父级编号',
  `tree_sort` decimal(10,0) NOT NULL COMMENT '本级排序号（升序）',
  `tree_sorts` varchar(1200) NOT NULL COMMENT '所有级别排序号',
  `tree_leaf` char(1) NOT NULL COMMENT '是否最末级',
  `tree_level` decimal(4,0) NOT NULL COMMENT '层次级别',
  `tree_names` varchar(2000) NOT NULL COMMENT '全节点名',
  `view_code` varchar(100) NOT NULL COMMENT '机构代码',
  `office_name` varchar(100) NOT NULL COMMENT '机构名称',
  `full_name` varchar(200) NOT NULL COMMENT '机构全称',
  `office_type` char(1) NOT NULL COMMENT '机构类型',
  `leader` varchar(100) DEFAULT NULL COMMENT '负责人',
  `phone` varchar(100) DEFAULT NULL COMMENT '办公电话',
  `address` varchar(255) DEFAULT NULL COMMENT '联系地址',
  `zip_code` varchar(100) DEFAULT NULL COMMENT '邮政编码',
  `email` varchar(300) DEFAULT NULL COMMENT '电子邮箱',
  `status` char(1) NOT NULL DEFAULT '0' COMMENT '状态（0正常 1删除 2停用）',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `remarks` varchar(500) DEFAULT NULL COMMENT '备注信息',
  `corp_code` varchar(64) NOT NULL DEFAULT '0' COMMENT '归属集团Code',
  `corp_name` varchar(100) NOT NULL DEFAULT 'JeeSite' COMMENT '归属集团Name',
  `extend_s1` varchar(500) DEFAULT NULL COMMENT '扩展 String 1',
  `extend_s2` varchar(500) DEFAULT NULL COMMENT '扩展 String 2',
  `extend_s3` varchar(500) DEFAULT NULL COMMENT '扩展 String 3',
  `extend_s4` varchar(500) DEFAULT NULL COMMENT '扩展 String 4',
  `extend_s5` varchar(500) DEFAULT NULL COMMENT '扩展 String 5',
  `extend_s6` varchar(500) DEFAULT NULL COMMENT '扩展 String 6',
  `extend_s7` varchar(500) DEFAULT NULL COMMENT '扩展 String 7',
  `extend_s8` varchar(500) DEFAULT NULL COMMENT '扩展 String 8',
  `extend_i1` decimal(19,0) DEFAULT NULL COMMENT '扩展 Integer 1',
  `extend_i2` decimal(19,0) DEFAULT NULL COMMENT '扩展 Integer 2',
  `extend_i3` decimal(19,0) DEFAULT NULL COMMENT '扩展 Integer 3',
  `extend_i4` decimal(19,0) DEFAULT NULL COMMENT '扩展 Integer 4',
  `extend_f1` decimal(19,4) DEFAULT NULL COMMENT '扩展 Float 1',
  `extend_f2` decimal(19,4) DEFAULT NULL COMMENT '扩展 Float 2',
  `extend_f3` decimal(19,4) DEFAULT NULL COMMENT '扩展 Float 3',
  `extend_f4` decimal(19,4) DEFAULT NULL COMMENT '扩展 Float 4',
  `extend_d1` datetime DEFAULT NULL COMMENT '扩展 Date 1',
  `extend_d2` datetime DEFAULT NULL COMMENT '扩展 Date 2',
  `extend_d3` datetime DEFAULT NULL COMMENT '扩展 Date 3',
  `extend_d4` datetime DEFAULT NULL COMMENT '扩展 Date 4',
  PRIMARY KEY (`office_code`),
  KEY `idx_sys_office_cc` (`corp_code`),
  KEY `idx_sys_office_pc` (`parent_code`),
  KEY `idx_sys_office_pcs` (`parent_codes`(255)),
  KEY `idx_sys_office_status` (`status`),
  KEY `idx_sys_office_ot` (`office_type`),
  KEY `idx_sys_office_vc` (`view_code`),
  KEY `idx_sys_office_ts` (`tree_sort`),
  KEY `idx_sys_office_tss` (`tree_sorts`(255))
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='组织机构表';

-- ----------------------------
-- Records of js_sys_office
-- ----------------------------

-- ----------------------------
-- Table structure for js_sys_post
-- ----------------------------
DROP TABLE IF EXISTS `js_sys_post`;
CREATE TABLE `js_sys_post` (
  `post_code` varchar(64) NOT NULL COMMENT '岗位编码',
  `post_name` varchar(100) NOT NULL COMMENT '岗位名称',
  `post_type` varchar(100) DEFAULT NULL COMMENT '岗位分类（高管、中层、基层）',
  `post_sort` decimal(10,0) DEFAULT NULL COMMENT '岗位排序（升序）',
  `status` char(1) NOT NULL DEFAULT '0' COMMENT '状态（0正常 1删除 2停用）',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `remarks` varchar(500) DEFAULT NULL COMMENT '备注信息',
  `corp_code` varchar(64) NOT NULL DEFAULT '0' COMMENT '归属集团Code',
  `corp_name` varchar(100) NOT NULL DEFAULT 'JeeSite' COMMENT '归属集团Name',
  PRIMARY KEY (`post_code`),
  KEY `idx_sys_post_cc` (`corp_code`),
  KEY `idx_sys_post_status` (`status`),
  KEY `idx_sys_post_ps` (`post_sort`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='员工岗位表';

-- ----------------------------
-- Records of js_sys_post
-- ----------------------------

-- ----------------------------
-- Table structure for js_sys_role
-- ----------------------------
DROP TABLE IF EXISTS `js_sys_role`;
CREATE TABLE `js_sys_role` (
  `role_code` varchar(64) NOT NULL COMMENT '角色编码',
  `role_name` varchar(100) NOT NULL COMMENT '角色名称',
  `role_type` varchar(100) DEFAULT NULL COMMENT '角色分类（高管、中层、基层、其它）',
  `role_sort` decimal(10,0) DEFAULT NULL COMMENT '角色排序（升序）',
  `is_sys` char(1) DEFAULT NULL COMMENT '系统内置（1是 0否）',
  `user_type` varchar(16) DEFAULT NULL COMMENT '用户类型（employee员工 member会员）',
  `data_scope` char(1) DEFAULT NULL COMMENT '数据范围设置（0未设置  1全部数据 2自定义数据）',
  `status` char(1) NOT NULL DEFAULT '0' COMMENT '状态（0正常 1删除 2停用）',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `remarks` varchar(500) DEFAULT NULL COMMENT '备注信息',
  `corp_code` varchar(64) NOT NULL DEFAULT '0' COMMENT '归属集团Code',
  `corp_name` varchar(100) NOT NULL DEFAULT 'JeeSite' COMMENT '归属集团Name',
  PRIMARY KEY (`role_code`),
  KEY `idx_sys_role_cc` (`corp_code`),
  KEY `idx_sys_role_is` (`is_sys`),
  KEY `idx_sys_role_status` (`status`),
  KEY `idx_sys_role_rs` (`role_sort`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色表';

-- ----------------------------
-- Records of js_sys_role
-- ----------------------------
INSERT INTO `js_sys_role` VALUES ('corpAdmin', '系统管理员', null, '200', '1', 'none', '0', '0', 'system', '2018-03-11 16:00:30', 'system', '2018-03-11 16:00:30', '客户方使用的管理员角色，客户方管理员，集团管理员', '0', 'JeeSite');
INSERT INTO `js_sys_role` VALUES ('default', '默认角色', null, '100', '1', 'none', '0', '0', 'system', '2018-03-11 16:00:30', 'system', '2018-03-11 16:00:30', '非管理员用户，共有的默认角色，在参数配置里指定', '0', 'JeeSite');

-- ----------------------------
-- Table structure for js_sys_role_data_scope
-- ----------------------------
DROP TABLE IF EXISTS `js_sys_role_data_scope`;
CREATE TABLE `js_sys_role_data_scope` (
  `role_code` varchar(64) NOT NULL COMMENT '控制角色编码',
  `ctrl_type` varchar(20) NOT NULL COMMENT '控制类型',
  `ctrl_data` varchar(64) NOT NULL COMMENT '控制数据',
  `ctrl_permi` varchar(64) NOT NULL COMMENT '控制权限',
  PRIMARY KEY (`role_code`,`ctrl_type`,`ctrl_data`,`ctrl_permi`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色数据权限表';

-- ----------------------------
-- Records of js_sys_role_data_scope
-- ----------------------------

-- ----------------------------
-- Table structure for js_sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `js_sys_role_menu`;
CREATE TABLE `js_sys_role_menu` (
  `role_code` varchar(64) NOT NULL COMMENT '角色编码',
  `menu_code` varchar(64) NOT NULL COMMENT '菜单编码',
  PRIMARY KEY (`role_code`,`menu_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色与菜单关联表';

-- ----------------------------
-- Records of js_sys_role_menu
-- ----------------------------
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '972744059415228416');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '972744059608166400');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '972744059729801216');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '972744059855630336');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '972744060002430976');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '972744060140843008');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '972744060270866432');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '972744060400889856');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '972744060539301888');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '972744060686102528');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '972744060816125952');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '972744060950343680');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '972744061063589888');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '972744061197807616');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '972744061336219648');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '972744061491408896');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '972744061604655104');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '972744061730484224');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '972744061885673472');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '972744062011502592');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '972744062124748800');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '972744062237995008');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '972744062359629824');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '972744062485458944');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '972744062636453888');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '972744062774865920');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '972744062875529216');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '972744063005552640');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '972744063143964672');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '972744063278182400');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '972744063412400128');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '972744063538229248');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '972744063651475456');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '972744063781498880');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '972744063894745088');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '972744064003796992');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '972744064330952704');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '972744064469364736');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '972744064607776768');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '972744064716828672');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '972744064834269184');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '972744064934932480');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '972744065035595776');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '972744065157230592');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '972744065295642624');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '972744065392111616');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '972744065492774912');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '972744065631186944');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '972744065798959104');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '972744066000285696');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '972744066138697728');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '972744066264526848');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '972744066373578752');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '972744066507796480');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '972744066621042688');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '972744066725900288');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '972744066897866752');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '972744067036278784');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '972744067187273728');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '972744067296325632');

-- ----------------------------
-- Table structure for js_sys_user
-- ----------------------------
DROP TABLE IF EXISTS `js_sys_user`;
CREATE TABLE `js_sys_user` (
  `user_code` varchar(100) NOT NULL COMMENT '用户编码',
  `login_code` varchar(100) NOT NULL COMMENT '登录账号',
  `user_name` varchar(100) NOT NULL COMMENT '用户昵称',
  `password` varchar(100) NOT NULL COMMENT '登录密码',
  `email` varchar(300) DEFAULT NULL COMMENT '电子邮箱',
  `mobile` varchar(100) DEFAULT NULL COMMENT '手机号码',
  `phone` varchar(100) DEFAULT NULL COMMENT '办公电话',
  `sex` char(1) DEFAULT NULL COMMENT '用户性别',
  `avatar` varchar(2000) DEFAULT NULL COMMENT '头像路径',
  `sign` varchar(200) DEFAULT NULL COMMENT '个性签名',
  `wx_openid` varchar(100) DEFAULT NULL COMMENT '绑定的微信号',
  `mobile_imei` varchar(100) DEFAULT NULL COMMENT '绑定的手机串号',
  `user_type` varchar(16) NOT NULL COMMENT '用户类型',
  `ref_code` varchar(64) DEFAULT NULL COMMENT '用户类型引用编号',
  `ref_name` varchar(100) DEFAULT NULL COMMENT '用户类型引用姓名',
  `mgr_type` char(1) NOT NULL COMMENT '管理员类型（0非管理员 1系统管理员  2二级管理员）',
  `pwd_security_level` decimal(1,0) DEFAULT NULL COMMENT '密码安全级别（0初始 1很弱 2弱 3安全 4很安全）',
  `pwd_update_date` datetime DEFAULT NULL COMMENT '密码最后更新时间',
  `pwd_update_record` varchar(2000) DEFAULT NULL COMMENT '密码修改记录',
  `pwd_question` varchar(200) DEFAULT NULL COMMENT '密保问题',
  `pwd_question_answer` varchar(200) DEFAULT NULL COMMENT '密保问题答案',
  `pwd_question_2` varchar(200) DEFAULT NULL COMMENT '密保问题2',
  `pwd_question_answer_2` varchar(200) DEFAULT NULL COMMENT '密保问题答案2',
  `pwd_question_3` varchar(200) DEFAULT NULL COMMENT '密保问题3',
  `pwd_question_answer_3` varchar(200) DEFAULT NULL COMMENT '密保问题答案3',
  `pwd_quest_update_date` datetime DEFAULT NULL COMMENT '密码问题修改时间',
  `last_login_ip` varchar(100) DEFAULT NULL COMMENT '最后登陆IP',
  `last_login_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后登陆时间',
  `freeze_date` datetime DEFAULT NULL COMMENT '冻结时间',
  `freeze_cause` varchar(200) DEFAULT NULL COMMENT '冻结原因',
  `user_weight` decimal(8,0) DEFAULT '0' COMMENT '用户权重（降序）',
  `status` char(1) NOT NULL COMMENT '状态（0正常 1删除 2停用 3冻结）',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `remarks` varchar(500) DEFAULT NULL COMMENT '备注信息',
  `corp_code` varchar(64) NOT NULL DEFAULT '0' COMMENT '归属集团Code',
  `corp_name` varchar(100) NOT NULL DEFAULT 'JeeSite' COMMENT '归属集团Name',
  `extend_s1` varchar(500) DEFAULT NULL COMMENT '扩展 String 1',
  `extend_s2` varchar(500) DEFAULT NULL COMMENT '扩展 String 2',
  `extend_s3` varchar(500) DEFAULT NULL COMMENT '扩展 String 3',
  `extend_s4` varchar(500) DEFAULT NULL COMMENT '扩展 String 4',
  `extend_s5` varchar(500) DEFAULT NULL COMMENT '扩展 String 5',
  `extend_s6` varchar(500) DEFAULT NULL COMMENT '扩展 String 6',
  `extend_s7` varchar(500) DEFAULT NULL COMMENT '扩展 String 7',
  `extend_s8` varchar(500) DEFAULT NULL COMMENT '扩展 String 8',
  `extend_i1` decimal(19,0) DEFAULT NULL COMMENT '扩展 Integer 1',
  `extend_i2` decimal(19,0) DEFAULT NULL COMMENT '扩展 Integer 2',
  `extend_i3` decimal(19,0) DEFAULT NULL COMMENT '扩展 Integer 3',
  `extend_i4` decimal(19,0) DEFAULT NULL COMMENT '扩展 Integer 4',
  `extend_f1` decimal(19,4) DEFAULT NULL COMMENT '扩展 Float 1',
  `extend_f2` decimal(19,4) DEFAULT NULL COMMENT '扩展 Float 2',
  `extend_f3` decimal(19,4) DEFAULT NULL COMMENT '扩展 Float 3',
  `extend_f4` decimal(19,4) DEFAULT NULL COMMENT '扩展 Float 4',
  `extend_d1` datetime DEFAULT NULL COMMENT '扩展 Date 1',
  `extend_d2` datetime DEFAULT NULL COMMENT '扩展 Date 2',
  `extend_d3` datetime DEFAULT NULL COMMENT '扩展 Date 3',
  `extend_d4` datetime DEFAULT NULL COMMENT '扩展 Date 4',
  PRIMARY KEY (`user_code`),
  KEY `idx_sys_user_lc` (`login_code`),
  KEY `idx_sys_user_email` (`email`(255)),
  KEY `idx_sys_user_mobile` (`mobile`),
  KEY `idx_sys_user_wo` (`wx_openid`),
  KEY `idx_sys_user_imei` (`mobile_imei`),
  KEY `idx_sys_user_rt` (`user_type`),
  KEY `idx_sys_user_rc` (`ref_code`),
  KEY `idx_sys_user_mt` (`mgr_type`),
  KEY `idx_sys_user_us` (`user_weight`),
  KEY `idx_sys_user_ud` (`update_date`),
  KEY `idx_sys_user_status` (`status`),
  KEY `idx_sys_user_cc` (`corp_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
-- Records of js_sys_user
-- ----------------------------
INSERT INTO `js_sys_user` VALUES ('admin', 'admin', '系统管理员', 'b637e583b6209196fdae160bce3bde6dd3cad3ea23c43be83d9f5414', null, null, null, null, null, null, null, null, 'none', null, null, '1', null, null, null, null, null, null, null, null, null, null, null, '2018-03-11 16:00:33', null, null, '0', '0', 'system', '2018-03-11 16:00:33', 'system', '2018-03-11 16:00:33', '客户方使用的系统管理员，用于一些常用的基础数据配置。', '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_user` VALUES ('system', 'system', '超级管理员', 'bf43a821be45ea9fe8431dd38f9c0371c7f2e28451d165ffc05fdb88', null, null, null, null, null, null, null, null, 'none', null, null, '0', null, null, null, null, null, null, null, null, null, null, '127.0.0.1', '2018-03-11 16:04:30', null, null, '0', '0', 'system', '2018-03-11 16:00:33', 'system', '2018-03-11 16:00:33', '开发者使用的最高级别管理员，主要用于开发和调试。', '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for js_sys_user_data_scope
-- ----------------------------
DROP TABLE IF EXISTS `js_sys_user_data_scope`;
CREATE TABLE `js_sys_user_data_scope` (
  `user_code` varchar(100) NOT NULL COMMENT '控制用户编码',
  `ctrl_type` varchar(20) NOT NULL COMMENT '控制类型',
  `ctrl_data` varchar(64) NOT NULL COMMENT '控制数据',
  `ctrl_permi` varchar(64) NOT NULL COMMENT '控制权限',
  PRIMARY KEY (`user_code`,`ctrl_type`,`ctrl_data`,`ctrl_permi`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户数据权限表';

-- ----------------------------
-- Records of js_sys_user_data_scope
-- ----------------------------

-- ----------------------------
-- Table structure for js_sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `js_sys_user_role`;
CREATE TABLE `js_sys_user_role` (
  `user_code` varchar(100) NOT NULL COMMENT '用户编码',
  `role_code` varchar(64) NOT NULL COMMENT '角色编码',
  PRIMARY KEY (`user_code`,`role_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户与角色关联表';

-- ----------------------------
-- Records of js_sys_user_role
-- ----------------------------

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
-- Table structure for test_data
-- ----------------------------
DROP TABLE IF EXISTS `test_data`;
CREATE TABLE `test_data` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `test_input` varchar(200) DEFAULT NULL COMMENT '单行文本',
  `test_textarea` varchar(200) DEFAULT NULL COMMENT '多行文本',
  `test_select` varchar(10) DEFAULT NULL COMMENT '下拉框',
  `test_select_multiple` varchar(200) DEFAULT NULL COMMENT '下拉多选',
  `test_radio` varchar(10) DEFAULT NULL COMMENT '单选框',
  `test_checkbox` varchar(200) DEFAULT NULL COMMENT '复选框',
  `test_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '日期选择',
  `test_datetime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '日期时间',
  `test_user_code` varchar(64) DEFAULT NULL COMMENT '用户选择',
  `test_office_code` varchar(64) DEFAULT NULL COMMENT '部门选择',
  `test_area_code` varchar(64) DEFAULT NULL COMMENT '区域选择',
  `test_area_name` varchar(100) DEFAULT NULL COMMENT '区域名称',
  `status` char(1) NOT NULL DEFAULT '0' COMMENT '状态（0正常 1删除 2停用）',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `remarks` varchar(500) DEFAULT NULL COMMENT '备注信息',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='测试数据';

-- ----------------------------
-- Records of test_data
-- ----------------------------

-- ----------------------------
-- Table structure for test_data_child
-- ----------------------------
DROP TABLE IF EXISTS `test_data_child`;
CREATE TABLE `test_data_child` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `test_sort` int(11) DEFAULT NULL COMMENT '排序号',
  `test_data_id` varchar(64) DEFAULT NULL COMMENT '父表主键',
  `test_input` varchar(200) DEFAULT NULL COMMENT '单行文本',
  `test_textarea` varchar(200) DEFAULT NULL COMMENT '多行文本',
  `test_select` varchar(10) DEFAULT NULL COMMENT '下拉框',
  `test_select_multiple` varchar(200) DEFAULT NULL COMMENT '下拉多选',
  `test_radio` varchar(10) DEFAULT NULL COMMENT '单选框',
  `test_checkbox` varchar(200) DEFAULT NULL COMMENT '复选框',
  `test_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '日期选择',
  `test_datetime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '日期时间',
  `test_user_code` varchar(64) DEFAULT NULL COMMENT '用户选择',
  `test_office_code` varchar(64) DEFAULT NULL COMMENT '部门选择',
  `test_area_code` varchar(64) DEFAULT NULL COMMENT '区域选择',
  `test_area_name` varchar(100) DEFAULT NULL COMMENT '区域名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='测试数据子表';

-- ----------------------------
-- Records of test_data_child
-- ----------------------------

-- ----------------------------
-- Table structure for test_tree
-- ----------------------------
DROP TABLE IF EXISTS `test_tree`;
CREATE TABLE `test_tree` (
  `tree_code` varchar(64) NOT NULL COMMENT '节点编码',
  `parent_code` varchar(64) NOT NULL COMMENT '父级编号',
  `parent_codes` varchar(2000) NOT NULL COMMENT '所有父级编号',
  `tree_sort` decimal(10,0) NOT NULL COMMENT '本级排序号（升序）',
  `tree_sorts` varchar(1200) NOT NULL COMMENT '所有级别排序号',
  `tree_leaf` char(1) NOT NULL COMMENT '是否最末级',
  `tree_level` decimal(4,0) NOT NULL COMMENT '层次级别',
  `tree_names` varchar(2000) NOT NULL COMMENT '全节点名',
  `tree_name` varchar(200) NOT NULL COMMENT '节点名称',
  `status` char(1) NOT NULL DEFAULT '0' COMMENT '状态（0正常 1删除 2停用）',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `remarks` varchar(500) DEFAULT NULL COMMENT '备注信息',
  PRIMARY KEY (`tree_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='测试树表';

-- ----------------------------
-- Records of test_tree
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
