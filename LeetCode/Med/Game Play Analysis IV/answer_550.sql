# 2025-08-11 13:55 자력 해결 실패
WITH FILTER AS (
    SELECT 
        a.player_id,
        CASE WHEN DATE_ADD(MIN(a.event_date), INTERVAL 1 DAY) 
                 IN (SELECT event_date 
                     FROM Activity b 
                     WHERE b.player_id = a.player_id)
             THEN 1 ELSE 0 END AS CNT
    FROM Activity a
    GROUP BY a.player_id
)
SELECT ROUND(SUM(CNT) / COUNT(*), 2) AS fraction
FROM FILTER;

DATE_ADD(DATE, INTERVAL N PERIODS)의 활용법을 몰라서 풀 수가 없었음
그래도 자료 형태를 바꿔서 집계하려 한 것은 좋은 사고방식
시간 관련 함수는 헷갈리는 것이 많아 정확히 외워야!
