-- MySQL dump 10.13  Distrib 8.0.29, for Win64 (x86_64)
--
-- Host: localhost    Database: sss
-- ------------------------------------------------------
-- Server version	5.7.38-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `area`
--

DROP TABLE IF EXISTS `area`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `area` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `label` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pid` int(11) DEFAULT NULL,
  `value` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `area`
--

LOCK TABLES `area` WRITE;
/*!40000 ALTER TABLE `area` DISABLE KEYS */;
INSERT INTO `area` VALUES (1,'安徽省',NULL,'Anhui'),(2,'合肥市',1,'Hefei'),(3,'政务区',2,'Zhengwu');
/*!40000 ALTER TABLE `area` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `book`
--

DROP TABLE IF EXISTS `book`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `book` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '名称',
  `price` decimal(10,2) DEFAULT NULL COMMENT '价格',
  `author` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '作者',
  `create_time` datetime DEFAULT NULL COMMENT '出版日期',
  `cover` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '封面地址',
  `user_id` int(11) DEFAULT NULL COMMENT '用户id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book`
--

LOCK TABLES `book` WRITE;
/*!40000 ALTER TABLE `book` DISABLE KEYS */;
/*!40000 ALTER TABLE `book` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '名称',
  `pid` int(11) DEFAULT NULL COMMENT '父节点id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (2,'童书',1),(3,'社会科学',1),(4,'经济学',1),(5,'科普百科',2),(7,'法律',3);
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `message`
--

DROP TABLE IF EXISTS `message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `message` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `content` text CHARACTER SET utf8mb4 COMMENT '内容',
  `username` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '评论人',
  `time` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '评论时间',
  `parent_id` bigint(20) DEFAULT NULL COMMENT '父ID',
  `foreign_id` bigint(20) DEFAULT '0' COMMENT '关联id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='留言表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `message`
--

LOCK TABLES `message` WRITE;
/*!40000 ALTER TABLE `message` DISABLE KEYS */;
INSERT INTO `message` VALUES (31,'new test','test','2023-01-05 13:41:36',NULL,0),(32,'你好','admin','2023-01-07 21:50:06',NULL,0),(34,'人生若只如初见，何事秋风悲画扇','chattest','2024-05-16 17:01:34',NULL,0),(35,'与意中人相处，如果能像刚刚相识的时候美好而又淡然，没有后来的怨恨、埋怨，那么一切还是停留在初见时的美好为好','22233','2024-05-16 17:05:45',34,0);
/*!40000 ALTER TABLE `message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `news`
--

DROP TABLE IF EXISTS `news`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `news` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '标题',
  `content` text COLLATE utf8mb4_unicode_ci COMMENT '内容',
  `author` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '作者',
  `time` datetime DEFAULT NULL COMMENT '发布时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `news`
--

LOCK TABLES `news` WRITE;
/*!40000 ALTER TABLE `news` DISABLE KEYS */;
INSERT INTO `news` VALUES (13,'古诗赏析','<p><a href=\"https://www.zhihu.com/search?q=%E4%BA%BA%E7%94%9F%E8%8B%A5%E5%8F%AA%E5%A6%82%E5%88%9D%E8%A7%81%EF%BC%8C%E4%BD%95%E4%BA%8B%E7%A7%8B%E9%A3%8E%E6%82%B2%E7%94%BB%E6%89%87&amp;search_source=Entity&amp;hybrid_search_source=Entity&amp;hybrid_search_extra=%7B%22sourceType%22%3A%22answer%22%2C%22sourceId%22%3A60639803%7D\" target=\"_blank\">人生若只如初见，何事秋风悲画扇<path></path></a></p><p>第一句直译应当为：”人生如果能一直像初见那样“，</p><p>第二句直译应当为：”那秋风又会为怜悯画扇？“</p><p>其中画扇用化用了典故，百科百度中有：<br/></p><p><br/></p><p>此用汉<a href=\"https://link.zhihu.com/?target=http%3A//baike.baidu.com/view/34607.htm\" target=\"_blank\">班婕妤</a>被弃典故。班婕妤为<a href=\"https://link.zhihu.com/?target=http%3A//baike.baidu.com/view/53864.htm\" target=\"_blank\">汉成帝</a>妃，被<a href=\"https://link.zhihu.com/?target=http%3A//baike.baidu.com/view/29978.htm\" target=\"_blank\">赵飞燕</a>与<a href=\"https://link.zhihu.com/?target=http%3A//baike.baidu.com/view/94443.htm\" target=\"_blank\">赵合德</a>谗害，退居冷宫，后有诗《<a href=\"https://link.zhihu.com/?target=http%3A//baike.baidu.com/view/414698.htm\" target=\"_blank\">怨歌行</a>》，以秋扇为喻抒发被弃之怨情。南北朝梁<a href=\"https://link.zhihu.com/?target=http%3A//baike.baidu.com/view/211475.htm\" target=\"_blank\">刘孝绰</a>《<a href=\"https://link.zhihu.com/?target=http%3A//baike.baidu.com/view/11538727.htm\" target=\"_blank\">班婕妤怨</a>》诗又点明“妾身似秋扇”</p><p><br/></p><p>《怨歌行》一诗为：</p><p><br/></p><p>新制</p><p><a href=\"https://link.zhihu.com/?target=http%3A//baike.baidu.com/view/2554363.htm\" target=\"_blank\">齐纨素</a></p><p>，皎洁如霜雪。</p><p>裁作合欢扇，团圆似明月。</p><p><a href=\"https://www.zhihu.com/search?q=%E5%87%BA%E5%85%A5%E5%90%9B%E6%80%80%E8%A2%96&amp;search_source=Entity&amp;hybrid_search_source=Entity&amp;hybrid_search_extra=%7B%22sourceType%22%3A%22answer%22%2C%22sourceId%22%3A60639803%7D\" target=\"_blank\">出入君怀袖<path></path></a>，动摇微风发。</p><p>常恐秋节至，凉意夺炎热。</p><p>弃捐<a href=\"https://www.zhihu.com/search?q=%E7%AE%A7%E5%A5%81&amp;search_source=Entity&amp;hybrid_search_source=Entity&amp;hybrid_search_extra=%7B%22sourceType%22%3A%22answer%22%2C%22sourceId%22%3A60639803%7D\" target=\"_blank\">箧奁<path></path></a>中，恩情中道绝。</p><p>诗中第三句中”裁作合欢扇“中，班婕妤以合欢扇自喻，而第八，九句有”常恐秋节至，凉意夺炎热“，说的是合欢扇（<a href=\"https://www.zhihu.com/search?q=%E5%B8%B8%E5%A9%95%E5%A6%A4&amp;search_source=Entity&amp;hybrid_search_source=Entity&amp;hybrid_search_extra=%7B%22sourceType%22%3A%22answer%22%2C%22sourceId%22%3A60639803%7D\" target=\"_blank\">常婕妤<path></path></a>）常常害怕秋天的到来，因为秋天一到，天气变凉，<a href=\"https://www.zhihu.com/search?q=%E5%90%88%E6%AC%A2%E6%89%87&amp;search_source=Entity&amp;hybrid_search_source=Entity&amp;hybrid_search_extra=%7B%22sourceType%22%3A%22answer%22%2C%22sourceId%22%3A60639803%7D\" target=\"_blank\">合欢扇<path></path></a>自然无用而被搁置（即第九句中”弃捐箧奁中“）。</p><p>因此画扇也就被喻为被离弃之人。</p><p>了解了这些就能够知道：</p><p>人生若只如初见，何事秋风悲画扇</p><p>这两句词的动人之处，想像着在初夏时节，一团画扇常伴于君郎之侧，而秋节一至，则被弃于萧瑟秋风之中，连秋风也怜悯它的遭遇。而人又何尝不是，初见之时，如糖似蜜，如漆似膝，而时间一久，便渐渐地疲惫、疲乏，当初的爱恋之情也日渐消磨，一去不返。</p><p><b>读之充满无奈之情，令人伤感。</b></p>','chattest','2024-05-16 17:02:48'),(14,'AI工具','<h3>Copilot：<a href=\"https://copilot.microsoft.com/\" target=\"_blank\">https://copilot.microsoft.com/</a> 微软版的GPT内置GPT4模型，但内容限制也较多<br/><br/>POE：<a href=\"https://poe.com/\" target=\"_blank\">https://poe.com/</a> 一款聚合很多人工智能模型的聊天工具，但使用GPT4等模型需要付费<br/><br/>Bard：<a href=\"https://bard.google.com/\" target=\"_blank\">https://bard.google.com/</a> 谷歌开发的智能聊天机器人，目前集成了Gemini-Pro版模型<br/><br/>Claude：<a href=\"https://claude.ai/\" target=\"_blank\">https://claude.ai/</a> ChatGPT的有力竞争对手，但Claude 2只开放了美国和英国两个国家<br/><br/>Coze ：<a href=\"https://www.coze.com/\" target=\"_blank\">https://www.coze.com/</a> 字节跳动在海外推出的一个AI聊天机器人和应用开发平台<br/><br/>文心一言 ：百度研发的知识增强大语言模型，能够与人对话互动，回答问题，协助创作等<br/></h3>','123hh','2024-05-16 19:03:20');
/*!40000 ALTER TABLE `news` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permission`
--

DROP TABLE IF EXISTS `permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '名称',
  `path` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '资源路径',
  `comment` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
  `icon` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '图标',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permission`
--

LOCK TABLES `permission` WRITE;
/*!40000 ALTER TABLE `permission` DISABLE KEYS */;
INSERT INTO `permission` VALUES (1,'Home','/home','主页','el-icon-house'),(2,'News','/news','博客管理','el-icon-news'),(3,'Message','/message','在线留言','el-icon-message'),(4,'User','/user','用户管理','el-icon-user'),(5,'Role','/role','角色管理','el-icon-s-custom'),(6,'Person','/person','个人信息',''),(7,'Password','/password','修改密码',NULL),(8,'AI','/AI','AI创作','el-icon-edit');
/*!40000 ALTER TABLE `permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '名称',
  `comment` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (2,'user','普通用户'),(4,'VIP','高级用户'),(5,'SVIP','超级管理员');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_permission`
--

DROP TABLE IF EXISTS `role_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role_permission` (
  `role_id` int(11) NOT NULL COMMENT '角色id',
  `permission_id` int(11) NOT NULL COMMENT '资源id',
  PRIMARY KEY (`role_id`,`permission_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_permission`
--

LOCK TABLES `role_permission` WRITE;
/*!40000 ALTER TABLE `role_permission` DISABLE KEYS */;
INSERT INTO `role_permission` VALUES (1,1),(1,2),(1,3),(1,4),(1,5),(1,6),(1,7),(2,1),(2,3),(2,6),(2,7),(4,1),(4,2),(4,3),(4,6),(4,8),(5,1),(5,2),(5,3),(5,4),(5,5),(5,6),(5,7),(5,8);
/*!40000 ALTER TABLE `role_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `username` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户名',
  `password` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '密码',
  `nick_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '昵称',
  `age` int(11) DEFAULT NULL COMMENT '年龄',
  `sex` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '性别',
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '地址',
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '头像',
  `account` decimal(10,2) DEFAULT '0.00' COMMENT '账户余额',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='用户信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'admin','$2a$10$.cxJ637DYA1PRSzfPmBO0efS1W2eTQefS51b83Nr5xgRNAW0ffgjO','管理员',22,'男','火星','http://localhost:9090/files/c6cdb79a31b8437ebc0586ecaa80462a',100.00),(17,'123','$2a$10$QQdAViM0EqsODs7kuCmPM.tSG1cOA2oUbNCoXnrOs2joYwKD6SkeC','123hh',23,'男','地球','http://localhost:9090/files/5f077b2bbdfc49ef96e77a828939cce6',0.00),(18,'22233','$2a$10$8objwKBp70M3Sw3XFi0jnePF9NU7iHYEvS6pMNdWBv/GSFKpPrIQC','22233',33,'女','火星','http://localhost:9090/files/ed39c76cce894221a99d43dcfdaf0788',0.00),(19,'test','$2a$10$ZpInydhEoEns3oVj3VwHWeEmKXMMWdc0/bOfDVO3LJN7AY5MZuMjy','test',12,'男','地球',NULL,0.00),(22,'xuqiben','$2a$10$GwbyxgyJGfJ/NaldxkPjqOKrSAD.6dc.akyKcwOqnsDCvghl7EATa','xuqiben',123,'女','湖北省武汉市洪山区珞狮路122号','http://localhost:9090/files/eca10827fb3f40d290c162e510ec8509',320.00),(23,'chattest','$2a$10$t0D5rJABUoqoyujMUh8bDOVRUD5sE93JfRbMIDDpG7EcpCHVn1Tqm','chattest',22,'男','法国','http://localhost:9090/files/1140783959d448eeaf54f1d4b2b178e0',0.00);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_role`
--

DROP TABLE IF EXISTS `user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_role` (
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `role_id` int(11) NOT NULL COMMENT '角色id',
  PRIMARY KEY (`user_id`,`role_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_role`
--

LOCK TABLES `user_role` WRITE;
/*!40000 ALTER TABLE `user_role` DISABLE KEYS */;
INSERT INTO `user_role` VALUES (1,5),(17,4),(18,2),(19,2),(22,5),(23,5);
/*!40000 ALTER TABLE `user_role` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-05-28 19:11:55
