/**********************************/
/* Table Name: 2차분류카테고리 */
/**********************************/
DROP TABLE shopcategory;

CREATE TABLE shopcategory(
    categoryno                        INT(10)    NOT NULL    PRIMARY KEY AUTO_INCREMENT COMMENT '카테고리번호',
    category                          VARCHAR(10)    NOT NULL COMMENT '카테고리내용',
    codeno                            MEDIUMINT(10)    NULL  COMMENT '코드번호',
  FOREIGN KEY (codeno) REFERENCES shopcode (codeno)
) COMMENT='2차분류카테고리';

등록
INSERT INTO shopcategory(category, codeno)
VALUES ('제목', '내용');

목록
SELECT category, codeno
FROM shopcategory
ORDER BY categoryno DESC;

조회
SELECT category, codeno
FROM shopcategory
WHERE categoryno=1;

수정
UPDATE shopcategory
SET category='', codeno=''
WHERE categoryno=1;

삭제
DELETE FROM shopcategory
WHERE categoryno=1;