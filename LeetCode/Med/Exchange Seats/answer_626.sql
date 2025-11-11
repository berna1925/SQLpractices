# 2025-11-11 11:00 자력 해결 실패
WITH ODD AS (
SELECT id - 1 AS id , student
FROM Seat
WHERE id % 2 = 0
)
, EVEN AS (
SELECT id , student
FROM Seat
WHERE id % 2 = 1
)

SELECT *
FROM ODD

UNION

SELECT *
FROM EVEN


- 아예 어떻게 순서를 재배열할지 생각이 떠오르지 않아 실패

# 다른 사람의 풀이
select case when id % 2 =1 and id+1 in (select id from Seat) then id+1
            when id % 2 =0 then id-1
            else id
        end as id, student
        from Seat
        order by id;

- CASE WHEN을 써서 ID 열만 임의로 사용자가 값을 규칙에 따라 변경하는 방식을 채택
- 일정 비율이나 숫자만큼 변화하는 것이라면 떠올랐겠지만 안타깝게도 창의력이 미치지 못함..
- CASE WHEN의 유연성을 일깨운 사례
