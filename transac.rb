
print ">>"
while s = gets
    s = s.chomp
    case s
    when "BEGIN"
        # start a transaction
        puts "I start a transaction"
    when "COMMIT"
        # Commit a transaction
        puts "Commit a transaction"
    else 
        break
    end 
    print ">>"
end