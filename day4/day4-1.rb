require 'digest'

input = "yzbqklnj"

0.upto(Float::INFINITY) do |i|

  if Digest::MD5.hexdigest("#{input}#{i}")[0..4] == "00000"
    puts i
    break
  end

end