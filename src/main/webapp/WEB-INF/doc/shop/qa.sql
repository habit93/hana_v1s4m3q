/**********************************/
/* Table Name: 질문답변 */
/**********************************/
DROP TABLE qa;

CREATE TABLE qa(
    qano                              INT(10)    NOT NULL    PRIMARY KEY AUTO_INCREMENT COMMENT '질문답변번호',
    title                             VARCHAR(20)    NOT NULL COMMENT '제목',
    content                           VARCHAR(200)     NOT NULL COMMENT '내용',
    passwd                            VARCHAR(15)    NOT NULL COMMENT '패스워드',
    rdate                             DATE     NOT NULL COMMENT '등록일',
    step                              MEDIUMINT(10)    DEFAULT 0     NOT NULL COMMENT '스텝',
    depth                             MEDIUMINT(10)    DEFAULT 0     NOT NULL COMMENT '깊이',
    ref                               VARCHAR(10)    NOT NULL COMMENT '레프',
    itemno                            INT(10)    NULL  COMMENT '물건번호',
  FOREIGN KEY (itemno) REFERENCES item (itemno)
) COMMENT='질문답변';


등록
INSERT INTO qa(title, content, passwd, rdate, grpno, indent, ansnum, itemno)
VALUES ('제목', '내용', now(), 0, 0, 0, 1);

목록
SELECT qano, title, content, passwd, rdate, grpno, indent, ansnum, itemno
FROM qa
ORDER BY qano DESC;

조회
SELECT qano, title, content, passwd, rdate, grpno, indent, ansnum, itemno
FROM qa
WHERE qano=1;

수정
UPDATE qa
SET title='', content=''
WHERE qano=1;

삭제
DELETE FROM qa
WHERE qano=1;


   SELECT MAX(grpno) FROM qa;
   
   INSERT INTO qa(title, content, rdate, grpno, indent, ansnum, itemno)
   VALUES('제목테스트', '내용테스트', now(), (SELECT IFNULL(MAX(grpno), 0)+1 FROM qa as grpno), 1, 1, 1);
   
