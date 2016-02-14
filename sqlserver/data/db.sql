CREATE TABLE IF NOT EXISTS `USERS2` (
  `USER_UID` varchar(32) NOT NULL,
  `USER_FNAME` varchar(32) NOT NULL,
  `USER_LNAME` varchar(32) NOT NULL,
  `USER_EMAIL` varchar(128) NOT NULL,
  `USER_PWDHSH` varchar(128) NOT NULL,
  `USER_PWDSALT` varchar(128) NOT NULL,
  PRIMARY KEY (`USER_UID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;




INSERT INTO `USERS2` (`USER_UID`, `USER_FNAME`, `USER_LNAME`, `USER_EMAIL`, `USER_PWDHSH`, `USER_PWDSALT`) VALUES
('snolton', 'Stuart', 'Nolton', 'scnolton@oakland.edu', 'Ë®VmIlRHDEJlo', 'Ë®1=ó²Ù‘ðá}êýwð!NU·´a½ËÔ«€Á_ÿ>eçVw>¥—Zú(fAaI‰-°…€©ŸƒÐ”#‰*s');

CREATE TABLE IF NOT EXISTS `BUSERS2` (
  `USER_UID` varchar(32) NOT NULL,
  `USER_FNAME` varchar(32) NOT NULL,
  `USER_LNAME` varchar(32) NOT NULL,
  `USER_EMAIL` varchar(128) NOT NULL,
  `USER_PWDHSH` varchar(128) NOT NULL,
  `USER_PWDSALT` varchar(128) NOT NULL,
  PRIMARY KEY (`USER_UID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
