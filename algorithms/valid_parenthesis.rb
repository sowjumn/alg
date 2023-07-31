=begin
Given a string s containing just the characters '(', ')', '{', '}', '[' and ']', determine if the input string is valid.

An input string is valid if:

Open brackets must be closed by the same type of brackets.
Open brackets must be closed in the correct order.
 
=end


def is_valid(s)
    stk = []
    len = s.length
    open_braces = ['(','{','[']
    map_paren = {')' => '(', '}' => '{' , ']' => '['}
    0.upto(len-1) do |i|
        if open_braces.include?(s[i])
            stk.push(s[i])
        else
            u = stk.pop
            if u != map_paren[s[i]]
                return false
            end
        end    
    end
    
    (stk.length == 0)
end