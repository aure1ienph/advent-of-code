require 'csv'

path = 'input.csv'

File.write('clean_input.csv', File.read(path).gsub(/;|:/, ','))

path ='clean_input.csv'

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
  if row[:red].max <= 12 && row[:green].max <= 13 && row[:blue].max <= 14
    ids_sum += row[:id]
  end
end

p ids_sum
