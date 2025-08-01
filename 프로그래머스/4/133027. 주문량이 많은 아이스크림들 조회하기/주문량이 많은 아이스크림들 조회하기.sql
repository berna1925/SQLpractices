# 2025-08-01 자력 해결
# 처음으로 WITH를 2회 이상 사용해 문제를 푼 케이스
# 두 테이블에 있는 정보를 합산해야 한다는 점을 이용해 아예 두 테이블을 물리적으로 병합해버리고 합산한 전략이 유효
    
WITH CAT_TABS AS (
SELECT * FROM FIRST_HALF

UNION ALL

SELECT * FROM JULY
),

SUMMARY AS (
SELECT C.FLAVOR, SUM(C.TOTAL_ORDER) AS TOTAL_SUM
FROM CAT_TABS C
GROUP BY C.FLAVOR
)    
    
SELECT FLAVOR FROM SUMMARY
ORDER BY TOTAL_SUM DESC
LIMIT 3 ;
    
    
