
require 'json'

$total = 0

def traverse(element)
  return if element.is_a?(Hash) && element.has_value?("red")

  if element.is_a?(Hash) || element.is_a?(Array)
    element.each do |e|
      traverse(e)
    end
  else
    $total += element.to_i
  end
end

file = File.read('day12.in')
data = JSON.parse(file)

traverse(data)

puts $total