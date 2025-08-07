# 2025-08-07 13:50에 자력 해결
WITH FILTER AS (
    SELECT P.id, P.managerId, P.name AS Pname, P.salary AS Psalary,
        C.name AS Cname, C.salary AS Csalary 
    FROM Employee P LEFT JOIN Employee C ON P.id = C.managerId
)

SELECT Cname AS Employee
FROM FILTER
WHERE Psalary < Csalary


  
**Better way to solve**
WITH문 없는 버전

SELECT E.name AS Employee
FROM Employee E
JOIN Employee M ON E.managerId = M.id
WHERE E.salary > M.salary;

WITH 사용에 중독이 돼서 더 편한 방법조차 거부해버렸다..
