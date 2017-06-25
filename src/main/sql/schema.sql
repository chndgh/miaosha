--数据库初始化脚本

--创建数据库
CREATE DATABASE seckill;

--使用数据库
use seckill;
--创建秒杀库存表
CREATE TABLE seckill(
  `seckill_id` bigint NOT NULL AUTO_INCREMENT COMMENT '商品库存id',
  `name` VARCHAR(120) NOT NULL COMMENT '商品名称',
  `number` int not null COMMENT '库存数量',
  `start_time` TIMESTAMP not null default CURRENT_TIMESTAMP COMMENT '秒杀开启时间',
  `end_time` TIMESTAMP  null COMMENT '秒杀结束时间',
  `create_time` TIMESTAMP not null default CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (seckill_id),
  key idx_start_time(start_time),
  key idx_end_time(end_time),
  key idx_create_time(create_time)
)ENGINE=InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=utf8 comment='秒杀库存表';

--初始化数据
insert into
  seckill(name,number,start_time,end_time)
VALUES
  ('1000元秒杀iphone6',100,'2016-08-04 00:00:00','2016-11-02 00:00:00'),
  ('500元秒杀iPad2',200,'2015-11-01 00:00:00','2016-11-02 00:00:00'),
  ('100元秒杀小米4',300,'2015-11-01 00:00:00','2016-11-02 00:00:00'),
  ('200元秒杀小米3',400,'2015-11-01 00:00:00','2016-11-02 00:00:00');


CREATE TABLE success_killed(
  `seckill_id` bigint not null comment '秒杀商品id',
  `user_phone` bigint not null comment '用户手机号',
  `state` tinyint not null DEFAULT -1 comment '状态标示: -1:无效 0:成功 1: 已付款 2: 已发货',
  `create_time` TIMESTAMP not null comment '创建时间',
  PRIMARY KEY (seckill_id,user_phone),/*联合主键*/
  key idx_create_time(create_time)
)ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='秒杀成功明细表';

--连接数据库控制台
mysql -uroot -p

--查看数据库创建语句: show create table seckill\G