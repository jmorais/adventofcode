def wrapper_size(dimensions)
  h, w, l = dimensions.split('x').map(&:to_i).sort

  t = 2*l*w + 2*w*h + 2*h*l
  t += h*w
end

total = 0

File.open('day2.in').each do |line|
  total += wrapper_size(line)
end

puts total