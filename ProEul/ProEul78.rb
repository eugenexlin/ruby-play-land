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

for n in 1..10000
  current = get_ways(n,n)
  #puts "#{n} - #{current}"
  if current % 10000 == 0
    puts n
    break
  end
end

#omg not working