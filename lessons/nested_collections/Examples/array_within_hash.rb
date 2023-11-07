pizza_toppings = {
  veggies: ["green peppers", "jalapeño", "mushrooms"],
  protein: ["pepperoni", "sausage", "sardines"],
  fruit: ["pineapple"]
}

# 1. what is pizza_toppings.count
p pizza_toppings.count
3
# 2. what is pizza_toppings.values
p pizza_toppings.values
all arrays within arrays
# 3. how can I access the element “pineapple”
p pizza_toppings[:fruit]
# 4. how can I add the element “olives” to the key “veggies”?
pizza_toppings[:veggies] << "olives"
pizza_toppings[:veggies].push('olives')

p pizza_toppings