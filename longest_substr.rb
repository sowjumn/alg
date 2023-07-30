=begin
    Given a string s, find the length of the longest 
    substring without repeating characters.
=end

def length_of_longest_substring(s)
    s_len = s.length
    seen = {}
    i = 0
    j = 0
    longest_so_far = 0
    
    while j < s_len
       curr_char = s[j]
 
       if seen[curr_char] && (i..j-1).include?(seen[curr_char])
          if s[i..j-1].length > longest_so_far
             longest_so_far = s[i..j-1].length
          end
          i = seen[curr_char] + 1
          seen[curr_char] = j
       else
          seen[curr_char] = j
       end
 
       j = j + 1
    end
 
    if i < j
       if s[i..j].length > longest_so_far
          longest_so_far = s[i..j].length
       end
    end
 
    longest_so_far
 end

def tests
    if length_of_longest_substring("abcabcbb") == 3
        puts "Test Passes"
    else
        puts "Test Fails"
    end

    if length_of_longest_substring("bbbbb") == 1
        puts "Test Passes"
    else
        puts "Test Fails"
    end

    if length_of_longest_substring("pwwkew") == 3
        puts "Test Passes"
    else
        puts "Test Fails"
    end
end

tests