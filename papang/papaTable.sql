
/* Drop Triggers */

DROP TRIGGER TRI_ACT_COM_ac_no;
DROP TRIGGER TRI_ALARM_arm_no;
DROP TRIGGER TRI_BANNER_ban_no;
DROP TRIGGER TRI_CHILD_chi_no;
DROP TRIGGER TRI_COMMUNITY_COM_cc_no;
DROP TRIGGER TRI_COMMUNITY_com_no;
DROP TRIGGER TRI_COOK_cook_no;
DROP TRIGGER TRI_LULLABY_lul_no;
DROP TRIGGER TRI_NQ_nq_no;
DROP TRIGGER TRI_PLAY_play_no;
DROP TRIGGER TRI_PRODUCT_pro_no;
DROP TRIGGER TRI_QUESTION_q_no;
DROP TRIGGER TRI_REPORT_INFO_rinfo_no;
DROP TRIGGER TRI_REPORT_repo_no;
DROP TRIGGER TRI_SITTER_COM_sc_no;
DROP TRIGGER TRI_SITTER_COM_sit_no;
DROP TRIGGER TRI_SITTER_REV_srv_no;
DROP TRIGGER TRI_USED_used_no;
DROP TRIGGER TRI_WAREHOUSING_ware_no;



/* Drop Tables */

DROP TABLE ACT_COM CASCADE CONSTRAINTS;
DROP TABLE BANNER CASCADE CONSTRAINTS;
DROP TABLE NQ CASCADE CONSTRAINTS;
DROP TABLE admin CASCADE CONSTRAINTS;
DROP TABLE ALARM CASCADE CONSTRAINTS;
DROP TABLE BAG CASCADE CONSTRAINTS;
DROP TABLE PREVENTION CASCADE CONSTRAINTS;
DROP TABLE SITTER_REV CASCADE CONSTRAINTS;
DROP TABLE CHILD CASCADE CONSTRAINTS;
DROP TABLE COMMUNITY_COM CASCADE CONSTRAINTS;
DROP TABLE COMMUNITY CASCADE CONSTRAINTS;
DROP TABLE COOK CASCADE CONSTRAINTS;
DROP TABLE LULLABY_MARK CASCADE CONSTRAINTS;
DROP TABLE LULLABY CASCADE CONSTRAINTS;
DROP TABLE PLAY CASCADE CONSTRAINTS;
DROP TABLE QUESTION CASCADE CONSTRAINTS;
DROP TABLE REPORT_INFO CASCADE CONSTRAINTS;
DROP TABLE REPORT CASCADE CONSTRAINTS;
DROP TABLE SITTER_COM CASCADE CONSTRAINTS;
DROP TABLE SITTER CASCADE CONSTRAINTS;
DROP TABLE TRAN_INFO CASCADE CONSTRAINTS;
DROP TABLE USED_COM CASCADE CONSTRAINTS;
DROP TABLE USED CASCADE CONSTRAINTS;
DROP TABLE MEMBER CASCADE CONSTRAINTS;
DROP TABLE WAREHOUSING CASCADE CONSTRAINTS;
DROP TABLE PRODUCT CASCADE CONSTRAINTS;



/* Drop Sequences */

DROP SEQUENCE SEQ_ACT_COM_ac_no;
DROP SEQUENCE SEQ_ALARM_arm_no;
DROP SEQUENCE SEQ_BANNER_ban_no;
DROP SEQUENCE SEQ_CHILD_chi_no;
DROP SEQUENCE SEQ_COMMUNITY_COM_cc_no;
DROP SEQUENCE SEQ_COMMUNITY_com_no;
DROP SEQUENCE SEQ_COOK_cook_no;
DROP SEQUENCE SEQ_LULLABY_lul_no;
DROP SEQUENCE SEQ_NQ_nq_no;
DROP SEQUENCE SEQ_PLAY_play_no;
DROP SEQUENCE SEQ_PRODUCT_pro_no;
DROP SEQUENCE SEQ_QUESTION_q_no;
DROP SEQUENCE SEQ_REPORT_INFO_rinfo_no;
DROP SEQUENCE SEQ_REPORT_repo_no;
DROP SEQUENCE SEQ_SITTER_COM_sc_no;
DROP SEQUENCE SEQ_SITTER_COM_sit_no;
DROP SEQUENCE SEQ_SITTER_REV_srv_no;
DROP SEQUENCE SEQ_USED_used_no;
DROP SEQUENCE SEQ_WAREHOUSING_ware_no;




/* Create Sequences */

CREATE SEQUENCE SEQ_ACT_COM_ac_no INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_ALARM_arm_no INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_BANNER_ban_no INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_CHILD_chi_no INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_COMMUNITY_COM_cc_no INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_COMMUNITY_com_no INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_COOK_cook_no INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_LULLABY_lul_no INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_NQ_nq_no INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_PLAY_play_no INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_PRODUCT_pro_no INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_QUESTION_q_no INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_REPORT_INFO_rinfo_no INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_REPORT_repo_no INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_SITTER_COM_sc_no INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_SITTER_COM_sit_no INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_SITTER_REV_srv_no INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_USED_used_no INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_WAREHOUSING_ware_no INCREMENT BY 1 START WITH 1;



/* Create Tables */

-- 활동후기
CREATE TABLE ACT_COM
(
	-- 아이디
	mbr_id varchar2(50) NOT NULL,
	-- 후기번호
	ac_no number NOT NULL,
	-- 내용
	ac_content varchar2(4000),
	-- 평점
	ac_rate number,
	-- 카테고리
	ac_category varchar2(50),
	-- 글번호 : 놀이랑 요리의 글번호
	PC_NO number,
	PRIMARY KEY (ac_no)
);


