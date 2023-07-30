=begin
Given two strings text1 and text2, return the length of their longest common subsequence. If there is no common subsequence, return 0.

A subsequence of a string is a new string generated from the original string with some characters (can be none) deleted without changing the relative order of the remaining characters.

For example, "ace" is a subsequence of "abcde".
A common subsequence of two strings is a subsequence that is common to both strings.

Example 1:

Input: text1 = "abcde", text2 = "ace" 
Output: 3  
Explanation: The longest common subsequence is "ace" and its length is 3.
Example 2:

Input: text1 = "abc", text2 = "abc"
Output: 3
Explanation: The longest common subsequence is "abc" and its length is 3.
Example 3:

Input: text1 = "abc", text2 = "def"
Output: 0
Explanation: There is no such common subsequence, so the result is 0.

=end


def longest_common_subsequence(text1, text2)
    len_1 = text1.length
    len_2 = text2.length

    dp_arr = Array.new(len_1+1) { Array.new(len_2+1,0) }

    1.upto(len_1) do |i|
        1.upto(len_2) do |j|
            if text1[i-1] == text2[j-1]
                dp_arr[i][j] = dp_arr[i-1][j-1] + 1
            else
                dp_arr[i][j] = [dp_arr[i-1][j],dp_arr[i][j-1]].max
            end
        end
    end
    dp_arr[len_1][len_2]
end