#big integer class that index 0 = right most digit.
class BigNum

  attr_accessor :digits
  @digits
  
  def initialize(num)
    @digits = Array.new
    setNum(num)
  end
  
  
  def setNum(num)
    loop do
      digit = num % 10
      @digits.push(digit)
      break if num < 10
      num = num / 10
    end
  end
  
  def print
    puts @digits.reverse.join('')
  end
  
  def add(other_num)
    for index in 0..(@digits.length-1)
      if index >= other_num.digits.length
        return
      end
      @digits[index] = @digits[index] + other_num.digits[index]
    end
    for remain in (index+1)..(other_num.digits.length-1)
      @digits.push(other_num.digits[remain])
    end
  end
  
  def sumOfDigits
    sum = 0
    @digits.each do |digit|
      sum += digit
    end
    return sum
  end
  
  def clone
    result = BigNum.new(0)
    result.digits = @digits.dup
    return result
  end
  
  def multiply_small(num)
    offset = 0
    carry = 0
    @digits.each do |digit|
      product = digit * num + carry
      next_digit = product % 10
      carry = product / 10
      @digits[offset] = next_digit
      offset += 1
    end
    while carry > 0
      @digits[offset] = carry % 10
      carry /= 10
      offset += 1
    end
  end
  
  def multiply_big(other_big_num)
    #TODO
  end
  
end


num1 = BigNum.new(1234000)
num2 = BigNum.new(2345)
num1.add(num2)
num1.print

num1 = BigNum.new(1234)
num2 = BigNum.new(2345000)
num1.add(num2)
num1.print

num1.multiply_small(22)
num1.print
num_clone = num1.clone
num_clone.multiply_small(22)
num_clone.print
num1.print


max = 0
max_a = 0
max_b = 0

for a in 81..99
  for b in 80..99
  
    current = BigNum.new(a)
    for i in 2..b
      current.multiply_small(a)
    end
    result = current.sumOfDigits
    
    if result > max
      max = result
      max_a = a
      max_b = b
    end
    
  end
end

puts "max = #{max}"
puts "a = #{max_a}"
puts "b = #{max_b}"

