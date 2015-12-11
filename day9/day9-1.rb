
hash = {}
total = []

File.open('day9.in').each do |line|

  path, distance = line.split(' = ')

  city_a, city_b = path.split(' to ')

  hash[city_a] ||= {}
  hash[city_b] ||= {}
  hash[city_a][city_b] = distance.to_i
  hash[city_b][city_a] = distance.to_i

end

count = 0

hash.keys.permutation do |path|
  total[count] = 0

  0.upto(path.size - 2) do |i|
    total[count] += (hash[path[i]][path[i+1]] || hash[path[i+1]][path[i]])
  end

  count += 1
end

puts total.min