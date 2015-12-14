
$hash = {}
total = -Float::INFINITY

def parse_line(line)
  origin, change, value, target = line.gsub(/( would)|(happiness units by sitting next to )|\./, "").split(" ")

  $hash[origin] ||= {}
  $hash[origin][target] = value.to_i
  $hash[origin][target] *= -1 if change == "lose"
end

File.open('day13.in').each do |line|

  parse_line(line)

end

$hash.keys.permutation do |table|

  current_total = 0

  0.upto(table.length - 1) do |i|
    before = $hash[table[i]][table[i - 1]]
    after = $hash[table[i]][table[(i + 1) % table.length]]

    current_total += (before + after)
  end

  total = current_total if current_total > total

end

puts total