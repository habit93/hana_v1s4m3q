/**********************************/
/* Table Name: 리뷰 */
/**********************************/
DROP TABLE review;

CREATE TABLE review(
    reviewno                          INT(10)    NOT NULL    PRIMARY KEY AUTO_INCREMENT COMMENT '리뷰번호',
    title                             VARCHAR(20)    NOT NULL COMMENT '리뷰제목',
    contents                          VARCHAR(800)     NOT NULL COMMENT '리뷰내용',
    rdate                             DATE     NOT NULL COMMENT '등록일',
    itemno                            INT(10)    NULL  COMMENT '물건번호',
    mno                               INT(10)    NULL  COMMENT '멤버 번호',
  FOREIGN KEY (itemno) REFERENCES item (itemno),
  FOREIGN KEY (mno) REFERENCES member (mno)
) COMMENT='리뷰';

등록
INSERT INTO review(title, contents, rdate, itemno, mno)
VALUES ('완전 만족', '빠른 배송', now(), 1, 1);

목록
SELECT reviewno, title, contents, rdate, itemno, mno
FROM review
ORDER BY reviewno DESC;

조회
SELECT reviewno, title, contents, rdate, itemno, mno
FROM review
WHERE reviewno=1;

수정
UPDATE review
SET title='', content=''
WHERE reviewno=1;

삭제
DELETE FROM review
WHERE reviewno=1;