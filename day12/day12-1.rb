
total = 0

File.open('day12.in').each do |line|
  total += line.scan(/-?[0-9]+/).map(&:to_i).inject(:+)
end

puts total