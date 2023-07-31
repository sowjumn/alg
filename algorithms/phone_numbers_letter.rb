=begin
Given a string containing digits from 2-9 inclusive, return all possible letter combinations that the number could represent. Return the answer in any order.

A mapping of digit to letters (just like on the telephone buttons) is given below. Note that 1 does not map to any letters.
Input: digits = "23"
Output: ["ad","ae","af","bd","be","bf","cd","ce","cf"]
Example 2:

Input: digits = ""
Output: []
Example 3:

Input: digits = "2"
Output: ["a","b","c"]
 

Constraints:

0 <= digits.length <= 4
digits[i] is a digit in the range ['2', '9'].
=end

def letter_combinations(digits)
    digit_map = {"2" => ['a','b','c'],
                  "3" => ['d','e','f'],
                  "4" => ['g','h','i'],
                  "5" => ['j','k','l'],
                  "6" => ['m','n','o'],
                  "7" => ['p','q','r','s'],
                  "8" => ['t','u','v'],
                  "9" => ['w','x','y','z'] }
    
    final_out = []
    digits = digits.split("")
    if digits.length != 0
        generate("",digits,final_out, digit_map)
    end
    final_out
end

def generate(combo,next_digits,final_out, digit_map)
    if next_digits.length == 0
        final_out.push(combo)
    else
        next_digit = next_digits[0]
        digit_map[next_digit].each do |d|
            generate(combo + d,next_digits[1..-1],final_out, digit_map)
        end
    end 
end