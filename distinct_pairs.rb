=begin
A financial analyst is responsible for a portfolio of profitable stocks represented in an array. Each item in the array represents the yearly profit of a corresponding stock.

The analyst gathers all distinct pairs of stocks that have reached the target profit. Distinct pairs are pairs that differ in at least one element.

Given the array of profits, find the number of distinct pairs of stocks where the sum of each pair's profits is exactly equal to the target profit.




Example Input 1:

stocksProfit = [5, 7, 9, 13, 11, 6, 6, 3, 3]
target = 12

Example Output 1:


return value = 3

The pairs of stocks are:

(5, 7)
(3, 9)
(6, 6)




Example Input 2:

stocksProfit = [
    92, 407, 1152, 403, 1419, 689, 1029, 108, 128, 1307, 300, 775, 622,
    730, 978, 526, 943, 127, 566, 869, 715, 983, 820, 1394, 901, 606,
    497, 98, 1222, 843, 600, 1153, 302, 1450, 1457, 973, 1431, 217, 936,
    958, 1258, 970, 1155, 1061, 1341, 657, 333, 1151, 790, 101, 588,
    263, 101, 534, 747, 405, 585, 111, 849, 695, 1256, 1508, 139, 336,
    1430, 615, 1295, 550, 783, 575, 992, 709, 828, 1447, 1457, 738,
    1024, 529, 406, 164, 994, 1008, 50, 811, 564, 580, 952, 768, 863,
    1225, 251, 1032, 1460
]

target = 1558

Example Output 2:

return value = 45






Solution:

=end

def distinct_pairs(profit_arr,target)
    #create a hash map of elements with key as element and value as the number of times the element has occurred
    # Time Complexity O(n)
    # Space Complexity O(n)
    hash_elem = Hash.new(0)
    count = 0 
    profit_arr.each do |elem|
        hash_elem[elem] += 1
    end

    profit_arr.each do |elem|
        poss_target = target - elem
        if (elem == poss_target)
            if hash_elem[elem] >= 2
                count += 1
                hash_elem[elem] = 0
            end 
        else 
            if hash_elem[poss_target] > 0
                count += 1
                hash_elem[poss_target] = 0
                hash_elem[elem] = 0 
            end
        end
    end

    return count 
end

puts distinct_pairs([5, 7, 9, 13, 11, 6, 6, 3, 3],12)

arr1 = [2, 3, 5, 7]
target1 = 8
expected1 = 1
if expected1 != distinct_pairs(arr1, target1)
    puts "Fail for #{arr1.inspect}"
else
    puts "PASS"
end

arr2 = [1, 2, 2, 3, 3, 3]
target2 = 4
expected2 =  2
if expected2 != distinct_pairs(arr2, target2)
    puts "Fail for #{arr2.inspect}"
else
    puts "PASS"
end

arr3 = Array.new(10,2)
target3 = 4
expected3 = 1
if expected3 != distinct_pairs(arr3, target3)
    puts "Fail for #{arr3.inspect}"
else
    puts "PASS"
end

arr4 = [
    92, 407, 1152, 403, 1419, 689, 1029, 108, 128, 1307, 300, 775, 622,
    730, 978, 526, 943, 127, 566, 869, 715, 983, 820, 1394, 901, 606,
    497, 98, 1222, 843, 600, 1153, 302, 1450, 1457, 973, 1431, 217, 936,
    958, 1258, 970, 1155, 1061, 1341, 657, 333, 1151, 790, 101, 588,
    263, 101, 534, 747, 405, 585, 111, 849, 695, 1256, 1508, 139, 336,
    1430, 615, 1295, 550, 783, 575, 992, 709, 828, 1447, 1457, 738,
    1024, 529, 406, 164, 994, 1008, 50, 811, 564, 580, 952, 768, 863,
    1225, 251, 1032, 1460
]
target4 = 1558
expected4 = 45
if expected4 != distinct_pairs(arr4, target4)
    puts "Fail for #{arr4.inspect}"
else
    puts "PASS"
end
