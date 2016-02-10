/**********************************/
/* Table Name: 지출 */
/**********************************/
1) 테이블 구조
DROP TABLE expense;


CREATE TABLE expense(
    expenseno                         INT(10)    NOT NULL    PRIMARY KEY AUTO_INCREMENT COMMENT '지출번호',
    rdate                             DATE     NOT NULL COMMENT '날짜',
    categoryno                        INT(10)    NULL  COMMENT '지출내역카테고리번호',
    expenseitem                       VARCHAR(20)    NOT NULL COMMENT '지출내용',
    expensemoney                      MEDIUMINT(10)    NOT NULL COMMENT '지출금액',
    mno                               INT(10)    NULL  COMMENT '멤버 번호',
  FOREIGN KEY (categoryno) REFERENCES category (categoryno),
  FOREIGN KEY (mno) REFERENCES member (mno)
) COMMENT='지출';

2) 등록
INSERT INTO expense(rdate, categoryno, expenseitem, expensemoney, mno)
VALUES('20160222', '1', '벌집삽겹살 2인분', 22000, '1');







3) 목록
SELECT * FROM expense;

SELECT expenseno, rdate, categoryno, expenseitem, expensemoney, mno
FROM expense
ORDER BY expenseno DESC;



4) 조회
SELECT expenseno, rdate, categoryno, expenseitem, expensemoney, mno
FROM expense
WHERE expenseno=1;

5) 수정
UPDATE expense
SET rdate='', categoryno='', expenseitem='', expensemoney='', mno=''
WHERE expenseno=1;

6) 삭제
DELETE FROM expense
WHERE expenseno=1;


7.JOIN - Foreign 테이블에서 작업 WHERE PK = FK         
SELECT c.categoryno, c.categorysort, p.expenseno, p.rdate, p.categoryno, p.expenseitem, p.expensemoney, p.mno
FROM category c, expense p
WHERE c.categoryno = p.categoryno
ORDER BY rdate DESC

8. 월 정산
SELECT expenseno, SUBSTRING(rdate, 1, 7) as rdate, categoryno, expenseitem, expensemoney, mno
FROM expense 
WHERE SUBSTRING(rdate, 1, 7) = '2016-02'
ORDER BY rdate DESC



