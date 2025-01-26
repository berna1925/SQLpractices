# def solution(s):
#     answer = []
#     t = {'zero' : '0', 'one' : '1', 'two' : '2', 'three' : '3',
#         'four' : '4', 'five' : '5', 'six' : '6', 'seven' : '7',
#         'eight' : '8', 'nine' : '9'}
#     b = []
    
#     for i in range(len(s)) :
#         if s[i].isdigit() :
#             answer.append(s[i])
#         else :
#             b.append(s[i])
#             while ''.join(b) not in t :
#                 b.append(s[i])
#             answer.append(t[''.join(b)])
#             b = []
        
#     return int(''.join(answer))

def solution(s):
    answer = []
    t = {'zero': '0', 'one': '1', 'two': '2', 'three': '3',
         'four': '4', 'five': '5', 'six': '6', 'seven': '7',
         'eight': '8', 'nine': '9'}
    b = []

    i = 0
    while i < len(s):
        # 숫자인 경우 바로 추가
        if s[i].isdigit():
            answer.append(s[i])
            i += 1
        else:
            # 알파벳일 경우 단어 찾기
            b.append(s[i])
            i += 1
            while ''.join(b) not in t:
                b.append(s[i])
                i += 1
            # 단어를 숫자로 변환
            answer.append(t[''.join(b)])
            b = []

    # 최종 결과 합치기
    return int(''.join(answer))

# 테스트
print(solution('one3three7'))  # 출력: 1337

