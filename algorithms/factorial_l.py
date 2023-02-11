import sys


def factorial(n: int) -> int:
    """A looping version, quite like the one in A64 assembly.
    Can do 1558!
    """
    m = n
    n = 1
    while True:
        if m < 1:
            return n
        n = n * m
        m -= 1


if __name__ == "__main__":
    n = int(sys.argv[1])
    print(f"{n}! = {factorial(n):,}")
