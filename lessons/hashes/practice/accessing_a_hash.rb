suitcase = {
  "socks" => 4,
  "pants" => 1,
 
  "swimsuit" => true

}

# How would we get the value of:

# 1. "socks"
p suitcase["socks"]
# 2. "pants"
p suitcase["pants"]
# 3. All of the values in this hash.
p suitcase
# How would we get the keys of the above hash?


p suitcase
suitcase["shirts"] = 3
p suitcase
suitcase["shirts"] += 1
p suitcase
