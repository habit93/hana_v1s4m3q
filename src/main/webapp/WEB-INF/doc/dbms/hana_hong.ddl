/**********************************/
/* Table Name: 지출내역카테고리 */
/**********************************/
CREATE TABLE category(
		categoryno                    		INT(10)		 NOT NULL		 PRIMARY KEY AUTO_INCREMENT COMMENT '지출내역카테고리번호',
		sort                          		VARCHAR(50)		 NOT NULL COMMENT '분류'
) COMMENT='지출내역카테고리';

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
/* Table Name: 지출 */
/**********************************/
CREATE TABLE expense(
		expenseno                     		INT(10)		 NOT NULL		 PRIMARY KEY AUTO_INCREMENT COMMENT '지출번호',
		sort                          		VARCHAR(10)		 NULL  COMMENT '분류',
		expenseitem                   		VARCHAR(20)		 NOT NULL COMMENT '지출내용',
		file1                         		VARCHAR(10)		 NULL  COMMENT '첨부파일',
		expensemoney                  		MEDIUMINT(10)		 NOT NULL COMMENT '지출금액',
		categoryno                    		INT(10)		 NULL  COMMENT '지출내역카테고리번호',
		calenderno                    		INT(10)		 NULL  COMMENT '달력 번호',
		mno                           		INT(10)		 NULL  COMMENT '멤버 번호',
  FOREIGN KEY (categoryno) REFERENCES category (categoryno),
  FOREIGN KEY (mno) REFERENCES member (mno)
) COMMENT='지출';

/**********************************/
/* Table Name: 수입 */
/**********************************/
CREATE TABLE income(
		incomeno                      		INT(10)		 NOT NULL AUTO_INCREMENT COMMENT '수입번호',
		incomeitem                    		VARCHAR(20)		 NOT NULL COMMENT '수입내용',
		incomemoney                   		MEDIUMINT(10)		 NOT NULL COMMENT '수입금액',
		calenderno                    		INT(10)		 NULL  COMMENT '달력 번호',
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
		title                         		VARCHAR(10)		 NOT NULL COMMENT '이름',
		price                         		VARCHAR(10)		 NOT NULL COMMENT '가격',
		contents                      		VARCHAR(200)		 NOT NULL COMMENT '내용',
		categoryno                    		MEDIUMINT(10)		 NULL  COMMENT '카테고리번호',
  FOREIGN KEY (categoryno) REFERENCES shopcategory (categoryno)
) COMMENT='상품';

/**********************************/
/* Table Name: 질문답변 */
/**********************************/
CREATE TABLE QA(
		qano                          		INT(10)		 NOT NULL		 PRIMARY KEY AUTO_INCREMENT COMMENT '질문답변번호',
		title                         		VARCHAR(20)		 NOT NULL COMMENT '제목',
		content                       		VARCHAR(200)		 NOT NULL COMMENT '내용',
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
		item                          		MEDIUMINT		 NULL  COMMENT '물건번호',
		itemno                        		INT(10)		 NULL  COMMENT '물건번호',
  FOREIGN KEY (itemno) REFERENCES item (itemno)
) COMMENT='리뷰';

/**********************************/
/* Table Name: 스케줄 */
/**********************************/
CREATE TABLE schedule(
		scheduleno                    		INT(10)		 NOT NULL		 PRIMARY KEY AUTO_INCREMENT COMMENT '스케줄번호',
		contents                      		VARCHAR(200)		 NOT NULL COMMENT '내용',
		icon                          		VARCHAR(50)		 NOT NULL COMMENT '아이콘',
		calenderno                    		INT(10)		 NULL  COMMENT '달력 번호',
		mno                           		INT(10)		 NULL  COMMENT '멤버 번호',
  FOREIGN KEY (mno) REFERENCES member (mno)
) COMMENT='스케줄';

/**********************************/
/* Table Name: 구매 내역 */
/**********************************/
CREATE TABLE buy(
		buyno                         		INT(10)		 NOT NULL		 PRIMARY KEY AUTO_INCREMENT COMMENT '구매 번호',
		name                          		VARCHAR(20)		 NOT NULL COMMENT '물건 이름',
		content                       		VARCHAR(200)		 NOT NULL COMMENT '구매 내용',
		mno                           		INT(10)		 NULL  COMMENT '멤버 번호',
		itemno                        		INT(10)		 NULL  COMMENT '물건번호',
  FOREIGN KEY (mno) REFERENCES member (mno),
  FOREIGN KEY (itemno) REFERENCES item (itemno)
) COMMENT='구매 내역';

