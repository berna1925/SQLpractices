# 2025-07-26 16:05 PERFECT ONLY BY MYSELF
# 보통 부모-자식 계층 쿼리는 LEFT JOIN으로 ON절에 부모 자식 관계를 나타내는 구문을 통해 엮는 것이 일반적
# 코딩 테스트에서 3층 이상의 구조를 제시할 수도 있을 듯해 고심 끝에 발상 전환
# 더 이상 진화할 방법이 없다 -> 자식이 없다 -> 부모 목록에 자신의 이름이 없다
# 이런 사고방식으로 PARENT_ITEM_ID에 NOT IN 조건을 걸어 최종 손자 손녀만 선택하도록 서브쿼리를 쓰는 신항로 개척
WITH FILTER AS (
    SELECT ITEM_ID
    FROM ITEM_TREE
    WHERE ITEM_ID NOT IN (SELECT S.PARENT_ITEM_ID
                            FROM ITEM_TREE S
                            WHERE S.PARENT_ITEM_ID IS NOT NULL)
)
SELECT I.ITEM_ID, ITEM_NAME, RARITY
FROM ITEM_INFO I JOIN FILTER F ON I.ITEM_ID = F.ITEM_ID
ORDER BY I.ITEM_ID DESC ;


# 이전의 풀이.. 아마도 GPT의 힘을 빌렸을 듯하다
# 이 풀이는 2층 구조일 때는 무난하게 풀이가 가능하나 3층 이상의 깊이에서는 작동 불가
# SELECT I.ITEM_ID, ITEM_NAME, RARITY
# FROM ITEM_INFO I JOIN ITEM_TREE T ON I.ITEM_ID = T.ITEM_ID
# WHERE I.ITEM_ID IN (SELECT P.ITEM_ID
# FROM ITEM_TREE P LEFT JOIN ITEM_TREE C ON P.ITEM_ID = C.PARENT_ITEM_ID
# WHERE C.ITEM_ID IS NULL)
# ORDER BY ITEM_ID DESC ;

