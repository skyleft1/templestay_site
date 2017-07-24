
-- springboard 데이터베이스 구조 내보내기
DROP DATABASE IF EXISTS templestay_site;

CREATE DATABASE templestay_site DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;


-- 사용자 추가
GRANT ALL ON templestay_site.* TO tester1@localhost IDENTIFIED BY '1234';


FLUSH PRIVILEGES;



-- 데이터베이스 변경
USE templestay_site;

DROP TABLE IF EXISTS TB_User;


DROP TABLE IF EXISTS TB_Bbs_Article;
DROP TABLE IF EXISTS TB_Bbs_Board;


-- 유저 종류 테이블
CREATE TABLE IF NOT EXISTS  TB_User (
     userno       INT   NOT NULL  auto_increment
   , userid       NVARCHAR(20)   NOT NULL
	, userpassword       NVARCHAR(40)   NOT NULL
	, username           NVARCHAR(40)   NOT NULL
	, useremail	NVARCHAR(40)	NULL
	, phonenumber     NVARCHAR(40)    NULL                            
	, joindate      DateTime       NULL
    , PRIMARY KEY(userno)
)
ENGINE=InnoDB 
AUTO_INCREMENT=1 
DEFAULT CHARACTER SET utf8 
COLLATE utf8_general_ci;

insert into TB_User(userid, userpassword, username ) values ('aa1','aapw1', 'a이름' );
insert into TB_User(userid, userpassword, username ) values ('bb1' ,'bbpw1' , 'b이름' );
insert into TB_User(userid, userpassword, username ) values ('cc1', 'ccpw1'    , 'c이름' );

select * from TB_User;





commit;
  





