
CREATE SCHEMA `emotion` ;

CREATE TABLE `emotion`.`user_tbl` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `user_type` varchar(45) NOT NULL DEFAULT 'N',
  `email_id` varchar(90) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_name_UNIQUE` (`user_name`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;




  CREATE TABLE `emotion`.`emotion_type_tbl` (
  `emotion_id` int(11) NOT NULL AUTO_INCREMENT,
  `emotion_type` varchar(45) NOT NULL,
  PRIMARY KEY (`emotion_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



insert into emotion_type_tbl value(1,'Happy');
insert into emotion_type_tbl value(2,'Surprised');
insert into emotion_type_tbl value(3,'Sorry');
insert into emotion_type_tbl value(4,'Angry');
insert into emotion_type_tbl value(5,'Disgust');
insert into emotion_type_tbl value(6,'Feeling Blue');
insert into emotion_type_tbl value(7,'Sad');
insert into emotion_type_tbl value(8,'Embarrased');
insert into emotion_type_tbl value(9,'Hurt');



CREATE TABLE `emotion`.`user_emotions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `emotion_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
