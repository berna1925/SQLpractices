# 2025-08-04 15:00 30분 걸려서 풀지 못한 문제
마지막으로 자력 작성한 코드
    
WITH RANKS AS (
    SELECT id, salary, ROW_NUMBER() OVER (ORDER BY salary) AS Ranking
    FROM Employee
)
SELECT E.salary AS SecondHighestSalary
FROM Employee E LEFT JOIN RANKS R ON E.id = R.id
WHERE Ranking = 2

ROW_NUMBER를 담은 서브쿼리를 WHERE로 거르는 방식을 선택했으나
이렇게 하면 데이터가 1줄짜리일 때는 아무 것도 반환되지 않아 공백만 남게 됨
이는 NULLIF를 써도 마찬가지로 해결이 불가능한 문제
* 문제에선 아무 것도 반환할 게 없으면 NULL이 뜨도록 요구받았음

Q. 어떻게 하면 아무런 결과가 없을 때 NULL이 나오게 할 수 있나?
# Solution 1
SELECT MAX(salary) AS SecondHighestSalary
FROM Employee
WHERE salary < (SELECT MAX(salary)
                FROM Employee) ;

서브쿼리로 일단 최고 값을 찾아 그 값이 나오지 못하게 제약을 설정한 구조
→ 남은 salary 값 중 최대인 값이 SecondHighestSalary로 반환됨

tip1) 집계함수는 집계할 값이 하나도 없으면 NULL을 반환한다
tip2) GROUP BY는 집계함수를 작동시키기 위한 보조 수단이지 필수 요건이 아니다 → 유연하게 생각하자
tip3) WHERE절에 서브쿼리를 구사해야 하는 경우가 자주 있다 → WITH절에 너무 의존하지 말자

# Solution 2
SELECT (
    SELECT DISTINCT salary
    FROM Employee
    ORDER BY salary DESC
    LIMIT 1 OFFSET 1
) AS SecondHighestSalary;

메인 쿼리의 SELECT절에 다른 것은 아무 것도 없이 그냥 서브쿼리만 넣어둔 특이한 형태
서브쿼리로 중복 값이 나오지 않게 DISTINCT만 걸어준 다음 내림차순으로 정렬하고
LIMIT M OFFSET N 구조로 위에서 N개를 거르고 M개를 보여주는 구조를 확충
→ 조건을 만족하는 salary가 없어도 스칼라 서브쿼리는 반드시 무언가를 반환해야 하므로 NULL이 튀어나가는 형태!

tip1) OFFSET LIMIT 이런 건 없다 → LIMIT M OFFSET N 이 구조를 반드시 외워두자
tip2) SELECT절에 오는 서브쿼리는 스칼라 서브쿼리이기 때문에 반드시 단일 값을 반환할 수 있도록 하자
tip3) 스칼라 서브쿼리는 죽으면 NULL을 남긴다


