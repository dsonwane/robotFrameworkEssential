thisset = {"apple", "banana", "cherry", "apple"}
print(thisset)
print(len(thisset))

set1 = {"apple", "banana", "cherry"}
set2 = {1, 5, 7, 9, 3}
set3 = {True, False, False}

print(type(set1))

for x in thisset:
  print(x)

thisset.add("orange")

print(thisset)

tropical = {"pineapple", "mango", "papaya"}

thisset.update(tropical)

print(thisset)

thisset.remove("banana")

print(thisset)


