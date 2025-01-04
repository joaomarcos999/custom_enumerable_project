module Enumerable
  # Your code goes here
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  def my_each
    if block_given?
      for item in self
        yield(item)
      end
      return self
    end
  end

  def my_each_with_index
    if block_given?
      index = 0
      for item in self
        yield(item, index)
        index += 1
      end
    end
    self
  end

  def my_select
    result = []
    each { |item| result << item if yield(item)}
    return result
  end

  def my_all?
    each { |item| return false unless yield(item)}
    true
  end

  def my_any?
    each {|item| return true if yield(item)}
    false
  end

  def my_none?
    each {|item| return false if yield(item)}
    true
  end

  def my_count
    return length unless block_given?
    count = 0
    each {|item| count += 1 if yield(item)}
    count    
  end

  def my_map  
    result = []
    each do |item|
      result << yield(item)
    end
    result
  end

  def my_inject(initial_value)
    result = initial_value
    each do |item|
      result = yield(result, item)
    end
    result
  end
  

end
