# arr = list(map(int, input().split()))
# k = int(input())

# if k < 1 or k > 100 :
#     print("rewrite the number between 1 and 100")

# if len(arr) == 0 :
#     print("write any natural number")
# elif len(arr) > 1000000 :
#     print("you might have written too many numbers")

# for i in range(len(arr)) :
#     if arr[i] < 1 or arr[i] > 100 :
#         print("you cannot write numbers under 1 or over 100 in array")

# def solution(arr, k):  
#     if k % 2 == 1 :
#         for i in range(len(arr)) :
#             arr[i] *= k
#     else :
#         for i in range(len(arr)) :
#             arr[i] += k
#     return arr

# print(solution(arr, k))

def solution(arr, k):
    answer = []
    if k % 2 == 1 :
        for a in arr:
            answer.append(a * k)
    else:
        for a in arr:
            answer.append(a + k)
    return answer