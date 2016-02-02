/**********************************/
/* Table Name: 질문답변 */
/**********************************/
DROP TABLE qa;

CREATE TABLE qa(
    qano                              INT(10)    NOT NULL    PRIMARY KEY AUTO_INCREMENT COMMENT '질문답변번호',
    title                             VARCHAR(20)    NOT NULL COMMENT '제목',
    content                           VARCHAR(200)     NOT NULL COMMENT '내용',
    itemno                            INT(10)    NULL  COMMENT '물건번호',
  FOREIGN KEY (itemno) REFERENCES item (itemno)
) COMMENT='질문답변';

등록
INSERT INTO qa(title, content, itemno)
VALUES ('제목', '내용', '물건번호');

목록
SELECT qano, title, contents, itemno
FROM qa
ORDER BY qano DESC;

조회
SELECT qano, title, content, itemno
FROM qa
WHERE qano=1;

수정
UPDATE qa
SET title='', content='', itemno=''
WHERE qano=1;

삭제
DELETE FROM qa
WHERE qano=1;