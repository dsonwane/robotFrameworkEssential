from itertools import zip_longest

countries = ["Ecuador", "Peru", "Colombia"]
capitals = ["Quito", "Lima", "Bogota"]
cities = ["guayaquil", "trujillo", "modellin"]
countries_and_capitals = zip(countries, capitals, cities)
print(list(countries_and_capitals))
# print(countries_and_capitals.__next__())
# print(countries_and_capitals.__next__())
# print(countries_and_capitals.__next__())

products = {"apple" : 0.5, "pineapple": 0.7 }
tech_products ={"mobile" : 100, "windows": 600}
products_and_tech_Products = zip(products, tech_products)
print(products_and_tech_Products.__next__())
print(products_and_tech_Products.__next__())

country = "Indio"
state = "maharashtra"

country_and_state = zip(country, state)
print(list(country_and_state))

countries = ["Ecuador", "Peru", "Colombia"]
capitals = ["Quito", "Lima", "Bogota"]
cities = ["guayaquil", "trujillo"]
countries_and_capitals = zip_longest(countries, capitals, cities, fillvalue="Valparis")
print(list(countries_and_capitals))

