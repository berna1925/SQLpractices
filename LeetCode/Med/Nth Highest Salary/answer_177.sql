# 2025-08-04 15:50 30분 동안 풀었지만 틀린 문제
함수의 제작을 해야 하는 어려운 문제

마지막으로 자력 작성한 코드
CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT
BEGIN
  RETURN (
          WITH FILTER AS (
              SELECT salary, ROW_NUMBER() OVER (ORDER BY salary) AS ranking
              FROM Employee
              )
          SELECT MAX(salary) AS getNthHighestSalary(N)
          FROM FILTER
          WHERE ranking < N)
          )
END

ROW_NUMBER 윈도우 함수로 중복되지 않게 순위를 매긴 점은 좋았으나
함수를 전반적으로 잘못된 구조로 작성해 에러가 발생


Q. 어떻게 해야 하나
# Solution 1

함수는 자주 쓰지 않아 아직 사용법이 미숙하니 순서부터 익히자
1. CREATE FUNCTION 함수명(변수명 변수-자료형) RETURNS 반환할 자료형
CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT

2. BEGIN으로 함수 내용 시작을 선언
BEGIN

3. 함수 내에서 쓰고 싶은 변수가 있다면 DECLARE로 변수와 변수 자료형을 선언
4. SET으로 변수의 초기 값을 설정
  DECLARE offset_val INT;
  SET offset_val = N - 1;

5. 함수가 반환하고자 하는 값은 RETURN에 모두 싣되 쿼리 형태라면 소괄호 안에 작성
  RETURN (
    SELECT DISTINCT Salary
    FROM Employee
    ORDER BY Salary DESC
    LIMIT 1 OFFSET offset_val
  );
6. 함수 작용을 전부 서술한 후 END로 종결
END

(7. 함수를 호출하고 함수값을 보고 싶다면 CALL FUNC(x) 형태로 작성)

tip1) 함수는 일단 전체 구조와 작성법부터 완전히 숙지하는 걸로
  `CREATE FUNCTION` → RETURNS → BEGIN → (DECLARE → SET) → RETURN → END
tip2) DECLARE, SET, RETURN 뒤엔 반드시 ;를 붙여줘야
tip3) ORDER BY, LIMIT, OFFSET에 수식을 넣으면 오류가 발생하므로 반드시 숫자나 변수를 활용해야 함
