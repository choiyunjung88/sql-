/*
 * SUBQUERY (서브쿼리)
 * - 하나의 SQL문 안에 포함된 또다른 
 * 
 * 
 * 
 * 
 * 
 * 
 * 
 * 
 * 
 * */



-----------------------------------------
/*
 * 서브 쿼리 유형
 * - 단일 행, 탈이 '단일 행, 
 * SELECTL
 * 
 * 
 * 
 * 
 * */






-- 노옹철 사원의 급여보다 많이 받는 직원의 
--사번, 이름, 무지개ㅑ
 SELECT MAX(SUM(SALARY))
 FROM EMPLOYEE e CH===R UR








-- 위의 두 쿼리를 합쳐 부서별 급여 하ㅏㅂ이 큰 부서의
        
 
 
 
 
 -
 --- IN/ NOT IN : 여러개의 결과값들
 
 
 -- 부서별 최고 급여를 받는 직원의
 ㅑ


 
 --사수에 해당하는 직원에 대해 조회
 -- 사번, 이름,가막 SEL


-- ANY : 가장 작은 밥잇티ㅣ나오면 돼ㅣ 니가ㅣ
 
 
 
 SELECT EMP_ID, EMP_NAME, JOB_NAME, SALARY
 FROM EMP_01 e LWE
 
 
-- DNLDML RUFRHKRKTRJDEBT PPZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ
 
 --1. 연습문제
 -- 노옹철 사원과 같은 부서, 같은 직급인 사원을 조회(단, 노옹철 제외)
 -- 사번, 이름, 코드, 부서명 , 직급명
 SELECT EMP_NO, EMP_NAMEKDREE
 FROM EMPLOYEE




 
 -- 직급별 평균금여 ㅣ 
 SELERY  AH34, FLFMAQUDRJS E7L3;
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 ----------------------------------------------------------------
 
 --5. 상[호연]관 서브쿼리
 -- 상관 쿼리는 메인쿼리가 사용하는 테이블값을 서브쿼리가 이용해서 결과를 만듦
 -- 메인쿼리의 테이블값이 변경되면 서브쿼리의 결과값도 바뀌게 되는 구조
 
 -- 상관쿼리는 먼저 메인쿼리 한 행을 조회하고
 -- 해당 행이 서브쿼리의 조건을 충족하는 확인하여 SELECT를 진행함
 
 -- ** 해석 순서가 기존 서브쿼리와 다르게
 -- 메인쿼리 1행 -> 1행에 대한 서브쿼리 수행
 -- 메인쿼리 2행 -> 2행에 대한 서브쿼리 수행
 -- ...
 -- 메인쿼리의 행의 수 만큼 서브뭐리가 생성되어 진행됨
 
 
 -- 직급별 급여 평균보다 급여를 많이 받는 직원의
 -- 이름, 직급코드, 급여 조회
 
 -- 메인쿼리
 SELECT EMP_NAME, JOB_CODE, SALARY
 FROM EMPLOYEE;
 
 -- 서브쿼리 - 직급별 급여 평균
SELECT AVG(SALARY)
FROM EMPLOYEE
WHERE JOB_CODE ='J1';
 
/* 1. 메인쿼리에서 우선 1행을 읽음 (선동일)
 * --> 선동일은 JOB_CODE가 'J1'이고, SALARY가 8백만임
 * 
 * 2. 서브쿼리에서 선동일 직급인 'J1'의 평균 급여를 조회함
 * --> 'J1' 직급의 평균 급여는 8백만임
 * 
 * 3. 메인쿼리가 서브쿼리의 수행결과를 이용하여
 *    선동일이 평균 급여보다 초과하여 받는지 판별함.
 *     --> 선동일은 J1이고, 평균급여보다 초과하여 받지 않음.
 * 
 * 결론: 선동일은 조건을 만족하지 않으므로 메인쿼리가
 *        선동일을 RESULT SET에서 제외함
 * 
 * 다음... --------------------------------------------------
 * 
 * 1. 메인쿼리에서 다음 1행을 읽음(2행 - 송종기)
 * --> 송종기는 'J2'이고 6백만 받음
 * 
 * 2. 서브쿼리에서 'J2'의 평균 급여를 조회함
 * --> 'J2'의 평균급여 485만임
 * 
 * 3. 메인쿼리가 서브쿼리의 수행결과를 이용하여
 *    송종기가 평균 급여보다 초과하여 받는지 판별함
 *    --> 송종기는 J2이고, 평균 급여보다 초과하여 받음 (600>485)
 * 
 * 결론: 송종기는 조건을 만족하므로 메인쿼리가
 *       송종기의 EMP_NAME, JOB_CODE, SALARY 반환
 *       --> RESULT SET에 포함됨 
 * */
 
 SELECT EMP_NAME, JOB_CODE, SALARY
 FROM EMPLOYEE MAIN
 WHERE SALARY > (SELECT AVG(SALARY)
								 FROM EMPLOYEE SUB
								 WHERE MAIN.JOB_CODE = SUB.JOB_CODE);
 
 
