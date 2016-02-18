[01]  자료실의 제작(답변형 게시판의 변형)

>>>>> /WebContent/WEB-INF/doc/pds5_q.sql 
------------------------------------------------------
1. 게시판 테이블 구조 

DROP TABLE pds5; 

CREATE TABLE pds5 ( 
  bbsno    MEDIUMINT      NOT NULL AUTO_INCREMENT,  -- 글 일련 번호 
  rname    VARCHAR(20)    NOT NULL,  -- 글쓴이
  email     VARCHAR(100)          NULL, -- 이메일  
  title       VARCHAR(200)  NOT NULL,  -- 제목(*) 
  content  TEXT                NOT NULL,  -- 글 내용, 65536자 저장 가능 
  passwd  VARCHAR(15)    NOT NULL,  -- 비밀 번호 
  viewcnt  SMALLINT        DEFAULT 0, -- 조회수, 기본값 사용 
  rdate     DATETIME        NOT NULL,  -- 등록 날짜, sysdate 
  grpno    MEDIUMINT     DEFAULT 0, -- 부모글 번호 
  indent    SMALLINT       DEFAULT 0, -- 답변여부 
  ansnum  SMALLINT       DEFAULT 0, -- 답변 순서
  url         VARCHAR(100)        NULL, -- URL, 참고 주소
  file1       VARCHAR(100)         NULL, -- 파일명 1
  size1       BIGINT           DEFAULT 0, -- 파일 크기 1
  file2       VARCHAR(100)         NULL, -- 파일명 2
  size2       BIGINT           DEFAULT 0, -- 파일 크기 2
  ip           VARCHAR(15)  NOT NULL, -- IP 주소, 000.000.000.000 
  PRIMARY KEY (bbsno)  
); 


2. 글 추가(C: Create) 
INSERT INTO pds5(rname, email, title, content, passwd, viewcnt, rdate, grpno, indent, ansnum, url, file1, size1, file2, size2, ip)
VALUES('왕눈이', 'email1@mail.com', '2014년 10일 남았음', '새해 복 많이 받으세요.', '123', 0, now(), 0, 0, 0, 
            'http://www.kma.go.kr', 'test.jpg', 100, 'small.jpg', 50, '172.16.0.1');

INSERT INTO pds5(rname, email, title, content, passwd, viewcnt, rdate, grpno, indent, ansnum, url, file1, size1, file2, size2, ip)
VALUES('왕눈이', 'email1@mail.com', '2015년 6월 지나감', '이제 가을입니다.', '123', 0, now(), 0, 0, 0, 
            'http://www.kma.go.kr', 'mt.jpg', 100, 'mt2.jpg', 50, '172.16.0.1');

            
3. 전체 글 목록(S:Total Select List), 최신글 먼저 출력 
   - ASC: 오름 차순, DESC: 내림 차순 

SELECT bbsno, email, rname, title, content, passwd, viewcnt, rdate, grpno, indent, ansnum, url, file1, size1, file2, size2, ip 
FROM pds5
ORDER BY bbsno DESC;

 bbsno email           rname title         content       passwd viewcnt rdate                 grpno indent ansnum url                  file1    size1 file2     size2 ip
 ----- --------------- ----- ------------- ------------- ------ ------- --------------------- ----- ------ ------ -------------------- -------- ----- --------- ----- ----------
     2 email1@mail.com 왕눈이   2015년 6월 지나감  이제 가을입니다.     123          0 2015-06-29 14:25:29.0     0      0      0 http://www.kma.go.kr mt.jpg     100 mt2.jpg      50 172.16.0.1
     1 email1@mail.com 왕눈이   2014년 10일 남았음 새해 복 많이 받으세요. 123          0 2015-06-29 14:25:28.0     0      0      0 http://www.kma.go.kr test.jpg   100 small.jpg    50 172.16.0.1


4. 조회수 증가 
UPDATE pds5
SET viewcnt = viewcnt + 1
WHERE bbsno = 1;


