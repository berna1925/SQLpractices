# 2025-07-28 17:50 자력으로 해결한 문제
# FrontEnd 카테고리에 있는 코드 특성 중 하나라도 갖고 있으면 공통분모가 나오도록 하기 위해 SUM과 &를 조합
    
WITH FILTER AS (
    SELECT CATEGORY, SUM(S.CODE) AS SKILLSETS
    FROM SKILLCODES AS S
    GROUP BY CATEGORY
    HAVING CATEGORY = 'Front End'
)

SELECT ID, EMAIL, FIRST_NAME, LAST_NAME
FROM DEVELOPERS
WHERE SKILL_CODE & (SELECT SKILLSETS FROM FILTER) != 0
ORDER BY ID ;


# WITH CODES AS (
#     SELECT CODE
#     FROM SKILLCODES
#     WHERE CATEGORY = 'Front End')

# SELECT ID, EMAIL, FIRST_NAME, LAST_NAME
# FROM DEVELOPERS D, CODES
# WHERE D.SKILL_CODE & CODES.CODE > 0
# ORDER BY ID ;

# SELECT D.ID, D.EMAIL, D.FIRST_NAME, D.LAST_NAME
# FROM DEVELOPERS D
# WHERE EXISTS (SELECT * FROM SKILLCODES S
#               WHERE S.CATEGORY = 'Front End'
#               AND (d.SKILL_CODE & s.CODE) = s.CODE)
# ORDER BY D.ID;






