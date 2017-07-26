
-- springboard 데이터베이스 구조 내보내기
DROP DATABASE IF EXISTS templestay_site;

CREATE DATABASE templestay_site DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;


-- 사용자 추가
GRANT ALL ON templestay_site.* TO tester1@localhost IDENTIFIED BY '1234';


FLUSH PRIVILEGES;




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






-- 데이터베이스 변경
USE templestay_site;

DROP TABLE IF EXISTS TB_User;

DROP TABLE IF EXISTS TB_Bbs_Board;
DROP TABLE IF EXISTS TB_Bbs_Article;



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




-- 보드 종류 테이블
CREATE TABLE IF NOT EXISTS  TB_Bbs_Board (
      boardkind       NVARCHAR(20)   NOT NULL
    , boardname       NVARCHAR(40)   NOT NULL
    , useYN         TINYINT(1)     NOT NULL   DEFAULT  1 
    , insertUID     VARCHAR(40)    NULL                            
    , insertdate      DateTime       NULL
    , updateUID     VARCHAR(40)    NULL                            
    , updatedate      DateTime       NULL
    , PRIMARY KEY(boardkind)
)
ENGINE=InnoDB 
AUTO_INCREMENT=1 
DEFAULT CHARACTER SET utf8 
COLLATE utf8_general_ci;

insert into TB_Bbs_Board(boardkind, boardname) values ('free','자유게시판');
insert into TB_Bbs_Board(boardkind, boardname) values ('qna' ,'QnA게시판' );
insert into TB_Bbs_Board(boardkind, boardname) values ('data','자료실'    );

select * from TB_Bbs_Board;



-- 게시글 테이블
CREATE TABLE IF NOT EXISTS  TB_Bbs_Article (
      articleno     INT UNSIGNED  NOT NULL AUTO_INCREMENT
    , boardkind       NVARCHAR(20)
    , title         NVARCHAR(200) NOT NULL
    , content       MEDIUMTEXT
    , email         NVARCHAR(60)
    , hit           INT UNSIGNED  DEFAULT  0   
    , regdate       DateTime
    , useYN         TINYINT(1)    NOT NULL   DEFAULT  1  
    , insertUID     VARCHAR(40)   NULL                            
    , insertdate      DateTime      NULL
    , updateUID     VARCHAR(40)   NULL                            
    , updatedate      DateTime      NULL
    
    , PRIMARY KEY(articleno)
    , FOREIGN KEY(boardkind) REFERENCES TB_Bbs_Board(boardkind)
)
ENGINE=InnoDB 
AUTO_INCREMENT=1 
DEFAULT CHARACTER SET utf8 
COLLATE utf8_general_ci;

insert into TB_Bbs_Article( boardkind, title, content, email, hit, regdate, UseYN ) values ( "free", "article test 01", "article test 01", "aa@aa.co.kr", 0, now(), 1 );
insert into TB_Bbs_Article( boardkind, title, content, email, hit, regdate, UseYN ) values ( "free", "article test 02", "article test 02", "aa@aa.co.kr", 0, now(), 1 );
insert into TB_Bbs_Article( boardkind, title, content, email, hit, regdate, UseYN ) values ( "free", "article test 03", "article test 03", "aa@aa.co.kr", 0, now(), 1 );
insert into TB_Bbs_Article( boardkind, title, content, email, hit, regdate, UseYN ) values ( "free", "article test 04", "article test 04", "aa@aa.co.kr", 0, now(), 1 );
insert into TB_Bbs_Article( boardkind, title, content, email, hit, regdate, UseYN ) values ( "free", "article test 05", "article test 05", "aa@aa.co.kr", 0, now(), 1 );
insert into TB_Bbs_Article( boardkind, title, content, email, hit, regdate, UseYN ) values ( "free", "article test 06", "article test 06", "aa@aa.co.kr", 0, now(), 1 );
insert into TB_Bbs_Article( boardkind, title, content, email, hit, regdate, UseYN ) values ( "free", "article test 07", "article test 07", "aa@aa.co.kr", 0, now(), 1 );
insert into TB_Bbs_Article( boardkind, title, content, email, hit, regdate, UseYN ) values ( "free", "article test 08", "article test 08", "aa@aa.co.kr", 0, now(), 1 );
insert into TB_Bbs_Article( boardkind, title, content, email, hit, regdate, UseYN ) values ( "free", "article test 09", "article test 09", "aa@aa.co.kr", 0, now(), 1 );
insert into TB_Bbs_Article( boardkind, title, content, email, hit, regdate, UseYN ) values ( "free", "article test 10", "article test 10", "aa@aa.co.kr", 0, now(), 1 );
insert into TB_Bbs_Article( boardkind, title, content, email, hit, regdate, UseYN ) values ( "free", "article test 11", "article test 11", "aa@aa.co.kr", 0, now(), 1 );
insert into TB_Bbs_Article( boardkind, title, content, email, hit, regdate, UseYN ) values ( "free", "article test 12", "article test 12", "aa@aa.co.kr", 0, now(), 1 );
insert into TB_Bbs_Article( boardkind, title, content, email, hit, regdate, UseYN ) values ( "free", "article test 13", "article test 13", "aa@aa.co.kr", 0, now(), 1 );
insert into TB_Bbs_Article( boardkind, title, content, email, hit, regdate, UseYN ) values ( "free", "article test 14", "article test 14", "aa@aa.co.kr", 0, now(), 1 );

select * from TB_Bbs_Article;

select * from TB_User;



commit;
  