-- 관리자
CREATE TABLE admin
(
	-- 관리자 ID
	ad_id varchar2(50) NOT NULL,
	-- 관리자 PW
	ad_pw varchar2(50),
	PRIMARY KEY (ad_id)
);


-- 알림
CREATE TABLE ALARM
(
	-- 쪽지번호
	arm_no number NOT NULL,
	-- 아이디
	mbr_id varchar2(50) NOT NULL,
	-- 내용
	arm_content varchar2(4000),
	-- 날짜
	arm_date date,
	-- 상태
	arm_status varchar2(50),
	PRIMARY KEY (arm_no)
);


-- 장바구니
CREATE TABLE BAG
(
	-- 아이디
	mbr_id varchar2(50) NOT NULL,
	-- 상품번호
	pro_no number NOT NULL,
	-- 수량
	bag_cnt number,
	PRIMARY KEY (mbr_id, pro_no)
);


-- 배너
CREATE TABLE BANNER
(
	-- 게시글번호
	ban_no number NOT NULL,
	-- 관리자 ID
	ad_id varchar2(50) NOT NULL,
	-- 분류
	ban_category varchar2(50),
	-- 이미지명
	ban_pic_name varchar2(100),
	-- 이미지상태
	ban_pic_status varchar2(50),
	-- 이미지
	ban_pic varchar2(200),
	-- 링크
	ban_link varchar2(200),
	PRIMARY KEY (ban_no)
);


-- 아이정보
CREATE TABLE CHILD
(
	-- 아이번호
	chi_no number NOT NULL,
	-- 아이디
	mbr_id varchar2(50) NOT NULL,
	-- 출생일
	chi_birth date,
	-- 아이이름
	chi_name varchar2(50),
	-- 성별
	chi_gender varchar2(50),
	-- 수신여부
	chi_sns varchar2(50),
	-- 아이사진
	chi_pic varchar2(200),
	PRIMARY KEY (chi_no)
);


-- 커뮤니티글
CREATE TABLE COMMUNITY
(
	-- 게시글번호
	com_no number NOT NULL,
	-- 아이디
	mbr_id varchar2(50) NOT NULL,
	-- 분류
	com_category varchar2(50),
	-- 제목
	com_title varchar2(300),
	-- 내용
	com_content varchar2(4000),
	-- 작성일
	com_date date,
	-- 조회수
	com_hit number DEFAULT 0,
	PRIMARY KEY (com_no)
);


-- 커뮤니티댓글
CREATE TABLE COMMUNITY_COM
(
	-- 댓글번호
	cc_no number NOT NULL,
	-- 아이디
	mbr_id varchar2(50) NOT NULL,
	-- 내용
	cc_content varchar2(50),
	-- 게시글번호
	com_no number NOT NULL,
	-- 작성일
	cc_date date DEFAULT SYSDATE,
	-- 카테고리
	cc_category varchar2(50),
	PRIMARY KEY (cc_no)
);


-- 요리
CREATE TABLE COOK
(
	-- 글번호
	cook_no number NOT NULL,
	-- 제목
	cook_title varchar2(300),
	-- 내용
	cook_content varchar2(4000),
	-- 사진
	cook_pic varchar2(200),
	-- 아이디
	mbr_id varchar2(50) NOT NULL,
	-- 조회수
	cook_hit number DEFAULT 0,
	-- 카테고리
	cook_category varchar2(50),
	PRIMARY KEY (cook_no)
);


-- 자장가
CREATE TABLE LULLABY
(
	-- 자장가번호
	lul_no number NOT NULL,
	-- 제목
	lul_title varchar2(300),
	-- 링크
	lul_link varchar2(200),
	-- 설명
	lul_content varchar2(4000),
	-- 사진
	lul_pic varchar2(200),
	-- 조회수
	lul_hit number DEFAULT 0,
	PRIMARY KEY (lul_no)
);


-- 자장가 즐겨찾기
CREATE TABLE LULLABY_MARK
(
	-- 아이디
	mbr_id varchar2(50) NOT NULL,
	-- 자장가번호
	lul_no number NOT NULL,
	PRIMARY KEY (mbr_id, lul_no)
);


-- 멤버
CREATE TABLE MEMBER
(
	-- 아이디
	mbr_id varchar2(50) NOT NULL,
	-- 비밀번호
	mbr_pw varchar2(50),
	-- 이름
	mbr_name varchar2(50),
	-- 닉네임
	mbr_nick varchar2(50),
	-- 생년월일
	mbr_birth date,
	-- 핸드폰
	mbr_phone number,
	-- 우편번호
	mbr_post varchar2(20),
	-- 상세주소1
	mbr_addr1 varchar2(300),
	-- 상세주소2
	mbr_addr2 varchar2(300),
	-- 계좌은행
	mbr_bank varchar2(50),
	-- 계좌번호
	mbr_account varchar2(50),
	-- 권한
	mbr_author varchar2(50) DEFAULT '회원',
	-- 가입일
	mbr_date date DEFAULT SYSDATE,
	-- 상태
	mbr_status varchar2(50) DEFAULT '활동중',
	-- 성별
	mbr_gender varchar2(50),
	-- 이메일
	mbr_email varchar2(50),
	PRIMARY KEY (mbr_id)
);


-- 공지사항/자주묻는질문
CREATE TABLE NQ
(
	-- 글번호
	nq_no number NOT NULL,
	-- 관리자 ID
	ad_id varchar2(50) NOT NULL,
	-- 제목
	nq_title varchar2(300),
	-- 내용
	nq_content varchar2(4000),
	-- 분류
	nq_category varchar2(50),
	-- 첨부파일
	nq_file varchar2(200),
	-- 공지사항 등록일
	nq_date date DEFAULT SYSDATE,
	PRIMARY KEY (nq_no)
);


