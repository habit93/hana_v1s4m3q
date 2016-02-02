/**********************************/
/* Table Name: 수입 */
/**********************************/
1) 테이블 구조
DROP TABLE income;


CREATE TABLE income(
    incomeno                          INT(10)    NOT NULL AUTO_INCREMENT COMMENT '수입번호',
    incomeitem                        VARCHAR(20)    NOT NULL COMMENT '수입내용',
    incomemoney                       MEDIUMINT(10)    NOT NULL COMMENT '수입금액',
    mno                               INT(10)    NULL  COMMENT '멤버 번호',
  FOREIGN KEY (mno) REFERENCES member (mno)
) COMMENT='수입';


2) 등록
INSERT INTO income(incomeitem, incomemoney, mno)
VALUES('사랑의 쏠라씨', '12000', '1');




SELECT * FROM income;


3) 목록
SELECT * FROM income;

SELECT incomeno, incomeitem, incomemoney, mno
FROM income
ORDER BY mno DESC;




4) 조회
SELECT incomeno, incomeitem, incomemoney, mno
FROM income
WHERE mno=1;



5) 수정
UPDATE income
SET incomeitem='', incomemoney=''
WHERE mno=1;


6) 삭제
DELETE FROM income
WHERE mno=1;





