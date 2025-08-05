def solution(schedules, timelogs, startday):
    def add_10_minutes(time):
        hour = time // 100
        minute = time % 100 + 10
        if minute >= 60:
            hour += 1
            minute -= 60
        return hour * 100 + minute

    n = len(schedules)
    answer = 0

    for i in range(n):  # 직원 한 명씩 순회
        limit_time = add_10_minutes(schedules[i])
        is_late = False

        for j in range(7):  # 일주일 간의 출근 기록 확인
            # 실제 요일 계산 (1~7 범위 유지)
            day = (startday + j - 1) % 7 + 1
            if day in [6, 7]:  # 주말은 건너뜀
                continue
            if timelogs[i][j] > limit_time:
                is_late = True
                break  # 한 번이라도 늦으면 상품 못 받음

        if not is_late:
            answer += 1

    return answer


        #     if (schedules[i] % 100) >= 50 :
        #         if ((schedules[i] // 100)  + 1 == (timelogs[i][j] // 100) and
        #             (schedules[i] % 100) - (timelogs[i][j]) >= 50) :
        #             n += 1
        #     else :
        #         if ((schedules[i] // 100) == (timelogs[i][j] // 100) and
        #             (timelogs[i][j]) - (schedules[i] % 100) <= 10) :
        #             n += 1
        # if n == 5 :