-- 놀이
CREATE TABLE PLAY
(
	-- 글번호
	play_no number NOT NULL,
	-- 제목
	play_title varchar2(300),
	-- 사진
	play_pic varchar2(200),
	-- 내용
	play_content varchar2(4000),
	-- 아이디
	mbr_id varchar2(50) NOT NULL,
	-- 조회수
	play_hit number DEFAULT 0,
	-- 카테고리
	play_category varchar2(50),
	PRIMARY KEY (play_no)
);


-- 예방접종
CREATE TABLE PREVENTION
(
	-- 아이번호
	chi_no number NOT NULL,
	-- 접종명
	prv_name varchar2(200),
	-- 접종일
	prv_date date,
	-- 메모
	prv_memo varchar2(4000),
	PRIMARY KEY (chi_no)
);


-- 상품
CREATE TABLE PRODUCT
(
	-- 상품번호
	pro_no number NOT NULL,
	-- 상품명
	pro_name varchar2(300),
	-- 가격
	pro_price number,
	-- 카테고리
	pro_category varchar2(50),
	-- 사진
	pro_pic varchar2(200),
	-- 상세보기
	pro_detail varchar2(4000),
	-- 상품수량
	pro_cnt number,
	-- 기업코드
	pro_cc number,
	-- 기업명
	pro_cn varchar2(50),
	PRIMARY KEY (pro_no)
);


-- 1대1문의
CREATE TABLE QUESTION
(
	-- 글번호
	q_no number NOT NULL,
	-- 아이디
	mbr_id varchar2(50) NOT NULL,
	-- 제목
	q_title varchar2(300),
	-- 내용
	q_content varchar2(4000),
	-- 분류
	q_category varchar2(50),
	PRIMARY KEY (q_no)
);


-- 신고
CREATE TABLE REPORT
(
	-- 글번호
	repo_no number NOT NULL,
	-- 아이디
	mbr_id varchar2(50) NOT NULL,
	-- 카테고리
	repo_category varchar2(50),
	-- 글번호
	repo_category_no number,
	-- 제목
	repo_title varchar2(300),
	-- 내용
	repo_content varchar2(4000),
	-- 상태
	repo_status varchar2(50) DEFAULT '미처리',
	-- 답변
	repo_ans varchar2(4000),
	PRIMARY KEY (repo_no)
);


-- 제재내역
CREATE TABLE REPORT_INFO
(
	-- 제재번호
	rinfo_no number NOT NULL,
	-- 아이디
	mbr_id varchar2(50) NOT NULL,
	-- 제재사유
	rinfo_reason varchar2(4000),
	-- 정지일
	rinfo_cnt number,
	-- 시작일
	rinfo_start date,
	-- 글번호
	repo_no number NOT NULL,
	PRIMARY KEY (rinfo_no)
);


-- 시터
CREATE TABLE SITTER
(
	-- 시터아이디 : 시터 아이디
	sit_mbr_id varchar2(50) NOT NULL,
	-- 지급일
	sit_payday date,
	-- 휴무요일
	sit_off varchar2(50),
	-- 지역
	sit_loc varchar2(50),
	-- 희망비용
	sit_pay number,
	-- 희망연령대
	sit_age varchar2(50),
	-- 특이사항
	sit_note varchar2(4000),
	-- 시터사진
	sit_pic varchar2(200),
	PRIMARY KEY (sit_mbr_id)
);


-- 시터후기
CREATE TABLE SITTER_COM
(
	-- 후기번호
	sc_no number NOT NULL,
	-- 시터아이디 : 시터 아이디
	sit_mbr_id varchar2(50) NOT NULL,
	-- 아이디 : 회원 아이디
	mbr_id varchar2(50) NOT NULL,
	-- 내용
	sc_content varchar2(4000),
	-- 평점
	sc_rate number,
	PRIMARY KEY (sc_no)
);


-- 시터예약정보
CREATE TABLE SITTER_REV
(
	-- 거래번호
	srv_no number NOT NULL,
	-- 아이디
	mbr_id varchar2(50) NOT NULL,
	-- 시터아이디 : 시터 아이디
	sit_mbr_id varchar2(50) NOT NULL,
	-- 아이번호
	chi_no number NOT NULL,
	-- 주야
	srv_time varchar2(50),
	-- 예약일
	srv_date date,
	-- 금액
	srv_pay number,
	-- 상태
	srv_status varchar2(50) DEFAULT '신청',
	PRIMARY KEY (srv_no)
);


-- 거래내역
CREATE TABLE TRAN_INFO
(
	-- 아이디
	mbr_id varchar2(50) NOT NULL,
	-- 거래번호
	tran_no number,
	-- 상품번호
	pro_no number NOT NULL,
	-- 운송장번호
	waybill number,
	-- 거래일
	tran_date date DEFAULT SYSDATE,
	-- 상태 : 완료
	-- 취소
	tran_status varchar2(50) DEFAULT '완료',
	PRIMARY KEY (mbr_id)
);


-- 중고장터
CREATE TABLE USED
(
	-- 글번호
	used_no number NOT NULL,
	-- 아이디
	mbr_id varchar2(50) NOT NULL,
	-- 제목
	used_title varchar2(50),
	-- 등록일
	used_date date,
	-- 분류
	used_category varchar2(50),
	-- 지역
	used_loc varchar2(50),
	-- 사진
	used_pic varchar2(200),
	-- 조회수
	used_hit number DEFAULT 0,
	-- 가격
	used_price number,
	-- 내용
	used_content varchar2(4000),
	PRIMARY KEY (used_no)
);


