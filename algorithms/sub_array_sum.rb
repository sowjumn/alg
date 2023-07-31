=begin
    
Given an array of integers nums and an integer k, return the total number of continuous subarrays whose sum equals to k.

 

Example 1:

Input: nums = [1,1,1], k = 2
Output: 2
Example 2:

Input: nums = [1,2,3], k = 3
Output: 2
 

Constraints:

1 <= nums.length <= 2 * 104
-1000 <= nums[i] <= 1000
    
=end

=begin
    
The logic here is 'first compute the running sum starting at index 0 
now check if sum-k is already seen which means there is a window/s whose sum says sum2 where sum-sum2 = k
add that number to the count . Count tracks the number of subarrays . now add +1 to the sum_hash to track the sum is already seen
Initializing the sum_hash[0] case to 1 counts the case when sum-k is 0 
    
=end

def subarray_sum(nums, k)
    len = nums.length
    sum_hash = Hash.new(0)
    sum_hash[0] = 1
    count = 0
    sum = 0
    0.upto(len-1) do |i|
        sum = sum + nums[i]
        count += sum_hash[sum-k]
        sum_hash[sum] = sum_hash[sum] + 1
    end    
    count
end

