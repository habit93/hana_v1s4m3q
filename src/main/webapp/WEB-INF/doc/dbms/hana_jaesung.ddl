/**********************************/
/* Table Name: ���⳻��ī�װ� */
/**********************************/
CREATE TABLE category(
		categoryno                    		INT(10)		 NOT NULL		 PRIMARY KEY AUTO_INCREMENT COMMENT '���⳻��ī�װ���ȣ',
		sort                          		VARCHAR(50)		 NOT NULL COMMENT '�з�'
) COMMENT='���⳻��ī�װ�';

/**********************************/
/* Table Name: ���� */
/**********************************/
CREATE TABLE expense(
		expenseno                     		INT(10)		 NOT NULL		 PRIMARY KEY AUTO_INCREMENT COMMENT '�����ȣ',
		sort                          		VARCHAR(10)		 NULL  COMMENT '�з�',
		expenseitem                   		VARCHAR(20)		 NOT NULL COMMENT '���⳻��',
		file1                         		VARCHAR(10)		 NULL  COMMENT '÷������',
		expensemoney                  		MEDIUMINT(10)		 NOT NULL COMMENT '����ݾ�',
		categoryno                    		INT(10)		 NULL  COMMENT '���⳻��ī�װ���ȣ',
		mno                           		INT(10)		 NULL  COMMENT '��� ��ȣ',
  FOREIGN KEY (categoryno) REFERENCES category (categoryno),
  FOREIGN KEY (mno) REFERENCES member (mno)
) COMMENT='����';

/**********************************/
/* Table Name: ���� */
/**********************************/
CREATE TABLE income(
		incomeno                      		INT(10)		 NOT NULL AUTO_INCREMENT COMMENT '���Թ�ȣ',
		incomeitem                    		VARCHAR(20)		 NOT NULL COMMENT '���Գ���',
		incomemoney                   		MEDIUMINT(10)		 NOT NULL COMMENT '���Աݾ�',
		mno                           		INT(10)		 NULL  COMMENT '��� ��ȣ',
  FOREIGN KEY (mno) REFERENCES member (mno)
) COMMENT='����';

/**********************************/
/* Table Name: ������ */
/**********************************/
CREATE TABLE schedule(
		scheduleno                    		INT(10)		 NOT NULL		 PRIMARY KEY AUTO_INCREMENT COMMENT '�����ٹ�ȣ',
		title                         		VARCHAR(20)		 NOT NULL COMMENT '����',
		contents                      		VARCHAR(200)		 NOT NULL COMMENT '����',
		icon                          		VARCHAR(50)		 NOT NULL COMMENT '������',
		mno                           		INT(10)		 NULL  COMMENT '��� ��ȣ',
  FOREIGN KEY (mno) REFERENCES member (mno)
) COMMENT='������';


CREATE INDEX codeno ON blogcategory (codeno);

CREATE INDEX categoryno ON board (categoryno);

CREATE INDEX boardno ON reply (boardno);

