# 2025-07-24 한끝이 모자랐던 문제
SELECT ROUTE,
       CONCAT(ROUND(SUM(D_BETWEEN_DIST), 1), 'km') AS TOTAL_DISTANCE,
       CONCAT(ROUND(AVG(D_BETWEEN_DIST), 2), 'km') AS AVERAGE_DISTANCE
FROM SUBWAY_DISTANCE
GROUP BY ROUTE
ORDER BY ROUND(SUM(D_BETWEEN_DIST), 1) DESC ;

# 문제에서 요구하는 총 누적 거리 순이라는 말에 매몰되어 AS 이후의 칼럼명을 그대로 써버리는 바람에 컴퓨터가 순서 인식을 못함
# ORDER BY는 반드시 칼럼명이 아니어도 된다!
