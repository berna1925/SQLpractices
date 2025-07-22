class Solution():
    def twoSum(nums, target) :
        for i in range(len(nums)) :
            for j in range(i+1, len(nums)) :
                if nums[i] + nums[j] == target :
                    return [i, j]

print(Solution.twoSum([3, -7, 1, 2], 5))