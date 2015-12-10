
def las(string)

  count = 0
  result = ""
  array = []

  0.upto(string.length - 1) do |i|
    if array[count]
      if array[count].include? string[i]
        array[count] += string[i]
      else
        count += 1
        array[count] = string[i]
      end
    else
      array[count] = string[i]
    end
  end

  array.each do |sub|
    result += sub.length.to_s + sub[0]
  end

  result
end

input = '1321131112'

1.upto(50) do |i|

  input = las(input)

end

puts input.length