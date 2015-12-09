require 'digest'

input = "yzbqklnj"

0.upto(Float::INFINITY) do |i|

  if Digest::MD5.hexdigest("#{input}#{i}")[0..5] == "000000"
    puts i
    break
  end

end