# 2025-08-10 15:20 자력 풀이 실패
WITH FILTER AS (
    SELECT request_at AS Day, city_id, status
    FROM Trips T JOIN Users U ON T.client_id = U.users_id
    WHERE banned = "No"

    INTERSECT

    SELECT request_at AS Day, city_id, status
    FROM Trips T JOIN Users U ON T.driver_id = U.users_id
    WHERE banned = "No"
),
TOTAL_CNT AS (
    SELECT Day, COUNT(status) AS CT
    FROM FILTER
    GROUP BY Day
),
G_CNT AS (
    SELECT Day, COUNT(status) AS CT
    FROM FILTER
    WHERE status IN ('cancelled_by_driver', 'cancelled_by_client')
    GROUP BY Day
)
SELECT T.Day, ROUND(G.CT / T.CT, 2) AS 'Cancellation Rate'
FROM TOTAL_CNT T JOIN G_CNT G ON T.Day = G.Day

이런 식으로 하면 3번째 WITH문에서 나온 GROUP BY가 취소된 건이 없는 날은 아예 집계 표시를 하지 않게 되어 표에서 빠지게 됨
어떻게 하면 건수가 없는 날도 COUNT를 써서 0이 나오게 할 수 있겠는지 고민해야 하는 문제

================================================ 대안적 풀이 ============================================================
*1번째 대안
WITH FILTER AS (
    SELECT T.request_at AS Day, T.status
    FROM Trips T
    JOIN Users UC ON T.client_id = UC.users_id AND UC.banned = 'No'
    JOIN Users UD ON T.driver_id = UD.users_id AND UD.banned = 'No'
    WHERE T.request_at BETWEEN '2013-10-01' AND '2013-10-03'

  # 2013-10-01 ~ 2013-10-03 사이의 허가 건수를 뽑아내고
  ),
TOTAL_CNT AS (
    SELECT Day, COUNT(*) AS total_count
    FROM FILTER
    GROUP BY Day
  # 일별 건수를 뽑고
),
G_CNT AS (
    SELECT Day, COUNT(*) AS cancel_count
    FROM FILTER
    WHERE status IN ('cancelled_by_driver', 'cancelled_by_client')
    GROUP BY Day
  # 일별 취소 건수를 뽑고
)
SELECT 
    T.Day, 
    ROUND(COALESCE(G.cancel_count, 0) * 1.0 / T.total_count, 2) AS `Cancellation Rate`
  # 나누는 방식은 내가 생각한 것과 동일
FROM TOTAL_CNT T
LEFT JOIN G_CNT G ON T.Day = G.Day
ORDER BY T.Day;

LEFT JOIN을 써서 NULL이 나오도록 한 다음 COALESCE로 NULL일 경우 0이 나오도록 환산하는 방식을 사용!
특정 방향 JOIN은 거의 항상 NULL이 나옴을 이용한 풀이

*2번째 대안
SELECT 
    T.request_at AS Day,
    ROUND(
        SUM(CASE WHEN T.status IN ('cancelled_by_driver', 'cancelled_by_client') THEN 1 ELSE 0 END) * 1.0 /
        COUNT(*),
        2
    ) AS `Cancellation Rate`
FROM Trips T
JOIN Users UC ON T.client_id = UC.users_id AND UC.banned = 'No'
JOIN Users UD ON T.driver_id = UD.users_id AND UD.banned = 'No'
WHERE T.request_at BETWEEN '2013-10-01' AND '2013-10-03'
GROUP BY T.request_at
ORDER BY T.request_at;

CASE WHEN에 경우의 수를 TRUE=1, FALSE=0으로 넣고 합산한 뒤 일별 개수로 나눠서 확률을 평균값으로 구한 천재적인 방법
결국 어떤 풀이든 3중 조인으로 서브쿼리 개수를 줄이는 전략이 유효


