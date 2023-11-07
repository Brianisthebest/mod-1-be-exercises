# Given the following array:
nested_animals = [[:dog, :cat, :zebra], [:quokka, :unicorn, :bear]]

# Use an enumerable to:
# 1. Return an unnested (single layer) array of animals as strings

# look at every element (animals) of the nested animals array
  #look at every element of (animals)
    #change values of each (animal) into a string
      #return a single array of manipulated 'animal' objects
string_animals = []
nested_animals.each do |nested_animal|
  nested_animal.each do |animal|
    string_animals << animal.to_s
  end
end

p string_animals

# 2. Return an unnested array of animals with length >= 4

long_animals = []
nested_animals.each do |nested_animal|
  nested_animal.each do |animal|
    long_animals << animal if animal.length >= 4
  end
end

# 3. Return a hash where the keys are the animal, and the values are the length. ex: {dog: 3, cat: 3, zebra: 5 ... }

# iterating over each array
  #we need to make a hash
    #assign the key to be the name of the animal
      #the value to be the animal.length
length_hash = {}
nested_animals.each do |nested_animal|
  nested_animal.each do |animal|
    length_hash[animal] = animal.length
  end
end
p length_hash