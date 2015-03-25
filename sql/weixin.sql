/*
SQLyog Ultimate v9.63 
MySQL - 5.5.14 : Database - weixin
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`weixin` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `weixin`;

/*Table structure for table `sys_func` */

DROP TABLE IF EXISTS `sys_func`;

CREATE TABLE `sys_func` (
  `funcid` varchar(32) NOT NULL COMMENT '菜单ID',
  `funcname` varchar(32) DEFAULT NULL COMMENT '菜单名称',
  `funcurl` varchar(100) DEFAULT NULL COMMENT '菜单地址',
  `funcIcon` varchar(100) DEFAULT NULL COMMENT '菜单图片',
  `funclevel` char(1) DEFAULT NULL COMMENT '菜单等级(0一级菜单 1 二级菜单)',
  `funcorder` int(3) DEFAULT NULL COMMENT '菜单排序',
  `parentid` varchar(32) DEFAULT NULL COMMENT '父菜单',
  PRIMARY KEY (`funcid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统菜单';

/*Data for the table `sys_func` */

insert  into `sys_func`(`funcid`,`funcname`,`funcurl`,`funcIcon`,`funclevel`,`funcorder`,`parentid`) values ('1','系统管理','','images/icon06.png','0',999,'0'),('2','系统用户管理','rest/sys/user','','1',1,'1'),('3','角色管理','rest/sys/role',NULL,'1',2,'1'),('4','权限管理','rest/sys/func',NULL,'1',3,'1'),('40284481486f566a01486f57ac290002','自定义菜单','rest/menu','','1',4,'5'),('40284481486f566a01486f5809240003','公众账号管理','rest/account','','1',1,'5'),('40284481486f566a01486f5844050004','文本消息模板','rest/message/texttemplate','','1',5,'5'),('40284481486f566a01486f5872c00005','图文消息管理','rest/message/newstemplate','','1',6,'5'),('4028d8e74c08da49014c08dd598f001c','关注','rest/subscribe','','1',2,'5'),('4028d8e74c08fffa014c0901b2dd000e','会员管理','rest/snuser','','1',1,'5'),('5','微信管理','','','0',1,'0'),('6','机构管理','rest/sys/org',NULL,'1',4,'1'),('8a7e829a48abd2100148aceb8e760003','消息接收','rest/message/receivetext','','1',9,'5');

/*Table structure for table `sys_org` */

DROP TABLE IF EXISTS `sys_org`;

CREATE TABLE `sys_org` (
  `orgid` varchar(32) NOT NULL COMMENT '机构ID',
  `orgname` varchar(64) DEFAULT NULL COMMENT '机构名',
  `orgdesc` varchar(200) DEFAULT NULL COMMENT '机构描述',
  `parentid` varchar(32) DEFAULT NULL COMMENT '父机构ID',
  PRIMARY KEY (`orgid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='机构';

/*Data for the table `sys_org` */

insert  into `sys_org`(`orgid`,`orgname`,`orgdesc`,`parentid`) values ('1','管理员','管理员','0');

/*Table structure for table `sys_role` */

DROP TABLE IF EXISTS `sys_role`;

CREATE TABLE `sys_role` (
  `roleid` varchar(32) NOT NULL COMMENT '角色ID',
  `rolename` varchar(32) DEFAULT NULL COMMENT '角色名',
  PRIMARY KEY (`roleid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色';

/*Data for the table `sys_role` */

insert  into `sys_role`(`roleid`,`rolename`) values ('1','系统管理员'),('4028d8e74c08da49014c08f041cf0029','微信管理');

/*Table structure for table `sys_rolefunc` */

DROP TABLE IF EXISTS `sys_rolefunc`;

CREATE TABLE `sys_rolefunc` (
  `conid` varchar(32) NOT NULL,
  `roleid` varchar(32) DEFAULT NULL COMMENT '角色ID',
  `funcid` varchar(32) DEFAULT NULL COMMENT '菜单ID',
  PRIMARY KEY (`conid`),
  KEY `FK_Reference_4` (`roleid`),
  KEY `FK_Reference_5` (`funcid`),
  CONSTRAINT `FK_Reference_4` FOREIGN KEY (`roleid`) REFERENCES `sys_role` (`roleid`),
  CONSTRAINT `FK_Reference_5` FOREIGN KEY (`funcid`) REFERENCES `sys_func` (`funcid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色菜单关联表';

/*Data for the table `sys_rolefunc` */

insert  into `sys_rolefunc`(`conid`,`roleid`,`funcid`) values ('4028d8e74c08fffa014c090254f4001c','1','1'),('4028d8e74c08fffa014c09025522001d','1','2'),('4028d8e74c08fffa014c0902567e001e','1','3'),('4028d8e74c08fffa014c090256a4001f','1','4'),('4028d8e74c08fffa014c090256c50020','1','6'),('4028d8e74c08fffa014c090256ef0021','1','5'),('4028d8e74c08fffa014c090257100022','1','40284481486f566a01486f57ac290002'),('4028d8e74c08fffa014c0902574a0023','1','40284481486f566a01486f5809240003'),('4028d8e74c08fffa014c0902576a0024','1','40284481486f566a01486f5844050004'),('4028d8e74c08fffa014c090257950025','1','40284481486f566a01486f5872c00005'),('4028d8e74c08fffa014c090257b70026','1','4028d8e74c08da49014c08dd598f001c'),('4028d8e74c08fffa014c090257e10027','1','4028d8e74c08fffa014c0901b2dd000e'),('4028d8e74c08fffa014c0902580a0028','1','8a7e829a48abd2100148aceb8e760003'),('4028d8e74c08fffa014c090288ee0029','4028d8e74c08da49014c08f041cf0029','5'),('4028d8e74c08fffa014c0902893b002a','4028d8e74c08da49014c08f041cf0029','4028d8e74c08fffa014c0901b2dd000e');

/*Table structure for table `sys_user` */

DROP TABLE IF EXISTS `sys_user`;

CREATE TABLE `sys_user` (
  `userid` varchar(32) NOT NULL COMMENT '用户ID',
  `orgid` varchar(32) DEFAULT NULL COMMENT '机构ID',
  `loginname` varchar(32) DEFAULT NULL COMMENT '登陆账号',
  `password` varchar(32) DEFAULT NULL COMMENT '密码',
  `username` varchar(32) DEFAULT NULL COMMENT '用户名',
  `browser` char(2) DEFAULT NULL COMMENT '浏览器类型 \n            01)MSIE 6.0 \n            02)MSIE 7.0 \n            03)MSIE 8.0 \n            04)MSIE 9.0 \n            05)MSIE 10.0 \n            06)rv:11.0 \n            07)Firefox \n            08)Opera 09)Chrome \n            09)Safari',
  `status` char(1) DEFAULT NULL COMMENT '用户状态(0.离线 1.在线 9.禁用)',
  `mobiletel` varchar(20) DEFAULT NULL COMMENT '手机',
  `officetel` varchar(20) DEFAULT NULL COMMENT '办公电话',
  `email` varchar(30) DEFAULT NULL COMMENT '邮箱',
  `usertype` char(1) DEFAULT NULL COMMENT '用户类型(0普通用户、1商家用户、2系统管理员)',
  `accountid` varchar(32) DEFAULT NULL COMMENT 'accountid',
  PRIMARY KEY (`userid`),
  KEY `orgid` (`orgid`),
  CONSTRAINT `orgid` FOREIGN KEY (`orgid`) REFERENCES `sys_org` (`orgid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统用户';

/*Data for the table `sys_user` */

insert  into `sys_user`(`userid`,`orgid`,`loginname`,`password`,`username`,`browser`,`status`,`mobiletel`,`officetel`,`email`,`usertype`,`accountid`) values ('sa','1','sa','60106bc57dc1a384fecef89d9ddd01e5','超级管理员',NULL,NULL,'','',NULL,NULL,NULL),('userid','1','admin','e10adc3949ba59abbe56e057f20f883e','系统管理员',NULL,NULL,'2','3',NULL,NULL,NULL);

/*Table structure for table `sys_userrole` */

DROP TABLE IF EXISTS `sys_userrole`;

CREATE TABLE `sys_userrole` (
  `conid` varchar(32) NOT NULL,
  `userid` varchar(32) DEFAULT NULL COMMENT '用户ID',
  `roleid` varchar(32) DEFAULT NULL COMMENT '角色ID',
  PRIMARY KEY (`conid`),
  KEY `FK_Reference_2` (`userid`),
  KEY `FK_Reference_3` (`roleid`),
  CONSTRAINT `FK_Reference_2` FOREIGN KEY (`userid`) REFERENCES `sys_user` (`userid`),
  CONSTRAINT `FK_Reference_3` FOREIGN KEY (`roleid`) REFERENCES `sys_role` (`roleid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户角色关联表';

/*Data for the table `sys_userrole` */

insert  into `sys_userrole`(`conid`,`userid`,`roleid`) values ('4028d8e74c08da49014c08f0ac1d0036','sa','1'),('4028d8e74c08da49014c08f0cde00037','userid','4028d8e74c08da49014c08f041cf0029');

/*Table structure for table `wx_base_account` */

DROP TABLE IF EXISTS `wx_base_account`;

CREATE TABLE `wx_base_account` (
  `accountid` varchar(32) NOT NULL COMMENT '账号ID',
  `accountname` varchar(200) DEFAULT NULL COMMENT '帐号名称',
  `accounttoken` varchar(200) DEFAULT NULL COMMENT '账号TOKEN',
  `accountnumber` varchar(50) DEFAULT NULL COMMENT '公众微信号',
  `wx_accountid` varchar(30) DEFAULT NULL COMMENT '原始ID',
  `accounttype` char(1) DEFAULT NULL COMMENT '公众号类型(0订阅号 1服务号)',
  `accountemail` varchar(100) DEFAULT NULL COMMENT '电子邮箱',
  `accountdesc` varchar(500) DEFAULT NULL COMMENT '公众帐号描述',
  `accountappid` varchar(200) DEFAULT NULL COMMENT '公众帐号APPID',
  `accountappsecret` varchar(500) DEFAULT NULL COMMENT '公众帐号APPSECRET',
  `userid` varchar(32) DEFAULT NULL COMMENT '系统用户',
  `updatetime` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`accountid`),
  KEY `ref` (`userid`),
  CONSTRAINT `ref` FOREIGN KEY (`userid`) REFERENCES `sys_user` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='微信公众账号';

/*Data for the table `wx_base_account` */

insert  into `wx_base_account`(`accountid`,`accountname`,`accounttoken`,`accountnumber`,`wx_accountid`,`accounttype`,`accountemail`,`accountdesc`,`accountappid`,`accountappsecret`,`userid`,`updatetime`) values ('8a7e83ba48a844c80148a84b504f0002','微信','action','微信','gh_e759b9b42a70',NULL,'','','wx10850b1999faeddc','c7fe3e7ede319798fa3f9729204fc6db',NULL,'2014-09-24 23:33:01'),('accountid','纳特比特','hll','april1002','gh_3e1c8115a263',NULL,'','','wx6bf7e8013f0f64d8','0d1bece223de5da3016ea1ea6659788d','userid','2015-03-20 11:37:07');

/*Table structure for table `wx_base_menu` */

DROP TABLE IF EXISTS `wx_base_menu`;

CREATE TABLE `wx_base_menu` (
  `menuid` varchar(32) NOT NULL COMMENT '菜单ID',
  `accountid` varchar(32) DEFAULT NULL COMMENT '账号ID',
  `menukey` varchar(32) DEFAULT NULL COMMENT '菜单关键字',
  `name` varchar(32) DEFAULT NULL COMMENT '菜单名称',
  `templateId` varchar(32) DEFAULT NULL COMMENT '模板ID',
  `msgType` varchar(32) DEFAULT NULL COMMENT '消息类型',
  `type` varchar(10) DEFAULT NULL COMMENT '菜单类型(Click或者view)',
  `url` varchar(1000) DEFAULT NULL COMMENT '菜单链接',
  `parentid` varchar(32) DEFAULT NULL COMMENT '父菜单',
  `orders` int(4) DEFAULT NULL COMMENT '排序',
  `updatetime` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`menuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='微信菜单';

/*Data for the table `wx_base_menu` */

insert  into `wx_base_menu`(`menuid`,`accountid`,`menukey`,`name`,`templateId`,`msgType`,`type`,`url`,`parentid`,`orders`,`updatetime`) values ('fbb9b3484c1418d5014c1418d5a50000','accountid','code','获取序列号',NULL,NULL,'view','https://open.weixin.qq.com/connect/oauth2/authorize?appid=wx6bf7e8013f0f64d8&redirect_uri=http%3A%2F%2Fwww.nutbit.net%2Fwelcome&response_type=code&scope=snsapi_userinfo&state=STATE#wechat_redirect','0',1,'2015-03-17 22:30:05'),('fbb9b3484c1418d5014c141935100001','accountid','detail','会员信息',NULL,NULL,'view','https://open.weixin.qq.com/connect/oauth2/authorize?appid=wx6bf7e8013f0f64d8&redirect_uri=http%3A%2F%2Fwww.nutbit.net%2Fdetail&response_type=code&scope=snsapi_userinfo&state=STATE#wechat_redirect','0',2,'2015-03-17 22:30:27'),('fbb9b3484c50428d014c50428d860000','accountid','3','毒眼一族','1','text','view','http://www.nutbi','0',3,'2015-03-25 17:28:01');

/*Table structure for table `wx_base_newsitem` */

DROP TABLE IF EXISTS `wx_base_newsitem`;

CREATE TABLE `wx_base_newsitem` (
  `itemid` varchar(32) NOT NULL COMMENT '图文项ID',
  `accountid` varchar(32) DEFAULT NULL COMMENT '账号ID',
  `itemtype` char(1) DEFAULT NULL COMMENT '图文类型',
  `author` varchar(50) DEFAULT NULL COMMENT '作者',
  `content` text COMMENT '内容',
  `description` varchar(200) DEFAULT NULL COMMENT '描述',
  `imagepath` varchar(200) DEFAULT NULL COMMENT '图片地址',
  `orders` int(4) DEFAULT NULL COMMENT '排序',
  `title` varchar(100) DEFAULT NULL COMMENT '标题',
  `templateid` varchar(32) DEFAULT NULL COMMENT '模板',
  `url` varchar(200) DEFAULT NULL COMMENT '访问地址',
  `updatetime` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`itemid`),
  KEY `fk` (`templateid`),
  CONSTRAINT `fk` FOREIGN KEY (`templateid`) REFERENCES `wx_base_newstemplate` (`templateid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='图文项';

/*Data for the table `wx_base_newsitem` */

insert  into `wx_base_newsitem`(`itemid`,`accountid`,`itemtype`,`author`,`content`,`description`,`imagepath`,`orders`,`title`,`templateid`,`url`,`updatetime`) values ('1','accountid','0','黄莉莉','<p>黄莉莉的订阅号是最棒的</p>','黄莉莉的订阅号是最棒的',NULL,NULL,'我爱黄莉莉的订阅号','402844814879e804014879e834940001','','2014-09-23 23:01:48'),('2','accountid','0','许峰','许峰的订阅号也是最棒的','许峰订阅号也是最棒的',NULL,2,'我爱许峰订阅号','402844814879e804014879e834940001',NULL,'2014-08-30 19:53:18'),('40284481487f366001487f3660510000','accountid','0','11','','','newsitem/bg_20140924224217.jpg',NULL,'111aa','402844814879e804014879e834940001','','2014-09-24 22:42:17'),('40284481489361940148936194bc0000','accountid','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-09-20 22:05:18'),('402844814898a7bc014898a7bc190000','accountid','0','','','',NULL,NULL,'11','402844814879e804014879e834940001','','2014-09-21 22:40:02'),('402844814898a7bc014898a7dbca0001','accountid','0','','<p>1</p>','',NULL,NULL,'33','402844814879e804014879e834940001','','2014-09-21 22:40:10'),('402844814898a7bc014898a7f8bf0002','accountid','0','','','',NULL,NULL,'22','402844814879e804014879e834940001','','2014-09-21 22:40:18'),('402844814898a7bc014898a8236c0003','accountid','0','','','',NULL,NULL,'11','402844814879e804014879e834940001','','2014-09-21 22:40:29'),('402844814898a7bc014898a877c70005','accountid','0','','','',NULL,NULL,'111','402844814879e804014879e834940001','','2014-09-21 22:40:50'),('402844814898a7bc014898ac59380007','accountid','0','','','',NULL,NULL,'11','402844814879e804014879e834940001','','2014-09-21 22:45:04'),('4028448148a307570148a30757320000','accountid','0','','<p>123123</p>','23123','newsitem/image1_20140924232419.png',NULL,'33212333123','1','','2014-09-25 15:07:33');

/*Table structure for table `wx_base_newstemplate` */

DROP TABLE IF EXISTS `wx_base_newstemplate`;

CREATE TABLE `wx_base_newstemplate` (
  `templateid` varchar(32) NOT NULL COMMENT '模板ID',
  `accountid` varchar(32) DEFAULT NULL COMMENT '账号ID',
  `templatename` varchar(200) DEFAULT NULL COMMENT '模块名称',
  `updatetime` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`templateid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='图文模板';

/*Data for the table `wx_base_newstemplate` */

insert  into `wx_base_newstemplate`(`templateid`,`accountid`,`templatename`,`updatetime`) values ('1','accountid','2','2014-09-24 22:41:58'),('402844814879e804014879e834940001','accountid','1','2014-09-24 22:41:52');

/*Table structure for table `wx_base_receivetext` */

DROP TABLE IF EXISTS `wx_base_receivetext`;

CREATE TABLE `wx_base_receivetext` (
  `textid` varchar(32) NOT NULL COMMENT '文本消息ID',
  `accountid` varchar(32) DEFAULT NULL COMMENT '账号ID',
  `textcontent` varchar(255) DEFAULT NULL COMMENT '接受内容',
  `fromusername` char(200) DEFAULT NULL COMMENT '消息发送者',
  `msgid` varchar(200) DEFAULT NULL COMMENT '消息ID',
  `msgtype` varchar(32) DEFAULT NULL COMMENT '消息类型',
  `rescontent` varchar(300) DEFAULT NULL COMMENT '回复内容',
  `responseflag` char(1) DEFAULT NULL COMMENT '是否回复',
  `tousername` varchar(100) DEFAULT NULL COMMENT '消息接受者',
  `addtime` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`textid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='接收文本消息';

/*Data for the table `wx_base_receivetext` */

insert  into `wx_base_receivetext`(`textid`,`accountid`,`textcontent`,`fromusername`,`msgid`,`msgtype`,`rescontent`,`responseflag`,`tousername`,`addtime`) values ('4028448148267c480148267c48e30000','accountid','?','1','1234567890123456','text',NULL,NULL,'wx_accountid','2014-08-30 18:35:52'),('4028448148267c480148267f8a6a0001','accountid','?','1','1234567890123456','text',NULL,NULL,'wx_accountid','2014-08-30 18:39:25'),('40284481482682e301482682e3400000','accountid','?','1','1234567890123456','text',NULL,NULL,'wx_accountid','2014-08-30 18:43:05'),('40284481482682e30148268426910001','accountid','?','1','1234567890123456','text',NULL,NULL,'wx_accountid','2014-08-30 18:44:27'),('4028448148268ecc0148268eccdd0000','accountid','?','1','1234567890123456','text',NULL,NULL,'wx_accountid','2014-08-30 18:56:05'),('4028448148268ecc0148269054fa0001','accountid','?','1','1234567890123456','text',NULL,NULL,'wx_accountid','2014-08-30 18:57:46'),('40284481482693be01482693bebf0000','accountid','?','1','1234567890123456','text',NULL,NULL,'wx_accountid','2014-08-30 19:01:29'),('402844814826957201482695721c0000','accountid','?','1','1234567890123456','text',NULL,NULL,'wx_accountid','2014-08-30 19:03:21'),('402844814826957201482695e73f0001','accountid','?','1','1234567890123456','text',NULL,NULL,'wx_accountid','2014-08-30 19:03:51'),('4028448148269cc50148269cc5990000','accountid','?','1','1234567890123456','text',NULL,NULL,'wx_accountid','2014-08-30 19:11:21'),('402844814826b1b3014826b1b3630000','accountid','?','1','1234567890123456','text',NULL,NULL,'wx_accountid','2014-08-30 19:34:13'),('402844814826b44d014826b44d510000','accountid','?','1','1234567890123456','text',NULL,NULL,'wx_accountid','2014-08-30 19:37:03'),('402844814826b767014826b767c50000','accountid','?','1','1234567890123456','text',NULL,NULL,'wx_accountid','2014-08-30 19:40:26'),('402844814826bc0d014826bc0d4f0000','accountid','?','1','1234567890123456','text',NULL,NULL,'wx_accountid','2014-08-30 19:45:31'),('402844814826bc0d014826c5047a0001','accountid','1','1','1234567890123456','text',NULL,NULL,'wx_accountid','2014-08-30 19:55:19'),('402844814826bc0d014826c529a00002','accountid','?','1','1234567890123456','text',NULL,NULL,'wx_accountid','2014-08-30 19:55:28'),('402844814826bc0d014826c5387b0003','accountid','1','1','1234567890123456','text',NULL,NULL,'wx_accountid','2014-08-30 19:55:32'),('402844814826bc0d014826c544840004','accountid','2','1','1234567890123456','text',NULL,NULL,'wx_accountid','2014-08-30 19:55:35'),('4028448148278a670148278a67e00000','accountid','?','1','1234567890123456','text',NULL,NULL,'wx_accountid','2014-08-30 23:30:55'),('4028448148278a670148278a8b410001','accountid','翻译许峰','1','1234567890123456','text',NULL,NULL,'wx_accountid','2014-08-30 23:31:04'),('4028448148278a670148278ac28c0002','accountid','天气上海','1','1234567890123456','text',NULL,NULL,'wx_accountid','2014-08-30 23:31:18'),('4028448148278a670148278bb72f0003','accountid','天气上海','1','1234567890123456','text',NULL,NULL,'wx_accountid','2014-08-30 23:32:20'),('4028448148278a670148278de5450004','accountid','天气上海','1','1234567890123456','text',NULL,NULL,'wx_accountid','2014-08-30 23:34:43'),('4028448148278ec30148278ec3e00000','accountid','天气上海','1','1234567890123456','text',NULL,NULL,'wx_accountid','2014-08-30 23:35:40'),('4028448148278ec30148278f6c8f0001','accountid','天气上海','1','1234567890123456','text',NULL,NULL,'wx_accountid','2014-08-30 23:36:23'),('4028448148278ec30148279019290002','accountid','天气上海','1','1234567890123456','text',NULL,NULL,'wx_accountid','2014-08-30 23:37:08'),('4028448148278ec30148279037530003','accountid','天气上海','1','1234567890123456','text',NULL,NULL,'wx_accountid','2014-08-30 23:37:15'),('40284481482792c101482792c1cd0000','accountid','天气上海','1','1234567890123456','text',NULL,NULL,'wx_accountid','2014-08-30 23:40:02'),('40284481482792c1014827935dae0001','accountid','天气上海','1','1234567890123456','text',NULL,NULL,'wx_accountid','2014-08-30 23:40:42'),('40284481482792c101482793f2db0002','accountid','天气上海','1','1234567890123456','text',NULL,NULL,'wx_accountid','2014-08-30 23:41:20'),('40284481482792c101482795c3f60003','accountid','天气上海','1','1234567890123456','text',NULL,NULL,'wx_accountid','2014-08-30 23:43:19'),('40284481482792c10148279672bf0004','accountid','天气上海','1','1234567890123456','text',NULL,NULL,'wx_accountid','2014-08-30 23:44:04'),('40284481482798fe01482798fea60000','accountid','天气上海','1','1234567890123456','text',NULL,NULL,'wx_accountid','2014-08-30 23:46:51'),('40284481482798fe01482799aaff0001','accountid','天气上海','1','1234567890123456','text',NULL,NULL,'wx_accountid','2014-08-30 23:47:35'),('40284481482798fe0148279a3a350002','accountid','天气上海','1','1234567890123456','text',NULL,NULL,'wx_accountid','2014-08-30 23:48:11'),('4028448148279b450148279b452b0000','accountid','天气上海','1','1234567890123456','text',NULL,NULL,'wx_accountid','2014-08-30 23:49:20'),('402844814827aeae014827aeae350000','accountid','天气上海','1','1234567890123456','text',NULL,NULL,'wx_accountid','2014-08-31 00:10:32'),('402844814827f911014827f9111b0000','accountid','天气上海','1','1234567890123456','text',NULL,NULL,'wx_accountid','2014-08-31 01:31:47'),('402844814827f95c014827f95c2d0000','accountid','天气上海','1','1234567890123456','text',NULL,NULL,'wx_accountid','2014-08-31 01:32:06'),('402844814827fa9d014827fa9d230000','accountid','天气上海','1','1234567890123456','text',NULL,NULL,'wx_accountid','2014-08-31 01:33:28'),('402844814827fca2014827fca2970000','accountid','天气上海','1','1234567890123456','text',NULL,NULL,'wx_accountid','2014-08-31 01:35:41'),('40284481482808130148280813e30000','accountid','?','1','1234567890123456','text',NULL,NULL,'wx_accountid','2014-08-31 01:48:11'),('402844814828081301482808b18c0001','accountid','?','1','1234567890123456','text',NULL,NULL,'wx_accountid','2014-08-31 01:48:51'),('402844814828081301482808ebea0002','accountid','?','1','1234567890123456','text',NULL,NULL,'wx_accountid','2014-08-31 01:49:06'),('402844814828081301482810621c0003','accountid','sdf','1','1234567890123456','text',NULL,NULL,'wx_accountid','2014-08-31 01:57:15'),('40284481482808130148281140260004','accountid','sdf','1','1234567890123456','text',NULL,NULL,'wx_accountid','2014-08-31 01:58:12'),('402844814829dc8c014829dc8c270000','accountid','sdf','wx_accountid','1234567890123456','text',NULL,NULL,'1','2014-08-31 10:19:52'),('402844814829dc8c014829dcbe1f0001','accountid','221','wx_accountid','1234567890123456','text',NULL,NULL,'1','2014-08-31 10:20:05'),('402844814829dc8c014829dcfc670002','accountid','?','wx_accountid','1234567890123456','text',NULL,NULL,'1','2014-08-31 10:20:21'),('402844814829dc8c014829dd2ced0003','accountid','天气','wx_accountid','1234567890123456','text',NULL,NULL,'1','2014-08-31 10:20:33'),('402844814829dc8c014829dd3d910004','accountid','天气上海','wx_accountid','1234567890123456','text',NULL,NULL,'1','2014-08-31 10:20:38'),('402844814829dc8c014829dd5dfe0005','accountid','翻译','wx_accountid','1234567890123456','text',NULL,NULL,'1','2014-08-31 10:20:46'),('402844814829dc8c014829ddb02b0006','accountid','翻译撒地方','wx_accountid','1234567890123456','text',NULL,NULL,'1','2014-08-31 10:21:07'),('402844814829dc8c014829dde25f0007','accountid','翻译哪里','wx_accountid','1234567890123456','text',NULL,NULL,'1','2014-08-31 10:21:20'),('402844814829e2dd014829e2dd490000','accountid','翻译哪里','wx_accountid','1234567890123456','text',NULL,NULL,'1','2014-08-31 10:26:46'),('402844814829e2dd014829e2f30a0001','accountid','翻哪里','wx_accountid','1234567890123456','text',NULL,NULL,'1','2014-08-31 10:26:52'),('40284481482b4b9e01482b4b9e950000','accountid','附近银行','1','1234567890123456','text',NULL,NULL,'wx_accountid','2014-08-31 17:00:49'),('40284481482b4b9e01482b4bd7910001','accountid','附近银行','1','1234567890123456','text',NULL,NULL,'wx_accountid','2014-08-31 17:01:03'),('40284481482b624901482b6249dd0000','accountid','附近银行','1','1234567890123456','text',NULL,NULL,'wx_accountid','2014-08-31 17:25:34'),('40284481482b624901482b6271e00001','accountid','附近厕所','1','1234567890123456','text',NULL,NULL,'wx_accountid','2014-08-31 17:25:45'),('40284481482b624901482b62b4a70002','accountid','天气上海','1','1234567890123456','text',NULL,NULL,'wx_accountid','2014-08-31 17:26:02'),('40284481482b712901482b7129b00000','accountid','天气上海','1','1234567890123456','text',NULL,NULL,'wx_accountid','2014-08-31 17:41:49'),('40284481482b712901482b71675c0001','accountid','翻译爱的色放','1','1234567890123456','text',NULL,NULL,'wx_accountid','2014-08-31 17:42:05'),('40284481482b712901482b71a0660002','accountid','附近银行','1','1234567890123456','text',NULL,NULL,'wx_accountid','2014-08-31 17:42:20'),('40284481482b712901482b7c149b0003','accountid','附近银行','1','1234567890123456','text',NULL,NULL,'wx_accountid','2014-08-31 17:53:45'),('40284481482b712901482b8152c20004','accountid','附近银行','1','1234567890123456','text',NULL,NULL,'wx_accountid','2014-08-31 17:59:28'),('40284481482b9ddf01482b9ddf880000','accountid','1','1','1234567890123456','text',NULL,NULL,'wx_accountid','2014-08-31 18:30:39'),('40284481482b9ddf01482b9e17e00001','accountid','附近银行','1','1234567890123456','text',NULL,NULL,'wx_accountid','2014-08-31 18:30:54'),('40284481482b9ddf01482b9f2c6f0002','accountid','附近银行','1','1234567890123456','text',NULL,NULL,'wx_accountid','2014-08-31 18:32:04'),('40284481482ba2e501482ba2e5920000','accountid','附近银行','1','1234567890123456','text',NULL,NULL,'wx_accountid','2014-08-31 18:36:08'),('40284481482bab1b01482bab1b490000','accountid','附近银行','1','1234567890123456','text',NULL,NULL,'wx_accountid','2014-08-31 18:45:06'),('40284481482bab1b01482bab33ae0001','accountid','1','1','1234567890123456','text',NULL,NULL,'wx_accountid','2014-08-31 18:45:13'),('8a7e80ba48ad3ccb0148ad4684ce0003','8a7e83ba48a844c80148a84b504f0002','上海','oO-OZjjk2XueTEfOXeATCW15v-9U','6063017865231315937','text',NULL,NULL,'gh_e759b9b42a70','2014-09-25 22:45:52'),('8a7e80ba48ad3ccb0148ad59e1780004','8a7e83ba48a844c80148a84b504f0002','1','oO-OZjjk2XueTEfOXeATCW15v-9U','6063023315544814584','text',NULL,NULL,'gh_e759b9b42a70','2014-09-25 23:07:01'),('8a7e80ba48ad3ccb0148ad59f3020005','8a7e83ba48a844c80148a84b504f0002','2','oO-OZjjk2XueTEfOXeATCW15v-9U','6063023337019651066','text',NULL,NULL,'gh_e759b9b42a70','2014-09-25 23:07:06'),('8a7e80c6495887ef01495887ef110000','8a7e83ba48a844c80148a84b504f0002','1','oO-OZjp0bT4mLG6rdrbsMTiuptxQ','6075358126611676579','text',NULL,NULL,'gh_e759b9b42a70','2014-10-29 04:52:23'),('8a7e814a48b231930148b23193e50000','8a7e83ba48a844c80148a84b504f0002','超市','oO-OZjjk2XueTEfOXeATCW15v-9U','6063372260162781790','text',NULL,NULL,'gh_e759b9b42a70','2014-09-26 21:41:06'),('8a7e819a48b23fc10148b240f6d20002','8a7e83ba48a844c80148a84b504f0002','超市','oO-OZjjk2XueTEfOXeATCW15v-9U','6063376589489816211','text',NULL,NULL,'gh_e759b9b42a70','2014-09-26 21:57:55'),('8a7e819a48b23fc10148b24660730007','8a7e83ba48a844c80148a84b504f0002','上海','oO-OZjjk2XueTEfOXeATCW15v-9U','6063378114203206327','text',NULL,NULL,'gh_e759b9b42a70','2014-09-26 22:03:49'),('8a7e819a48b23fc10148b246b35f0009','8a7e83ba48a844c80148a84b504f0002','哈哈','oO-OZjjk2XueTEfOXeATCW15v-9U','6063378204397519546','text',NULL,NULL,'gh_e759b9b42a70','2014-09-26 22:04:10'),('8a7e81be48ad67090148ad6730450002','8a7e83ba48a844c80148a84b504f0002','上海','oO-OZjjk2XueTEfOXeATCW15v-9U','6063027060756296717','text',NULL,NULL,'gh_e759b9b42a70','2014-09-25 23:21:34'),('8a7e81be48ad67090148ad6863c80004','8a7e83ba48a844c80148a84b504f0002','哈哈','oO-OZjjk2XueTEfOXeATCW15v-9U','6063027400058713106','text',NULL,NULL,'gh_e759b9b42a70','2014-09-25 23:22:52'),('8a7e81ca48a832e50148a832e5610000','accountid','2','o-IZHt9th8N8mfgx9qMr0xxoSm_8','6062652054276950031','text',NULL,NULL,'gh_44a7d8fdc6b3','2014-09-24 23:06:20'),('8a7e81ca48a832e50148a83429900001','accountid','2','o-IZHt9th8N8mfgx9qMr0xxoSm_8','6062652410759235605','text',NULL,NULL,'gh_44a7d8fdc6b3','2014-09-24 23:07:43'),('8a7e81ea48a820bf0148a820bfd40000','accountid','1','o-IZHt9th8N8mfgx9qMr0xxoSm_8','6062646947560835031','text',NULL,NULL,'gh_44a7d8fdc6b3','2014-09-24 22:46:31'),('8a7e81ea48a820bf0148a8217c5b0001','accountid','2','o-IZHt9th8N8mfgx9qMr0xxoSm_8','6062647149424297949','text',NULL,NULL,'gh_44a7d8fdc6b3','2014-09-24 22:47:19'),('8a7e81ea48a820bf0148a821e0f00002','accountid','2','o-IZHt9th8N8mfgx9qMr0xxoSm_8','6062647265388414943','text',NULL,NULL,'gh_44a7d8fdc6b3','2014-09-24 22:47:45'),('8a7e81ea48a820bf0148a822aa460003','accountid','2','o-IZHt9th8N8mfgx9qMr0xxoSm_8','6062647484431747042','text',NULL,NULL,'gh_44a7d8fdc6b3','2014-09-24 22:48:37'),('8a7e81ea48a820bf0148a824bc6c0004','accountid','1','o-IZHt9th8N8mfgx9qMr0xxoSm_8','6062648068547299305','text',NULL,NULL,'gh_44a7d8fdc6b3','2014-09-24 22:50:52'),('8a7e81ea48a820bf0148a825476e0005','accountid','2','o-IZHt9th8N8mfgx9qMr0xxoSm_8','6062648223166121963','text',NULL,NULL,'gh_44a7d8fdc6b3','2014-09-24 22:51:28'),('8a7e829a48abd2100148abd2103e0000','8a7e83ba48a844c80148a84b504f0002','1','oO-OZjjk2XueTEfOXeATCW15v-9U','6062913029374586627','text',NULL,NULL,'gh_e759b9b42a70','2014-09-25 15:59:03'),('8a7e829a48abd2100148abd231160001','8a7e83ba48a844c80148a84b504f0002','2','oO-OZjjk2XueTEfOXeATCW15v-9U','6062913068029292293','text',NULL,NULL,'gh_e759b9b42a70','2014-09-25 15:59:12'),('8a7e82ca48ad95e40148ad962f880003','8a7e83ba48a844c80148a84b504f0002','上海','oO-OZjjk2XueTEfOXeATCW15v-9U','6063040289255568499','text',NULL,NULL,'gh_e759b9b42a70','2014-09-26 00:12:54'),('8a7e82ca48ad95e40148ad9983da000b','8a7e83ba48a844c80148a84b504f0002','莉莉','oO-OZjjk2XueTEfOXeATCW15v-9U','6063041229853406346','text',NULL,NULL,'gh_e759b9b42a70','2014-09-26 00:16:32'),('8a7e82ca48ad95e40148ad99da7f000d','8a7e83ba48a844c80148a84b504f0002','上海','oO-OZjjk2XueTEfOXeATCW15v-9U','6063041324342686861','text',NULL,NULL,'gh_e759b9b42a70','2014-09-26 00:16:54'),('8a7e82ca48ad95e40148ad99fba8000e','8a7e83ba48a844c80148a84b504f0002','上海','oO-OZjjk2XueTEfOXeATCW15v-9U','6063041358702425231','text',NULL,NULL,'gh_e759b9b42a70','2014-09-26 00:17:02'),('8a7e82ca48ad95e40148ad9a9dd90010','8a7e83ba48a844c80148a84b504f0002','厕所','oO-OZjjk2XueTEfOXeATCW15v-9U','6063041539091051667','text',NULL,NULL,'gh_e759b9b42a70','2014-09-26 00:17:44'),('8a7e82ca48ad95e40148ad9ac78c0011','8a7e83ba48a844c80148a84b504f0002','超市','oO-OZjjk2XueTEfOXeATCW15v-9U','6063041582040724629','text',NULL,NULL,'gh_e759b9b42a70','2014-09-26 00:17:55'),('8a7e82ca48ad95e40148ad9b154e0013','8a7e83ba48a844c80148a84b504f0002','2','oO-OZjjk2XueTEfOXeATCW15v-9U','6063041667940070553','text',NULL,NULL,'gh_e759b9b42a70','2014-09-26 00:18:14'),('8a7e82ca48ad95e40148adb182720016','8a7e83ba48a844c80148a84b504f0002','哦哦','oO-OZjjk2XueTEfOXeATCW15v-9U','6063047981541995696','text',NULL,NULL,'gh_e759b9b42a70','2014-09-26 00:42:44'),('8a7e82ca48ad95e40148adb1cba40018','8a7e83ba48a844c80148a84b504f0002','莫来','oO-OZjjk2XueTEfOXeATCW15v-9U','6063048063146374324','text',NULL,NULL,'gh_e759b9b42a70','2014-09-26 00:43:03'),('8a7e82ca48ad95e40148adb21a0b001a','8a7e83ba48a844c80148a84b504f0002','扬州','oO-OZjjk2XueTEfOXeATCW15v-9U','6063048149045720248','text',NULL,NULL,'gh_e759b9b42a70','2014-09-26 00:43:23'),('8a7e82ca48ad95e40148adb237ef001b','8a7e83ba48a844c80148a84b504f0002','武宁','oO-OZjjk2XueTEfOXeATCW15v-9U','6063048183405458618','text',NULL,NULL,'gh_e759b9b42a70','2014-09-26 00:43:31'),('8a7e82ca48ad95e40148af40df25001c','8a7e83ba48a844c80148a84b504f0002','上海','oO-OZjjk2XueTEfOXeATCW15v-9U','6063160389426066725','text',NULL,NULL,'gh_e759b9b42a70','2014-09-26 07:58:57'),('8a7e82ca48ad95e40148af412a0a001e','8a7e83ba48a844c80148a84b504f0002','哈哈里','oO-OZjjk2XueTEfOXeATCW15v-9U','6063160475325412648','text',NULL,NULL,'gh_e759b9b42a70','2014-09-26 07:59:16'),('8a7e82ca48ad95e40148af4569cd0027','8a7e83ba48a844c80148a84b504f0002','扬州','oO-OZjjk2XueTEfOXeATCW15v-9U','6063161669326320946','text',NULL,NULL,'gh_e759b9b42a70','2014-09-26 08:03:54'),('8a7e82ca48ad95e40148af45bba00029','8a7e83ba48a844c80148a84b504f0002','扬州','oO-OZjjk2XueTEfOXeATCW15v-9U','6063161759520634165','text',NULL,NULL,'gh_e759b9b42a70','2014-09-26 08:04:15'),('8a7e82ca48ad95e40148af45e8d5002a','8a7e83ba48a844c80148a84b504f0002','武宁','oO-OZjjk2XueTEfOXeATCW15v-9U','6063161811060241719','text',NULL,NULL,'gh_e759b9b42a70','2014-09-26 08:04:27'),('8a7e82ca48ad95e40148af4676f7002b','accountid','2','o-IZHt9th8N8mfgx9qMr0xxoSm_8','6063161965679235650','text',NULL,NULL,'gh_44a7d8fdc6b3','2014-09-26 08:05:03'),('8a7e82ca48ad95e40148af4689af002c','accountid','1','o-IZHt9th8N8mfgx9qMr0xxoSm_8','6063161987154072132','text',NULL,NULL,'gh_44a7d8fdc6b3','2014-09-26 08:05:08'),('8a7e82ca48ad95e40148af46a9e5002d','accountid','6','o-IZHt9th8N8mfgx9qMr0xxoSm_8','6063162021513810502','text',NULL,NULL,'gh_44a7d8fdc6b3','2014-09-26 08:05:16'),('8a7e82ca48ad95e40148af46f195002e','8a7e83ba48a844c80148a84b504f0002','会开','oO-OZjjk2XueTEfOXeATCW15v-9U','6063162103118017852','text',NULL,NULL,'gh_e759b9b42a70','2014-09-26 08:05:35'),('8a7e82ca48ad95e40148af474ffa0030','8a7e83ba48a844c80148a84b504f0002','管理','oO-OZjjk2XueTEfOXeATCW15v-9U','6063162206197232959','text',NULL,NULL,'gh_e759b9b42a70','2014-09-26 08:05:59'),('8a7e82ca48ad95e40148b20335a00035','8a7e83ba48a844c80148a84b504f0002','超市','oO-OZjjk2XueTEfOXeATCW15v-9U','6063359203462201796','text',NULL,NULL,'gh_e759b9b42a70','2014-09-26 20:50:27'),('8a7e82ca48ad95e40148b2050dc20036','8a7e83ba48a844c80148a84b504f0002','小区','oO-OZjjk2XueTEfOXeATCW15v-9U','6063359727448211922','text',NULL,NULL,'gh_e759b9b42a70','2014-09-26 20:52:28'),('8a7e82ca48ad95e40148b205b25f0037','8a7e83ba48a844c80148a84b504f0002','附近 厕所','oO-OZjjk2XueTEfOXeATCW15v-9U','6063359907836838357','text',NULL,NULL,'gh_e759b9b42a70','2014-09-26 20:53:10'),('8a7e82ca48ad95e40148b22345570038','8a7e83ba48a844c80148a84b504f0002','http://192.168.11.117:8080/weixin/rest/nofilter/newsitem/1','oO-OZjjk2XueTEfOXeATCW15v-9U','6063368231483458091','text',NULL,NULL,'gh_e759b9b42a70','2014-09-26 21:25:29'),('8a7e82ca48ad95e40148b22579f70039','8a7e83ba48a844c80148a84b504f0002','http://192.168.11.117:8080/weixin/rest/nofilter/newsitem/content/1','oO-OZjjk2XueTEfOXeATCW15v-9U','6063368854253716027','text',NULL,NULL,'gh_e759b9b42a70','2014-09-26 21:27:53'),('8a7e836a48acf0a00148acf2aef30002','8a7e83ba48a844c80148a84b504f0002','back','oO-OZjjk2XueTEfOXeATCW15v-9U','6062994268680991520','text',NULL,NULL,'gh_e759b9b42a70','2014-09-25 21:14:18'),('8a7e836a48acf0a00148acf30bec0003','8a7e83ba48a844c80148a84b504f0002','黄莉莉','oO-OZjjk2XueTEfOXeATCW15v-9U','6062994371760206625','text',NULL,NULL,'gh_e759b9b42a70','2014-09-25 21:14:42'),('8a7e836a48acf0a00148acf4ac2e0004','8a7e83ba48a844c80148a84b504f0002','1','oO-OZjjk2XueTEfOXeATCW15v-9U','6062994827026740007','text',NULL,NULL,'gh_e759b9b42a70','2014-09-25 21:16:29'),('8a7e836a48acf0a00148acff9eee0005','8a7e83ba48a844c80148a84b504f0002','家里人','oO-OZjjk2XueTEfOXeATCW15v-9U','6062997910813258553','text',NULL,NULL,'gh_e759b9b42a70','2014-09-25 21:28:26'),('8a7e83aa48ad74540148ad7473790001','8a7e83ba48a844c80148a84b504f0002','上海','oO-OZjjk2XueTEfOXeATCW15v-9U','6063030797377844255','text',NULL,NULL,'gh_e759b9b42a70','2014-09-25 23:36:03'),('8a7e83aa48ad74540148ad74c92a0003','8a7e83ba48a844c80148a84b504f0002','上海','oO-OZjjk2XueTEfOXeATCW15v-9U','6063030887572157475','text',NULL,NULL,'gh_e759b9b42a70','2014-09-25 23:36:25'),('8a7e83aa48ad74540148ad750c790004','8a7e83ba48a844c80148a84b504f0002','哈哈理解','oO-OZjjk2XueTEfOXeATCW15v-9U','6063030964881568806','text',NULL,NULL,'gh_e759b9b42a70','2014-09-25 23:36:42'),('8a7e83aa48ad74540148ad7f32880005','8a7e83ba48a844c80148a84b504f0002','2','oO-OZjjk2XueTEfOXeATCW15v-9U','6063033821034820662','text',NULL,NULL,'gh_e759b9b42a70','2014-09-25 23:47:47'),('8a7e83aa48ad74540148ad7fe4d70006','8a7e83ba48a844c80148a84b504f0002','2','oO-OZjjk2XueTEfOXeATCW15v-9U','6063034014308348987','text',NULL,NULL,'gh_e759b9b42a70','2014-09-25 23:48:33'),('8a7e83aa48ad74540148ad82c16e0007','8a7e83ba48a844c80148a84b504f0002','2','oO-OZjjk2XueTEfOXeATCW15v-9U','6063034821762200641','text',NULL,NULL,'gh_e759b9b42a70','2014-09-25 23:51:40'),('8a7e83aa48ad74540148ad910a06000b','8a7e83ba48a844c80148a84b504f0002','周边','oO-OZjjk2XueTEfOXeATCW15v-9U','6063038841851589722','text',NULL,NULL,'gh_e759b9b42a70','2014-09-26 00:07:16'),('8a7e83ba48a844c80148a844c8f40000','accountid','2','o-IZHt9th8N8mfgx9qMr0xxoSm_8','6062657087978620973','text',NULL,NULL,'gh_44a7d8fdc6b3','2014-09-24 23:25:53'),('8a7e83ba48a844c80148a845819d0001','accountid','2','o-IZHt9th8N8mfgx9qMr0xxoSm_8','6062657294137051183','text',NULL,NULL,'gh_44a7d8fdc6b3','2014-09-24 23:26:40'),('8a7e83ba48a844c80148a8515912000f','8a7e83ba48a844c80148a84b504f0002','1','oO-OZjjk2XueTEfOXeATCW15v-9U','6062660627031500418','text',NULL,NULL,'gh_e759b9b42a70','2014-09-24 23:39:36'),('8a7e83ba48a844c80148a8517f160010','8a7e83ba48a844c80148a84b504f0002','2','oO-OZjjk2XueTEfOXeATCW15v-9U','6062660669981173381','text',NULL,NULL,'gh_e759b9b42a70','2014-09-24 23:39:46');

/*Table structure for table `wx_base_subscribe` */

DROP TABLE IF EXISTS `wx_base_subscribe`;

CREATE TABLE `wx_base_subscribe` (
  `subscribeid` varchar(32) NOT NULL COMMENT '订阅ID',
  `accountid` varchar(32) DEFAULT NULL COMMENT '账号ID',
  `templateId` varchar(32) DEFAULT NULL COMMENT '模板ID',
  `msgType` varchar(32) DEFAULT NULL COMMENT '消息类型',
  `updatetime` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`subscribeid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='订阅';

/*Data for the table `wx_base_subscribe` */

insert  into `wx_base_subscribe`(`subscribeid`,`accountid`,`templateId`,`msgType`,`updatetime`) values ('4028448148982eaa0148982eaa060000','accountid','2','text','2014-09-21 20:33:20');

/*Table structure for table `wx_base_texttemplate` */

DROP TABLE IF EXISTS `wx_base_texttemplate`;

CREATE TABLE `wx_base_texttemplate` (
  `templateid` varchar(32) NOT NULL COMMENT '模板ID',
  `accountid` varchar(32) DEFAULT NULL COMMENT '账号ID',
  `templatename` varchar(200) DEFAULT NULL COMMENT '模块名称',
  `templatecontent` varchar(500) DEFAULT NULL COMMENT '模板内容',
  `updatetime` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`templateid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='消息模板';

/*Data for the table `wx_base_texttemplate` */

insert  into `wx_base_texttemplate`(`templateid`,`accountid`,`templatename`,`templatecontent`,`updatetime`) values ('1','accountid','帮助','1.测试文本\\n2.测试图文','2014-08-30 17:57:02'),('2','accountid','测试文本','你输入1，欢迎使用！','2014-09-24 22:50:46'),('3','accountid','关注语1','欢迎来到xuh服务，如需要帮助输入“？”','2014-09-14 11:10:01');

/*Table structure for table `wx_base_token` */

DROP TABLE IF EXISTS `wx_base_token`;

CREATE TABLE `wx_base_token` (
  `access_token_id` varchar(32) NOT NULL COMMENT '微信凭证ID',
  `access_token` varchar(512) DEFAULT NULL COMMENT '凭证',
  `expires_in` int(11) DEFAULT NULL COMMENT '凭证有效期(7200秒)',
  `addtime` datetime DEFAULT NULL COMMENT '添加时间',
  `accountid` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`access_token_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='微信凭证';

/*Data for the table `wx_base_token` */

insert  into `wx_base_token`(`access_token_id`,`access_token`,`expires_in`,`addtime`,`accountid`) values ('8a7e83ba48a844c80148a8507a26000e','GCZC0AO9wIBU3DpXiJzJzehjeOvWc2yKDTYEgOJ1550hs09qzQyHM_TslsfsjPyyy4J7znHyBRMJrcHD1Zsz0EmPM2p6iNcJ_EJOyu_xzN0',7200,'2014-09-25 00:14:39','accountid');

/*Table structure for table `wx_snuser` */

DROP TABLE IF EXISTS `wx_snuser`;

CREATE TABLE `wx_snuser` (
  `uid` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `openid` varchar(64) DEFAULT NULL COMMENT '微信openid',
  `nickname` varchar(64) DEFAULT NULL COMMENT '昵称',
  `sex` char(1) DEFAULT NULL COMMENT '性别',
  `country` varchar(50) DEFAULT NULL COMMENT '国家',
  `province` varchar(50) DEFAULT NULL COMMENT '省份',
  `city` varchar(50) DEFAULT NULL COMMENT '城市',
  `headImgUrl` varchar(2000) DEFAULT NULL COMMENT '头像链接',
  `sncode` varchar(10) DEFAULT NULL COMMENT '序列号',
  `mcode` varchar(10) DEFAULT NULL COMMENT '机器码',
  `endDate` date DEFAULT NULL COMMENT '过期时间',
  `updatetime` datetime DEFAULT NULL COMMENT '更新时间',
  `dataflag` char(1) DEFAULT NULL COMMENT '状态(0正常 1过期 2限制)',
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=100015 DEFAULT CHARSET=utf8 COMMENT='会员信息';

/*Data for the table `wx_snuser` */

insert  into `wx_snuser`(`uid`,`openid`,`nickname`,`sex`,`country`,`province`,`city`,`headImgUrl`,`sncode`,`mcode`,`endDate`,`updatetime`,`dataflag`) values (100006,'o2pRPs73FYAVJ8rvTfErQkQQ-2YY','Lain瞳','1','中国','上海','黄浦','http://wx.qlogo.cn/mmopen/Dwibk5UhyDm0n0aFPKNsx0vtCByADnMmHsGedF5LFJfeVwib6NKDSLYjTUCficOKf0xKl5HKAZbCgFwEKmCarTz0tHhed9ibic5ibC/0','0123456789','1212121212','2015-12-11','2015-03-18 21:42:22',NULL),(100007,'o2pRPsyq3o0FVyPZqZ2O3jvhxAMM','janlly','2','中国','北京','海淀','http://wx.qlogo.cn/mmopen/mXnA8N5DzZJIgv4qrYur3bA2WFUwlZ4x45UTISxu2cwEzrE0J6icPyXxdo5PaYERcIfpgRRdbo6SX00ibgeicicdgxkjGozZXOZA/0','0123456789','1234567890','2015-12-11','2015-03-20 08:22:16',NULL),(100008,'o2pRPs0Ng3ntenrL8q_tCgXqU8_A','黄莉莉','2','中国','江苏','扬州','http://wx.qlogo.cn/mmopen/uchmtWQh7iaoH2qGHYNor8jnyJ9oxibYTuM4eWaLH8hSAgI0OFvKVRiaq3VmIRGdaV6icd0JUoNEneBm8RJCDVTtH5kxkQQm5P4Y/0','0123456789','1234567890','2015-12-11','2015-03-24 23:55:18',NULL),(100009,'o2pRPsyi9u_IfcHMSXDnXZhcJK5g','许峰','1','中国','上海','','http://wx.qlogo.cn/mmopen/Dwibk5UhyDm0n0aFPKNsx0rX5AJ5gpZ82ianfABeXeuQzmE7D9iaTpYyUib1Vk6TC9jxO2uGic1UficJ2NlgKHBznotico15F0H7w0s/0','0123456789','5425643645','2015-12-11','2015-03-24 23:55:21',NULL),(100010,'o2pRPswjS0SvY3TCuAKyCA6nC9KU','洪洞县都尉','1','中国','北京','丰台','http://wx.qlogo.cn/mmopen/mXnA8N5DzZJIgv4qrYur3XsfgiaM59w74ImT5Lxj31icQt2EMibAtaqfbZfQKjUX3O2UA83cSAicYX1XH2IgJeulSFHhqeve33WD/0','0123456789','1234567890','2015-12-11','2015-03-25 14:44:36',NULL),(100011,'o2pRPswjS0SvY3TCuAKyCA6nC9KU','洪洞县都尉','1','中国','北京','丰台','http://wx.qlogo.cn/mmopen/mXnA8N5DzZJIgv4qrYur3XsfgiaM59w74ImT5Lxj31icQt2EMibAtaqfbZfQKjUX3O2UA83cSAicYX1XH2IgJeulSFHhqeve33WD/0','0123456789','1234567890','2015-12-11','2015-03-25 14:44:51',NULL),(100012,'','','','','','','','0123456789','1234567890','2015-12-11','2015-03-25 14:45:31',NULL),(100013,'','','','','','','','0123456789','1234567890','2015-12-11','2015-03-25 14:46:19',NULL),(100014,'','','','','','','','0123456789','1234567890','2015-12-11','2015-03-25 20:47:36',NULL);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
