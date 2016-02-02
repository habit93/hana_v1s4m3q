/**********************************/
/* Table Name: 지출 */
/**********************************/
1) 테이블 구조
DROP TABLE expense;


CREATE TABLE expense(
    expenseno                         INT(10)    NOT NULL    PRIMARY KEY AUTO_INCREMENT COMMENT '지출번호',
    sort                              VARCHAR(10)    NULL  COMMENT '분류',
    expenseitem                       VARCHAR(20)    NOT NULL COMMENT '지출내용',
    file1                             VARCHAR(10)    NULL  COMMENT '첨부파일',
    expensemoney                      MEDIUMINT(10)    NOT NULL COMMENT '지출금액',
    categoryno                        INT(10)    NULL  COMMENT '지출내역카테고리번호',
    mno                               INT(10)    NULL  COMMENT '멤버 번호',
  FOREIGN KEY (categoryno) REFERENCES category (categoryno),
  FOREIGN KEY (mno) REFERENCES member (mno)
) COMMENT='지출';


2) 등록
INSERT INTO expense(sort, expenseitem, file1, expensemoney, categoryno, mno)
VALUES('식비', '벌집삽겹살 2인분', 'check.jpg', 22000, '1', '1');







3) 목록
SELECT * FROM expense;

SELECT expenseno, sort, expenseitem, file1, expensemoney, categoryno, mno
FROM expense
ORDER BY expenseno DESC;



4) 조회
SELECT expenseno, sort, expenseitem, file1, expensemoney, categoryno, mno
FROM expense
WHERE expenseno=1;




5) 수정
UPDATE expense
SET sort='', expenseitem='', file1='', expensemoney='', categoryno='', mno=''
WHERE expenseno=1;


6) 삭제
DELETE FROM expense
WHERE expenseno=1;





