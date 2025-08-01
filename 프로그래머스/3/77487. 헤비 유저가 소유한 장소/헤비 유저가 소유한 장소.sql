# 2025-07-26 17:35
WITH FILTER AS (
    SELECT HOST_ID, COUNT(ID) AS COUNTS
    FROM PLACES
    GROUP BY HOST_ID
    HAVING COUNT(ID) >= 2
)
SELECT P.ID, P.NAME, P.HOST_ID
FROM PLACES AS P JOIN FILTER AS F ON P.HOST_ID = F.HOST_ID
ORDER BY P.ID