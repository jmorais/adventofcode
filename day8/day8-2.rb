
char_total = 0
encoded_total = 0

File.open('day8.in').each do |line|
  char_total += line.strip.size
  encoded_total += line.strip.inspect.size
end

puts encoded_total - char_total