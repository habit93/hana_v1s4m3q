/**********************************/
/* Table Name: 지출내역카테고리 */
/**********************************/
1) 테이블 구조
DROP TABLE category;

CREATE TABLE category(
    categoryno                        INT(10)    NOT NULL    PRIMARY KEY AUTO_INCREMENT COMMENT '지출내역카테고리번호',
    sort                              VARCHAR(50)    NOT NULL COMMENT '분류'
) COMMENT='지출내역카테고리';


2) 등록
INSERT INTO category(sort)
VALUES('식비');
INSERT INTO category(sort)
VALUES('카페');
INSERT INTO category(sort)
VALUES('문화생활');


3) 목록
SELECT * FROM category;

SELECT categoryno, sort
FROM category
ORDER BY categoryno DESC;

4) 조회
SELECT categoryno, sort
FROM category
WHERE categoryno=1;

5) 수정
UPDATE category
SET sort=''
WHERE categoryno=1;

6) 삭제
DELETE FROM category
WHERE categoryno=1;

