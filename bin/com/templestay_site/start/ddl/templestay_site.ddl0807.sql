
-- springboard 데이터베이스 구조 내보내기
DROP DATABASE IF EXISTS templestay_site;

CREATE DATABASE templestay_site DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;


-- 사용자 추가
GRANT ALL ON templestay_site.* TO tester1@localhost IDENTIFIED BY '1234';


FLUSH PRIVILEGES;



-- springboard 데이터베이스 구조 내보내기
DROP DATABASE IF EXISTS templestay_site;

CREATE DATABASE templestay_site DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;





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
    , addr_postcode     NVARCHAR(40)    NULL
    , addr_road     NVARCHAR(40)    NULL
    , addr_jibun     NVARCHAR(40)    NULL
	, joindate      DateTime       NULL

    , PRIMARY KEY(userno)
)
ENGINE=InnoDB 
AUTO_INCREMENT=1 
DEFAULT CHARACTER SET utf8 
COLLATE utf8_general_ci;

insert into TB_User(userid, userpassword, username ) values ('aa1','aapw1', 'a이름' );



-- 보드 종류 테이블
CREATE TABLE IF NOT EXISTS  TB_Bbs_Board (
      boardcd       NVARCHAR(20)   NOT NULL
    , boardname       NVARCHAR(40)   NOT NULL
    , userid     VARCHAR(40)    NULL                            

    , PRIMARY KEY(boardcd)
)
ENGINE=InnoDB 
AUTO_INCREMENT=1 
DEFAULT CHARACTER SET utf8 
COLLATE utf8_general_ci;

select * from TB_Bbs_Board;



-- 게시글 테이블
CREATE TABLE IF NOT EXISTS  TB_Bbs_Article (
      articleno     INT UNSIGNED  NOT NULL AUTO_INCREMENT
    , boardcd       NVARCHAR(20)
    , title         NVARCHAR(200) NOT NULL
    , content       MEDIUMTEXT
    , email         NVARCHAR(60)
    , hit           INT UNSIGNED  DEFAULT  0   
    , date       DateTime
    , userid     VARCHAR(40)   NULL                            
    
    , PRIMARY KEY(articleno)
    , FOREIGN KEY(boardcd) REFERENCES TB_Bbs_Board(boardcd)
)
ENGINE=InnoDB 
AUTO_INCREMENT=1 
DEFAULT CHARACTER SET utf8 
COLLATE utf8_general_ci;

insert into TB_Bbs_Article (boardcd, title, content, email, hit, date , userid ) 
value('free', 'test_title', 'test_content', 'new@naver.com', 0, now(), 'new' );
insert into TB_Bbs_Article (boardcd, title, content, email, hit, date , userid ) 
value('free', 'test_title', 'test_content', 'new@naver.com', 0, now(), 'new' );
insert into TB_Bbs_Article (boardcd, title, content, email, hit, date , userid ) 
value('free', 'test_title', 'test_content', 'new@naver.com', 0, now(), 'new' );

select * from TB_Bbs_Article;

select * from TB_User;




-- 덧글 테이블
DROP TABLE IF EXISTS TB_Bbs_Comments;
CREATE TABLE IF NOT EXISTS  TB_Bbs_Comments (
      commentno     INT UNSIGNED     NOT NULL AUTO_INCREMENT
    , articleno     INT UNSIGNED     NOT NULL     
    , memo          NVARCHAR(4000)
    , date       DateTime 
    , userid     VARCHAR(40)      NULL                            

    
    , PRIMARY KEY(commentno)
)
ENGINE=InnoDB 
AUTO_INCREMENT=1 
DEFAULT CHARACTER SET utf8 
COLLATE utf8_general_ci;

select * from TB_Bbs_Comments;     
           
           
-- 첨부파일 테이블
DROP TABLE IF EXISTS TB_Bbs_Attachfile;
CREATE TABLE IF NOT EXISTS  TB_Bbs_Attachfile (
      attachfileno   INT UNSIGNED    NOT NULL AUTO_INCREMENT
    , filename       NVARCHAR(50)    NOT NULL
    , filetype       NVARCHAR(30)    
    , filesize       INT             
    , articleno      INT             	
    , date 			DateTime
    , userid      VARCHAR(40)     NULL                            
    , imageData      INT        NULL
    , tempfilename VARCHAR(40)     NULL                            
    
    , PRIMARY KEY(attachfileno)
)
ENGINE=InnoDB 
AUTO_INCREMENT=1 
DEFAULT CHARACTER SET utf8 
COLLATE utf8_general_ci;

select * from TB_Bbs_Attachfile;   


commit;
  





