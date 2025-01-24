# SELECT ID, N.FISH_NAME, LENGTH
# FROM FISH_INFO I JOIN FISH_NAME_INFO N ON I.FISH_TYPE = N.FISH_TYPE
# WHERE LENGTH IN
# (SELECT MAX(LENGTH) FROM FISH_INFO GROUP BY I.FISH_TYPE)
# ORDER BY ID ;

# FROM절이 WHERE절보다 논리적으로 앞에 있기는 하나 서브쿼리는 메인쿼리와 독립적인 메모리 공간을 쓰기 때문에 먼저 선언해도 인식을 하지 못한다.
# 그래서 서브쿼리 내에서 쓰려면 FISH_INFO.FISH_TYPE 이렇게 써야 한다.

WITH RankedFishes AS (
    SELECT
        F.ID,
        F.FISH_TYPE,
        F.LENGTH,
        N.FISH_NAME,
        RANK() OVER (PARTITION BY F.FISH_TYPE ORDER BY F.LENGTH DESC, F.ID ASC) AS RANKING
    FROM
        FISH_INFO F
    JOIN
        FISH_NAME_INFO N
    ON
        F.FISH_TYPE = N.FISH_TYPE
)
# 서브쿼리 활용이 애매할 때는 WITH AS 절을 써서 임시 테이블을 구성하고 거기에 가상의 임시 칼럼을 꾸려 값을 데려오는 것도 방법이다!
SELECT
    ID,
    FISH_NAME,
    LENGTH
FROM
    RankedFishes
WHERE
    RANKING = 1
ORDER BY
    ID ASC;
