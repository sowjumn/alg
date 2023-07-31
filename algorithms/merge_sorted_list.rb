=begin
Merge two sorted linked lists and return it as a sorted list. The list should be made by splicing together the nodes of the first two lists.

Edges cases [] [], [] [1], [1] [], [2] [1], [2] [1,3,4]
=end



def merge_two_lists(l1, l2)
    first = l1
    prev = first
    second = l2
    return l1 if l2.nil?
    return l2 if l1.nil?
    while first != nil && second != nil
        #increment first until first.val > second.val
        if first.val > second.val
            #insert second infront of first
            #nil
            second_temp = second.next
            if prev == first
                #add it to front
                first = l1
                l1_temp = l1.next
                l1 = second
                l1.next = first   
            else
                prev.next = second
                second.next = first
            end
                #switch second pointer
                prev = second
                second = second_temp
            
            #puts "prev: #{prev.val} first: #{first.val}"
        else
            prev = first
            first = first.next
        end
    end
    
    if first.nil? && second
        prev.next = second
    end
    
    l1
end