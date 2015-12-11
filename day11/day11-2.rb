
def valid?(string)

  return false if string.scan(/[iol]/).any?
  return false if string.scan(/(.)\1/).uniq.size < 2


  0.upto(string.length - 3) do |i|

    v = string[i..i+2].bytes
    return true if (v[0] + 1 == v[1]) && (v[1] + 1 == v[2])

  end

  return false

end

input = "cqjxxyzz"

nil while !valid?(input.succ!)

puts input