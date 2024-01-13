require 'csv'

path = 'inputs/input.csv'
cards = []
counter = 0

CSV.foreach(path) do |row|
  card = row.first.gsub(/.*:/, '').split('|')
  cards << card
end

cards.each do |array|
  winning_num = array.first.scan(/\d+/)
  getted_num = array.last.scan(/\d+/)
  common_values = winning_num & getted_num
  nth = common_values.size

  case nth
  when 0
    points = 0
  when 1
    points = 1
  else
    points = 1
    (nth - 1).times do
      points *= 2
    end
  end

  counter += points
end

p counter
