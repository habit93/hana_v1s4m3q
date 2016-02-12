/**********************************/
/* Table Name: 쇼핑카트 */
/**********************************/
DROP TABLE cart;

CREATE TABLE cart(
    cartno                            INT(10)    NOT NULL    PRIMARY KEY AUTO_INCREMENT COMMENT '카트 번호',
    name                              VARCHAR(50)    NOT NULL COMMENT '물건 이름',
    cnt                               MEDIUMINT(10)    NOT NULL COMMENT '갯수',
    price                             MEDIUMINT    NOT NULL COMMENT '가격',
    thumb                             VARCHAR(20)    NOT NULL COMMENT '썸네일',
    itemno                            INT(10)    NULL  COMMENT '물건 번호',
    mno                               INT(10)    NULL  COMMENT '멤버 번호',
  FOREIGN KEY (itemno) REFERENCES item (itemno),
  FOREIGN KEY (mno) REFERENCES member (mno)
) COMMENT='쇼핑카트';

등록
INSERT INTO cart(itemno, mno)
VALUES ('제목', '내용', '물건번호');

목록
SELECT *
FROM cart;

조회
SELECT cartno, itemno, mno
FROM cart
WHERE cartno=1;

수정
UPDATE cart
SET itemno='', mno=''
WHERE cartno=1;
 
삭제
DELETE FROM cart
WHERE cartno=1;