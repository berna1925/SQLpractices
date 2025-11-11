# 2025-11-11 11:20 자력 풀이 실패
SELECT C.customer_id
FROM (SELECT *
      FROM (SELECT DISTINCT customer_id FROM Customer) U, Product P) T
      JOIN Customer C ON (T.customer_id, T.product_key) = (C.customer_id, C.product_key)
HAVING COUNT(C.customer_id) = COUNT(C.product_key)

- 어떻게 해야 모든 물건을 구입한 소비자를 걸러낼 필터를 짤 수 있는지 생각이 안 남..
  
# 다른 사람의 풀이
SELECT  customer_id
FROM Customer
GROUP BY customer_id
HAVING COUNT(distinct product_key) = (SELECT COUNT(product_key) FROM Product)

- 초간결 풀이;;
- 소비자 기준으로 그룹화해서 제품 번호 종류 개수를 distinct로 빠르게 추리고 그 개수를 세어주는 것
- 소비자가 구매한 기록이 있는 제품 종류 개수가 제품 리스트에 있는 제품 번호 개수와 동일하면 전부 산 것이라는 논리
- SELECT의 결과치가 정수 하나만 와도 OK라는 점을 이용한 간결하고 훌륭한 풀이
