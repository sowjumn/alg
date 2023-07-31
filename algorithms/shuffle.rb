=begin
Given an integer array nums, design an algorithm to randomly shuffle the array.

Implement the Solution class:

Solution(int[] nums) Initializes the object with the integer array nums.
int[] reset() Resets the array to its original configuration and returns it.
int[] shuffle() Returns a random shuffling of the array.
 
= The solution uses fisher yates shuffle
=end

class Solution

    =begin
        :type nums: Integer[]
    =end
        def initialize(nums)
            @original_nums = nums.dup
            @nums = nums.dup
        end
    
    
    =begin
        Resets the array to its original configuration and return it.
        :rtype: Integer[]
    =end
        def reset()
            @nums = @original_nums.dup
        end
    
    
    =begin
        Returns a random shuffling of the array.
        :rtype: Integer[]
    =end
        def shuffle()
            len = @nums.length
            
            0.upto(len-2) do |i|
                r = Random.new(Random.new_seed) 
                idx = r.rand(i..len-1)
                if i != idx
                    temp = @nums[i]
                    @nums[i] = @nums[idx]
                    @nums[idx] = temp
                end
            end 
            @nums
        end
    end
    
    # Your Solution object will be instantiated and called as such:
    # obj = Solution.new(nums)
    # param_1 = obj.reset()
    # param_2 = obj.shuffle()