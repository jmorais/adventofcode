def ribbon_size(dimensions)
  h, w, l = dimensions.split('x').map(&:to_i).sort

  t = 2*h + 2*w
  t += h*w*l
end

total = 0

File.open('day2.in').each do |line|
  total += ribbon_size(line)
end

puts total