5. 1건의 글 보기(R:Read, PK 사용) 
SELECT bbsno, email, rname, title, content, passwd, viewcnt, rdate, grpno, indent, ansnum, url, file1, size1, file2, size2, ip  
FROM pds5
WHERE bbsno = 1;
 bbsno email           rname title         content       passwd viewcnt rdate                 grpno indent ansnum url                  file1    size1 file2     size2 ip
 ----- --------------- ----- ------------- ------------- ------ ------- --------------------- ----- ------ ------ -------------------- -------- ----- --------- ----- ----------
     1 email1@mail.com 왕눈이   2014년 10일 남았음 새해 복 많이 받으세요. 123          0 2015-06-29 14:25:28.0     0      0      0 http://www.kma.go.kr test.jpg   100 small.jpg    50 172.16.0.1


SELECT bbsno, email, rname, title, url 
FROM pds5;

 bbsno email           rname title                     url
 ----- --------------- ----- ------------------------- --------------------
     1 email1@mail.com 왕눈이   2014년 10일 남았음             http://www.kma.go.kr
     2 email2@mail.com 아로미   2015년 개발자 취업              http://www.kma.go.kr
     3 mail@mail.com   왕눈이   朴, 방미 연기 "가장 빠른 시기로 재조정"  http://www.kma.go.kr
     4 mail@mail.com   왕눈이   할부 혜택받으셨네요, 비싼 이자 내고      http://www.kma.go.kr
     5 mail@mail.com   왕눈이   WHO조사단 "학교, 수업재개 강력 고려해야" 

     
6. 패스워드 검사
   - COUNT(): 발생한 레코드의 수를 계산, 레코드가 없으면 0 출력

SELECT COUNT(passwd) as cnt
FROM pds5
WHERE bbsno = 1 AND passwd='123';

 cnt
 ---
   1

   
7. 글 수정(U:Update), PK는 레코드를 구분하는 고유 기능을 가지고 있음으로 
   수정하는 것은 권장하지 않음. 
    
1) 레코드 수정: ip 컬럼은 수정하지 않음.
UPDATE pds5
SET rname = '아로미', email = 'frog@mail.com', content = '연 1.75%→1.50%로 전격 인하', url = 'http://www.daum.net'
WHERE bbsno = 1;

2) 변경 확인
SELECT bbsno, rname, email, title, content, url
FROM pds5
WHERE bbsno=1; 

 bbsno rname email         title content              url
 ----- ----- ------------- ----- -------------------- -------------------
     1 아로미   frog@mail.com 기준금리  연 1.75%→1.50%로 전격 인하 http://www.daum.net
     

8. 글 삭제(D:Delete) 
DELETE FROM pds5
WHERE bbsno=1;

           
9. 검색 글 목록(S:Search List), title 컬럼에 '제목'이란  
    단어가 들어가 있는 레코드 검색 
    - 목록은 재작시 검색을 기반으로 제작하며 전체 내용은
      전체 검색과도 같습니다.
   
    - rname, title, content 컬럼 대상
  
    - 검색을 하지 않는 경우 
      SELECT bbsno, email, rname, title, content, passwd, viewcnt, rdate, grpno, indent, ansnum, url, file1, size1, file2, size2, ip 
      FROM pds5
      ORDER BY bbsno DESC;
      
    - 이름 검색
      SELECT bbsno, email, rname, title, content, passwd, viewcnt, rdate, grpno, indent, ansnum, url, file1, size1, file2, size2, ip 
      FROM pds5
      WHERE rname LIKE '%왕눈이%'
      ORDER BY bbsno DESC;


    - 제목으로 검색   
      SELECT bbsno, email, rname, title, content, passwd, viewcnt, rdate, grpno, indent, ansnum, url, file1, size1, file2, size2, ip 
      FROM pds5
      WHERE title LIKE '%설악산%'
      ORDER BY bbsno DESC;


    - 내용으로 검색  
      SELECT bbsno, email, rname, title, content, passwd, viewcnt, rdate, grpno, indent, ansnum, url, file1, size1, file2, size2, ip 
      FROM pds5
      WHERE content LIKE '%워크숍%'
      ORDER BY bbsno DESC;



  
10. 페이징
   - 목록은 페이징 구현을 필수로 합니다.
   
1) 검색된 전체 레코드 수
SELECT COUNT(*) as cnt FROM pds5 WHERE title LIKE '%왕눈이%';

 cnt
 ---
   3
        
   
