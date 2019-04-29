CREATE TABLE IF NOT EXISTS `attach` (
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
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;


INSERT INTO `attach` (`attachid`, `refertype`, `referid`, `filename`, `storename`, `size`, `folder`, `creator`, `createdtime`) VALUES
(1, 'defect', 4, 'Defect-Charset.jpg', '20100509213123.jpg', 104061, 'Agileone', 'denny', '2010-05-09 21:31:23');


CREATE TABLE IF NOT EXISTS `customer` (
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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;


INSERT INTO `customer` (`customerid`, `custname`, `contact`, `email`, `phone`, `website`, `address`, `intro`, `createdtime`, `updatedtime`) VALUES
(1, 'AOTeam', 'Denny', 'dengqiang@woniuxy.com', '18682558655', 'http://www.woniuxy.com', '成都天府二街蜀都中心', 'AgileOne Team, Focus on developing AgileOne lifecycle management system, and optimazing the process and methodology of Agile Development.', '2010-04-15 14:01:54', '2010-04-21 21:02:03');


CREATE TABLE IF NOT EXISTS `defect` (
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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;


INSERT INTO `defect` (`defectid`, `projectid`, `source`, `creator`, `status`, `severity`, `priority`, `module`, `platform`, `version`, `build`, `headline`, `content`, `createdtime`, `updatedtime`) VALUES
(1, 1, 'Testcase-5', 'denny', 'Fixed', 'Major', 'High', 'System', 'Windows XP - XAMPP1.6.8', '1.0.20100201', '', '编辑用户时，设置该用户无任何项目也可正常保存', '编辑用户时，设置该用户无任何项目也可正常保存，而根据Userstory 16的需求，新建或编辑用户时必须保证用户有一个项目。', '2010-04-15 23:43:15', '2010-04-21 10:35:56'),
(2, 1, 'Testcase-6', 'denny', 'Open', 'Minor', 'High', 'System', 'Windows XP - XAMPP1.6.8', '1.0.20100201', '', '当设置使用sendmail发送邮件时，SMTP设置项仍可见', '<p>当在后台管理页面中设置使用sendmail发送邮件时，SMTP设置项仍可见，虽然不影响正常的功能，但是容易给用户造成一些误导。</p>\n<p>期望结果为：当选项使用sendmail方式时，SMTP选项被禁用，而当选择SMTP方式时，SMTP选项被启用</p>\n', '2010-04-15 23:45:32', '2010-04-15 23:45:32'),
(3, 1, '', 'denny', 'New', 'Major', 'Medium', 'Project', 'Windows XP - XAMPP1.6.8', '1.0.20100201', '', '项目设置只可增加删除里程碑，不能编辑里程碑信息', '请提供编辑功能。', '2010-04-15 23:56:25', '2010-04-15 23:56:25'),
(4, 1, '', 'denny', 'New', 'Major', 'High', 'System', 'Redhat 5.4 - LAMP', '1.1.20100415', '', '安装完成后所有数据库中的中文均为乱码', '<p>测试步骤：<br />\n1) 成功配置AMP平台并解压缩AgileOne安装目录到agileone/htdocs默认目录下<br />\n2) 输入<a href="http://localhost/agileone/">http://localhost/agileone/</a>，系统自动重定向到<a href="http://localhost/agileone/Install">http://localhost/agileone/Install</a>地址<br />\n3) 输入正确的数据库连接信息并成功安装，进行到首页后发现所有公告的内容全部为乱码<br />\n4) 经过最终确认发现所有数据表中一旦包含中文，均为乱码<br />\n5) 而通过系统页面(而非安装过程初始化)输入的中文则可以正确处理，请参考附件截图.</p>\n', '2010-05-09 21:31:17', '2010-05-09 21:31:17');


CREATE TABLE IF NOT EXISTS `execution` (
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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10 ;


INSERT INTO `execution` (`executionid`, `projectid`, `testcaseid`, `tester`, `platform`, `version`, `result`, `comment`, `exectime`) VALUES
(1, 1, 1, 'denny', 'Redhat 5.4 - LAMP', '1.0.20100201', 'Passed', '', '2010-04-15 23:40:26'),
(2, 1, 1, 'denny', 'Windows XP - XAMPP1.6.8', '1.0.20100201', 'Passed', '', '2010-04-15 23:40:32'),
(3, 1, 2, 'denny', 'Windows XP - XAMPP1.6.8', '1.0.20100201', 'Passed', '', '2010-04-15 23:40:41'),
(4, 1, 3, 'denny', 'Windows XP - XAMPP1.6.8', '1.0.20100201', 'Passed', '', '2010-04-15 23:40:49'),
(5, 1, 3, 'denny', 'Redhat 5.4 - LAMP', '1.0.20100201', 'Passed', '', '2010-04-15 23:40:53'),
(6, 1, 4, 'denny', 'Redhat 5.4 - LAMP', '1.0.20100201', 'Passed', '', '2010-04-15 23:40:57'),
(7, 1, 4, 'denny', 'Windows XP - XAMPP1.6.8', '1.0.20100201', 'Passed', '', '2010-04-15 23:41:00'),
(8, 1, 5, 'denny', 'Windows XP - XAMPP1.6.8', '1.0.20100201', 'Failed', '', '2010-04-15 23:41:10'),
(9, 1, 6, 'denny', 'Windows XP - XAMPP1.6.8', '1.0.20100201', 'Failed', '', '2010-04-15 23:43:52');


CREATE TABLE IF NOT EXISTS `knowledge` (
  `knowledgeid` smallint(5) unsigned NOT NULL auto_increment,
  `projectid` smallint(5) unsigned NOT NULL,
  `creator` varchar(30) NOT NULL,
  `type` varchar(30) NOT NULL,
  `headline` tinytext NOT NULL,
  `content` text NOT NULL,
  `createdtime` datetime NOT NULL,
  `updatedtime` datetime NOT NULL,
  PRIMARY KEY  (`knowledgeid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;


INSERT INTO `knowledge` (`knowledgeid`, `projectid`, `creator`, `type`, `headline`, `content`, `createdtime`, `updatedtime`) VALUES
(1, 1, 'denny', 'Business', 'AgileJoy.com -- 敏捷领域的传播者', '<div><p>AgileJoy是一个致力于传播敏捷开发方法论和最佳实践的专业博客。</p>\n<p>我们的口号：享受敏捷的乐趣!<br />\n我们的定位：敏捷领域传播者!<br />\n我们的宗旨：让一切敏捷起来!</p>\n<p>那么究竟什么是敏捷呢？这是一个有必要探讨一下的问题，我们经常听说敏捷开发，敏捷测试，敏捷设计，敏捷管理等等，那么强子认为，这些都是狭义的敏捷，特指使用一些快速的，轻量级的软件开发模型，并由此衍生出来的项目管理，软件设计，软件测试的不同的方法论和最佳实践，英文表达就是  Agile Methodology! <span></span><p>而我们更愿意走出这个框框，讨论更大范围的敏捷：广义的敏捷 (Agile)。Agile本指灵活，灵敏的意思，基于敏捷开发方法论，我们完全可以扩展到更大的范围，比如人的敏捷，技术的敏捷，思维的敏捷，如果我们能让“人”本身变得敏捷起来，还有什么不能敏捷呢？</p>\n<p>这便是本站的愿景，我们以敏捷方法，敏捷设计，敏捷测试，敏捷管理，框架工具等为讨论基础，来使读者能从AgileJoy中感受敏捷，不仅学到技术，也学会敏捷的思维，使我们在工作中立于不败之地。</p>\n</p>\n</div>\n', '2010-04-21 09:42:10', '2010-04-21 09:42:10'),
(2, 1, 'denny', 'Technology', '传统开发中的这些玩意儿', '<p>传统的开发模型，CMMI流程，在软件的开发过程中有一大部分时间纠缠于各种各样的文档，这是我非常讨厌它的原因之一。如今的敏捷开发模型，一大部分文档都没有，这让我有时候不置可否，那么今天咱们讨论一下到底哪些东西是我们需要的，哪些是浪费时间而无用的，哪些有是鸡肋。</p>\n<p>希望有机会看到这篇小文的朋友都能发表一下你自己的观点，说说你的看法，希望我们都是在讨论一些东西，而不是被动地接受别人的观点。</p>\n<p>传统模型中，以下这些东西都是必不可少的： <span></span><p>没开工做软件之前：<br />\n一份或者N份完整的需求列表 (哇，漂亮，老板一看，这家伙能成事儿!)<br />\n一份项目经理做出来的项目计划 (居然可以精确到小时，精确到天，!帅)<br />\nN份各种各样的流程 (那必需的，不能任着你性子来!!)<br />\n一份变更控制的流程及处理方式 (不用担心变量，我们有流程控制的!)<br />\n一个评审小组对各种事宜做出决议 (一般名存实亡)<br />\n一份详细的配置管理计划及流程 (好东西，没这个还搞什么软件开发？)<br />\n各种各样的统计数据及指标 (这个炫，再找个绘图高手这么一摆弄，老板客户看着直愣，专业!)<br />\n风险预测及措施 ……… (风险算什么，咱们都想好对策了)<br />\n还有一些莫名其妙，不知所谓的文档，表格 (这个要的，要不怎么展现我们的成果啊)</p>\n<p>开工做软件了：<br />\n怎么架构？ (有想法不行，咱们得写出来，还得让不同的人都能看得懂)<br />\n数据库，表结构怎么设计<br />\n什么工作流程？图还得漂亮点才行! (这个好，无处不在的专业素质啊)<br />\n根据需求写的functional spec (诚心实意说，这个东西有用)<br />\n根据functional spec写的design spec (基本上有了这玩意儿，写代码就是一体力活)<br />\n命名规则，代码规范 (不以规矩，怎成方圆？)<br />\n详细的单元测试用例 (那你看，我虽然一个问题都没发现，但是我的文档够详细吧)<br />\n详细的测试用例 (那我们的测试用例，随便从大街上找一个人来都知道怎么做，省不少培训费)<br />\n详细的Bug描述 (万一开发人员看不懂怎么办呀)<br />\n详细的Report (不详细一点能成吗？)<br />\n最好能记录一下你每天都干了些什么，因为我们要统计数据 (我抽烟的时间要记不？)</p>\n<p>最后软件好不容易做完了，文档也写了，最后客户说不好意思，这个软件不是我想要的，你们再改改，于是从头再来，于是乎，我们找了一下问题，发现问题如下：<br />\n员工不够仔细，经常文档上写的各实际做的不一样，我们找更听话的员工吧!<br />\n版本控制不好，文档一多，版本一多，全乱了，咱们找个专业的配置经理吧!<br />\n全在干活，没有一个稽核人员，招一个专门的QA吧!<br />\n客户需求老在变，讨论半天弄明白的东西又不能派上用场，咱们以后少接这样的客户？<br />\n文档太多，我们专门再写一份文档来跟踪其它文档吧!<br />\n我们的计划那么漂亮，还是老变，现在都第50个版本了!<br />\n没办法，客户要求的<br />\n………………………………………….</p>\n<p>我坚信，每个人都会遇到上面或多或少的问题，那么，我们有没有问过：到底这么些玩意儿都是必需的吗？什么才是我最需要的呢？有句话怎么说来着？计划赶不上变化，咱下文分解! </p>\n</p>\n', '2010-04-21 09:42:52', '2010-04-21 09:42:52'),
(3, 1, 'denny', 'Technology', '敏捷，能敏到令人发紫的程度?!', '<div><p>甭管敏捷不敏捷，一个软件到底需要什么？其实很简单，需要一个能满足客户需求的能工作的产品，仅此而已!</p>\n<p>我们所有的行为，活动，都是围绕这一目标而展开：“一个能满足客户需求的能工作的产品”，任何有助于达成该目标的我们都认为是需要的，否则，就是些华而不实，浪费资源，用四川人的话来说，就是些花架子。</p>\n<p>1，我们最需要的是一份清楚的，可行的需要列表(记住，一定是列表，而不是一份揉在一起的大而全的文档)</p>\n<p>2，清楚的架构设计，数据库设计，此时需要的，是一个团队(开发和测试)及N次讨论然后生成一份大家能看懂的东西(只要能看懂，明白啥意思就行，不需要字斟句酌，且只要一份) <span></span><p>3，项目计划？PP？说实话，这个东西不管对完成一个大项目或者一个小项目，只有一点参考价值，所以，这个东西得要，但是很简单地，分里程碑或者阶段进行即可(完全不需要精确到人天或者人小时)。反而是每个阶段或者里程碑需要达成的目标定义清楚更为重要。</p>\n<p>4，根据需求列表写一些简单的functional spec，供大家参考，这份文档很简单，讲明对某一需求会做到哪些功能，怎么组织架构，有流程图什么的放上去，没有只要能把关键点说明白也行。</p>\n<p>5，然后呢，测试用例(单元测试，系统测试等)，当然，这个一定得要，但完全不用傻瓜式把步骤一步一步写出来，只需要一个很简单的概要，说我要测试什么？甚至期望结果都不需要，很简单，我要测“这个手机能打国内长途”，我还不知道这个期望结果是什么吗？这个测试用例就可以简单到“该手机可打国内长途”，多一个字则太多。</p>\n<p>6，然后是BUG跟踪，一些所谓的大型的，专业的的BUG跟踪系统会让你填一堆东西，下拉框，文本框，附件上传，等等，你就慢慢写吧。而真正意义上来说，具有参考价值的也就那么几个：标题，版本号，严重性，和简单的描述。这个描述可以简单到什么程度呢，可以简单到令人发紫的程度。有些BUG完全不用描述，一个标题即可说明全部。比如发现一个BUG叫“一打国内长途时就死机”，然后呢，其他的任何描述性语句都是废话。</p>\n<p>我们真正需要的，就这点玩意儿，有了上面这6点(甚至压缩成5点)，行了，足够，剩下的就是发挥咱们的主观能动性，干吧。</p>\n<p>当然，这6点建立在两个共同的基础之上：<br />\n1、项目团队信奉敏捷的理念，很单纯地只为实现该软件，且不需要考虑项目组相关人员的利害关系。<br />\n2、良好的沟通。项目经理要天天沟通，掌握情况，与客户要天天沟通，开发人员与测试人员更要天天沟通，如果这一点做到足够到位，任何文档都显得苍白无力!</p>\n<p>基于以上论断，我们会有相应的一个行动纲领，做法来推动其敏捷起来，简化一切。</p>\n</p>\n</div>\n', '2010-04-21 09:43:22', '2010-04-21 09:43:22'),
(4, 1, 'denny', 'Technology', '敏捷宣言，你可以不同意，但你不应该不注意', '捷宣言，敏捷的基石，AgileJoy的基石：<p>个体和交互             胜过    工具和过程<br />\n可以运行的软件        胜过    面面俱到的文档<br />\n客户合作                胜过    合同谈判<br />\n响应变化                胜过    遵循计划</p>\n<p>我们认可右边的价值，但是左边的更加有价值。</p>\n<p>原则：<br />\n1. 优先级最高的是，通过早期和持续交付有价值的软件来满足客户。<br />\n2. 欢迎变更需求，即使在开发的后期提出。敏捷过程为客户的竞争优势而控制变更。<br />\n3. 以两周到两月为周期，频繁地交付可运行的软件，首推较短的时间定量。<br />\n4. 在整个项目过程中，每一天开发人员都要和业务人员合作。<br />\n5. 由个体推动项目的建设，为个体提供所需的环境，支持和信任。<br />\n6. 在开发团队中或开发团队间传递信息的最为有效和高效的方法是面对面的交谈。<br />\n7. 衡量进展的重要尺度是可运行的软件。<br />\n8. 敏捷过程提倡可持续的开发。<br />\n9. 发起人，开发者和用户应该步调一致。<br />\n10.不断地关注技术上优越的设计会提高敏捷性。<br />\n11.简洁是最重要的，简洁就是尽量减少工作量的艺术。<br />\n12.最佳的架构，需求和设计来自于自组织的团队。<br />\n13.团队要定期反省如何使工作更有效，然后相应地调整行为。</p>\n', '2010-04-21 09:44:48', '2010-04-21 09:44:48'),
(5, 1, 'denny', 'Technology', '关于敏捷，我们究竟了解多少？', '<div><p>真正接触敏捷开发也有两年了，由于不太喜欢那种按部就班的工作方法，觉得瀑布模型太臃肿，CMMI太繁琐。所以一直在寻找一种更加灵活的方法，当我们在项目中真正使用到了Scrum这种敏捷开发框架，突然发现事情原来是可以这么做的。</p>\n<p>那么敏捷方法论到底是个什么玩意？经过与不同的人讨论敏捷，我发现大致有以下这些理解，或者叫偏见：<br />\n1)       敏捷就是不需要流程，不需要文档，开发人员看着做就行了 ……<br />\n2)       敏捷就是XP，敏捷就是测试先行，测试驱动开发 ……<br />\n3)       敏捷就是抛弃瀑布模型，抛弃CMMI，抛弃文档和设计，随需应变 ……<br />\n4)       敏捷就是无组织，无纪律，所以我们不需要 ……<br />\n5)       只听说过敏捷开发，没听说过敏捷测试，还有敏捷管理？ <span><br />\n6)       只要一帮聪明的人聚在一起，项目就敏捷了，我们需要聪明的人 …….<br />\n7)       敏捷就是拥抱变化，加强沟通 ……<br />\n8)       敏捷就是灵活使用工具，只要是轻量级的东西，都可以叫敏捷 …… </span><p>正是由于这样的一种现状，才让我深深地感觉得敏捷这个东西太虚，只限于一个概念，大部分人可能还是摸不着头脑，只是有一些片面的了解而已。所以，AgijeJoy有必要使用中国式的语言来传播这样一种方法，使我们本来就不先进的软件行业不要再被一些累赘所拖累，敏捷起来。</p>\n<p>那么敏捷到底是什么？如果用一句话来概括的话就是：你感觉你每天真正是在做事了，而不是在为文档和流程疲于奔命。基本上不论XP还是Scrum还是其它框架，都离不开如下一些要点：<br />\n1)       简化流程，切切实实地简化，把能去掉的全去掉<br />\n2)       简化文档，所有的文档只应该包括客户需要的<br />\n3)       简化产品设计，要想使开发和测试过程变得敏捷，产品自己在架构和设计上首先得自己足够敏捷<br />\n4)       使用各类成熟的轻量级的框架和工具来开发和测试产品，注意是轻量级的<br />\n5)       让项目组全体成员坐在一起，相互讨论，声音可以很大<br />\n6)       充分授权，充分奖励，让团队充满活力而不是死气沉沉<br />\n7)       沟通，沟通，沟通……</p>\n<p>归根结底，“敏捷”本身只是一个概念，只是一种方法论，就像我党“要始终高举社会主义建设伟大旗帜，坚持三个代表，坚持解放思想，………..”，这也是一种方法论，而究竟怎么能做到？怎么样才算做到了？答案有很多种，但是最终还是一个原则，确保我们的项目按时按量成功完成。</p>\n</p>\n</div>\n', '2010-04-21 09:45:20', '2010-04-21 09:45:20'),
(6, 1, 'denny', 'Technology', '我和敏捷团队的五个约定', '<div><p>我——作为一名测试人员——有一个与众不同的习惯：每当要加入一个新项目的时候，我总会找到项目中的同伴，真诚而亲切地说：“为了更好地合作，我有5个约定，希望大家能尽量遵守”。</p>\n<p>约定1. 业务分析师们，我们其实是同一个角色的两种面孔，请叫上我们参加客户需求会议</p>\n<p>我们的团队需要让客户频繁的得到可用的软件，客户的不断反馈会给软件的未来做出最正确的方向指引。</p>\n<p>如果我们交付的软件有很多质量的问题，存在大量的缺陷，客户会被这些缺陷的奇怪行为干扰，没有办法把注意力放在软件本身的价值是否符合他们的真正需求上， 不能给出最有价值的反馈。所以，我们只有频繁的做测试，在每次交付之前都把质量问题找出来告诉我们的团队，问题才能及时的得到改正。<span></span><p>而我坚信“prevention is better than cure”（预防胜于治疗），我会要把工作的重点放在预防缺陷上，这样可以节省Dev们很多修复缺陷的时间与精力。</p>\n<p>为了达到这个目的，我需要跟你一起参加客户需求会议，尽早的了解客户需求与使用软件的惯常行为。那么在你完成需求的验收条件的定义的时候，我也基本完成了测试用例的准备。</p>\n<p>我们可以赶在开发人员们写代码之前就告诉他们我要测什么，让他们减少因为过于乐观而漏掉的一些重要的有破坏性的情况，减少缺陷的发生。这是我测试的一项重要任务。</p>\n<p>如果你们在大部分需求都整理好了再交给我们，我会浪费掉等待的时间。更重要的是，开发好的软件里面已经有很多本来可以不存在的缺陷在里面了，开发人员们可能需要加班加点来保证在项目最终交付时间之前把它们改好。这样很容易产生新的缺陷的。</p>\n<p>所以，请让我尽早了解需求，请不要让我到项目后期才能开始测试。</p>\n<p>约定2. 开发人员们，虽然你们是编写自动化测试的专家，但请听听我们意见</p>\n<p>我知道，对于你们，自动化测试不过是利用junit, rspec, selenium，watir，uiautomation等等写出的“另一段程序”而已。而对于80%的QA来说，编写自动化测试并不是一件简单的事情。</p>\n<p>不过我仍然相信，有测试人员介入的自动化测试更有价值。</p>\n<p>你们用单元测试，集成测试来保证代码的质量。然而你们的这些日常测试离代码更近，离最终用户还点远。很多测试都不是在测软件功能。</p>\n<p>你们可以把功能测试写的又快又多，而我们可以指出什么功能测试最有必要加到自动化测试中。</p>\n<p>你们平时大部分精力都在编码上，没有太多时间去查都有什么缺陷。而我们可以指出什么地方缺陷可能会出现的比较频繁，建议在这些脆弱的地方加自动化测试。</p>\n<p>所以请听听我们的意见，我们可以给你们提供这些信息。</p>\n<p>约定3. 项目经理们，请不要要求我们测试软件的所有路径</p>\n<p>软件测试是一个永无止尽的任务。基本上没有什么软件简单到我们能够尝试完它的每一个可能的路径的。就连一个看似简单的微软计算器都有无穷尽的路径，无止尽的输入，更何况比这个更复杂的商用软件。</p>\n<p>如果你们担心没有尝试过全部的路径不可靠，疑惑我们怎么敢说这个软件质量是好的还是坏，都有什么风险。请你们先注意，我们是跟业务分析师一样，都了解软件的价值的。价值可以帮我们做出判断，什么时候可以停止测试并对客户说我们的软件已经满足您的要求了，请放心使用。</p>\n<p>因为我们了解价值，我们可以肯定的说哪些软件的使用方式是至关重要的，哪些是不太可能出现的。我们会在全面测试了软件以后，把主要精力放在价值高的功能点上。合理的利用项目有限的时间。</p>\n<p>因为我们了解价值，我们可以正确的把发现的问题分类。我们可以帮助dev们把精力放在重要的缺陷上，避免把时间放在对于客户微不足道却不得不花费大量精力才能修正的问题上。</p>\n<p>所以，请不要要求我们无止尽的测试一个软件。我们了解价值，请相信我们的判断。</p>\n<p>约定4. 迭代经理们，如果对于交付风险有任何疑问，请来询问我</p>\n<p>BA和Dev们都是关注一个软件在什么情况是可以良好的工作。而我们除了验证这些情况以外，大量的时候都用在寻找什么样的情况软件不能正常的运行。所以除 了针对定义好的软件行为进行测试，我们还会做很多探索性测试。我们通常可以通过这样的测试发现一些没有定义的、不曾预期的行为。这些行为往往将会构成软件 交付的风险。</p>\n<p>我们会告诉你们现在都发生了什么问题，分别分布在哪里。</p>\n<p>我们会告诉你们，在什么情况下软件可能会有异常行为，是不是会牵连到其他的部分，是否可以绕过去。</p>\n<p>我们会告诉你们，哪些部分功能比较不稳定，需要更多的留意。</p>\n<p>约定5. 测试人员们，那些敏捷实践对于我们也是有用的。</p>\n<p>结对不是dev们的专利。我不希望总见到你们独自坐在自己的位置上冥思苦想。走出去，跟其他队友多多交流！</p>\n<p>多跟测试队友交流，pair看看设计的测试用例是不是够全面，独自一个人想到的未必足够好。他们会给你诚恳的意见的。对他们，也请一样认真对待。</p>\n<p>如果你发现开发人员们做出的架构决定使测试工作变得更困难。那么请大声地告诉他们，design for testability（提高你们设计的可测性）。</p>\n<p>如果你发现业务分析师写的需求无法验证，定义的客户行为不够具体，一个用户故事中包含太多了功能点，等等，那么也请大声地告诉他，INVEST（独立，可协商，价值，可估算，短小，可测）。</p>\n<p>也请你们多跟开发人员结对写自动化测试，既可以帮助你们学习怎样更好的编写自动化测试，也能帮助开发人员们结对更多的了解用户行为。</p>\n<p>这就是我的五个约定，它们是我在团队中顺利展开工作的基础。</p>\n<p>(文章来源：http://space.itpub.net/14639675/viewspace-566568)</p>\n</p>\n</div>\n', '2010-04-21 09:45:58', '2010-04-21 09:45:58');


CREATE TABLE IF NOT EXISTS `logging` (
  `loggingid` int(10) unsigned NOT NULL auto_increment,
  `time` datetime NOT NULL,
  `username` varchar(30) NOT NULL,
  `project` varchar(30) NOT NULL,
  `module` varchar(30) NOT NULL,
  `level` varchar(5) NOT NULL,
  `message` text NOT NULL,
  PRIMARY KEY  (`loggingid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;


CREATE TABLE IF NOT EXISTS `milestone` (
  `milestoneid` smallint(5) unsigned NOT NULL auto_increment,
  `projectid` smallint(5) unsigned NOT NULL,
  `msname` varchar(30) NOT NULL,
  `msusage` text NOT NULL,
  `createdtime` datetime NOT NULL,
  `updatedtime` datetime NOT NULL,
  PRIMARY KEY  (`milestoneid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;


INSERT INTO `milestone` (`milestoneid`, `projectid`, `msname`, `msusage`, `createdtime`, `updatedtime`) VALUES
(1, 1, 'Milestone-Design', 'AgileOne architecture and design.', '2010-04-15 14:02:04', '2010-04-15 17:55:06'),
(2, 1, 'Milestone-GUI', 'AgileOne GUI layout and design.', '2010-04-15 14:02:04', '2010-04-15 17:55:11'),
(3, 1, 'Milestone-Admin', 'AgileOne admin modules coding and testing.', '2010-04-15 14:02:04', '2010-04-15 17:55:15'),
(4, 1, 'Milestone-Core', 'AgileOne core modules coding and testing.', '2010-04-15 17:52:49', '2010-04-15 17:55:19'),
(5, 1, 'Milestone-1.1', 'AgileOne version 1.1 coding and testing.', '2010-04-15 17:53:48', '2010-04-15 17:55:23'),
(6, 1, 'Milestone-1.2', 'AgileOne version 1.2 coding and testing.', '2010-04-21 10:23:45', '2010-04-21 10:23:45');


CREATE TABLE IF NOT EXISTS `minutes` (
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
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;


CREATE TABLE IF NOT EXISTS `module` (
  `moduleid` smallint(5) unsigned NOT NULL auto_increment,
  `projectid` smallint(5) unsigned NOT NULL,
  `modname` varchar(30) NOT NULL,
  `modusage` text NOT NULL,
  PRIMARY KEY  (`moduleid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=15 ;


INSERT INTO `module` (`moduleid`, `projectid`, `modname`, `modusage`) VALUES
(1, 1, 'System', 'System admin and architecture'),
(2, 1, 'Dashboard', 'Realtime data report'),
(3, 1, 'Notice', 'Company/Project notice to others'),
(4, 1, 'Minutes', 'Meeting minutes'),
(5, 1, 'Knowledge', 'Company/Project knowledge base'),
(6, 1, 'Project', 'Project configuration'),
(7, 1, 'Proposal', 'Manage project proposal'),
(8, 1, 'Userstory', 'Manage project userstory'),
(9, 1, 'Specification', 'Manage project specification docs'),
(10, 1, 'Testcase', 'Manage project test cases'),
(11, 1, 'Execution', 'Manage test result'),
(12, 1, 'Defect', 'Manage project defect'),
(13, 1, 'Task', 'Project task management'),
(14, 1, 'Other', 'Agileone other modules');


CREATE TABLE IF NOT EXISTS `notice` (
  `noticeid` smallint(5) unsigned NOT NULL auto_increment,
  `headline` tinytext NOT NULL,
  `content` text NOT NULL,
  `creator` varchar(30) NOT NULL,
  `expireddate` date NOT NULL,
  `scope` smallint(5) unsigned NOT NULL,
  `createdtime` datetime NOT NULL,
  `updatedtime` datetime NOT NULL,
  PRIMARY KEY  (`noticeid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;


INSERT INTO `notice` (`noticeid`, `headline`, `content`, `creator`, `expireddate`, `scope`, `createdtime`, `updatedtime`) VALUES
(1, 'AgileJoy.com, 享受敏捷乐趣', '<span>AgileJoy是一个致力于传播敏捷开发方法论和最佳实践的专业博客.<br />\n<strong>我们的口号</strong>：享受敏捷的乐趣!<br />\n<strong>我们的定位</strong>：敏捷领域传播者!<br />\n<strong>我们的宗旨</strong>：让一切敏捷起来!<br />\n欢迎大家一起讨论关于敏捷的原理方法，最佳实践以及各类开发测试框架，性能测试技术等!!</span>', 'denny', '2012-07-14', 0, '2010-04-15 15:08:50', '2010-04-21 10:21:09'),
(2, 'AgileOne 1.0 预览版发布 (特性介绍)', '<p>AgileOne 1.0 版本包含如下特性：<br />\n1) 完成了所有计划在1.0版本中完成的Usertory，详情可参考AgileOne项目的Userstory.<br />\n2) 在线预览功能已经开通，用户可体验AgileOne本身的功能及敏捷开发基本流程，<a href="http://www.51testing.com/?uid/275266/one" target="_blank">http://www.51testing.com/?uid/275266/one</a> (登录名guest/guest).</p>\n', 'denny', '2010-07-14', 0, '2010-04-15 15:16:19', '2010-04-21 20:41:52'),
(3, 'AgileOne 1.1 正式版发布 (特性介绍)', '<p>AgileOne 1.1 版本包含如下特性：<br />\n1) 修复了1.0版本中较严重的几个Bug，且完善了界面显示。并在Linux/Windows两个主流平台上进行了较完整的测试。<br />\n2) 增加了安装程序，如果首次访问将会自动进入到安装向导页面，只有当用户正常配置好数据库连接信息才能访问。</p>\n', 'denny', '2010-07-20', 0, '2010-04-21 09:47:47', '2010-04-21 10:21:30');


CREATE TABLE IF NOT EXISTS `platform` (
  `platformid` smallint(5) unsigned NOT NULL auto_increment,
  `projectid` smallint(5) unsigned NOT NULL,
  `pfname` tinytext NOT NULL,
  `pfusage` text NOT NULL,
  `createdtime` datetime NOT NULL,
  PRIMARY KEY  (`platformid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;


INSERT INTO `platform` (`platformid`, `projectid`, `pfname`, `pfusage`, `createdtime`) VALUES
(1, 1, 'Windows XP - XAMPP1.6.8', 'Apache 2.2.4 - MySQL 5.0.67 - PHP 5.2.6', '2010-04-15 15:44:51'),
(2, 1, 'Redhat 5.4 - LAMP', 'Apache 2.2.4 - MySQL 5.0.56 - PHP 5.2.1', '2010-04-15 15:52:01');


CREATE TABLE IF NOT EXISTS `project` (
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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;


INSERT INTO `project` (`projectid`, `projname`, `startdate`, `finishdate`, `status`, `customerid`, `overview`, `createdtime`, `updatedtime`) VALUES
(1, 'AgileoneDemo', '2009-01-01', '2010-12-31', 'Ongoing', 1, 'AgileOne 是一个轻量级的软件生命周期管理工具, 致力于优化敏捷开发模型的流程, 并集中管理所有项目资产.', '2010-04-15 14:02:04', '2010-04-21 10:23:29');


CREATE TABLE IF NOT EXISTS `proposal` (
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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;


INSERT INTO `proposal` (`proposalid`, `projectid`, `creator`, `type`, `importance`, `headline`, `content`, `processed`, `processresult`, `createdtime`, `updatedtime`) VALUES
(1, 1, 'denny', 'Enhancement', 'Medium', '作为会议主持人，会议完成后可将待办事宜按人员分配', '<p>会议上讨论出的待办事宜用任务的方式跟踪起来，并提供邮件提醒功能。</p>\n', 0, '', '2010-04-15 22:17:03', '2010-04-21 14:02:59'),
(2, 1, 'denny', 'Suggestion', 'Medium', '提供Userstory拆分功能', '如果一个Userstory包含的功能点太多，需要将此Userstory进行拆分，拆分成更容易理解和计划的更小的Userstory。', 0, '', '2010-04-21 14:24:43', '2010-04-21 14:24:43'),
(3, 1, 'denny', 'Suggestion', 'Medium', '提供对用户故事，规格说明，测试用例的版本控制功能', '在一个敏捷项目中，用户故事，规格说明，测试用例是最重要的项目资产，可提供版本控制功能，保持对每一次的修改的完整跟踪。', 0, '', '2010-04-21 14:27:05', '2010-04-21 14:27:05'),
(4, 1, 'denny', 'Enhancement', 'Medium', '提供Dashboard功能，每一个角色都可及时获取指标数据', '<p>对于一个项目，每一个角色都有一些关注的指标/数据，可提供Dashboard功能，将项目中最核心的指标展现出来。并且提供自定义报表生成功能(如缺陷状态报告，测试用例执行结果报告等)。</p>\n', 0, '', '2010-04-21 14:31:44', '2010-04-21 14:31:44'),
(5, 1, 'denny', 'Enhancement', 'Medium', '管理员在后台可定义邮件发送功能的具体细节', '<p>1. 定义邮件服务器参数，确保AgileOne可发出邮件(已实现)。<br />\n2. 定义哪些模块需要将邮件发送，发送给哪些角色。<br />\n3. 定义邮件发送内容及格式。</p>\n', 0, '', '2010-04-21 14:33:51', '2010-04-21 14:33:51'),
(6, 1, 'denny', 'Suggestion', 'Medium', '使用不同颜色来管理不同的状态或者优先级等', '<p>如题，更直观。</p>\n', 0, '', '2010-04-21 14:36:10', '2010-04-21 14:36:10'),
(7, 1, 'denny', 'Suggestion', 'Medium', '提供一个项目组成员讨论功能', '<p>类似论坛，但是只需要实现一些简单的功能即可。</p>\n', 0, '', '2010-04-21 14:37:30', '2010-04-21 14:37:30'),
(8, 1, 'denny', 'Suggestion', 'Medium', '用户可定制首页，登录成功后定位到哪个页面', '<p>用户可定制首页，登录成功后定位到哪个页面</p>\n', 0, '', '2010-04-21 14:38:42', '2010-04-21 14:38:42'),
(9, 1, 'denny', 'Suggestion', 'Medium', '可自由管理任务，分配手工任务，管理任务进展等', '<p>提供专门的界面，管理日常任务，任务可来自于缺陷，用户故事等，也可自行添加任务，并对其进度进行管理。</p>\n', 0, '', '2010-04-21 14:41:16', '2010-04-21 14:41:16'),
(10, 1, 'denny', 'Suggestion', 'Medium', '为数据表重要字段建立索引，使用缓存', '<p>为提高AgileOne的性能，如有必要，可考虑在性能上进行优化，如使用缓存，建立数据表索引等手段。</p>\n', 0, '', '2010-04-21 14:42:58', '2010-04-21 14:42:58');


CREATE TABLE IF NOT EXISTS `reply` (
  `replyid` int(10) unsigned NOT NULL auto_increment,
  `refertype` varchar(30) NOT NULL,
  `referid` int(10) unsigned NOT NULL,
  `replier` varchar(30) NOT NULL,
  `content` text NOT NULL,
  `extraone` varchar(30) NOT NULL,
  `extratwo` varchar(30) NOT NULL,
  `createdtime` datetime NOT NULL,
  PRIMARY KEY  (`replyid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;


INSERT INTO `reply` (`replyid`, `refertype`, `referid`, `replier`, `content`, `extraone`, `extratwo`, `createdtime`) VALUES
(1, 'defect', 1, 'denny', '修改状态并传递到下一接管者.', 'Open', 'martin', '2010-04-21 10:36:30'),
(2, 'defect', 1, 'martin', '已修复', 'Fixed', 'suki', '2010-04-21 10:37:03'),
(3, 'defect', 1, 'suki', '已验证', 'Closed', '', '2010-04-21 10:40:58'),
(4, 'defect', 2, 'denny', 'Change status and transfer to the next.', 'Open', 'denny', '2010-04-21 15:19:00');


CREATE TABLE IF NOT EXISTS `role` (
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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;


INSERT INTO `role` (`roleid`, `rolename`, `roledesc`, `dashboard`, `notice`, `minutes`, `knowledge`, `project`, `task`, `proposal`, `userstory`, `spec`, `testcase`, `execution`, `defect`) VALUES
(1, 'Administrator', 'The system administrator and has full privilege.', '1111', '1111', '1111', '1111', '1111', '1111', '1111', '1111', '1111', '1111', '1111', '1111'),
(2, 'Customer', 'The project customer for a few privilege.', '0000', '0000', '0000', '1111', '0001', '1111', '1111', '0001', '0001', '0001', '0001', '1111'),
(3, 'ProductOwner', 'The supervisor to define the userstory and others.', '1111', '1111', '1111', '1111', '0001', '1111', '1111', '1111', '0001', '0001', '0001', '1111'),
(4, 'ProjectManager', 'The project owner to handle daily project related work.', '1111', '1111', '1111', '1111', '0101', '1111', '1111', '1111', '1111', '1111', '1111', '1111'),
(5, 'Developer', 'The developer or develop leader.', '1111', '1111', '1111', '1111', '0001', '1111', '1111', '0001', '1111', '1111', '1101', '1111'),
(6, 'Tester', 'The tester or test leader.', '1111', '1111', '1111', '1111', '0001', '1111', '1111', '0001', '0001', '1111', '1101', '1111'),
(7, 'Guest', 'The guest only has read privilege for all operations.', '0001', '0001', '0001', '0001', '0001', '0001', '0001', '0001', '0001', '0001', '0001', '0001');


CREATE TABLE IF NOT EXISTS `spec` (
  `specid` smallint(5) unsigned NOT NULL auto_increment,
  `projectid` smallint(5) unsigned NOT NULL,
  `userstoryid` smallint(5) unsigned NOT NULL,
  `creator` varchar(30) NOT NULL,
  `type` varchar(30) NOT NULL,
  `content` text NOT NULL,
  `createdtime` datetime NOT NULL,
  `updatedtime` datetime NOT NULL,
  PRIMARY KEY  (`specid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;


INSERT INTO `spec` (`specid`, `projectid`, `userstoryid`, `creator`, `type`, `content`, `createdtime`, `updatedtime`) VALUES
(1, 1, 1, 'denny', 'All-In-One', '<p>通过项目组成员讨论通过，决定AgileOne整体架构如下：<br />\n1. 使用PHP作为脚本语言，支持MySQL数据库，支持Windows/Linux操作系统，使用UTF-8编码提供国际化支持。<br />\n2. 使用Zend Framework作为PHP开发框架，主要使用其MVC，数据库操作，多语言几个重要功能。<br />\n3. 使用JQuery作为AJAX和Web前端开发框架，JQuery具有精简小巧，对文档对象操作快速，对AJAX操作方便，对页面对象无侵入性等特性。<br />\n4. 由于Zend Framework要求PHP5.2以上版本，所以系统需要PHP5.2.X及以上版本，对MySQL和Apache无特殊要求。</p>\n', '2010-04-15 22:48:57', '2010-04-15 23:26:50'),
(2, 1, 4, 'denny', 'All-In-One', '<p>权限管理针对不同角色，可定义不同的权限，其中后台管理仅Administrator角色的用户可见，其它用户只能操作前台。<br />\n<br />\n前台主要模块为：dashboard notice minutes knowledge project task proposal userstory spec testcase execution defect</p>\n<p>角色作为行，模块作为列，行列交叉即为权限，共4位字符，每位可取1和0两个值，1表示允许，0表示禁止。</p>\n<p>第1位权限为增加，第2位权限为修改，第3位权限为删除，第4位权限为查看。</p>\n', '2010-04-15 22:55:04', '2010-04-19 18:49:11'),
(3, 1, 9, 'denny', 'All-In-One', '<p>使用配置文件保存类型信息，将配置文件保存在Common/Config目录下，如需要修改，系统管理员可直接修改此配置文件，AgileOne暂不提供Web界面来修改此配置文件，新版本中可考虑提供。</p>\n<p>1. 项目状态：project-status：Proposed,Ongoing,Finished,Delayed<br />\n2. 知识类型：knowledge-type：Technology,Business,Management,CustomerEvent<br />\n3. 提案类型：proposal-type：Requirement,Enhancement,Suggestion,Complaint<br />\n4. 提案重要性：proposal-importance：High,Medium,Low<br />\n5. 用户故事状态：userstory-status：Proposed,Approved,Abandoned,Ongoing,Finished,Delayed<br />\n6. 用户故事优先级：userstory-priority：Must-Have,Should-Have,Could-Have<br />\n7. 测试用例类型：testcase-type：Unit-Test,Integration-Test,System-Test,Acceptance-Test,Automation-Test<br />\n8. 测试用例优先级：testcase-priority ：High,Medium,Low<br />\n9. 测试用例状态：testcase-status：Proposed,Approved,Abandoned<br />\n10. 测试结果：test-result：Passed,Failed,Pending,NotTested<br />\n11. 缺陷状态：defect-status：New,Open,Fixed,Reopen,Rejected,Postponed,Duplicated,Abandoned,Closed<br />\n12. 缺陷严重程序：defect-severity：Critical,Major,Minor<br />\n13. 缺陷优先级：defect-priority：High,Medium,Low<br />\n14. 规格说明书类型：spec-type：All-In-One,Requirement-Spec,Functional-Spec,Design-Sepc</p>\n', '2010-04-15 22:59:29', '2010-04-15 23:26:34');


CREATE TABLE IF NOT EXISTS `task` (
  `taskid` int(10) unsigned NOT NULL auto_increment,
  `userid` smallint(5) unsigned NOT NULL,
  `refertype` varchar(30) NOT NULL,
  `referid` int(10) unsigned NOT NULL,
  `content` text NOT NULL,
  `status` varchar(30) NOT NULL default 'assigned',
  `createdtime` datetime NOT NULL,
  `updatedtime` datetime NOT NULL,
  PRIMARY KEY  (`taskid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;


INSERT INTO `task` (`taskid`, `userid`, `refertype`, `referid`, `content`, `status`, `createdtime`, `updatedtime`) VALUES
(1, 2, 'userstory', 1, 'Assinged to work for userstory 1', 'assigned', '2010-04-19 21:16:28', '2010-04-19 21:16:28'),
(2, 3, 'defect', 1, 'Assinged to work for defect 1', 'assigned', '2010-04-21 10:36:30', '2010-04-21 10:36:30'),
(3, 4, 'defect', 1, 'Assinged to work for defect 1', 'assigned', '2010-04-21 10:37:03', '2010-04-21 10:37:03'),
(4, 2, 'defect', 2, 'Assinged to work for defect 2', 'assigned', '2010-04-21 15:19:00', '2010-04-21 15:19:00');


CREATE TABLE IF NOT EXISTS `testcase` (
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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;


INSERT INTO `testcase` (`testcaseid`, `projectid`, `userstoryid`, `creator`, `type`, `status`, `priority`, `headline`, `content`, `createdtime`, `updatedtime`) VALUES
(1, 1, 1, 'denny', 'System-Test', 'Approved', 'Medium', '验证系统支持Linux/Windows平台', '1. 配置Redhat Linux 5.4 Apache2.2 MySQL 5.0 PHP 5.2.<br />\n2. 配置Windows XP/2003 Apache2.2 MySQL 5.0 PHP 5.2.<br />\n3. 测试AgileOne能否成功安装在两类平台上.<br />\n4. 测试AgileOne是否存在平台依赖的BUG.<br />\n5. 测试AgileOne是否支持IE/FireFox，无明显BUG，界面显示正常.', '2010-04-15 23:10:50', '2010-04-15 23:20:58'),
(2, 1, 3, 'denny', 'System-Test', 'Approved', 'High', '验证百非Administrator角色的用户无法进入后台管理页', '1. 使用非Administrator角色的用户登录AgileOne.<br />\n2. 在浏览器地址栏输入<a href="http://yoursite/agileone/index.php/admin">http://yoursite/agileone/index.php/admin</a>回车<br />\n<br />\n期望结果：无法打开管理页面.', '2010-04-15 23:15:52', '2010-04-15 23:20:44'),
(3, 1, 8, 'denny', 'System-Test', 'Approved', 'High', '验证系统可以保存用户登录信息(当浏览器Cookie可用时)', '<p>1. 打开AgileOne并输入你的正确的用户名和密码<br />\n2. 选择“保存登录信息”，然后点击登录按钮<br />\n3. 关闭浏览器，再打开AgileOne首页直接点击登录，可成功登录<br />\n4. 关闭你的计算机或者等待半个小时后再运行第3步，登录信息仍然保存并可成功登录</p>\n', '2010-04-15 23:20:22', '2010-04-15 23:22:05'),
(4, 1, 4, 'denny', 'System-Test', 'Approved', 'High', '验证系统权限管理正常运行', '<p>1. 打开系统数据表role或进入后台管理页面，查看预定义的7类角色所拥有的权限<br />\n2. 为7个预定义角色创建不同的用户<br />\n3. 分别以不同角色的用户登录AgileOne，并进行增加，修改，删除和查看操作</p>\n<p>期望结果：与预定义的权限保持一致</p>\n', '2010-04-15 23:25:43', '2010-04-15 23:25:43'),
(5, 1, 16, 'denny', 'System-Test', 'Proposed', 'Medium', '验证新增或修改一个用户时，必须指定至少一个项目', '1. 用admin登录系统，并进入到系统管理页面。<br />\n2. 新建一个用户，输入用户信息不指定项目给该用户，用户将不能新建。<br />\n3. 编辑一个现有用户，将其所属项目全部删除，修改后的信息将不能被保存。', '2010-04-15 23:33:36', '2010-04-15 23:33:36'),
(6, 1, 17, 'denny', 'System-Test', 'Proposed', 'Medium', '验证邮件服务器设置好后可以正确发送测试邮件', '<p>前置条件：<br />\nsendmail发送邮件的方式仅对Linux生效且Linux系统需安装此组件</p>\n<p>1. 使用admin登录系统并进入系统管理页<br />\n2. 设置使用sendmail组件发送邮件，此时SMTP设置荐应该禁用，且测试邮件可正常发送<br />\n3. 设置使用SMTP发送邮件并输入邮件服务器相关信息，测试邮件可正常发送<br />\n4. 验证邮件相关设置成功保存到Global.conf文件中</p>\n', '2010-04-15 23:39:45', '2010-04-15 23:39:45');


CREATE TABLE IF NOT EXISTS `user` (
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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;


INSERT INTO `user` (`userid`, `username`, `password`, `email`, `status`, `roleid`, `customerid`, `defaultproject`, `createdtime`, `updatedtime`) VALUES
(1, 'admin', '21232f297a57a5a743894a0e4a801fc3', 'admin@agileone.net', 1, 1, 1, 1, '0000-00-00 00:00:00', '2010-04-15 15:03:57'),
(2, 'denny', '3425f115ee1ecf591fb06d635c37d990', 'denny@agileone.net', 1, 4, 0, 1, '2010-04-15 14:02:22', '2010-04-16 09:08:50'),
(3, 'martin', '925d7518fc597af0e43f5606f9a51512', 'martin@agileone.net', 1, 5, 0, 1, '2010-04-21 10:30:35', '2010-04-21 10:30:35'),
(4, 'suki', 'd61155f6f6120c0f17546b5311b08f9e', 'suki@agileone.net', 1, 6, 0, 1, '2010-04-21 10:31:02', '2010-04-21 10:31:02'),
(5, 'guest', '084e0343a0486ff05530df6c705c8bb4', 'guest@agileone.net', 1, 7, 0, 1, '2010-04-21 10:32:45', '2010-04-21 21:22:17');


CREATE TABLE IF NOT EXISTS `userproject` (
  `upid` int(10) unsigned NOT NULL auto_increment,
  `userid` smallint(5) unsigned NOT NULL,
  `projectid` smallint(5) unsigned NOT NULL,
  PRIMARY KEY  (`upid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;


INSERT INTO `userproject` (`upid`, `userid`, `projectid`) VALUES
(1, 1, 1),
(2, 2, 1),
(4, 3, 1),
(5, 4, 1),
(7, 5, 1);


CREATE TABLE IF NOT EXISTS `userstory` (
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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=20 ;


INSERT INTO `userstory` (`userstoryid`, `projectid`, `creator`, `proposalid`, `priority`, `milestone`, `module`, `status`, `finishdate`, `headline`, `content`, `createdtime`, `updatedtime`) VALUES
(1, 1, 'denny', 0, 'Must-Have', 'Milestone-Design', 'System', 'Finished', '2009-03-31', '作为架构师, 需要明确AgileOne的系统架构及基本开发要求', '<p>在开发与设计AgileOne架构前，如下信息需要团队讨论并最终形成一致方案：<br />\n1. AgileOne所使用的开发语言，基本架构，编码格式，是否使用成熟框架？<br />\n2. AgileOne开发界面要求，如何突出敏捷开发的理念？<br />\n3. AgileOne基本模块，版本规则，服务器版本，客户端要求及其它架构方面所需要的一切信息。</p>\n', '2010-04-15 16:33:03', '2010-04-21 13:46:43'),
(2, 1, 'denny', 0, 'Must-Have', 'Milestone-GUI', 'System', 'Finished', '2009-04-30', '作为界面设计师，需要设计用户体验非常好的操作界面', '<p>AgileOne既然作为敏捷开发管理工具，那么最重要地要突出敏捷，在系统的操作上，我们也要追求敏捷。对于界面设计，有如下需求：<br />\n1. 界面布局人性化，上部全局菜单，下左常用模块导航，下右为主窗体界面。<br />\n2. 整体布局使用浅蓝色，错误提示信息使用橙红色，标准文字使用黑色。<br />\n3. 使用AJAX提交信息，减少页面刷新次数，且可提升加载速度。</p>\n', '2010-04-15 20:34:21', '2010-04-21 13:47:02'),
(3, 1, 'denny', 0, 'Must-Have', 'Milestone-Admin', 'System', 'Finished', '2009-06-30', '作为系统管理员，需要明确仅管理员可操作的功能', '<p>作为系统管理员，如下功能应该只有管理员可以操作，除管理员外其它角色均不可操作：<br />\n1. 设置邮件服务器帐号用于发送邮件。<br />\n2. 管理系统用户，及角色。<br />\n3. 管理公司客户信息及项目信息。<br />\n4. 查看系统日志，管理系统缓存。</p>\n', '2010-04-15 20:42:59', '2010-04-21 13:47:21'),
(4, 1, 'denny', 0, 'Must-Have', 'Milestone-Core', 'System', 'Finished', '2010-02-01', '作为最终用户，希望系统能提供简单明确的权限管理机制', '<p>权限管理基于一个三维数据表，角色/模块/权限，权限定义4种(增删查改)，用1表示允许，0表示拒绝。</p>\n<p>系统默认定义如下角色且不可删除：Administrator, Customer, ProductOwner, ProjectManager, Developer, Tester, Guest</p>\n<p>对于权限，用1111表示允许增改删查，用0000表示不允许增改删查，1001则表示允许增查，不允许改删。</p>\n', '2010-04-15 21:01:45', '2010-04-15 21:11:04'),
(5, 1, 'denny', 0, 'Must-Have', 'Milestone-Core', 'System', 'Finished', '2010-02-01', '作为项目经理，希望AgileOne能管理整个软件生命周期的重要资产', '在软件项目管理过程中，如下资产非常重要，最好系统能提供一站式管理：<br />\n1. 发布公司或项目公告<br />\n2. 管理会议记录并安排任务，能安排出To Do List并方便跟踪<br />\n3. 管理知识库，或为项目组成员提供各类学习资料<br />\n4. 设置项目的里程碑，项目组成员，产品模块管理，系统开发测试平台，软件版本等<br />\n5. 项目实话过程中的一些非正式需求，客户抱怨，沟通内容，使用建议或者系统增强建议等能收集起来，并通过评审后转换成正式需求<br />\n6. 管理正式需求，需求可与规格说明和测试用例进行关联<br />\n7. 管理规格说明，测试用例及测试结果<br />\n8. 使用简单的流程来管理缺陷', '2010-04-15 21:22:04', '2010-04-15 23:28:07'),
(6, 1, 'denny', 0, 'Must-Have', 'Milestone-Core', 'System', 'Finished', '2010-02-01', '作为最终用户，希望AgileOne提供多语言支持，且可自定义', '默认最好支持中文和英文，并且支持UTF-8编码，这样即使是在日文环境下也可以正常使用，并且能提供自定义语言能力。', '2010-04-15 21:43:21', '2010-04-15 21:43:21'),
(7, 1, 'denny', 0, 'Must-Have', 'Milestone-Core', 'System', 'Finished', '2010-02-01', '作为系统管理员，需要跟踪系统所有重要操作', '<p>系统提供日志跟踪，对于登录，注销，增加，修改和删除数据几类重要信息，能记录进日志中。</p>\n', '2010-04-15 21:45:24', '2010-04-15 21:45:24'),
(8, 1, 'denny', 0, 'Must-Have', 'Milestone-Core', 'System', 'Finished', '2010-02-01', '作为最终用户，希望能够保存登录信息', '<p>系统提供Cookie机制来保存登录信息，由于AgileOne属于企业内部用系统，对于安全性方面的要求相对较低。使用Cookie保存登录信息，但每次打开首页时仍然停留在登录界面，用户名和密码从Cookie中读取。如果用户不修改登录名，直接回车即可实现登录。</p>\n', '2010-04-15 21:48:16', '2010-04-15 21:48:16'),
(9, 1, 'denny', 0, 'Must-Have', 'Milestone-Core', 'System', 'Finished', '2010-02-01', '作为系统管理员，可手工配置类型信息：如缺陷状态，优先级等', '<p>提供配置文件来保存如下类型信息：<br />\n1. 项目状态：project-status<br />\n2. 知识类型：knowledge-type<br />\n3. 提案类型：proposal-type<br />\n4. 提案重要性：proposal-importance<br />\n5. 用户故事状态：userstory-status<br />\n6. 用户故事优先级：userstory-priority<br />\n7. 测试用例类型：testcase-type<br />\n8. 测试用例优先级：testcase-priority <br />\n9. 测试用例状态：testcase-status<br />\n10. 测试结果：test-result<br />\n11. 缺陷状态：defect-status<br />\n12. 缺陷严重程序：defect-severity<br />\n13. 缺陷优先级：defect-priority<br />\n14. 规格说明书类型：spec-type</p>\n', '2010-04-15 21:54:30', '2010-04-15 23:27:43'),
(10, 1, 'denny', 0, 'Must-Have', 'Milestone-GUI', 'System', 'Finished', '2010-02-01', '作为最终用户，希望能在单个页面进行一个模块的所有操作', '<p>对于每一个单独的模块，希望能在一个页面中完成所有操作，避免页面间的跳转。</p>\n', '2010-04-15 22:06:41', '2010-04-15 22:06:41'),
(11, 1, 'denny', 0, 'Must-Have', 'Milestone-Core', 'Dashboard', 'Finished', '2010-02-01', '作为最终用户，希望能在首页面看到最新公告及我还未完成的各类任务', '<p>能将我的待办事宜和安排的任务在首页列出来，当我完成任务后可将其关闭。</p>\n', '2010-04-15 22:08:32', '2010-04-15 22:11:32'),
(12, 1, 'denny', 0, 'Must-Have', 'Milestone-Core', 'Specification', 'Finished', '2010-02-01', '作为开发人员，规格说明书对于理解产品非常重要', '<p>对于每一个Userstory，都应该有相应的规格说明书，即使规格说明书可以简单地把开发思路描述一下，但是也必须得有，即使是敏捷开发。</p>\n', '2010-04-15 22:14:29', '2010-04-15 22:26:16'),
(13, 1, 'denny', 0, 'Must-Have', 'Milestone-Core', 'Defect', 'Finished', '2010-02-01', '作为项目组成员，希望AgileOne整合缺陷管理功能', '<p>团队推行敏捷开发模式，希望简化缺陷管理流程，解决缺陷才是我们追求的目的，而不是花时间在流程上。</p>\n', '2010-04-15 22:29:37', '2010-04-15 22:36:34'),
(14, 1, 'denny', 0, 'Must-Have', 'Milestone-1.1', 'Other', 'Finished', '2010-04-15', '作为最终用户，期望能通过AgileOne了解到敏捷开发方法', '在系统发布时，将提供一个默认的项目AgileOne，并为其添加需求提案，用户故事，规格说明，测试用例及缺陷报告，有三方面的目的：<br />\n1. 提供给用户学习如何开展敏捷开发，了解敏捷开发流程及方法。<br />\n2. 让用户及时了解AgileOne的开发进度及将要开发的功能，便于用户提前进行相关准备工作。<br />\n3. 提供一个开放的沟通渠道，并向用户解释AgileOne在设计过程中的相关技术细节。', '2010-04-15 22:41:50', '2010-04-21 13:47:55'),
(15, 1, 'denny', 0, 'Must-Have', 'Milestone-1.1', 'Other', 'Finished', '2010-04-15', '作为最终用户，期望能非常简单地完成安装过程', '<p>提供安装向导，在用户将所需软件硬件平台准备好后1分钟完成安装过程。</p>\n', '2010-04-15 22:43:06', '2010-04-21 13:47:47'),
(16, 1, 'denny', 0, 'Must-Have', 'Milestone-Core', 'Project', 'Finished', '2010-02-01', '作为系统管理员，在新建或编辑用户时需要至少指定1个项目', '如果新建一个用户或编辑一个用户时，未给其指定任何项目，那么新建用户将没有任何意义，所以系统应强制每个用户至少有一个项目，包括系统管理员帐户admin.', '2010-04-15 23:31:44', '2010-04-15 23:31:44'),
(17, 1, 'denny', 0, 'Must-Have', 'Milestone-Admin', 'System', 'Finished', '2010-02-01', '作为系统管理员，期望设置邮件服务器并使用此设置发送邮件', 'AgileOne应该提供接口给管理员来设置邮件服务器及SMTP邮件帐号相关信息。', '2010-04-15 23:36:29', '2010-04-15 23:36:29'),
(18, 1, 'denny', 0, 'Must-Have', 'Milestone-Core', 'System', 'Finished', '2010-02-01', '作为项目经理，希望项目资产只能被创建者或管理员编辑或删除', '<p>基于项目实际要求，确保项目组成员对自己新建的项目资产具有相应义务和责任维护好，定义如下模块只能被创建者本人或管理员编辑或删除：</p>\n<p>项目公告，会议记录，知识仓库，需求提案，用户故事，规格说明，测试用例，执行结果</p>\n', '2010-04-15 23:53:03', '2010-04-19 20:46:18'),
(19, 1, 'denny', 0, 'Must-Have', 'Milestone-Core', 'Defect', 'Finished', '2010-02-01', '作为项目经理，希望跟踪每个缺陷经过的所有状态', '<p>缺陷报告是项目中的重要资产，系统必须能够跟踪每一个缺陷的所经历的所有状态，并且跟踪修改此状态的人员。</p>\n', '2010-04-15 23:54:37', '2010-04-15 23:54:37');


CREATE TABLE IF NOT EXISTS `version` (
  `versionid` smallint(5) unsigned NOT NULL auto_increment,
  `projectid` smallint(5) unsigned NOT NULL,
  `version` varchar(10) NOT NULL,
  `build` varchar(20) NOT NULL,
  `changelog` text NOT NULL,
  `createdtime` datetime NOT NULL,
  PRIMARY KEY  (`versionid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;


INSERT INTO `version` (`versionid`, `projectid`, `version`, `build`, `changelog`, `createdtime`) VALUES
(1, 1, '1.0', '20100201', 'Initial version for preview.', '2010-04-15 15:55:31'),
(2, 1, '1.1', '20100415', 'Fixed some serious bugs for 1.0, and add installation wizard.', '2010-04-15 15:57:15');
