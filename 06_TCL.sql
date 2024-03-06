-- TCL (TRANSACTION CONTROL LANGUAGE) : 트랜젝션 제어언어
-- COMMIT(트랜젝션 종료 후 저장)

-- EML
/*
 * TRANSACTION 이란?
 * - 데이터 베이스의 논리적 연산 단위
 * - 데이터 변경 사항을 묶어서 하나의 트랜잭션에 담아 처리함.
 * - 트랜지션의 대상이 되는 데이터 변경 사항 : INSERT, UPDATE, DELETE, MERGE
 * 
 * INSERT 수행 ------------------------------> DB 반영 (X)
 * 
 * INSERT 수행 --------> 트랜잭션에 추가 --> COMMIT ----> DB 반영 (O)
 * 
 * INSERT 10번 수행 ---> 1개 트랜직션에 10개 추가 --> ROLLBACK --> DB 반영 (X)
 * 
 * 1) COMMIT : 메모리 버퍼(트랜잭션)에 임시 저장된 데이터 변경 사항을 DB에 반영
 * 
 * 2) ROLLBACK : 메모리 버퍼 (트랜잭션)에 임시 저장된 데이터 변경 사항을 삭제하고
 *               마지막 COMMIT 상태로 돌아감 (DB에 변경 내용 반영 X)
 * 
 * 3) SAVEPOINT : 메모리 버퍼(트랜잭션)에 저장 지점을 정의하여
 *                ROLLBACK 수행 시 전체 작업을 삭제하는 것이 아닌
 *                저장 지점까지만 일부 ROLLBACK
 * 
 * [SAVEPOINT 사용법]
 * 
 * ...
 * SAVEPOINT "포인트명1";
 * 
 * ...
 * SAVEPOINT "포인트명2";
 * 
 * ...
 * ROLLBACK TO "포인트명1"; -- 포인트1 지점까지 데이터 변경사항 삭제
 * 
 *  ** SAVEPOINT 지정 및 호출 시 이름에 ""(쌍다옴표) 붙여야함 !!!**
 *  
 * */

-- 새로운 데이터 INSERT
SELECT * FROM DEPARTMENT2;

INSERT INTO DEPARTMENT2 VALUES('T1', '개발1팀', 'L2');
INSERT INTO DEPARTMENT2 VALUES('T2', '개발2팀', 'L2');
INSERT INTO DEPARTMENT2 VALUES('T3', '개발3팀', 'L2');

-- INSERT 확인
SELECT * FROM DEPARTMENT2;

--> DB에 반영된것처럼 보이지만
-- 실제로 아직 DB 반영된 것 아님

--> SQL 수행 시 트랜잭션 내용도 포함해서 수행된다.

ROLLBACK;
SELECT * FROM DEPARTMENT2;

-- COMMIT 후 ROLLBACK이 되는 지  확인


------------------------------------------------------------------ 

-- SAVE PIO=IN

SELECT * FROM DEPARTMENT2;