-- 중고장터댓글
CREATE TABLE USED_COM
(
	-- 글번호
	used_no number NOT NULL,
	-- 댓글번호
	uc_no number,
	-- 등록일
	uc_date date DEFAULT SYSDATE,
	-- 내용
	uc_content varchar2(4000),
	-- 아이디
	mbr_id varchar2(50),
	PRIMARY KEY (used_no)
);


-- 입고
CREATE TABLE WAREHOUSING
(
	-- 입고번호
	ware_no number NOT NULL,
	-- 상품번호
	pro_no number NOT NULL,
	-- 입고수량
	ware_cnt number,
	-- 입고일
	ware_date date DEFAULT SYSDATE,
	-- 특이사항
	ware_note varchar2(4000),
	PRIMARY KEY (ware_no)
);



/* Create Foreign Keys */

ALTER TABLE BANNER
	ADD CONSTRAINT FK_ADMIN_BANNER FOREIGN KEY (ad_id)
	REFERENCES admin (ad_id)
	ON DELETE CASCADE
;


ALTER TABLE NQ
	ADD CONSTRAINT FK_ADMIN_NQ FOREIGN KEY (ad_id)
	REFERENCES admin (ad_id)
	ON DELETE CASCADE
;


ALTER TABLE PREVENTION
	ADD CONSTRAINT FK_CHILD_PREVENTION FOREIGN KEY (chi_no)
	REFERENCES CHILD (chi_no)
	ON DELETE CASCADE
;


ALTER TABLE SITTER_REV
	ADD CONSTRAINT FK_CHILD_SITTER_REV FOREIGN KEY (chi_no)
	REFERENCES CHILD (chi_no)
	ON DELETE CASCADE
;


ALTER TABLE COMMUNITY_COM
	ADD CONSTRAINT FK_COMMUNITY_COMMUNITY_COM FOREIGN KEY (com_no)
	REFERENCES COMMUNITY (com_no)
	ON DELETE CASCADE
;


ALTER TABLE LULLABY_MARK
	ADD CONSTRAINT FK_LULLABY_LULLABY_MARK FOREIGN KEY (lul_no)
	REFERENCES LULLABY (lul_no)
	ON DELETE CASCADE
;


ALTER TABLE ACT_COM
	ADD CONSTRAINT FK_MEMBER_ACT_COM FOREIGN KEY (mbr_id)
	REFERENCES MEMBER (mbr_id)
	ON DELETE CASCADE
;


ALTER TABLE ALARM
	ADD CONSTRAINT FK_MEMBER_ALARM FOREIGN KEY (mbr_id)
	REFERENCES MEMBER (mbr_id)
	ON DELETE CASCADE
;


ALTER TABLE BAG
	ADD CONSTRAINT FK_MEMBER_BAG FOREIGN KEY (mbr_id)
	REFERENCES MEMBER (mbr_id)
	ON DELETE CASCADE
;


ALTER TABLE CHILD
	ADD CONSTRAINT FK_MEMBER_CHILD FOREIGN KEY (mbr_id)
	REFERENCES MEMBER (mbr_id)
	ON DELETE CASCADE
;


ALTER TABLE COMMUNITY
	ADD CONSTRAINT FK_MEMBER_COMMUNITY FOREIGN KEY (mbr_id)
	REFERENCES MEMBER (mbr_id)
	ON DELETE CASCADE
;


ALTER TABLE COMMUNITY_COM
	ADD CONSTRAINT FK_MEMBER_COMMUNITY_COM FOREIGN KEY (mbr_id)
	REFERENCES MEMBER (mbr_id)
	ON DELETE CASCADE
;


ALTER TABLE COOK
	ADD CONSTRAINT FK_MEMBER_COOK FOREIGN KEY (mbr_id)
	REFERENCES MEMBER (mbr_id)
	ON DELETE CASCADE
;


ALTER TABLE LULLABY_MARK
	ADD CONSTRAINT FK_MEMBER_LULLABY_MARK FOREIGN KEY (mbr_id)
	REFERENCES MEMBER (mbr_id)
	ON DELETE CASCADE
;


ALTER TABLE PLAY
	ADD CONSTRAINT FK_MEMBER_PLAY FOREIGN KEY (mbr_id)
	REFERENCES MEMBER (mbr_id)
	ON DELETE CASCADE
;


ALTER TABLE QUESTION
	ADD CONSTRAINT FK_MEMBER_QUESTION FOREIGN KEY (mbr_id)
	REFERENCES MEMBER (mbr_id)
	ON DELETE CASCADE
;


ALTER TABLE REPORT
	ADD CONSTRAINT FK_MEMBER_REPORT FOREIGN KEY (mbr_id)
	REFERENCES MEMBER (mbr_id)
	ON DELETE CASCADE
;


ALTER TABLE REPORT_INFO
	ADD CONSTRAINT FK_MEMBER_REPROT_INFO FOREIGN KEY (mbr_id)
	REFERENCES MEMBER (mbr_id)
	ON DELETE CASCADE
;


ALTER TABLE SITTER
	ADD CONSTRAINT FK_MEMBER_SITTER FOREIGN KEY (sit_mbr_id)
	REFERENCES MEMBER (mbr_id)
	ON DELETE CASCADE
;


ALTER TABLE SITTER_COM
	ADD CONSTRAINT FK_MEMBER_SITTER_COM FOREIGN KEY (mbr_id)
	REFERENCES MEMBER (mbr_id)
	ON DELETE CASCADE
;


