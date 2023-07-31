=begin

You are given an integer array nums sorted in ascending order (with distinct values), and an integer target.

Suppose that nums is rotated at some pivot unknown to you beforehand (i.e., [0,1,2,4,5,6,7] might become [4,5,6,7,0,1,2]).

If target is found in the array return its index, otherwise, return -1.

 

Example 1:

Input: nums = [4,5,6,7,0,1,2], target = 0
Output: 4
Example 2:

Input: nums = [4,5,6,7,0,1,2], target = 3
Output: -1
Example 3:

Input: nums = [1], target = 0
Output: -1
    

Test cases
[1,3],1

=end

def search(nums, target)
    return -1 if nums.length == 0

    l = 0
    r = nums.length-1
    
    
    while l <= r
        mid = (r+l)/2
        puts "l: #{l} r: #{r} mid: #{mid}"
        if nums[mid] == target
            return mid
        elsif nums[mid] <= nums[r]
            if nums[mid] < target && target <= nums[r]
                l = mid + 1
            else
                r = mid - 1
            end
        else
                #pivot is on right
            if nums[l] <= target && target < nums[mid]
                r = mid - 1
            else
                l = mid + 1
            end
        end
    end
    -1
end