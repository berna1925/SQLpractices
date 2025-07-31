# 2025-07-31 15:30 자력 해결
WITH GRADE_TABLE AS (
    SELECT EMP_NO,
    # CASE WHEN문의 작성 결과를 바로 오른쪽 열에서 사용은 불가능
    # 베이스가 될 열을 CASE WHEN으로 미리 연산해 WITH나 VIEW에 저장해 놓고 JOIN으로 연동해 메인쿼리에서 활용해야
        CASE WHEN AVG(SCORE) >= 96 THEN 'S'
             WHEN AVG(SCORE) >= 90 THEN 'A'
             WHEN AVG(SCORE) >= 80 THEN 'B'
         ELSE 'C' END AS GRADE
    FROM HR_GRADE G
    GROUP BY G.EMP_NO
)    
    
SELECT
    E.EMP_NO,
    E.EMP_NAME,
    GT.GRADE,
    CASE WHEN GT.GRADE = 'S' THEN E.SAL * 0.2
         WHEN GT.GRADE = 'A' THEN E.SAL * 0.15
         WHEN GT.GRADE = 'B' THEN E.SAL * 0.1
         ELSE 0 END AS BONUS
FROM HR_EMPLOYEES AS E
JOIN GRADE_TABLE AS GT
ON E.EMP_NO = GT.EMP_NO
GROUP BY E.EMP_NO, E.EMP_NAME
ORDER BY 1 ;



# WITH GRADING AS (
#     SELECT E.EMP_NO, E.EMP_NAME, SAL,
#             CASE WHEN AVG(SCORE) >= 96 THEN 'S'
#                  WHEN AVG(SCORE) >= 90 THEN 'A'
#                  WHEN AVG(SCORE) >= 80 THEN 'B'
#             ELSE 'C' END AS GRADE
#     FROM HR_EMPLOYEES E JOIN HR_GRADE G ON E.EMP_NO = G.EMP_NO
#     GROUP BY E.EMP_NO
#     )

# SELECT G.EMP_NO, G.EMP_NAME, GRADE,
#        CASE WHEN GRADE = 'S' THEN SAL * 0.2
#             WHEN GRADE = 'A' THEN SAL * 0.15
#             WHEN GRADE = 'B' THEN SAL * 0.1
#        ELSE 0 END AS BONUS
# FROM GRADING G
# ORDER BY G.EMP_NO ;