ALTER TABLE SITTER_REV
	ADD CONSTRAINT FK_MEMBER_SITTER_REV FOREIGN KEY (mbr_id)
	REFERENCES MEMBER (mbr_id)
	ON DELETE CASCADE
;


ALTER TABLE TRAN_INFO
	ADD CONSTRAINT FK_MEMBER_TRAN_INFO FOREIGN KEY (mbr_id)
	REFERENCES MEMBER (mbr_id)
	ON DELETE CASCADE
;


ALTER TABLE USED
	ADD CONSTRAINT FK_MEMBER_USED FOREIGN KEY (mbr_id)
	REFERENCES MEMBER (mbr_id)
	ON DELETE CASCADE
;


ALTER TABLE BAG
	ADD CONSTRAINT FK_PRODUCT_BAG FOREIGN KEY (pro_no)
	REFERENCES PRODUCT (pro_no)
	ON DELETE CASCADE
;


ALTER TABLE TRAN_INFO
	ADD CONSTRAINT FK_PRODUCT_TRAN_INFO FOREIGN KEY (pro_no)
	REFERENCES PRODUCT (pro_no)
	ON DELETE CASCADE
;


ALTER TABLE WAREHOUSING
	ADD CONSTRAINT FK_PRODUCT_WAREHOUSING FOREIGN KEY (pro_no)
	REFERENCES PRODUCT (pro_no)
	ON DELETE CASCADE
;


ALTER TABLE REPORT_INFO
	ADD CONSTRAINT FK_REPORT_REPORT_INFO FOREIGN KEY (repo_no)
	REFERENCES REPORT (repo_no)
	ON DELETE CASCADE
;


ALTER TABLE SITTER_COM
	ADD CONSTRAINT FK_SITTER_SITTER_COM FOREIGN KEY (sit_mbr_id)
	REFERENCES SITTER (sit_mbr_id)
	ON DELETE CASCADE
;


ALTER TABLE SITTER_REV
	ADD CONSTRAINT FK_SITTER_SITTER_REV FOREIGN KEY (sit_mbr_id)
	REFERENCES SITTER (sit_mbr_id)
	ON DELETE CASCADE
;


ALTER TABLE USED_COM
	ADD CONSTRAINT FK_USED_USED_COM FOREIGN KEY (used_no)
	REFERENCES USED (used_no)
	ON DELETE CASCADE
;



/* Create Triggers */

CREATE OR REPLACE TRIGGER TRI_ACT_COM_ac_no BEFORE INSERT ON ACT_COM
FOR EACH ROW
BEGIN
	SELECT SEQ_ACT_COM_ac_no.nextval
	INTO :new.ac_no
	FROM dual;
END;

/

CREATE OR REPLACE TRIGGER TRI_ALARM_arm_no BEFORE INSERT ON ALARM
FOR EACH ROW
BEGIN
	SELECT SEQ_ALARM_arm_no.nextval
	INTO :new.arm_no
	FROM dual;
END;

/

CREATE OR REPLACE TRIGGER TRI_BANNER_ban_no BEFORE INSERT ON BANNER
FOR EACH ROW
BEGIN
	SELECT SEQ_BANNER_ban_no.nextval
	INTO :new.ban_no
	FROM dual;
END;

/

CREATE OR REPLACE TRIGGER TRI_CHILD_chi_no BEFORE INSERT ON CHILD
FOR EACH ROW
BEGIN
	SELECT SEQ_CHILD_chi_no.nextval
	INTO :new.chi_no
	FROM dual;
END;

/

CREATE OR REPLACE TRIGGER TRI_COMMUNITY_COM_cc_no BEFORE INSERT ON COMMUNITY_COM
FOR EACH ROW
BEGIN
	SELECT SEQ_COMMUNITY_COM_cc_no.nextval
	INTO :new.cc_no
	FROM dual;
END;

/

CREATE OR REPLACE TRIGGER TRI_COMMUNITY_com_no BEFORE INSERT ON COMMUNITY
FOR EACH ROW
BEGIN
	SELECT SEQ_COMMUNITY_com_no.nextval
	INTO :new.com_no
	FROM dual;
END;

/

CREATE OR REPLACE TRIGGER TRI_COOK_cook_no BEFORE INSERT ON COOK
FOR EACH ROW
BEGIN
	SELECT SEQ_COOK_cook_no.nextval
	INTO :new.cook_no
	FROM dual;
END;

/

CREATE OR REPLACE TRIGGER TRI_LULLABY_lul_no BEFORE INSERT ON LULLABY
FOR EACH ROW
BEGIN
	SELECT SEQ_LULLABY_lul_no.nextval
	INTO :new.lul_no
	FROM dual;
END;

/

CREATE OR REPLACE TRIGGER TRI_NQ_nq_no BEFORE INSERT ON NQ
FOR EACH ROW
BEGIN
	SELECT SEQ_NQ_nq_no.nextval
	INTO :new.nq_no
	FROM dual;
END;

/

CREATE OR REPLACE TRIGGER TRI_PLAY_play_no BEFORE INSERT ON PLAY
FOR EACH ROW
BEGIN
	SELECT SEQ_PLAY_play_no.nextval
	INTO :new.play_no
	FROM dual;
END;

/

CREATE OR REPLACE TRIGGER TRI_PRODUCT_pro_no BEFORE INSERT ON PRODUCT
FOR EACH ROW
BEGIN
	SELECT SEQ_PRODUCT_pro_no.nextval
	INTO :new.pro_no
	FROM dual;
END;

/

CREATE OR REPLACE TRIGGER TRI_QUESTION_q_no BEFORE INSERT ON QUESTION
FOR EACH ROW
BEGIN
	SELECT SEQ_QUESTION_q_no.nextval
	INTO :new.q_no
	FROM dual;
