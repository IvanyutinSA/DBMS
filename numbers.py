from random import randint
chars = "АВЕКМНОРСТУХ"

for i in range(10):
    print(
        f'{chars[randint(0, len(chars)-1)]}'
        f'{randint(0, 9)}'
        f'{randint(0, 9)}'
        f'{randint(0, 9)}'
        f'{chars[randint(0, len(chars)-1)]}'
        f'{chars[randint(0, len(chars)-1)]}'
            )
