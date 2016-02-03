/**********************************/
/* Table Name: 수입 */
/**********************************/
1) 테이블 구조
DROP TABLE income;


CREATE TABLE income(
    incomeno                          INT(10)    NOT NULL    PRIMARY KEY AUTO_INCREMENT COMMENT '수입번호',
    rdate                             DATE     NOT NULL COMMENT '날짜',
    incomeitem                        VARCHAR(20)    NOT NULL COMMENT '수입내용',
    incomemoney                       MEDIUMINT(10)    NOT NULL COMMENT '수입금액',
    mno                               INT(10)    NULL  COMMENT '멤버 번호',
  FOREIGN KEY (mno) REFERENCES member (mno)
) COMMENT='수입';


2) 등록
INSERT INTO income(rdate, incomeitem, incomemoney, mno)
VALUES('20100510', '쏠라씨', '12000', '1');


3) 목록
SELECT * FROM income;

SELECT incomeno, rdate, incomeitem, incomemoney, mno
FROM income
ORDER BY incomeno DESC;




4) 조회
SELECT incomeno, incomeitem, incomemoney, mno
FROM income
WHERE incomeno=1;



5) 수정
UPDATE income
SET incomeitem='132123', incomemoney='123123'
WHERE incomeno=1;


6) 삭제
DELETE FROM income
WHERE incomeno=1;





