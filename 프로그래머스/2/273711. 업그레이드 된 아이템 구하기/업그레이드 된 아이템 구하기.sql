# 2025-07-24 못 푼 문제
# 예전부터 약점이었던 계층 구조 문제에서 발목
SELECT ITEM_ID, ITEM_NAME, RARITY
FROM ITEM_INFO 
WHERE ITEM_ID IN (SELECT T.ITEM_ID
                 FROM ITEM_TREE T
                 JOIN ITEM_INFO I
                 ON T.PARENT_ITEM_ID = I.ITEM_ID
                 WHERE I.RARITY = 'RARE')

# 서브쿼리를 쓰는 문제는 항상 단일한 행이 나오도록 출력 값을 정해줘야 함
# 그러나 비교 연산자가 =가 아니라 IN이라면 리스트 안에 있는 값 중 조건을 만족하는 모든 값을 선택 가능
# 서브쿼리 오류를 보고 아예 서브쿼리를 쓸 생각을 못한 것이 문제
  
ORDER BY ITEM_ID DESC;





# SELECT I.ITEM_ID, ITEM_NAME, RARITY
# FROM ITEM_INFO AS I LEFT JOIN ITEM_TREE AS T ON I.ITEM_ID = T.PARENT_ITEM_ID
# WHERE I.RARITY = 'RARE'
# ORDER BY I.ITEM_ID DESC ;
