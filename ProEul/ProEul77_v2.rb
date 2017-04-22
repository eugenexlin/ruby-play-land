require 'prime'

@primes = Prime.first(100)
@ways = { }
    
COUNT_SUMS = 5000
DEBUG = true

def get_ways(num, prime_limit)
  ways = 0
  @primes.each do |prime|
    break if prime > prime_limit or prime > num
    refer = num - prime
    if refer == 0
      ways += 1
      break
    end
    refer_limit = [prime,refer].min
    if (@ways[[refer,refer_limit]] != nil)
      refer_ways = @ways[[refer,refer_limit]]
    else
      refer_ways = get_ways(refer, refer_limit)
      @ways[[refer,refer_limit]] = refer_ways
    end
    ways += refer_ways
  end
  return ways
end

target = 1

begin
  target += 1
  result = get_ways(target,target)
  puts "ways(#{target}) = #{result}"
  if result > 5000
    break
  end
end until target > 1000