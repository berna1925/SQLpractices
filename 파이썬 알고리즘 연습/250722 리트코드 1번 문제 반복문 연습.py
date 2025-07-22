class Solution():
    def twoSum(nums, target) :
        for i in range(len(nums)) :
            for j in range(i+1, len(nums)) :
                # 첫 수를 기준으로 다른 수를 한 번씩 돌아가며 탐색
                if nums[i] + nums[j] == target :
                    # 만약 첫 수와 n번째 수가 바로 합쳐져서 target이 된다면
                    return [i, j]
                        # 그 수들의 인덱스를 그대로 반환

print(Solution.twoSum([3, -7, 1, 2], 5))
# [0, 3]
