/**********************************/
/* Table Name: 지출내역카테고리 */
/**********************************/
1.테이블 생성
DROP TABLE category;

CREATE TABLE category(
    categoryno                        INT(10)    NOT NULL    PRIMARY KEY AUTO_INCREMENT COMMENT '지출내역카테고리번호',
    sort                              VARCHAR(50)    NOT NULL COMMENT '분류'
) COMMENT='지출내역카테고리';

2.등록
INSERT INTO category(categoryno, sort)
VALUES(1, 'JAVA');

INSERT INTO category(categoryno, sort)
VALUES(2, 'JSP');

INSERT INTO category(categoryno, sort)
VALUES(3, 'Jquery');

SELECT * FROM category;

 categoryno sort
 ---------- ------
          1 JAVA
          2 JSP
          3 Jquery
          
3.목록
SELECT categoryno, sort
FROM category
ORDER BY categoryno;

 categoryno sort
 ---------- ------
          1 JAVA
          2 JSP
          3 Jquery

4.조회
SELECT categoryno, sort
FROM category
WHERE categoryno = 1;

 categoryno sort
 ---------- ----
          1 JAVA
          
5.삭제
DELETE FROM category
WHERE categoryno = 1;
