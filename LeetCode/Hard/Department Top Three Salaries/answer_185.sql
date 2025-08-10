# 2025-08-10 14:20 1차 시기
WITH TOP3_FILTER AS (
    SELECT D.name AS Department, E.name AS Employee, Salary,
            DENSE_RANK() OVER (PARTITION BY departmentId ORDER BY Salary DESC) AS rnk
            FROM Employee E JOIN Department D ON E.departmentId = D.id
)
SELECT Department, Employee, Salary
FROM TOP3_FILTER
WHERE rnk <= 3
ORDER BY Department, Salary DESC ;

늘 하던 대로 WITH문으로 선 필터링을 하고 메인쿼리에서 2차 필터링을 하는 구조로 작성
이렇게 하니 실행 속도가 하위 5%가 찍혀서 FROM, JOIN 절에서의 필터링을 구상

# 2025-08-10 14:25 2차 시기

SELECT Department, Employee, Salary
FROM (
    SELECT D.name AS Department, E.name AS Employee, Salary,
    DENSE_RANK() OVER (PARTITION BY departmentId ORDER BY Salary DESC) AS rnk
    FROM Employee E JOIN Department D ON E.departmentId = D.id
) AS K
WHERE rnk <= 3
ORDER BY Department, Salary DESC ;

FROM 절에서 미리 필터링을 하고 추가적으로 WHERE를 거쳐서 데이터의 최초 취급량을 줄이는 방식 선택
FROM 절에서 서브쿼리를 처리한 시도가 처음으로 성공했다!
실행 속도를 올리고자 한다면 따올 데이터 수를 줄이는 FROM 서브쿼리가 가장 좋다는 것이 입증됨!
