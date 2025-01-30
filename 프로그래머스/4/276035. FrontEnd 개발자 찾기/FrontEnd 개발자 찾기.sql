# WITH CODES AS (
#     SELECT CODE
#     FROM SKILLCODES
#     WHERE CATEGORY = 'Front End')
  # WITH를 써서 참고할 테이블의 정보를 끌어오려고 한 접근 방식은 좋았음
  # 다만 밑의 메인쿼리에서 그 정보를 활용할 방법을 찾지 못했음

# SELECT ID, EMAIL, FIRST_NAME, LAST_NAME
# FROM DEVELOPERS D, CODES
# WHERE D.SKILL_CODE & CODES.CODE > 0
# ORDER BY ID ;


SELECT D.ID, D.EMAIL, D.FIRST_NAME, D.LAST_NAME
FROM DEVELOPERS D
WHERE EXISTS (SELECT * FROM SKILLCODES S
              WHERE S.CATEGORY = 'Front End'
              AND (D.SKILL_CODE & S.CODE) = S.CODE)
# 천적 중 하나인 EXISTS 절..
# 참고할 테이블에서 Front End에 걸려 있으면서 프런트엔드의 코드를 품고 있는 메인 테이블의 코드인 것만 통과하도록 설계
# SELECT 문에서 해당되는 경우의 수가 하나라도 있으면 EXISTS문의 결과는 TRUE가 되어 내부 조건을 WHERE절의 필터로 쓰게 됨
  
ORDER BY D.ID;
