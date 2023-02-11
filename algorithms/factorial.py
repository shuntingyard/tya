import sys


def factorial(n: int) -> int:
    if n < 0:
        raise Exception("not defined")
    match n:
        case 0 | 1:  # Subtlety: could be a match on 0 only.
            return 1
        case _:
            return n * factorial(n - 1)


if __name__ == "__main__":
    n = int(sys.argv[1])
    print(f"{n}! = {factorial(n):,}")
