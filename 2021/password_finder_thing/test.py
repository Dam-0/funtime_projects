import time
from tqdm import *

pbar1 = tqdm(total=1000000)
pbar2 = tqdm(total=2000000)

for i in range(10000):
    pbar1.update(10)
    pbar2.update(20)
    time.sleep(0.001)