# 2025-08-04 18:10 못 푼 문제

어떻게 풀어야 할지 아예 감이 안 왔던 문항
  
SELECT l1.nums AS ConsecutiveNums
FROM Logs l1, Logs l2, Logs l3
WHERE l1.num = l2.num
AND l2.num = l3.num
AND l1.id = l2.id - 1
AND l2.id = l3.id - 1 ;

CROSS JOIN을 활용해 L1.ID, L1.NUM, L2.ID, L2.NUM, L3.ID, L3.NUM 형태로 행이 N³개인 테이블을 구성
L1.ID=k, L2.ID=k+1, L3.ID=k+2가 한 행에 놓인 상황에서 L1.NUM = L2.NUM = L3.NUM이면 3연속 성분에 해당
일단 가능한 한 모든 조합의 경우를 깔아놓은 뒤 WHERE로 필터링하는 특이한 패턴
