-- 코드를 입력하세요
WITH BINDING AS (
    SELECT ANIMAL_ID, DATE_FORMAT(DATETIME, '%H') AS HOUR
    FROM ANIMAL_OUTS

SELECT HOUR, COUNT(ANIMAL_ID) AS COUNT
FROM BINDING
GROUP BY HOUR
ORDER BY 1 ;
# 이 코드는 입양 시간별로 입양 나간 마릿수를 구할 수는 있으나 문제에서 요구하는 건 입양이 없었던 시간대도 집계하는 것
# date_format은 이미 있는 자료의 형태를 변환하는 것이므로 함수적으로 적용해서는 답을 반환할 수 없음


WITH hours AS (
    SELECT 0 AS HOUR UNION ALL
    SELECT 1 UNION ALL
    SELECT 2 UNION ALL
    SELECT 3 UNION ALL
    SELECT 4 UNION ALL
    SELECT 5 UNION ALL
    SELECT 6 UNION ALL
    SELECT 7 UNION ALL
    SELECT 8 UNION ALL
    SELECT 9 UNION ALL
    SELECT 10 UNION ALL
    SELECT 11 UNION ALL
    SELECT 12 UNION ALL
    SELECT 13 UNION ALL
    SELECT 14 UNION ALL
    SELECT 15 UNION ALL
    SELECT 16 UNION ALL
    SELECT 17 UNION ALL
    SELECT 18 UNION ALL
    SELECT 19 UNION ALL
    SELECT 20 UNION ALL
    SELECT 21 UNION ALL
    SELECT 22 UNION ALL
    SELECT 23
)
# WITH문으로 가상의 데이터를 먼저 만든 다음에 붙인다는 발상은 좋았음
# 그런데 없는 데이터를 어떻게 만들지를 생각해내지 못한 것이 문제
# JOIN은 물론이고 UNION도 생각보다 활용 방법이 다양하다. 이것을 어떻게 활용할지 생각하는 것도 유익할 듯하다.
# 파이썬에 CONCAT이 있다면 SQL엔 UNION ALL이 있다. 수직으로 붙일 때는 바로 UNION을 생각하자.
    
SELECT h.HOUR, COUNT(ao.ANIMAL_ID) AS COUNT
FROM hours h
LEFT JOIN ANIMAL_OUTS ao
    ON HOUR(ao.DATETIME) = h.HOUR
GROUP BY h.HOUR
ORDER BY h.HOUR;
