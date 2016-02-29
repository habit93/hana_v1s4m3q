/**********************************/
/* Table Name: 일정 */
/**********************************/
DROP TABLE calendar;

CREATE TABLE calendar(
    calendarno                        INT(10)    NOT NULL    PRIMARY KEY AUTO_INCREMENT COMMENT '스케줄번호',
    rdate                             DATE     NOT NULL COMMENT '날짜',
    label       VARCHAR(20)  NOT NULL, -- 달력에 출력될 레이블
    title       VARCHAR(100) NOT NULL, -- 제목(*) 
    contents                          VARCHAR(200)     NOT NULL COMMENT '내용',
    mno                               INT(10)    NULL  COMMENT '멤버 번호',
  FOREIGN KEY (mno) REFERENCES member (mno)
) COMMENT='스케줄';


INSERT INTO calendar(rdate, label, title, contents, mno)
VALUES('2015-02-16', '개강', '개강 안내입니다.', '개강 내용입니다.',  '1');

-- 전체 목록
SELECT calendarno, rdate, label, title, contents, mno
FROM calendar
ORDER BY calendarno DESC;

-- 특정 날짜의 목록
SELECT calendarno, rdate, label
FROM calendar
WHERE rdate = '2015-02-16';

SELECT calendarno, rdate, label
FROM calendar
WHERE substring(rdate, 1, 7) = '2015-02'; -- 2월달

-- 조회
SELECT calendarno, rdate, label, title, contents, mno
FROM calendar
WHERE calendarno = 1;

-- 변경
UPDATE calendar
SET rdate='', label='', title='', contents=''
WHERE calendarno = 1;

-- 삭제
DELETE FROM calendar
WHERE calendarno = 1;
