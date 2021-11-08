import random, time, sys, string, threading, os, queue
from alive_progress import alive_bar


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



def bar_thing():
    for x in progress_list:
        with alive_bar(x) as bar:
            for i in range(progress_to_be_done):
                time.sleep(.005)
                bar()



if __name__ == '__main__':
    print("Enter Password")
    password = input("> ")
    password_length = len(password)
    factorial = 13
    if int(password_length) >= 1:
        for i in range (1,int(password_length)+1):
            factorial = factorial * i
    cpu_num = os.cpu_count()
    progress_to_be_done = round(factorial / cpu_num)
    progress_list = [progress_to_be_done] * cpu_num


    th0 = threading.Thread(target=repeated_guesses, args=(password,))

    th1 = threading.Thread(target=bar_thing)
    