require 'csv'

path = 'inputs/input.csv'
File.write('clean_input.csv', File.read(path).gsub(/;|:/, ','))
path ='inputs/clean_input.csv'

ROWS = []
ids_sum = 0

CSV.foreach(path) do |row|
  id = nil
  green = []
  blue = []
  red = []
  row.each do |el|
    case el
    when /Game/
      id = el.scan(/\d/).join.to_i
    when /green/
      green << el.scan(/\d/).join.to_i
    when /red/
      red << el.scan(/\d/).join.to_i
    when /blue/
      blue << el.scan(/\d/).join.to_i
    end
  end
  ROWS << {id: id, green: green, red: red, blue: blue}
end

ROWS.each do |row|
  row_powers = row[:red].max * row[:green].max * row[:blue].max
  ids_sum += row_powers
end

p ids_sum
