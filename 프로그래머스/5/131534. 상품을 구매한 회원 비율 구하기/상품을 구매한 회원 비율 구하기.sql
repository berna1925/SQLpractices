# WITH FILTER AS (
#     SELECT YEAR(SALES_DATE) AS YEAR, MONTH(SALES_DATE) AS MONTH,
#            U.USER_ID, PRODUCT_ID
#     FROM USER_INFO U LEFT JOIN ONLINE_SALE O ON U.USER_ID = O.USER_ID
#     WHERE YEAR(JOINED) = 2021
#                 )
# SELECT YEAR, MONTH, COUNT(DISTINCT USER_ID), COUNT(PRODUCT_ID) / COUNT(DISTINCT USER_ID)
# FROM FILTER
# GROUP BY YEAR, MONTH

WITH users_2021 AS (
    SELECT USER_ID
    FROM USER_INFO
    WHERE YEAR(JOINED) = 2021
),  # 2021년에 가입한 모든 회원의 정보를 1차적으로 수집
purchased_users AS (
    SELECT DISTINCT YEAR(SALES_DATE) AS YEAR,
           MONTH(SALES_DATE) AS MONTH,
           USER_ID
    FROM ONLINE_SALE
    WHERE USER_ID IN (SELECT USER_ID FROM users_2021)
)   # 2021년 가입 회원 중 물건을 1번이라도 산 적이 있는 회원들 DISTINCT를 써서 중복 없이 정보를 수집

SELECT 
    p.YEAR, 
    p.MONTH,
    COUNT(p.USER_ID) AS PURCHASED_USERS,             # 물건을 산 적이 있는 회원의 숫자는 P에서 이미 걸러졌으므로 그대로 사용
    ROUND(COUNT(p.USER_ID) / (SELECT COUNT(*) FROM users_2021), 1) AS PURCHASED_RATIO  # 그 수를 2021년 가입 회원 전체 수로 나눔
FROM purchased_users p
GROUP BY p.YEAR, p.MONTH
ORDER BY p.YEAR, p.MONTH;

# WITH ? AS (), ? AS (), 식으로 두 개의 가상 테이블을 병렬 배치해 이용하는 것도 가능하다!
