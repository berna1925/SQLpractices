# 2025-11-12 11:15 자력 해결 실패
SELECT product_id, year AS first_year, quantity, price
FROM Sales
GROUP BY product_id
HAVING year <= MIN(year) ;

- 주어진 데이터는 조건이 충족되나 다른 샘플 데이터를 통과하지 못함
- 쓰고도 마음이 심히 켕겼던 코드

# 권장 코드
SELECT product_id, year AS first_year, quantity, price
FROM Sales
WHERE (product_id, year) IN (SELECT product_id, MIN(year)
                            FROM Sales
                            GROUP BY product_id);

- HAVING절은 GROUP BY에 넣은 것과 다른 칼럼을 쓰면 부가 조건을 걸어주는 원래 의미가 퇴색되어 제 기능을 하지 못하게 됨
- WHERE 안에 서브쿼리를 끼워 넣어 IN 속에 SELECT 페어를 넣는 방식으로 필터링
