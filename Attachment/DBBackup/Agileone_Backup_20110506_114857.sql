# ----------------------------------------------------------- 
# AgileOne - Power to Agile Development 
# Database Backup Utility 
# Copyright (c) 2010 AgileOne Team (http://code.google.com/p/agileone/) 
# License GPL V3 (http://www.gnu.org/licenses) 
# Date: 2011-05-06 11:48:57
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
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

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
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

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
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

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
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

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
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

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
) ENGINE=MyISAM AUTO_INCREMENT=632 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS milestone; 
CREATE TABLE `milestone` (
  `milestoneid` smallint(5) unsigned NOT NULL auto_increment,
  `projectid` smallint(5) unsigned NOT NULL,
  `msname` varchar(30) NOT NULL,
  `msusage` text NOT NULL,
  `createdtime` datetime NOT NULL,
  `updatedtime` datetime NOT NULL,
  PRIMARY KEY  (`milestoneid`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

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
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS module; 
CREATE TABLE `module` (
  `moduleid` smallint(5) unsigned NOT NULL auto_increment,
  `projectid` smallint(5) unsigned NOT NULL,
  `modname` varchar(30) NOT NULL,
  `modusage` text NOT NULL,
  PRIMARY KEY  (`moduleid`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

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
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS platform; 
CREATE TABLE `platform` (
  `platformid` smallint(5) unsigned NOT NULL auto_increment,
  `projectid` smallint(5) unsigned NOT NULL,
  `pfname` tinytext NOT NULL,
  `pfusage` text NOT NULL,
  `createdtime` datetime NOT NULL,
  PRIMARY KEY  (`platformid`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

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
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

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
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

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
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

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
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

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
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

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
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS userproject; 
CREATE TABLE `userproject` (
  `upid` int(10) unsigned NOT NULL auto_increment,
  `userid` smallint(5) unsigned NOT NULL,
  `projectid` smallint(5) unsigned NOT NULL,
  PRIMARY KEY  (`upid`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

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
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

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

