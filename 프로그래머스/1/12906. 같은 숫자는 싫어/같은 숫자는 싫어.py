def solution(arr):
    # answer = [arr[i] for i in range(len(arr)) if arr[i-1] != arr[i]]
    answer = []
    answer.append(arr[0])
    
    if len(arr) == 1 :
        pass
    else : 
        for i in range(1, len(arr)) :
            if answer[-1] != arr[i] :
                answer.append(arr[i])
    return answer