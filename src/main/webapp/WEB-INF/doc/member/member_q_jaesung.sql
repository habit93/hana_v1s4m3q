1. 테이블 구조
DROP TABLE member;

CREATE TABLE member(
    mno                               INT(10)    NOT NULL    PRIMARY KEY AUTO_INCREMENT COMMENT '멤버 번호',
    id                                VARCHAR(20)    NOT NULL COMMENT '아이디',
    passwd                            VARCHAR(20)    NOT NULL COMMENT '패스워드',
    mname                             VARCHAR(20)    NOT NULL COMMENT '이름',
    nickname                          VARCHAR(20)    NOT NULL COMMENT '닉네임',
    birthday                          DATE     NOT NULL COMMENT '생일',
    gender                            TINYINT(3)     NOT NULL COMMENT '성별',
    admin                             VARCHAR(10)    DEFAULT 'N'     NOT NULL COMMENT '관리자',
  CONSTRAINT id UNIQUE (id)
) COMMENT='멤버';


2. 등록

1) id 중복 확인
SELECT COUNT(id) as cnt
FROM member
WHERE id='user1';

 cnt
 ---
   0   ← 중복 되지 않음.
   
2) 등록
INSERT INTO member(id, passwd, mname, nickname, birthday, gender, admin)
VALUES ('user1', '1234', '왕눈이', '닉네임', '2016-02-02', 0, 0);


3. 목록
- 검색을 하지 않는 경우, 전체 목록 출력
SELECT *
FROM member
ORDER BY mno ASC;

3. 조회

1) user1 사원 정보 보기
SELECT mno, id, passwd, mname, tel, zipcode, address1, address2, mdate
FROM member
WHERE mno = 1;

   
4. 수정
1) 내용 수정
UPDATE member 
SET mname='아로미', tel='111-1111-1111', zipcode='00000',
      address1='경기도', address2='파주시'
WHERE mno=1;


2) 패스워드 검사
SELECT COUNT(mno) as cnt
FROM member
WHERE mno=1 AND passwd='1234';

3) 패스워드 수정
UPDATE member
SET passwd='0000'
WHERE mno=1;


5. 삭제
1) 모두 삭제
DELETE FROM member;

2) 특정 회원 삭제
DELETE FROM member
WHERE mno=1;


6. 로그인
SELECT COUNT(mno) as cnt
FROM member
WHERE id='user1' AND passwd='1234';
 cnt
 ---
   0


* 프로젝트 설계시 추가 컬럼 안내: 이메일, 별명, 회원 사진, 직업, 등급


