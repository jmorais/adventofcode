$calc = {}
$hash = {}

File.open('day7.in').each do |line|
  $calc[line.split(' -> ')[1].strip] = line.split(' -> ')[0].split(' ')
end

def calculate(value)

  begin
    return Integer(value)
  rescue

  end

  if !($hash.include?(value))
    ops = $calc[value]

    if ops.size == 1 # single
      res = calculate(ops[0])
    elsif ops.size == 2 # NOT
      res = ~calculate(ops[1]) & 0xFFFF
    else
      case ops[1]
      when "AND"
        res = calculate(ops[0]) & calculate(ops[2])
      when "OR"
        res = calculate(ops[0]) | calculate(ops[2])
      when "LSHIFT"
        res = calculate(ops[0]) << calculate(ops[2])
      when "RSHIFT"
        res = calculate(ops[0]) >> calculate(ops[2])
      end
    end

    $hash[value] = res

  end

  $hash[value]

end

puts calculate('a')