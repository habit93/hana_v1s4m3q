/**********************************/
/* Table Name: 쇼핑1차분류코드 */
/**********************************/
DROP TABLE shopcode;

CREATE TABLE shopcode(
    codeno                            MEDIUMINT(7)     NOT NULL    PRIMARY KEY AUTO_INCREMENT COMMENT '코드번호',
    code                              VARCHAR(50)    NOT NULL COMMENT '코드내용'
) COMMENT='쇼핑1차분류코드';

등록
INSERT INTO shopcode(code)
VALUES ('의류');
INSERT INTO shopcode(code)
VALUES ('기념일');

목록
SELECT codeno, code
FROM shopcode
ORDER BY codeno DESC;

조회
SELECT codeno, code
FROM shopcode
WHERE codeno=1;

수정
UPDATE shopcode
SET code=''
WHERE codeno=1;

삭제
DELETE FROM shopcode
WHERE codeno=1;