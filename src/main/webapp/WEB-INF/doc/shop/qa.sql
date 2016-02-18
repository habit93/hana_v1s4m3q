/**********************************/
/* Table Name: 질문답변 */
/**********************************/
DROP TABLE Pds5;

CREATE TABLE Pds5(
    qano                              INT(10)    NOT NULL    PRIMARY KEY AUTO_INCREMENT COMMENT '질문답변번호',
    title                             VARCHAR(20)    NOT NULL COMMENT '제목',
    content                           VARCHAR(200)     NOT NULL COMMENT '내용',
    passwd                            VARCHAR(15)    NOT NULL COMMENT '패스워드',
    rdate                             DATE     NOT NULL COMMENT '등록일',
    grpno                             MEDIUMINT(10)    DEFAULT 0     NOT NULL COMMENT '부모글번호',
    indent                            SMALLINT(10)     DEFAULT 0     NOT NULL COMMENT '답변여부',
    ansnum                            SMALLINT(10)     DEFAULT 0     NOT NULL COMMENT '답변순서',
    itemno                            INT(10)    NULL  COMMENT '물건번호',
  FOREIGN KEY (itemno) REFERENCES item (itemno)
) COMMENT='질문답변';


등록
INSERT INTO qa(title, content, passwd, rdate, grpno, indent, ansnum, itemno)
VALUES ('제목', '내용', now(), 0, 0, 0, 1);

목록
SELECT qano, title, content, passwd, rdate, grpno, indent, ansnum, itemno
FROM Pds5
ORDER BY qano DESC;

조회
SELECT qano, title, content, passwd, rdate, grpno, indent, ansnum, itemno
FROM Pds5
WHERE qano=1;

수정
UPDATE Pds5
SET title='', content=''
WHERE qano=1;

삭제
DELETE FROM qa
WHERE qano=1;

패스워드 검사
- COUNT(): 발생한 레코드의 수를 계산, 레코드가 없으면 0 출력

SELECT COUNT(passwd) as cnt
FROM pds5
WHERE bbsno = 1 AND passwd='123';


----------------------
답변 관련 SQL
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

