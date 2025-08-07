# 2025-08-07 14:10 자력 해결
SELECT name AS Customers
FROM Customers
WHERE id NOT IN (SELECT customerId FROM Orders);

오랜만에 서브쿼리를 이용한 풀이

#===================================================
better way to solve
1. JOIN 필터링
SELECT c.name AS Customers
FROM Customers c
LEFT JOIN Orders o ON c.id = o.customerId
WHERE o.id IS NULL;

tip1) IN은 모아 볼 범위 내에 NULL이 존재하면 NOT IN 연산이 전체 결과를 비워 버리는 문제가 있음
tip2) IN 연산에서 오류가 날 가능성을 억제하려면 JOIN, WHERE에서 필터링을 하는 것이 적절

2. NOT EXISTS 패턴
SELECT name AS Customers
FROM Customers c
WHERE NOT EXISTS (
    SELECT 1
    FROM Orders o
    WHERE o.customerId = c.id
);

tip3) 존재하지 않을 조건을 탐지할 때는 NOT IN보다 NOT EXISTS가 더욱 적절
tip4) 존재하는 조건을 찾을 때 IN, 존재하지 않는 조건을 찾을 땐 NOT EXISTS를 애용하자
