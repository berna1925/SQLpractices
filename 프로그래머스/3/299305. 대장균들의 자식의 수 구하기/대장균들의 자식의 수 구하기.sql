SELECT A.ID, COUNT(B.PARENT_ID) AS CHILD_COUNT
FROM ECOLI_DATA A LEFT JOIN ECOLI_DATA B ON A.ID = B.PARENT_ID
  # 계층 쿼리에서는 셀프 조인을 쓰거나 부모 쪽이 LEFT JOIN이 되도록 맞추는 것이 일반적
  # LEFT JOIN을 써서 같은 부모에 여러 로우가 매칭되면 그 부모 행이 여러 자식 행을 가진다는 뜻!!
GROUP BY A.ID
  # GROUP BY를 쓰는 문제에서는 결과 창을 봤을 때 맨 왼쪽에 오는 열이 그룹화 대상 열이다 제발!! 
ORDER BY A.ID ;
