CREATE TABLE `parameter` (
  `id` varchar(50) NOT NULL COMMENT '自增主键',
  `parentid` varchar(50) DEFAULT '' COMMENT '父节点ID',
  `name` varchar(50) DEFAULT NULL COMMENT '名称',
  `value` varchar(500) DEFAULT NULL COMMENT '值',
  `createtime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `type` varchar(50) DEFAULT NULL COMMENT '类型',
  `url` varchar(100) DEFAULT '',
  `exp2` varchar(100) DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='数据字典';



CREATE TABLE `role` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `roleName` varchar(50) DEFAULT '' COMMENT '角色名称',
  `type` int(11) DEFAULT '0' COMMENT '状态',
  `createtime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='角色表';



CREATE TABLE `roleacl` (
  `roleid` int(11) NOT NULL DEFAULT '0' COMMENT '角色ID',
  `aclid` varchar(50) NOT NULL DEFAULT '' COMMENT '模块ID',
  `type` varchar(50) DEFAULT '' COMMENT '状态',
  `createtime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '状态',
  PRIMARY KEY (`roleid`,`aclid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色模块表';


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
  `user_login_time` timestamp NULL DEFAULT NULL COMMENT '用户最后一次登录系统时间',
  `user_login_count` int(11) DEFAULT '0',
  `user_updated_time` timestamp NULL DEFAULT NULL,
  `user_updator` varchar(50) DEFAULT NULL,
  `user_created_time` timestamp NULL DEFAULT NULL,
  `user_creator` varchar(50) DEFAULT NULL,
  `user_freeze_flag` int(1) DEFAULT NULL COMMENT '用户冻结状态，0-正常；1-冻结',
  `user_del_flag` int(1) DEFAULT '0' COMMENT '用户删除状态，0-正常；1-已删除',
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_login_name` (`user_login_name`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;



CREATE TABLE `userrole` (
  `uid` varchar(50) NOT NULL COMMENT '用户ID',
  `roleid` int(11) NOT NULL DEFAULT '0' COMMENT '角色ID',
  `createtime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '状态',
  PRIMARY KEY (`uid`,`roleid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户角色表';


