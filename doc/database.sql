CREATE TABLE `parameter` (
  `id` varchar(50) NOT NULL COMMENT '��������',
  `parentid` varchar(50) DEFAULT '' COMMENT '���ڵ�ID',
  `name` varchar(50) DEFAULT NULL COMMENT '����',
  `value` varchar(500) DEFAULT NULL COMMENT 'ֵ',
  `createtime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `type` varchar(50) DEFAULT NULL COMMENT '����',
  `url` varchar(100) DEFAULT '',
  `exp2` varchar(100) DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='�����ֵ�';



CREATE TABLE `role` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '��������',
  `roleName` varchar(50) DEFAULT '' COMMENT '��ɫ����',
  `type` int(11) DEFAULT '0' COMMENT '״̬',
  `createtime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '״̬',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='��ɫ��';



CREATE TABLE `roleacl` (
  `roleid` int(11) NOT NULL DEFAULT '0' COMMENT '��ɫID',
  `aclid` varchar(50) NOT NULL DEFAULT '' COMMENT 'ģ��ID',
  `type` varchar(50) DEFAULT '' COMMENT '״̬',
  `createtime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '״̬',
  PRIMARY KEY (`roleid`,`aclid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='��ɫģ���';


CREATE TABLE `sys_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(50) DEFAULT NULL,
  `user_login_name` varchar(50) NOT NULL,
  `user_password` varchar(50) NOT NULL,
  `user_tel` varchar(50) DEFAULT NULL,
  `user_qq` varchar(20) DEFAULT NULL,
  `user_email` varchar(50) DEFAULT NULL,
  `user_address` varchar(200) DEFAULT NULL,
  `user_current_address` varchar(200) DEFAULT NULL,
  `user_birthday` date DEFAULT NULL,
  `user_login_time` timestamp NULL DEFAULT NULL COMMENT '�û����һ�ε�¼ϵͳʱ��',
  `user_login_count` int(11) DEFAULT '0',
  `user_updated_time` timestamp NULL DEFAULT NULL,
  `user_updator` varchar(50) DEFAULT NULL,
  `user_created_time` timestamp NULL DEFAULT NULL,
  `user_creator` varchar(50) DEFAULT NULL,
  `user_freeze_flag` int(1) DEFAULT NULL COMMENT '�û�����״̬��0-������1-����',
  `user_del_flag` int(1) DEFAULT '0' COMMENT '�û�ɾ��״̬��0-������1-��ɾ��',
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_login_name` (`user_login_name`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;



CREATE TABLE `userrole` (
  `uid` varchar(50) NOT NULL COMMENT '�û�ID',
  `roleid` int(11) NOT NULL DEFAULT '0' COMMENT '��ɫID',
  `createtime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '״̬',
  PRIMARY KEY (`uid`,`roleid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='�û���ɫ��';


