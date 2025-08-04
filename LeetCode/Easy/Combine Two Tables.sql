# 리트코드 SQL 첫 번째 문제
# 너무 쉬운 문제라서 첨언은 스킵

SELECT firstName, lastName, city, state
FROM Person P LEFT JOIN Address A ON P.personId = A.personId
