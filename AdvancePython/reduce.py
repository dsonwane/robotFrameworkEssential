import functools
import operator
import itertools

# initializing list
lis = [1, 3, 5, 6, 2]

# using reduce to compute sum of list
print("The sum of the list elements is : ", end="")
print(functools.reduce(lambda a, b: a + b, lis))

# using reduce to compute maximum element from list
print("The maximum element of the list is : ", end="")
print(functools.reduce(lambda a, b: a if a > b else b, lis))

# Accumulator
GFG = [1, 2, 3, 4, 5]

# using the itertools.accumulate()
result = itertools.accumulate(GFG, operator.mul)


# printing each item from list
for each in result:
    print(each)

