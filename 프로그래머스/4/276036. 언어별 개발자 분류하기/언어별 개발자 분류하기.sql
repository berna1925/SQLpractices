# 2025-07-28 못 푼 문제
# CODE의 이진수들을 보고 이진수에 너무 집착한 나머지 다른 풀이법을 생각 못했다..

SELECT 
  CASE
    WHEN SUM(CASE WHEN a.CATEGORY = 'Front End' THEN 1 ELSE 0 END) > 0 AND 
         SUM(CASE WHEN a.NAME = 'Python' THEN 1 ELSE 0 END) > 0 THEN 'A'
    # CASE WHEN 절 안에 또 CASE WHEN 절을 쓴 엄청난 창의력;
    # END는 조건이 몇 개 오든 그 외 조건을 무시하도록 하는 걸 이용해 1줄씩 깔끔하게 정리
    # 해당되는 곳을 1로 취급하게 하고 1이 반환된 곳을 
    WHEN SUM(CASE WHEN a.NAME = 'C#' THEN 1 ELSE 0 END) > 0 THEN 'B'
    WHEN SUM(CASE WHEN a.CATEGORY = 'Front End' THEN 1 ELSE 0 END) > 0 THEN 'C' 
  END AS GRADE,
  b.ID, 
  b.EMAIL
FROM SKILLCODES AS a JOIN DEVELOPERS AS b ON (a.CODE & b.SKILL_CODE) != 0
# ON절에 공통된 칼럼 외에 다른 것도 올 수 있단 걸 처음 알았다.. 알아둡시다
        
GROUP BY b.ID, b.EMAIL
HAVING GRADE IS NOT NULL
ORDER BY GRADE ASC, b.ID ASC;





# SELECT CASE WHEN (SKILL_CODE & (16 + 2048 + 8192)) != 0 AND
#                  (SKILL_CODE & 400) != 0 THEN 'A'
#             WHEN (SKILL_CODE & 1024) != 0 THEN 'B'
#             WHEN (SKILL_CODE & (16 + 2048 + 8192)) != 0 AND
#                  (SKILL_CODE & 400) = 0 THEN 'C' END AS GRADE,
#        ID, EMAIL
# FROM DEVELOPERS
# )
# SELECT * FROM BASE B
# WHERE B.GRADE IS NOT NULL
# ORDER BY GRADE, ID ;

# SELECT
# CASE WHEN
# (D.SKILL_CODE & 16 > 0) OR (D.SKILL_CODE & 2048 > 0) OR (D.SKILL_CODE & 8192 > 0)
# AND D.SKILL_CODE & 256 > 0
# THEN 'A'

# CASE WHEN D.SKILL_CODE & 1024 > 0
# THEN 'B'

# CASE ELSE 'C' END AS GRADE, ID, EMAIL
# FROM DEVELOPERS

# WITH FRONTEND_CODE AS (
#     SELECT SUM(CODE) AS CODE 
#     FROM SKILLCODES 
#     WHERE CATEGORY = 'Front End'
# ),
# PYTHON_CODE AS (
#     SELECT CODE 
#     FROM SKILLCODES 
#     WHERE NAME = 'Python'
# ),
# CSHARP_CODE AS (
#     SELECT CODE 
#     FROM SKILLCODES 
#     WHERE NAME = 'C#'
# )
# SELECT 
#     CASE 
#         WHEN d.SKILL_CODE & f.CODE > 0 AND d.SKILL_CODE & p.CODE > 0 THEN 'A'
#         WHEN d.SKILL_CODE & c.CODE > 0 THEN 'B'
#         WHEN d.SKILL_CODE & f.CODE > 0 THEN 'C'
#     END AS GRADE,
#     d.ID,
#     d.EMAIL
# FROM DEVELOPERS d
# JOIN FRONTEND_CODE f ON 1=1
# JOIN PYTHON_CODE p ON 1=1
# JOIN CSHARP_CODE c ON 1=1
# WHERE 
#     (d.SKILL_CODE & f.CODE > 0 AND d.SKILL_CODE & p.CODE > 0)
#     OR (d.SKILL_CODE & c.CODE > 0)
#     OR (d.SKILL_CODE & f.CODE > 0)
# ORDER BY GRADE, d.ID 

# WITH BASE AS (
