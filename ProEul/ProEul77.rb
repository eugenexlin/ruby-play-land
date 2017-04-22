require 'prime'
require 'io/console' 

COUNT_SUMS = 5000
DEBUG = true

class SumPrimes
  @primes
  @ways
  
  def initialize()
    @primes = Prime.first(100)
    @ways = Array.new
    
    @ways[4] = Array.new
    @ways[4][3] = 0
    @ways[4][2] = 0
  end
    

  # this is how many @ways to make num with n primes
  # first array index is the number
  # second array index is the number of primes


  def get_ways(num, prime_count)
    if num <= 1
      return 0
    end
    if prime_count < 1
      return 0
    end
    if prime_count == 1
      #maybe we can shortcut.
      #when only prime {2}, we can make odd numbers 0 @ways and even numbers 1 way
      return (num%2 == 0 ? 1 : 0)
    end
    
    prime_index = prime_count - 1
    
    if @ways[num] != nil
      if @ways[num][prime_index] != nil
        return @ways[num][prime_index]
      end
    end
    
    #ok didnt find cache, compute it.
    compute = 0
    prime = @primes[prime_index]
    refer_number = num
    ops = ""
    begin
      refer_number -= prime
      break if refer_number < 0
      if refer_number == 0
        ops += "(#{num} div #{prime}) " if DEBUG
        compute += 1
      else
        val = get_ways(refer_number, prime_index)
        ops += "(#{refer_number},#{prime_index})=#{val} " if DEBUG
        compute += val
      end
    end until refer_number <= 0

    val = get_ways(num, prime_count - 1)
    ops += "(#{num},#{prime_count - 1})=#{val} " if DEBUG
    compute += get_ways(num, prime_count - 1)
    
    if @ways[num] == nil
      @ways[num] = Array.new
    end
    @ways[num][prime_index] = compute
    # puts " - (#{num} , #{prime_index}) = #{compute}"
    puts ops if DEBUG
    return compute
  end
  
 
  def run_main
    current_num = 2
    current_count = 0
    while current_count < COUNT_SUMS
      current_count = 0
      current_num += 1
      prime_count = 0
      begin
        prime_count += 1
        current_prime = @primes[prime_count - 1]
        break if current_prime > current_num
        
        

      
      end until prime_count >= 5000
      current_count = get_ways(current_num, prime_count - 1)
      puts "(#{current_num} , #{prime_count - 1}) = #{current_count}"

    end 

    puts "first number with more than #{COUNT_SUMS} sums"
    puts current_num
    

  end

end

SumPrimes.new.run_main