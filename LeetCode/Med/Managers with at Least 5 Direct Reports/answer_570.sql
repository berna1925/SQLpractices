# 2025-08-11 14:50 자력 90% GPT 10%
WITH FILTER AS (
SELECT id, PN AS name
FROM (
    SELECT P.id AS id, P.name AS PN, C.name AS CN
FROM Employee P LEFT JOIN Employee C ON P.id = C.managerId
) AS T
WHERE T.CN IS NOT NULL
GROUP BY id
HAVING COUNT(T.CN) >= 5
)
SELECT name
FROM FILTER
UNION ALL
SELECT NULL
WHERE NOT EXISTS (SELECT 1 FROM FILTER);

===================== 대안적 풀이 ==============================
  
SELECT a.name 
FROM Employee a 
JOIN Employee b ON a.id = b.managerId 
GROUP BY b.managerId 
HAVING COUNT(*) >= 5

부모-자식 관계라고 해서 무턱대로 LEFT JOIN만 쓰면 안 된다!
LEFT JOIN은 부모의 자식 여부를 한눈에 보여줄 수 있지만 단순 관계만 알고자 할 땐 INNER JOIN만으로 충분
  
