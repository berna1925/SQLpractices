SELECT C.ID FROM ECOLI_DATA A
INNER JOIN ECOLI_DATA B ON A.ID = B.PARENT_ID
INNER JOIN ECOLI_DATA C ON B.ID = C.PARENT_ID
WHERE C.ID NOT IN (
SELECT G.ID FROM ECOLI_DATA D
INNER JOIN ECOLI_DATA E ON D.ID = E.PARENT_ID
INNER JOIN ECOLI_DATA F ON E.ID = F.PARENT_ID
INNER JOIN ECOLI_DATA G ON F.ID = G.PARENT_ID
)

# 처음으로 자력으로 개발?한 계층 쿼리 코드 정답
# 3세대 대장균을 구하라고 해서 3세대 이하의 대상을 전부 구한 뒤 4세대 이후를 뺐다.
# 밑에 것은 GPT의 힘

SELECT C.ID
FROM ECOLI_DATA A
INNER JOIN ECOLI_DATA B ON A.ID = B.PARENT_ID
# 가장 원천적 단계의 대장균을 표시할 곳을 A로 하고 연계할 자식 테이블을 B로 지정
# A가 B의 부모라는 것을 알려주고 SELECT B.ID를 치면 2세대 이후 자식들이 나옴
# 여기서 WHERE A.PARENT_ID IS NULL을 달면 1세대 부모가 NULL인 데이터만 나오니 2세대 자식만 나옴
  
INNER JOIN ECOLI_DATA C ON B.ID = C.PARENT_ID
# 같은 방식으로 B가 C의 부모라는 것을 알려주고 SELECT C.ID를 치면 3세대 이후 자식들이 나옴. 여기까진 똑같다
# 여기서 이해를 위해 쓴 WHERE A.PARENT_ID IS NULL을 달면 2세대에 부여됐던 필터링 조건이 3세대로 넘어오게 됨
  
WHERE A.PARENT_ID IS NULL
ORDER BY C.ID; 
