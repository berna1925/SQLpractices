# 2025-11-10 10:50 자력 도출 답안
SELECT E.name, B.bonus
FROM Employee E LEFT JOIN Bonus B ON E.empId = B.empId
WHERE bonus < 1000 OR bonus is null ;

