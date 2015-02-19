CREATE TABLE `CONFIG` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `CONFIG_GROUP` varchar(100) DEFAULT NULL COMMENT '组',
  `CONFIG_KEY` varchar(100) DEFAULT NULL COMMENT '键',
  `CONFIG_VALUE` varchar(1000) DEFAULT NULL COMMENT '值',
  `REMARK` varchar(500) DEFAULT NULL COMMENT '备注',
  `CREATE_TIME` datetime DEFAULT NULL COMMENT '创建时间',
  `LAST_MODIF_TIME` datetime DEFAULT NULL COMMENT '最后修改时间',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `GROUP_KEY_UNIQUE` (`CONFIG_GROUP`,`CONFIG_KEY`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='系统字典表';

CREATE TABLE `wx_chat_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_id` varchar(512) DEFAULT NULL,
  `sender` int(1) DEFAULT NULL COMMENT '发送方: 0 用户;1 平台',
  `open_id` varchar(512) DEFAULT NULL COMMENT '用户的openId',
  `message_type` varchar(45) DEFAULT NULL COMMENT '消息类型:具体见:http://mp.weixin.qq.com/wiki/10/79502792eef98d6e0c6e1739da387346.html#.E5.9C.B0.E7.90.86.E4.BD.8D.E7.BD.AE.E6.B6.88.E6.81.AF)',
  `content` text COMMENT '当sender为1并且当message_type为1时,表示临时消息内容;\n当sender为0时,表示用户发送的消息内容;',
  `message_id` varchar(45) DEFAULT NULL COMMENT '当sender为1并且当message_type为0时有值.表示预置消息的ID',
  `send_time` datetime DEFAULT NULL COMMENT '发送时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COMMENT='微信聊天记录';

CREATE TABLE `wx_event_message` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `event` varchar(64) NOT NULL COMMENT '微信的事件类型',
  `description` varchar(128) DEFAULT NULL COMMENT '事件描述',
  `message_id` int(11) NOT NULL COMMENT '关联的消息ID',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='事件消息关联表,如关注,取消关注事件等.';

CREATE TABLE `wx_keyword` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `keyword` varchar(128) NOT NULL COMMENT '关键词',
  `message_id` int(11) NOT NULL COMMENT '关联的消息ID',
  `description` text COMMENT '关键词说明',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `KEYWORD_UNIQUE` (`keyword`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='关键词表';

CREATE TABLE `wx_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `msg_id` varchar(128) DEFAULT NULL COMMENT '消息ID',
  `to_user_name` varchar(512) DEFAULT NULL COMMENT '发送用户',
  `from_user_name` varchar(512) DEFAULT NULL COMMENT '接收用户',
  `msg_type` varchar(45) DEFAULT NULL COMMENT '消息类型',
  `in_message` text COMMENT '微信服务器发送过来的消息内容',
  `out_message` text COMMENT '消息的响应内容',
  `result` int(1) DEFAULT NULL COMMENT '处理结果:0 成功;1 失败',
  `error` text COMMENT '错误信息',
  `create_time` datetime DEFAULT NULL COMMENT '日志创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='微信通信日志';

CREATE TABLE `wx_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `pid` int(11) DEFAULT NULL COMMENT '父菜单ID',
  `menu_level` int(1) DEFAULT NULL COMMENT '菜单等级:1 一级菜单;2　二级菜单',
  `is_branch` int(1) DEFAULT '1' COMMENT '是否菜单组(包含子菜单的菜单): 0 是;1 否',
  `menu_type` varchar(45) DEFAULT NULL COMMENT '菜单类型:\nclick:点击推事件\nview:跳转URL\n....\n具体详见:http://mp.weixin.qq.com/wiki/13/43de8269be54a0a6f64413e4dfa94f39.html',
  `menu_name` varchar(100) DEFAULT NULL COMMENT '菜单名',
  `menu_key` varchar(45) DEFAULT NULL COMMENT '菜单KEY值',
  `menu_url` varchar(512) DEFAULT NULL COMMENT '用户点击菜单打开的链接',
  `order_no` int(11) DEFAULT NULL COMMENT '排序编号,降序排序',
  `message_id` int(11) DEFAULT NULL COMMENT '当menu_type为click时,用户点击此菜单后收到的消息',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COMMENT='微信菜单表';

CREATE TABLE `wx_message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `message_type` varchar(64) NOT NULL COMMENT '消息类型',
  `message_name` varchar(128) NOT NULL COMMENT '消息名',
  `message_content` text COMMENT '消息内容',
  `message_media` varchar(512) DEFAULT NULL COMMENT '消息的媒体文件，如图片,音频,视频等',
  `message_title` varchar(512) DEFAULT NULL COMMENT '消息的标题',
  `message_description` text COMMENT '消息的描述',
  `message_hq_media` varchar(512) DEFAULT NULL COMMENT '高清的消息的媒体文件',
  `message_thumb` varchar(512) DEFAULT NULL COMMENT '消息的缩略图',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='微信消息';

CREATE TABLE `wx_message_article` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `message_id` int(11) NOT NULL COMMENT '消息id',
  `article_title` varchar(512) DEFAULT NULL COMMENT '图文消息标题',
  `article_description` text COMMENT '图文消息描述',
  `article_pic` varchar(512) DEFAULT NULL COMMENT '图片',
  `article_url` varchar(512) DEFAULT NULL COMMENT '点击图文消息跳转链接',
  `order_no` int(11) NOT NULL COMMENT '排序号,倒序排序',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COMMENT='图文消息的图文内容表';

CREATE TABLE `wx_subscribe_account` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `open_id` varchar(512) DEFAULT NULL COMMENT '关注用户的openId',
  `nickname` varchar(512) DEFAULT NULL COMMENT '昵称',
  `sex` varchar(45) DEFAULT NULL COMMENT '性别',
  `city` varchar(45) DEFAULT NULL COMMENT '城市',
  `province` varchar(45) DEFAULT NULL COMMENT '省份',
  `country` varchar(45) DEFAULT NULL COMMENT '国家',
  `language` varchar(45) DEFAULT NULL COMMENT '用户的语言,简体中文为zh_CN',
  `head_img_url` varchar(512) DEFAULT NULL COMMENT '头像url',
  `subscribe` int(1) DEFAULT NULL COMMENT '关注状态:1 关注;0 取消关注',
  `subscribe_time` datetime DEFAULT NULL COMMENT '关注时间',
  `unsubscribe_time` datetime DEFAULT NULL COMMENT '取消关注时间',
  `union_id` varchar(512) DEFAULT NULL COMMENT 'unionid',
  `create_time` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='关注用户表';
