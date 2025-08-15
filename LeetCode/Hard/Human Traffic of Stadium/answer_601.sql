# 2025-08-15 15:35 자력 풀이 실패
크로스 조인만 생각하다 쉽게 생각할 수 있는 방법인 LAG, LEAD 함수를 생각하지 못해 실패
  
WITH cte AS (
    SELECT id, visit_date, people,
          LAG(people, 1) OVER (ORDER BY id) AS prev1,
          LAG(people, 2) OVER (ORDER BY id) AS prev2,
          LEAD(people, 1) OVER (ORDER BY id) AS next1,
          LEAD(people, 2) OVER (ORDER BY id) AS next2
    FROM Stadium
)
SELECT id, visit_date, people
FROM cte
WHERE people >= 100
  AND (
      (prev1 >= 100 AND prev2 >= 100) 
      OR (prev1 >= 100 AND next1 >= 100)
      OR (next1 >= 100 AND next2 >= 100)
  )
ORDER BY visit_date;

연속된 값을 추출해야 할 때는 LAG와 LEAD로 밀고 당기기를 해서 추출하는 것이 가장 빠른 방법
