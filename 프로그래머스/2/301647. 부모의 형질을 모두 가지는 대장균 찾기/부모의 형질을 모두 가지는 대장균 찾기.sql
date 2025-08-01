-- 코드를 작성해주세요
# 2025-07-23 17:23

SELECT C.ID, C.GENOTYPE, P.GENOTYPE AS PARENT_GENOTYPE
FROM ECOLI_DATA AS C JOIN ECOLI_DATA AS P
WHERE C.PARENT_ID = P.ID AND
(C.GENOTYPE & P.GENOTYPE = P.GENOTYPE)
ORDER BY C.ID

# JOIN과 ON은 한 몸
# 주어진 조건에서는 ON을 쓰지 않아 내부 범위 연산이 CROSS JOIN 식으로 진행됐으나 WHERE 조건절이 뒤에서 필터링을 해줘서 정답이 된 것
# 실제로는 ON C.PARENT_ID = P.ID WHERE (C.GENOTYPE & P.GENOTYPE = P.GENOTYPE)라 쓰는 것이 정석이다
# INNER JOIN에선 ON의 조건을 WHERE 절에 나눠 써도 같은 결과가 나오지만 LEFT JOIN에선 자료 비교 순서가 달라지기 때문에 절대 답이 될 수 없다!



# 아래는 언제 풀었는지 모를 연습장  

# SELECT A.ID, A.GENOTYPE, B.GENOTYPE AS PARENT_GENOTYPE
# FROM ECOLI_DATA AS A INNER JOIN ECOLI_DATA AS B
# ON A.ID = B.PARENT_ID
# ORDER BY A.ID ;

# SELECT E.ID, E.GENOTYPE, P.GENOTYPE AS PARENT_GENOTYPE
# FROM ECOLI_DATA AS E INNER JOIN ECOLI_DATA AS P ON E.PARENT_ID = P.ID
# WHERE BITAND(E.GENOTYPE, P.GENOTYPE) = P.GENOTYPE
# ORDER BY E.ID;

# SELECT EC.ID, EC.GENOTYPE, P.GENOTYPE AS PARENT_GENOTYPE
# FROM ECOLI_DATA EC
# JOIN ECOLI_DATA P ON EC.PARENT_ID = P.ID
# WHERE 
#     MOD(P.GENOTYPE, 2) <= MOD(EC.GENOTYPE, 2)
#     AND MOD(P.GENOTYPE / 2, 2) <= MOD(EC.GENOTYPE / 2, 2) 
#     AND MOD(P.GENOTYPE / 4, 2) <= MOD(EC.GENOTYPE / 4, 2)
#     AND MOD(P.GENOTYPE / 8, 2) <= MOD(EC.GENOTYPE / 8, 2) 
# ORDER BY EC.ID;

# SELECT child.ID, child.GENOTYPE, parent.GENOTYPE AS PARENT_GENOTYPE
# FROM ECOLI_DATA child JOIN ECOLI_DATA parent ON child.PARENT_ID = parent.ID
# WHERE (child.GENOTYPE & parent.GENOTYPE) = parent.GENOTYPE
# ORDER BY child.ID;