/**********************************/
/* Table Name: 게시판 코드 */
/**********************************/
CREATE TABLE code(
		codeno                        		MEDIUMINT(7)		 NOT NULL		 PRIMARY KEY AUTO_INCREMENT COMMENT 'codeno',
		sort                          		VARCHAR(50)		 NOT NULL COMMENT 'sort'
) COMMENT='게시판 코드';

/**********************************/
/* Table Name: 게시판 카테고리 */
/**********************************/
CREATE TABLE blogcategory(
		blogcategoryno                		MEDIUMINT(7)		 NOT NULL		 PRIMARY KEY AUTO_INCREMENT COMMENT 'blogcategoryno',
		title                         		VARCHAR(50)		 NOT NULL COMMENT 'title',
		orderno                       		SMALLINT(5)		 NOT NULL COMMENT 'orderno',
		visible                       		CHAR(1)		 NOT NULL COMMENT 'visible',
		ids                           		VARCHAR(100)		 NOT NULL COMMENT 'ids',
		cnt                           		MEDIUMINT(7)		 NOT NULL COMMENT 'cnt',
		codeno                        		MEDIUMINT(7)		 NULL  COMMENT 'codeno',
  FOREIGN KEY (codeno) REFERENCES code (codeno)
) COMMENT='게시판 카테고리';

/**********************************/
/* Table Name: 게시판글 */
/**********************************/
CREATE TABLE board(
		boardno                       		MEDIUMINT(7)		 NOT NULL		 PRIMARY KEY AUTO_INCREMENT COMMENT 'boardno',
		title                         		VARCHAR(200)		 NOT NULL COMMENT 'title',
		content                       		MEDIUMTEXT		 NOT NULL COMMENT 'content',
		good                          		MEDIUMINT(7)		 NOT NULL COMMENT 'good',
		rdate                         		DATETIME		 NOT NULL COMMENT 'rdate',
		cnt                           		MEDIUMINT(7)		 NOT NULL COMMENT 'cnt',
		replycnt                      		SMALLINT(5)		 NOT NULL COMMENT 'replycnt',
		blogcategoryno                		MEDIUMINT(7)		 NULL  COMMENT 'blogcategoryno',
		mno                           		INT(10)		 NULL  COMMENT '멤버 번호',
  FOREIGN KEY (blogcategoryno) REFERENCES blogcategory (blogcategoryno),
  FOREIGN KEY (mno) REFERENCES member (mno)
) COMMENT='게시판글';

/**********************************/
/* Table Name: 댓글 */
/**********************************/
CREATE TABLE reply(
		replyno                       		MEDIUMINT(7)		 NOT NULL		 PRIMARY KEY AUTO_INCREMENT COMMENT 'replyno',
		content                       		MEDIUMTEXT		 NOT NULL COMMENT 'content',
		boardno                       		MEDIUMINT(7)		 NULL  COMMENT 'boardno',
  FOREIGN KEY (boardno) REFERENCES board (boardno)
) COMMENT='댓글';

/**********************************/
/* Table Name: 설문조사 */
/**********************************/
CREATE TABLE survey(
		surveyno                      		MEDIUMINT(7)		 NULL  COMMENT 'surveyno',
		title                         		VARCHAR(200)		 NOT NULL COMMENT 'title',
		content                       		MEDIUMTEXT		 NOT NULL COMMENT 'content',
		cnt                           		MEDIUMINT(7)		 NOT NULL COMMENT 'cnt',
		mno                           		INT(10)		 NULL  COMMENT '멤버 번호',
  FOREIGN KEY (mno) REFERENCES member (mno)
) COMMENT='설문조사';

/**********************************/
/* Table Name: 쇼핑카트 */
/**********************************/
CREATE TABLE cart(
		cartno                        		INT(10)		 NOT NULL		 PRIMARY KEY AUTO_INCREMENT COMMENT '카트 번호',
		itemno                        		INT(10)		 NULL  COMMENT '물건 번호',
		mno                           		INT(10)		 NULL  COMMENT '멤버 번호',
  FOREIGN KEY (itemno) REFERENCES item (itemno),
  FOREIGN KEY (mno) REFERENCES member (mno)
) COMMENT='쇼핑카트';


CREATE INDEX codeno ON blogcategory (codeno);

CREATE INDEX categoryno ON board (categoryno);

CREATE INDEX boardno ON reply (boardno);

