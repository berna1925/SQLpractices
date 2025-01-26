def solution(s):
    if s[0] == '-' :
        s = int(s[1:]) * -1
    elif s[0] == '+' :
        s = int(s[1:])
    else :
        s = int(s)    
    return s