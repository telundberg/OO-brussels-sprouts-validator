#YOUR CODE GOES HERE
require 'pry'

class Ingredient

  def initialize(quantity, unit, name)
    @quantity = quantity
    @unit = unit
    @name = name
  end

  def safety_check#safe or not safe ingredient?
    safe_ingredients = ["brussels sprouts", "spinach",
    "eggs", "milk", "tofu", "seitan", "bell peppers",
    "quinoa", "kale", "chocolate", "beer", "wine",
    "whiskey"]

    safe_ingredients.include?(@name.downcase)

  end

  def parse(string)
    #split_string = string.split('',3)
    #Ingredient.new(split_string[0],split_string[1],split_string[2])
    # def self.parse(iso8601_string)
    # tokens = iso8601_string.split("-")
    # year = tokens[0].to_i
    # month = tokens[1].to_i
    # day = tokens[2].to_i

  end

  def summary
    "#{@quantity} #{@unit} #{@name}"
  end

end

# ingredient = Ingredient.new(47.0, "lb(s)", "Brussels Sprouts")

# puts ingredient.summary


class Recipe

  def initialize(name, ingredients, instructions)
    @name = name
    @instructions = instructions
    @ingredients = ingredients
  end

  def safe_recipe?#safe or not safe recipe?
     @ingredients.each do |item|
      if item.safety_check == false
        return false#return false if item.safety_check
      else
        return true
      end
    end
  end

#

  def summary
    puts "Name: #{@name}"
    puts " "
    puts "***is this a safe recipe? #{safe_recipe?}***"
    puts " "
    puts "Ingredients"
    @ingredients.each do |item|
      puts "-" " ""#{item.summary}"
    end
    puts " "
    puts "Instructions"
    count = 0
    @instructions.each do |num|
    puts (count +1).to_s + ". "+"#{num}"
    count += 1
    end
  end
end


# puts safe_ingredients.include?("brussels sprouts")

name = "Roasted Brussels Sprouts"

ingredients = [
    Ingredient.new(1.5, "lb(s)", "Brussels sprouts"),
    Ingredient.new(3.0, "tbspn(s)", "Good olive oil"),
    Ingredient.new(0.75, "tspn(s)", "Kosher salt"),
    Ingredient.new(0.5, "tspn(s)", "Freshly ground black pepper")
]

instructions = [
    "Preheat oven to 400 degrees F.",
    "Cut off the brown ends of the Brussels sprouts.",
    "Pull off any yellow outer leaves.",
    "Mix them in a bowl with the olive oil, salt and pepper.",
    "Pour them on a sheet pan and roast for 35 to 40 minutes.",
    "They should be until crisp on the outside and tender on the inside.",
    "Shake the pan from time to time to brown the sprouts evenly.",
    "Sprinkle with more kosher salt ( I like these salty like French fries).",
    "Serve and enjoy!"]

recipe = Recipe.new(name, ingredients, instructions)
recipe.summary
