/**********************************/
/* Table Name: 사이트그룹 */
/**********************************/
CREATE TABLE sitegrp(
		sitegrpno                     		NUMBER(10)		 DEFAULT 0		 NOT NULL		 PRIMARY KEY,
		seqno                         		NUMBER(10)		 DEFAULT 0		 NULL ,
		wname                         		VARCHAR2(100)		 NOT NULL,
		wdate                         		DATE		 NOT NULL,
		title                         		VARCHAR2(500)		 NOT NULL,
		grpcont                       		CLOB(10)		 NOT NULL,
		thumbname                     		VARCHAR2(100)		 NULL ,
		thumbsize                     		NUMBER(10)		 DEFAULT 0		 NULL ,
		viewcnt                       		NUMBER(10)		 DEFAULT 0		 NOT NULL,
		likecnt                       		NUMBER(10)		 DEFAULT 0		 NOT NULL,
		sitecnt                       		NUMBER(10)		 DEFAULT 0		 NOT NULL
);

COMMENT ON TABLE sitegrp is '사이트그룹';
COMMENT ON COLUMN sitegrp.sitegrpno is '사이트그룹번호';
COMMENT ON COLUMN sitegrp.seqno is '출력순서';
COMMENT ON COLUMN sitegrp.wname is '게시자';
COMMENT ON COLUMN sitegrp.wdate is '게시날짜';
COMMENT ON COLUMN sitegrp.title is '제목';
COMMENT ON COLUMN sitegrp.grpcont is '사이트그룹설명';
COMMENT ON COLUMN sitegrp.thumbname is '썸네일사진';
COMMENT ON COLUMN sitegrp.thumbsize is '썸네일사진크기';
COMMENT ON COLUMN sitegrp.viewcnt is '조회수';
COMMENT ON COLUMN sitegrp.likecnt is '좋아요수';
COMMENT ON COLUMN sitegrp.sitecnt is '사이트개수';

-- 사이트그룹 시퀀스 생성
CREATE SEQUENCE sitegrp_seq
  START WITH 1              -- 시작 번호
  INCREMENT BY 1          -- 증가값
  MAXVALUE 9999999999 -- 최대값: 9999999 --> NUMBER(7) 대응
  CACHE 2                       -- 2번은 메모리에서만 계산
  NOCYCLE;

  
----------------------
 -- insert
INSERT INTO categrp(categrpno, name, seqno, visible, rdate)
VALUES(categrp_seq.nextval, '국내 여행', 1, 'Y', sysdate);
INSERT INTO categrp(categrpno, name, seqno, visible, rdate)
VALUES(categrp_seq.nextval, '해외 여행', 2, 'Y', sysdate);
INSERT INTO categrp(categrpno, name, seqno, visible, rdate)
VALUES(categrp_seq.nextval, '개발 자료', 3, 'Y', sysdate);
COMMIT;

INSERT INTO sitegrp(sitegrpno, seqno, wname, wdate, title, grpcont, thumbname, thumbsize, viewcnt, likecnt, sitecnt)
    VALUES(sitegrp_seq.nextval, #{seqno}, #{wname}, sysdate, #{title}, #{grpcont}, #{thumbname}, #{thumbsize}, #{viewcnt}, #{likecnt}, #{sitecnt})
-- list
SELECT categrpno, name, seqno, visible, rdate
FROM categrp
ORDER BY categrpno ASC;