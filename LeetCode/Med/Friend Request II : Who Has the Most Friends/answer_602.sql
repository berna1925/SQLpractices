# 2025-08-17 14:30 자력 해결
FROM절에 서브쿼리를 넣는 구조를 이중으로 도입해 풀이하려 했으나 오류 반복으로
WITH 서브쿼리를 먼저 만든 다음 메인쿼리에서 필터링하는 방식을 채택
  
WITH FILTER AS (
    SELECT FOR_COUNT AS ID, COUNT(FOR_COUNT) AS NUM
    FROM (
        SELECT requester_id AS FOR_COUNT
        FROM RequestAccepted R1

        UNION ALL

        SELECT accepter_id
        FROM RequestAccepted R2
    ) C
    GROUP BY FOR_COUNT
) 
SELECT ID AS id, NUM AS num
FROM FILTER
WHERE FILTER.NUM = (SELECT MAX(FILTER.NUM)
                    FROM FILTER)


** 챗GPT가 추천한 풀이
WITH F AS (
    SELECT user_id, COUNT(*) AS num
    FROM (
        SELECT requester_id AS user_id FROM RequestAccepted
        UNION ALL
        SELECT accepter_id FROM RequestAccepted
    ) T
    GROUP BY user_id
)
SELECT user_id, num
FROM (
    SELECT user_id, num,
           DENSE_RANK() OVER (ORDER BY num DESC) AS rnk
    FROM F
) ranked
WHERE rnk = 1;


DENSE_RANK로 동점자를 모두 반환하겠다는 점을 더 뚜렷하게 하는 방식
MAX를 써도 괜찮지만 이렇게 하는 방법도 있다는 점
