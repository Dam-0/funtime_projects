max_age = 100
min_age = 1

age = Random.rand(max_age + 1 - min_age) + min_age

while true
    puts "Guess Age: "
    guess_age = gets.chomp.to_i

    if(guess_age > age)
        puts "Age is lower"

    elsif(guess_age < age)
        puts "Age is higher"

    elsif(guess_age==age) 
        puts "YOU GOT IT"
        break
    end

end