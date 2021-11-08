import time, sys, random
from tqdm import *


password = (sys.argv[1])
password_length = len(password)
factorial = 13
if int(password_length) >= 1:
    for i in range (1,int(password_length)+1):
        factorial = factorial * i
progress_to_be_done = round(factorial / 4)
progress_list = [progress_to_be_done] * 4

pbar1 = tqdm(total=progress_to_be_done, position=0)
pbar2 = tqdm(total=progress_to_be_done, position=1)
pbar3 = tqdm(total=progress_to_be_done, position=2)
pbar4 = tqdm(total=progress_to_be_done, position=3)

#Set range based on len of password

progress_to_be_done=random.randint(80, 100)
percent = (0.9 - random.random() % 0.1)
new_num1 = round(progress_to_be_done - (progress_to_be_done * percent))

progress_to_be_done=random.randint(80, 100)
percent = (0.9 - random.random() % 0.1)
new_num2 = round(progress_to_be_done - (progress_to_be_done * percent))

progress_to_be_done=random.randint(80, 100)
percent = (0.9 - random.random() % 0.1)
new_num3 = round(progress_to_be_done - (progress_to_be_done * percent))

progress_to_be_done=random.randint(80, 100)
percent = (0.9 - random.random() % 0.1)
new_num4 = round(progress_to_be_done - (progress_to_be_done * percent))


for i in range(round(factorial)):
    pbar1.update(new_num1)
    pbar2.update(new_num2)
    pbar3.update(new_num3)
    pbar4.update(new_num4)
    time.sleep(0.001)
