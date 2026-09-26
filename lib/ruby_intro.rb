# When done, submit this entire file to the autograder.

# Part 1

def sum(arr)
  # YOUR CODE HERE
  unless arr.empty?
    i = 0
    sum = 0
    while i < arr.length
      sum += arr[i]
      i += 1
    end
    return sum
  end
  return 0
end

def max_2_sum(arr)
  # Return the sum of the greatest 2 numbers in the array
  if arr.empty?
    return 0
  elsif arr.length == 1
    return arr[0]
  else
    # calculate the greatest sum w/ two numbers from the array
    first_num = -Float::INFINITY
    second_num = -Float::INFINITY
    i = 0
    while i < arr.length
      if arr[i] >= first_num
        second_num = first_num
        first_num = arr[i]
      elsif arr[i] > second_num
        second_num = arr[i]
      end
      i += 1
    end
    return first_num + second_num
  end
end

def sum_to_n?(arr, n)
  # YOUR CODE HERE
  if arr.empty? || arr.length == 1
    return false
  elsif arr.length == 1 && arr[0] == n
    return true
  else
    i = 0
    while i < arr.length-1
      j = i+1
      while j < arr.length
        if arr[i] + arr[j] == n
          return true
        end
        j += 1
      end
      i += 1
    end
    return false
  end

end

# Part 2

def hello(name)
  # YOUR CODE HERE
  return "Hello, #{name}"
end

def starts_with_consonant?(s)
  # YOUR CODE HERE
  # any letter besides the vowels. must expect upper, lower, and #s
  # need method to check if number
  # need method to check if not vowel
  if s.length == 0
    return false
  end
  # UNICODE, ruby's standard for chars, follows regular ASCII for first 127.
  # therefore, 0-9 are values 48-57.
  if s[0].ord.between?(48,57) # this is inclusive of the ends btw
    return false
  # a-z are values b/w 97-122
  elsif s[0].downcase.ord.between?(97,122) # again, inclusive here too
    if ['a', 'e', 'i', 'o', 'u'].include?(s[0].downcase) # a, e, i, o, u
      return false
    end
    return true
  else
    return false # if all else fails, simply return false
  end
end

def binary_multiple_of_4?(s)
  # YOUR CODE HERE
  if s.length == 0
    return false
  end
  # check if valid binary number
  # check string through a loop
  # return false at any point if char not 0 or 1
  i = 0
  while i < s.length
    if s[i] != "0" && s[i] != "1"
      return false
    end
    i += 1
  end
  # output true if binary multiple of 4, false otherwise
  return (s.to_i % 4) == 0
end

# Part 3

class BookInStock
  # YOUR CODE HERE
  attr_accessor :isbn, :price
  # constructor
    # accept str as arg1, and price as arg2 (didn't say int or float?)
      # raise ArgumentError if empty str or price <= 0
  def initialize(isbn, price)
    if isbn.length == 0 || price <= 0
      raise ArgumentError
    end
    @isbn = isbn
    @price = price
  end

  '''
    Include a method `price_as_string` that returns the price 
    of the book formatted with a leading dollar sign and two
    decimal places, that is, a price of 20 should format 
    as `$20.00` and a price of 33.8 should format as `$33.80`. 
    Check out formatted string methods in Ruby.
  '''
  def price_as_string
    return format("$%.2f", @price)
  end
end
