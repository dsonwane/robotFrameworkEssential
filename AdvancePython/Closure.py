def outerFunction(text):
    def innerFunction():
        print(text)

    innerFunction()


outerFunction('Hey!')

# Any all functions
print(any([False, False, False, False]))

# Here the method will short-circuit at the
# second item (True) and will return True.
print(any([False, True, False, False]))

# Here the method will short-circuit at the
# first (True) and will return True.
print(any([True, False, False, False]))


# map
def addition(n):
    return n + n


numbers = (1, 2, 3, 4)
result = map(addition, numbers)
print(list(result))

# Filters

# function that filters vowels
def fun(variable):
    letters = ['a', 'e', 'i', 'o', 'u']
    if (variable in letters):
        return True
    else:
        return False


# sequence
sequence = ['g', 'e', 'e', 'j', 'k', 's', 'p', 'r']

# using filter function
filtered = filter(fun, sequence)

print('The filtered letters are:')
for s in filtered:
    print(s)

# Sorting
def myFunc(e):
  return len(e)

cars = ['Ford', 'Mitsubishi', 'BMW', 'VW']

cars.sort(key=myFunc)

print(cars)

# Enumerate function
l1 = ["eat", "sleep", "repeat"]

# printing the tuples in object directly
for ele in enumerate(l1):
    print(ele)

# changing index and printing separately
for count, ele in enumerate(l1, 100):
    print(count, ele)

# getting desired output from tuple
for count, ele in enumerate(l1):
    print(count)
    print(ele)

# Lambda function
x = lambda a : a + 10
print(x(5))

x = lambda a, b : a * b
print(x(5, 6))

def myfunc(n):
  return lambda a : a * n

mydoubler = myfunc(2)

print(mydoubler(11))

# Args and kwargs
def myFun1(*argv):
    for arg in argv:
        print(arg)


myFun1('Hello', 'Welcome', 'to', 'GeeksforGeeks')


def myFun2(arg1, *argv):
    print("First argument :", arg1)
    for arg in argv:
        print("Next argument through *argv :", arg)


myFun2('Hello', 'Welcome', 'to', 'GeeksforGeeks')


def myFun3(**kwargs):
    for key, value in kwargs.items():
        print("%s == %s" % (key, value))


# Driver code
myFun3(first='Geeks', mid='for', last='Geeks')


def myFun4(arg1, **kwargs):
    for key, value in kwargs.items():
        print("%s == %s" % (key, value))


# Driver code
myFun4("Hi", first='Geeks', mid='for', last='Geeks')