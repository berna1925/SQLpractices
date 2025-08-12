# 2025-08-12 21:20 자력 해결 실패
WITH FILTER AS (
    SELECT pid, tiv_2015, tiv_2016, lat, lon
    FROM Insurance
    WHERE tiv_2015 IN (SELECT tiv_2015
                        FROM Insurance
                        GROUP BY tiv_2015
                        HAVING COUNT(*) > 1)
)
SELECT ROUND(SUM(tiv_2016), 2) AS tiv_2016
FROM FILTER
WHERE (lat, lon) IN (
        SELECT lat, lon
        FROM Insurance
        GROUP BY lat, lon
        HAVING COUNT(*) = 1);

HAVING의 쓰임을 자꾸 까먹는 부실한 기초 실력...
HAVING만 연상했어도 쉽게 풀 수 있었던 문
