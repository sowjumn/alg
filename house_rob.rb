=begin
You are a professional robber planning to rob houses along a street. Each house has a certain amount of money stashed, the only constraint stopping you from robbing each of them is that adjacent houses have security systems connected and it will automatically contact the police if two adjacent houses were broken into on the same night.

Given an integer array nums representing the amount of money of each house, return the maximum amount of money you can rob tonight without alerting the police.

 

Example 1:

Input: nums = [1,2,3,1]
Output: 4
Explanation: Rob house 1 (money = 1) and then rob house 3 (money = 3).
Total amount you can rob = 1 + 3 = 4.
Example 2:

Input: nums = [2,7,9,3,1]
Output: 12
Explanation: Rob house 1 (money = 2), rob house 3 (money = 9) and rob house 5 (money = 1).
Total amount you can rob = 2 + 9 + 1 = 12.

Soln: A classic DP problem we keep track of sum_2 which is maximum sum until i-2 and sum_1 which is maximum sum until i-1
In order to calculate the current_max_sum we either pick sum_1 or sum_2 + nums[i] whichever is greater, the current_max_sum represents the 
maximum sum one can attain at the current index i

=end


def rob(nums)
    return nums[0] if nums.length == 1
    sum_2 = nums[0]
    sum_1 = [nums[0],nums[1]].max

    return sum_1 if nums.length == 2

    2.upto(nums.length-1) do |i|
        temp_sum = nums[i]+sum_2
        temp_max = [temp_sum,sum_1].max
        sum_2 = sum_1
        sum_1 = temp_max
    end
    sum_1
end