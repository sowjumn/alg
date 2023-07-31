=begin
You are given an array prices where prices[i] is the price of a given stock on the ith day.

You want to maximize your profit by choosing a single day to buy one stock and choosing a different day in the future to sell that stock.

Return the maximum profit you can achieve from this transaction. If you cannot achieve any profit, return 0.

 

Example 1:

Input: prices = [7,1,5,3,6,4]
Output: 5
Explanation: Buy on day 2 (price = 1) and sell on day 5 (price = 6), profit = 6-1 = 5.
Note that buying on day 2 and selling on day 1 is not allowed because you must buy before you sell.
Example 2:

Input: prices = [7,6,4,3,1]
Output: 0
Explanation: In this case, no transactions are done and the max profit = 0.
 

Constraints:

1 <= prices.length <= 105
0 <= prices[i] <= 104
=end

def max_profit(prices)
    len = prices.length
    return 0 if len <= 1
    low_so_far = [prices[0]]
    high_so_far = Array.new(len-1,0)
    high_so_far[len-1] = prices[len-1]
     
    1.upto(len-1) do |i|
        if prices[i] < low_so_far[i-1]
            low_so_far[i] = prices[i]
        else
            low_so_far[i] = low_so_far[i-1]
        end
    end
     
    (len-2).downto(0) do |j|
        if prices[j] > high_so_far[j+1] 
            high_so_far[j] = prices[j]
        else
            high_so_far[j] = high_so_far[j+1]
        end
    end
     
    max_profit = 0
 
    0.upto(len-1) do |i|
        profit = high_so_far[i] - low_so_far[i]
        if profit > max_profit
            max_profit = profit
        end
    end
    
     max_profit
 end