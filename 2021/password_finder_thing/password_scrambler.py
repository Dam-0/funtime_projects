import random, time, sys, string, os

def repeated_guesses(target):
    chars = string.ascii_letters + string.digits + ' '
    current_guess = len(target) * ['*']
    for count, char in enumerate(target):
        while current_guess[count] != char:
            current_guess[count] = random.choice(chars)
            sys.stdout.write(str("\rCracking : "+''.join(current_guess)))
            # slight pause to make readable
            time.sleep(0.005)
            sys.stdout.flush()
    print ("\n")



password = (sys.argv[1])
password_length = len(password)
factorial = 13
if int(password_length) >= 1:
    for i in range (1,int(password_length)+1):
        factorial = factorial * i
progress_to_be_done = round(factorial / 4)
progress_list = [progress_to_be_done] * 4
repeated_guesses(password)