# 2025-08-04 17:40
너무 쉬운 문제.

SELECT
    score,
    DENSE_RANK() OVER (ORDER BY score DESC) AS 'rank'
FROM Scores

DBMS에 따라 RANK, COUNT 등 예약어를 칼럼명으로 쓰지 못하는 경우가 있으니
이럴 때에는 ''를 습관적으로 달아주는 것이 현명하다
