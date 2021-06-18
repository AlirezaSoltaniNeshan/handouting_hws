import math


# Q1
# a * b
def mul(a=8, b=9):
    if b == 0:
        return 0
    else:
        return a + mul(a, b - 1)

# print(mul()) # 17

# Q2
# a ^ b
def pow(a=16, b=3):
    if b < 1:
        return 1
    else:
        return a * pow(a, b - 1)


print(pow()) # 4096

# Q3
# 6 SQRT
def sqrt6(n=50):
    if n == 0:
        return 0
    else:
        return math.sqrt(6 + sqrt6(n - 1))


# print(sqrt6()) # 3.0

# Q4
# Tst
def t(x=5, y=2):
    if x <= y or y == 0:
        return x
    elif y == 1:
        return t(x - 1, y) + 1
    else:
        return t(t(y, x), y - 1) + 2
print(t()) #20

# Q5
# floor division for recursive def
def fd(n=25):
    if n == 1:
        return 0
    else:
        return fd(n // 2) + 1

# print(fd()) #4


