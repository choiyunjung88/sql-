
-- DDL(DATA DEFINITION LANGUAGE)
-- 객체를 만들고 (CREATE), 바꾸고(ALTER), 삭제(DROP)하는 데이터 정의 언어

/*
 * ALTER(바꾸다, 수정하다, 변조하다)
 * 
 * -- 테이블에서 수정할 수 있는 것
 * 1) 제약 조건(추가/삭제)
 * 2) 컬럼(추가/수정/삭제)
 * 3) 이름변경 (테이블명, 컬럼명...)
 * 
 * 
 * */

--1) 제약조건(추가/삭제)

--[작성법]
-- 1) 추가 : ALTER TABLE 테이블명
--           ADD [CONSTRAINT 제약조건명] 제약조건(지정할 컬럼명)
--           [REFERENCES 테이블명[(컬럼명)]]; <-- FK인 경우 추가


-- 2) 삭제 : ALTER TABLE 테이블명 DROP CONSTRAINT 제약조건명;

-- * 제약조건 자체를 수정하는 구문은 별도 존재하지 않음!
--> 삭제 후 추가를 해야함.


-- DEPARTMENT 테이블 복사(컬럼명, 데이터타입, NOT NULL만 복사)
CREATE TABLE DEPT_COPY AS SELECT * FROM DEPARTMENT;

SELECT * FROM DEPT_COPY;

-- DEPT_COPY의 DEPT_TITLE 컬럼에 UNIQUE 추가
ALTER TABLE DEPT_COPY
ADD CONSTRAINT DEPT_COPY_TITLE_U UNIQUE(DEPT_TITLE);

-- DEPT_COPY의 DEPT_TITLE 컬럼에 UNIQUE 삭제
ALTER TABLE DEPT_COPY
DROP CONSTRAINT DEPT_COPY_TITLE_U;



-- *** DEPT_COPY의 DEPT_TITLE 컬럼에 NOT_NULL 제약조건 추가/삭제 ***
ALTER TABLE DEPT_COPY
ADD CONSTRAINT DEPT_COPY_TITLE NN NOT NULL(DEPT_TITLE);
--ORA-01735: 부적합한 ALTER TABLE 옵션입니다
--> NOT NULL 제약조건은 새로운 조건을 추가하는 것이 아닌
-- 컬럼 자체에 NULL 허용/비허용을 제어하는 성질 변경의 형태로 인식됨.

-- MODIFY (수정하다) 구문을 사용해서 NULL 제어
ALTER TABLE DEPT_COPY
MODIFY DEPT_TITLE NOT NULL; -- DEPT_TITLE 컬럼을 NOT NULL로 수정

ALTER TABLE DEPT_COPY
MODIFY DEPT_TITLE NULL;

------------------------------------------------------------------------------

-- 2. 컬럼(추가/수정/삭제)

-- 컬럼 추가
-- ALTER TABLE 테이블명 ADD(컬럼명 데이터타입 [DEFAULT '값']);

-- 컬럼 수정
-- ALTER TABLE 테이블명 MODIFY 컬럼명 데이터타입; --> 데이터 타입 변경

-- ALTER TABLE 테이블명 MODIFY 컬럼명 DEFUALT '값'; --> DEFAULT 값 변경

-- 컬럼 삭제
-- ALTER TABLE 테이블명 DROP (삭제할 컬럼명);
-- ALTER TABLE 테이블명 DROP COLUMN 삭제할 컬럼명;

SELECT * FROM DEPT_COPY;

-- CNAME 컬럼 추가
ALTER TABLE DEPT_COPY ADD (CNAME VARCHAR2(30));

SELECT * FROM DEPT_COPY;

-- LNAME 컬럼 추가 (기본값 '한국')
ALTER TABLE DEPT_COPY ADD (LNAME VARCHAR2(30) DEFAULT '한국');

SELECT * FROM DEPT_COPY;
--> 컬럼이 생성되면서 DEFAULT 값이 자동 삽입됨.

-- D10 개발 1팀 추가
INSERT INTO DEPT_COPY 
VALUES ('D10', '개발1팀', 'L1', DEFAULT, DEFAULT);

-- 열에 대한 값이 너무 큼(실제: 3, 최대값: 2)

ALTER TABLE DEPT_COPY MODIFY LNAME DEFAULT 'KOREA';

ALTER TABLE DEPT_COPY DROP(LNAME);

-- 컬럼 삭제 시 유의사항
-- 테이블이란 행광 ㅕㄹ로 이루어지 DB의 가장 기본적인 객체 테이블에 데이터가 저장됨
-- 테이블은 최소 1개 이상의 컬럼이 존재해야 되기 때문에 모든 컬럼을 다 삭제할 순 없다.

DROP TABLE MMTO -------- MU ULL

---------------------------------------------

-- DDL 주의사항
// 1) DDL은 COMMIT/ROLLBACK이 되지 않는다.
--> ALTER, DROP을 신중하게 진행해야함.




SELECT * FROM TB2;

COMMIT;

DML
INSERT INTO















































