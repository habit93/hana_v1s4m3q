/**********************************/
/* Table Name: 물건 등록 */
/**********************************/
DROP TABLE item;
   
CREATE TABLE item(
    itemno                            INT(10)    NOT NULL    PRIMARY KEY AUTO_INCREMENT COMMENT '물건번호',
    title                             VARCHAR(10)    NOT NULL COMMENT '이름',
    contents                          VARCHAR(200)     NOT NULL COMMENT '내용',
    price                             VARCHAR(10)    NOT NULL COMMENT '가격',
    categoryno                        MEDIUMINT(10)    NULL  COMMENT '카테고리번호',
  FOREIGN KEY (categoryno) REFERENCES shopcategory (categoryno)
) COMMENT='물건 등록';

등록
INSERT INTO item(title, content, price, categoryno)
VALUES ('제목', '내용', '가격', '물건번호');

목록
SELECT itemno, title, contents, price, categoryno
FROM item
ORDER BY itemno DESC;

조회
SELECT itemno, title, content, price, categoryno
FROM item
WHERE itemno=1;

수정
UPDATE item
SET title='', content='', price='', categoryno=''
WHERE itemno=1;

삭제
DELETE FROM item
WHERE itemno=1;