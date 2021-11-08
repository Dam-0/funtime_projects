let s:min_age = 1
let s:max_age = 100
let s:age = s:max_age - s:min_age
let s:age = s:min_age + rand() % s:age

while 1
    let s:num_guess = input("Guess Age: ") + 0 " ( 0 casts to int)

    if s:num_guess < s:age
        echo "\nAge is higher"

    elseif s:num_guess > s:age
        echo "\nAge is lower"
    
    else
        echo "\nYOU GOT IT"
        break
    endif
endwhile