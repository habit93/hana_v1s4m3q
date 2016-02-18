/**********************************/
/* Table Name: 블로그내용 */
/**********************************/
1) 테이블 구조
DROP TABLE blogreply;
 
/**********************************/
/* Table Name: 블로그 댓글 */
/**********************************/
CREATE TABLE blogreply(
    blogreplyno                       MEDIUMINT    NOT NULL    PRIMARY KEY AUTO_INCREMENT COMMENT '블로그 댓글 번호',
    content                           VARCHAR(80)     NOT NULL COMMENT '내용',
    rdate                             DATETIME     NOT NULL COMMENT '등록일',
    blogno                            MEDIUMINT    NOT NULL COMMENT '블로그 번호',
    indent                            MEDIUMINT    DEFAULT 0     NOT NULL COMMENT '답변차수',
    ansnum                            SMALLINT     DEFAULT 0     NOT NULL COMMENT '답변순서',
  FOREIGN KEY (blogno) REFERENCES blog (blogno)
) COMMENT='블로그 댓글';
 
 
2) 등록
SELECT * FROM blog ORDER BY blogno DESC;
 

INSERT INTO blogreply(content, rdate, blogno, indent, ansnum)
VALUES('내용1', now(), 4, 0, (SELECT IFNULL(MAX(ansnum), 0)+1 FROM blogreply as ansnum));



SELECT * FROM blogreply;

 
3) 목록
SELECT blogreplyno, content, rdate, blogno, indent, ansnum
FROM blogreply
ORDER BY blogreplyno DESC;
 

-- 특정 블로그의 답글
SELECT blogreplyno, content, rdate, blogno, indent, ansnum
FROM blogreply
-- 특정 블로그의 답글
SELECT blogreplyno, content, rdate, blogno, indent, ansnum
FROM blogreply
WHERE blogno = 19
ORDER BY ansnum ASC;
 

4) 조회
SELECT blogreplyno, content, rdate, blogno, indent, ansnum
FROM blogreply
WHERE blogreplyno = 1;
 
 
 
5) 수정
UPDATE blogreply
SET content=''
WHERE blogreplyno=1;
 
 
6) 삭제
DELETE FROM blogreply
WHERE blogreplyno=1;
 
 
7) 답변
-- 단계 1, 현재글의 관련 정보를 읽어옴.
SELECT blogno, indent, ansnum
FROM blogreply
WHERE blogreplyno =1;
 
-- 단계 2
UPDATE blogreply
SET ansnum = ansnum + 1
WHERE blogreplyno = 1 AND 현재글 ansnum > 0
 
-- JAVA: indent = indent + 1;
--          ansnum = 현재글 ansnum + 1
 
 
-- 단계 3: indent, ansnum 컬럼의 값이 들어가야함.
INSERT INTO blogreply(content, rdate, blogno, indent, ansnum)
VALUES('왕눈이', '1234', 'mail@mail.com', '내용1', now(), 19, 1, 1);
 
 