import sys


def factorial(n: int) -> int:
    """A looping version, quite like the one in A64 assembly.
    Can do 1558!
    """
    m = n
    n = 1
    while m < 0:
        n = n * m
        m -= 1

    return n


if __name__ == "__main__":
    n = int(sys.argv[1])
    print(f"{n}! = {factorial(n):,}")
