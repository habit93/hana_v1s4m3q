/**********************************/
/* Table Name: 멤버 */
/**********************************/
CREATE TABLE member(
		mno                           		INT(10)		 NOT NULL		 PRIMARY KEY AUTO_INCREMENT COMMENT '멤버 번호',
		id                            		VARCHAR(20)		 NOT NULL COMMENT '아이디',
		passwd                        		VARCHAR(20)		 NOT NULL COMMENT '패스워드',
		mname                         		VARCHAR(20)		 NOT NULL COMMENT '이름',
		nickname                      		VARCHAR(20)		 NOT NULL COMMENT '닉네임',
		birthday                      		DATE		 NOT NULL COMMENT '생일',
		gender                        		TINYINT(3)		 NOT NULL COMMENT '성별',
		admin                         		INT(10)		 DEFAULT 0		 NOT NULL COMMENT '관리자',
  CONSTRAINT id UNIQUE (id)
) COMMENT='멤버';

/**********************************/
/* Table Name: 지출내역카테고리 */
/**********************************/
CREATE TABLE category(
		categoryno                    		INT(10)		 NOT NULL		 PRIMARY KEY AUTO_INCREMENT COMMENT '지출내역카테고리번호',
		categorysort                  		VARCHAR(50)		 NOT NULL COMMENT '분류',
		mno                           		INT(10)		 NULL  COMMENT '멤버 번호',
  FOREIGN KEY (mno) REFERENCES member (mno)
) COMMENT='지출내역카테고리';

/**********************************/
/* Table Name: 지출 */
/**********************************/
CREATE TABLE expense(
		expenseno                     		INT(10)		 NOT NULL		 PRIMARY KEY AUTO_INCREMENT COMMENT '지출번호',
		rdate                         		DATE		 NOT NULL COMMENT '날짜',
		categoryno                    		INT(10)		 NULL  COMMENT '지출내역카테고리번호',
		expenseitem                   		VARCHAR(20)		 NOT NULL COMMENT '지출내용',
		expensemoney                  		MEDIUMINT(10)		 NOT NULL COMMENT '지출금액',
		mno                           		INT(10)		 NULL  COMMENT '멤버 번호',
  FOREIGN KEY (categoryno) REFERENCES category (categoryno),
  FOREIGN KEY (mno) REFERENCES member (mno)
) COMMENT='지출';

/**********************************/
/* Table Name: 수입 */
/**********************************/
CREATE TABLE income(
		incomeno                      		INT(10)		 NOT NULL AUTO_INCREMENT COMMENT '수입번호',
		rdate                         		DATE		 NOT NULL COMMENT '날짜',
		incomeitem                    		VARCHAR(20)		 NOT NULL COMMENT '수입내용',
		incomemoney                   		MEDIUMINT(10)		 NOT NULL COMMENT '수입금액',
		mno                           		INT(10)		 NULL  COMMENT '멤버 번호',
  FOREIGN KEY (mno) REFERENCES member (mno)
) COMMENT='수입';

/**********************************/
/* Table Name: 쇼핑1차분류코드 */
/**********************************/
CREATE TABLE shopcode(
		codeno                        		MEDIUMINT(7)		 NOT NULL		 PRIMARY KEY AUTO_INCREMENT COMMENT '코드번호',
		code                          		VARCHAR(50)		 NOT NULL COMMENT '코드내용'
) COMMENT='쇼핑1차분류코드';

/**********************************/
/* Table Name: 2차분류카테고리 */
/**********************************/
CREATE TABLE shopcategory(
		categoryno                    		INT(10)		 NOT NULL		 PRIMARY KEY AUTO_INCREMENT COMMENT '카테고리번호',
		category                      		VARCHAR(10)		 NOT NULL COMMENT '카테고리내용',
		codeno                        		MEDIUMINT(7)		 NULL  COMMENT '코드번호',
  FOREIGN KEY (codeno) REFERENCES shopcode (codeno)
) COMMENT='2차분류카테고리';

