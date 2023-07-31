=begin
Given a list of n integers arr[0..(n-1)], determine the number of different pairs of elements within it which sum to k.
If an integer appears in the list multiple times, each copy is considered to be different; that is, two pairs are considered different if one pair includes at least one array index which the other doesn't, even if they include the same values.
Signature
int numberOfWays(int[] arr, int k)
Input
n is in the range [1, 100,000].
Each value arr[i] is in the range [1, 1,000,000,000].
k is in the range [1, 1,000,000,000].
Output
Return the number of different pairs of elements which sum to k.
Example 1
n = 5
k = 6
arr = [1, 2, 3, 4, 3]
output = 2
The valid pairs are 2+4 and 3+3.
Example 2
n = 5
k = 6
arr = [1, 5, 3, 3, 3]
output = 4
There's one valid pair 1+5, and three different valid pairs 3+3 (the 3rd and 4th elements, 3rd and 5th elements, and 4th and 5th elements).
=end

def number_of_ways(arr, sum)  
    h = Hash.new(0)
    
    arr.each_with_index do |a, i|
      h[a] += 1
    end
    
    count = 0
    
    puts h.inspect
    
    h.each do |k,v|
      if h[sum - k] > 0
        if (k != sum - k)
          count += h[k]*h[sum - k]
          h[sum - k] = 0
          h[k] = 0
        else
          n = h[k]
          c = (n * (n-1))/2
          count += c
        end
      end
    end
    count
  end  
  
  # Call number_of_ways() with test cases here
  arr1 = [1,2,3,4,3,100000000000000]
  puts number_of_ways(arr1,6)
  
  arr2 = [1,5,3,3,3]
  puts number_of_ways(arr2,6)