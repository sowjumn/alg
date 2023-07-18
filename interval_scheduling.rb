=begin
    Problem:
    Interval scheduling problem: Given a set R of n activity requests with start-finish times
    [si, fi] for 1 ≤ i ≤ n, determine a subset of R of maximum cardinality consisting of
    requests that are mutually non-conflicting.

    Given an array of intervals intervals where intervals[i] = [starti, endi], return the minimum number of intervals you need to remove to make the rest of the intervals non-overlapping.


    Soln: a greedy strategy that does work.
    Since we do not like activities that take a long time, let us select the activity that finishes
    first and schedule it. Then, we skip all activities that conflict with this one, and schedule
    the next one that has the earliest finish time, and so on.
=end


def erase_overlap_intervals(intervals)
    return 0 if intervals.length == 1
    sorted_by_end = intervals.sort {|a,b| a[1] <=> b[1]}

    min_count = 0
    prev_finish = sorted_by_end[0][1]
    1.upto(sorted_by_end.length-1) do |i|
        if prev_finish > sorted_by_end[i][0]
            min_count += 1
        else
            prev_finish = sorted_by_end[i][1]
        end
    end
    min_count
end
