# A classic dynamic programming problem. 
# At index i we list out the best we could do ; do we extend the previous best or do we start the index 
# we only start at the index when the number at that index is greater than the amount of extended value

class MaxSubArray
    def max_sub_array(nums)
        len = nums.length
        return nums[0] if len == 1
        return 0 if len == 0
         max_so_far = nums[0]
         best_so_far  = nums[0]
         sum_so_far = 0
         1.upto(len-1) do |i|
             sum_so_far = best_so_far + nums[i]
             if nums[i] > sum_so_far 
                 best_so_far = nums[i]
             elsif nums[i] <= sum_so_far
                 best_so_far = sum_so_far
             end
             if best_so_far > max_so_far
                 max_so_far = best_so_far
             end
         end
         max_so_far
     end
end