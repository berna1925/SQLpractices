# 2025-08-17 15:15 자력 해결
SELECT DISTINCT P.id,
       CASE WHEN P.p_id IS NULL THEN 'Root'
       WHEN C.id IS NULL THEN 'Leaf'
       ELSE 'Inner' END AS type
FROM Tree P LEFT JOIN Tree C ON P.id = C.p_id

WITH절의 유혹을 거부하고 최대한 한 쿼리로 작성하려는 노력이 성공
부모-자식 계층 구조를 만들어 놓은 상태에서 바로 그 구조의 데이터를 활용해 반환
