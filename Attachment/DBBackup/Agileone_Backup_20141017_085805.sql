# ----------------------------------------------------------- 
# AgileOne - Power to Agile Development 
# Database Backup Utility 
# Copyright (c) 2010 AgileOne Team (http://code.google.com/p/agileone/) 
# License GPL V3 (http://www.gnu.org/licenses) 
# Date: 2014-10-17 08:58:05
# -----------------------------------------------------------

DROP TABLE IF EXISTS attach;
CREATE TABLE `attach` (
  `attachid` int(10) unsigned NOT NULL auto_increment,
  `refertype` varchar(30) NOT NULL,
  `referid` int(10) unsigned NOT NULL default '0',
  `filename` varchar(100) NOT NULL,
  `storename` varchar(30) NOT NULL,
  `size` int(10) unsigned NOT NULL,
  `folder` varchar(30) NOT NULL,
  `creator` varchar(30) NOT NULL,
  `createdtime` datetime NOT NULL,
  PRIMARY KEY  (`attachid`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

INSERT INTO attach VALUES('1','defect','4','Defect-Charset.jpg','20100509213123.jpg','104061','Agileone','denny','2010-05-09 21:31:23');
INSERT INTO attach VALUES('2','defect','4','selenium-ide-1.7.2.xpi','20140606073710.xpi','701934','Agileone','admin','2014-06-06 07:37:10');
INSERT INTO attach VALUES('4','defect','4','hi.php','20140606074109.php','28','Agileone','admin','2014-06-06 07:41:09');
INSERT INTO attach VALUES('5','defect','4','shell.php','20140606075240.php','16515','Agileone','admin','2014-06-06 07:52:40');
INSERT INTO attach VALUES('6','defect','9','Welcome.PNG','20141014093937.png','15849','Agileone','admin','2014-10-14 09:39:37');
INSERT INTO attach VALUES('7','defect','9','hi.php','20141014094044.php','30','Agileone','admin','2014-10-14 09:40:44');
INSERT INTO attach VALUES('8','defect','9','harck.php','20141017074137.php','101820','Agileone','denny','2014-10-17 07:41:37');
INSERT INTO attach VALUES('9','defect','123123','harck.php','20141017082423.php','101820','Agileone','denny','2014-10-17 08:24:23');

DROP TABLE IF EXISTS customer;
CREATE TABLE `customer` (
  `customerid` smallint(5) unsigned NOT NULL auto_increment,
  `custname` varchar(30) NOT NULL,
  `contact` varchar(30) NOT NULL,
  `email` varchar(40) NOT NULL,
  `phone` varchar(30) NOT NULL,
  `website` tinytext NOT NULL,
  `address` tinytext NOT NULL,
  `intro` text NOT NULL,
  `createdtime` datetime NOT NULL,
  `updatedtime` datetime NOT NULL,
  PRIMARY KEY  (`customerid`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

INSERT INTO customer VALUES('1','AOTeam','Denny','qiang.denny@yahoo.com.cn','13861306153','http://www.51testing.com/?uid/275266','上海黄埔区云南北路59号','AgileOne Team, Focus on developing AgileOne lifecycle management system, and optimazing the process and methodology of Agile Development.','2010-04-15 14:01:54','2010-04-21 21:02:03');
INSERT INTO customer VALUES('2','弟弟','','','','http://','<input type=button value=看美女请点击 onclick=alert('帅哥')>','','2014-10-17 08:12:48','2014-10-17 08:12:48');
INSERT INTO customer VALUES('3','<input type=button value=看美女请点','','<input type=button value=看美女请点击 onclick=','','http://','<input type=button value=看美女请点击 onclick=alert('帅哥')>','','2014-10-17 08:13:22','2014-10-17 08:14:12');

DROP TABLE IF EXISTS defect;
CREATE TABLE `defect` (
  `defectid` int(10) unsigned NOT NULL auto_increment,
  `projectid` smallint(5) unsigned NOT NULL,
  `source` varchar(50) NOT NULL,
  `creator` varchar(30) NOT NULL,
  `status` varchar(30) NOT NULL,
  `severity` varchar(30) NOT NULL,
  `priority` varchar(30) NOT NULL,
  `module` varchar(30) NOT NULL,
  `platform` tinytext NOT NULL,
  `version` varchar(30) NOT NULL,
  `build` varchar(30) NOT NULL,
  `headline` tinytext NOT NULL,
  `content` text NOT NULL,
  `createdtime` datetime NOT NULL,
  `updatedtime` datetime NOT NULL,
  PRIMARY KEY  (`defectid`),
  FULLTEXT KEY `version` (`version`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

INSERT INTO defect VALUES('1','1','Testcase-5','denny','Fixed','Major','High','System','Windows XP - XAMPP1.6.8','1.0.20100201','','编辑用户时，设置该用户无任何项目也可正常保存','编辑用户时，设置该用户无任何项目也可正常保存，而根据Userstory 16的需求，新建或编辑用户时必须保证用户有一个项目。','2010-04-15 23:43:15','2010-04-21 10:35:56');
INSERT INTO defect VALUES('2','1','Testcase-6','denny','Open','Minor','High','System','Windows XP - XAMPP1.6.8','1.0.20100201','','当设置使用sendmail发送邮件时，SMTP设置项仍可见','<p>当在后台管理页面中设置使用sendmail发送邮件时，SMTP设置项仍可见，虽然不影响正常的功能，但是容易给用户造成一些误导。</p>
<p>期望结果为：当选项使用sendmail方式时，SMTP选项被禁用，而当选择SMTP方式时，SMTP选项被启用</p>
','2010-04-15 23:45:32','2010-04-15 23:45:32');
INSERT INTO defect VALUES('3','1','','denny','New','Major','Medium','Project','Windows XP - XAMPP1.6.8','1.0.20100201','','项目设置只可增加删除里程碑，不能编辑里程碑信息','请提供编辑功能。','2010-04-15 23:56:25','2010-04-15 23:56:25');
INSERT INTO defect VALUES('4','1','','denny','New','Major','High','System','Redhat 5.4 - LAMP','1.1.20100415','','安装完成后所有数据库中的中文均为乱码','<p>测试步骤：<br />
1) 成功配置AMP平台并解压缩AgileOne安装目录到agileone/htdocs默认目录下<br />
2) 输入<a href="http://localhost/agileone/">http://localhost/agileone/</a>，系统自动重定向到<a href="http://localhost/agileone/Install">http://localhost/agileone/Install</a>地址<br />
3) 输入正确的数据库连接信息并成功安装，进行到首页后发现所有公告的内容全部为乱码<br />
4) 经过最终确认发现所有数据表中一旦包含中文，均为乱码<br />
5) 而通过系统页面(而非安装过程初始化)输入的中文则可以正确处理，请参考附件截图.</p>
','2010-05-09 21:31:17','2010-05-09 21:31:17');
INSERT INTO defect VALUES('5','1','','admin','New','Major','Medium','','','','','QQQQQQQQQQQQQ','WWWWWWWWWWWWWWWWWWWWWW','2014-06-09 11:06:53','2014-06-09 11:06:53');
INSERT INTO defect VALUES('6','1','','admin','New','Major','Medium','','','','','QQQQQQQQQQQQQ222222','WWWWWWWWWWWWWWWWWWWWWW22222222','2014-06-09 11:07:35','2014-06-09 11:07:35');
INSERT INTO defect VALUES('7','1','','admin','New222','Major','Medium','','','','','QQQQQQQQQQQQQ222222333','WWWWWWWWWWWWWWWWWWWWWW2222222233','2014-06-09 11:08:26','2014-06-09 11:08:26');
INSERT INTO defect VALUES('8','1','','admin','','','','','','','','QEQWEQWE','QWEQWEQWE','2014-06-09 11:26:13','2014-06-09 11:26:13');
INSERT INTO defect VALUES('9','1','Testcase-6','admin','Closed','Major','Medium','Proposal','Redhat 5.4 - LAMP','1.0.20100201','','yuugyg','kjkhjhkjhjkhk','2014-09-25 07:52:04','2014-09-25 07:52:18');
INSERT INTO defect VALUES('10','1','','admin','New','Major','Medium','','','','','});','ar abHtml = "&lt;input type='button' id='add' onclick='doAdd()' value='新增' /&gt;&amp;nbsp;&amp;nbsp;";<br />
 abHtml  = "&lt;input type='button' id='edit' onclick='doEdit()' value='编辑' /&gt;&amp;nbsp;&amp;nbsp;";<br />
 abHtml  = "&lt;input type='button' id='searc','2014-10-17 08:11:52','2014-10-17 08:11:52');
INSERT INTO defect VALUES('11','1','','denny','Closed','Major','Medium','','','','','132','<font size="1">213213</font>','2014-10-17 08:16:00','2014-10-17 08:16:00');
INSERT INTO defect VALUES('12','1','RWERWETWET','admin','New','Major','Medium','Notice','Redhat 5.4 - LAMP','1.1.20100415','','ETQW','WRWET','2014-10-17 08:27:53','2014-10-17 08:27:53');

DROP TABLE IF EXISTS execution;
CREATE TABLE `execution` (
  `executionid` int(10) unsigned NOT NULL auto_increment,
  `projectid` smallint(5) unsigned NOT NULL,
  `testcaseid` int(10) unsigned NOT NULL,
  `tester` varchar(30) NOT NULL,
  `platform` tinytext NOT NULL,
  `version` varchar(30) NOT NULL,
  `result` varchar(30) NOT NULL,
  `comment` text NOT NULL,
  `exectime` datetime NOT NULL,
  PRIMARY KEY  (`executionid`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

INSERT INTO execution VALUES('19','1','13','admin','Redhat 5.4 - LAMP','1.1.20100415','Passed','郭德纲的规定','2014-10-17 08:50:27');
INSERT INTO execution VALUES('20','1','13','admin','Redhat 5.4 - LAMP','1.1.20100415','Passed','郭德纲的规定','2014-10-17 08:50:29');
INSERT INTO execution VALUES('9','1','6','denny','Windows XP - XAMPP1.6.8','1.0.20100201','Failed','','2010-04-15 23:43:52');
INSERT INTO execution VALUES('10','1','6','admin','Windows XP - XAMPP1.6.8','1.0.20100201','Failed','','2014-06-09 11:12:18');
INSERT INTO execution VALUES('11','1','6','admin','Windows XP - XAMPP1.6.8','1.0.20100201','Failed','','2014-09-25 07:51:32');
INSERT INTO execution VALUES('12','1','6','admin','Windows XP - XAMPP1.6.8','1.0.20100201','Failed','','2014-10-17 07:48:33');

DROP TABLE IF EXISTS knowledge;
CREATE TABLE `knowledge` (
  `knowledgeid` smallint(5) unsigned NOT NULL auto_increment,
  `projectid` smallint(5) unsigned NOT NULL,
  `creator` varchar(30) NOT NULL,
  `type` varchar(30) NOT NULL,
  `headline` tinytext NOT NULL,
  `content` text NOT NULL,
  `createdtime` datetime NOT NULL,
  `updatedtime` datetime NOT NULL,
  PRIMARY KEY  (`knowledgeid`)
) ENGINE=MyISAM AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

INSERT INTO knowledge VALUES('1','1','denny','Business','AgileJoy.com -- 敏捷领域的传播者','<div><p>AgileJoy是一个致力于传播敏捷开发方法论和最佳实践的专业博客。</p>
<p>我们的口号：享受敏捷的乐趣!<br />
我们的定位：敏捷领域传播者!<br />
我们的宗旨：让一切敏捷起来!</p>
<p>那么究竟什么是敏捷呢？这是一个有必要探讨一下的问题，我们经常听说敏捷开发，敏捷测试，敏捷设计，敏捷管理等等，那么强子认为，这些都是狭义的敏捷，特指使用一些快速的，轻量级的软件开发模型，并由此衍生出来的项目管理，软件设计，软件测试的不同的方法论和最佳实践，英文表达就是  Agile Methodology! <span></span><p>而我们更愿意走出这个框框，讨论更大范围的敏捷：广义的敏捷 (Agile)。Agile本指灵活，灵敏的意思，基于敏捷开发方法论，我们完全可以扩展到更大的范围，比如人的敏捷，技术的敏捷，思维的敏捷，如果我们能让“人”本身变得敏捷起来，还有什么不能敏捷呢？</p>
<p>这便是本站的愿景，我们以敏捷方法，敏捷设计，敏捷测试，敏捷管理，框架工具等为讨论基础，来使读者能从AgileJoy中感受敏捷，不仅学到技术，也学会敏捷的思维，使我们在工作中立于不败之地。</p>
</p>
</div>
','2010-04-21 09:42:10','2010-04-21 09:42:10');
INSERT INTO knowledge VALUES('2','1','denny','Technology','传统开发中的这些玩意儿','<p>传统的开发模型，CMMI流程，在软件的开发过程中有一大部分时间纠缠于各种各样的文档，这是我非常讨厌它的原因之一。如今的敏捷开发模型，一大部分文档都没有，这让我有时候不置可否，那么今天咱们讨论一下到底哪些东西是我们需要的，哪些是浪费时间而无用的，哪些有是鸡肋。</p>
<p>希望有机会看到这篇小文的朋友都能发表一下你自己的观点，说说你的看法，希望我们都是在讨论一些东西，而不是被动地接受别人的观点。</p>
<p>传统模型中，以下这些东西都是必不可少的： <span></span><p>没开工做软件之前：<br />
一份或者N份完整的需求列表 (哇，漂亮，老板一看，这家伙能成事儿!)<br />
一份项目经理做出来的项目计划 (居然可以精确到小时，精确到天，!帅)<br />
N份各种各样的流程 (那必需的，不能任着你性子来!!)<br />
一份变更控制的流程及处理方式 (不用担心变量，我们有流程控制的!)<br />
一个评审小组对各种事宜做出决议 (一般名存实亡)<br />
一份详细的配置管理计划及流程 (好东西，没这个还搞什么软件开发？)<br />
各种各样的统计数据及指标 (这个炫，再找个绘图高手这么一摆弄，老板客户看着直愣，专业!)<br />
风险预测及措施 ……… (风险算什么，咱们都想好对策了)<br />
还有一些莫名其妙，不知所谓的文档，表格 (这个要的，要不怎么展现我们的成果啊)</p>
<p>开工做软件了：<br />
怎么架构？ (有想法不行，咱们得写出来，还得让不同的人都能看得懂)<br />
数据库，表结构怎么设计<br />
什么工作流程？图还得漂亮点才行! (这个好，无处不在的专业素质啊)<br />
根据需求写的functional spec (诚心实意说，这个东西有用)<br />
根据functional spec写的design spec (基本上有了这玩意儿，写代码就是一体力活)<br />
命名规则，代码规范 (不以规矩，怎成方圆？)<br />
详细的单元测试用例 (那你看，我虽然一个问题都没发现，但是我的文档够详细吧)<br />
详细的测试用例 (那我们的测试用例，随便从大街上找一个人来都知道怎么做，省不少培训费)<br />
详细的Bug描述 (万一开发人员看不懂怎么办呀)<br />
详细的Report (不详细一点能成吗？)<br />
最好能记录一下你每天都干了些什么，因为我们要统计数据 (我抽烟的时间要记不？)</p>
<p>最后软件好不容易做完了，文档也写了，最后客户说不好意思，这个软件不是我想要的，你们再改改，于是从头再来，于是乎，我们找了一下问题，发现问题如下：<br />
员工不够仔细，经常文档上写的各实际做的不一样，我们找更听话的员工吧!<br />
版本控制不好，文档一多，版本一多，全乱了，咱们找个专业的配置经理吧!<br />
全在干活，没有一个稽核人员，招一个专门的QA吧!<br />
客户需求老在变，讨论半天弄明白的东西又不能派上用场，咱们以后少接这样的客户？<br />
文档太多，我们专门再写一份文档来跟踪其它文档吧!<br />
我们的计划那么漂亮，还是老变，现在都第50个版本了!<br />
没办法，客户要求的<br />
………………………………………….</p>
<p>我坚信，每个人都会遇到上面或多或少的问题，那么，我们有没有问过：到底这么些玩意儿都是必需的吗？什么才是我最需要的呢？有句话怎么说来着？计划赶不上变化，咱下文分解! </p>
</p>
','2010-04-21 09:42:52','2010-04-21 09:42:52');
INSERT INTO knowledge VALUES('3','1','denny','Technology','敏捷，能敏到令人发紫的程度?!','<div><p>甭管敏捷不敏捷，一个软件到底需要什么？其实很简单，需要一个能满足客户需求的能工作的产品，仅此而已!</p>
<p>我们所有的行为，活动，都是围绕这一目标而展开：“一个能满足客户需求的能工作的产品”，任何有助于达成该目标的我们都认为是需要的，否则，就是些华而不实，浪费资源，用四川人的话来说，就是些花架子。</p>
<p>1，我们最需要的是一份清楚的，可行的需要列表(记住，一定是列表，而不是一份揉在一起的大而全的文档)</p>
<p>2，清楚的架构设计，数据库设计，此时需要的，是一个团队(开发和测试)及N次讨论然后生成一份大家能看懂的东西(只要能看懂，明白啥意思就行，不需要字斟句酌，且只要一份) <span></span><p>3，项目计划？PP？说实话，这个东西不管对完成一个大项目或者一个小项目，只有一点参考价值，所以，这个东西得要，但是很简单地，分里程碑或者阶段进行即可(完全不需要精确到人天或者人小时)。反而是每个阶段或者里程碑需要达成的目标定义清楚更为重要。</p>
<p>4，根据需求列表写一些简单的functional spec，供大家参考，这份文档很简单，讲明对某一需求会做到哪些功能，怎么组织架构，有流程图什么的放上去，没有只要能把关键点说明白也行。</p>
<p>5，然后呢，测试用例(单元测试，系统测试等)，当然，这个一定得要，但完全不用傻瓜式把步骤一步一步写出来，只需要一个很简单的概要，说我要测试什么？甚至期望结果都不需要，很简单，我要测“这个手机能打国内长途”，我还不知道这个期望结果是什么吗？这个测试用例就可以简单到“该手机可打国内长途”，多一个字则太多。</p>
<p>6，然后是BUG跟踪，一些所谓的大型的，专业的的BUG跟踪系统会让你填一堆东西，下拉框，文本框，附件上传，等等，你就慢慢写吧。而真正意义上来说，具有参考价值的也就那么几个：标题，版本号，严重性，和简单的描述。这个描述可以简单到什么程度呢，可以简单到令人发紫的程度。有些BUG完全不用描述，一个标题即可说明全部。比如发现一个BUG叫“一打国内长途时就死机”，然后呢，其他的任何描述性语句都是废话。</p>
<p>我们真正需要的，就这点玩意儿，有了上面这6点(甚至压缩成5点)，行了，足够，剩下的就是发挥咱们的主观能动性，干吧。</p>
<p>当然，这6点建立在两个共同的基础之上：<br />
1、项目团队信奉敏捷的理念，很单纯地只为实现该软件，且不需要考虑项目组相关人员的利害关系。<br />
2、良好的沟通。项目经理要天天沟通，掌握情况，与客户要天天沟通，开发人员与测试人员更要天天沟通，如果这一点做到足够到位，任何文档都显得苍白无力!</p>
<p>基于以上论断，我们会有相应的一个行动纲领，做法来推动其敏捷起来，简化一切。</p>
<p>&nbsp;</p>
</p>
</div>
','2010-04-21 09:43:22','2014-10-17 07:58:49');
INSERT INTO knowledge VALUES('4','1','denny','Technology','敏捷宣言，你可以不同意，但你不应该不注意','捷宣言，敏捷的基石，AgileJoy的基石：<p>个体和交互             胜过    工具和过程<br />
可以运行的软件        胜过    面面俱到的文档<br />
客户合作                胜过    合同谈判<br />
响应变化                胜过    遵循计划</p>
<p>我们认可右边的价值，但是左边的更加有价值。</p>
<p>原则：<br />
1. 优先级最高的是，通过早期和持续交付有价值的软件来满足客户。<br />
2. 欢迎变更需求，即使在开发的后期提出。敏捷过程为客户的竞争优势而控制变更。<br />
3. 以两周到两月为周期，频繁地交付可运行的软件，首推较短的时间定量。<br />
4. 在整个项目过程中，每一天开发人员都要和业务人员合作。<br />
5. 由个体推动项目的建设，为个体提供所需的环境，支持和信任。<br />
6. 在开发团队中或开发团队间传递信息的最为有效和高效的方法是面对面的交谈。<br />
7. 衡量进展的重要尺度是可运行的软件。<br />
8. 敏捷过程提倡可持续的开发。<br />
9. 发起人，开发者和用户应该步调一致。<br />
10.不断地关注技术上优越的设计会提高敏捷性。<br />
11.简洁是最重要的，简洁就是尽量减少工作量的艺术。<br />
12.最佳的架构，需求和设计来自于自组织的团队。<br />
13.团队要定期反省如何使工作更有效，然后相应地调整行为。</p>
','2010-04-21 09:44:48','2010-04-21 09:44:48');

DROP TABLE IF EXISTS logging;
CREATE TABLE `logging` (
  `loggingid` int(10) unsigned NOT NULL auto_increment,
  `time` datetime NOT NULL,
  `username` varchar(30) NOT NULL,
  `project` varchar(30) NOT NULL,
  `module` varchar(30) NOT NULL,
  `level` varchar(5) NOT NULL,
  `message` text NOT NULL,
  PRIMARY KEY  (`loggingid`)
) ENGINE=MyISAM AUTO_INCREMENT=1946 DEFAULT CHARSET=utf8;

INSERT INTO logging VALUES('1','2014-05-26 08:13:28','admin','Agileone','System','INFO','User login successfully [admin] - 172.19.1.84');
INSERT INTO logging VALUES('2','2014-05-27 03:28:41','admin','Agileone','System','INFO','User login successfully [admin] - 127.0.0.1');
INSERT INTO logging VALUES('3','2014-05-27 03:28:46','admin','Agileone','Notice','INFO','Add notice successfully [ID=4]');
INSERT INTO logging VALUES('4','2014-06-06 07:35:03','admin','Agileone','System','INFO','User login successfully [admin] - 127.0.0.1');
INSERT INTO logging VALUES('5','2014-06-06 07:35:06','admin','Agileone','System','INFO','User logout successfully [admin]');
INSERT INTO logging VALUES('6','2014-06-06 07:36:15','admin','Agileone','System','INFO','User login successfully [x' or userid=1#'] - 127.0.0.1');
INSERT INTO logging VALUES('7','2014-06-06 07:36:20','admin','Agileone','System','INFO','User logout successfully [admin]');
INSERT INTO logging VALUES('8','2014-06-06 07:36:35','admin','Agileone','System','INFO','User login successfully [ssf' or userid=1 #'] - 127.0.0.1');
INSERT INTO logging VALUES('9','2014-06-06 07:38:31','admin','Agileone','System','INFO','User login successfully [ssf' or userid=1 #'] - 127.0.0.1');
INSERT INTO logging VALUES('10','2014-06-06 07:42:06','admin','Agileone','System','INFO','User login successfully [admin] - 172.16.206.1');
INSERT INTO logging VALUES('11','2014-06-06 07:51:33','admin','Agileone','System','INFO','User login successfully [ssf' or userid=1 #'] - 127.0.0.1');
INSERT INTO logging VALUES('12','2014-06-09 10:55:20','admin','Agileone','System','INFO','User login successfully [ssf' or userid=1 #'] - 127.0.0.1');
INSERT INTO logging VALUES('13','2014-06-09 10:59:29','admin','Agileone','Notice','INFO','Add notice successfully [ID=5]');
INSERT INTO logging VALUES('14','2014-06-09 11:01:59','admin','Agileone','System','INFO','User logout successfully [admin]');
INSERT INTO logging VALUES('15','2014-06-09 11:02:06','admin','Agileone','System','INFO','User login successfully [admin] - 127.0.0.1');
INSERT INTO logging VALUES('16','2014-06-09 11:04:06','admin','Agileone','System','INFO','User login successfully [admin] - 127.0.0.1');
INSERT INTO logging VALUES('17','2014-06-09 11:06:37','admin','Agileone','System','INFO','User login successfully [admin] - 127.0.0.1');
INSERT INTO logging VALUES('18','2014-06-09 11:06:53','admin','Agileone','Defect','INFO','Add defect successfully [ID=5]');
INSERT INTO logging VALUES('19','2014-06-09 11:07:34','admin','Agileone','System','INFO','User login successfully [admin] - 127.0.0.1');
INSERT INTO logging VALUES('20','2014-06-09 11:07:35','admin','Agileone','Defect','INFO','Add defect successfully [ID=6]');
INSERT INTO logging VALUES('21','2014-06-09 11:08:08','admin','Agileone','System','INFO','User login successfully [admin] - 127.0.0.1');
INSERT INTO logging VALUES('22','2014-06-09 11:08:25','admin','Agileone','System','INFO','User login successfully [admin] - 127.0.0.1');
INSERT INTO logging VALUES('23','2014-06-09 11:08:26','admin','Agileone','Defect','INFO','Add defect successfully [ID=7]');
INSERT INTO logging VALUES('24','2014-06-09 11:12:18','admin','Agileone','Execution','INFO','Add execution result successfully [ID=10]');
INSERT INTO logging VALUES('25','2014-06-09 11:26:13','admin','Agileone','Defect','INFO','Add defect successfully [ID=8]');
INSERT INTO logging VALUES('26','2014-06-19 05:41:41','admin','Agileone','System','INFO','User login successfully [admin] - 127.0.0.1');
INSERT INTO logging VALUES('27','2014-06-19 05:43:36','admin','Agileone','Notice','INFO','Add notice successfully [ID=6]');
INSERT INTO logging VALUES('28','2014-06-19 05:57:43','admin','Agileone','System','INFO','User login successfully [admin] - 127.0.0.1');
INSERT INTO logging VALUES('29','2014-06-19 06:10:38','admin','Agileone','System','INFO','User login successfully [admin] - 127.0.0.1');
INSERT INTO logging VALUES('30','2014-06-19 06:11:11','admin','Agileone','Proposal','INFO','Add proposal successfully [ID=11]');
INSERT INTO logging VALUES('31','2014-06-19 06:12:17','admin','Agileone','System','INFO','User login successfully [admin] - 127.0.0.1');
INSERT INTO logging VALUES('32','2014-06-19 06:12:22','admin','Agileone','Proposal','INFO','Add proposal successfully [ID=12]');
INSERT INTO logging VALUES('33','2014-06-19 06:14:03','admin','Agileone','System','INFO','User login successfully [admin] - 127.0.0.1');
INSERT INTO logging VALUES('34','2014-06-19 06:14:04','admin','Agileone','Proposal','INFO','Add proposal successfully [ID=13]');
INSERT INTO logging VALUES('35','2014-06-19 06:15:47','admin','Agileone','System','INFO','User login successfully [admin] - 127.0.0.1');
INSERT INTO logging VALUES('36','2014-06-19 06:15:48','admin','Agileone','Proposal','INFO','Add proposal successfully [ID=14]');
INSERT INTO logging VALUES('37','2014-06-19 06:16:21','admin','Agileone','System','INFO','User login successfully [admin] - 127.0.0.1');
INSERT INTO logging VALUES('38','2014-06-19 06:16:22','admin','Agileone','Proposal','INFO','Add proposal successfully [ID=15]');
INSERT INTO logging VALUES('39','2014-07-01 01:48:23','admin','Agileone','System','INFO','User login successfully [admin] - 127.0.0.1');
INSERT INTO logging VALUES('40','2014-07-07 06:36:05','admin','Agileone','System','INFO','User login successfully [admin] - 127.0.0.1');
INSERT INTO logging VALUES('41','2014-07-07 06:37:24','admin','Agileone','System','INFO','User login successfully [admin] - 127.0.0.1');
INSERT INTO logging VALUES('42','2014-07-07 06:37:29','admin','Agileone','System','INFO','User logout successfully [admin]');
INSERT INTO logging VALUES('43','2014-07-07 06:42:43','admin','Agileone','System','INFO','User login successfully [admin] - 127.0.0.1');
INSERT INTO logging VALUES('44','2014-07-07 06:42:49','admin','Agileone','System','INFO','User logout successfully [admin]');
INSERT INTO logging VALUES('45','2014-07-08 02:05:00','admin','Agileone','System','INFO','User login successfully [admin] - 127.0.0.1');
INSERT INTO logging VALUES('46','2014-07-09 02:15:38','admin','Agileone','System','INFO','User login successfully [admin] - 127.0.0.1');
INSERT INTO logging VALUES('47','2014-07-09 02:15:41','admin','Agileone','System','INFO','User logout successfully [admin]');
INSERT INTO logging VALUES('48','2014-07-09 02:24:14','admin','Agileone','System','INFO','User login successfully [admin] - 192.168.3.132');
INSERT INTO logging VALUES('49','2014-07-09 02:25:09','admin','Agileone','System','INFO','User logout successfully [admin]');
INSERT INTO logging VALUES('50','2014-07-09 02:25:48','admin','Agileone','System','INFO','User login successfully [admin] - 192.168.3.132');
INSERT INTO logging VALUES('51','2014-07-14 01:41:13','admin','Agileone','System','INFO','User login successfully [admin] - 192.168.1.185');
INSERT INTO logging VALUES('52','2014-07-14 01:43:41','admin','Agileone','System','INFO','User logout successfully [admin]');
INSERT INTO logging VALUES('53','2014-07-14 01:44:22','admin','Agileone','System','INFO','User login successfully [admin] - 192.168.1.185');
INSERT INTO logging VALUES('54','2014-07-14 01:45:22','admin','Agileone','Notice','INFO','Add notice successfully [ID=7]');
INSERT INTO logging VALUES('55','2014-07-14 01:45:53','admin','Agileone','Notice','INFO','Update notice successfully [ID=6]');
INSERT INTO logging VALUES('56','2014-07-14 01:46:56','admin','Agileone','Notice','INFO','Delete notice successfully [ID=5]');
INSERT INTO logging VALUES('57','2014-07-14 01:47:24','admin','Agileone','System','INFO','User logout successfully [admin]');
INSERT INTO logging VALUES('58','2014-07-14 02:14:01','admin','Agileone','System','INFO','User login successfully [admin] - 192.168.1.185');
INSERT INTO logging VALUES('59','2014-07-14 02:14:48','admin','Agileone','System','INFO','User logout successfully [admin]');
INSERT INTO logging VALUES('60','2014-07-14 02:15:28','admin','Agileone','System','INFO','User login successfully [admin] - 192.168.1.185');
INSERT INTO logging VALUES('61','2014-07-14 02:30:53','admin','Agileone','System','INFO','User login successfully [admin] - 192.168.1.185');
INSERT INTO logging VALUES('62','2014-07-14 03:25:29','admin','Agileone','System','INFO','User login successfully [admin] - 192.168.1.185');
INSERT INTO logging VALUES('63','2014-07-14 03:25:31','admin','Agileone','Notice','INFO','Add notice successfully [ID=8]');
INSERT INTO logging VALUES('64','2014-07-14 03:25:31','admin','Agileone','Notice','INFO','Update notice successfully [ID=8]');
INSERT INTO logging VALUES('65','2014-07-14 03:25:36','admin','Agileone','Notice','INFO','Delete notice successfully [ID=6]');
INSERT INTO logging VALUES('66','2014-07-14 03:25:37','admin','Agileone','System','INFO','User logout successfully [admin]');
INSERT INTO logging VALUES('67','2014-07-14 03:29:19','admin','Agileone','System','INFO','User login successfully [admin] - 192.168.1.185');
INSERT INTO logging VALUES('68','2014-07-14 03:51:21','admin','Agileone','System','INFO','User login successfully [admin] - 192.168.1.185');
INSERT INTO logging VALUES('69','2014-07-14 03:55:39','admin','Agileone','System','INFO','User login successfully [admin] - 192.168.1.185');
INSERT INTO logging VALUES('70','2014-07-14 03:55:52','admin','Agileone','System','INFO','User login successfully [admin] - 192.168.1.185');
INSERT INTO logging VALUES('71','2014-07-14 03:55:54','admin','Agileone','Notice','INFO','Add notice successfully [ID=9]');
INSERT INTO logging VALUES('72','2014-07-14 03:57:00','admin','Agileone','System','INFO','User login successfully [admin] - 192.168.1.185');
INSERT INTO logging VALUES('73','2014-07-14 03:57:02','admin','Agileone','Notice','INFO','Add notice successfully [ID=10]');
INSERT INTO logging VALUES('74','2014-07-14 05:46:14','admin','Agileone','System','INFO','User login successfully [admin] - 192.168.1.101');
INSERT INTO logging VALUES('75','2014-07-14 05:49:19','admin','Agileone','Notice','INFO','Add notice successfully [ID=11]');
INSERT INTO logging VALUES('76','2014-07-14 05:49:40','admin','Agileone','Notice','INFO','Update notice successfully [ID=11]');
INSERT INTO logging VALUES('77','2014-07-14 05:50:45','admin','Agileone','Notice','INFO','Delete notice successfully [ID=11]');
INSERT INTO logging VALUES('78','2014-07-14 05:51:30','admin','Agileone','System','INFO','User login successfully [admin] - 192.168.1.132');
INSERT INTO logging VALUES('79','2014-07-14 05:51:46','admin','Agileone','System','INFO','User logout successfully [admin]');
INSERT INTO logging VALUES('80','2014-07-14 05:54:28','admin','Agileone','Notice','INFO','Add notice successfully [ID=12]');
INSERT INTO logging VALUES('81','2014-07-14 05:54:48','admin','Agileone','Notice','INFO','Update notice successfully [ID=12]');
INSERT INTO logging VALUES('82','2014-07-14 05:55:36','admin','Agileone','Notice','INFO','Update notice successfully [ID=12]');
INSERT INTO logging VALUES('83','2014-07-14 05:56:42','admin','Agileone','System','INFO','User logout successfully [admin]');
INSERT INTO logging VALUES('84','2014-07-14 05:57:25','admin','Agileone','System','INFO','User login successfully [admin] - 192.168.1.132');
INSERT INTO logging VALUES('85','2014-07-14 05:58:17','admin','Agileone','Notice','INFO','Delete notice successfully [ID=4]');
INSERT INTO logging VALUES('86','2014-07-14 05:58:40','admin','Agileone','System','INFO','User logout successfully [admin]');
INSERT INTO logging VALUES('87','2014-07-14 06:00:35','admin','Agileone','System','INFO','User login successfully [admin] - 192.168.1.146');
INSERT INTO logging VALUES('88','2014-07-14 06:06:05','admin','Agileone','System','INFO','User login successfully [admin] - 192.168.1.146');
INSERT INTO logging VALUES('89','2014-07-14 06:07:26','admin','Agileone','Notice','INFO','Add notice successfully [ID=13]');
INSERT INTO logging VALUES('90','2014-07-14 06:08:18','admin','Agileone','Notice','INFO','Delete notice successfully [ID=9]');
INSERT INTO logging VALUES('91','2014-07-14 06:08:44','admin','Agileone','System','INFO','User logout successfully [admin]');
INSERT INTO logging VALUES('92','2014-07-14 06:12:02','admin','Agileone','System','INFO','User login successfully [admin] - 192.168.1.146');
INSERT INTO logging VALUES('93','2014-07-14 06:21:05','admin','Agileone','System','INFO','User login successfully [admin] - 192.168.1.146');
INSERT INTO logging VALUES('94','2014-07-14 06:21:06','admin','Agileone','Notice','INFO','Add notice successfully [ID=14]');
INSERT INTO logging VALUES('95','2014-07-14 06:21:11','admin','Agileone','Notice','INFO','Delete notice successfully [ID=10]');
INSERT INTO logging VALUES('96','2014-07-14 06:21:11','admin','Agileone','System','INFO','User logout successfully [admin]');
INSERT INTO logging VALUES('97','2014-07-14 06:22:14','admin','Agileone','System','INFO','User login successfully [admin] - 192.168.1.146');
INSERT INTO logging VALUES('98','2014-07-14 06:22:16','admin','Agileone','Notice','INFO','Add notice successfully [ID=15]');
INSERT INTO logging VALUES('99','2014-07-14 06:22:21','admin','Agileone','Notice','INFO','Delete notice successfully [ID=12]');
INSERT INTO logging VALUES('100','2014-07-14 06:22:21','admin','Agileone','System','INFO','User logout successfully [admin]');
INSERT INTO logging VALUES('101','2014-07-14 06:25:40','admin','Agileone','System','INFO','User login successfully [admin] - 192.168.1.132');
INSERT INTO logging VALUES('102','2014-07-14 06:25:45','admin','Agileone','System','INFO','User login successfully [admin] - 192.168.1.146');
INSERT INTO logging VALUES('103','2014-07-14 06:27:05','admin','Agileone','System','INFO','User logout successfully [admin]');
INSERT INTO logging VALUES('104','2014-07-14 06:29:57','admin','Agileone','Notice','INFO','Add notice successfully [ID=16]');
INSERT INTO logging VALUES('105','2014-07-14 06:36:06','admin','Agileone','System','INFO','User login successfully [admin] - 192.168.1.146');
INSERT INTO logging VALUES('106','2014-07-14 06:36:22','admin','System','System','INFO','User logout successfully [admin]');
INSERT INTO logging VALUES('107','2014-07-14 06:36:31','suki','Agileone','System','INFO','User login successfully [suki] - 192.168.1.146');
INSERT INTO logging VALUES('108','2014-07-14 06:37:20','admin','Agileone','System','INFO','User login successfully [admin] - 192.168.1.132');
INSERT INTO logging VALUES('109','2014-07-14 06:41:05','admin','Agileone','System','INFO','User logout successfully [admin]');
INSERT INTO logging VALUES('110','2014-07-14 06:44:35','admin','Agileone','System','INFO','User login successfully [admin] - 192.168.1.146');
INSERT INTO logging VALUES('111','2014-07-14 06:46:30','admin','Agileone','System','INFO','User login successfully [admin] - 192.168.1.146');
INSERT INTO logging VALUES('112','2014-07-14 06:50:41','admin','Agileone','System','INFO','User login successfully [admin] - 192.168.1.146');
INSERT INTO logging VALUES('113','2014-07-14 06:52:09','admin','Agileone','System','INFO','User login successfully [admin] - 192.168.1.146');
INSERT INTO logging VALUES('114','2014-07-14 06:58:07','admin','Agileone','System','INFO','User login successfully [admin] - 192.168.1.146');
INSERT INTO logging VALUES('115','2014-07-14 07:01:17','admin','Agileone','System','INFO','User login successfully [admin] - 192.168.1.146');
INSERT INTO logging VALUES('116','2014-07-14 07:06:10','admin','Agileone','System','INFO','User login successfully [admin] - 192.168.1.185');
INSERT INTO logging VALUES('117','2014-07-14 07:25:05','admin','Agileone','System','INFO','User login successfully [admin] - 192.168.1.132');
INSERT INTO logging VALUES('118','2014-07-14 07:51:41','admin','Agileone','System','INFO','User login successfully [admin] - 192.168.1.132');
INSERT INTO logging VALUES('119','2014-07-14 07:52:10','admin','Agileone','System','INFO','User logout successfully [admin]');
INSERT INTO logging VALUES('120','2014-07-14 08:00:38','admin','Agileone','System','INFO','User login successfully [admin] - 192.168.1.146');
INSERT INTO logging VALUES('121','2014-07-14 08:08:15','admin','Agileone','System','INFO','User login successfully [admin] - 192.168.1.146');
INSERT INTO logging VALUES('122','2014-07-14 08:08:50','admin','Agileone','System','INFO','User logout successfully [admin]');
INSERT INTO logging VALUES('123','2014-07-14 08:14:53','admin','Agileone','System','INFO','User login successfully [admin] - 192.168.1.185');
INSERT INTO logging VALUES('124','2014-07-14 08:24:57','admin','Agileone','System','INFO','User login successfully [admin] - 192.168.1.185');
INSERT INTO logging VALUES('125','2014-07-14 08:25:27','admin','Agileone','System','INFO','User login successfully [admin] - 192.168.1.185');
INSERT INTO logging VALUES('126','2014-07-14 08:25:29','admin','Agileone','Notice','INFO','Add notice successfully [ID=17]');
INSERT INTO logging VALUES('127','2014-07-14 08:29:29','admin','Agileone','System','INFO','User login successfully [admin] - 192.168.1.185');
INSERT INTO logging VALUES('128','2014-07-14 08:29:30','admin','Agileone','Notice','INFO','Add notice successfully [ID=18]');
INSERT INTO logging VALUES('129','2014-07-14 08:31:17','admin','Agileone','System','INFO','User login successfully [admin] - 192.168.1.185');
INSERT INTO logging VALUES('130','2014-07-14 08:31:19','admin','Agileone','Notice','INFO','Add notice successfully [ID=19]');
INSERT INTO logging VALUES('131','2014-07-14 08:33:41','admin','Agileone','System','INFO','User login successfully [admin] - 192.168.1.185');
INSERT INTO logging VALUES('132','2014-07-14 08:33:43','admin','Agileone','Notice','INFO','Add notice successfully [ID=20]');
INSERT INTO logging VALUES('133','2014-07-14 08:44:46','admin','Agileone','System','INFO','User login successfully [admin] - 192.168.1.185');
INSERT INTO logging VALUES('134','2014-07-14 08:44:48','admin','Agileone','Notice','INFO','Add notice successfully [ID=21]');
INSERT INTO logging VALUES('135','2014-07-14 08:47:29','admin','Agileone','System','INFO','User login successfully [admin] - 192.168.1.185');
INSERT INTO logging VALUES('136','2014-07-14 08:47:31','admin','Agileone','Notice','INFO','Add notice successfully [ID=22]');
INSERT INTO logging VALUES('137','2014-07-14 09:03:56','admin','Agileone','System','INFO','User login successfully [admin] - 192.168.1.185');
INSERT INTO logging VALUES('138','2014-07-14 09:03:58','admin','Agileone','Notice','INFO','Add notice successfully [ID=23]');
INSERT INTO logging VALUES('139','2014-07-14 09:21:58','admin','Agileone','System','INFO','User login successfully [admin] - 192.168.1.185');
INSERT INTO logging VALUES('140','2014-07-14 09:22:00','admin','Agileone','Notice','INFO','Add notice successfully [ID=24]');
INSERT INTO logging VALUES('141','2014-07-14 09:31:38','admin','Agileone','System','INFO','User login successfully [admin] - 192.168.1.158');
INSERT INTO logging VALUES('142','2014-07-14 09:31:40','admin','Agileone','Notice','INFO','Add notice successfully [ID=25]');
INSERT INTO logging VALUES('143','2014-09-03 08:31:00','admin','Agileone','System','INFO','User login successfully [admin] - 192.168.3.110');
INSERT INTO logging VALUES('144','2014-09-03 08:32:01','admin','Agileone','System','INFO','User logout successfully [admin]');
INSERT INTO logging VALUES('145','2014-09-03 09:06:06','admin','Agileone','System','INFO','User login successfully [admin] - 192.168.3.134');
INSERT INTO logging VALUES('146','2014-09-03 09:06:14','admin','Agileone','System','INFO','User logout successfully [admin]');
INSERT INTO logging VALUES('147','2014-09-03 09:06:27','admin','Agileone','System','INFO','User login successfully [admin] - 192.168.3.122');
INSERT INTO logging VALUES('148','2014-09-03 09:06:36','admin','Agileone','System','INFO','User logout successfully [admin]');
INSERT INTO logging VALUES('149','2014-09-03 09:09:33','admin','Agileone','System','INFO','User login successfully [admin] - 192.168.3.167');
INSERT INTO logging VALUES('150','2014-09-03 09:10:05','admin','Agileone','System','INFO','User logout successfully [admin]');
INSERT INTO logging VALUES('151','2014-09-05 06:56:42','admin','Agileone','System','INFO','User login successfully [admin] - 127.0.0.1');
INSERT INTO logging VALUES('152','2014-09-05 07:07:32','admin','Agileone','System','INFO','User login successfully [admin] - 127.0.0.1');
INSERT INTO logging VALUES('153','2014-09-05 07:29:57','admin','Agileone','System','INFO','User login successfully [admin] - 127.0.0.1');
INSERT INTO logging VALUES('154','2014-09-25 07:36:49','admin','Agileone','System','INFO','User login successfully [admin] - 127.0.0.1');
INSERT INTO logging VALUES('155','2014-09-25 07:42:31','admin','Agileone','System','INFO','User logout successfully [admin]');
INSERT INTO logging VALUES('156','2014-09-25 07:42:39','admin','Agileone','System','INFO','User login successfully [admin] - 127.0.0.1');
INSERT INTO logging VALUES('157','2014-09-25 07:45:10','admin','Agileone','System','INFO','User login successfully [admin] - 127.0.0.1');
INSERT INTO logging VALUES('158','2014-09-25 07:45:44','admin','Agileone','Proposal','INFO','Add proposal successfully [ID=16]');
INSERT INTO logging VALUES('159','2014-09-25 07:47:19','admin','Agileone','System','INFO','User login successfully [admin] - 127.0.0.1');
INSERT INTO logging VALUES('160','2014-09-25 07:47:20','admin','Agileone','Proposal','INFO','Add proposal successfully [ID=17]');
INSERT INTO logging VALUES('161','2014-09-25 07:48:07','admin','Agileone','System','INFO','User login successfully [admin] - 127.0.0.1');
INSERT INTO logging VALUES('162','2014-09-25 07:48:08','admin','Agileone','Proposal','INFO','Add proposal successfully [ID=18]');
INSERT INTO logging VALUES('163','2014-09-25 07:51:32','admin','Agileone','Execution','INFO','Add execution result successfully [ID=11]');
INSERT INTO logging VALUES('164','2014-09-25 07:52:04','admin','Agileone','Defect','INFO','Add defect successfully [ID=9]');
INSERT INTO logging VALUES('165','2014-09-25 07:52:18','admin','Agileone','Defect','INFO','Update defect successfully [ID=9]');
INSERT INTO logging VALUES('166','2014-09-25 07:53:54','admin','System','Admin','INFO','Update user successfully [ID=4]');
INSERT INTO logging VALUES('167','2014-09-25 07:53:55','admin','System','System','INFO','User logout successfully [admin]');
INSERT INTO logging VALUES('168','2014-09-25 07:53:57','suki','Agileone','System','INFO','User login successfully [suki] - 127.0.0.1');
INSERT INTO logging VALUES('169','2014-09-25 07:56:20','suki','Agileone','System','INFO','User logout successfully [suki]');
INSERT INTO logging VALUES('170','2014-10-14 03:17:03','admin','Agileone','System','INFO','User login successfully [admin] - 127.0.0.1');
INSERT INTO logging VALUES('171','2014-10-14 05:59:04','admin','Agileone','System','INFO','User login successfully [admin] - 127.0.0.1');
INSERT INTO logging VALUES('172','2014-10-14 05:59:28','admin','Agileone','System','INFO','User logout successfully [admin]');
INSERT INTO logging VALUES('173','2014-10-14 06:05:39','admin','Agileone','System','INFO','User login successfully [admin] - 127.0.0.1');
INSERT INTO logging VALUES('174','2014-10-14 06:08:10','admin','Agileone','System','INFO','User logout successfully [admin]');
INSERT INTO logging VALUES('175','2014-10-14 07:11:17','admin','Agileone','System','INFO','User login successfully [admin] - 127.0.0.1');
INSERT INTO logging VALUES('176','2014-10-14 07:11:20','admin','Agileone','System','INFO','User logout successfully [admin]');
INSERT INTO logging VALUES('177','2014-10-14 07:11:29','admin','Agileone','System','INFO','User login successfully [admin] - 127.0.0.1');
INSERT INTO logging VALUES('178','2014-10-14 07:11:50','admin','System','Admin','INFO','Update user successfully [ID=4]');
INSERT INTO logging VALUES('179','2014-10-14 07:11:52','admin','System','System','INFO','User logout successfully [admin]');
INSERT INTO logging VALUES('180','2014-10-14 09:05:14','admin','Agileone','System','INFO','User login successfully [admin] - 127.0.0.1');
INSERT INTO logging VALUES('181','2014-10-14 09:15:20','admin','Agileone','System','INFO','User login successfully [admin] - 192.168.3.131');
INSERT INTO logging VALUES('182','2014-10-14 09:15:49','admin','Agileone','Knowledge','INFO','Add knowledge successfully [ID=7]');
INSERT INTO logging VALUES('183','2014-10-14 09:17:03','admin','Agileone','System','INFO','User login successfully [admin] - 192.168.3.131');
INSERT INTO logging VALUES('184','2014-10-14 09:19:45','admin','Agileone','System','INFO','User login successfully [admin] - 192.168.3.131');
INSERT INTO logging VALUES('185','2014-10-14 09:19:46','admin','Agileone','Knowledge','INFO','Add knowledge successfully [ID=8]');
INSERT INTO logging VALUES('186','2014-10-14 09:21:22','admin','Agileone','System','INFO','User login successfully [admin] - 192.168.3.131');
INSERT INTO logging VALUES('187','2014-10-14 09:21:23','admin','Agileone','Knowledge','INFO','Add knowledge successfully [ID=9]');
INSERT INTO logging VALUES('188','2014-10-14 09:22:41','admin','Agileone','System','INFO','User login successfully [admin] - 192.168.3.131');
INSERT INTO logging VALUES('189','2014-10-14 09:22:42','admin','Agileone','Knowledge','INFO','Add knowledge successfully [ID=10]');
INSERT INTO logging VALUES('190','2014-10-14 09:22:43','admin','Agileone','System','INFO','User login successfully [admin] - 192.168.3.131');
INSERT INTO logging VALUES('191','2014-10-14 09:22:44','admin','Agileone','Knowledge','INFO','Add knowledge successfully [ID=11]');
INSERT INTO logging VALUES('192','2014-10-14 09:22:44','admin','Agileone','System','INFO','User login successfully [admin] - 192.168.3.131');
INSERT INTO logging VALUES('193','2014-10-14 09:22:45','admin','Agileone','Knowledge','INFO','Add knowledge successfully [ID=12]');
INSERT INTO logging VALUES('194','2014-10-14 09:24:30','admin','Agileone','System','INFO','User login successfully [admin] - 192.168.3.131');
INSERT INTO logging VALUES('195','2014-10-14 09:24:31','admin','Agileone','Knowledge','INFO','Add knowledge successfully [ID=13]');
INSERT INTO logging VALUES('196','2014-10-14 09:25:02','admin','Agileone','System','INFO','User login successfully [admin] - 192.168.3.131');
INSERT INTO logging VALUES('197','2014-10-14 09:25:03','admin','Agileone','Knowledge','INFO','Add knowledge successfully [ID=14]');
INSERT INTO logging VALUES('198','2014-10-14 09:27:13','admin','Agileone','System','INFO','User logout successfully [admin]');
INSERT INTO logging VALUES('199','2014-10-14 09:28:25','admin','Agileone','System','INFO','User login successfully [admin] - 192.168.3.131');
INSERT INTO logging VALUES('200','2014-10-14 09:29:47','admin','Agileone','System','INFO','User login successfully [admin] - 192.168.3.131');
INSERT INTO logging VALUES('201','2014-10-14 09:29:48','admin','Agileone','Knowledge','INFO','Add knowledge successfully [ID=15]');
INSERT INTO logging VALUES('202','2014-10-14 09:32:07','admin','Agileone','System','INFO','User login successfully [admin] - 192.168.3.131');
INSERT INTO logging VALUES('203','2014-10-14 09:32:08','admin','Agileone','Knowledge','INFO','Add knowledge successfully [ID=16]');
INSERT INTO logging VALUES('204','2014-10-15 02:02:41','admin','Agileone','System','INFO','User login successfully [admin] - 192.168.4.138');
INSERT INTO logging VALUES('205','2014-10-15 02:03:42','admin','Agileone','System','INFO','User login successfully [admin] - 192.168.4.119');
INSERT INTO logging VALUES('206','2014-10-15 02:03:44','admin','Agileone','System','INFO','User logout successfully [admin]');
INSERT INTO logging VALUES('207','2014-10-15 02:03:45','admin','Agileone','System','INFO','User logout successfully [admin]');
INSERT INTO logging VALUES('208','2014-10-15 02:03:48','admin','Agileone','System','INFO','User login successfully [admin] - 192.168.4.125');
INSERT INTO logging VALUES('209','2014-10-15 02:03:48','admin','Agileone','System','INFO','User login successfully [admin] - 192.168.4.119');
INSERT INTO logging VALUES('210','2014-10-15 02:03:49','admin','Agileone','System','INFO','User login successfully [admin] - 192.168.4.103');
INSERT INTO logging VALUES('211','2014-10-15 02:03:52','admin','Agileone','System','INFO','User logout successfully [admin]');
INSERT INTO logging VALUES('212','2014-10-15 02:04:00','admin','Agileone','System','INFO','User login successfully [admin] - 192.168.4.138');
INSERT INTO logging VALUES('213','2014-10-15 02:04:03','admin','Agileone','System','INFO','User logout successfully [admin]');
INSERT INTO logging VALUES('214','2014-10-15 02:04:07','admin','System','System','INFO','User logout successfully [admin]');
INSERT INTO logging VALUES('215','2014-10-15 02:04:39','admin','Agileone','System','INFO','User login successfully [admin] - 192.168.4.138');
INSERT INTO logging VALUES('216','2014-10-15 02:07:11','admin','System','Admin','INFO','Add user successfully [ID=6]');
INSERT INTO logging VALUES('217','2014-10-15 02:07:29','admin','Agileone','System','INFO','User login successfully [admin] - 192.168.4.125');
INSERT INTO logging VALUES('218','2014-10-15 02:07:31','admin','Agileone','System','INFO','User logout successfully [admin]');
INSERT INTO logging VALUES('219','2014-10-15 02:07:51','skrillex','Agileone','System','INFO','User login successfully [skrillex] - 192.168.4.138');
INSERT INTO logging VALUES('220','2014-10-15 02:10:31','admin','Agileone','System','INFO','User login successfully [admin] - 192.168.4.112');
INSERT INTO logging VALUES('221','2014-10-15 02:10:43','admin','Agileone','System','INFO','User logout successfully [admin]');
INSERT INTO logging VALUES('222','2014-10-15 02:10:49','admin','Agileone','System','INFO','User login successfully [admin] - 192.168.4.112');
INSERT INTO logging VALUES('223','2014-10-15 02:10:51','admin','Agileone','System','INFO','User logout successfully [admin]');
INSERT INTO logging VALUES('224','2014-10-15 02:10:57','admin','Agileone','System','INFO','User login successfully [admin] - 192.168.4.122');
INSERT INTO logging VALUES('225','2014-10-15 02:12:25','admin','Agileone','System','INFO','User login successfully [admin] - 192.168.4.110');
INSERT INTO logging VALUES('226','2014-10-15 02:14:12','admin','Agileone','System','INFO','User logout successfully [admin]');
INSERT INTO logging VALUES('227','2014-10-15 02:14:20','admin','Agileone','System','INFO','User login successfully [admin] - 192.168.4.102');
INSERT INTO logging VALUES('228','2014-10-15 02:15:50','admin','Agileone','System','INFO','User login successfully [admin] - 192.168.4.118');
INSERT INTO logging VALUES('229','2014-10-15 02:16:16','admin','Agileone','System','INFO','User logout successfully [admin]');
INSERT INTO logging VALUES('230','2014-10-15 02:30:40','skrillex','Agileone','System','INFO','User logout successfully [skrillex]');
INSERT INTO logging VALUES('231','2014-10-15 02:31:11','admin','Agileone','System','INFO','User login successfully [admin] - 192.168.4.132');
INSERT INTO logging VALUES('232','2014-10-15 02:31:17','admin','Agileone','System','INFO','User logout successfully [admin]');
INSERT INTO logging VALUES('233','2014-10-15 02:32:17','admin','Agileone','System','INFO','User login successfully [admin] - 192.168.4.103');
INSERT INTO logging VALUES('234','2014-10-15 02:32:34','admin','Agileone','System','INFO','User login successfully [admin] - 192.168.4.124');
INSERT INTO logging VALUES('235','2014-10-15 02:32:42','admin','Agileone','System','INFO','User logout successfully [admin]');
INSERT INTO logging VALUES('236','2014-10-15 02:32:56','admin','Agileone','System','INFO','User login successfully [admin] - 192.168.4.124');
INSERT INTO logging VALUES('237','2014-10-15 02:34:13','admin','Agileone','System','INFO','User login successfully [admin] - 192.168.4.125');
INSERT INTO logging VALUES('238','2014-10-15 02:34:13','admin','System','System','INFO','User logout successfully [admin]');
INSERT INTO logging VALUES('239','2014-10-15 02:35:45','admin','Agileone','System','INFO','User login successfully [admin] - 192.168.4.136');
INSERT INTO logging VALUES('240','2014-10-15 02:36:00','admin','Agileone','System','INFO','User login successfully [admin] - 192.168.4.132');
INSERT INTO logging VALUES('241','2014-10-15 02:36:04','admin','Agileone','System','INFO','User logout successfully [admin]');
INSERT INTO logging VALUES('242','2014-10-15 02:36:36','admin','Agileone','System','INFO','User login successfully [admin] - 192.168.4.132');
INSERT INTO logging VALUES('243','2014-10-15 02:36:37','admin','Agileone','System','INFO','User logout successfully [admin]');
INSERT INTO logging VALUES('244','2014-10-15 02:36:39','admin','Agileone','System','INFO','User logout successfully [admin]');
INSERT INTO logging VALUES('245','2014-10-15 02:36:42','admin','Agileone','System','INFO','User login successfully [admin] - 192.168.4.122');
INSERT INTO logging VALUES('246','2014-10-15 02:38:23','admin','Agileone','Notice','INFO','Update notice successfully [ID=17]');
INSERT INTO logging VALUES('247','2014-10-17 05:45:28','admin','Agileone','System','INFO','User login successfully [admin] - 127.0.0.1');
INSERT INTO logging VALUES('248','2014-10-17 05:47:26','admin','Agileone','Task','INFO','Add task successfully [ID=5]');
INSERT INTO logging VALUES('249','2014-10-17 05:47:29','admin','Agileone','Task','INFO','Add task successfully [ID=6]');
INSERT INTO logging VALUES('250','2014-10-17 05:47:36','admin','Agileone','Task','INFO','Add task successfully [ID=7]');
INSERT INTO logging VALUES('251','2014-10-17 05:47:39','admin','Agileone','Task','INFO','Delete task successfully [ID=6]');
INSERT INTO logging VALUES('252','2014-10-17 05:48:05','admin','Agileone','Task','INFO','Delete task successfully [ID=7]');
INSERT INTO logging VALUES('253','2014-10-17 05:48:14','admin','Agileone','Task','INFO','Delete task successfully [ID=5]');
INSERT INTO logging VALUES('254','2014-10-17 06:29:17','admin','Agileone','Notice','INFO','Add notice successfully [ID=26]');
INSERT INTO logging VALUES('255','2014-10-17 06:29:46','admin','Agileone','Notice','INFO','Update notice successfully [ID=26]');
INSERT INTO logging VALUES('256','2014-10-17 06:29:57','admin','Agileone','Notice','INFO','Update notice successfully [ID=26]');
INSERT INTO logging VALUES('257','2014-10-17 06:30:50','admin','Agileone','Notice','INFO','Update notice successfully [ID=26]');
INSERT INTO logging VALUES('258','2014-10-17 06:30:59','admin','Agileone','Notice','INFO','Update notice successfully [ID=26]');
INSERT INTO logging VALUES('259','2014-10-17 06:31:16','admin','Agileone','Notice','INFO','Update notice successfully [ID=26]');
INSERT INTO logging VALUES('260','2014-10-17 06:31:35','admin','Agileone','Notice','INFO','Update notice successfully [ID=26]');
INSERT INTO logging VALUES('261','2014-10-17 06:32:27','admin','Agileone','Notice','INFO','Update notice successfully [ID=26]');
INSERT INTO logging VALUES('262','2014-10-17 06:32:28','admin','Agileone','Notice','INFO','Update notice successfully [ID=26]');
INSERT INTO logging VALUES('263','2014-10-17 06:33:19','admin','Agileone','System','INFO','User logout successfully [admin]');
INSERT INTO logging VALUES('264','2014-10-17 06:33:30','denny','Agileone','System','INFO','User login successfully [denny] - 127.0.0.1');
INSERT INTO logging VALUES('265','2014-10-17 06:41:13','denny','Agileone','Notice','INFO','Add notice successfully [ID=27]');
INSERT INTO logging VALUES('266','2014-10-17 06:41:26','denny','Agileone','System','INFO','User logout successfully [denny]');
INSERT INTO logging VALUES('267','2014-10-17 06:43:28','admin','Agileone','System','INFO','User login successfully [admin] - 127.0.0.1');
INSERT INTO logging VALUES('268','2014-10-17 06:43:39','admin','System','System','INFO','User logout successfully [admin]');
INSERT INTO logging VALUES('269','2014-10-17 06:44:06','admin','Agileone','System','INFO','User login successfully [' or userid=1 --'] - 127.0.0.1');
INSERT INTO logging VALUES('270','2014-10-17 06:44:10','admin','Agileone','System','INFO','User logout successfully [admin]');
INSERT INTO logging VALUES('271','2014-10-17 06:44:19','denny','Agileone','System','INFO','User login successfully [' or userid=2 --'] - 127.0.0.1');
INSERT INTO logging VALUES('272','2014-10-17 06:44:22','denny','Agileone','System','INFO','User logout successfully [denny]');
INSERT INTO logging VALUES('273','2014-10-17 06:45:40','admin','Agileone','System','INFO','User login successfully [admin] - 127.0.0.1');
INSERT INTO logging VALUES('274','2014-10-17 06:46:17','admin','Agileone','System','INFO','User login successfully ['or userid=1 --'] - 192.168.4.104');
INSERT INTO logging VALUES('275','2014-10-17 06:46:21','admin','Agileone','System','INFO','User logout successfully [admin]');
INSERT INTO logging VALUES('276','2014-10-17 06:46:38','admin','Agileone','System','INFO','User login successfully [admin] - 192.168.4.104');
INSERT INTO logging VALUES('277','2014-10-17 06:46:45','admin','Agileone','System','INFO','User logout successfully [admin]');
INSERT INTO logging VALUES('278','2014-10-17 06:47:45','admin','Agileone','Notice','INFO','Add notice successfully [ID=28]');
INSERT INTO logging VALUES('279','2014-10-17 06:48:08','admin','Agileone','Notice','INFO','Update notice successfully [ID=28]');
INSERT INTO logging VALUES('280','2014-10-17 06:48:10','admin','Agileone','System','INFO','User login successfully ['or userid=1 --'] - 192.168.4.114');
INSERT INTO logging VALUES('281','2014-10-17 06:48:17','admin','Agileone','System','INFO','User logout successfully [admin]');
INSERT INTO logging VALUES('282','2014-10-17 06:48:50','admin','Agileone','System','INFO','User login successfully ['or userid=1 --'] - 192.168.4.114');
INSERT INTO logging VALUES('283','2014-10-17 06:48:58','admin','Agileone','System','INFO','User login successfully ['or userid=1--'] - 192.168.4.118');
INSERT INTO logging VALUES('284','2014-10-17 06:50:57','admin','Agileone','System','INFO','User logout successfully [admin]');
INSERT INTO logging VALUES('285','2014-10-17 06:51:14','admin','Agileone','System','INFO','User login successfully [admin] - 192.168.4.114');
INSERT INTO logging VALUES('286','2014-10-17 06:51:57','admin','Agileone','Notice','INFO','Add notice successfully [ID=29]');
INSERT INTO logging VALUES('287','2014-10-17 06:52:19','admin','Agileone','Notice','INFO','Add notice successfully [ID=30]');
INSERT INTO logging VALUES('288','2014-10-17 07:05:22','admin','Agileone','System','INFO','User login successfully [admin] - 192.168.4.104');
INSERT INTO logging VALUES('289','2014-10-17 07:06:56','admin','Agileone','System','INFO','User login successfully ['or userid=1 --'] - 192.168.4.119');
INSERT INTO logging VALUES('290','2014-10-17 07:08:33','admin','Agileone','System','INFO','User login successfully [admin] - 192.168.4.126');
INSERT INTO logging VALUES('291','2014-10-17 07:10:06','admin','Agileone','Notice','INFO','Add notice successfully [ID=31]');
INSERT INTO logging VALUES('292','2014-10-17 07:15:54','admin','Agileone','Notice','INFO','Update notice successfully [ID=31]');
INSERT INTO logging VALUES('293','2014-10-17 07:16:07','admin','Agileone','Notice','INFO','Update notice successfully [ID=31]');
INSERT INTO logging VALUES('294','2014-10-17 07:16:18','admin','Agileone','Notice','INFO','Update notice successfully [ID=31]');
INSERT INTO logging VALUES('295','2014-10-17 07:21:18','admin','Agileone','Spec','INFO','Add specification successfully [ID=4]');
INSERT INTO logging VALUES('296','2014-10-17 07:22:38','admin','Agileone','Spec','INFO','Delete specification successfully [ID=4]');
INSERT INTO logging VALUES('297','2014-10-17 07:23:05','admin','System','Admin','INFO','Update user successfully [ID=4]');
INSERT INTO logging VALUES('298','2014-10-17 07:27:21','admin','Agileone','Notice','INFO','Add notice successfully [ID=32]');
INSERT INTO logging VALUES('299','2014-10-17 07:27:30','admin','Agileone','Notice','INFO','Delete notice successfully [ID=32]');
INSERT INTO logging VALUES('300','2014-10-17 07:27:35','admin','Agileone','Notice','INFO','Delete notice successfully [ID=31]');
INSERT INTO logging VALUES('301','2014-10-17 07:40:57','denny','Agileone','System','INFO','User login successfully [denny] - 192.168.4.137');
INSERT INTO logging VALUES('302','2014-10-17 07:41:00','admin','Agileone','System','INFO','User login successfully [admin] - 192.168.4.145');
INSERT INTO logging VALUES('303','2014-10-17 07:41:01','admin','Agileone','System','INFO','User logout successfully [admin]');
INSERT INTO logging VALUES('304','2014-10-17 07:41:04','admin','Agileone','System','INFO','User login successfully [admin] - 192.168.4.123');
INSERT INTO logging VALUES('305','2014-10-17 07:41:06','denny','Agileone','System','INFO','User login successfully [denny] - 192.168.4.104');
INSERT INTO logging VALUES('306','2014-10-17 07:41:26','admin','Agileone','System','INFO','User login successfully [admin] - 192.168.4.110');
INSERT INTO logging VALUES('307','2014-10-17 07:41:26','admin','Agileone','System','INFO','User login successfully [admin] - 192.168.4.110');
INSERT INTO logging VALUES('308','2014-10-17 07:41:26','admin','Agileone','System','INFO','User login successfully [admin] - 192.168.4.110');
INSERT INTO logging VALUES('309','2014-10-17 07:41:35','admin','Agileone','System','INFO','User login successfully [admin] - 192.168.4.116');
INSERT INTO logging VALUES('310','2014-10-17 07:43:17','admin','Agileone','UserStory','INFO','Add userstory successfully [ID=20]');
INSERT INTO logging VALUES('311','2014-10-17 07:44:34','denny','Agileone','Task','INFO','Add task successfully [ID=8]');
INSERT INTO logging VALUES('312','2014-10-17 07:44:37','denny','Agileone','Task','INFO','Add task successfully [ID=9]');
INSERT INTO logging VALUES('313','2014-10-17 07:44:38','denny','Agileone','Task','INFO','Delete task successfully [ID=8]');
INSERT INTO logging VALUES('314','2014-10-17 07:46:31','admin','Agileone','UserStory','INFO','Delete userstory successfully [ID=20]');
INSERT INTO logging VALUES('315','2014-10-17 07:47:17','admin','Agileone','System','INFO','User login successfully [admin] - 192.168.4.161');
INSERT INTO logging VALUES('316','2014-10-17 07:47:54','admin','Agileone','Notice','INFO','Delete notice successfully [ID=30]');
INSERT INTO logging VALUES('317','2014-10-17 07:47:57','admin','Agileone','Notice','INFO','Delete notice successfully [ID=29]');
INSERT INTO logging VALUES('318','2014-10-17 07:47:59','admin','Agileone','System','INFO','User login successfully [admin] - 192.168.4.103');
INSERT INTO logging VALUES('319','2014-10-17 07:48:02','admin','Agileone','System','INFO','User login successfully [admin] - 192.168.4.165');
INSERT INTO logging VALUES('320','2014-10-17 07:48:07','admin','Agileone','System','INFO','User login successfully [admin] - 192.168.4.128');
INSERT INTO logging VALUES('321','2014-10-17 07:48:07','admin','Agileone','System','INFO','User login successfully [admin] - 192.168.4.142');
INSERT INTO logging VALUES('322','2014-10-17 07:48:12','admin','Agileone','System','INFO','User login successfully [admin] - 192.168.4.109');
INSERT INTO logging VALUES('323','2014-10-17 07:48:25','admin','Agileone','UserStory','INFO','Add userstory successfully [ID=21]');
INSERT INTO logging VALUES('324','2014-10-17 07:48:30','admin','Agileone','UserStory','INFO','Delete userstory successfully [ID=21]');
INSERT INTO logging VALUES('325','2014-10-17 07:48:33','admin','Agileone','Execution','INFO','Add execution result successfully [ID=12]');
INSERT INTO logging VALUES('326','2014-10-17 07:48:33','admin','Agileone','System','INFO','User login successfully [admin] - 192.168.4.140');
INSERT INTO logging VALUES('327','2014-10-17 07:48:39','admin','Agileone','System','INFO','User login successfully [admin] - 192.168.4.105');
INSERT INTO logging VALUES('328','2014-10-17 07:48:41','admin','Agileone','System','INFO','User login successfully [admin] - 192.168.4.132');
INSERT INTO logging VALUES('329','2014-10-17 07:48:45','admin','Agileone','System','INFO','User login successfully [admin] - 192.168.4.115');
INSERT INTO logging VALUES('330','2014-10-17 07:48:46','admin','Agileone','System','INFO','User login successfully [Admin] - 192.168.4.101');
INSERT INTO logging VALUES('331','2014-10-17 07:48:50','denny','Agileone','System','INFO','User login successfully [denny] - 192.168.4.121');
INSERT INTO logging VALUES('332','2014-10-17 07:48:54','admin','Agileone','System','INFO','User login successfully [admin] - 192.168.4.111');
INSERT INTO logging VALUES('333','2014-10-17 07:48:56','admin','Agileone','System','INFO','User login successfully [admin] - 192.168.4.106');
INSERT INTO logging VALUES('334','2014-10-17 07:48:56','admin','Agileone','System','INFO','User login successfully [admin] - 192.168.4.134');
INSERT INTO logging VALUES('335','2014-10-17 07:48:59','admin','Agileone','System','INFO','User login successfully [admin] - 192.168.4.120');
INSERT INTO logging VALUES('336','2014-10-17 07:49:00','admin','Agileone','Notice','INFO','Delete notice successfully [ID=28]');
INSERT INTO logging VALUES('337','2014-10-17 07:49:09','admin','Agileone','Notice','INFO','Delete notice successfully [ID=26]');
INSERT INTO logging VALUES('338','2014-10-17 07:49:09','admin','Agileone','System','INFO','User login successfully [admin] - 192.168.4.131');
INSERT INTO logging VALUES('339','2014-10-17 07:49:11','admin','Agileone','Notice','INFO','Delete notice successfully [ID=27]');
INSERT INTO logging VALUES('340','2014-10-17 07:49:13','admin','Agileone','System','INFO','User login successfully [admin] - 192.168.4.141');
INSERT INTO logging VALUES('341','2014-10-17 07:49:22','denny','Agileone','System','INFO','User login successfully [denny] - 192.168.4.113');
INSERT INTO logging VALUES('342','2014-10-17 07:49:24','admin','Agileone','System','INFO','User login successfully [admin] - 192.168.4.102');
INSERT INTO logging VALUES('343','2014-10-17 07:49:30','admin','Agileone','System','INFO','User login successfully [admin] - 192.168.4.144');
INSERT INTO logging VALUES('344','2014-10-17 07:49:31','admin','Agileone','UserStory','INFO','Add userstory successfully [ID=22]');
INSERT INTO logging VALUES('345','2014-10-17 07:49:32','admin','Agileone','System','INFO','User login successfully [admin] - 192.168.4.139');
INSERT INTO logging VALUES('346','2014-10-17 07:49:32','admin','Agileone','System','INFO','User login successfully [admin] - 192.168.4.108');
INSERT INTO logging VALUES('347','2014-10-17 07:49:43','admin','Agileone','System','INFO','User login successfully [admin] - 192.168.4.127');
INSERT INTO logging VALUES('348','2014-10-17 07:49:45','admin','Agileone','UserStory','INFO','Delete userstory successfully [ID=22]');
INSERT INTO logging VALUES('349','2014-10-17 07:49:52','admin','Agileone','System','INFO','User login successfully [admin] - 192.168.4.117');
INSERT INTO logging VALUES('350','2014-10-17 07:49:58','denny','Agileone','System','INFO','User login successfully [denny] - 192.168.4.130');
INSERT INTO logging VALUES('351','2014-10-17 07:50:02','admin','Agileone','Notice','INFO','Delete notice successfully [ID=8]');
INSERT INTO logging VALUES('352','2014-10-17 07:50:03','admin','Agileone','System','INFO','User login successfully [admin] - 192.168.4.129');
INSERT INTO logging VALUES('353','2014-10-17 07:50:06','admin','Agileone','Notice','INFO','Delete notice successfully [ID=16]');
INSERT INTO logging VALUES('354','2014-10-17 07:50:11','admin','Agileone','System','INFO','User login successfully [admin] - 192.168.4.133');
INSERT INTO logging VALUES('355','2014-10-17 07:50:20','admin','Agileone','Knowledge','INFO','Delete knowledge successfully [ID=16]');
INSERT INTO logging VALUES('356','2014-10-17 07:50:24','admin','Agileone','Knowledge','INFO','Delete knowledge successfully [ID=15]');
INSERT INTO logging VALUES('357','2014-10-17 07:50:30','admin','Agileone','System','INFO','User login successfully [admin] - 192.168.4.147');
INSERT INTO logging VALUES('358','2014-10-17 07:50:32','admin','Agileone','Knowledge','INFO','Delete knowledge successfully [ID=11]');
INSERT INTO logging VALUES('359','2014-10-17 07:50:43','skrillex','Agileone','System','INFO','User login successfully [skrillex] - 192.168.4.138');
INSERT INTO logging VALUES('360','2014-10-17 07:50:50','admin','Agileone','UserStory','INFO','Add userstory successfully [ID=23]');
INSERT INTO logging VALUES('361','2014-10-17 07:50:52','admin','Agileone','Knowledge','INFO','Delete knowledge successfully [ID=14]');
INSERT INTO logging VALUES('362','2014-10-17 07:50:54','admin','Agileone','Knowledge','INFO','Delete knowledge successfully [ID=13]');
INSERT INTO logging VALUES('363','2014-10-17 07:50:54','admin','Agileone','System','INFO','User logout successfully [admin]');
INSERT INTO logging VALUES('364','2014-10-17 07:51:07','admin','Agileone','System','INFO','User login successfully [admin] - 192.168.4.136');
INSERT INTO logging VALUES('365','2014-10-17 07:51:20','admin','Agileone','System','INFO','User login successfully [admin] - 192.168.4.122');
INSERT INTO logging VALUES('366','2014-10-17 07:51:23','admin','Agileone','System','INFO','User login successfully [admin] - 192.168.4.112');
INSERT INTO logging VALUES('367','2014-10-17 07:51:32','admin','Agileone','System','INFO','User login successfully ['or userid=1--'] - 192.168.4.143');
INSERT INTO logging VALUES('368','2014-10-17 07:51:35','admin','System','Admin','WARN','Set default language to [en]');
INSERT INTO logging VALUES('369','2014-10-17 07:51:38','admin','Agileone','UserStory','INFO','Delete userstory successfully [ID=23]');
INSERT INTO logging VALUES('370','2014-10-17 07:51:56','admin','Agileone','Knowledge','INFO','Add knowledge successfully [ID=17]');
INSERT INTO logging VALUES('371','2014-10-17 07:52:01','admin','Agileone','UserStory','INFO','Add userstory successfully [ID=24]');
INSERT INTO logging VALUES('372','2014-10-17 07:52:06','admin','Agileone','UserStory','INFO','Delete userstory successfully [ID=19]');
INSERT INTO logging VALUES('373','2014-10-17 07:52:07','admin','Agileone','UserStory','INFO','Add userstory successfully [ID=25]');
INSERT INTO logging VALUES('374','2014-10-17 07:52:07','admin','Agileone','Knowledge','INFO','Delete knowledge successfully [ID=17]');
INSERT INTO logging VALUES('375','2014-10-17 07:52:15','admin','System','Admin','WARN','Set default language to [zh]');
INSERT INTO logging VALUES('376','2014-10-17 07:52:16','admin','Agileone','UserStory','INFO','Add userstory successfully [ID=26]');
INSERT INTO logging VALUES('377','2014-10-17 07:52:21','admin','Agileone','UserStory','ERROR','Update userstory unsuccessfully [ID=19]');
INSERT INTO logging VALUES('378','2014-10-17 07:52:23','admin','Agileone','Knowledge','INFO','Delete knowledge successfully [ID=12]');
INSERT INTO logging VALUES('379','2014-10-17 07:52:31','admin','Agileone','Knowledge','INFO','Delete knowledge successfully [ID=10]');
INSERT INTO logging VALUES('380','2014-10-17 07:52:32','admin','Agileone','UserStory','INFO','Add userstory successfully [ID=27]');
INSERT INTO logging VALUES('381','2014-10-17 07:52:34','admin','Agileone','Knowledge','INFO','Delete knowledge successfully [ID=9]');
INSERT INTO logging VALUES('382','2014-10-17 07:52:36','admin','Agileone','Knowledge','INFO','Delete knowledge successfully [ID=8]');
INSERT INTO logging VALUES('383','2014-10-17 07:52:37','admin','Agileone','UserStory','INFO','Add userstory successfully [ID=28]');
INSERT INTO logging VALUES('384','2014-10-17 07:52:37','admin','System','Admin','INFO','Update user successfully [ID=1]');
INSERT INTO logging VALUES('385','2014-10-17 07:52:37','admin','Agileone','Knowledge','INFO','Delete knowledge successfully [ID=7]');
INSERT INTO logging VALUES('386','2014-10-17 07:52:38','admin','Agileone','Knowledge','INFO','Delete knowledge successfully [ID=6]');
INSERT INTO logging VALUES('387','2014-10-17 07:52:42','skrillex','Agileone','Knowledge','INFO','Add knowledge successfully [ID=18]');
INSERT INTO logging VALUES('388','2014-10-17 07:52:42','admin','Agileone','Knowledge','INFO','Delete knowledge successfully [ID=5]');
INSERT INTO logging VALUES('389','2014-10-17 07:52:43','admin','Agileone','UserStory','INFO','Delete userstory successfully [ID=28]');
INSERT INTO logging VALUES('390','2014-10-17 07:52:49','admin','Agileone','UserStory','INFO','Add userstory successfully [ID=29]');
INSERT INTO logging VALUES('391','2014-10-17 07:52:57','admin','Agileone','UserStory','INFO','Delete userstory successfully [ID=27]');
INSERT INTO logging VALUES('392','2014-10-17 07:52:57','skrillex','Agileone','Knowledge','INFO','Update knowledge successfully [ID=18]');
INSERT INTO logging VALUES('393','2014-10-17 07:52:58','admin','Agileone','UserStory','INFO','Add userstory successfully [ID=30]');
INSERT INTO logging VALUES('394','2014-10-17 07:52:58','skrillex','Agileone','Knowledge','INFO','Update knowledge successfully [ID=18]');
INSERT INTO logging VALUES('395','2014-10-17 07:53:01','admin','Agileone','UserStory','INFO','Add userstory successfully [ID=31]');
INSERT INTO logging VALUES('396','2014-10-17 07:53:03','admin','Agileone','UserStory','INFO','Delete userstory successfully [ID=29]');
INSERT INTO logging VALUES('397','2014-10-17 07:53:04','denny','Agileone','UserStory','INFO','Add userstory successfully [ID=32]');
INSERT INTO logging VALUES('398','2014-10-17 07:53:06','admin','Agileone','UserStory','INFO','Delete userstory successfully [ID=31]');
INSERT INTO logging VALUES('399','2014-10-17 07:53:10','denny','Agileone','UserStory','INFO','Delete userstory successfully [ID=32]');
INSERT INTO logging VALUES('400','2014-10-17 07:53:11','admin','Agileone','UserStory','INFO','Update userstory successfully [ID=24]');
INSERT INTO logging VALUES('401','2014-10-17 07:53:14','admin','Agileone','UserStory','INFO','Add userstory successfully [ID=33]');
INSERT INTO logging VALUES('402','2014-10-17 07:53:15','admin','Agileone','UserStory','INFO','Delete userstory successfully [ID=24]');
INSERT INTO logging VALUES('403','2014-10-17 07:53:23','admin','Agileone','UserStory','INFO','Delete userstory successfully [ID=30]');
INSERT INTO logging VALUES('404','2014-10-17 07:53:26','admin','Agileone','UserStory','INFO','Delete userstory successfully [ID=25]');
INSERT INTO logging VALUES('405','2014-10-17 07:53:28','admin','System','Admin','WARN','Set default language to [en]');
INSERT INTO logging VALUES('406','2014-10-17 07:53:31','admin','Agileone','UserStory','INFO','Add userstory successfully [ID=34]');
INSERT INTO logging VALUES('407','2014-10-17 07:53:33','admin','Agileone','UserStory','INFO','Add userstory successfully [ID=35]');
INSERT INTO logging VALUES('408','2014-10-17 07:53:35','admin','Agileone','UserStory','INFO','Delete userstory successfully [ID=26]');
INSERT INTO logging VALUES('409','2014-10-17 07:53:36','admin','Agileone','UserStory','INFO','Delete userstory successfully [ID=34]');
INSERT INTO logging VALUES('410','2014-10-17 07:53:38','admin','Agileone','Task','INFO','Add task successfully [ID=10]');
INSERT INTO logging VALUES('411','2014-10-17 07:53:48','admin','Agileone','Task','INFO','Add task successfully [ID=11]');
INSERT INTO logging VALUES('412','2014-10-17 07:53:52','admin','Agileone','System','INFO','User login successfully [admin] - 192.168.4.114');
INSERT INTO logging VALUES('413','2014-10-17 07:53:53','admin','Agileone','Task','INFO','Add task successfully [ID=12]');
INSERT INTO logging VALUES('414','2014-10-17 07:54:07','admin','Agileone','Task','INFO','Add task successfully [ID=13]');
INSERT INTO logging VALUES('415','2014-10-17 07:54:07','admin','System','Admin','WARN','Set default language to [zh]');
INSERT INTO logging VALUES('416','2014-10-17 07:54:08','admin','System','Admin','WARN','Set default language to [zh]');
INSERT INTO logging VALUES('417','2014-10-17 07:54:09','admin','System','Admin','WARN','Set default language to [zh]');
INSERT INTO logging VALUES('418','2014-10-17 07:54:10','admin','System','Admin','WARN','Set default language to [zh]');
INSERT INTO logging VALUES('419','2014-10-17 07:54:10','admin','System','Admin','WARN','Set default language to [zh]');
INSERT INTO logging VALUES('420','2014-10-17 07:54:11','admin','Agileone','UserStory','INFO','Add userstory successfully [ID=36]');
INSERT INTO logging VALUES('421','2014-10-17 07:54:11','admin','Agileone','UserStory','INFO','Add userstory successfully [ID=37]');
INSERT INTO logging VALUES('422','2014-10-17 07:54:12','admin','Agileone','UserStory','INFO','Add userstory successfully [ID=38]');
INSERT INTO logging VALUES('423','2014-10-17 07:54:17','admin','Agileone','Notice','INFO','Add notice successfully [ID=33]');
INSERT INTO logging VALUES('424','2014-10-17 07:54:18','admin','Agileone','UserStory','INFO','Update userstory successfully [ID=35]');
INSERT INTO logging VALUES('425','2014-10-17 07:54:21','admin','Agileone','UserStory','INFO','Add userstory successfully [ID=39]');
INSERT INTO logging VALUES('426','2014-10-17 07:54:22','admin','Agileone','UserStory','INFO','Delete userstory successfully [ID=38]');
INSERT INTO logging VALUES('427','2014-10-17 07:54:24','admin','Agileone','System','INFO','User login successfully [admin] - 192.168.4.125');
INSERT INTO logging VALUES('428','2014-10-17 07:54:25','admin','Agileone','UserStory','INFO','Delete userstory successfully [ID=37]');
INSERT INTO logging VALUES('429','2014-10-17 07:54:25','admin','Agileone','UserStory','INFO','Add userstory successfully [ID=40]');
INSERT INTO logging VALUES('430','2014-10-17 07:54:28','admin','Agileone','UserStory','INFO','Update userstory successfully [ID=35]');
INSERT INTO logging VALUES('431','2014-10-17 07:54:28','admin','Agileone','UserStory','INFO','Delete userstory successfully [ID=36]');
INSERT INTO logging VALUES('432','2014-10-17 07:54:30','admin','Agileone','UserStory','INFO','Delete userstory successfully [ID=35]');
INSERT INTO logging VALUES('433','2014-10-17 07:54:30','admin','Agileone','UserStory','ERROR','Update userstory unsuccessfully [ID=35]');
INSERT INTO logging VALUES('434','2014-10-17 07:54:31','admin','Agileone','UserStory','INFO','Delete userstory successfully [ID=33]');
INSERT INTO logging VALUES('435','2014-10-17 07:54:31','admin','Agileone','UserStory','INFO','Delete userstory successfully [ID=39]');
INSERT INTO logging VALUES('436','2014-10-17 07:54:32','admin','Agileone','UserStory','INFO','Delete userstory successfully [ID=18]');
INSERT INTO logging VALUES('437','2014-10-17 07:54:32','admin','Agileone','UserStory','ERROR','Update userstory unsuccessfully [ID=37]');
INSERT INTO logging VALUES('438','2014-10-17 07:54:32','admin','Agileone','UserStory','INFO','Delete userstory successfully [ID=17]');
INSERT INTO logging VALUES('439','2014-10-17 07:54:33','admin','Agileone','UserStory','ERROR','Update userstory unsuccessfully [ID=35]');
INSERT INTO logging VALUES('440','2014-10-17 07:54:33','admin','Agileone','UserStory','INFO','Delete userstory successfully [ID=16]');
INSERT INTO logging VALUES('441','2014-10-17 07:54:33','admin','Agileone','UserStory','ERROR','Update userstory unsuccessfully [ID=37]');
INSERT INTO logging VALUES('442','2014-10-17 07:54:33','admin','Agileone','UserStory','ERROR','Update userstory unsuccessfully [ID=35]');
INSERT INTO logging VALUES('443','2014-10-17 07:54:33','admin','Agileone','UserStory','INFO','Delete userstory successfully [ID=15]');
INSERT INTO logging VALUES('444','2014-10-17 07:54:34','admin','Agileone','UserStory','ERROR','Update userstory unsuccessfully [ID=37]');
INSERT INTO logging VALUES('445','2014-10-17 07:54:34','admin','Agileone','UserStory','INFO','Delete userstory successfully [ID=14]');
INSERT INTO logging VALUES('446','2014-10-17 07:54:35','admin','Agileone','UserStory','ERROR','Update userstory unsuccessfully [ID=37]');
INSERT INTO logging VALUES('447','2014-10-17 07:54:35','admin','Agileone','UserStory','INFO','Delete userstory successfully [ID=13]');
INSERT INTO logging VALUES('448','2014-10-17 07:54:35','admin','Agileone','UserStory','ERROR','Update userstory unsuccessfully [ID=35]');
INSERT INTO logging VALUES('449','2014-10-17 07:54:35','admin','Agileone','UserStory','ERROR','Update userstory unsuccessfully [ID=37]');
INSERT INTO logging VALUES('450','2014-10-17 07:54:35','admin','Agileone','UserStory','INFO','Delete userstory successfully [ID=12]');
INSERT INTO logging VALUES('451','2014-10-17 07:54:36','admin','Agileone','UserStory','INFO','Delete userstory successfully [ID=11]');
INSERT INTO logging VALUES('452','2014-10-17 07:54:38','admin','Agileone','UserStory','INFO','Delete userstory successfully [ID=10]');
INSERT INTO logging VALUES('453','2014-10-17 07:54:38','admin','Agileone','UserStory','ERROR','Update userstory unsuccessfully [ID=35]');
INSERT INTO logging VALUES('454','2014-10-17 07:54:40','admin','Agileone','UserStory','INFO','Delete userstory successfully [ID=4]');
INSERT INTO logging VALUES('455','2014-10-17 07:54:41','admin','Agileone','UserStory','INFO','Delete userstory successfully [ID=3]');
INSERT INTO logging VALUES('456','2014-10-17 07:54:41','admin','Agileone','UserStory','ERROR','Update userstory unsuccessfully [ID=37]');
INSERT INTO logging VALUES('457','2014-10-17 07:54:41','admin','Agileone','UserStory','INFO','Delete userstory successfully [ID=2]');
INSERT INTO logging VALUES('458','2014-10-17 07:54:41','admin','Agileone','UserStory','ERROR','Update userstory unsuccessfully [ID=37]');
INSERT INTO logging VALUES('459','2014-10-17 07:54:42','admin','Agileone','UserStory','INFO','Delete userstory successfully [ID=1]');
INSERT INTO logging VALUES('460','2014-10-17 07:54:42','admin','Agileone','UserStory','ERROR','Update userstory unsuccessfully [ID=37]');
INSERT INTO logging VALUES('461','2014-10-17 07:54:42','admin','Agileone','UserStory','ERROR','Update userstory unsuccessfully [ID=37]');
INSERT INTO logging VALUES('462','2014-10-17 07:54:42','admin','Agileone','UserStory','ERROR','Update userstory unsuccessfully [ID=35]');
INSERT INTO logging VALUES('463','2014-10-17 07:54:43','admin','Agileone','UserStory','INFO','Add userstory successfully [ID=41]');
INSERT INTO logging VALUES('464','2014-10-17 07:54:44','admin','Agileone','UserStory','INFO','Delete userstory successfully [ID=5]');
INSERT INTO logging VALUES('465','2014-10-17 07:54:45','admin','Agileone','UserStory','INFO','Delete userstory successfully [ID=6]');
INSERT INTO logging VALUES('466','2014-10-17 07:54:45','admin','Agileone','UserStory','INFO','Delete userstory successfully [ID=7]');
INSERT INTO logging VALUES('467','2014-10-17 07:54:46','admin','Agileone','UserStory','INFO','Delete userstory successfully [ID=8]');
INSERT INTO logging VALUES('468','2014-10-17 07:54:47','admin','Agileone','UserStory','INFO','Delete userstory successfully [ID=41]');
INSERT INTO logging VALUES('469','2014-10-17 07:54:48','admin','Agileone','UserStory','INFO','Delete userstory successfully [ID=9]');
INSERT INTO logging VALUES('470','2014-10-17 07:54:49','admin','Agileone','UserStory','ERROR','Update userstory unsuccessfully [ID=38]');
INSERT INTO logging VALUES('471','2014-10-17 07:54:50','admin','Agileone','System','INFO','User logout successfully [admin]');
INSERT INTO logging VALUES('472','2014-10-17 07:54:50','admin','Agileone','UserStory','ERROR','Update userstory unsuccessfully [ID=38]');
INSERT INTO logging VALUES('473','2014-10-17 07:54:51','admin','Agileone','UserStory','ERROR','Update userstory unsuccessfully [ID=37]');
INSERT INTO logging VALUES('474','2014-10-17 07:54:54','admin','Agileone','UserStory','INFO','Add userstory successfully [ID=42]');
INSERT INTO logging VALUES('475','2014-10-17 07:54:54','admin','Agileone','UserStory','INFO','Add userstory successfully [ID=43]');
INSERT INTO logging VALUES('476','2014-10-17 07:54:55','admin','Agileone','UserStory','INFO','Delete userstory successfully [ID=40]');
INSERT INTO logging VALUES('477','2014-10-17 07:54:58','denny','Agileone','System','INFO','User login successfully [denny] - 192.168.4.141');
INSERT INTO logging VALUES('478','2014-10-17 07:54:59','admin','Agileone','Knowledge','INFO','Update knowledge successfully [ID=18]');
INSERT INTO logging VALUES('479','2014-10-17 07:55:00','admin','Agileone','UserStory','INFO','Delete userstory successfully [ID=42]');
INSERT INTO logging VALUES('480','2014-10-17 07:55:01','admin','Agileone','UserStory','INFO','Delete userstory successfully [ID=43]');
INSERT INTO logging VALUES('481','2014-10-17 07:55:18','admin','Agileone','System','INFO','User login successfully [admin] - 192.168.4.146');
INSERT INTO logging VALUES('482','2014-10-17 07:55:30','admin','Agileone','System','INFO','User logout successfully [admin]');
INSERT INTO logging VALUES('483','2014-10-17 07:55:36','admin','System','Admin','WARN','Set default language to [en]');
INSERT INTO logging VALUES('484','2014-10-17 07:55:36','admin','Agileone','System','INFO','User login successfully [admin] - 192.168.4.132');
INSERT INTO logging VALUES('485','2014-10-17 07:55:42','admin','Agileone','System','INFO','User logout successfully [admin]');
INSERT INTO logging VALUES('486','2014-10-17 07:55:45','admin','Agileone','System','INFO','User login successfully [admin] - 192.168.4.116');
INSERT INTO logging VALUES('487','2014-10-17 07:55:49','admin','System','Admin','WARN','Set default language to [zh]');
INSERT INTO logging VALUES('488','2014-10-17 07:55:51','admin','Agileone','System','INFO','User login successfully [admin] - 192.168.4.161');
INSERT INTO logging VALUES('489','2014-10-17 07:56:01','admin','Agileone','System','INFO','User login successfully ['or userid=1 --'] - 192.168.4.110');
INSERT INTO logging VALUES('490','2014-10-17 07:56:04','admin','Agileone','UserStory','INFO','Add userstory successfully [ID=44]');
INSERT INTO logging VALUES('491','2014-10-17 07:56:07','admin','Agileone','System','INFO','User logout successfully [admin]');
INSERT INTO logging VALUES('492','2014-10-17 07:56:19','admin','Agileone','UserStory','INFO','Add userstory successfully [ID=45]');
INSERT INTO logging VALUES('493','2014-10-17 07:56:26','admin','Agileone','UserStory','INFO','Add userstory successfully [ID=46]');
INSERT INTO logging VALUES('494','2014-10-17 07:56:30','admin','Agileone','UserStory','INFO','Add userstory successfully [ID=47]');
INSERT INTO logging VALUES('495','2014-10-17 07:56:32','denny','Agileone','UserStory','INFO','Add userstory successfully [ID=48]');
INSERT INTO logging VALUES('496','2014-10-17 07:56:34','admin','Agileone','UserStory','INFO','Delete userstory successfully [ID=47]');
INSERT INTO logging VALUES('497','2014-10-17 07:56:42','admin','Agileone','Task','INFO','Add task successfully [ID=14]');
INSERT INTO logging VALUES('498','2014-10-17 07:56:43','admin','Agileone','UserStory','INFO','Add userstory successfully [ID=49]');
INSERT INTO logging VALUES('499','2014-10-17 07:56:44','admin','Agileone','UserStory','INFO','Add userstory successfully [ID=50]');
INSERT INTO logging VALUES('500','2014-10-17 07:56:45','admin','Agileone','Minutes','INFO','Add minutes successfully [ID=1]');
INSERT INTO logging VALUES('501','2014-10-17 07:56:49','admin','Agileone','Defect','INFO','Update task status to finished [ID=14]');
INSERT INTO logging VALUES('502','2014-10-17 07:56:51','admin','Agileone','Defect','INFO','Update task status to finished [ID=13]');
INSERT INTO logging VALUES('503','2014-10-17 07:56:52','admin','Agileone','Defect','INFO','Update task status to finished [ID=10]');
INSERT INTO logging VALUES('504','2014-10-17 07:56:55','admin','Agileone','UserStory','INFO','Delete userstory successfully [ID=48]');
INSERT INTO logging VALUES('505','2014-10-17 07:56:58','denny','Agileone','System','INFO','User login successfully ['or userid =2 -- '] - 192.168.4.110');
INSERT INTO logging VALUES('506','2014-10-17 07:57:00','admin','Agileone','UserStory','INFO','Add userstory successfully [ID=51]');
INSERT INTO logging VALUES('507','2014-10-17 07:57:06','admin','Agileone','UserStory','INFO','Add userstory successfully [ID=52]');
INSERT INTO logging VALUES('508','2014-10-17 07:57:16','admin','Agileone','Notice','INFO','Delete notice successfully [ID=33]');
INSERT INTO logging VALUES('509','2014-10-17 07:57:18','admin','Agileone','Proposal','INFO','Add proposal successfully [ID=19]');
INSERT INTO logging VALUES('510','2014-10-17 07:57:19','admin','Agileone','UserStory','INFO','Add userstory successfully [ID=53]');
INSERT INTO logging VALUES('511','2014-10-17 07:57:20','admin','Agileone','Task','INFO','Add task successfully [ID=15]');
INSERT INTO logging VALUES('512','2014-10-17 07:57:21','admin','Agileone','UserStory','INFO','Delete userstory successfully [ID=52]');
INSERT INTO logging VALUES('513','2014-10-17 07:57:22','admin','Agileone','UserStory','INFO','Delete userstory successfully [ID=51]');
INSERT INTO logging VALUES('514','2014-10-17 07:57:28','denny','Agileone','UserStory','INFO','Add userstory successfully [ID=54]');
INSERT INTO logging VALUES('515','2014-10-17 07:57:29','admin','Agileone','UserStory','INFO','Update userstory successfully [ID=50]');
INSERT INTO logging VALUES('516','2014-10-17 07:57:30','admin','Agileone','Task','INFO','Add task successfully [ID=16]');
INSERT INTO logging VALUES('517','2014-10-17 07:57:32','admin','Agileone','UserStory','INFO','Delete userstory successfully [ID=53]');
INSERT INTO logging VALUES('518','2014-10-17 07:57:38','admin','Agileone','Project','INFO','Update project successfully [ID=1]');
INSERT INTO logging VALUES('519','2014-10-17 07:57:40','admin','Agileone','Project','INFO','Update project successfully [ID=1]');
INSERT INTO logging VALUES('520','2014-10-17 07:57:41','admin','Agileone','Task','INFO','Add task successfully [ID=17]');
INSERT INTO logging VALUES('521','2014-10-17 07:57:42','admin','Agileone','UserStory','INFO','Delete userstory successfully [ID=54]');
INSERT INTO logging VALUES('522','2014-10-17 07:57:43','admin','Agileone','Proposal','INFO','Delete proposal successfully [ID=19]');
INSERT INTO logging VALUES('523','2014-10-17 07:57:43','admin','Agileone','UserStory','INFO','Add userstory successfully [ID=55]');
INSERT INTO logging VALUES('524','2014-10-17 07:57:44','admin','Agileone','UserStory','INFO','Delete userstory successfully [ID=50]');
INSERT INTO logging VALUES('525','2014-10-17 07:57:45','admin','Agileone','Proposal','INFO','Delete proposal successfully [ID=18]');
INSERT INTO logging VALUES('526','2014-10-17 07:57:46','admin','Agileone','UserStory','INFO','Update userstory successfully [ID=44]');
INSERT INTO logging VALUES('527','2014-10-17 07:57:46','admin','Agileone','UserStory','INFO','Delete userstory successfully [ID=49]');
INSERT INTO logging VALUES('528','2014-10-17 07:57:48','admin','Agileone','UserStory','INFO','Delete userstory successfully [ID=46]');
INSERT INTO logging VALUES('529','2014-10-17 07:57:50','admin','Agileone','UserStory','INFO','Delete userstory successfully [ID=45]');
INSERT INTO logging VALUES('530','2014-10-17 07:57:52','admin','Agileone','UserStory','INFO','Delete userstory successfully [ID=44]');
INSERT INTO logging VALUES('531','2014-10-17 07:57:52','admin','Agileone','UserStory','INFO','Add userstory successfully [ID=56]');
INSERT INTO logging VALUES('532','2014-10-17 07:58:00','denny','Agileone','UserStory','INFO','Add userstory successfully [ID=57]');
INSERT INTO logging VALUES('533','2014-10-17 07:58:02','denny','Agileone','UserStory','INFO','Add userstory successfully [ID=58]');
INSERT INTO logging VALUES('534','2014-10-17 07:58:07','admin','Agileone','Task','INFO','Add task successfully [ID=18]');
INSERT INTO logging VALUES('535','2014-10-17 07:58:12','admin','Agileone','UserStory','INFO','Update userstory successfully [ID=55]');
INSERT INTO logging VALUES('536','2014-10-17 07:58:15','admin','Agileone','Knowledge','INFO','Delete knowledge successfully [ID=18]');
INSERT INTO logging VALUES('537','2014-10-17 07:58:17','admin','Agileone','Notice','INFO','Add notice successfully [ID=34]');
INSERT INTO logging VALUES('538','2014-10-17 07:58:20','admin','Agileone','UserStory','INFO','Delete userstory successfully [ID=58]');
INSERT INTO logging VALUES('539','2014-10-17 07:58:21','admin','Agileone','UserStory','INFO','Delete userstory successfully [ID=57]');
INSERT INTO logging VALUES('540','2014-10-17 07:58:22','admin','Agileone','UserStory','INFO','Delete userstory successfully [ID=56]');
INSERT INTO logging VALUES('541','2014-10-17 07:58:26','admin','Agileone','UserStory','INFO','Add userstory successfully [ID=59]');
INSERT INTO logging VALUES('542','2014-10-17 07:58:28','admin','Agileone','UserStory','INFO','Add userstory successfully [ID=60]');
INSERT INTO logging VALUES('543','2014-10-17 07:58:28','admin','Agileone','UserStory','INFO','Delete userstory successfully [ID=55]');
INSERT INTO logging VALUES('544','2014-10-17 07:58:34','admin','Agileone','UserStory','INFO','Delete userstory successfully [ID=59]');
INSERT INTO logging VALUES('545','2014-10-17 07:58:34','admin','Agileone','UserStory','INFO','Delete userstory successfully [ID=60]');
INSERT INTO logging VALUES('546','2014-10-17 07:58:45','admin','Agileone','Task','INFO','Add task successfully [ID=19]');
INSERT INTO logging VALUES('547','2014-10-17 07:58:49','admin','Agileone','Knowledge','INFO','Update knowledge successfully [ID=3]');
INSERT INTO logging VALUES('548','2014-10-17 07:58:53','admin','Agileone','UserStory','INFO','Add userstory successfully [ID=61]');
INSERT INTO logging VALUES('549','2014-10-17 07:58:54','admin','Agileone','Proposal','INFO','Delete proposal successfully [ID=17]');
INSERT INTO logging VALUES('550','2014-10-17 07:58:56','admin','Agileone','Proposal','INFO','Delete proposal successfully [ID=16]');
INSERT INTO logging VALUES('551','2014-10-17 07:58:58','admin','Agileone','Proposal','INFO','Delete proposal successfully [ID=15]');
INSERT INTO logging VALUES('552','2014-10-17 07:59:00','admin','Agileone','Proposal','INFO','Delete proposal successfully [ID=14]');
INSERT INTO logging VALUES('553','2014-10-17 07:59:02','admin','Agileone','Proposal','INFO','Delete proposal successfully [ID=13]');
INSERT INTO logging VALUES('554','2014-10-17 07:59:02','admin','Agileone','UserStory','INFO','Add userstory successfully [ID=62]');
INSERT INTO logging VALUES('555','2014-10-17 07:59:03','admin','Agileone','Notice','INFO','Add notice successfully [ID=35]');
INSERT INTO logging VALUES('556','2014-10-17 07:59:04','admin','Agileone','Proposal','INFO','Delete proposal successfully [ID=12]');
INSERT INTO logging VALUES('557','2014-10-17 07:59:04','denny','Agileone','UserStory','INFO','Add userstory successfully [ID=63]');
INSERT INTO logging VALUES('558','2014-10-17 07:59:06','admin','Agileone','Proposal','INFO','Delete proposal successfully [ID=11]');
INSERT INTO logging VALUES('559','2014-10-17 07:59:07','admin','Agileone','Proposal','INFO','Delete proposal successfully [ID=9]');
INSERT INTO logging VALUES('560','2014-10-17 07:59:10','admin','Agileone','Proposal','INFO','Delete proposal successfully [ID=10]');
INSERT INTO logging VALUES('561','2014-10-17 07:59:14','admin','Agileone','Notice','INFO','Update notice successfully [ID=34]');
INSERT INTO logging VALUES('562','2014-10-17 07:59:23','admin','Agileone','UserStory','INFO','Update userstory successfully [ID=61]');
INSERT INTO logging VALUES('563','2014-10-17 07:59:24','admin','Agileone','UserStory','INFO','Update userstory successfully [ID=61]');
INSERT INTO logging VALUES('564','2014-10-17 07:59:24','denny','Agileone','UserStory','INFO','Add userstory successfully [ID=64]');
INSERT INTO logging VALUES('565','2014-10-17 07:59:24','admin','Agileone','UserStory','ERROR','Update userstory unsuccessfully [ID=61]');
INSERT INTO logging VALUES('566','2014-10-17 07:59:25','admin','Agileone','UserStory','INFO','Delete userstory successfully [ID=63]');
INSERT INTO logging VALUES('567','2014-10-17 07:59:25','admin','Agileone','UserStory','INFO','Update userstory successfully [ID=61]');
INSERT INTO logging VALUES('568','2014-10-17 07:59:27','admin','Agileone','UserStory','INFO','Delete userstory successfully [ID=62]');
INSERT INTO logging VALUES('569','2014-10-17 07:59:29','admin','Agileone','UserStory','ERROR','Update userstory unsuccessfully [ID=62]');
INSERT INTO logging VALUES('570','2014-10-17 07:59:29','admin','Agileone','UserStory','INFO','Delete userstory successfully [ID=61]');
INSERT INTO logging VALUES('571','2014-10-17 07:59:30','admin','Agileone','UserStory','ERROR','Update userstory unsuccessfully [ID=62]');
INSERT INTO logging VALUES('572','2014-10-17 07:59:31','admin','Agileone','UserStory','ERROR','Update userstory unsuccessfully [ID=62]');
INSERT INTO logging VALUES('573','2014-10-17 07:59:32','admin','Agileone','UserStory','ERROR','Update userstory unsuccessfully [ID=62]');
INSERT INTO logging VALUES('574','2014-10-17 07:59:32','admin','Agileone','UserStory','ERROR','Update userstory unsuccessfully [ID=62]');
INSERT INTO logging VALUES('575','2014-10-17 07:59:33','denny','Agileone','UserStory','INFO','Add userstory successfully [ID=65]');
INSERT INTO logging VALUES('576','2014-10-17 07:59:34','denny','Agileone','UserStory','INFO','Add userstory successfully [ID=66]');
INSERT INTO logging VALUES('577','2014-10-17 07:59:34','admin','Agileone','UserStory','ERROR','Update userstory unsuccessfully [ID=62]');
INSERT INTO logging VALUES('578','2014-10-17 07:59:41','admin','Agileone','UserStory','INFO','Add userstory successfully [ID=67]');
INSERT INTO logging VALUES('579','2014-10-17 07:59:44','admin','Agileone','UserStory','INFO','Delete userstory successfully [ID=66]');
INSERT INTO logging VALUES('580','2014-10-17 07:59:44','admin','Agileone','Minutes','INFO','Delete minutes successfully [ID=1]');
INSERT INTO logging VALUES('581','2014-10-17 07:59:46','admin','Agileone','UserStory','INFO','Delete userstory successfully [ID=65]');
INSERT INTO logging VALUES('582','2014-10-17 07:59:48','admin','Agileone','UserStory','INFO','Delete userstory successfully [ID=64]');
INSERT INTO logging VALUES('583','2014-10-17 07:59:50','admin','System','Admin','WARN','Set default language to [en]');
INSERT INTO logging VALUES('584','2014-10-17 07:59:50','skrillex','System','System','INFO','User logout successfully [skrillex]');
INSERT INTO logging VALUES('585','2014-10-17 07:59:57','admin','Agileone','UserStory','INFO','Delete userstory successfully [ID=67]');
INSERT INTO logging VALUES('586','2014-10-17 07:59:57','denny','Agileone','UserStory','INFO','Add userstory successfully [ID=68]');
INSERT INTO logging VALUES('587','2014-10-17 07:59:57','skrillex','Agileone','System','INFO','User login successfully [skrillex] - 192.168.4.138');
INSERT INTO logging VALUES('588','2014-10-17 07:59:58','denny','Agileone','UserStory','INFO','Add userstory successfully [ID=69]');
INSERT INTO logging VALUES('589','2014-10-17 08:00:00','admin','Agileone','Notice','INFO','Update notice successfully [ID=34]');
INSERT INTO logging VALUES('590','2014-10-17 08:00:04','denny','Agileone','System','INFO','User logout successfully [denny]');
INSERT INTO logging VALUES('591','2014-10-17 08:00:04','admin','Agileone','UserStory','INFO','Delete userstory successfully [ID=69]');
INSERT INTO logging VALUES('592','2014-10-17 08:00:07','admin','Agileone','UserStory','INFO','Delete userstory successfully [ID=68]');
INSERT INTO logging VALUES('593','2014-10-17 08:00:11','admin','Agileone','Task','INFO','Add task successfully [ID=20]');
INSERT INTO logging VALUES('594','2014-10-17 08:00:11','denny','Agileone','System','INFO','User login successfully [Denny] - 192.168.4.113');
INSERT INTO logging VALUES('595','2014-10-17 08:00:11','admin','System','Admin','WARN','Set default language to [zh]');
INSERT INTO logging VALUES('596','2014-10-17 08:00:16','admin','Agileone','UserStory','INFO','Add userstory successfully [ID=70]');
INSERT INTO logging VALUES('597','2014-10-17 08:00:19','admin','Agileone','UserStory','ERROR','Update userstory unsuccessfully [ID=67]');
INSERT INTO logging VALUES('598','2014-10-17 08:00:21','admin','Agileone','UserStory','ERROR','Update userstory unsuccessfully [ID=67]');
INSERT INTO logging VALUES('599','2014-10-17 08:00:23','admin','Agileone','UserStory','ERROR','Update userstory unsuccessfully [ID=67]');
INSERT INTO logging VALUES('600','2014-10-17 08:00:24','admin','Agileone','UserStory','ERROR','Update userstory unsuccessfully [ID=67]');
INSERT INTO logging VALUES('601','2014-10-17 08:00:34','admin','Agileone','UserStory','INFO','Add userstory successfully [ID=71]');
INSERT INTO logging VALUES('602','2014-10-17 08:00:36','admin','Agileone','UserStory','INFO','Delete userstory successfully [ID=70]');
INSERT INTO logging VALUES('603','2014-10-17 08:00:39','admin','Agileone','UserStory','INFO','Delete userstory successfully [ID=71]');
INSERT INTO logging VALUES('604','2014-10-17 08:00:46','admin','Agileone','System','INFO','User logout successfully [admin]');
INSERT INTO logging VALUES('605','2014-10-17 08:00:49','admin','Agileone','UserStory','INFO','Add userstory successfully [ID=72]');
INSERT INTO logging VALUES('606','2014-10-17 08:00:53','admin','Agileone','System','INFO','User login successfully [admin] - 192.168.4.165');
INSERT INTO logging VALUES('607','2014-10-17 08:00:58','admin','Agileone','Defect','INFO','Update task status to finished [ID=19]');
INSERT INTO logging VALUES('608','2014-10-17 08:00:59','admin','Agileone','Defect','INFO','Update task status to finished [ID=18]');
INSERT INTO logging VALUES('609','2014-10-17 08:01:02','denny','Agileone','UserStory','INFO','Add userstory successfully [ID=73]');
INSERT INTO logging VALUES('610','2014-10-17 08:01:06','admin','Agileone','Task','INFO','Add task successfully [ID=21]');
INSERT INTO logging VALUES('611','2014-10-17 08:01:10','admin','Agileone','Task','INFO','Add task successfully [ID=22]');
INSERT INTO logging VALUES('612','2014-10-17 08:01:12','admin','Agileone','Task','INFO','Add task successfully [ID=23]');
INSERT INTO logging VALUES('613','2014-10-17 08:01:18','denny','Agileone','UserStory','INFO','Add userstory successfully [ID=74]');
INSERT INTO logging VALUES('614','2014-10-17 08:01:24','admin','Agileone','UserStory','ERROR','Update userstory unsuccessfully [ID=67]');
INSERT INTO logging VALUES('615','2014-10-17 08:01:25','admin','Agileone','UserStory','ERROR','Update userstory unsuccessfully [ID=67]');
INSERT INTO logging VALUES('616','2014-10-17 08:01:25','admin','Agileone','UserStory','ERROR','Update userstory unsuccessfully [ID=67]');
INSERT INTO logging VALUES('617','2014-10-17 08:01:28','admin','Agileone','System','INFO','User login successfully [admin] - 192.168.4.116');
INSERT INTO logging VALUES('618','2014-10-17 08:01:30','denny','Agileone','UserStory','INFO','Add userstory successfully [ID=75]');
INSERT INTO logging VALUES('619','2014-10-17 08:01:32','admin','Agileone','UserStory','INFO','Delete userstory successfully [ID=73]');
INSERT INTO logging VALUES('620','2014-10-17 08:01:33','admin','Agileone','UserStory','INFO','Add userstory successfully [ID=76]');
INSERT INTO logging VALUES('621','2014-10-17 08:01:33','admin','Agileone','UserStory','ERROR','Update userstory unsuccessfully [ID=61]');
INSERT INTO logging VALUES('622','2014-10-17 08:01:34','admin','Agileone','UserStory','INFO','Delete userstory successfully [ID=74]');
INSERT INTO logging VALUES('623','2014-10-17 08:01:37','admin','Agileone','UserStory','ERROR','Update userstory unsuccessfully [ID=61]');
INSERT INTO logging VALUES('624','2014-10-17 08:01:38','admin','Agileone','UserStory','ERROR','Update userstory unsuccessfully [ID=61]');
INSERT INTO logging VALUES('625','2014-10-17 08:01:40','admin','Agileone','UserStory','INFO','Delete userstory successfully [ID=76]');
INSERT INTO logging VALUES('626','2014-10-17 08:01:41','admin','Agileone','UserStory','INFO','Add userstory successfully [ID=77]');
INSERT INTO logging VALUES('627','2014-10-17 08:01:41','admin','Agileone','UserStory','INFO','Delete userstory successfully [ID=75]');
INSERT INTO logging VALUES('628','2014-10-17 08:01:42','admin','Agileone','UserStory','INFO','Delete userstory successfully [ID=72]');
INSERT INTO logging VALUES('629','2014-10-17 08:01:43','denny','Agileone','UserStory','INFO','Add userstory successfully [ID=78]');
INSERT INTO logging VALUES('630','2014-10-17 08:01:44','admin','Agileone','UserStory','ERROR','Update userstory unsuccessfully [ID=62]');
INSERT INTO logging VALUES('631','2014-10-17 08:01:45','admin','Agileone','UserStory','INFO','Delete userstory successfully [ID=77]');
INSERT INTO logging VALUES('632','2014-10-17 08:01:45','admin','Agileone','UserStory','INFO','Add userstory successfully [ID=79]');
INSERT INTO logging VALUES('633','2014-10-17 08:01:47','admin','Agileone','UserStory','ERROR','Update userstory unsuccessfully [ID=62]');
INSERT INTO logging VALUES('634','2014-10-17 08:01:47','admin','Agileone','UserStory','INFO','Delete userstory successfully [ID=78]');
INSERT INTO logging VALUES('635','2014-10-17 08:01:51','admin','Agileone','UserStory','INFO','Add userstory successfully [ID=80]');
INSERT INTO logging VALUES('636','2014-10-17 08:01:55','admin','Agileone','UserStory','ERROR','Update userstory unsuccessfully [ID=61]');
INSERT INTO logging VALUES('637','2014-10-17 08:01:55','admin','Agileone','UserStory','INFO','Delete userstory successfully [ID=79]');
INSERT INTO logging VALUES('638','2014-10-17 08:01:56','admin','Agileone','UserStory','ERROR','Update userstory unsuccessfully [ID=61]');
INSERT INTO logging VALUES('639','2014-10-17 08:01:56','admin','Agileone','UserStory','ERROR','Update userstory unsuccessfully [ID=61]');
INSERT INTO logging VALUES('640','2014-10-17 08:01:57','admin','Agileone','UserStory','ERROR','Update userstory unsuccessfully [ID=61]');
INSERT INTO logging VALUES('641','2014-10-17 08:01:57','admin','Agileone','UserStory','ERROR','Update userstory unsuccessfully [ID=61]');
INSERT INTO logging VALUES('642','2014-10-17 08:01:58','admin','Agileone','UserStory','ERROR','Update userstory unsuccessfully [ID=61]');
INSERT INTO logging VALUES('643','2014-10-17 08:01:58','admin','Agileone','UserStory','ERROR','Update userstory unsuccessfully [ID=61]');
INSERT INTO logging VALUES('644','2014-10-17 08:01:59','admin','Agileone','UserStory','ERROR','Update userstory unsuccessfully [ID=61]');
INSERT INTO logging VALUES('645','2014-10-17 08:01:59','admin','Agileone','UserStory','ERROR','Update userstory unsuccessfully [ID=61]');
INSERT INTO logging VALUES('646','2014-10-17 08:02:00','admin','Agileone','UserStory','ERROR','Update userstory unsuccessfully [ID=61]');
INSERT INTO logging VALUES('647','2014-10-17 08:02:00','admin','Agileone','UserStory','ERROR','Update userstory unsuccessfully [ID=61]');
INSERT INTO logging VALUES('648','2014-10-17 08:02:01','admin','Agileone','UserStory','ERROR','Update userstory unsuccessfully [ID=61]');
INSERT INTO logging VALUES('649','2014-10-17 08:02:01','admin','Agileone','UserStory','ERROR','Update userstory unsuccessfully [ID=61]');
INSERT INTO logging VALUES('650','2014-10-17 08:02:01','admin','Agileone','UserStory','ERROR','Update userstory unsuccessfully [ID=61]');
INSERT INTO logging VALUES('651','2014-10-17 08:02:02','admin','Agileone','UserStory','ERROR','Update userstory unsuccessfully [ID=61]');
INSERT INTO logging VALUES('652','2014-10-17 08:02:02','skrillex','Agileone','Knowledge','INFO','Add knowledge successfully [ID=19]');
INSERT INTO logging VALUES('653','2014-10-17 08:02:03','admin','Agileone','UserStory','ERROR','Update userstory unsuccessfully [ID=61]');
INSERT INTO logging VALUES('654','2014-10-17 08:02:04','admin','Agileone','UserStory','ERROR','Update userstory unsuccessfully [ID=61]');
INSERT INTO logging VALUES('655','2014-10-17 08:02:05','admin','Agileone','UserStory','ERROR','Update userstory unsuccessfully [ID=61]');
INSERT INTO logging VALUES('656','2014-10-17 08:02:05','admin','Agileone','UserStory','ERROR','Update userstory unsuccessfully [ID=61]');
INSERT INTO logging VALUES('657','2014-10-17 08:02:05','admin','Agileone','UserStory','ERROR','Update userstory unsuccessfully [ID=61]');
INSERT INTO logging VALUES('658','2014-10-17 08:02:06','admin','Agileone','UserStory','ERROR','Update userstory unsuccessfully [ID=61]');
INSERT INTO logging VALUES('659','2014-10-17 08:02:06','admin','Agileone','UserStory','ERROR','Update userstory unsuccessfully [ID=61]');
INSERT INTO logging VALUES('660','2014-10-17 08:02:07','admin','Agileone','UserStory','ERROR','Update userstory unsuccessfully [ID=61]');
INSERT INTO logging VALUES('661','2014-10-17 08:02:07','admin','Agileone','UserStory','ERROR','Update userstory unsuccessfully [ID=61]');
INSERT INTO logging VALUES('662','2014-10-17 08:02:18','admin','Agileone','UserStory','INFO','Add userstory successfully [ID=81]');
INSERT INTO logging VALUES('663','2014-10-17 08:02:26','denny','Agileone','UserStory','INFO','Add userstory successfully [ID=82]');
INSERT INTO logging VALUES('664','2014-10-17 08:02:27','admin','Agileone','UserStory','INFO','Add userstory successfully [ID=83]');
INSERT INTO logging VALUES('665','2014-10-17 08:02:28','admin','Agileone','UserStory','INFO','Delete userstory successfully [ID=81]');
INSERT INTO logging VALUES('666','2014-10-17 08:02:30','admin','Agileone','UserStory','INFO','Add userstory successfully [ID=84]');
INSERT INTO logging VALUES('667','2014-10-17 08:02:35','admin','Agileone','Notice','INFO','Update notice successfully [ID=15]');
INSERT INTO logging VALUES('668','2014-10-17 08:02:36','admin','Agileone','Notice','INFO','Update notice successfully [ID=15]');
INSERT INTO logging VALUES('669','2014-10-17 08:02:37','admin','Agileone','Notice','INFO','Update notice successfully [ID=15]');
INSERT INTO logging VALUES('670','2014-10-17 08:02:42','admin','Agileone','Notice','INFO','Update notice successfully [ID=15]');
INSERT INTO logging VALUES('671','2014-10-17 08:02:42','admin','Agileone','Notice','ERROR','Update notice unsuccessfully [ID=15]');
INSERT INTO logging VALUES('672','2014-10-17 08:02:43','admin','Agileone','Notice','INFO','Update notice successfully [ID=15]');
INSERT INTO logging VALUES('673','2014-10-17 08:02:43','admin','Agileone','Notice','ERROR','Update notice unsuccessfully [ID=15]');
INSERT INTO logging VALUES('674','2014-10-17 08:02:44','admin','Agileone','Notice','INFO','Update notice successfully [ID=15]');
INSERT INTO logging VALUES('675','2014-10-17 08:02:44','admin','Agileone','Notice','ERROR','Update notice unsuccessfully [ID=15]');
INSERT INTO logging VALUES('676','2014-10-17 08:02:44','admin','Agileone','Notice','ERROR','Update notice unsuccessfully [ID=15]');
INSERT INTO logging VALUES('677','2014-10-17 08:02:45','admin','Agileone','Notice','INFO','Update notice successfully [ID=15]');
INSERT INTO logging VALUES('678','2014-10-17 08:02:45','admin','Agileone','Notice','ERROR','Update notice unsuccessfully [ID=15]');
INSERT INTO logging VALUES('679','2014-10-17 08:02:46','admin','Agileone','Notice','INFO','Update notice successfully [ID=15]');
INSERT INTO logging VALUES('680','2014-10-17 08:02:49','admin','Agileone','UserStory','INFO','Add userstory successfully [ID=85]');
INSERT INTO logging VALUES('681','2014-10-17 08:02:49','admin','Agileone','UserStory','INFO','Add userstory successfully [ID=86]');
INSERT INTO logging VALUES('682','2014-10-17 08:02:54','admin','Agileone','UserStory','INFO','Add userstory successfully [ID=87]');
INSERT INTO logging VALUES('683','2014-10-17 08:02:56','admin','Agileone','UserStory','INFO','Add userstory successfully [ID=88]');
INSERT INTO logging VALUES('684','2014-10-17 08:03:07','admin','Agileone','UserStory','INFO','Add userstory successfully [ID=89]');
INSERT INTO logging VALUES('685','2014-10-17 08:03:11','admin','Agileone','Task','INFO','Add task successfully [ID=24]');
INSERT INTO logging VALUES('686','2014-10-17 08:03:12','admin','Agileone','UserStory','INFO','Delete userstory successfully [ID=89]');
INSERT INTO logging VALUES('687','2014-10-17 08:03:15','admin','Agileone','UserStory','INFO','Add userstory successfully [ID=90]');
INSERT INTO logging VALUES('688','2014-10-17 08:03:15','admin','Agileone','Task','INFO','Delete task successfully [ID=24]');
INSERT INTO logging VALUES('689','2014-10-17 08:03:17','admin','Agileone','UserStory','INFO','Add userstory successfully [ID=91]');
INSERT INTO logging VALUES('690','2014-10-17 08:03:18','admin','Agileone','UserStory','INFO','Add userstory successfully [ID=92]');
INSERT INTO logging VALUES('691','2014-10-17 08:03:21','admin','Agileone','UserStory','INFO','Delete userstory successfully [ID=88]');
INSERT INTO logging VALUES('692','2014-10-17 08:03:22','admin','Agileone','UserStory','INFO','Delete userstory successfully [ID=87]');
INSERT INTO logging VALUES('693','2014-10-17 08:03:24','admin','Agileone','UserStory','INFO','Delete userstory successfully [ID=85]');
INSERT INTO logging VALUES('694','2014-10-17 08:03:24','admin','Agileone','UserStory','INFO','Delete userstory successfully [ID=90]');
INSERT INTO logging VALUES('695','2014-10-17 08:03:25','admin','Agileone','UserStory','INFO','Add userstory successfully [ID=93]');
INSERT INTO logging VALUES('696','2014-10-17 08:03:26','skrillex','Agileone','Notice','INFO','Add notice successfully [ID=36]');
INSERT INTO logging VALUES('697','2014-10-17 08:03:30','admin','Agileone','UserStory','INFO','Add userstory successfully [ID=94]');
INSERT INTO logging VALUES('698','2014-10-17 08:03:30','admin','Agileone','UserStory','INFO','Delete userstory successfully [ID=93]');
INSERT INTO logging VALUES('699','2014-10-17 08:03:30','admin','Agileone','UserStory','INFO','Delete userstory successfully [ID=92]');
INSERT INTO logging VALUES('700','2014-10-17 08:03:34','admin','Agileone','System','INFO','User login successfully ['or userid=1--'] - 192.168.4.143');
INSERT INTO logging VALUES('701','2014-10-17 08:03:34','admin','Agileone','UserStory','INFO','Delete userstory successfully [ID=91]');
INSERT INTO logging VALUES('702','2014-10-17 08:03:35','admin','Agileone','UserStory','INFO','Delete userstory successfully [ID=84]');
INSERT INTO logging VALUES('703','2014-10-17 08:03:35','admin','Agileone','UserStory','INFO','Add userstory successfully [ID=95]');
INSERT INTO logging VALUES('704','2014-10-17 08:03:36','admin','Agileone','UserStory','INFO','Delete userstory successfully [ID=83]');
INSERT INTO logging VALUES('705','2014-10-17 08:03:37','admin','Agileone','UserStory','INFO','Delete userstory successfully [ID=82]');
INSERT INTO logging VALUES('706','2014-10-17 08:03:38','admin','Agileone','Notice','INFO','Update notice successfully [ID=15]');
INSERT INTO logging VALUES('707','2014-10-17 08:03:38','admin','Agileone','UserStory','INFO','Delete userstory successfully [ID=80]');
INSERT INTO logging VALUES('708','2014-10-17 08:03:39','admin','Agileone','UserStory','INFO','Add userstory successfully [ID=96]');
INSERT INTO logging VALUES('709','2014-10-17 08:03:39','admin','Agileone','Notice','INFO','Update notice successfully [ID=15]');
INSERT INTO logging VALUES('710','2014-10-17 08:03:39','admin','Agileone','Notice','ERROR','Update notice unsuccessfully [ID=15]');
INSERT INTO logging VALUES('711','2014-10-17 08:03:40','admin','Agileone','Notice','INFO','Update notice successfully [ID=15]');
INSERT INTO logging VALUES('712','2014-10-17 08:03:40','admin','Agileone','Notice','ERROR','Update notice unsuccessfully [ID=15]');
INSERT INTO logging VALUES('713','2014-10-17 08:03:40','admin','Agileone','Notice','ERROR','Update notice unsuccessfully [ID=15]');
INSERT INTO logging VALUES('714','2014-10-17 08:03:42','admin','Agileone','UserStory','INFO','Delete userstory successfully [ID=96]');
INSERT INTO logging VALUES('715','2014-10-17 08:03:42','admin','Agileone','UserStory','INFO','Delete userstory successfully [ID=86]');
INSERT INTO logging VALUES('716','2014-10-17 08:03:42','admin','Agileone','UserStory','INFO','Delete userstory successfully [ID=94]');
INSERT INTO logging VALUES('717','2014-10-17 08:03:44','admin','Agileone','UserStory','INFO','Add userstory successfully [ID=97]');
INSERT INTO logging VALUES('718','2014-10-17 08:03:44','admin','Agileone','Defect','INFO','Update task status to finished [ID=16]');
INSERT INTO logging VALUES('719','2014-10-17 08:03:45','admin','Agileone','UserStory','INFO','Delete userstory successfully [ID=95]');
INSERT INTO logging VALUES('720','2014-10-17 08:03:47','admin','Agileone','UserStory','INFO','Delete userstory successfully [ID=97]');
INSERT INTO logging VALUES('721','2014-10-17 08:03:58','admin','Agileone','UserStory','INFO','Add userstory successfully [ID=98]');
INSERT INTO logging VALUES('722','2014-10-17 08:04:07','denny','Agileone','TestCase','INFO','Add testcase successfully [ID=7]');
INSERT INTO logging VALUES('723','2014-10-17 08:04:12','admin','Agileone','UserStory','ERROR','Update userstory unsuccessfully [ID=61]');
INSERT INTO logging VALUES('724','2014-10-17 08:04:16','admin','Agileone','Task','INFO','Add task successfully [ID=25]');
INSERT INTO logging VALUES('725','2014-10-17 08:04:20','admin','Agileone','UserStory','INFO','Add userstory successfully [ID=99]');
INSERT INTO logging VALUES('726','2014-10-17 08:04:21','admin','Agileone','System','INFO','User login successfully [admin] - 192.168.4.122');
INSERT INTO logging VALUES('727','2014-10-17 08:04:23','admin','Agileone','Task','INFO','Add task successfully [ID=26]');
INSERT INTO logging VALUES('728','2014-10-17 08:04:28','admin','Agileone','Task','INFO','Add task successfully [ID=27]');
INSERT INTO logging VALUES('729','2014-10-17 08:04:30','admin','Agileone','UserStory','ERROR','Update userstory unsuccessfully [ID=61]');
INSERT INTO logging VALUES('730','2014-10-17 08:04:31','admin','Agileone','UserStory','ERROR','Update userstory unsuccessfully [ID=61]');
INSERT INTO logging VALUES('731','2014-10-17 08:04:32','denny','Agileone','TestCase','INFO','Add testcase successfully [ID=8]');
INSERT INTO logging VALUES('732','2014-10-17 08:04:32','admin','Agileone','UserStory','INFO','Add userstory successfully [ID=100]');
INSERT INTO logging VALUES('733','2014-10-17 08:04:45','admin','Agileone','System','INFO','User login successfully ['or userid=1--'] - 192.168.4.143');
INSERT INTO logging VALUES('734','2014-10-17 08:04:45','admin','Agileone','UserStory','INFO','Add userstory successfully [ID=101]');
INSERT INTO logging VALUES('735','2014-10-17 08:04:47','admin','Agileone','Notice','INFO','Update notice successfully [ID=36]');
INSERT INTO logging VALUES('736','2014-10-17 08:04:53','admin','Agileone','UserStory','INFO','Add userstory successfully [ID=102]');
INSERT INTO logging VALUES('737','2014-10-17 08:04:56','admin','Agileone','UserStory','INFO','Add userstory successfully [ID=103]');
INSERT INTO logging VALUES('738','2014-10-17 08:04:58','admin','Agileone','UserStory','INFO','Delete userstory successfully [ID=102]');
INSERT INTO logging VALUES('739','2014-10-17 08:04:59','admin','Agileone','Notice','INFO','Delete notice successfully [ID=36]');
INSERT INTO logging VALUES('740','2014-10-17 08:05:00','admin','Agileone','UserStory','INFO','Delete userstory successfully [ID=101]');
INSERT INTO logging VALUES('741','2014-10-17 08:05:02','admin','Agileone','Notice','INFO','Delete notice successfully [ID=35]');
INSERT INTO logging VALUES('742','2014-10-17 08:05:02','admin','Agileone','Notice','INFO','Delete notice successfully [ID=34]');
INSERT INTO logging VALUES('743','2014-10-17 08:05:08','admin','Agileone','Notice','ERROR','Update notice unsuccessfully [ID=36]');
INSERT INTO logging VALUES('744','2014-10-17 08:05:09','admin','Agileone','UserStory','INFO','Delete userstory successfully [ID=103]');
INSERT INTO logging VALUES('745','2014-10-17 08:05:10','admin','Agileone','Task','INFO','Add task successfully [ID=28]');
INSERT INTO logging VALUES('746','2014-10-17 08:05:11','admin','Agileone','UserStory','INFO','Delete userstory successfully [ID=98]');
INSERT INTO logging VALUES('747','2014-10-17 08:05:11','admin','Agileone','UserStory','INFO','Add userstory successfully [ID=104]');
INSERT INTO logging VALUES('748','2014-10-17 08:05:13','admin','Agileone','UserStory','INFO','Delete userstory successfully [ID=99]');
INSERT INTO logging VALUES('749','2014-10-17 08:05:14','admin','Agileone','Notice','ERROR','Update notice unsuccessfully [ID=36]');
INSERT INTO logging VALUES('750','2014-10-17 08:05:14','admin','Agileone','UserStory','INFO','Add userstory successfully [ID=105]');
INSERT INTO logging VALUES('751','2014-10-17 08:05:15','admin','Agileone','UserStory','INFO','Delete userstory successfully [ID=100]');
INSERT INTO logging VALUES('752','2014-10-17 08:05:21','admin','Agileone','UserStory','INFO','Delete userstory successfully [ID=105]');
INSERT INTO logging VALUES('753','2014-10-17 08:05:21','admin','Agileone','UserStory','INFO','Add userstory successfully [ID=106]');
INSERT INTO logging VALUES('754','2014-10-17 08:05:22','admin','Agileone','UserStory','INFO','Add userstory successfully [ID=107]');
INSERT INTO logging VALUES('755','2014-10-17 08:05:23','admin','Agileone','UserStory','INFO','Delete userstory successfully [ID=104]');
INSERT INTO logging VALUES('756','2014-10-17 08:05:25','admin','Agileone','UserStory','INFO','Delete userstory successfully [ID=106]');
INSERT INTO logging VALUES('757','2014-10-17 08:05:25','admin','Agileone','Spec','INFO','Add specification successfully [ID=5]');
INSERT INTO logging VALUES('758','2014-10-17 08:05:29','admin','Agileone','UserStory','INFO','Delete userstory successfully [ID=107]');
INSERT INTO logging VALUES('759','2014-10-17 08:05:36','admin','Agileone','UserStory','INFO','Add userstory successfully [ID=108]');
INSERT INTO logging VALUES('760','2014-10-17 08:05:41','admin','Agileone','Spec','INFO','Update specification successfully [ID=5]');
INSERT INTO logging VALUES('761','2014-10-17 08:05:42','admin','Agileone','UserStory','INFO','Add userstory successfully [ID=109]');
INSERT INTO logging VALUES('762','2014-10-17 08:05:44','admin','Agileone','Spec','INFO','Update specification successfully [ID=5]');
INSERT INTO logging VALUES('763','2014-10-17 08:05:45','admin','Agileone','Spec','INFO','Update specification successfully [ID=5]');
INSERT INTO logging VALUES('764','2014-10-17 08:05:47','admin','Agileone','UserStory','INFO','Add userstory successfully [ID=110]');
INSERT INTO logging VALUES('765','2014-10-17 08:05:50','admin','Agileone','Spec','INFO','Update specification successfully [ID=5]');
INSERT INTO logging VALUES('766','2014-10-17 08:05:51','admin','Agileone','UserStory','INFO','Add userstory successfully [ID=111]');
INSERT INTO logging VALUES('767','2014-10-17 08:05:56','admin','Agileone','UserStory','INFO','Delete userstory successfully [ID=108]');
INSERT INTO logging VALUES('768','2014-10-17 08:05:56','admin','Agileone','UserStory','INFO','Add userstory successfully [ID=112]');
INSERT INTO logging VALUES('769','2014-10-17 08:05:57','admin','Agileone','UserStory','INFO','Delete userstory successfully [ID=111]');
INSERT INTO logging VALUES('770','2014-10-17 08:06:00','admin','Agileone','UserStory','ERROR','Update userstory unsuccessfully [ID=108]');
INSERT INTO logging VALUES('771','2014-10-17 08:06:01','admin','Agileone','UserStory','INFO','Add userstory successfully [ID=113]');
INSERT INTO logging VALUES('772','2014-10-17 08:06:02','admin','Agileone','UserStory','ERROR','Update userstory unsuccessfully [ID=108]');
INSERT INTO logging VALUES('773','2014-10-17 08:06:06','admin','Agileone','UserStory','INFO','Add userstory successfully [ID=114]');
INSERT INTO logging VALUES('774','2014-10-17 08:06:06','denny','Agileone','TestCase','INFO','Delete testcase successfully [ID=7]');
INSERT INTO logging VALUES('775','2014-10-17 08:06:07','admin','Agileone','System','INFO','User logout successfully [admin]');
INSERT INTO logging VALUES('776','2014-10-17 08:06:08','admin','Agileone','UserStory','INFO','Delete userstory successfully [ID=110]');
INSERT INTO logging VALUES('777','2014-10-17 08:06:08','admin','Agileone','UserStory','ERROR','Update userstory unsuccessfully [ID=108]');
INSERT INTO logging VALUES('778','2014-10-17 08:06:10','admin','Agileone','UserStory','INFO','Add userstory successfully [ID=115]');
INSERT INTO logging VALUES('779','2014-10-17 08:06:11','admin','Agileone','UserStory','INFO','Delete userstory successfully [ID=109]');
INSERT INTO logging VALUES('780','2014-10-17 08:06:11','admin','Agileone','UserStory','ERROR','Update userstory unsuccessfully [ID=108]');
INSERT INTO logging VALUES('781','2014-10-17 08:06:12','admin','Agileone','UserStory','ERROR','Update userstory unsuccessfully [ID=108]');
INSERT INTO logging VALUES('782','2014-10-17 08:06:12','admin','Agileone','UserStory','ERROR','Update userstory unsuccessfully [ID=108]');
INSERT INTO logging VALUES('783','2014-10-17 08:06:12','admin','Agileone','UserStory','INFO','Delete userstory successfully [ID=112]');
INSERT INTO logging VALUES('784','2014-10-17 08:06:13','admin','Agileone','UserStory','ERROR','Update userstory unsuccessfully [ID=108]');
INSERT INTO logging VALUES('785','2014-10-17 08:06:14','admin','Agileone','UserStory','ERROR','Update userstory unsuccessfully [ID=108]');
INSERT INTO logging VALUES('786','2014-10-17 08:06:15','admin','Agileone','UserStory','ERROR','Update userstory unsuccessfully [ID=108]');
INSERT INTO logging VALUES('787','2014-10-17 08:06:15','admin','Agileone','UserStory','ERROR','Update userstory unsuccessfully [ID=108]');
INSERT INTO logging VALUES('788','2014-10-17 08:06:15','admin','Agileone','UserStory','ERROR','Update userstory unsuccessfully [ID=108]');
INSERT INTO logging VALUES('789','2014-10-17 08:06:16','admin','Agileone','UserStory','ERROR','Update userstory unsuccessfully [ID=108]');
INSERT INTO logging VALUES('790','2014-10-17 08:06:16','admin','Agileone','UserStory','INFO','Add userstory successfully [ID=116]');
INSERT INTO logging VALUES('791','2014-10-17 08:06:17','admin','Agileone','UserStory','ERROR','Update userstory unsuccessfully [ID=108]');
INSERT INTO logging VALUES('792','2014-10-17 08:06:17','admin','Agileone','UserStory','ERROR','Update userstory unsuccessfully [ID=108]');
INSERT INTO logging VALUES('793','2014-10-17 08:06:18','admin','Agileone','UserStory','ERROR','Update userstory unsuccessfully [ID=108]');
INSERT INTO logging VALUES('794','2014-10-17 08:06:18','admin','Agileone','UserStory','INFO','Delete userstory successfully [ID=113]');
INSERT INTO logging VALUES('795','2014-10-17 08:06:18','admin','Agileone','Notice','INFO','Delete notice successfully [ID=25]');
INSERT INTO logging VALUES('796','2014-10-17 08:06:18','admin','Agileone','UserStory','INFO','Add userstory successfully [ID=117]');
INSERT INTO logging VALUES('797','2014-10-17 08:06:19','denny','Agileone','UserStory','INFO','Add userstory successfully [ID=118]');
INSERT INTO logging VALUES('798','2014-10-17 08:06:19','admin','Agileone','UserStory','ERROR','Update userstory unsuccessfully [ID=108]');
INSERT INTO logging VALUES('799','2014-10-17 08:06:19','admin','Agileone','Notice','INFO','Delete notice successfully [ID=24]');
INSERT INTO logging VALUES('800','2014-10-17 08:06:19','admin','Agileone','UserStory','ERROR','Update userstory unsuccessfully [ID=108]');
INSERT INTO logging VALUES('801','2014-10-17 08:06:20','admin','Agileone','Notice','INFO','Delete notice successfully [ID=23]');
INSERT INTO logging VALUES('802','2014-10-17 08:06:20','admin','Agileone','Notice','INFO','Delete notice successfully [ID=22]');
INSERT INTO logging VALUES('803','2014-10-17 08:06:21','admin','Agileone','Notice','INFO','Delete notice successfully [ID=21]');
INSERT INTO logging VALUES('804','2014-10-17 08:06:21','admin','Agileone','Notice','INFO','Delete notice successfully [ID=20]');
INSERT INTO logging VALUES('805','2014-10-17 08:06:21','admin','Agileone','UserStory','INFO','Add userstory successfully [ID=119]');
INSERT INTO logging VALUES('806','2014-10-17 08:06:21','admin','Agileone','System','INFO','User login successfully [admin] - 192.168.4.115');
INSERT INTO logging VALUES('807','2014-10-17 08:06:21','admin','Agileone','Notice','INFO','Delete notice successfully [ID=19]');
INSERT INTO logging VALUES('808','2014-10-17 08:06:22','admin','Agileone','Notice','INFO','Delete notice successfully [ID=18]');
INSERT INTO logging VALUES('809','2014-10-17 08:06:22','admin','Agileone','Notice','INFO','Delete notice successfully [ID=17]');
INSERT INTO logging VALUES('810','2014-10-17 08:06:23','admin','Agileone','Notice','INFO','Delete notice successfully [ID=15]');
INSERT INTO logging VALUES('811','2014-10-17 08:06:23','denny','Agileone','TestCase','INFO','Delete testcase successfully [ID=8]');
INSERT INTO logging VALUES('812','2014-10-17 08:06:23','admin','Agileone','Notice','INFO','Delete notice successfully [ID=14]');
INSERT INTO logging VALUES('813','2014-10-17 08:06:23','admin','Agileone','Notice','INFO','Delete notice successfully [ID=13]');
INSERT INTO logging VALUES('814','2014-10-17 08:06:24','admin','Agileone','Notice','INFO','Delete notice successfully [ID=7]');
INSERT INTO logging VALUES('815','2014-10-17 08:06:24','admin','Agileone','UserStory','INFO','Add userstory successfully [ID=120]');
INSERT INTO logging VALUES('816','2014-10-17 08:06:26','admin','Agileone','UserStory','INFO','Add userstory successfully [ID=121]');
INSERT INTO logging VALUES('817','2014-10-17 08:06:26','admin','Agileone','Notice','INFO','Add notice successfully [ID=37]');
INSERT INTO logging VALUES('818','2014-10-17 08:06:27','admin','Agileone','UserStory','INFO','Add userstory successfully [ID=122]');
INSERT INTO logging VALUES('819','2014-10-17 08:06:31','admin','Agileone','Spec','INFO','Delete specification successfully [ID=5]');
INSERT INTO logging VALUES('820','2014-10-17 08:06:34','admin','Agileone','Knowledge','INFO','Delete knowledge successfully [ID=19]');
INSERT INTO logging VALUES('821','2014-10-17 08:06:35','admin','Agileone','UserStory','INFO','Add userstory successfully [ID=123]');
INSERT INTO logging VALUES('822','2014-10-17 08:06:41','admin','Agileone','Spec','INFO','Delete specification successfully [ID=3]');
INSERT INTO logging VALUES('823','2014-10-17 08:06:42','admin','Agileone','Spec','INFO','Delete specification successfully [ID=2]');
INSERT INTO logging VALUES('824','2014-10-17 08:06:43','admin','Agileone','UserStory','INFO','Delete userstory successfully [ID=121]');
INSERT INTO logging VALUES('825','2014-10-17 08:06:44','admin','Agileone','UserStory','INFO','Add userstory successfully [ID=124]');
INSERT INTO logging VALUES('826','2014-10-17 08:06:44','admin','Agileone','UserStory','INFO','Add userstory successfully [ID=125]');
INSERT INTO logging VALUES('827','2014-10-17 08:06:46','admin','Agileone','UserStory','INFO','Add userstory successfully [ID=126]');
INSERT INTO logging VALUES('828','2014-10-17 08:06:50','admin','Agileone','Spec','INFO','Delete specification successfully [ID=1]');
INSERT INTO logging VALUES('829','2014-10-17 08:06:53','admin','Agileone','UserStory','INFO','Add userstory successfully [ID=127]');
INSERT INTO logging VALUES('830','2014-10-17 08:06:53','admin','Agileone','UserStory','INFO','Update userstory successfully [ID=120]');
INSERT INTO logging VALUES('831','2014-10-17 08:06:56','admin','Agileone','Task','INFO','Add task successfully [ID=29]');
INSERT INTO logging VALUES('832','2014-10-17 08:06:58','admin','Agileone','Task','INFO','Add task successfully [ID=30]');
INSERT INTO logging VALUES('833','2014-10-17 08:06:58','admin','Agileone','UserStory','INFO','Add userstory successfully [ID=128]');
INSERT INTO logging VALUES('834','2014-10-17 08:07:01','admin','Agileone','Task','INFO','Add task successfully [ID=31]');
INSERT INTO logging VALUES('835','2014-10-17 08:07:07','admin','Agileone','UserStory','INFO','Add userstory successfully [ID=129]');
INSERT INTO logging VALUES('836','2014-10-17 08:07:08','admin','Agileone','UserStory','INFO','Update userstory successfully [ID=114]');
INSERT INTO logging VALUES('837','2014-10-17 08:07:08','admin','Agileone','UserStory','INFO','Add userstory successfully [ID=130]');
INSERT INTO logging VALUES('838','2014-10-17 08:07:09','admin','Agileone','UserStory','INFO','Delete userstory successfully [ID=125]');
INSERT INTO logging VALUES('839','2014-10-17 08:07:23','admin','Agileone','UserStory','INFO','Add userstory successfully [ID=131]');
INSERT INTO logging VALUES('840','2014-10-17 08:07:24','admin','Agileone','UserStory','INFO','Add userstory successfully [ID=132]');
INSERT INTO logging VALUES('841','2014-10-17 08:07:29','denny','Agileone','UserStory','INFO','Add userstory successfully [ID=133]');
INSERT INTO logging VALUES('842','2014-10-17 08:07:30','admin','Agileone','UserStory','INFO','Update userstory successfully [ID=114]');
INSERT INTO logging VALUES('843','2014-10-17 08:07:42','admin','Agileone','UserStory','INFO','Add userstory successfully [ID=134]');
INSERT INTO logging VALUES('844','2014-10-17 08:07:45','admin','Agileone','UserStory','INFO','Delete userstory successfully [ID=128]');
INSERT INTO logging VALUES('845','2014-10-17 08:07:45','admin','Agileone','UserStory','INFO','Update userstory successfully [ID=124]');
INSERT INTO logging VALUES('846','2014-10-17 08:07:47','admin','Agileone','UserStory','INFO','Update userstory successfully [ID=114]');
INSERT INTO logging VALUES('847','2014-10-17 08:08:04','admin','Agileone','UserStory','INFO','Update userstory successfully [ID=131]');
INSERT INTO logging VALUES('848','2014-10-17 08:08:05','admin','Agileone','UserStory','INFO','Add userstory successfully [ID=135]');
INSERT INTO logging VALUES('849','2014-10-17 08:08:10','admin','Agileone','UserStory','INFO','Update userstory successfully [ID=130]');
INSERT INTO logging VALUES('850','2014-10-17 08:08:14','admin','Agileone','UserStory','INFO','Add userstory successfully [ID=136]');
INSERT INTO logging VALUES('851','2014-10-17 08:08:22','admin','Agileone','UserStory','INFO','Update userstory successfully [ID=114]');
INSERT INTO logging VALUES('852','2014-10-17 08:08:29','denny','Agileone','UserStory','INFO','Add userstory successfully [ID=137]');
INSERT INTO logging VALUES('853','2014-10-17 08:08:30','admin','Agileone','Task','INFO','Add task successfully [ID=32]');
INSERT INTO logging VALUES('854','2014-10-17 08:08:35','skrillex','Agileone','System','INFO','User login successfully [skrillex] - 192.168.4.138');
INSERT INTO logging VALUES('855','2014-10-17 08:08:39','admin','Agileone','Task','INFO','Add task successfully [ID=33]');
INSERT INTO logging VALUES('856','2014-10-17 08:09:07','admin','Agileone','UserStory','INFO','Delete userstory successfully [ID=137]');
INSERT INTO logging VALUES('857','2014-10-17 08:09:08','admin','Agileone','UserStory','INFO','Delete userstory successfully [ID=136]');
INSERT INTO logging VALUES('858','2014-10-17 08:09:09','admin','Agileone','UserStory','INFO','Delete userstory successfully [ID=135]');
INSERT INTO logging VALUES('859','2014-10-17 08:09:09','admin','Agileone','UserStory','INFO','Delete userstory successfully [ID=134]');
INSERT INTO logging VALUES('860','2014-10-17 08:09:10','admin','Agileone','UserStory','INFO','Delete userstory successfully [ID=133]');
INSERT INTO logging VALUES('861','2014-10-17 08:09:10','admin','Agileone','UserStory','INFO','Delete userstory successfully [ID=132]');
INSERT INTO logging VALUES('862','2014-10-17 08:09:10','admin','Agileone','UserStory','INFO','Delete userstory successfully [ID=131]');
INSERT INTO logging VALUES('863','2014-10-17 08:09:11','admin','Agileone','UserStory','INFO','Delete userstory successfully [ID=130]');
INSERT INTO logging VALUES('864','2014-10-17 08:09:12','admin','Agileone','UserStory','INFO','Delete userstory successfully [ID=129]');
INSERT INTO logging VALUES('865','2014-10-17 08:09:15','admin','Agileone','UserStory','INFO','Delete userstory successfully [ID=120]');
INSERT INTO logging VALUES('866','2014-10-17 08:09:16','admin','Agileone','UserStory','INFO','Delete userstory successfully [ID=122]');
INSERT INTO logging VALUES('867','2014-10-17 08:09:17','admin','Agileone','UserStory','INFO','Delete userstory successfully [ID=123]');
INSERT INTO logging VALUES('868','2014-10-17 08:09:17','admin','Agileone','UserStory','INFO','Delete userstory successfully [ID=124]');
INSERT INTO logging VALUES('869','2014-10-17 08:09:18','admin','Agileone','UserStory','INFO','Delete userstory successfully [ID=126]');
INSERT INTO logging VALUES('870','2014-10-17 08:09:18','admin','Agileone','UserStory','INFO','Delete userstory successfully [ID=127]');
INSERT INTO logging VALUES('871','2014-10-17 08:09:21','admin','Agileone','UserStory','INFO','Delete userstory successfully [ID=118]');
INSERT INTO logging VALUES('872','2014-10-17 08:09:22','admin','Agileone','UserStory','INFO','Delete userstory successfully [ID=116]');
INSERT INTO logging VALUES('873','2014-10-17 08:09:23','admin','Agileone','UserStory','INFO','Add userstory successfully [ID=138]');
INSERT INTO logging VALUES('874','2014-10-17 08:09:24','admin','Agileone','UserStory','INFO','Add userstory successfully [ID=139]');
INSERT INTO logging VALUES('875','2014-10-17 08:09:27','admin','Agileone','UserStory','INFO','Delete userstory successfully [ID=138]');
INSERT INTO logging VALUES('876','2014-10-17 08:09:28','admin','Agileone','UserStory','ERROR','Update userstory unsuccessfully [ID=103]');
INSERT INTO logging VALUES('877','2014-10-17 08:09:31','admin','Agileone','UserStory','INFO','Add userstory successfully [ID=140]');
INSERT INTO logging VALUES('878','2014-10-17 08:09:33','admin','Agileone','UserStory','ERROR','Update userstory unsuccessfully [ID=103]');
INSERT INTO logging VALUES('879','2014-10-17 08:09:33','admin','Agileone','UserStory','INFO','Update userstory successfully [ID=114]');
INSERT INTO logging VALUES('880','2014-10-17 08:09:35','admin','Agileone','UserStory','INFO','Add userstory successfully [ID=141]');
INSERT INTO logging VALUES('881','2014-10-17 08:09:50','admin','Agileone','UserStory','INFO','Add userstory successfully [ID=142]');
INSERT INTO logging VALUES('882','2014-10-17 08:09:51','admin','Agileone','UserStory','INFO','Update userstory successfully [ID=141]');
INSERT INTO logging VALUES('883','2014-10-17 08:09:57','admin','Agileone','UserStory','INFO','Add userstory successfully [ID=143]');
INSERT INTO logging VALUES('884','2014-10-17 08:10:11','admin','Agileone','UserStory','INFO','Add userstory successfully [ID=144]');
INSERT INTO logging VALUES('885','2014-10-17 08:10:13','admin','Agileone','UserStory','INFO','Add userstory successfully [ID=145]');
INSERT INTO logging VALUES('886','2014-10-17 08:10:17','admin','Agileone','UserStory','INFO','Update userstory successfully [ID=141]');
INSERT INTO logging VALUES('887','2014-10-17 08:10:17','admin','Agileone','UserStory','INFO','Add userstory successfully [ID=146]');
INSERT INTO logging VALUES('888','2014-10-17 08:10:18','admin','Agileone','UserStory','INFO','Update userstory successfully [ID=141]');
INSERT INTO logging VALUES('889','2014-10-17 08:10:19','admin','Agileone','UserStory','INFO','Update userstory successfully [ID=141]');
INSERT INTO logging VALUES('890','2014-10-17 08:10:21','admin','Agileone','UserStory','INFO','Add userstory successfully [ID=147]');
INSERT INTO logging VALUES('891','2014-10-17 08:10:26','admin','Agileone','UserStory','INFO','Update userstory successfully [ID=141]');
INSERT INTO logging VALUES('892','2014-10-17 08:10:28','admin','Agileone','Task','INFO','Add task successfully [ID=34]');
INSERT INTO logging VALUES('893','2014-10-17 08:10:28','admin','Agileone','UserStory','INFO','Delete userstory successfully [ID=144]');
INSERT INTO logging VALUES('894','2014-10-17 08:10:29','admin','Agileone','UserStory','INFO','Update userstory successfully [ID=141]');
INSERT INTO logging VALUES('895','2014-10-17 08:10:31','admin','Agileone','UserStory','INFO','Delete userstory successfully [ID=142]');
INSERT INTO logging VALUES('896','2014-10-17 08:10:31','admin','Agileone','UserStory','INFO','Add userstory successfully [ID=148]');
INSERT INTO logging VALUES('897','2014-10-17 08:10:34','admin','Agileone','UserStory','INFO','Delete userstory successfully [ID=146]');
INSERT INTO logging VALUES('898','2014-10-17 08:10:34','admin','Agileone','UserStory','INFO','Update userstory successfully [ID=141]');
INSERT INTO logging VALUES('899','2014-10-17 08:10:42','denny','Agileone','System','INFO','User logout successfully [denny]');
INSERT INTO logging VALUES('900','2014-10-17 08:10:42','admin','Agileone','UserStory','INFO','Delete userstory successfully [ID=141]');
INSERT INTO logging VALUES('901','2014-10-17 08:10:44','admin','Agileone','System','INFO','User login successfully [admin] - 192.168.4.104');
INSERT INTO logging VALUES('902','2014-10-17 08:10:52','admin','Agileone','UserStory','INFO','Delete userstory successfully [ID=140]');
INSERT INTO logging VALUES('903','2014-10-17 08:10:54','admin','Agileone','UserStory','INFO','Add userstory successfully [ID=149]');
INSERT INTO logging VALUES('904','2014-10-17 08:10:56','admin','Agileone','UserStory','INFO','Add userstory successfully [ID=150]');
INSERT INTO logging VALUES('905','2014-10-17 08:10:56','admin','Agileone','UserStory','INFO','Delete userstory successfully [ID=114]');
INSERT INTO logging VALUES('906','2014-10-17 08:10:56','admin','Agileone','UserStory','INFO','Add userstory successfully [ID=151]');
INSERT INTO logging VALUES('907','2014-10-17 08:10:57','admin','Agileone','UserStory','INFO','Delete userstory successfully [ID=115]');
INSERT INTO logging VALUES('908','2014-10-17 08:10:57','admin','Agileone','System','INFO','User login successfully [ADMIN] - 192.168.4.143');
INSERT INTO logging VALUES('909','2014-10-17 08:10:57','admin','Agileone','UserStory','INFO','Delete userstory successfully [ID=117]');
INSERT INTO logging VALUES('910','2014-10-17 08:10:58','admin','Agileone','UserStory','INFO','Delete userstory successfully [ID=119]');
INSERT INTO logging VALUES('911','2014-10-17 08:10:58','admin','Agileone','UserStory','INFO','Delete userstory successfully [ID=139]');
INSERT INTO logging VALUES('912','2014-10-17 08:10:59','admin','Agileone','UserStory','INFO','Delete userstory successfully [ID=151]');
INSERT INTO logging VALUES('913','2014-10-17 08:11:00','admin','Agileone','UserStory','INFO','Delete userstory successfully [ID=143]');
INSERT INTO logging VALUES('914','2014-10-17 08:11:01','admin','Agileone','UserStory','INFO','Delete userstory successfully [ID=145]');
INSERT INTO logging VALUES('915','2014-10-17 08:11:02','admin','Agileone','UserStory','INFO','Delete userstory successfully [ID=147]');
INSERT INTO logging VALUES('916','2014-10-17 08:11:03','denny','Agileone','UserStory','INFO','Add userstory successfully [ID=152]');
INSERT INTO logging VALUES('917','2014-10-17 08:11:03','admin','Agileone','UserStory','INFO','Delete userstory successfully [ID=148]');
INSERT INTO logging VALUES('918','2014-10-17 08:11:06','admin','Agileone','UserStory','INFO','Add userstory successfully [ID=153]');
INSERT INTO logging VALUES('919','2014-10-17 08:11:07','admin','Agileone','UserStory','INFO','Add userstory successfully [ID=154]');
INSERT INTO logging VALUES('920','2014-10-17 08:11:08','admin','Agileone','UserStory','INFO','Delete userstory successfully [ID=152]');
INSERT INTO logging VALUES('921','2014-10-17 08:11:09','admin','Agileone','UserStory','INFO','Delete userstory successfully [ID=150]');
INSERT INTO logging VALUES('922','2014-10-17 08:11:09','admin','Agileone','Task','INFO','Add task successfully [ID=35]');
INSERT INTO logging VALUES('923','2014-10-17 08:11:10','admin','Agileone','UserStory','INFO','Delete userstory successfully [ID=149]');
INSERT INTO logging VALUES('924','2014-10-17 08:11:11','admin','Agileone','UserStory','INFO','Delete userstory successfully [ID=153]');
INSERT INTO logging VALUES('925','2014-10-17 08:11:12','admin','Agileone','Task','INFO','Add task successfully [ID=36]');
INSERT INTO logging VALUES('926','2014-10-17 08:11:15','admin','Agileone','UserStory','INFO','Add userstory successfully [ID=155]');
INSERT INTO logging VALUES('927','2014-10-17 08:11:17','denny','Agileone','UserStory','INFO','Add userstory successfully [ID=156]');
INSERT INTO logging VALUES('928','2014-10-17 08:11:17','admin','Agileone','Task','INFO','Add task successfully [ID=37]');
INSERT INTO logging VALUES('929','2014-10-17 08:11:20','admin','Agileone','UserStory','INFO','Delete userstory successfully [ID=155]');
INSERT INTO logging VALUES('930','2014-10-17 08:11:23','admin','Agileone','UserStory','INFO','Delete userstory successfully [ID=154]');
INSERT INTO logging VALUES('931','2014-10-17 08:11:27','admin','Agileone','UserStory','INFO','Add userstory successfully [ID=157]');
INSERT INTO logging VALUES('932','2014-10-17 08:11:39','denny','Agileone','UserStory','INFO','Add userstory successfully [ID=158]');
INSERT INTO logging VALUES('933','2014-10-17 08:11:39','admin','Agileone','UserStory','INFO','Add userstory successfully [ID=159]');
INSERT INTO logging VALUES('934','2014-10-17 08:11:42','denny','Agileone','UserStory','INFO','Add userstory successfully [ID=160]');
INSERT INTO logging VALUES('935','2014-10-17 08:11:52','admin','Agileone','Defect','INFO','Add defect successfully [ID=10]');
INSERT INTO logging VALUES('936','2014-10-17 08:11:55','denny','Agileone','UserStory','INFO','Add userstory successfully [ID=161]');
INSERT INTO logging VALUES('937','2014-10-17 08:11:57','admin','Agileone','System','INFO','User login successfully [admin] - 192.168.4.139');
INSERT INTO logging VALUES('938','2014-10-17 08:12:01','admin','Agileone','UserStory','INFO','Add userstory successfully [ID=162]');
INSERT INTO logging VALUES('939','2014-10-17 08:12:03','denny','Agileone','UserStory','INFO','Update userstory successfully [ID=156]');
INSERT INTO logging VALUES('940','2014-10-17 08:12:08','admin','Agileone','UserStory','INFO','Add userstory successfully [ID=163]');
INSERT INTO logging VALUES('941','2014-10-17 08:12:09','denny','Agileone','UserStory','INFO','Delete userstory successfully [ID=160]');
INSERT INTO logging VALUES('942','2014-10-17 08:12:19','admin','System','System','INFO','User logout successfully [admin]');
INSERT INTO logging VALUES('943','2014-10-17 08:12:21','admin','Agileone','UserStory','INFO','Add userstory successfully [ID=164]');
INSERT INTO logging VALUES('944','2014-10-17 08:12:28','admin','Agileone','UserStory','INFO','Add userstory successfully [ID=165]');
INSERT INTO logging VALUES('945','2014-10-17 08:12:36','admin','Agileone','UserStory','INFO','Add userstory successfully [ID=166]');
INSERT INTO logging VALUES('946','2014-10-17 08:12:36','admin','Agileone','System','INFO','User login successfully [admin] - 192.168.4.112');
INSERT INTO logging VALUES('947','2014-10-17 08:12:40','admin','Agileone','UserStory','INFO','Delete userstory successfully [ID=163]');
INSERT INTO logging VALUES('948','2014-10-17 08:12:41','admin','Agileone','UserStory','ERROR','Update userstory unsuccessfully [ID=148]');
INSERT INTO logging VALUES('949','2014-10-17 08:12:42','admin','Agileone','UserStory','INFO','Delete userstory successfully [ID=161]');
INSERT INTO logging VALUES('950','2014-10-17 08:12:42','admin','Agileone','UserStory','INFO','Delete userstory successfully [ID=158]');
INSERT INTO logging VALUES('951','2014-10-17 08:12:48','admin','Agileone','UserStory','INFO','Delete userstory successfully [ID=166]');
INSERT INTO logging VALUES('952','2014-10-17 08:12:48','admin','Agileone','UserStory','INFO','Delete userstory successfully [ID=164]');
INSERT INTO logging VALUES('953','2014-10-17 08:12:48','admin','System','Admin','INFO','Add customer successfully [ID=2]');
INSERT INTO logging VALUES('954','2014-10-17 08:12:49','admin','Agileone','UserStory','INFO','Add userstory successfully [ID=167]');
INSERT INTO logging VALUES('955','2014-10-17 08:12:50','denny','Agileone','UserStory','INFO','Update userstory successfully [ID=156]');
INSERT INTO logging VALUES('956','2014-10-17 08:12:51','admin','Agileone','UserStory','INFO','Add userstory successfully [ID=168]');
INSERT INTO logging VALUES('957','2014-10-17 08:12:52','admin','Agileone','UserStory','INFO','Add userstory successfully [ID=169]');
INSERT INTO logging VALUES('958','2014-10-17 08:12:52','admin','Agileone','UserStory','INFO','Delete userstory successfully [ID=165]');
INSERT INTO logging VALUES('959','2014-10-17 08:12:53','admin','Agileone','UserStory','INFO','Delete userstory successfully [ID=167]');
INSERT INTO logging VALUES('960','2014-10-17 08:12:54','admin','Agileone','UserStory','INFO','Add userstory successfully [ID=170]');
INSERT INTO logging VALUES('961','2014-10-17 08:12:58','admin','Agileone','UserStory','INFO','Delete userstory successfully [ID=170]');
INSERT INTO logging VALUES('962','2014-10-17 08:12:59','admin','Agileone','UserStory','INFO','Delete userstory successfully [ID=168]');
INSERT INTO logging VALUES('963','2014-10-17 08:13:02','admin','Agileone','UserStory','INFO','Add userstory successfully [ID=171]');
INSERT INTO logging VALUES('964','2014-10-17 08:13:04','admin','Agileone','UserStory','INFO','Delete userstory successfully [ID=169]');
INSERT INTO logging VALUES('965','2014-10-17 08:13:05','admin','Agileone','UserStory','INFO','Delete userstory successfully [ID=156]');
INSERT INTO logging VALUES('966','2014-10-17 08:13:13','admin','Agileone','UserStory','ERROR','Update userstory unsuccessfully [ID=168]');
INSERT INTO logging VALUES('967','2014-10-17 08:13:21','admin','Agileone','UserStory','INFO','Add userstory successfully [ID=172]');
INSERT INTO logging VALUES('968','2014-10-17 08:13:22','admin','System','Admin','INFO','Add customer successfully [ID=3]');
INSERT INTO logging VALUES('969','2014-10-17 08:13:31','admin','Agileone','System','INFO','User logout successfully [admin]');
INSERT INTO logging VALUES('970','2014-10-17 08:13:32','denny','Agileone','UserStory','INFO','Add userstory successfully [ID=173]');
INSERT INTO logging VALUES('971','2014-10-17 08:13:33','admin','Agileone','Spec','INFO','Add specification successfully [ID=6]');
INSERT INTO logging VALUES('972','2014-10-17 08:13:36','denny','Agileone','System','INFO','User login successfully [denny] - 192.168.4.104');
INSERT INTO logging VALUES('973','2014-10-17 08:13:37','admin','Agileone','UserStory','INFO','Add userstory successfully [ID=174]');
INSERT INTO logging VALUES('974','2014-10-17 08:13:44','admin','Agileone','Defect','INFO','Update task status to finished [ID=36]');
INSERT INTO logging VALUES('975','2014-10-17 08:13:50','admin','System','Admin','INFO','Update customer successfully [ID=3]');
INSERT INTO logging VALUES('976','2014-10-17 08:13:59','admin','Agileone','UserStory','INFO','Delete userstory successfully [ID=174]');
INSERT INTO logging VALUES('977','2014-10-17 08:14:00','admin','Agileone','UserStory','INFO','Delete userstory successfully [ID=172]');
INSERT INTO logging VALUES('978','2014-10-17 08:14:01','admin','Agileone','UserStory','INFO','Delete userstory successfully [ID=173]');
INSERT INTO logging VALUES('979','2014-10-17 08:14:06','denny','Agileone','UserStory','INFO','Add userstory successfully [ID=175]');
INSERT INTO logging VALUES('980','2014-10-17 08:14:12','admin','System','Admin','INFO','Update customer successfully [ID=3]');
INSERT INTO logging VALUES('981','2014-10-17 08:14:15','denny','Agileone','UserStory','INFO','Delete userstory successfully [ID=175]');
INSERT INTO logging VALUES('982','2014-10-17 08:14:19','admin','Agileone','UserStory','INFO','Delete userstory successfully [ID=171]');
INSERT INTO logging VALUES('983','2014-10-17 08:14:22','admin','Agileone','UserStory','INFO','Delete userstory successfully [ID=162]');
INSERT INTO logging VALUES('984','2014-10-17 08:14:25','admin','Agileone','UserStory','INFO','Delete userstory successfully [ID=159]');
INSERT INTO logging VALUES('985','2014-10-17 08:14:27','admin','Agileone','UserStory','INFO','Delete userstory successfully [ID=157]');
INSERT INTO logging VALUES('986','2014-10-17 08:14:29','admin','System','System','INFO','User logout successfully [admin]');
INSERT INTO logging VALUES('987','2014-10-17 08:14:39','admin','Agileone','System','INFO','User login successfully [admin] - 192.168.4.146');
INSERT INTO logging VALUES('988','2014-10-17 08:14:42','admin','Agileone','UserStory','INFO','Add userstory successfully [ID=176]');
INSERT INTO logging VALUES('989','2014-10-17 08:14:46','admin','Agileone','UserStory','INFO','Add userstory successfully [ID=177]');
INSERT INTO logging VALUES('990','2014-10-17 08:14:47','denny','Agileone','UserStory','INFO','Add userstory successfully [ID=178]');
INSERT INTO logging VALUES('991','2014-10-17 08:15:03','admin','Agileone','UserStory','INFO','Add userstory successfully [ID=179]');
INSERT INTO logging VALUES('992','2014-10-17 08:15:05','admin','Agileone','UserStory','INFO','Add userstory successfully [ID=180]');
INSERT INTO logging VALUES('993','2014-10-17 08:15:08','admin','Agileone','UserStory','INFO','Add userstory successfully [ID=181]');
INSERT INTO logging VALUES('994','2014-10-17 08:15:17','admin','Agileone','UserStory','INFO','Add userstory successfully [ID=182]');
INSERT INTO logging VALUES('995','2014-10-17 08:15:24','admin','Agileone','UserStory','INFO','Add userstory successfully [ID=183]');
INSERT INTO logging VALUES('996','2014-10-17 08:15:37','admin','Agileone','UserStory','INFO','Add userstory successfully [ID=184]');
INSERT INTO logging VALUES('997','2014-10-17 08:15:38','admin','Agileone','UserStory','INFO','Delete userstory successfully [ID=179]');
INSERT INTO logging VALUES('998','2014-10-17 08:15:44','admin','Agileone','UserStory','INFO','Update userstory successfully [ID=181]');
INSERT INTO logging VALUES('999','2014-10-17 08:15:45','admin','Agileone','UserStory','INFO','Delete userstory successfully [ID=176]');
INSERT INTO logging VALUES('1000','2014-10-17 08:15:45','admin','Agileone','UserStory','INFO','Add userstory successfully [ID=185]');
INSERT INTO logging VALUES('1001','2014-10-17 08:15:47','admin','Agileone','UserStory','INFO','Delete userstory successfully [ID=183]');
INSERT INTO logging VALUES('1002','2014-10-17 08:15:48','admin','Agileone','UserStory','INFO','Add userstory successfully [ID=186]');
INSERT INTO logging VALUES('1003','2014-10-17 08:15:49','admin','Agileone','UserStory','INFO','Delete userstory successfully [ID=182]');
INSERT INTO logging VALUES('1004','2014-10-17 08:15:49','admin','Agileone','UserStory','INFO','Add userstory successfully [ID=187]');
INSERT INTO logging VALUES('1005','2014-10-17 08:15:50','admin','Agileone','UserStory','INFO','Delete userstory successfully [ID=178]');
INSERT INTO logging VALUES('1006','2014-10-17 08:15:51','admin','Agileone','UserStory','INFO','Add userstory successfully [ID=188]');
INSERT INTO logging VALUES('1007','2014-10-17 08:15:51','admin','Agileone','UserStory','INFO','Delete userstory successfully [ID=181]');
INSERT INTO logging VALUES('1008','2014-10-17 08:15:54','admin','Agileone','UserStory','INFO','Add userstory successfully [ID=189]');
INSERT INTO logging VALUES('1009','2014-10-17 08:15:56','admin','Agileone','UserStory','INFO','Delete userstory successfully [ID=188]');
INSERT INTO logging VALUES('1010','2014-10-17 08:15:56','denny','Agileone','UserStory','INFO','Add userstory successfully [ID=190]');
INSERT INTO logging VALUES('1011','2014-10-17 08:16:00','denny','Agileone','Defect','INFO','Add defect successfully [ID=11]');
INSERT INTO logging VALUES('1012','2014-10-17 08:16:00','admin','Agileone','UserStory','INFO','Delete userstory successfully [ID=186]');
INSERT INTO logging VALUES('1013','2014-10-17 08:16:01','admin','Agileone','UserStory','INFO','Delete userstory successfully [ID=185]');
INSERT INTO logging VALUES('1014','2014-10-17 08:16:03','admin','Agileone','UserStory','INFO','Add userstory successfully [ID=191]');
INSERT INTO logging VALUES('1015','2014-10-17 08:16:04','admin','Agileone','UserStory','INFO','Add userstory successfully [ID=192]');
INSERT INTO logging VALUES('1016','2014-10-17 08:16:04','denny','Agileone','UserStory','INFO','Add userstory successfully [ID=193]');
INSERT INTO logging VALUES('1017','2014-10-17 08:16:05','admin','Agileone','UserStory','INFO','Update userstory successfully [ID=184]');
INSERT INTO logging VALUES('1018','2014-10-17 08:16:05','admin','Agileone','UserStory','INFO','Delete userstory successfully [ID=189]');
INSERT INTO logging VALUES('1019','2014-10-17 08:16:07','admin','Agileone','UserStory','INFO','Add userstory successfully [ID=194]');
INSERT INTO logging VALUES('1020','2014-10-17 08:16:08','admin','Agileone','UserStory','INFO','Delete userstory successfully [ID=192]');
INSERT INTO logging VALUES('1021','2014-10-17 08:16:08','admin','Agileone','UserStory','INFO','Delete userstory successfully [ID=184]');
INSERT INTO logging VALUES('1022','2014-10-17 08:16:08','admin','Agileone','UserStory','INFO','Delete userstory successfully [ID=193]');
INSERT INTO logging VALUES('1023','2014-10-17 08:16:09','admin','Agileone','UserStory','ERROR','Update userstory unsuccessfully [ID=184]');
INSERT INTO logging VALUES('1024','2014-10-17 08:16:11','admin','Agileone','UserStory','INFO','Add userstory successfully [ID=195]');
INSERT INTO logging VALUES('1025','2014-10-17 08:16:14','admin','Agileone','UserStory','INFO','Delete userstory successfully [ID=195]');
INSERT INTO logging VALUES('1026','2014-10-17 08:16:21','admin','Agileone','UserStory','INFO','Add userstory successfully [ID=196]');
INSERT INTO logging VALUES('1027','2014-10-17 08:16:24','admin','Agileone','Task','INFO','Add task successfully [ID=38]');
INSERT INTO logging VALUES('1028','2014-10-17 08:16:27','admin','Agileone','UserStory','ERROR','Update userstory unsuccessfully [ID=184]');
INSERT INTO logging VALUES('1029','2014-10-17 08:16:28','admin','Agileone','UserStory','INFO','Add userstory successfully [ID=197]');
INSERT INTO logging VALUES('1030','2014-10-17 08:16:29','admin','Agileone','UserStory','ERROR','Update userstory unsuccessfully [ID=184]');
INSERT INTO logging VALUES('1031','2014-10-17 08:16:29','admin','Agileone','Task','INFO','Add task successfully [ID=39]');
INSERT INTO logging VALUES('1032','2014-10-17 08:16:37','admin','Agileone','UserStory','INFO','Add userstory successfully [ID=198]');
INSERT INTO logging VALUES('1033','2014-10-17 08:16:37','admin','Agileone','TestCase','INFO','Delete testcase successfully [ID=6]');
INSERT INTO logging VALUES('1034','2014-10-17 08:16:42','denny','Agileone','UserStory','INFO','Add userstory successfully [ID=199]');
INSERT INTO logging VALUES('1035','2014-10-17 08:16:44','admin','Agileone','System','INFO','User logout successfully [admin]');
INSERT INTO logging VALUES('1036','2014-10-17 08:16:47','admin','Agileone','UserStory','INFO','Update userstory successfully [ID=180]');
INSERT INTO logging VALUES('1037','2014-10-17 08:16:51','denny','Agileone','UserStory','INFO','Add userstory successfully [ID=200]');
INSERT INTO logging VALUES('1038','2014-10-17 08:16:54','admin','Agileone','UserStory','INFO','Update userstory successfully [ID=191]');
INSERT INTO logging VALUES('1039','2014-10-17 08:16:58','admin','Agileone','UserStory','INFO','Update userstory successfully [ID=180]');
INSERT INTO logging VALUES('1040','2014-10-17 08:17:08','admin','Agileone','UserStory','INFO','Delete userstory successfully [ID=199]');
INSERT INTO logging VALUES('1041','2014-10-17 08:17:08','admin','Agileone','UserStory','INFO','Add userstory successfully [ID=201]');
INSERT INTO logging VALUES('1042','2014-10-17 08:17:09','denny','Agileone','UserStory','INFO','Add userstory successfully [ID=202]');
INSERT INTO logging VALUES('1043','2014-10-17 08:17:11','admin','Agileone','UserStory','INFO','Add userstory successfully [ID=203]');
INSERT INTO logging VALUES('1044','2014-10-17 08:17:13','admin','Agileone','UserStory','INFO','Update userstory successfully [ID=198]');
INSERT INTO logging VALUES('1045','2014-10-17 08:17:16','admin','Agileone','UserStory','INFO','Update userstory successfully [ID=191]');
INSERT INTO logging VALUES('1046','2014-10-17 08:17:19','denny','Agileone','UserStory','INFO','Add userstory successfully [ID=204]');
INSERT INTO logging VALUES('1047','2014-10-17 08:17:20','admin','Agileone','UserStory','INFO','Delete userstory successfully [ID=197]');
INSERT INTO logging VALUES('1048','2014-10-17 08:17:21','admin','Agileone','UserStory','INFO','Delete userstory successfully [ID=177]');
INSERT INTO logging VALUES('1049','2014-10-17 08:17:22','denny','Agileone','UserStory','INFO','Update userstory successfully [ID=200]');
INSERT INTO logging VALUES('1050','2014-10-17 08:17:22','admin','Agileone','UserStory','INFO','Delete userstory successfully [ID=201]');
INSERT INTO logging VALUES('1051','2014-10-17 08:17:23','admin','Agileone','UserStory','INFO','Delete userstory successfully [ID=202]');
INSERT INTO logging VALUES('1052','2014-10-17 08:17:23','admin','Agileone','UserStory','INFO','Delete userstory successfully [ID=203]');
INSERT INTO logging VALUES('1053','2014-10-17 08:17:25','admin','Agileone','UserStory','INFO','Delete userstory successfully [ID=198]');
INSERT INTO logging VALUES('1054','2014-10-17 08:17:26','admin','Agileone','UserStory','INFO','Add userstory successfully [ID=205]');
INSERT INTO logging VALUES('1055','2014-10-17 08:17:30','admin','Agileone','UserStory','INFO','Delete userstory successfully [ID=204]');
INSERT INTO logging VALUES('1056','2014-10-17 08:17:37','admin','Agileone','UserStory','INFO','Add userstory successfully [ID=206]');
INSERT INTO logging VALUES('1057','2014-10-17 08:17:42','admin','Agileone','UserStory','INFO','Delete userstory successfully [ID=206]');
INSERT INTO logging VALUES('1058','2014-10-17 08:17:51','admin','Agileone','UserStory','ERROR','Update userstory unsuccessfully [ID=203]');
INSERT INTO logging VALUES('1059','2014-10-17 08:17:54','admin','Agileone','UserStory','INFO','Add userstory successfully [ID=207]');
INSERT INTO logging VALUES('1060','2014-10-17 08:17:55','admin','Agileone','System','INFO','User login successfully [admin] - 192.168.4.142');
INSERT INTO logging VALUES('1061','2014-10-17 08:17:56','admin','Agileone','UserStory','ERROR','Update userstory unsuccessfully [ID=203]');
INSERT INTO logging VALUES('1062','2014-10-17 08:18:00','admin','Agileone','UserStory','INFO','Add userstory successfully [ID=208]');
INSERT INTO logging VALUES('1063','2014-10-17 08:18:12','admin','Agileone','UserStory','INFO','Add userstory successfully [ID=209]');
INSERT INTO logging VALUES('1064','2014-10-17 08:18:23','admin','Agileone','UserStory','INFO','Add userstory successfully [ID=210]');
INSERT INTO logging VALUES('1065','2014-10-17 08:18:25','admin','Agileone','UserStory','INFO','Add userstory successfully [ID=211]');
INSERT INTO logging VALUES('1066','2014-10-17 08:18:26','denny','Agileone','UserStory','INFO','Add userstory successfully [ID=212]');
INSERT INTO logging VALUES('1067','2014-10-17 08:18:39','admin','Agileone','UserStory','INFO','Delete userstory successfully [ID=212]');
INSERT INTO logging VALUES('1068','2014-10-17 08:18:42','admin','Agileone','UserStory','INFO','Delete userstory successfully [ID=208]');
INSERT INTO logging VALUES('1069','2014-10-17 08:18:43','admin','Agileone','Notice','INFO','Update notice successfully [ID=37]');
INSERT INTO logging VALUES('1070','2014-10-17 08:18:45','admin','Agileone','UserStory','INFO','Update userstory successfully [ID=180]');
INSERT INTO logging VALUES('1071','2014-10-17 08:18:47','admin','Agileone','TestCase','INFO','Add testcase successfully [ID=9]');
INSERT INTO logging VALUES('1072','2014-10-17 08:18:47','admin','Agileone','UserStory','INFO','Add userstory successfully [ID=213]');
INSERT INTO logging VALUES('1073','2014-10-17 08:18:51','admin','Agileone','UserStory','INFO','Delete userstory successfully [ID=210]');
INSERT INTO logging VALUES('1074','2014-10-17 08:18:57','denny','Agileone','System','INFO','User logout successfully [denny]');
INSERT INTO logging VALUES('1075','2014-10-17 08:18:59','admin','Agileone','UserStory','INFO','Delete userstory successfully [ID=213]');
INSERT INTO logging VALUES('1076','2014-10-17 08:18:59','admin','Agileone','UserStory','INFO','Add userstory successfully [ID=214]');
INSERT INTO logging VALUES('1077','2014-10-17 08:19:04','denny','Agileone','UserStory','INFO','Add userstory successfully [ID=215]');
INSERT INTO logging VALUES('1078','2014-10-17 08:19:04','admin','Agileone','UserStory','INFO','Add userstory successfully [ID=216]');
INSERT INTO logging VALUES('1079','2014-10-17 08:19:07','denny','Agileone','System','INFO','User login successfully [denny] - 192.168.4.121');
INSERT INTO logging VALUES('1080','2014-10-17 08:19:08','admin','Agileone','UserStory','INFO','Add userstory successfully [ID=217]');
INSERT INTO logging VALUES('1081','2014-10-17 08:19:11','admin','Agileone','UserStory','INFO','Add userstory successfully [ID=218]');
INSERT INTO logging VALUES('1082','2014-10-17 08:19:16','admin','Agileone','UserStory','INFO','Add userstory successfully [ID=219]');
INSERT INTO logging VALUES('1083','2014-10-17 08:19:19','admin','Agileone','UserStory','INFO','Add userstory successfully [ID=220]');
INSERT INTO logging VALUES('1084','2014-10-17 08:19:22','admin','Agileone','UserStory','INFO','Update userstory successfully [ID=214]');
INSERT INTO logging VALUES('1085','2014-10-17 08:19:25','admin','Agileone','UserStory','INFO','Add userstory successfully [ID=221]');
INSERT INTO logging VALUES('1086','2014-10-17 08:19:25','admin','Agileone','UserStory','INFO','Delete userstory successfully [ID=217]');
INSERT INTO logging VALUES('1087','2014-10-17 08:19:29','admin','Agileone','Notice','INFO','Update notice successfully [ID=37]');
INSERT INTO logging VALUES('1088','2014-10-17 08:19:31','admin','Agileone','Task','INFO','Add task successfully [ID=40]');
INSERT INTO logging VALUES('1089','2014-10-17 08:19:32','denny','Agileone','System','INFO','User login successfully [denny] - 192.168.4.102');
INSERT INTO logging VALUES('1090','2014-10-17 08:19:36','denny','Agileone','System','INFO','User logout successfully [denny]');
INSERT INTO logging VALUES('1091','2014-10-17 08:19:36','admin','Agileone','UserStory','INFO','Add userstory successfully [ID=222]');
INSERT INTO logging VALUES('1092','2014-10-17 08:19:40','admin','Agileone','UserStory','INFO','Add userstory successfully [ID=223]');
INSERT INTO logging VALUES('1093','2014-10-17 08:19:42','admin','Agileone','UserStory','INFO','Update userstory successfully [ID=214]');
INSERT INTO logging VALUES('1094','2014-10-17 08:19:50','admin','Agileone','System','INFO','User login successfully [admin] - 192.168.4.102');
INSERT INTO logging VALUES('1095','2014-10-17 08:19:51','admin','Agileone','UserStory','INFO','Add userstory successfully [ID=224]');
INSERT INTO logging VALUES('1096','2014-10-17 08:19:51','admin','Agileone','UserStory','INFO','Update userstory successfully [ID=221]');
INSERT INTO logging VALUES('1097','2014-10-17 08:19:53','admin','Agileone','Task','INFO','Add task successfully [ID=41]');
INSERT INTO logging VALUES('1098','2014-10-17 08:19:54','admin','Agileone','Task','INFO','Add task successfully [ID=42]');
INSERT INTO logging VALUES('1099','2014-10-17 08:19:56','admin','Agileone','UserStory','INFO','Add userstory successfully [ID=225]');
INSERT INTO logging VALUES('1100','2014-10-17 08:19:57','admin','Agileone','Notice','INFO','Update notice successfully [ID=37]');
INSERT INTO logging VALUES('1101','2014-10-17 08:19:59','admin','Agileone','UserStory','INFO','Add userstory successfully [ID=226]');
INSERT INTO logging VALUES('1102','2014-10-17 08:20:00','admin','Agileone','Task','INFO','Add task successfully [ID=43]');
INSERT INTO logging VALUES('1103','2014-10-17 08:20:01','admin','Agileone','UserStory','INFO','Add userstory successfully [ID=227]');
INSERT INTO logging VALUES('1104','2014-10-17 08:20:03','admin','Agileone','UserStory','INFO','Add userstory successfully [ID=228]');
INSERT INTO logging VALUES('1105','2014-10-17 08:20:04','admin','Agileone','Task','INFO','Add task successfully [ID=44]');
INSERT INTO logging VALUES('1106','2014-10-17 08:20:05','admin','Agileone','UserStory','INFO','Add userstory successfully [ID=229]');
INSERT INTO logging VALUES('1107','2014-10-17 08:20:07','admin','Agileone','UserStory','INFO','Update userstory successfully [ID=221]');
INSERT INTO logging VALUES('1108','2014-10-17 08:20:08','admin','Agileone','UserStory','INFO','Add userstory successfully [ID=230]');
INSERT INTO logging VALUES('1109','2014-10-17 08:20:08','admin','Agileone','Notice','INFO','Update notice successfully [ID=37]');
INSERT INTO logging VALUES('1110','2014-10-17 08:20:10','admin','Agileone','UserStory','INFO','Add userstory successfully [ID=231]');
INSERT INTO logging VALUES('1111','2014-10-17 08:20:11','admin','Agileone','UserStory','INFO','Add userstory successfully [ID=232]');
INSERT INTO logging VALUES('1112','2014-10-17 08:20:13','admin','Agileone','UserStory','INFO','Add userstory successfully [ID=233]');
INSERT INTO logging VALUES('1113','2014-10-17 08:20:15','admin','Agileone','Notice','INFO','Update notice successfully [ID=37]');
INSERT INTO logging VALUES('1114','2014-10-17 08:20:16','admin','Agileone','Task','INFO','Delete task successfully [ID=44]');
INSERT INTO logging VALUES('1115','2014-10-17 08:20:17','admin','Agileone','Task','INFO','Delete task successfully [ID=43]');
INSERT INTO logging VALUES('1116','2014-10-17 08:20:17','admin','Agileone','Task','INFO','Delete task successfully [ID=42]');
INSERT INTO logging VALUES('1117','2014-10-17 08:20:19','admin','Agileone','Notice','INFO','Update notice successfully [ID=37]');
INSERT INTO logging VALUES('1118','2014-10-17 08:20:20','admin','Agileone','Notice','INFO','Update notice successfully [ID=37]');
INSERT INTO logging VALUES('1119','2014-10-17 08:20:20','admin','Agileone','Notice','ERROR','Update notice unsuccessfully [ID=37]');
INSERT INTO logging VALUES('1120','2014-10-17 08:20:21','admin','Agileone','Notice','INFO','Add notice successfully [ID=38]');
INSERT INTO logging VALUES('1121','2014-10-17 08:20:22','admin','Agileone','UserStory','INFO','Add userstory successfully [ID=234]');
INSERT INTO logging VALUES('1122','2014-10-17 08:20:24','admin','Agileone','Notice','INFO','Update notice successfully [ID=37]');
INSERT INTO logging VALUES('1123','2014-10-17 08:20:27','admin','Agileone','UserStory','INFO','Add userstory successfully [ID=235]');
INSERT INTO logging VALUES('1124','2014-10-17 08:20:35','admin','Agileone','UserStory','INFO','Add userstory successfully [ID=236]');
INSERT INTO logging VALUES('1125','2014-10-17 08:20:37','admin','Agileone','UserStory','INFO','Add userstory successfully [ID=237]');
INSERT INTO logging VALUES('1126','2014-10-17 08:20:38','admin','Agileone','UserStory','INFO','Update userstory successfully [ID=221]');
INSERT INTO logging VALUES('1127','2014-10-17 08:20:38','admin','Agileone','UserStory','INFO','Add userstory successfully [ID=238]');
INSERT INTO logging VALUES('1128','2014-10-17 08:20:39','admin','Agileone','Notice','INFO','Update notice successfully [ID=37]');
INSERT INTO logging VALUES('1129','2014-10-17 08:20:40','admin','Agileone','UserStory','INFO','Add userstory successfully [ID=239]');
INSERT INTO logging VALUES('1130','2014-10-17 08:20:41','denny','Agileone','Execution','INFO','Add execution result successfully [ID=13]');
INSERT INTO logging VALUES('1131','2014-10-17 08:20:41','admin','Agileone','UserStory','INFO','Add userstory successfully [ID=240]');
INSERT INTO logging VALUES('1132','2014-10-17 08:20:43','admin','Agileone','UserStory','INFO','Add userstory successfully [ID=241]');
INSERT INTO logging VALUES('1133','2014-10-17 08:20:44','admin','Agileone','UserStory','INFO','Add userstory successfully [ID=242]');
INSERT INTO logging VALUES('1134','2014-10-17 08:20:46','denny','Agileone','Execution','INFO','Add execution result successfully [ID=14]');
INSERT INTO logging VALUES('1135','2014-10-17 08:20:46','admin','Agileone','UserStory','INFO','Add userstory successfully [ID=243]');
INSERT INTO logging VALUES('1136','2014-10-17 08:20:47','denny','Agileone','Execution','INFO','Add execution result successfully [ID=15]');
INSERT INTO logging VALUES('1137','2014-10-17 08:20:47','denny','Agileone','Execution','INFO','Add execution result successfully [ID=16]');
INSERT INTO logging VALUES('1138','2014-10-17 08:20:47','denny','Agileone','Execution','INFO','Add execution result successfully [ID=17]');
INSERT INTO logging VALUES('1139','2014-10-17 08:20:49','admin','Agileone','UserStory','INFO','Add userstory successfully [ID=244]');
INSERT INTO logging VALUES('1140','2014-10-17 08:20:50','denny','Agileone','UserStory','INFO','Add userstory successfully [ID=245]');
INSERT INTO logging VALUES('1141','2014-10-17 08:20:51','admin','Agileone','UserStory','INFO','Add userstory successfully [ID=246]');
INSERT INTO logging VALUES('1142','2014-10-17 08:20:52','admin','Agileone','UserStory','INFO','Add userstory successfully [ID=247]');
INSERT INTO logging VALUES('1143','2014-10-17 08:21:00','admin','Agileone','Notice','INFO','Update notice successfully [ID=37]');
INSERT INTO logging VALUES('1144','2014-10-17 08:21:07','admin','Agileone','UserStory','INFO','Add userstory successfully [ID=248]');
INSERT INTO logging VALUES('1145','2014-10-17 08:21:11','admin','Agileone','UserStory','INFO','Update userstory successfully [ID=224]');
INSERT INTO logging VALUES('1146','2014-10-17 08:21:13','admin','Agileone','UserStory','INFO','Update userstory successfully [ID=224]');
INSERT INTO logging VALUES('1147','2014-10-17 08:21:14','admin','Agileone','UserStory','INFO','Update userstory successfully [ID=224]');
INSERT INTO logging VALUES('1148','2014-10-17 08:21:14','admin','Agileone','UserStory','ERROR','Update userstory unsuccessfully [ID=224]');
INSERT INTO logging VALUES('1149','2014-10-17 08:21:15','admin','Agileone','UserStory','INFO','Add userstory successfully [ID=249]');
INSERT INTO logging VALUES('1150','2014-10-17 08:21:15','admin','Agileone','UserStory','INFO','Update userstory successfully [ID=224]');
INSERT INTO logging VALUES('1151','2014-10-17 08:21:15','admin','Agileone','UserStory','ERROR','Update userstory unsuccessfully [ID=224]');
INSERT INTO logging VALUES('1152','2014-10-17 08:21:15','admin','Agileone','UserStory','ERROR','Update userstory unsuccessfully [ID=224]');
INSERT INTO logging VALUES('1153','2014-10-17 08:21:16','admin','Agileone','UserStory','INFO','Update userstory successfully [ID=224]');
INSERT INTO logging VALUES('1154','2014-10-17 08:21:16','admin','Agileone','UserStory','ERROR','Update userstory unsuccessfully [ID=224]');
INSERT INTO logging VALUES('1155','2014-10-17 08:21:17','admin','Agileone','UserStory','INFO','Update userstory successfully [ID=224]');
INSERT INTO logging VALUES('1156','2014-10-17 08:21:17','admin','Agileone','UserStory','ERROR','Update userstory unsuccessfully [ID=224]');
INSERT INTO logging VALUES('1157','2014-10-17 08:21:18','admin','Agileone','UserStory','INFO','Update userstory successfully [ID=224]');
INSERT INTO logging VALUES('1158','2014-10-17 08:21:18','admin','Agileone','UserStory','ERROR','Update userstory unsuccessfully [ID=224]');
INSERT INTO logging VALUES('1159','2014-10-17 08:21:18','admin','Agileone','UserStory','ERROR','Update userstory unsuccessfully [ID=224]');
INSERT INTO logging VALUES('1160','2014-10-17 08:21:19','admin','Agileone','UserStory','INFO','Update userstory successfully [ID=224]');
INSERT INTO logging VALUES('1161','2014-10-17 08:21:19','admin','Agileone','UserStory','INFO','Update userstory successfully [ID=230]');
INSERT INTO logging VALUES('1162','2014-10-17 08:21:19','admin','Agileone','UserStory','ERROR','Update userstory unsuccessfully [ID=224]');
INSERT INTO logging VALUES('1163','2014-10-17 08:21:19','admin','Agileone','UserStory','INFO','Update userstory successfully [ID=221]');
INSERT INTO logging VALUES('1164','2014-10-17 08:21:19','admin','Agileone','UserStory','ERROR','Update userstory unsuccessfully [ID=224]');
INSERT INTO logging VALUES('1165','2014-10-17 08:21:20','admin','Agileone','UserStory','INFO','Update userstory successfully [ID=224]');
INSERT INTO logging VALUES('1166','2014-10-17 08:21:20','admin','Agileone','UserStory','ERROR','Update userstory unsuccessfully [ID=224]');
INSERT INTO logging VALUES('1167','2014-10-17 08:21:20','admin','Agileone','UserStory','ERROR','Update userstory unsuccessfully [ID=224]');
INSERT INTO logging VALUES('1168','2014-10-17 08:21:24','denny','Agileone','UserStory','INFO','Update userstory successfully [ID=245]');
INSERT INTO logging VALUES('1169','2014-10-17 08:21:29','admin','Agileone','UserStory','INFO','Update userstory successfully [ID=249]');
INSERT INTO logging VALUES('1170','2014-10-17 08:21:39','admin','Agileone','UserStory','INFO','Add userstory successfully [ID=250]');
INSERT INTO logging VALUES('1171','2014-10-17 08:21:40','admin','Agileone','UserStory','INFO','Add userstory successfully [ID=251]');
INSERT INTO logging VALUES('1172','2014-10-17 08:21:42','admin','Agileone','UserStory','INFO','Update userstory successfully [ID=248]');
INSERT INTO logging VALUES('1173','2014-10-17 08:21:43','admin','Agileone','Notice','INFO','Add notice successfully [ID=39]');
INSERT INTO logging VALUES('1174','2014-10-17 08:21:45','admin','Agileone','Notice','INFO','Add notice successfully [ID=40]');
INSERT INTO logging VALUES('1175','2014-10-17 08:21:50','admin','Agileone','UserStory','INFO','Delete userstory successfully [ID=248]');
INSERT INTO logging VALUES('1176','2014-10-17 08:21:51','admin','Agileone','UserStory','ERROR','Update userstory unsuccessfully [ID=248]');
INSERT INTO logging VALUES('1177','2014-10-17 08:22:01','admin','Agileone','UserStory','INFO','Update userstory successfully [ID=194]');
INSERT INTO logging VALUES('1178','2014-10-17 08:22:03','denny','Agileone','UserStory','INFO','Update userstory successfully [ID=245]');
INSERT INTO logging VALUES('1179','2014-10-17 08:22:04','admin','Agileone','UserStory','INFO','Update userstory successfully [ID=194]');
INSERT INTO logging VALUES('1180','2014-10-17 08:22:16','admin','Agileone','UserStory','INFO','Update userstory successfully [ID=236]');
INSERT INTO logging VALUES('1181','2014-10-17 08:22:16','admin','Agileone','UserStory','INFO','Update userstory successfully [ID=194]');
INSERT INTO logging VALUES('1182','2014-10-17 08:22:19','admin','Agileone','UserStory','INFO','Delete userstory successfully [ID=221]');
INSERT INTO logging VALUES('1183','2014-10-17 08:22:20','admin','Agileone','UserStory','INFO','Delete userstory successfully [ID=228]');
INSERT INTO logging VALUES('1184','2014-10-17 08:22:21','admin','Agileone','UserStory','INFO','Update userstory successfully [ID=194]');
INSERT INTO logging VALUES('1185','2014-10-17 08:22:28','admin','Agileone','UserStory','INFO','Delete userstory successfully [ID=214]');
INSERT INTO logging VALUES('1186','2014-10-17 08:22:30','admin','Agileone','UserStory','INFO','Delete userstory successfully [ID=211]');
INSERT INTO logging VALUES('1187','2014-10-17 08:22:35','admin','Agileone','UserStory','INFO','Add userstory successfully [ID=252]');
INSERT INTO logging VALUES('1188','2014-10-17 08:22:36','denny','Agileone','UserStory','INFO','Update userstory successfully [ID=245]');
INSERT INTO logging VALUES('1189','2014-10-17 08:22:41','admin','Agileone','UserStory','INFO','Add userstory successfully [ID=253]');
INSERT INTO logging VALUES('1190','2014-10-17 08:22:59','admin','Agileone','UserStory','INFO','Delete userstory successfully [ID=253]');
INSERT INTO logging VALUES('1191','2014-10-17 08:23:00','admin','Agileone','UserStory','INFO','Delete userstory successfully [ID=252]');
INSERT INTO logging VALUES('1192','2014-10-17 08:23:00','admin','Agileone','UserStory','INFO','Delete userstory successfully [ID=251]');
INSERT INTO logging VALUES('1193','2014-10-17 08:23:01','admin','Agileone','UserStory','INFO','Delete userstory successfully [ID=250]');
INSERT INTO logging VALUES('1194','2014-10-17 08:23:01','admin','Agileone','UserStory','INFO','Delete userstory successfully [ID=249]');
INSERT INTO logging VALUES('1195','2014-10-17 08:23:01','admin','Agileone','UserStory','INFO','Delete userstory successfully [ID=247]');
INSERT INTO logging VALUES('1196','2014-10-17 08:23:03','admin','Agileone','UserStory','INFO','Delete userstory successfully [ID=246]');
INSERT INTO logging VALUES('1197','2014-10-17 08:23:03','admin','Agileone','UserStory','INFO','Delete userstory successfully [ID=245]');
INSERT INTO logging VALUES('1198','2014-10-17 08:23:09','admin','Agileone','UserStory','INFO','Add userstory successfully [ID=254]');
INSERT INTO logging VALUES('1199','2014-10-17 08:23:13','admin','Agileone','Notice','INFO','Delete notice successfully [ID=38]');
INSERT INTO logging VALUES('1200','2014-10-17 08:23:15','admin','Agileone','UserStory','INFO','Add userstory successfully [ID=255]');
INSERT INTO logging VALUES('1201','2014-10-17 08:23:16','admin','Agileone','Notice','INFO','Delete notice successfully [ID=40]');
INSERT INTO logging VALUES('1202','2014-10-17 08:23:17','admin','Agileone','UserStory','INFO','Add userstory successfully [ID=256]');
INSERT INTO logging VALUES('1203','2014-10-17 08:23:22','admin','Agileone','UserStory','INFO','Delete userstory successfully [ID=244]');
INSERT INTO logging VALUES('1204','2014-10-17 08:23:24','admin','Agileone','UserStory','INFO','Delete userstory successfully [ID=242]');
INSERT INTO logging VALUES('1205','2014-10-17 08:23:25','admin','Agileone','UserStory','INFO','Delete userstory successfully [ID=241]');
INSERT INTO logging VALUES('1206','2014-10-17 08:23:25','admin','Agileone','UserStory','INFO','Delete userstory successfully [ID=240]');
INSERT INTO logging VALUES('1207','2014-10-17 08:23:26','admin','Agileone','UserStory','INFO','Delete userstory successfully [ID=239]');
INSERT INTO logging VALUES('1208','2014-10-17 08:23:27','admin','Agileone','UserStory','INFO','Delete userstory successfully [ID=238]');
INSERT INTO logging VALUES('1209','2014-10-17 08:23:28','admin','Agileone','UserStory','INFO','Delete userstory successfully [ID=237]');
INSERT INTO logging VALUES('1210','2014-10-17 08:23:28','admin','Agileone','UserStory','ERROR','Update userstory unsuccessfully [ID=]');
INSERT INTO logging VALUES('1211','2014-10-17 08:23:29','admin','Agileone','UserStory','ERROR','Update userstory unsuccessfully [ID=]');
INSERT INTO logging VALUES('1212','2014-10-17 08:23:29','admin','Agileone','UserStory','INFO','Delete userstory successfully [ID=236]');
INSERT INTO logging VALUES('1213','2014-10-17 08:23:30','admin','Agileone','UserStory','ERROR','Update userstory unsuccessfully [ID=]');
INSERT INTO logging VALUES('1214','2014-10-17 08:23:30','admin','Agileone','UserStory','INFO','Delete userstory successfully [ID=235]');
INSERT INTO logging VALUES('1215','2014-10-17 08:23:30','admin','Agileone','UserStory','ERROR','Update userstory unsuccessfully [ID=]');
INSERT INTO logging VALUES('1216','2014-10-17 08:23:30','admin','Agileone','UserStory','INFO','Delete userstory successfully [ID=243]');
INSERT INTO logging VALUES('1217','2014-10-17 08:23:32','admin','Agileone','UserStory','INFO','Delete userstory successfully [ID=234]');
INSERT INTO logging VALUES('1218','2014-10-17 08:23:33','admin','Agileone','UserStory','INFO','Add userstory successfully [ID=258]');
INSERT INTO logging VALUES('1219','2014-10-17 08:23:33','admin','Agileone','UserStory','INFO','Add userstory successfully [ID=257]');
INSERT INTO logging VALUES('1220','2014-10-17 08:23:33','admin','Agileone','System','INFO','User logout successfully [admin]');
INSERT INTO logging VALUES('1221','2014-10-17 08:23:33','admin','Agileone','UserStory','INFO','Delete userstory successfully [ID=233]');
INSERT INTO logging VALUES('1222','2014-10-17 08:23:34','admin','Agileone','UserStory','INFO','Delete userstory successfully [ID=232]');
INSERT INTO logging VALUES('1223','2014-10-17 08:23:36','admin','Agileone','UserStory','INFO','Delete userstory successfully [ID=257]');
INSERT INTO logging VALUES('1224','2014-10-17 08:23:37','admin','Agileone','UserStory','INFO','Delete userstory successfully [ID=222]');
INSERT INTO logging VALUES('1225','2014-10-17 08:23:37','admin','Agileone','UserStory','INFO','Delete userstory successfully [ID=223]');
INSERT INTO logging VALUES('1226','2014-10-17 08:23:39','admin','Agileone','UserStory','INFO','Delete userstory successfully [ID=224]');
INSERT INTO logging VALUES('1227','2014-10-17 08:23:39','admin','Agileone','UserStory','INFO','Delete userstory successfully [ID=225]');
INSERT INTO logging VALUES('1228','2014-10-17 08:23:40','admin','Agileone','UserStory','INFO','Delete userstory successfully [ID=226]');
INSERT INTO logging VALUES('1229','2014-10-17 08:23:41','admin','Agileone','UserStory','INFO','Delete userstory successfully [ID=227]');
INSERT INTO logging VALUES('1230','2014-10-17 08:23:42','admin','Agileone','UserStory','INFO','Add userstory successfully [ID=259]');
INSERT INTO logging VALUES('1231','2014-10-17 08:23:42','admin','Agileone','UserStory','INFO','Delete userstory successfully [ID=229]');
INSERT INTO logging VALUES('1232','2014-10-17 08:23:43','admin','Agileone','UserStory','INFO','Delete userstory successfully [ID=230]');
INSERT INTO logging VALUES('1233','2014-10-17 08:23:44','admin','Agileone','UserStory','INFO','Add userstory successfully [ID=260]');
INSERT INTO logging VALUES('1234','2014-10-17 08:23:45','admin','Agileone','UserStory','INFO','Delete userstory successfully [ID=231]');
INSERT INTO logging VALUES('1235','2014-10-17 08:23:46','denny','Agileone','System','INFO','User login successfully [denny] - 192.168.4.102');
INSERT INTO logging VALUES('1236','2014-10-17 08:23:48','denny','Agileone','System','INFO','User login successfully [denny] - 192.168.4.104');
INSERT INTO logging VALUES('1237','2014-10-17 08:23:50','admin','Agileone','UserStory','INFO','Add userstory successfully [ID=261]');
INSERT INTO logging VALUES('1238','2014-10-17 08:24:05','admin','Agileone','UserStory','INFO','Add userstory successfully [ID=262]');
INSERT INTO logging VALUES('1239','2014-10-17 08:24:07','admin','Agileone','UserStory','INFO','Add userstory successfully [ID=263]');
INSERT INTO logging VALUES('1240','2014-10-17 08:24:09','admin','Agileone','UserStory','INFO','Add userstory successfully [ID=264]');
INSERT INTO logging VALUES('1241','2014-10-17 08:24:17','admin','Agileone','UserStory','INFO','Add userstory successfully [ID=265]');
INSERT INTO logging VALUES('1242','2014-10-17 08:24:19','admin','Agileone','UserStory','INFO','Delete userstory successfully [ID=264]');
INSERT INTO logging VALUES('1243','2014-10-17 08:24:21','denny','Agileone','UserStory','INFO','Add userstory successfully [ID=266]');
INSERT INTO logging VALUES('1244','2014-10-17 08:24:32','admin','Agileone','Task','INFO','Add task successfully [ID=45]');
INSERT INTO logging VALUES('1245','2014-10-17 08:24:33','admin','Agileone','UserStory','INFO','Add userstory successfully [ID=267]');
INSERT INTO logging VALUES('1246','2014-10-17 08:24:33','denny','Agileone','Task','INFO','Add task successfully [ID=46]');
INSERT INTO logging VALUES('1247','2014-10-17 08:24:36','admin','Agileone','Task','INFO','Add task successfully [ID=47]');
INSERT INTO logging VALUES('1248','2014-10-17 08:24:36','admin','Agileone','TestCase','INFO','Add testcase successfully [ID=10]');
INSERT INTO logging VALUES('1249','2014-10-17 08:24:36','admin','Agileone','Notice','INFO','Add notice successfully [ID=41]');
INSERT INTO logging VALUES('1250','2014-10-17 08:24:37','admin','Agileone','Notice','INFO','Add notice successfully [ID=42]');
INSERT INTO logging VALUES('1251','2014-10-17 08:24:37','admin','Agileone','Notice','INFO','Add notice successfully [ID=43]');
INSERT INTO logging VALUES('1252','2014-10-17 08:24:38','admin','Agileone','Notice','INFO','Add notice successfully [ID=44]');
INSERT INTO logging VALUES('1253','2014-10-17 08:24:39','admin','Agileone','Notice','INFO','Add notice successfully [ID=45]');
INSERT INTO logging VALUES('1254','2014-10-17 08:24:39','admin','Agileone','Notice','INFO','Add notice successfully [ID=46]');
INSERT INTO logging VALUES('1255','2014-10-17 08:24:39','admin','Agileone','Notice','INFO','Add notice successfully [ID=47]');
INSERT INTO logging VALUES('1256','2014-10-17 08:24:40','admin','Agileone','Task','INFO','Add task successfully [ID=48]');
INSERT INTO logging VALUES('1257','2014-10-17 08:24:41','admin','Agileone','UserStory','ERROR','Update userstory unsuccessfully [ID=251]');
INSERT INTO logging VALUES('1258','2014-10-17 08:24:44','admin','Agileone','UserStory','INFO','Update userstory successfully [ID=265]');
INSERT INTO logging VALUES('1259','2014-10-17 08:24:44','admin','Agileone','UserStory','INFO','Delete userstory successfully [ID=263]');
INSERT INTO logging VALUES('1260','2014-10-17 08:24:50','admin','Agileone','Notice','INFO','Delete notice successfully [ID=47]');
INSERT INTO logging VALUES('1261','2014-10-17 08:24:50','admin','Agileone','Task','INFO','Delete task successfully [ID=47]');
INSERT INTO logging VALUES('1262','2014-10-17 08:24:52','admin','Agileone','UserStory','INFO','Add userstory successfully [ID=268]');
INSERT INTO logging VALUES('1263','2014-10-17 08:24:52','admin','Agileone','Notice','INFO','Delete notice successfully [ID=46]');
INSERT INTO logging VALUES('1264','2014-10-17 08:24:54','admin','Agileone','Task','INFO','Delete task successfully [ID=48]');
INSERT INTO logging VALUES('1265','2014-10-17 08:24:55','admin','Agileone','Task','INFO','Delete task successfully [ID=45]');
INSERT INTO logging VALUES('1266','2014-10-17 08:24:55','admin','Agileone','UserStory','INFO','Add userstory successfully [ID=269]');
INSERT INTO logging VALUES('1267','2014-10-17 08:24:56','admin','Agileone','UserStory','INFO','Add userstory successfully [ID=270]');
INSERT INTO logging VALUES('1268','2014-10-17 08:24:57','admin','Agileone','UserStory','ERROR','Update userstory unsuccessfully [ID=251]');
INSERT INTO logging VALUES('1269','2014-10-17 08:24:57','admin','Agileone','UserStory','ERROR','Update userstory unsuccessfully [ID=251]');
INSERT INTO logging VALUES('1270','2014-10-17 08:24:57','admin','Agileone','UserStory','ERROR','Update userstory unsuccessfully [ID=251]');
INSERT INTO logging VALUES('1271','2014-10-17 08:24:58','denny','Agileone','UserStory','INFO','Add userstory successfully [ID=271]');
INSERT INTO logging VALUES('1272','2014-10-17 08:24:58','admin','Agileone','UserStory','ERROR','Update userstory unsuccessfully [ID=251]');
INSERT INTO logging VALUES('1273','2014-10-17 08:24:59','admin','Agileone','UserStory','ERROR','Update userstory unsuccessfully [ID=251]');
INSERT INTO logging VALUES('1274','2014-10-17 08:25:00','admin','Agileone','UserStory','ERROR','Update userstory unsuccessfully [ID=251]');
INSERT INTO logging VALUES('1275','2014-10-17 08:25:01','admin','Agileone','UserStory','ERROR','Update userstory unsuccessfully [ID=251]');
INSERT INTO logging VALUES('1276','2014-10-17 08:25:01','admin','Agileone','UserStory','ERROR','Update userstory unsuccessfully [ID=251]');
INSERT INTO logging VALUES('1277','2014-10-17 08:25:01','admin','Agileone','UserStory','INFO','Update userstory successfully [ID=265]');
INSERT INTO logging VALUES('1278','2014-10-17 08:25:02','admin','Agileone','UserStory','ERROR','Update userstory unsuccessfully [ID=251]');
INSERT INTO logging VALUES('1279','2014-10-17 08:25:02','admin','Agileone','UserStory','ERROR','Update userstory unsuccessfully [ID=251]');
INSERT INTO logging VALUES('1280','2014-10-17 08:25:02','admin','Agileone','UserStory','ERROR','Update userstory unsuccessfully [ID=251]');
INSERT INTO logging VALUES('1281','2014-10-17 08:25:03','admin','Agileone','UserStory','ERROR','Update userstory unsuccessfully [ID=251]');
INSERT INTO logging VALUES('1282','2014-10-17 08:25:03','admin','Agileone','UserStory','ERROR','Update userstory unsuccessfully [ID=251]');
INSERT INTO logging VALUES('1283','2014-10-17 08:25:03','admin','Agileone','UserStory','ERROR','Update userstory unsuccessfully [ID=251]');
INSERT INTO logging VALUES('1284','2014-10-17 08:25:04','admin','Agileone','UserStory','ERROR','Update userstory unsuccessfully [ID=251]');
INSERT INTO logging VALUES('1285','2014-10-17 08:25:07','skrillex','Agileone','System','INFO','User login successfully [skrillex] - 192.168.4.138');
INSERT INTO logging VALUES('1286','2014-10-17 08:25:12','admin','Agileone','UserStory','INFO','Add userstory successfully [ID=272]');
INSERT INTO logging VALUES('1287','2014-10-17 08:25:15','admin','Agileone','UserStory','INFO','Delete userstory successfully [ID=271]');
INSERT INTO logging VALUES('1288','2014-10-17 08:25:15','admin','Agileone','Notice','INFO','Delete notice successfully [ID=45]');
INSERT INTO logging VALUES('1289','2014-10-17 08:25:17','admin','Agileone','Notice','INFO','Delete notice successfully [ID=44]');
INSERT INTO logging VALUES('1290','2014-10-17 08:25:17','admin','Agileone','Notice','INFO','Delete notice successfully [ID=43]');
INSERT INTO logging VALUES('1291','2014-10-17 08:25:18','admin','Agileone','Notice','INFO','Delete notice successfully [ID=42]');
INSERT INTO logging VALUES('1292','2014-10-17 08:25:18','admin','Agileone','UserStory','INFO','Delete userstory successfully [ID=261]');
INSERT INTO logging VALUES('1293','2014-10-17 08:25:18','admin','Agileone','Notice','INFO','Delete notice successfully [ID=41]');
INSERT INTO logging VALUES('1294','2014-10-17 08:25:22','admin','Agileone','UserStory','ERROR','Update userstory unsuccessfully [ID=251]');
INSERT INTO logging VALUES('1295','2014-10-17 08:25:23','admin','Agileone','UserStory','ERROR','Update userstory unsuccessfully [ID=251]');
INSERT INTO logging VALUES('1296','2014-10-17 08:25:29','skrillex','System','System','INFO','User logout successfully [skrillex]');
INSERT INTO logging VALUES('1297','2014-10-17 08:25:29','admin','Agileone','UserStory','INFO','Update userstory successfully [ID=268]');
INSERT INTO logging VALUES('1298','2014-10-17 08:25:35','admin','Agileone','UserStory','INFO','Add userstory successfully [ID=273]');
INSERT INTO logging VALUES('1299','2014-10-17 08:25:39','admin','Agileone','UserStory','INFO','Add userstory successfully [ID=274]');
INSERT INTO logging VALUES('1300','2014-10-17 08:25:41','admin','Agileone','UserStory','INFO','Update userstory successfully [ID=268]');
INSERT INTO logging VALUES('1301','2014-10-17 08:25:41','admin','Agileone','System','INFO','User login successfully [admin] - 192.168.4.138');
INSERT INTO logging VALUES('1302','2014-10-17 08:25:42','admin','Agileone','UserStory','INFO','Add userstory successfully [ID=275]');
INSERT INTO logging VALUES('1303','2014-10-17 08:25:44','admin','Agileone','UserStory','INFO','Add userstory successfully [ID=276]');
INSERT INTO logging VALUES('1304','2014-10-17 08:25:58','admin','Agileone','UserStory','INFO','Add userstory successfully [ID=277]');
INSERT INTO logging VALUES('1305','2014-10-17 08:26:03','admin','Agileone','UserStory','INFO','Delete userstory successfully [ID=277]');
INSERT INTO logging VALUES('1306','2014-10-17 08:26:22','admin','Agileone','Notice','INFO','Add notice successfully [ID=48]');
INSERT INTO logging VALUES('1307','2014-10-17 08:26:24','admin','Agileone','Notice','INFO','Add notice successfully [ID=49]');
INSERT INTO logging VALUES('1308','2014-10-17 08:26:25','admin','Agileone','Notice','INFO','Add notice successfully [ID=50]');
INSERT INTO logging VALUES('1309','2014-10-17 08:26:28','admin','Agileone','Notice','INFO','Delete notice successfully [ID=48]');
INSERT INTO logging VALUES('1310','2014-10-17 08:26:31','admin','Agileone','Notice','INFO','Delete notice successfully [ID=49]');
INSERT INTO logging VALUES('1311','2014-10-17 08:26:35','admin','Agileone','Notice','INFO','Add notice successfully [ID=51]');
INSERT INTO logging VALUES('1312','2014-10-17 08:26:36','admin','Agileone','TestCase','INFO','Add testcase successfully [ID=11]');
INSERT INTO logging VALUES('1313','2014-10-17 08:26:47','admin','Agileone','System','INFO','User logout successfully [admin]');
INSERT INTO logging VALUES('1314','2014-10-17 08:26:53','admin','Agileone','Notice','INFO','Add notice successfully [ID=52]');
INSERT INTO logging VALUES('1315','2014-10-17 08:26:55','admin','Agileone','UserStory','INFO','Update userstory successfully [ID=265]');
INSERT INTO logging VALUES('1316','2014-10-17 08:26:56','admin','Agileone','UserStory','INFO','Update userstory successfully [ID=200]');
INSERT INTO logging VALUES('1317','2014-10-17 08:27:06','skrillex','Agileone','System','INFO','User login successfully [skrillex] - 192.168.4.138');
INSERT INTO logging VALUES('1318','2014-10-17 08:27:12','admin','Agileone','UserStory','INFO','Add userstory successfully [ID=278]');
INSERT INTO logging VALUES('1319','2014-10-17 08:27:30','admin','Agileone','Notice','INFO','Add notice successfully [ID=53]');
INSERT INTO logging VALUES('1320','2014-10-17 08:27:50','admin','Agileone','System','INFO','User logout successfully [admin]');
INSERT INTO logging VALUES('1321','2014-10-17 08:27:53','admin','Agileone','Defect','INFO','Add defect successfully [ID=12]');
INSERT INTO logging VALUES('1322','2014-10-17 08:27:55','admin','Agileone','System','INFO','User login successfully [admin] - 192.168.4.140');
INSERT INTO logging VALUES('1323','2014-10-17 08:28:12','admin','Agileone','Notice','INFO','Add notice successfully [ID=54]');
INSERT INTO logging VALUES('1324','2014-10-17 08:28:12','admin','Agileone','Notice','INFO','Add notice successfully [ID=55]');
INSERT INTO logging VALUES('1325','2014-10-17 08:28:13','admin','Agileone','Notice','INFO','Add notice successfully [ID=56]');
INSERT INTO logging VALUES('1326','2014-10-17 08:28:13','admin','Agileone','Notice','INFO','Add notice successfully [ID=57]');
INSERT INTO logging VALUES('1327','2014-10-17 08:28:14','admin','Agileone','Notice','INFO','Add notice successfully [ID=58]');
INSERT INTO logging VALUES('1328','2014-10-17 08:28:15','admin','Agileone','Notice','INFO','Add notice successfully [ID=59]');
INSERT INTO logging VALUES('1329','2014-10-17 08:28:16','admin','Agileone','Notice','INFO','Add notice successfully [ID=60]');
INSERT INTO logging VALUES('1330','2014-10-17 08:28:16','admin','Agileone','Notice','INFO','Add notice successfully [ID=61]');
INSERT INTO logging VALUES('1331','2014-10-17 08:28:19','admin','Agileone','UserStory','INFO','Delete userstory successfully [ID=276]');
INSERT INTO logging VALUES('1332','2014-10-17 08:28:21','admin','Agileone','Notice','INFO','Delete notice successfully [ID=54]');
INSERT INTO logging VALUES('1333','2014-10-17 08:28:23','admin','Agileone','Notice','INFO','Delete notice successfully [ID=55]');
INSERT INTO logging VALUES('1334','2014-10-17 08:28:23','admin','Agileone','UserStory','INFO','Delete userstory successfully [ID=275]');
INSERT INTO logging VALUES('1335','2014-10-17 08:28:23','admin','Agileone','Notice','INFO','Delete notice successfully [ID=56]');
INSERT INTO logging VALUES('1336','2014-10-17 08:28:24','admin','Agileone','Notice','INFO','Delete notice successfully [ID=57]');
INSERT INTO logging VALUES('1337','2014-10-17 08:28:25','admin','Agileone','Notice','INFO','Delete notice successfully [ID=58]');
INSERT INTO logging VALUES('1338','2014-10-17 08:28:25','admin','Agileone','UserStory','INFO','Delete userstory successfully [ID=274]');
INSERT INTO logging VALUES('1339','2014-10-17 08:28:25','admin','Agileone','Notice','INFO','Delete notice successfully [ID=59]');
INSERT INTO logging VALUES('1340','2014-10-17 08:28:26','admin','Agileone','Notice','INFO','Delete notice successfully [ID=60]');
INSERT INTO logging VALUES('1341','2014-10-17 08:28:26','admin','Agileone','UserStory','INFO','Delete userstory successfully [ID=273]');
INSERT INTO logging VALUES('1342','2014-10-17 08:28:27','admin','Agileone','Notice','INFO','Delete notice successfully [ID=61]');
INSERT INTO logging VALUES('1343','2014-10-17 08:28:28','admin','Agileone','UserStory','INFO','Delete userstory successfully [ID=272]');
INSERT INTO logging VALUES('1344','2014-10-17 08:28:30','admin','Agileone','UserStory','INFO','Delete userstory successfully [ID=270]');
INSERT INTO logging VALUES('1345','2014-10-17 08:28:33','admin','Agileone','UserStory','INFO','Delete userstory successfully [ID=269]');
INSERT INTO logging VALUES('1346','2014-10-17 08:29:06','admin','Agileone','UserStory','INFO','Update userstory successfully [ID=268]');
INSERT INTO logging VALUES('1347','2014-10-17 08:29:07','admin','Agileone','Notice','INFO','Add notice successfully [ID=62]');
INSERT INTO logging VALUES('1348','2014-10-17 08:29:15','admin','Agileone','Notice','INFO','Delete notice successfully [ID=62]');
INSERT INTO logging VALUES('1349','2014-10-17 08:29:23','denny','Agileone','UserStory','INFO','Add userstory successfully [ID=279]');
INSERT INTO logging VALUES('1350','2014-10-17 08:29:23','admin','Agileone','UserStory','INFO','Add userstory successfully [ID=280]');
INSERT INTO logging VALUES('1351','2014-10-17 08:29:29','admin','Agileone','UserStory','INFO','Update userstory successfully [ID=268]');
INSERT INTO logging VALUES('1352','2014-10-17 08:29:29','denny','Agileone','System','INFO','User logout successfully [denny]');
INSERT INTO logging VALUES('1353','2014-10-17 08:29:35','denny','Agileone','System','INFO','User login successfully [denny] - 192.168.4.121');
INSERT INTO logging VALUES('1354','2014-10-17 08:29:36','admin','Agileone','UserStory','INFO','Add userstory successfully [ID=281]');
INSERT INTO logging VALUES('1355','2014-10-17 08:29:43','admin','Agileone','System','INFO','User login successfully [Admin] - 192.168.4.101');
INSERT INTO logging VALUES('1356','2014-10-17 08:29:45','admin','Agileone','Knowledge','INFO','Add knowledge successfully [ID=20]');
INSERT INTO logging VALUES('1357','2014-10-17 08:29:46','admin','Agileone','Knowledge','INFO','Add knowledge successfully [ID=21]');
INSERT INTO logging VALUES('1358','2014-10-17 08:29:47','admin','Agileone','Knowledge','INFO','Add knowledge successfully [ID=22]');
INSERT INTO logging VALUES('1359','2014-10-17 08:29:50','admin','Agileone','Knowledge','INFO','Delete knowledge successfully [ID=22]');
INSERT INTO logging VALUES('1360','2014-10-17 08:29:51','admin','Agileone','Knowledge','INFO','Delete knowledge successfully [ID=21]');
INSERT INTO logging VALUES('1361','2014-10-17 08:29:51','admin','Agileone','Knowledge','INFO','Delete knowledge successfully [ID=20]');
INSERT INTO logging VALUES('1362','2014-10-17 08:30:30','denny','Agileone','UserStory','INFO','Add userstory successfully [ID=282]');
INSERT INTO logging VALUES('1363','2014-10-17 08:30:34','admin','Agileone','UserStory','INFO','Add userstory successfully [ID=283]');
INSERT INTO logging VALUES('1364','2014-10-17 08:30:36','admin','Agileone','UserStory','INFO','Add userstory successfully [ID=284]');
INSERT INTO logging VALUES('1365','2014-10-17 08:30:44','admin','Agileone','Task','INFO','Add task successfully [ID=49]');
INSERT INTO logging VALUES('1366','2014-10-17 08:30:56','admin','Agileone','Task','INFO','Delete task successfully [ID=49]');
INSERT INTO logging VALUES('1367','2014-10-17 08:31:08','admin','Agileone','UserStory','INFO','Update userstory successfully [ID=284]');
INSERT INTO logging VALUES('1368','2014-10-17 08:31:09','admin','Agileone','UserStory','INFO','Add userstory successfully [ID=285]');
INSERT INTO logging VALUES('1369','2014-10-17 08:31:28','admin','Agileone','UserStory','INFO','Add userstory successfully [ID=286]');
INSERT INTO logging VALUES('1370','2014-10-17 08:31:37','denny','Agileone','UserStory','INFO','Add userstory successfully [ID=287]');
INSERT INTO logging VALUES('1371','2014-10-17 08:31:55','admin','Agileone','System','INFO','User login successfully [admin] - 192.168.4.109');
INSERT INTO logging VALUES('1372','2014-10-17 08:31:57','admin','Agileone','UserStory','INFO','Add userstory successfully [ID=288]');
INSERT INTO logging VALUES('1373','2014-10-17 08:32:02','admin','Agileone','UserStory','INFO','Delete userstory successfully [ID=287]');
INSERT INTO logging VALUES('1374','2014-10-17 08:32:05','admin','Agileone','UserStory','INFO','Delete userstory successfully [ID=286]');
INSERT INTO logging VALUES('1375','2014-10-17 08:32:08','admin','Agileone','UserStory','INFO','Delete userstory successfully [ID=285]');
INSERT INTO logging VALUES('1376','2014-10-17 08:32:09','admin','Agileone','UserStory','INFO','Delete userstory successfully [ID=284]');
INSERT INTO logging VALUES('1377','2014-10-17 08:32:11','admin','Agileone','UserStory','INFO','Add userstory successfully [ID=289]');
INSERT INTO logging VALUES('1378','2014-10-17 08:32:11','admin','Agileone','UserStory','INFO','Delete userstory successfully [ID=283]');
INSERT INTO logging VALUES('1379','2014-10-17 08:32:13','admin','Agileone','UserStory','INFO','Delete userstory successfully [ID=282]');
INSERT INTO logging VALUES('1380','2014-10-17 08:32:15','admin','Agileone','UserStory','INFO','Delete userstory successfully [ID=281]');
INSERT INTO logging VALUES('1381','2014-10-17 08:32:40','admin','Agileone','Task','INFO','Add task successfully [ID=50]');
INSERT INTO logging VALUES('1382','2014-10-17 08:32:42','admin','Agileone','UserStory','INFO','Update userstory successfully [ID=289]');
INSERT INTO logging VALUES('1383','2014-10-17 08:32:58','admin','Agileone','Task','INFO','Add task successfully [ID=51]');
INSERT INTO logging VALUES('1384','2014-10-17 08:32:58','admin','Agileone','UserStory','INFO','Update userstory successfully [ID=288]');
INSERT INTO logging VALUES('1385','2014-10-17 08:33:01','admin','Agileone','Task','INFO','Add task successfully [ID=52]');
INSERT INTO logging VALUES('1386','2014-10-17 08:33:04','admin','Agileone','Task','INFO','Add task successfully [ID=53]');
INSERT INTO logging VALUES('1387','2014-10-17 08:33:14','admin','Agileone','Task','INFO','Add task successfully [ID=54]');
INSERT INTO logging VALUES('1388','2014-10-17 08:33:16','admin','Agileone','System','INFO','User login successfully [admin] - 192.168.4.115');
INSERT INTO logging VALUES('1389','2014-10-17 08:33:22','admin','Agileone','UserStory','INFO','Update userstory successfully [ID=289]');
INSERT INTO logging VALUES('1390','2014-10-17 08:33:25','admin','Agileone','System','INFO','User login successfully [admin] - 192.168.4.109');
INSERT INTO logging VALUES('1391','2014-10-17 08:33:31','admin','System','Admin','WARN','Set default language to [en]');
INSERT INTO logging VALUES('1392','2014-10-17 08:34:05','admin','Agileone','UserStory','INFO','Add userstory successfully [ID=290]');
INSERT INTO logging VALUES('1393','2014-10-17 08:34:09','admin','Agileone','UserStory','INFO','Add userstory successfully [ID=291]');
INSERT INTO logging VALUES('1394','2014-10-17 08:34:15','admin','System','Admin','WARN','Set default language to [en]');
INSERT INTO logging VALUES('1395','2014-10-17 08:34:23','denny','Agileone','UserStory','INFO','Add userstory successfully [ID=292]');
INSERT INTO logging VALUES('1396','2014-10-17 08:34:44','denny','Agileone','UserStory','INFO','Delete userstory successfully [ID=292]');
INSERT INTO logging VALUES('1397','2014-10-17 08:34:47','admin','Agileone','UserStory','INFO','Update userstory successfully [ID=290]');
INSERT INTO logging VALUES('1398','2014-10-17 08:34:50','denny','Agileone','UserStory','INFO','Add userstory successfully [ID=293]');
INSERT INTO logging VALUES('1399','2014-10-17 08:34:56','admin','System','Admin','WARN','Set default language to [zh]');
INSERT INTO logging VALUES('1400','2014-10-17 08:35:05','admin','Agileone','UserStory','INFO','Update userstory successfully [ID=290]');
INSERT INTO logging VALUES('1401','2014-10-17 08:35:21','admin','Agileone','UserStory','INFO','Update userstory successfully [ID=290]');
INSERT INTO logging VALUES('1402','2014-10-17 08:35:32','denny','Agileone','UserStory','INFO','Update userstory successfully [ID=279]');
INSERT INTO logging VALUES('1403','2014-10-17 08:35:33','denny','Agileone','UserStory','INFO','Update userstory successfully [ID=279]');
INSERT INTO logging VALUES('1404','2014-10-17 08:35:33','denny','Agileone','UserStory','ERROR','Update userstory unsuccessfully [ID=279]');
INSERT INTO logging VALUES('1405','2014-10-17 08:35:37','denny','Agileone','UserStory','INFO','Update userstory successfully [ID=279]');
INSERT INTO logging VALUES('1406','2014-10-17 08:35:41','admin','Agileone','UserStory','INFO','Update userstory successfully [ID=289]');
INSERT INTO logging VALUES('1407','2014-10-17 08:35:41','admin','Agileone','UserStory','ERROR','Update userstory unsuccessfully [ID=289]');
INSERT INTO logging VALUES('1408','2014-10-17 08:35:42','admin','Agileone','UserStory','INFO','Update userstory successfully [ID=289]');
INSERT INTO logging VALUES('1409','2014-10-17 08:35:42','admin','Agileone','UserStory','ERROR','Update userstory unsuccessfully [ID=289]');
INSERT INTO logging VALUES('1410','2014-10-17 08:35:43','admin','Agileone','UserStory','INFO','Update userstory successfully [ID=289]');
INSERT INTO logging VALUES('1411','2014-10-17 08:36:00','admin','Agileone','UserStory','INFO','Add userstory successfully [ID=294]');
INSERT INTO logging VALUES('1412','2014-10-17 08:36:09','admin','Agileone','UserStory','INFO','Delete userstory successfully [ID=207]');
INSERT INTO logging VALUES('1413','2014-10-17 08:36:10','admin','Agileone','UserStory','INFO','Delete userstory successfully [ID=209]');
INSERT INTO logging VALUES('1414','2014-10-17 08:36:11','admin','Agileone','UserStory','INFO','Delete userstory successfully [ID=215]');
INSERT INTO logging VALUES('1415','2014-10-17 08:36:11','admin','Agileone','UserStory','INFO','Add userstory successfully [ID=295]');
INSERT INTO logging VALUES('1416','2014-10-17 08:36:11','admin','Agileone','UserStory','INFO','Update userstory successfully [ID=280]');
INSERT INTO logging VALUES('1417','2014-10-17 08:36:12','admin','Agileone','UserStory','INFO','Delete userstory successfully [ID=216]');
INSERT INTO logging VALUES('1418','2014-10-17 08:36:13','admin','Agileone','UserStory','INFO','Delete userstory successfully [ID=218]');
INSERT INTO logging VALUES('1419','2014-10-17 08:36:14','admin','Agileone','UserStory','INFO','Delete userstory successfully [ID=219]');
INSERT INTO logging VALUES('1420','2014-10-17 08:36:14','admin','Agileone','UserStory','INFO','Delete userstory successfully [ID=220]');
INSERT INTO logging VALUES('1421','2014-10-17 08:36:15','admin','Agileone','UserStory','INFO','Delete userstory successfully [ID=254]');
INSERT INTO logging VALUES('1422','2014-10-17 08:36:15','admin','Agileone','UserStory','INFO','Delete userstory successfully [ID=255]');
INSERT INTO logging VALUES('1423','2014-10-17 08:36:17','admin','Agileone','UserStory','INFO','Delete userstory successfully [ID=256]');
INSERT INTO logging VALUES('1424','2014-10-17 08:36:17','admin','Agileone','UserStory','INFO','Update userstory successfully [ID=295]');
INSERT INTO logging VALUES('1425','2014-10-17 08:36:18','admin','Agileone','UserStory','INFO','Delete userstory successfully [ID=258]');
INSERT INTO logging VALUES('1426','2014-10-17 08:36:19','admin','Agileone','UserStory','INFO','Delete userstory successfully [ID=259]');
INSERT INTO logging VALUES('1427','2014-10-17 08:36:24','admin','Agileone','UserStory','ERROR','Update userstory unsuccessfully [ID=259]');
INSERT INTO logging VALUES('1428','2014-10-17 08:36:26','admin','Agileone','UserStory','INFO','Delete userstory successfully [ID=267]');
INSERT INTO logging VALUES('1429','2014-10-17 08:36:27','admin','Agileone','UserStory','INFO','Delete userstory successfully [ID=268]');
INSERT INTO logging VALUES('1430','2014-10-17 08:36:27','admin','Agileone','UserStory','INFO','Delete userstory successfully [ID=278]');
INSERT INTO logging VALUES('1431','2014-10-17 08:36:27','admin','Agileone','UserStory','INFO','Delete userstory successfully [ID=279]');
INSERT INTO logging VALUES('1432','2014-10-17 08:36:28','admin','Agileone','UserStory','INFO','Delete userstory successfully [ID=280]');
INSERT INTO logging VALUES('1433','2014-10-17 08:36:28','admin','Agileone','UserStory','ERROR','Update userstory unsuccessfully [ID=259]');
INSERT INTO logging VALUES('1434','2014-10-17 08:36:29','admin','Agileone','UserStory','INFO','Delete userstory successfully [ID=288]');
INSERT INTO logging VALUES('1435','2014-10-17 08:36:29','admin','Agileone','UserStory','INFO','Delete userstory successfully [ID=289]');
INSERT INTO logging VALUES('1436','2014-10-17 08:36:30','admin','Agileone','UserStory','INFO','Delete userstory successfully [ID=290]');
INSERT INTO logging VALUES('1437','2014-10-17 08:36:30','admin','Agileone','UserStory','INFO','Delete userstory successfully [ID=291]');
INSERT INTO logging VALUES('1438','2014-10-17 08:36:31','admin','Agileone','UserStory','INFO','Delete userstory successfully [ID=293]');
INSERT INTO logging VALUES('1439','2014-10-17 08:36:32','admin','Agileone','Spec','INFO','Add specification successfully [ID=7]');
INSERT INTO logging VALUES('1440','2014-10-17 08:36:32','admin','Agileone','UserStory','ERROR','Update userstory unsuccessfully [ID=259]');
INSERT INTO logging VALUES('1441','2014-10-17 08:36:35','admin','Agileone','UserStory','INFO','Add userstory successfully [ID=296]');
INSERT INTO logging VALUES('1442','2014-10-17 08:36:44','admin','Agileone','UserStory','INFO','Update userstory successfully [ID=191]');
INSERT INTO logging VALUES('1443','2014-10-17 08:36:45','skrillex','Agileone','System','INFO','User login successfully [skrillex] - 192.168.4.138');
INSERT INTO logging VALUES('1444','2014-10-17 08:36:52','admin','Agileone','System','INFO','User login successfully [admin] - 192.168.4.161');
INSERT INTO logging VALUES('1445','2014-10-17 08:36:55','admin','Agileone','UserStory','INFO','Add userstory successfully [ID=297]');
INSERT INTO logging VALUES('1446','2014-10-17 08:37:12','admin','Agileone','UserStory','INFO','Add userstory successfully [ID=298]');
INSERT INTO logging VALUES('1447','2014-10-17 08:37:16','admin','Agileone','UserStory','INFO','Add userstory successfully [ID=299]');
INSERT INTO logging VALUES('1448','2014-10-17 08:37:19','admin','Agileone','UserStory','INFO','Add userstory successfully [ID=300]');
INSERT INTO logging VALUES('1449','2014-10-17 08:37:21','admin','Agileone','System','INFO','User login successfully [admin] - 192.168.4.115');
INSERT INTO logging VALUES('1450','2014-10-17 08:37:24','denny','Agileone','System','INFO','User logout successfully [denny]');
INSERT INTO logging VALUES('1451','2014-10-17 08:37:24','admin','Agileone','UserStory','INFO','Add userstory successfully [ID=301]');
INSERT INTO logging VALUES('1452','2014-10-17 08:37:28','admin','Agileone','System','INFO','User login successfully [admin] - 192.168.4.110');
INSERT INTO logging VALUES('1453','2014-10-17 08:37:31','denny','Agileone','Task','INFO','Add task successfully [ID=55]');
INSERT INTO logging VALUES('1454','2014-10-17 08:37:32','admin','Agileone','UserStory','INFO','Add userstory successfully [ID=302]');
INSERT INTO logging VALUES('1455','2014-10-17 08:37:36','denny','Agileone','Task','INFO','Add task successfully [ID=56]');
INSERT INTO logging VALUES('1456','2014-10-17 08:37:39','denny','Agileone','Task','INFO','Add task successfully [ID=57]');
INSERT INTO logging VALUES('1457','2014-10-17 08:37:42','denny','Agileone','Task','INFO','Add task successfully [ID=58]');
INSERT INTO logging VALUES('1458','2014-10-17 08:37:45','denny','Agileone','Task','INFO','Add task successfully [ID=59]');
INSERT INTO logging VALUES('1459','2014-10-17 08:37:50','denny','Agileone','Task','INFO','Add task successfully [ID=60]');
INSERT INTO logging VALUES('1460','2014-10-17 08:38:01','admin','Agileone','UserStory','INFO','Delete userstory successfully [ID=296]');
INSERT INTO logging VALUES('1461','2014-10-17 08:38:06','admin','Agileone','UserStory','INFO','Delete userstory successfully [ID=302]');
INSERT INTO logging VALUES('1462','2014-10-17 08:38:08','denny','Agileone','UserStory','INFO','Add userstory successfully [ID=303]');
INSERT INTO logging VALUES('1463','2014-10-17 08:38:09','admin','Agileone','UserStory','INFO','Delete userstory successfully [ID=301]');
INSERT INTO logging VALUES('1464','2014-10-17 08:38:11','admin','Agileone','UserStory','INFO','Delete userstory successfully [ID=265]');
INSERT INTO logging VALUES('1465','2014-10-17 08:38:14','admin','Agileone','UserStory','ERROR','Update userstory unsuccessfully [ID=]');
INSERT INTO logging VALUES('1466','2014-10-17 08:38:16','admin','Agileone','UserStory','ERROR','Update userstory unsuccessfully [ID=]');
INSERT INTO logging VALUES('1467','2014-10-17 08:38:17','admin','Agileone','UserStory','ERROR','Update userstory unsuccessfully [ID=]');
INSERT INTO logging VALUES('1468','2014-10-17 08:38:17','admin','Agileone','UserStory','ERROR','Update userstory unsuccessfully [ID=]');
INSERT INTO logging VALUES('1469','2014-10-17 08:38:17','admin','Agileone','UserStory','ERROR','Update userstory unsuccessfully [ID=]');
INSERT INTO logging VALUES('1470','2014-10-17 08:38:18','admin','Agileone','UserStory','ERROR','Update userstory unsuccessfully [ID=]');
INSERT INTO logging VALUES('1471','2014-10-17 08:38:18','admin','Agileone','UserStory','ERROR','Update userstory unsuccessfully [ID=]');
INSERT INTO logging VALUES('1472','2014-10-17 08:38:19','admin','Agileone','UserStory','ERROR','Update userstory unsuccessfully [ID=]');
INSERT INTO logging VALUES('1473','2014-10-17 08:38:19','admin','Agileone','UserStory','ERROR','Update userstory unsuccessfully [ID=302]');
INSERT INTO logging VALUES('1474','2014-10-17 08:38:19','admin','Agileone','UserStory','ERROR','Update userstory unsuccessfully [ID=]');
INSERT INTO logging VALUES('1475','2014-10-17 08:38:20','admin','Agileone','UserStory','ERROR','Update userstory unsuccessfully [ID=]');
INSERT INTO logging VALUES('1476','2014-10-17 08:38:20','admin','Agileone','UserStory','ERROR','Update userstory unsuccessfully [ID=]');
INSERT INTO logging VALUES('1477','2014-10-17 08:38:20','admin','Agileone','UserStory','ERROR','Update userstory unsuccessfully [ID=]');
INSERT INTO logging VALUES('1478','2014-10-17 08:38:21','admin','Agileone','UserStory','ERROR','Update userstory unsuccessfully [ID=]');
INSERT INTO logging VALUES('1479','2014-10-17 08:38:21','admin','Agileone','UserStory','ERROR','Update userstory unsuccessfully [ID=]');
INSERT INTO logging VALUES('1480','2014-10-17 08:38:22','admin','Agileone','UserStory','ERROR','Update userstory unsuccessfully [ID=]');
INSERT INTO logging VALUES('1481','2014-10-17 08:38:22','admin','Agileone','UserStory','ERROR','Update userstory unsuccessfully [ID=]');
INSERT INTO logging VALUES('1482','2014-10-17 08:38:26','admin','Agileone','UserStory','INFO','Add userstory successfully [ID=304]');
INSERT INTO logging VALUES('1483','2014-10-17 08:38:34','admin','Agileone','UserStory','ERROR','Update userstory unsuccessfully [ID=]');
INSERT INTO logging VALUES('1484','2014-10-17 08:38:34','admin','Agileone','UserStory','ERROR','Update userstory unsuccessfully [ID=]');
INSERT INTO logging VALUES('1485','2014-10-17 08:38:38','admin','Agileone','UserStory','INFO','Delete userstory successfully [ID=298]');
INSERT INTO logging VALUES('1486','2014-10-17 08:38:41','admin','Agileone','UserStory','INFO','Delete userstory successfully [ID=297]');
INSERT INTO logging VALUES('1487','2014-10-17 08:38:46','admin','Agileone','UserStory','INFO','Update userstory successfully [ID=295]');
INSERT INTO logging VALUES('1488','2014-10-17 08:38:50','denny','Agileone','UserStory','INFO','Update userstory successfully [ID=303]');
INSERT INTO logging VALUES('1489','2014-10-17 08:38:51','admin','Agileone','UserStory','INFO','Update userstory successfully [ID=295]');
INSERT INTO logging VALUES('1490','2014-10-17 08:38:55','denny','Agileone','UserStory','INFO','Add userstory successfully [ID=305]');
INSERT INTO logging VALUES('1491','2014-10-17 08:38:59','admin','Agileone','UserStory','ERROR','Update userstory unsuccessfully [ID=298]');
INSERT INTO logging VALUES('1492','2014-10-17 08:39:00','denny','Agileone','UserStory','INFO','Add userstory successfully [ID=306]');
INSERT INTO logging VALUES('1493','2014-10-17 08:39:03','admin','Agileone','UserStory','ERROR','Update userstory unsuccessfully [ID=298]');
INSERT INTO logging VALUES('1494','2014-10-17 08:39:03','admin','Agileone','UserStory','ERROR','Update userstory unsuccessfully [ID=298]');
INSERT INTO logging VALUES('1495','2014-10-17 08:39:06','admin','Agileone','UserStory','ERROR','Update userstory unsuccessfully [ID=298]');
INSERT INTO logging VALUES('1496','2014-10-17 08:39:07','admin','Agileone','UserStory','ERROR','Update userstory unsuccessfully [ID=298]');
INSERT INTO logging VALUES('1497','2014-10-17 08:39:07','admin','Agileone','UserStory','ERROR','Update userstory unsuccessfully [ID=298]');
INSERT INTO logging VALUES('1498','2014-10-17 08:39:13','admin','Agileone','UserStory','ERROR','Update userstory unsuccessfully [ID=298]');
INSERT INTO logging VALUES('1499','2014-10-17 08:39:14','admin','Agileone','UserStory','ERROR','Update userstory unsuccessfully [ID=298]');
INSERT INTO logging VALUES('1500','2014-10-17 08:39:22','admin','Agileone','System','INFO','User login successfully [admin] - 192.168.4.147');
INSERT INTO logging VALUES('1501','2014-10-17 08:39:23','denny','Agileone','Spec','INFO','Add specification successfully [ID=8]');
INSERT INTO logging VALUES('1502','2014-10-17 08:39:25','admin','Agileone','UserStory','INFO','Add userstory successfully [ID=307]');
INSERT INTO logging VALUES('1503','2014-10-17 08:39:33','admin','Agileone','UserStory','INFO','Add userstory successfully [ID=308]');
INSERT INTO logging VALUES('1504','2014-10-17 08:39:36','admin','Agileone','UserStory','INFO','Add userstory successfully [ID=309]');
INSERT INTO logging VALUES('1505','2014-10-17 08:39:39','admin','Agileone','UserStory','INFO','Add userstory successfully [ID=310]');
INSERT INTO logging VALUES('1506','2014-10-17 08:39:40','denny','Agileone','Spec','INFO','Delete specification successfully [ID=8]');
INSERT INTO logging VALUES('1507','2014-10-17 08:39:45','admin','Agileone','UserStory','INFO','Delete userstory successfully [ID=194]');
INSERT INTO logging VALUES('1508','2014-10-17 08:39:59','admin','Agileone','UserStory','INFO','Delete userstory successfully [ID=307]');
INSERT INTO logging VALUES('1509','2014-10-17 08:40:01','admin','Agileone','UserStory','INFO','Update userstory successfully [ID=308]');
INSERT INTO logging VALUES('1510','2014-10-17 08:40:03','admin','Agileone','UserStory','INFO','Delete userstory successfully [ID=309]');
INSERT INTO logging VALUES('1511','2014-10-17 08:40:12','denny','Agileone','UserStory','INFO','Add userstory successfully [ID=311]');
INSERT INTO logging VALUES('1512','2014-10-17 08:40:25','admin','Agileone','UserStory','INFO','Update userstory successfully [ID=308]');
INSERT INTO logging VALUES('1513','2014-10-17 08:40:33','admin','Agileone','UserStory','INFO','Delete userstory successfully [ID=308]');
INSERT INTO logging VALUES('1514','2014-10-17 08:40:46','admin','Agileone','UserStory','INFO','Add userstory successfully [ID=312]');
INSERT INTO logging VALUES('1515','2014-10-17 08:41:22','admin','Agileone','Defect','INFO','Update task status to finished [ID=55]');
INSERT INTO logging VALUES('1516','2014-10-17 08:41:30','denny','Agileone','UserStory','INFO','Add userstory successfully [ID=313]');
INSERT INTO logging VALUES('1517','2014-10-17 08:41:33','admin','Agileone','UserStory','INFO','Add userstory successfully [ID=314]');
INSERT INTO logging VALUES('1518','2014-10-17 08:41:45','admin','Agileone','UserStory','INFO','Add userstory successfully [ID=315]');
INSERT INTO logging VALUES('1519','2014-10-17 08:41:47','denny','Agileone','UserStory','INFO','Add userstory successfully [ID=316]');
INSERT INTO logging VALUES('1520','2014-10-17 08:41:51','denny','Agileone','UserStory','INFO','Add userstory successfully [ID=317]');
INSERT INTO logging VALUES('1521','2014-10-17 08:41:55','denny','Agileone','TestCase','INFO','Add testcase successfully [ID=12]');
INSERT INTO logging VALUES('1522','2014-10-17 08:42:08','denny','Agileone','Execution','INFO','Add execution result successfully [ID=18]');
INSERT INTO logging VALUES('1523','2014-10-17 08:42:19','admin','Agileone','Defect','INFO','Update task status to finished [ID=46]');
INSERT INTO logging VALUES('1524','2014-10-17 08:42:20','admin','Agileone','UserStory','INFO','Add userstory successfully [ID=318]');
INSERT INTO logging VALUES('1525','2014-10-17 08:42:22','denny','Agileone','UserStory','INFO','Add userstory successfully [ID=319]');
INSERT INTO logging VALUES('1526','2014-10-17 08:42:30','denny','Agileone','Execution','INFO','Delete execution result successfully [ID=18]');
INSERT INTO logging VALUES('1527','2014-10-17 08:42:32','admin','Agileone','UserStory','INFO','Add userstory successfully [ID=320]');
INSERT INTO logging VALUES('1528','2014-10-17 08:42:33','denny','Agileone','Execution','INFO','Delete execution result successfully [ID=17]');
INSERT INTO logging VALUES('1529','2014-10-17 08:42:37','denny','Agileone','Execution','INFO','Delete execution result successfully [ID=16]');
INSERT INTO logging VALUES('1530','2014-10-17 08:42:38','denny','Agileone','Execution','INFO','Delete execution result successfully [ID=15]');
INSERT INTO logging VALUES('1531','2014-10-17 08:42:38','denny','Agileone','Execution','INFO','Delete execution result successfully [ID=14]');
INSERT INTO logging VALUES('1532','2014-10-17 08:42:39','denny','Agileone','Execution','INFO','Delete execution result successfully [ID=13]');
INSERT INTO logging VALUES('1533','2014-10-17 08:42:39','denny','Agileone','Execution','INFO','Delete execution result successfully [ID=8]');
INSERT INTO logging VALUES('1534','2014-10-17 08:42:40','denny','Agileone','Execution','INFO','Delete execution result successfully [ID=7]');
INSERT INTO logging VALUES('1535','2014-10-17 08:42:41','denny','Agileone','Execution','INFO','Delete execution result successfully [ID=6]');
INSERT INTO logging VALUES('1536','2014-10-17 08:42:41','denny','Agileone','Execution','INFO','Delete execution result successfully [ID=5]');
INSERT INTO logging VALUES('1537','2014-10-17 08:42:43','denny','Agileone','Execution','INFO','Delete execution result successfully [ID=4]');
INSERT INTO logging VALUES('1538','2014-10-17 08:42:45','denny','Agileone','Execution','INFO','Delete execution result successfully [ID=3]');
INSERT INTO logging VALUES('1539','2014-10-17 08:42:46','denny','Agileone','Execution','INFO','Delete execution result successfully [ID=2]');
INSERT INTO logging VALUES('1540','2014-10-17 08:42:47','denny','Agileone','Execution','INFO','Delete execution result successfully [ID=1]');
INSERT INTO logging VALUES('1541','2014-10-17 08:42:51','admin','Agileone','Minutes','INFO','Add minutes successfully [ID=2]');
INSERT INTO logging VALUES('1542','2014-10-17 08:42:56','denny','Agileone','TestCase','INFO','Delete testcase successfully [ID=1]');
INSERT INTO logging VALUES('1543','2014-10-17 08:42:59','denny','Agileone','TestCase','INFO','Delete testcase successfully [ID=2]');
INSERT INTO logging VALUES('1544','2014-10-17 08:42:59','denny','Agileone','TestCase','INFO','Delete testcase successfully [ID=3]');
INSERT INTO logging VALUES('1545','2014-10-17 08:43:00','denny','Agileone','TestCase','INFO','Delete testcase successfully [ID=4]');
INSERT INTO logging VALUES('1546','2014-10-17 08:43:01','denny','Agileone','TestCase','INFO','Delete testcase successfully [ID=5]');
INSERT INTO logging VALUES('1547','2014-10-17 08:43:03','denny','Agileone','TestCase','INFO','Delete testcase successfully [ID=12]');
INSERT INTO logging VALUES('1548','2014-10-17 08:43:15','admin','Agileone','UserStory','INFO','Add userstory successfully [ID=321]');
INSERT INTO logging VALUES('1549','2014-10-17 08:43:32','admin','Agileone','UserStory','INFO','Add userstory successfully [ID=322]');
INSERT INTO logging VALUES('1550','2014-10-17 08:43:39','denny','Agileone','System','INFO','User logout successfully [denny]');
INSERT INTO logging VALUES('1551','2014-10-17 08:43:43','denny','Agileone','UserStory','INFO','Add userstory successfully [ID=323]');
INSERT INTO logging VALUES('1552','2014-10-17 08:43:47','admin','Agileone','Notice','INFO','Add notice successfully [ID=63]');
INSERT INTO logging VALUES('1553','2014-10-17 08:43:56','admin','Agileone','Task','INFO','Add task successfully [ID=61]');
INSERT INTO logging VALUES('1554','2014-10-17 08:43:58','admin','Agileone','Notice','INFO','Delete notice successfully [ID=63]');
INSERT INTO logging VALUES('1555','2014-10-17 08:44:00','admin','Agileone','Task','INFO','Add task successfully [ID=62]');
INSERT INTO logging VALUES('1556','2014-10-17 08:44:00','admin','Agileone','Notice','INFO','Delete notice successfully [ID=53]');
INSERT INTO logging VALUES('1557','2014-10-17 08:44:01','admin','Agileone','Notice','INFO','Delete notice successfully [ID=52]');
INSERT INTO logging VALUES('1558','2014-10-17 08:44:04','admin','Agileone','Notice','INFO','Delete notice successfully [ID=37]');
INSERT INTO logging VALUES('1559','2014-10-17 08:44:04','admin','Agileone','System','INFO','User login successfully [admin] - 192.168.4.102');
INSERT INTO logging VALUES('1560','2014-10-17 08:44:06','admin','Agileone','Notice','INFO','Delete notice successfully [ID=39]');
INSERT INTO logging VALUES('1561','2014-10-17 08:44:09','denny','Agileone','Task','INFO','Add task successfully [ID=63]');
INSERT INTO logging VALUES('1562','2014-10-17 08:44:11','denny','Agileone','Task','INFO','Add task successfully [ID=64]');
INSERT INTO logging VALUES('1563','2014-10-17 08:44:28','denny','Agileone','Task','INFO','Delete task successfully [ID=27]');
INSERT INTO logging VALUES('1564','2014-10-17 08:44:29','admin','Agileone','UserStory','INFO','Add userstory successfully [ID=324]');
INSERT INTO logging VALUES('1565','2014-10-17 08:44:39','denny','Agileone','Task','INFO','Delete task successfully [ID=22]');
INSERT INTO logging VALUES('1566','2014-10-17 08:44:41','denny','Agileone','Task','INFO','Add task successfully [ID=65]');
INSERT INTO logging VALUES('1567','2014-10-17 08:44:52','admin','Agileone','UserStory','INFO','Delete userstory successfully [ID=312]');
INSERT INTO logging VALUES('1568','2014-10-17 08:44:54','denny','Agileone','UserStory','INFO','Add userstory successfully [ID=325]');
INSERT INTO logging VALUES('1569','2014-10-17 08:44:57','admin','Agileone','UserStory','INFO','Add userstory successfully [ID=326]');
INSERT INTO logging VALUES('1570','2014-10-17 08:45:26','admin','Agileone','UserStory','INFO','Add userstory successfully [ID=327]');
INSERT INTO logging VALUES('1571','2014-10-17 08:45:30','admin','Agileone','UserStory','INFO','Add userstory successfully [ID=328]');
INSERT INTO logging VALUES('1572','2014-10-17 08:45:33','admin','Agileone','TestCase','INFO','Delete testcase successfully [ID=11]');
INSERT INTO logging VALUES('1573','2014-10-17 08:45:35','admin','Agileone','TestCase','INFO','Delete testcase successfully [ID=10]');
INSERT INTO logging VALUES('1574','2014-10-17 08:45:37','admin','Agileone','TestCase','INFO','Delete testcase successfully [ID=9]');
INSERT INTO logging VALUES('1575','2014-10-17 08:45:42','admin','Agileone','UserStory','INFO','Add userstory successfully [ID=329]');
INSERT INTO logging VALUES('1576','2014-10-17 08:45:46','admin','Agileone','Spec','INFO','Delete specification successfully [ID=7]');
INSERT INTO logging VALUES('1577','2014-10-17 08:45:50','admin','Agileone','Spec','INFO','Delete specification successfully [ID=6]');
INSERT INTO logging VALUES('1578','2014-10-17 08:45:59','admin','Agileone','UserStory','INFO','Delete userstory successfully [ID=329]');
INSERT INTO logging VALUES('1579','2014-10-17 08:46:00','admin','Agileone','UserStory','INFO','Delete userstory successfully [ID=328]');
INSERT INTO logging VALUES('1580','2014-10-17 08:46:01','admin','Agileone','UserStory','INFO','Delete userstory successfully [ID=327]');
INSERT INTO logging VALUES('1581','2014-10-17 08:46:03','admin','Agileone','UserStory','INFO','Delete userstory successfully [ID=306]');
INSERT INTO logging VALUES('1582','2014-10-17 08:46:03','admin','Agileone','UserStory','INFO','Delete userstory successfully [ID=310]');
INSERT INTO logging VALUES('1583','2014-10-17 08:46:05','admin','Agileone','UserStory','INFO','Delete userstory successfully [ID=311]');
INSERT INTO logging VALUES('1584','2014-10-17 08:46:06','admin','Agileone','UserStory','INFO','Delete userstory successfully [ID=313]');
INSERT INTO logging VALUES('1585','2014-10-17 08:46:11','admin','Agileone','UserStory','INFO','Delete userstory successfully [ID=319]');
INSERT INTO logging VALUES('1586','2014-10-17 08:46:12','admin','Agileone','UserStory','INFO','Add userstory successfully [ID=330]');
INSERT INTO logging VALUES('1587','2014-10-17 08:46:14','admin','Agileone','UserStory','INFO','Delete userstory successfully [ID=320]');
INSERT INTO logging VALUES('1588','2014-10-17 08:46:18','admin','Agileone','UserStory','INFO','Delete userstory successfully [ID=321]');
INSERT INTO logging VALUES('1589','2014-10-17 08:46:21','admin','Agileone','UserStory','INFO','Delete userstory successfully [ID=317]');
INSERT INTO logging VALUES('1590','2014-10-17 08:46:22','admin','Agileone','UserStory','INFO','Delete userstory successfully [ID=316]');
INSERT INTO logging VALUES('1591','2014-10-17 08:46:26','denny','Agileone','UserStory','INFO','Update userstory successfully [ID=325]');
INSERT INTO logging VALUES('1592','2014-10-17 08:46:37','admin','Agileone','UserStory','INFO','Delete userstory successfully [ID=330]');
INSERT INTO logging VALUES('1593','2014-10-17 08:46:37','denny','Agileone','UserStory','INFO','Update userstory successfully [ID=325]');
INSERT INTO logging VALUES('1594','2014-10-17 08:46:39','admin','Agileone','UserStory','INFO','Delete userstory successfully [ID=326]');
INSERT INTO logging VALUES('1595','2014-10-17 08:46:42','admin','Agileone','UserStory','INFO','Delete userstory successfully [ID=303]');
INSERT INTO logging VALUES('1596','2014-10-17 08:46:42','admin','Agileone','UserStory','INFO','Delete userstory successfully [ID=304]');
INSERT INTO logging VALUES('1597','2014-10-17 08:46:43','admin','Agileone','UserStory','INFO','Delete userstory successfully [ID=305]');
INSERT INTO logging VALUES('1598','2014-10-17 08:46:46','admin','Agileone','UserStory','INFO','Delete userstory successfully [ID=323]');
INSERT INTO logging VALUES('1599','2014-10-17 08:46:48','admin','Agileone','UserStory','INFO','Delete userstory successfully [ID=324]');
INSERT INTO logging VALUES('1600','2014-10-17 08:46:50','admin','Agileone','UserStory','INFO','Delete userstory successfully [ID=325]');
INSERT INTO logging VALUES('1601','2014-10-17 08:46:56','admin','Agileone','UserStory','INFO','Add userstory successfully [ID=331]');
INSERT INTO logging VALUES('1602','2014-10-17 08:47:08','admin','Agileone','Notice','INFO','Delete notice successfully [ID=50]');
INSERT INTO logging VALUES('1603','2014-10-17 08:47:10','denny','Agileone','System','INFO','User login successfully [denny] - 192.168.4.134');
INSERT INTO logging VALUES('1604','2014-10-17 08:47:10','admin','Agileone','Notice','INFO','Delete notice successfully [ID=51]');
INSERT INTO logging VALUES('1605','2014-10-17 08:47:12','admin','Agileone','UserStory','INFO','Add userstory successfully [ID=332]');
INSERT INTO logging VALUES('1606','2014-10-17 08:47:13','admin','Agileone','System','INFO','User login successfully [admin] - 192.168.4.146');
INSERT INTO logging VALUES('1607','2014-10-17 08:47:14','admin','Agileone','UserStory','INFO','Add userstory successfully [ID=333]');
INSERT INTO logging VALUES('1608','2014-10-17 08:47:20','admin','Agileone','UserStory','INFO','Add userstory successfully [ID=334]');
INSERT INTO logging VALUES('1609','2014-10-17 08:47:25','admin','Agileone','Spec','INFO','Add specification successfully [ID=9]');
INSERT INTO logging VALUES('1610','2014-10-17 08:47:27','admin','Agileone','UserStory','INFO','Add userstory successfully [ID=335]');
INSERT INTO logging VALUES('1611','2014-10-17 08:47:39','admin','Agileone','Task','INFO','Add task successfully [ID=66]');
INSERT INTO logging VALUES('1612','2014-10-17 08:47:41','denny','Agileone','UserStory','INFO','Add userstory successfully [ID=336]');
INSERT INTO logging VALUES('1613','2014-10-17 08:47:42','admin','Agileone','UserStory','INFO','Update userstory successfully [ID=335]');
INSERT INTO logging VALUES('1614','2014-10-17 08:47:47','admin','Agileone','Task','INFO','Add task successfully [ID=67]');
INSERT INTO logging VALUES('1615','2014-10-17 08:47:47','admin','Agileone','Spec','INFO','Delete specification successfully [ID=9]');
INSERT INTO logging VALUES('1616','2014-10-17 08:47:52','admin','Agileone','UserStory','INFO','Update userstory successfully [ID=334]');
INSERT INTO logging VALUES('1617','2014-10-17 08:47:54','admin','Agileone','UserStory','INFO','Update userstory successfully [ID=335]');
INSERT INTO logging VALUES('1618','2014-10-17 08:47:55','admin','Agileone','UserStory','INFO','Add userstory successfully [ID=337]');
INSERT INTO logging VALUES('1619','2014-10-17 08:47:57','admin','Agileone','UserStory','INFO','Add userstory successfully [ID=338]');
INSERT INTO logging VALUES('1620','2014-10-17 08:48:08','admin','Agileone','UserStory','INFO','Add userstory successfully [ID=339]');
INSERT INTO logging VALUES('1621','2014-10-17 08:48:08','denny','Agileone','UserStory','INFO','Update userstory successfully [ID=336]');
INSERT INTO logging VALUES('1622','2014-10-17 08:48:12','admin','Agileone','UserStory','INFO','Update userstory successfully [ID=335]');
INSERT INTO logging VALUES('1623','2014-10-17 08:48:14','admin','System','Admin','INFO','Add user successfully [ID=7]');
INSERT INTO logging VALUES('1624','2014-10-17 08:48:19','admin','Agileone','UserStory','INFO','Add userstory successfully [ID=340]');
INSERT INTO logging VALUES('1625','2014-10-17 08:48:19','admin','Agileone','UserStory','INFO','Delete userstory successfully [ID=335]');
INSERT INTO logging VALUES('1626','2014-10-17 08:48:34','admin','Agileone','Task','INFO','Add task successfully [ID=68]');
INSERT INTO logging VALUES('1627','2014-10-17 08:48:38','admin','Agileone','UserStory','INFO','Update userstory successfully [ID=339]');
INSERT INTO logging VALUES('1628','2014-10-17 08:48:38','admin','Agileone','UserStory','INFO','Add userstory successfully [ID=341]');
INSERT INTO logging VALUES('1629','2014-10-17 08:48:42','admin','Agileone','UserStory','INFO','Update userstory successfully [ID=339]');
INSERT INTO logging VALUES('1630','2014-10-17 08:48:45','admin','Agileone','Spec','INFO','Add specification successfully [ID=10]');
INSERT INTO logging VALUES('1631','2014-10-17 08:48:45','admin','Agileone','Spec','INFO','Add specification successfully [ID=11]');
INSERT INTO logging VALUES('1632','2014-10-17 08:48:45','admin','Agileone','UserStory','INFO','Add userstory successfully [ID=342]');
INSERT INTO logging VALUES('1633','2014-10-17 08:48:46','admin','Agileone','Task','INFO','Add task successfully [ID=69]');
INSERT INTO logging VALUES('1634','2014-10-17 08:48:47','admin','Agileone','System','INFO','User login successfully [admin] - 192.168.4.115');
INSERT INTO logging VALUES('1635','2014-10-17 08:48:51','admin','Agileone','UserStory','INFO','Add userstory successfully [ID=343]');
INSERT INTO logging VALUES('1636','2014-10-17 08:48:52','admin','Agileone','UserStory','INFO','Update userstory successfully [ID=339]');
INSERT INTO logging VALUES('1637','2014-10-17 08:48:54','admin','Agileone','UserStory','INFO','Add userstory successfully [ID=344]');
INSERT INTO logging VALUES('1638','2014-10-17 08:48:54','admin','Agileone','Task','INFO','Add task successfully [ID=70]');
INSERT INTO logging VALUES('1639','2014-10-17 08:48:54','admin','Agileone','UserStory','INFO','Update userstory successfully [ID=339]');
INSERT INTO logging VALUES('1640','2014-10-17 08:48:56','admin','Agileone','UserStory','INFO','Add userstory successfully [ID=345]');
INSERT INTO logging VALUES('1641','2014-10-17 08:48:57','admin','Agileone','Task','INFO','Add task successfully [ID=71]');
INSERT INTO logging VALUES('1642','2014-10-17 08:49:01','admin','Agileone','UserStory','INFO','Add userstory successfully [ID=346]');
INSERT INTO logging VALUES('1643','2014-10-17 08:49:02','admin','Agileone','Task','INFO','Add task successfully [ID=72]');
INSERT INTO logging VALUES('1644','2014-10-17 08:49:06','admin','Agileone','Defect','INFO','Update task status to finished [ID=69]');
INSERT INTO logging VALUES('1645','2014-10-17 08:49:07','admin','Agileone','Task','INFO','Add task successfully [ID=73]');
INSERT INTO logging VALUES('1646','2014-10-17 08:49:08','admin','Agileone','Defect','INFO','Update task status to finished [ID=66]');
INSERT INTO logging VALUES('1647','2014-10-17 08:49:10','admin','Agileone','Task','INFO','Add task successfully [ID=74]');
INSERT INTO logging VALUES('1648','2014-10-17 08:49:22','admin','Agileone','UserStory','INFO','Delete userstory successfully [ID=346]');
INSERT INTO logging VALUES('1649','2014-10-17 08:49:24','admin','Agileone','UserStory','INFO','Delete userstory successfully [ID=345]');
INSERT INTO logging VALUES('1650','2014-10-17 08:49:24','admin','Agileone','UserStory','ERROR','Update userstory unsuccessfully [ID=346]');
INSERT INTO logging VALUES('1651','2014-10-17 08:49:28','admin','Agileone','UserStory','ERROR','Update userstory unsuccessfully [ID=346]');
INSERT INTO logging VALUES('1652','2014-10-17 08:49:29','admin','Agileone','UserStory','ERROR','Update userstory unsuccessfully [ID=346]');
INSERT INTO logging VALUES('1653','2014-10-17 08:49:34','admin','Agileone','UserStory','INFO','Delete userstory successfully [ID=331]');
INSERT INTO logging VALUES('1654','2014-10-17 08:49:36','admin','Agileone','TestCase','INFO','Add testcase successfully [ID=13]');
INSERT INTO logging VALUES('1655','2014-10-17 08:49:38','admin','Agileone','UserStory','ERROR','Update userstory unsuccessfully [ID=346]');
INSERT INTO logging VALUES('1656','2014-10-17 08:49:54','denny','Agileone','TestCase','INFO','Add testcase successfully [ID=14]');
INSERT INTO logging VALUES('1657','2014-10-17 08:49:55','admin','Agileone','Spec','INFO','Add specification successfully [ID=12]');
INSERT INTO logging VALUES('1658','2014-10-17 08:50:06','admin','Agileone','UserStory','INFO','Add userstory successfully [ID=347]');
INSERT INTO logging VALUES('1659','2014-10-17 08:50:16','denny','Agileone','UserStory','INFO','Add userstory successfully [ID=348]');
INSERT INTO logging VALUES('1660','2014-10-17 08:50:20','denny','Agileone','UserStory','INFO','Add userstory successfully [ID=349]');
INSERT INTO logging VALUES('1661','2014-10-17 08:50:27','admin','Agileone','Execution','INFO','Add execution result successfully [ID=19]');
INSERT INTO logging VALUES('1662','2014-10-17 08:50:29','admin','Agileone','Execution','INFO','Add execution result successfully [ID=20]');
INSERT INTO logging VALUES('1663','2014-10-17 08:50:34','admin','Agileone','UserStory','INFO','Add userstory successfully [ID=350]');
INSERT INTO logging VALUES('1664','2014-10-17 08:51:09','denny','Agileone','UserStory','INFO','Add userstory successfully [ID=351]');
INSERT INTO logging VALUES('1665','2014-10-17 08:51:13','admin','Agileone','UserStory','INFO','Add userstory successfully [ID=352]');
INSERT INTO logging VALUES('1666','2014-10-17 08:51:31','admin','Agileone','Notice','INFO','Add notice successfully [ID=64]');
INSERT INTO logging VALUES('1667','2014-10-17 08:51:31','denny','Agileone','TestCase','INFO','Add testcase successfully [ID=15]');
INSERT INTO logging VALUES('1668','2014-10-17 08:51:33','admin','System','Admin','INFO','Add project successfully [ID=2]');
INSERT INTO logging VALUES('1669','2014-10-17 08:51:33','admin','System','Admin','INFO','Create folder sdf successfully');
INSERT INTO logging VALUES('1670','2014-10-17 08:51:41','admin','Agileone','UserStory','INFO','Delete userstory successfully [ID=352]');
INSERT INTO logging VALUES('1671','2014-10-17 08:51:46','admin','Agileone','UserStory','INFO','Delete userstory successfully [ID=350]');
INSERT INTO logging VALUES('1672','2014-10-17 08:51:50','admin','Agileone','UserStory','INFO','Add userstory successfully [ID=353]');
INSERT INTO logging VALUES('1673','2014-10-17 08:51:51','denny','Agileone','TestCase','INFO','Update testcase successfully [ID=15]');
INSERT INTO logging VALUES('1674','2014-10-17 08:51:59','admin','Agileone','UserStory','INFO','Add userstory successfully [ID=354]');
INSERT INTO logging VALUES('1675','2014-10-17 08:52:07','admin','Agileone','UserStory','INFO','Add userstory successfully [ID=355]');
INSERT INTO logging VALUES('1676','2014-10-17 08:52:11','admin','Agileone','UserStory','INFO','Add userstory successfully [ID=356]');
INSERT INTO logging VALUES('1677','2014-10-17 08:52:12','admin','Agileone','UserStory','INFO','Update userstory successfully [ID=196]');
INSERT INTO logging VALUES('1678','2014-10-17 08:52:22','admin','System','Admin','INFO','Delete project successfully [ID=2]');
INSERT INTO logging VALUES('1679','2014-10-17 08:52:27','admin','Agileone','UserStory','INFO','Add userstory successfully [ID=357]');
INSERT INTO logging VALUES('1680','2014-10-17 08:52:33','admin','System','Admin','INFO','Add project successfully [ID=3]');
INSERT INTO logging VALUES('1681','2014-10-17 08:52:33','admin','System','Admin','INFO','Create folder dgfhdg successfully');
INSERT INTO logging VALUES('1682','2014-10-17 08:52:40','admin','Agileone','UserStory','INFO','Add userstory successfully [ID=358]');
INSERT INTO logging VALUES('1683','2014-10-17 08:52:40','admin','Agileone','UserStory','INFO','Update userstory successfully [ID=348]');
INSERT INTO logging VALUES('1684','2014-10-17 08:53:11','admin','Agileone','UserStory','INFO','Add userstory successfully [ID=359]');
INSERT INTO logging VALUES('1685','2014-10-17 08:53:19','admin','Agileone','UserStory','INFO','Add userstory successfully [ID=360]');
INSERT INTO logging VALUES('1686','2014-10-17 08:53:22','admin','Agileone','UserStory','INFO','Add userstory successfully [ID=361]');
INSERT INTO logging VALUES('1687','2014-10-17 08:53:25','admin','Agileone','UserStory','INFO','Delete userstory successfully [ID=358]');
INSERT INTO logging VALUES('1688','2014-10-17 08:53:26','admin','Agileone','UserStory','INFO','Delete userstory successfully [ID=360]');
INSERT INTO logging VALUES('1689','2014-10-17 08:53:26','admin','Agileone','UserStory','INFO','Delete userstory successfully [ID=357]');
INSERT INTO logging VALUES('1690','2014-10-17 08:53:27','admin','Agileone','UserStory','INFO','Delete userstory successfully [ID=355]');
INSERT INTO logging VALUES('1691','2014-10-17 08:53:28','admin','Agileone','UserStory','INFO','Delete userstory successfully [ID=353]');
INSERT INTO logging VALUES('1692','2014-10-17 08:53:28','admin','Agileone','UserStory','INFO','Delete userstory successfully [ID=359]');
INSERT INTO logging VALUES('1693','2014-10-17 08:53:35','admin','Agileone','UserStory','INFO','Add userstory successfully [ID=362]');
INSERT INTO logging VALUES('1694','2014-10-17 08:53:46','skrillex','Agileone','UserStory','INFO','Delete userstory successfully [ID=362]');
INSERT INTO logging VALUES('1695','2014-10-17 08:53:46','denny','Agileone','UserStory','INFO','Add userstory successfully [ID=363]');
INSERT INTO logging VALUES('1696','2014-10-17 08:53:47','admin','Agileone','UserStory','INFO','Add userstory successfully [ID=364]');
INSERT INTO logging VALUES('1697','2014-10-17 08:53:47','skrillex','Agileone','UserStory','INFO','Delete userstory successfully [ID=361]');
INSERT INTO logging VALUES('1698','2014-10-17 08:53:48','skrillex','Agileone','UserStory','INFO','Delete userstory successfully [ID=356]');
INSERT INTO logging VALUES('1699','2014-10-17 08:53:48','skrillex','Agileone','UserStory','INFO','Delete userstory successfully [ID=354]');
INSERT INTO logging VALUES('1700','2014-10-17 08:53:49','skrillex','Agileone','UserStory','INFO','Delete userstory successfully [ID=351]');
INSERT INTO logging VALUES('1701','2014-10-17 08:53:50','skrillex','Agileone','UserStory','INFO','Delete userstory successfully [ID=349]');
INSERT INTO logging VALUES('1702','2014-10-17 08:53:50','skrillex','Agileone','UserStory','INFO','Delete userstory successfully [ID=348]');
INSERT INTO logging VALUES('1703','2014-10-17 08:53:51','skrillex','Agileone','UserStory','INFO','Delete userstory successfully [ID=347]');
INSERT INTO logging VALUES('1704','2014-10-17 08:53:51','skrillex','Agileone','UserStory','INFO','Delete userstory successfully [ID=344]');
INSERT INTO logging VALUES('1705','2014-10-17 08:53:52','skrillex','Agileone','UserStory','INFO','Delete userstory successfully [ID=343]');
INSERT INTO logging VALUES('1706','2014-10-17 08:53:53','skrillex','Agileone','UserStory','INFO','Delete userstory successfully [ID=342]');
INSERT INTO logging VALUES('1707','2014-10-17 08:53:54','skrillex','Agileone','UserStory','INFO','Delete userstory successfully [ID=341]');
INSERT INTO logging VALUES('1708','2014-10-17 08:53:55','skrillex','Agileone','UserStory','INFO','Delete userstory successfully [ID=340]');
INSERT INTO logging VALUES('1709','2014-10-17 08:53:56','skrillex','Agileone','UserStory','INFO','Delete userstory successfully [ID=339]');
INSERT INTO logging VALUES('1710','2014-10-17 08:53:56','skrillex','Agileone','UserStory','INFO','Delete userstory successfully [ID=338]');
INSERT INTO logging VALUES('1711','2014-10-17 08:53:57','skrillex','Agileone','UserStory','INFO','Delete userstory successfully [ID=337]');
INSERT INTO logging VALUES('1712','2014-10-17 08:53:58','skrillex','Agileone','UserStory','INFO','Delete userstory successfully [ID=336]');
INSERT INTO logging VALUES('1713','2014-10-17 08:53:59','skrillex','Agileone','UserStory','INFO','Delete userstory successfully [ID=334]');
INSERT INTO logging VALUES('1714','2014-10-17 08:53:59','denny','Agileone','UserStory','INFO','Add userstory successfully [ID=365]');
INSERT INTO logging VALUES('1715','2014-10-17 08:54:00','skrillex','Agileone','UserStory','INFO','Delete userstory successfully [ID=333]');
INSERT INTO logging VALUES('1716','2014-10-17 08:54:00','skrillex','Agileone','UserStory','INFO','Delete userstory successfully [ID=332]');
INSERT INTO logging VALUES('1717','2014-10-17 08:54:01','skrillex','Agileone','UserStory','INFO','Delete userstory successfully [ID=322]');
INSERT INTO logging VALUES('1718','2014-10-17 08:54:01','admin','Agileone','UserStory','INFO','Add userstory successfully [ID=366]');
INSERT INTO logging VALUES('1719','2014-10-17 08:54:02','skrillex','Agileone','UserStory','INFO','Delete userstory successfully [ID=318]');
INSERT INTO logging VALUES('1720','2014-10-17 08:54:03','skrillex','Agileone','UserStory','INFO','Delete userstory successfully [ID=315]');
INSERT INTO logging VALUES('1721','2014-10-17 08:54:05','skrillex','Agileone','UserStory','INFO','Delete userstory successfully [ID=314]');
INSERT INTO logging VALUES('1722','2014-10-17 08:54:05','skrillex','Agileone','UserStory','INFO','Delete userstory successfully [ID=262]');
INSERT INTO logging VALUES('1723','2014-10-17 08:54:06','skrillex','Agileone','UserStory','INFO','Delete userstory successfully [ID=266]');
INSERT INTO logging VALUES('1724','2014-10-17 08:54:07','skrillex','Agileone','UserStory','INFO','Delete userstory successfully [ID=294]');
INSERT INTO logging VALUES('1725','2014-10-17 08:54:07','skrillex','Agileone','UserStory','INFO','Delete userstory successfully [ID=295]');
INSERT INTO logging VALUES('1726','2014-10-17 08:54:08','skrillex','Agileone','UserStory','INFO','Delete userstory successfully [ID=299]');
INSERT INTO logging VALUES('1727','2014-10-17 08:54:09','skrillex','Agileone','UserStory','INFO','Delete userstory successfully [ID=300]');
INSERT INTO logging VALUES('1728','2014-10-17 08:54:11','admin','Agileone','UserStory','ERROR','Update userstory unsuccessfully [ID=349]');
INSERT INTO logging VALUES('1729','2014-10-17 08:54:14','admin','Agileone','UserStory','INFO','Add userstory successfully [ID=367]');
INSERT INTO logging VALUES('1730','2014-10-17 08:54:17','skrillex','Agileone','UserStory','INFO','Delete userstory successfully [ID=180]');
INSERT INTO logging VALUES('1731','2014-10-17 08:54:18','skrillex','Agileone','UserStory','INFO','Delete userstory successfully [ID=187]');
INSERT INTO logging VALUES('1732','2014-10-17 08:54:18','skrillex','Agileone','UserStory','INFO','Delete userstory successfully [ID=190]');
INSERT INTO logging VALUES('1733','2014-10-17 08:54:19','skrillex','Agileone','UserStory','INFO','Delete userstory successfully [ID=191]');
INSERT INTO logging VALUES('1734','2014-10-17 08:54:19','denny','Agileone','UserStory','INFO','Add userstory successfully [ID=368]');
INSERT INTO logging VALUES('1735','2014-10-17 08:54:19','admin','Agileone','UserStory','INFO','Add userstory successfully [ID=369]');
INSERT INTO logging VALUES('1736','2014-10-17 08:54:19','skrillex','Agileone','UserStory','INFO','Delete userstory successfully [ID=196]');
INSERT INTO logging VALUES('1737','2014-10-17 08:54:20','skrillex','Agileone','UserStory','INFO','Delete userstory successfully [ID=200]');
INSERT INTO logging VALUES('1738','2014-10-17 08:54:20','skrillex','Agileone','UserStory','INFO','Delete userstory successfully [ID=205]');
INSERT INTO logging VALUES('1739','2014-10-17 08:54:21','skrillex','Agileone','UserStory','INFO','Delete userstory successfully [ID=260]');
INSERT INTO logging VALUES('1740','2014-10-17 08:54:22','skrillex','Agileone','UserStory','INFO','Delete userstory successfully [ID=363]');
INSERT INTO logging VALUES('1741','2014-10-17 08:54:22','skrillex','Agileone','UserStory','INFO','Delete userstory successfully [ID=364]');
INSERT INTO logging VALUES('1742','2014-10-17 08:54:24','skrillex','Agileone','UserStory','INFO','Delete userstory successfully [ID=365]');
INSERT INTO logging VALUES('1743','2014-10-17 08:54:25','admin','Agileone','UserStory','INFO','Add userstory successfully [ID=370]');
INSERT INTO logging VALUES('1744','2014-10-17 08:54:25','skrillex','Agileone','UserStory','INFO','Delete userstory successfully [ID=366]');
INSERT INTO logging VALUES('1745','2014-10-17 08:54:27','admin','Agileone','UserStory','INFO','Delete userstory successfully [ID=369]');
INSERT INTO logging VALUES('1746','2014-10-17 08:54:28','skrillex','Agileone','UserStory','INFO','Delete userstory successfully [ID=367]');
INSERT INTO logging VALUES('1747','2014-10-17 08:54:28','skrillex','Agileone','UserStory','INFO','Delete userstory successfully [ID=368]');
INSERT INTO logging VALUES('1748','2014-10-17 08:54:29','admin','Agileone','UserStory','INFO','Add userstory successfully [ID=371]');
INSERT INTO logging VALUES('1749','2014-10-17 08:54:29','admin','Agileone','UserStory','INFO','Add userstory successfully [ID=372]');
INSERT INTO logging VALUES('1750','2014-10-17 08:54:30','skrillex','Agileone','UserStory','INFO','Delete userstory successfully [ID=370]');
INSERT INTO logging VALUES('1751','2014-10-17 08:54:33','admin','Agileone','UserStory','ERROR','Update userstory unsuccessfully [ID=367]');
INSERT INTO logging VALUES('1752','2014-10-17 08:54:33','admin','Agileone','UserStory','INFO','Add userstory successfully [ID=373]');
INSERT INTO logging VALUES('1753','2014-10-17 08:54:34','admin','Agileone','UserStory','ERROR','Update userstory unsuccessfully [ID=367]');
INSERT INTO logging VALUES('1754','2014-10-17 08:54:34','admin','Agileone','UserStory','ERROR','Update userstory unsuccessfully [ID=367]');
INSERT INTO logging VALUES('1755','2014-10-17 08:54:35','admin','Agileone','UserStory','ERROR','Update userstory unsuccessfully [ID=367]');
INSERT INTO logging VALUES('1756','2014-10-17 08:54:35','admin','Agileone','UserStory','ERROR','Update userstory unsuccessfully [ID=367]');
INSERT INTO logging VALUES('1757','2014-10-17 08:54:36','admin','Agileone','UserStory','ERROR','Update userstory unsuccessfully [ID=367]');
INSERT INTO logging VALUES('1758','2014-10-17 08:54:36','denny','Agileone','UserStory','INFO','Add userstory successfully [ID=374]');
INSERT INTO logging VALUES('1759','2014-10-17 08:54:36','admin','Agileone','UserStory','ERROR','Update userstory unsuccessfully [ID=367]');
INSERT INTO logging VALUES('1760','2014-10-17 08:54:36','admin','Agileone','UserStory','ERROR','Update userstory unsuccessfully [ID=367]');
INSERT INTO logging VALUES('1761','2014-10-17 08:54:37','admin','Agileone','UserStory','INFO','Delete userstory successfully [ID=372]');
INSERT INTO logging VALUES('1762','2014-10-17 08:54:37','admin','Agileone','UserStory','ERROR','Update userstory unsuccessfully [ID=367]');
INSERT INTO logging VALUES('1763','2014-10-17 08:54:37','admin','Agileone','UserStory','ERROR','Update userstory unsuccessfully [ID=367]');
INSERT INTO logging VALUES('1764','2014-10-17 08:54:37','skrillex','Agileone','UserStory','INFO','Delete userstory successfully [ID=373]');
INSERT INTO logging VALUES('1765','2014-10-17 08:54:38','admin','Agileone','UserStory','ERROR','Update userstory unsuccessfully [ID=367]');
INSERT INTO logging VALUES('1766','2014-10-17 08:54:38','admin','Agileone','UserStory','ERROR','Update userstory unsuccessfully [ID=367]');
INSERT INTO logging VALUES('1767','2014-10-17 08:54:38','admin','Agileone','UserStory','ERROR','Update userstory unsuccessfully [ID=367]');
INSERT INTO logging VALUES('1768','2014-10-17 08:54:39','skrillex','Agileone','UserStory','INFO','Delete userstory successfully [ID=371]');
INSERT INTO logging VALUES('1769','2014-10-17 08:54:41','admin','Agileone','UserStory','ERROR','Update userstory unsuccessfully [ID=367]');
INSERT INTO logging VALUES('1770','2014-10-17 08:54:41','admin','Agileone','UserStory','ERROR','Update userstory unsuccessfully [ID=367]');
INSERT INTO logging VALUES('1771','2014-10-17 08:54:42','admin','Agileone','UserStory','ERROR','Update userstory unsuccessfully [ID=367]');
INSERT INTO logging VALUES('1772','2014-10-17 08:54:42','admin','Agileone','System','INFO','User login successfully [admin] - 192.168.4.120');
INSERT INTO logging VALUES('1773','2014-10-17 08:54:43','skrillex','Agileone','UserStory','INFO','Delete userstory successfully [ID=374]');
INSERT INTO logging VALUES('1774','2014-10-17 08:54:49','denny','Agileone','UserStory','INFO','Add userstory successfully [ID=375]');
INSERT INTO logging VALUES('1775','2014-10-17 08:54:52','admin','Agileone','UserStory','ERROR','Update userstory unsuccessfully [ID=367]');
INSERT INTO logging VALUES('1776','2014-10-17 08:54:53','admin','Agileone','UserStory','INFO','Add userstory successfully [ID=376]');
INSERT INTO logging VALUES('1777','2014-10-17 08:54:54','admin','Agileone','UserStory','INFO','Delete userstory successfully [ID=375]');
INSERT INTO logging VALUES('1778','2014-10-17 08:54:56','skrillex','Agileone','UserStory','INFO','Delete userstory successfully [ID=376]');
INSERT INTO logging VALUES('1779','2014-10-17 08:55:00','admin','Agileone','Task','INFO','Add task successfully [ID=75]');
INSERT INTO logging VALUES('1780','2014-10-17 08:55:21','admin','Agileone','UserStory','INFO','Add userstory successfully [ID=377]');
INSERT INTO logging VALUES('1781','2014-10-17 08:55:25','admin','Agileone','UserStory','INFO','Add userstory successfully [ID=378]');
INSERT INTO logging VALUES('1782','2014-10-17 08:55:39','admin','Agileone','Notice','INFO','Add notice successfully [ID=65]');
INSERT INTO logging VALUES('1783','2014-10-17 08:55:41','admin','Agileone','UserStory','INFO','Add userstory successfully [ID=379]');
INSERT INTO logging VALUES('1784','2014-10-17 08:55:47','admin','Agileone','UserStory','INFO','Delete userstory successfully [ID=378]');
INSERT INTO logging VALUES('1785','2014-10-17 08:55:50','admin','Agileone','UserStory','INFO','Add userstory successfully [ID=380]');
INSERT INTO logging VALUES('1786','2014-10-17 08:55:54','admin','Agileone','UserStory','INFO','Add userstory successfully [ID=381]');
INSERT INTO logging VALUES('1787','2014-10-17 08:56:03','admin','Agileone','UserStory','INFO','Add userstory successfully [ID=382]');
INSERT INTO logging VALUES('1788','2014-10-17 08:56:03','skrillex','Agileone','UserStory','INFO','Delete userstory successfully [ID=377]');
INSERT INTO logging VALUES('1789','2014-10-17 08:56:03','skrillex','Agileone','UserStory','INFO','Delete userstory successfully [ID=379]');
INSERT INTO logging VALUES('1790','2014-10-17 08:56:04','denny','Agileone','UserStory','INFO','Add userstory successfully [ID=383]');
INSERT INTO logging VALUES('1791','2014-10-17 08:56:04','skrillex','Agileone','UserStory','INFO','Delete userstory successfully [ID=380]');
INSERT INTO logging VALUES('1792','2014-10-17 08:56:06','skrillex','Agileone','UserStory','INFO','Delete userstory successfully [ID=381]');
INSERT INTO logging VALUES('1793','2014-10-17 08:56:07','denny','Agileone','UserStory','INFO','Add userstory successfully [ID=384]');
INSERT INTO logging VALUES('1794','2014-10-17 08:56:09','skrillex','Agileone','UserStory','INFO','Delete userstory successfully [ID=382]');
INSERT INTO logging VALUES('1795','2014-10-17 08:56:10','admin','Agileone','UserStory','INFO','Add userstory successfully [ID=385]');
INSERT INTO logging VALUES('1796','2014-10-17 08:56:10','skrillex','Agileone','UserStory','INFO','Delete userstory successfully [ID=383]');
INSERT INTO logging VALUES('1797','2014-10-17 08:56:13','skrillex','Agileone','UserStory','INFO','Delete userstory successfully [ID=384]');
INSERT INTO logging VALUES('1798','2014-10-17 08:56:14','skrillex','Agileone','UserStory','INFO','Delete userstory successfully [ID=385]');
INSERT INTO logging VALUES('1799','2014-10-17 08:56:19','admin','Agileone','UserStory','INFO','Add userstory successfully [ID=386]');
INSERT INTO logging VALUES('1800','2014-10-17 08:56:20','admin','Agileone','UserStory','INFO','Add userstory successfully [ID=387]');
INSERT INTO logging VALUES('1801','2014-10-17 08:56:20','admin','Agileone','UserStory','INFO','Add userstory successfully [ID=388]');
INSERT INTO logging VALUES('1802','2014-10-17 08:56:22','admin','Agileone','UserStory','INFO','Add userstory successfully [ID=389]');
INSERT INTO logging VALUES('1803','2014-10-17 08:56:24','admin','Agileone','UserStory','INFO','Add userstory successfully [ID=390]');
INSERT INTO logging VALUES('1804','2014-10-17 08:56:29','admin','Agileone','UserStory','INFO','Add userstory successfully [ID=391]');
INSERT INTO logging VALUES('1805','2014-10-17 08:56:34','skrillex','Agileone','UserStory','INFO','Delete userstory successfully [ID=386]');
INSERT INTO logging VALUES('1806','2014-10-17 08:56:35','skrillex','Agileone','UserStory','INFO','Delete userstory successfully [ID=387]');
INSERT INTO logging VALUES('1807','2014-10-17 08:56:35','skrillex','Agileone','UserStory','INFO','Delete userstory successfully [ID=388]');
INSERT INTO logging VALUES('1808','2014-10-17 08:56:36','skrillex','Agileone','UserStory','INFO','Delete userstory successfully [ID=389]');
INSERT INTO logging VALUES('1809','2014-10-17 08:56:37','admin','Agileone','UserStory','INFO','Add userstory successfully [ID=392]');
INSERT INTO logging VALUES('1810','2014-10-17 08:56:37','skrillex','Agileone','UserStory','INFO','Delete userstory successfully [ID=390]');
INSERT INTO logging VALUES('1811','2014-10-17 08:56:38','skrillex','Agileone','UserStory','INFO','Delete userstory successfully [ID=391]');
INSERT INTO logging VALUES('1812','2014-10-17 08:56:45','skrillex','Agileone','UserStory','INFO','Delete userstory successfully [ID=392]');
INSERT INTO logging VALUES('1813','2014-10-17 08:56:48','admin','Agileone','Task','INFO','Add task successfully [ID=76]');
INSERT INTO logging VALUES('1814','2014-10-17 08:56:52','admin','Agileone','UserStory','INFO','Add userstory successfully [ID=393]');
INSERT INTO logging VALUES('1815','2014-10-17 08:56:56','admin','Agileone','Task','INFO','Add task successfully [ID=77]');
INSERT INTO logging VALUES('1816','2014-10-17 08:56:57','admin','Agileone','UserStory','ERROR','Update userstory unsuccessfully [ID=382]');
INSERT INTO logging VALUES('1817','2014-10-17 08:56:58','admin','Agileone','UserStory','ERROR','Update userstory unsuccessfully [ID=382]');
INSERT INTO logging VALUES('1818','2014-10-17 08:56:59','admin','Agileone','UserStory','ERROR','Update userstory unsuccessfully [ID=382]');
INSERT INTO logging VALUES('1819','2014-10-17 08:56:59','admin','Agileone','UserStory','ERROR','Update userstory unsuccessfully [ID=382]');
INSERT INTO logging VALUES('1820','2014-10-17 08:57:00','admin','Agileone','UserStory','ERROR','Update userstory unsuccessfully [ID=382]');
INSERT INTO logging VALUES('1821','2014-10-17 08:57:00','admin','Agileone','UserStory','ERROR','Update userstory unsuccessfully [ID=382]');
INSERT INTO logging VALUES('1822','2014-10-17 08:57:01','admin','Agileone','UserStory','ERROR','Update userstory unsuccessfully [ID=382]');
INSERT INTO logging VALUES('1823','2014-10-17 08:57:01','admin','Agileone','UserStory','ERROR','Update userstory unsuccessfully [ID=382]');
INSERT INTO logging VALUES('1824','2014-10-17 08:57:02','admin','Agileone','UserStory','ERROR','Update userstory unsuccessfully [ID=382]');
INSERT INTO logging VALUES('1825','2014-10-17 08:57:03','admin','Agileone','UserStory','ERROR','Update userstory unsuccessfully [ID=382]');
INSERT INTO logging VALUES('1826','2014-10-17 08:57:04','admin','Agileone','UserStory','ERROR','Update userstory unsuccessfully [ID=382]');
INSERT INTO logging VALUES('1827','2014-10-17 08:57:05','admin','Agileone','UserStory','ERROR','Update userstory unsuccessfully [ID=382]');
INSERT INTO logging VALUES('1828','2014-10-17 08:57:05','admin','Agileone','Defect','INFO','Update task status to finished [ID=77]');
INSERT INTO logging VALUES('1829','2014-10-17 08:57:05','admin','Agileone','UserStory','ERROR','Update userstory unsuccessfully [ID=382]');
INSERT INTO logging VALUES('1830','2014-10-17 08:57:06','admin','Agileone','UserStory','ERROR','Update userstory unsuccessfully [ID=382]');
INSERT INTO logging VALUES('1831','2014-10-17 08:57:06','admin','Agileone','Defect','INFO','Update task status to finished [ID=75]');
INSERT INTO logging VALUES('1832','2014-10-17 08:57:07','admin','Agileone','UserStory','ERROR','Update userstory unsuccessfully [ID=382]');
INSERT INTO logging VALUES('1833','2014-10-17 08:57:07','admin','Agileone','Task','INFO','Add task successfully [ID=78]');
INSERT INTO logging VALUES('1834','2014-10-17 08:57:09','admin','Agileone','UserStory','ERROR','Update userstory unsuccessfully [ID=392]');
INSERT INTO logging VALUES('1835','2014-10-17 08:57:11','admin','Agileone','UserStory','ERROR','Update userstory unsuccessfully [ID=392]');
INSERT INTO logging VALUES('1836','2014-10-17 08:57:13','admin','Agileone','UserStory','ERROR','Update userstory unsuccessfully [ID=392]');
INSERT INTO logging VALUES('1837','2014-10-17 08:57:13','admin','Agileone','System','INFO','User login successfully [admin] - 192.168.4.115');
INSERT INTO logging VALUES('1838','2014-10-17 08:57:13','admin','Agileone','UserStory','ERROR','Update userstory unsuccessfully [ID=392]');
INSERT INTO logging VALUES('1839','2014-10-17 08:57:22','denny','Agileone','UserStory','INFO','Add userstory successfully [ID=394]');
INSERT INTO logging VALUES('1840','2014-10-17 08:57:22','admin','Agileone','UserStory','INFO','Add userstory successfully [ID=395]');
INSERT INTO logging VALUES('1841','2014-10-17 08:57:26','admin','Agileone','Task','INFO','Add task successfully [ID=79]');
INSERT INTO logging VALUES('1842','2014-10-17 08:57:26','admin','Agileone','UserStory','INFO','Add userstory successfully [ID=396]');
INSERT INTO logging VALUES('1843','2014-10-17 08:57:27','admin','Agileone','UserStory','INFO','Add userstory successfully [ID=397]');
INSERT INTO logging VALUES('1844','2014-10-17 08:57:28','admin','Agileone','UserStory','INFO','Add userstory successfully [ID=398]');
INSERT INTO logging VALUES('1845','2014-10-17 08:57:29','admin','Agileone','UserStory','INFO','Add userstory successfully [ID=399]');
INSERT INTO logging VALUES('1846','2014-10-17 08:57:29','admin','Agileone','UserStory','INFO','Add userstory successfully [ID=400]');
INSERT INTO logging VALUES('1847','2014-10-17 08:57:30','denny','Agileone','UserStory','INFO','Add userstory successfully [ID=401]');
INSERT INTO logging VALUES('1848','2014-10-17 08:57:30','admin','Agileone','UserStory','INFO','Add userstory successfully [ID=402]');
INSERT INTO logging VALUES('1849','2014-10-17 08:57:30','admin','Agileone','UserStory','INFO','Add userstory successfully [ID=403]');
INSERT INTO logging VALUES('1850','2014-10-17 08:57:31','admin','Agileone','UserStory','INFO','Add userstory successfully [ID=404]');
INSERT INTO logging VALUES('1851','2014-10-17 08:57:31','admin','Agileone','UserStory','INFO','Add userstory successfully [ID=405]');
INSERT INTO logging VALUES('1852','2014-10-17 08:57:32','admin','Agileone','UserStory','INFO','Add userstory successfully [ID=406]');
INSERT INTO logging VALUES('1853','2014-10-17 08:57:32','admin','Agileone','UserStory','INFO','Add userstory successfully [ID=407]');
INSERT INTO logging VALUES('1854','2014-10-17 08:57:32','admin','Agileone','UserStory','INFO','Add userstory successfully [ID=408]');
INSERT INTO logging VALUES('1855','2014-10-17 08:57:33','admin','Agileone','UserStory','INFO','Add userstory successfully [ID=409]');
INSERT INTO logging VALUES('1856','2014-10-17 08:57:33','admin','Agileone','UserStory','INFO','Add userstory successfully [ID=410]');
INSERT INTO logging VALUES('1857','2014-10-17 08:57:33','admin','Agileone','UserStory','INFO','Add userstory successfully [ID=411]');
INSERT INTO logging VALUES('1858','2014-10-17 08:57:34','admin','Agileone','UserStory','INFO','Add userstory successfully [ID=412]');
INSERT INTO logging VALUES('1859','2014-10-17 08:57:34','admin','Agileone','UserStory','INFO','Add userstory successfully [ID=413]');
INSERT INTO logging VALUES('1860','2014-10-17 08:57:35','admin','Agileone','UserStory','INFO','Add userstory successfully [ID=414]');
INSERT INTO logging VALUES('1861','2014-10-17 08:57:35','admin','Agileone','UserStory','INFO','Add userstory successfully [ID=415]');
INSERT INTO logging VALUES('1862','2014-10-17 08:57:35','admin','Agileone','UserStory','INFO','Add userstory successfully [ID=416]');
INSERT INTO logging VALUES('1863','2014-10-17 08:57:36','admin','Agileone','UserStory','INFO','Add userstory successfully [ID=417]');
INSERT INTO logging VALUES('1864','2014-10-17 08:57:36','admin','Agileone','UserStory','INFO','Add userstory successfully [ID=418]');
INSERT INTO logging VALUES('1865','2014-10-17 08:57:37','admin','Agileone','UserStory','INFO','Add userstory successfully [ID=419]');
INSERT INTO logging VALUES('1866','2014-10-17 08:57:37','admin','Agileone','UserStory','INFO','Add userstory successfully [ID=420]');
INSERT INTO logging VALUES('1867','2014-10-17 08:57:37','admin','Agileone','System','INFO','User logout successfully [admin]');
INSERT INTO logging VALUES('1868','2014-10-17 08:57:37','admin','Agileone','UserStory','INFO','Add userstory successfully [ID=421]');
INSERT INTO logging VALUES('1869','2014-10-17 08:57:37','admin','Agileone','UserStory','ERROR','Update userstory unsuccessfully [ID=389]');
INSERT INTO logging VALUES('1870','2014-10-17 08:57:38','admin','Agileone','UserStory','INFO','Add userstory successfully [ID=422]');
INSERT INTO logging VALUES('1871','2014-10-17 08:57:38','admin','Agileone','UserStory','INFO','Add userstory successfully [ID=423]');
INSERT INTO logging VALUES('1872','2014-10-17 08:57:39','admin','Agileone','UserStory','INFO','Add userstory successfully [ID=424]');
INSERT INTO logging VALUES('1873','2014-10-17 08:57:39','admin','Agileone','UserStory','INFO','Add userstory successfully [ID=425]');
INSERT INTO logging VALUES('1874','2014-10-17 08:57:39','admin','Agileone','UserStory','ERROR','Update userstory unsuccessfully [ID=389]');
INSERT INTO logging VALUES('1875','2014-10-17 08:57:40','admin','Agileone','UserStory','ERROR','Update userstory unsuccessfully [ID=389]');
INSERT INTO logging VALUES('1876','2014-10-17 08:57:40','admin','Agileone','UserStory','ERROR','Update userstory unsuccessfully [ID=389]');
INSERT INTO logging VALUES('1877','2014-10-17 08:57:41','admin','Agileone','UserStory','ERROR','Update userstory unsuccessfully [ID=389]');
INSERT INTO logging VALUES('1878','2014-10-17 08:57:41','admin','Agileone','UserStory','ERROR','Update userstory unsuccessfully [ID=389]');
INSERT INTO logging VALUES('1879','2014-10-17 08:57:41','admin','Agileone','Task','INFO','Add task successfully [ID=80]');
INSERT INTO logging VALUES('1880','2014-10-17 08:57:42','admin','Agileone','UserStory','ERROR','Update userstory unsuccessfully [ID=389]');
INSERT INTO logging VALUES('1881','2014-10-17 08:57:42','admin','Agileone','UserStory','ERROR','Update userstory unsuccessfully [ID=389]');
INSERT INTO logging VALUES('1882','2014-10-17 08:57:43','admin','Agileone','UserStory','ERROR','Update userstory unsuccessfully [ID=389]');
INSERT INTO logging VALUES('1883','2014-10-17 08:57:43','admin','Agileone','UserStory','ERROR','Update userstory unsuccessfully [ID=389]');
INSERT INTO logging VALUES('1884','2014-10-17 08:57:43','admin','Agileone','UserStory','ERROR','Update userstory unsuccessfully [ID=389]');
INSERT INTO logging VALUES('1885','2014-10-17 08:57:44','admin','Agileone','UserStory','ERROR','Update userstory unsuccessfully [ID=382]');
INSERT INTO logging VALUES('1886','2014-10-17 08:57:44','admin','Agileone','UserStory','ERROR','Update userstory unsuccessfully [ID=389]');
INSERT INTO logging VALUES('1887','2014-10-17 08:57:45','admin','Agileone','UserStory','ERROR','Update userstory unsuccessfully [ID=389]');
INSERT INTO logging VALUES('1888','2014-10-17 08:57:45','admin','Agileone','UserStory','ERROR','Update userstory unsuccessfully [ID=389]');
INSERT INTO logging VALUES('1889','2014-10-17 08:57:46','admin','Agileone','UserStory','ERROR','Update userstory unsuccessfully [ID=389]');
INSERT INTO logging VALUES('1890','2014-10-17 08:57:46','admin','Agileone','UserStory','ERROR','Update userstory unsuccessfully [ID=389]');
INSERT INTO logging VALUES('1891','2014-10-17 08:57:47','admin','Agileone','Task','INFO','Add task successfully [ID=81]');
INSERT INTO logging VALUES('1892','2014-10-17 08:57:47','denny','Agileone','UserStory','INFO','Add userstory successfully [ID=426]');
INSERT INTO logging VALUES('1893','2014-10-17 08:57:48','skrillex','Agileone','UserStory','INFO','Delete userstory successfully [ID=396]');
INSERT INTO logging VALUES('1894','2014-10-17 08:57:48','admin','Agileone','System','INFO','User login successfully [admin] - 192.168.4.109');
INSERT INTO logging VALUES('1895','2014-10-17 08:57:48','admin','Agileone','UserStory','ERROR','Update userstory unsuccessfully [ID=382]');
INSERT INTO logging VALUES('1896','2014-10-17 08:57:49','skrillex','Agileone','UserStory','INFO','Delete userstory successfully [ID=397]');
INSERT INTO logging VALUES('1897','2014-10-17 08:57:49','admin','Agileone','UserStory','ERROR','Update userstory unsuccessfully [ID=382]');
INSERT INTO logging VALUES('1898','2014-10-17 08:57:49','skrillex','Agileone','UserStory','INFO','Delete userstory successfully [ID=398]');
INSERT INTO logging VALUES('1899','2014-10-17 08:57:49','admin','Agileone','UserStory','ERROR','Update userstory unsuccessfully [ID=382]');
INSERT INTO logging VALUES('1900','2014-10-17 08:57:50','skrillex','Agileone','UserStory','INFO','Delete userstory successfully [ID=399]');
INSERT INTO logging VALUES('1901','2014-10-17 08:57:50','admin','Agileone','Task','INFO','Add task successfully [ID=82]');
INSERT INTO logging VALUES('1902','2014-10-17 08:57:50','admin','Agileone','UserStory','ERROR','Update userstory unsuccessfully [ID=382]');
INSERT INTO logging VALUES('1903','2014-10-17 08:57:51','skrillex','Agileone','UserStory','INFO','Delete userstory successfully [ID=400]');
INSERT INTO logging VALUES('1904','2014-10-17 08:57:52','skrillex','Agileone','UserStory','INFO','Delete userstory successfully [ID=401]');
INSERT INTO logging VALUES('1905','2014-10-17 08:57:52','denny','Agileone','UserStory','INFO','Add userstory successfully [ID=427]');
INSERT INTO logging VALUES('1906','2014-10-17 08:57:52','skrillex','Agileone','UserStory','INFO','Delete userstory successfully [ID=402]');
INSERT INTO logging VALUES('1907','2014-10-17 08:57:52','denny','Agileone','UserStory','INFO','Add userstory successfully [ID=428]');
INSERT INTO logging VALUES('1908','2014-10-17 08:57:53','skrillex','Agileone','UserStory','INFO','Delete userstory successfully [ID=403]');
INSERT INTO logging VALUES('1909','2014-10-17 08:57:53','denny','Agileone','UserStory','INFO','Add userstory successfully [ID=429]');
INSERT INTO logging VALUES('1910','2014-10-17 08:57:53','skrillex','Agileone','UserStory','INFO','Delete userstory successfully [ID=404]');
INSERT INTO logging VALUES('1911','2014-10-17 08:57:54','skrillex','Agileone','UserStory','INFO','Delete userstory successfully [ID=405]');
INSERT INTO logging VALUES('1912','2014-10-17 08:57:54','denny','Agileone','UserStory','INFO','Add userstory successfully [ID=430]');
INSERT INTO logging VALUES('1913','2014-10-17 08:57:55','skrillex','Agileone','UserStory','INFO','Delete userstory successfully [ID=406]');
INSERT INTO logging VALUES('1914','2014-10-17 08:57:55','denny','Agileone','UserStory','INFO','Add userstory successfully [ID=431]');
INSERT INTO logging VALUES('1915','2014-10-17 08:57:56','denny','Agileone','UserStory','INFO','Add userstory successfully [ID=432]');
INSERT INTO logging VALUES('1916','2014-10-17 08:57:56','skrillex','Agileone','UserStory','INFO','Delete userstory successfully [ID=407]');
INSERT INTO logging VALUES('1917','2014-10-17 08:57:57','skrillex','Agileone','UserStory','INFO','Delete userstory successfully [ID=408]');
INSERT INTO logging VALUES('1918','2014-10-17 08:57:57','denny','Agileone','UserStory','INFO','Add userstory successfully [ID=433]');
INSERT INTO logging VALUES('1919','2014-10-17 08:57:58','skrillex','Agileone','UserStory','INFO','Delete userstory successfully [ID=409]');
INSERT INTO logging VALUES('1920','2014-10-17 08:57:58','denny','Agileone','UserStory','INFO','Add userstory successfully [ID=434]');
INSERT INTO logging VALUES('1921','2014-10-17 08:57:58','skrillex','Agileone','UserStory','INFO','Delete userstory successfully [ID=410]');
INSERT INTO logging VALUES('1922','2014-10-17 08:57:58','denny','Agileone','UserStory','INFO','Add userstory successfully [ID=435]');
INSERT INTO logging VALUES('1923','2014-10-17 08:57:59','admin','Agileone','UserStory','INFO','Add userstory successfully [ID=436]');
INSERT INTO logging VALUES('1924','2014-10-17 08:57:59','skrillex','Agileone','UserStory','INFO','Delete userstory successfully [ID=411]');
INSERT INTO logging VALUES('1925','2014-10-17 08:57:59','denny','Agileone','UserStory','INFO','Add userstory successfully [ID=437]');
INSERT INTO logging VALUES('1926','2014-10-17 08:58:00','denny','Agileone','UserStory','INFO','Add userstory successfully [ID=438]');
INSERT INTO logging VALUES('1927','2014-10-17 08:58:00','skrillex','Agileone','UserStory','INFO','Delete userstory successfully [ID=412]');
INSERT INTO logging VALUES('1928','2014-10-17 08:58:01','admin','Agileone','UserStory','INFO','Add userstory successfully [ID=439]');
INSERT INTO logging VALUES('1929','2014-10-17 08:58:01','denny','Agileone','UserStory','INFO','Add userstory successfully [ID=440]');
INSERT INTO logging VALUES('1930','2014-10-17 08:58:01','skrillex','Agileone','UserStory','INFO','Delete userstory successfully [ID=413]');
INSERT INTO logging VALUES('1931','2014-10-17 08:58:02','skrillex','Agileone','UserStory','INFO','Delete userstory successfully [ID=414]');
INSERT INTO logging VALUES('1932','2014-10-17 08:58:02','admin','System','Admin','WARN','Clear expired cache successfully.');
INSERT INTO logging VALUES('1933','2014-10-17 08:58:02','denny','Agileone','UserStory','INFO','Add userstory successfully [ID=441]');
INSERT INTO logging VALUES('1934','2014-10-17 08:58:03','skrillex','Agileone','UserStory','INFO','Delete userstory successfully [ID=415]');
INSERT INTO logging VALUES('1935','2014-10-17 08:58:03','denny','Agileone','UserStory','INFO','Add userstory successfully [ID=442]');
INSERT INTO logging VALUES('1936','2014-10-17 08:58:03','admin','System','Admin','WARN','Clear all cache successfully.');
INSERT INTO logging VALUES('1937','2014-10-17 08:58:03','skrillex','Agileone','UserStory','INFO','Delete userstory successfully [ID=416]');
INSERT INTO logging VALUES('1938','2014-10-17 08:58:04','denny','Agileone','UserStory','INFO','Add userstory successfully [ID=443]');
INSERT INTO logging VALUES('1939','2014-10-17 08:58:04','admin','System','Admin','WARN','Clear all cache successfully.');
INSERT INTO logging VALUES('1940','2014-10-17 08:58:04','skrillex','Agileone','UserStory','INFO','Delete userstory successfully [ID=417]');
INSERT INTO logging VALUES('1941','2014-10-17 08:58:05','admin','System','Admin','INFO','Backup table schema successfully:<br>Agileone_Backup_20141017_085805.sql');
INSERT INTO logging VALUES('1942','2014-10-17 08:58:05','denny','Agileone','UserStory','INFO','Add userstory successfully [ID=444]');
INSERT INTO logging VALUES('1943','2014-10-17 08:58:05','skrillex','Agileone','UserStory','INFO','Delete userstory successfully [ID=418]');
INSERT INTO logging VALUES('1944','2014-10-17 08:58:05','admin','System','Admin','INFO','Backup database successfully:<br>Agileone_Backup_20141017_085805.sql');
INSERT INTO logging VALUES('1945','2014-10-17 08:58:05','denny','Agileone','UserStory','INFO','Add userstory successfully [ID=445]');

DROP TABLE IF EXISTS milestone;
CREATE TABLE `milestone` (
  `milestoneid` smallint(5) unsigned NOT NULL auto_increment,
  `projectid` smallint(5) unsigned NOT NULL,
  `msname` varchar(30) NOT NULL,
  `msusage` text NOT NULL,
  `createdtime` datetime NOT NULL,
  `updatedtime` datetime NOT NULL,
  PRIMARY KEY  (`milestoneid`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

INSERT INTO milestone VALUES('1','1','Milestone-Design','AgileOne architecture and design.','2010-04-15 14:02:04','2010-04-15 17:55:06');
INSERT INTO milestone VALUES('2','1','Milestone-GUI','AgileOne GUI layout and design.','2010-04-15 14:02:04','2010-04-15 17:55:11');
INSERT INTO milestone VALUES('3','1','Milestone-Admin','AgileOne admin modules coding and testing.','2010-04-15 14:02:04','2010-04-15 17:55:15');
INSERT INTO milestone VALUES('4','1','Milestone-Core','AgileOne core modules coding and testing.','2010-04-15 17:52:49','2010-04-15 17:55:19');
INSERT INTO milestone VALUES('5','1','Milestone-1.1','AgileOne version 1.1 coding and testing.','2010-04-15 17:53:48','2010-04-15 17:55:23');
INSERT INTO milestone VALUES('6','1','Milestone-1.2','AgileOne version 1.2 coding and testing.','2010-04-21 10:23:45','2010-04-21 10:23:45');
INSERT INTO milestone VALUES('7','2','Milestone1','Default milestone after project created.','2014-10-17 08:51:33','0000-00-00 00:00:00');
INSERT INTO milestone VALUES('8','2','Milestone2','Default milestone after project created.','2014-10-17 08:51:33','0000-00-00 00:00:00');
INSERT INTO milestone VALUES('9','2','Milestone3','Default milestone after project created.','2014-10-17 08:51:33','0000-00-00 00:00:00');
INSERT INTO milestone VALUES('10','3','Milestone1','Default milestone after project created.','2014-10-17 08:52:33','0000-00-00 00:00:00');
INSERT INTO milestone VALUES('11','3','Milestone2','Default milestone after project created.','2014-10-17 08:52:33','0000-00-00 00:00:00');
INSERT INTO milestone VALUES('12','3','Milestone3','Default milestone after project created.','2014-10-17 08:52:33','0000-00-00 00:00:00');

DROP TABLE IF EXISTS minutes;
CREATE TABLE `minutes` (
  `minutesid` smallint(5) unsigned NOT NULL auto_increment,
  `projectid` smallint(5) unsigned NOT NULL,
  `topic` tinytext NOT NULL,
  `holdtime` datetime NOT NULL,
  `venue` varchar(30) NOT NULL,
  `organizer` varchar(30) NOT NULL,
  `attendee` text NOT NULL,
  `resolution` text NOT NULL,
  `createdtime` datetime NOT NULL,
  `updatedtime` datetime NOT NULL,
  PRIMARY KEY  (`minutesid`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

INSERT INTO minutes VALUES('2','1','fasdfa','2014-10-17 09:00:00','','','fsadfa','fasdfad','2014-10-17 08:42:51','2014-10-17 08:42:51');

DROP TABLE IF EXISTS module;
CREATE TABLE `module` (
  `moduleid` smallint(5) unsigned NOT NULL auto_increment,
  `projectid` smallint(5) unsigned NOT NULL,
  `modname` varchar(30) NOT NULL,
  `modusage` text NOT NULL,
  PRIMARY KEY  (`moduleid`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

INSERT INTO module VALUES('1','1','System','System admin and architecture');
INSERT INTO module VALUES('2','1','Dashboard','Realtime data report');
INSERT INTO module VALUES('3','1','Notice','Company/Project notice to others');
INSERT INTO module VALUES('4','1','Minutes','Meeting minutes');
INSERT INTO module VALUES('5','1','Knowledge','Company/Project knowledge base');
INSERT INTO module VALUES('6','1','Project','Project configuration');
INSERT INTO module VALUES('7','1','Proposal','Manage project proposal');
INSERT INTO module VALUES('8','1','Userstory','Manage project userstory');
INSERT INTO module VALUES('9','1','Specification','Manage project specification docs');
INSERT INTO module VALUES('10','1','Testcase','Manage project test cases');
INSERT INTO module VALUES('11','1','Execution','Manage test result');
INSERT INTO module VALUES('12','1','Defect','Manage project defect');
INSERT INTO module VALUES('13','1','Task','Project task management');
INSERT INTO module VALUES('14','1','Other','Agileone other modules');

DROP TABLE IF EXISTS notice;
CREATE TABLE `notice` (
  `noticeid` smallint(5) unsigned NOT NULL auto_increment,
  `headline` tinytext NOT NULL,
  `content` text NOT NULL,
  `creator` varchar(30) NOT NULL,
  `expireddate` date NOT NULL,
  `scope` smallint(5) unsigned NOT NULL,
  `createdtime` datetime NOT NULL,
  `updatedtime` datetime NOT NULL,
  PRIMARY KEY  (`noticeid`)
) ENGINE=MyISAM AUTO_INCREMENT=66 DEFAULT CHARSET=utf8;

INSERT INTO notice VALUES('1','AgileJoy.com, 享受敏捷乐趣','<span>AgileJoy是一个致力于传播敏捷开发方法论和最佳实践的专业博客.<br />
<strong>我们的口号</strong>：享受敏捷的乐趣!<br />
<strong>我们的定位</strong>：敏捷领域传播者!<br />
<strong>我们的宗旨</strong>：让一切敏捷起来!<br />
欢迎大家一起讨论关于敏捷的原理方法，最佳实践以及各类开发测试框架，性能测试技术等!!</span>','denny','2012-07-14','0','2010-04-15 15:08:50','2010-04-21 10:21:09');
INSERT INTO notice VALUES('2','AgileOne 1.0 预览版发布 (特性介绍)','<p>AgileOne 1.0 版本包含如下特性：<br />
1) 完成了所有计划在1.0版本中完成的Usertory，详情可参考AgileOne项目的Userstory.<br />
2) 在线预览功能已经开通，用户可体验AgileOne本身的功能及敏捷开发基本流程，<a href="http://www.51testing.com/?uid/275266/one" target="_blank">http://www.51testing.com/?uid/275266/one</a> (登录名guest/guest).</p>
','denny','2010-07-14','0','2010-04-15 15:16:19','2010-04-21 20:41:52');
INSERT INTO notice VALUES('3','AgileOne 1.1 正式版发布 (特性介绍)','<p>AgileOne 1.1 版本包含如下特性：<br />
1) 修复了1.0版本中较严重的几个Bug，且完善了界面显示。并在Linux/Windows两个主流平台上进行了较完整的测试。<br />
2) 增加了安装程序，如果首次访问将会自动进入到安装向导页面，只有当用户正常配置好数据库连接信息才能访问。</p>
','denny','2010-07-20','0','2010-04-21 09:47:47','2010-04-21 10:21:30');
INSERT INTO notice VALUES('64','工地哥哥','搞得郭德纲的规定规定郭德纲','admin','2015-01-15','1','2014-10-17 08:51:31','2014-10-17 08:51:31');
INSERT INTO notice VALUES('65','额','的','admin','2015-01-15','1','2014-10-17 08:55:39','2014-10-17 08:55:39');

DROP TABLE IF EXISTS platform;
CREATE TABLE `platform` (
  `platformid` smallint(5) unsigned NOT NULL auto_increment,
  `projectid` smallint(5) unsigned NOT NULL,
  `pfname` tinytext NOT NULL,
  `pfusage` text NOT NULL,
  `createdtime` datetime NOT NULL,
  PRIMARY KEY  (`platformid`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

INSERT INTO platform VALUES('1','1','Windows XP - XAMPP1.6.8','Apache 2.2.4 - MySQL 5.0.67 - PHP 5.2.6','2010-04-15 15:44:51');
INSERT INTO platform VALUES('2','1','Redhat 5.4 - LAMP','Apache 2.2.4 - MySQL 5.0.56 - PHP 5.2.1','2010-04-15 15:52:01');

DROP TABLE IF EXISTS project;
CREATE TABLE `project` (
  `projectid` smallint(5) unsigned NOT NULL auto_increment,
  `projname` varchar(30) NOT NULL,
  `startdate` date NOT NULL,
  `finishdate` date NOT NULL,
  `status` varchar(30) NOT NULL,
  `customerid` smallint(5) unsigned NOT NULL,
  `overview` text NOT NULL,
  `createdtime` datetime NOT NULL,
  `updatedtime` datetime NOT NULL,
  PRIMARY KEY  (`projectid`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

INSERT INTO project VALUES('1','Agileone','2009-01-01','2010-12-31','Proposed','1','AgileOne 是一个轻量级的软件生命周期管理工具, 致力于优化敏捷开发模型的流程, 并集中管理所有项目资产.','2010-04-15 14:02:04','2014-10-17 07:57:40');
INSERT INTO project VALUES('3','dgfhdg','2014-10-17','2015-01-15','Proposed','0','<p>&nbsp;</p>
','2014-10-17 08:52:33','2014-10-17 08:52:33');

DROP TABLE IF EXISTS proposal;
CREATE TABLE `proposal` (
  `proposalid` smallint(5) unsigned NOT NULL auto_increment,
  `projectid` smallint(5) unsigned NOT NULL,
  `creator` varchar(30) NOT NULL,
  `type` varchar(30) NOT NULL,
  `importance` varchar(30) NOT NULL,
  `headline` tinytext NOT NULL,
  `content` text NOT NULL,
  `processed` tinyint(1) NOT NULL,
  `processresult` text NOT NULL,
  `createdtime` datetime NOT NULL,
  `updatedtime` datetime NOT NULL,
  PRIMARY KEY  (`proposalid`)
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

INSERT INTO proposal VALUES('1','1','denny','Enhancement','Medium','作为会议主持人，会议完成后可将待办事宜按人员分配','<p>会议上讨论出的待办事宜用任务的方式跟踪起来，并提供邮件提醒功能。</p>
','1','Created Userstory: 29 ## Created Userstory: 31 ## Created Userstory: 34 ## Created Userstory: 40 ## Created Userstory: 41 ## Created Userstory: 43 ## Created Userstory: 72 ## Created Userstory: 80 ## Created Userstory: 91 ## Created Userstory: 116 ## Created Userstory: 120 ## Created Userstory: 124 ## Created Userstory: 128 ## Created Userstory: 130 ## Created Userstory: 147 ## Created Userstory: 162 ## Created Userstory: 164 ## Created Userstory: 166 ## Created Userstory: 168 ## Created Userstory: 169 ## Created Userstory: 171 ## Created Userstory: 177 ## Created Userstory: 192 ## Created Userstory: 201 ## Created Userstory: 207 ## Created Userstory: 210 ## Created Userstory: 211 ## Created Userstory: 213 ## Created Userstory: 214 ## Created Userstory: 217 ## Created Userstory: 294 ## Created Userstory: 295 ## Created Userstory: 321 ## Created Userstory: 341 ## Created Userstory: 342 ## Created Userstory: 343 ## Created Userstory: 344 ## Created Userstory: 345 ## Created Userstory: 370 ## Created Userstory: 373','2010-04-15 22:17:03','2010-04-21 14:02:59');
INSERT INTO proposal VALUES('2','1','denny','Suggestion','Medium','提供Userstory拆分功能','如果一个Userstory包含的功能点太多，需要将此Userstory进行拆分，拆分成更容易理解和计划的更小的Userstory。','1','Created Userstory: 59 ## Created Userstory: 114 ## Created Userstory: 142 ## Created Userstory: 324 ## Created Userstory: 329 ## Created Userstory: 334 ## Created Userstory: 362 ## Created Userstory: 376 ## Created Userstory: 386','2010-04-21 14:24:43','2010-04-21 14:24:43');
INSERT INTO proposal VALUES('3','1','denny','Suggestion','Medium','提供对用户故事，规格说明，测试用例的版本控制功能','在一个敏捷项目中，用户故事，规格说明，测试用例是最重要的项目资产，可提供版本控制功能，保持对每一次的修改的完整跟踪。','1','Created Userstory: 24 ## Created Userstory: 48 ## Created Userstory: 54 ## Created Userstory: 58 ## Created Userstory: 182 ## Created Userstory: 194 ## Created Userstory: 266 ## Created Userstory: 267 ## Created Userstory: 289 ## Created Userstory: 290 ## Created Userstory: 303 ## Created Userstory: 306 ## Created Userstory: 311 ## Created Userstory: 313 ## Created Userstory: 319 ## Created Userstory: 325 ## Created Userstory: 364','2010-04-21 14:27:05','2010-04-21 14:27:05');
INSERT INTO proposal VALUES('4','1','denny','Enhancement','Medium','提供Dashboard功能，每一个角色都可及时获取指标数据','<p>对于一个项目，每一个角色都有一些关注的指标/数据，可提供Dashboard功能，将项目中最核心的指标展现出来。并且提供自定义报表生成功能(如缺陷状态报告，测试用例执行结果报告等)。</p>
','1','Created Userstory: 218 ## Created Userstory: 299','2010-04-21 14:31:44','2010-04-21 14:31:44');
INSERT INTO proposal VALUES('5','1','denny','Enhancement','Medium','管理员在后台可定义邮件发送功能的具体细节','<p>1. 定义邮件服务器参数，确保AgileOne可发出邮件(已实现)。<br />
2. 定义哪些模块需要将邮件发送，发送给哪些角色。<br />
3. 定义邮件发送内容及格式。</p>
','1','Created Userstory: 68 ## Created Userstory: 349 ## Created Userstory: 363 ## Created Userstory: 365 ## Created Userstory: 368 ## Created Userstory: 391','2010-04-21 14:33:51','2010-04-21 14:33:51');
INSERT INTO proposal VALUES('6','1','denny','Suggestion','Medium','使用不同颜色来管理不同的状态或者优先级等','<p>如题，更直观。</p>
','1','Created Userstory: 38 ## Created Userstory: 90 ## Created Userstory: 96 ## Created Userstory: 141 ## Created Userstory: 383','2010-04-21 14:36:10','2010-04-21 14:36:10');
INSERT INTO proposal VALUES('7','1','denny','Suggestion','Medium','提供一个项目组成员讨论功能','<p>类似论坛，但是只需要实现一些简单的功能即可。</p>
','1','Created Userstory: 60 ## Created Userstory: 77 ## Created Userstory: 84 ## Created Userstory: 89','2010-04-21 14:37:30','2010-04-21 14:37:30');
INSERT INTO proposal VALUES('8','1','denny','Suggestion','Medium','用户可定制首页，登录成功后定位到哪个页面','<p>用户可定制首页，登录成功后定位到哪个页面</p>
','1','Created Userstory: 104 ## Created Userstory: 180 ## Created Userstory: 272 ## Created Userstory: 273 ## Created Userstory: 274 ## Created Userstory: 275 ## Created Userstory: 276 ## Created Userstory: 277 ## Created Userstory: 317 ## Created Userstory: 323 ## Created Userstory: 388','2010-04-21 14:38:42','2010-04-21 14:38:42');

DROP TABLE IF EXISTS reply;
CREATE TABLE `reply` (
  `replyid` int(10) unsigned NOT NULL auto_increment,
  `refertype` varchar(30) NOT NULL,
  `referid` int(10) unsigned NOT NULL,
  `replier` varchar(30) NOT NULL,
  `content` text NOT NULL,
  `extraone` varchar(30) NOT NULL,
  `extratwo` varchar(30) NOT NULL,
  `createdtime` datetime NOT NULL,
  PRIMARY KEY  (`replyid`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

INSERT INTO reply VALUES('1','defect','1','denny','修改状态并传递到下一接管者.','Open','martin','2010-04-21 10:36:30');
INSERT INTO reply VALUES('2','defect','1','martin','已修复','Fixed','suki','2010-04-21 10:37:03');
INSERT INTO reply VALUES('3','defect','1','suki','已验证','Closed','','2010-04-21 10:40:58');
INSERT INTO reply VALUES('4','defect','2','denny','Change status and transfer to the next.','Open','denny','2010-04-21 15:19:00');

DROP TABLE IF EXISTS role;
CREATE TABLE `role` (
  `roleid` smallint(5) unsigned NOT NULL auto_increment,
  `rolename` varchar(30) NOT NULL,
  `roledesc` text NOT NULL,
  `dashboard` char(4) NOT NULL,
  `notice` char(4) NOT NULL,
  `minutes` char(4) NOT NULL,
  `knowledge` char(4) NOT NULL,
  `project` char(4) NOT NULL,
  `task` char(4) NOT NULL,
  `proposal` char(4) NOT NULL,
  `userstory` char(4) NOT NULL,
  `spec` char(4) NOT NULL,
  `testcase` char(4) NOT NULL,
  `execution` char(4) NOT NULL,
  `defect` char(4) NOT NULL,
  PRIMARY KEY  (`roleid`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

INSERT INTO role VALUES('1','Administrator','The system administrator and has full privilege.','1111','1111','1111','1111','1111','1111','1111','1111','1111','1111','1111','1111');
INSERT INTO role VALUES('2','Customer','The project customer for a few privilege.','0000','0000','0000','1111','0001','1111','1111','0001','0001','0001','0001','1111');
INSERT INTO role VALUES('3','ProductOwner','The supervisor to define the userstory and others.','1111','1111','1111','1111','0001','1111','1111','1111','0001','0001','0001','1111');
INSERT INTO role VALUES('4','ProjectManager','The project owner to handle daily project related work.','1111','1111','1111','1111','0101','1111','1111','1111','1111','1111','1111','1111');
INSERT INTO role VALUES('5','Developer','The developer or develop leader.','1111','1111','1111','1111','0001','1111','1111','0001','1111','1111','1101','1111');
INSERT INTO role VALUES('6','Tester','The tester or test leader.','1111','1111','1111','1111','0001','1111','1111','0001','0001','1111','1101','1111');
INSERT INTO role VALUES('7','Guest','The guest only has read privilege for all operations.','0001','0001','0001','0001','0001','0001','0001','0001','0001','0001','0001','0001');

DROP TABLE IF EXISTS spec;
CREATE TABLE `spec` (
  `specid` smallint(5) unsigned NOT NULL auto_increment,
  `projectid` smallint(5) unsigned NOT NULL,
  `userstoryid` smallint(5) unsigned NOT NULL,
  `creator` varchar(30) NOT NULL,
  `type` varchar(30) NOT NULL,
  `content` text NOT NULL,
  `createdtime` datetime NOT NULL,
  `updatedtime` datetime NOT NULL,
  PRIMARY KEY  (`specid`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

INSERT INTO spec VALUES('10','1','196','admin','All-In-One','好多','2014-10-17 08:48:45','2014-10-17 08:48:45');
INSERT INTO spec VALUES('11','1','334','admin','All-In-One','梵蒂冈梵蒂冈的郭德纲得高高的','2014-10-17 08:48:45','2014-10-17 08:48:45');
INSERT INTO spec VALUES('12','1','266','admin','All-In-One','ferfefewfewfew','2014-10-17 08:49:55','2014-10-17 08:49:55');

DROP TABLE IF EXISTS task;
CREATE TABLE `task` (
  `taskid` int(10) unsigned NOT NULL auto_increment,
  `userid` smallint(5) unsigned NOT NULL,
  `refertype` varchar(30) NOT NULL,
  `referid` int(10) unsigned NOT NULL,
  `content` text NOT NULL,
  `status` varchar(30) NOT NULL default 'assigned',
  `createdtime` datetime NOT NULL,
  `updatedtime` datetime NOT NULL,
  PRIMARY KEY  (`taskid`)
) ENGINE=MyISAM AUTO_INCREMENT=83 DEFAULT CHARSET=utf8;

INSERT INTO task VALUES('14','1','userstory','40','Assinged to work for userstory 40','finished','2014-10-17 07:56:42','2014-10-17 07:56:49');
INSERT INTO task VALUES('2','3','defect','1','Assinged to work for defect 1','assigned','2010-04-21 10:36:30','2010-04-21 10:36:30');
INSERT INTO task VALUES('3','4','defect','1','Assinged to work for defect 1','assigned','2010-04-21 10:37:03','2010-04-21 10:37:03');
INSERT INTO task VALUES('4','2','defect','2','Assinged to work for defect 2','assigned','2010-04-21 15:19:00','2010-04-21 15:19:00');
INSERT INTO task VALUES('19','1','userstory','57','Assinged to work for userstory 57','finished','2014-10-17 07:58:45','2014-10-17 08:00:58');
INSERT INTO task VALUES('10','1','userstory','0','Assinged to work for userstory ','finished','2014-10-17 07:53:38','2014-10-17 07:56:52');
INSERT INTO task VALUES('16','1','userstory','26','Assinged to work for userstory 26','finished','2014-10-17 07:57:30','2014-10-17 08:03:44');
INSERT INTO task VALUES('13','1','userstory','132123','Assinged to work for userstory 132123','finished','2014-10-17 07:54:07','2014-10-17 07:56:51');
INSERT INTO task VALUES('18','1','userstory','54','Assinged to work for userstory 54','finished','2014-10-17 07:58:07','2014-10-17 08:00:59');
INSERT INTO task VALUES('20','4','userstory','67','Assinged to work for userstory 67','assigned','2014-10-17 08:00:11','2014-10-17 08:00:11');
INSERT INTO task VALUES('21','2','userstory','0','Assinged to work for userstory ','assigned','2014-10-17 08:01:06','2014-10-17 08:01:06');
INSERT INTO task VALUES('65','6','userstory','0','Assinged to work for userstory ','assigned','2014-10-17 08:44:41','2014-10-17 08:44:41');
INSERT INTO task VALUES('23','5','userstory','0','Assinged to work for userstory ','assigned','2014-10-17 08:01:12','2014-10-17 08:01:12');
INSERT INTO task VALUES('25','4','userstory','0','Assinged to work for userstory ','assigned','2014-10-17 08:04:16','2014-10-17 08:04:16');
INSERT INTO task VALUES('26','4','userstory','61','Assinged to work for userstory 61','assigned','2014-10-17 08:04:23','2014-10-17 08:04:23');
INSERT INTO task VALUES('38','2','userstory','184','Assinged to work for userstory 184','assigned','2014-10-17 08:16:24','2014-10-17 08:16:24');
INSERT INTO task VALUES('36','1','userstory','141','Assinged to work for userstory 141','finished','2014-10-17 08:11:12','2014-10-17 08:13:44');
INSERT INTO task VALUES('37','3','userstory','141','Assinged to work for userstory 141','assigned','2014-10-17 08:11:17','2014-10-17 08:11:17');
INSERT INTO task VALUES('35','6','userstory','141','Assinged to work for userstory 141','assigned','2014-10-17 08:11:09','2014-10-17 08:11:09');
INSERT INTO task VALUES('79','7','userstory','266','Assinged to work for userstory 266','assigned','2014-10-17 08:57:26','2014-10-17 08:57:26');
INSERT INTO task VALUES('59','5','userstory','220','Assinged to work for userstory 220','assigned','2014-10-17 08:37:45','2014-10-17 08:37:45');
INSERT INTO task VALUES('58','4','userstory','220','Assinged to work for userstory 220','assigned','2014-10-17 08:37:42','2014-10-17 08:37:42');
INSERT INTO task VALUES('75','1','userstory','372','Assinged to work for userstory 372','finished','2014-10-17 08:55:00','2014-10-17 08:57:06');
INSERT INTO task VALUES('56','2','userstory','220','Assinged to work for userstory 220','assigned','2014-10-17 08:37:36','2014-10-17 08:37:36');
INSERT INTO task VALUES('57','3','userstory','220','Assinged to work for userstory 220','assigned','2014-10-17 08:37:39','2014-10-17 08:37:39');
INSERT INTO task VALUES('55','1','userstory','220','Assinged to work for userstory 220','finished','2014-10-17 08:37:31','2014-10-17 08:41:22');
INSERT INTO task VALUES('60','6','userstory','220','Assinged to work for userstory 220','assigned','2014-10-17 08:37:50','2014-10-17 08:37:50');
INSERT INTO task VALUES('76','7','userstory','392','Assinged to work for userstory 392','assigned','2014-10-17 08:56:48','2014-10-17 08:56:48');
INSERT INTO task VALUES('77','1','userstory','392','Assinged to work for userstory 392','finished','2014-10-17 08:56:56','2014-10-17 08:57:05');
INSERT INTO task VALUES('78','4','userstory','392','Assinged to work for userstory 392','assigned','2014-10-17 08:57:07','2014-10-17 08:57:07');
INSERT INTO task VALUES('69','1','userstory','335','Assinged to work for userstory 335','finished','2014-10-17 08:48:46','2014-10-17 08:49:06');
INSERT INTO task VALUES('70','2','userstory','335','Assinged to work for userstory 335','assigned','2014-10-17 08:48:54','2014-10-17 08:48:54');
INSERT INTO task VALUES('71','3','userstory','335','Assinged to work for userstory 335','assigned','2014-10-17 08:48:57','2014-10-17 08:48:57');
INSERT INTO task VALUES('72','4','userstory','335','Assinged to work for userstory 335','assigned','2014-10-17 08:49:02','2014-10-17 08:49:02');
INSERT INTO task VALUES('73','5','userstory','335','Assinged to work for userstory 335','assigned','2014-10-17 08:49:07','2014-10-17 08:49:07');
INSERT INTO task VALUES('74','6','userstory','335','Assinged to work for userstory 335','assigned','2014-10-17 08:49:10','2014-10-17 08:49:10');

DROP TABLE IF EXISTS testcase;
CREATE TABLE `testcase` (
  `testcaseid` int(10) unsigned NOT NULL auto_increment,
  `projectid` smallint(5) unsigned NOT NULL,
  `userstoryid` smallint(5) unsigned NOT NULL,
  `creator` varchar(30) NOT NULL,
  `type` varchar(30) NOT NULL,
  `status` varchar(30) NOT NULL,
  `priority` varchar(30) NOT NULL,
  `headline` tinytext NOT NULL,
  `content` text NOT NULL,
  `createdtime` datetime NOT NULL,
  `updatedtime` datetime NOT NULL,
  PRIMARY KEY  (`testcaseid`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

INSERT INTO testcase VALUES('13','1','334','admin','System-Test','Proposed','Medium','搞得郭德纲的规定','地方地方的哥哥哥哥哥哥','2014-10-17 08:49:36','2014-10-17 08:49:36');
INSERT INTO testcase VALUES('14','1','336','denny','System-Test','Proposed','Medium','对用户故事栏完成日期项测试输入非年月日格式数据','预期结果：输入负数等非日期格式不保存且提示错误','2014-10-17 08:49:54','2014-10-17 08:49:54');
INSERT INTO testcase VALUES('15','1','336','denny','System-Test','Proposed','Medium','对用户故事栏编辑未完成即跳转另一个页面提示是否保存测试','预期结果：未完成用户故事编辑跳转其他页面，系统提示是否保持，让用户选择','2014-10-17 08:51:31','2014-10-17 08:51:51');

DROP TABLE IF EXISTS user;
CREATE TABLE `user` (
  `userid` smallint(5) unsigned NOT NULL auto_increment,
  `username` varchar(30) NOT NULL,
  `password` char(32) NOT NULL,
  `email` varchar(40) NOT NULL,
  `status` tinyint(1) NOT NULL default '1',
  `roleid` smallint(5) unsigned NOT NULL,
  `customerid` smallint(5) unsigned NOT NULL,
  `defaultproject` smallint(5) unsigned NOT NULL,
  `createdtime` datetime NOT NULL,
  `updatedtime` datetime NOT NULL,
  PRIMARY KEY  (`userid`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

INSERT INTO user VALUES('1','admin','21232f297a57a5a743894a0e4a801fc3','admin@agileone.net','1','1','1','1','0000-00-00 00:00:00','2014-10-17 07:52:37');
INSERT INTO user VALUES('2','denny','3425f115ee1ecf591fb06d635c37d990','denny@agileone.net','1','4','0','1','2010-04-15 14:02:22','2010-04-16 09:08:50');
INSERT INTO user VALUES('3','martin','925d7518fc597af0e43f5606f9a51512','martin@agileone.net','1','5','0','1','2010-04-21 10:30:35','2010-04-21 10:30:35');
INSERT INTO user VALUES('4','suki','d61155f6f6120c0f17546b5311b08f9e','suki@agileone.net','1','6','0','1','2010-04-21 10:31:02','2014-10-17 07:23:05');
INSERT INTO user VALUES('5','guest','084e0343a0486ff05530df6c705c8bb4','guest@agileone.net','1','7','0','1','2010-04-21 10:32:45','2010-04-21 21:22:17');
INSERT INTO user VALUES('6','skrillex','96e79218965eb72c92a549dd5a330112','skrillex@agileone.net','1','1','0','1','2014-10-15 02:07:11','2014-10-15 02:07:11');
INSERT INTO user VALUES('7','@@@@@@','4f3d0989743daf918d6d7d26f6821ecc','@@@@@@@@','1','1','0','1','2014-10-17 08:48:14','2014-10-17 08:48:14');

DROP TABLE IF EXISTS userproject;
CREATE TABLE `userproject` (
  `upid` int(10) unsigned NOT NULL auto_increment,
  `userid` smallint(5) unsigned NOT NULL,
  `projectid` smallint(5) unsigned NOT NULL,
  PRIMARY KEY  (`upid`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

INSERT INTO userproject VALUES('12','1','1');
INSERT INTO userproject VALUES('2','2','1');
INSERT INTO userproject VALUES('4','3','1');
INSERT INTO userproject VALUES('11','4','1');
INSERT INTO userproject VALUES('7','5','1');
INSERT INTO userproject VALUES('10','6','1');
INSERT INTO userproject VALUES('13','7','1');

DROP TABLE IF EXISTS userstory;
CREATE TABLE `userstory` (
  `userstoryid` smallint(5) unsigned NOT NULL auto_increment,
  `projectid` smallint(5) unsigned NOT NULL,
  `creator` varchar(30) NOT NULL,
  `proposalid` smallint(5) unsigned NOT NULL,
  `priority` varchar(30) NOT NULL,
  `milestone` varchar(30) NOT NULL,
  `module` varchar(30) NOT NULL,
  `status` varchar(30) NOT NULL,
  `finishdate` date NOT NULL,
  `headline` tinytext NOT NULL,
  `content` text NOT NULL,
  `createdtime` datetime NOT NULL,
  `updatedtime` datetime NOT NULL,
  PRIMARY KEY  (`userstoryid`)
) ENGINE=MyISAM AUTO_INCREMENT=446 DEFAULT CHARSET=utf8;

INSERT INTO userstory VALUES('393','1','admin','0','','','','','0000-00-00','rr','rrr','2014-10-17 08:56:52','2014-10-17 08:56:52');
INSERT INTO userstory VALUES('394','1','denny','0','Must-Have','Milestone-Design','System','Proposed','2014-11-16','weqwewqe','eqsqweq','2014-10-17 08:57:22','2014-10-17 08:57:22');
INSERT INTO userstory VALUES('395','1','admin','0','','','','','0000-00-00','ad','aa sdsd asdsad ','2014-10-17 08:57:22','2014-10-17 08:57:22');
INSERT INTO userstory VALUES('432','1','denny','0','Must-Have','Milestone-Design','System','Proposed','2014-11-16','erwqrqwrqweqwewqqweeeer','qweqweqweqweqwrwqqweqwe','2014-10-17 08:57:56','2014-10-17 08:57:56');
INSERT INTO userstory VALUES('427','1','denny','0','Must-Have','Milestone-Design','System','Proposed','2014-11-16','erwqrqwrqweqwe','qweqweqweqweqwrwqqweqwe','2014-10-17 08:57:52','2014-10-17 08:57:52');
INSERT INTO userstory VALUES('428','1','denny','0','Must-Have','Milestone-Design','System','Proposed','2014-11-16','erwqrqwrqweqwewq','qweqweqweqweqwrwqqweqwe','2014-10-17 08:57:52','2014-10-17 08:57:52');
INSERT INTO userstory VALUES('429','1','denny','0','Must-Have','Milestone-Design','System','Proposed','2014-11-16','erwqrqwrqweqwewqqwe','qweqweqweqweqwrwqqweqwe','2014-10-17 08:57:53','2014-10-17 08:57:53');
INSERT INTO userstory VALUES('430','1','denny','0','Must-Have','Milestone-Design','System','Proposed','2014-11-16','erwqrqwrqweqwewqqwee','qweqweqweqweqwrwqqweqwe','2014-10-17 08:57:54','2014-10-17 08:57:54');
INSERT INTO userstory VALUES('431','1','denny','0','Must-Have','Milestone-Design','System','Proposed','2014-11-16','erwqrqwrqweqwewqqweee','qweqweqweqweqwrwqqweqwe','2014-10-17 08:57:55','2014-10-17 08:57:55');
INSERT INTO userstory VALUES('433','1','denny','0','Must-Have','Milestone-Design','System','Proposed','2014-11-16','erwqrqwrqweqwewqqweeeerr','qweqweqweqweqwrwqqweqwe','2014-10-17 08:57:57','2014-10-17 08:57:57');
INSERT INTO userstory VALUES('434','1','denny','0','Must-Have','Milestone-Design','System','Proposed','2014-11-16','erwqrqwrqweqwewqqweeeerrwe','qweqweqweqweqwrwqqweqwe','2014-10-17 08:57:58','2014-10-17 08:57:58');
INSERT INTO userstory VALUES('435','1','denny','0','Must-Have','Milestone-Design','System','Proposed','2014-11-16','erwqrqwrqweqwewqqweeeerrwer','qweqweqweqweqwrwqqweqwe','2014-10-17 08:57:58','2014-10-17 08:57:58');
INSERT INTO userstory VALUES('437','1','denny','0','Must-Have','Milestone-Design','System','Proposed','2014-11-16','erwqrqwrqweqwewqqweeeerrwerwer','qweqweqweqweqwrwqqweqwe','2014-10-17 08:57:59','2014-10-17 08:57:59');
INSERT INTO userstory VALUES('439','1','admin','0','','','','','0000-00-00','da sdsd asa asdasdasdasdasdasdasdasdasdadasdasdasdasdasdasdasdasasdasdasdsadas dasdasdassadadsasdasdasdasdasdasdasdasd asd asds','sd a','2014-10-17 08:58:01','2014-10-17 08:58:01');
INSERT INTO userstory VALUES('441','1','denny','0','Must-Have','Milestone-Design','System','Proposed','2014-11-16','erwqrqwrqweqwewqqweeeerrwerwerwerewr','qweqweqweqweqwrwqqweqwe','2014-10-17 08:58:02','2014-10-17 08:58:02');
INSERT INTO userstory VALUES('442','1','denny','0','Must-Have','Milestone-Design','System','Proposed','2014-11-16','erwqrqwrqweqwewqqweeeerrwerwerwerewr4','qweqweqweqweqwrwqqweqwe','2014-10-17 08:58:03','2014-10-17 08:58:03');
INSERT INTO userstory VALUES('443','1','denny','0','Must-Have','Milestone-Design','System','Proposed','2014-11-16','erwqrqwrqweqwewqqweeeerrwerwerwerewr44','qweqweqweqweqwrwqqweqwe','2014-10-17 08:58:04','2014-10-17 08:58:04');
INSERT INTO userstory VALUES('444','1','denny','0','Must-Have','Milestone-Design','System','Proposed','2014-11-16','erwqrqwrqweqwewqqweeeerrwerwerwerewr44we','qweqweqweqweqwrwqqweqwe','2014-10-17 08:58:05','2014-10-17 08:58:05');
INSERT INTO userstory VALUES('445','1','denny','0','Must-Have','Milestone-Design','System','Proposed','2014-11-16','erwqrqwrqweqwewqqweeeerrwerwerwerewr44we32','qweqweqweqweqwrwqqweqwe','2014-10-17 08:58:05','2014-10-17 08:58:05');
INSERT INTO userstory VALUES('419','1','admin','0','','','','','0000-00-00','da sdsd asa asdasdasdasdasdasdasdasdasdadasdasdasdasdasdasdasdasasdasdasdsadas dasdasdds','sd a','2014-10-17 08:57:37','2014-10-17 08:57:37');
INSERT INTO userstory VALUES('420','1','admin','0','','','','','0000-00-00','da sdsd asa asdasdasdasdasdasdasdasdasdadasdasdasdasdasdasdasdasasdasdasdsadas dasdasdassads','sd a','2014-10-17 08:57:37','2014-10-17 08:57:37');
INSERT INTO userstory VALUES('421','1','admin','0','','','','','0000-00-00','da sdsd asa asdasdasdasdasdasdasdasdasdadasdasdasdasdasdasdasdasasdasdasdsadas dasdasdassadadsds','sd a','2014-10-17 08:57:37','2014-10-17 08:57:37');
INSERT INTO userstory VALUES('422','1','admin','0','','','','','0000-00-00','da sdsd asa asdasdasdasdasdasdasdasdasdadasdasdasdasdasdasdasdasasdasdasdsadas dasdasdassadadsasdasdds','sd a','2014-10-17 08:57:38','2014-10-17 08:57:38');
INSERT INTO userstory VALUES('423','1','admin','0','','','','','0000-00-00','da sdsd asa asdasdasdasdasdasdasdasdasdadasdasdasdasdasdasdasdasasdasdasdsadas dasdasdassadadsasdasdasdads','sd a','2014-10-17 08:57:38','2014-10-17 08:57:38');
INSERT INTO userstory VALUES('424','1','admin','0','','','','','0000-00-00','da sdsd asa asdasdasdasdasdasdasdasdasdadasdasdasdasdasdasdasdasasdasdasdsadas dasdasdassadadsasdasdasdasdasdads','sd a','2014-10-17 08:57:39','2014-10-17 08:57:39');
INSERT INTO userstory VALUES('425','1','admin','0','','','','','0000-00-00','da sdsd asa asdasdasdasdasdasdasdasdasdadasdasdasdasdasdasdasdasasdasdasdsadas dasdasdassadadsasdasdasdasdasdasdasdds','sd a','2014-10-17 08:57:39','2014-10-17 08:57:39');
INSERT INTO userstory VALUES('426','1','denny','0','Must-Have','Milestone-Design','System','Proposed','2014-11-16','rwqrqwr','qweqweqweqweqwrwq','2014-10-17 08:57:47','2014-10-17 08:57:47');
INSERT INTO userstory VALUES('436','1','admin','0','','','','','0000-00-00','da sdsd asa asdasdasdasdasdasdasdasdasdadasdasdasdasdasdasdasdasasdasdasdsadas dasdasdassadadsasdasdasdasdasdasdasdasdds','sd a','2014-10-17 08:57:59','2014-10-17 08:57:59');
INSERT INTO userstory VALUES('438','1','denny','0','Must-Have','Milestone-Design','System','Proposed','2014-11-16','erwqrqwrqweqwewqqweeeerrwerwerwer','qweqweqweqweqwrwqqweqwe','2014-10-17 08:58:00','2014-10-17 08:58:00');
INSERT INTO userstory VALUES('440','1','denny','0','Must-Have','Milestone-Design','System','Proposed','2014-11-16','erwqrqwrqweqwewqqweeeerrwerwerwerew','qweqweqweqweqwrwqqweqwe','2014-10-17 08:58:01','2014-10-17 08:58:01');

DROP TABLE IF EXISTS version;
CREATE TABLE `version` (
  `versionid` smallint(5) unsigned NOT NULL auto_increment,
  `projectid` smallint(5) unsigned NOT NULL,
  `version` varchar(10) NOT NULL,
  `build` varchar(20) NOT NULL,
  `changelog` text NOT NULL,
  `createdtime` datetime NOT NULL,
  PRIMARY KEY  (`versionid`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

INSERT INTO version VALUES('1','1','1.0','20100201','Initial version for preview.','2010-04-15 15:55:31');
INSERT INTO version VALUES('2','1','1.1','20100415','Fixed some serious bugs for 1.0, and add installation wizard.','2010-04-15 15:57:15');