/**********************************/
/* Table Name: 상품 */
/**********************************/
CREATE TABLE item(
		itemno                        		INT(10)		 NOT NULL		 PRIMARY KEY AUTO_INCREMENT COMMENT '물건번호',
		title                         		VARCHAR(25)		 NOT NULL COMMENT '이름',
		price                         		VARCHAR(10)		 NOT NULL COMMENT '가격',
		content                       		MEDIUMTEXT		 NOT NULL COMMENT '내용',
		thumb                         		VARCHAR(20)		 NULL  COMMENT '썸파일',
		categoryno                    		INT(10)		 NULL  COMMENT '카테고리번호',
  FOREIGN KEY (categoryno) REFERENCES shopcategory (categoryno)
) COMMENT='상품';

/**********************************/
/* Table Name: 질문답변 */
/**********************************/
CREATE TABLE qa(
		qano                          		INT(10)		 NOT NULL		 PRIMARY KEY AUTO_INCREMENT COMMENT '질문답변번호',
		title                         		VARCHAR(20)		 NOT NULL COMMENT '제목',
		content                       		VARCHAR(200)		 NOT NULL COMMENT '내용',
		passwd                        		VARCHAR(15)		 NOT NULL COMMENT '패스워드',
		rdate                         		DATE		 NOT NULL COMMENT '등록일',
		grpno                         		MEDIUMINT(10)		 DEFAULT 0		 NOT NULL COMMENT '부모글번호',
		indent                        		SMALLINT(10)		 DEFAULT 0		 NOT NULL COMMENT '답변여부',
		ansnum                        		SMALLINT(10)		 DEFAULT 0		 NOT NULL COMMENT '답변순서',
		itemno                        		INT(10)		 NULL  COMMENT '물건번호',
  FOREIGN KEY (itemno) REFERENCES item (itemno)
) COMMENT='질문답변';

/**********************************/
/* Table Name: 리뷰 */
/**********************************/
CREATE TABLE review(
		reviewno                      		INT(10)		 NOT NULL		 PRIMARY KEY AUTO_INCREMENT COMMENT '리뷰번호',
		title                         		VARCHAR(20)		 NOT NULL COMMENT '리뷰제목',
		contents                      		VARCHAR(800)		 NOT NULL COMMENT '리뷰내용',
		rdate                         		DATE		 NOT NULL COMMENT '등록일',
		itemno                        		INT(10)		 NULL  COMMENT '물건번호',
		mno                           		INT(10)		 NULL  COMMENT '멤버 번호',
  FOREIGN KEY (itemno) REFERENCES item (itemno),
  FOREIGN KEY (mno) REFERENCES member (mno)
) COMMENT='리뷰';

/**********************************/
/* Table Name: 스케줄 */
/**********************************/
CREATE TABLE schedule(
		scheduleno                    		INT(10)		 NOT NULL		 PRIMARY KEY AUTO_INCREMENT COMMENT '스케줄번호',
		rdate                         		DATE		 NOT NULL COMMENT '날짜',
		contents                      		VARCHAR(200)		 NOT NULL COMMENT '내용',
		mno                           		INT(10)		 NULL  COMMENT '멤버 번호',
  FOREIGN KEY (mno) REFERENCES member (mno)
) COMMENT='스케줄';

/**********************************/
/* Table Name: 구매 내역 */
/**********************************/
CREATE TABLE buy(
		buyno                         		INT(10)		 NOT NULL		 PRIMARY KEY AUTO_INCREMENT COMMENT '구매 번호',
		name                          		VARCHAR(20)		 NOT NULL COMMENT '물건 이름',
		cnt                           		INT(10)		 NOT NULL COMMENT '갯수',
		price                         		INT		 NOT NULL COMMENT '가격',
		zipcode                       		VARCHAR(10)		 NOT NULL COMMENT '우편번호',
		address1                      		VARCHAR(80)		 NOT NULL COMMENT '집주소1',
		address2                      		VARCHAR(80)		 NOT NULL COMMENT '집주소2',
		date                          		DATETIME		 NOT NULL COMMENT '날짜',
		thumb                         		VARCHAR(20)		 NOT NULL COMMENT '썸파일',
		mno                           		INT(10)		 NULL  COMMENT '멤버 번호',
		itemno                        		INT(10)		 NULL  COMMENT '물건번호',
  FOREIGN KEY (mno) REFERENCES member (mno),
  FOREIGN KEY (itemno) REFERENCES item (itemno)
) COMMENT='구매 내역';

