# Given two strings find the minimum edit distance

def min_distance(word1, word2)
    len1 = word1.length
    len2 = word2.length
    
    return len1 if len2 == 0
    return len2 if len1 == 0
    
    dp_arr = Array.new(len2+1) { Array.new(len1+1,0) }
    
    1.upto(len1) do |i|
        dp_arr[0][i] = i
    end
    
    1.upto(len2) do |j|
       dp_arr[j][0] = j 
    end
    
    1.upto(len2) do |i|
        1.upto(len1) do |j|
            if word1[j-1] == word2[i-1] 
                dp_arr[i][j] = dp_arr[i-1][j-1]
            else
                dp_arr[i][j] = [dp_arr[i-1][j], dp_arr[i][j-1], dp_arr[i-1][j-1]].min + 1
            end 
        end
    end
    
    dp_arr[len2][len1]
end