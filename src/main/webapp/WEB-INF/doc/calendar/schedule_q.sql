/**********************************/
/* Table Name: 스케줄 */
/**********************************/
1) 테이블 구조
DROP TABLE schedule;

CREATE TABLE schedule(
    scheduleno                        INT(10)    NOT NULL    PRIMARY KEY AUTO_INCREMENT COMMENT '스케줄번호',
    title                             VARCHAR(20)    NOT NULL COMMENT '제목',
    contents                          VARCHAR(200)     NOT NULL COMMENT '내용',
    icon                              VARCHAR(50)    NOT NULL COMMENT '아이콘',
    mno                               INT(10)    NULL  COMMENT '멤버 번호',
  FOREIGN KEY (mno) REFERENCES member (mno)
) COMMENT='스케줄';


2) 등록

INSERT INTO schedule(title, contents, icon, mno)
VALUES('생일', 'birthday.jpg', '1');







3) 목록
SELECT * FROM schedule;


SELECT scheduleno, contents, icon, mno
FROM schedule
ORDER BY mno DESC;



4) 조회
SELECT scheduleno, contents, icon, mno
FROM schedule
WHERE mno=1;



5) 수정
UPDATE schedule
SET contents='', icon=''
WHERE mno=1;


6) 삭제
DELETE FROM schedule
WHERE mno=1;





