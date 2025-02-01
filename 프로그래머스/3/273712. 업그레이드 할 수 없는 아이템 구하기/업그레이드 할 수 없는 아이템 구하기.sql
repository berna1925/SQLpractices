SELECT I.ITEM_ID, ITEM_NAME, RARITY
FROM ITEM_INFO I JOIN ITEM_TREE T ON I.ITEM_ID = T.ITEM_ID
WHERE I.ITEM_ID IN
  (SELECT P.ITEM_ID
  FROM ITEM_TREE P LEFT JOIN ITEM_TREE C ON P.ITEM_ID = C.PARENT_ITEM_ID
# 계층 쿼리에서 LEFT JOIN을 걸고 P.ID, C.ID를 쓰면 부모와 자식이 매칭되는 경우엔 부모와 자식 관계가 ROW 하나씩 나오고,
# 부모만 있는 관계에선 오른쪽 칼럼이 NULL로 되어 나오게 된다.
# 그래서 이것을 이용해 LEFT JOIN을 쓰면 어떤 부모가 자식이 없는지, 어떤 부모가 자식이 몇 명인지를 빠르게 파악할 수 있다.
# 반면 INNER JOIN은 부모와 자식 관계가 대응되는 쌍만 걸러주므로 두 데이터가 모두 필요할 때 쓰인다.
  
WHERE C.ITEM_ID IS NULL)
# 여기에서는 자식이 없는 칼럼을 뽑아내야 하므로 자식 테이블의 식별자에 IS NULL 조건을 걸어 필터링을 했다
ORDER BY ITEM_ID DESC ;





