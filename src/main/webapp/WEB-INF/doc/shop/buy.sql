/**********************************/
/* Table Name: 구매 */
/**********************************/
DROP TABLE buy;

CREATE TABLE buy(
    buyno                             INT(10)    NOT NULL    PRIMARY KEY AUTO_INCREMENT COMMENT '구매 번호',
    name                              VARCHAR(20)    NOT NULL COMMENT '물건 이름',
    cnt                               INT(10)    NOT NULL COMMENT '갯수',
    price                             MEDIUMINT    NOT NULL COMMENT '가격',
    zipcode                           VARCHAR(10)    NOT NULL COMMENT '우편 번호',
    address1                          VARCHAR(80)    NOT NULL COMMENT '집주소1',
    address2                          VARCHAR(80)    NOT NULL COMMENT '집주소2',
    date                              DATETIME     NOT NULL COMMENT '날짜',
    thumb                             VARCHAR(20)    NOT NULL COMMENT '썸네일',
    mno                               INT(10)    NULL  COMMENT '멤버 번호',
    itemno                            INT(10)    NULL  COMMENT '물건번호',
  FOREIGN KEY (mno) REFERENCES member (mno),
  FOREIGN KEY (itemno) REFERENCES item (itemno)
) COMMENT='구매';

등록
INSERT INTO buy(name, content, mno, itemno)
VALUES ('제목', '내용', '물건번호');

목록
SELECT buyno, name, cnt, price, zipcode, address1, address2, date, mno, itemno
FROM buy
ORDER BY buyno DESC;

구매 내역 조회
SELECT buyno, name, cnt, price, zipcode, address1, address2, date, mno, itemno
FROM buy
WHERE mno=3;

수정
UPDATE buy
SET name='', content='', mno='', itemno=''
WHERE buyno=1;

삭제
DELETE FROM buy
WHERE buyno=4;