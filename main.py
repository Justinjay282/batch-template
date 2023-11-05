import numpy as np
import pandas as pd

while True:
    print("Choose: ")
    input_ = input("1 - Generate a random number\n2 - Exit")
    if input_ == "1":
        min_ = int(input("Input a minimum value: "))
        max_ = int(input("Input a maximum value: "))
        print(np.random.randint(min_, max_))
    else:
        break
