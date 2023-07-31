def merge(intervals)
    intervals = intervals.sort {|a,b| a[0] <=> b[0] }
    merged_arr = [intervals[0]]
    
    last_interval = intervals[0]
    len = intervals.length
    
    1.upto(len-1) do |i|
        if (last_interval[1] < intervals[i][0]) 
            merged_arr.push(intervals[i])
            last_interval = intervals[i]
        elsif ((last_interval[1] >= intervals[i][0]) && (last_interval[1] <= intervals[i][1]))
            merged_arr.pop
            last_interval = [last_interval[0],intervals[i][1]]
            merged_arr.push(last_interval)
        end         
    end
    
    merged_arr
end