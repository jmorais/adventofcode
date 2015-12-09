require 'Matrix'

class Matrix
  public :"[]=", :set_element, :set_component
end

$lights = Matrix.build(1000,1000){ 0 }

def turn_on(x1, y1, x2, y2)
  x1.upto(x2).each do |i|
    y1.upto(y2).each do |j|
      $lights[i,j] += 1
    end
  end
end

def turn_off(x1, y1, x2, y2)
  x1.upto(x2).each do |i|
    y1.upto(y2).each do |j|
      $lights[i,j] -= 1 if $lights[i,j] > 0
    end
  end
end

def toggle(x1, y1, x2, y2)
  x1.upto(x2).each do |i|
    y1.upto(y2).each do |j|
      $lights[i,j] += 2
    end
  end

end

def parse(line)
  command = ""
  if line.include?("turn off")
    command = line.slice!("turn off ")
  elsif line.include?("turn on")
    command = line.slice!("turn on ")
  else
    command = line.slice!("toggle ")
  end

  values = line.split(" through ")

  x1, y1 = values[0].split(',').map(&:to_i)
  x2, y2 = values[1].split(',').map(&:to_i)

  case command
  when "turn off "
    turn_off(x1, y1, x2, y2)
  when "turn on "
    turn_on(x1, y1, x2, y2)
  when "toggle "
    toggle(x1, y1, x2, y2)
  end

end

def count
  c = 0
  $lights.each do |e|
    c += e
  end
  c
end

File.open('day6.in').each do |line|
  parse(line)
end

puts count