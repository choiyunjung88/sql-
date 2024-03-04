
SELECT JOB_CODE, ROUND(AVG(SALARY)), COUNT(*) 
FROM EMPLOYEE
GROOP BY JOB_CODE
ORDER BY JOB_CODE;

--EMPLOYEE 테이블에서
--성별(남/여)와 각 성별 별 인원 수, 급여 합을
--인원 수 오름차순으로 조회

SELECT DECODE(SUBSTR (EMP_NO, 8, 1), '1', '남', '2', '여') 성별,
			COUNT(*) "인원 수",
			SUM(SALARY) "급여 합"
FROM EMPLOYEE
GROUP BY DECODE(SUBSTR(EMP_NO, 8, 1), '1', '남', '2', '여') -- 별칭사용 X (SELECT)
ORDER BY "인원 수"; -- 별칭 사용 O SELECT 절 해석 완료



-- EMPLOYEE 테이블에서 부서 코드가 D5, D6인 부서의 평균 급여, 인원 수 조회
SELECT DEPT_CODE, ROUND(AVG(SALARY)), COUNT(*)
FROM EMPLOYEE
WHERE DEPT_CODE IN ('D5', 'D6')
GROUP BY DEPT_CODE;


--EMPLOYEE 테이블에서 직급별 2000년도 이후 (2000년 포함) 입사자들의 급여합을 조회(직급코드 오름차순)
SELECT JOB_CODE ,SUM(SALARY)
FROM EMPLOYEE
WHERE HIRE_DATE >= TO_DATE('2000-01-01') 
--EXTRACT (YEAR FROM HIRE_DATE) >= 2000
--SUBSTR( TO_CHAR(HIRE_DATE, 'YYYY'), 1, 4) >= '2000'
GROUP BY JOB_CODE
ORDER BY 1;


-- * 여러 컬럼을 묶어서 그룹으로 지정 가능 --> 그룹 내 그룹이 가능하다!

-- *** GROUP BY 사용 시 주의 사항 ***
--> SELECT 문에 GROUP BY절을 사용할 경우
-- SELECT절에 명시한 조회하려는 컬럼 중
-- 그룹함수가 적용되지 않은 컬럼을
-- 모두 GROUP BY 절에 작성해야 함.


--EMPLOYEE 테이블에서 부서별로 같은 직급인 사원의 수를 조회
--부서코드 오름차순, 직급코드 내림차순

SELECT DEPT_CODE, JOB_CODE, COUNT(*)
FROM EMPLOYEE
GROUP BY DEPT_CODE, JOB_CODE --DEPT_CODE로 그룹을 나누고,
								--나눠진 그룹 내에서 JOB_CODE로 또 그룹을 분류
								--> 세분화
ORDER BY DEPT_CODE, JOB_CODE DESC;




-- HAVING절 : 그룹함수로 구해 올 그룹에 대한 조건을 설정할 때 사용
-- HAVING 컬럼명 | 함수식 비교연산자 비교값
-- 해석 순서 4번째
/*
 * 셀렉트 5
 * 프롬 1
 * 웨얼 2
 * 그룹 3
 * 해빙 4
 * 오더 6
 * 
 * 
 * */
;

-- 부서별 평균 급여가 3백만원 이상인 부서를 조회(부서코드 오름차순)
SELECT DEPT_CODE, AVG(SALARY) 
FROM EMPLOYEE
--WHERE SALARY >= 3000000 --> 한 사람의 급여가 3백만 이상이라는 조건(요구사한 X)
GROUP BY DEPT_CODE
HAVING AVG(SALARY)>= 3000000 --> DEPT_CODE 그룹 중 급여 평균이 3백만 이상인 그룹만 조회 
ORDER BY DEPT_CODE ;


--EMPLOYEE 테이블에서 직급별 인원수가 5명 이하인 직급코드, 인원 수 조회
--(직급ㅋ코드 오름 차순)
SELECT JOB_CODE , COUNT(*)
FROM EMPLOYEE
GROUP BY JOB_CODE
HAVING COUNT(*) <= 5
ORDER BY 1;

-- 집계 함수
-- 그룹별 산출 결과 제가 값을 저렴하게 계한 나의 모의ㅏ
채ㅕㅜㅅ EpHT=THFOSAKSDP TNF RJDML 













