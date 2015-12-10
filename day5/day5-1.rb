def nice?(string)

  ['ab', 'cd', 'pq', 'xy'].each do |p|
    return false if string.index p
  end

  return false if string.count("aeiou") < 3

  string.match(/(.)\1/)

end

count = 0

File.open('day5.in').each do |line|
  count += 1 if nice?(line)
end

puts count