2) 페이징
SELECT bbsno, email, rname, title, content, passwd, viewcnt, rdate, grpno, indent, ansnum, url, ip 
FROM pds5
WHERE title LIKE '%왕눈이%'
ORDER BY bbsno DESC
LIMIT 0, 5;


----------------------
11. 답변 관련 SQL
----------------------

1. 답변형 게시판에서의 글쓰기 
   - grpno: 그룹 번호로 이용, 새로운 글이 써지면 증가됨, 새로운 글이 써지면
            새로운 그룹이 생성됨을 의미.
         
① 모든 레코드 삭제         
   DELETE FROM pds5;

② 등록된 레코드 없으면 null 발생
   SELECT MAX(grpno) FROM pds5;
   
   MAX(grpno)
   ----------
         NULL

③ null이면 0으로 변경
   SELECT IFNULL(MAX(grpno), 0) FROM pds5;
   
   IFNULL(MAX(grpno), 0)
   ---------------------
                       0

④ 최대값 + 1
   SELECT IFNULL(MAX(grpno), 0)+1 FROM pds5;
   
   IFNULL(MAX(grpno), 0)+1
   -----------------------
                          1
                       
⑤ 컬럼의 별명 지정: as 이용
   SELECT IFNULL(MAX(grpno), 0)+1 as grpno FROM pds5;

   grpno
   -----
       1

⑥ 답변형 게시판의 글쓰기 쿼리
   INSERT INTO pds5(rname, email, title, content, passwd, viewcnt, rdate,
                      grpno, indent, ansnum, url, ip)
   VALUES('왕눈이', '2014년 10일 남았음', '새해 복 많이 받으세요.', now(),
               (SELECT IFNULL(MAX(grpno), 0)+1 FROM pds5 as grpno), 0, 0);

                  
⑦ SELECT                  
   SELECT bbsno, rname, email, grpno, indent, ansnum, url, ip 
   FROM pds5;
                  
                  
2. 답변의 처리: public int reply(pds5DTO dto) 메소드에서 사용

   - grpno: 답변을 붙일 기존에 등록된 레코드의 grpno 값 사용 
   - indent: 답변을 붙일 기존에 등록된 레코드의 indent+1 사용
   - ansnum: 답변을 붙일 기존에 등록된 레코드의 ansnum+1 사용
     
   - ansnum 컬럼의 값 증가
   UPDATE pds5 
   SET ansnum = ansnum + 1 
   WHERE grpno = ? AND ansnum > ?; 
   
   - 답변 추가
   INSERT INTO pds5(rname, email, title, content, passwd, viewcnt, rdate, grpno, indent, ansnum, url, ip)
   VALUES('가길동', '2015년', '새해 복 많이 받으세요.', '123', 0, now(), ?, ?, ?, ?); 


--------------------------------------------
13. 답변 관련 SQL에서의 페이징
--------------------------------------------
    - 검색을 하지 않는 경우 
      SELECT bbsno, email, rname, title, content, passwd, viewcnt, rdate, grpno, indent, ansnum, url, ip 
      FROM pds5
      ORDER BY grpno DESC, ansnum ASC
      LIMIT 0, 10;
      
    - 이름 검색
      SELECT bbsno, email, rname, title, content, passwd, viewcnt, rdate, grpno, indent, ansnum, url, ip 
      FROM pds5
      WHERE rname LIKE '%왕눈이%'
      ORDER BY grpno DESC, ansnum ASC
      LIMIT 0, 10;

    - 제목으로 검색   
      SELECT bbsno, email, rname, title, content, passwd, viewcnt, rdate, grpno, indent, ansnum, url, ip 
      FROM pds5
      WHERE title LIKE '%설악산%'
      ORDER BY grpno DESC, ansnum ASC
      LIMIT 0, 10;

    - 내용으로 검색  
      SELECT bbsno, email, rname, title, content, passwd, viewcnt, rdate, grpno, indent, ansnum, url, ip 
      FROM pds5
      WHERE content LIKE '%워크숍%'
      ORDER BY grpno DESC, ansnum ASC
      LIMIT 0, 10;


------------------------------------------------------

