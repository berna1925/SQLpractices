# 2025-07-23 18:10
SELECT ID, EMAIL, FIRST_NAME, LAST_NAME
FROM DEVELOPERS AS D
WHERE (SKILL_CODE & (SELECT S.CODE FROM SKILLCODES AS S WHERE NAME = 'Python') != 0)
      OR (SKILL_CODE & (SELECT S.CODE FROM SKILLCODES AS S WHERE NAME = 'C#') != 0)
ORDER BY ID ;

# 공통점이 없는 두 테이블에 JOIN이 필요 없다는 것을 알고 다르게 접근한 것이 좋았음
# 다만 WHERE 절이 지나치게 지저분하며 숫자끼리의 & 조건만 우선 괄호로 감싸주는 것을 놓쳤음
# WITH 절로 미리 잡다한 코드를 정리하고 들어가는 것이 좋다는 권고

===========================================================================================

# SELECT D.ID, D.EMAIL, D.FIRST_NAME, D.LAST_NAME
# FROM DEVELOPERS D
# WHERE (D.SKILL_CODE & 256) > 0 
#     OR (D.SKILL_CODE & 1024) > 0
#      OR (D.SKILL_CODE & 1280) > 0 
# ORDER BY D.ID;

# SELECT d.ID, d.EMAIL, d.FIRST_NAME, d.LAST_NAME
# FROM DEVELOPERS d
# WHERE d.SKILL_CODE & (SELECT SUM(CODE) FROM SKILLCODES WHERE NAME IN ('Python', 'C#')) > 0
# ORDER BY d.ID;









