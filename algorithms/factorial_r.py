import sys


def factorial(n: int) -> int:
    """Python < 10 version, replacing the original match/case implementation.
    Can do 997!
    """
    if n < 0:
        raise Exception("not defined")
    elif n == 0:
        return 1
    else:
        return n * factorial(n - 1)


if __name__ == "__main__":
    n = int(sys.argv[1])
    print(f"{n}! = {factorial(n):,}")
