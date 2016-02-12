/**********************************/
/* Table Name: 지출내역카테고리 */
/**********************************/
1) 테이블 구조
DROP TABLE category;

CREATE TABLE category(
    categoryno                        INT(10)    NOT NULL    PRIMARY KEY AUTO_INCREMENT COMMENT '지출내역카테고리번호',
    categorysort                      VARCHAR(50)    NOT NULL COMMENT '분류',
    mno                               INT(10)    NULL  COMMENT '멤버 번호',
  FOREIGN KEY (mno) REFERENCES member (mno)
) COMMENT='지출내역카테고리';

 
2) 등록
INSERT INTO category(categorysort, mno)
VALUES('식비', '1');
INSERT INTO category(categorysort, mno)
VALUES('카페', '1');
INSERT INTO category(categorysort, mno)
VALUES('문화생활', '1');

 
3) 목록
SELECT * FROM category;

SELECT categoryno, categorysort, mno
FROM category
ORDER BY categoryno DESC;

4) 조회
SELECT categoryno, categorysort, mno
FROM category
WHERE categoryno=1;

5) 수정
UPDATE category
SET categorysort=''
WHERE categoryno=1;

6) 삭제
DELETE FROM category
WHERE categoryno=1;