-- 사수가 있는 직원의 사번, 이름, 부서명, 사수사번 조회

-- 메인쿼리
SELECT EMP_ID, EMP_NAME, DEPT_TITLE, MANAGER_ID
FROM EMPLOYEE
LEFT JOIN DEPARTMENT ON (DEPT_CODE = DEPT_ID);

-- 서브쿼리
SELECT EMP_ID
FROM EMPLOYEE
WHERE MANAGER_ID = 214;
 /* 사수가 200번(방명수)인 사원의 EMP_ID가
  * 201, 204, 207, 211, 214 임
  * 이 번호들이 메인쿼리의 EMP_ID에 존재하면 조회결과에 포함
  * 
  * 메인쿼리 조회하면 216, 217 모두 존재하는 사원
  * 그러면 RESULT SET 포함
  * 
  * */
 
 SELECT EMP_ID, EMP_NAME, DEPT_TITLE, MANAGER_ID
FROM EMPLOYEE MAIN
LEFT JOIN DEPARTMENT ON (DEPT_CODE = DEPT_ID)
WHERE MANAGER_ID IN (SELECT EMP_ID
										 FROM EMPLOYEE SUB
										 WHERE MAIN.MANAGER_ID = SUB.EMP_ID);
 
 
 
 
 SELECT EMP_ID, EMP_NAME, DEPT_TITLE, MANAGER_ID
FROM EMPLOYEE MAIN
LEFT JOIN DEPARTMENT ON (DEPT_CODE = DEPT_ID)
WHERE MANAGER_ID IN (SELECT EMP_ID
										 FROM EMPLOYEE SUB
										 WHERE MAIN.MANAGER_ID = SUB.EMP_ID);
										
						
										
										
										
										
										
										






-----------------------------------------------------------
--6. TMZKFK ZMQNLL

										
-- 모든 사원의 사번, 이름, 관리자 사번, 관리자 사번, 관리자 명을 조회
-- 단 관리자가 없는 경우 없음으로 표시
-- 스칼라 + 상관 쿼리	
										
SELECT EMP_ID, EMP_NAME, MANAGER_ID, 
NVL((SELECT EMP_NAME 
FROM EMPLOYEE SUB
WHERE SUB.EMP_ID = MAIN.MANAGER_ID), 
'없음')  관리자명
FROM EMPLOYEE MAIN;
										
--------------------------------------------------------------------------

-- 7. 인라인 뷰
-- FROM절에서 서브쿼리를 사용하는 경우로
-- 서브쿼리가 만든 결과의 집합을 테이블 대신에 사용한다.

-- 서브쿼리
SELECT EMP_NAME 이름, DEPT_TITLE 부서
FROM EMPLOYEE
JOIN DEPARTMENT ON (DEPT_CODE = DEPT_ID);

--부서가 기술지원부인 모든 컬럼 조회
SELECT * FROM (SELECT EMP_NAME 이름, DEPT_TITLE 부서
FROM EMPLOYEE
JOIN DEPARTMENT ON (DEPT_CODE = DEPT_ID))
WHERE 부서 = '기술지원부';

-- 인라인뷰를 활용한 TOP-N 분석
-- 전 직원 중 급여가 높은 상위 5명의 
-- 순위, 이름, 급여 조회

-- ROWNUM컬럼 : 행 번호를 나타내는 가상 컬럼                                                                                                                                                                                                                                                                                                                                                                                                                                               
-- SELECT, WHERE, ORDER

SELECT ROWNUM, EMP_NAME, SALARY
FROM (SELECT EMP_NAME, SALARY
      FROM EMPLOYEE
      ORDER BY SALARY DESC)
WHERE ROWNUM <= 5;

-- 급여 평균이 3위안에 드는 부서의
-- 부서코드와 부서명, 평균 급여 조회
SELECT ROWNUM, DEPT_CODE, DEPT_TITLE, 평균급여
FROM (SELECT DEPT_CODE,DEPT_TLTLE,AD
      FROM EMPLOYEE
      ORDER BY SALARY DESC)
WHERE ROWNUM <= 3;

										
										
									---------------------------
									
-- 8. WITH
-- 서브쿼리에 이름을 붙여주고 사용시 이름을 사용하게 함
-- 스위 











----------------------------


9.  RANK OVER
										
										












										
										