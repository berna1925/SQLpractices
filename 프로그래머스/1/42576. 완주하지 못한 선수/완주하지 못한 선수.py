def solution(participant, completion):
    # answer = list(set(participant) - set(completion))
    p = sorted(participant)
    c = sorted(completion)
    c.append(0)
    
    for i in range(len(p)) :
        if p[i] != c[i] :
            return p[i]
