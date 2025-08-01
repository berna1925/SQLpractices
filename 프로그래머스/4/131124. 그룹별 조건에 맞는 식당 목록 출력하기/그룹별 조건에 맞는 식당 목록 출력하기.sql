# 2025-07-31 15:55 자력 해결
# WHERE (R.MEMBER_ID, COUNT(REVIEW_TEXT)) IN (R.MEMBER_ID, MAX(COUNT(REVIEW_TEXT)).. 과거의 내가 생각해낸 아주 바람직한 플레이
WITH CT_TABLE AS (
SELECT MEMBER_ID, COUNT(MEMBER_ID) AS CT
                  FROM REST_REVIEW
                  GROUP BY MEMBER_ID
                  ORDER BY CT DESC
                  LIMIT 1
)

SELECT MEMBER_NAME, REVIEW_TEXT,
       DATE_FORMAT(REVIEW_DATE, '%Y-%m-%d') AS REVIEW_DATE
FROM MEMBER_PROFILE AS M JOIN REST_REVIEW AS R ON M.MEMBER_ID = R.MEMBER_ID
WHERE M.MEMBER_ID = (SELECT CT.MEMBER_ID
                     FROM CT_TABLE AS CT
                    )
ORDER BY REVIEW_DATE, REVIEW_TEXT;



# SELECT MEMBER_NAME, REVIEW_TEXT, REVIEW_DATE
# FROM MEMBER_PROFILE AS P INNER JOIN REST_REVIEW AS R
# ON P.MEMBER_ID = R.MEMBER_ID
# WHERE (R.MEMBER_ID, COUNT(REVIEW_TEXT)) IN (R.MEMBER_ID, MAX(COUNT(REVIEW_TEXT))
# GROUP BY R.MEMBER_ID)
# ORDER BY REVIEW_TEXT;

# SELECT MEMBER_NAME, REVIEW_TEXT, DATE_FORMAT(REVIEW_DATE, '%Y-%m-%d') AS REVIEW_DATE
# FROM MEMBER_PROFILE AS P INNER JOIN REST_REVIEW AS R
# ON P.MEMBER_ID = R.MEMBER_ID
# WHERE P.MEMBER_ID = (SELECT REST_REVIEW.MEMBER_ID FROM REST_REVIEW
#        GROUP BY MEMBER_ID ORDER BY COUNT(*) DESC LIMIT 1)
# ORDER BY REVIEW_DATE, REVIEW_TEXT;
