/**********************************/
/* Table Name: 리뷰 */
/**********************************/
DROP TABLE review;

CREATE TABLE review(
    reviewno                          INT(10)    NOT NULL    PRIMARY KEY AUTO_INCREMENT COMMENT '리뷰번호',
    title                             VARCHAR(20)    NOT NULL COMMENT '리뷰 제목',
    contents                          VARCHAR(800)     NOT NULL COMMENT '리뷰내용',
    itemno                              MEDIUMINT    NULL  COMMENT '물건번호',
  FOREIGN KEY (item) REFERENCES item (item)
) COMMENT='리뷰';

등록
INSERT INTO review(title, contents, itemno)
VALUES ('제목', '내용', '물건번호');

목록
SELECT reviewno, title, contents, itemno
FROM review
ORDER BY reviewno DESC;

조회
SELECT reviewno, title, content, itemno
FROM review
WHERE reviewno=1;

수정
UPDATE review
SET title='', content='', itemno=''
WHERE reviewno=1;

삭제
DELETE FROM review
WHERE reviewno=1;