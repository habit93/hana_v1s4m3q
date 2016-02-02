/**********************************/
/* Table Name: 구매 내역 */
/**********************************/
DROP TABLE buy;

CREATE TABLE buy(
    buyno                             INT(10)    NOT NULL    PRIMARY KEY AUTO_INCREMENT COMMENT '구매 번호',
    name                              VARCHAR(20)    NOT NULL COMMENT '물건 이름',
    content                           VARCHAR(200)     NOT NULL COMMENT '구매 내용',
    mno                               INT(10)    NULL  COMMENT '멤버 번호',
    itemno                            INT(10)    NULL  COMMENT '물건번호',
  FOREIGN KEY (mno) REFERENCES member (mno),
  FOREIGN KEY (itemno) REFERENCES item (itemno)
) COMMENT='구매 내역';

등록
INSERT INTO buy(name, content, mno, itemno)
VALUES ('제목', '내용', '물건번호');

목록
SELECT buyno, name, content, mno, itemno
FROM buy
ORDER BY buyno DESC;

조회
SELECT buyno, name, content, mno, itemno
FROM buy
WHERE buyno=1;

수정
UPDATE buy
SET name='', content='', mno='', itemno=''
WHERE buyno=1;

삭제
DELETE FROM buy
WHERE buyno=1;