
/**********************************/
/* Table Name: 사이트 */
/**********************************/
CREATE TABLE site(
		siteno                        		NUMBER(20)		 NOT NULL		 PRIMARY KEY,
		seqno                         		NUMBER(10)		 DEFAULT 0		 NOT NULL,
		link                          		VARCHAR2(1000)		 NULL ,
		sname                         		VARCHAR2(500)		 NOT NULL,
		wname                         		VARCHAR2(100)		 NOT NULL,
		content                       		CLOB(10)		 NULL ,
		filename                      		VARCHAR2(100)		 NULL ,
		filesize                      		NUMBER(10)		 DEFAULT 0		 NOT NULL,
		likecnt                       		NUMBER(10)		 DEFAULT 0		 NOT NULL,
		sitegrpno                     		NUMBER(10)		 NOT NULL,
  FOREIGN KEY (sitegrpno) REFERENCES sitegrp (sitegrpno)
);

COMMENT ON TABLE site is '사이트';
COMMENT ON COLUMN site.siteno is '사이트번호';
COMMENT ON COLUMN site.seqno is '출력순서';
COMMENT ON COLUMN site.link is '링크';
COMMENT ON COLUMN site.sname is '사이트명';
COMMENT ON COLUMN site.wname is '게시자';
COMMENT ON COLUMN site.content is '사이트설명';
COMMENT ON COLUMN site.filename is '사진';
COMMENT ON COLUMN site.filesize is '사진크기';
COMMENT ON COLUMN site.likecnt is '좋아요수';
COMMENT ON COLUMN site.sitegrpno is '사이트그룹번호';

-- 사이트 시퀀스 생성
CREATE SEQUENCE site_seq
  START WITH 1              -- 시작 번호
  INCREMENT BY 1          -- 증가값
  MAXVALUE 9999999999 -- 최대값: 9999999 --> NUMBER(7) 대응
  CACHE 2                       -- 2번은 메모리에서만 계산
  NOCYCLE;    

--------------------

INSERT INTO cate(cateno, categrpno, name, seqno, visible, rdate, cnt)
VALUES(cate_seq.nextval, 1, '가을', 1, 'Y', sysdate, 0);
INSERT INTO cate(cateno, categrpno, name, seqno, visible, rdate, cnt)
VALUES(cate_seq.nextval, 1, '겨울', 1, 'Y', sysdate, 0);
INSERT INTO cate(cateno, categrpno, name, seqno, visible, rdate, cnt)
VALUES(cate_seq.nextval, 1, '봄', 1, 'Y', sysdate, 0);
COMMIT;
-- 목록
SELECT cateno, categrpno, name, seqno, visible, rdate, cnt
FROM cate
ORDER BY cateno ASC;  
 
-- 조회
SELECT cateno, categrpno, name, seqno, visible, rdate, cnt
FROM cate
WHERE cateno=3;
-- 수정
UPDATE cate
SET categrpno=1, name='식당', seqno = 10, visible='N', cnt=0
WHERE cateno = 3;
commit;
-- 삭제
DELETE cate
WHERE cateno = 3;
SELECT * FROM cate;
-- 출력 순서 상향, 10 ▷ 1
UPDATE cate
SET seqno = seqno - 1
WHERE cateno=2;
SELECT cateno, categrpno, name, seqno, visible, rdate, cnt
FROM cate
ORDER BY seqno ASC;
-- 출력순서 하향, 1 ▷ 10
UPDATE cate
SET seqno = seqno + 1
WHERE cateno=2;
-- 출력 모드의 변경
UPDATE cate
SET visible='Y'
WHERE cateno=2;
UPDATE cate
SET visible='N'
WHERE cateno=2;
---------------------------------------------         
-- FK를 갖는 테이블 추가 구현
---------------------------------------------
-- 카테고리 그룹에따른 카테고리 목록
SELECT cateno, categrpno, name, seqno, visible, rdate, cnt
FROM cate
WHERE categrpno=1
ORDER BY seqno ASC;
-- 부모 테이블 레코드 삭제(오류)
DELETE FROM categrp
WHERE categrpno = 1;
 
-- 삭제하려면 레코드의 categrpno가 어디에서 쓰이는지 알려주어야함.
SELECT COUNT(*) as cnt
FROM cate
WHERE categrpno=1;
 
         
-- 자식 테이블에서 FK가 1인 레코드 모두 삭제
DELETE FROM cate
WHERE categrpno=1;
-- 부모 테이블 레코드 삭제
DELETE FROM categrp
WHERE categrpno=1;
commit;
 
-- 부모 테이블 레코드 삭제 확인
SELECT * FROM categrp ORDER BY categrpno ASC;
 
SELECT r.categrpno as r_categrpno, r.name as r_name,
      c.cateno, c.categrpno, c.name, c.seqno, c.visible, c.rdate, c.cnt
FROM categrp r, cate c
WHERE r.categrpno = c.categrpno
ORDER BY r.categrpno ASC, c.seqno ASC;
 
-- 통합 VO, categrpno 별 cate 목록
SELECT r.categrpno as r_categrpno, r.name as r_name,
       c.cateno, c.categrpno, c.name, c.seqno, c.visible, c.rdate, c.cnt
FROM categrp r, cate c
WHERE (r.categrpno = c.categrpno) AND r.categrpno=1
ORDER BY r.categrpno ASC, c.seqno ASC;
 
-- contents 추가에따른 등록된 글수의 증가
UPDATE cate 
SET    cnt = cnt + 1 
WHERE  cateno=1;
-- contents 추가에따른 등록된 글수의 감소
UPDATE cate 
SET    cnt = cnt - 1 
WHERE  cateno=1; 
-- 글수 초기화
UPDATE cate
SET    cnt = 0;
 
COMMIT;

INSERT INTO sitegrp(sitegrpno, seqno, wname, wdate, title, grpcont, thumbname, 
    thumbsize, viewcnt, likecnt, sitecnt)
    VALUES(sitegrp_seq.nextval, 1, 'aaa', sysdate, '첫게시글 top10',
     '첫게시글테스트', 'lankisite.png', 0 ,0, 0, 0);
INSERT INTO sitegrp(sitegrpno, seqno, wname, wdate, title, grpcont, thumbname, 
    thumbsize, viewcnt, likecnt, sitecnt)
    VALUES(sitegrp_seq.nextval, 2, 'bbb', sysdate, '두번째게시글 top10',
     '두번째게시글테스트', 'lankisite.png', 0 ,0, 0, 0);
     
commit;
delete from sitegrp where seqno in (1,2);
commit;



select * from sitegrp;


  