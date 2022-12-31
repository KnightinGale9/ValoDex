#Inserting data to tables
INSERT INTO `ValoDex`.`Region` VALUES ('HK/TW',0);
INSERT INTO `ValoDex`.`Region` VALUES ('CN',0);
INSERT INTO `ValoDex`.`Region` VALUES ('JP',0);
INSERT INTO `ValoDex`.`Region` VALUES ('KR',0);
INSERT INTO `ValoDex`.`Region` VALUES ('SA',0);
INSERT INTO `ValoDex`.`Region` VALUES ('PH',0);
INSERT INTO `ValoDex`.`Region` VALUES ('ID',0);
INSERT INTO `ValoDex`.`Region` VALUES ('TH',0);
INSERT INTO `ValoDex`.`Region` VALUES ('VN',0);
INSERT INTO `ValoDex`.`Region` VALUES ('MY/SG',0);
INSERT INTO `ValoDex`.`Region` VALUES ('OCE',0);
INSERT INTO `ValoDex`.`Region` VALUES ('SEA',0);
INSERT INTO `ValoDex`.`Region` VALUES ('EA',0);


Insert into `ValoDex`.`Tournament_Rating` VALUES ('S');
Insert into `ValoDex`.`Tournament_Rating` VALUES ('A');
Insert into `ValoDex`.`Tournament_Rating` VALUES ('B');
Insert into `ValoDex`.`Tournament_Rating` VALUES ('C');

Insert into `ValoDex`.`Rating_Placement` (`Tournament_Rating_Type`,`Placement`,`Elo`) VALUES ('S',1,100);
Insert into `ValoDex`.`Rating_Placement` (`Tournament_Rating_Type`,`Placement`,`Elo`) VALUES ('S',2,100);
Insert into `ValoDex`.`Rating_Placement` (`Tournament_Rating_Type`,`Placement`,`Elo`) VALUES ('S',4,100);
Insert into `ValoDex`.`Rating_Placement` (`Tournament_Rating_Type`,`Placement`,`Elo`) VALUES ('S',8,100);
Insert into `ValoDex`.`Rating_Placement` (`Tournament_Rating_Type`,`Placement`,`Elo`) VALUES ('A',1,100);
Insert into `ValoDex`.`Rating_Placement` (`Tournament_Rating_Type`,`Placement`,`Elo`) VALUES ('A',2,100);
Insert into `ValoDex`.`Rating_Placement` (`Tournament_Rating_Type`,`Placement`,`Elo`) VALUES ('A',4,100);
Insert into `ValoDex`.`Rating_Placement` (`Tournament_Rating_Type`,`Placement`,`Elo`) VALUES ('A',8,100);

