/**********************************/
/* Table Name: 2차분류카테고리 */
/**********************************/
DROP TABLE shopcategory;

CREATE TABLE shopcategory(
    categoryno                        INT(10)    NOT NULL    PRIMARY KEY AUTO_INCREMENT COMMENT '카테고리번호',
    category                          VARCHAR(10)    NOT NULL COMMENT '카테고리내용',
    sort                              INT(10)    DEFAULT 1     NOT NULL COMMENT '출력순서',
    codeno                            MEDIUMINT(7)     NULL  COMMENT '코드번호',
  FOREIGN KEY (codeno) REFERENCES shopcode (codeno)
) COMMENT='2차분류카테고리';

등록
INSERT INTO shopcategory(category, sort, codeno)
VALUES ('테스트', 1, 2);

목록
SELECT categoryno, category, sort, codeno
FROM shopcategory
ORDER BY categoryno DESC;

SELECT c.codeno, c.code, t.categoryno, t.category, t.sort, t.codeno
FROM shopcode c, shopcategory t
WHERE c.codeno = t.codeno

조회
SELECT category, sort, codeno
FROM shopcategory
WHERE categoryno=1;

수정
UPDATE shopcategory
SET category='', sort, codeno=''
WHERE categoryno=1;

삭제
DELETE FROM shopcategory
WHERE categoryno=1;
