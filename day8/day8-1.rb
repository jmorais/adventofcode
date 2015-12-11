
char_total = 0
mem_total = 0

File.open('day8.in').each do |line|
  char_total += line.strip.size
  mem_total += (eval line).size
end

puts char_total - mem_total