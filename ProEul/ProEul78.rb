@ways = {}

def get_ways(coins, max)
  total = 0
  for i in 1..max
    n_coins = coins - i
    if n_coins <= 0
      total += 1
    end
    n_max = [n_coins,i].min
    total += @ways[[n_coins,n_max]] ||= get_ways(n_coins, n_max)
  end
  
 return total
end

def count_fives(number)
  temp = number
  count = 0
  while temp % 5 == 0
    count += 1
    temp /= 5
  end
  return count
end

prev = 0
for n in 1..20
  current = get_ways(n,n)
  puts "#{n} - #{current}"
  prev = current
  if current % 10000 == 0
    puts n
    break
  end
end

#omg not working


#Using another formula for this, except it is computationally in 1d space, not 2d
#so it should be way faster

def penta(n)
  return n* (3*n - 1) / 2
end
def general_penta(n)
  k = n 
  k = (k % 2 == 1) ? -(k-1)/2 : k/2
  return penta(k)
end

puts "general penta:"
for n in 1..10
  puts general_penta(n)
end

part = [1]


DIVISOR = 1000000
puts "calculating first divisible by #{DIVISOR}";


for n in 1..100000
  i = 1
  #my general_penta function is a weirdo,
  # p(2) = 1
  # p(3) = 2
  # p(5) = 5
  # p(7) = 7
  #so start i=1, so it counts 2,3,4,5...
  
  part[n] = 0
  loop do
    i+= 1
    sign = (i%4 >= 2) ? 1 : -1
    
    off = general_penta(i)
    if (off > n)
      break
    else
      k = n - off
      part[n] =  (part[n] + (sign * part[k])) % DIVISOR
    end
  
  end
  #puts part[n];
  if part[n] == 0
    puts "n = #{n}";
    break
  end
  
end
