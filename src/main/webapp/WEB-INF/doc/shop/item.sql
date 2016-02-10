/**********************************/
/* Table Name: 물건 등록 */
/**********************************/
DROP TABLE item;
   
CREATE TABLE item(
    itemno                            INT(10)    NOT NULL    PRIMARY KEY AUTO_INCREMENT COMMENT '물건번호',
    title                             VARCHAR(10)    NOT NULL COMMENT '이름',
    price                             INT(10)    NOT NULL COMMENT '가격',
    content                           VARCHAR(200)     NOT NULL COMMENT '내용',
    thumb                             VARCHAR(20)    NOT NULL COMMENT '썸네일',
    categoryno                        INT(10)    NULL  COMMENT '카테고리번호',
  FOREIGN KEY (categoryno) REFERENCES shopcategory (categoryno)
) COMMENT='상품';

등록
INSERT INTO item(title, price, content, thumb, categoryno)
VALUES ('GAP 후드티', '25000', '테스트1', 'thubm.jpg', 1);

목록
SELECT itemno, title, content, price, categoryno
FROM item
ORDER BY itemno ASC;

조회
SELECT itemno, title, content, thumb, price, categoryno
FROM item
WHERE itemno=1;

수정
UPDATE item
SET title='', content='', price='', thumb='', categoryno=''
WHERE itemno=1;

삭제
DELETE FROM item
WHERE itemno=1;