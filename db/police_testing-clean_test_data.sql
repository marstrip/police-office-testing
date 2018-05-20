/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50534
Source Host           : localhost:3306
Source Database       : police_testing

Target Server Type    : MYSQL
Target Server Version : 50534
File Encoding         : 65001

Date: 2018-05-20 23:25:18
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for case_analyze
-- ----------------------------
DROP TABLE IF EXISTS `case_analyze`;
CREATE TABLE `case_analyze` (
  `case_id` varchar(100) NOT NULL,
  `case_name` varchar(200) DEFAULT NULL,
  `case_level` varchar(100) DEFAULT NULL,
  `case_type` varchar(100) DEFAULT NULL,
  `case_content` mediumtext,
  `create_date` datetime DEFAULT NULL,
  `creator_id` varchar(100) DEFAULT NULL,
  `creator_name` varchar(100) DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  `enable` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`case_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of case_analyze
-- ----------------------------

-- ----------------------------
-- Table structure for inform_notice
-- ----------------------------
DROP TABLE IF EXISTS `inform_notice`;
CREATE TABLE `inform_notice` (
  `inform_id` varchar(200) NOT NULL,
  `inform_name` varchar(200) DEFAULT NULL,
  `inform_content` mediumtext,
  `create_date` datetime DEFAULT NULL,
  `creator_id` varchar(100) DEFAULT NULL,
  `creator_name` varchar(100) DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  `enable` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`inform_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of inform_notice
-- ----------------------------

-- ----------------------------
-- Table structure for qa_sheet
-- ----------------------------
DROP TABLE IF EXISTS `qa_sheet`;
CREATE TABLE `qa_sheet` (
  `qa_id` varchar(100) NOT NULL,
  `question_content` text,
  `question_answer` text,
  `enable` varchar(10) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `creator_id` varchar(100) DEFAULT NULL,
  `creator_name` varchar(100) DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  `qa_status` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`qa_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qa_sheet
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role_menu
-- ----------------------------
INSERT INTO `role_menu` VALUES ('1', '1', '1', '业务管理', 'admin');
INSERT INTO `role_menu` VALUES ('2', '1', '2', '系统功能', 'admin');
INSERT INTO `role_menu` VALUES ('3', '1', '3', '考试中心', 'admin');

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
) ENGINE=InnoDB AUTO_INCREMENT=1043 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_login_log
-- ----------------------------
INSERT INTO `sys_login_log` VALUES ('1042', 'admin', '管理员', '丰台区长辛店派出所', null, null, null, '2018-05-20 23:23:04', '1');

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
) ENGINE=InnoDB AUTO_INCREMENT=305 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES ('1', '业务功能', '0', '1', '', '', '1');
INSERT INTO `sys_menu` VALUES ('2', '系统功能', '0', '2', '', '', '1');
INSERT INTO `sys_menu` VALUES ('3', '考试中心', '0', '3', '', '', '1');
INSERT INTO `sys_menu` VALUES ('4', '退出', '0', '4', '', '/logout', '1');
INSERT INTO `sys_menu` VALUES ('103', '案例评析', '1', '3', '', '/caseAnalyze/jsp', '1');
INSERT INTO `sys_menu` VALUES ('104', '通知公告', '1', '4', '', '/informNotice/jsp', '1');
INSERT INTO `sys_menu` VALUES ('105', '答疑互动', '1', '5', '', '/qa/jsp', '1');
INSERT INTO `sys_menu` VALUES ('106', '课件中心', '1', '6', '', '/testSelf/jsp', '1');
INSERT INTO `sys_menu` VALUES ('201', '用户管理', '2', '1', '', '/user/jsp', '1');
INSERT INTO `sys_menu` VALUES ('301', '上传试题', '3', '1', '', '/question/uploadQuestionJsp', '1');
INSERT INTO `sys_menu` VALUES ('302', '生成试卷', '3', '2', '', '/testCreate/jsp', '1');
INSERT INTO `sys_menu` VALUES ('303', '试卷管理', '3', '3', '', '/testPaper/jsp', '1');
INSERT INTO `sys_menu` VALUES ('304', '试题管理', '3', '4', '', '/question/jsp', '1');

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('1', 'admin', '1', '管理员');

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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('1', 'admin', '管理员', '1', null, null, '丰台区长辛店派出所', null, 'admin', '111111');
INSERT INTO `sys_user` VALUES ('2', '0101001', '张三', '1', null, null, '云岗', null, '0101001', '111111');
INSERT INTO `sys_user` VALUES ('3', '10001', '张三', '1', null, null, '测试派出所1', null, '10001', '111111');
INSERT INTO `sys_user` VALUES ('4', '10002', '李四', '1', null, null, '测试派出所2', null, '10002', '111111');

-- ----------------------------
-- Table structure for testing_log
-- ----------------------------
DROP TABLE IF EXISTS `testing_log`;
CREATE TABLE `testing_log` (
  `auto_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(100) DEFAULT NULL,
  `user_name` varchar(100) DEFAULT NULL,
  `department_name` varchar(100) DEFAULT NULL,
  `department_id` varchar(100) DEFAULT NULL,
  `testing_type` varchar(100) DEFAULT NULL,
  `test_paper_id` varchar(200) DEFAULT NULL,
  `test_paper_name` varchar(200) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `score` int(10) DEFAULT NULL,
  PRIMARY KEY (`auto_id`)
) ENGINE=InnoDB AUTO_INCREMENT=119 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of testing_log
-- ----------------------------

-- ----------------------------
-- Table structure for test_paper
-- ----------------------------
DROP TABLE IF EXISTS `test_paper`;
CREATE TABLE `test_paper` (
  `test_paper_id` varchar(200) NOT NULL,
  `test_paper_name` varchar(200) DEFAULT NULL COMMENT '试卷名称',
  `test_paper_type` varchar(200) DEFAULT NULL COMMENT '试卷类型',
  `begin_date` datetime DEFAULT NULL,
  `test_date` datetime DEFAULT NULL COMMENT '开始考试的日期',
  `test_time` int(11) DEFAULT NULL COMMENT '考试时长',
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
  `test_questions_id` varchar(200) NOT NULL COMMENT '题目id',
  `test_questions_number` int(11) DEFAULT NULL COMMENT '题号',
  `answer_count` int(11) DEFAULT '0' COMMENT '答题次数',
  `fail_count` int(11) DEFAULT '0' COMMENT '答对次数',
  PRIMARY KEY (`auto_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3523 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of test_paper_question
-- ----------------------------

-- ----------------------------
-- Table structure for test_question
-- ----------------------------
DROP TABLE IF EXISTS `test_question`;
CREATE TABLE `test_question` (
  `test_questions_id` varchar(200) NOT NULL,
  `test_questions_name` text NOT NULL COMMENT '题干',
  `test_question_selects` text COMMENT '选项',
  `correct_answer` varchar(100) NOT NULL COMMENT '正确答案',
  `test_question_type` varchar(100) DEFAULT NULL COMMENT '试题类型',
  `upload_file_id` varchar(100) DEFAULT NULL,
  `creator_id` varchar(200) DEFAULT NULL COMMENT '创建人id',
  `creator_name` varchar(200) DEFAULT NULL COMMENT '创建人姓名',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `enable` varchar(50) DEFAULT '1' COMMENT '是否可用，1为发布，0为停用',
  PRIMARY KEY (`test_questions_id`),
  KEY `upload_file_id` (`upload_file_id`),
  CONSTRAINT `test_question_ibfk_1` FOREIGN KEY (`upload_file_id`) REFERENCES `upload_file_log` (`upload_file_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of test_question
-- ----------------------------
INSERT INTO `test_question` VALUES ('0015c81647a74859959c3ff41186e2b7', '辩护律师乙在办理甲抢夺一案中，了解到甲实施抢夺时携带凶器，但办案机关并未掌握这一事实对于该事实，乙应当告知公安机关', null, 'No', '3', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('01b2a1160cc84fc8929d9c61cbef93bc', '赵某因涉嫌抢劫犯罪被抓获，作案时未满18周岁，案件起诉到人民法院时已年满18周岁下列说法正确的是（）', 'A．如赵某被判处5年有期徒刑以下刑罚，应当对其犯罪记录予以封存;B．对赵某不可以公开审理;C．对赵某可以适用死刑;D．如赵某没有委托辩护人，应当由其自行辩护&nbsp;', 'A', '1', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('01bca739f31d4856b3166d446bb55ebe', '下列关于侦查羁押期限的选项正确的是（）', 'A．甲涉嫌抢夺罪被逮捕，在公安机关侦查期间发现甲涉嫌抢劫致人死亡案件两起，对甲的羁押期限重新计算;B．涉嫌拐卖儿童罪的乙不讲真实姓名，自查清其身份之日起计算羁押期限;C．对涉嫌合同诈骗犯罪的丙作笔迹鉴定的时间不计入侦查羁押期限;D．对涉嫌故意伤害犯罪的丁作精神病鉴定的时间不计入侦查羁押期限&nbsp;', 'ABD', '2', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('0355fb82e9964cfb8b255679755a8dc2', '甲到某地旅游，在该地某酒吧与一法国游客乙发生口角，继而打斗起来，甲用酒瓶将乙打伤，后经鉴定为轻伤对本案的立案管辖，下列说法中正确的是（）', 'A．乙可以向人民法院提出自诉;B．本案只能通过公安机关立案侦查，追究甲的刑事责任;C．应当由人民检察院对本案进行立案侦查;D．如果乙向公安机关控告，当地公安机关应当受理&nbsp;', 'AD', '2', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('04528747855f46e38f79cc745be34aaf', '犯罪嫌疑人郑某涉嫌电信诈骗犯罪被批准逮捕，在2个月的侦查羁押期限届满时案件仍然不能侦查终结，而且报请延长羁押期限未获批准，则对郑某应当予以释放；需要继续查证的，可以对其取保候审或者监视居住', null, 'Yes', '3', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('0611742be5754ef797bc1eb6f00ff15f', '李某因涉嫌抢劫罪被县公安局刑事拘留，其聘请的律师刘某要求会见李某，因李某的同伙王某在逃，县公安局认为侦查过程需要保密，便以此为由不批准律师刘某的会见', null, 'No', '3', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('064cdc86d2114a2fb898d11c46e6460d', '甲县公安机关在侦查古某涉嫌盗窃案件过程中，发现古某盗窃数额不够刑事立案标准，且无其他恶劣情节，应当撤销案件，但古某已被甲县人民检察院批准逮捕下列说法正确的是（）', 'A．立即释放古某，发给其释放证明;B．对古某转为取保候审或监视居住;C．经甲县人民检察院批准后，对古某进行释放;D．对古某不予行政处罚&nbsp;', 'A', '1', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('06cea86fec664494a67915b3813495a8', '某市公安机关发现外国人汤姆死在宾馆的客房内，但死因不明，公安机关欲解剖尸体查明死因，在解剖前应当通知死者家属或者其所属国家驻华使、领馆有关官员到场，并请死者家属或者其所属国家驻华使、领馆有关官员在解剖尸体通知书上签名或者盖章死者家属或者其所属国家驻华使、领馆有关官员拒不到场或者拒绝签名、盖章的，不可以解剖尸体', null, 'No', '3', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('07ac69da6b7a434ba82d96eaa3833641', '朱某、谢某因涉嫌抢劫罪被甲省乙市公安局立案侦查朱某聘请的律师陈某在为其辩护时帮助其毁灭证据下列说法正确的是（）', 'A.陈某可以同时为朱某、谢某提供辩护;B.甲省公安厅可以指定乙市丙区公安局对陈某立案侦查;C.甲省公安厅可以对陈某立案侦查;D.丁市公安局被甲省公安厅指定对陈某管辖后，侦查终结应当向甲省人民检察院移送起诉&nbsp;', 'C', '1', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('07cb7b4f53ca48148def8fb2d5de567a', '邱某在某市甲区盗窃，又在该市乙区盗窃，逃窜至该市丙区时，被丙区公安机关抓获关于本案的管辖，下列说法中错误的是（）', 'A．由于甲区是最初犯罪地，应当由甲区公安机关管辖;B．由于丙区公安机关最初受理，应当由丙区公安机关管辖;C．甲区、乙区、丙区公安机关都有管辖权;D．甲区、乙区公安机关有管辖权，丙区公安机关没有管辖权&nbsp;', 'ABC', '2', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('08ab66a632ed4a378a49e993e2162845', '甲因涉嫌诈骗罪被A县公安机关依法立案侦查下列说法不正确的是（）', 'A．甲自第一次被讯问或采取强制措施之日起，可以委托律师作为辩护人;B．甲若要求委托辩护人，只能由自己委托;C．如果甲在被拘留或逮捕后提出委托辩护律师的要求，看守所应当及时将其请求转达给办案部门，办案部门应当及时向甲委托的辩护律师或者律师事务所转达该项请求;D．甲在押时仅提出委托律师的要求，但提不出具体对象的，侦查机关应当及时通知甲的监护人、近亲属代为委托辩护律师&nbsp;', 'B', '1', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('0a53d96fd4b04622a600b0a2d0027e88', '(17年新增试题)下列辩护律师收集的有关犯罪嫌疑人证据中，应当及时告知公安机关的是（）', 'A．不在犯罪现场;B．未达到刑事责任年龄;C．属于依法不负刑事责任的精神病人;D．曾因勇救落水儿童被政府表彰&nbsp;', 'ABC', '2', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('0b0e9992f5994f009855c8ca832a5d4d', '钱某是某市公安机关在查案件的证人，办案人员通过以下手段获取的钱某的证人证言，不能作为定案根据的有（）', 'A．办案人员以不给证人休息的手段获取的证言;B．办案人员以殴打证人的手段获取的证言;C．在钱某处于深度酒醉，不能正确表达自己真实想法的情况下，办案人员取得的证言;D．询问笔录上没有填写询问人、记录人的姓名&nbsp;', 'ABC', '2', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('0b15e87a2d144bb3b8b0e9617d2f078a', '贾某因涉嫌诈骗罪被D县公安机关刑事拘留在拘留期间，贾某不享有的诉讼权利是（）', 'A．拒绝委托律师，自行辩护;B．委托辩护律师复印案卷材料;C．聘请辩护律师提供法律咨询，代理申诉、控告;D．对与本案无关的问题拒绝回答&nbsp;', 'B', '1', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('0b49e769c4c9465d841b1aae4516ffe7', '李某以营利为目的，为某非洲国家的人员提供办理我国签证所需要的邀请函件，公安机关出入境部门可按照骗取出境证件对其进行处罚。&nbsp;', null, 'No', '3', '5bac34701af4425692eef413797efab1', null, null, '2018-05-20 23:23:25', '2018-05-20 23:23:25', '1');
INSERT INTO `test_question` VALUES ('0bb3b3d2fb204a33a86c1a092b840e0f', '依据《刑事诉讼法》的规定，下列情形不适用技术侦查措施的是（）', 'A.李某闯红灯造成邓某重伤后逃逸;B.张某盗窃5000元后潜逃被通缉;C.王某涉嫌贩卖毒品20公斤;D.赵某涉嫌组织恐怖组织罪&nbsp;', 'A', '1', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('0bd012dcfb3043af808202ab447fa426', '(17年新增试题)犯罪嫌疑人黎某通过网络发布Q币等游戏商品购买信息，诱骗受害人加“客服”的QQ号码，“客服”通过第三方支付平台向受害人发布支付链接，从而将受害人的钱转走黎某非法获利500余万元关于此案，下列说法正确的是（）', 'A．鉴于该案受害人分布全国10余省市，为有利于查清犯罪事实，可以指定主要犯罪地公安机关管辖;B．如黎某同时涉嫌盗窃罪，侦办此案的;C．该案被指定某市公安局管辖后，需要提请批准逮捕、移送审查起诉、提起公诉的，应当由该市人民检察院、人民法院受理;D．如该案在逃犯罪嫌疑人黎某被某县公安局抓获，该县公安局可以将其交由原管辖的公安机关管辖&nbsp;', 'ABCD', '2', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('0c9722193aa14d36995be9710daf9cd8', '钱某伙同自己的女朋友严某采用色诱方式实施抢劫作案3起，后被抓获关于本案，下列说法正确的是（　）', 'A．公安机关侦查人员（男）有权搜查严某的身体;B．搜查严某的身体只能由女工作人员进行;C．公安机关可以对钱某的家进行搜查，没有紧急情形时，必须出示搜查证;D．公安机关侦查人员王某可单独执行搜查&nbsp;', '&nbsp; BC', '2', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('0d51e6e0d07f4eeab45354588a235168', '甲市公安机关法制部门在审核张某涉嫌故意杀人案件中，发现有四份讯问笔录存有瑕疵，即使在有关办案人员补正或者作出合理解释的情况下，仍不能采用的讯问笔录是（）', 'A．第一份讯问笔录，没有记录告知张某的诉讼权利义务内容;B．第二份讯问笔录，进行讯问的民警没有签名;C．第三份讯问笔录，张某没有签名;D．第四份讯问笔录，填写的讯问时间有误&nbsp;', 'C', '1', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('0d54d94851564f9a9c1b042f4feaf9c4', '公安机关破获一起团伙诈骗案件，扣押一批诈骗所得的汽车和金器，冻结犯罪嫌疑人银行账户中诈骗所得的人民币100万元下列关于涉案财物和证据处理的说法正确的是（）', 'A．扣押金器，应当拍照或者录像;B．公安机关对扣押、冻结的属于被害人的合法财产，应当及时返还;C．对作为证据使用的实物应当随案移送，对不宜移送的，应当将其清单、照片或者其他证明文件随案移送;D．人民法院作出的判决，应当对扣押、冻结的财物及其孳息作出处理&nbsp;', 'ABCD', '2', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('0d6a127f680e4449b0c29dcfe2fcba50', '张某因涉嫌犯罪被A县人民检察院取保候审，由A县B公安派出所执行张某有正当理由须离开A县，应当由A县公安局批准', null, 'No', '3', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('0dbafdc7da0943239b01bd96191993bc', '在对张某涉嫌恐怖活动犯罪案件侦查过程中，其辩护律师刘某经公安机关许可会见张某后，向公安机关提出了无罪辩护的书面意见，公安机关认为刘某的意见不正确，未将其书面意见附卷', null, 'No', '3', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('0dda012da6314bb6aa80ca949ede0c2a', '在办理以王某为首的恐怖活动组织犯罪案件中，证人李某为公安机关作证，其有权要求公安机关保障其子女和同胞兄妹的人身安全', null, 'Yes', '3', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('0e35758214954279812e1a7757da0e1b', '甲和乙因共同抢劫被A区公安机关立案侦查A区公安机关决定对二人采取监视居住强制措施，甲在住处执行，乙因无固定住处而在指定的居所执行对此，下列说法正确的是（）', 'A．A区公安机关决定乙在指定的居所执行的，要经上一级公安机关批准;B．除无法通知的以外，应当在执行监视居住后24小时以内，通知二人的家属;C．二人委托辩护人，都适用在押的犯罪嫌疑人委托辩护人的规定;D．只有乙监视居住的期限应当折抵刑期&nbsp;', 'CD', '2', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('0f01a86fb7f44a4d9d1366274b36de75', '以下属于检察机关管辖的案件是（）', 'A．公司工作人员贾某利用职务便利非法收受他人财物，为他人谋取利益，数额较大;B．公司工作人员王某在经济往来中，利用职务便利，违反国家规定，收受手续费归个人所有;C．国有公司中从事公务的李某利用职务便利非法收受他人财物，为他人谋取利益，数额较大;D．国有公司张某业余时间利用自己的技术帮助某私营企业改造设备，谋取个人利益，数额较大&nbsp;', 'C', '1', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('0f03654f6a8e4347b0b0a336744beff8', '外国人有下列（）行为的，属于非法就业。', 'A．未按照规定取得工作许可在中国境内工作的;B．未按照规定取得工作类居留证件在中国境内工作的;C．外国留学生违反勤工助学管理规定，超出规定的岗位范围在中国境内工作的;D．外国留学生违反勤工助学管理规定，超出规定的时限在中国境内工作的&nbsp;', 'ABCD', '2', '5bac34701af4425692eef413797efab1', null, null, '2018-05-20 23:23:25', '2018-05-20 23:23:25', '1');
INSERT INTO `test_question` VALUES ('0fd33fd5adf74d518d3323475530c243', '某公司被盗手提电脑一台，侦查人员根据秦某的证言，发现王某有重大嫌疑王某一开始不承认，但后来经过刑讯逼供承认了盗窃事实，并供述已将电脑卖给刘某，同时还说他之所以拿公司的电脑是因为公司拖欠了6个月的工资下列可以作为证据的有（　）', 'A．王某承认盗窃事实的供述;B．王某有关公司拖欠他工资的辩解;C．秦某的证言;D．手提电脑&nbsp;', 'BCD', '2', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('0fd4ca6e96d14479976c66889152bba9', '某故意伤害致人死亡案的案发时间为晚上9时左右，现场周围没有光源，证人甲离案发中心现场约100米，其自称看到犯罪嫌疑人持刀先后捅了被害人胸部、腹部两刀，犯罪嫌疑人否认下列说法正确的是（）', 'A．为了确定证人证言的可信度，经公安机关办案部门负责人批准，可以进行侦查实验;B．侦查实验的情况应当写成笔录，由参加实验的人签名;C．如果辩护人对该证人证言有异议，人民法院认为证人甲有必要出庭作证的，证人甲应当出庭作证;D．证人甲可以向公安机关提出保护其人身安全的请求&nbsp;', 'BCD', '2', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('10741eae603f4c728a47c539314f0c35', '公安机关拘留王某后向人民检察院提请批捕人民检察院认为王某可能被判处有期徒刑以上刑罚，采取取保候审不致发生社会危险性，作出不批准逮捕决定收到人民检察院不批准逮捕王某的决定书后，公安机关认为有错误，拟采取下列措施，其中正确的是（）', 'A.对王某变更强制措施为取保候审;B.继续拘留王某，并向上一级人民检察院要求复议;C.在收到不批准逮捕决定书后3日内将执行回执送达作出决定的人民检察院;D.对王某变更强制措施为监视居住&nbsp;', 'AC', '2', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('11800d3d82214d19a98a583283fe92b5', '(17年新增试题)马某收到中奖的短信，向指定的银行账户汇出了1万元，发现被骗后向银行举报公安机关在“电信网络新型违法犯罪交易风险事件管理平台”上收到要求止付的信息下列属于公安机关在发出紧急止付指令前应当进行审查的是（）', 'A．《紧急止付申请表》;B．马某的身份证件;C．马某报案事项的真实性;D．马某被骗的案值是否已达到追诉标准&nbsp;', 'AB', '2', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('123e4907ca414e3da0c90dc1a47e24de', '家住A市的李某因经济困难，遂产生抢劫念头，后以打车为名拦住一辆出租车，抢走女司机现金1000元随后，将出租车劫往B市，将女司机强奸强奸后又将车劫往C市路边一偏僻处把女司机杀害后抛出车外，恰遇C市治安联防队员进行巡查被抓获在确定案件管辖权时，A、B、C三市的公安机关对管辖权产生争议，协商不成，该案应（）', 'A．由A市公安机关管辖;B．由B市公安机关管辖;C．由C市公安机关管辖;D．由共同的上一级公安机关指定管辖&nbsp;', 'D', '1', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('1301b06fab6b443e887ecff33df86128', '下列案件应当由公安机关立案侦查的是（）', 'A．某县县长贿赂选民的案件;B．某县富商非法拘禁长期欠其钱款不还的朱某，要求其家人限期还钱的案件;C．某侦查人员对犯罪嫌疑人刑讯逼供致人重伤的案件;D．某局长指使别人对举报其索贿受贿的下属郭某报复陷害的案件&nbsp;', 'B', '1', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('146ebe3fef5d4d3290ffa39d1f7a24a9', '公安机关连续接到群众举报称，在某市步行街经常发生扒窃手机案件，经过侦查，一举抓获了扒窃手机的3名女犯罪嫌疑人，为收集证据，打击犯罪，决定对该3名女犯罪嫌疑人进行检查下列关于检查的做法违反法律规定的是（）', 'A．检查可以提取指纹信息，采集血液、尿液等生物样本;B．犯罪嫌疑人如果拒绝检查可以强制检查;C．检查该3名犯罪嫌疑人，可以由男医师进行;D．检查时可不需见证人在场&nbsp;', 'D', '1', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('148552a3efab4588aa06ca4d9e7f54ca', '下列有关对身份不明的犯罪嫌疑人的处理说法正确的是（）', 'A．犯罪嫌疑人甲不讲真实姓名、住址，身份不明的，应当对其身份进行调查;B．对于涉嫌盗窃犯罪的乙，因其身份不明，侦查羁押期限自查清其身份之日起计算;C．对于涉嫌抢夺罪但身份不明的丙，侦查取证从查清其身份之日起进行;D．对于涉嫌强奸罪的丁，犯罪事实清楚，证据确实、充分，确实无法查清其身份的，也可以按其自报的姓名起诉、审判&nbsp;', 'ABD', '2', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('14996eef2a124776aaa92f2dfb7fb4b0', '某公司向公安机关报案称，公司工作人员高某利用职务便利侵占了公司公款200万元公安机关在侦查中发现，高某有存款210万元，利用侵占的公款购买的汽车一部（价值20万元）和住房一套（价值180万元），并且高某还私藏军用手枪一把公安机关对上述财物所作的处理错误的是（）', 'A．冻结存款210万元;B．扣押汽车一部;C．查封住房一套;D．扣押军用手枪一把&nbsp;', 'A', '1', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('16aeb1d1af6542c1a0b70a5fe1319c4f', '(17年新增试题)金某、杨某煽动实施恐怖活动，金某被当场抓获，杨某逃跑之后，金某因涉嫌煽动实施恐怖活动罪被刑事拘留，辩护律师王某提出会见申请下列属于公安机关应当作出不予许可决定的情形是（）', 'A．金某曾表露出想找人帮忙作伪证;B．金某有逃跑的迹象;C．杨某在逃，尚未抓获归案;D．金某父亲与本案有牵连，已经逃跑&nbsp;', 'ABD', '2', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('1718a424b4f249f689b8d5aedd9a4acd', '某树林里发现一具无名男尸下列说法正确的是（）', 'A．侦查人员对现场进行勘验时不得少于2人;B．勘验现场时，应当邀请与案件无关的公民作为见证人;C．为了确定死因，可以解剖尸体，因无法查明尸体身份，可不通知死者家属到场;D．公安机关进行勘验后，人民检察院要求复验的，公安机关应当进行复验&nbsp;', 'ABCD', '2', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('17261ab0e806477a9e5c7553cc053915', '公安机关对政协委员采取强制措施，下列说法错误的是（）', 'A．对县政协委员甲取保候审，应当将有关情况通报给县政协组织;B．对市、县两级政协委员乙取保候审，应当将有关情况通报给市、县两级政协组织;C．对县政协委员丙指定居所监视居住前，应当向县政协组织通报情况;D．对县政协委员丁执行逮捕，因情况紧急，可在执行以后及时通报县政协组织&nbsp;', 'C', '1', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('172b030b8e2a49ef992f9ed950eb8a02', '对下列非法入境的外国人，可以适用拘留审查的有（）。', 'A．怀孕的朝鲜妇女;B．哺乳自己不满1周岁婴儿的越南妇女;C．患有严重心脏病的尼日利亚人;D．65周岁的利比亚人&nbsp;', 'D', '1', '5bac34701af4425692eef413797efab1', null, null, '2018-05-20 23:23:25', '2018-05-20 23:23:25', '1');
INSERT INTO `test_question` VALUES ('1760e7a04df144e490df0d69bebd694f', '张某因涉嫌故意伤害罪，被甲市公安局乙区分局决定刑事拘留，并由刑侦大队民警执行执行拘留后，发现张某系甲市人大代表，下列做法正确的是（）', 'A.暂缓释放张某，并报告甲市公安局;B.立即释放张某，并报告甲市公安局乙区分局;C.暂缓释放张某，并报告甲市人大常委会;D.立即释放张某，并通报甲市人大常委会&nbsp;', 'B', '1', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('18cc29f7312c4c9187fca611e64fc576', '民警甲、乙到犯罪嫌疑人郑某家对其执行刑事传唤时，发觉通缉犯王某可能藏在郑某家中，此时，甲、乙都没有带搜查证，但仍可以对郑某家进行搜查', null, 'No', '3', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('192a5b5c4946433b8baf947e0ae0715d', '甲、乙各纠集一伙人在体育馆门前斗殴，双方互有损伤，被巡逻民警当场抓获，巡逻民警立即将他们控制住并带至公安机关进行讯问下列说法正确的是()', 'A．巡逻民警经出示工作证件，可以对这两伙人口头传唤;B．讯问民警应当在讯问笔录中注明传唤的起止时间;C．对这两伙人可以先采取继续盘问措施;D．对现场围观的目击者可一并传唤到公安机关提供证词&nbsp;', 'A', '1', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('19760904812241d596ee0bc9d8cc1ef0', '公安机关在侦办钱某诈骗案时，对钱某的住处进行了搜查，并对搜查过程中所获取的有关物品进行了扣押下列说法正确的是（）', 'A．搜查时发现的涉案物品，办案人员应当进行扣押;B．进行扣押时，应制作扣押清单;C．持有人拒绝交出应当扣押的物品的，公安机关不得强制扣押，应当予以登记;D．公安机关在侦查过程中，如果发现其中被扣押的某些物品与本案无关时，应当在3日以内返还物品持有人&nbsp;', 'ABD', '2', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('1a193c588f9c49b4937bc60a85bac9c0', '罗马尼亚人玛丽由于怀孕不适用拘留审查，被限制活动范围。下列说法正确的是（）。', 'A．应当按照要求接受审查;B．未经公安机关批准，不得离开限定的区域;C．限制活动范围的期限不得超过60日;D．对国籍、身份不明的外国人，限制活动范围期限自查清其国籍、身份之日起计算&nbsp;', 'ABCD', '2', '5bac34701af4425692eef413797efab1', null, null, '2018-05-20 23:23:25', '2018-05-20 23:23:25', '1');
INSERT INTO `test_question` VALUES ('1a75acb06bce470590d4b881c6a51b00', '公安机关对未成年犯罪嫌疑人小可（男）进行讯问，下列说法正确的是（）', 'A．在讯问时，应当通知小可的父亲或母亲到场;B．如果小可的父母不能到场，也可以通知小可的其他成年亲属到场;C．如果小可的父母是共犯，可以通知小可所在学校的代表到场;D．应当有女工作人员在场&nbsp;', 'ABC', '2', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('1ab5d0f498f846aeb9c0e1663abd05e5', '下列关于某县公安机关指定居所监视居住的做法，表述正确的是（）', 'A．甲涉嫌盗窃罪，在当地有固定住所，但公安机关认为甲不宜与其同案犯妻子同住一起，便指定居所对其监视居住;B．乙涉嫌抢劫罪，在当地没有固定住所，公安机关指定在看守所执行监视居住;C．丙涉嫌参加黑社会性质组织罪，在当地有固定住所，公安机关认为在其住所执行监视居住有碍侦查，便在指定的居所执行;D．丁涉嫌叛逃罪，在当地有固定住所，公安机关认为在其住所执行监视居住有碍侦查，经报上一级公安机关批准，便在指定的居所执行&nbsp;', 'D', '1', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('1ac679932fd64b6aa2f670a3207e98ba', '下列关于侦查羁押期限的说法错误的是（）', 'A．对犯罪嫌疑人逮捕后的侦查羁押期限一般不得超过2个月;B．案情复杂，2个月侦查羁押期限届满不能终结的案件，经省、自治区、直辖市人民检察院批准，可以延长1个月;C．对于重大的犯罪集团案件，经省、自治区、直辖市人民检察院批准，可以延长2个月;D．在侦查期间，发现犯罪嫌疑人另有重要罪行的，应当自发现之日起5日内报县级以上公安机关负责人批准后，重新计算侦查羁押期限&nbsp;', 'B', '1', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('1b7d26576d2445f3bf0ca1c6edbbfc6e', '甲对公安机关在侦查期间对自己与案件无关的财物进行查封、扣押、冻结的措施不服，向该公安机关提出控告，公安机关对此作出继续查封、扣押、冻结的处理决定，甲不服，可以向（）申诉', 'A．该公安机关;B．上级人民检察院;C．同级人民检察院;D．同级人民法院&nbsp;', 'C', '1', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('1cba327e3e5d46488bd3f8e7f28aab7b', '某市公安机关根据商场电子监控系统拍摄的图像资料抓获一盗窃团伙，收缴赃款8万余元，并缴获金银首饰及CD机、电视剧录像带等赃物下列说法中正确的是（）', 'A．现金、CD机、首饰属于物证;B．电子监控系统拍摄的图像资料属于视听资料;C．电视剧录像带属于视听资料;D．电子监控系统拍摄的图像资料属于电子数据，电视剧录像带属于视听资料&nbsp;', 'AB', '2', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('1dbc2345d2094980be92862da06c1ecb', '被告人甲因抢劫被抓获，甲除自己在刑事案件中行使辩护权外，还可以委托的辩护人有()', 'A．某律师事务所的律师王某;B．甲所在单位推荐的法律顾问李某;C．甲的哥哥，处于缓刑考验期间;D．甲的父亲，因强奸罪被判刑4年，现已刑满释放&nbsp;', 'ABD', '2', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('1e6dde774a5a447a899ec52709794481', '(17年新增试题)某市公安局在侦办电信网络诈骗犯罪案件时，发现涉案电子数据量大，无法提取针对此情形,该市公安局办案部门负责人可以批准冻结涉案的电子数据', null, 'No', '3', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('1f3cdf1b7e314066b69b983d288ccfc1', '下列不应当追究刑事责任的是（　）', 'A．犯罪嫌疑人甲和被害人乙在审查起诉阶段就赔偿达成协议，被害人乙要求不追究甲的刑事责任;B．甲侵占案中被害人乙没有起诉;C．丙犯罪情节轻微，对社会危害不大;D．犯罪嫌疑人丁在被抓前自杀身亡&nbsp;', 'BD', '2', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('1fbed760f1fe433e83c785a064363765', '(17年新增试题)孔某支付给钱某500万元货款,后得知钱某欲用该资金支付某合同的订金为达到让钱某延缓支付的目的，孔某到银行举报钱某的账户是电信诈骗账户后公安机关发出了紧急止付指令，银行对钱某的账户进行了止付操作，造成钱某一定的损失下列说法正确的是（）', 'A．紧急止付指令是由公安机关发出的，钱某的损失由公安机关承担;B．紧急止付指令是因孔某的恶意举报引起的，钱某的损失由孔某承担;C．紧急止付是由银行进行操作的，钱某的损失由银行承担;D．钱某的损失，由公安机关、银行与孔某共同承担&nbsp;', 'B', '1', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('201a554f57e046c4960253efdc195a57', '(17年新增试题)范某收到朋友魏某QQ信息称：发生交通意外需支付高额医药费，向其暂借5万元范某向指定的银行账户转账了5万元后一时无法电话联系到魏某，怀疑被骗，要求止付公安机关接到范某的报案，向对方账户开户行总行发出了紧急止付指令，银行进行了止付操作下列说法错误的是（）', 'A．公安机关应当在止付期限内对范某报案事项的真实性进行审查;B．公安机关应当向对方账户所在地银行发送“协助冻结财产通知报文”;C．银行收到“协助冻结财产通知报文”的，应当对相应账户进行冻结;D．银行未收到“协助冻结财产通知报文”的，止付期满后账户自动解除止付&nbsp;', 'B', '1', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('2047338fd1c84e54a5c199f66f715b72', '解某因涉嫌危害国家安全犯罪被公安机关指定居所监视居住，在侦查期间，解某聘请律师初某为其辩护下列说法不正确的是（）', 'A．初某会见解某无须经公安机关许可;B．初某会见解某时有权要求不被监听;C．初某可以了解案件有关情况;D．初某在侦查期间不能提出辩护意见&nbsp;', 'A', '1', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('20902a365b094d0a9c92be70402e4f72', '下列关于刑事拘留的说法正确的是（）', 'A．公安机关拘留人的时候，必须出示拘留证;B．拘留后，应当立即将被拘留人送看守所羁押，至迟不得超过12小时;C．公安机关对被拘留的人，应当在拘留后的48小时以内进行讯问;D．除有碍侦查的情形以外，应当在拘留后48小时以内，通知被拘留人的家属&nbsp;', 'A', '1', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('22020008bae1426486226ff6bbbd6fd4', '刘某涉嫌盗窃罪被公安机关在指定居所监视居住，后被法院判处有期徒刑1年下列说法不正确的是（）', 'A．刘某委托的辩护律师在侦查期间可以向公安机关申请变更强制措施为取保候审;B．监视居住的期间应当折抵刑期;C．不得责令刘某在监视居住期间将居民身份证交公安机关保存;D．刘某在监视居住期间可以不经过执行机关批准会见辩护律师&nbsp;', 'C', '1', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('2214b12c7de748fcaa0404676c9a4d49', '甲市公安局在侦查刘某涉嫌非法集资案时，认为案情重大复杂，因此在侦查阶段即要求人民检察院和人民法院派员介入，对案件的定性、证据收集等问题提起讨论，实行三机关联合办案下列说法正确的是（）', 'A．符合《刑事诉讼法》规定的人民法院、人民检察院和公安机关进行刑事诉讼，应当互相配合的原则;B．体现了我国司法机关与西方国家司法机关本质上的不同;C．违背了法律规定的人民法院、人民检察院和公安机关进行刑事诉讼，应当分工负责的原则;D．符合《刑事诉讼法》惩罚犯罪、保护人民、保障国家安全和社会公共安全、维护社会主义社会秩序的目的&nbsp;', 'C', '1', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('23a8533bf64e4c96b6b0e1fa01ddab72', '马某、宋某、周某是某省A市人，三人长期在本市和其他市时分时合，交叉结伙抢劫作案多起某日，马某和周某二人在该省B市市内抢劫时被B市公安机关当场抓获对于本案的管辖，下列说法正确的是（）', 'A．B市公安机关可以依照法律和有关规定对全部人员和全部案件并案侦查;B．应当将此案移送至A市公安机关;C．应当交由三人都曾作过案的地方公安机关管辖;D．马某、周某由B市公安机关立案侦查，宋某移送至A市公安机关管辖&nbsp;', 'A', '1', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('2431b8338dc44c7d9ba5e312bc308d78', '下列刑事案件中，不应当由公安机关立案侦查的是（）', 'A．某县县长贿赂选民案件;B．某县富商非法拘禁长期欠其钱款不还的朱某，要求其家人限期还钱;C．某侦查人员在一刑事案件中对犯罪嫌疑人刑讯逼供致人重伤;D．某局长指使别人对举报其索贿受贿的下属郭某报复陷害&nbsp;', 'ACD', '2', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('2442d2a3b573427b99780734199e16e6', '犯罪嫌疑人张某因涉嫌抢劫罪被逮捕，张某聘请律师王某为自己提供法律帮助，王某不可以()', 'A．向公安机关了解张某涉嫌的罪名;B．会见张某了解案件有关情况;C．为张某提供法律帮助，代理申诉、控告;D．到公安机关查阅本案卷宗材料&nbsp;', 'D', '1', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('25052d10096040f18304e27723ee6db5', '甲因涉嫌抢夺他人数额较大的财物被公安机关刑事拘留，在需要实施逮捕而证据尚不符合逮捕条件的情况下，公安机关可以对甲取保候审，并可以责令其将护照等出入境证件、驾驶证件交执行机关保存', null, 'Yes', '3', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('25124e1e222b4dcaa22a04ebf79f2dde', '甲、乙二人实施集资诈骗，诈骗总金额为2000余万元，其中，甲是省、市两级人大代表，乙是县人大代表，公安机关在办理该案件过程中，需要对甲、乙采取强制措施下列选项错误的是（　　）', 'A．对甲提请逮捕，只需要报请省人民代表大会主席团或常务委员会许可;B．对乙执行逮捕，需要报请县人民代表大会主席团或常务委员会许可，对其取保候审则不需要;C．对乙传唤、拘留,需要报请县级人民代表大会主席团或常务委员会许可;D．乙被逮捕后在逃，公安机关在自己管辖的区域内，可以直接发布通缉令&nbsp;', 'ABC', '2', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('259e1c2841c345ba9283b824c5caa64d', '甲因入室盗窃被某区公安机关依法逮捕，在侦查期间，甲不讲真实姓名、住址，身份不明对于本案，公安机关应当（）', 'A．自查清甲真实身份之日起计算侦查羁押期限;B．在查清甲真实身份以前，不允许其委托律师;C．在查清甲真实身份以前，停止侦查活动;D．侦查终结时，犯罪事实清楚，证据确实、充分，但是不能按甲自报的姓名移送区人民检察院审查起诉&nbsp;', 'A', '1', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('26d9fedc813f42728be7adea1e675f9b', '下列外国人应办理住宿登记的有（）。', 'A．美国人甲在中国居民家中住宿;B．美国人乙在中国的外国机构内住宿;C．美国人丙在中国的外国人家中住宿;D．常住中国的外国人丁离开自己的住所，临时在其他地方住宿&nbsp;', 'ABCD', '2', '5bac34701af4425692eef413797efab1', null, null, '2018-05-20 23:23:25', '2018-05-20 23:23:25', '1');
INSERT INTO `test_question` VALUES ('27649b2e30614601ade3ee77be6fd058', '张某因涉嫌抢劫罪被甲县公安机关刑事拘留，在拘留期间，张某的辩护律师可以（　）', 'A．查询公安机关收集的证据;B．代理申诉、控告;C．申请变更强制措施;D．向侦查机关了解犯罪嫌疑人涉嫌的罪名和案件有关情况，提出意见&nbsp;', 'BCD', '2', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('2790c3a091074ecda25ce83735d5747a', '在北京留学的俄罗斯籍学生洛克斯基违反勤工助学管理规定，超出规定的岗位范围在天津工作，属于非法就业。&nbsp;', null, 'Yes', '3', '5bac34701af4425692eef413797efab1', null, null, '2018-05-20 23:23:25', '2018-05-20 23:23:25', '1');
INSERT INTO `test_question` VALUES ('279ff1ec2d32426da4f47e1993bb4763', '律师关某在一起盗窃案件侦查期间担任犯罪嫌疑人韩某的辩护人在此期间，辩护人关某收集到的下列证据应当及时告知公安机关的是（　）', 'A．韩某不在犯罪现场的证据;B．韩某的年龄是15周岁的证据;C．韩某是精神病人的证据;D．韩某的犯罪动机&nbsp;', 'ABC', '2', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('28a4abdf9a8740f897023854932092fa', '甲县公安机关在对涉嫌强奸罪的李某执行逮捕时，发现其是本县人大代表，于是暂缓执行，并立即向本县人民代表大会常务委员会报告', null, 'No', '3', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('28ac5b900e21463d9f5a1826c00628a9', '陈某与蒋某因琐事发生口角，陈某殴打蒋某致其轻伤经查，陈某四年前曾因交通肇事罪被判处有期徒刑两年本案不可以适用刑事和解制度', null, 'No', '3', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('296dd8de7b54436790f5d3c753241202', '李某因涉嫌犯罪被公安机关取保候审，在取保候审期间，李某不能行使选举权', null, 'No', '3', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('29d40d6ac3f145fc9a788d8bf5327a53', '犯罪嫌疑人呼某在被监视居住期间私自外出并找同案的犯罪嫌疑人王某串供，侦查人员认为需要对呼某逮捕，在逮捕之前可以对呼某（）', 'A．取保候审;B．先行拘留;C．拘传;D．继续盘问&nbsp;', 'B', '1', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('2b036e7ce8cc4a5faac35b64e17c39f7', '外国人在中国居民家中住宿的，应当于入住后24小时内由本人或者留宿人，向居住地的公安机关办理登记。&nbsp;', null, 'Yes', '3', '5bac34701af4425692eef413797efab1', null, null, '2018-05-20 23:23:25', '2018-05-20 23:23:25', '1');
INSERT INTO `test_question` VALUES ('2b4b8a20a99045738a264ce3dcd7ebd9', '被害人魏某在大街上因为小事与人发生争吵，在争吵过程中，对方拿出水果刀朝其腹部捅了一刀，然后逃跑，经鉴定为轻伤魏某到当地公安机关报案，要求公安机关立案侦查关于本案，下列说法正确的是（）', 'A．公安机关应当立案;B．轻伤害属于自诉案件，公安机关应当告知被害人向人民法院起诉;C．公安机关应当等抓获犯罪嫌疑人之后，再立案侦查;D．公安机关应当要求被害人提供充分的证据，否则不应立案侦查&nbsp;', 'A', '1', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('2c659950b51d418381862145f09921d5', '约翰，男，32岁，英国某服装公司驻我国办事处职员某日，约翰酒后驾车将我国公民甲、乙两人撞死后逃逸，后被抓获有关本案，下列说法正确的是（）', 'A．由检察机关负责侦查;B．如需逮捕约翰，由公安机关执行;C．由于约翰是外国人，所以本案由国家安全机关负责侦查;D．约翰聘请辩护律师需经公安机关批准&nbsp;', 'B', '1', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('2d2c260337e842e0960d42065eea437a', '甲流窜于多个省、市实施十余起强奸、抢劫案件，现被逮捕羁押，甲被逮捕后的侦查羁押期限最长为（）', 'A．5个月;B．4个月;C．6个月;D．7个月&nbsp;', 'D', '1', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('2d2c53fab4d740d0965f8e26871acbd0', '小曼（15周岁，女）涉嫌故意杀人罪关于本案的办理，下列说法错误的是（）', 'A．小曼没有委托辩护人，公安机关应当让其自己辩护;B．小曼应当与其他成年犯罪嫌疑人分别关押、分别管理、分别教育;C．对于小曼，在讯问和审判的时候，应当通知小曼的法定代理人到场，其法定代理人可以代为行使小曼的诉讼权利;D．讯问小曼时，应当有女工作人员在场&nbsp;', 'A', '1', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('2e64e72b3c504c12a3c3f8177d71ee17', '甲直辖市人民代表大会代表贾某和章某在乙直辖市投毒杀害外国人倪某，案发后潜逃下列说法错误的是（）', 'A．公安机关对贾某通缉的，应当报请甲市人民代表大会主席团或者常务委员会许可;B．乙市公安局可以在全国范围内发布通缉令;C．公安机关发布通缉令后，如贾某在丙公安派出所辖区被抓获，丙公安派出所可以凭通缉令直接将贾某送当地看守所羁押;D．该案因涉及外国人，应当由地级市以上公安机关立案侦查&nbsp;', 'ABCD', '2', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('302eab9fd9654bed91650e3d7524e62d', '某公安机关冻结了犯罪嫌疑人在银行的存款，但在侦查过程中，犯罪嫌疑人死亡，后来查明这笔存款属于从被害人那里盗窃的赃款以下处理方式错误的是（）', 'A．公安机关直接将此存款提出，交给被害人;B．公安机关应当请人民检察院作出决定，然后通知冻结该存款的银行将该存款交给被害人;C．公安机关应当申请人民法院裁定通知冻结该存款的银行，将该存款上缴国库;D．公安机关应当申请人民法院裁定通知冻结该存款的银行，将该存款返还被害人&nbsp;', 'ABCD', '2', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('3184f516727c4e44b8d6a897d1fa26c0', '证人张某因履行作证义务，支出交通、住宿、就餐等费用共800元，应当给予补助', null, 'Yes', '3', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('3270e765804d4cb3bd980b2d4f790c37', '王某亲眼目睹了三个人实施盗窃及当场被公安机关抓获的过程事后，侦查人员找到王某取证对此，下列说法正确的是（）', 'A．王某有义务作证;B．王某有权要求对自己的姓名保密;C．王某有权要求公安司法机关保障自己的人身安全;D．王某有权要求公安司法机关保障自己近亲属的安全&nbsp;', 'ABCD', '2', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('32bebdc364494d0db26a017290c549df', '甲、乙因琐事发生打斗，甲把乙打伤，乙到某公安派出所报案，要求追究甲的刑事责任该公安派出所的做法正确的是（）', 'A．告知乙自行去进行伤情鉴定，有鉴定结果才好处理;B．制作询问笔录，并安排乙进行伤情鉴定;C．鉴定结果为轻伤，告知其应当直接向人民法院起诉;D．鉴定结果为轻伤，乙坚持要求公安机关处理的，公安机关应当决定立案侦查&nbsp;', 'BD', '2', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('32db65948ae0439880d0e7b22a55c588', '王某与张某发生口角，王某一怒之下顺手拿起李某放在桌子上的手机打向张某，致张某轻伤经查，王某涉嫌故意伤害罪，公安机关决定对其采取拘留措施下列说法正确的是（）', 'A．发现王某是县级以上人大代表的，应当立即向其上级人民代表大会主席团或者人民代表大会常务委员会报告;B．在执行强制措施后，发现王某是县级以上人大代表的，应当立即解除，并报告决定的机关;C．发现王某为民族乡的人大代表，对其进行拘留后，应当立即报告其所属的人民代表大会;D．张某可以就王某的侵害行为向公安机关提出附带民事诉讼&nbsp;', 'BCD', '2', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('337f2d7f7ed54415aead4f1953f8b5e3', '甲男因涉嫌强奸乙女被A县公安局取保候审，A县公安局可以责令被取保候审的甲不得与乙女及其父母会见', null, 'Yes', '3', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('3396e6500cb04a06a64e0d508646ddd1', '(17年新增试题)去年2月至今年10月间，犯罪嫌疑人汪某、林某合谋在境外组建诈骗团伙，以冒充“公检法”的手法针对中国大陆民众实施电信诈骗，受骗人员涉及25个省市，共200人，涉案金额2000多万元关于该案的办理，下列说法正确的是（）', 'A．公安机关在侦办该案时，可以通过网络在线提取存储在境外的相关电子数据;B．公安部可以指定25省中的某省公安机关立案侦查;C．公安机关可以通过扣押、封存汪某作案使用的电脑以及计算电子数据完整性校验值等方式保护收集的电子数据的完整性;D．该案在移送审查起诉时，公安机关应当将收集、提取的原始存储介质或者电子数据以封存状态随案移送，并制作电子数据的备份一并移送&nbsp;', 'ABCD', '2', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('35151cc7cded43bda73e73455ba5dc73', '某市公安机关在办理胡某诈骗案件中，下列运用侦查措施的说法正确的是()', 'A．在侦查活动中发现的可用以证明胡某无罪的财物、文件，应当查封、扣押;B．侦查人员扣押胡某的电子邮件应当经办案部门负责人审批;C．侦查实验应当经办案部门负责人审批;D．公安机关侦查犯罪可以冻结胡某的股票、存款，其中股票可以重复冻结&nbsp;', 'A', '1', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('3526c6f94f494ea587952b4828521867', '甲是一起杀人案件的证人，依法应当履行作证义务，其在履行作证义务时支出的交通、住宿、就餐等费用，由本人承担', null, 'No', '3', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('35a5fd95f3d248d79841227b7a902875', '犯罪嫌疑人战某因涉嫌倒卖文物罪被逮捕战某在被逮捕之后，委托了辩护律师陈某我国《刑事诉讼法》等规定，律师陈某在侦查阶段可以（）', 'A．会见在押的战某;B．为战某申请取保候审;C．向公安机关了解战某涉嫌的罪名;D．在战某被羁押超过侦查羁押期限后，要求公安机关解除或者变更强制措施&nbsp;', 'ABCD', '2', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('35d3af7fb1ab42a8843dc3cc1d6ab4d6', '下列关于刑事侦查中的检查，说法正确的是（）', 'A.对被害人陈某的人身进行检查时，可以提取其指纹信息，采集血液、尿液等生物样本;B.杨某被强奸后报警;C.遇有紧急情况，民警谢某未持有公安机关的证明文件也可以对李某进行检查;D.由于死因不明，公安机关决定解剖湖中发现的一具尸体，但必须征得死者家属同意&nbsp;', 'A', '1', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('35dfdab0191d4fef863ea18f7f8230f2', '(17年新增试题)公司经理张某向王某借款1000万元用于扩展公司业务，后因经营不善，公司倒闭张某通过电信诈骗方式获得赃款1000余万元后，偿还了王某1000万元欠款因王某不知该款项来源，对张某偿还王某的1000万元不应当向王某追缴', null, 'Yes', '3', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('36235d119c6f44b18d9f381fb4c5f0f4', '(17年新增试题)苏某涉嫌参加恐怖组织罪被执行逮捕苏某同事翁某为知情人员，公安机关尚未对翁某取证同案犯柳某在逃下列关于通知苏某家属的说法正确的是（）', 'A．应当对证人翁某询问结束后再通知家属;B．应当在同案犯柳某被抓获后再通知家属;C．应当在对苏某执行逮捕后24小时内通知家属;D．若未在24小时内通知家属的，应当在讯问笔录中注明&nbsp;', 'C', '1', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('36297ddbf367496993ba6f70d92607b3', '某市约克外语培训学校主管黄某以学校名义编造虚假事由，为澳大利亚人凯瑟琳出具邀请函件，凯瑟琳以此向某市公安局出入境管理部门申请签证延期。对上述行为，市公安局出入境管理部门可作出的处罚决定是（）。', 'A．黄某为凯瑟琳出具邀请函件，对其处罚款;B．约克外语培训学校有违法所得的，没收违法所得;C．对约克外语培训学校处罚款;D．责令约克外语培训学校承担凯瑟琳的出境费用&nbsp;', 'ABCD', '2', '5bac34701af4425692eef413797efab1', null, null, '2018-05-20 23:23:25', '2018-05-20 23:23:25', '1');
INSERT INTO `test_question` VALUES ('367ecca34f8b462eb57f8b46d42a4dbb', '关于扣押物证、书证，下列做法正确的是（）', 'A．侦查人员在搜查钱某的住宅时，发现一份能够证明钱某无罪的证据，对此证据予以扣押;B．在杜某故意杀人案中，侦查机关依法扣押杜某的一些物品和文件;C．公安机关在侦查刘某盗窃案时，可以依照规定查询、冻结刘某的存款、汇款;D．在对周某盗窃案侦查过程中，周某死亡，公安机关请求人民检察院决定将冻结的周某的赃款的一部分上缴国库，其余部分返还给被害人&nbsp;', 'AC', '2', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('37ab1ac8ae6e4b11aaa98ba39ce983bd', '美国人吉尔在朋友李某家中住宿，须于入住后（）内，向居住地公安机关办理登记。', 'A.8小时B.12小时;C.24小时D.48小时&nbsp;', 'C', '1', '5bac34701af4425692eef413797efab1', null, null, '2018-05-20 23:23:25', '2018-05-20 23:23:25', '1');
INSERT INTO `test_question` VALUES ('37abea9451d7468ca6f24fc424986955', '(17年新增试题)犯罪嫌疑人李某通过某账户实施电信网络诈骗犯罪，获得赃款780万元在侦办该案过程中，因客观原因公安机关无法查实全部被害人，且李某无法说明款项合法来源该780万元应认定为违法所得，予以追缴', null, 'Yes', '3', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('3844d879e1a24884bba190579d1cf302', '王某是甲县公安机关的法医，在一起刑事案件的法庭审理过程中，甲县人民法院聘请王某任该案鉴定人本案的被告人提出王某与本案有利害关系，申请其回避下列有权对王某是否回避作出决定的是（）', 'A．甲县公安机关负责人;B．甲县人民法院院长;C．甲县人民法院的合议庭;D．本案合议庭的审判长&nbsp;', 'B', '1', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('39cc5090ee424674b2806071e30cba5a', '(17年新增试题)下列关于涉案财物的处理，做法错误的是（）', 'A．在办理某电信诈骗犯罪案件时，县公安局将收集、提取的原始存储介质和电子数据以封存状态随案移送;B．因客观原因，县公安局无法查清全部被害人，但有证据证明刘某的账户用于电信网络诈骗犯罪，且刘某无法说明账户中200万元的合法来源;C．某市公安局在侦办某电信网络诈骗犯罪案件时，鉴于权属明确，及时返还了被害人刘某被骗的900余万元;D．张某将古董以市场价200万元卖给钱某', 'D', '1', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('39fd6f2e059747c9be12ecca5c7615fc', '公安机关在一起盗窃案现场收集到一张字条，根据笔迹鉴定认定是犯罪嫌疑人张某书写，后据以查获张某，在其住处搜查、扣押了被盗物品，被盗超市提供了被盗物品清单该字条是书证', null, 'No', '3', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('3aa04600dc544d73a72ed02f7e60d75f', '王某因涉嫌故意伤害罪被甲县公安机关决定取保候审，并由王某居住的乙县公安局丙派出所执行下列说法不符合法律规定的是（）', 'A．王某未经丙派出所负责人批准，不得离开乙县;B．王某更换了手机号码后，应当在24小时以内向丙派出所报告;C．王某在传讯的时候未及时到案，可对其处1000元以上2万元以下罚款;D．可以责令王某将驾驶证交执行机关保存&nbsp;', 'C', '1', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('3f19ccd3bea94ebb94641ce5e3fae96f', '侦查人员到女纵火犯罪嫌疑人甲家中对其执行拘留时，发现其身上可能藏有爆炸物品，决定进行搜查下列有关搜查的表述不正确的是（）', 'A．搜查妇女的身体，应当由女工作人员进行;B．进行搜查，在特殊情况下可以没有见证人在场;C．搜查的情况应当写成笔录;D．在执行拘留的时候，遇有紧急情况，不用搜查证也能搜查&nbsp;', 'B', '1', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('3f9419b35fd84d5da5e1a69620fe1284', 'A市B区人民检察院对B区公安局移送的案件作出不起诉的决定下列做法正确的是（）', 'A．B区公安局认为不起诉决定错误，应当在收到不起诉决定书后7日以内制作要求复议意见书，经B区公安局负责人批准后，移送B区人民检察院复议;B．在复议意见作出之前，该案在押的犯罪嫌疑人应当继续羁押;C．B区公安局要求复议的意见不被接受的，可以自收到复议决定书之日起5日内制作提请复核意见书提出复核;D．经B区公安局负责人批准后，提请复核意见书和人民检察院的复议决定书可一并提请A市人民检察院复核&nbsp;', 'AD', '2', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('40494e8d93bd48e195e5b719b4ba924a', '关于刑事诉讼中查封、扣押、冻结涉案财物的处理，下列选项错误的是（　）', 'A．李某涉嫌诈骗案，公安机关对李某的涉案存款、汇款可以冻结;B．王某被控贩卖毒品，作为证据使用的海洛因应当随案移送当庭出示质证;C．马某被控非法持有枪支、弹药，作为证据使用的枪支、弹药应当随案移送当庭出示质证;D．牛某涉嫌抢劫罪，在侦查期间自杀身亡，公安机关应当没收牛某的存款、汇款并上缴国库&nbsp;', 'BCD', '2', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('405052fd43d845cca265d0669afc90c6', '张某年轻力壮，却突然死在家中，死因不明，经县公安局负责人批准进行尸体解剖，因死者的唯一家属其妻子有作案嫌疑，民警没有通知死者家属到场', null, 'No', '3', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('4106392417ea424eb22e9fed70e8302a', '下列情形中，对有证据证明有犯罪事实，可能判处徒刑以上刑罚的犯罪嫌疑人、被告人，采取取保候审尚不足以防止发生社会危险性，应当予以逮捕的是（）', 'A．甲有危害国家安全、公共安全或者社会秩序的现实危险的;B．乙可能毁灭、伪造证据，干扰证人作证或者串供的;C．丙可能对被害人实施打击报复的;D．丁企图自杀&nbsp;', 'ABCD', '2', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('41540a83e1c6484e92a53fc36b7411a6', '对下列案件公安机关应当立案侦查的是（　）', 'A．汪某暴力干涉其女儿婚姻自由，未造成严重后果;B．刘某虐待其父致死;C．某私企员工王某利用职务之便将自己经手保管的财物非法占为己有;D．杨某，水利局干部，在工作中玩忽职守&nbsp;', 'BC', '2', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('41945083178242aeb6a3e33336d6e49d', '某县人大代表李某因涉嫌非法拘禁罪被公安机关监视居住，在其住处执行以下说法正确的是（）', 'A．在监视居住前，公安机关应当书面报告该人大代表所属的人民代表大会主席团或者人民代表大会常务委员会;B．李某在监视居住期间与律师甲见面，商谈拟委托律师甲作为辩护人事宜，无须经过执行机关批准;C．对李某监视居住的执行，由李某居住地公安派出所执行，必要时，也可以由办案部门负责执行;D．李某在监视居住期间与共同生活的家人会见，无须经过执行机关批准&nbsp;', 'CD', '2', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('419b664ffd904e36921450ade6947f23', '犯罪嫌疑人夏某因涉嫌强奸路人王某被公安机关刑事拘留，在侦查期间，夏某的家人提出夏某患有精神病，无刑事责任能力，公安机关依法决定对夏某进行人身检查和精神病鉴定下列说法错误的是（）', 'A．因检查夏某的身体涉及隐私，见证人可不在场;B．公安机关可以采集夏某的指纹和血液，如果夏某拒绝采集，可以强制采集;C．对夏某进行精神病鉴定的时间如果没有超出刑事拘留期限，应当计入拘留期限;D．进行精神病鉴定，鉴定意见应当由2名以上具有鉴定资格的鉴定人签名或者盖章&nbsp;', 'ACD', '2', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('419f706015ac4191bb7ca159940d38a6', '任某涉嫌犯罪被公安机关抓获归案，其申请取保候审，并提出由刘某担任保证人，公安机关决定对其取保候审下列做法不符合法律规定的是()', 'A．任某离开所居住的县，每次都经过公安机关批准;B．任某住址、联系方式发生变动，在24小时以内向公安机关报告;C．任某串供，刘某发现后未及时报告，公安机关对刘某处以罚款;D．刘某对罚款不服，向作出决定的公安机关的上一级公安机关申请复议&nbsp;', 'D', '1', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('41a76d7331bf4aafa503a911e2ee585c', '下列犯罪嫌疑人中，一般不得适用取保候审的有（）', 'A．甲在取保候审期间故意实施新的犯罪行为;B．乙涉嫌抢夺他人数额较大的财物被拘留，需逮捕而证据尚不符合逮捕条件;C．丙因盗窃罪刑满释放后第六年又涉嫌重婚;D．丁是持刀抢劫的犯罪嫌疑人&nbsp;', 'ACD', '2', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('41e3ff34771544508b2a9e3181eae703', '律师谢某因涉嫌辩护人妨害作证罪被公安机关立案侦查，谢某提出要聘请辩护律师下列说法正确的是（）', 'A．侦查阶段谢某无权聘请辩护律师;B．谢某聘请辩护律师要经过律师主管行政机关的批准;C．谢某聘请辩护律师要经过公安机关的批准;D．谢某不需要经过批准即有权聘请辩护律师&nbsp;', 'D', '1', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('4212eceb77aa4f758df30b36721881d7', '德国人汉斯来中国后住在一居民家中，但未按规定办理住宿登记，公安机关可以对其予以行政处罚。&nbsp;', null, 'Yes', '3', '5bac34701af4425692eef413797efab1', null, null, '2018-05-20 23:23:25', '2018-05-20 23:23:25', '1');
INSERT INTO `test_question` VALUES ('42260b6688f146fbb6c65a564fe1880c', '公安机关在逮捕贩毒嫌疑人林某时，因情况紧急，未带搜查证就对林某的住处进行了搜查，并对搜查过程中所获取的毒品及其他有关物品进行了扣押本案中下列做法正确的是（）', 'A．未用搜查证就对林某的住处进行搜查;B．对搜查到的毒品扣押时未出示扣押决定书;C．扣押物品制作扣押清单一式三份;D．在侦查过程中，发现被扣押的某些财物与本案无关时，在10日以内将其返还财物持有人&nbsp;', 'ABC&nbsp;', '2', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('424e6faa9c1542aeb66a1f52ddf02458', '以下关于公安机关依法对人民代表大会代表采取强制措施的表述错误的是（）', 'A．公安机关依法对某县人大代表张某取保候审，应当书面报请该县人民代表大会主席团或者常务委员会许可;B．李某同时担任甲市、乙县两级人大代表，报请甲市人民代表大会主席团或者常务委员会许可后即可采取强制措施;C．公安机关对现行犯赵某先行拘留的时候，发现其是某县人大代表，应当立即向该县人民代表大会主席团或者常务委员会报告;D．公安机关在依法对王某执行逮捕后，发现其是县人大代表，应当立即解除，并报告原决定或者批准机关&nbsp;', 'B', '1', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('43040d5b7b2a48e189fe67ae25075d80', '(17年新增试题)杨某涉嫌帮助恐怖活动罪被监视居住，辩护律师姜某要求会见杨某公安机关应当在收到申请后5日内作出许可或不许可的决定', null, 'No', '3', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('4373c3a34a63400aafbf461baea55482', '下列犯罪嫌疑人符合逮捕条件，但不可以采取监视居住强制措施的是（）', 'A．甲患有严重疾病、生活不能自理;B．乙正在哺乳自己的婴儿;C．丙是生活不能自理的人的主要扶养人;D．丁正在怀孕&nbsp;', 'C', '1', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('438719ebf4b24186bb14e027573d73b6', '对外国人限制活动范围的期限不得超过60日。对国籍、身份不明的外国人，限制活动范围期限自查清其国籍、身份之日起计算。&nbsp;', null, 'Yes', '3', '5bac34701af4425692eef413797efab1', null, null, '2018-05-20 23:23:25', '2018-05-20 23:23:25', '1');
INSERT INTO `test_question` VALUES ('454998375fca4b8ba5a6aa937194f073', '张某因涉嫌抢劫罪被公安机关刑事拘留律师王某在担任张某辩护人期间，因帮助张某伪造证据而被立案侦查，办案机关应为（）', 'A．人民检察院;B．人民法院;C．承办张某案件的公安机关;D．承办张某案件的公安机关以外的公安机关&nbsp;', 'D', '1', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('455a246eaf6347379b79bb56fb327615', '在办理韩某故意杀人案件中，公安机关组织多名证人进行了辨认下列辨认活动不符合有关规定，但经补正或者作出合理解释后，辨认笔录可以作为证据使用的情形是（）', 'A．辨认前使辨认人见到辨认对象的;B．供辨认的对象数量不符合规定的;C．案卷中只有辨认笔录，没有被辨认对象的照片、录像等资料，无法获悉辨认的真实情况的;D．辨认活动没有个别进行的&nbsp;', 'C', '1', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('463d2dcabac140449bbda2e857f96cf7', '涉嫌抢劫杀人的甲在法庭审理期间声称侦查人员曾对其实施刑讯逼供，甲的妻子也提出其证言系侦查人员暴力取证的结果经查明，上述情况属实下列证据材料不能作为定案根据的是（　）', 'A.甲的有罪供述;B.根据甲的供述找到的杀人凶器;C.甲的妻子的证言;D.根据甲的妻子的证言找到的赃物&nbsp;', 'AC', '2', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('468d67e33b7649c7bd610a6c0efce13e', '民警甲、乙对涉嫌盗窃罪的李某执行拘留时，发现李某身上可能藏有匕首，未用搜查证便搜查了李某的身体搜查结束后，民警要求李某在搜查笔录上签字遭到拒绝，民警在笔录上注明李某拒绝签字的情况', null, 'Yes', '3', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('470755d8d81e44789c038a45ccd7f468', '对外国人实施拘留审查，应当出示拘留审查决定书，并在12小时内进行询问。&nbsp;', null, 'No', '3', '5bac34701af4425692eef413797efab1', null, null, '2018-05-20 23:23:25', '2018-05-20 23:23:25', '1');
INSERT INTO `test_question` VALUES ('47089c7ee2e54587b333b67723e28c8a', '外国人对下列（）措施不服的，可以依法申请行政复议，该行政复议决定为最终决定。', 'A．继续盘问;B．拘留审查;C．限制活动范围;D．遣送出境&nbsp;', 'ABCD', '2', '5bac34701af4425692eef413797efab1', null, null, '2018-05-20 23:23:25', '2018-05-20 23:23:25', '1');
INSERT INTO `test_question` VALUES ('47124e255d0d4f39bd97975af522ba38', '王某因多次到A百货商场盗窃，涉嫌犯罪，被公安机关立案侦查，公安机关决定对王某取保候审，同时可责令王某在取保候审期间不得进入百货商场', null, 'Yes', '3', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('47bee95ed3244775900f7d5424ac5ed6', '对违反出境入境管理行为处（）以下罚款的，出入境边防检查机关可以当场作出处罚决定。', 'A．200元;B．300元;C．500元;D．1000元&nbsp;', 'C', '1', '5bac34701af4425692eef413797efab1', null, null, '2018-05-20 23:23:25', '2018-05-20 23:23:25', '1');
INSERT INTO `test_question` VALUES ('48dcd633df574fc3958bf9fced6c2ac3', '下列案件应当由设区的市一级公安机关管辖的是（）', 'A．甲劫持B国民航客机，后潜入我国被抓获;B．外国人乙涉嫌盗窃案;C．丙强奸、抢劫作案20余起;D．丁涉嫌非法集资5000万元&nbsp;', 'A', '1', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('497582419f564eab9feace0986c7a842', '下列证人证言的收集程序、方式有一定瑕疵，经补正或者作出合理解释，仍可以采用的是（）', 'A．对某未成年证人询问时，其法定代理人虽然到场，但是侦查人员忘记要求其在笔录上签名;B．由于情况紧急，侦查人员将现场目击者带到现场附近的一个茶楼进行询问;C．侦查人员在对某民警刑讯逼供案的另一了解案情的民警进行询问时，由于该民警是多年的“老刑侦”，所以询问前没有告知其有关作证的权利、义务和法律责任;D．某斗殴案件的证人有2名，4名民警分两组同时对证人进行询问，但除了参与询问的民警的各自签名外，两份笔录上都有在场的刑侦部门负责人甲的签名&nbsp;', 'ABCD', '2', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('499bcd31351d46d2926e4b87b08aad04', '甲县公安机关接到张某举报该县国家机关工作人员王某利用职权实施破坏县人大代表选举的刑事案件，应当（）', 'A．告知举报人张某向有管辖权的国家机关举报;B．向有管辖权的国家机关通报;C．接受案件后，移送人民检察院处理;D．直接移送有管辖权的人民法院&nbsp;', 'C', '1', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('4a545577fb594702b124b836f7e26a8b', '美国人科尔未经批准，擅自进入限制外国人进入的区域。下列做法正确的是（）。', 'A．责令立即离开;B．情节严重的，处拘留处罚;C．对科尔非法获取的文字记录、音像资料、电子数据和其他物品，予以收缴或者销毁;D．对科尔所用工具予以收缴&nbsp;', 'ABCD', '2', '5bac34701af4425692eef413797efab1', null, null, '2018-05-20 23:23:25', '2018-05-20 23:23:25', '1');
INSERT INTO `test_question` VALUES ('4ad9ae8eaa824f59a1e60a8b26f4c6cf', '下列案件中，犯罪嫌疑人没有委托辩护人，公安机关应当通知法律援助机构指派律师为其提供辩护的是（）', 'A．在一起团伙盗窃案件中，犯罪嫌疑人陈某、萧某委托了辩护人，而李某未委托辩护人;B．王某涉嫌故意杀人，认为自己罪有应得，明确表示不需要委托辩护人;C．张某涉嫌故意伤害致王某轻伤，未委托辩护人;D．外国人约翰涉嫌诈骗，未委托辩护人&nbsp;', 'B', '1', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('4adab823c6c942b786a42120fed73aa5', '下列案例中的相关材料，不能在刑事诉讼中作为证据使用的是（）', 'A．某公安机关在侦查一起杀人案件时，犯罪嫌疑人王某拒不承认犯罪事实，后公安机关对其进行测谎实验，获得其说谎的测谎结论;B．某行政机关在行政执法过程中收集的电子数据;C．在一起毒品犯罪案件的审理中没有公开证人真实姓名的证人证言;D．某地公安机关在侦破一起毒品犯罪时，“卧底”获取的有关犯罪材料&nbsp;', 'A', '1', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('4c2d50acf0e446d2baa2e0c95bb24b93', '下列关于办理刑事案件中传唤、拘传的说法正确的是（）', 'A．甲因涉嫌抢劫罪被拘传至公安机关的办案场所进行讯问，因甲涉嫌抢劫情节严重，在讯问过程中，可以加大对甲的讯问力度，不给予甲必要的休息时间;B．乙正在实施盗窃时被巡逻民警张某发现，民警张某对乙可以进行口头传唤，不需要出示工作证件;C．丙因涉嫌强奸罪被公安机关传唤，传唤持续的时间不得超过12小时;D．丁因涉嫌诈骗罪被公安机关传唤，公安机关不得以连续传唤的形式变相拘禁丁&nbsp;', 'D', '1', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('4c7c03cfbf7d4736a1e4c382026ba015', '出境入境证件的真伪应当由（）认定。', 'A．证件的签发机关;B．出入境边防检查机关;C．公安机关出入境管理机构;D．扣押证件的公安机关&nbsp;', 'ABC', '2', '5bac34701af4425692eef413797efab1', null, null, '2018-05-20 23:23:25', '2018-05-20 23:23:25', '1');
INSERT INTO `test_question` VALUES ('4e3d34409654448eb13c5c8a16a5466f', '下列情形中，公安机关可对犯罪嫌疑人采取监视居住的是（）', 'A．马某因涉嫌过失致人重伤罪被公安机关立案侦查，其母已80岁高龄，因糖尿病而双目失明，生活不能自理，马某是其唯一的亲人;B．王某因涉嫌抢劫罪被公安机关立案侦查，在被公安机关传唤后，王某预谋逃跑;C．涉嫌故意杀人犯罪的哈某有自杀的倾向;D．涉嫌故意伤害犯罪的古某声言一定要将被害人王某置于死地&nbsp;', 'A', '1', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('4e6f0539a6704f9abd978e2d000335c2', '关于刑事诉讼中查封、扣押、冻结、没收财物的处理，下列说法错误的是()', 'A．张三盗窃李四电视机一台，公安机关在侦查过程中将电视机发还李四;B．王五被控贩毒，作为证据使用的海洛因不宜随案移送当庭出示质证;C．马六盗窃金条若干，未随案移交，判决生效后，根据法院通知该金条由扣押的公安机关上缴国库或返还被害人;D．刘二涉嫌集资诈骗，在侦查期间自杀身亡，公安机关应当将冻结的涉案存款、汇款追缴后上缴国库或返还被害人&nbsp;', 'D', '1', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('4fa517eff07f4bcf8e1d986f657a2867', '张某，16周岁，盗窃江某财物，可能被判处1年有期徒刑以下刑罚，人民检察院认为其有悔罪表现，作出附条件不起诉的决定以下说法正确的是（）', 'A.人民检察院在作出附条件不起诉决定前，应当听取公安机关、江某的意见;B.对附条件不起诉的决定，公安机关有权要求复议、提请复核;C.对附条件不起诉的决定，张某及其父母有权提出异议;D.对附条件不起诉的决定，江某有权提出异议并要求复议&nbsp;', 'ABC', '2', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('503f8e66d0c746518988d97f0eedaf8d', '小红，女，16周岁，因寻衅滋事罪被逮捕，公安机关侦查人员在对其进行讯问时，下列说法正确的是（）', 'A．讯问时，应当有女工作人员在场;B．讯问时，是否需要有女工作人员在场视情形而定;C．讯问时，必须有小红的法定代理人在场;D．讯问笔录只需要交小红本人阅读，而无须交其法定代理人阅读&nbsp;', 'A', '1', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('50447bcc558b4e78831c0ed0f98c4f8f', '下列情形中，不用搜查证也可以进行搜查的是（）', 'A．在办理一起盗窃案时，对犯罪嫌疑人甲在其住处执行逮捕时，发现其同案犯有可能藏匿在其住处;B．在对犯罪嫌疑人乙执行取保候审时，发现其住处可能藏有剧毒物品;C．在犯罪嫌疑人丙的住处对丙执行逮捕时，发现其正将作案工具烧毁;D．群众报警称被监视居住的丁的住所内违法存放爆炸物质，可能存在爆炸危险&nbsp;', 'AC', '2', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('50f41f4ce9024e12ac1cc6d32b4ffa0c', '犯罪嫌疑人王某拒绝侦查人员对其采集血液样本，而侦查人员认为确有必要，经办案部门负责人批准,并邀请李某作为见证人，对王某强制采集了生物样本，并将该情况制作笔录，笔录交由侦查人员、见证人李某以及王某签名', null, 'Yes', '3', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('528014a6a11e4c6bae1f23b51716da57', '下列物证、书证的收集程序、方式虽有一定瑕疵，但经补正或者作出合理解释，可以采用的是（）', 'A．某盗窃案的一份搜查笔录上没有物品持有人签名，侦查人员到庭说明当时物品持有人在场但拒绝签名的情况，且有见证人证明;B．某汽车盗窃案中的赃物汽车已经发还给被害人，但发还之前对该汽车所拍摄的一组照片上未注明与原物核对无异字样，后经被害人到庭说明，确认该照片即为被盗车辆的照片;C．在某放火案现场提取的点火用的打火机已丢失，侦查人员提供同种打火机作为证据，并到庭说明了情况;D．在某杀人案的现场勘验中提取了一枚嫌疑人的右手食指指纹，但在勘验笔录中没有记录，侦查人员到庭说明当时由于疏忽，忘记在笔录中注明&nbsp;', 'AB', '2', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('52eafe4a84af4efab3c426a56950fb6e', '下列关于侦查羁押期限计算的说法错误的是（）', 'A．甲在拘留期间，发现其另有重要罪行的，可以重新计算侦查羁押期限;B．乙交代的家庭住址查无此人，身份不明的，侦查羁押期限自查清其身份之日起计算;C．丙被逮捕后，在侦查期间发现其另有重要罪行，报批准逮捕的人民检察院批准后，重新计算侦查羁押期限;D．重新计算侦查羁押期限的，应当制作重新计算侦查羁押期限通知书，送达看守所&nbsp;', 'AC', '2', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('56127996e51340efa78b34f69ac0c907', '解某因涉嫌恐怖活动犯罪被公安机关指定居所监视居住，在侦查期间，解某委托初某为其辩护律师下列说法中正确的是（　）', 'A．解某委托初某应当经公安机关许可;B．初某会见解某须经公安机关许可;C．初某会见解某时，侦查人员可以在场进行监视;D．侦查期间初某可以向公安机关了解案件有关情况&nbsp;', 'BD', '2', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('56f72387cce645fbbfa29677517ec60f', '郭某涉嫌故意杀人罪被刑事拘留在侦查过程中，郭某希望委托辩护律师下列说法错误的是（）', 'A.郭某可以请其妻子代为委托辩护律师;B.郭某没有委托辩护律师，如果可能被判处无期徒刑，公安机关应当通知法律援助机构为其指派辩护律师;C.郭某仅向办案部门提出委托辩护律师请求，但提不出具体对象的，办案部门应当请其提出具体对象;D.郭某可以委托2名辩护律师&nbsp;', 'C', '1', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('576f625057d744208e32704cad44a4fc', '甲因涉嫌盗窃罪被A县公安机关刑事拘留刑事拘留期间，下列人员均得知本案的主办民警乙是被害人的堂哥，有权要求侦查人员乙回避的是（）', 'A．盗窃案的现场证人刘某;B．被盗物品的鉴定人张某;C．犯罪嫌疑人甲的辩护律师李某;D．犯罪嫌疑人甲的胞兄王某&nbsp;', 'C', '1', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('5c1f3beb911b427db8635789e39c1d2a', '(17年新增试题)犯罪嫌疑人吐某自制了大量宣传恐怖主义、极端主义的视频，通过电子邮件、微信等方式大肆传播，并多次在公共场所煽动对中国政府驻外机构和人员实施恐怖活动同时，吐某以暴力、胁迫等方式强制他人在公共场所穿着、佩戴宣扬恐怖主义、极端主义服饰、标志关于该案件，下列说法错误的是（）', 'A．公安机关在封存阿某作案用的手机时，可以不作笔录，但应当记录手机的封存状态;B．公安机关立案前调查吐某恐怖活动嫌疑时，可以对其进行盘问、检查、传唤，可以提取或者采集肖像、指纹、虹膜图像等人体生物识别信息和血液、尿液、脱落细胞等生物样本，并留存其签名;C．吐某的手机短信、电子邮件、即时通信、通讯群组等网络应用服务的通信信息属于电子数据;D．吐某构成宣扬恐怖主义、极端主义、煽动实施恐怖活动罪和强制穿戴宣扬恐怖主义、极端主义服饰、标志罪&nbsp;', 'A', '1', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('5c4a63d198664f128a4b16ba4423add2', '甲县公安机关对涉嫌故意伤害致人重伤的王某提请逮捕，甲县人民检察院审查后，作出了不批准逮捕的决定甲县公安机关认为不批准逮捕的决定有错误，要求复议意见不被接受，向上一级人民检察院提请复核下列说法正确的是（）', 'A．应在接到不批准逮捕决定后立即释放王某;B．应在复核意见不被接受后立即释放王某;C．如不提请复核应立即释放王某;D．应等上级人民检察院复核后再决定是否释放王某&nbsp;', 'A', '1', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('5e4b57fe96a54282b727359870b597c6', '王某因涉嫌诈骗罪被公安机关刑事拘留，拘留期间，下列有权为王某申请取保候审的是（）', 'A．王某的舅舅;B．王某的妻子;C．王某的叔叔;D．王某聘请的律师&nbsp;', 'BD', '2', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('5e6e19ece0194dfbb65177d13322005f', '犯罪嫌疑人张某因涉嫌非法经营罪被取保候审，由其居住地的A镇公安派出所执行，张某在取保候审期间未经公安派出所批准多次离开A镇，经县公安局局长批准，可以没收其交纳的保证金5万元', null, 'No', '3', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('5f0481e05ab84c6e98cff7d76bec706b', '对涉嫌违反出境入境管理的人员，经当场盘问，有下列（）情形的，可以依法继续盘问。', 'A．有危害国家安全和利益嫌疑的;B．有破坏社会公共秩序嫌疑的;C．有从事犯罪活动嫌疑的;D．外国人有非法就业嫌疑的&nbsp;', 'ABCD', '2', '5bac34701af4425692eef413797efab1', null, null, '2018-05-20 23:23:25', '2018-05-20 23:23:25', '1');
INSERT INTO `test_question` VALUES ('5f0bb45cd6f049bdb835a5c4b2fe818c', '某市公安局出入境管理部门的民警在执法过程中发现涉嫌违反出境入境管理的人员，经当场盘问，具有下列（）情形的，可以依法继续盘问。', 'A．有非法出境入境嫌疑的;B．有协助他人非法出境入境嫌疑的;C．外国人有非法居留嫌疑的;D．外国人有非法就业嫌疑的&nbsp;', 'ABCD', '2', '5bac34701af4425692eef413797efab1', null, null, '2018-05-20 23:23:25', '2018-05-20 23:23:25', '1');
INSERT INTO `test_question` VALUES ('5f1c44e99db64be3a8220615e16d51a2', '张某因涉嫌恐怖活动犯罪被公安机关刑事拘留下列说法正确的有（）', 'A.张某在被宣布刑事拘留后的当日即可委托辩护人;B.张某在侦查期间只能委托律师作为辩护人;C.张某委托辩护人不需经过侦查机关批准;D.拘留后必须在24小时内通知其家属&nbsp;', 'ABC', '2', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('604d5cd5d4f146239a5840546c603d80', '下列人员中，不得取保候审的有（）', 'A．甲是累犯，正在哺乳自己6个月大的婴儿;B．乙实施了严重暴力犯罪;C．丙以自伤方法逃避侦查;D．丁是黑社会犯罪集团的主犯，患有严重疾病，生活不能自理&nbsp;', 'BC', '2', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('60bcde1aab3a4188915d5de12dd6ff07', '在侦查某诈骗案件过程中，犯罪嫌疑人甲因病死亡，其已被冻结在银行的存款属于违法所得公安机关可以直接申请法院裁定通知冻结甲存款的银行上缴国库或者返还被害人', null, 'No', '3', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('6151f5f614004cfabd6348041e52caca', '在一起伤害案中，公安机关指派鉴定人王某对被害人宫某的伤情出具了一份鉴定意见被告人徐某及其辩护人对这一鉴定意见有异议，人民法院认为鉴定人王某有必要出庭，遂通知王某出庭下列说法错误的是（　）', 'A．鉴定人王某拒绝出庭作证，不会影响鉴定意见的证据效力;B．鉴定人王某应当出庭作证;C．王某系受公安机关指派出具鉴定意见，人民法院无权通知王某出庭;D．是否出庭作证由鉴定人王某自行决定&nbsp;', 'ACD', '2', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('61e76e6cf7d74ddd9868d44af3a94bad', '律师王某在为犯罪嫌疑人单某担任辩护人期间，因帮助单某伪造证据而被立案侦查，办案机关在侦办案件期间应当及时通知王某所在的律师事务所或者所属的律师协会', null, 'Yes', '3', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('627eb6032cb14eb096621189711eb357', '某县公安局在对一起故意伤害案件立案后，发现犯罪嫌疑人陆某疑似精神病人，便作出强制医疗决定', null, 'No', '3', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('62e7b5433c644aa289d3748218522f48', '孕妇王某已近分娩，因投毒杀人被立案侦查公安机关决定对其取保候审，责令其交纳保证金3000元婴儿出生1个月后，王某写下遗书，两次自杀未果，其家人轮流看护王某及其婴儿，防止发生意外对此情况，公安机关对王某应当采取的措施是（）', 'A．维持原取保候审决定;B．将取保候审变更为监视居住;C．增加取保候审保证金或者变更为保证人担保;D．依法提请人民检察院批准逮捕&nbsp;', 'D', '1', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('635bf456a56344998f40f29c7d061608', '律师王某是抢劫案犯罪嫌疑人吴某的辩护律师，在侦查期间王某通过会见了解到吴某的“哥们儿”正在计划绑架该县首富的女儿王某应当将此情况立即告知公安机关，以阻止可能发生的犯罪', null, 'Yes', '3', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('63b2786da5804f6da21fe9f98338f984', '朱某涉嫌投毒杀人被立案侦查，拘留期满后因证据不足变更为取保候审在取保候审期间，朱某将自己杀人用的老鼠药交给保证人齐某，让其帮忙销毁，后齐某将老鼠药掩埋，侦查人员找齐某调查时，其否认此事下列说法错误的是（　　）', 'A．可以对朱某先行拘留再予以逮捕;B．齐某没有履行保证义务，应当对其罚款;C．依法追究齐某的刑事责任;D．可以对朱某予以监视居住&nbsp;', 'B', '1', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('63f07358e5c2410485459ffc2b9d8c93', '下列案件应当由公安机关直接受理立案侦查的是（）', 'A．林业局副局长王某违法发放林木采伐许可证案;B．公务员吴某利用职权破坏乡长选举案;C．负有解救被拐卖儿童职责的警察李某利用职务阻碍解救案;D．某地从事实验、保藏传染病菌种的钟某，违反国务院卫生行政部门的有关规定，造成传染病菌种扩散构成犯罪的案件&nbsp;', 'D', '1', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('6413937afb634de9ae8144473605a422', '甲县人民检察院需要通缉某贪污犯罪嫌疑人时，()', 'A．人民检察院可以自行发布通缉令;B．可请求上级人民检察院发布通缉令;C．经公安机关同意可以自行发布通缉令;D．应通知公安机关由后者发布通缉令&nbsp;', 'D', '1', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('64707d3919a74a009c48af8f580a0e73', '公安机关在办理一起聚众斗殴案件过程中，发现现场处于一家单位安装的监控设备覆盖范围内，并了解到该单位的监控设备运行正常，侦查人员决定到该单位调取视频资料下列说法错误的是（）', 'A．应当告知该单位必须如实提供证据;B．调取证据应当经办案部门负责人批准;C．应当开具调取证据通知书;D．采用录音或者录像等方式固定取证过程，可不制作提取笔录和清单&nbsp;', 'D', '1', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('649ae7e984fc4fae96cb7ded2b6cb1c0', '某市人民代表大会会议期间，公安机关欲对涉嫌强奸罪的某市人大代表许某提请批准逮捕，应当书面报请（）许可', 'A．市人民代表大会常务委员会主任;B．市人民代表大会主席团或常务委员会;C．市人民代表大会主席团;D．市人民代表大会常务委员会&nbsp;', 'C', '1', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('6504c306673f41e6a19d2618f63e1892', '16周岁的张某涉嫌盗窃罪，人民检察院对其作出附条件不起诉的决定对此，公安机关不能要求复议、提请复核', null, 'No', '3', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('651f63fc1263467cadee6cd12ab575cf', '为查清一起强奸案，侦查人员准备进行侦查实验下列可以被法律容许的有（）', 'A．通过侦查实验，确定犯罪嫌疑人能否顺着外墙管道爬上10楼;B．通过侦查实验，确定犯罪嫌疑人是否有能力强奸被害人;C．通过侦查实验，确定犯罪嫌疑人能否制服被害人;D．通过侦查实验，确定现场脚印是否为脚码39号的犯罪嫌疑人穿着42号的鞋子作案所留&nbsp;', 'D', '1', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('657e3753b6cd4ac6a09082f6bae0db88', '以下鉴定意见，不能作为定案依据的是（）：①江城市公安局某鉴定科不具备鉴定资质②鉴定人陈某担任过本案的证人③江城市公安局提供的鉴定意见缺少签名、盖章④鉴定过程不符合相关专业的规范要求⑤某公安局王集派出所送检的检材被污染，但是具备鉴定条件', 'A．①②③;B．①②③④;C．②③⑤;D．①②③④⑤&nbsp;', 'B', '1', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('66f50f17f1f645edb11f0055567eb9ed', '张某是贩毒集团的首要分子，公安机关在实施抓捕时张某逃跑，公安机关在其住处扣押了大批的贩毒所得的财产公安机关可以采取的措施有（）', 'A．发布通缉令;B．发布悬赏通告;C．采取边控措施;D．通缉1年后不能到案的，公安机关可以写出没收违法所得意见书，移送人民检察院&nbsp;', 'ABCD', '2', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('67b662a088634d7093fa56c15b90ba1c', '许某经人介绍，聘用当地一名俄罗斯人在自己店内工作，后被该市公安机关查处。下列说法正确的是（）。', 'A.公安机关只能对非法聘用外国人的单位进行处罚，不能对非法就业的外国人进行处罚;B.公安机关可以责令该俄罗斯人限期出境，若未在规定期限内离境，可以遣送出境，其10年内不得入境;C.公安机关不仅处罚非法聘用外国人的单位，还对介绍外国人非法就业的单位或个人进行处罚;D.该俄罗斯人对遣送出境的决定不服，可以申请行政复议，对复议结果不服的，可以提起行政诉讼，也可以直接提起行政诉讼&nbsp;', 'C', '1', '5bac34701af4425692eef413797efab1', null, null, '2018-05-20 23:23:25', '2018-05-20 23:23:25', '1');
INSERT INTO `test_question` VALUES ('6813436029bc4b7c960d38a748730c5e', '越南人张英晋涉嫌非法就业被某市公安机关发现。下列说法正确的是（）。', 'A．公安机关可以对其处罚款;B．公安机关对聘用张英晋非法就业的单位处罚款;C．公安机关可以对张英晋作出遣送出境的决定;D．张英晋对遣送出境的决定不服，可以提起行政诉讼&nbsp;', 'ABC', '2', '5bac34701af4425692eef413797efab1', null, null, '2018-05-20 23:23:25', '2018-05-20 23:23:25', '1');
INSERT INTO `test_question` VALUES ('686c1ba0c576432883d09f6ecc3174b4', '甲是实施暴力行为的精神病人，在人民法院决定强制医疗前，经办案部门负责人批准，公安机关可以采取临时的保护性约束措施，也可以将其送精神病院接受治疗', null, 'No', '3', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('68b299780ea34b7fa0ff1be278911ca3', '犯罪嫌疑人甲因涉嫌信用卡诈骗罪被公安机关执行逮捕，逮捕后，（　）', 'A．人民检察院仍应当对羁押甲的必要性进行审查;B．对不需要继续羁押的，人民检察院应当建议公安机关对甲予以释放或者变更强制措施;C．对于人民检察院建议对甲予以释放或者变更强制措施的，公安机关应当在10日内将处理情况通知人民检察院;D．发现对甲逮捕不当的，释放甲应当报人民检察院批准&nbsp;', 'ABC', '2', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('6943beceb66748cd8d81fc5d98b397d4', '外国人被遣送出境的，自被遣送出境之日起（）内不准入境。', 'A．1至5年;B．3至5年;C．5至10年;D．10年&nbsp;', 'A', '1', '5bac34701af4425692eef413797efab1', null, null, '2018-05-20 23:23:25', '2018-05-20 23:23:25', '1');
INSERT INTO `test_question` VALUES ('6a87de844c7a4ed3bd58f1687184c501', '赵某在解放军某部服役时，曾在一次探亲途中与人发生争执，将对方打成重伤公安机关找到赵某时，发现其已退役该案应当由军队保卫部门管辖', null, 'No', '3', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('6bd17fa8a6784f539633c9fcaeb514ba', '王某在某市敲诈勒索他人，数额较大，被公安机关抓获并监视居住，后被法院判处有期徒刑关于公安机关执行监视居住的说法错误的是（）', 'A．在监视居住期间可以对王某进行电子监控、不定期检查;B．在侦查期间可以对王某的网络进行监控;C．在监视居住期间与任何人会见、通信都必须经过公安机关的同意;D．在监视居住期间未经公安机关批准，不得离开执行监视居住的处所&nbsp;', 'C', '1', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('6c7531181f0c45c58a40cf025b9437f1', '某公安机关侦查员王某一天下班途中，亲眼目睹了李某故意伤害案的经过下列说法中正确的是（　）', 'A．王某既不能作本案侦查人员，又不能作证人;B．王某既可以作本案侦查人员，又可以作证人;C．王某应当作证人，但不能作本案侦查人员;D．王某是本案的诉讼参与人&nbsp;', 'CD', '2', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('6d126c2b6d67454db6468b974efe8d99', '英国人史密斯在A市B区酒后将他人打成轻伤，该案可以由B区公安机关立案侦查', null, 'Yes', '3', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('6d8753b8f29e4a13be8891b685aefe81', '无国籍人甲非法进入中国后在一饭店当服务员，被公安机关发现，因其无国籍，不能以非法入境来处罚，可按非法就业来处罚。&nbsp;', null, 'No', '3', '5bac34701af4425692eef413797efab1', null, null, '2018-05-20 23:23:25', '2018-05-20 23:23:25', '1');
INSERT INTO `test_question` VALUES ('6e04ab8fee364b549574283bf8c5127c', '(17年新增试题)吴某（聋哑人）涉嫌抢劫罪被逮捕，辩护律师孔某和翻译人员毛某到看守所要求会见，看守所查验了孔某的律师执业证书、律师事务所证明、委托书和毛某的身份证件后安排了会见，同时通知了办案部门', null, 'No', '3', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('6e6bcac3de0c4ddc9cafee5a2094054e', '下列案件中，犯罪嫌疑人真诚悔罪，并赔偿损失，被害人自愿和解，可以适用刑事和解的是（）', 'A.甲、乙二人在聚会时酒后发生争执，乙将手中酒瓶砸向甲的头部，将甲打成轻伤;B.王某在杜某的生日宴会上，趁众人不注意时将杜某刚收到的生日礼物（一部价值4000元的苹果手机）偷走，杜某报案后，王某被公安机关抓获;C.3年前，李某因盗窃罪被判处了2年有期徒刑，现李某又因家庭矛盾将自己的岳父打成轻伤;D.某日深夜，华某开车经过一个十字路口时因闯红灯将一老人撞倒在地，后逃逸致老人未得到及时救治而死亡&nbsp;', 'A', '1', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('6ea3bc6be1b64c659e23fdc1f1ba9104', '甲县公安机关在依法对涉嫌故意伤害的犯罪嫌疑人张某执行拘留时，发现张某为甲县乙乡的人大代表，应当（）', 'A．暂缓执行;B．报请甲县人大常委会批准后执行;C．在执行后立即报告乙乡的人民代表大会;D．报请乙乡的人民代表大会主席团许可&nbsp;', 'C', '1', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('6f2853d716b7443b96665c35409f73e4', '居住在我国境内的外国人甲在我国领域外的中国民航客机内故意重伤一名中国旅客对该案管辖权的说法正确的是（）', 'A．由犯罪发生后该飞机最初降落地的中国港口的县级以上民航公安机关管辖，未设民航公安机关的，由地方公安机关管辖;B．由犯罪发生后该飞机目的地的中国港口的县级以上民航公安机关管辖，未设民航公安机关的，由地方公安机关管辖;C．由该外国人居住地的县级以上公安机关立案侦查;D．由该飞机所属民航公司所在地县级以上公安机关立案侦查&nbsp;', 'ABC', '2', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('6f2e88321fc54a91af80bdaf19d6bb04', '王某涉嫌投放危险物质罪，因其正哺乳自己的婴儿，公安机关决定对其监视居住在监视居住期间，王某可以和自己的辩护律师会见、通电话', null, 'Yes', '3', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('6f8a1ea6852f42dfb3e7c3acca079a0e', '在宫某被伤害一案中，公安机关指派王某对宫某的伤情出具了一份鉴定意见在审判过程中，被告人徐某及其辩护人对这一鉴定意见有异议，人民法院认为鉴定人王某有必要出庭，遂通知王某出庭下列说法正确的是（）', 'A．鉴定人王某拒绝出庭作证，不会影响鉴定意见的证据效力;B．鉴定人王某应当出庭作证;C．王某系受公安机关指派出具鉴定意见，人民法院无权通知王某出庭;D．是否出庭作证由鉴定人王某自行决定&nbsp;', 'B', '1', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('6f99239e4e43478a8a7ebd0d92fbc65d', '民警朱某和赵某询问证人王某、孙某后，制作的询问笔录显示两次询问为同一时间，经朱某作出合理解释，该笔录可以作为定案的根据', null, 'Yes', '3', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('6feb3e423b6b4e148e7254af0f708181', '黄某、刘某是夫妻，其中刘某是聋哑人且从未上过学，他们在日常生活中用哑语进行交流一天晚上，夫妻二人目睹了犯罪嫌疑人杀害邻居的全过程下列关于黄某和刘某提供的证言，通过办案民警补正或者作出合理解释，可以作为证据使用的是()', 'A．同时询问黄某、刘某;B．单独询问刘某，但请黄某在现场对其哑语进行翻译;C．由通晓哑语的民警询问刘某;D．将黄某和刘某通知到指定的某宾馆进行询问&nbsp;', 'D', '1', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('70f9020c31bc4d01b2cf7229be6057bf', '下列人员中，可以适用取保候审的是（）', 'A．王某涉嫌危险驾驶罪，可能判处拘役;B．李某涉嫌交通肇事罪，可能判处有期徒刑以上刑罚，采取取保候审不致发生社会危险性;C．犯罪嫌疑人田某患有严重疾病，生活不能自理，采取取保候审不致发生社会危险性;D．犯罪嫌疑人吕某正在怀孕，采取取保候审不致发生社会危险性&nbsp;', 'ABCD', '2', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('710c5889243b4cc696a765f37e6fcc4e', '张某系国家工作人员，掌握国家秘密一日，其将国家秘密通过互联网传送至外国某非法组织，被秘书李某发现，遂向侦查部门举报，张某得知行径败露，在履行公务期间乘机叛逃离境下列说法不正确的是（）', 'A．李某作为证人，因担心张某的亲属可能会报复，请求公安机关对其亲属予以保护，公安机关应当保护;B．李某因为作证，经常耽误工作，因此所在单位可以扣发其奖金;C．李某因履行作证义务而支出的交通、住宿、就餐等费用，有关机关应当给予补助;D．张某的案件由人民检察院立案侦查&nbsp;', 'ABD', '2', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('7140ab049593475583becaa680e82ae5', '甲在外地临时出差时目击乙强奸的作案过程，并且其是唯一目击证人甲因履行出庭作证义务而支出的（）等费用，司法机关应当给予补助', 'A．交通费;B．住宿费;C．就餐费;D．误工费&nbsp;', 'ABC', '2', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('7184a8f17246469a844d346d80c0e854', '下列证据中属于直接证据的是（）', 'A．韩某杀人案中，证明嫌疑人到过案发现场的证人证言;B．马某盗窃案中，被害人陈某关于犯罪嫌疑人给自己造成物质损害的陈述;C．高某放火案中，表明大火系因电器短路引起的录像;D．吴某投毒案中，证明犯罪嫌疑人指纹与现场提取的指纹同一的鉴定意见&nbsp;', 'C', '1', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('71dba53af2034c6698c2a2232304094e', '下列案件应由公安机关立案侦查的是（）', 'A．刘某直接经营管理的采矿企业发生重大责任事故案;B．甲县公安机关民警刘某对审讯过程中拒不交代问题的抢劫犯罪嫌疑人王某进行殴打;C．某国企总经理蔡某侵占企业经营款项20万元;D．甲县国税局局长对于其拥有的200万元存款无法说明来源&nbsp;', 'A', '1', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('7208dfa849a04492b66786d9893ba4ce', '犯罪嫌疑人赵某因涉嫌非法经营罪被刑事拘留，赵某的妻子于当日委托律师刘某作为赵某的辩护人有关刘某会见赵某的说法正确的是（）', 'A．刘某会见赵某应当经侦查机关批准;B．刘某向看守所提出会见赵某的要求时，看守所必须无条件立即安排会见;C．刘某提出会见要求的，侦查机关应当在24小时内安排会见;D．刘某向看守所提出会见赵某的要求时，看守所无须查验侦查机关许可会见的决定文书&nbsp;', 'D', '1', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('7226015cd57e4a7fa2ee19bec84fed58', '关于立案管辖的说法正确的是（）', 'A．监狱聘用的电工王某盗窃监狱财物案件由监狱立案侦查;B．李某拒不执行判决、裁定案由公安机关立案侦查;C．公安机关在侦查过程中发现犯罪嫌疑人陈某犯有“告诉才处理”的犯罪，应告知当事人直接向人民法院起诉;D．已办理退役手续的退伍军人郑某在回乡途中作案的，由军队保卫部门负责侦查&nbsp;', 'BC', '2', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('7260515ed4cd4bda97833da49ed0637a', '下列情形中，可以或者应当变更、解除强制措施的是（）', 'A.甲被逮捕后发现患有严重疾病，但有继续犯罪的可能;B.乙被逮捕后经检查正在怀孕，但乙企图自杀;C.丙被逮捕后侦查羁押期限届满仍须继续查证;D.丁被逮捕后一审法院判处有期徒刑1年，缓刑2年，判决尚未发生效力&nbsp;', 'CD', '2', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('72a037e2f7984a4a83dff1e4edae2add', '公安机关在侦查国家机关工作人员甲的盗窃犯罪事实时，发现他还涉嫌受贿下列说法正确的是（）', 'A．由公安机关对全案进行侦查;B．由人民检察院对全案进行侦查;C．由公安机关将受贿案件移送人民检察院;D．即使盗窃罪是主罪，因涉及贪污贿赂，也应由人民检察院为主侦查，公安机关予以配合&nbsp;', 'C', '1', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('72fb83a2c996437f89a2894b7c91c84c', '在中国读书的外国留学生汤姆违反勤工助学管理规定，去餐厅当服务员，属于非法就业。&nbsp;', null, 'Yes', '3', '5bac34701af4425692eef413797efab1', null, null, '2018-05-20 23:23:25', '2018-05-20 23:23:25', '1');
INSERT INTO `test_question` VALUES ('739f24b1889d433d9d966a84b409fba2', '关于流窜作案、结伙作案和多次作案，以下理解正确的是（）', 'A．流窜作案、结伙作案和多次作案是拘留期限延长至30日的必要条件;B．甲县人窜至乙县作案必定构成流窜作案;C．结伙作案指3人以上共同作案;D．只要被抓获前作案2次以上的就构成多次作案&nbsp;', 'A', '1', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('75191d8c47d64eefb45a62a22c6d9d11', '某伤害案中，由于犯罪嫌疑人系当地公安局局长的儿子，当地公安机关对被害人的报案作出了不立案的处理决定被害人不服，向人民检察院提出，要求人民检察院对此进行监督下列说法正确的是（)', 'A．应当改变管辖，直接由人民检察院进行立案侦查;B．检察委员会可以作出决定，要求该局长回避;C．可以直接书面通知公安机关立案;D．可以要求公安机关说明不立案的理由，如果认为理由不能成立，可以书面通知公安机关立案&nbsp;', 'BD', '2', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('75e5feeeb5e9448ba5155fed553dfac7', '被害人薛某被王某故意殴打成轻伤，薛某到当地公安机关报案，要求公安机关立案侦查下列说法正确的是（）', 'A．公安机关应当立案;B．公安机关应当告知被害人直接向人民法院起诉;C．公安机关应当等抓获王某之后，再立案侦查;D．薛某没能提供充分的证据，公安机关不便立案侦查&nbsp;', 'A', '1', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('760aa31473694a43b9638be32fcd99c5', '下列案件中，证人因作证其人身安全面临危险的，相关司法机关应当对其采取保护措施的是（　）', 'A．甲是某一走私毒品犯罪案件的证人;B．乙是某一黑社会性质的组织犯罪案件的证人;C．丙是某一为境外非法提供国家秘密犯罪案件的证人;D．丁是某一资助恐怖活动犯罪案件的证人&nbsp;', 'ABCD', '2', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('7722c4bea18947da95edc7f3966df812', '在故意伤害案件中，犯罪嫌疑人钱某委托律师甲为其辩护人，被害人沈某委托律师乙为其诉讼代理人下列说法中正确的是（）', 'A．律师甲在犯罪嫌疑人钱某被侦查机关第一次讯问或采取强制措施之日起，有权接受委托担任其辩护人;B．律师乙在犯罪嫌疑人钱某被侦查机关第一次讯问或采取强制措施之日起,有权接受沈某的委托担任其诉讼代理人;C．律师乙在侦查阶段有权要求查阅案卷;D．律师甲在侦查阶段有权同在押的犯罪嫌疑人钱某会见和通信&nbsp;', 'AD', '2', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('78550d07ff444cb99e7be8e3ed95dc31', '外国人对依照《出境入境管理法》规定对其实施的拘留审查、限制活动范围、遣送出境措施不服，下列说法正确的是（）。', 'A．可以申请行政复议;B．可以向人民法院提起行政诉讼;C．可以先申请行政复议再提起行政诉讼;D．此类决定为最终决定&nbsp;', 'A', '1', '5bac34701af4425692eef413797efab1', null, null, '2018-05-20 23:23:25', '2018-05-20 23:23:25', '1');
INSERT INTO `test_question` VALUES ('7953d34a47464d389aaa4f1a7855a2b6', '犯罪嫌疑人刘某因涉嫌侵犯商业秘密罪在审查起诉阶段被监视居住下列说法中错误的是（）', 'A．刘某未经检察机关批准，不得会见他人;B．刘某不能与其妻子、儿子住在一起;C．刘某违反监视居住规定，可以变更为取保候审;D．刘某未经公安机关批准，不得离开住处&nbsp;', 'ABC', '2', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('7987211561a941679624aac16f3c510e', '甲涉嫌抢劫罪依法被A地公安机关立案侦查，甲委托律师乙担任自己的辩护人，在办理案件的过程中，公安机关怀疑乙帮助甲隐匿、伪造证据，并有相应的证据证明，欲依法追究其刑事责任下列关于追究乙的刑事责任的程序正确的是（）', 'A．可以由A地公安机关侦查;B．应当由A地公安机关以外的侦查机关侦查;C．辩护律师因涉嫌辩护人毁灭证据、伪造证据、妨害作证罪需追究刑事责任的，应当及时通知甲;D．应当及时通知甲所在的律师事务所或者所属的律师协会&nbsp;', 'BD', '2', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('79f6d36e2a47446da0ea3740612b046f', '刘某为获取财物，于某日夜间在乡间小路持刀对路过的下班工人实施抢劫，致使被害人死亡，抢得现金500元，公安机关根据线索将刘某抓获下列关于讯问刘某的说法，违反法律规定的是()', 'A．应当根据刘某交代案情的情况决定讯问时是否对刘某进行录音或录像;B．对讯问刘某进行录音或录像应当全程进行;C．讯问笔录应当由刘某签名或盖章;D．因案情重大，公安机关可以安排3名民警对刘某进行讯问&nbsp;', 'A', '1', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('7aa9e878d3e242828f02a55b7569924a', '甲县公安局在办理民警李某故意杀害刘某一案时，发现李某曾收受刘某3万元为其非法办理落户手续甲县公安局应当对李某涉嫌的受贿罪并案后移送甲县人民检察院，以人民检察院为主侦查，公安局予以配合', null, 'No', '3', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('7ad9b86753104f2f90958c4a2c20caab', '下列关于公安机关采取监视居住措施说法正确的是（）', 'A．符合逮捕条件的犯罪嫌疑人甲系艾滋病病毒携带者，未发病，可以监视居住;B．乙符合逮捕条件，但乙的叔叔生活不能自理，只有乙一个亲人，依靠乙扶养，可以监视居住;C．符合逮捕条件的犯罪嫌疑人丙为刚做完流产手术的妇女，生活可以自理，可以监视居住;D．丁被监视居住，未经执行机关批准不得会见亲戚&nbsp;', 'BD', '2', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('7b4e12d658f8478da796160bc3d5091d', '根据《刑事诉讼法》的规定，以下案件中，侦查人员应当对讯问过程进行录音或者录像的是（　）', 'A．余某为抢劫运钞车，在武汉某商业银行门前制造了一起爆炸案，造成3死16伤的严重后果，劫得人民币30余万元;B．王某因家庭琐事，将自己的妻子、两个儿子、妹妹及年迈的父母全部杀死后潜逃，7日后被公安机关抓获;C．刚刚大学毕业的刘某（无驾驶证），因好奇偷开父亲的机动车上路，在一十字路口，慌乱之中将骑车的路人郝某撞死;D．张某为索要王某欠自己的5万元钱，将王某骗至一招待所房间关了三天三夜，直至王某家人将5万元钱偿还后，才将王某放回&nbsp;', 'AB', '2', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('7b4f17270a8241f1b3c16f138248794c', '对于下列刑事案件，公安机关经过严格的批准手续，可以采取技术侦查措施的是（）', 'A.王某，38岁，我国台湾地区人，利用其台商身份在我国大陆搜集军事、经济情报向国外情报机构出售;B.吕某无中生有，对县长造谣中伤，情节严重;C.某公司董事长张某非法侵占其朋友的巨额资产;D.戴某交通肇事后逃逸，致两人重伤&nbsp;', 'A', '1', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('7d3f5a71713e4675bdab3f96e08cb1ae', '张某到县公安局报案称其被陈某打成轻伤公安机关传唤了陈某，陈某称他与张某是朋友，是闹着玩不小心弄伤了张某公安机关遂作出不予立案的决定，并向张某送达了不予立案通知书张某可以（）', 'A．向上一级公安机关申请复议;B．向人民法院提起自诉;C．要求县人民检察院撤销公安机关不立案决定;D．要求县人民检察院立案&nbsp;', 'B', '1', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('7d92da7158924ef2a0dcd6e12498e2bc', '张某涉嫌非法持有枪支罪一案被人民检察院退回补充侦查在补充侦查期间，张某提出，办案人员李某曾在本案中担任过鉴定人，要求李某回避下列说法正确的是（）', 'A.张某提出的情形不属于法定回避情形;B.李某是否回避应当由县级以上公安机关负责人决定;C.在对李某的回避作出决定前，李某应停止对案件的侦查;D.张某对驳回申请回避决定不服的，应当向上一级公安机关申请复议&nbsp;', 'B', '1', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('7dc723dd6c4049e08315ad469b36b149', '对违反出境入境管理行为处1000元以下罚款的，出入境边防检查机关可以当场作出处罚决定。&nbsp;', null, 'No', '3', '5bac34701af4425692eef413797efab1', null, null, '2018-05-20 23:23:25', '2018-05-20 23:23:25', '1');
INSERT INTO `test_question` VALUES ('7e53fd77d9e844d5a96bd33ef5ac3af8', '律师李某，在为犯罪嫌疑人邓某担任辩护人期间，帮助其伪造证据，构成犯罪对李某的案件，应当由承办邓某案件的侦查机关以外的侦查机关立案侦查', null, 'Yes', '3', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('7ecaf27f4352408583607b6015e26b87', '甲因涉嫌抢夺罪被公安机关决定采取刑事拘留措施下列说法正确的是（）', 'A．应当立即将甲送看守所，至迟不超过48小时;B．拘留后24小时以内，应当通知甲的家属;C．拘留后24小时以内，应当对甲进行讯问;D．拘留后发现对甲不应当拘留，应当立即释放，并发给甲释放证明&nbsp;', 'BCD', '2', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('7efc4468b6634d638799b15fd099b493', '某县、乡两级人大代表王某因涉嫌犯罪被通缉下列说法正确的是（）', 'A．经过批准，可以采取追捕所必需的技术侦查措施;B．提请逮捕前，应当报请王某所属的乡人民代表大会许可;C．提请逮捕前，应当报请王某所属的县级人民代表大会主席团或者常务委员会许可;D．王某被抓获后，可以提取其指纹信息，采集血液、尿液等生物样本&nbsp;', 'ACD', '2', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('7f950be1bf534cd496253f108079967d', '张某是甲市乙县的人大代表，对张某提请批准逮捕的许可机关是（）', 'A．乙县公安机关;B．乙县人民检察院;C．乙县人民代表大会常务委员会或主席团;D．甲市人民代表大会主席团或常务委员会&nbsp;', 'C', '1', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('8032590878d347c9bd3adabb396c5678', '犯罪嫌疑人李某因持械抢劫被公安机关逮捕，在公安机关侦查期间，李某委托陈某为其辩护律师陈某（）', 'A.有权为李某申请回避;B.有权不经公安机关批准与李某会见;C.可以为李某申请变更强制措施;D.可以为李某提供法律帮助&nbsp;', 'ABCD', '2', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('814c8aa8e59d4461a926073700874806', '办案民警小丁、小毛正在办理王某强奸李某一案，为了查清犯罪事实，经甲县公安局负责人批准，可以要求犯罪嫌疑人王某以及被害人李某参与侦查实验，重现当日犯罪经过', null, 'No', '3', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('81cdcb598e244aa9b2410afcb5e9bd1d', '甲在路边发现了一具尸体，遂报告了公安机关，公安机关勘验后发现尸体表面无伤口，死因不明，于是决定解剖但这时死者的父亲乙坚决反对公安机关应该（）', 'A．尊重乙的意见，不进行解剖;B．提请人民检察院作出解剖尸体的决定;C．解剖尸体，并通知乙到场;D．解剖尸体，因乙反对解剖，不必通知其到场&nbsp;', 'C', '1', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('8353155fe9a843be9b7ff47ad32d89b4', '下列有关外国人管理的说法不正确的是（）。', 'A．甲餐厅聘用一名韩国学生做服务员，该餐厅应当向所在地公安机关报告;B．在中国停留的汤姆和玛丽生了一名男孩，他们应当向停留地公安机关报告;C．李某发现某家教公司有外国人非法就业，他应当及时向公安机关报告;D．非洲人鲁图在中国死亡，其家属或代理人应当立即向其所在地民政部门报告，并到公安机关注销其出入境证件&nbsp;', 'D', '1', '5bac34701af4425692eef413797efab1', null, null, '2018-05-20 23:23:25', '2018-05-20 23:23:25', '1');
INSERT INTO `test_question` VALUES ('835e80c37f964dcebbfa8d07db195320', '沈某醉酒后驾驶机动车被公安机关抓获，公安机关决定对其取保候审，在取保候审期间，公安机关责令沈某遵守以下规定，其中违反法律规定的是（）', 'A．责令沈某在取保候审期间禁止饮酒;B．责令沈某在取保候审期间不得进入酒吧;C．责令沈某将护照交公安机关保存;D．责令沈某在取保候审期间不得与有酒后驾驶机动车前科的人会见或通信&nbsp;', 'D', '1', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('83980c59119340efa5821e4303bdb713', '关于证据的审查判断，下列说法错误的是（）', 'A．被害人甲有生理缺陷，对案件事实的认知和表达存在一定困难，故其陈述在任何情况下都不得采信;B．与被告人有仇恨的证人乙提供的对被告人不利的证言，在任何情况下都不得采信;C．公安机关制作的盗窃案的勘验、检查笔录没有见证人签名，一律不得采信;D．在某杀人案现场搜查获得的凶器，未附搜查笔录，不能证明该凶器来源，一律不得采信&nbsp;', 'ABC', '2', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('83bae97da3f34f7fb24d81c485fbf4ed', '甲是某走私柴油犯罪集团的主犯，因犯走私罪被公安机关逮捕，该案特别重大复杂，集团首要分子乙逃往国外，需等待相关部门与有关国家协商引渡事宜关于该案的办理，下列说法正确的是（）', 'A．因该案特别重大复杂，在较长时间内不宜交付审判，经最高人民检察院报请全国人民代表大会常务委员会批准，可以延期审理，不受侦查羁押期限限制;B．侦查终结后，辩护律师提出要求的，侦查机关应当听取辩护律师的意见，并记录在案;C．侦查期间，发现甲另有故意杀人罪行的，重新计算侦查羁押期限;D．侦查终结后，向人民检察院移送案件时，只移送诉讼卷，侦查卷由公安机关存档备查&nbsp;', 'ACD', '2', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('83ebe5f4480f41848e110ded76f566ad', '在某刑事案件中，侦查机关委托鉴定人针对案件中的一系列专门问题作了鉴定其中（）所用的时间应当计入办案期限', 'A．对被害人家中血迹的鉴定;B．对犯罪现场指纹的鉴定;C．对犯罪嫌疑人所作的精神病医学鉴定;D．对犯罪嫌疑人DNA的鉴定&nbsp;', 'ABD', '2', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('843413a9f6ad4477a4ee62b2b8a9cc79', '民警甲、乙到涉嫌抢劫罪的张某家执行拘留时，发现张某的同学刘某携带一皮包匆匆外出，民警发现该皮包的特征符合张某抢劫案中被害人的皮包特征，此时民警不用搜查证就可以对刘某携带的皮包进行搜查', null, 'Yes', '3', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('84afb1fbd03c4e62b7548905d6a8076c', '(17年新增试题)甲县人蓝某系怀孕的妇女，在相邻的乙县盗窃5万元后被抓获蓝某在乙县无固定住处下列说法正确的是（）', 'A．可以对蓝某取保候审，责令其交纳保证金或提出保证人;B．如蓝某不交纳保证金，又不提出保证人，可以决定对其监视居住，在甲县蓝某的住处执行;C．如对蓝某指定居所监视居住的，应当在执行监视居住的24小时内通知家属;D．如对蓝某执行指定居所监视居住，由指定居所所在地的公安派出所执行，办案部门可以协助执行&nbsp;', 'ACD', '2', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('852d96bb673848499f083787fabc7020', '(17年新增试题)李某系甲市公安局侦办的某电信网络诈骗犯罪案件的在逃人员，后被乙市公安局抓获为有利于查清犯罪事实，可以由甲市公安局继续对李某涉嫌的电信网络诈骗犯罪案件进行管辖', null, 'Yes', '3', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('85b8c46cbea6468485b4b9f7e4a312ac', '秦某带着8岁的儿子买肉时，与摊主发生争执，继而互殴秦某被摊主用刀背打击造成面部骨折，脑体受损该案进入刑事诉讼程序，秦某的儿子属于（）', 'A．被害人;B．证人;C．第三人;D．既是被害人，又是证人&nbsp;', 'B', '1', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('8647a0fecd844b1cbb09319a761b8c97', '朱某、陈某涉嫌交通肇事罪分别被公安机关取保候审（保证金保证）、监视居住，公安机关对朱某、陈某执行情况不符合法律规定的是()', 'A．禁止朱某驾驶机动车，如朱某不服仍然驾驶机动车，公安机关可以决定没收朱某的部分或者全部保证金;B．责令朱某将护照上交保存;C．责令陈某将护照、身份证、驾驶证交公安机关保存;D．在案件判决之前，对陈某的通信进行监控&nbsp;', 'D', '1', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('8715904c31284bc1bdc5f7a71547efd6', '下列关于侦查羁押期限的说法正确的是（）', 'A．犯罪嫌疑人不讲真实姓名、住址的，侦查羁押期限自其供述真实姓名、住址之日起计算，但不得停止对其犯罪行为的侦查取证;B．犯罪嫌疑人不讲真实姓名、住址的，如果犯罪事实清楚，证据确实、充分的，不能按其自报的姓名移送人民检察院审查起诉;C．犯罪嫌疑人可能判处有期徒刑以上刑罚，延长期限届满，仍不能侦查终结的，经省、自治区、直辖市人民检察院批准，可以再延长2个月;D．在侦查期间，发现犯罪嫌疑人另有重要罪行的，应当自发现之日起5日内报县级以上公安机关负责人批准后，重新计算侦查羁押期限&nbsp;', 'D', '1', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('87d3d794d4c34a6eace12fb6f2ebb4a0', '在犯罪现场，侦查人员王某发现了犯罪嫌疑人朱某下列说法正确的是（）', 'A．王某经出示工作证件，可以对朱某口头传唤，但应当在讯问笔录中注明;B．王某可以对朱某口头传唤，无须出示工作证件，但应当在讯问笔录中注明;C．王某不可以对朱某口头传唤;D．王某对朱某传唤的时间不得超过8小时', 'A', '1', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('88b15442a9a742a9b706e3a8cb485ea7', '张某涉嫌危险驾驶罪，在公安机关对其采取强制措施前逃跑公安机关可以发布通缉令，采取有效措施，将其追捕归案', null, 'No', '3', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('8909cd77510d4573b50129177d7c00ca', '犯罪嫌疑人李某因持械抢劫被甲县公安机关刑事拘留，在公安机关侦查期间，（　）', 'A．李某有权委托律师作为其辩护人;B．李某有权委托律师为其提供法律帮助，但无权委托辩护人;C．李某委托的律师有权与其会见，但须经公安机关许可;D．李某委托的律师有权与其会见，无须经公安机关许可&nbsp;', 'AD', '2', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('8910f2ec26c2401393c4174ee5485ea0', '公安局对甲的抢劫案进行侦查时，发现其还涉嫌盗窃犯罪，此时对甲的侦查羁押期限已届满，需对该盗窃案进行侦查，公安局决定对甲重新计算侦查羁押期限该公安局应()', 'A．报原批准逮捕的人民检察院备案;B．报原批准逮捕的人民检察院的上一级人民检察院备案;C．不必告知人民检察院;D．报上级公安机关批准&nbsp;', 'A', '1', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('8930760eac2e42118c87bbe135a063be', '张某居住在A县，因涉嫌受贿罪被检察机关决定取保候审在取保候审期间，张某应当遵守的规定有（）', 'A．未经A县公安机关批准不得离开A县;B．未经A县检察机关批准不得离开住处;C．在传讯的时候及时到案;D．未经A县公安机关批准不得会见他人&nbsp;', 'AC', '2', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('8980815f07364ebb98979a5fef70f823', '某县公安机关认为需要对死因不明的尸体进行解剖检验，以下说法正确的是（）', 'A．该公安机关有权自行决定，并通知死者家属到场;B．需要报上一级公安机关批准;C．必须征得死者家属同意;D．对查明死因，没有必要继续保存的尸体，必须由死者家属领回处理&nbsp;', 'A', '1', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('8a84a21cd9d54b3cbaa2f51d5bef9468', '甲、乙、丙三人流窜全国，在北京、河北等省、市制造了多起抢劫杀人案，成为公安部督办的重大复杂案件之后，北京市某区警方将三人抓获并依法刑事拘留，后经批准三人被依法逮捕下列关于侦查羁押期限的说法错误的是（）', 'A．在侦查期间，发现另有重要罪行的，侦查羁押期限重新计算;B．逮捕后的侦查羁押期限不得超过2个月;C．因本案是流窜作案的重大复杂案件，不能在侦查羁押期限内侦查终结，可以直接经北京市人民检察院批准延长2个月;D．如三人不讲真实姓名、住址，身份不明的，侦查羁押期限自查清其身份之日起计算&nbsp;', 'C', '1', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('8aa68eccc46d421d82228b11d0865c7d', '下列关于通缉的表述错误的是（）', 'A.对在逃的犯罪嫌疑人，公安机关可以发布通缉令;B.县级以上公安机关在自己管辖的地区内，可以直接发布通缉令;C.对超出自己管辖的地区，应当报请有权决定的上级机关发布;D.通缉令的发送范围，由签发通缉令的公安机关负责人决定&nbsp;', 'A', '1', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('8aebb733409041df98a55223b5a2243b', '犯罪嫌疑人吴某因涉嫌诈骗罪于某年1月1日被人民检察院批准逮捕，但吴某始终不讲自己的真实姓名、住址，直到3月1日公安机关方查清其身份以下说法正确的是（）', 'A．对吴某的羁押期限自1月1日起开始计算;B．对吴某的羁押期限由办案机关确定;C．吴某不讲真实姓名、住址，身份不明，公安机关无须对其身份进行调查;D．如果一直没有查清吴某的真实身份，但案件事实清楚，证据确实、充分，公安机关也可以按其自报的姓名移送审查起诉&nbsp;', 'D', '1', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('8ba7b2b1ffda46efa1721241bb579187', '犯罪嫌疑人肖某因涉嫌非法经营罪被立案侦查，现侦查终结下列说法中正确的是（）', 'A．如果犯罪事实清楚，证据确实、充分，公安机关应当写出起诉意见书，连同案卷材料、证据一并移送同级人民检察院审查决定;B．如果公安机关经过侦查，认为犯罪情节轻微，依法不需要判处刑罚或者免除刑罚的，应当撤销案件;C．如果公安机关认为属于法定不需要追究刑事责任的情况，应当作出撤销案件的处理;D．公安机关决定撤销案件的，应当立即释放犯罪嫌疑人肖某&nbsp;', 'ACD', '2', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('8baefe92270147a48294b508356a55f2', '在刑事诉讼中，关于委托辩护人，下列说法中正确的是（）', 'A．犯罪嫌疑人王某在被拘留期间可以由他的监护人、近亲属代为委托辩护人;B．犯罪嫌疑人何某因为经济困难没有委托辩护人，他可以向法律援助机构提出申请;C．犯罪嫌疑人在侦查期间要求委托辩护人的，侦查机关不予批准，犯罪嫌疑人在审查起诉期间才可以委托辩护人;D．犯罪嫌疑人16周岁，没有委托辩护人，公安机关应当通知法律援助机构为其指派律师提供辩护&nbsp;', 'ABD', '2', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('8c8b4af70a6147b1901347a4d0fd9cbc', '王某在法庭上作证说，他曾听谷某讲述其杀害曾某的经过王某向法庭提供的证言属于（）', 'A．传来证据;B．直接证据;C．有罪证据;D．言词证据&nbsp;', 'ABCD', '2', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('8da616448aa14070b7c93b06e536ce22', '关于16周岁的小王（男）涉嫌故意杀人一案，下列说法正确的是（　）', 'A．如果小王没有委托辩护人，公安机关应当通知法律援助机构指派律师为其提供辩护;B．对小王应当与成年人分别关押;C．讯问小王时，应当通知其法定代理人到场;D．讯问笔录应当交给到场的法定代理人阅读或者向他宣读&nbsp;', 'ABCD', '2', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('8db4f85cb23a4c9d96efbcb4c36a1526', '公安机关可以决定对犯罪嫌疑人取保候审的情形有（）', 'A．甲是涉嫌故意杀人的怀孕妇女，有继续杀人的社会危险性;B．乙是涉嫌抢劫的犯罪嫌疑人，有自杀危险;C．丙患有严重疾病，是涉嫌放火罪的犯罪嫌疑人，有继续危害社会的可能;D．丁因盗窃被羁押，现期限届满，案件尚未办结，需要采取强制措施的&nbsp;', 'D', '1', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('8ed07b1f7e5646d4a823825e09b30617', '在下列各项搜查活动中，符合法律规定的是（）', 'A．在现场走访时，有人举报犯罪嫌疑人可能就隐藏在离现场不远的一幢楼房的某个房间内，由于情况紧急，现场民警来不及办理搜查证即前往该处进行搜查;B．讯问时犯罪嫌疑人交代其作案工具就放在他姐姐家中，民警没有办理搜查证即带着犯罪嫌疑人到其姐姐家查获该作案工具;C．在逮捕犯罪嫌疑人时，怀疑其同伙可能藏匿在其阁楼上，执行民警当即进行搜查，抓获另一名犯罪嫌疑人;D．民警王某下班途中发现正在办理的某一案件的犯罪嫌疑人溜进路边一个网吧，该民警随即进入网吧搜查，抓获该犯罪嫌疑人&nbsp;', 'C', '1', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('8f764fa6694349f2827fb5163f52789d', '犯罪嫌疑人张某，因诈骗被当地公安机关依法拘留，但是拘留后公安机关发现张某患有严重的肝病，经医院检查病情属实，需要立即治疗公安机关决定对其取保候审，责令其提出保证人或者交纳保证金下列说法正确的是（）', 'A．张某的外甥甲，2年前被人民法院判处剥夺政治权利3年，可以做张某的保证人;B．张某的妻子乙，没有固定工作和收入，可以做张某的保证人;C．张某的堂兄丙，3年前因盗窃罪被判处2年有期徒刑并在当地监狱服刑了2年，有固定的住处和收入，可以做张某的保证人;D．张某的表姐丁，因患病生活不能自理，可以做张某的保证人&nbsp;', 'C', '1', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('900105323f2f4e4290d57f7b5a25e9e4', '甲县公安机关在侦查张某涉嫌盗窃王某价值2000元手表的过程中，发现张某实施的是将代为保管的王某的手表占为己有，拒不归还的行为，甲县公安机关应当（）', 'A．作出撤销案件的决定，并告知当事人向人民法院起诉;B．写出不起诉意见书，移送检察机关审查处理;C．写出撤销案件意见书，移送检察机关审查处理;D．告知自诉人向人民法院提起诉讼；自诉人不起诉的，直接移送检察机关审查处理&nbsp;', 'A', '1', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('911aebc98622465097ff21d2aa69ec39', '下列情形中，属于法定不追究刑事责任的是（　）', 'A．王某盗窃某商场300元钱;B．何某盗窃2000元钱的案件，10年后被发现，这期间被害人没有报案;C．沈某杀害王某后，跳楼身亡;D．伍某因不堪忍受儿子虐待，愤而向人民法院控告，后经儿子恳求又从人民法院撤回起诉&nbsp;', 'ABCD', '2', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('91331e2a5e88401a818303093e08a4cd', '黄某住甲省A市B县，涉嫌网络诈骗犯罪，数额特别巨大，范围涉及多个省、市，取证困难B县公安机关在逮捕黄某后，已报请甲省人民检察院批准延长过侦查羁押期限，经过5个月的侦查仍不能侦查终结，经送请B县人民检察院层报甲省人民检察院批准，可以再延长2个月侦查羁押期限', null, 'Yes', '3', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('934de08e95e74370ab88dc3f274c91d7', '(17年新增试题)下列案件中，被诈骗的财物应当追缴的是（）', 'A．甲明知一贫如洗的赵某通过电信诈骗获得一辆价值600万元的高级跑车，仍然接受赵某赠与，收取该辆跑车;B．乙以5000万元购买了钱某通过诈骗获取的价值1.5亿元的名贵钻石;C．丙无偿获得了孙某诈骗而得的一部价值10万元高级限量版名牌手机;D．丁通过威胁、恐吓等手段，获得了李某诈骗得到的一辆价值70余万元的电动汽车&nbsp;', 'ABCD', '2', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('944b46d5f9e04ce7ae4e0f686e7ccb0b', '在侦查李某涉嫌故意伤害案过程中，发现被害人的伤势未达轻伤，不应对被逮捕的李某追究刑事责任，公安机关下列做法正确的是（）', 'A．撤销案件;B．对李某终止侦查;C．释放李某，并发给释放证明;D．释放李某时，应当通知原批准逮捕的人民检察院&nbsp;', 'ACD', '2', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('94ae909a1afa400297138764f4f423e0', '在办理张某故意杀人一案中，公安机关采取技术侦查措施收集了一些证据，由于使用这些证据可能危及有关人员的人身安全，因此可以不经过法庭调查程序，直接作为定案的根据', null, 'No', '3', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('953b53f078944289bb58f67ea6feb0b9', '下列案件中，公安机关经过审查，应当将案件材料和有关证据送交有管辖权的人民法院，并告知当事人向人民法院起诉的是()', 'A．开某侵占他人财产的案件;B．被害人古某向公安机关控告的重婚案件;C．被害人木某向公安机关控告的故意伤害（轻伤）案件;D．犯罪嫌疑人吴某杀人后在逃的刑事案件&nbsp;', 'A', '1', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('976efc59e9cf4d34973d5d3e7cf4da7c', '被害人王某就其被江某诈骗巨额货款一案向公安机关报案，但公安机关未立案侦查王某遂向人民检察院提出控告，人民检察院的下列做法错误的有（　）', 'A．直接立案侦查;B．直接通知公安机关立案;C．公安机关应当立案而作出不立案决定的，要求公安机关书面说明不立案的理由;D．认为公安机关书面说明的不立案理由不能成立的，通知公安机关立案，公安机关接到通知后应当立案&nbsp;', 'AB', '2', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('97cfcb0838b94207b1fa35754a5b1dbc', '小于，17周岁，因盗窃罪被判处3年有期徒刑关于其犯罪记录，以下说法正确的是（）', 'A．司法机关应当对小于的犯罪记录封存;B．小于服刑完毕后，到甲公司工作，公司为了解小于的个人信息，可以向司法机关调阅该犯罪记录;C．为普法宣传，司法机关经过严格的审批后，可以对外公开小于的犯罪记录;D．任何国家机关都无权查阅该犯罪记录&nbsp;', 'A', '1', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('97f81695ca5a448a8cd33af632300fb8', '某县公安局在侦查李某集资诈骗案中，李某死亡，有证据证明李某在银行有存款，该存款属于违法所得应当予以没收下列说法错误的是（）', 'A.可以进行调查;B.可以对该存款进行冻结;C.没收违法所得意见书应当经该县公安局局长批准;D.该县公安局应当向人民法院移送没收违法所得意见书&nbsp;', 'D', '1', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('99a4e179773045fa867dedb97cf431bc', '犯罪嫌疑人王某因涉嫌抢劫罪于11月2日被立案侦查，3日被拘传讯问，4日被执行拘留，10日经人民检察院批准并于当日被执行逮捕对犯罪嫌疑人王某的侦查羁押期限自（）起计算', 'A．11月3日;B．11月4日;C．11月10日;D．11月11日&nbsp;', 'D', '1', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('9ab75402b53741e1928255faa2cb5764', '甲在路边发现了一具尸体，遂报告公安机关公安机关勘验后发现尸体表面无伤口，死因不明，于是决定解剖但死者父亲乙坚决反对，公安机关仍决定解剖尸体，并通知乙到场乙拒不到场，公安机关仍继续解剖尸体，侦查人员在解剖尸体通知书上注明乙拒不到场的情况', null, 'Yes', '3', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('9b1c3b8984334ae6b404f243bacf3e75', '(17年新增试题)章某涉嫌领导恐怖组织罪被甲市（设区的市）公安机关监视居住，在其自己的住处执行，现发现章某有毁灭证据的迹象下列说法正确的是（）', 'A．因章某存在有碍侦查的情形，甲市公安机关可以直接决定对其指定居所执行;B．对章某指定居所监视居住执行后24小时以内应当通知家属;C．对章某监视居住的期限应当折抵刑期;D．如对章某需要予以逮捕，可以对其先行拘留&nbsp;', 'BD', '2', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('9cd79ea127074b1896933080bede4c40', '贺某因盗窃被逮捕，公安机关在法定的2个月的侦查羁押期限内没有对案件侦查终结，本案又不存在延长羁押期限的法定情形，公安机关应当（）', 'A．对贺某予以释放，需要继续查证的，可以对贺某取保候审或者监视居住;B．找理由申请延长期限，以免超期办案;C．重新向人民检察院申请批准逮捕;D．建议人民检察院对贺某作出不起诉的决定&nbsp;', 'A', '1', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('9cf4995064f04b2d8c03388f9ba01b63', '根据《公安机关办理刑事案件程序规定》，下列关于侦查人员甲扣押犯罪嫌疑人王某的邮件、电报的说法正确的是（）', 'A.因情况紧急，甲可以直接通知邮电机关将有关邮件、电报扣押，再补办批准手续;B.必须经县级以上公安机关负责人批准后，甲才可以通知邮电机关将有关邮件、电报扣押;C.甲扣押王某的邮件、电报，应当当场制作扣押清单一式两份，一份交王某;D.甲扣押王某的邮件、电报时，应当当场听取王某的陈述和辩解&nbsp;', 'B', '1', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('9d624c3215464d80a90ba1a005cd7554', '一天，有人举报李某殴打他人，民警即口头传唤李某到公安派出所进行查证，但未告知其原因在李某问及原因时，民警说以后告知你的家属经调查发现，李某殴打他人的事实涉嫌刑事犯罪，公安机关遂撤销了行政案件，将案件转为刑事案件办理此时，民警将传唤的原因和处所通知了李某的家属，同时将此前的询问笔录作为该案的证据使用公安机关在办理该案中做法错误的是（）', 'A.未将传唤的原因和依据告知被传唤人;B.在转为刑事案件后才将传唤的原因和处所通知被传唤人家属;C.撤销行政案件;D.询问笔录作为证据在刑事诉讼中使用&nbsp;', 'ABCD', '2', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('9f38d9e9fc604fdfaea2418c03e5d954', '下列案件，不得作为当事人和解的公诉案件办理的是（）', 'A．甲系某局副局长，因与局长有仇隙，某日雇一流浪汉把局长暴打一顿，致其两根肋骨骨折;C．乙系不良青年,某日因抢女朋友而纠集10余人将另一伙人多人打伤;D．丙是某机关负责人，一日酒后失言，将一国家机密泄露出去，导致较为严重后果;D．丁是一民警，在审讯时使用暴力将犯罪嫌疑人打成轻伤&nbsp;', 'ABCD', '2', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('9fb74633cdcf4c7dbbc9f77db24cc1f1', '某县公安局刑警小张、小李在侦查工作中，需要扣押犯罪嫌疑人孙某的邮件、电子邮件、电报，小张、小李在报经县公安局刑侦大队大队长批准后，制作扣押邮件、电报通知书，通知邮电部门和网络服务单位检交扣押', null, 'No', '3', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('a0591bb55412458a859069ed021db0ec', '方某被无业人员吴某打成重伤，方某向公安机关提出控告，公安机关却作出了不立案的决定对此，方某（　）', 'A．可以向人民检察院控告，请求人民检察院监督公安机关立案;B．收到不予立案通知书后7日以内，向作出决定的公安机关申请复议;C．直接向人民法院起诉要求追究公安机关的责任;D．收到不予立案通知书后7日以内，向作出决定的上一级公安机关申请复核&nbsp;', 'AB', '2', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('a19a1a1b5bfa40f59675a136da4a9b0e', '甲县哈某流窜至乙县实施抢劫而被乙县公安机关抓获，并被决定指定居所监视居住乙县公安机关为办案需要，以无法通知为由决定不予通知哈某家属', null, 'No', '3', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('a1aec5b2d50342e2a667e2ca82d8a59c', '某县公安局禁毒大队经依法批准，在对重大毒品犯罪嫌疑人李某的通话进行监听时，获悉了其贩卖毒品20公斤的信息，并将有关录音资料作为证明李某贩卖毒品罪的证据使用下列说法错误的是（）', 'A.该录音资料不能直接用作证据;B.批准监听的法律文书自签发之日起3个月内有效;C.批准监听的法律文书应当附卷;D.在审查起诉阶段辩护律师可以查阅批准监听的法律文书&nbsp;', 'A', '1', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('a1c699b002114feeb71316c92c3329fc', '17岁的王某在与其父亲逛街时，共同目睹了一起盗窃案的发生在侦查过程中，关于公安机关对王某的询问，下列说法正确的是（）', 'A．询问王某可以在其父亲在场的情况下进行;B．询问王某不可以在公安机关进行;C．询问王某应当在看守所进行;D．询问王某不得在其父亲在场的情形下进行，但可以通知其母亲到场&nbsp;', 'D', '1', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('a1d88636afc349a1bfd9d1b3574817db', '甲县一条河流中出现一具身份不明的浮尸，且有中毒迹象和被殴打的痕迹，甲县公安局立案侦查以下说法错误的是（）', 'A.为了确定死因，经甲县公安局局长批准，可以解剖该尸体;B.解剖尸体时应当通知死者家属到场，让其在解剖尸体通知书上签名;C.因尸体身份不明无法通知死者家属的，应当在笔录中注明;D.人民检察院要求复查的，应当派员参加&nbsp;', 'D', '1', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('a20ede7c95d741569ab32da7b3abd763', '公安机关在发现赵某实施盗窃后拘留了赵某下列做法中正确的是（）', 'A．应当在拘留后的24小时以内进行讯问;B．发现不应当拘留的时候，必须立即释放，发给释放证明;C．对需要逮捕而证据还不充分的，可以取保候审;D．拘留后，应当在48小时内制作拘留通知书，送达被拘留人家属或者单位&nbsp;', 'ABC', '2', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('a216250025e74c17a7b3fb4d28b61797', '刘某因涉嫌盗窃，被甲县公安机关刑事拘留，在拘留期间被提请逮捕后，甲县人民检察院对刘某作出了不批准逮捕的决定，甲县公安机关应当（）', 'A．继续羁押犯罪嫌疑人;B．羁押至期限届满再释放犯罪嫌疑人;C．对不批准逮捕决定向人民检察院要求复议或提请复核期间，继续羁押犯罪嫌疑人;D．立即释放，对于需要继续侦查，并且符合取保候审、监视居住条件的，依法取保候审或者监视居住&nbsp;', 'D', '1', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('a22c7e9f6ac94e39aca7826921319099', '公安机关对符合法律规定的被拘留重大嫌疑分子，提请审查批准逮捕的时间可以延长至30日下列符合延长至30日要求的是（）', 'A．甲、乙二人共同作案，甲被取保候审，有毁灭、伪造证据或者串供可能的;B．不讲真实姓名、住址，身份不明的;C．流窜作案、多次作案、结伙作案的;D．故意犯罪的&nbsp;', 'C', '1', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('a2662b254f934e40a6f461177018009b', '张某因强奸罪被判刑后在监狱服刑，在服刑期间脱逃至甲县张某在甲县再次实施强奸犯罪时被当地公安机关抓获，此案的侦查机关为（）', 'A．张某服刑的监狱;B．甲县公安局;C．张某服刑的监狱和甲县公安局;D．张某服刑的监狱的上一级监狱管理机关&nbsp;', 'B', '1', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('a36379a4e6c143b593713a5d05284604', '(17年新增试题)吴某涉嫌组织卖淫罪被刑事拘留，羁押在看守所辩护律师赖某在执业活动中知悉的下列线索，可以不告知司法机关是（）', 'A．发现吴某的委托人史某欲将其邻居打残;B．发现吴某有涉密情报正向境外组织邮寄;C．发现吴某曾实施了故意杀死多人的事实，公安机关尚未掌握;D．发现吴某的同学刘某准备对一商场实施爆炸&nbsp;', 'C', '1', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('a489a5a94f7e46e08484ac2b0347a9fd', '下列情形中，有关取保候审的措施适用不当的是（）', 'A．甲县公安局决定对涉嫌盗窃罪的赵某取保候审，责令赵某交纳保证金5000元，同时由赵某的父亲作为保证人;B．按摩女钱某在美容院一包厢内向嫖客王某卖淫时被乙县公安局民警当场查获，经审查，钱某供认还向10余名嫖客卖淫;C．孙某因涉嫌危险驾驶罪被公安机关决定取保候审并责令其在取保候审期间不得驾驶机动车，交纳保证金1万元，后其继续违规驾驶机动车，公安机关决定没收孙某的保证金1万元;D．李某因涉嫌非法拘禁罪于3月8日被丁县公安局决定取保候审', 'ABD', '2', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('a48ca642f3284fc39198a57d21e7e72f', '冯某涉嫌犯罪被某市公安局执行监视居住，其间，冯某多次授意其表兄李某干扰证人曾某作证，影响侦查工作正常进行，该市公安局决定对冯某先行拘留，后提请批准逮捕', null, 'Yes', '3', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('a4ad07f47c6e420ca5e5f46639542b91', '公安机关欲对犯罪嫌疑人甲（男）、被害人乙（女）进行人身检查下列说法正确的是（）', 'A．只有为了确定被害人、犯罪嫌疑人的某些特征、伤害情况或者生理状态，才可以进行人身检查;B．对甲的人身检查，必要时，可以强制进行；对乙的人身检查，不得强制进行;C．检查乙的身体，应当由侦查人员、女工作人员或医师进行;D．男性医师可以检查乙的身体&nbsp;', 'ABD', '2', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('a629aa6513f347bbb2c29c9b6d83c544', '公安机关抓获盗窃案犯罪嫌疑人贾某后，依法扣押了贾某的手提电脑一台，冻结了其银行存款，经进一步侦查,查明手提电脑不是赃物，银行存款确为盗窃所得，且贾某为了销赃在被抓获前刚寄出去一封信件在案件侦办过程中，贾某突发心脏病死亡下列做法符合法律规定的是()', 'A．侦查人员联系邮局，打开邮箱，找到该封信件并予以扣押;B．侦查人员解除冻结，持贾某银行卡至银行将赃款取出并发还被害人;C．侦查人员将手提电脑发还被害人，补偿损失;D．公安机关撤销案件&nbsp;', 'D', '1', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('a640d98d262e468f90d3707863e2fe05', '下列侦查过程中收集证人证言的程序不符合规定的是（）', 'A．在一起抢劫案中，侦查人员将目击事件发生的两兄弟召集在一起，并一并询问，最终确定了作案过程;B．在一起故意杀人案中，两名侦查人员未制作询问笔录，采用录音的方式记录了证人证言，并辅以制作说明和证人、侦查人员的签名;C．在一起故意伤害案中，侦查人员通知被害人到宾馆接受询问;D．在一起故意伤害案中，辩护律师未经证人同意，向其收集与本案有关的材料&nbsp;', 'ABCD', '2', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('a6caa8a64c7e46dca08aa310820b5a71', '黄某住甲市A区，因涉嫌诈骗罪被甲市人民检察院批准逮捕，由于案情复杂，期限届满不能侦查终结，侦查机关报请甲市人民检察院批准后延长1个月侦查羁押期限', null, 'No', '3', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('a6cbd393a61a4f848ac0258c286bc183', '公安机关对政协委员甲执行刑事拘留，在执行前应当向甲所属的政协组织报告并获得批准', null, 'No', '3', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('a7b194345c674fe89c8384ba99a22c8e', '王某17周岁时涉嫌抢劫罪被抓获，人民法院开庭审理时正好满18周岁下列说法正确的是（）', 'A.公安机关讯问王某时可以不通知其父母到场;B.对王某可以不公开审判;C.如王某被判处3年有期徒刑，对其犯罪记录应当封存;D.王某如没有委托辩护人，公安机关可以不通知法律援助机构指派律师&nbsp;', 'C', '1', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('a82a2dce71ff4ef58250ba3200dcad6f', '下列行政处罚可以由县级以上地方人民政府公安机关出入境管理机构决定的是（）。', 'A．限期出境;B．行政拘留;C．警告;D．3000元罚款&nbsp;', 'CD', '2', '5bac34701af4425692eef413797efab1', null, null, '2018-05-20 23:23:25', '2018-05-20 23:23:25', '1');
INSERT INTO `test_question` VALUES ('a8a6d7d29b7e4c04ac605c44d862c5e0', '刑事案件中侦查人员询问证人时，下列做法错误的是（）', 'A．侦查人员甲，询问前向证人介绍了基本案情，告知证人应当如实提供证言;B．侦查人员乙，对拒绝作证的证人采取了拘留措施，保证了收集证据的及时性;C．侦查人员丙，询问17周岁的证人李某时，通知其父亲到场;D．侦查人员丁，传唤证人进行询问&nbsp;', 'ABD', '2', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('a9744e22c72b431db69f6667f37d6f23', '下列刑事诉讼中，关于委托辩护人的说法错误的是（）', 'A．犯罪嫌疑人王某在被拘留期间，他的监护人、近亲属可以代为委托辩护人;B．犯罪嫌疑人何某因为经济困难没有委托辩护人，可以向法律援助机构提出申请;C．犯罪嫌疑人在侦查期间要求委托辩护人，侦查机关可以不予批准;D．犯罪嫌疑人16周岁，没有委托辩护人，公安机关应当通知法律援助机构为其指派律师提供辩护&nbsp;', 'C', '1', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('a9d9c8f0da994530945318f5c672505e', '泰国人江某对公安机关对其拘留审查的决定不服，可以依法提起行政诉讼。&nbsp;', null, 'No', '3', '5bac34701af4425692eef413797efab1', null, null, '2018-05-20 23:23:25', '2018-05-20 23:23:25', '1');
INSERT INTO `test_question` VALUES ('aa9238a9241c4d9f90c9be11179788d4', '甲曾因盗窃罪被判处有期徒刑，刑满释放后第四年，因琐事将他人打成轻伤到案后，甲态度良好，并对被害人进行了赔偿，取得了被害人谅解，达成了和解协议经县级以上公安机关负责人批准，该案可以依法作为当事人和解的公诉案件办理', null, 'No', '3', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('ac455a652049452a9493bc8a448e1ff6', '甲因涉嫌盗窃罪被公安机关逮捕，甲父为其申请取保候审，公安机关要求甲父交纳10万元保证金，甲父请求减少保证金数额公安机关在确定保证金数额时，应当考虑的情况有()', 'A．当地经济水平落后;B．甲和甲父靠种地为生，且无其他收入，生活贫困;C．甲只偷了一头牛，可能判处的刑罚不重;D．甲无前科，社会危险性小，妨碍诉讼的可能性小&nbsp;', 'BCD', '2', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('ac50754a67a7415cae03fd634ce81e16', '全国政协委员钱某因涉嫌恐怖活动犯罪被公安机关决定监视居住下列说法正确的是（）', 'A．对钱某决定监视居住的，应当事前征得该委员所属政协组织同意;B．侦查期间，可以对被监视居住的钱某的通信进行监控;C．监视居住期间会见委托的辩护律师无须批准;D．若在住处执行可能有碍侦查的，经批准，可以在指定的居所执行监视居住&nbsp;', 'BD', '2', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('acce1cf1624343d785ce876ed70445a6', '默罕默德（20岁）持用涂改签证有效期的印度护照出境，被出入境边防检查机关发现。经查，该人在中国境内没有其他违法犯罪行为。出入境边防检查机关正确的处理方法是（）。', 'A．对其予以罚款，收缴证件后准予出境;B．对其予以罚款，阻止出境;C．对其予以罚款，准予出境;D．对其予以罚款，收缴证件后不予出境&nbsp;', 'C', '1', '5bac34701af4425692eef413797efab1', null, null, '2018-05-20 23:23:25', '2018-05-20 23:23:25', '1');
INSERT INTO `test_question` VALUES ('acd1c7a8f07d490681550c36838b43b7', '(17年新增试题)杜某接到“无担保贷款”的电话，被告知需要预付利息、手续费，便向某银行账户转账2万元，发现被骗后到该银行举报该银行发现对方的账户在本银行开立，即对该账户采取了紧急止付操作，同时，告知杜某向公安机关报案公安机关应当在接到报警后48小时内将紧急止付指令通过管理平台补送到止付的银行', null, 'No', '3', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('ace4fc44d56e44479da0a0209894993c', '某公安机关在办理一起强奸案时，为了确定被害人李某受到暴力伤害的情况，侦查人员拟对她进行人身检查下列说法正确的是（）', 'A．如果李某拒绝检查，可以对她进行强制检查;B．如果李某拒绝检查，应当对她进行强制检查;C．如果李某同意检查，应当由女工作人员或者医师进行;D．强制检查由公安机关负责人批准&nbsp;', 'C', '1', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('adb1edc97ea0471d95512b0b5b9075a2', '某抢劫案犯罪嫌疑人张某刚满15周岁，在公安机关的侦查阶段可接受张某委托作为辩护人的是（）', 'A．张某的父母;B．张某的舅舅;C．张某所在居委会推荐的人;D．律师王某&nbsp;', 'D', '1', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('aedc4ed5ebc348f5919a05c588230cfa', '某地发生一起故意伤害致人死亡案件，公安机关对现场进行了勘验，提取了现场上的血迹，并制作了勘验笔录在走访过程中，侦查人员发现赵某、李某刚好目睹了案件发生的整个过程，通过血迹的DNA鉴定，抓获犯罪嫌疑人张某，经审讯，张某对犯罪事实供认不讳下列公安机关收集的材料，经补正或者作出合理解释可以作为证据使用的是（）', 'A．李某为未成年人，询问时没有法定代理人或者有关人员在场，侦查人员作出了合理的解释;B．DNA鉴定报告书缺少签名、盖章;C．侦查人员同时询问赵某、李某而取得的证言;D．侦查人员讯问张某后，讯问笔录没有交张某核对确认并签名&nbsp;', 'A', '1', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('af8c5b2063f7420581d80c7b9ae7830c', '美国人玛丽在云南旅游期间住在一农村居民家中，其应当在入住后（）内，由本人或者留宿人向居住地公安机关办理登记。', 'A．12小时;B．24小时;C．48小时;D．72小时&nbsp;', 'B', '1', '5bac34701af4425692eef413797efab1', null, null, '2018-05-20 23:23:25', '2018-05-20 23:23:25', '1');
INSERT INTO `test_question` VALUES ('b11a1422debb43ceabb0a6beab777346', '王某是一起放火案的犯罪嫌疑人，公安机关将王某拘传，对其进行了连续2日的讯问下列做法错误的是（）', 'A．未经传唤，直接拘传;B．拘传未报请人民检察院批准;C．拘传未通知王某家属;D．讯问时间长至2日&nbsp;', 'D', '1', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('b22ba6d47a5f464c8fa019cd27f51fdd', '犯罪嫌疑人江某因入室盗窃被公安机关立案侦查并执行逮捕下列情形，可以对其重新或者开始计算侦查羁押期限的有（　）', 'A．江某被羁押了1个月后，公安机关发现江某还涉嫌强奸罪;B．江某被羁押了1个月后，公安机关才查清其真实身份;C．江某被羁押了半个月后才开始供述;D．需要对江某作精神病鉴定&nbsp;', 'AB', '2', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('b5f1782d18a44799b5c14a973cc66221', '下列证据中不能作为定案根据的是（）', 'A.间歇性精神病人甲发病期间提供的证言;B.被告人乙因被刑讯逼供而作的有罪供述，但经核实，与其他证据相吻合;C.违反程序收集的物证，经过补正;D.经人民法院通知拒不出庭的鉴定人丁出具的鉴定意见&nbsp;', 'ABD', '2', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('b64b235dda4e477c85bee75c3c72b1c1', '为查清一起入室盗窃保险箱案件，侦查人员准备进行侦查实验下列说法正确的是（）', 'A．必须经办案部门负责人批准才能进行;B．必须经上级公安机关批准才能进行;C．可以通过实验，确定犯罪嫌疑人是如何无防护从1楼沿外墙进入10楼作案现场的;D．可以通过实验，确定犯罪嫌疑人能否在3分钟内打开保险箱&nbsp;', 'D', '1', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('b6c5e6b285ae461b9ed1b3590bc40812', '涉嫌故意杀人罪的王某被公安机关抓获后，住同一小区的黄女士、李女士向公安机关提供证言时称，二人均与王某有不正当性关系，因此在与王某一起过夜时，都听王某讲了他如何杀害被害人的事情下列关于黄女士、李女士提供的证言，可以作为证据使用的是()', 'A．侦查人员同时询问证人黄女士、李女士获得的证言;B．侦查人员询问证人黄女士后，询问笔录没有交黄女士核对确认;C．因侦查人员懂外语，询问不通晓当地语言的外国人李女士时，没有提供翻译;D．对黄女士的询问笔录忘记填写询问人、记录人、询问的起止时间、地点，但能提供询问的视频作证&nbsp;', 'D', '1', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('b73a2524886b46c6899f50318491888c', '(17年新增试题)秦某伙同康某在老家河东县以发送“代考”“考后改分”等虚假短信进行诈骗,非法获利20余万元，其中包括自考生金某的2万元关于该案的办理，下列说法正确的是（）', 'A．受害人金某在新华市桥东区向秦某等人指定账户汇款，新华市桥东区公安分局可以对该案立案侦查;B．公安机关封存涉案的手机等存储介质时，应当采取信号屏蔽、信号阻断或者切断电源等措施;C．鉴于被害人金某的2万元权属比较明确，在侦办该案时，应当及时返还被害人金某被骗的2万元;D．犯罪嫌疑人康某在逃时被河西区公安分局抓获，可由原办案机关河东县公安局管辖康某与秦某诈骗一案&nbsp;', 'ABCD', '2', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('b77a688344ec426a9be206e862b22c09', '林某系某县国家机关工作人员，因涉嫌贪污犯罪被该县人民检察院决定监视居住关于监视居住执行，下列说法正确的是（）', 'A．由公安机关执行，如果有必要，可以由人民检察院协助执行;B．林某有正当理由要求离开住处，应当经居住地公安派出所负责人批准;C．林某违反被监视居住人应当遵守的规定，执行机关应当及时告知该县人民检察院;D．执行机关在批准林某离开住处前应当征得检察机关同意&nbsp;', 'ABCD', '2', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('b8bce8c705a8449bbfdf1e4d407028b1', '甲涉嫌贷款诈骗罪被A县公安局监视居住，其购买的某公司股票被依法冻结，适逢股市波动，A县公安局为了减少甲的损失，可以出售甲的该股票，但所得价款应当继续冻结在其对应的银行账户中', null, 'No', '3', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('b97a943047a34ff2907b6dfc2eecac98', '某县公安局在办理一起盗窃案的过程中，为确定现场撬痕的形成情况，经办案部门负责人批准，在邀请见证人的情况下，由2名侦查人员进行了3次相同的侦查实验，并制作了侦查实验笔录对于上述情况，下列说法错误的是（）', 'A．办案部门负责人无权批准进行侦查实验;B．侦查实验进行3次不妥，应该进行1次;C．侦查实验笔录应由2名以上侦查人员、被害人和见证人签名;D．邀请的见证人应为痕迹鉴定方面的专家&nbsp;', 'BCD', '2', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('b9b0e7c748dc4207b0f5dc214b0b86b0', '侦查人员询问证人甲、乙时，发现二人的证言有出入，遂让甲、乙一起对案情进行了回忆，并制作了询问笔录该笔录可作为定案的根据', null, 'No', '3', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('b9e8ffaec71344a991e1210cfb23aa94', '甲县刑警大队在对一起抢夺案件进行侦查时，犯罪嫌疑人于某的辩护律师对办案人员胡某提出回避申请，刑警大队认为辩护律师无权申请回避，不予理会', null, 'No', '3', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('ba38e4c749cd4c5380b1336308b71b20', '犯罪嫌疑人张某某，因涉嫌故意伤害罪被公安机关立案侦查在侦查阶段，犯罪嫌疑人张某某可以行使的诉讼权利有（　）', 'A．聘请律师作为辩护人;B．会见聘请的律师;C．委托聘请的律师申请取保候审，代理申诉、控告;D．要求律师复印侦查案卷&nbsp;', 'ABC', '2', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('ba3948d265cc4834b9e58bbc66690c32', '甲（15周岁）把邻居小孩乙（3周岁）绑架，并将乙耳朵割下来寄给乙之父，索要3万元赎金甲在取赎金时被公安机关抓获，乙获救，经鉴定其耳部损伤为重伤下列表述正确的是（）', 'A.甲不负刑事责任;B.甲可以申请补充鉴定或者重新鉴定;C.对甲应当以故意伤害罪定罪处罚;D.对甲应当从轻或者减轻处罚&nbsp;', 'BCD', '2', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('bbd91c01b0ce43df96911e7bb877cca4', '在童某涉嫌故意杀人案件中，下列证据属于书证的有（　）', 'A．精神病医院为其开具的精神病情况的医疗诊断;B．案发现场找到的童某写的一封尚未邮寄出去的家信，通过对信上的笔迹鉴定，找到了犯罪嫌疑人童某;C．在童某家中发现的作案计划;D．被害人临死之前在地上写下的一组数字，通过数字查找到了童某的住址&nbsp;', 'CD', '2', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('bec29c6b2ad34a8989cf31bb6fe931b0', '(17年新增试题)某电信网络诈骗案件终结后，承办该案件的县公安局在将该案移送人民检察院审查起诉时，将封存状态的原始存储介质和收集、提取的电子数据及其备份一并移送该县公安局做法正确', null, 'Yes', '3', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('bf77e21c16e248f2a4a8e46872c7e6fc', '甲县公安机关决定对乙镇人大代表李某执行拘留，应当事先向该镇人民代表大会通报情况；情况紧急的，可在执行的同时或者执行以后及时通报', null, 'No', '3', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('bfeee5d319e64cca94aa82bb8597bfad', '公安机关通过某贩毒集团成员张某提供的线索，成功抓获贩毒集团的主犯刘某、朱某，并在朱某处查获了大量毒品和毒赃下列说法正确的是（）', 'A．张某要求不公开真实姓名，公安机关应当予以支持;B．如果张某及其近亲属的人身安全受到威胁，公安机关应当采取必要的保护措施;C．对刘某、朱某一般不可以取保候审;D．对查获的毒品、毒赃应当随案移送、随卷保存&nbsp;', 'ABC', '2', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('c107dc8679b74950b1ea02b189a79af1', 'K国人阿某在我国A县渔民的渔船上打工，渔船在日本海捕鱼期间，阿某故意将另一个K国人金某推下海里淹死渔船在返回A县途中经停B县时，阿某上岸潜逃，A、B两地均未设交通公安机关关于此案的办理，下列说法正确的是（）', 'A．因犯罪嫌疑人和被害人均为K国人，可以通过外交途径将该案移送K国管辖;B．若该案由中国管辖，可以由A县公安机关办理;C．若该案由中国管辖，因系外国人犯罪，应报请省级公安机关发布通缉令;D．若该案由中国管辖，可以由B县公安机关管辖&nbsp;', 'BD', '2', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('c1f8bdb7b7f64632aa4b9e7772260fa0', '甲男伙同乙女携带液压钳多次盗窃停放在路边的电动自行车，后在一次盗窃时被抓了现行关于本案，下列说法正确的是（　）', 'A．搜查乙女的身体应由女性民警进行;B．甲男不同意搜查时，可以对其强制搜查;C．公安机关可以对甲男的家进行搜查,但必须出示搜查证;D．搜查甲男的家时，甲男或者他的家属或者其他见证人拒绝签名的，搜查笔录无效&nbsp;', 'ABC', '2', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('c2a2b0e0b7d04e9aa51dc044087376c1', '何某是犯罪嫌疑人贺某的辩护律师，在案件侦查终结前，何某向侦查机关提出犯罪嫌疑人贺某是精神病患者，不应当负刑事责任的证据对何某的这一意见，侦查机关可以根据情况进行核实，并记录在案', null, 'No', '3', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('c2ae4e779f4b42a6b36e67df24d3c3dc', '犯罪嫌疑人鹿某在被监视居住期间有下列行为，公安机关可以对其逮捕的是（）', 'A．未经执行机关批准多次离开执行监视居住的住处;B．隐藏了自己的工作证;C．在公安机关传讯时迟到一次;D．与共同居住的家庭成员通电话&nbsp;', 'A', '1', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('c2af20df3f254bcebd8599db88e5c3a9', '下列情形，依法不适用技术侦查措施的是（）', 'A.李某被王某强奸;B.张某盗窃10万元后潜逃被通缉;C.王某为赚钱供自己吸毒，多购买了20克海洛因用来贩卖;D.赵某预谋实施在商场爆炸的恐怖事件&nbsp;', 'C', '1', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('c2ffe6da6f04430b9903b8774f08ce48', '关于证人出庭作证，下列说法正确的是（）', 'A.民警陶某在执行抓捕任务时，目击了黄某交易毒品的犯罪情况;B.陈某路过公园湖边时目击了徐某故意杀人;C.证人甲因在某毒品犯罪案中作证，本人人身安全受到威胁;D.甲实施了故意杀人行为，其妻子乙目睹了整个过程，庭审期间，乙拒绝出庭作证，人民法院不可以强制其出庭作证&nbsp;', 'AD', '2', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('c375bdc693a04017aa52e9b53b34bdae', '甲省乙市公安机关对一起故意杀人案的犯罪嫌疑人汪某执行逮捕后2个月，因案情复杂，不能侦查终结，可以经甲省公安厅批准，将羁押期限延长1个月', null, 'No', '3', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('c424f971b6a442b4a1bbf70d2085e8b8', '某市质量技术监督部门查处徐某制售的假冒白酒40箱以及大量制假原料和工具执法人员向涉案人员分别制作了三份询问笔录以及制假现场的勘验、检查笔录等，并委托技术部门出具了假酒检验报告由于该案货值金额较大，移交公安机关进一步处理上述可以作为刑事诉讼证据的是（）', 'A．假酒、制假原料和工具;B．询问笔录;C．勘验、检查笔录;D．检验报告&nbsp;', 'ACD', '2', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('c4c0eaeab2df46ca8525bab9cd9a4842', '下列证据不能作为最后认定犯罪依据的是（）', 'A．经批准，侦查人员卧底贩毒集团内部，暗中偷拍到的交易情况;B．5岁女孩指控甲男对其猥亵的陈述;C．经批准，对杀人案犯罪嫌疑人电话进行的监听录音资料;D．被害人指认犯罪嫌疑人后，侦查人员组织了照片辨认，并制作了照片辨认的笔录&nbsp;', 'D', '1', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('c54018c9f90a41ceaa47c9e1b63668ca', '为防止走漏消息，在没有通知乙县公安机关的情况下，甲县公安机关派民警到乙县某乡对抢劫案犯罪嫌疑人黄某执行拘留', null, 'No', '3', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('c5a5d4318d0346c78c657f44063f4d94', '李树是越南人，因非法居留被公安机关发现，后被拘留审查。她认为自己已怀孕3个月，中国警方拘留审查违法，便根据《出境入境管理法》的规定申请行政复议。如其对行政复议决定不服，还可以提起行政诉讼。&nbsp;', null, 'No', '3', '5bac34701af4425692eef413797efab1', null, null, '2018-05-20 23:23:25', '2018-05-20 23:23:25', '1');
INSERT INTO `test_question` VALUES ('c67b6ec83dd248fcb94ab3f581ee5e54', '犯罪嫌疑人陈某涉嫌敲诈勒索罪被某县公安机关刑事拘留，他可以委托其堂弟代为聘请律师作为他的辩护人', null, 'No', '3', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('c8757319fe5340778a956cf61232cc03', '小红，女，17周岁，因信用卡诈骗罪被逮捕，公安机关侦查人员在对其进行讯问时，下列说法正确的是（）', 'A．必须由女侦查人员对其进行讯问;B．必须有女工作人员在场;C．到场的法定代理人认为办案人员在讯问中侵犯小红的合法权益的，必须提出意见;D．讯问时必须有小红的法定代理人到场&nbsp;', 'B', '1', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('c889bebd77344a588a6c36b91fc08644', '某犯罪嫌疑人正在实施盗窃时被公安机关抓获，到案后，此人不讲真实姓名、住址，公安机关（）', 'A．不必调查其身份，只要犯罪事实清楚，证据确实、充分，即可移送起诉;B．查不清其身份，就不必向下进行诉讼程序;C．确实无法查明其身份的即可停止侦查;D．应当对其身份进行调查，但是不得停止对其犯罪行为的侦查取证&nbsp;', 'D', '1', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('c958ff29e2d64b28809cef28635b738d', '下列关于侦查阶段犯罪嫌疑人聘请律师的做法正确的是()', 'A．王某抢劫案中，因在押的王某没有提出具体人选，侦查机关对其聘请律师的要求不予转交;B．李某伤害案中，因案件事实尚未查清，侦查机关拒绝告诉受聘请的律师犯罪嫌疑人涉嫌的罪名;C．张某涉嫌恐怖活动犯罪案中，因多名犯罪嫌疑人在逃，侦查机关拒绝批准律师会见在押的张某;D．陈某滥用职权案中，为防止串供，会见时在场的侦查人员禁止陈某向律师讲述案件事实和情节&nbsp;', 'C', '1', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('c9b0c44144374777b7fe1ce63577dc77', '在侦查下列案件过程中，辩护律师会见在押的犯罪嫌疑人，可以不经侦查机关许可的是（）', 'A．张某涉嫌颠覆国家政权罪;B．英国人约翰涉嫌盗窃罪;C．王某涉嫌帮助恐怖活动罪;D．刘某涉嫌特别重大受贿罪&nbsp;', 'B', '1', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('cae0511776ee4c30afb07021f7ec41e7', '甲具有完全行为能力，因涉嫌盗窃罪被公安机关拘留并送至看守所羁押，在拘留期间，其所在单位可以委托本单位的法律顾问作为其辩护人', null, 'No', '3', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('cb3fbe5928cd4c28992059a1d1b9595d', '甲县公安局民警王某对涉嫌盗窃罪的犯罪嫌疑人李某采用殴打的方式获取口供，最终李某因证据不足被释放李某多次上访要求对刑讯逼供的王某给予处罚，甲县公安局对王某停止执行职务15日在停职期间，王某为了教训李某，以涉嫌盗窃罪为名，将李某带至一宾馆内，限制李某人身自由达10日之久最终李某无法忍受，跳窗逃脱时不慎摔死王某非法拘禁一案由甲县公安机关办理，而王某刑讯逼供一案移交甲县人民检察院办理', null, 'Yes', '3', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('cc164f7949204ac49646da6403e3553c', '根据《出境入境管理法》的规定，对下列外国人可以处限期出境的有（）。', 'A．在中国读大学时私自从事网店模特工作，且拒不接受查处的乌拉圭人劳拉;B．在中国参与打架斗殴行为的外国人蒙托;C．在中国境内组织宗教组织并积极传教的外国人克里;D．在中国非法居留了一段时间的外国人凯拉&nbsp;', 'ABCD', '2', '5bac34701af4425692eef413797efab1', null, null, '2018-05-20 23:23:25', '2018-05-20 23:23:25', '1');
INSERT INTO `test_question` VALUES ('ccca7e37b1e5437bbfbc754a6e512794', '(17年新增试题)甲县徐某因父亲与邻居史某发生纠纷将史某打成重伤，被公安机关批准刑事拘留并网上追逃1月1日8时，徐某在千里之外的乙县被抓获1月3日9时，甲县公安机关到达乙县押解徐某1月5日10时，徐某被押解回甲县，送看守所羁押下列说法正确的是（）', 'A．甲县公安机关应当在徐某被押解到甲县后24小时内通知家属;B．甲县公安机关应当在徐某被执行拘留后24小时内通知家属;C．甲县公安机关前往押解徐某时，应当在到达乙县后24小时内制作第一次讯问笔录;D．徐某被押解到甲县后应当立即送看守所羁押，至迟不得超过12小时&nbsp;', 'B', '1', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('cd38f09ec09149e183c35b253fa8ae0e', '马里人卡伦从越南入境，因在中国非法居留被甲县公安局查获。下列说法正确的是（）。', 'A.甲县公安局可以对卡伦作出遣送出境的决定;B.可以将卡伦遣送到越南;C.自遣送出境决定作出之日起6年内不准入境;D.卡伦对遣送出境决定不服，可以提起行政诉讼&nbsp;', 'AB', '2', '5bac34701af4425692eef413797efab1', null, null, '2018-05-20 23:23:25', '2018-05-20 23:23:25', '1');
INSERT INTO `test_question` VALUES ('cd8df570f7ad408f812be46087485b11', '甲市乙县发生一起持枪抢劫金店案件，被抢大量金器，犯罪嫌疑人在逃，该案由甲市公安局刑侦支队办理下列选项中说法不正确的是（）', 'A．通缉令的发布范围，由市公安局刑侦支队负责人决定;B．为了查获被抢的金器，可以发布悬赏通告;C．犯罪嫌疑人被抓获后，抓获单位可以直接撤销悬赏通告;D．符合悬赏通告上领取赏金条件的公民，因未领取到赏金，可以向法院提起诉讼&nbsp;', 'AC', '2', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('cd8f8b7d4e6048429890c0db392efced', '(17年新增试题)华某涉嫌组织、领导黑社会性质组织罪被刑事拘留，因其存在可能伪造证据、串供等有碍侦查的情形，办案单位可暂不予通知家属，但有碍侦查的情形消失以后，应当立即通知华某的家属', null, 'No', '3', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('ce9d833e7dca45959d57d1c7fac234b8', '公安机关破获以张某为首的黑社会性质组织犯罪集团，关于对作证人员的保护，下列选项正确的是（）', 'A．可指派专人对被害人甲的人身和住宅进行保护;B．证人乙可申请不公开真实姓名、住址等个人信息;C．丁是公安机关打入张某犯罪集团的卧底，在其提供的证据材料中使用化名代替丁的真名;D．案件移送审查起诉时，应当将采取保护措施的相关情况一并移交人民检察院&nbsp;', 'ABCD', '2', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('ceb28e204add427d87f9321cea023703', '(17年新增试题)张某在B市C县收到虚假的还款账号短信息，以为是债权人发送的账号，便在B市D县通过网上银行转给犯罪嫌疑人100万元C县与D县公安机关对该案件均有管辖权', null, 'Yes', '3', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('cf159a4fd6a846e6ae8444e8ea72dea4', '甲受某外国著名军事杂志雇用，将我国某部队的部署情况非法提供给该杂志在审判过程中，人民法院决定对甲取保候审关于对甲取保候审的执行机关，下列说法正确的是（）', 'A．人民法院;B．公安机关;C．人民检察院;D．国家安全机关&nbsp;', 'D', '1', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('cf61eed7f4eb44428b5f6fffa0e2e55f', '犯罪嫌疑人王某，因涉嫌组织、领导、参加恐怖组织罪、抢劫罪、走私罪和故意伤害罪被公安机关立案侦查公安机关于11月1日拘留犯罪嫌疑人王某，王某提出委托律师，公安机关以涉嫌恐怖活动犯罪为由拒绝了王某的要求12月6日人民检察院批准逮捕王某犯罪嫌疑人王某认为公安机关对其拘留超过法定期限，公安机关则认为对王某的拘留没有超限下列观点正确的是（）', 'A．本案中，犯罪嫌疑人王某提出委托律师，公安机关拒绝王某的要求是对的;B．如果拘留超过法定期限，犯罪嫌疑人及委托的律师提出后，侦查机关应立即释放犯罪嫌疑人或变更为取保候审或监视居住，如果拘留期满的最后一日是节假日，应在节假日后的第一个工作日立即释放犯罪嫌疑人或变更为取保候审或监视居住;C．就本案来说，公安机关对犯罪嫌疑人王某的拘留没有超过法定拘留羁押期限;D．如果犯罪嫌疑人委托的律师认为公安机关拘留超过法定期限，可以向有关部门提出控告&nbsp;', 'CD', '2', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('cf6b9929f7d3432d8fb944defe44ae81', '外国人对依照《出境入境管理法》的规定对其实施的（）措施不服的，可以依法申请行政复议，该行政复议决定为最终决定。', 'A．继续盘问;B．拘留审查;C．限制活动范围;D．遣送出境&nbsp;', 'ABCD', '2', '5bac34701af4425692eef413797efab1', null, null, '2018-05-20 23:23:25', '2018-05-20 23:23:25', '1');
INSERT INTO `test_question` VALUES ('cff357cc71a442ebb3b92f7cb06312a6', '某税务局在对王某逃税一案进行调查时，发现其涉嫌构成犯罪，遂将案件移送公安机关经侦部门处理对于税务局在此前执法过程中所收集的物证、书证，公安机关可以作为证据使用', null, 'Yes', '3', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('d00a9e8a7efc4d48aa8c5839af828ad2', '某县公安局在办理吴某盗窃汽车一案时，吴某主动交代将汽车借给其表兄王某使用，办案人员到王某处找到该辆汽车，经批准后将其扣押，并开列扣押清单一式三份，一份交给吴某，一份交给公安机关保管人员，一份附卷备查', null, 'No', '3', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('d02f879a7e0449328246aeaffab7130f', '关于证据的审查判断，下列说法正确的是（）', 'A．被害人有生理缺陷，对案件事实的认知和表达存在一定困难，故其陈述在任何情况下都不得采信;B．证人与犯罪嫌疑人乙有利害冲突，其提供的对乙不利的证言，不得采信;C．公安机关制作的放火案的勘验、检查笔录没有见证人签名，不得采信;D．搜查获得的杀人案凶器，未附搜查笔录，不能证明该凶器来源，不得采信&nbsp;', 'D', '1', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('d0c1aab3606a459f8eb6b84d6c92e941', '甲市人李某在乙市一酒吧殴打他人致轻伤，涉嫌故意伤害罪被乙市公安机关决定取保候审，李某在取保候审期间逃跑，公安机关发布通缉令后将其抓获下列说法正确的是（）', 'A．乙市公安机关可以在自己的辖区内直接发布通缉令;B．乙市公安机关通过全国公安机关跨区域办案协作平台请求甲市公安机关调取李某户籍证明的，应当在7日内办结并回复;C．乙市公安机关责令李某在取保候审期间不得进入酒吧;D．李某对轻伤害的鉴定意见有异议，人民法院认为鉴定人有必要出庭的，鉴定人应当出庭作证&nbsp;', 'ACD', '2', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('d1212341c53b4bcdbe842b4882a316c9', '越南人童某（15周岁）涉嫌非法入境。下列说法正确的有（）。', 'A.公安机关可以对其继续盘问;B.公安机关可以依法对其拘留审查;C.公安机关可以限制其活动范围，未经公安机关批准，不得离开限定的区域D.童某如对限制活动范围的措施不服，可以申请行政复议&nbsp;', 'ACD', '2', '5bac34701af4425692eef413797efab1', null, null, '2018-05-20 23:23:25', '2018-05-20 23:23:25', '1');
INSERT INTO `test_question` VALUES ('d1267b55011e4d589a90833f3a55955d', '外国人有下列（）情形的，可以遣送出境。', 'A．被处限期出境，未在规定期限内离境的;B．有不准入境情形的;C．非法居留的;D．非法就业的&nbsp;', 'ABCD', '2', '5bac34701af4425692eef413797efab1', null, null, '2018-05-20 23:23:25', '2018-05-20 23:23:25', '1');
INSERT INTO `test_question` VALUES ('d4243a56f2714327b869a4d03a91fb66', '民警金某在抓捕盗窃犯罪嫌疑人林某时，目睹了其持刀拒捕并逃跑的经过审判时，控辩双方对金某的证言有异议，如果人民法院通知金某出庭作证，金某可以出庭作证，也可以不出庭作证', null, 'No', '3', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('d4869add974544fab13006761d1962bd', '甲因涉嫌抢夺罪被人民检察院批准逮捕，公安机关执行逮捕后，下列说法中正确的是（）', 'A．应当在24小时以内通知甲的家属，有碍侦查和无法通知的除外;B．应当在24小时以内对甲进行讯问，发现不应当逮捕的，必须立即释放;C．如对甲变更为取保候审，应当通知原批准的人民检察院;D．人民检察院应当对甲羁押的必要性继续进行审查&nbsp;', 'BCD', '2', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('d4f137e477f74b3da9b355664ab1d2d5', '某市公安局在办理赵某故意伤害案件中，发现赵某是省政协委员，以下关于公安机关对赵某采取强制措施的表述错误的是（）', 'A．对赵某采取拘传的，应当将有关情况通报给赵某所属的政协组织;B．对赵某采取监视居住的，应当将有关情况通报给赵某所属的政协组织;C．对赵某执行拘留前，应当向赵某所属的政协组织通报情况；情况紧急的，可在执行的同时或者执行以后及时通报;D．对赵某执行逮捕前，应当报请赵某所属的政协组织许可；情况紧急的，可在执行的同时或者执行以后及时报请许可&nbsp;', 'D', '1', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('d536b582f0ec4a0092b632a552b9a941', '以下被害人向公安机关控告的刑事案件中，公安机关应当立案侦查的是（　）', 'A．王某当众捏造闫某嫖娼的事实，同时还对闫某进行辱骂;B．李某被何某打成轻伤;C．张某将朋友交由自己保管的巨款非法占为己有，拒不归还;D．马某被遗弃案&nbsp;', 'BD', '2', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('d5d00dd11b1b4857b0cdd0be33a53d2c', '甲因抢劫他人财物被某县公安机关依法提请批准逮捕，在侦查期间，甲不讲真实姓名、住址，身份不明对于该案件，下列说法正确的是（）', 'A．侦查羁押期限自查清甲真实身份之日起计算;B．在查清甲真实身份以前，不允许其委托辩护律师为他提供法律帮助;C．在查清甲真实身份以前，中止其他侦查活动;D．如果犯罪事实清楚，证据确实、充分，可以按甲自报姓名移送县人民检察院审查起诉&nbsp;', 'AD&nbsp;', '2', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('d69c441e75a845ea88cad8c9b8f34fba', '国家安全机关工作人员高某到某国有企业负责人家中盗窃，所盗赃物有高档照相机一部，内有涉及国家秘密的照片该案应由国家安全机关管辖', null, 'No', '3', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('d6bf96f5b8b84d78a6ccde9e68f1331b', '(17年新增试题)赵某（10年前因电信诈骗被判有期徒刑2年）与诈骗团伙共谋后，商定帮助诈骗团伙到银行提取诈骗所得去年1月至今年5月，赵某雇佣他人前往A省B市、C省D市等地，在银行ATM机上为诈骗团伙取款或转账共计800余万元此外，去年3月至10月，赵某还在B市采用向不特定人发放虚假兑奖卡的手段，骗取他人财物共计15.5万元关于上述案件，下列说法错误的是（）', 'A．B市或者D市公安机关均可对赵某等人在当地涉嫌犯罪案件行使管辖权;B．对赵某等人在B市和D市涉嫌犯罪案件可依法并案侦查;C．赵某涉嫌掩饰、隐瞒犯罪所得罪和诈骗罪，应当从一重罪处罚;D．对赵某应当酌情从重处罚&nbsp;', 'C', '1', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('d78ce11d07f142ffb3656fa78ef73e77', '在黄某涉嫌故意杀人案中，证人小红当时在现场目击黄某拿刀杀人，但因害怕黄某家人报复不敢作证，公安机关侦查人员甲、乙以殴打的方式要求小红说她看见黄某拿刀杀人，小红由于害怕继续被打就说了自己看见黄某杀人的事情下列说法正确的是（）', 'A．小红的证言不能作为定案根据，因为该证人证言是公安机关以暴力手段获得的;B．小红的证言可以作为定案根据，因为其陈述的是事实;C．小红的证言可以作为定案根据，因为有其他证据证明小红当时在案发现场;D．如果有其他证据证明黄某有故意杀人行为，小红的证人证言可以作为定案根据&nbsp;', 'A', '1', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('d88ffeded8e5465aa3c02aafd76c317b', '王某在车站候车期间，顺手将临座孕妇的钱包盗走，内有现金5000元根据《刑事诉讼法》的规定，侦查人员在讯问王某时，（）', 'A．可以对讯问过程进行录音或者录像;B．应当对讯问过程进行录音或者录像;C．是否录音或者录像由犯罪嫌疑人决定;D．如果录音或者录像，录音或者录像无须全程进行&nbsp;', 'A', '1', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('d8ab3127b95447659f6fbb46f39e2797', '许某指控赵某诈骗其现金15万元，赵某被抓获后，供述利用诈骗许某的现金买了手提电脑一台和50公斤海鲜，还有10万元现金存入银行，在对赵某的住处进行搜查时，除存有10万元现金的存折，还发现毒品200克对于上述物品，公安机关处理错误的是（）', 'A．对手提电脑予以扣押;B．对毒品予以扣押;C．对50公斤海鲜予以变卖，变卖所得返还许某;D．对存折上的存款予以冻结&nbsp;', 'C', '1', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('d8b7aa8ff5684a8098dbdfccefe82526', '陈某（满18周岁）在马路上抢劫时被巡逻的两名民警发现，民警立即将陈某控制以下说法符合法律规定的是（）', 'A．民警将陈某口头传唤至公安机关接受讯问，应当补办传唤证;B．民警对陈某的传唤讯问时间可以延长至24小时;C．民警对陈某传唤的时间结束后，应当报公安机关负责人决定是否对陈某采取刑事拘留措施;D．民警对陈某传唤的时间结束后，可以再次对其传唤讯问，但不得超过2次&nbsp;', 'B', '1', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('da0b9bc612064a5db269f7c20c404c50', '韩国人朴某非法入境，其对公安机关限制活动范围措施不服，（）。', 'A.可以申请行政复议;B.可以向人民法院提起行政诉讼;C.可以先申请行政复议再提起行政诉讼;D.限制活动范围决定为最终决定，不能申请行政复议&nbsp;', 'A', '1', '5bac34701af4425692eef413797efab1', null, null, '2018-05-20 23:23:25', '2018-05-20 23:23:25', '1');
INSERT INTO `test_question` VALUES ('da2e1fd521cf4d2aa10651955df377d9', '某人民检察院侦查国家工作人员韩某巨额财产来源不明案时，发现巨额财产来自盗窃和诈骗下列说法正确的是（）', 'A．由人民检察院继续侦查;B．以人民检察院为主进行侦查，公安机关予以配合;C．以公安机关为主进行侦查，人民检察院予以配合;D．人民检察院将案件移送公安机关&nbsp;', 'D', '1', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('dcc08facf21b4e6fb265e0ff42a58c41', '3月1日，甲因抢劫他人财物被某县公安机关依法逮捕，在侦查期间，甲不讲真实姓名、住址，身份不明，直到5月2日公安机关才查清甲的真实身份对于该案，公安机关应当（　）', 'A．自5月3日起计算侦查羁押期限;B．在查清甲真实身份以前，不允许其委托律师为其提供法律帮助;C．在查清甲真实身份以前，应当继续侦查;D．如果犯罪事实清楚，证据确实、充分，可以按甲自报的姓名移送县人民检察院审查起诉&nbsp;', 'CD', '2', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('dccd3fa87f6b4beb90b20219f3f70a12', '(17年新增试题)下列关于刑事案件管辖的说法错误的是（）', 'A．收到电信诈骗电话后，王某按对方要求通过手机银行汇款10万元，该案件可由王某转账时所在地公安机关管辖;B．某铁路施工工地发生盗窃案件，该案件应当由工地所在地铁路公安机关管辖;C．某犯罪集团在马来西亚针对我国公民实施电信网络诈骗，该案件可由公安部指定有关公安机关立案侦查;D．地方人员李某经营一制衣厂，涉嫌非法生产、买卖军队制式服装，后被驻地军队保卫部门当场查获', 'B', '1', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('e06923d828654264a94640c7b46edc31', '在一起聚众斗殴致人死亡案件中，有甲、乙、丙、丁4名犯罪嫌疑人，他们对于犯罪事实都供认不讳，都是主犯，但对于年龄都提出了异议，按照户籍证明四人都年满18周岁下列说法正确的是（）', 'A．甲的父母提出甲作案时为17周岁，提出的出生证明文件也被查证属实，且有邻居等证言证实，可以认定甲作案时未满18周岁;B．乙的父母提出乙作案时为17周岁，没有出生证明文件提供，但有人口普查登记、邻居等证言证实乙为17周岁，可以认定乙作案时未满18周岁;C．丙的父母提出丙作案时为17周岁，提供了学籍卡、防疫证明等书证证明丙为17周岁，且有邻居等证言印证，可以认定丙作案时未满18周岁;D．丁的父母提出丁作案时为17周岁，但经查，没有相关书证印证，只有邻居、接生婆等证言证明丁作案时为17周岁，骨龄鉴定为作案时未满18周岁，因骨龄鉴定仅作为参考，可以根据户籍证明认定丁作案时为18周岁&nbsp;', 'ABC', '2', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('e192dea4c1834dd8b3657a9dab565207', '张某盗窃5000元人民币的案件由县公安机关侦查终结后移送县人民检察院审查起诉县人民检察院审查后认为张某犯罪情节轻微，可以免除刑罚，决定不起诉县公安机关如果认为县人民检察院不起诉的决定有错误，依法可以（）', 'A.请求县人民法院审查县人民检察院的决定;B.请求市公安机关移送市人民检察院审查起诉;C.要求县人民检察院复议;D.申请市人民检察院复核&nbsp;', 'C', '1', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('e259c0fccc314d1bafbddf590a0a16df', '章某（女）在一些大型商场专门盗窃高档衣物十余次，屡屡得手，后在一次作案时被抓了现行关于本案，下列说法错误的是（）', 'A．公安机关男侦查人员有权在有见证人在场时搜查章某的身体;B．搜查章某的身体应当由女工作人员进行;C．公安机关可以对章某的家进行搜查，没有紧急情形时，必须出示搜查证;D．搜查章某的家时，应当有章某或者她的家属、邻居或者其他见证人在场&nbsp;', 'A', '1', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('e34091df2d704fe6bac23a059d6df268', '孙某在抢劫时被公安机关当场抓获，公安机关将孙某口头传唤至公安机关进行讯问下列说法错误的是()', 'A．在传唤孙某时，可以不经批准，不使用传唤证;B．由于案情复杂，需要对孙某刑事拘留，对孙某传唤的时间可以延长至24小时;C．在传唤期间为保证充分的休息时间，孙某提出休息，应当让其休息;D．在传唤期间讯问孙某时，应当告知其如实供述自己的罪行可以从宽处理的规定&nbsp;', 'C', '1', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('e36f5e7ba9254a30a4f630529ecc3125', '甲是黑社会性质组织犯罪的被害人，因在侦查中作证，甲的人身及其开办企业的财产安全面临黑社会性质组织团伙其他成员的报复危险，公安机关应当采取必要的保护措施', null, 'No', '3', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('e39a6723e1fc4d35897326ad9647f6f7', '甲市乙县公安局发现故意杀人犯罪嫌疑人周某可能已经逃出乙县，为查获周某，经县公安局负责人批准，可以发布悬赏通告，并在甲市的市级电视台、报刊上发布', null, 'No', '3', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('e3ba98fa55b44148b7cf872d568d7500', '美国人汤姆非法入境，其对公安机关限制活动范围措施不服，（）。', 'A.可以向人民法院提起行政诉讼;B.可以依法申请行政复议，该行政复议决定为最终决定;C.对行政复议决定不服，方可再提起行政诉讼;D.限制活动范围决定为最终决定，不能申请行政复议也不能提起行政诉讼&nbsp;', 'B', '1', '5bac34701af4425692eef413797efab1', null, null, '2018-05-20 23:23:25', '2018-05-20 23:23:25', '1');
INSERT INTO `test_question` VALUES ('e3bc61c67f06496fb2ea6f1e212b8924', '关于证人作证，下列说法正确的是（）', 'A．人民警察小王就其执行职务时目击的犯罪情况，可作为证人出庭;B．凡是证人，人民法院都可以强制其出庭作证;C．证人是被告人的配偶、父母、子女，经人民法院通知无正当理由拒不出庭的，人民法院可强制其到庭;D．证人保护只限于保护证人本人，不包括其近亲属&nbsp;', 'A', '1', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('e5571fc5277648ca9943ceef17293c3a', '对被处限期出境的外国人，未在规定期限内离境的，可以遣送出境。&nbsp;', null, 'Yes', '3', '5bac34701af4425692eef413797efab1', null, null, '2018-05-20 23:23:25', '2018-05-20 23:23:25', '1');
INSERT INTO `test_question` VALUES ('e5ba49706659414a846c22c05cf09880', '谢某因涉嫌恐怖活动犯罪被公安机关指定居所监视居住，侦查期间，谢某聘请陶某为其辩护律师下列说法正确的是（）', 'A.陶某会见谢某应当经公安机关许可B.陶某会见谢某需要聘请翻译人员的，无须公安机关审查;C.陶某会见谢某时，侦查人员可以进行监听;D.侦查期间陶某不可以了解案件有关情况&nbsp;', 'A', '1', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('e66ea4e5b84b4e248a6de970c6ab495e', '下列情形中，依法不予追究刑事责任的是（）', 'A．贾某侵占案，被害人没有起诉;B．犯罪嫌疑人白某在被抓获前自杀;C．高某犯罪情节显著轻微，依法不需判处刑罚;D．李某诉张某侮辱案，开庭审理前双方达成了和解协议，李某要求撤回告诉&nbsp;', 'ABCD', '2', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('e6a11d6a96fd49a59bd7ad6d6ea63e35', '张某因涉嫌盗窃罪被甲县人民检察院批准逮捕，后经其辩护人申请，甲县公安机关同意对张某取保候审甲县公安机关应当()', 'A．报请甲县人民检察院审批;B．报请甲县人民检察院备案;C．通知甲县人民检察院;D．要求甲县人民检察院撤销对张某的逮捕决定&nbsp;', 'C', '1', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('e7111e4e8e6b411cba6a4e3cda9378a3', '花某诈骗王某、张某各2万元，被公安机关抓获公安机关在刘某的见证下，组织对花某进行辨认下列做法正确的是（）', 'A.侦查人员让王某、张某一同对花某进行辨认;B.在两名侦查人员的主持下，王某对花某进行辨认;C.侦查人员将花某放在5名年龄、身高、气质相似、性别相同的辨认陪衬人中，组织王某、张某分别对花某进行辨认;D.辨认结束后，制作了辨认笔录，由侦查人员和王某、张某签名&nbsp;', 'B', '1', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('e7847235219545b7b92296c46dcc6230', '甲县一国有企业总经理李某伙同出纳员王某，采用虚报发票的方式，套取企业资金2000万元，东窗事发后，二人出逃本案应当由甲县公安机关办理', null, 'No', '3', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('e988dc1d1fea4b13a694566a4be3c3d6', '王某到某公安派出所报案称，前两天晚上在某酒店宴请朋友，聚会结束后将装有2万元现金的手提包忘记拿走，第二天去找酒店索要时，酒店老板借口不知情，拒不退还该公安派出所的下列做法正确的是（）', 'A．制作了询问笔录;B．派出两名民警到该酒店了解情况;C．通知王某其报案材料将移送人民法院，并告知王某应该向人民法院起诉;D．接受王某的报案材料后，决定立案侦查&nbsp;', 'ABC', '2', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('e9eb3d8bb6554ec28ca9ce4ed42e84ac', '在侦查期间，律师会见在押的犯罪嫌疑人，应当经侦查机关许可的案件是（）', 'A．甲涉嫌危害国家安全犯罪;B．乙涉嫌恐怖活动犯罪;C．丙涉嫌特别重大贿赂犯罪;D．丁涉嫌毒品犯罪&nbsp;', 'ABC', '2', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('eaaf8f9f49b04e59b42b10ab4045e467', '下列情形中，公安机关可以先行拘留的是（）', 'A．甲为实施投毒犯罪而购买毒药;B．乙被举报实施强奸罪，现正准备逃跑;C．在丙的住处发现有被盗的金项链;D．丁有盗窃嫌疑，经民警现场询问，拒不告知真实姓名、身份&nbsp;', 'ABCD', '2', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('eac0c7a71c4341a2a8276ff054190d5e', '某男因涉嫌信用卡诈骗罪被公安机关立案侦查，但该犯罪嫌疑人不讲真实姓名、住址，身份不明，公安机关（　）', 'A．应当对其身份进行调查;B．确实无法查清其身份的，也可以按其自报的姓名移送人民检察院起诉;C．无须对其身份进行调查，因为羁押期限可以自查清其身份之日起开始计算;D．可以停止对其犯罪行为的侦查取证&nbsp;', 'AB', '2', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('ead753b84ce14b1daa3dd106113c3b01', '下列关于证人及证人证言的说法正确的是（）', 'A．证人刘某向公安机关提供的关于案件发生经过的书面陈述是证人证言;B．某国家机关工作人员王某就其领导贪污的情况寄给检察机关的匿名举报信是证人证言;C．盲人李某向公安机关陈述其在案发现场听到的谈话，李某的证言可以作为证人证言;D．证人孙某有权要求公安机关保证其近亲属的安全&nbsp;', 'ACD', '2', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('ec37ab1cc44e4ac585952a64fdf4ddc4', '犯罪嫌疑人郝某涉嫌抢劫罪被甲县公安机关拘留，公安机关对其进行第一次讯问后，在甲县人民法院工作的郝某妻子王某要求作为辩护人介入此案，会见在押的郝某，公安机关应当（）', 'A．不予许可;B．准予许可;C．报同级检察机关批准是否许可;D．由该县公安局局长决定是否许可&nbsp;', 'A', '1', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('ed4b48979da54205bf544ecbb1c2c740', '朱某被判处有期徒刑，在交付执行前人民法院决定对朱某暂予监外执行朱某在暂予监外执行期间严重违反有关监督管理规定，被决定收监执行后朱某脱逃以下说法正确的是（）', 'A.对朱某暂予监外执行由公安机关负责;B.对朱某予以收监执行的决定应当由公安机关征求人民法院同意后作出;C.人民法院决定对朱某暂予监外执行前，应当征求监狱或者看守所同意;D.由公安机关负责对朱某进行追捕&nbsp;', 'D', '1', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('ee54f38bd6194a79b50febc9b1c3cf50', '犯罪嫌疑人甲在实施抢劫时被当场抓获并被刑事拘留，后被逮捕甲拒不说出真实姓名、住址，身份不明，其侦查羁押期限应从（）', 'A．拘留之日起计算;B．逮捕之日起计算;C．查清其身份之日起计算;D．查清全部犯罪事实之日起计算&nbsp;', 'C', '1', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('ef27013779784651a29604955d4a38b9', '(17年新增试题)犯罪嫌疑人罗某、甘某利用在互联网上盗取的QQ号码将其申请的QQ号码信息更改为被害人亲属QQ号码信息等方式，冒充被害人亲属的身份，以“亲友出车祸急需借钱救治”等理由，诱骗被害人汇款至其指定账户二人用此种手段实施诈骗三起，骗得金额共计8万元为逃避打击，二人将犯罪所得进行了转移，罗某将其中的2万元给了刘某清偿债务，刘某不知罗某所还2万元为诈骗所得关于案件办理情况，下列说法正确的是（）', 'A．应当对刘某收取的2万元予以追缴;B．对罗某、甘某以诈骗罪及掩饰、隐瞒犯罪所得罪数罪并罚;C．如被害人在甲县汇款，则甲县公安局可以行使管辖权;D．如二人将犯罪所得从乙地转移到丙地进行消费，则乙、丙两地公安机关均可以行使管辖权&nbsp;', 'CD', '2', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('ef8af9e1a2ce49b9a03c70b8fa7c1d60', '甲县环保局将涉嫌环境污染犯罪的案件移交至甲县公安机关，对于甲县环保局移送的在办理该案件中收集的证据材料，在刑事诉讼中可以作为证据使用的是（）', 'A．物证;B．书证;C．视听资料;D．电子数据&nbsp;', 'ABCD', '2', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('ef91eea24d704fc9b5cf8d7536c3333a', '外国人有下列（）情形的，不适用拘留审查，可以限制其活动范围。', 'A．哺乳不满2周岁婴儿的;B．患有严重疾病的;C．未满18周岁的;D．已满70周岁的&nbsp;', 'BD', '2', '5bac34701af4425692eef413797efab1', null, null, '2018-05-20 23:23:25', '2018-05-20 23:23:25', '1');
INSERT INTO `test_question` VALUES ('eff5c5a238994b88a02b0e48fe907c81', '某市公安局破获以耿某为首的危害国家安全犯罪团伙，扣押大量的物证，侦查终结后移送起诉扣押的下列物证中，原物应当随案移送的是（）', 'A．活动经费100万元人民币;B．危害国家安全的宣传品;C．管制刀具;D．秘密文件&nbsp;', 'A', '1', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('f0a179524ca94de39015b6b26f0732de', '某土地管理局在查办张某倒卖土地案件过程中，发现其涉嫌犯罪，将案件移交当地公安机关国土资源管理局收集的下列证据材料，在刑事诉讼中可以作为证据使用的是（）', 'A.物证;B.书证;C.视听资料;D.电子数据&nbsp;', 'ABCD', '2', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('f0bff883e21e447eb1173da6925d4e32', '犯罪嫌疑人杨某因涉嫌强迫交易罪被甲市乙区公安局取保候审，由于杨某违反取保候审相关规定，经甲市公安局局长批准，可没收其交纳的10万元保证金', null, 'Yes', '3', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('f0dc2f3e68c142e0826cd00a1a70fd38', '甲因涉嫌盗窃被A县公安局取保候审，现甲的联系方式发生变动，甲应当在24小时以内向A县公安局报告', null, 'Yes', '3', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('f117494de1294c148f3fce165735ddcd', '甲县公安局对李某涉嫌盗窃案件侦查终结后，将该案移送甲县人民检察院起诉下列表述错误的是（）', 'A.甲县公安局对退回补充侦查的案件，应在1个月以内侦查完毕;B.退回补充侦查以2次为限;C.审查起诉期间改变管辖的，即使改变管辖前退回补充侦查了1次，改变管辖后退回补充侦查的次数仍为2次;D.甲县人民检察院可以退回甲县公安局补充侦查，也可以自行侦查&nbsp;', 'C', '1', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('f130cfa94fd54762b71d279c4ee65a6b', '犯罪嫌疑人甲涉嫌故意伤害罪被某县公安机关取保候审，保证人是他的堂弟乙但是甲在取保候审期间违反公安机关不准其会见被害人的规定，多次纠缠被害人，要求私了，遭被害人拒绝后，扬言要再次给被害人一点厉害尝尝，乙没有尽到保证人职责对此，某县公安机关可以（）', 'A．对乙处以罚款500元;B．责令甲具结悔过;C．给予甲治安管理处罚;D．对甲变更强制措施为监视居住&nbsp;', 'BCD', '2', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('f192ed358fae496d80883fb0efd5dd55', '对下列无刑事责任能力的精神病人，无须强制医疗的是（）', 'A.开某拿刀在人群中乱砍，造成3人轻微伤;B.王某经常将家人打伤，最近一次造成重伤;C.何某有暴力倾向，经常扬言对国家领导人实施暴力行为;D.苛某冲入机动车道，驾驶人为躲避苛某，造成机动车倾覆&nbsp;', 'CD', '2', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('f1e0846a1e4a4c1dbf9855ee83df1b26', '张某因涉嫌放火罪被批准逮捕公安机关在侦查过程中，发现张某另有抢劫罪的重大嫌疑，决定重新计算侦查羁押期限，应当报作出逮捕决定的人民检察院批准', null, 'No', '3', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('f2b5dbc34736461b8aff712cefa6d6f8', '关于在侦查期间会见被监视居住人，下列说法不正确的是（）', 'A．辩护律师同被指定居所监视居住的犯罪嫌疑人会见和通信，和同在住处被监视居住的犯罪嫌疑人会见和通信适用同样的规定;B．辩护律师持律师执业证书、律师事务所证明和委托书或者法律援助公函要求会见被监视居住的犯罪嫌疑人的，监督执行机关应当及时安排会见，至迟不得超过48小时;C．危害国家安全犯罪、恐怖活动犯罪、黑社会性质的组织犯罪、特别重大贿赂犯罪案件，辩护律师会见在押的犯罪嫌疑人，应当经侦查机关许可;D．辩护律师会见被监视居住的犯罪嫌疑人，可以向其了解案件有关情况&nbsp;', 'C', '1', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('f354045d14d64601a6eccc34b137997c', '李某涉嫌犯罪被公安机关立案侦查，委托律师何某作为辩护人何某来到公安机关要求查阅、摘抄、复制李某涉嫌犯罪的案卷材料，公安机关应当准许', null, 'No', '3', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('f3ae7b4134b84f128d5b7b7a4134b1bc', '(17年新增试题)阿某制作了大量视频，存储在境外服务器，通过微信朋友圈、博客、贴吧等网络平台传播恐怖主义、极端主义同时，阿某利用极端主义，煽动、胁迫当地群众违反国家法律确立的婚姻制度结婚，不允许学龄儿童到当地政府开办的学校学习关于该案，下列说法错误的是（）', 'A．阿某构成宣扬恐怖主义、极端主义罪和利用极端主义破坏法律实施罪;B．对存储在境外服务器的视频可以通过网络在线提取;C．阿某通过博客、微信朋友圈、贴吧等网络平台发布的信息属于电子数据;D．侦办案件过程中，公安机关制作的阿某讯问笔录电子稿属于电子数据&nbsp;', 'D', '1', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('f452bac9185d4038b33563ecbb1b6ddf', '某诈骗案的犯罪嫌疑人甲17周岁在案件侦查过程中，甲的父亲乙提出申请，要求本案的侦查员丙回避，理由是据说被害人的父亲丁在案件办理期间曾请丙出去吃过饭关于本案中的回避，下列说法正确的是（）', 'A．乙提出回避申请，应当经过甲同意;B．对丙的回避作出决定前，丙不停止对案件的侦查;C．是否批准本案中的回避申请，由丙所在的县级以上公安机关负责人决定;D．是否批准本案中的回避申请，由人民法院院长决定&nbsp;', 'BC', '2', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('f4a6f88a35ae47b988f35f5facfa35c8', '初某，大连人，现在北京工作因此前在大连工作期间涉嫌职务侵占罪（较轻微）被大连警方立案侦查，侦查人员决定对初某进行传唤以下做法正确的是（　）', 'A．可以将初某传唤到北京的某一指定地点进行讯问;B．可以到初某在北京的住处进行讯问;C．可以将初某从北京传唤到大连进行讯问;D．侦查人员传唤初某时应当出示公安机关的证明文件&nbsp;', 'ABD', '2', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('f5110ac03c10442d996d45de8142f56c', '某县公安局对张某涉嫌诈骗冯某一案立案侦查，并冻结了张某的基金份额冻结期间，张某申请出售下列说法错误的是（）', 'A.冻结张某的基金份额应当经县公安局局长批准;B.张某申请出售冻结的基金份额应当经公安机关审查;C.出售基金份额所得价款由金融机构保管;D.出售后应当及时告知张某、冯某或者其近亲属&nbsp;', 'C', '1', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('f51bb4fcc84e4a239a52179a7ded90af', '某地发生一起故意伤害致人死亡案件，路人赵某刚好目睹了案件发生的整个过程公安机关在收集赵某的证言时存在一些问题，其中，通过有关办案人员的补正或者作出合理解释，可以采用的证据有（）', 'A．询问赵某的笔录没有记录人的签名，能作出合理解释;B．询问赵某时没有告知其应当如实提供证言和有意作伪证或者隐匿罪证要负法律责任的内容，已经补正;C．询问赵某时制作的询问笔录没有经过赵某的核对确认;D．询问不通晓当地语言、文字的外国人赵某时，没有提供翻译&nbsp;', 'AB', '2', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('f5be90dee825404bb233c435ea5530f9', '下列情形中，可以监视居住的是（）', 'A．犯罪嫌疑人甲符合逮捕条件，但患有严重疾病、生活不能自理;B．犯罪嫌疑人乙可能判处拘役，符合取保候审条件，但提不出保证人，也交不出保证金;C．犯罪嫌疑人丙符合逮捕条件，但丙的父亲生活不能自理，丙是他的唯一扶养人;D．犯罪嫌疑人丁符合逮捕条件，但正在怀孕&nbsp;', 'ABCD', '2', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('f721f10f1762407cb403c37226a45982', '下列案件中，公安机关无权立案侦查的是（）', 'A．汪某，地税局干部，暴力干涉其女儿婚姻自由，致其女儿死亡;B．刘某，某村农民，虐待其父，致其父死亡;C．王某，某民营企业出纳，利用职务之便将自己经手保管的财物非法占为己有，数额较大;D．杨某，水利局干部，在工作中玩忽职守构成犯罪&nbsp;', 'D', '1', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('f82ce4de5cbd4983859207482ea3ac47', '李某，系某国家机关进口处干部6月，李某被派去R国进修学习半年，在R国学习期间，李某经不住金钱、美女的诱惑，被R国情报机构拉下水回国后，李某曾多次为R国情报机构提供国家秘密和情报当年4月，李某在去某县考察确定外贸加工定点厂家过程中，收受一工厂通过该县外贸公司经理送的好处费人民币5万元另外，李某隐瞒已婚的事实，利用妻女均在老家的机会，骗取未婚证明，于次年2月在省城的工作单位所属的街道办事处与刘某登记结婚关于本案的立案，以下说法正确的是（）', 'A．李某为R国情报机构提供国家秘密和情报的行为应由公安机关立案侦查;B．李某收取好处费的行为应由人民检察院立案侦查;C．李某的重婚行为可以由人民法院直接受理;D．李某所有的案件都应由公安机关立案侦查&nbsp;', 'BC', '2', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('f891e2213adf4663ac2331b0e7d4d01a', '某公安局在侦查国家机关工作人员韩某强奸邓某案件时，发现其巨额财产来源不明，下列说法正确的是（）', 'A.由公安机关分别立案侦查;B.将案件并案后移送人民检察院，以人民检察院为主进行侦查，公安机关予以配合;C.将案件并案后以公安机关为主进行侦查，人民检察院予以配合;D.将巨额财产来源不明案件移送人民检察院&nbsp;', 'D', '1', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('f8d4dc25f00c4770b426db8e6808cf19', '被拘留审查或者被决定遣送出境但不能立即执行的人员，应当羁押在拘留所或者遣返场所。&nbsp;', null, 'Yes', '3', '5bac34701af4425692eef413797efab1', null, null, '2018-05-20 23:23:25', '2018-05-20 23:23:25', '1');
INSERT INTO `test_question` VALUES ('f91a08e21d914cd685a0b86f8297876c', '某公安派出所民警王某、张某接群众举报，称涉嫌贩毒的通缉犯李某正在辖区内一户人家中下列说法正确的有（）', 'A.抓获李某后，报经县公安局局长批准，可以凭通缉令羁押李某;B.赶赴现场后，如果犯罪嫌疑人李某拒绝开门，应当返回公安机关开具搜查证;C.经搜查，发现犯罪嫌疑人李某随身携带大量毒品，若李某在庭审时否认携带毒品，人民法院认为民警有必要出庭作证的，民警应当出庭作证;D.对扣押的毒品，应当按照国家有关规定在诉讼终结后处理&nbsp;', 'ACD', '2', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('f9debd49e8574eb08021a23bdb7b9d8a', '证人李某因在刘某组织、领导黑社会性质组织犯罪案件中作证，其人身安全面临危险下列说法不正确的是（）', 'A.李某可以向公安机关请求予以保护B.经人民法院通知，李某因担心报复而不出庭作证，人民法院不能强制李某出庭作证;C.公安机关可以在询问笔录中使用化名代替李某的个人信息;D.李某因履行作证义务而支出的交通、就餐、住宿费用，应当给予补助&nbsp;', 'B', '1', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('fa2a3f660a3c4f6eb905aa2d685d9fdf', '在侦查王某涉嫌盗窃案件中，经查证，确实采用了刑讯逼供的方法，据此，下列证据中不能作为定案根据的是（）', 'A．证人证言;B．被害人陈述;C．视听资料;D．书证&nbsp;', 'AB', '2', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('fabaca547c3d4a1fb51e8965d9b13c71', '侦查人员在涉嫌故意杀人罪的张某住处将其抓获，经当场对其住处进行搜查，提取作案工具匕首一把，但因情况紧急，需要立即对张某进行讯问，使其供述已着手再次作案的同伙李某的去向，因此未能制作搜查笔录、提取笔录和扣押清单，事后，侦查人员制作了书面情况说明进行合理解释，该匕首可以作为物证采用', null, 'No', '3', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('fb4b94e5e1b84ac9bd3a5536e140aa7f', '乔某居住在C县，因涉嫌受贿被检察机关决定监视居住在监视居住期间，对乔某应当遵守的规定，表述正确的有（）', 'A.未经C县公安机关批准，不得离开执行监视居住的处所;B.未经C县人民检察院批准，不得会见其居住在其他地方的亲友;C.未经C县公安机关批准，不得会见律师;D.未经C县人民检察院批准，不得以任何方式通信&nbsp;', 'A', '1', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('fb9d84f3456a4a5c9b6cf96fb3c9c148', '家住乙县的张某在甲县盗窃一辆摩托车（价值8000元），后驾驶摩托车来到丙县，被丙县公安机关抓获本案应当由（）公安机关立案侦查', 'A．甲县;B．乙县;C．丙县;D．甲县和丙县&nbsp;', 'A', '1', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('fd02f6eba6014edd83b0b207ca158e60', '甲是贩毒案件的证人，公安机关可以采取的保护措施有（）', 'A．不公开甲的个人信息;B．采取不暴露外貌、真实声音等出庭作证措施;C．对甲的人身、住宅进行专门保护;D．禁止特定人员接触甲&nbsp;', 'ABCD', '2', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');
INSERT INTO `test_question` VALUES ('ff43e7b5604a4c3c8a72e951b9ed91a2', '某公安局法制部门在审查一起盗窃案件中，犯罪嫌疑人甲、乙和证人丙、丁提出在侦查期间遭到非法取证，要求确认其供述或证言不具备证据能力下列应当根据法律规定排除的证据是（）', 'A．甲不承认作案，侦查人员将甲双手铐在窗户的铁栏杆上，双脚仅仅脚尖能着地;B．对乙进行引诱，说“讲了就可以回去”;C．对丙进行引诱，说“甲、乙是村里的混混，只要你指证是他们作案，就可以把他们送进监狱，村里就太平了”;D．对丁进行威胁，说“不配合我们的工作就把你关进来”&nbsp;', 'ABCD', '2', 'c4dcba47c74d4e2fa5f7210018710a7d', null, null, '2018-05-20 23:23:42', '2018-05-20 23:23:42', '1');

-- ----------------------------
-- Table structure for test_self
-- ----------------------------
DROP TABLE IF EXISTS `test_self`;
CREATE TABLE `test_self` (
  `test_self_id` varchar(100) NOT NULL,
  `test_self_name` varchar(200) DEFAULT NULL,
  `test_self_level` varchar(100) DEFAULT NULL,
  `test_self_type` varchar(100) DEFAULT NULL,
  `test_self_content` mediumtext,
  `create_date` datetime DEFAULT NULL,
  `creator_id` varchar(100) DEFAULT NULL,
  `creator_name` varchar(100) DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  `enable` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`test_self_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of test_self
-- ----------------------------

-- ----------------------------
-- Table structure for upload_file_log
-- ----------------------------
DROP TABLE IF EXISTS `upload_file_log`;
CREATE TABLE `upload_file_log` (
  `upload_file_id` varchar(100) NOT NULL,
  `file_name` varchar(200) DEFAULT NULL,
  `remark` text,
  `creator_id` varchar(100) DEFAULT NULL,
  `creator_name` varchar(100) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  PRIMARY KEY (`upload_file_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of upload_file_log
-- ----------------------------
INSERT INTO `upload_file_log` VALUES ('5bac34701af4425692eef413797efab1', '出入境管理法.doc', '上传成功！', null, '管理员', '2018-05-20 23:23:25');
INSERT INTO `upload_file_log` VALUES ('c4dcba47c74d4e2fa5f7210018710a7d', '办理刑事案件程序(含17年新增试题).doc', '上传成功！', null, '管理员', '2018-05-20 23:23:42');

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
INSERT INTO `user_role` VALUES ('1', '0101001', 'admin');
INSERT INTO `user_role` VALUES ('1', 'admin', 'admin');
