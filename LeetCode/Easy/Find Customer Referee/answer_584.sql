# 2025-11-10 11:00 자력 해결
SELECT name
FROM Customer
WHERE referee_id != 2 or referee_id is null ;

- WHERE 절에 !=, = 같은 숫자 기준 필터를 걸면 NULL이 알아서 제외
- NULL을 살리고 싶다면 어쩔 수 없이 OR와 같은 변칙적인 조건을 단서로 달아줘야
