/**********************************/
/* Table Name: 스케줄 */
/**********************************/
1) 테이블 구조
DROP TABLE schedule;

CREATE TABLE schedule(
    scheduleno                        INT(10)    NOT NULL    PRIMARY KEY AUTO_INCREMENT COMMENT '스케줄번호',
    rdate                             DATE     NOT NULL COMMENT '날짜',
    contents                          VARCHAR(200)     NOT NULL COMMENT '내용',
    mno                               INT(10)    NULL  COMMENT '멤버 번호',
  FOREIGN KEY (mno) REFERENCES member (mno)
) COMMENT='스케줄';


2) 등록
INSERT INTO schedule(rdate, contents, mno)
VALUES('20160111', '100일', '1');

3) 목록
SELECT * FROM schedule;

SELECT scheduleno, rdate, contents, mno
FROM schedule
ORDER BY rdate DESC;

4) 조회
SELECT scheduleno, rdate, contents, mno
FROM schedule
WHERE scheduleno=1;

5) 수정
UPDATE schedule
SET rdate='132123', contents='123123'
WHERE scheduleno=1;

6) 삭제
DELETE FROM schedule
WHERE scheduleno=1;





