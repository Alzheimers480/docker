

CREATE TABLE IF NOT EXISTS `USERS2` (
  `USER_UID` varchar(32) NOT NULL,
  `USER_FNAME` varchar(32) NOT NULL,
  `USER_LNAME` varchar(32) NOT NULL,
  `USER_EMAIL` varchar(128) NOT NULL,
  `USER_PWDHSH` varchar(128) NOT NULL,
  `USER_PWDSALT` varchar(128) NOT NULL,
  `VERIFYED` smallint(1) DEFAULT 1,
  PRIMARY KEY (`USER_UID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;




INSERT INTO `USERS2` (`USER_UID`, `USER_FNAME`, `USER_LNAME`, `USER_EMAIL`, `USER_PWDHSH`, `USER_PWDSALT`, `VERIFYED`) VALUES
('imehrete', 'isaac', 'mehreteab', 'imehrete@oakland.edu', ' ûVT5KtbUzAeM', ' ûê3tƒÅÀR§¢d‘´…|Àk÷ð ÂÒm¯I±-Õ¶û¼EÁÎØ*H0½n!LU¼ÍÍžùw±!b}©åŒ“g©', 1),
('snolton', 'Stuart', 'Nolton', 'scnolton@oakland.edu', 'Ë®VmIlRHDEJlo', 'Ë®1=ó²Ù‘ðá}êýwð!NU·´a½ËÔ«€Á_ÿ>eçVw>¥—Zú(fAaI‰-°…€©ŸƒÐ”#‰*s', 1),
('switch202', 'Grumpy', 'OldMan', 'scnolton@oakland.edu', ',¨Wo0fwo.iPcE', ',¨î\Z_‹ã\0¡²ö‡3ÀD{MVxrºéUr×ycÌà=¾©N-¥[ððV`i°ÍÁ4Œ®h·¨‹=(¯0Éñ', 0),
('switch209', 'Grumpy', 'OldMan', 'scnolton@oakland.edu', 'Ó²tQc0Ewto0c.', 'Ó²Ï˜)$• {Õ+2ñ‡>í”×” ‚d°D¼ŽH~]qÛÞE¼Œ£¼;¨ƒ‰$ŠqùÓ(Ì1Çªo', 0);


CREATE TABLE IF NOT EXISTS `ACQUAINTANCE` (
  `ACQUAINTANCE_UID` varchar(32) NOT NULL,
  `ACQUAINTANCE_FNAME` varchar(32) NOT NULL,
  `ACQUAINTANCE_LNAME` varchar(32) NOT NULL,
  `PICTURE_SET` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`ACQUAINTANCE_UID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `ACQUAINTANCE` (`ACQUAINTANCE_UID`, `ACQUAINTANCE_FNAME`, `ACQUAINTANCE_LNAME`, `PICTURE_SET`) VALUES
('freind1', 'Jim', 'Bob', 'Test'),
('loopy', 'Grumpy', 'OldFart', '/SECS/home/s/scnolton/facePics/loopy');

CREATE TABLE IF NOT EXISTS `RELATIONSHIP` (
  `USER_UID` varchar(32) NOT NULL,
  `ACQUAINTANCE_UID` varchar(32) NOT NULL,
  `RELATION` varchar(256) DEFAULT NULL,
  `DESCRIPTION` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`USER_UID`,`ACQUAINTANCE_UID`),
  KEY `ACQUAINTANCE_UID` (`ACQUAINTANCE_UID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

ALTER TABLE `RELATIONSHIP`
  ADD CONSTRAINT `RELATIONSHIP_ibfk_1` FOREIGN KEY (`USER_UID`) REFERENCES `USERS2` (`USER_UID`),
  ADD CONSTRAINT `RELATIONSHIP_ibfk_2` FOREIGN KEY (`ACQUAINTANCE_UID`) REFERENCES `ACQUAINTANCE` (`ACQUAINTANCE_UID`);

INSERT INTO `RELATIONSHIP` (`USER_UID`, `ACQUAINTANCE_UID`, `RELATION`, `DESCRIPTION`) VALUES
('snolton', 'freind1', 'Son In-Law', 'when you first met him you were cleaning your gun');