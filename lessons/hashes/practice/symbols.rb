new_tv = {
  "screen size" => 50,
  "price" => 300,
  "brand" => "Samsung"
}
p new_tv

# Remember in Ruby, symbols are basically Strings that can’t change.
# You can recognize a symbol because it starts with a colon :.
# All of the following are symbols:
# :name
# :symbols_can_have_underscores
# :"symbols can be in quotes"

# Lets change the hash above to use symbols instead of strings.
# Syntax symbol with hash rocket:
# create hash here
new_tv = {
  :screen_size => 50,
  :price => 300,
  :brand => "Samsung"
}
p new_tv

# Syntax symbol without hash rocket:
# create hash here
new_tv = {
  screen_size: 59,
  price: 300,
  brand: "Samsung"
}
p new_tv

p new_tv.keys
p new_tv.values

suitcase = {
  socks: 4,
  jeans: 1,
}

suitcase[:socks] += 3
suitcase[:shirts] = 4
suitcase.delete(:jeans)


p suitcase
p suitcase[:jackets]
p suitcase[:socks]

