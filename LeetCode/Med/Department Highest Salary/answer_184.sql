# 2025-08-07 14:35 자력 풀이
SELECT D.name AS Department, E.name AS Employee, salary AS Salary
FROM Employee E JOIN Department D ON E.departmentId = D.id
WHERE (departmentId, Salary) IN (SELECT departmentId, MAX(salary)
                                    FROM Employee
                                    GROUP BY departmentId)

서브쿼리에 이중 칼럼 조건을 넣어서 부서에서 최고 연봉을 가진 사람들만 추출하도록 설계
오랜만에 서브쿼리로 물샐 틈 없는 풀이

  
==========================**other way to solve**====================================
  
WITH Ranked AS (
    SELECT E.*, D.name AS Department,
           DENSE_RANK() OVER (PARTITION BY departmentId ORDER BY salary DESC) AS rnk
    FROM Employee E
    JOIN Department D ON E.departmentId = D.id
)
SELECT Department, name AS Employee, salary AS Salary
FROM Ranked
WHERE rnk = 1;

미리 부서별로 연봉 순위를 짜놓은 테이블을 임시쿼리로 구성
메인쿼리에서는 필터링만 수행하는 설계
