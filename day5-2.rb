def nice?(string)

  pair = false

  0.upto(string.length - 2) do |i|

    if string.scan(string[i..i+1]).size > 1
      pair = true
      break
    end

  end

  return false if !pair

  0.upto(string.length - 2) do |i|
    return true if string[i] == string[i+2]
  end

  return false

end

count = 0

File.open('day5.in').each do |line|
  count += 1 if nice?(line)
end

puts count