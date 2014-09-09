#require 'rubygems'
#require 'ruby-debug'

class OrangeTree
  attr_accessor :age, :height, :orangeCount

  def initialize
    @age = 0
    @height = 0
    @orangeCount = 0

  end

  def height
    @height
  end

  def age
    @age
  end

  def one_year_passes
    oranges_fell_of_tree
    if tree_alive?
      if @age <= 25
        @age += 1
        if @age <= 10
          @height = @age * 2
        else
          @height = @height
        end
        if @age > 3
          @orangeCount = 50 + (@age - 4) * 10
        end
      else
        tree_dead
      end
    end
  end

  def tree_dead
    if @age > 25
      @age = 0
      @height = 0
      @orangeCount = 0
    end
  end

  def tree_alive?
    if @age <= 25
      true
    else
      false
    end
  end

  def count_the_oranges
    @orangeCount
  end

  def pickAnOrange
    if @orangeCount == 0
      puts "No more Oranges to pick this year!"
    else
      @orangeCount -= 1
      puts "What a delicious Orange. YUM!"
    end

  end

  def oranges_fell_of_tree
    @orangeCount = 0
  end

end

class OrangeGrove

  def initialize
    @arr_of_trees = []
  end

  def trees_in_grove
    @arr_of_trees.length
  end

  def plant_trees_in_grove(num_trees)
    i = 0
    while i < num_trees
      @arr_of_trees.push(OrangeTree.new)
      i += 1
    end
  end

  def trees
    return @arr_of_trees
  end

  def grove_in_one_year
    @arr_of_trees.each { |tree| tree.one_year_passes}
  end

  def count_all_the_oranges
    total_oranges = 0
    @arr_of_trees.each { |tree| total_oranges += tree.orangeCount}
    total_oranges
  end

end

def start
  # o = OrangeTree.new
  # i = 0
  # while i < 26
  #   puts "Age= #{o.age}"
  #   puts "Height= #{o.height}"
  #   puts "The orange count is #{o.count_the_oranges}"
  #   o.pickAnOrange
  #   puts "The orange count after a pickup #{o.count_the_oranges}"
  #   o.one_year_passes
  #   i += 1
  # end

  # debugger
  g = OrangeGrove.new
  g.plant_trees_in_grove(5)
  puts "array of trees #{g.trees}"

end


start