END;

/

CREATE OR REPLACE TRIGGER TRI_REPORT_INFO_rinfo_no BEFORE INSERT ON REPORT_INFO
FOR EACH ROW
BEGIN
	SELECT SEQ_REPORT_INFO_rinfo_no.nextval
	INTO :new.rinfo_no
	FROM dual;
END;

/

CREATE OR REPLACE TRIGGER TRI_REPORT_repo_no BEFORE INSERT ON REPORT
FOR EACH ROW
BEGIN
	SELECT SEQ_REPORT_repo_no.nextval
	INTO :new.repo_no
	FROM dual;
END;

/

CREATE OR REPLACE TRIGGER TRI_SITTER_COM_sc_no BEFORE INSERT ON SITTER_COM
FOR EACH ROW
BEGIN
	SELECT SEQ_SITTER_COM_sc_no.nextval
	INTO :new.sc_no
	FROM dual;
END;

/

CREATE OR REPLACE TRIGGER TRI_SITTER_COM_sit_no BEFORE INSERT ON SITTER_COM
FOR EACH ROW
BEGIN
	SELECT SEQ_SITTER_COM_sit_no.nextval
	INTO :new.sit_no
	FROM dual;
END;

/

CREATE OR REPLACE TRIGGER TRI_SITTER_REV_srv_no BEFORE INSERT ON SITTER_REV
FOR EACH ROW
BEGIN
	SELECT SEQ_SITTER_REV_srv_no.nextval
	INTO :new.srv_no
	FROM dual;
END;

/

CREATE OR REPLACE TRIGGER TRI_USED_used_no BEFORE INSERT ON USED
FOR EACH ROW
BEGIN
	SELECT SEQ_USED_used_no.nextval
	INTO :new.used_no
	FROM dual;
END;

/

CREATE OR REPLACE TRIGGER TRI_WAREHOUSING_ware_no BEFORE INSERT ON WAREHOUSING
FOR EACH ROW
BEGIN
	SELECT SEQ_WAREHOUSING_ware_no.nextval
	INTO :new.ware_no
	FROM dual;
END;

/




/* Comments */