/**********************************/
/* Table Name: 블로그 코드 */
/**********************************/
CREATE TABLE code(
		codeno                        		MEDIUMINT(10)		 NOT NULL		 PRIMARY KEY AUTO_INCREMENT COMMENT '코드번호',
		sort                          		VARCHAR(50)		 NOT NULL COMMENT '분류'
) COMMENT='블로그 코드';

/**********************************/
/* Table Name: 블로그 카테고리 */
/**********************************/
CREATE TABLE blogcategory(
		blogcategoryno                		MEDIUMINT(10)		 NOT NULL		 PRIMARY KEY AUTO_INCREMENT COMMENT '블로그카테고리번호',
		title                         		VARCHAR(50)		 NOT NULL COMMENT '제목',
		orderno                       		SMALLINT(5)		 NOT NULL COMMENT '출력순서',
		visible                       		CHAR(1)		 NOT NULL COMMENT '출력모드',
		ids                           		VARCHAR(100)		 NOT NULL COMMENT '접근계정',
		cnt                           		MEDIUMINT(7)		 NOT NULL COMMENT '등록된글수',
		codeno                        		MEDIUMINT(10)		 NULL  COMMENT '코드번호',
  FOREIGN KEY (codeno) REFERENCES code (codeno)
) COMMENT='블로그 카테고리';

/**********************************/
/* Table Name: 블로그글 */
/**********************************/
CREATE TABLE blog(
		blogno                        		MEDIUMINT(10)		 NOT NULL		 PRIMARY KEY AUTO_INCREMENT COMMENT '블로그번호',
		title                         		VARCHAR(200)		 NOT NULL COMMENT '제목',
		content                       		MEDIUMTEXT		 NOT NULL COMMENT '내용',
		file                          		VARCHAR(20)		 NOT NULL COMMENT '썸파일',
		good                          		MEDIUMINT(7)		 NOT NULL COMMENT '좋아요',
		rdate                         		DATETIME		 NOT NULL COMMENT '작성시간',
		cnt                           		MEDIUMINT(7)		 NOT NULL COMMENT '조회수',
		replycnt                      		SMALLINT(5)		 NOT NULL COMMENT '댓글수',
		blogcategoryno                		MEDIUMINT(10)		 NULL  COMMENT '블로그카테고리번호',
		mno                           		INT(10)		 NULL  COMMENT '멤버 번호',
  FOREIGN KEY (blogcategoryno) REFERENCES blogcategory (blogcategoryno),
  FOREIGN KEY (mno) REFERENCES member (mno)
) COMMENT='블로그글';

/**********************************/
/* Table Name: 블로그 댓글 */
/**********************************/
CREATE TABLE reply(
		replyno                       		MEDIUMINT(10)		 NOT NULL		 PRIMARY KEY AUTO_INCREMENT COMMENT '댓글번호',
		content                       		VARCHAR(80)		 NOT NULL COMMENT '내용',
		blogno                        		MEDIUMINT(10)		 NULL  COMMENT '블로그번호',
  FOREIGN KEY (blogno) REFERENCES blog (blogno)
) COMMENT='블로그 댓글';

/**********************************/
/* Table Name: 쇼핑카트 */
/**********************************/
CREATE TABLE cart(
		cartno                        		INT(10)		 NOT NULL		 PRIMARY KEY AUTO_INCREMENT COMMENT '카트 번호',
		name                          		VARCHAR(20)		 NOT NULL COMMENT '물건이름',
		cnt                           		MEDIUMINT(10)		 NOT NULL COMMENT '갯수',
		price                         		MEDIUMINT(10)		 NOT NULL COMMENT '가격',
		thumb                         		VARCHAR(20)		 NOT NULL COMMENT '썸파일',
		itemno                        		INT(10)		 NULL  COMMENT '물건 번호',
		mno                           		INT(10)		 NULL  COMMENT '멤버 번호',
  FOREIGN KEY (itemno) REFERENCES item (itemno),
  FOREIGN KEY (mno) REFERENCES member (mno)
) COMMENT='쇼핑카트';


CREATE INDEX codeno ON blogcategory (codeno);

CREATE INDEX categoryno ON blog (categoryno);

CREATE INDEX boardno ON reply (boardno);