COMMENT ON TABLE ACT_COM IS '활동후기';
COMMENT ON COLUMN ACT_COM.mbr_id IS '아이디';
COMMENT ON COLUMN ACT_COM.ac_no IS '후기번호';
COMMENT ON COLUMN ACT_COM.ac_content IS '내용';
COMMENT ON COLUMN ACT_COM.ac_rate IS '평점';
COMMENT ON COLUMN ACT_COM.ac_category IS '카테고리';
COMMENT ON COLUMN ACT_COM.PC_NO IS '글번호 : 놀이랑 요리의 글번호';
COMMENT ON TABLE admin IS '관리자';
COMMENT ON COLUMN admin.ad_id IS '관리자 ID';
COMMENT ON COLUMN admin.ad_pw IS '관리자 PW';
COMMENT ON TABLE ALARM IS '알림';
COMMENT ON COLUMN ALARM.arm_no IS '쪽지번호';
COMMENT ON COLUMN ALARM.mbr_id IS '아이디';
COMMENT ON COLUMN ALARM.arm_content IS '내용';
COMMENT ON COLUMN ALARM.arm_date IS '날짜';
COMMENT ON COLUMN ALARM.arm_status IS '상태';
COMMENT ON TABLE BAG IS '장바구니';
COMMENT ON COLUMN BAG.mbr_id IS '아이디';
COMMENT ON COLUMN BAG.pro_no IS '상품번호';
COMMENT ON COLUMN BAG.bag_cnt IS '수량';
COMMENT ON TABLE BANNER IS '배너';
COMMENT ON COLUMN BANNER.ban_no IS '게시글번호';
COMMENT ON COLUMN BANNER.ad_id IS '관리자 ID';
COMMENT ON COLUMN BANNER.ban_category IS '분류';
COMMENT ON COLUMN BANNER.ban_pic_name IS '이미지명';
COMMENT ON COLUMN BANNER.ban_pic_status IS '이미지상태';
COMMENT ON COLUMN BANNER.ban_pic IS '이미지';
COMMENT ON COLUMN BANNER.ban_link IS '링크';
COMMENT ON TABLE CHILD IS '아이정보';
COMMENT ON COLUMN CHILD.chi_no IS '아이번호';
COMMENT ON COLUMN CHILD.mbr_id IS '아이디';
COMMENT ON COLUMN CHILD.chi_birth IS '출생일';
COMMENT ON COLUMN CHILD.chi_name IS '아이이름';
COMMENT ON COLUMN CHILD.chi_gender IS '성별';
COMMENT ON COLUMN CHILD.chi_sns IS '수신여부';
COMMENT ON COLUMN CHILD.chi_pic IS '아이사진';
COMMENT ON TABLE COMMUNITY IS '커뮤니티글';
COMMENT ON COLUMN COMMUNITY.com_no IS '게시글번호';
COMMENT ON COLUMN COMMUNITY.mbr_id IS '아이디';
COMMENT ON COLUMN COMMUNITY.com_category IS '분류';
COMMENT ON COLUMN COMMUNITY.com_title IS '제목';
COMMENT ON COLUMN COMMUNITY.com_content IS '내용';
COMMENT ON COLUMN COMMUNITY.com_date IS '작성일';
COMMENT ON COLUMN COMMUNITY.com_hit IS '조회수';
COMMENT ON TABLE COMMUNITY_COM IS '커뮤니티댓글';
COMMENT ON COLUMN COMMUNITY_COM.cc_no IS '댓글번호';
COMMENT ON COLUMN COMMUNITY_COM.mbr_id IS '아이디';
COMMENT ON COLUMN COMMUNITY_COM.cc_content IS '내용';
COMMENT ON COLUMN COMMUNITY_COM.com_no IS '게시글번호';
COMMENT ON COLUMN COMMUNITY_COM.cc_date IS '작성일';
COMMENT ON COLUMN COMMUNITY_COM.cc_category IS '카테고리';
COMMENT ON TABLE COOK IS '요리';
COMMENT ON COLUMN COOK.cook_no IS '글번호';
COMMENT ON COLUMN COOK.cook_title IS '제목';
COMMENT ON COLUMN COOK.cook_content IS '내용';
COMMENT ON COLUMN COOK.cook_pic IS '사진';
COMMENT ON COLUMN COOK.mbr_id IS '아이디';
COMMENT ON COLUMN COOK.cook_hit IS '조회수';
COMMENT ON COLUMN COOK.cook_category IS '카테고리';
COMMENT ON TABLE LULLABY IS '자장가';
COMMENT ON COLUMN LULLABY.lul_no IS '자장가번호';
COMMENT ON COLUMN LULLABY.lul_title IS '제목';
COMMENT ON COLUMN LULLABY.lul_link IS '링크';
COMMENT ON COLUMN LULLABY.lul_content IS '설명';
COMMENT ON COLUMN LULLABY.lul_pic IS '사진';
COMMENT ON COLUMN LULLABY.lul_hit IS '조회수';
COMMENT ON TABLE LULLABY_MARK IS '자장가 즐겨찾기';
COMMENT ON COLUMN LULLABY_MARK.mbr_id IS '아이디';
COMMENT ON COLUMN LULLABY_MARK.lul_no IS '자장가번호';
COMMENT ON TABLE MEMBER IS '멤버';
COMMENT ON COLUMN MEMBER.mbr_id IS '아이디';
COMMENT ON COLUMN MEMBER.mbr_pw IS '비밀번호';
COMMENT ON COLUMN MEMBER.mbr_name IS '이름';
COMMENT ON COLUMN MEMBER.mbr_nick IS '닉네임';
COMMENT ON COLUMN MEMBER.mbr_birth IS '생년월일';
COMMENT ON COLUMN MEMBER.mbr_phone IS '핸드폰';
COMMENT ON COLUMN MEMBER.mbr_post IS '우편번호';
COMMENT ON COLUMN MEMBER.mbr_addr1 IS '상세주소1';
COMMENT ON COLUMN MEMBER.mbr_addr2 IS '상세주소2';
COMMENT ON COLUMN MEMBER.mbr_bank IS '계좌은행';
COMMENT ON COLUMN MEMBER.mbr_account IS '계좌번호';
COMMENT ON COLUMN MEMBER.mbr_author IS '권한';
COMMENT ON COLUMN MEMBER.mbr_date IS '가입일';
COMMENT ON COLUMN MEMBER.mbr_status IS '상태';
COMMENT ON COLUMN MEMBER.mbr_gender IS '성별';
COMMENT ON COLUMN MEMBER.mbr_email IS '이메일';
COMMENT ON TABLE NQ IS '공지사항/자주묻는질문';
COMMENT ON COLUMN NQ.nq_no IS '글번호';
COMMENT ON COLUMN NQ.ad_id IS '관리자 ID';
COMMENT ON COLUMN NQ.nq_title IS '제목';
COMMENT ON COLUMN NQ.nq_content IS '내용';
COMMENT ON COLUMN NQ.nq_category IS '분류';
COMMENT ON COLUMN NQ.nq_file IS '첨부파일';
COMMENT ON COLUMN NQ.nq_date IS '공지사항 등록일';
COMMENT ON TABLE PLAY IS '놀이';
COMMENT ON COLUMN PLAY.play_no IS '글번호';
COMMENT ON COLUMN PLAY.play_title IS '제목';
COMMENT ON COLUMN PLAY.play_pic IS '사진';
COMMENT ON COLUMN PLAY.play_content IS '내용';
COMMENT ON COLUMN PLAY.mbr_id IS '아이디';
COMMENT ON COLUMN PLAY.play_hit IS '조회수';
COMMENT ON COLUMN PLAY.play_category IS '카테고리';
COMMENT ON TABLE PREVENTION IS '예방접종';
COMMENT ON COLUMN PREVENTION.chi_no IS '아이번호';
COMMENT ON COLUMN PREVENTION.prv_name IS '접종명';
COMMENT ON COLUMN PREVENTION.prv_date IS '접종일';
COMMENT ON COLUMN PREVENTION.prv_memo IS '메모';
COMMENT ON TABLE PRODUCT IS '상품';
COMMENT ON COLUMN PRODUCT.pro_no IS '상품번호';
COMMENT ON COLUMN PRODUCT.pro_name IS '상품명';
COMMENT ON COLUMN PRODUCT.pro_price IS '가격';
COMMENT ON COLUMN PRODUCT.pro_category IS '카테고리';
COMMENT ON COLUMN PRODUCT.pro_pic IS '사진';
COMMENT ON COLUMN PRODUCT.pro_detail IS '상세보기';
COMMENT ON COLUMN PRODUCT.pro_cnt IS '상품수량';
COMMENT ON COLUMN PRODUCT.pro_cc IS '기업코드';
COMMENT ON COLUMN PRODUCT.pro_cn IS '기업명';
COMMENT ON TABLE QUESTION IS '1대1문의';
COMMENT ON COLUMN QUESTION.q_no IS '글번호';
COMMENT ON COLUMN QUESTION.mbr_id IS '아이디';
COMMENT ON COLUMN QUESTION.q_title IS '제목';
COMMENT ON COLUMN QUESTION.q_content IS '내용';
COMMENT ON COLUMN QUESTION.q_category IS '분류';
COMMENT ON TABLE REPORT IS '신고';
COMMENT ON COLUMN REPORT.repo_no IS '글번호';
COMMENT ON COLUMN REPORT.mbr_id IS '아이디';
COMMENT ON COLUMN REPORT.repo_category IS '카테고리';
COMMENT ON COLUMN REPORT.repo_category_no IS '글번호';
COMMENT ON COLUMN REPORT.repo_title IS '제목';
COMMENT ON COLUMN REPORT.repo_content IS '내용';
COMMENT ON COLUMN REPORT.repo_status IS '상태';
COMMENT ON COLUMN REPORT.repo_ans IS '답변';
COMMENT ON TABLE REPORT_INFO IS '제재내역';
COMMENT ON COLUMN REPORT_INFO.rinfo_no IS '제재번호';
COMMENT ON COLUMN REPORT_INFO.mbr_id IS '아이디';
COMMENT ON COLUMN REPORT_INFO.rinfo_reason IS '제재사유';
COMMENT ON COLUMN REPORT_INFO.rinfo_cnt IS '정지일';
COMMENT ON COLUMN REPORT_INFO.rinfo_start IS '시작일';
COMMENT ON COLUMN REPORT_INFO.repo_no IS '글번호';
COMMENT ON TABLE SITTER IS '시터';
COMMENT ON COLUMN SITTER.sit_mbr_id IS '시터아이디 : 시터 아이디';
COMMENT ON COLUMN SITTER.sit_payday IS '지급일';
COMMENT ON COLUMN SITTER.sit_off IS '휴무요일';
COMMENT ON COLUMN SITTER.sit_loc IS '지역';
COMMENT ON COLUMN SITTER.sit_pay IS '희망비용';
COMMENT ON COLUMN SITTER.sit_age IS '희망연령대';
COMMENT ON COLUMN SITTER.sit_note IS '특이사항';
COMMENT ON COLUMN SITTER.sit_pic IS '시터사진';
COMMENT ON TABLE SITTER_COM IS '시터후기';
COMMENT ON COLUMN SITTER_COM.sc_no IS '후기번호';
COMMENT ON COLUMN SITTER_COM.sit_mbr_id IS '시터아이디 : 시터 아이디';
COMMENT ON COLUMN SITTER_COM.mbr_id IS '아이디 : 회원 아이디';
COMMENT ON COLUMN SITTER_COM.sc_content IS '내용';
COMMENT ON COLUMN SITTER_COM.sc_rate IS '평점';
COMMENT ON TABLE SITTER_REV IS '시터예약정보';
COMMENT ON COLUMN SITTER_REV.srv_no IS '거래번호';
COMMENT ON COLUMN SITTER_REV.mbr_id IS '아이디';
COMMENT ON COLUMN SITTER_REV.sit_mbr_id IS '시터아이디 : 시터 아이디';
COMMENT ON COLUMN SITTER_REV.chi_no IS '아이번호';
COMMENT ON COLUMN SITTER_REV.srv_time IS '주야';
COMMENT ON COLUMN SITTER_REV.srv_date IS '예약일';
COMMENT ON COLUMN SITTER_REV.srv_pay IS '금액';
COMMENT ON COLUMN SITTER_REV.srv_status IS '상태';
COMMENT ON TABLE TRAN_INFO IS '거래내역';
COMMENT ON COLUMN TRAN_INFO.mbr_id IS '아이디';
COMMENT ON COLUMN TRAN_INFO.tran_no IS '거래번호';
COMMENT ON COLUMN TRAN_INFO.pro_no IS '상품번호';
COMMENT ON COLUMN TRAN_INFO.waybill IS '운송장번호';
COMMENT ON COLUMN TRAN_INFO.tran_date IS '거래일';
COMMENT ON COLUMN TRAN_INFO.tran_status IS '상태 : 완료
취소';
COMMENT ON TABLE USED IS '중고장터';
COMMENT ON COLUMN USED.used_no IS '글번호';
COMMENT ON COLUMN USED.mbr_id IS '아이디';
COMMENT ON COLUMN USED.used_title IS '제목';
COMMENT ON COLUMN USED.used_date IS '등록일';
COMMENT ON COLUMN USED.used_category IS '분류';
COMMENT ON COLUMN USED.used_loc IS '지역';
COMMENT ON COLUMN USED.used_pic IS '사진';
COMMENT ON COLUMN USED.used_hit IS '조회수';
COMMENT ON COLUMN USED.used_price IS '가격';
COMMENT ON COLUMN USED.used_content IS '내용';
COMMENT ON TABLE USED_COM IS '중고장터댓글';
COMMENT ON COLUMN USED_COM.used_no IS '글번호';
COMMENT ON COLUMN USED_COM.uc_no IS '댓글번호';
COMMENT ON COLUMN USED_COM.uc_date IS '등록일';
COMMENT ON COLUMN USED_COM.uc_content IS '내용';
COMMENT ON COLUMN USED_COM.mbr_id IS '아이디';
COMMENT ON TABLE WAREHOUSING IS '입고';
COMMENT ON COLUMN WAREHOUSING.ware_no IS '입고번호';
COMMENT ON COLUMN WAREHOUSING.pro_no IS '상품번호';
COMMENT ON COLUMN WAREHOUSING.ware_cnt IS '입고수량';
COMMENT ON COLUMN WAREHOUSING.ware_date IS '입고일';
COMMENT ON COLUMN WAREHOUSING.ware_note IS '특이사항';



